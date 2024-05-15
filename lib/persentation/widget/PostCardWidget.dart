import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:itclub/data/posts/PostModel.dart';
import 'package:itclub/data/posts/PostService.dart';
import 'package:itclub/persentation/post/AddPostView.dart';
import 'package:itclub/persentation/post/CommentView.dart';


class PostCardWidget extends StatelessWidget {
   PostCardWidget({super.key,  required this.item});
 final PostModel item;
 final PostService _postService = PostService() ;
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
                      GestureDetector(
                        onTap: (){

                        },
                        child: Container(
                            padding: EdgeInsets.all(4),
                          child: Column(
                            children: [
                              Text(item.likecount.toString()),

                              Icon(Icons.favorite, color: Colors.red,size: 30,)
                            ],
                          ),
                        ),
                      ),

                      Container(
                        padding: EdgeInsets.all(4),
                        child: Column(
                          children: [

                               FutureBuilder(
                                   future:  _postService.CommentsCount(item.id),
                                   builder: (context, commentSnapshot) {

                                     if (!commentSnapshot.hasData) {
                                       return Text(item.commentcount.toString(),
                                       );
                                     }else{

                                       int commentsCount = commentSnapshot.data!;
                                       return Text(commentsCount.toString());

                                     }






                                   }





                               ),





                            GestureDetector(
                                onTap: (){
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (ctx) => CommentView(PostId: item.id)));
                                },

                                child: Icon(Icons.comment, color: Colors.blue,size: 30,))
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
