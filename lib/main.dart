
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:itclub/firebase_options.dart';

import 'app/app.dart';


void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  FirebaseApp app = await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp( MyApp());
}

