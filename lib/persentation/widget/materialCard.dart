import 'package:flutter/material.dart';
import 'package:itclub/data/material/materialModel.dart';
import 'package:itclub/persentation/material/materialInfoView.dart';


class MaterialCardWithImageAndText extends StatelessWidget {
  final MaterialModel item;

  MaterialCardWithImageAndText({required this.item});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){

        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (ctx) => MaterialInfoView(data: item,)));


      },
      child: Card(
        elevation: 4.0,
        margin: EdgeInsets.all(16.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Column(
          children: [
            // Image at the top of the card, stretched to fill
            Image(
              image: NetworkImage(item.imgUrl),
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.17,

              fit: BoxFit.cover,
              //  fit: BoxFit.cover,
            ),


            Row(
      mainAxisAlignment: MainAxisAlignment.center,
              children: [



                Container(
                  padding: EdgeInsets.all(5.0),
                  child: Center(
                    child: Text(
                      item.name,
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),


              ],
            )
            // Text at the bottom of the card, centered with shadow

          ],
        ),
      ),
    );
  }
}