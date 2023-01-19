import 'package:flutter/material.dart';
import 'package:flutter_syntax_view/flutter_syntax_view.dart';
import 'data/questions.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
//import 'dart:convert';

class QuestionPage extends StatefulWidget {
  @override
  _QuestionPageState createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  String choosenIndex;

  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context).settings.arguments as Map;
    choosenIndex = (arguments['index']);
    var temp = int.parse(choosenIndex);
    temp = temp + 1;
    choosenIndex = temp.toString();

    return Scaffold(
      appBar: AppBar(
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
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Text(
                        'Q$choosenIndex According to C++17 Standard, what is the output of this program?',
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      //Text(code),
                      SyntaxView(
                        code: data['$choosenIndex'][0], // Code text
                        syntax: Syntax.CPP, // Language
                        syntaxTheme: SyntaxTheme.vscodeLight(), // Theme
                        fontSize:
                            15.0, // Font............. size changed from 12
                        withZoom: true, // Enable/Disable zoom icon controls
                        withLinesCount: true, // Enable/Disable line number
                        expanded: false, // Enable/Disable container expansion
                      ),
                      SizedBox(
                        height: 20,
                      ),

                      /*
                      Text('OPTIONS COME HERE'),
                      ListView.builder(
                          itemCount: 5,
                          itemBuilder: (BuildContext context, int index) {
                            return ListTile(
                                leading: Icon(Icons.list),
                                trailing: Text(
                                  "GFG",
                                  style: TextStyle(
                                      color: Colors.green, fontSize: 15),
                                ),
                                title: 
                                  Text("List item $index"),
                          );
                        },
                      ),
                      */

                      new ListView.builder(
                        shrinkWrap: true,
                        itemCount: 4,
                        itemBuilder: (BuildContext ctxt, int index) {
                          return Container(
                            margin: new EdgeInsets.fromLTRB(10, 0, 10, 0),
                            width: 25.0,
                            height: 55.0,
                            child: Card(
                              clipBehavior: Clip.antiAlias,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0)),
                              color: Colors.white,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                    color: Colors.blue,
                                    width: 10,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Expanded(
                                    child: InkWell(
                                      onTap: () {
                                        print('selected Option is $index');
                                        int temp = index + 1;
                                        var selected = temp.toString();
                                        if (selected ==
                                            data['$choosenIndex'][5]) {
                                          print('CORRECT ANSWER!');
                                          AwesomeDialog(
                                              context: context,
                                              animType: AnimType.LEFTSLIDE,
                                              headerAnimationLoop: false,
                                              dialogType: DialogType.SUCCES,
                                              showCloseIcon: true,
                                              title: 'Correct Answer',
                                              desc:
                                                  'Congratulations, you are Learning Well',
                                              btnCancelOnPress: () {
                                                debugPrint('open explaination');
                                                AwesomeDialog(
                                                  context: context,
                                                  dialogType: DialogType.SUCCES,
                                                  //borderSide: BorderSide(color: Colors.green,width: 2),
                                                  buttonsBorderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(3)),
                                                  headerAnimationLoop: false,
                                                  animType:
                                                      AnimType.BOTTOMSLIDE,
                                                  //title: 'Explaination',
                                                  //desc:'${data['$choosenIndex'][6]}',
                                                  body: Padding(
                                                    padding: EdgeInsets.all(15),
                                                    child: Column(
                                                      children: <Widget>[
                                                        Text(
                                                          'Explaination\n',
                                                          style: TextStyle(
                                                            fontSize: 20,
                                                          ),
                                                        ),
                                                        Text(
                                                            '${data['$choosenIndex'][6]}'),
                                                      ],
                                                    ),
                                                  ),
                                                  showCloseIcon: true,
                                                  //btnCancelOnPress: () {},
                                                  btnOkOnPress: () {},
                                                )..show();
                                              },
                                              btnCancelText: 'See Explaination',
                                              btnCancelColor: Colors.blue,
                                              btnOkOnPress: () {
                                                debugPrint('OnClcik');
                                                //index = index + 1;
                                                if (int.parse(choosenIndex) <
                                                    50)
                                                  Navigator.popAndPushNamed(
                                                      context, '/questionPage',
                                                      arguments: {
                                                        'index':
                                                            '${choosenIndex}'
                                                      });
                                                if ((int.parse(choosenIndex) >=
                                                    50)) {
                                                  print(
                                                      "All questions completed");
                                                  AwesomeDialog(
                                                    context: context,
                                                    dialogType:
                                                        DialogType.SUCCES,
                                                    //borderSide: BorderSide(color: Colors.green,width: 2),
                                                    buttonsBorderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(3)),
                                                    headerAnimationLoop: false,
                                                    animType:
                                                        AnimType.BOTTOMSLIDE,
                                                    //title: 'Explaination',
                                                    //desc:'${data['$choosenIndex'][6]}',
                                                    body: Padding(
                                                      padding:
                                                          EdgeInsets.all(15),
                                                      child: Column(
                                                        children: <Widget>[
                                                          Text(
                                                            'Congratulations✨\nAll Questions Completed\nYou are a OOPs Ninja now!',
                                                            style: TextStyle(
                                                              fontSize: 20,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    showCloseIcon: true,
                                                    //btnCancelOnPress: () {},
                                                    btnOkOnPress: () {
                                                      Navigator.pop(context);
                                                      //Navigator.pop(context);
                                                    },
                                                  )..show();
                                                }
                                              },
                                              btnOkText: 'Next Question',
                                              btnOkIcon: Icons.check_circle,
                                              onDissmissCallback: (type) {
                                                debugPrint(
                                                    'Dialog Dissmiss from callback $type');
                                              })
                                            ..show();
                                        }
                                        print(
                                            'correct answer is: ${data['$choosenIndex'][5]}');
                                        if (selected !=
                                            data['$choosenIndex'][5]) {
                                          //wrong answer
                                          print('Wrong answer');
                                          AwesomeDialog(
                                            context: context,
                                            dialogType: DialogType.ERROR,
                                            //borderSide: BorderSide(color: Colors.red, width: 2),
                                            width: 350,
                                            buttonsBorderRadius:
                                                BorderRadius.all(
                                                    Radius.circular(3)),
                                            headerAnimationLoop: false,
                                            animType: AnimType.BOTTOMSLIDE,
                                            title: 'Wrong Answer',
                                            desc:
                                                'The answer you have choosen is incorrect!',
                                            showCloseIcon: true,
                                            //btnCancelOnPress: () {},
                                            btnOkOnPress: () {
                                              title:
                                              Text('Try Again');
                                            },
                                            btnOkColor: Colors.red,
                                            btnOkText: 'Try Again!',
                                          )..show();
                                          /*
                                          showDialog<String>(
                                            context: context,
                                            builder: (BuildContext context) =>
                                            
                                                AlertDialog(
                                              title: const Text('Wrong Answer'),
                                              content: const Text(
                                                  'The answer you have choosen is not correct'),
                                              actions: <Widget>[
                                                Image.asset(
                                                    'assets/image/mcq/wrong2.gif'),
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          context, 'Try Again'),
                                                  child:
                                                      const Text('Try Again'),
                                                ),
                                              ],
                                            ),
                                          );*/
                                        }
                                        //setState(() {
                                        //_localVehicleSelected =
                                        //vdata[index]["pr"].toString();
                                        //});

                                        //doSomething(vdata[index]["pr"].toString());
                                      },
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          //new Row(
                                          // mainAxisSize: MainAxisSize.max,

                                          //children: <Widget>[

                                          Expanded(
                                            child: new Text(
                                              //'Test Plate $index',
                                              data['$choosenIndex'][index + 1],
                                            ),
                                          ),

                                          //style: Theme.of(context).textTheme.body2
                                          //],
                                          //),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      )

                      /*
                      Expanded(
                        child: ListView(
                          padding: const EdgeInsets.all(8),
                          children: <Widget>[
                            Container(
                              height: 50,
                              color: Colors.amber[600],
                              child: const Center(child: Text('Entry A')),
                            ),
                            Container(
                              height: 50,
                              color: Colors.amber[500],
                              child: const Center(child: Text('Entry B')),
                            ),
                            Container(
                              height: 50,
                              color: Colors.amber[100],
                              child: const Center(child: Text('Entry C')),
                            ),
                          ],
                        ),
                      )*/
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  /*
    return Scaffold(
      appBar: AppBar(
        title: Text('question here'),
      ),
      body: Column(
        children: <Widget>[
          Text('choosen question is $choosenIndex'),
          SyntaxView(
              code: """print('HelloWorld');""",
              syntax: Syntax.DART,
              expanded: false),
        ],
      ),
    ); 
  }
  */

/*
class MyStatelessWidget extends StatelessWidget {
  //const MyStatelessWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => 
      child: const Text('Show Dialog'),
    );
  }
}

*/
}
