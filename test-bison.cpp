#include "exp_trans.h"

#include <iostream>

using namespace std;

int main()
{
    cout << getAST("1+4*3/2") << endl;
    return 0;
}