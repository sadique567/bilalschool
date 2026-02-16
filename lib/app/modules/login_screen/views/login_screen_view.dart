import 'package:bilalschool/app/utils/comman_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../controllers/login_screen_controller.dart';

class LoginScreenView extends GetView<LoginScreenController> {
  LoginScreenView({super.key});
  // final _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Color(0xFFE3E5F4), // same as scaffoldBackgroundColor
        statusBarIconBrightness: Brightness.dark,
      ),
    );
    return Scaffold(
      // resizeToAvoidBottomInset: true,
      // backgroundColor: Theme.of(context).,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        /// BISMILLAH
                        const SizedBox(height: 15),
                        Image.asset("assets/icons/Bismillah.png", height: 60),

                        /// LOGO + TITLE
                        const SizedBox(height: 50),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/icons/BilaLogo.png",
                              height: 140,
                            ),
                            const SizedBox(width: 10),

                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    "BILAL SCHOOL",
                                    maxLines: 2,
                                    style: TextStyle(
                                      fontSize: 54,
                                      height: 0.9,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    "EDUCATION FOR HUMAN GREATNESS",
                                    style: TextStyle(fontSize: 14),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 40),

                        Form(
                          key: controller.formKey,
                          child: Column(
                            children: [
                              /// LOGIN TITLE
                              const Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Login",
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),

                              const SizedBox(height: 15),

                              /// USERNAME
                              _inputField(
                                icon: Icons.person,
                                ctrl: controller.userNameController,
                                hint: "Username",
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return "Username required";
                                  }
                                  if (value.length < 3) {
                                    return "Username too short";
                                  }
                                  return null;
                                },
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),

                        /// PASSWORD
                        Obx(
                          () => _inputField(
                            icon: Icons.key,
                            ctrl: controller.passwordController,
                            hint: "Password",
                            isObscure: controller.isObscure,
                            toggle: () {
                              controller.isObscure.toggle();
                            },
                            // toggle: () {
                            //   controller.isObscure.value
                            //       ? Icon(Icons.visibility)
                            //       : Icon(Icons.visibility_off);
                            // },
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return "Password required";
                              }
                              if (value.length < 3) {
                                return "Password too short";
                              }
                              return null;
                            },
                          ),
                        ),

                        const SizedBox(height: 25),

                        /// BUTTON
                        SizedBox(
                          width: double.infinity,
                          height: 55,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF0B0F4D),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            onPressed: () {
                              controller.signinScreen();
                            },
                            child: const Text(
                              "Sign In",
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                        ),

                        const Spacer(),

                        /// FOOTER
                        schoolAddress(),

                        // const Padding(
                        //   padding: EdgeInsets.only(bottom: 20),
                        //   child: Text(
                        //     "12 Khetwadi, Maulana Saukat Ali Road,\n"
                        //     "Girgaon, Mumbai - 400004.\n"
                        //     "Contact : 022 - 23810582",
                        //     textAlign: TextAlign.center,
                        //     style: TextStyle(
                        //       color: Color(0xFF4C79E0),
                        //       fontSize: 16,
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  /// INPUT FIELD
  static Widget _inputField({
    required TextEditingController ctrl,
    required IconData icon,
    required String hint,
    bool obscure = false,
    String? Function(String?)? validator,
    IconData? suffixIcon,
    VoidCallback? toggle,
    RxBool? isObscure,
  }) {
    return Container(
      height: 55,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black38),
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Row(
        children: [
          Container(
            width: 55,
            decoration: const BoxDecoration(
              border: Border(right: BorderSide(color: Colors.black38)),
            ),
            child: Icon(icon),
          ),

          /// TEXT FIELD
          Expanded(
            child: TextFormField(
              controller: ctrl,
              obscureText: isObscure?.value ?? false,
              validator: validator,
              decoration: InputDecoration(
                hintText: hint,
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(horizontal: 15),
              ),
            ),
          ),

          /// EYE BUTTON
          if (toggle != null)
            Obx(
              () => IconButton(
                icon: Icon(
                  isObscure!.value ? Icons.visibility_off : Icons.visibility,
                ),
                onPressed: toggle,
              ),
            ),
        ],
      ),
    );
  }
}
