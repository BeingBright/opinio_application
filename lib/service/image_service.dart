import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:opinio_application/mixin/firebase_database_reference.dart';
import 'package:uuid/uuid.dart';

class ImageService with FirebaseDatabaseReference {
  static final ImageService _instance = ImageService._internal();

  ImageService._internal() {
    _storageReference = FirebaseStorage.instance.ref("images");
  }

  factory ImageService() => _instance;

  late Reference _storageReference;

  Future<Uint8List?> getRawImage() async {
    FilePickerResult? result =
        await FilePicker.platform.pickFiles(type: FileType.image);

    if (result == null) return null;
    PlatformFile file = result.files.first;
    return file.bytes;
  }

  Future<List<String>> uploadImage(List<Uint8List> images) async {
    var userID = FirebaseAuth.instance.currentUser?.uid ?? "";
    List<String> imageNames = [];
    for (var bytes in images) {
      var name = const Uuid().v4();
      await _storageReference.child(userID).child("$name.png").putData(
            bytes,
            SettableMetadata(
              contentType: "image/png",
              customMetadata: {"userID": userID},
            ),
          );

      imageNames.add(await _storageReference
          .child(userID)
          .child("$name.png")
          .getDownloadURL());
    }

    return imageNames;
  }
}



// await _storageReference.child(userID).child("$imageName.jpeg").putData(
    //       bytes,
    //       SettableMetadata(
    //         contentType: "image/jpeg",
    //       ),
    //     );

    // return await _storageReference
    //     .child(userID)
    //     .child("$imageName.jpeg")
    //     .getDownloadURL();