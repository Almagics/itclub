import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:itclub/data/material/materialModel.dart';
import 'package:itclub/data/material/materialService.dart';
import 'package:itclub/persentation/material/MaterialAddView.dart';
import 'package:itclub/persentation/resources/color_manager.dart';
import 'package:itclub/persentation/resources/routes_manager.dart';
import 'package:itclub/persentation/widget/materialCard.dart';





class MaterialListView extends StatefulWidget {
  const MaterialListView({super.key});

  @override
  State<MaterialListView> createState() => _MaterialListViewState();
}









class _MaterialListViewState extends State<MaterialListView> {
  final MaterialService _materialService = MaterialService();










  @override
  Widget build(BuildContext context) {
    return Scaffold(

      floatingActionButton: FloatingActionButton(
        onPressed: () {

          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (ctx) => MaterialAddView()));
        },


        child: Icon(Icons.add),
        backgroundColor: ColorManager.venus,
      ),

      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back,color: ColorManager.primary,),
          onPressed: () {
            Navigator.pushReplacementNamed(context, Routes.newhome);// Navigate back to the previous screen
          },
        ),
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: ColorManager.venus,
            statusBarBrightness: Brightness.light
        ),

        elevation: 0.0,
        title: Center(child: Text("Material List",style: Theme.of(context).textTheme.titleLarge,)),
      ),

      body: FutureBuilder<List<MaterialModel>>(
        future: _materialService.materialListData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
            final data = snapshot.data;

            // Display data in a ListView or other widget
            return  GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, crossAxisSpacing: 20, mainAxisSpacing: 20,childAspectRatio: .75),
              padding: const EdgeInsets.all(8),
              shrinkWrap: true,



              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                    onTap: (){
                    //  Navigator.pushReplacementNamed(context, Routes.ordernew);

                    },

                    child: MaterialCardWithImageAndText(item: snapshot.data![index]));
              },
            );
          } else {
            return Center(child: Text('No data found for'));
          }
        },
      ),

    );


  }













}
