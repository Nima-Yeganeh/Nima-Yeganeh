#include <iostream>
using namespace std;

// 9.10 
void makeNegative(int *);

int main()
{
    // 9.9 Assuming arr is an array of ints, 
    //  will each of the following program segments 
    //  display “True” or “False”?
    // int arr[10];

    // // A) 
    // if (arr < &arr[1])      // TRUE
    //     cout << "True";
    // else
    //     cout << "False";

    // // B) 
    // if (&arr[4] < &arr[1])  // FALSE
    //     cout << "True";
    // else
    //     cout << "False";
        
    // // C) 
    // if (arr != &arr[2])     // TRUE
    //     cout << "True";
    // else
    //     cout << "False";

    // // D) 
    // if (arr != &arr[0])     // FALSE
    //     cout << "True";
    // else
    //     cout << "False";

    // 9.10
    // int number = 28;
    // int *example = &number;

    // cout << "example = " << *example << endl;
    // makeNegative(example);
    // cout << "example = " << *example << endl;

    // 9.11

    return 0;
}
// 9.10 Give an example of the proper way to call
//  the following function:
void makeNegative(int *val)
{
    if (*val > 0)
        *val = -(*val);
}