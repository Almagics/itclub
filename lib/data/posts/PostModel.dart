

class PostModel{


  final String id;
  final String content;
  final String picurl;
  final String createdate;
  final String username;
  final int commentcount;
  final int likecount;








  PostModel( {
    required this.id,
    required this.content,
    required this.picurl,
    required this.createdate,
    required this.username,
    required this.commentcount,
    required this.likecount,





  });


  factory PostModel.fromMap(Map<String, dynamic> map) {
    return PostModel(
        id: map['id'],
        content:map['content'],
        picurl:map['picurl'],
        createdate:map['createdate'],
        username:map['username'],
        commentcount:map['commentcount'],
        likecount: map['likecount'],

    );
  }




}