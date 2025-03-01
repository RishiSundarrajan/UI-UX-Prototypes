import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class spotify1 extends StatefulWidget {
  const spotify1({super.key});

  @override
  State<spotify1> createState() => _spotify1State();
}

class _spotify1State extends State<spotify1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black87,
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              SliverAppBar(
                // title: Icon(Icons.arrow_back),
                expandedHeight: 460,
                pinned: true,
                forceElevated: innerBoxIsScrolled,
                flexibleSpace: FlexibleSpaceBar(
                  title: Text("ANIMAL", style: TextStyle(color: Colors.white),),
                  background: Container(
                    height: 100,
                    decoration: BoxDecoration(
                      //color: Colors.cyanAccent,
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.blueGrey,
                            Colors.blueGrey,
                            Colors.black87,
                            Colors.black87,
                          ],
                        )
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 15.0, right: 360),
                          child: Icon(Icons.arrow_back),
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 54,
                                width: 310,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      filled: false,
                                      fillColor: Colors.cyanAccent,
                                      prefixIcon: Icon(
                                        Icons.search, color: Colors.white,),
                                      hintText: "Find in playlist",
                                      hintStyle: TextStyle(color: Colors.white),
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(8),
                                          borderSide: BorderSide(color: Colors.black, width: 50)
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: 40,
                              width: 75,
                              child: TextFormField(
                                decoration: InputDecoration(
                                  filled: false,
                                  fillColor: Colors.cyan,
                                  hintText: "  Sort",
                                  hintStyle: TextStyle(color: Colors.white),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide(color: Colors.black, width: 50)
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        Container(
                          height: 280,
                          width: 300,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("Assets/AM.jpg"),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 25,
                          width: 60,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: AssetImage("Assets/AM.jpg"),
                                  fit: BoxFit.fill
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 30.0, left: 1),
                          child: Container(
                              height: 60,
                              child: Text("Ayaan Muhammad Shiyas (AMS)", style: TextStyle(color: Colors.white, fontSize: 20),)
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          height: 25,
                          child: Text("   🌍 5,871 saves - 1h 57min", style: TextStyle(color: Colors.white, fontSize: 20)),
                        ),
                      ],
                    ),
                    SizedBox(height: 5,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 60,
                                width: 50,
                                decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    border: Border.all(),
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                        image: AssetImage("Assets/Man.jpg"),
                                        fit: BoxFit.fill
                                    )
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Icon(Icons.add_circle_outline, size: 30,),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: Icon(Icons.download_for_offline_outlined, size: 30,),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: Icon(Icons.more_vert_outlined, size: 35,),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: Icon(Icons.shuffle, size: 40, color: CupertinoColors.systemGreen,),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(Icons.play_circle, size: 55, color: CupertinoColors.systemGreen,),
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        color: index % 2 == 0 ? Colors.black : Colors.black,
                        height: 80,
                        alignment: Alignment.centerLeft,
                        child: ListTile(
                          leading: Container(height: 50, width: 50,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(liss[index].image))
                            ),
                          ),
                          title: Text(liss[index].text, style: TextStyle(fontSize:20, color: Colors.white),),
                          subtitle: Text(liss[index].sub, style: TextStyle(overflow: TextOverflow.ellipsis, fontSize: 15, color: Colors.white70),),
                          trailing: Icon(Icons.more_vert_outlined),
                        ),
                      ),
                    );
                  },
                  // 40 list items
                  childCount: liss.length,
                ),
              ),
            ];
          },
          body: Column(
            children: [
              // Container(
              //   height: 550,
              //   child: ListView.builder(
              //     itemCount: liss.length,
              //     itemBuilder: (BuildContext context, int index)
              //     {
              //       return Padding(
              //         padding: const EdgeInsets.all(8.0),
              //         child: ListTile(
              //           leading: Container(
              //             height: 50,
              //             width: 50,
              //             decoration: BoxDecoration(
              //               image: DecorationImage(
              //                   image: AssetImage(liss[index].image)),
              //               )
              //             ),
              //           title: Text(liss[index].text, style: TextStyle(fontSize:20, color: Colors.white),),
              //           subtitle: Text(liss[index].sub, style: TextStyle(overflow: TextOverflow.ellipsis, fontSize: 15, color: Colors.white70),),
              //           trailing: Icon(Icons.more_vert_outlined),
              //           ),
              //       );
              //       },
              //     ),
              // )
            ],
          ),
        ));
  }
}

class Modell
{
  String? image;
  String? text;
  String? sub;

  Modell(this.image,this.text,this.sub);
}


List liss = dataListt.map((e)=>Modell(e["image"], e["text"], e["sub"])).toList();

var dataListt = [
  {"image":"Assets/download.jpg","text":"Papa","sub":"Harshavardhan Rameshwar, R.P. Krishaang",},
  {"image":"Assets/AM.jpg","text":"Hua ","sub":"Harshavardhan Rameshwar, R.P. Krishaang",},
  {"image":"Assets/anime.jpg","text":"Pehle ", "sub":"Harshavardhan Rameshwar, R.P. Krishaang",},
  {"image":"Assets/AM.jpg","text":"Arjan ", "sub":"Harshavardhan Rameshwar, R.P. Krishaang",},
  {"image":"Assets/Man.jpg","text":"Satranga", "sub":"Harshavardhan Rameshwar, R.P. Krishaang",},
  {"image":"Assets/Man.jpg","text":"Jamal ", "sub":"Harshavardhan Rameshwar, R.P. Krishaang",},
  {"image":"Assets/Man.jpg","text":"Aziz's ", "sub":"Harshavardhan Rameshwar, R.P. Krishaang",},
  {"image":"Assets/Man.jpg","text":"Zoya ", "sub":"Harshavardhan Rameshwar, R.P. Krishaang",},
];