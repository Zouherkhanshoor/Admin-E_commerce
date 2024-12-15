import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:test_app/core/constant/color.dart';

imageUploadCamera() async {
  final ImagePicker picker = ImagePicker();
  final XFile? file = await picker.pickImage(source: ImageSource.camera);
  if (file != null) {
    return File(file.path);
  } else {
    return null;
  }
}

fileUploadGallery([issvg = false]) async {
  FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: issvg
          ? ["svg", "SVG"]
          : ["png", "PNG", "jpg", "JPG", "jpeg", "JPEG", "gif", "GIF"]);
  if (result != null) {
    return File(result.files.single.path!);
  } else {
    return null;
  }
}

showbottommenu(imageUploadCamera(), fileUploadGallery()) {
  Get.bottomSheet(
      Directionality(
          textDirection: TextDirection.rtl,
          child: Container(
            padding: const EdgeInsets.all(10),
            height: 200,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(
                  child: Text(
                    "Choose image",
                    style: TextStyle(
                        fontSize: 22,
                        color: AppColor.primarycolor,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 10),
                ),
                ListTile(
                  onTap: () {
                    imageUploadCamera();
                    Get.back();
                  },
                  leading: const Icon(
                    Icons.camera_alt_outlined,
                    size: 40,
                  ),
                  title: const Text(
                    "image From Camera",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                ListTile(
                  onTap: () {
                    fileUploadGallery();
                    Get.back();
                  },
                  leading: const Icon(
                    Icons.camera_alt_outlined,
                    size: 40,
                  ),
                  title: const Text(
                    "image From Galery",
                    style: TextStyle(fontSize: 20),
                  ),
                )
              ],
            ),
          )),
      backgroundColor: Colors.white);
}
