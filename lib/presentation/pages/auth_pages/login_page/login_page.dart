import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sajid_bazaar/presentation/controllers/auth_page_controllers/login_page_controller.dart';
import 'package:sajid_bazaar/presentation/pages/auth_pages/login_page/widgets/build_page_title.dart';
import 'package:sajid_bazaar/presentation/pages/auth_pages/login_page/widgets/build_sign_in_sign_up_selection_row.dart';
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
                        const BuildSignInSignUpSelectionRow(),
                        const SizedBox(height: 10),
                        const BuildPageTitle(),
                        const SizedBox(height: 12),
                        _buildForm(),
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

  Widget _buildForm() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: _emailTEController,
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
          GetBuilder<LoginPageController>(builder: (loginPageController) {
            return TextFormField(
              controller: _passTEController,
              keyboardType: TextInputType.text,
              obscureText: loginPageController.showPassword,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColorsUtil.backgroundGreen,
                  ),
                ),
                hintText: "Password",
                suffixIcon: IconButton(
                  onPressed: () {
                    loginPageController.togglePasswordHideShow();
                  },
                  icon: Icon(
                    !loginPageController.showPassword
                        ? Icons.remove_red_eye_outlined
                        : Icons.password_outlined,
                    color: AppColorsUtil.backgroundGreen,
                  ),
                ),
              ),
            );
          }),
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
                  ),
                ),
                onPressed: () {},
                child: const Text("Sign In"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
