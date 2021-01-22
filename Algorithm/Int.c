//
//  Int.c
//  Algorithm
//
//  Created by fighter on 2021/1/20.
//

#include "Int.h"
#include <limits.h>

/// 获取一个数的反转，如传入123返回321
int reverse(int n) {
    int rev = 0;
    while (n != 0) {
        int pop = n % 10; n /= 10;
        //溢出
        if (rev > INT_MAX / 10 || (rev == INT_MAX / 10 && pop > 7)) return 0;
        // 溢出
        if (rev < INT_MIN / 10 || (rev == INT_MIN / 10 && pop < -8)) return 0;
        rev = rev * 10 + pop;
    }
    return rev;
}

int removeDuplicates(int nums[], int length) {
    if (length == 0) return 0;
    /*冒泡升序*/
    for(int i = 0; i < length - 1; i++){
        for(int j = 0; j < length - 1 - i; j++){
            if(nums[j] > nums[j + 1]){
                int t = nums[j];
                nums[j] = nums[j + 1];
                nums[j + 1] = t;
            }
        }
    }
    int i = 0;
    for (int j = 1; j < length; j++) {
        if (nums[j] != nums[i]) {
            i++;
            nums[i] = nums[j];
        }
    }
    return i + 1;
}


