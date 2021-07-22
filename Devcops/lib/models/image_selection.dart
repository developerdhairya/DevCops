import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ImageSelection {
  File _image;
  final picker = ImagePicker();
  Future getImagefromCamera() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);
    if (pickedFile != null) {
      _image = File(pickedFile.path);
      return _image;
    } else {
      print('No image selected.');
    }
  }

  Future uploadImage(File upload) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String aadharNo = prefs.getString('aadhar');
    UploadTask task;
    try {
      final fileName = basename(upload.path);
      final destination = 'files/$aadharNo/$fileName';
      final _storage = FirebaseStorage.instance.ref().child(destination);
      task = _storage.putFile(upload);
      if (task == null) {
        print('error uploading image');
        return null;
      }
      final snapshot = await task.whenComplete(() => {});
      final urlDownload = await snapshot.ref.getDownloadURL();
      return urlDownload;
    } catch (e) {
      print(e);
    }
  }

  Future getImagefromGallery() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      _image = File(pickedFile.path);
      return _image;
    } else {
      print('No image selected.');
    }
  }
}
