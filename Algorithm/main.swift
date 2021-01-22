//
//  main.swift
//  Algorithm
//
//  Created by fighter on 2021/1/6.
//

import Foundation

extension FixedWidthInteger {
    func nextPowerOf2() -> Self {
        return 1 << (bitWidth - (self - 1).leadingZeroBitCount)
    }
}

var dic = ["1": 1, "2": 2, "3": 3, "4": 4, "5": 5]
dic["6"] = 6
dic["7"] = 7
dic["8"] = 8
let t = Int8(truncating: 25)
var array = [1, 2, 3, 4, 5]
array.append(6)

 
print(9.nextPowerOf2())

var node1 = ListNode(val: 3, next: nil)
var node2 = ListNode(val: 4, next: &node1)
var node3 = ListNode(val: 2, next: &node2)
var node4 = ListNode(val: 1, next: nil)
var node5 = ListNode(val: 6, next: &node4)
var node6 = ListNode(val: 6, next: &node5)
var node7 = ListNode(val: 5, next: &node6)
let node8 = addTwoNumbers(&node3, &node7)
var next: UnsafeMutablePointer<ListNode>? = node8.pointee.next
var nodeStr = "\(node8.pointee.val)"
while next != nil {
    nodeStr.append("->\(next!.pointee.val)")
    next = next?.pointee.next
}
print(nodeStr)

print("pwwkew".longestUnduplicatedSubstring())

print("122342".longestUnduplicatedSubstring1())

let str = "pwwkew"
var strs = str.cString(using: .utf8)!
let strPtr = UnsafeMutableRawPointer(mutating: withUnsafePointer(to: &strs[0], { $0 })).assumingMemoryBound(to: Int8.self)
let subStr = longestUnduplicatedSubstring(strPtr)
print(String(cString: subStr!))
let subStr1 = longestUnduplicatedSubstring1(strPtr)
print(String(cString: subStr1!))
let subStr2 = longestUnduplicatedSubstring2(strPtr)
print(String(cString: subStr2!))

var strs3 = "abadbda".cString(using: .utf8)!
let strPtr3 = UnsafeMutableRawPointer(mutating: withUnsafePointer(to: &strs3[0], { $0 })).assumingMemoryBound(to: Int8.self)
let subStr3 = longestPalindromeSubstring(strPtr3)
print(String(cString: subStr3!))
let subStr4 = longestPalindromeSubstring1(strPtr3)
print(String(cString: subStr4!))

print(reverse(123))

var nums: [Int32] = [0, 1, 1, 3, 2, 2, 4, 3, 1, 3, 3]
var numsPtr = withUnsafeMutablePointer(to: &nums[0], { $0 })
print((0..<removeDuplicates(numsPtr, Int32(nums.count))).map({ numsPtr.advanced(by: Int($0)).pointee }))

var h = [[Int32]](repeating: [Int32](repeating: 0, count: 50), count: 50)
h[0][0..<3]  = [1, 2, 3]
h[1][0..<3] = [4, 5, 6]
//h[2][0..<3] = [7, 8, 9]

var nums1 = [UnsafeMutablePointer<Int32>?](repeating: nil, count: 50)
for i in 0..<h.count {
    nums1[i] = withUnsafeMutablePointer(to: &h[i][0], { $0 })
}
var numsPtr1 = withUnsafeMutablePointer(to: &nums1[0], { $0 })
print(projectionArea(numsPtr1))

var nums2: [Int32] = [1,3,7,11,12,14,18,23,35]
let numsPtr2 = lenLongestFibSubseq(withUnsafeMutablePointer(to: &nums2[0], { $0 }))
var nums21 = [numsPtr2?.pointee ?? 0, numsPtr2?.advanced(by: 1).pointee ?? 0]
for i in 2..<nums2.count {
    let value = numsPtr2?.advanced(by: i).pointee ?? 0
    guard value == nums21[i - 2] + nums21[i - 1] else { break }
    nums21.append(value)
}
print(nums21)
print("end")

