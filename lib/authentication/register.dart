import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:solution_challenge/loading.dart';
import 'package:solution_challenge/service/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class Register extends StatefulWidget {
  final  toggleView;
  const Register({Key? key,this.toggleView}):super(key:key);
  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final controller = TextEditingController();
  final AuthService _auth= AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;
  String email='';
  String name= '';
  String gender='';
  String age='';
  String password='';
  String error='';
  @override
  Widget build(BuildContext context) {
    return loading ? Loading() :Scaffold(
      resizeToAvoidBottomInset : false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.purple[100],
        elevation: 0.0,
        title: Text('Sign up'),
      ),
      body:Container(
          padding:EdgeInsets.symmetric(vertical: 20.0,horizontal: 50.0),
          child: Form(
              key: _formKey,
              child:ListView(
                children: [
                  Container(
                    //height: 200,
                    child: Image.asset("images/register_img1.png"),
                  ),
                  SizedBox(height: 50.0),
                  TextFormField(
                      decoration: InputDecoration(
                        hintText: "Your Name",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      validator: (val) => val!.isEmpty?'Enter name':null,
                      onChanged: (val){
                        setState(() => name=val);
                      }
                  ),
                  SizedBox(height:20.0),
                  TextFormField(
                      decoration: InputDecoration(
                        hintText: "Your age",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      validator: (val) => val!.isEmpty?'Enter age':null,
                      onChanged: (val){
                        setState(() => age=val);
                      }
                  ),
                  SizedBox(height:20.0),
                  TextFormField(
                      decoration: InputDecoration(
                        hintText: "Your Gender",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      validator: (val) => val!.isEmpty?'Enter Gender':null,
                      onChanged: (val){
                        setState(() => gender=val);
                      }
                  ),
                  SizedBox(height:20.0),
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
                    style: TextStyle(color: Colors.red,fontSize: 14.0),

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
                        setState(() {
                          loading = true;
                        });

                        //odk
                        final user=User2(
                          name: name,
                          gender: gender    ,
                          age: age,
                        );
                          createUser(user);
                        if(_formKey.currentState!.validate()){
                          dynamic result = await _auth.registerWithEmailAndPassword(email, password);
                          if(result==null){
                            setState(() {
                              error = 'Please type a valid Email';
                              loading = false;
                            });
                          }
                        }
                      },
                      child: Text(
                        'Register',
                        style: TextStyle(color: Colors.white,
                            fontSize: 18),
                      )),
                  SizedBox(height: 7.0,),
                  TextButton(onPressed: () {
                    widget.toggleView();
                  },
                    child: Text(
                      'Already have an Account? Sign In',
                      style: TextStyle(color: Colors.purple[200],fontSize: 14.0),
                    ),)

                ],
              )
          )
      ),
    );
  }

  void createUser(User2 user) async{
    final docUser = FirebaseFirestore.instance.collection('users').doc();
    final json=user.toJson();
    await docUser.set(json);
  }
}
class User2{
  late final String name;
  late final String gender;
  late final String age;
  User2({
    required this.name,
    required this.gender,
    required this.age,
});
  Map<String, dynamic> toJson() =>{
    'name':name,
    'gender':gender,
    'age':age,
  };
}