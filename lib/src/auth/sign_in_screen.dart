import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/src/auth/components/custom_text_field.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Column(
        children: [
          Expanded(
            child: Container(
                // color: Colors.green,
                ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 32,
                vertical: 40,
              ),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(
                    45.0,
                  ),
                ),
              ),
              child: Column(
                children: const [
                  //email
                  CustomTextField(
                    inputIcon: Icons.email,
                    inputLabel: 'Email',
                  ), //senha
                  CustomTextField(
                    inputIcon: Icons.lock,
                    inputLabel: 'Password',
                    isTextHidden: true,
                  ), //senha
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
