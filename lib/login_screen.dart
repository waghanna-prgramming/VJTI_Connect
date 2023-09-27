import 'package:flutter/material.dart';

import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController textController1 = TextEditingController();
  TextEditingController textController2 = TextEditingController();

  bool passwordVisibility1 = true;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void dispose() {
    textController1.dispose();
    textController2.dispose();
    super.dispose();
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
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_rounded,
              color: Color(0xFF14181B),
              size: 30,
            ),
            onPressed: () {
              print('IconButton pressed ...');
            },
          ),
          title: Text(
            'Student Login',
            style: TextStyle(
              fontFamily: 'Inter',
              color: Color(0xFF14181B),
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 0,
        ),
        body: SafeArea(
          top: true,
          child: Align(
            alignment: AlignmentDirectional(0.00, 0.00),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
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
                                controller: textController2,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText: 'Registration No.',
                                  // Add other properties as needed
                                ),
                                // Add validator as needed
                              ),
                            ),

                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0, 0, 0, 16),
                              child: TextFormField(
                                controller: textController2,
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
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0, 0, 0, 16),
                              child: ElevatedButton(
                                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen(),),),
                                child: Text('Log In'),
                                // Add other button properties as needed
                              ),
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
