import 'package:flutter/material.dart';
import 'package:solution_challenge/service/auth.dart';

import '../loading.dart';

class SignIn extends StatefulWidget {
  final  toggleView;
  const SignIn({Key?key,this.toggleView}):super(key:key);


  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final  AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;
  String email='';
  String password ='';
  String error='';
  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
      resizeToAvoidBottomInset : false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.purple[100],
        elevation: 0.0,
        title: Text('Log In'),
      ),
      body:Container(
          padding:EdgeInsets.symmetric(vertical: 20.0,horizontal: 50.0),
          child: Form(
              key:_formKey,
              child: Column(
                children: [
                  Container(
                    //height: 200,
                    child: Image.asset("images/login_img1.png"),
                  ),
                  SizedBox(height: 50.0),
                  TextFormField(
                      decoration: InputDecoration(
                        hintText: "Your Email",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      validator: (val) => val!.isEmpty?'Enter email':null,
                      onChanged: (val){
                        setState(() => email=val);
                      }
                  ),
                  SizedBox(height:20.0),
                  TextFormField(
                      decoration: InputDecoration(
                        hintText: "Your Password",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      obscureText: true,
                      validator: (val) => val!.length<6?'Enter a password 6+ chars long':null,
                      onChanged: (val){
                        setState(() => password=val);
                      }
                  ),
                  SizedBox(height:7.0),
                  Text(
                    error,
                    style: TextStyle(color: Colors.red,fontSize: 12.0),

                  ),
                  SizedBox(height:8.0),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.purple[200],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                      onPressed: () async{
                        if(_formKey.currentState!.validate()){
                          setState(()=> loading=true);
                          dynamic result = await _auth.signInWithEmailAndPassword(email, password);
                          if(result==null){
                            setState((){
                            error='Could not LogIn with those Credentials';
                            loading =false;
                          });
                          }
                        }
                      },
                      child: Text(
                        'Log In',
                        style: TextStyle(color: Colors.white,
                            fontSize: 18),
                      )),
                  SizedBox(height: 7.0,),

                  //SizedBox(height: 5.0,),
                  TextButton(onPressed: () {
                    widget.toggleView();
                  },
                    child: Text(
                      'Don\'t have an Account? Sign Up',
                      style: TextStyle(color: Colors.purple[200],fontSize: 14.0),
                    ),),
                ],
              )
          )
      ),
    );
  }
}
