import 'package:flutter/material.dart';
import 'package:tubes/mappage.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

class destinasi extends StatefulWidget{
  destinasi({Key? key, required this.namadestinasi, required this.pulau, required this.lokasi, required this.deskripsi}) : super(key: key);
  String namadestinasi, pulau, lokasi, deskripsi;

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
                margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color.fromARGB(255, 228, 228, 228),
                ),
                child: Column(
                  children: <Widget>[
                    // SizedBox(height: 50,),
                    // Text("Destinasi Wisata", 
                    //   style: TextStyle(
                    //     fontSize: 20, 
                    //     fontWeight: FontWeight.bold
                    //   ),
                    // ),
                    Container(
                      height: 500,
                      width: 300,
                      child: WebView(
                        javascriptMode: JavascriptMode.unrestricted,
                        initialUrl: "https://goo.gl/maps/hzkokuphTAvrwEmp9",
                      ),
                    ),
                    TextButton(onPressed: () async {
                      await launch("https://www.google.com/maps/search/?api=1&query=kuta+beach");
                    }, child: Text("Open Location"),),
                    SizedBox(height: 50,),
                    Text(widget.namadestinasi, 
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20,),
                    Text(widget.pulau, 
                      style: TextStyle(
                        fontSize: 18
                      ),
                    ),
                    SizedBox(height: 50,),
                    Text(widget.lokasi, 
                      style: TextStyle(
                        fontSize: 18
                      ),
                    ),
                    SizedBox(height: 50,),
                    Text(widget.deskripsi, 
                      style: TextStyle(
                        fontSize: 18
                      ),
                    ),
                    SizedBox(height: 50,),
                    ElevatedButton(onPressed: (){
                      Navigator.push(
                        context, 
                        MaterialPageRoute(builder: (context) => MapPage())
                      );
                    }, 
                    child: Text("See Location")),
                    SizedBox(height: 220,),
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