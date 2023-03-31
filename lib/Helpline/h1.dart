import 'package:flutter/material.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
class h1 extends StatelessWidget {
  const h1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[100],
        title:  Image.asset('images/logo2.png',
          fit:BoxFit.contain,
          height: 50,
          alignment: Alignment.center,
        ),
        actions: <Widget>[

        ],
      ),
    backgroundColor: Colors.white,
    body:
    Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          SizedBox(height: 40,),
          Container(
            height: 230,
            child: Stack(
              children: [
                Positioned(
                  top: 35,
                    child: Material(
                      child: Container(
                    height: 180,
                    width: 400,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(0.0),
                      boxShadow:[new BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                        offset: new Offset(-10, 10),
                        blurRadius: 20,
                        spreadRadius: 4
                      ),]
                    ),
                  ),
                )),
                Positioned(
                    child: Card(
                      elevation: 10,
                      shadowColor: Colors.grey.withOpacity(0.5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Container(
                        height: 200,
                        width: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage("images/physiotherapy.png"),
                          )
                        ),
                      ),
                    )
                )
              ],
            ),
          ),
          SizedBox(height: 40.0,),
          CircleAvatar(
            radius: 80,
            backgroundColor: Colors.purple[100],
            backgroundImage: AssetImage('images/physiotherapy.png'),
          ),
          SizedBox(height: 40.0,),
          CircleAvatar(
            radius: 80,
            backgroundColor: Colors.white,
            backgroundImage: AssetImage('images/maps.png'),
          ),


        ],
      ),
    ),
    );
  }
}
