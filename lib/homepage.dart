import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:tubes/destinasi.dart';

class homepage extends StatefulWidget{
  const homepage({Key? key}) : super(key: key);
  @override
  State<homepage> createState() => homepageState();
}

class homepageState extends State<homepage>{
  late DatabaseReference destinasiref = FirebaseDatabase.instance.ref().child("destinasi");
  Future <void> namadestinasi() async {
    final snapshot = await destinasiref.child("destinasi1").get();
    return print( (snapshot.value as dynamic) ["namadestinasi"]);
  }
  bool querynull = false;
  String? selectedvalue;
  String sortref = "namadestinasi";
  
  @override
  Widget build(BuildContext context) {
    if (sortref == "namadestinasi") {
      querynull = false;
    }
    else{
      querynull = true;
    }

    return Scaffold(
        body: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Selamat Datang", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
                      Text("user", style: TextStyle(fontSize: 22),),
                    ],
                  ),
                ),
                Container(
                  height: 100,
                  width: double.infinity,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(color: Color.fromARGB(255, 94, 123, 230), borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
                  child: Column(
                    children: [
                      SizedBox(height: 25,),
                      Text("Explore Wisata", style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 40),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text("Sort by"),
                            SizedBox(
                              width: 10,
                            ),
                            DropdownButton(
                              value: selectedvalue,
                              hint: Text("select"),
                              items: [
                                DropdownMenuItem(value: "pulau", child: Text("pulau"),),
                                DropdownMenuItem(value: "lokasi", child: Text("lokasi"),)
                              ], onChanged: (value) {
                                setState(() {
                                  selectedvalue = value as String;
                                  sortref = value;
                                });
                            }),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                    child: Container(
                      // padding: EdgeInsets.only(left: 40, top: 10, right: 40),
                      color: Color.fromARGB(255, 94, 123, 230),
                      child: Flexible(
                        
                        child: FirebaseAnimatedList(
                          
                          
                          query: querynull? destinasiref : destinasiref.orderByChild(sortref), 
                          itemBuilder: (BuildContext context, DataSnapshot snapshot, Animation <double> animation, int index) {
                            return Container(
                                  margin: EdgeInsets.symmetric(horizontal: 80, vertical: 10),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(width: 1, color: Colors.black)
                                  ),
                                  height: 250,
                                  width: 150,
                                  child: InkWell(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(builder: 
                                    (context) => destinasi(
                                      namadestinasi: (snapshot.value as dynamic) ["namadestinasi"], 
                                      pulau: (snapshot.value as dynamic) ["pulau"], 
                                      lokasi: (snapshot.value as dynamic) ["lokasi"], 
                                      deskripsi: (snapshot.value as dynamic) ["deskripsi"],
                                    ),
                                  ),
                                );
                              },
                                  child: Column(
                      
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: ClipRRect(
                                        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            border: Border(bottom: BorderSide(width: 1, color: Colors.black)),
                                            color: Colors.grey, 
                                            image: DecorationImage(
                                              image: AssetImage("asset/image/img.png"),
                                            ),
                                          ),
                                        ),
                                      ),    
                                      ),
                                      Container(
                                        height: 50,
                                        width: 160,
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text((snapshot.value as dynamic) ["namadestinasi"]),
                                            Text((snapshot.value as dynamic) ["pulau"]),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
      
    );
  }
}