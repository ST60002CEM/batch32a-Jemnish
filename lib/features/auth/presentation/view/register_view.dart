import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kheti_pati/features/auth/domain/entity/auth_entity.dart';
import 'package:kheti_pati/features/auth/presentation/viewmodel/auth_view_model.dart';

class RegisterView extends ConsumerStatefulWidget {
  const RegisterView({super.key});

  @override
  ConsumerState<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends ConsumerState<RegisterView> {
  final _gap = const SizedBox(height: 8);

  final _formkey = GlobalKey<FormState>();

  final _fullNameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _secutiryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final authState = ref.watch(authViewModelProvider);
    return Scaffold(
        backgroundColor: const Color(0xffE1FCF9),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Form(
              key: _formkey,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.1,
                ),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Image.asset(
                        "assets/images/logo.png",
                        height: size.height * 0.25,
                      ),
                    ),
                    const Text(
                      "Sign up",
                      style: TextStyle(
                        fontSize: 16,
                        color: Color.fromARGB(255, 95, 94, 94),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    _gap,
                    TextFormField(
                      controller: _fullNameController,
                      style: const TextStyle(
                          color: Color.fromARGB(255, 95, 94, 94)),
                      decoration: InputDecoration(
                        hintText: "full name",
                        prefixIcon: IconButton(
                          onPressed: null,
                          icon: SvgPicture.asset('assets/icons/smile.svg'),
                        ),
                      ),
                      validator: ((value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter full name';
                        }
                        return null;
                      }),
                    ),
                    _gap,
                    TextFormField(
                      controller: _phoneController,
                      style: const TextStyle(
                          color: Color.fromARGB(255, 95, 94, 94)),
                      decoration: InputDecoration(
                        hintText: "phone",
                        prefixIcon: IconButton(
                          onPressed: null,
                          icon: SvgPicture.asset('assets/icons/phone.svg'),
                        ),
                      ),
                      validator: ((value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter phone number';
                        }
                        return null;
                      }),
                    ),
                    _gap,
                    TextFormField(
                      controller: _usernameController,
                      style: const TextStyle(
                          color: Color.fromARGB(255, 95, 94, 94)),
                      decoration: InputDecoration(
                        hintText: "username",
                        prefixIcon: IconButton(
                          onPressed: null,
                          icon: SvgPicture.asset('assets/icons/user.svg'),
                        ),
                      ),
                      validator: ((value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a username';
                        }
                        return null;
                      }),
                    ),
                    _gap,
                    TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      style: const TextStyle(
                          color: Color.fromARGB(255, 95, 94, 94)),
                      decoration: InputDecoration(
                        hintText: "password",
                        prefixIcon: IconButton(
                          onPressed: null,
                          icon: SvgPicture.asset('assets/icons/password.svg'),
                        ),
                      ),
                      validator: ((value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a password';
                        }
                        return null;
                      }),
                    ),
                    const Text('Your first teacher name?',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 67, 66, 66),
                        )),
                    TextFormField(
                      controller: _secutiryController,
                      style: const TextStyle(
                        color: Color.fromARGB(255, 95, 94, 94),
                      ),
                      decoration: InputDecoration(
                        hintText: "Security Question",
                        prefixIcon: IconButton(
                          onPressed: null,
                          icon: SvgPicture.asset('assets/icons/security.svg'),
                        ),
                      ),
                      validator: ((value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your first teacher name';
                        }
                        return null;
                      }),
                    ),
                    SizedBox(
                      height: size.height * 0.04,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (_formkey.currentState!.validate()) {
                          // Register
                          AuthEntity auth = AuthEntity(
                            fullname: _fullNameController.text,
                            phone: _phoneController.text,
                            username: _usernameController.text,
                            password: _passwordController.text,
                          );
                          ref
                              .read(authViewModelProvider.notifier)
                              .addUser(auth: auth);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff18B5A3),
                        minimumSize: Size(size.width, 60),
                      ),
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    const Row(
                      children: [
                        Expanded(
                            child: Divider(
                          color: Color.fromARGB(255, 95, 94, 94),
                        )),
                        Text(
                          "or Sign up with Google",
                          style: TextStyle(
                            color: Color.fromARGB(255, 95, 94, 94),
                          ),
                        ),
                        Expanded(
                            child: Divider(
                          color: Color.fromARGB(255, 95, 94, 94),
                        ))
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        shadowColor: Colors.black.withOpacity(0.2),
                        elevation: 10,
                        backgroundColor:
                            const Color.fromARGB(255, 247, 247, 247),
                        minimumSize: Size(size.width, 60),
                      ),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            'assets/icons/google.svg',
                            height: size.height * 0.04,
                            width: size.width * 0.06,
                          ),
                          SizedBox(
                            width: size.width * 0.08,
                          ),
                          const Text(
                            'Continue with Google',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 104, 102, 102)),
                          ),
                        ],
                      ),
                    ),
                    _gap,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Already have an account?",
                          style: TextStyle(
                            color: Color.fromARGB(255, 95, 94, 94),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text(
                            'Sign In',
                            style: TextStyle(
                              color: Color.fromARGB(255, 18, 181, 163),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
    // var authState = ref.watch(authViewModelProvider);

    // return Scaffold(
    //   appBar: AppBar(
    //     title: const Text('Register'),
    //     centerTitle: true,
    //   ),
    //   body: SafeArea(
    //     child: SingleChildScrollView(
    //       child: Padding(
    //         padding: const EdgeInsets.all(8),
    //         child: Form(
    //           key: _key,
    //           child: Column(
    //             children: [
    //               InkWell(
    //                 onTap: () {
    //                   showModalBottomSheet(
    //                     backgroundColor: Colors.grey[300],
    //                     context: context,
    //                     isScrollControlled: true,
    //                     shape: const RoundedRectangleBorder(
    //                       borderRadius: BorderRadius.vertical(
    //                         top: Radius.circular(20),
    //                       ),
    //                     ),
    //                     builder: (context) => Padding(
    //                       padding: const EdgeInsets.all(20),
    //                       child: Row(
    //                         mainAxisAlignment: MainAxisAlignment.spaceAround,
    //                         children: [
    //                           ElevatedButton.icon(
    //                             onPressed: () {
    //                               checkCameraPermission();
    //                               _browseImage(ref, ImageSource.camera);
    //                               Navigator.pop(context);
    //                               // Upload image it is not null
    //                             },
    //                             icon: const Icon(Icons.camera),
    //                             label: const Text('Camera'),
    //                           ),
    //                           ElevatedButton.icon(
    //                             onPressed: () {
    //                               _browseImage(ref, ImageSource.gallery);
    //                               Navigator.pop(context);
    //                             },
    //                             icon: const Icon(Icons.image),
    //                             label: const Text('Gallery'),
    //                           ),
    //                         ],
    //                       ),
    //                     ),
    //                   );
    //                 },
    //                 child: SizedBox(
    //                   height: 200,
    //                   width: 200,
    //                   child: CircleAvatar(
    //                     radius: 50,
    //                     backgroundImage: _img != null
    //                         ? FileImage(_img!)
    //                         : const AssetImage('assets/images/profile.png')
    //                             as ImageProvider,
    //                   ),
    //                 ),
    //               ),
    //               const SizedBox(height: 25),
    //               TextFormField(
    //                 controller: _fnameController,
    //                 decoration: const InputDecoration(
    //                   labelText: 'First Name',
    //                 ),
    //                 validator: ((value) {
    //                   if (value == null || value.isEmpty) {
    //                     return 'Please enter first name';
    //                   }
    //                   return null;
    //                 }),
    //               ),
    //               _gap,
    //               TextFormField(
    //                 controller: _lnameController,
    //                 decoration: const InputDecoration(
    //                   labelText: 'Last Name',
    //                 ),
    //                 validator: ((value) {
    //                   if (value == null || value.isEmpty) {
    //                     return 'Please enter last name';
    //                   }
    //                   return null;
    //                 }),
    //               ),
    //               _gap,
    //               TextFormField(
    //                 controller: _phoneController,
    //                 decoration: const InputDecoration(
    //                   labelText: 'Phone No',
    //                 ),
    //                 validator: ((value) {
    //                   if (value == null || value.isEmpty) {
    //                     return 'Please enter phoneNo';
    //                   }
    //                   return null;
    //                 }),
    //               ),
    //               _gap,
    //               TextFormField(
    //                 controller: _usernameController,
    //                 decoration: const InputDecoration(
    //                   labelText: 'Username',
    //                 ),
    //                 validator: ((value) {
    //                   if (value == null || value.isEmpty) {
    //                     return 'Please enter username';
    //                   }
    //                   return null;
    //                 }),
    //               ),
    //               _gap,
    //               TextFormField(
    //                 controller: _passwordController,
    //                 decoration: InputDecoration(
    //                   labelText: 'Password',
    //                   suffixIcon: IconButton(
    //                     icon: const Icon(Icons.visibility),
    //                     onPressed: () {},
    //                   ),
    //                 ),
    //                 validator: ((value) {
    //                   if (value == null || value.isEmpty) {
    //                     return 'Please enter password';
    //                   }
    //                   return null;
    //                 }),
    //               ),
    //               _gap,
    //               SizedBox(
    //                 width: double.infinity,
    //                 child: ElevatedButton(
    //                   onPressed: () {
    //                     if (_key.currentState!.validate()) {
    //                       // Register
    //                       AuthEntity auth = AuthEntity(
    //                         fname: _fnameController.text,
    //                         lname: _lnameController.text,
    //                         phone: _phoneController.text,
    //                         username: _usernameController.text,
    //                         password: _passwordController.text,
    //                       );
    //                       ref
    //                           .read(authViewModelProvider.notifier)
    //                           .addUser(auth: auth);
    //                     }
    //                   },
    //                   child: const Text('Register'),
    //                 ),
    //               ),
    //             ],
    //           ),
    //         ),
    //       ),
    //     ),
    //   ),
    // );
  }
}
