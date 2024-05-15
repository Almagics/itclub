import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:itclub/data/posts/PostModel.dart';
import 'package:itclub/data/posts/PostService.dart';
import 'package:itclub/persentation/post/AddPostView.dart';
import 'package:itclub/persentation/resources/color_manager.dart';
import 'package:itclub/persentation/resources/routes_manager.dart';
import 'package:itclub/persentation/widget/PostCardWidget.dart';



class PostListView extends StatefulWidget {
  const PostListView({super.key});

  @override
  State<PostListView> createState() => _PostListViewState();
}

final PostService _postService = PostService();

class _PostListViewState extends State<PostListView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      floatingActionButton: FloatingActionButton(
        onPressed: () {

          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (ctx) => PostAddView()));
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
        title: Center(child: Text('Feed',style: Theme.of(context).textTheme.labelLarge,)),
      ),

      body: Column(
        children: [
          FutureBuilder<List<PostModel>>(

              future: _postService.postListData(),


            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                // While data is being fetched
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                // If an error occurs
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (snapshot.data == null || snapshot.data!.isEmpty) {
                // If no data is available
                return Center(child: Text('No feed available'));
              } else {
                // If data is available, display the list of doctors
                return Expanded(
                  child: ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      PostModel item = snapshot.data![index];
                      return PostCardWidget(item:item);
                    },
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
