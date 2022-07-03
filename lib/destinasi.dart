import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tubes/mappage.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

class destinasi extends StatefulWidget{
  destinasi({Key? key, required this.namadestinasi, required this.pulau, required this.lokasi, required this.deskripsi, required this.url}) : super(key: key);
  String namadestinasi, pulau, lokasi, deskripsi, url;

  @override
  State<destinasi> createState()=> destinasiState();
}

class destinasiState extends State<destinasi>{
  // _openlocation() async {
  //   await launch("https://www.google.com/maps/search/?api=1&query=kuta+beach");
  // }
  // https://goo.gl/maps/hzkokuphTAvrwEmp9
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFD0A67B),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () async {
          await launch(widget.url);
        }, 
        child: Icon(Icons.location_on, color: Colors.black,),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  const SizedBox(height: 70,),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 12,),
                    child: IconButton(icon: 
                      const Icon(Icons.arrow_back_ios),
                      onPressed:() {
                        Navigator.pop(context);
                      },
                      color: Colors.black,
                     ),
                   ),
                  Container(
                    child: const Text("Destinasi", 
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ), 
                    ),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 25,),
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      width: 1, 
                      color: Colors.black
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 18,),
              Container(
                // alignment: Alignment.topLeft,
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xFFFEE8D1),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 20,),
                    Center(
                      child: Text(widget.namadestinasi, 
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 50,),
                    Text("Lokasi:", 
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),),
                    Text(widget.lokasi, 
                      style: TextStyle(
                        fontSize: 18
                      ),
                    ),

                    Text(widget.pulau, 
                      style: TextStyle(
                        fontSize: 18
                      ),
                    ),
                    SizedBox(height: 50,),
                    Text(widget.deskripsi, 
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 18
                      ),
                    ),
                    SizedBox(height: 40,),
                    Container(
                      height: 500,
                      width: 300,
                      child: WebView(
                        javascriptMode: JavascriptMode.unrestricted,
                        initialUrl: widget.url,
                      ),
                    ),
                    SizedBox(height: 40,),
                  ],
                ),
              ),
            ],
          ),
          ),
        )
      );
  }
}