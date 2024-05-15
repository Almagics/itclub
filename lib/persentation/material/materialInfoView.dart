import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:itclub/data/material/materialModel.dart';
import 'package:itclub/data/material/materialService.dart';
import 'package:itclub/persentation/resources/color_manager.dart';
import 'package:itclub/persentation/resources/routes_manager.dart';


class MaterialInfoView extends StatefulWidget {
  const MaterialInfoView({super.key, required this.data});
final MaterialModel  data;


  @override
  State<MaterialInfoView> createState() => _MaterialInfoViewState();
}

class _MaterialInfoViewState extends State<MaterialInfoView> {

  final MaterialService _materialService = MaterialService();
  @override
  Widget build(BuildContext context) {
    double widthC = MediaQuery.of(context).size.width * 100;
    return Scaffold(


        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(Icons.arrow_back,color: ColorManager.primary,),
            onPressed: () {
              Navigator.pushReplacementNamed(context, Routes.newhome);// Navigate back to the previous screen
            },
          ),
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: ColorManager.primary,
              statusBarBrightness: Brightness.light
          ),

          elevation: 0.0,
          title: Center(child: Text("Material : ${widget.data.name}",style: Theme.of(context).textTheme.titleLarge,)),
        ),
        backgroundColor: Colors.grey.shade50,
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[

              _buildHeader(context, widthC),

              SizedBox(height: 10.0),


              _buildInfo(context, widthC),
            ],
          ),
        ));
  }

  Widget _buildHeader(BuildContext context, double width) {
    return Stack(
      children: <Widget>[
        Ink(
          height: 250,
          color: ColorManager.venus,
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
                color: ColorManager.venus,
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
                          widget.data.imgUrl,
                          width: 150,
                          height: 150,
                          fit: BoxFit.fill)),
                ),
              ),
              _buildMainInfo(context, width)
            ],
          ),
        ),
        Container(
            margin: const EdgeInsets.only(top: 210),
            child: _buildInfoCard(context))
      ],
    );
  }

  Widget _buildInfoCard(context) {
    return Column(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
          child: Card(
            elevation: 5.0,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 16.0, bottom: 16.0, right: 10.0, left: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Count Files',
                        style: new TextStyle(
                            fontSize: 18.0,
                            color: Colors.black,
                            fontWeight: FontWeight.w400),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 6.0),
                        child: Text(
                          '2',
                          style: TextStyle(
                              fontSize: 18.0,
                              color: Color(0Xffde6262),
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),

                ],
              ),
            ),
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
          Text(widget.data.name,
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.teal,
                  fontWeight: FontWeight.bold)),

        ],
      ),
    );
  }

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
                      title:  Text("Description",
                          style: TextStyle(fontSize: 18, color: Colors.black)),
                      subtitle:  Text(widget.data.desc,
                          style:
                          TextStyle(fontSize: 15, color: Colors.black54)),
                    ),
                    Divider(),





                    const SizedBox(height: 20,),
                    Container(
                      padding: const EdgeInsets.fromLTRB(3,0,3,0),
                      child: Center(
                        child: SizedBox(width: 380,height: 50,
                          child: ElevatedButton(
                            onPressed: () async {
                              if (widget.data.fileurl != null) {
                                await _materialService.downloadFile(widget.data.fileurl, widget.data.file_name) ;
                              }
                            },


                            style: Theme.of(context).elevatedButtonTheme.style,
                            child:  Text('Download ${widget.data.file_name}' ,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold

                              ),


                            ),

                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20,),
                    Container(
                      padding: const EdgeInsets.fromLTRB(3,0,3,0),
                      child: Center(
                        child: SizedBox(width: 380,height: 50,
                          child: ElevatedButton(
                            onPressed: () async {
                              if (widget.data.file_name2 != null) {
                                await _materialService.downloadFile(widget.data.file_url2, widget.data.file_name2) ;
                              }
                            },


                            style: Theme.of(context).elevatedButtonTheme.style,
                            child:  Text('Download ${widget.data.file_name2}' ,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold

                              ),


                            ),

                          ),
                        ),
                      ),
                    ),

                  ],
                )
              ],
            ),
          ),
        ));
  }


}
