import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_list.dart';
import 'package:flutter/material.dart';
import 'package:tubes/homepage.dart';
import 'package:tubes/register.dart';

class login extends StatefulWidget{
  login({Key? key}) : super(key: key);

  @override
  State<login> createState()=> loginState();
}

class loginState extends State<login>{
  TextEditingController user = TextEditingController();
  TextEditingController pass = TextEditingController();

    Future <void> cekData() async {
      late DatabaseReference ref = FirebaseDatabase.instance.ref("user");
      final snapshot = await ref.child(user.text).get();
      
      if (snapshot.exists) {
        if ((snapshot.value as dynamic) ["password"] == pass.text){
          Navigator.push(context, MaterialPageRoute(builder: (context) => homepage(user: user.text,)));
          pass.clear();
          return print("password benar");
        }else{
          return print("password salah");
        }
      }else{
        return print("Data not exist");
      }
    }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Color(0xFFFEE8D1),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
              alignment: Alignment.center,
              width: double.infinity,
              decoration: const BoxDecoration(border: Border(bottom: BorderSide(width: 1, color: Colors.black))),
              margin: const EdgeInsets.symmetric(horizontal: 15),
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: 
              Text("Login", style: TextStyle(
                 fontWeight: FontWeight.bold,
                fontSize: 26,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Column(
              children: [
                Container(padding: const EdgeInsets.only(bottom: 50, top: 80), child: Image.asset("asset/image/img.png", height: 100,)),
                TextField(
                  controller: user,
                  decoration: InputDecoration(label: Center(child: Text("Username"))),
                ),
                const SizedBox(height: 20,),
                TextField(
                  controller: pass,
                  obscureText: true,
                  decoration: InputDecoration(label: Center(child: Text("Password"))),
                ),
                const SizedBox(height: 40,),
                ElevatedButton(onPressed: (){
                  cekData();
                }, child: const Text("Submit"), style: ElevatedButton.styleFrom(shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(50))),),
                const SizedBox(height: 10,),
                TextButton(onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => register()));
                }, child: const Text("Sign up")),
              ],
            ),
          ),
        ],
          )
            
        ),
      ),
    );
  }
}