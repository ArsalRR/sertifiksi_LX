import 'package:flutter_application_serti/app/modules/login/controllers/login_controller.dart';
import 'package:flutter_application_serti/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginView extends GetView<LoginController> {
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
              'Login',
              style: TextStyle(
                color: Colors.white,
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Welcome back,\nPlease login to your account',
              style: TextStyle(
                color: Colors.white70,
                fontSize: 18,
              ),
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
            Obx(() => TextField(
              obscureText: controller.isPasswordHidden.value,
              controller: controller.passwordController,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: InputBorder.none,
                labelText: 'Password',
                labelStyle: TextStyle(color: Colors.black),
                suffixIcon: IconButton(
                  icon: Icon(
                    controller.isPasswordHidden.value
                        ? Icons.visibility_off
                        : Icons.visibility,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    controller.isPasswordHidden.value =
                        !controller.isPasswordHidden.value;
                  },
                ),
              ),
            )),
            SizedBox(height: 20),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  Get.toNamed(Routes.RESET_PASSWORD);
                },
                child: Text(
                  'Forgot the password?',
                  style: TextStyle(color: Colors.white),
                ),
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
                      'Login',
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
                  } else if (controller.passwordController.text.isEmpty) {
                    Get.snackbar(
                      'Error',
                      'Password tidak boleh kosong',
                      backgroundColor: Colors.red,
                      colorText: Colors.white,
                    );
                  } else {
                    
                    controller.login(
                      controller.emailController.text,
                      controller.passwordController.text,
                    );
                  }
                },
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Don\'t have any account? ',
                  style: TextStyle(color: Colors.white),
                ),
                TextButton(
                  child: Text(
                    'Register',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    Get.toNamed(Routes.REGISTER);
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
