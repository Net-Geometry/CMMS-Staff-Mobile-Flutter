import 'package:cmms_staff_mobile_flutter/src/theme/theme.dart';
import 'package:cmms_staff_mobile_flutter/src/utils/utils.dart';
import 'package:cmms_staff_mobile_flutter/src/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class VerificationCodePage extends StatefulWidget {
  const VerificationCodePage({super.key});

  @override
  State<VerificationCodePage> createState() => _VerificationCodePageState();
}

class _VerificationCodePageState extends State<VerificationCodePage> {
  final newPwd = TextEditingController();
  final confirmPwd = TextEditingController();
  final obsecureNewPwd = ValueNotifier(false);
  final obsecureConfirmPwd = ValueNotifier(false);

  @override
  void dispose() {
    newPwd.dispose();
    confirmPwd.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FB),
      body: SizedBox(
        height: context.sizeHeight,
        width: double.infinity,
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/login_header.png"),
                  fit: BoxFit.fitWidth,
                  alignment: Alignment.topCenter,
                ),
              ),
              padding: const EdgeInsets.fromLTRB(20, 80, 20, 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Verify Code").headlineSmall.white.bold,
                  SizedBox(height: 4),
                  Text("Enter verification code & new password").bodyLarge.white,
                ],
              ),
            ),
            // Form
            Positioned(
              top: 150,
              child: Container(
                width: context.sizeWidth,
                padding: EdgeInsets.all(20),
                child: ContainerElevation(
                  padding: EdgeInsets.fromLTRB(20, 20, 20, 50),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const TextField(
                        decoration: InputDecoration(
                          labelText: "Verification Code",
                          prefixIcon: Icon(Icons.verified_outlined),
                        ),
                      ),
                      const Gap(20),
                      ValueListenableBuilder(
                        valueListenable: obsecureNewPwd,
                        builder: (context, v, _) {
                          return FormApp(
                            controller: newPwd,
                            title: 'New Password',
                            hintText: 'Enter new password',
                            prefixIcon: Icons.help_outline_outlined,
                            obscureText: obsecureNewPwd.value,
                            validator: (staffID) {
                              if (staffID == null || staffID.isEmpty) {
                                return 'New Password is required';
                              }
                              return null;
                            },
                            suffixIcon: IconButton(
                              icon: Icon(
                                obsecureNewPwd.value ? Icons.visibility : Icons.visibility_off,
                                color: AppColor.paleSlate,
                                size: 20,
                              ),
                              onPressed: () => obsecureNewPwd.value = !obsecureNewPwd.value,
                            ),
                          );
                        },
                      ),
                      const Gap(20),
                      ValueListenableBuilder(
                        valueListenable: obsecureConfirmPwd,
                        builder: (context, v, _) {
                          return FormApp(
                            controller: confirmPwd,
                            title: 'Confirm Password',
                            hintText: 'Re-enter new password',
                            prefixIcon: Icons.help_outline_outlined,
                            obscureText: obsecureConfirmPwd.value,
                            validator: (staffID) {
                              if (staffID == null || staffID.isEmpty) {
                                return 'Confirm Password is required';
                              }
                              return null;
                            },
                            suffixIcon: IconButton(
                              icon: Icon(
                                obsecureConfirmPwd.value ? Icons.visibility : Icons.visibility_off,
                                color: AppColor.paleSlate,
                                size: 20,
                              ),
                              onPressed: () => obsecureConfirmPwd.value = !obsecureConfirmPwd.value,
                            ),
                          );
                        },
                      ),
                      Gap(20),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Text(AppString.longPassword).labelMedium.charcoalGray.center,
                      ),
                      const Gap(20),
                      PrimaryButton.style(
                        minimumSize: Size(double.infinity, 50),
                        onPressed: () {},
                        child: Text("Reset Password").bodyLarge.bold.white,
                      ),
                      Gap(20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Didn't receive the code?").bodyLarge.black,
                          TextButton(
                            onPressed: () => Navigator.pushNamed(context, '/forgot-password'),
                            child: const Text("Resend Code").bodyMedium.primary.bold,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
