import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/create_controller.dart';

class CreateView extends GetView<CreateController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Input Koleksi ku'),
        centerTitle: true,
        backgroundColor: Colors.grey,
        elevation: 0,
      ),
      body: Padding(
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
                labelText: 'Nama Barang',
                border: OutlineInputBorder(),
              ),
              textInputAction: TextInputAction.next,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Nama harus diisi';
                }
                return null;
              },
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: controller.harga_barangController,
              decoration: InputDecoration(
                labelText: 'Harga Barang',
                border: OutlineInputBorder(),
              ),
              textInputAction: TextInputAction.next,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Alamat harus diisi';
                }
                return null;
              },
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: controller.descController,
              decoration: InputDecoration(
                labelText: 'Desc Barang',
                border: OutlineInputBorder(),
              ),
              textInputAction: TextInputAction.next,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Nomor Telepon harus diisi';
                }
                return null;
              },
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: controller.tahun_barangController,
              decoration: InputDecoration(
                labelText: 'Tahun Barang',
                border: OutlineInputBorder(),
              ),
              textInputAction: TextInputAction.next,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Tahun Barang harus diisi';
                }
                return null;
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.green, 
                onPrimary: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32.0),
                ),
                elevation: 3,
              ),
              onPressed: () {
                controller.addData(
                  controller.harga_barangController.text,
                  controller.nama_barangController.text,
                  controller.descController.text,
                  controller.tahun_barangController.text,
                );
              },
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                child: Text(
                  'Tambah Data Koleksi',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
