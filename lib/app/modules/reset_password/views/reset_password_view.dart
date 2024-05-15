import 'package:flutter_application_serti/app/modules/reset_password/controllers/reset_password_controller.dart';
import 'package:flutter_application_serti/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPasswordView extends GetView<ResetPasswordController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink,
      body: Padding(
        padding: EdgeInsets.all(20),
        child: ListView(
          children: [
            SizedBox(height: 100), 
            Text(
              'Reset Password',
              style: TextStyle(
                color: Colors.white,
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              'Enter your email to reset your password',
              style: TextStyle(
                color: Colors.white70,
                fontSize: 18,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30),
            TextField(
              controller: controller.emailController,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: InputBorder.none,
                labelText: 'Email',
                labelStyle: TextStyle(color: Colors.black),
              ),
            ),
            SizedBox(height: 20),
            Container(
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  onPrimary: Colors.pink,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32.0),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Reset Password',
                      style: TextStyle(fontSize: 18, color: Colors.pink),
                    ),
                    SizedBox(width: 10),
                    Icon(
                      Icons.arrow_forward,
                      color: Colors.pink,
                    ),
                  ],
                ),
                onPressed: () {
                  if (controller.emailController.text.isEmpty) {
                    Get.snackbar(
                      'Error',
                      'Email tidak boleh kosong',
                      backgroundColor: Colors.red,
                      colorText: Colors.white,
                    );
                  } else {
                  
                    controller.resetPassword(controller.emailController.text);
                  }
                },
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Back to ',
                  style: TextStyle(color: Colors.white),
                ),
                TextButton(
                  child: Text(
                    'Login',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    Get.toNamed(Routes.LOGIN);
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
