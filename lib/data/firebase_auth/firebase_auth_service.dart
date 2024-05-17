


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:itclub/data/firebase_auth/userModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FirebaseAuthService{

  FirebaseAuth _auth = FirebaseAuth.instance;


//sign up
  Future<User?> signupWithEmailAndPassword(String email,String password) async{


    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password
      );

      if(userCredential.user !=null){

        return userCredential.user;
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }

    return null;

  }

//sign in
  Future<User?> signInWithEmailAndPassword(String email,String password) async {
    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return credential.user;
    } catch (e) {
      print(e);
    }

    return null;
  }



  Future<bool> signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      return true;
    } catch (e) {
      print("Error signing out: $e");
      return false;
    }

  }

  Future<UserModel?> getUserInfoByEmail(String email) async {
    try {
      // Assuming your collection is named 'Users' and has an 'Email' field
      QuerySnapshot<Map<String, dynamic>> querySnapshot = await FirebaseFirestore.instance
          .collection('Users')
          .where('email', isEqualTo: email)
          .limit(1) // Assuming there is only one user with a given email
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        // Document(s) exist, return the data of the first document as a User
        var doc = querySnapshot.docs.first;
        return UserModel.fromMap(doc.data(), doc.id);
      } else {
        // Document doesn't exist
        return null;
      }
    } catch (e) {
      print("Error: $e");
      // Handle error
      return null;
    }
  }



  Future<void> storeUserInfoLocally(String? userId, String? username,
      String? email, String? name,String? role) async {



    print('rooole2222: ${role}');




    //clearSharedPreferences();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('userId', userId ?? '');
    prefs.setString('username', username ?? '');
    prefs.setString('email', email ?? '');
    prefs.setString('name', name ?? '');
    prefs.setString('role', role ?? '');



    var testrole = prefs.getString('role');

    print('rooole333: ${role}');

  }









  void clearSharedPreferences() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.clear();
    print("SharedPreferences cleared");
  }


  Future<String?> getUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('userId');
  }

  Future<String?> getUsername() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('username');
  }


  Future<String?> getEmail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('email');
  }


  Future<String?> getName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('name');
  }

  Future<String?> getRole() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('role');
  }





}