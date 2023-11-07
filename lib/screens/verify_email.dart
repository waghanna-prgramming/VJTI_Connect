import 'dart:async';

import 'package:demo_connect/dump/home_screen.dart';
import 'package:demo_connect/screens/login_screen.dart';
import 'package:email_auth/email_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../models/user.dart';

class VerifyEmail extends StatefulWidget {
  const VerifyEmail({super.key});

  @override
  State<VerifyEmail> createState() => _VerifyEmailState();
}

class _VerifyEmailState extends State<VerifyEmail> {
  TextEditingController _emailController = TextEditingController();
  // TextEditingController _otpController = TextEditingController();
  // bool _isLoading = false;
  bool isEmailVerified = false;
  Timer? timer;
  // EmailAuth emailAuth = new EmailAuth(sessionName: "Test Session");
  // final scaffoldKey = GlobalKey<ScaffoldState>();
  //
  // void sendOTP() async {
  //   var res = await emailAuth.sendOtp(recipientMail: 'tanmaymn2512@gmail.com',);
  //   if (res) {
  //     print("OTP Sent!");
  //   } else {
  //     print("We could not send the OTP!");
  //   }
  // }
  //
  // void verifyOTP() {
  //   var res = emailAuth.validateOtp(recipientMail: 'tanmaymn2512@gmail.com', userOtp: _otpController.text,);
  //   if(res) {
  //     print("OTP Verified!");
  //   } else {
  //     print("Invalid OTP!");
  //   }
  // }

  @override
  void dispose() {
    _emailController.dispose();
    // _otpController.dispose();
    super.dispose();
    timer?.cancel();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;

    if(!isEmailVerified) {
      sendVerificationEmail();

      timer = Timer.periodic(
        Duration(seconds: 3),
          (_) => checkEmailVerified(),
      );
    }
  }

  Future checkEmailVerified() async {
    await FirebaseAuth.instance.currentUser!.reload();

    setState(() {
      isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    });

    if (isEmailVerified) {
      timer?.cancel();
    }
  }

  Future sendVerificationEmail() async {
    try {
      final user = FirebaseAuth.instance.currentUser!;
      await user.sendEmailVerification();
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) => isEmailVerified
      ? LoginScreen()
      : Scaffold(
    // appBar: AppBar(title: Text("Verify Email"),),
    body: SafeArea(child: Column(
      children: [
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
                    Padding(
                      padding: const EdgeInsets.only(left: 8, top: 20, right: 8, bottom: 8,),
                      child: Text(
                        'Email Verification',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 24, // Modify as needed
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                      width: double.infinity,
                    ),
                    Padding(
                      padding:
                      EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                      child: Text(
                        'A link has been sent to your email account.\n\nTap on the provided link to verify your email address.',
                      ),
                    ),
                    // ...
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    ),),
  );
}




































// Scaffold(
// backgroundColor: Colors.white,
// appBar: AppBar(
// title: Text('Verify Email'),
// ),
// body: Column(
// children: [
// Padding(
// padding: EdgeInsets.all(16),
// child: Column(
// mainAxisSize: MainAxisSize.max,
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Padding(
// padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 24),
// child: Text(
// 'Verify the email',
// textAlign: TextAlign.start,
// style: TextStyle(
// fontFamily: 'Inter',
// color: Color(0xFF677681),
// fontSize: 14,
// fontWeight: FontWeight.w500,
// ),
// ),
// ),
// // Add other form fields similarly
// Padding(
// padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
// child: TextFormField(
// controller: _emailController,
// obscureText: false,
// decoration: InputDecoration(
// labelText: 'Email',
// // Add other properties as needed
// ),
// // Add validator as needed
// ),
// ),
//
// Padding(
// padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
// child: TextFormField(
// controller: _otpController,
// obscureText: otpVisibility1,
// decoration: InputDecoration(
// labelText: 'Enter OTP',
// // Add other properties as needed
// // suffixIcon: InkWell(
// //   onTap: () {
// //     setState(() {
// //       otpVisibility1 = !otpVisibility1;
// //     });
// //   },
// //   child: Icon(
// //     otpVisibility1
// //         ? Icons.visibility_outlined
// //         : Icons.visibility_off_outlined,
// //     color: Color(0xFF677681),
// //     size: 22,
// //   ),
// // ),
// ),
// // Add validator as needed
// ),
// ),
// // ...
// Row(
// mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// children: [
// Padding(
// padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
// child: ElevatedButton(
// onPressed: () {
// // loginUser();
// sendOTP();
// print("Button Pressed...");
// },
// child: Text(
// 'Send OTP',
// ),
// // Add other button properties as needed
// ),
// ),
// Padding(
// padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
// child: ElevatedButton(
// onPressed: () {
// // loginUser();
// verifyOTP();
// print("Button Pressed...");
// },
// child: Text(
// 'Verify OTP',
// ),
// // Add other button properties as needed
// ),
// ),
// ],
// ),
// ],
// ),
// ),
// ],
// ),
// );