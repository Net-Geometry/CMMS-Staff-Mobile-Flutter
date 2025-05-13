import 'package:cmms_staff_mobile_flutter/src/theme/theme.dart';
import 'package:cmms_staff_mobile_flutter/src/utils/utils.dart';
import 'package:cmms_staff_mobile_flutter/src/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../services/auth_service.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _loading = false;
  String? _error;
  final obsecurePwd = ValueNotifier(false);

  @override
  void initState() {
    super.initState();
    _loadSavedCredentials();
  }

  Future<void> _loadSavedCredentials() async {
    final prefs = await SharedPreferences.getInstance();
    _usernameController.text = prefs.getString('username') ?? '';
    _passwordController.text = prefs.getString('password') ?? '';
  }

  Future<void> _saveCredentials(String username, String password) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('username', username);
    await prefs.setString('password', password);
  }

  Future<void> _login() async {
    setState(() {
      _loading = true;
      _error = null;
    });

    try {
      final result = await AuthService.loginWithEmail(
        _usernameController.text.trim(),
        _passwordController.text.trim(),
      );

      if (!result.success) {
        setState(() => _error = result.errorMessage ?? "Invalid login.");
        return;
      }

      await _saveCredentials(_usernameController.text.trim(), _passwordController.text.trim());

      final userType = result.userType;
      if (userType == 'staff_manager') {
        Navigator.pushReplacementNamed(context, '/manager');
      } else if (userType == 'staff_assistant_manager') {
        Navigator.pushReplacementNamed(context, '/assistant');
      } else {
        setState(() => _error = "Unauthorized user.");
      }
    } catch (e) {
      setState(() => _error = e.toString());
    } finally {
      setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              padding: const EdgeInsets.fromLTRB(20, 80, 20, 60),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Welcome Back").headlineSmall.white.bold,
                  Gap(4),
                  Text("Let's get you signed in").bodyLarge.white,
                ],
              ),
            ),

            Positioned(
              top: 150,
              child: Container(
                width: context.sizeWidth,
                padding: EdgeInsets.all(20),
                child: ContainerElevation(
                  child: Column(
                    children: [
                      FormApp(
                        controller: _usernameController,
                        title: 'Username',
                        hintText: 'Enter Staff ID',
                        prefixIcon: Icons.person_outline,
                        validator: (staffID) {
                          if (staffID == null || staffID.isEmpty) {
                            return 'Staff ID is required';
                          }
                          return null;
                        },
                      ),
                      Gap(20),
                      ValueListenableBuilder(
                        valueListenable: obsecurePwd,
                        builder: (context, v, _) {
                          return FormApp(
                            controller: _passwordController,
                            title: 'Password',
                            hintText: 'Enter your password',
                            prefixIcon: Icons.help_outline_outlined,
                            obscureText: obsecurePwd.value,
                            validator: (staffID) {
                              if (staffID == null || staffID.isEmpty) {
                                return 'Password is required';
                              }
                              return null;
                            },
                            suffixIcon: IconButton(
                              icon: Icon(
                                obsecurePwd.value ? Icons.visibility : Icons.visibility_off,
                                color: AppColor.paleSlate,
                                size: 20,
                              ),
                              onPressed: () => obsecurePwd.value = !obsecurePwd.value,
                            ),
                          );
                        },
                      ),

                      const SizedBox(height: 10),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/forgot-password');
                          },
                          child: const Text("Forgot Password?").bodyMedium.primary.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      if (_error != null)
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Text(_error!).bodySmall.error,
                        ),
                      PrimaryButton.style(
                        onPressed: _loading ? null : _login,
                        minimumSize: Size(double.infinity, 50),
                        child:
                            _loading
                                ? const CircularProgressIndicator(color: Colors.white)
                                : const Text("Sign In").bodyLarge.bold.white,
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
