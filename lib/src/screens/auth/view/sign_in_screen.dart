import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter_ecommerce/src/app/routes.dart';
import 'package:flutter_ecommerce/src/config/custom_colors.dart';

import 'package:flutter_ecommerce/src/screens/auth/controller/auth_controller.dart';
import 'package:flutter_ecommerce/src/screens/auth/view/components/custom_text_field.dart';
import 'package:flutter_ecommerce/src/widgets/app_title.dart';
import 'package:get/get.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: CustomColors.customSwatchColor,
      body: SingleChildScrollView(
        child: SizedBox(
          height: screenHeight,
          child: Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //app name
                    const AppTitle(
                      greenTitleColor: Colors.white,
                      titleSize: 40,
                    ), //categorias
                    SizedBox(
                      height: 30.0,
                      child: DefaultTextStyle(
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                        ),
                        child: AnimatedTextKit(
                          pause: Duration.zero,
                          repeatForever: true,
                          animatedTexts: [
                            FadeAnimatedText('Frutas'),
                            FadeAnimatedText('Verduras'),
                            FadeAnimatedText('Legumes'),
                            FadeAnimatedText('Carnes'),
                            FadeAnimatedText('Cereais'),
                          ],
                        ),
                      ),
                    ),
                  ],
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
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      //email
                      CustomTextField(
                        controller: emailController,
                        inputIcon: Icons.email,
                        inputLabel: 'Email',
                        validator: (email) {
                          if (email == null || email.isEmpty) {
                            return 'Digite seu email';
                          }
                          if (!email.isEmail) {
                            return 'Digite um e-mail valido';
                          }
                          return null;
                        },
                      ), //senha
                      CustomTextField(
                        controller: passwordController,
                        inputIcon: Icons.lock,
                        inputLabel: 'Password',
                        isPasswordInput: true,
                        validator: (password) {
                          if (password == null || password.isEmpty) {
                            return 'Digite a senha';
                          }
                          if (password.length < 7) {
                            return 'Digite uma senha com pelo menos 7';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                          height: 50,
                          child: GetX<AuthController>(
                            builder: (authController) {
                              return ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                      20.0,
                                    ),
                                  ),
                                ),
                                onPressed: authController.isLoading.value
                                    ? null
                                    : () {
                                        FocusScope.of(context).unfocus();
                                        if (_formKey.currentState!.validate()) {
                                          String email = emailController.text;
                                          String password =
                                              passwordController.text;
                                          authController.signIn(
                                              email: email, password: password);
                                          // Get.offNamed(PagesNames.baseScreen);
                                        } else {}
                                        // Navigator.of(context).pushReplacement(
                                        //   MaterialPageRoute(
                                        //     builder: (c) {
                                        //       return const BaseScreen();
                                        //     },
                                        //   ),
                                        // );
                                      },
                                child: authController.isLoading.value
                                    ? Text('wait')
                                    : const Text(
                                        'Entrar',
                                        style: TextStyle(
                                          fontSize: 18,
                                        ),
                                      ),
                              );
                            },
                          )),
                      //esqueceu a senha
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {},
                            child: Text(
                              'Esqueceu a senha?',
                              style: TextStyle(
                                color: CustomColors.customContrastColor,
                              ),
                            ),
                          ),
                        ),
                      ), //senha
                      //divisor
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Divider(
                                color: Colors.grey.withAlpha(90),
                                thickness: 2,
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15.0),
                              child: Text(
                                'Ou',
                              ),
                            ),
                            Expanded(
                              child: Divider(
                                color: Colors.grey.withAlpha(90),
                                thickness: 2,
                              ),
                            ),
                          ],
                        ),
                      ),
                      //Botão de novo user
                      SizedBox(
                        height: 50,
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                20.0,
                              ),
                            ),
                            side: BorderSide(
                              width: 2,
                              color: CustomColors.customSwatchColor,
                            ),
                          ),
                          onPressed: () {
                            Get.toNamed(PagesNames.signUpScreen);
                            // Navigator.of(context).push(
                            //   MaterialPageRoute(builder: (c) {
                            //     return SignUpScreen();
                            //   }),
                            // );
                          },
                          child: const Text(
                            "Criar conta",
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
