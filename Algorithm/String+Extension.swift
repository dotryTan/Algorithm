//
//  String+Extension.swift
//  Algorithm
//
//  Created by fighter on 2021/1/18.
//

import Foundation

extension String {
    /// 取无重复字符串的最长子字符串，（窗口滑动）例如pwwkew->wke
    func longestUnduplicatedSubstring() -> String {
        var array = Array<Character>()
        var ans = 0, i = 0, j = 0
        while (i < count && j < count) {
            let c = self[index(startIndex, offsetBy: j)]
            if !array.contains(c) {
                array.append(c)
                ans = max(ans, j - i)
                j += 1
            } else {
                //删除重复的字符
                array.removeSubrange(0...array.firstIndex(of: c)!)
                i += 1
            }
        }
        return String(array)
    }
    
    /// 取无重复字符串的最长子字符串，（窗口滑动）例如pwwkew->wke
    func longestUnduplicatedSubstring1() -> String {
        var dic = [Character: Int]()
        var j = 0, i = 0
        while j < count {
            let c = self[index(startIndex, offsetBy: j)]
            if dic.keys.contains(c) {
                /// 最近一次重复字符的下标
                i = dic[c]!
            }
            dic[c] = j
            j += 1
        }
        /// 从最近一次重复字符的下标往后一位取子字符串
        return String(dropFirst(i))
    }
}
