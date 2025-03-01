import 'package:flutter/material.dart';

class insta extends StatefulWidget {
  const insta({super.key});

  @override
  State<insta> createState() => _instaState();
}

class _instaState extends State<insta> {
  List a = [
    "Car",
    "School",
    "Anime",
    "Profile",
    "Goku",
    "DC Comics",
    "Kochin",
    "Waynad",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          leading: Icon(Icons.lock, color: Colors.white, size: 25,),
          title: Container(
              height: 30,
              child: Text("rishi_vignesh_rv_", style: TextStyle(color: Colors.white, ),)),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.report_gmailerrorred, size: 28, color: Colors.white,),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.add_box_outlined, size: 28, color: Colors.white,),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.menu_outlined, size: 35, color: Colors.white,),
            ),
          ],
        ),
        body: DefaultTabController(
          length: 3,
          child: NestedScrollView(
              headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
                return [
                  SliverAppBar(
                    automaticallyImplyLeading: false,
                    expandedHeight: 430,
                    pinned: false,
                    forceElevated: innerBoxIsScrolled,
                    floating: true,
                    backgroundColor: Colors.black,
                    flexibleSpace: FlexibleSpaceBar(
                      background: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 5,),
                          Row(
                            children: [
                              Container(
                                height: 100,
                                width: 120,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      image: AssetImage("Assets/Man.jpg"),
                                    )
                                ),
                              ),
                              SizedBox(width: 10,),
                              Column(
                                children: [
                                  Container(
                                    height: 20,
                                    child: Text("8", style: TextStyle(color: Colors.white),),
                                  ),
                                  Container(
                                    height: 20,
                                    child: Text("Posts", style: TextStyle(color: Colors.white),),
                                  )
                                ],
                              ),
                              SizedBox(width: 53,),
                              Column(
                                children: [
                                  Container(
                                    height: 20,
                                    child: Text("800M", style: TextStyle(color: Colors.white),),
                                  ),
                                  Container(
                                    height: 20,
                                    child: Text("Followers", style: TextStyle(color: Colors.white),),
                                  )
                                ],
                              ),
                              SizedBox(width: 50,),
                              Column(
                                children: [
                                  Container(
                                    height: 20,
                                    child: Text("8", style: TextStyle(color: Colors.white),),
                                  ),
                                  Container(
                                    height: 20,
                                    child: Text("Following", style: TextStyle(color: Colors.white),),
                                  )
                                ],
                              )
                            ],
                          ),
                          SizedBox(height: 10, width: 20,),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Container(
                              height: 20,
                              width: 100,
                              child: Text("Rishi Vignesh", style: TextStyle(color: Colors.white),),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text("Do you bleed!", style: TextStyle(color: Colors.white),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text("Men are Brave", style: TextStyle(color: Colors.white),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text("#RestoreTheSnyderVerse", style: TextStyle(color: Colors.white),
                            ),
                          ),
                          SizedBox(height: 5,),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Container(
                                  height: 40,
                                  width: 170,
                                  child: Center(child: Text("Edit Profile", style: TextStyle(color: Colors.white),)),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.white),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                SizedBox(width: 5,),
                                Container(
                                  height: 40,
                                  width: 170,
                                  child: Center(child: Text("Share Profile", style: TextStyle(color: Colors.white),)),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.white),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                SizedBox(width: 5,),
                                Container(
                                  height: 40,
                                  width: 45,
                                  child: Center(child: Icon(Icons.person_add_rounded, size: 20, color: Colors.white,)),
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.white),
                                      borderRadius: BorderRadius.circular(10)
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(height: 20,),
                          Container(
                            height: 100,
                            child: ListView.builder(
                                itemCount: liss.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (BuildContext context, int index) {
                                  return Column(
                                    children: [
                                      Container(
                                        height: 50,
                                        width: 80,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                            image: AssetImage(liss[index].image),
                                          ),
                                        ),
                                      ),
                                      Text(a[index], style: TextStyle(color: Colors.white),)
                                    ],
                                  );
                                }
                            ),
                          ),
                        ],
                      ),
                    ),
                    bottom: TabBar(
                      tabs: [
                        Tab(icon: Icon(Icons.grid_on_sharp),),
                        Tab(icon: Icon(Icons.radio),),
                        Tab(icon: Icon(Icons.contact_mail),)
                      ],
                    ),
                  ),
                ];
              },
              body: TabBarView(
                children: [
                  Container(
                    color: Colors.black,
                    child: GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          //childAspectRatio: 1/1,
                            mainAxisSpacing: 1,
                            crossAxisSpacing: 1,
                            crossAxisCount: 3),
                        itemCount: liss.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            child: Column(
                              children: [
                                Container(
                                  height: 136,
                                  width: 300,
                                  decoration: BoxDecoration(
                                      border: Border.all(),
                                      image: DecorationImage(
                                          image: AssetImage(liss[index].image), fit: BoxFit.fill
                                      )
                                  ),
                                )
                              ],
                            ),
                          );
                        }
                    ),
                  ),
                  Container(
                    color: Colors.red,
                  ),
                  Container(
                    color: Colors.blueGrey,
                  ),
                ],
              )
          ),
        )
    );
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