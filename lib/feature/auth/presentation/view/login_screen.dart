import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:shopping_app/core/common/widget/custom_form_text_field.dart';
import 'package:shopping_app/core/dialogs/app_toasts.dart';
import 'package:shopping_app/core/utils/validator_functions.dart';
import 'package:shopping_app/feature/app_section/app_section.dart';
import 'package:shopping_app/feature/auth/presentation/view/register_screen.dart';
import 'package:shopping_app/feature/auth/presentation/view_model/login/login_cubit.dart';
import 'package:toastification/toastification.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static const String routeName = "LoginScreen";

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          emailController.clear();
          passwordController.clear();

          Navigator.pushNamed(context, AppSection.routeName);
        }
        if (state is LoginError) {
          AppToast.showToast(
            context: context,
            title: "Error",
            description: "Check your email and password",
            type: ToastificationType.error,
          );
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is LoginLoading,
          progressIndicator: SpinKitWaveSpinner(
            color: Colors.blue,
            size: 60.0,
            waveColor: Colors.blue,
            trackColor: Colors.black12,
          ),
          child: Scaffold(
            appBar: AppBar(
              title: Text(
                "Login",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff1F1F1F),
                ),
              ),
              centerTitle: true,
            ),
            body: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 30),
                    Text(
                      "Email",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 5),
                    CustomTextFormField(
                      controller: emailController,
                      validator: Validator.validateEmail,
                      hintText: "Enter your email",
                      keyboardType: TextInputType.emailAddress,
                      action: TextInputAction.next,
                    ),
                    SizedBox(height: 30),
                    Text(
                      "Password",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 5),
                    CustomTextFormField(
                      controller: passwordController,
                      validator: Validator.validatePassword,
                      hintText: "Enter your password",
                      isPassword: true,
                      keyboardType: TextInputType.emailAddress,
                      action: TextInputAction.next,
                    ),
                    SizedBox(height: 30),
                    MaterialButton(
                      minWidth: double.infinity,
                      height: 50,
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          context.read<LoginCubit>().login(
                            emailController.text.trim(),
                            passwordController.text.trim(),
                          );
                        }
                      },
                      color: Color(0xff212121),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        "Login",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Color(0xffFFFFFF),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            floatingActionButtonAnimator:
                FloatingActionButtonAnimator.noAnimation,
            floatingActionButton: MediaQuery.of(context).viewInsets.bottom == 0
                ? Align(
                    alignment: Alignment.bottomCenter,
                    child: Text.rich(
                      TextSpan(
                        text: "Don't have an account? ",
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xff6E6A7C),
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.of(
                              context,
                            ).pushNamed(RegisterScreen.routeName);
                          },
                        children: [
                          TextSpan(
                            text: "Sign Up",
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xff212121),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                : null,
          ),
        );
      },
    );
  }

  late GlobalKey<FormState> formKey;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  @override
  void initState() {
    super.initState();
    formKey = GlobalKey<FormState>();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }
}
