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
        
        );
  }
}
