import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:video_player/video_player.dart';
import 'package:readmore/readmore.dart';
import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  Widget build(BuildContext context) {
    return FlutterSplashScreen.gif(
      gifPath: "Assets/11in.gif",
      gifWidth: double.infinity,
      gifHeight: double.infinity,
      nextScreen: loginpage(),
      duration: const Duration(seconds: 5),
      onInit: () async {
        debugPrint("onInit");
      },
      onEnd: () async {
        debugPrint("onEnd 1");
      },
    );
  }
}


class loginpage extends StatefulWidget {
  const loginpage({super.key});

  @override
  State<loginpage> createState() => _loginpageState();
}

class _loginpageState extends State<loginpage> {

  final _formkey = GlobalKey<FormState>();

  TextEditingController a = TextEditingController();
  TextEditingController b = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        title: Container(
          height: 100,
          width: 190,
          decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage("Assets/Nb.png"))
          ),
        ),
      ),
      body: Form(key: _formkey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 100,
                  width: 380,
                  // color: Colors.grey,
                  child: TextFormField(
                    validator: (value){
                      if(value==null||!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value)) {
                        return "Please enter data";
                      }
                      // else if(value.length !=10||!RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)').hasMatch(value)) {
                      //   return "Please enter the valid phone number";
                      // }
                      // if(value==null||!RegExp(r"^\d{10}\t((?>[a-zA-Z\d!#$%&'+\-\/=?^_`{|}~]+\x20|""((?=[\x01-\x7f])[^""\\]|\\[\x01-\x7f])""\x20)(?<angle><))?((?!\.)(?>\.?[a-zA-Z\d!#$%&'+\-\/=?^_`{|}~]+)+|""((?=[\x01-\x7f])[^""\\]|\\[\x01-\x7f])"")@(((?!-)[a-zA-Z\d\-]+(?<!-)\.)+[a-zA-Z]{2,}|\[(((?(?<!\[)\.)(25[0-5]|2[0-4]\d|[01]?\d?\d)){4}|[a-zA-Z\d\-][a-zA-Z\d]:((?=[\x01-\x7f])[^\\\[\]]|\\[\x01-\x7f])+)\])(?(angle)>)").hasMatch(value)) {
                      //   return "Please enter data";
                      // }
                    },
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey,
                      contentPadding: EdgeInsets.symmetric(vertical: 50, horizontal: 10),
                      hintText: "Email or Phone Number",
                      hintStyle: TextStyle(color: Colors.white70, fontSize: 20),
                      labelText: "Email or Phone Number",
                      labelStyle: TextStyle(color: Colors.white54, fontSize: 20),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 100,
                  width: 380,
                  child: TextFormField(
                    validator: (value) {
                      if(!RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$ %^&*-]).{8,}$').hasMatch(value!)) {
                        return "Password Invalid";}
                    },
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey,
                      contentPadding: EdgeInsets.symmetric(vertical: 50, horizontal: 10),
                      hintText: "Password",
                      hintStyle: TextStyle(color: Colors.white70, fontSize: 20),
                      labelText: "Password",
                      labelStyle: TextStyle(color: Colors.white54, fontSize: 20),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5)
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10,),
              GestureDetector(onTap: (){
                if (_formkey.currentState!.validate()) {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ott()));
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Processing Data')),
                  );
                }
              },
                child: Container(
                  height: 70,
                  width: 380,
                  decoration: BoxDecoration(
                      border: Border.all(width: 2, color: Colors.white),
                      borderRadius: BorderRadius.circular(5)
                  ),
                  child: Center(child: Text("Sign In", style: TextStyle(fontSize: 30, color: Colors.white),)),
                ),
              ),
              SizedBox(height: 10,),
              Text("OR", style: TextStyle(color: Colors.grey, fontSize: 20, fontWeight: FontWeight.w600),),
              SizedBox(height: 10,),
              GestureDetector(onTap: (){
                setState(() {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> auth()));
                });
              },
                child: Container(
                  height: 70,
                  width: 380,
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      border: Border.all(width: 2, color: Colors.grey),
                      borderRadius: BorderRadius.circular(5)
                  ),
                  child: Center(child: Text("Use a Sign-In Code", style: TextStyle(fontSize: 30, color: Colors.white, fontWeight: FontWeight.w600))),
                ),
              ),
              SizedBox(height: 20,),
              GestureDetector(onTap: (){
                setState(() {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> email()));
                });
              },
                  child: Text("Forgot Password?", style: TextStyle(color: Colors.grey, fontSize: 21, fontWeight: FontWeight.w500),)),
              SizedBox(height: 20,),
              GestureDetector(onTap: (){
                setState(() {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> googlein()));
                });
              }, child: Text("Google Sign in!", style: TextStyle(color: Colors.grey, fontSize: 21, fontWeight: FontWeight.w500),)),
              SizedBox(height: 30,),
              GestureDetector(onTap:(){
                setState(() {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => signup()));
                });
              }, child: Text("New to Netflix? Sign up now.", style: TextStyle(color: Colors.grey, fontSize: 21, fontWeight: FontWeight.w500))),
              SizedBox(height: 60,),
              Text("Sign in is protected by Google reCAPTCHA", style: TextStyle(color: Colors.grey, fontSize: 15, fontWeight: FontWeight.w500)),
              Container(
                width: 415,
                child: Row(
                  children: [
                    SizedBox(width: 73,),
                    Text("to ensure you're not a bot. ", style: TextStyle(color: Colors.grey, fontSize: 15, fontWeight: FontWeight.w500)),
                    Text("learn more.", style: TextStyle(color: Colors.grey, fontSize: 15, fontWeight: FontWeight.w500),),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class signup extends StatefulWidget {
  const signup({super.key});

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  final _formkey = GlobalKey<FormState>();
  TextEditingController c = TextEditingController();
  TextEditingController d = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Container(
          height: 100,
          width: 150,
          decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage("Assets/Nb.png"))
          ),
        ),
        actions: [
          Text("HELP", style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),),
          SizedBox(width: 15,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(onTap:(){
              setState(() {
                Navigator.push(context, MaterialPageRoute(builder: (context) => loginpage()));
              });
            },
                child: Text("SIGN IN", style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),)),
          ),
        ],
      ),
      body: Form(key: _formkey,
        child: Column(
          children: [
            SizedBox(height: 30,),
            Padding(
              padding: const EdgeInsets.only(right: 43.0),
              child: Text("Unlimited films, TV\nprogrammes & more", style: TextStyle(color: Colors.black, fontSize: 30, fontWeight: FontWeight.w600),),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24.0, top: 20),
              child: Text("As a member, you can watch exclusive\nTV programmes and films on the\nmobile app and all your other devices.", style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500),),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 25.0, left: 20),
              child: Container(
                height: 100,
                width: 349,
                child: TextFormField(
                  validator: (value){
                    if(value==null||!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(value)||!RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)').hasMatch(value)){
                      return "Please enter data";
                    }
                  },
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 30, horizontal: 10),
                    hintText: "Email or Phone Number",
                    hintStyle: TextStyle(color: Colors.black54, fontSize: 20),
                    labelText: "Email or Phone Number",
                    labelStyle: TextStyle(color: Colors.black54, fontSize: 20),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(3),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, top: 10),
              child: Container(
                height: 100,
                width: 349,
                child: TextFormField(
                  validator: (value) {
                    if(!RegExp(r'^(?=.?[A-Z])(?=.?[a-z])(?=.?[0-9])(?=.?[!@#\$&*~]).{8,}$').hasMatch(value!)) {
                      return "Password Invalid";}
                  },
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 30, horizontal: 10),
                    hintText: "Password",
                    hintStyle: TextStyle(color: Colors.black54, fontSize: 20),
                    labelText: "Password",
                    labelStyle: TextStyle(color: Colors.black54, fontSize: 20),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(3),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10,),
            GestureDetector(onTap: (){
              if (_formkey.currentState!.validate()) {
                Navigator.push(context, MaterialPageRoute(builder: (context) => ott()));
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Processing Data')),
                );
              }
            },
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Container(
                  height: 70,
                  width: 350,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(2)
                  ),
                  child: Center(child: Text("CREATE ACCOUNT", style: TextStyle(fontSize: 25, color: Colors.white),)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class auth extends StatefulWidget {
  const auth({super.key});

  @override
  State<auth> createState() => _authState();
}

class _authState extends State<auth> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Colors.black,
        title: Container(
          height: 100,
          width: 190,
          decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage("Assets/Nb.png"))
          ),
        ),
      ),
      backgroundColor: Colors.black,
      body: Column(
        children: [
          SizedBox(height: 210,),
          Text("Get your sign-in code", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 26),),
          Padding(
            padding: const EdgeInsets.only(top: 20.0, left: 16),
            child: Container(
              height: 100,
              width: 380,
              // color: Colors.grey,
              child: TextFormField(
                validator: (value){
                  if(value?.length !=10||!RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)').hasMatch(value!)) {
                    return "Please enter the valid phone number";
                  }
                  // if(value==null||!RegExp(r"^\d{10}\t((?>[a-zA-Z\d!#$%&'+\-\/=?^_`{|}~]+\x20|""((?=[\x01-\x7f])[^""\\]|\\[\x01-\x7f])""\x20)(?<angle><))?((?!\.)(?>\.?[a-zA-Z\d!#$%&'+\-\/=?^_`{|}~]+)+|""((?=[\x01-\x7f])[^""\\]|\\[\x01-\x7f])"")@(((?!-)[a-zA-Z\d\-]+(?<!-)\.)+[a-zA-Z]{2,}|\[(((?(?<!\[)\.)(25[0-5]|2[0-4]\d|[01]?\d?\d)){4}|[a-zA-Z\d\-][a-zA-Z\d]:((?=[\x01-\x7f])[^\\\[\]]|\\[\x01-\x7f])+)\])(?(angle)>)").hasMatch(value)) {
                  //   return "Please enter data";
                  // }
                },
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey,
                  contentPadding: EdgeInsets.symmetric(vertical: 50, horizontal: 10),
                  hintText: "Email or Phone Number",
                  hintStyle: TextStyle(color: Colors.white70, fontSize: 20),
                  labelText: "Email or Phone Number",
                  labelStyle: TextStyle(color: Colors.white54, fontSize: 20),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0, top: 8),
            child: Container(
              height: 70,
              width: 380,
              decoration: BoxDecoration(
                  border: Border.all(width: 2, color: Colors.white),
                  borderRadius: BorderRadius.circular(5)
              ),
              child: Center(child: Text("Send Code", style: TextStyle(fontSize: 30, color: Colors.white, fontWeight: FontWeight.w600),)),
            ),
          ),
          SizedBox(height: 20,),
          Text("Forgot email or phone number?", style: TextStyle(color: Colors.white, fontSize: 20),),
          SizedBox(height: 30,),
          Text("New to Netflix? Sign up now.", style: TextStyle(color: Colors.white, fontSize: 20)),
          SizedBox(height: 50,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: RichText(
                text: TextSpan( text: "Sign-in is protected by Google reCAPTCHA to ensure you're\nnot a bot. ", style: TextStyle(color: Colors.grey),
                    children: [TextSpan(text: "Learn more.", style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w600))])),
          ),
        ],
      ),
    );
  }
}


class email extends StatefulWidget {
  const email({super.key});

  @override
  State<email> createState() => _emailState();
}

class _emailState extends State<email> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Colors.black,
        title: Container(
          height: 100,
          width: 190,
          decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage("Assets/Nb.png"))
          ),
        ),
      ),
      backgroundColor: Colors.black,
      body: Column(
        children: [
          SizedBox(height: 210,),
          Text("Get your sign-in Email", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 26),),
          Padding(
            padding: const EdgeInsets.only(top: 20.0, left: 16),
            child: Container(
              height: 100,
              width: 380,
              // color: Colors.grey,
              child: TextFormField(
                validator: (value){
                  if(value==null||!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value)) {
                    return "Please enter data";
                  }
                  // if(value==null||!RegExp(r"^\d{10}\t((?>[a-zA-Z\d!#$%&'+\-\/=?^_`{|}~]+\x20|""((?=[\x01-\x7f])[^""\\]|\\[\x01-\x7f])""\x20)(?<angle><))?((?!\.)(?>\.?[a-zA-Z\d!#$%&'+\-\/=?^_`{|}~]+)+|""((?=[\x01-\x7f])[^""\\]|\\[\x01-\x7f])"")@(((?!-)[a-zA-Z\d\-]+(?<!-)\.)+[a-zA-Z]{2,}|\[(((?(?<!\[)\.)(25[0-5]|2[0-4]\d|[01]?\d?\d)){4}|[a-zA-Z\d\-][a-zA-Z\d]:((?=[\x01-\x7f])[^\\\[\]]|\\[\x01-\x7f])+)\])(?(angle)>)").hasMatch(value)) {
                  //   return "Please enter data";
                  // }
                },
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey,
                  contentPadding: EdgeInsets.symmetric(vertical: 50, horizontal: 10),
                  hintText: "Email or Phone Number",
                  hintStyle: TextStyle(color: Colors.white70, fontSize: 20),
                  labelText: "Email or Phone Number",
                  labelStyle: TextStyle(color: Colors.white54, fontSize: 20),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0, top: 8),
            child: Container(
              height: 70,
              width: 380,
              decoration: BoxDecoration(
                  border: Border.all(width: 2, color: Colors.white),
                  borderRadius: BorderRadius.circular(5)
              ),
              child: Center(child: Text("Send Email", style: TextStyle(fontSize: 30, color: Colors.white, fontWeight: FontWeight.w600),)),
            ),
          ),
          SizedBox(height: 20,),
          Text("Forgot email?", style: TextStyle(color: Colors.white, fontSize: 20),),
          SizedBox(height: 30,),
          Text("New to Netflix? Sign up now.", style: TextStyle(color: Colors.white, fontSize: 20)),
          SizedBox(height: 50,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: RichText(
                text: TextSpan( text: "Sign-in is protected by Google reCAPTCHA to ensure you're\nnot a bot. ", style: TextStyle(color: Colors.grey),
                    children: [TextSpan(text: "Learn more.", style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w600))])),
          ),
        ],
      ),
    );
  }
}


class googlein extends StatefulWidget {
  const googlein({super.key});

  @override
  State<googlein> createState() => _googleinState();
}

class _googleinState extends State<googlein> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Colors.black,
        title: Container(
          height: 100,
          width: 190,
          decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage("Assets/Nb.png"))
          ),
        ),
      ),
      backgroundColor: Colors.black,
      body: Column(
        children: [
          SizedBox(height: 210,),
          Text("Get your sign-in Gmail", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 26),),
          Padding(
            padding: const EdgeInsets.only(top: 20.0, left: 16),
            child: Container(
              height: 100,
              width: 380,
              // color: Colors.grey,
              child: TextFormField(
                validator: (value){
                  if(value==null||!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value)) {
                    return "Please enter data";
                  }
                  // if(value==null||!RegExp(r"^\d{10}\t((?>[a-zA-Z\d!#$%&'+\-\/=?^_`{|}~]+\x20|""((?=[\x01-\x7f])[^""\\]|\\[\x01-\x7f])""\x20)(?<angle><))?((?!\.)(?>\.?[a-zA-Z\d!#$%&'+\-\/=?^_`{|}~]+)+|""((?=[\x01-\x7f])[^""\\]|\\[\x01-\x7f])"")@(((?!-)[a-zA-Z\d\-]+(?<!-)\.)+[a-zA-Z]{2,}|\[(((?(?<!\[)\.)(25[0-5]|2[0-4]\d|[01]?\d?\d)){4}|[a-zA-Z\d\-][a-zA-Z\d]:((?=[\x01-\x7f])[^\\\[\]]|\\[\x01-\x7f])+)\])(?(angle)>)").hasMatch(value)) {
                  //   return "Please enter data";
                  // }
                },
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey,
                  contentPadding: EdgeInsets.symmetric(vertical: 50, horizontal: 10),
                  hintText: "Enter GMAIL ID",
                  hintStyle: TextStyle(color: Colors.white70, fontSize: 20),
                  labelText: "GMAIL ID",
                  labelStyle: TextStyle(color: Colors.white54, fontSize: 20),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0, top: 8),
            child: Container(
              height: 70,
              width: 380,
              decoration: BoxDecoration(
                  border: Border.all(width: 2, color: Colors.white),
                  borderRadius: BorderRadius.circular(5)
              ),
              child: Center(child: Text("Verify", style: TextStyle(fontSize: 30, color: Colors.white, fontWeight: FontWeight.w600),)),
            ),
          ),
          SizedBox(height: 30,),
          Text("New to Netflix? Sign up now.", style: TextStyle(color: Colors.white, fontSize: 20)),
          SizedBox(height: 50,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: RichText(
                text: TextSpan(text: "Sign-in is protected by Google reCAPTCHA to ensure you're\nnot a bot. ", style: TextStyle(color: Colors.grey),
                    children: [TextSpan(text: "Learn more.", style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w600))])),
          ),
        ],
      ),
    );
  }
}


class ott extends StatefulWidget {
  const ott({super.key});

  @override
  State<ott> createState() => _ottState();
}

class _ottState extends State<ott> {
  List r = [
    "Assets/netflixlogo.jpg",
    "Assets/VMV.jpg",
    "Assets/VM.jpg",
    "Assets/VMM.jpg",
    "Assets/AKT.jpg",
    "Assets/VMim.jpg"
  ];
  List b = [
    "Assets/images.png",
    "Assets/GTA.jpg",
    "Assets/RE4.jpg",
    "Assets/goku1.jpg",
  ];
  int currentindex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.grey,
        appBar: AppBar(
          elevation: 0,
          shadowColor: Colors.black26,
          //forceMaterialTransparency: true,
          backgroundColor: Colors.transparent,
          leading: Image.asset("Assets/nnn.png"),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.download, color: Colors.white, size: 30,),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.search, color: Colors.white, size: 30,),
            )
          ],
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Colors.grey,
                Colors.black,
              ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter
              )
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 50,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Container(
                        height: 35,
                        width: 100,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white,width: 2),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: TextButton(onPressed: () {
                          setState(() {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> netmve()));
                          });
                        }, child: Text("TV Shows", style: TextStyle(color: Colors.white,),)),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 35,
                          width: 80,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white, width: 2),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: TextButton(onPressed: () {}, child: Text("Movies", style: TextStyle(color: Colors.white),)),
                        ),
                      ),
                      Container(
                        height: 35,
                        width: 130,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white, width: 2),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: TextButton(onPressed: () {}, child: Text("Categories  ⋁", style: TextStyle(color: Colors.white),)),
                      ),
                    ],
                  ),
                ),
                Stack(
                  children: [
                    CarouselSlider.builder(
                      options: CarouselOptions(
                          scrollDirection: Axis.horizontal,
                          height: 400.0,
                          enlargeCenterPage: true,
                          autoPlay: false,
                          aspectRatio: 18 / 9,
                          autoPlayCurve: Curves.fastOutSlowIn,
                          enableInfiniteScroll: true,
                          autoPlayAnimationDuration: Duration(milliseconds: 800),
                          viewportFraction: 1,
                          onPageChanged: (index, reason) {
                            setState(() {
                              currentindex = index;
                            });
                          }
                      ),
                      itemCount: r.length,
                      itemBuilder: (BuildContext context, int index, int realIndex){
                        return Container(
                          height: 200,
                          width: 340,
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                                image: AssetImage(r[index]), fit: BoxFit.fill
                            ),
                          ),
                        );
                      },
                    ),
                    Positioned(
                      left: 30,
                      bottom: 10,
                      child: Column(
                        children: [
                          // Row(
                          //   children: [
                          //     Text("Ajith Kumar", style: TextStyle(color: Colors.yellow, fontSize: 20),),
                          //     Text("VIDAA MUYARCHI", style: TextStyle(color: Colors.yellow, fontSize: 20),),
                          //   ],
                          // ),
                          SizedBox(height: 5,),
                          Row(
                            children: [
                              Text("   Action", style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),),
                              Text(" ◦ Drama", style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),),
                              Text(" ◦ Sentiment", style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),),
                              Text(" ◦ Kollywood", style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),),
                            ],
                          ),
                          SizedBox(height: 5,),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 20.0),
                                child: Container(
                                  height: 35,
                                  width: 150,
                                  decoration: BoxDecoration(
                                      border: Border.all(),
                                      borderRadius: BorderRadius.circular(5)
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.play_arrow),
                                      Text("Play", style: TextStyle(color: Colors.black),),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: 35,
                                  width: 150,
                                  decoration: BoxDecoration(
                                      border: Border.all(),
                                      borderRadius: BorderRadius.circular(5)
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.add, size: 20),
                                      Text("My List", style: TextStyle(color: Colors.black),),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10,),
                Container(
                  height: 25,
                  width: 400,
                  child: Text("Today's Top Picks for you", style: TextStyle(color: Colors.white, fontSize: 20),),
                ),
                SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 150,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: r.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 3.0),
                          child: Container(
                            height: 150,
                            width: 130,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 2
                                ),
                                borderRadius: BorderRadius.circular(6),
                                image: DecorationImage(
                                    image: AssetImage(r[index]), fit: BoxFit.fill)
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Mobile Games", style: TextStyle(color: Colors.white, fontSize: 20),),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 165.0),
                      child: Text("My List >", style: TextStyle(color: Colors.white, fontSize: 20),),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 150,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: b.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 3.0),
                          child: Container(
                            height: 150,
                            width: 130,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 2
                                ),
                                borderRadius: BorderRadius.circular(6),
                                image: DecorationImage(
                                    image: AssetImage(b[index]), fit: BoxFit.fill)
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 30,
                    width: 400,
                    child: Text("Top 10 TV Shows in India Today", style: TextStyle(color: Colors.white, fontSize: 20),),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 150,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: b.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 3.0),
                          child: Container(
                            height: 150,
                            width: 130,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 2
                                ),
                                borderRadius: BorderRadius.circular(6),
                                image: DecorationImage(
                                    image: AssetImage(b[index]), fit: BoxFit.fill)
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 255.0),
                  child: Text("Only on Netflix", style: TextStyle(color: Colors.white, fontSize: 20),),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 700,
                    child: GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisSpacing: 1,
                        crossAxisSpacing: 1,
                        childAspectRatio: 1.02/1,
                        crossAxisCount: 2,
                      ),
                      itemCount: r.length,
                      itemBuilder: (BuildContext context, int index){
                        return Column(
                          children: [
                            Container(
                              height: 189,
                              width: 200,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(),
                                  //shape: BoxShape.rectangle,
                                  image: DecorationImage(
                                      image: AssetImage(r[index]), fit: BoxFit.fill
                                  )
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
    );
  }
}


class netmve extends StatefulWidget {
  const netmve({super.key});

  @override
  State<netmve> createState() => _netmveState();
}

class _netmveState extends State<netmve> {
  bool add = false;
  List r = [
    "Assets/netflixlogo.jpg",
    "Assets/VMV.jpg",
    "Assets/VM.jpg",
    "Assets/GTA.jpg",
    "Assets/RE4.jpg",
    "Assets/images.png",
  ];
  List a = [
    "Assets/netflixlogo.jpg",
    "Assets/VMV.jpg",
    "Assets/VM.jpg",
  ];
  List b = [
    "Assets/GTA.jpg",
    "Assets/RE4.jpg",
    "Assets/images.png",
  ];
  int currentindex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: GestureDetector(
            onTap: (){
              setState(() {
                Navigator.push(context, MaterialPageRoute(builder: (context) => ott()));
              });
            },
            child: Icon(Icons.arrow_back, color: Colors.white,)),
      ),
      backgroundColor: Colors.black,
      body: DefaultTabController(
        length: 3,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              SliverAppBar(
                  automaticallyImplyLeading: false,
                  expandedHeight: 750,
                  pinned: false,
                  forceElevated: innerBoxIsScrolled,
                  floating: true,
                  backgroundColor: Colors.black,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SingleChildScrollView(
                          child: Column(
                              children: [
                                Stack(
                                  children: [
                                    CarouselSlider.builder(
                                      options: CarouselOptions(
                                          scrollDirection: Axis.horizontal,
                                          height: 300.0,
                                          enlargeCenterPage: true,
                                          autoPlay: false,
                                          aspectRatio: 18 / 9,
                                          autoPlayCurve: Curves.fastOutSlowIn,
                                          enableInfiniteScroll: true,
                                          autoPlayAnimationDuration: Duration(milliseconds: 800),
                                          viewportFraction: 1,
                                          onPageChanged: (index, reason) {
                                            setState(() {
                                              currentindex = index;
                                            });
                                          }
                                      ),
                                      itemCount: r.length,
                                      itemBuilder: (BuildContext context, int index, int realIndex){
                                        return Container(
                                          height: 200,
                                          width: 410,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.rectangle,
                                            //borderRadius: BorderRadius.circular(10),
                                            image: DecorationImage(
                                                image: AssetImage(r[index]), fit: BoxFit.fill
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                      height: 40,
                                      width: 50,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage("Assets/netlogo.webp")),
                                      ),
                                    ),
                                    Text("S E R I E S", style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 12.0),
                                      child: Text("The Haunting of the Hill House", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 26)),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10.0),
                                      child: Text(" 2018", style: TextStyle(color: Colors.grey)),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        height: 23,
                                        width: 22,
                                        decoration: BoxDecoration(
                                          color: Colors.grey,
                                          border: Border.all(),
                                          borderRadius: BorderRadius.circular(5),
                                        ),
                                        child: Center(child: Text("A", style: TextStyle(color: Colors.white),)),
                                      ),
                                    ),
                                    Text("10 Episodes", style: TextStyle(color: Colors.grey)),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        height: 24,
                                        width: 37,
                                        decoration: BoxDecoration(
                                          border: Border.all(width: 2, color: Colors.grey),
                                          borderRadius: BorderRadius.circular(3),
                                        ),
                                        child: Center(child: Text("HD", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),)),
                                      ),
                                    ),
                                    Icon(Icons.textsms_outlined, color: Colors.grey,)
                                  ],
                                ),
                                SizedBox(height: 5,),
                                Container(
                                  height: 50,
                                  width: 400,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: GestureDetector(
                                    onTap: (){
                                      setState(() {
                                        Navigator.push(context, MaterialPageRoute(builder: (context)=> SamplePlayer()));
                                      });
                                    },
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.play_arrow),
                                        Text("Play", style: TextStyle(color: Colors.black)),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: 5,),
                                Container(
                                  height: 50,
                                  width: 400,
                                  decoration: BoxDecoration(
                                    color: Colors.grey,
                                    border: Border.all(),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.download, color: Colors.white),
                                      Text("  Download E1", style: TextStyle(color: Colors.white)),
                                    ],
                                  ),
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(" The Haunting of the Hill House", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: ReadMoreText(
                                    "Starring: Michiel Huisman, Carla Gugino, Timothy Hutton, Elizabeth Reaser, Kate Seigal",
                                    style: TextStyle(color: Colors.grey),
                                    trimMode: TrimMode.Line,
                                    trimLines: 1,
                                    colorClickableText: Colors.white,
                                    trimCollapsedText: 'Show more',
                                    trimExpandedText: ' Show less',
                                    moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white70),
                                  ),
                                ),
                                // RichText(text: TextSpan(
                                //   text: "  Starring:", style: TextStyle(color: Colors.grey),
                                //   children: [TextSpan(text: " Michiel Huisman, Carla Gugino, Timothy Hutton, Elizabeth Reaser, Kate Seigal, Mike Flanagan", style: TextStyle(overflow: TextOverflow.ellipsis, color: Colors.white))]
                                // )),
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 11.0),
                                      child: Text("Creator: Mike Flanagan", style: TextStyle(color: Colors.grey)),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 5,),
                                Row(
                                  children:[
                                    Padding(
                                      padding: const EdgeInsets.only(left: 30.0),
                                      child: Column(
                                        children: [
                                          IconButton(
                                              onPressed: (){
                                                setState(() {
                                                  add = !add;
                                                });
                                              }, icon: Icon(add? Icons.verified : Icons. add, color: Colors.white,)),
                                          Text("My List", style: TextStyle(color: Colors.grey))
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 50.0, top: 20),
                                      child: Column(
                                        children: [
                                          Icon(Icons.thumbs_up_down_outlined, color: Colors.white,),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text("Rate", style: TextStyle(color: Colors.grey,)),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 50.0),
                                      child: Column(
                                        children: [
                                          SizedBox(height: 20,),
                                          Icon(Icons.share_outlined, color: Colors.white,),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text("Share", style: TextStyle(color: Colors.grey),),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ]),
                        )
                      ],
                    ),
                  ),
                  bottom: TabBar(
                    indicatorColor: Colors.red,
                    labelColor: Colors.white,
                    tabs: [
                      Tab(text: "Collection",),
                      Tab(text: "More Like This",),
                    ],
                  )
              )
            ];
          }, body: TabBarView(
          children: [
            Container(
              color: Colors.black,
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: 1,
                      crossAxisSpacing: 1,
                      crossAxisCount: 3),
                  itemCount: a.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(5),
                          image: DecorationImage(image: AssetImage(a[index]), fit: BoxFit.fill)
                      ),
                    );
                  }),
            ),
            Container(
                height: 300,
                color: Colors.black,
                child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 1,
                    crossAxisSpacing: 1),
                    itemCount: b.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(5),
                            image: DecorationImage(image: AssetImage(b[index]), fit: BoxFit.fill)
                        ),
                      );
                    })
            )
          ],
        ),
        ),
      ),
    );
  }
}


class SamplePlayer extends StatefulWidget  {
  SamplePlayer({Key? key}) : super(key: key);

  @override
  _SamplePlayerState createState() => _SamplePlayerState();
}

class _SamplePlayerState extends State<SamplePlayer> {
  List a = [
    "VMV.jpg",
    "VMM.jpg",
    "VM.jpg",
    "AKT.jpg",
  ];
  List b = [
    "Trailer",
    "Watchlist",
    "Like",
    "Not for me",
    "Share",
    "Content Advisory",
    "Customer Review"
  ];
  late FlickManager flickManager;
  @override
  void initState() {
    super.initState();
    flickManager = FlickManager(
        videoPlayerController:
        VideoPlayerController.networkUrl(Uri.parse("https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4"),
        ));
  }

  @override
  void dispose() {
    flickManager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          leading: GestureDetector(
              onTap: (){
                setState(() {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> netmve()));
                });
              },
              child: Icon(Icons.arrow_back, color: Colors.white,)),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => profile()));
              },
                  child: Icon(Icons.file_download_outlined, color: Colors.red,)),
            )
          ],
        ),
        backgroundColor: Colors.black,
        body: DefaultTabController(
          length: 3,
          child: NestedScrollView(headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              SliverAppBar(
                automaticallyImplyLeading: false,
                expandedHeight: 770,
                pinned: false,
                forceElevated: innerBoxIsScrolled,
                floating: true,
                backgroundColor: Colors.black,
                flexibleSpace: FlexibleSpaceBar(
                  background: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SingleChildScrollView(
                        // physics: NeverScrollableScrollPhysics(),
                        child: Column(
                          children: [
                            Container(
                              height: 250,
                              width: 400,
                              child: FlickVideoPlayer(
                                  flickManager: flickManager
                              ),
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text("The Haunting of the Hill House", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 26)),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: Text("2018", style: TextStyle(color: Colors.grey)),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    height: 23,
                                    width: 22,
                                    decoration: BoxDecoration(
                                      color: Colors.grey,
                                      border: Border.all(),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Center(child: Text("A", style: TextStyle(color: Colors.white),)),
                                  ),
                                ),
                                Text("10 Episodes", style: TextStyle(color: Colors.grey)),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    height: 24,
                                    width: 37,
                                    decoration: BoxDecoration(
                                      border: Border.all(width: 2, color: Colors.grey),
                                      borderRadius: BorderRadius.circular(3),
                                    ),
                                    child: Center(child: Text("HD", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),)),
                                  ),
                                ),
                                Icon(Icons.textsms_outlined, color: Colors.grey,)
                              ],
                            ),
                            Container(
                              height: 50,
                              width: 400,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.play_arrow),
                                  Text("Resume", style: TextStyle(color: Colors.black)),
                                ],
                              ),
                            ),
                            Container(
                              height: 50,
                              width: 400,
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                border: Border.all(),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.download, color: Colors.white),
                                  Text("  Download", style: TextStyle(color: Colors.white)),
                                ],
                              ),
                            ),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children:[
                                  Padding(
                                    padding: const EdgeInsets.only(left: 15.0),
                                    child: Column(
                                      children: [
                                        SizedBox(height: 20,),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Icon(Icons.video_settings, color: Colors.white,),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text("Trailer", style: TextStyle(color: Colors.white)),
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 25.0, top: 20),
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Icon(Icons.add,color: Colors.white,),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text("Watchlist", style: TextStyle(color: Colors.white,)),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 26.0),
                                    child: Column(
                                      children: [
                                        SizedBox(height: 20,),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Icon(Icons.restart_alt, color: Colors.white,),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text("Start over", style: TextStyle(color: Colors.white)),
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 30.0),
                                    child: Column(
                                      children: [
                                        SizedBox(height: 23,),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Icon(Icons.thumb_up_sharp,color: Colors.white,),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text("Like", style: TextStyle(color: Colors.white),),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 30.0, top: 20),
                                    child: Column(
                                      children: [
                                        SizedBox(height: 5,),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Icon(Icons.thumb_down_off_alt_sharp, color: Colors.white,),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text("Not for me", style: TextStyle(color: Colors.white,)),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 28.0, top: 20),
                                    child: Column(
                                      children: [
                                        SizedBox(height: 5,),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Icon(Icons.share, color: Colors.white,),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text("Share", style: TextStyle(color: Colors.white,)),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ReadMoreText(
                                'The Sequel to the worldwide smash hit. THe NUN follows Sister irene as she once again comes face to face with the demon, The Sequel to the worldwide smash hit. THe NUN follows Sister irene as she once again comes face to face with the demon',
                                style: TextStyle(color: Colors.grey),
                                trimMode: TrimMode.Line,
                                trimLines: 1,
                                colorClickableText: Colors.white,
                                trimCollapsedText: 'Show more',
                                trimExpandedText: ' Show less',
                                moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Text(" Horror ∘ Ominous ∘ Dark", style: TextStyle(color: Colors.white),),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Text(" 2023  8 min", style: TextStyle(color: Colors.grey),)
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Container(
                                    child: Text(" Languages", style: TextStyle(color: Colors.blue, fontSize: 15),),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 217.0),
                              child: Text("Audio (11), Subtitles (11)", style: TextStyle(color: Colors.grey, fontSize: 15),),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                bottom: TabBar(
                    indicatorColor: Colors.white,
                    labelColor: Colors.white,
                    tabs: [
                      Tab(text: "Related",),
                      Tab(text: "More Details",),
                    ]),
              )
            ];
          }, body: TabBarView(
            children: [
              ListView(
                children: [
                  ListTile(
                    title: Text("Cast and Crew", style: TextStyle(color: Colors.white),),
                    subtitle: Text("Details from IMBD", style: TextStyle(color: Colors.grey),),
                  ),
                  Container(
                    height: 400,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GridView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 1,
                            crossAxisSpacing: 1,
                          ),
                          itemCount: a.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              height: 80,
                              width: 80,
                              decoration: BoxDecoration(
                                  border: Border.all(),
                                  borderRadius: BorderRadius.circular(5),
                                  image: DecorationImage(image: AssetImage(a[index]), fit: BoxFit.fill)
                              ),
                            );
                          }),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Row(
                    children: [
                      Container(
                        height: 150,
                        width: 200,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("Assets/netflixlogo.jpg")
                            )
                        ),
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 148.0),
                            child: Text("Director", style: TextStyle(color: Colors.white),),
                          ),
                          SizedBox(width:200, child: Expanded(child: Text("Known for: The Haunting of BLY Manor, The Midnight Club, Ouija : Origin of Evil, Midnight Mass", style: TextStyle(color: Colors.white))))
                        ],
                      )
                    ],
                  )
                ],
              ),
              ListView(
                children: [
                  Container(
                    child: ListTile(
                      title: Text("Genres", style: TextStyle(color: Colors.white),),
                      subtitle: Text("Horror, Drama, Suspense", style: TextStyle(color: Colors.grey),),
                    ),
                  ),
                  ListTile(
                    title: Text("Directors", style: TextStyle(color: Colors.white),),
                    subtitle: Text("Mike Flanagan", style: TextStyle(color: Colors.grey),),
                  ),
                  ListTile(
                    title: Text("Cast", style: TextStyle(color: Colors.white),),
                    subtitle: Text("Victoria Pedrretti, Oliver Jackson-Cohen, Henry Thomas, Amelia Eve, T'Nia Miller, Rahul Kohli, Tahirah Shariff, Amelie Bea Smith, Benjamin Evan Ainsworth", style: TextStyle(color: Colors.grey),),
                  ),
                  ListTile(
                    title: Text("Maturity Rating", style: TextStyle(color: Colors.white),),
                    subtitle: Text("U/A", style: TextStyle(color: Colors.grey),),
                  ),
                  ListTile(
                    title: Text("Customer Reviews", style: TextStyle(color: Colors.white),),
                    subtitle: Text("We don't Have any customer reviews.", style: TextStyle(color: Colors.grey),),
                  ),
                ],
              ),
            ],
          )),
        )
    );
  }
}


class profile extends StatefulWidget {
  const profile({super.key});

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  String? imgPath;
  File? imgFile;
  void getImg() async {
    final pickedImage =
    await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      saveData(
        pickedImage.path.toString(),
      ); // path cache
      setState(() {
        imgFile = File(pickedImage.path);
      });
    }
  }

  Future<void> saveData(String val) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('path', val);

    print("Data saved to SharedPreferences:");
    print("Path: $val");

    setState(() {
      imgPath = val;
    });
    // String base64Image = base64Encode(File(val).readAsBytesSync());
    getData();
  }
  void getData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    print("Retrieving data from SharedPreferences...");
    setState(() {
      imgPath = preferences.getString('path');
    });
  }
  void initState(){
    super.initState();
    getData();
  }

  ris() async {
    setState(() {
      imgPath=null;
      saveData("");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        title: Text("My Netflix", style: TextStyle(color: Colors.white),),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.search, color: Colors.white,),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector( onTap: (){
              showModalBottomSheet<void>(
                context: context,
                builder: (BuildContext context) {
                  return Container(
                    height: 270,
                    width: double.infinity,
                    color: Colors.black54,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Icon(Icons.edit,color: Colors.white,),
                                  Text("   Manage Profiles", style: TextStyle(color: Colors.white, fontSize: 17),),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Icon(Icons.settings,color: Colors.white,),
                                  Text("   App Settings", style: TextStyle(color: Colors.white, fontSize: 17),),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Icon(Icons.person,color: Colors.white,),
                                  Text("   Account", style: TextStyle(color: Colors.white, fontSize: 17),),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Icon(Icons.help_outline_outlined,color: Colors.white,),
                                  Text("   Help", style: TextStyle(color: Colors.white, fontSize: 17),),
                                ],
                              ),
                            ),
                            GestureDetector(onTap: (){
                              setState(() {
                                Navigator.push(context, MaterialPageRoute(builder: (context)=> ott()));
                              });
                            },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: GestureDetector(onTap: (){
                                  setState(() {
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=> Splashscreen()));
                                  });
                                },
                                  child: Row(
                                    children: [
                                      Icon(Icons.output_outlined,color: Colors.white,),
                                      Text("   Sign Out", style: TextStyle(color: Colors.white, fontSize: 17),),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              );
            },
                child: Icon(Icons.menu, color: Colors.white,)),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 90,
              child: Stack(
                children: [
                  imgPath == null ? Container(child: Image.asset("Assets/netflixlogo.jpg")):
                  Container(
                    width: 100,
                    height: 200,
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                            image: FileImage(File(imgPath!)), fit: BoxFit.fill)
                    ),
                    // child: Image.file(image!),
                  ),
                  Positioned(
                      bottom: 1,
                      right: 3,
                      child: GestureDetector(onTap: (){
                        getImg();
                      },child: Icon(Icons.edit))
                  ),
                ],
              ),
            ),
            GestureDetector(onTap: (){
              setState(() {
                showModalBottomSheet<void>(
                  context: context,
                  builder: (BuildContext context) {
                    return Container(
                      height: 310,
                      width: double.infinity,
                      color: Colors.black54,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(height: 20,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("  Switch Profiles", style: TextStyle(color: Colors.white, fontSize: 24),),
                              IconButton(onPressed: (){
                                setState(() {
                                  Navigator.pop(context);
                                });
                              }, icon: Icon(Icons.close_outlined, color: Colors.white70,),)
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(height: 180,),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                   // imgPath == null ? Container(child: Image.asset("Assets/netflixlogo.jpg")):
                                    Stack(
                                        children: [Container(
                                          height: 100,
                                          width: 100,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: AssetImage("Assets/netflixlogo.jpg"), fit: BoxFit.fill
                                              )
                                                  //image: FileImage(File(imgPath!)), fit: BoxFit.fill)
                                          ),
                                        ),
                                          Positioned(
                                              bottom: 1,
                                              right: 3,
                                              child: GestureDetector(onTap:(){
                                                setState(() {
                                                  ris();
                                                });
                                              },
                                                  child: Icon(Icons.delete)))
                                        ]
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text("Rishi Vignesh", style: TextStyle(color: Colors.white, fontSize: 15),),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Container(
                                      height: 100,
                                      width: 100,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(image: AssetImage("Assets/netflixlogo.jpg"), fit: BoxFit.fill)
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text("Children", style: TextStyle(color: Colors.white, fontSize: 15),),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Container(
                                      height: 100,
                                      width: 100,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(image: AssetImage("Assets/netflixlogo.jpg"), fit: BoxFit.fill)
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text("Add Profile", style: TextStyle(color: Colors.white, fontSize: 15),),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: Icon(Icons.edit,color: Colors.white,),
                              ),
                              Text(" Manage Profiles", style: TextStyle(color: Colors.white, fontSize: 17),),
                            ],
                          )
                        ],
                      ),
                    );
                  },
                );
              });
            },
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 125.0),
                    child: Text("Rishi Vignesh", style: TextStyle(color: Colors.white, fontSize: 23),),
                  ),
                  Icon(Icons.arrow_drop_down_sharp, color: Colors.white,)
                ],
              ),
            ),
            SizedBox(height: 20,),
            ListTile(
              leading: Icon(Icons.notifications, color: Colors.red,),
              title: Text("Notifications", style: TextStyle(color: Colors.white),),
              trailing: Icon(Icons.arrow_forward_ios, color: Colors.white,),
            ),
            ListTile(
              leading: Icon(Icons.file_download_outlined, color: Colors.deepPurpleAccent,),
              title: Text("Downloads", style: TextStyle(color: Colors.white),),
              trailing: Icon(Icons.arrow_forward_ios, color: Colors.white,),
            ),
            ListTile(
              leading: Icon(Icons.favorite_rounded, color: Colors.blue,),
              title: Text("My List", style: TextStyle(color: Colors.white),),
              trailing: Icon(Icons.arrow_forward_ios, color: Colors.white,),
            ),
            ListTile(
              leading: Icon(Icons.local_movies, color: Colors.brown,),
              title: Text("Recently Watched", style: TextStyle(color: Colors.white),),
              trailing: Icon(Icons.arrow_forward_ios, color: Colors.white,),
            ),
            ListTile(
              leading: Icon(Icons.loop, color: Colors.yellow,),
              title: Text("Continue Watching", style: TextStyle(color: Colors.white),),
              trailing: Icon(Icons.arrow_forward_ios, color: Colors.white,),
            ),
            ListTile(
              leading: Icon(Icons.movie_creation, color: Colors.orangeAccent,),
              title: Text("Trailers You Have Watched", style: TextStyle(color: Colors.white),),
              trailing: Icon(Icons.arrow_forward_ios, color: Colors.white,),
            ),
          ],
        ),
      ),
    );
  }
}

