import 'package:flutter/material.dart';


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:itclub/data/material/materialService.dart';
import 'package:itclub/data/posts/PostService.dart';
import 'package:itclub/persentation/post/PostListView.dart';
import 'package:itclub/persentation/resources/color_manager.dart';
import 'package:itclub/persentation/resources/routes_manager.dart';
import 'package:itclub/persentation/resources/values_manager.dart';
import 'package:itclub/persentation/widget/app_text_form_filed.dart';
import 'package:uuid/uuid.dart';




class PostAddView extends StatefulWidget {
  const PostAddView({super.key});

  @override
  State<PostAddView> createState() => _PostAddViewState();
}

class _PostAddViewState extends State<PostAddView> {

  final PostService _materialService = PostService();
  final  _store = FirebaseFirestore.instance;



  final contentController = TextEditingController();



  String? _imageUrl;





  final _formKey = GlobalKey<FormState>();



  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: ColorManager.venus,
        leading: IconButton(
          icon: Icon(Icons.arrow_back,color: ColorManager.white,),
          onPressed: () {

            Navigator.pushReplacementNamed(context, Routes.newhome);// Navigate back to the previous screen
          },
        ),
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: ColorManager.venus,
            statusBarBrightness: Brightness.light
        ),

        elevation: 0.0,
        title: const Center(child: Text("New Post ", style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),)),
      ),

      body:  SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [









                SizedBox(height: 5,),
                Container(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                    'Post Content',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),

                Container(padding: const EdgeInsets.all(AppPadding.p8),
                    child: AppTextFormFiled(
                      iconData: Icons.list_alt_sharp,
                      controller: contentController,
                      hintText: 'Enter Material Description',
                      minLine: 5,
                      maxLine: 8,

                    )),





                SizedBox(height: 5,),







                SizedBox(height: 5,),
                Container(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                    'Post Photo',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),












                SizedBox(height: 5,),



                Container(padding: const EdgeInsets.all(AppPadding.p8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,

                      children: [

                        _imageUrl != null
                            ? Image.network(_imageUrl!)
                            : Text('No image selected.'),
                        SizedBox(height: 20),
                        Center(
                          child: ElevatedButton(
                            onPressed: () async {
                              XFile? pickedImage = await _materialService.pickImage();
                              if (pickedImage != null) {
                                String? imageUrl = await _materialService.uploadImageToFirebase(pickedImage,"uploads/images/post/");
                                if (imageUrl != null) {
                                  setState(() {
                                    _imageUrl = imageUrl;
                                  });
                                }
                              }
                            },

                            child: Icon(Icons.add_photo_alternate,color: Colors.white,),
                          ),
                        ),
                      ],
                    )

                ),

















                const SizedBox(height: 20,),
                Container(
                  padding: const EdgeInsets.fromLTRB(3,0,3,0),
                  child: Center(
                    child: SizedBox(width: 380,height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          // Navigator.pushReplacementNamed(context, Routes.payment);
                          _savePost();
                        },


                        style: Theme.of(context).elevatedButtonTheme.style,
                        child: const Text('Save',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold

                          ),


                        ),

                      ),
                    ),
                  ),
                ),

                SizedBox(height: 5,),


              ],
            ),
          )
      ),
    );
  }



  void _displayDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Save  Error'),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }





  void _savePost() async{



    String id = Uuid().v4();  ;

    String content = contentController.text;

    String? img = _imageUrl;
    String? username = 'admin';








    try{

      var result =    await _store.collection("Post")
          .doc(id)
          .set({

        "id":id,
        "content":content,


        "createdate":DateTime.now().toString(),

        "picurl":img,

        "username":username,
        "commentcount": 0,
        "likecount": 0,



      });

      print("data saved successfully ");




      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (ctx) => PostListView()));


    }catch(e){

      _displayDialog('Failed to add data: $e');

    }















  }




}
