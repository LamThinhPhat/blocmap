

import 'package:blocmap/bloc/loginBloc/login_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  @override
  Widget build(BuildContext context) {
    var loginBLoc = BlocProvider.of<LoginBloc>(context);
    final usernameController = TextEditingController();
    final passwordController = TextEditingController();
    return Scaffold(
      body: SafeArea(
          child: BlocConsumer(
            bloc: loginBLoc,
            listener: (context, state) {
              if (state is LoginSucessState)
                {
                  Navigator.pushNamed(context, "/map-screen");
                }
            },
            builder: (context, state) {
              return Container(
                color: Colors.white,
                padding: EdgeInsets.fromLTRB(0, 30, 0, 30),
                constraints: BoxConstraints.expand(),
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      const SizedBox(
                        height: 50,
                      ),
                      Container(
                        height: 70,
                        child: Image(image: CachedNetworkImageProvider("https://static.vecteezy.com/system/resources/previews/001/193/929/original/vintage-car-png.png")),
                      ),
                      const Padding(
                        padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                        child: Text("Welcome to Wiber", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(50, 30, 50, 30),
                        child: TextField(
                          controller: usernameController,
                          style: TextStyle(fontSize: 18, color: Colors.black),
                          decoration: InputDecoration(
                            labelText: "whatever you want",
                            errorText: state is UsernameFailState ? "Please provide valid username" : null,
                            prefixIcon: Container (
                              width: 50,
                              child: Icon(Icons.phone),
                            ),
                            border: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(15)),
                                borderSide: BorderSide(color: Colors.black, width: 1)
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(50, 0, 50, 30),
                        child: TextField(
                          controller: passwordController,
                          style: TextStyle(color: Colors.black, fontSize: 18),
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: "Password",
                            errorText: state is PasswordFailState ? "Please provide valid password" : null,
                            prefixIcon: Container(
                              width: 50,
                              child: Icon(Icons.lock),
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(15)),
                                borderSide: BorderSide(color: Colors.black, width: 1)
                            ),
                          ),
                        ),
                      ),
                      RaisedButton(
                        onPressed: (){
                          print(usernameController.text + " " + passwordController.text + state.toString());
                          loginBLoc.add(LoginEvent(usernameController.text, passwordController.text));
                        },
                        child:
                        Text("Sign in", style: TextStyle(fontSize: 18, color: Colors.white)),
                        color: Colors.blueAccent,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15))
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          )
      ),
    );
  }
}
