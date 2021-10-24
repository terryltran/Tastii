import 'package:tastii/auth/signup.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized;
  runApp(App());
}

class App extends StatefulWidget {
  // Create the initialization Future outside of `build`:
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  /// The future is part of the state of our widget. We should not call `initializeApp`
  /// directly inside [build].
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          // return SomethingWentWrong();
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.blue,
              visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
            home: SignUp(),
          );
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return Text("Loading");
      },
    );
  }

  // class Login extends State<LoginState> {
  // @override
  // Widget build(BuildContext context) {
  // return Scaffold(
  // backgroundColor: Colors.white,
  // appBar: AppBar(
  // title: Text("Login Page"),
  // ),
  // body: SingleChildScrollView(
  // child: Column(
  // children: <Widget>[
  // Padding(
  // padding: const EdgeInsets.only(top: 40.0),
  // child: Center(
  // child: Container(
  // width: 200,
  // height: 150,
  // decoration: BoxDecoration(
  //                       color: Colors.red,
  //                       borderRadius: BorderRadius.circular(50.0)),
  // child: Image.asset('https://www.seekpng.com/png/small/811-8117274_pizza-slice-clipart-black-and-white-pizza-slice.png')),
  // ),
  // ),
  // Padding(
  // //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
  // padding: EdgeInsets.symmetric(horizontal: 15),
  // child: TextField(
  // decoration: InputDecoration(
  // border: OutlineInputBorder(),
  // labelText: 'Email',
  // hintText: 'Enter valid email id such as example@tastii.com'),
  // ),
  // ),
  // Padding(
  // padding: const EdgeInsets.only(
  // left: 15.0, right: 15.0, top: 15, bottom: 0),
  // padding: EdgeInsets.symmetric(horizontal: 15),
  // child: TextField(

  // obscureText: true,
  // decoration: InputDecoration(
  // border: OutlineInputBorder(),
  // labelText: 'Password',
  // hintText: 'Enter secure password'),
  // ),
  // ),
  // FlatButton(
  // onPressed: (){
  // //TODO FORGOT PASSWORD SCREEN GOES HERE
  // },
  // child: Text(
  // 'Forgot Password',
  // style: TextStyle(color: Colors.blue, fontSize: 15),
  // ),
  // ),
  // Container(
  // height: 50,
  // width: 250,
  // decoration: BoxDecoration(
  // color: Colors.blue, borderRadius: BorderRadius.circular(10)),
  // child: FlatButton(
  // onPressed: () {
  // Navigator.push(
  // context, MaterialPageRoute(builder: (_) => HomePage()));
  // },
  // child: Text(
  // 'Login',
  // style: TextStyle(color: Colors.blue, fontSize: 20),
  // ),
  // ),
  // ),
  // SizedBox(
  // height: 150,
  // ),
  // Text('New User? Create Account')
  // ],
  // ),
  // ),
  // );
  // }
  // }

  // class SignUp extends StatefulWidget {
  //   SignUp({Key key}) : super(key: key);

  //   @override
  //   _SignUpState createState() => _SignUpState();
  // }

  // class _SignUpState extends State<SignUp> {
    
  //   String email = '';
  //   String password = '';
  //   @override
  //   Widget build(BuildContext context) {
  //     return Scaffold(
  //       appBar:AppBar(
  //         backgroundColor: Colors.blue,
  //         elevation: 8,
  //         title: Text("Sign Up")
  //       )
  //       body: Container(
  //         padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
  //         child:new Form(
  //           child: Column(
  //             children: [
  //               TextFormField(
  //                 onChanged: (val) => setState((){
  //                   email = val;
  //                 }),
  //               ),
  //               TextFormField(
  //                 onChanged: (val) => setState((){
  //                   email = val;
  //                 }),
  //               ),
  //               RaisedButton(child: Text('SignUp'), onPressed: null)
  //             ],
  //           )
  //         )),
  //       ));
  //     )
  //   }
  // }

  // RaisedButton(
  //   child:Text('Signup'),
  //   onPressed: () async => {

  //   }
  // )
}
