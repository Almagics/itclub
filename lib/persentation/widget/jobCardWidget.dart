import 'package:flutter/material.dart';
import 'package:itclub/data/job/jobModel.dart';




class JobCardWidget extends StatelessWidget {
  const JobCardWidget({super.key, required this.item});



  final JobModel item;



  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      margin: EdgeInsets.all(16.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        children: [
          // Image at the top of the card, stretched to fill
          Image(
            image: NetworkImage(item.picurl),
            width: double.infinity,
            height: 150.0,

            fit: BoxFit.cover,
            //  fit: BoxFit.cover,
          ),


          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Column(
                children: [
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(16.0),
                        child: Center(
                          child: Text(
                            item.content,
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(16.0),
                        child: Center(
                          child: Text(
                            "Company Name : ${item.company}",
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  Row(

                    children: [
                      GestureDetector(
                        onTap: (){

                        },
                        child: Container(
                          padding: EdgeInsets.all(4),
                          child: Column(
                            children: [


                              Icon(Icons.call, color: Colors.red,size: 30,)
                            ],
                          ),
                        ),
                      ),

                      Container(
                        padding: EdgeInsets.all(4),
                        child: Column(
                          children: [







                            GestureDetector(
                                onTap: (){


                                },

                                child: Icon(Icons.email, color: Colors.blue,size: 30,))
                          ],
                        ),
                      )


                    ],
                  )

                ],
              )







            ],
          )
          // Text at the bottom of the card, centered with shadow

        ],
      ),
    );
  }
}
