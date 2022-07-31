import 'package:flutter/material.dart';

import 'package:flutter_ecommerce/src/config/custom_colors.dart';
import 'package:flutter_ecommerce/src/screens/auth/components/custom_text_field.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);
  final cpfFormatter = MaskTextInputFormatter(
    mask: '###.###.###-##',
    filter: {
      '#': RegExp(r'[0-9]'),
    },
  );
  final phoneFormatter = MaskTextInputFormatter(
    mask: '(##) # ####-####',
    filter: {
      '#': RegExp(r'[0-9]'),
    },
  );
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: CustomColors.customSwatchColor,
      body: SingleChildScrollView(
        child: SizedBox(
          height: screenHeight,
          child: Stack(
            children: [
              Column(
                children: [
                  const Expanded(
                    child: Center(
                      child: Text(
                        'Cadastro',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 35,
                        ),
                      ),
                    ),
                  ),
                  Container(
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
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        //email
                        const CustomTextField(
                          inputIcon: Icons.email,
                          inputLabel: 'Email',
                        ), //senha
                        const CustomTextField(
                          inputIcon: Icons.lock,
                          inputLabel: 'Password',
                          isPasswordInput: true,
                        ),
                        const CustomTextField(
                          inputIcon: Icons.person,
                          inputLabel: 'Name',
                        ),
                        CustomTextField(
                          inputIcon: Icons.phone,
                          inputFormatter: [phoneFormatter],
                          inputLabel: 'Celular',
                        ),
                        CustomTextField(
                          inputIcon: Icons.file_copy,
                          inputLabel: 'CPF',
                          inputFormatter: [cpfFormatter],
                        ),
                        SizedBox(
                          height: 50,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                  20.0,
                                ),
                              ),
                            ),
                            onPressed: () {},
                            child: const Text(
                              'Cadastrar usuário',
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                        //esqueceu a senha
                      ],
                    ),
                  ),
                ],
              ),
              Positioned(
                left: 10,
                top: 10,
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
