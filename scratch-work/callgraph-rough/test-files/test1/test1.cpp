#include <functional>
#include <iostream>
#include <vector>
using namespace std;

class Parent {
public:
    virtual int rtn_int(int a);
};

class Child : public Parent {
public:
    int rtn_int(int a); 
};

int modify_int1(int a);
int modify_int2(int a);
void func1();
void func2();
void func3();
void call_vrtlfunc(Parent *object, int a);
void exec_funcptr(void (*funcptr)());

int last_called = 0;
void (*func_vec[3])() = { func1, func2, func3 };

int Parent::rtn_int(int a) {
    modify_int1(a);
    return a;
}

int modify_int1(int a) {
    return a - 6;
}

int Child::rtn_int(int a) {
    // std::cout << "child rtn_int" << std::endl;
    modify_int2(a);
    return a;
}

int modify_int2(int a) {
    return a + 2;
}

void func1() {
    // std::cout << "func1" << std::endl;
    if (last_called == 1) 
        func2();
    last_called = 1;
}

void func2() {
    // std::cout << "func2" << std::endl;
    if (last_called == 2) 
        func3();
    last_called = 2;
}

void func3() {
    // std::cout << "func3" << std::endl;
    if (last_called == 3) 
        func1();
    last_called = 3;
}

void exec_funcptr(void (*funcptr)()) {
    // std::cout  << "exec_funcptr" << std::endl;
    funcptr();
}

void call_vrtlfunc(Parent *object, int a) {
    // std::cout << "call_vrtlfunc" << std::endl;
    int x = object->rtn_int(a);

    void (*funcptr)();

    if (x < 3 && x >= 0) {
        funcptr = func_vec[x];
    } else {
        funcptr = func_vec[2];
    }

    exec_funcptr(funcptr);
    return;
}

int main() {
    int x, y, z;

    // std::cout << "starting main loop" << std::endl;
    std::cin >> x;
    std::cin >> y;
    std::cin >> z;

    Parent *p = new Parent();
    Child *c = new Child();
    Parent *obj;

    if (x > 0) {
        obj = p;
    } else {
        obj = c;
    }

    if (y < 1) {
        call_vrtlfunc(obj, x);
    } else {
        call_vrtlfunc(obj, z);
    }

    return 0;
}