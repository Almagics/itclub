

class MaterialModel{


  final int id;
  final String name;
  final String desc;
  final String createdate;
  final String imgUrl;
  final String file_name;
  final String fileurl;
  final String file_name2;
  final String file_url2;







  MaterialModel( {
    required this.id,
    required this.name,
    required this.desc,
    required this.createdate,
    required this.imgUrl,
    required this.file_name,
    required this.fileurl,
    required this.file_name2,
    required this.file_url2




  });


  factory MaterialModel.fromMap(Map<String, dynamic> map) {
    return MaterialModel(
        id: map['id'],
        name:map['name'],
        desc:map['desc'],
        createdate:map['createdate'],
        imgUrl:map['imgUrl'],
        file_name:map['file_name'],
        fileurl: map['fileurl'],
        file_name2: map['file_name2'],
        file_url2: map['file_url2']
    );
  }




}