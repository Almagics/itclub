import 'package:flutter/services.dart';

import 'package:flutter/material.dart';
import 'package:itclub/data/firebase_auth/userModel.dart';

import '../../data/firebase_auth/firebase_auth_service.dart';


import '../resources/color_manager.dart';
import '../resources/routes_manager.dart';





class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}



class _ProfileState extends State<Profile> {

  final FirebaseAuthService userdata = FirebaseAuthService();
  UserModel? data;

  @override
  void initState() {
    super.initState();
    fetchData();
  }


  Future<void> fetchData() async {
    var email = await userdata.getEmail();


    print('email isssssssss : ${email}');


    UserModel? newData = await userdata.getUserInfoByEmail(email!);


    // new UserModel(address: "judah", email: 'user@mail.com', fullName: 'ahmed ali', password: 'ahmed@99', phoneNumber: '05632326996', role: 'user', username: 'user@mail.com', serviceType: '', gender: '');

    setState(() {
      data = newData;
    });
  }


  @override
  Widget build(BuildContext context) {
    double widthC = MediaQuery.of(context).size.width * 100;
    return Scaffold(

      backgroundColor: Colors.grey.shade50,
      body: data != null
          ?  SingleChildScrollView(
        child: Directionality(
          textDirection: TextDirection.ltr,
          child: Column(
            children: <Widget>[

              _buildHeader(context, widthC),

              SizedBox(height: 10.0),


              _buildInfo(context, widthC),
            ],
          ),
        ),
      )
          :const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(

            child: Center(
              child: CircularProgressIndicator(),
            ),
          ),
        ],
      ),

    );
  }

  Widget _buildHeader(BuildContext context, double width) {
    return Stack(
      children: <Widget>[
        Ink(
          height: 250,
          color: ColorManager.primary,
        ),
        Container(
          width: double.infinity,
          margin: const EdgeInsets.only(top: 50),
          child: Column(
            children: <Widget>[
              Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
                color: ColorManager.primary,
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(
                      color: Colors.white,
                      width: 6.0,
                    ),
                  ),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(80),
                      child: Image.network(
                          'https://firebasestorage.googleapis.com/v0/b/itclub-892e4.appspot.com/o/uploads%2Fimages%2F3135715.png?alt=media&token=4982a746-12ef-417a-afa3-820be50658f2',
                          width: 80,
                          height: 80,
                          fit: BoxFit.fill)),
                ),
              ),
              _buildMainInfo(context, width)
            ],
          ),
        ),

      ],
    );
  }



  Widget _buildMainInfo(BuildContext context, double width) {
    return Container(
      width: width,
      margin: const EdgeInsets.all(10),
      alignment: AlignmentDirectional.center,
      child: Column(
        children: <Widget>[
          Text(data!.fullName,
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.teal,
                  fontWeight: FontWeight.bold)),
          SizedBox(height: 10),
          Text(data!.role,
              style: TextStyle(
                  color: Colors.grey.shade50, fontStyle: FontStyle.italic))
        ],
      ),
    );
  }
//hhh
  Widget _buildInfo(BuildContext context, double width) {
    return Container(
        padding: EdgeInsets.all(10),
        child: Card(
          color: Colors.white,
          child: Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.all(15),
            child: Column(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    ListTile(
                      leading:
                      Icon(Icons.email, color: ColorManager.primary),
                      title: const Text("E-mail",
                          style: TextStyle(fontSize: 18, color: Colors.black)),
                      subtitle:  Text(data!.email,
                          style:
                          TextStyle(fontSize: 15, color: Colors.black54)),
                    ),
                    Divider(),

                    ListTile(
                      leading:
                      Icon(Icons.person, color: ColorManager.primary),
                      title: const Text("Info",
                          style: TextStyle(fontSize: 18, color: Colors.black)),
                      subtitle:  Text(
                          data!.role,
                          style:
                          TextStyle(fontSize: 15, color: Colors.black54)),
                    ),
                    Divider(),

                    ListTile(
                      contentPadding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                      leading: Icon(Icons.exit_to_app,
                          color: ColorManager.primary),
                      title: const Text("LogOut",
                          style: TextStyle(fontSize: 18, color: Colors.black)),
                      subtitle: Text('',
                          style:
                          TextStyle(fontSize: 15, color: Colors.black54)),
                    ),
                  ],
                )
              ],
            ),
          ),
        ));
  }


}







