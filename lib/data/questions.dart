var data = {
  '1': [
    """// Assume that integers take 4 bytes.
#include<iostream>
using namespace std;

class Test
{
static int i;
int j;
};

int Test::i;

int main()
{
	cout << sizeof(Test);
	return 0;
}
""",
    '2',
    '4',
    '8',
    '16',
    '2', //correct option index in list (1 based indexing)
    'static data members do not contribute in size of an object. So ‘i’ is not considered in size of Test. Also, all functions (static and non-static both) do not contribute in size.'
        'not_done'
  ],
  '2': [
    """int i=10;

void main()
{
    int i=20;
    {
        int i=30;
        cout<<i<<::i;                 
    }
}

""",
    """prints 3010""",
    """prints 3020""",
    """will result in a runtime error""",
    """none of the above""",
    '1',
    ':: is basically meant to manipulate a global variable, in case a local variable also has the same name.',
    'not_done'
  ],
  '3': [
    """#include<iostream>
#include<string.h>
using namespace std;

class String
{
	char *p;
	int len;
public:
	String(const char *a);
};

String::String(const char *a)
{
	int length = strlen(a);
	p = new char[length +1];
	strcpy(p, a);
	cout << "Constructor Called " << endl;
}

int main()
{
	String s1("Hello");
	const char *name = "again_Hello";
	s1 = name;
	return 0;
}

""",
    'again_Hello',
    'No output',
    '0',
    """Constructor called
Constructor called""",
    '4',
    'The first line of output is printed by statement “String s1(“Geeks”);” and the second line is printed by statement “s1 = name;”. The reason for the second call is, a single parameter constructor also works as a conversion operator',
    'not_done',
  ],
  '4': [
    """#include<iostream>

using namespace std;

class A
{
	public:
	virtual void fun() {cout << "A" << endl ;}
};
class B: public A
{
	public:
	virtual void fun() {cout << "B" << endl;}
};
class C: public B
{
	public:
	virtual void fun() {cout << "C" << endl;}
};

int main()
{
	A *a = new C;
	A *b = new B;
	a->fun();
	b->fun();
	return 0;
}

""",
    """A
B""",
    """B
C""",
    """C
B""",
    """A
C""",
    '3',
    'A base class pointer can point to objects of children classes. A base class pointer can also point to objects of grandchildren classes. Therefore, the line “A *a = new C;” is valid. The line “a->fun();” prints “C” because the object pointed is of class C and fun() is declared virtual in both A and B. The second line of output is printed by statement “b->fun();”.',
    'not_done'
  ],
  '5': [
    """#include<iostream>
using namespace std;
int main()
{
	int x = 1 , y = 1, z = 1;
	cout << (++x || ++y && ++z ) << endl;
	cout << x << " " << y << " " << z ;		
	return 0;
}

""",
    """1
2 1 1""",
    """1
2 1 2""",
    """1
2 2 1""",
    """2
2 1 1""",
    '1',
    'It is based on fact that how LOGICAL – OR and LOGICAL-AND work. Note that Compiler reads OR and AND operators from left to right.',
    'not_done'
  ],

  '6': [
    """#include<iostream>
using namespace std;
int main()
{
    int x = 1 , y = 1;
    cout << ( ++x  || ++y ) << endl;  
    cout << x << " " << y;            
    return 0;
}
""",
    """2
2 1""",
    """1
2 2""",
    """1
1 1""",
    """1
2 1""",
    '4',
    'Once compiler detects “true” on the LEFT of logical OR, IT IS NOT GOING TO EVALUATE THE RIGHT SIDE!, because even one is true, the whole “OR” expression becomes true!. SO compiler skips the RIGHT part and displays the result as 1 !So y is not incremented here , because compiler skipped reading it!',
    'not_done'
  ],
  '7': [
    """#include<iostream>
using namespace std;
int main()
{
	int x = 1 , y = 1;
	cout << ( ++x && ++y ) << endl;	 
	cout << x << " " << y;			 
	return 0;
}

""",
    """1
2 1""",
    """1
2 2""",
    """2
2 2""",
    """1
2 3""",
    '2',
    'LOGICAL AND needs to evaluate both right and left part (Think about it !)So both left and right part is evaluated, thus incrementing both x and y here.',
    'not_done'
  ],
  '8': [
    """#include<iostream>
using namespace std;
int main()
{
	int x = 1 , y = 1, z = 1;
	cout << ( ++x || ++y && ++z ) << endl; 
	cout << x << " " << y << " " << z ;	 
	return 0;
}

""",
    """1
2 1 1""",
    """1
2 1 2""",
    """1
1 1 1""",
    """2
2 1 1""",
    '1',
    'Here compiler increments x first and then it detects a LOGICAL OR. We have a true quantity on left side . SO compiler won’t read the right part.Thus incrementing x and y,z remains same!',
    'not_done'
  ],
  '9': [
    """#include<iostream>
using namespace std;

class A {
public:
	A(int ii = 0) : i(ii) {}
	void show() { cout << "i = " << i << endl;}
private:
	int i;
};

class B {
public:
	B(int xx) : x(xx) {}
	operator A() const { return A(x); }
private:
	int x;
};

void g(A a)
{ a.show(); }

int main() {
B b(10);
g(b);
g(20);
getchar();
return 0;
}

""",
    """i = 10
i = 10""",
    """i = 10
i = 20""",
    """i = 20
i = 10""",
    """i = 20
i = 20""",
    '2',
    'Since there is a Conversion constructor in class A, integer value can be assigned to objects of class A and function call g(20) works. Also, there is a conversion operator overloaded in class B, so we can call g() with objects of class B.',
    'not_done'
  ],
  '10': [
    """#include<iostream>
using namespace std;

class base {
	int arr[10];	
};

class b1: public base { };
class b2: public base { };
class derived: public b1, public b2 {};

int main(void)
{
cout<<sizeof(derived);
getchar();
return 0;
}

""",
    """20""",
    """40""",
    """60""",
    """80""",
    '4',
    'If integer takes 4 bytes, then 80. Since b1 and b2 both inherit from class base, two copies of class base are there in class derived. This kind of inheritance without virtual causes wastage of space and ambiguities. virtual base classes are used to save space and avoid ambiguities in such cases.',
    'not_done'
  ],
  '11': [
    """#include<iostream>

using namespace std;
class P {
public:
void print()
{ cout <<" Inside P::"; }
};

class Q : public P {
public:
void print()
{ cout <<" Inside Q"; }
};

class R: public Q {
};

int main(void)
{
R r;

r.print();
return 0;
}

""",
    """Inside P""",
    """Inside Q""",
    """Inside P
    Inside Q""",
    """No output""",
    '2',
    'The print function is not defined in class R. So it is looked up in the inheritance hierarchy. print() is present in both classes P and Q, which of them should be called? The idea is, if there is multilevel inheritance, then function is linearly searched up in the inheritance hierarchy until a matching function is found.',
    'not_done'
  ],
  '12': [
    """#include<iostream>
#include<stdio.h>

using namespace std;

class Base
{
public:
Base()
{
	fun(); //note: fun() is virtual
}
virtual void fun()
{
	cout<<"\nBase Function";
}
};

class Derived: public Base
{
public:
Derived(){}
virtual void fun()
{
	cout<<"\nDerived Function";
}
};

int main()
{
Base* pBase = new Derived();
delete pBase;
return 0;
}

""",
    """Base Function""",
    """Derived Function""",
    """Compilation error""",
    """No output""",
    '1',
    'When a virtual function is called directly or indirectly from a constructor (including from the mem-initializer for a data member) or from a destructor, and the object to which the call applies is the object under construction or destruction, the function called is the one defined in the constructor or destructor’s own class or in one of its bases, but not a function overriding it in a class derived from the constructor or destructor’s class, or overriding it in one of the other base classes of the most derived object.',
    'not_done'
  ],
  '13': [
    """#include<iostream>
using namespace std;

int x = 10;
void fun()
{
	int x = 2;
	{
		int x = 1;
		cout << ::x << endl;
	}
}

int main()
{
	fun();
	return 0;
}

""",
    """1""",
    """5""",
    """10""",
    """20""",
    '3',
    'If Scope Resolution Operator is placed before a variable name then the global variable is referenced',
    'not_done'
  ],
  '14': [
    """#include<iostream>
using namespace std;
class Point {
private:
	int x;
	int y;
public:
	Point(int i, int j); // Constructor
};

Point::Point(int i = 0, int j = 0) {
	x = i;
	y = j;
	cout << "Constructor called";
}

int main()
{
Point t1, *t2;
return 0;
}

""",
    """Constructor called.""",
    """Compilation Error""",
    """No Output""",
    """Both b and c""",
    '1',
    'If we take a closer look at the statement “Point t1, *t2;:” then we can see that only one object is constructed here. t2 is just a pointer variable, not an object.',
    'not_done'
  ],
  '15': [
    """#include <iostream>
using namespace std;
 
class Test
{
    static int x;
public:
    Test() { x++; }
    static int getX() {return x;}
};
 
int Test::x = 0;
 
int main()
{
    cout << Test::getX() << " ";
    Test t[5];
    cout << Test::getX();
}

""",
    """0 0""",
    """5 5""",
    """0 5""",
    """Compilation Error""",
    '3',
    'Static functions can be called without any object. So the call "Test::getX()" is fine. Since x is initialized as 0, the first call to getX() returns 0. Note the statement x++ in constructor. When an array of 5 objects is created, the constructor is called 5 times. So x is incremented to 5 before the next call to getX().',
    'not_done'
  ],
  '16': [
    """#include<iostream>
using namespace std;

class Test {
	int value;
public:
	Test(int v);
};

Test::Test(int v) {
	value = v;
}

int main() {
	Test t[100];
	return 0;
}

""",
    """100""",
    """Code will work""",
    """Compiler error""",
    """Code will not generate output""",
    '3',
    'The class Test has one user defined constructor “Test(int v)” that expects one argument. It doesn’t have a constructor without any argument as the compiler doesn’t create the default constructor if user defines a constructor ',
    'not_done'
  ],
  '17': [
    """#include<iostream>
using namespace std;
int &fun() {
  static int a = 10;
  return a;
}
 
int main() {
  int &y = fun();
  y = y +30;
  cout<<fun();
  return 0;
}
""",
    """10""",
    """20""",
    """30""",
    """40""",
    '4',
    'The program works fine because ‘a’ is static. Since ‘a’ is static, memory location of it remains valid even after fun() returns. So a reference to static variable can be returned',
    'not_done'
  ],
  '18': [
    """#include<iostream>
using namespace std;

class Test
{
public:
Test();
};

Test::Test() {
	cout<<"Constructor Called \n";
}

int main()
{
	cout<<"Start \n";
	Test t1();
	cout<<"End \n";
	return 0;
}

""",
    """Start
""",
    """Start
End""",
    """End
    Start""",
    """End""",
    '2',
    'Note that the line “Test t1();” is not a constructor call. Compiler considers this line as declaration of function t1 that doesn’t receive any parameter and returns object of type Test.',
    'not_done'
  ],
  '19': [
    """#include<iostream>

using namespace std;

class Test {
	int value;
public:
	Test (int v = 0) {value = v;}
	int getValue() { return value; }
};

int main() {
	const Test t;
	cout << t.getValue();
	return 0;
}

""",
    """Compiler Error.""",
    """0""",
    """No Output""",
    """Runtime Error""",
    '1',
    'A const object cannot call a non-const function. The above code can be fixed by either making getValue() const or making t non-const. ',
    'not_done'
  ],
  '20': [
    """
#include<iostream>
using namespace std;

class Test {
	int &t;
public:
	Test (int &x) { t = x; }
	int getT() { return t; }
};

int main()
{
	int x = 20;
	Test t1(x);
	cout << t1.getT() << " ";
	x = 30;
	cout << t1.getT() << endl;
	return 0;
}

""",
    """20""",
    """Compiler Error""",
    """30""",
    """50""",
    '2',
    'Since t is a reference in Test, it must be initialized using Initializer List.',
    'not_done'
  ],
  '21': [
    """#include<iostream>
using namespace std;

class Test {
	int &t;
public:
	Test (int &x):t(x) { }
	int getT() { return t; }
};

int main() {
	int x = 20;
	Test t1(x);
	cout << t1.getT() << " ";
	x = 30;
	cout << t1.getT() << endl;
	return 0;
}

""",
    """30 10""",
    """10 20""",
    """30 40""",
    """20 30""",
    '4',
    'Following is the modified program. It works and prints “20 30”',
    'not_done'
  ],
  '22': [
    """#include<iostream>
using namespace std;

class Test1
{
	int x;
public:
	void show() { }
};

class Test2
{
	int x;
public:
	virtual void show() { }
};

int main(void)
{
	cout<<sizeof(Test1)<<endl;
	cout<<sizeof(Test2)<<endl;
	return 0;
}

""",
    """4
8""",
    """8
    8""",
    """2
    4""",
    """8
    8""",
    '1',
    'There is only one difference between Test1 and Test2. show() is non-virtual in Test1, but virtual in Test2. When we make a function virtual, compiler adds an extra pointer vptr to objects of the class. Compiler does this to achieve run time polymorphism',
    'not_done'
  ],
  '23': [
    """#include<iostream>
using namespace std;
class P
{
public:
	virtual void show() = 0;
};

class Q : public P {
int x;
};

int main(void)
{
	Q q;
	return 0;
}

""",
    """No Output""",
    """q""",
    """Compiler Error""",
    """p""",
    '3',
    'We get the error because we can’t create objects of abstract classes. P is an abstract class as it has a pure virtual method. Class Q also becomes abstract because it is derived from P and it doesn’t implement show().',
    'not_done'
  ],
  '24': [
    """#include<iostream>
using namespace std;

class Test
{
private:
	static int count;
public:
	static Test& fun();
};

int Test::count = 0;

Test& Test::fun()
{
	Test::count++;
	cout<<Test::count<<" ";
	return *this;
}

int main()
{
	Test t;
	t.fun().fun().fun().fun();
	return 0;
}

""",
    """0""",
    """Compiler error""",
    """Code will execute""",
    """None of the above""",
    '2',
    '"this" is unavailable for static member functions',
    'not_done'
  ],

  '25': [
    """#include<iostream>
using namespace std;

class Test
{
private:
	static int count;
public:
	Test& fun(); // fun() is non-static now
};

int Test::count = 0;

Test& Test::fun()
{
	Test::count++;
	cout<<Test::count<<" ";
	return *this;
}

int main()
{
	Test t;
	t.fun().fun().fun().fun();
	return 0;
}

""",
    """1 2 3 4""",
    """5 6 7 8""",
    """4 3 2 1""",
    """0 0 0 0""",
    '1',
    'If we make fun() non-static in the previous program, then the program works fine.',
    'not_done'
  ],
  '26': [
    """#include<iostream>
using namespace std;

int main()
{
	int *ptr = new int(5);
	cout << *ptr;
	return 0;
}

""",
    """10""",
    """20""",
    """5""",
    """1""",
    '3',
    'The new operator can also initialize primitive data types. In the above program, the value at address ‘ptr ‘ is initialized as 5 using the new operator.',
    'not_done'
  ],
  '27': [
    """#include <iostream>
using namespace std;

class Fraction
{
private:
	int den;
	int num;
public:
void print() { cout << num << "/" << den; }
Fraction() { num = 1; den = 1; }
int &Den() { return den; }
int &Num() { return num; }
};

int main()
{
Fraction f1;
f1.Num() = 7;
f1.Den() = 9;
f1.print();
return 0;
}

""",
    """9/7""",
    """7""",
    """9""",
    """7/9""",
    '4',
    'The methods Num() and Den() return references to num and den respectively. Since references are returned, the returned values can be uses as an lvalue, and the private members den and num are modified. The program compiles and runs fine, but this kind of class design is strongly discouraged. Returning reference to private variable allows users of the class to change private data directly which defeats the purpose of encapsulation.',
    'not_done'
  ],

  '28': [
    """#include <iostream>
using namespace std;

int fun(int a, int b = 1, int c =2)
{
	return (a + b + c);
}

int main()
{
	cout << fun(12, ,2);
	return 0;
}

""",
    """Compiler Error""",
    """Code will execute without errors""",
    """36""",
    """12""",
    '1',
    'With default arguments, we cannot skip an argument in the middle. Once an argument is skipped, all the following arguments must be skipped. The calls fun(12) and fun(12, 2) are valid.',
    'not_done'
  ],
  '29': [
    """#include<iostream>
using namespace std;

/* local variable is same as a member's name */
class Test
{
private:
	int x;
public:
	void setX (int x) { Test::x = x; }
	void print() { cout << "x = " << x << endl; }
};

int main()
{
	Test obj;
	int x = 40;
	obj.setX(x);
	obj.print();
	return 0;
}

""",
    """x = 80""",
    """x = 20""",
    """Garbage value""",
    """x = 40""",
    '4',
    'Scope resolution operator can always be used to access a class member when it is made hidden by local variables. So the line “Test::x = x” is same as “this->x = x”',
    'not_done'
  ],
  '30': [
    """#include<iostream>
using namespace std;

class Test
{
	int value;
public:
	Test(int v = 0) { value = v; }
	int getValue() { return value; }
};

int main()
{
	const Test t;
	cout << t.getValue();
	return 0;
}

""",
    """Code will run without errors""",
    """value""",
    """Compiler Error""",
    """No output""",
    '3',
    'In the above program, object ‘t’ is declared as a const object. A const object can only call const functions. To fix the error, we must make getValue() a const function.',
    'not_done'
  ],
  '31': [
    """#include<iostream>
using namespace std;
class Base {
protected:
	int x;
public:
	Base (int i){ x = i;}
};

class Derived : public Base {
public:
	Derived (int i):Base(i) { }
	void print() { cout << x; }
};

int main()
{
	Derived d(10);
	d.print();
}

""",
    """ 10 """,
    """1""",
    """20""",
    """Garbage Value""",
    '1',
    'The members of base class can only be initialized through a constructor call of base class. ',
    'not_done'
  ],
  '32': [
    """#include <iostream>
using namespace std;

template <int N>
class A {
int arr[N];
public:
virtual void fun() { cout << "A::fun()"; }
};

class B : public A<2> {
public:
void fun() { cout << "B::fun()"; }
};

class C : public B { };

int main() {
A<2> *a = new C;
a->fun();
return 0;
}

""",
    """A::fun()""",
    """B::fun()""",
    """C::fun()""",
    """D::fun()""",
    '2',
    'In the above program, there is a generic class A which takes a nontype parameter N. The class B inherits from an instance of generic class A. The value of N for this instance of A is 2. The class B overrides fun() of class A<2>. The class C inherits from B. In main(), there is a pointer ‘a’ of type A<2> that points to an instance of C. When ‘a->fun()’ is called, the function of class B is executed because fun() is virtual and virtual functions are called according to the actual object, not according to pointer. In class C, there is no function ‘fun()’, so it is looked up in the hierarchy and found in class B.',
    'not_done'
  ],
  '33': [
    """#include <iostream>
using namespace std;

template <int i>
int fun()
{
i =20;
}

int main() {
fun<4>();
return 0;
}

""",
    """Compiler Error""",
    """Code will run without errors""",
    """20""",
    """4""",
    '1',
    'The value of nontype parameters must be constant as they are used at compile time to create instance of classes/functions. In the above program, templated fun() receives a nontype parameter and tries to modify it which is not possible. Therefore, compiler error.',
    'not_done'
  ],
  '34': [
    """#include <iostream>
#include <string.h>
using namespace std;

int main()
{
	cout << sizeof("Rohan") << endl;
	cout << strlen("Rohan");
	return 0;
}

""",
    """5
    5""",
    """6
    5""",
    """6
5""",
    """None of the above""",
    '3',
    'Sizeof operator returns the size of string including null character so output is 14. While strlen() function returns the exact length of string excluding null character so output is 13.',
    'not_done'
  ],
  '35': [
    """#include <iostream>
using std::cout;
class Test
{
public:
	Test();
	~Test();
};
Test::Test()
{
	cout << "Constructor is executed\n";
}
Test::~Test()
{
	cout << "Destructor is executed\n";
}
int main()
{
	delete new Test();
	return 0;
}

""",
    """Constructor is executed
Destructor is executed""",
    """Constructor is executed""",
    """Destructor is executed""",
    """None of the above""",
    '1',
    'The first statement inside the main () function looks strange, but it is perfectly valid. It is possible to create an object without giving its handle to any pointer in C++. This statement will create an object of class Test without any pointer pointing to it.',
    'not_done'
  ],
  '36': [
    """#include<iostream>
using namespace std;
  
class Empty {};
  
int main()
{
  cout << sizeof(Empty);
  return 0;
}
""",
    """A non-zero value""",
    """0""",
    """Compilation Error""",
    """Runtime Error""",
    '1',
    'Size of an empty class is not 0 in c++.',
    'not_done'
  ],
  '37': [
    """#include<iostream>
using namespace std;
class Point {
public:
    Point() { cout << "Constructor called"; }
};
 
int main()
{
   Point t1, *t2;
   return 0;
}
""",
    """Compiler Error""",
    """Constructor Called""",
    """Runtime Error""",
    """None of the above""",
    '2',
    'Only one object t1 is constructed here. t2 is just a pointer variable, not an object',
    'not_done'
  ],
  '38': [
    """#include<iostream>
using namespace std;
 
class X 
{
public:
    int x;
};
 
int main()
{
    X a = {10};
    X b = a;
    cout << a.x << " " << b.x;
    return 0;
}
""",
    """Compiler Error""",
    """10 followed by Garbage Value""",
    """10 10""",
    """10 0""",
    '3',
    'The following may look like an error, but it works fine. X a = {10}; Like structures, class objects can be initialized. The line "X b = a;" calls copy constructor and is same as "X b(a);". Please note that, if we dont write our own copy constructor, then compiler creates a default copy constructor which assigns data members one object to other object.',
    'not_done'
  ],
  '39': [
    """#include <iostream>
using namespace std;
 
class Point
{
    int x, y;
public:
   Point(const Point &p) { x = p.x; y = p.y; }
   int getX() { return x; }
   int getY() { return y; }
};
 
int main()
{
    Point p1;
    Point p2 = p1;
    cout << "x = " << p2.getX() << " y = " << p2.getY();
    return 0;
}
""",
    """x = garbage value y = garbage value""",
    """x = 0 y = 0""",
    """Compilation Error""",
    """Runtime Error""",
    '3',
    'There is compiler error in line Point p1;. The class Point doesnt have a constructor without any parameter. If we write any constructor, then compiler doesnt create the default constructor. It is not true other way, i.e., if we write a default or parameterized constructor, then compiler creates a copy constructor. ',
    'not_done'
  ],
  '40': [
    """#include <iostream>
using namespace std;
class Test2
{
    int y;
};
 
class Test
{
    int x;
    Test2 t2;
public:
    operator Test2 ()  { return t2; }
    operator int () { return x; }
};
 
void fun ( int x) { cout << "fun(int) called"; }
void fun ( Test2 t ) { cout << "fun(Test 2) called"; }
 
int main()
{
    Test t;
    fun(t);
    return 0;
}
""",
    """fun(int) called""",
    """fun(Test 2) called""",
    """Compiler Error: Ambiguous call to fun()""",
    """None of the above""",
    '3',
    'The class Test has two conversion operators overloaded, int and Test2. And there are two fun() for int and Test2.',
    'not_done'
  ],
  '41': [
    """#include<iostream>
using namespace std;
 
class Point {
private:
  int x, y;
public:
  Point() : x(0), y(0) { }
  Point& operator()(int dx, int dy);
  void show() {cout << "x = " << x << ", y = " << y; }
};
 
Point& Point::operator()(int dx, int dy)
{
    x = dx;
    y = dy;
    return *this;
}
 
int main()
{
  Point pt;
  pt(3, 2);
  pt.show();
  return 0;
}
""",
    """x = 3, y = 2""",
    """	Compiler Error""",
    """x = 2, y = 3""",
    """x = 2, y = 2""",
    '1',
    'This a simple example of function call operator overloading. The function call operator, when overloaded, does not modify how functions are called. Rather, it modifies how the operator is to be interpreted when applied to objects of a given type. ',
    'not_done'
  ],
  /* '41': [
    """#include<iostream>
using namespace std;
 
class Base {};
 
class Derived: public Base {};
 
int main()
{
    Base *bp = new Derived;
    Derived *dp = new Base;
}
""",
    """No Compiler Error""",
    """Compiler Error in line "Base *bp = new Derived;""",
    """Compiler Error in line " Derived *dp = new Base;""",
    """Runtime Error""",
    '3',
    'A Base class pointer/reference can point/refer to a derived class object, but the other way is not possible.',
    'not_done'
  ],
  */
  '42': [
    """#include<iostream>
using namespace std;
 
class Base
{
public:
    void show()
    {
        cout<<" In Base ";
    }
};
 
class Derived: public Base
{
public:
    int x;
    void show()
    {
        cout<<"In Derived ";
    }
    Derived()
    {
        x = 10;
    }
};
 
int main(void)
{
    Base *bp, b;
    Derived d;
    bp = &d;
    bp->show();
    cout << bp->x;    
    return 0;
}
""",
    """Compiler Error in line " bp->show()" """,
    """Compiler Error in line " cout << bp->x" """,
    """In Base 10""",
    """In Derived 10""",
    '2',
    'A base class pointer can point to a derived class object, but we can only access base class member or virtual functions using the base class pointer.',
    'not_done'
  ],
  '43': [
    """#include<iostream>
using namespace std;
 
class Base
{
public:
    int fun()  { cout << "Base::fun() called"; }
    int fun(int i)  { cout << "Base::fun(int i) called"; }
};
 
class Derived: public Base
{
public:
    int fun() {  cout << "Derived::fun() called"; }
};
 
int main()
{
    Derived d;
    d.fun(5);
    return 0;
}
""",
    """Base::fun(int i) called""",
    """Derived::fun() called""",
    """Base::fun() called""",
    """Compiler Error""",
    '4',
    'If a derived class writes its own method, then all functions of base class with same name become hidden, even if signaures of base class functions are different. In the above question, when fun() is rewritten in Derived, it hides both fun() and fun(int) of base class.',
    'not_done'
  ],
  '44': [
    """#include<iostream>
using namespace std;
 
class Base
{
public:
    virtual void show() { cout<<" In Base n"; }
};
 
class Derived: public Base
{
public:
    void show() { cout<<"In Derived n"; }
};
 
int main(void)
{
    Base *bp = new Derived;
    bp->show();
 
    Base &br = *bp;
    br.show();
 
    return 0;
}
""",
    """In Base 
In Base""",
    """In Base 
In Derived""",
    """In Derived
In Derived""",
    """In Derived
In Base """,
    '3',
    'Since show() is virtual in base class, it is called according to the type of object being referred or pointed, rather than the type of pointer or reference.',
    'not_done'
  ],
  '45': [
    """#include<iostream>
using namespace std;
 
class Base
{
public:
    virtual void show() = 0;
};
 
class Derived: public Base
{
public:
    void show() { cout<<"In Derived n"; }
};
 
int main(void)
{
    Derived d;
    Base &br = d;
    br.show();
    return 0;
}
""",
    """Compiler Error in line "Base &br = d;" """,
    """Empty Output""",
    """In Derived""",
    """None of the Above""",
    '3',
    'Because of Pure virtual Functions and abstract classes',
    'not_done'
  ],
  '46': [
    """#include <iostream>
using namespace std;
 
class A
{
public:
    virtual void fun();
};
 
class B
{
public:
   void fun();
};
 
int main()
{
    int a = sizeof(A), b = sizeof(B);
    if (a == b) cout << "a == b";
    else if (a > b) cout << "a > b";
    else cout << "a < b";
    return 0;
}
""",
    """a > b""",
    """a == b""",
    """a < b""",
    """Compilation Error""",
    '1',
    'Class A has a VPTR which is not there in class B. In a typical implementation of virtual functions, compiler places a VPTR with every object. Compiler secretly adds some code in every constructor to this.',
    'not_done'
  ],
  '47': [
    """#include <iostream>
using namespace std;
  
class A
{
public:
    virtual void fun() { cout << "A::fun() "; }
};
  
class B: public A
{
public:
   void fun() { cout << "B::fun() "; }
};
  
class C: public B
{
public:
   void fun() { cout << "C::fun() "; }
};
  
int main()
{
    B *bp = new C;
    bp->fun();
    return 0;
}
""",
    """A::fun()""",
    """B::fun()""",
    """C::fun()""",
    """D::fun()""",
    '3',
    'The important thing to note here is B::fun() is virtual even if we have not uses virtual keyword with it. When a class has a virtual function, functions with same signature in all descendant classes automatically become virtual. We dont need to use virtual keyword in declaration of fun() in B and C. They are anyways virtual.',
    'not_done'
  ],
  '48': [
    """#include <iostream>
using namespace std;
 
class B;
class A {
    int a;
public:
    A():a(0) { }
    void show(A& x, B& y);
};
 
class B {
private:
    int b;
public:
    B():b(0) { }
    friend void A::show(A& x, B& y);
};
 
void A::show(A& x, B& y) {
    x.a = 10;
    cout << "A::a=" << x.a << " B::b=" << y.b;
}
 
int main() {
    A a;
    B b;
    a.show(a,b);
    return 0;
}
""",
    """Compiler Error""",
    """A::a=10 B::b=0""",
    """A::a=0 B::b=0""",
    """None of the above""",
    '2',
    'This is simple program where a function of class A is declared as friend of class B. Since show() is friend, it can access private data members of B.',
    'not_done'
  ],
  '49': [
    """#include<iostream>
using namespace std;
 
int fun(int x = 0, int y = 0, int z)
{  return (x + y + z); }
 
int main()
{
   cout << fun(10);
   return 0;
}
""",
    """10""",
    """0""",
    """20""",
    """Compilation Error""",
    '4',
    'All default arguments must be the rightmost arguments',
    'not_done'
  ],
  '50': [
    """#include 
using namespace std;
void square (int *x)
{
*x = (*x)++ * (*x);
}
void square (int *x, int *y)
{
*x = (*x) * --(*y);
}
int main ( )
{
int number = 30;
square(&number, &number);
cout << number;
return 0;
}
""",
    """910""",
    """920""",
    """870""",
    """900""",
    '3',
    'Explaination not available at the moment',
    'not_done'
  ],
  //This is a Template
  /*
  
  '4': [
    """
""",
    """option 1""",
    """option 2""",
    """option 3""",
    """option 4""",
    '',
    'Explaination not available at the moment',
    'not_done'
  ],
  */
};
