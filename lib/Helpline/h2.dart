import 'package:flutter/material.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
class h2 extends StatelessWidget {
  const h2 ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor: Colors.purple[100],
    body:
    Column(
      children: [

        Container(
          height: 200,
          child: Stack(
              children: [
                Positioned.fill(
                    child: Column(
                      children: [
                        Expanded(   child: Container(
                          color: Colors.deepPurple[600],

                        ),
                        ),

                      ],
                    )),
                Container(
                  margin:EdgeInsets.only(top: 40),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(icon: Icon(Icons.arrow_back_ios), onPressed: (){
                          Navigator.pop(context);
                        }),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child:  Align(
                    alignment: Alignment.topCenter,
                    child: Hero(
                      tag: 1,
                      child: Image.asset("images/calls1.png"),
                    ),
                  ),



                ),]
          ),
        ),

        SizedBox(height: 20,),
        Container(
          margin: EdgeInsets.all(20),
          child:TextFormField(
            decoration: new InputDecoration(

              labelText: "Enter Country",
              fillColor: Colors.deepPurple,
              border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(25.0),
                borderSide: new BorderSide(
                    color: Colors.deepPurple,
                ),
              ),
              //
            ),

            ),
          ),
SizedBox(height: 20,),
        Expanded(
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children:[
                    Image.asset('images/c1.png',
                    height: 60,
                      width: 60,
                    ),



                  ],
                ),
              ),
              SizedBox(height: 15,),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children:[
                    Image.asset('images/c1.png',
                      height: 60,
                      width: 60,
                    ),



                  ],
                ),
              ),
              SizedBox(height: 15,),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children:[
                    Image.asset('images/c1.png',
                      height: 60,
                      width: 60,
                    ),



                  ],
                ),
              ),
              SizedBox(height: 15,),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children:[
                    Image.asset('images/c1.png',
                      height: 60,
                      width: 60,
                    ),



                  ],
                ),
              ),
              SizedBox(height: 15,),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children:[
                    Image.asset('images/c1.png',
                      height: 60,
                      width: 60,
                    ),



                  ],
                ),
              ),
              SizedBox(height: 15,),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children:[
                    Image.asset('images/c1.png',
                      height: 60,
                      width: 60,
                    ),



                  ],
                ),
              ),
              SizedBox(height: 15,),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children:[
                    Image.asset('images/c1.png',
                      height: 60,
                      width: 60,
                    ),



                  ],
                ),
              ),
              SizedBox(height: 15,),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children:[
                    Image.asset('images/c1.png',
                      height: 60,
                      width: 60,
                    ),



                  ],
                ),
              ),
              SizedBox(height: 15,),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children:[
                    Image.asset('images/c1.png',
                      height: 60,
                      width: 60,
                    ),



                  ],
                ),
              ),
              SizedBox(height: 15,),

            ],
          ),
        ),



      ],
    ),
    );
  }
}
