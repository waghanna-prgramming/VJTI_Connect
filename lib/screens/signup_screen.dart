import 'package:demo_connect/resources/auth_methods.dart';
import 'package:demo_connect/screens/home_screen.dart';
import 'package:flutter/material.dart';

import 'login_screen.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _regnoController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _passwordController1 = TextEditingController();
  bool _isLoading = false;
  bool passwordVisibility1 = true;
  bool passwordVisibility2 = true;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _regnoController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _passwordController1.dispose();
    // super.dispose();
  }

  void signUpUser() async {
    // set loading to true
    setState(() {
      _isLoading = true;
    });

    // signup user using our authmethodds
    String res = await AuthMethods().signUpUser(
      email: _emailController.text,
      password: _passwordController.text,
      username: _nameController.text,
      regno: _regnoController.text,
    ); //
    // if string returned is success, user has been created
    if (res == "success") {
      setState(() {
        _isLoading = false;
      });
      // navigate to the home screen
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => HomeScreen(),
        ),
      );
    } else {
      setState(() {
        _isLoading = false;
      });
      // show the error
      // showSnackBar(context, res);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 12, 0, 24),
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
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                            child: TextFormField(
                              controller: _nameController,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: 'Student Name',
                                // Add other properties as needed
                              ),
                              // Add validator as needed
                            ),
                          ),
                          // Add other form fields similarly
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                            child: TextFormField(
                              controller: _regnoController,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: 'Registration No.',
                                // Add other properties as needed
                              ),
                              // Add validator as needed
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                            child: TextFormField(
                              controller: _emailController,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: 'Email ID',
                                // Add other properties as needed
                              ),
                              // Add validator as needed
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
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
                                ),
                              ),
                              // Add validator as needed
                            ),
                          ),
                          // ...
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                            child: TextFormField(
                              controller: _passwordController1,
                              obscureText: passwordVisibility2,
                              decoration: InputDecoration(
                                labelText: 'Confirm Password',
                                // Add other properties as needed
                                suffixIcon: InkWell(
                                  onTap: () {
                                    setState(() {
                                      passwordVisibility2 =
                                          !passwordVisibility2;
                                    });
                                  },
                                  child: Icon(
                                    passwordVisibility2
                                        ? Icons.visibility_outlined
                                        : Icons.visibility_off_outlined,
                                    color: Color(0xFF677681),
                                    size: 22,
                                  ),
                                ),
                              ),
                              // Add validator as needed
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                            child: ElevatedButton(
                              onPressed: () {
                                signUpUser();
                                print('Button pressed ...');
                              },
                              child: !_isLoading
                                  ? const Text(
                                      'Sign up',
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
                                  'Already have an account?',
                                ),
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8),
                              ),
                              GestureDetector(
                                onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => LoginScreen(),
                                  ),
                                ),
                                child: Container(
                                  child: const Text(
                                    ' Login.',
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
    );
  }
}
