import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_serti/app/modules/login/views/login_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_storage/firebase_storage.dart';

class HomeController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;
  
  get storage => null;

  

  Stream<QuerySnapshot<Object?>> streamData() {
    CollectionReference data = firestore.collection('koleksi');
    return data.orderBy('foto', descending: true).snapshots();
  }

  void deleteData(String docID) {
    try {
      Get.defaultDialog(
          title: "Yakin Hapus",
          middleText: "Apakah Kamu yakin akan Hapus Profil ini ?",
          onConfirm: () {
            firestore.collection('koleksi').doc(docID).delete();
            Get.back();
            Get.snackbar(
              'Success',
              'Data deleted successfully',
              snackPosition: SnackPosition.BOTTOM,
              duration: Duration(seconds: 2),
              margin: EdgeInsets.all(12),
            );
          },
          textConfirm: "Yes, I'm sure",
          textCancel: "No");
    } catch (e) {
      print(e);
      Get.snackbar(
        'Error',
        'Cannot delete this post',
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(seconds: 2),
        margin: EdgeInsets.all(12),
      );
    }
  }
  Future<void> uploadFoto(File file) async {
    try {
      Reference ref = storage.ref('images/${DateTime.now().millisecondsSinceEpoch}.jpg');

      await ref.putFile(file);

      String downloadURL = await ref.getDownloadURL();
      await firestore.collection('koleksi').add({
        'foto': downloadURL,
    
      });

      Get.snackbar(
        'Success',
        'Photo uploaded successfully',
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(seconds: 2),
        margin: EdgeInsets.all(12),
      );
    } catch (e) {
      print(e);
      Get.snackbar(
        'Error',
        'Failed to upload photo',
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(seconds: 2),
        margin: EdgeInsets.all(12),
      );
    }
  }
  void logout() async {
    await auth.signOut();
    Get.off(() => LoginView());
  }
}
