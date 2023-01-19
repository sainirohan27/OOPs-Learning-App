import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:onlinelearning/CoursePage.dart';
import 'package:onlinelearning/InterviewPage.dart';
import 'package:onlinelearning/QuizPage.dart';
import 'QuestionPage.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:url_launcher/url_launcher.dart';
// mainPage is the homescreen

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: mainPage(),
      routes: {
        '/coursePage': (context) => CoursePage(),
        '/interviewPage': (context) => InterviewPage(),
        '/quizPage': (context) => QuizPage(),
        '/questionPage': (context) => QuestionPage(),
      },
    );
  }
}

class mainPage extends StatefulWidget {
  @override
  _mainPageState createState() => _mainPageState();
}

class _mainPageState extends State<mainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff4f6fd),
      body: Container(
        padding: EdgeInsets.only(top: 40, left: 25, right: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Hello Developer",
                  style: TextStyle(fontSize: 20, color: Colors.blueAccent),
                ),
                Container(
                  height: 30, //changed from 40
                  width: 40,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage('assets/image/profilePic.png'))),
                )
              ],
            ),
            SizedBox(
              height: 25,
            ),
            Text(
              'Object Oriented Programming (OOPS)',
              style: TextStyle(
                fontSize: 32,
                height: 1.3,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width * 0.41,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          courseWidget('Learn Theory', 'OOPs Concepts', 'img1',
                              Color(0xffff6a65), Color(0xffff5954)),
                          SizedBox(
                            height: 20,
                          ),
                          courseWidget('Interview', 'Most Asked in Interviews',
                              'img2', Color(0xffe9eefa), Colors.white),
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.41,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          SizedBox(
                            height: 50,
                          ),
                          courseWidget('Programming', 'MCQ Practice', 'img3',
                              Color(0xffe9eefa), Colors.white),
                          SizedBox(
                            height: 20,
                          ),
                          courseWidget('Feedback', 'Help us Improve', 'img4',
                              Color(0xffbdcddfa), Color(0xffcedaff)),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            /*Container(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    icon: Icon(
                      Icons.subscriptions,
                      color: Color(0xff2657ce),
                      size: 40,
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.play_circle_filled,
                      color: Color(0xff2657ce).withOpacity(0.5),
                      size: 40,
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.account_circle,
                      color: Color(0xff2657ce).withOpacity(0.5),
                      size: 40,
                    ),
                  ),
                ],
              ),
            )*/
          ],
        ),
      ),
    );
  }

  Container courseWidget(String category, String title, String img,
      Color categoryColor, Color bgColor) {
    return Container(
      padding: EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 10),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.all(Radius.circular(30)),
      ),
      child: InkWell(
        onTap: () {
          if (category == 'Learn Theory') {
            openCoursePage('$img', '$title');
          }
          if (category == 'Interview') {
            openInterviewPage('$img', '$title');
          }
          if (category == 'Programming') {
            print(1);
            openQuizPage('$img', '$title');
          }
          if (category == 'Feedback') {
            AwesomeDialog(
              context: context,
              dialogType: DialogType.INFO_REVERSED,
              //borderSide: BorderSide(color: Colors.red, width: 2),
              width: 350,
              buttonsBorderRadius: BorderRadius.all(Radius.circular(3)),
              headerAnimationLoop: false,
              animType: AnimType.BOTTOMSLIDE,
              title: 'OOPS!',
              desc: 'This page is under construction',
              showCloseIcon: true,
              //btnCancelOnPress: () {},
              btnOkOnPress: () {},
              btnOkColor: Colors.blue,
              btnOkText: 'Okay',
            )..show();
            debugPrint('under construction');
          }
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: categoryColor,
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: Text(
                '$category',
                style: TextStyle(
                    color: (categoryColor == Color(0xffe9eefa)
                        ? Color(0xff2657ce)
                        : Colors.white)),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              '$title',
              style: TextStyle(
                color: (bgColor == Color(0xffff5954))
                    ? Colors.white
                    : Colors.black,
                fontSize: 20,
                height: 1,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: <Widget>[
                Container(
                  height: 5,
                  width: 100,
                  color: (bgColor == Color(0xffff5954))
                      ? Colors.red
                      : Color(0xff2657ce),
                ),
                Expanded(
                  child: Container(
                    height: 5,
                    color: (bgColor == Color(0xffff5954))
                        ? Colors.white.withOpacity(0.5)
                        : Color(0xff2657ce).withOpacity(0.5),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Hero(
              tag: '$img',
              child: Container(
                height: 80,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/image/$img.png'),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void openCoursePage(String img, String title) {
    print('navigating to COURSE PAGE');
    Navigator.pushNamed(context, '/coursePage',
        arguments: {'img': '$img', 'title': '$title'});
  }

  void openInterviewPage(String img, String title) {
    print('navigating to INTERVIEW PAGE');
    Navigator.pushNamed(context, '/interviewPage',
        arguments: {'img': '$img', 'title': '$title'});
  }

  void openQuizPage(String img, String title) {
    print('navigating to Quiz PAGE');
    Navigator.pushNamed(context, '/quizPage',
        arguments: {'img': '$img', 'title': '$title'});
  }
}
