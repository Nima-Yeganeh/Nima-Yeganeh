/* Leet Code */
/* Title - Linked List Cycle II */
/* Created By - Akash Modak */
/* Date - 07/10/2020 */

// Given a linked list, return the node where the cycle begins. If there is no cycle, return null.

// There is a cycle in a linked list if there is some node in the list that can be reached again by continuously following the next pointer. Internally, pos is used to denote the index of the node that tail's next pointer is connected to. Note that pos is not passed as a parameter.

// Notice that you should not modify the linked list.

// Follow up:

// Can you solve it using O(1) (i.e. constant) memory?

 

// Example 1:


// Input: head = [3,2,0,-4], pos = 1
// Output: tail connects to node index 1
// Explanation: There is a cycle in the linked list, where tail connects to the second node.
// Example 2:


// Input: head = [1,2], pos = 0
// Output: tail connects to node index 0
// Explanation: There is a cycle in the linked list, where tail connects to the first node.
// Example 3:


// Input: head = [1], pos = -1
// Output: no cycle
// Explanation: There is no cycle in the linked list.
//  

/**
 * Definition for singly-linked list.
 * struct ListNode {
 *     int val;
 *     ListNode *next;
 *     ListNode(int x) : val(x), next(NULL) {}
 * };
 */
class Solution {
public:
    ListNode *detectCycle(ListNode *head) {
        if(head==NULL)
            return head;
        ListNode* fast = head;
        ListNode* slow = head;
        bool flag = false;
        int pos = -1;
        while(fast!=NULL and fast->next!=NULL){
            fast = fast->next->next;
            slow = slow->next;
            if(fast==slow){
                flag = true;
                break;
            }
        }
        if(!flag){
            return NULL;
        }
        slow = head;
        pos++;
        while(slow!=fast){
            fast = fast->next;
            slow = slow->next;
            pos++;
        }
        return slow;
    }
};