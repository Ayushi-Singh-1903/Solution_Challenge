
import 'package:solution_challenge/Helpline/h1.dart';
import 'package:solution_challenge/Helpline/h2.dart';
import 'package:solution_challenge/searching/search.dart';
import 'ed.dart';
import 'package:solution_challenge/Community/communityData.dart';
var data = [
  {
    "title": "Sex Education",
    "color": 0xFFCE93D8,
    "image": "images/sexed.png",
    "onTap": Ed(),
  },
  {"title": "Community Platform", "color": 0xFFCE93D8, "image": "images/community.png","onTap":anecdotes()},
  {
    "title": "Am I Pregnant?",
    "color": 0xFFCE93D8,
    "image": "images/pt.png",
    "onTap": Search()
  },
  {
    "title": "Help",
    "color": 0xFFCE93D8,
    "image": "images/calls1.png",
    "onTap": h1()
  },



];