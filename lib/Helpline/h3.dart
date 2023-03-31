import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  ListPage({Key?key}) : super(key: key);


  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.1,
        backgroundColor: Colors.purple[200],
        title: Text("Therapists Available",
            style: TextStyle(color: Colors.black87)),
      ),
      body: Container(
        child: ListView(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            children: <Widget>[
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  color: Colors.purple[200],
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: 100,
                        height: 100,
                        child: Image.asset("images/jean.jpg"),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Dr. Jean Miller",
                              style: TextStyle(
                                fontSize: 17,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
//width: width,
                              child: ElevatedButton(onPressed: () {  }, child: Text(
                                'Book Now',
                                style: TextStyle(color: Colors.purple[200],
                                    fontSize: 12),
                              ),
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                    child: Card(
                      color: Colors.purple[200],
                      child: Row(
                        children: <Widget>[
                          Container(
                            width: 100,
                            height: 100,
                            child: Image.asset("images/mill.jpg"),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "Dr. Mattew Mills",
                                  style: TextStyle(
                                    fontSize: 17,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
//width: width,
                                  child: ElevatedButton(onPressed: () {  }, child: Text(
                                    'Book Now',
                                    style: TextStyle(color: Colors.purple[200],
                                        fontSize: 12),
                                  ),
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20.0),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  color: Colors.purple[200],
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: 100,
                        height: 100,
                        child: Image.asset("images/lincoln.png"),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Dr. Lincoln Park",
                              style: TextStyle(
                                fontSize: 17,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
//width: width,
                              child: ElevatedButton(onPressed: () {  }, child: Text(
                                'Book Now',
                                style: TextStyle(color: Colors.purple[200],
                                    fontSize: 12),
                              ),
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  color: Colors.purple[200],
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: 100,
                        height: 100,
                        child: Image.asset("images/hailey.jpg"),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Dr. Hailey George",
                              style: TextStyle(
                                fontSize: 17,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
//width: width,
                              child: ElevatedButton(onPressed: () {  }, child: Text(
                                'Book Now',
                                style: TextStyle(color: Colors.purple[200],
                                    fontSize: 12),
                              ),
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  color: Colors.purple[200],
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: 100,
                        height: 100,
                        child: Image.asset("images/john.jpg"),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Dr. John Kim",
                              style: TextStyle(
                                fontSize: 17,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
//width: width,
                              child: ElevatedButton(onPressed: () {  }, child: Text(
                                'Book Now',
                                style: TextStyle(color: Colors.purple[200],
                                    fontSize: 12),
                              ),
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  color: Colors.purple[200],
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: 100,
                        height: 100,
                        child: Image.asset("images/maya.jpg"),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Dr. Maya Sharma",
                              style: TextStyle(
                                fontSize: 17,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
//width: width,
                              child: ElevatedButton(onPressed: () {  }, child: Text(
                                'Book Now',
                                style: TextStyle(color: Colors.purple[200],
                                    fontSize: 12),
                              ),
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ]
        ),
      ),
    );
  }
}