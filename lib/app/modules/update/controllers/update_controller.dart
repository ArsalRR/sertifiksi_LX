import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class UpdateController extends GetxController {
late TextEditingController nama_barangController;
  late TextEditingController harga_barangController;
  late TextEditingController descController;
  late TextEditingController tahun_barangController;
  late TextEditingController fotoController;
  File? _image;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  File? get image => _image;


  @override
  void onInit() {
    nama_barangController = TextEditingController();
    harga_barangController = TextEditingController();
    descController = TextEditingController();
    tahun_barangController = TextEditingController();
    fotoController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    nama_barangController.dispose();
    harga_barangController.dispose();
    descController.dispose();
    tahun_barangController.dispose();
    fotoController.dispose();
    super.onClose();
  }

  Future<void> pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      _image = File(pickedFile.path);
      update();
    }
  }

  Future<DocumentSnapshot<Object?>> getData(String docID) async {
    DocumentReference docRef = firestore.collection('koleksi').doc(docID);
    DocumentSnapshot<Object?> snapshot = await docRef.get();
    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;

    nama_barangController.text = data['nama_barang'];
    harga_barangController.text = data['harga_barang'];
    descController.text = data['desc'];
    tahun_barangController.text = data['tahun_barang'];
    fotoController.text = data['foto'];

    return snapshot;
  }

  void updateData(String docID, String nama_barang, String harga_barang, String tahun_barang, String desc, String foto) async {
    try {
      String newFoto = _image != null ? _image!.path : foto;

      await firestore.collection('koleksi').doc(docID).update({
        'nama_barang': nama_barang,
        'harga_barang': harga_barang,
        'tahun_barang': tahun_barang,
        'desc': desc,
        'foto': newFoto,
      });

      Get.back();
      Get.snackbar(
        'Success',
        'Data Berhasil Diedit',
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(seconds: 2),
        margin: EdgeInsets.all(12),
      );
    } catch (e) {
      print(e);
      Get.snackbar(
        'Error',
        'Gagal Mengedit Data',
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(seconds: 2),
        margin: EdgeInsets.all(12),
      );
    }
  }
}
