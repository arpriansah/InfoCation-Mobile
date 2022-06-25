import 'package:flutter/material.dart';

class login extends StatefulWidget {
  login({Key? key}) : super(key: key);

  @override
  State<login> createState() => loginState();
}

class loginState extends State<login> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
            child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              width: double.infinity,
              decoration: const BoxDecoration(
                  border: Border(
                      bottom: BorderSide(width: 1, color: Colors.black))),
              margin: const EdgeInsets.symmetric(horizontal: 15),
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: Text(
                "Login",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 26,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Column(
                children: [
                  Container(
                      padding: const EdgeInsets.only(bottom: 50, top: 80),
                      child: Image.asset(
                        "asset/image/img.png",
                        height: 100,
                      )),
                  const TextField(
                    decoration:
                        InputDecoration(label: Center(child: Text("Username"))),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const TextField(
                    decoration:
                        InputDecoration(label: Center(child: Text("Password"))),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text("Submit"),
                    style: ElevatedButton.styleFrom(
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(50))),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextButton(onPressed: () {}, child: const Text("Sign up")),
                ],
              ),
            ),
          ],
        )),
      ),
    );
  }
}
