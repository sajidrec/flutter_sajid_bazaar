import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sajid_bazaar/presentation/controllers/auth_page_controllers/signup_page_controller.dart';
import 'package:sajid_bazaar/presentation/pages/auth_pages/signup_page/widgets/build_page_title.dart';
import 'package:sajid_bazaar/presentation/pages/auth_pages/signup_page/widgets/build_sign_in_sign_up_selection_row.dart';
import 'package:sajid_bazaar/presentation/pages/auth_pages/signup_page/widgets/build_upload_selection_button.dart';
import 'package:sajid_bazaar/utils/app_colors_util.dart';
import 'package:sajid_bazaar/utils/constants.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _nameTEController = TextEditingController();
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _passTEController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailTEController.dispose();
    _passTEController.dispose();
    _nameTEController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
                      _buildForm(
                        nameTEController: _nameTEController,
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
    );
  }

  Widget _buildForm({
    required emailTEController,
    required passTEController,
    required nameTEController,
  }) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          const SizedBox(height: 10),
          GetBuilder<SignupPageController>(
            builder: (signupPageController) {
              return (signupPageController.getProfilePicture == null)
                  ? const Text("")
                  : Text(
                      signupPageController.getFileName,
                      style: const TextStyle(
                        overflow: TextOverflow.ellipsis,
                      ),
                    );
            },
          ),
          const SizedBox(height: 10),
          const BuildUploadSelectionButton(),
          const SizedBox(height: 10),
          TextFormField(
            controller: nameTEController,
            validator: (value) {
              if (value?.isEmpty ?? true) {
                return "Enter you're name";
              }
              return null;
            },
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: AppColorsUtil.backgroundGreen,
                ),
              ),
              hintText: "Name",
              suffixIcon: Icon(
                Icons.person,
                color: AppColorsUtil.backgroundGreen,
              ),
            ),
          ),
          const SizedBox(height: 10),
          TextFormField(
            validator: (value) {
              if (value?.isEmpty ?? true) {
                return "Enter email address can't be empty";
              }
              if (Constants.emailRegExp.hasMatch(value!)) {
                return null;
              }
              return "Enter valid email address";
            },
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
            validator: (value) {
              if ((value?.length ?? 0) < 6) {
                return "Password must be at least 6 characters";
              }
              return null;
            },
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
              Expanded(
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(
                      AppColorsUtil.backgroundGreen,
                    ),
                    foregroundColor: WidgetStatePropertyAll(
                      AppColorsUtil.foreGroundWhite,
                    ),
                  ),
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      if (Get.find<SignupPageController>().getProfilePicture !=
                          null) {
                        FocusScope.of(context).unfocus();
                        await Get.find<SignupPageController>().signup(
                          email: _emailTEController.text.toString().trim(),
                          password: _passTEController.text.toString(),
                          name: _nameTEController.text.toString().trim(),
                        );
                      } else {
                        Get.defaultDialog(
                          title: "Please select a profile picture",
                          middleText: "",
                          backgroundColor: AppColorsUtil.backgroundBlack,
                          titleStyle: TextStyle(
                            color: AppColorsUtil.foreGroundWhite,
                          ),
                          confirm: ElevatedButton(
                            onPressed: () {
                              Get.back();
                            },
                            child: const Text("Ok"),
                          ),
                        );
                      }
                    }
                  },
                  child: GetBuilder<SignupPageController>(
                    builder: (signupPageController) {
                      return signupPageController.getSignUpInProgressStatus
                          ? CircularProgressIndicator(
                              color: AppColorsUtil.foreGroundWhite,
                            )
                          : const Text("Sign Up");
                    },
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
