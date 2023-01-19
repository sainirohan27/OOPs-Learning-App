import 'package:flutter/material.dart';
import 'package:custom_check_box/custom_check_box.dart';
//import 'package:roundcheckbox/roundcheckbox.dart';
import 'dart:async';
import 'data/interview_ques_state.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:onlinelearning/AdState.dart';
import 'MainPage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';

class InterviewPage extends StatefulWidget {
  @override
  _InterviewPageState createState() => _InterviewPageState();
}

//var inter_check = new List.filled(50, false);
class _InterviewPageState extends State<InterviewPage> {
  String chosenImg;
  String chosenTitle;

// ad code commented
/* 
  BannerAd banner;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final adState = Provider.of<AdState>(context);
    adState.initialization.then((status) {
      setState(() {
        banner = BannerAd(
          adUnitId: adState.bannerAdUnitId,
          size: AdSize.banner,
          request: AdRequest(),
          listener: adState.adListener,
        )..load();
      });
    });
  }*/

  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context).settings.arguments as Map;
    chosenImg = arguments['img'];
    chosenTitle = arguments['title'];
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0), // here the desired height
        child: AppBar(
          title: Text(
            '$chosenTitle', // OOPs Concepts
            style: TextStyle(
              color: Color(0xff2657ce),
              fontSize: 25,
              fontWeight: FontWeight.w700,
            ),
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
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(20, 3, 20, 0), //left and right edges
        //child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  child: Column(
                    children: <Widget>[
                      /*
                      Text(
                        '$chosenTitle', // OOPs Concepts
                        style: TextStyle(
                          color: Color(0xff2657ce),
                          fontSize: 27,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      */
                      Text(
                        'Interviewer\'s favourite',
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
                        'Top 50 Questions',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      productListing(
                          1,
                          'Q1. What is Object Oriented Programming?',
                          'Object-Oriented Programming(OOPs) is a type of programming that is based on objects rather than just functions and procedures. Individual objects are grouped into classes. OOPs implements real-world entities like inheritance, polymorphism, hiding, etc into programming. It also allows binding data and code together.\n',
                          'none'),
                      productListing(
                          2,
                          'Q2. Why use OOPs?',
                          '•	OOPs allows clarity in programming there by allowing simplicity in solving complex problems\n•	Code can be reused through inheritance thereby reducing redundancy\n•	Data and code are bound together by encapsulation\n•	OOPs allows data hiding, therefore, private data is kept confidential\n•	Problems can be divided into different parts making it simple to solve\n•	The concept of polymorphism gives flexibility to the program by allowing the entities to have multiple forms',
                          'none'),
                      productListing(
                          3,
                          'Q3. What is the difference between OOP and SOP?',
                          '',
                          'ans3.png'),
                      productListing(
                          4,
                          'Q4. What are the main features of OOPs?',
                          '•	Inheritance\n•	Encapsulation\n•	Polymorphism\n•	Data Abstraction',
                          'none'),
                      Text(
                        'Interview Questions – Classes and Objects',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Color.fromRGBO(0, 141, 217, 1),
                        ),
                      ),
                      productListing(
                          5,
                          'Q5. What is an object?',
                          'An object is a real-world entity which is the basic unit of OOPs for example chair, cat, dog, etc. Different objects have different states or attributes, and behaviors.',
                          'none'),
                      productListing(
                          6,
                          'Q6. What is a class?',
                          'A class is a prototype that consists of objects in different states and with different behaviors. It has a number of methods that are common the objects present within that class.',
                          'none'),
                      productListing(
                          7,
                          'Q7. What is the difference between a class and a structure?',
                          'Class: User-defined blueprint from which objects are created. It consists of methods or set of instructions that are to be performed on the objects.\nStructure: A structure is basically a user-defined collection of variables which are of different data types.',
                          'none'),
                      productListing(
                          8,
                          'Q8. Can you call the base class method without creating an instance?',
                          'Yes, you can call the base class without instantiating it if:\n•	It is a static method\n•	The base class is inherited by some other subclass',
                          'none'),
                      productListing(
                          9,
                          'Q9. What is the difference between a class and an object?',
                          '',
                          'ans9.png'),
                      Text(
                        'Interview Questions – Inheritance',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Color.fromRGBO(0, 141, 217, 1),
                        ),
                      ),
                      productListing(
                          10,
                          'Q10. What is inheritance?',
                          'Inheritance is a feature of OOPs which allows classes inherit common properties from other classes. For example, if there is a class such as ‘vehicle’, other classes like ‘car’, ‘bike’, etc can inherit common properties from the vehicle class. This property helps you get rid of redundant code thereby reducing the overall size of the code.',
                          'none'),
                      productListing(
                          11,
                          'Q11. What are the different types of inheritance?',
                          '•	Single inheritance\n•	Multiple inheritance\n•	Multilevel inheritance\n•	Hierarchical inheritance\n•	Hybrid inheritance\n',
                          'none'),
                      productListing(
                          12,
                          'Q12. What is the difference between multiple and multilevel inheritance?',
                          '',
                          'ans12.png'),
                      productListing(
                          13,
                          'Q13. What is hybrid inheritance?',
                          'Hybrid inheritance is a combination of multiple and multi-level inheritance.',
                          'none'),
                      productListing(
                          14,
                          'Q14. What is hierarchical inheritance?',
                          'Hierarchical inheritance refers to inheritance where one base class has more than one subclasses. For example, the vehicle class can have ‘car’, ‘bike’, etc as its subclasses.',
                          'none'),
                      productListing(
                          15,
                          'Q15. What are the limitations of inheritance?',
                          '•	Increases the time and effort required to execute a program as it requires jumping back and forth between different classes\n•	The parent class and the child class get tightly coupled\n•	Any modifications to the program would require changes both in the parent as well as the child class\n•	Needs careful implementation else would lead to incorrect results\n',
                          'none'),
                      productListing(
                          16,
                          'Q16. What is a superclass?',
                          'A superclass or base class is a class that acts as a parent to some other class or classes. For example, the Vehicle class is a superclass of class Car.',
                          'none'),
                      productListing(
                          17,
                          'Q17. What is a subclass?',
                          'A class that inherits from another class is called the subclass. For example, the class Car is a subclass or a derived of Vehicle class.',
                          'none'),
                      Text(
                        'Interview Questions – Polymorphism',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Color.fromRGBO(0, 141, 217, 1),
                        ),
                      ),
                      productListing(
                          18,
                          'Q18. What is polymorphism?',
                          'Polymorphism refers to the ability to exist in multiple forms. Multiple definitions can be given to a single interface. For example, if you have a class named Vehicle, it can have a method named speed but you cannot define it because different vehicles have different speed. This method will be defined in the subclasses with different definitions for different vehicles.',
                          'none'),
                      productListing(
                          19,
                          'Q19. What is static polymorphism?',
                          'Static polymorphism (static binding) is a kind of polymorphism that occurs at compile time. An example of compile-time polymorphism is method overloading.',
                          'none'),
                      productListing(
                          20,
                          'Q20. What is dynamic polymorphism?',
                          'Runtime polymorphism or dynamic polymorphism (dynamic binding) is a type of polymorphism which is resolved during runtime. An example of runtime polymorphism is method overriding.',
                          'none'),
                      productListing(
                          21,
                          'Q21. What is method overloading?',
                          'Method overloading is a feature of OOPs which makes it possible to give the same name to more than one methods within a class if the arguments passed differ.',
                          'none'),
                      productListing(
                          22,
                          'Q22. What is method overriding?',
                          'Method overriding is a feature of OOPs by which the child class or the subclass can redefine methods present in the base class or parent class. Here, the method that is overridden has the same name as well as the signature meaning the arguments passed and the return type.',
                          'none'),
                      productListing(
                          23,
                          'Q23. What is operator overloading?',
                          'Operator overloading refers to implementing operators using user-defined types based on the arguments passed along with it.',
                          'none'),
                      productListing(
                          24,
                          'Q24. Differentiate between overloading and overriding.',
                          '',
                          'ans24.png'),
                      Text(
                        'Interview Questions – Encapsulation',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Color.fromRGBO(0, 141, 217, 1),
                        ),
                      ),
                      productListing(
                          25,
                          'Q25. What is encapsulation?',
                          'Encapsulation refers to binding the data and the code that works on that together in a single unit. For example, a class. Encapsulation also allows data-hiding as the data specified in one class is hidden from other classes.',
                          'none'),
                      productListing(
                          26,
                          'Q26. What are ‘access specifiers’?',
                          'Access specifiers or access modifiers are keywords that determine the accessibility of methods, classes, etc in OOPs. These access specifiers allow the implementation of encapsulation. The most common access specifiers are public, private and protected. However, there are a few more which are specific to the programming languages.',
                          'none'),
                      productListing(
                          27,
                          'Q27. What is the difference between public, private and protected access modifiers?',
                          '',
                          'ans27.png'),
                      Text(
                        'Interview Questions – Data abstraction',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Color.fromRGBO(0, 141, 217, 1),
                        ),
                      ),
                      productListing(
                          28,
                          'Q28. What is data abstraction?',
                          'Data abstraction is a very important feature of OOPs that allows displaying only the important information and hiding the implementation details. For example, while riding a bike, you know that if you raise the accelerator, the speed will increase, but you don’t know how it actually happens. This is data abstraction as the implementation details are hidden from the rider.',
                          'none'),
                      productListing(
                          29,
                          'Q29. How to achieve data abstraction?',
                          'Data abstraction can be achieved through:\n•	Abstract class\n•	Abstract method',
                          'none'),
                      productListing(
                          30,
                          'Q30. What is an abstract class?',
                          'An abstract class is a class that consists of abstract methods. These methods are basically declared but not defined. If these methods are to be used in some subclass, they need to be exclusively defined in the subclass.',
                          'none'),
                      productListing(
                          31,
                          'Q31. Can you create an instance of an abstract class?',
                          'No. Instances of an abstract class cannot be created because it does not have a complete implementation. However, instances of subclass inheriting the abstract class can be created.',
                          'none'),
                      productListing(
                          32,
                          'Q32. What is an interface?',
                          'It is a concept of OOPs that allows you to declare methods without defining them. Interfaces, unlike classes, are not blueprints because they do not contain detailed instructions or actions to be performed. Any class that implements an interface defines the methods of the interface.',
                          'none'),
                      productListing(
                          33,
                          'Q33. Differentiate between data abstraction and encapsulation.',
                          '',
                          'ans33.png'),
                      Text(
                        'Interview Questions – Methods and Functions',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Color.fromRGBO(0, 141, 217, 1),
                        ),
                      ),
                      productListing(
                          34,
                          'Q34. What are virtual functions?',
                          'Virtual functions are functions that are present in the parent class and are overridden by the subclass. These functions are used to achieve runtime polymorphism.',
                          'none'),
                      productListing(
                          35,
                          'Q35. What are pure virtual functions?',
                          'Pure virtual functions or abstract functions are functions that are only declared in the base class. This means that they do not contain any definition in the base class and need to be redefined in the subclass.',
                          'none'),
                      productListing(
                          36,
                          'Q36. What is a constructor?',
                          'A constructor is a special type of method that has the same name as the class and is used to initialize objects of that class.',
                          'none'),
                      productListing(
                          37,
                          'Q37. What is a destructor?',
                          'A destructor is a method that is automatically invoked when an object is destroyed. The destructor also recovers the heap space that was allocated to the destroyed object, closes the files and database connections of the object, etc.',
                          'none'),
                      productListing(
                          38,
                          'Q38. Types of constructors',
                          'Types of constructors differ from language to language. However, all the possible constructors are:\n•	Default constructor\n•	Parameterized constructor\n•	Copy constructor\n•	Static constructor\n•	Private constructor',
                          'none'),
                      productListing(
                          39,
                          'Q39. What is a copy constructor?',
                          'A copy constructor creates objects by copying variables from another object of the same class. The main aim of a copy constructor is to create a new object from an existing one.',
                          'none'),
                      productListing(
                          40,
                          'Q40. What is the use of ‘finalize’?',
                          'Finalize as an object method used to free up unmanaged resources and cleanup before Garbage Collection(GC). It performs memory management tasks.',
                          'none'),
                      productListing(
                          41,
                          'Q41. What is Garbage Collection(GC)?',
                          'GC is an implementation of automatic memory management. The Garbage collector frees up space occupied by objects that are no longer in existence.',
                          'none'),
                      productListing(
                          42,
                          'Q42. Differentiate between a class and a method.',
                          '',
                          'ans42.png'),
                      productListing(
                          43,
                          'Q43. Differentiate between an abstract class and an interface?',
                          '',
                          'ans43.png'),
                      productListing(
                          44,
                          'Q44. What is a final variable?',
                          'A variable whose value does not change. It always refers to the same object by the property of non-transversity.',
                          'none'),
                      Text(
                        'Interview Questions – Exception Handling',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Color.fromRGBO(0, 141, 217, 1),
                        ),
                      ),
                      productListing(
                          45,
                          'Q45. What is an exception?',
                          'An exception is a kind of notification that interrupts the normal execution of a program. Exceptions provide a pattern to the error and transfer the error to the exception handler to resolve it. The state of the program is saved as soon as an exception is raised.',
                          'none'),
                      productListing(
                          46,
                          'Q46. What is exception handling?',
                          'Exception handling in Object-Oriented Programming is a very important concept that is used to manage errors. An exception handler allows errors to be thrown and caught and implements a centralized mechanism to resolve them.',
                          'none'),
                      productListing(
                          47,
                          'Q47. What is the difference between an error and an exception?',
                          '',
                          'ans47.png'),
                      productListing(
                          48,
                          'Q48. What is a try/ catch block?',
                          'A try/ catch block is used to handle exceptions. The try block defines a set of statements that may lead to an error. The catch block basically catches the exception.',
                          'none'),
                      productListing(
                          49,
                          'Q49. What is a finally block?',
                          'A finally block consists of code that is used to execute important code such as closing a connection, etc. This block executes when the try block exits. It also makes sure that finally block executes even in case some unexpected exception is encountered.',
                          'none'),
                      Text(
                        'Interview Questions – OOPs Limitations',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Color.fromRGBO(0, 141, 217, 1),
                        ),
                      ),
                      productListing(
                          50,
                          'Q50. What are the limitations of OOPs?',
                          '•	Usually not suitable for small problems\n•	Requires intensive testing\n•	Takes more time to solve the problem\n•	Requires proper planning\n•	The programmer should think of solving a problem in terms of objects',
                          'none'),

                      //productListing('','',''),
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
            //ad code commented
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

  //NOT NEEDED
  Column productListing(
      int ques_ind, String question, String answer, String image) {
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
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
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
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      child: Column(
                        children: <Widget>[
                          //comment below to remove checkbox.
                          /*
                          CustomCheckBox(
                            //var inter_check= new List.filled(50, false);
                            value: inter_check[ques_ind - 1],
                            shouldShowBorder: true,
                            borderColor: Colors.red,
                            checkedFillColor: Colors.red,
                            borderRadius: 8,
                            borderWidth: 1,
                            checkBoxSize: 16,
                            onChanged: (value) {
                              inter_check[ques_ind - 1] = true;
                              //value = inter_check[ques_ind - 1];
                              //do your stuff here

                              setState(() {
                                inter_check[ques_ind - 1] = value;
                              });
                            },
                          ),*/
                          //comment above to remove checkbox
                          if (image == 'none')
                            Text(
                              '\n$answer\n',
                              style: TextStyle(
                                  fontSize: 16, color: Colors.grey[700]),
                            ),
                          if (image != 'none') Text('\n'),
                          if (image != 'none')
                            Image.asset('assets/image/interview_images/$image'),
                        ],
                      ),
                    ),
                  )
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
}

_incrementCounter() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  int counter = (prefs.getInt('counter') ?? 0) + 1;
  print('Pressed $counter times.');
  await prefs.setInt('counter', counter);
}
