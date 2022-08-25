/* Code Chef */
/* Title - A Problem On Sticks */
/* Created By - Akash Modak */
/* Date - 19/09/2020 */

// On a sunny day, Akbar and Birbal were taking a leisurely walk in palace gardens. Suddenly, Akbar noticed a bunch of sticks on the ground and decided to test Birbal's wits.

// There are N stick holders with negligible size (numbered 1 through N) in a row on the ground. Akbar places all the sticks in them vertically; for each valid i, the initial height of the stick in the i-th holder is Ai. Birbal has a stick cutter and his task is to completely cut all these sticks, i.e. reduce the heights of all sticks to 0. He may perform zero or more operations; in each operation, he should do the following:

// Choose an integer H and fix the cutter at the height H above the ground.
// The cutter moves from the 1-st to the N-th stick holder. Whenever it encounters a stick whose current height is greater than H, it cuts this stick down to height H (i.e. for a stick with height h>H, it removes its upper part with length h−H).
// All the upper parts of sticks that are cut in one operation must have equal lengths. Otherwise, the operation may not be performed.
// For example, if the heights of sticks are initially [5,3,5], then some valid values for H in the first operation are 3 and 4 ― the cutter cuts the upper parts of two sticks and their lengths are [2,2] and [1,1] respectively. H=2 is an invalid choice because it would cut the upper parts of all three sticks with lengths [3,1,3], which are not all equal.

// Akbar wants Birbal to completely cut all sticks in the minimum possible number of operations. If you want to be friends with Birbal, help him solve the problem.

// Input
// The first line of the input contains a single integer T denoting the number of test cases. The description of T test cases follows.
// The first line of each test case contains a single integer N.
// The second line contains N space-separated integers A1,A2,…,AN.
// Output
// For each test case, print a single line containing one integer ― the minimum number of operations needed to completely cut all the sticks.


#include<bits/stdc++.h>
#define fast                  ios_base::sync_with_stdio(0); cin.tie(0); cout.tie(0);
#define F                     first
#define S                     second
#define pb                    push_back
#define MP                    make_pair
#define REP(i,a,b)            for (int i = a; i <= b; i++)
#define FLSH                  fflush(stdout)
#define count_1(n)            __builtin_popcountll(n) 
#define max(x,y)              (x>y)?x:y 
#define min(x,y)              (x<y)?x:y 
#define mid(s,e)              (s+(e-s)/2) 
#define mini                  INT_MIN 
#define maxi		      INT_MAX

const int MOD = 1000000007; 
const int FMOD = 998244353; 
using namespace std;

typedef long long int ll;
typedef vector<int> vi;
typedef pair<int,int> pi;

int main() {
	// your code goes here
	fast;
	int t;
	cin>>t;
	while(t--){
	    int n;
	    cin>>n;
	    set<ll> s;
	    for(int i=0;i<n;i++){
	        ll temp;
	        cin>>temp;
	        if(temp!=0)
	        s.insert(temp);
	    }
	    cout<<s.size()<<"\n";
	}
	return 0;
}
