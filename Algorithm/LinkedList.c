//
//  LinkedList.c
//  Algorithm
//
//  Created by fighter on 2021/1/6.
//

#include "LinkedList.h"
#import <malloc/_malloc.h>

struct ListNode* addTwoNumbers(struct ListNode * l1, struct ListNode * l2) {
    unsigned long nodeSize = sizeof(struct ListNode);
    struct ListNode *current = malloc(nodeSize);
    struct ListNode *listNode = current;
    struct ListNode *p1 = l1, *p2 = l2;
    //进位
    int carry = 0;
    
    while (p1 != NULL || p2 != NULL) {
        int x = (p1 != NULL) ? p1->val : 0;
        int y = (p2 != NULL) ? p2->val : 0;
        
        int sum = carry + x + y;
        carry = sum / 10;
        
        struct ListNode *next = malloc(nodeSize);
        next->next = NULL;
        next->val = sum % 10;
        current->next = next;
        current = next;
        
        if (p1 != NULL) p1 = p1->next;
        if (p2 != NULL) p2 = p2->next;
    }
    
    if (carry > 0) {
        struct ListNode *next = malloc(nodeSize);
        next->next = NULL;
        next->val = carry;
        current->next = next;
    }
    return listNode->next;
}
