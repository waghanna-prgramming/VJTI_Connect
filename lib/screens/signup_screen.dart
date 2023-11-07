import 'package:demo_connect/resources/auth_methods.dart';
import 'package:demo_connect/dump/home_screen.dart';
import 'package:demo_connect/screens/verify_email.dart';
import 'package:flutter/cupertino.dart';
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
    );
    print('signUpUser function running....\n');//
    // if string returned is success, user has been created
    if (res == "success") {
      setState(() {
        _isLoading = false;
      });
      // navigate to the home screen
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => VerifyEmail(),
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
      body: SafeArea(
        top: true,
        child: Align(
          alignment: AlignmentDirectional(0.00, 0.00),
          child: ListView(
            // mainAxisSize: MainAxisSize.max,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 200, top: 20, right: 10),
                child: Container(
                  height: 70,
                  child: Row(
                    children: [
                      Text(
                        'VJTI Connect',
                        style: TextStyle(
                          fontFamily: 'Sora',
                          color: Color(0xFF14181B),
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 10,
                      height: 10,),
                      Image(image: AssetImage('lib/images/vjtilogo.png'),),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(5, 20, 200, 0),
                child: Container(
                  width: double.infinity,
                  height: 70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  alignment: AlignmentDirectional(0.00, 0.00),
                  child: Text(
                    'Welcome!',
                    style: TextStyle(
                      fontFamily: 'Sora',
                      color: Color(0xFF14181B),
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
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
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: Color(0xFFF1F4F8),
                      width: 2,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey, // Shadow color
                        blurRadius: 5, // Adjust the blur radius as needed
                        offset: Offset(0, 0), // Adjust the offset to control shadow position
                      ),
                    ],
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
                            'Sign up',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 30, // Modify as needed
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 50, 0, 16),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0), // You can adjust the radius as needed
                                color: CupertinoColors.systemGrey5,
                              ),
                              child: TextField(
                                controller: _nameController,
                                decoration: InputDecoration(
                                  hintText: 'Student Name',
                                  border: InputBorder.none, // Remove the default input border
                                  contentPadding: EdgeInsets.symmetric(horizontal: 10.0), // Adjust padding as needed
                                ),
                              ),
                            ),
                          ),
                          // Add other form fields similarly
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0), // You can adjust the radius as needed
                                color: CupertinoColors.systemGrey5,
                              ),
                              child: TextField(
                                controller: _regnoController,
                                decoration: InputDecoration(
                                  hintText: 'Registration no.',
                                  border: InputBorder.none, // Remove the default input border
                                  contentPadding: EdgeInsets.symmetric(horizontal: 10.0), // Adjust padding as needed
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0), // You can adjust the radius as needed
                                color: CupertinoColors.systemGrey5,
                              ),
                              child: TextField(
                                controller: _emailController,
                                decoration: InputDecoration(
                                  hintText: 'Email ID',
                                  border: InputBorder.none, // Remove the default input border
                                  contentPadding: EdgeInsets.symmetric(horizontal: 10.0), // Adjust padding as needed
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0), // You can adjust the radius as needed
                                color: CupertinoColors.systemGrey5,
                              ),
                              child: TextFormField(
                                controller: _passwordController,
                                obscureText: passwordVisibility1,
                                decoration: InputDecoration(
                                  labelText: 'Password',
                                  border: InputBorder.none,
                                  // Add other properties as needed
                                  contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
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
                          ),
                          // ...
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0), // You can adjust the radius as needed
                                color: CupertinoColors.systemGrey5,
                              ),
                              child: TextFormField(
                                controller: _passwordController1,
                                obscureText: passwordVisibility2,
                                decoration: InputDecoration(
                                  labelText: 'Confirm Password',
                                  border: InputBorder.none,
                                  // Add other properties as needed
                                  contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
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
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 20, 0, 25),
                            child: Container(
                              width: double.infinity,
                              height: 50,
                              child: ElevatedButton(
                                onPressed: () {
                                  signUpUser();
                                  print('Button pressed ...');
                                },
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  backgroundColor: Color(0xFF3D3D3D),
                                ),
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
                          ),
                          Divider(
                            height: 1,
                            thickness: 0.8,
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
                                    ' Log in.',
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
