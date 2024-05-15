import 'package:flutter_application_serti/app/modules/register/controllers/register_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterView extends GetView<RegisterController> {
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
              'Register',
              style: TextStyle(
                color: Colors.white,
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Create a new account',
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
                      'Register',
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
               
                    controller.register(
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
                  'Already have an account? ',
                  style: TextStyle(color: Colors.white),
                ),
                TextButton(
                  child: Text(
                    'Login',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () => Get.back(),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
