import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class CreateController extends GetxController {
  late TextEditingController nama_barangController;
  late TextEditingController harga_barangController;
  late TextEditingController descController;
  late TextEditingController tahun_barangController;
  File? _image;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  File? get image => _image;

  @override
  void onInit() {
    nama_barangController = TextEditingController();
    harga_barangController = TextEditingController();
    descController = TextEditingController();
    tahun_barangController = TextEditingController();
    super.onInit();
  }

  get formKey => null;

  Future<void> pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      _image = File(pickedFile.path);
      update();
    }
  }

  void addData(String nama_barang, String harga_barang, String desc, String tahun_barang) async {
    try {
      String foto = _image != null ? _image!.path : '';

      await firestore.collection('koleksi').add({
        'nama_barang': nama_barang,
        'harga_barang': harga_barang,
        'desc': desc,
        'tahun_barang': tahun_barang,
        'foto': foto
      });

      Get.back();
      Get.snackbar(
        'Success',
        'Data added successfully',
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(seconds: 2),
        margin: EdgeInsets.all(12),
      );
      nama_barangController.clear();
      harga_barangController.clear();
      descController.clear();
      tahun_barangController.clear();
      _image = null;
    } catch (e) {
      print(e);
    }
  }
}
