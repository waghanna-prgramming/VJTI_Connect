import 'package:demo_connect/screens/test_home_screen.dart';
import 'package:demo_connect/resources/auth_methods.dart';
import 'package:demo_connect/screens/signup_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => TestHomeScreen(),
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
        body: SafeArea(
          top: true,
          child: Align(
            alignment: AlignmentDirectional(0.00, 0.00),
            child: ListView(
              // mainAxisSize: MainAxisSize.max,
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 32),
                  child: Column(
                    children: [
                      Image(
                        image: AssetImage('lib/images/vjtilogo.png'),
                        height: 200,
                      ),
                      Container(
                        width: double.infinity,
                        height: 55,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        alignment: AlignmentDirectional(0.00, 0.00),
                        child: Text(
                          'VJTI Connect',
                          style: TextStyle(
                            fontFamily: 'Sora',
                            color: Color(0xFF14181B),
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
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
                              'Log In',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: 30, // Modify as needed
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            // Add other form fields similarly
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 50, 0, 16),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      20.0), // You can adjust the radius as needed
                                  color: CupertinoColors.systemGrey5,
                                ),
                                child: TextField(
                                  controller: _emailController,
                                  decoration: InputDecoration(
                                    hintText: 'Email ID',
                                    border: InputBorder
                                        .none, // Remove the default input border
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal:
                                            10.0), // Adjust padding as needed
                                  ),
                                ),
                              ),
                            ),

                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      20.0), // You can adjust the radius as needed
                                  color: CupertinoColors.systemGrey5,
                                ),
                                child: TextFormField(
                                  controller: _passwordController,
                                  obscureText: passwordVisibility1,
                                  decoration: InputDecoration(
                                      labelText: 'Password',
                                      border: InputBorder.none,
                                      // Add other properties as needed
                                      contentPadding: EdgeInsets.symmetric(
                                          horizontal: 10.0),
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
                                      )),
                                  // Add validator as needed
                                ),
                              ),
                            ),
                            // ...
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 20, 0, 25),
                              child: Container(
                                width: double.infinity,
                                height: 50,
                                child: ElevatedButton(
                                  onPressed: () {
                                    loginUser();
                                    print("Button Pressed...");
                                  },
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    backgroundColor: Color(0xFF3D3D3D),
                                  ),
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
                            ),
                            Divider(
                              height: 1,
                              color: CupertinoColors.systemGrey,
                            ),
                            SizedBox(
                              height: 15,
                              width: double.infinity,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  child: const Text(
                                    'Don\'t have an account?',
                                  ),
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8),
                                ),
                                GestureDetector(
                                  onTap: () => Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => const SignUp(),
                                    ),
                                  ),
                                  child: Container(
                                    child: const Text(
                                      ' Sign up.',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 8),
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
