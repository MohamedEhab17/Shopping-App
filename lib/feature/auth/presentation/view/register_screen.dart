import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:shopping_app/core/common/widget/custom_form_text_field.dart';
import 'package:shopping_app/core/dialogs/app_toasts.dart';
import 'package:shopping_app/core/utils/validator_functions.dart';
import 'package:shopping_app/feature/auth/presentation/view_model/register/register_cubit.dart';
import 'package:toastification/toastification.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});
  static const String routeName = "RegisterScreen";

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterSuccess) {
          Navigator.of(context).pop();
        }
        if (state is RegisterError) {
          AppToast.showToast(
            context: context,
            title: "Error",
            description: "can't register. please try again",
            type: ToastificationType.error,
          );
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is RegisterLoading,
          progressIndicator: SpinKitWaveSpinner(
            color: Colors.blue,
            size: 60.0,
            waveColor: Colors.blue,
            trackColor: Colors.black12,
          ),
          child: Scaffold(
            appBar: AppBar(
              title: Text(
                "SignUp",
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
                      "User Name",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 5),
                    CustomTextFormField(
                      controller: nameController,
                      validator: Validator.validateName,
                      hintText: "Enter your name",
                      keyboardType: TextInputType.name,
                      action: TextInputAction.next,
                    ),
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
                    Text(
                      "Confirm Password",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 5),
                    CustomTextFormField(
                      controller: confirmPasswordController,
                      validator: (value) => Validator.validateConfirmPassword(
                        value,
                        passwordController.text,
                      ),
                      hintText: "Enter your confirm password",
                      isPassword: true,
                      keyboardType: TextInputType.emailAddress,
                      action: TextInputAction.done,
                    ),
                    SizedBox(height: 30),
                    MaterialButton(
                      minWidth: double.infinity,
                      height: 50,
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          context.read<RegisterCubit>().register(
                            nameController.text.trim(),
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
                        "Sign up",
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
                        text: "Already have an account? ",
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xff6E6A7C),
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.of(context).pop();
                          },
                        children: [
                          TextSpan(
                            text: "Login",
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
  late TextEditingController nameController;
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;

  @override
  void initState() {
    super.initState();
    formKey = GlobalKey<FormState>();
    emailController = TextEditingController();
    nameController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    nameController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
  }
}
