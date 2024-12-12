import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sajid_bazaar/presentation/pages/auth_pages/signup_page.dart';
import 'package:sajid_bazaar/presentation/pages/widgets/app_exits_dialog_widget.dart';
import 'package:sajid_bazaar/presentation/utils/app_colors_util.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _passTEController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailTEController.dispose();
    _passTEController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) => appExitDialog(),
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  color: AppColorsUtil.backgroundWhite,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 10),
                        _buildSignInSignUpSelectionRow(),
                        const SizedBox(height: 10),
                        _buildPageTitle(),
                        const SizedBox(height: 12),
                        _buildForm(
                          emailTEController: _emailTEController,
                          passTEController: _passTEController,
                        ),
                        const SizedBox(height: 16),
                      ],
                    ),
                  ),
                ),
                // const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildForm({
    required emailTEController,
    required passTEController,
  }) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: emailTEController,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: AppColorsUtil.backgroundGreen,
                ),
              ),
              hintText: "Email",
              suffixIcon: Icon(
                Icons.email_outlined,
                color: AppColorsUtil.backgroundGreen,
              ),
            ),
          ),
          const SizedBox(height: 10),
          TextFormField(
            controller: passTEController,
            keyboardType: TextInputType.text,
            obscureText: true,
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: AppColorsUtil.backgroundGreen,
                ),
              ),
              hintText: "Password",
              suffixIcon: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.password_outlined,
                  color: AppColorsUtil.backgroundGreen,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              TextButton(
                style: ButtonStyle(
                  padding: WidgetStateProperty.all(EdgeInsets.zero),
                  minimumSize: WidgetStateProperty.all<Size>(Size.zero),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                onPressed: () {},
                child: Text(
                  "Forget Password?",
                  style: TextStyle(
                    color: AppColorsUtil.foreGroundGray,
                    fontSize: 18,
                  ),
                ),
              ),
              const Spacer(),
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(
                      AppColorsUtil.backgroundGreen,
                    ),
                    foregroundColor: WidgetStatePropertyAll(
                      AppColorsUtil.foreGroundWhite,
                    )),
                onPressed: () {},
                child: const Text("Sign In"),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPageTitle() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Sign In to Sajid Bazaar",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 26,
          ),
        ),
        Text(
          "Enter email and password to continue",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 20,
            color: AppColorsUtil.foreGroundGray,
          ),
        ),
      ],
    );
  }

  Widget _buildSignInSignUpSelectionRow() {
    return Row(
      children: [
        TextButton(
          style: ButtonStyle(
            padding: WidgetStateProperty.all(EdgeInsets.zero),
            minimumSize: WidgetStateProperty.all<Size>(Size.zero),
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          onPressed: () {},
          child: Text(
            "Sign In",
            style: TextStyle(
              color: AppColorsUtil.foreGroundGreen,
              fontSize: 18,
            ),
          ),
        ),
        const Spacer(),
        TextButton(
          onPressed: () {
            Get.to(() => const SignupPage());
          },
          style: ButtonStyle(
            padding: WidgetStateProperty.all(EdgeInsets.zero),
            minimumSize: WidgetStateProperty.all<Size>(Size.zero),
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          child: Text(
            "Sign Up",
            style: TextStyle(
              color: AppColorsUtil.foreGroundBlack,
              fontSize: 18,
            ),
          ),
        ),
      ],
    );
  }
}
