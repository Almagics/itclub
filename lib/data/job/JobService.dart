

class JobModel{


  final String id;
  final String content;
  final String picurl;
  final String createdate;
  final String username;
  final String phone;
  final String email;

  final String company;








  JobModel( {
    required this.id,
    required this.content,
    required this.picurl,
    required this.createdate,
    required this.username,
    required this.phone,
    required this.email,
    required this.company,





  });


  factory JobModel.fromMap(Map<String, dynamic> map) {
    return JobModel(
      id: map['id'],
      content:map['content'],
      picurl:map['picurl'],
      createdate:map['createdate'],
      username:map['username'],
      phone:map['phone'],
      email: map['email'],
      company: map['company'],


    );
  }




}