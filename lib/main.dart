import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tubes/destinasi.dart';
import 'package:tubes/homepage.dart';
import 'package:tubes/register.dart';
// Arpriansah Yonathan - 1301194112

Future <void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: 
    FirebaseOptions(
      apiKey: "AIzaSyB5fWTbsb2zITOjV4hStdEXmejEbvzQnIU", 
      appId: "1:110124755823:android:68047bd3b4c93338ae169a", 
      messagingSenderId: "110124755823", 
      projectId: "infocation-65081", 
      databaseURL: "https://infocation-65081-default-rtdb.firebaseio.com/",
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'infoCation',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromARGB(255, 255, 255, 255),
        ),
      ),
      home: homepage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Destinasi', style: 
          TextStyle(
            fontWeight: FontWeight.bold, 
            fontSize: 24,
            color: Color.fromARGB(255, 0, 0, 0),
          ),
        ),
        centerTitle: true,
        automaticallyImplyLeading: true,
        leading: IconButton(icon: 
          const Icon(Icons.arrow_back_ios),
          onPressed:() => Navigator.pop(context, false),
          color: Colors.black,
        ),
      ),
      body: SafeArea(
        child: Column(
          
        ),
      ),
    );
  }
}