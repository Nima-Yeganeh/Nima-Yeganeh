/* Hacker Blocks */
/* Title - Target Sum Triplet */

// Take as input N, the size of array. Take N more inputs and store that in an array. Take as input “target”, a number. Write a function which prints all triplets of numbers which sum to target.

// Input Format
// First line contains input N.
// Next line contains N space separated integers denoting the elements of the array.
// The third line contains a single integer T denoting the target element.

// Constraints
// Length of Array should be between 1 and 1000.

// Output Format
// Print all the triplet present in the array in a new line each. The triplets must be printed as A, B and C where A,B and C are the elements of the triplet ( A<=B<=C) and all triplets must be printed in sorted order. Print only unique triplets.

// Sample Input
// 9
// 5 7 9 1 2 4 6 8 3
// 10
// Sample Output
// 1, 2 and 7
// 1, 3 and 6
// 1, 4 and 5
// 2, 3 and 5
// Explanation
// Array = {5, 7, 9, 1, 2, 4, 6 ,8 ,3}. Target number = 10. Find any three number in the given array which sum to target number.

#include<iostream>
#include<algorithm>
using namespace std;
int main() {
	int n,t,i,j,k;
	cin>>n;
	int a[n];
	for(i=0;i<n;i++){
		cin>>a[i];
	}
	cin>>t;
	sort(a,a+n);
	for(i=0;i<n-2;i++){
		j=i+1;
		k=n-1;
		while(j<k){
			if(a[i]+a[j]+a[k]<t)
				j++;
			else if(a[i]+a[j]+a[k]>t)
				k--;
			else{
				cout<<a[i]<<", "<<a[j]<<" and "<<a[k]<<endl;
				j++;
				k--;
			}
		}
	}
	return 0;
}