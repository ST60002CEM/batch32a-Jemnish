// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kheti_pati/features/auth/presentation/viewmodel/auth_view_model.dart';
import 'package:kheti_pati/features/product/presentation/viewmodel/product_view_model.dart';

class ProductView extends ConsumerStatefulWidget {
  const ProductView({super.key});

  @override
  ConsumerState<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends ConsumerState<ProductView> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController(text: '');
  final _passwordController = TextEditingController(text: '');

  final _gap = const SizedBox(height: 10);
  bool isObscure = true;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final authState = ref.watch(authViewModelProvider);
    return Scaffold(
        backgroundColor: const Color(0xffE1FCF9),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Form(
              key: _formKey,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.1,
                  vertical: size.height * 0.035,
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
                      "Sign in to continue",
                      style: TextStyle(
                        fontSize: 16,
                        color: Color.fromARGB(255, 95, 94, 94),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    _gap,
                    TextFormField(
                      key: const ValueKey('username'),
                      controller: _usernameController,
                      style: const TextStyle(
                          color: Color.fromARGB(255, 95, 94, 94)),
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        hintText: "Username",
                        prefixIcon: IconButton(
                          onPressed: null,
                          icon: SvgPicture.asset('assets/icons/user.svg'),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter username';
                        }
                        return null;
                      },
                    ),
                    _gap,
                    TextFormField(
                      key: const ValueKey('password'),
                      controller: _passwordController,
                      obscureText: true,
                      style: const TextStyle(
                          color: Color.fromARGB(255, 95, 94, 94)),
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        hintText: "Password",
                        prefixIcon: IconButton(
                          onPressed: null,
                          icon: SvgPicture.asset('assets/icons/password.svg'),
                        ),
                      ),
                      validator: ((value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter password';
                        }
                        return null;
                      }),
                    ),
                    _gap,
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Forgot Password?',
                          style: TextStyle(
                              color: Color.fromARGB(255, 18, 181, 163),
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          ref.read(productViewModelProvider.notifier).product(
                                username: _usernameController.text,
                                password: _passwordController.text,
                              );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff18B5A3),
                        minimumSize: Size(size.width, 60),
                      ),
                      child: const Text(
                        'Sign In',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.04,
                    ),
                    const Row(
                      children: [
                        Expanded(
                            child: Divider(
                          color: Color.fromARGB(255, 95, 94, 94),
                        )),
                        Text(
                          "or Sign in with Google",
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
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Don't have an account?",
                          style: TextStyle(
                            color: Color.fromARGB(255, 95, 94, 94),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            ref
                                .read(authViewModelProvider.notifier)
                                .openRegisterView();
                          },
                          child: const Text(
                            'Sign Up',
                            style: TextStyle(
                              color: Color.fromARGB(255, 18, 181, 163),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        _gap,
                        if (authState.isLoading)
                          const CircularProgressIndicator(),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        )

        );
  }
}
