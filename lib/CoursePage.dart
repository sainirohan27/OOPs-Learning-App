import 'package:flutter/material.dart';
import 'package:flutter_syntax_view/flutter_syntax_view.dart';
import 'data/interview_ques_state.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:onlinelearning/AdState.dart';
import 'MainPage.dart';
import 'package:provider/provider.dart';

class CoursePage extends StatefulWidget {
  @override
  _CoursePageState createState() => _CoursePageState();
}

class _CoursePageState extends State<CoursePage> {
  // ad code commented below
  /*
  BannerAd _bannerAd;
  BannerAd createBannerAdd()
  {
    return BannerAd(
    adUnitId: BannerAd.testAdUnitId,
    size: AdSize.smartBanner,
    //listener: BannerAdListener(),
    
    listener: (MobileAdEvent event)
    {
      print('Banner Event: $event');
    }
    );
  }
  */

  String chosenImg;
  String chosenTitle;
/*
  BannerAd banner;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final adState = Provider.of<AdState>(context);
    adState.initialization.then((status) {
      setState(() {
        banner = BannerAd(
          adUnitId: adState.bannerAdUnitId, //adState.bannerAdUnitId,
          size: AdSize.banner, //AdSize.banner,
          request: AdRequest(),
          listener: adState.adListener,
        )..load();
      });
    });
  }
*/
  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context).settings.arguments as Map;
    chosenImg = arguments['img'];
    chosenTitle = arguments['title'];
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '$chosenTitle', // OOPs Concepts
          style: TextStyle(
              color: Color(0xff2657ce),
              fontSize: 27,
              fontWeight: FontWeight.w800),
        ),
        centerTitle: true,
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
        padding: EdgeInsets.fromLTRB(20, 3, 20, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Text(
                        'Theory Basics',
                        style: TextStyle(
                            color: Colors.black.withOpacity(0.6), fontSize: 20),
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
                      /*Row(
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
                        'Course',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        'OOPs Definition',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          color: Color(0xffff5954),
                        ),
                      ),
                      Text(
                        '\nObject Oriented programming is a programming style that is associated with the concept of Class, Objects and various other concepts revolving around these two, like  Inheritance, Polymorphism, Abstraction, Encapsulation etc.',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.black.withOpacity(0.6),
                        ),
                      ),
                      Image.asset('assets/image/course_images/oops.png'),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        'Class and Object',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          color: Color(0xffff5954),
                        ),
                      ),
                      Image.asset(
                          'assets/image/course_images/class_object.png'),

                      RichText(
                        text: new TextSpan(
                          style: new TextStyle(
                            fontSize: 14.0,
                            color: Colors.black,
                          ),
                          children: <TextSpan>[
                            new TextSpan(
                              text: '\nClass: ',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w900,
                                color: Colors.black.withOpacity(0.8),
                              ),
                            ),
                            new TextSpan(
                              text:
                                  'A class is the building block, that leads to Object-Oriented programming. It is a user-defined data type, which holds its own data members and member functions, which can be accessed and used by creating an instance of that class. A class is like a blueprint for an object. ',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Colors.black.withOpacity(0.6),
                              ),
                            ),
                          ],
                        ),
                      ),

                      //Text(code),
                      SyntaxView(
                        code: """
//Syntax of Class in C++  
class student
{
  public: // <- visibility mode          

      //data members
      int id;
      int mobile;
      string name;
      
      //member functions
      int add(int x, int y)
      {
          return x+y;
      }
};""", // Code text
                        syntax: Syntax.CPP, // Language
                        syntaxTheme: SyntaxTheme.vscodeLight(), // Theme
                        fontSize: 12.0, // Font size
                        withZoom: true, // Enable/Disable zoom icon controls
                        withLinesCount: true, // Enable/Disable line number
                        expanded: false, // Enable/Disable container expansion
                      ),

                      RichText(
                        text: new TextSpan(
                          style: new TextStyle(
                            fontSize: 14.0,
                            color: Colors.black,
                          ),
                          children: <TextSpan>[
                            new TextSpan(
                              text: '\nObject: ',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w800,
                                color: Colors.black.withOpacity(0.8),
                              ),
                            ),
                            new TextSpan(
                              text:
                                  'An Object is an identifiable entity with some characteristics and behaviour. An Object is an instance of a Class.',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Colors.black.withOpacity(0.6),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SyntaxView(
                        code: """
//Syntax of Object in C++                   
student s;
};""", // Code text
                        syntax: Syntax.CPP, // Language
                        syntaxTheme: SyntaxTheme.vscodeLight(), // Theme
                        fontSize: 12.0, // Font size
                        withZoom: true, // Enable/Disable zoom icon controls
                        withLinesCount: true, // Enable/Disable line number
                        expanded: false, // Enable/Disable container expansion
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        'Pillars of OOPs',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          color: Color(0xffff5954),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Image.asset('assets/image/course_images/pillars.png'),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'The Four Principles of Object-Oriented-Programming (OOP):\n1) Abstraction \n2) Encapsulation \n3) Inheritance \n4) Polymorphism',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.black.withOpacity(0.6),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),

                      Row(
                        children: <Widget>[
                          Text(
                            '1) Abstraction',
                            style: TextStyle(
                              fontSize: 21,
                              fontWeight: FontWeight.w600,
                              color: Color.fromRGBO(235, 174, 52, 1),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      //Image.asset('assets/image/course_images/abstraction.png'),
                      Text(
                        'Abstraction is the concept of object-oriented programming that "shows" only essential attributes and "hides" unnecessary information. The main purpose of abstraction is hiding the unnecessary details from the users. It is one of the most important concepts of OOPs',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.black.withOpacity(0.6),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        children: <Widget>[
                          Text(
                            '2) Encapsulation',
                            style: TextStyle(
                              fontSize: 21,
                              fontWeight: FontWeight.w600,
                              color: Color(0xffff5954),
                            ),
                          ),
                        ],
                      ),

                      SizedBox(
                        height: 10,
                      ),
                      Image.asset(
                          'assets/image/course_images/encapsulation.png'),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Encapsulation is defined as wrapping up of data and information under a single unit. In Object Oriented Programming, Encapsulation is defined as binding together the data and the functions that manipulates them.',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.black.withOpacity(0.6),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),

                      Row(
                        children: <Widget>[
                          Text(
                            '3) Polymorphism',
                            style: TextStyle(
                              fontSize: 21,
                              fontWeight: FontWeight.w600,
                              color: Color.fromRGBO(52, 205, 235, 1),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Image.asset(
                          'assets/image/course_images/Polymorphism.jpg'),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        '‘Poly’ means ‘Many’ and ‘Morph’ means ‘Forms’. Polymorphism is the ability of any data to be processed in more than one form. It is the ability of an object or reference to take many forms in different instances. It implements the concept of function overloading, function overriding and virtual functions.',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.black.withOpacity(0.6),
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        """Types of Polymorphism :-""",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                          color: Colors.black.withOpacity(0.8),
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        """
a) Compile Time Polymorphism (Static)""",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                          color: Colors.green.withOpacity(1),
                        ),
                      ),
                      Text(
                        'The polymorphism which is implemented at the compile time is known as compile-time polymorphism. Example -Method Overloading',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black.withOpacity(0.6),
                        ),
                      ),
                      RichText(
                        text: new TextSpan(
                          style: new TextStyle(
                            fontSize: 14.0,
                            color: Colors.black,
                          ),
                          children: <TextSpan>[
                            new TextSpan(
                              text: '\nMethod Overloading: ',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w800,
                                color: Colors.black.withOpacity(0.8),
                              ),
                            ),
                            new TextSpan(
                              text:
                                  'Method overloading is a technique which allows you to have more than one function with the same function name but with different functionality.\nMethod overloading can be possible on thefollowing basis:\n1. The return type of the overloaded function.\n2. The type of the parameters passed to the function.\n3. The number of parameters passed to the function.',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.black.withOpacity(0.6),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      SyntaxView(
                        code: """
//Example of Method Overloading                        
#include<bits/stdc++.h>
using namespace std;
class Add {
    public:
        int add(int a,int b){
            return (a + b);
            
        }
        int add(int a,int b,int c){
            return (a + b + c);
        }
};

int main()
{
    Add obj;
    int res1,res2;
    res1 = obj.add(2,3);
    res2 = obj.add(2,3,4);
    cout << res1 << " " << res2 << endl;
    return 0;
}

/*
Output : 5 9
add() is an overloaded function with a 
different number of parameters. */""", // Code text
                        syntax: Syntax.CPP, // Language
                        syntaxTheme: SyntaxTheme.vscodeLight(), // Theme
                        fontSize: 12.0, // Font size
                        withZoom: true, // Enable/Disable zoom icon controls
                        withLinesCount: true, // Enable/Disable line number
                        expanded: false, // Enable/Disable container expansion
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Text(
                        """
b) Run Time Polymorphism (Dynamic)""",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                          color: Colors.green.withOpacity(1),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Runtime polymorphism is also known as dynamic polymorphism. Function overriding is an example of runtime polymorphism.',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black.withOpacity(0.6),
                        ),
                      ),
                      RichText(
                        text: new TextSpan(
                          style: new TextStyle(
                            fontSize: 14.0,
                            color: Colors.black,
                          ),
                          children: <TextSpan>[
                            new TextSpan(
                              text: '\nFunction Overriding: ',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w800,
                                color: Colors.black.withOpacity(0.8),
                              ),
                            ),
                            new TextSpan(
                              text:
                                  """Function overriding means when the child class contains the method which is already present in the parent class. Hence, the child class overrides the method of the parent class. In case of function overriding, parent and child classes both contain the same function with a different definition. The call to the function is determined at runtime is known as runtime polymorphism.""",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.black.withOpacity(0.6),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      SyntaxView(
                        code: """//Example of Runtime Polymorphism
#include <bits/stdc++.h>
using namespace std;
class Base_class{
   public:
      virtual void show(){
         cout << "Code Library base" << endl;
      }
};
class Derived_class : public Base_class{
   public:
      void show(){
         cout << "Code Library derived" << endl;
      }
};
int main(){
   Base_class* b;
   Derived_class d;
   b = &d;
   b->show(); 
   // prints the content of show() declared in derived class
   return 0;
}""", // Code text
                        syntax: Syntax.CPP, // Language
                        syntaxTheme: SyntaxTheme.vscodeLight(), // Theme
                        fontSize: 12.0, // Font size
                        withZoom: true, // Enable/Disable zoom icon controls
                        withLinesCount: true, // Enable/Disable line number
                        expanded: false, // Enable/Disable container expansion
                      ),

                      SizedBox(
                        height: 30,
                      ),

                      Row(
                        children: <Widget>[
                          Text(
                            '4) Inheritance',
                            style: TextStyle(
                              fontSize: 21,
                              fontWeight: FontWeight.w600,
                              color: Color.fromRGBO(139, 105, 224, 1),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Image.asset('assets/image/course_images/inheritance.png'),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Inheritance is the procedure in which one class inherits the attributes and methods of another class. The class whose properties and methods are inherited is known as the Parent class.\n',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.black.withOpacity(0.6),
                        ),
                      ),
                      SyntaxView(
                        code: """//Syntax of Inheritance
class derived_class_name :: visibility_mode base_class_name;
//visibility_modes = {private, protected, public}

""", // Code text
                        syntax: Syntax.CPP, // Language
                        syntaxTheme: SyntaxTheme.vscodeLight(), // Theme
                        fontSize: 12.0, // Font size
                        withZoom: true, // Enable/Disable zoom icon controls
                        withLinesCount: true, // Enable/Disable line number
                        expanded: false, // Enable/Disable container expansion
                      ),

                      Row(
                        children: <Widget>[
                          Text(
                            'Inheritance is of the following types:',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.black.withOpacity(0.8),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Text(
                            'a)	Single inheritance\nb) Multiple Inheritance\nc) Hierarchical Inheritance\nd) Multilevel Inheritance\ne) Hybrid Inheritance\n',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.black.withOpacity(0.6),
                            ),
                          )
                        ],
                      ),
                      Image.asset('assets/image/course_images/types.jpg'),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        'Constructors',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          color: Color(0xffff5954),
                        ),
                      ),
                      RichText(
                        text: new TextSpan(
                          style: new TextStyle(
                            fontSize: 14.0,
                            color: Colors.black,
                          ),
                          children: <TextSpan>[
                            new TextSpan(
                              text: '\nConstructor: ',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w800,
                                color: Colors.black.withOpacity(0.8),
                              ),
                            ),
                            new TextSpan(
                              text:
                                  """Constructor is a special method which is invoked automatically
at the time of object creation. It is used to initialize the data members of
new objects generally. The constructor in C++ has the same name as class or
structure.""",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Colors.black.withOpacity(0.6),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        """Types of constructors :-""",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.black.withOpacity(0.6),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      RichText(
                        text: new TextSpan(
                          style: new TextStyle(
                            fontSize: 14.0,
                            color: Colors.black,
                          ),
                          children: <TextSpan>[
                            new TextSpan(
                              text: 'a) Default constructor :',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w800,
                                color: Colors.black.withOpacity(0.8),
                              ),
                            ),
                            new TextSpan(
                              text:
                                  """ A constructor which has no argument is known as default constructor. It is invoked at the time of creating an object.""",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Colors.black.withOpacity(0.6),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      RichText(
                        text: new TextSpan(
                          style: new TextStyle(
                            fontSize: 14.0,
                            color: Colors.black,
                          ),
                          children: <TextSpan>[
                            new TextSpan(
                              text: 'b) Parameterized constructor :',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w800,
                                color: Colors.black.withOpacity(0.8),
                              ),
                            ),
                            new TextSpan(
                              text:
                                  """ Constructor which has parameters is called a parameterized constructor. It is used to provide different values to distinct objects.""",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Colors.black.withOpacity(0.6),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      RichText(
                        text: new TextSpan(
                          style: new TextStyle(
                            fontSize: 14.0,
                            color: Colors.black,
                          ),
                          children: <TextSpan>[
                            new TextSpan(
                              text: 'c) Copy Constructor :',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w800,
                                color: Colors.black.withOpacity(0.8),
                              ),
                            ),
                            new TextSpan(
                              text:
                                  """ A Copy constructor is an overloaded constructor used to declare and initialize an object from another object. It is of two types - default copy constructor and user defined copy constructor.""",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Colors.black.withOpacity(0.6),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      SyntaxView(
                        code: """// Syntax of constructor in C++
#include <bits/stdc++.h>
using namespace std;
class student {
   public:
      int x;
      student(int a){ 
         // parameterized constructor.
         x=a;
      } 
      student(student &i){ 
         // copy constructor
         x = i.x;
      }
};
int main(){
student s1(20); // Calling the parameterized constructor.
student s2(s1); // Calling the copy constructor.
cout << s2.x << endl;
return 0;
}
// Output : 20""", // Code text
                        syntax: Syntax.CPP, // Language
                        syntaxTheme: SyntaxTheme.vscodeLight(), // Theme
                        fontSize: 12.0, // Font size
                        withZoom: true, // Enable/Disable zoom icon controls
                        withLinesCount: true, // Enable/Disable line number
                        expanded: false, // Enable/Disable container expansion
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        'Friend Function',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          color: Color(0xffff5954),
                        ),
                      ),
                      SizedBox(
                        height: 9,
                      ),
                      Text(
                        'Friend function acts as a friend of the class. It can access the private and protected members of the class. The friend function is not a member of the class, but it must be listed in the class definition. The non-member function cannot access the private data of the class. Sometimes, it is necessary for the non-member function to access the data. The friend function is a non-member function and has the ability to access the private data of the class.',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.black.withOpacity(0.6),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      SyntaxView(
                        code: """//Example of Friend Function
#include <bits/stdc++.h>
using namespace std;
class A{
   int a = 2;
   int b = 4;
   public: // friend function
      friend int mul(A k){                   
         return (k.a * k.b);
      }
};

int main(){
   A obj;
   int res = mul(obj);
   cout << res << endl;
   return 0;
}
// Output : 8""", // Code text
                        syntax: Syntax.CPP, // Language
                        syntaxTheme: SyntaxTheme.vscodeLight(), // Theme
                        fontSize: 12.0, // Font size
                        withZoom: true, // Enable/Disable zoom icon controls
                        withLinesCount: true, // Enable/Disable line number
                        expanded: false, // Enable/Disable container expansion
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        'Virtual Function',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          color: Color(0xffff5954),
                        ),
                      ),
                      SizedBox(
                        height: 9,
                      ),
                      Text(
                        'A virtual function is used to replace the implementation provided by the base class. The replacement is always called whenever the object in question is actually of the derived class, even if the object is accessed by a base pointer rather than a derived pointer.',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.black.withOpacity(0.6),
                        ),
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Text(
                        'Key Points :\n1. Virtual functions cannot be static.\n2. A class may have a virtual destructor but it cannot have a virtual constructor.',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black.withOpacity(0.6),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      SyntaxView(
                        code: """//Example of Virtual Function
#include <bits/stdc++.h>
using namespace std;
class base {
public:
   // virtual function (re-defined in the derived class)
   virtual void print(){
      cout << "print base class" << endl;
   }
   void show(){
      cout << "show base class" << endl;
   }
};
class derived : public base {
   public: void print(){
      cout << "print derived class" << endl;
   }
   void show(){
      cout << "show derived class" << endl;
   }
};
int main(){
   base* bptr;
   derived d;
   bptr = &d;
   // virtual function, binded at runtime
   bptr->print();
   // Non-virtual function, binded at compile time
   bptr->show();
}
/*
output :
print derived class // (impact of virtual function)
show base class
*/""", // Code text
                        syntax: Syntax.CPP, // Language
                        syntaxTheme: SyntaxTheme.vscodeLight(), // Theme
                        fontSize: 12.0, // Font size
                        withZoom: true, // Enable/Disable zoom icon controls
                        withLinesCount: true, // Enable/Disable line number
                        expanded: false, // Enable/Disable container expansion
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        'Pure Virtual Function',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          color: Color(0xffff5954),
                        ),
                      ),
                      SizedBox(
                        height: 9,
                      ),
                      Text(
                        'a) A pure virtual function is not used for performing any task. It only serves as a placeholder.\nb) A pure virtual function is a function declared in the base class that has no definition relative to the base class.\nc) A class containing the pure virtual function cannot be used to declarethe objects of its own, such classes are known as abstract base classes.\nd) The main objective of the base class is to provide the traits to the derived classes and to create the base pointer used for achieving the runtime polymorphism.',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black.withOpacity(0.6),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      SyntaxView(
                        code: """//Example of Pure Virtual Function
#include<bits/stdc++.h>
using namespace std;
class Base{
   public:
      virtual void show() = 0;
};
class Derived : public Base {
   public:
      void show() {
         cout << "You can see me !" << endl;
      }
};
int main(){
   Base *bptr;
   Derived d;
   bptr = &d;
   bptr->show();
   return 0;
}
// output : You can see me !""", // Code text
                        syntax: Syntax.CPP, // Language
                        syntaxTheme: SyntaxTheme.vscodeLight(), // Theme
                        fontSize: 12.0, // Font size
                        withZoom: true, // Enable/Disable zoom icon controls
                        withLinesCount: true, // Enable/Disable line number
                        expanded: false, // Enable/Disable container expansion
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        'Abstract Classes',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          color: Color(0xffff5954),
                        ),
                      ),
                      SizedBox(
                        height: 9,
                      ),
                      Text(
                        'In C++ class is made abstract by declaring at least one of its functions as a pure virtual function. A pure virtual function is specified by placing "= 0" in its declaration. Its implementation must be provided by derived classes.',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black.withOpacity(0.6),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      SyntaxView(
                        code: """//Example of Abstract Class
#include<bits/stdc++.h>
using namespace std;
// abstract class
class Shape{
  public:
    virtual void draw()=0;
};
class Rectangle : Shape{
  public:
    void draw(){
      cout << "Rectangle" << endl;   
    }
};
class Square : Shape{
  public:
    void draw(){
      cout << "Square" << endl;
    }
};
int main(){
  Rectangle rec;
  Square sq;
  rec.draw();
  sq.draw();
  return 0;
}
/*
Output :
Rectangle
Square
*/""", // Code text
                        syntax: Syntax.CPP, // Language
                        syntaxTheme: SyntaxTheme.vscodeLight(), // Theme
                        fontSize: 12.0, // Font size
                        withZoom: true, // Enable/Disable zoom icon controls
                        withLinesCount: true, // Enable/Disable line number
                        expanded: false, // Enable/Disable container expansion
                      ),
                      SizedBox(
                        height: 30,
                      ),
                    ],
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
            ),
            //ad code commented below
            /*
            if (banner == null)
              SizedBox(
                height: 0,
              )
            else
              Container(
                height: 50,
                child: AdWidget(ad: banner),
              ),*/
          ],
        ),
      ),
    );
  }

  /*
  NOT NEEDED
  Column productListing(String title, String info, String activeOrInactive) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 10,
        ),
        Row(
          children: <Widget>[
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: (activeOrInactive == 'active')
                    ? Color(0xff2657ce)
                    : Color(0xffd3defa),
                borderRadius: BorderRadius.all(Radius.circular(17)),
              ),
              child: IconButton(
                icon: Icon(
                  Icons.play_arrow,
                  color: (activeOrInactive == 'active')
                      ? Colors.white
                      : Color(0xff2657ce),
                ),
              ),
            ),
            SizedBox(
              width: 15,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  '$title',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                Text(
                  '$info',
                  style: TextStyle(fontSize: 18, color: Colors.grey),
                )
              ],
            )
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
          height: 10,
        ),
      ],
    );
  }*/

}
