//
//  LinkedList.h
//  Algorithm
//
//  Created by fighter on 2021/1/6.
//

#ifndef LinkedList_h
#define LinkedList_h

#include <stdio.h>

struct ListNode {
    int val;
    struct ListNode * _Nullable next;
};

/// 返回两个链表的和，例如(2 -> 4 -> 3) + (5 -> 6 -> 4) = (7 -> 0 -> 8)
struct ListNode* _Nonnull addTwoNumbers(struct ListNode * _Nonnull l1, struct ListNode * _Nonnull l2);

#endif /* LinkedList_h */
