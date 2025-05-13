import 'package:cmms_staff_mobile_flutter/src/theme/theme.dart';
import 'package:cmms_staff_mobile_flutter/src/utils/utils.dart';
import 'package:cmms_staff_mobile_flutter/src/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final emailC = TextEditingController();

  @override
  void dispose() {
    emailC.dispose();
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
                  Text("Forgot Password").headlineSmall.white.bold,
                  Gap(4),
                  Text("Enter email to verify its you").bodyLarge.white,
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
                  padding: EdgeInsets.fromLTRB(12, 20, 12, 30),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: FormApp(
                          controller: emailC,
                          title: 'Email Address',
                          hintText: 'Enter your email',
                          prefixIcon: Icons.email_outlined,
                          validator: (email) {
                            if (email == null || email.isEmpty) {
                              return 'Email register is required';
                            }
                            return null;
                          },
                        ),
                      ),
                      Gap(24),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child:
                            Text(
                              AppString.sendVerification,
                              textAlign: TextAlign.center,
                            ).labelLarge.medium.charcoalGray,
                      ),
                      const Gap(20),
                      PrimaryButton.style(
                        onPressed: () => Navigator.pushNamed(context, '/verification'),
                        minimumSize: Size(double.infinity, 50),
                        child: const Text("Send Verification Code").bodyLarge.bold.white,
                      ),

                      Gap(20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Remember your password?').bodyLarge.black,
                          TextButton(
                            onPressed: () => Navigator.pushNamed(context, '/login'),
                            child: const Text("Sign In").bodyMedium.primary.bold,
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
