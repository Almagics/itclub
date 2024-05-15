import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:itclub/data/material/materialService.dart';
import 'package:itclub/persentation/resources/color_manager.dart';
import 'package:itclub/persentation/resources/routes_manager.dart';
import 'package:itclub/persentation/resources/values_manager.dart';
import 'package:itclub/persentation/widget/app_text_form_filed.dart';




class MaterialAddView extends StatefulWidget {
  const MaterialAddView({super.key});

  @override
  State<MaterialAddView> createState() => _MaterialAddViewState();
}

class _MaterialAddViewState extends State<MaterialAddView> {

  final MaterialService _materialService = MaterialService();
  final  _store = FirebaseFirestore.instance;


  final idController = TextEditingController();
  final nameController = TextEditingController();

  final decController = TextEditingController();

  String? _imageUrl;

  String? _fileone;
  String? _filetow;

  final filenameController = TextEditingController();

  final fileurlController = TextEditingController();

  final filename2Controller = TextEditingController();

  final fileurl2Controller = TextEditingController();


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
        title: const Center(child: Text("New Material ", style: TextStyle(
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


                Container(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                    'Material Code',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),

                Container(padding: const EdgeInsets.all(AppPadding.p8),
                    child: AppTextFormFiled(
                      iconData: Icons.pending_actions,
                      controller: idController,
                      hintText: 'Enter material Code',




                    )),




                SizedBox(height: 5,),
                Container(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                    'Material Name',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),

                Container(padding: const EdgeInsets.all(AppPadding.p8),
                    child: AppTextFormFiled(
                      iconData: Icons.pending_actions,
                      controller: nameController,
                      hintText: 'Enter material name',



                    )),


                SizedBox(height: 5,),
                Container(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                    'Material Description',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),

                Container(padding: const EdgeInsets.all(AppPadding.p8),
                    child: AppTextFormFiled(
                      iconData: Icons.list_alt_sharp,
                      controller: decController,
                      hintText: 'Enter Material Description',
                      minLine: 5,
                      maxLine: 8,

                    )),





                SizedBox(height: 5,),




                Container(padding: const EdgeInsets.all(AppPadding.p8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,

                      children: [



                        Column(
                          children: [


                            _fileone != null
                                ? Center(child: Icon(Icons.check_circle,color: Colors.green,))
                                : Text('No file selected.'),
                            SizedBox(height: 20),
                            Center(
                              child: ElevatedButton(
                                onPressed: () async {
                                  PlatformFile? pickedFile = await _materialService.pickFile();
                                  if (pickedFile != null) {
                                    String? fileurl = await _materialService.uploadFile(pickedFile,"uploads/files/material/");
                                    if (fileurl != null) {
                                      setState(() {
                                        _fileone = fileurl;
                                      });
                                    }
                                  }
                                },

                                child: Icon(Icons.upload_file_sharp,color: Colors.white,),
                              ),
                            ),



                          ],
                        )

                      ],
                    )

                ),

                Container(padding: const EdgeInsets.all(AppPadding.p8),
                    child: AppTextFormFiled(
                      iconData: Icons.pending_actions,
                      controller: filenameController,
                      hintText: 'Enter file name',



                    )),


                SizedBox(height: 5,),




                Container(padding: const EdgeInsets.all(AppPadding.p8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,

                      children: [



                        Column(
                          children: [


                            _filetow != null
                                ? Center(child: Icon(Icons.check_circle,color: Colors.green,))
                                : Text('No file selected.'),
                            SizedBox(height: 20),
                            Center(
                              child: ElevatedButton(
                                onPressed: () async {
                                  PlatformFile? pickedFile = await _materialService.pickFile();
                                  if (pickedFile != null) {
                                    String? fileurl = await _materialService.uploadFile(pickedFile,"uploads/files/material/");
                                    if (fileurl != null) {
                                      setState(() {
                                        _filetow = fileurl;
                                      });
                                    }
                                  }
                                },

                                child: Icon(Icons.upload_file_sharp,color: Colors.white,),
                              ),
                            ),



                          ],
                        )

                      ],
                    )

                ),

                Container(padding: const EdgeInsets.all(AppPadding.p8),
                    child: AppTextFormFiled(
                      iconData: Icons.pending_actions,
                      controller: filename2Controller,
                      hintText: 'Enter file name',



                    )),


                SizedBox(height: 5,),
                Container(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                    'Material Photo',
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
                                String? imageUrl = await _materialService.uploadImageToFirebase(pickedImage,"uploads/images/material/");
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
                          _saveMaterial();
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
          title: const Text('Registration Error'),
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





  void _saveMaterial() async{



    int id = int.parse(idController.text) ;

    String name = nameController.text;
    String desc = decController.text;
    String? img = _imageUrl;
    String? filename = filenameController.text;
    String? filename2 = filename2Controller.text;







try{

  var result =    await _store.collection("Material")
      .doc(name)
      .set({

    "id":id,
    "name":name,
    "desc":desc,

    "createdate":DateTime.now().toString(),

    "imgUrl":img,

    "file_name":filename,
    "fileurl": _fileone,
    "file_name2": filename2,
    "file_url2":_filetow,


  });

  print("User is successfully login");


  print("User is successfully created");

  Navigator.pushReplacementNamed(context, Routes.materialList);


}catch(e){

  _displayDialog('Failed to add data: $e');

}















  }




}
