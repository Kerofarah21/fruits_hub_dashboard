import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart' as b;

import 'storage_service.dart';

class FireStorage implements StorageService {
  final storage = FirebaseStorage.instance;

  @override
  Future<String> uploadFile(String path, File file) async {
    final filename = b.basename(file.path);
    final extension = b.extension(file.path);
    var fileRef = storage.ref().child('$path/$filename$extension');

    var result = await fileRef.putFile(file);
    var fileUrl = await result.ref.getDownloadURL();

    return fileUrl;
  }
}
