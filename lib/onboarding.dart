import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:solution_challenge/ed.dart';
import 'package:solution_challenge/mths3.dart';
import 'package:solution_challenge/myths.dart';
import 'package:solution_challenge/myths1.dart';
import 'package:solution_challenge/myths2.dart';
class Onboarding extends StatefulWidget {
  const Onboarding({Key? key}) : super(key: key);

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  PageController _controller=PageController();
  bool onLastPage=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
        Stack(
          children: [
            PageView(
              controller: _controller,
            onPageChanged: (index){
              setState(() {
                onLastPage=(index==3);
              });
            },
            children: [
              myths(),
              myths1(),
              myths2(),
              myths3(),
            ],
          ),
            Container(
              padding: EdgeInsets.only(bottom: 20),
              alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap:(){
                        Navigator.push(context,
                        MaterialPageRoute(builder: (context){
                          return Ed();
                        }
                        )
                        );
                      },
                        child: Text('return')),
                    SmoothPageIndicator(controller: _controller, count: 4),
                    GestureDetector(
                         onTap:(){
                     _controller.nextPage(
                        duration: Duration(milliseconds: 500), curve: Curves.easeIn);
                               },
                       child: Text('next'))
                  ],
                )),
          ],
        )
    );
  }
}
