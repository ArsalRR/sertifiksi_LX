import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/update_controller.dart';

class UpdateView extends GetView<UpdateController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Informasi Profil'),
        centerTitle: true,
        backgroundColor: Colors.grey,
        elevation: 0,
      ),
      body: FutureBuilder<DocumentSnapshot<Object?>>(
        future: controller.getData(Get.arguments),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            var data = snapshot.data!;
            controller.nama_barangController.text = data['nama_barang'];
            controller.harga_barangController.text = data['harga_barang'];
            controller.descController.text = data['desc'];
            controller.tahun_barangController.text = data['tahun_barang'];
            controller.fotoController.text = data['foto'];
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView(
                children: [
                  SizedBox(height: 20),
                  GestureDetector(
                    onTap: controller.pickImage,
                    child: CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.grey[200],
                      backgroundImage: controller.image != null ? FileImage(controller.image!) : null,
                      child: controller.image == null ? Icon(Icons.camera_alt, size: 40, color: Colors.grey[800]) : null,
                    ),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: controller.nama_barangController,
                    decoration: InputDecoration(
                      labelText: 'Harga Barang',
                      border: OutlineInputBorder(),
                    ),
                    textInputAction: TextInputAction.next,
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: controller.harga_barangController,
                    decoration: InputDecoration(
                      labelText: 'Nama Barang',
                      border: OutlineInputBorder(),
                    ),
                    textInputAction: TextInputAction.next,
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: controller.descController,
                    decoration: InputDecoration(
                      labelText: 'Desc Barang',
                      border: OutlineInputBorder(),
                    ),
                    textInputAction: TextInputAction.next,
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: controller.tahun_barangController,
                    decoration: InputDecoration(
                      labelText: 'Tahun Barang',
                      border: OutlineInputBorder(),
                    ),
                    textInputAction: TextInputAction.next,
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue, 
                      onPrimary: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32.0),
                      ),
                      elevation: 3,
                    ),
                    onPressed: () {
                      controller.updateData(
                        Get.arguments,
                        controller.nama_barangController.text,
                        controller.harga_barangController.text,
                        controller.descController.text,
                        controller.fotoController.text,
                        controller.tahun_barangController.text,
                      );
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                      child: Text(
                        'Simpan Perubahan',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
