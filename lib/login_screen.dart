import 'package:demo_connect/resources/auth_methods.dart';
import 'package:demo_connect/signup_screen.dart';
import 'package:flutter/material.dart';
// import 'package:js/js_util.dart';

import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;
  bool passwordVisibility1 = true;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void loginUser() async {
    setState(() {
      _isLoading = true;
    });
    String res = await AuthMethods().loginUser(
        email: _emailController.text, password: _passwordController.text);
    if (res == 'success') {
      setState(() {
        _isLoading = false;
      });
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => HomeScreen(),
        ),
      );
    } else {
      setState(() {
        _isLoading = false;
      });
      // showSnackBar(context, res);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Color(0xFFF1F4F8),
        appBar: AppBar(
          backgroundColor: Color(0xFFF1F4F8),
          automaticallyImplyLeading: false,
          actions: [],
          centerTitle: false,
          elevation: 0,
        ),
        body: SafeArea(
          top: true,
          child: Align(
            alignment: AlignmentDirectional(0.00, 0.00),
            child: ListView(
              // mainAxisSize: MainAxisSize.max,
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 32, 0, 32),
                  child: Container(
                    width: double.infinity,
                    height: 70,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    alignment: AlignmentDirectional(0.00, 0.00),
                    child: Text(
                      'VJTI Connect',
                      style: TextStyle(
                        fontFamily: 'Sora',
                        color: Color(0xFF14181B),
                        fontSize: 36,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(12, 12, 12, 12),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: Color(0xFFF1F4F8),
                        width: 2,
                      ),
                    ),
                    child: Align(
                      alignment: AlignmentDirectional(0.00, 0.00),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(24, 24, 24, 24),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Student Login',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: 24, // Modify as needed
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0, 12, 0, 24),
                              child: Text(
                                'Enter your details below to log in.',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  color: Color(0xFF677681),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            // Add other form fields similarly
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0, 0, 0, 16),
                              child: TextFormField(
                                controller: _emailController,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText: 'Email',
                                  // Add other properties as needed
                                ),
                                // Add validator as needed
                              ),
                            ),

                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0, 0, 0, 16),
                              child: TextFormField(
                                controller: _passwordController,
                                obscureText: passwordVisibility1,
                                decoration: InputDecoration(
                                  labelText: 'Password',
                                  // Add other properties as needed
                                  suffixIcon: InkWell(
                                    onTap: () {
                                      setState(() {
                                        passwordVisibility1 =
                                        !passwordVisibility1;
                                      });
                                    },
                                    child: Icon(
                                      passwordVisibility1
                                          ? Icons.visibility_outlined
                                          : Icons.visibility_off_outlined,
                                      color: Color(0xFF677681),
                                      size: 22,
                                    ),
                                  )
                                ),
                                // Add validator as needed
                              ),
                            ),
                            // ...
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0, 0, 0, 16),
                              child: ElevatedButton(
                                onPressed: () {
                                  loginUser();
                                  print("Button Pressed...");
                                },
                                child: !_isLoading
                                    ? const Text(
                                  'Log in',
                                )
                                    : const CircularProgressIndicator(
                                  color: Colors.white,
                                ),
                                // Add other button properties as needed
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  child: const Text(
                                    'Dont have an account?',
                                  ),
                                  padding: const EdgeInsets.symmetric(vertical: 8),
                                ),
                                GestureDetector(
                                  onTap: () => Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => const SignUp(),
                                    ),
                                  ),
                                  child: Container(
                                    child: const Text(
                                      ' Signup.',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    padding: const EdgeInsets.symmetric(vertical: 8),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
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
