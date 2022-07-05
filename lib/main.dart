import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tubes/destinasi.dart';
import 'package:tubes/homepage.dart';
import 'package:tubes/login.dart';
import 'package:tubes/register.dart';
// Arpriansah Yonathan - 1301194112

Future <void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: 
    FirebaseOptions(
      apiKey: "AIzaSyBf63lXOGjCmuwGQ1Gk6HcsDxoWatCpE60", 
      appId: "1:318401057630:android:2133e2811b515a337735cf", 
      messagingSenderId: "318401057630", 
      projectId: "infocation-4c888", 
      databaseURL: "https://infocation-4c888-default-rtdb.firebaseio.com/",
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
        primarySwatch: Colors.brown,
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromARGB(255, 255, 255, 255),
        ),
      ),
      home: login(),
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