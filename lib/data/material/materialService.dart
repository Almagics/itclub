import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

import 'package:itclub/data/material/materialModel.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:io';

import 'package:uuid/uuid.dart';



class MaterialService{



  Future<bool> NewOrder(


   int id,
   String name,
   String desc,
   String createdate,
   String imgUrl,
   String file_name,
   String fileurl,
   String file_name2,
   String file_url2,




      ) async{
    final  store = FirebaseFirestore.instance;




    await store.collection("Material")

        .add({

      "id":id,
      "name":name,
      "desc":desc,

      "createdate":createdate,

      "imgUrl":imgUrl,

      "file_name":file_name,
      "fileurl":fileurl,
      "file_name2":file_name2,
      "file_url2":file_url2,




    }).then((DocumentReference document) {
      print('Document added with ID: ${document.id}');
      return true;
    }).catchError((error) {
      print('Error adding document: $error');
      return false;
    });;


    return false;


  }


  Future<List<MaterialModel>> materialListData() async {
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;

    QuerySnapshot querySnapshot = await _firestore
        .collection('Material')

        .get();

    return querySnapshot.docs.map((doc) => MaterialModel(
        id: doc['id'],
        name:doc['name'],
        desc:doc['desc'],
        createdate:doc['createdate'],
        imgUrl:doc['imgUrl'],
        file_name:doc['file_name'],
        fileurl: doc['fileurl'],
        file_name2: doc['file_name2'],
        file_url2: doc['file_url2']


      // Map other fields here
    )).toList();
  }


  Future<XFile?> pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    return image;
  }
  Future<String?> uploadImageToFirebase(XFile image, String url) async {
    try {
      String fileName = url +  '${DateTime.now().millisecondsSinceEpoch}.${image.path.split('.').last}';
      Reference ref = FirebaseStorage.instance.ref().child(fileName);
      UploadTask uploadTask = ref.putFile(File(image.path));
      TaskSnapshot snapshot = await uploadTask;
      String downloadUrl = await snapshot.ref.getDownloadURL();
      return downloadUrl;
    } catch (e) {
      print(e);
      return null;
    }
  }


  Future<String> uploadFile(PlatformFile file, String url) async {
    if (file.path != null) {
      File uploadFile = File(file.path!);
      String uniqueFileName = Uuid().v4(); // Generate a unique name using UUID
      String fileExtension = file.extension ?? '';

      try {
        // Upload to Firebase Storage with unique name
        TaskSnapshot snapshot = await FirebaseStorage.instance
            .ref(url + '$uniqueFileName.$fileExtension')
            .putFile(uploadFile);

        String downloadUrl = await snapshot.ref.getDownloadURL();

        return downloadUrl;
      } catch (e) {
        print('Error uploading file: $e');
        return e.toString();
      }
    }

    return  '';
  }




  Future<PlatformFile?> pickFile() async {
    // Pick any type of file
    final FilePickerResult? result = await FilePicker.platform.pickFiles();

    // If the user canceled the picker, result will be null
    return result?.files.first;
  }



  Future<String?> downloadFile(String url, String fileName) async {

    var status = await Permission.storage.status;
    if (!status.isGranted) {
      await Permission.storage.request();
    }

      // Get the temporary directory
      Directory tempDir = await getTemporaryDirectory();
      String tempPath = tempDir.path;

      // Create a Dio instance
      Dio dio = Dio();

      // Download the file
      String savePath = '$tempPath/$fileName';
      await dio.download(url, savePath);

      print(savePath);

      return savePath; // Return the file path

     // print('Error downloading file: $e');
     // return null;

  }



}