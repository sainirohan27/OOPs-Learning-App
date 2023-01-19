import 'package:flutter/material.dart';
import 'package:onlinelearning/QuestionPage.dart';
import 'data/questions.dart';
import 'QuestionPage.dart';

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  String chosenImg;
  String chosenTitle;

  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context).settings.arguments as Map;
    chosenImg = arguments['img'];
    chosenTitle = arguments['title'];
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Container(
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            color: Color(0xffe1eaff),
          ),
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Color(0xff2657ce),
            ),
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(20), //left and right edges
        //child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Text(
                        '$chosenTitle', // OOPs Concepts
                        style: TextStyle(
                          color: Color(0xff2657ce),
                          fontSize: 27,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      Text(
                        'Do it!',
                        style: TextStyle(
                            color: Colors.black.withOpacity(0.6),
                            fontSize: 20,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          color: Color(0xffff5954),
                        ),
                        child: Hero(
                          tag: '$chosenImg',
                          child: Container(
                            height: 200,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(30),
                              ),
                              image: DecorationImage(
                                image:
                                    AssetImage('assets/image/$chosenImg.png'),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      /*
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 2),
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                              color: Color(0xffd3defa),
                            ),
                          )
                        ],
                      ),*/
                      Text(
                        'Conceptual Output Questions',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 5,
                          crossAxisSpacing: 5.0,
                          mainAxisSpacing: 5.0,
                        ),
                        itemCount: 50,
                        itemBuilder: (context, index) {
                          return Card(
                            elevation: 6,
                            color: Color.fromRGBO(39, 87, 206, 1),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                            ),
                            child: InkWell(
                              onTap: () {
                                print('This worked ROHAN');
                                openQuestionPage('$index');
                              },
                              child: Center(
                                child: Text(
                                  "Q${index + 1}",
                                  style: TextStyle(
                                    shadows: <Shadow>[
                                      Shadow(
                                        offset: Offset(1, 1),
                                        blurRadius: 3.0,
                                        color: Color.fromARGB(255, 0, 0, 0),
                                      ),
                                    ],
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),

            /*
              NOT NEEDED
              Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    productListing(
                        'OOPs Definition',
                        'Object Oriented programming is a programming style that is associated with the concept of Class, Objects and various other concepts revolving around these two, like  Inheritance, Polymorphism, Abstraction, Encapsulation etc.',
                        'active'),
                    productListing('Language of Color',
                        'Learn about the language of..', 'inactive'),
                    productListing('Psychology of Color',
                        'Learn about the psychology of..', 'inactive'),
                    productListing('Language of Color',
                        'Learn about the language of..', 'inactive')
                  ],
                ),
              ),
            )*/
          ],
        ),
      ),
    );
  }

  //NOT NEEDED
  Column quizQuestion(String question, String answer, String image) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 10,
        ),
        Row(
          children: <Widget>[
            Expanded(
              child: Text(
                '$question',
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
        Column(
          children: <Widget>[
            Container(
              child: Column(
                children: <Widget>[
                  Text(
                    '$answer\n',
                    style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                  ),
                  if (image != 'none')
                    Image.asset('assets/image/interview_images/$image'),
                ],
              ),
            ),
            SizedBox(
              width: 15,
            ),
          ],
        ),
        Center(
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            width: MediaQuery.of(context).size.width * 0.85,
            height: 0.5,
            color: Colors.grey,
          ),
        ),
        SizedBox(
          height: 10, //line to question space
        ),
      ],
    );
  }

  void openQuestionPage(String index) {
    print('navigating to QUESTION PAGE');
    Navigator.pushNamed(context, '/questionPage',
        arguments: {'index': '$index'});
    /*
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => QuestionPage()),
    );*/
  }
}
