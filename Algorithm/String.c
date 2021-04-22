//
//  String.c
//  Algorithm
//
//  Created by fighter on 2021/1/6.
//

#include "String.h"
#import <string.h>
#import <malloc/_malloc.h>

/// 是否有重复字符
int unContainDuplicatedChar(char *s, int start, int end) {
    for (int i = start; i <= end; i++) {
        char c = s[i];
        for (int j = i + 1; j <= end; j++) {
            if (c == s[j]) {
                return 0;
            }
        }
    }
    return 1;
}

/// 取无重复字符串的最长子字符串，（循环遍历）例如pwwkew->wke
char *longestUnduplicatedSubstring(char *s) {
    int length = (int)strlen(s);
    int longest = 0;
    char *sub = malloc(length);
    for (int i = 0; i < length; i++) {
        for (int j = 0; j < length; j++) {
            if (unContainDuplicatedChar(s, i, j)) {
                if (longest >= j - i + 1) {
                    longest = longest;
                } else {
                    longest = j - i + 1;
                    strncpy(sub, s + i, longest);
                }
            }
        }
    }
    return sub;
}

/// 取无重复字符串的最长子字符串（窗口滑动），例如pwwkew->wke
char *longestUnduplicatedSubstring1(char *s) {
    int length = (int)strlen(s);
    char *sub = malloc(sizeof(char *));
    int ans = 0, i = 0, j = 0;
    while (i < length && j < length) {
        char *c = strchr(sub, s[j]);
        if (c == NULL) {
            strncat(sub, &s[j++], 1);
            ans = ans > j - i ? ans : j - i;
        } else {
            sub = strchr(sub, s[i++]) + 1;
        }
    }
    return sub;
}

/// 取无重复字符串的最长子字符串，（ASCII）例如pwwkew->wke
char *longestUnduplicatedSubstring2(char *s) {
    int length = (int)strlen(s), ans = 0;
    int index[128] = {};
    int i = 0;
    for (int j = 0; j < length; j++) {
        i = index[s[j]] > i ? index[s[j]] : i;
        ans = ans > j - i + 1 ? ans : j - i + 1;
        index[s[j]] = j + 1;
    }
    return s + i;
}

char *longestPalindromeSubstring(char *s) {
    int length = (int)strlen(s);
    int longestBegin = 0;
    int maxLen = 1;
    int table[1000][1000] = {0};
    for (int i = 0; i < length; i++) {
          table[i][i] = 1;
    }
    for (int i = 0; i < length - 1; i++) {
        if (s[i] == s[i + 1]) {
            table[i][i + 1] = 1;
            longestBegin = i;
            maxLen = 2;
        }
    }
    for (int len = 3; len <= length; len++) {
        for (int i = 0; i < length - len + 1; i++) {
            int j = i + len - 1;
            if (s[i] == s[j] && table[i + 1][j - 1]) {
                table[i][j] = 1;
                longestBegin = i;
                maxLen = len;
            }
        }
    }
    char *sub = malloc(sizeof(char *));
    strncpy(sub, s + longestBegin, maxLen);
    return sub;
}

/// 返回从字符串s从index-index2之间的回文子字符串
char *expandAroundCenter(char *s, int index1, int index2) {
    int length = (int)strlen(s);
    while (index1 >= 0 && index2 <= length - 1 && s[index1] == s[index2]) {
        index1--;
        index2++;
    }
    char *sub = malloc(sizeof(char *));
    strncpy(sub, &s[index1 + 1], index2 - index1 - 1);
    return sub;
}

/// 取最长回文字符串，例如babad->bab
char *longestPalindromeSubstring1(char *s) {
    int length = (int)strlen(s);
    if (length == 0) return "";
    char *sub = malloc(sizeof(char *));
    //单个字符也是回文字符串
    strncpy(sub, s, 1);
    for (int i = 0; i < length - 1; i++) {
        char *s1 = expandAroundCenter(s, i, i);
        if (strlen(s1) > strlen(sub)) sub = s1;
//        char *s2 = expandAroundCenter(s, i, i + 1);
//        if (strlen(s2) > strlen(sub)) sub = s2;
    }
    
    char name[80];
    memset(name, '\0', sizeof(name));
    int isReturn = strcmp(name, "") == 0;
    return sub;
}
