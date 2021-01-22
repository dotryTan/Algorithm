//
//  String.h
//  Algorithm
//
//  Created by fighter on 2021/1/6.
//

#ifndef String_h
#define String_h

#include <stdio.h>

/// 取无重复字符串的最长子字符串，（循环遍历）例如pwwkew->wke
char *longestUnduplicatedSubstring(char *);

/// 取无重复字符串的最长子字符串，（窗口滑动）例如pwwkew->wke
char *longestUnduplicatedSubstring1(char *);

/// 取无重复字符串的最长子字符串，（ASCII）例如pwwkew->wke
char *longestUnduplicatedSubstring2(char *);

/// 取最长回文字符串，例如babad->bab
char *longestPalindromeSubstring(char *);

/// 取最长回文字符串，例如babad->bab
char *longestPalindromeSubstring1(char *);


#endif /* String_h */
