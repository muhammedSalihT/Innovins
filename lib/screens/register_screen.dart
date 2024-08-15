import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:flutterinterviewproject/common/app_colors.dart";
import "package:flutterinterviewproject/common/app_text_form_field.dart";
import "package:flutterinterviewproject/controllers/register_controller.dart";
import "package:flutterinterviewproject/routes/Route.dart";
import "package:get/get.dart";
import "package:velocity_x/velocity_x.dart";

class RegisterScreen extends GetView<RegisterController> {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Form(
          key: controller.formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                AppTextFormField(
                  requiredField: true,
                  controller: controller.nameController,
                  keyboardType: TextInputType.name,
                  textCapitalization: TextCapitalization.none,
                  textInputAction: TextInputAction.next,
                  maxLines: 1,
                  validator: (String? value) {
                    return (GetUtils.isNullOrBlank(value) ?? true)
                        ? "Name is required"
                        : null;
                  },
                  enabled: true,
                  autofillHints: const <String>[
                    AutofillHints.name,
                  ],
                  labelText: "Name",
                  hintText: "Enter Name",
                  prefixIcon: const Icon(
                    Icons.person,
                  ),
                ),
                AppTextFormField(
                  requiredField: true,
                  controller: controller.emailController,
                  keyboardType: TextInputType.emailAddress,
                  textCapitalization: TextCapitalization.none,
                  textInputAction: TextInputAction.next,
                  maxLines: 1,
                  validator: (String? value) {
                    return (GetUtils.isNullOrBlank(value) ?? true)
                        ? "Email is required"
                        : !GetUtils.isEmail(value ?? "")
                            ? "Invalid"
                            : null;
                  },
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.deny(RegExp(r"\s")),
                  ],
                  enabled: true,
                  autofillHints: const <String>[
                    AutofillHints.email,
                  ],
                  labelText: "Email Address",
                  hintText: "Enter Email Address",
                  prefixIcon: const Icon(
                    Icons.email,
                  ),
                  suffixIcon: const SizedBox(),
                ),
                AppTextFormField(
                  requiredField: true,
                  controller: controller.mobileController,
                  keyboardType: TextInputType.phone,
                  textCapitalization: TextCapitalization.none,
                  textInputAction: TextInputAction.next,
                  maxLines: 1,
                  validator: (String? value) {
                    return (GetUtils.isNullOrBlank(value) ?? true)
                        ? "Mobile number is required"
                        : null;
                  },
                  autofillHints: const <String>[
                    AutofillHints.telephoneNumber,
                  ],
                  enabled: true,
                  labelText: "Mobile No",
                  hintText: "Enter Mobile Number",
                  prefixIcon: const Icon(
                    Icons.call,
                  ),
                ),
                Obx(
                  () => AppTextFormField(
                    requiredField: true,
                    controller: controller.passwordController,
                    keyboardType: TextInputType.number,
                    textCapitalization: TextCapitalization.none,
                    textInputAction: TextInputAction.done,
                    obscureText: controller.isObscure.value,
                    maxLines: 1,
                    validator: (String? value) {
                      return (value == null || value.isEmpty)
                          ? "Password is required"
                          : null;
                    },
                    enabled: true,
                    labelText: "Password",
                    hintText: "Enter Password",
                    prefixIcon: const Icon(
                      Icons.key,
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        controller.isObscure.value
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                      onPressed: () {
                        controller.togglePasswordVisibility();
                      },
                    ),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  height: 100,
                  child: ElevatedButton(
                    onPressed: () async {
                      if (controller.formKey.currentState?.validate() ??
                          false) {
                        await controller.registerApi();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.appPrimeryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      "SignUp",
                      style: TextStyle(
                        fontSize: 18,
                        color: AppColors.appWhiteColor,
                      ),
                    ),
                  ).pSymmetric(h: 10, v: 20),
                ),
                GestureDetector(
                  onTap: () => Get.offNamed(RouteName.initial),
                  child: Center(
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: const TextSpan(
                        style: TextStyle(
                          fontSize: 16.0,
                          color: AppColors.appBlackColor,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: "Already have an account?",
                            style: TextStyle(color: AppColors.appPrimeryColor),
                          ),
                          TextSpan(
                            text: " Sign In",
                            style: TextStyle(
                              color: AppColors.appBlackColor,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
