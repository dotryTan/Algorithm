//
//  Sort.swift
//  Algorithm
//
//  Created by fighter on 2021/4/22.
//

import Foundation

extension Array where Element: Comparable {
    /// 冒泡排序
    /// - 比较相邻的元素。如果第一个比第二个大，就交换它们两个
    /// - 对每一对相邻元素作同样的工作，从开始第一对到结尾的最后一对，这样在最后的元素应该会是最大的数
    /// - 针对所有的元素重复以上的步骤，除了最后一个
    /// - 重复步骤1~3，直到排序完成
    mutating func bubbleSort() {
        (0..<count - 1).forEach { (_) in
            (0..<count - 1).forEach { self[$0] > self[$0 + 1] ? swapAt($0, $0 + 1) : () }
        }
    }
    
    /// 标志位冒泡排序
    /// - 改进1：设置标志位pos，每一层排完序之后，就记录排到最大的那一位在什么位置，
    /// - 因为每一层最大的数就是它所在数组的倒数的位数,下一次就没必要再循环一遍
    mutating func bubbleSortForPos() {
        print("  ------ \(self)")
        var i = count - 1
        while i > 0 {
            var pos = 0
            (0..<i).forEach {
                guard self[$0] > self[$0 + 1] else { return }
                swapAt($0, $0 + 1)
                pos = $0
                print("\(pos) ------ \(self)")
            }
            print("------\(pos)------")
            i = pos
        }
    }
    
    /// 正反向同时冒泡排序
    /// - 改进2：每趟排序从正反向冒泡一次得到两个最终值(最大和最小值)，排序次数几乎减少一半
    mutating func bubbleSortForTwoWay() {
        var low = 0
        var high = count - 1
        while low < high {
            (low..<high).forEach { self[$0] > self[$0 + 1] ? swapAt($0, $0 + 1) : () }
            high -= 1
            (low..<high).forEach { self[high - $0] < self[high - $0 - 1] ? swapAt(high - $0, high - $0 - 1) : () }
            low += 1
            print("\(low) --- \(self) --- \(high)")
        }
    }
    
    /// 选择排序
    /// - 首先在未排序序列中找到最小（大）元素，存放到排序序列的起始位置，
    /// - 然后，再从剩余未排序元素中继续寻找最小（大）元素，然后放到已排序序列的末尾。
    mutating func selectSort() {
        (0..<count - 1).forEach {
            var pos = $0
            // 找到最小的值放在最前面
            ($0 + 1..<count).forEach { self[pos] > self[$0] ? pos = $0 : () }
            swapAt($0, pos)
            print("\($0) ------ \(self)")
        }
    }
    
    /// 插入排序
    /// - 从第一个元素开始，该元素可以认为已经排好序，
    /// - 取下一个元素，在已经排好序的序列中向前扫描，
    /// - 有元素大于这个新元素，将已经在排好序中的元素移到下一个位置，依次执行
    mutating func insertSort() {
        (1..<count).forEach {
            let temp = self[$0]
            var j = $0 - 1
            
            while j >= 0, self[j] > temp {
                self[j + 1] = self[j]
                j -= 1
            }
            self[j + 1] = temp
            print("\($0) ------ \(self)")
        }
    }
    
    /// 二分法插入排序
    /// - 改进：插入时使用二分查找
    /// - 先找出需要移动到哪个位置
    /// - 再根据找出的位置依次移动
    mutating func selectSorForDichotomy() {
        print("0 ------ \(self)")
        (1..<count).forEach { (i) in
            var temp = self[i], left = 0, right = i - 1
            // 找出需要移动几个位置
            while left <= right {
                let mid = Int(ceil(Double((left + right) / 2)))
                temp < self[mid] ? (right = mid - 1) : (left = mid + 1)
            }
            var j = i - 1
            while j >= left {
                self[j + 1] = self[j]
                j -= 1
            }
            self[left] = temp
            print("\(i) ------ \(self) --- \(left) --- \(right )")
        }
    }
    
    /// 希尔排序
    /// - 先将整个待排序的记录序列分割成为若干子序列
    /// - 然后分别进行直接插入排序
    mutating func hillSort() where Element == Int {
        var temp = 1, gap = 1
        while(gap < count / 4){ //定义间隔序列
            gap = gap * 4 + 1;
        }
        while gap > 0 {
            /// 插入排序
            (gap..<count).forEach {
                temp = self[$0]
                
                var j = $0 - gap
                while j >= 0, self[j] > temp {
                    self[j + gap] = self[j]
                    j -= gap
                }
                self[j + gap] = temp
            }
            gap = Int(floor(Double(gap) / 4))
        }
    }
    
    /// 归并排序:
    /// - 将已有序的子序列合并，得到完全有序的序列；
    /// - 即先使每个子序列有序，再使子序列段间有序
    mutating func mergeSort() {
        func merge(left: inout Self, right: inout Self ) -> Self {
            var result = [Element]()
            while left.count > 0 && right.count > 0 {
                left[0] <= right[0] ? result.append(left.remove(at: 0)) : result.append(right.remove(at: 0))
            }
            while (left.count > 0) {
                result.append(left.remove(at: 0))
            }
            while (right.count > 0) {
                result.append(right.remove(at: 0))
            }
            return result
        }
        
        guard count >= 2 else { return }
        var middle = Int(floor(Double(count) / 2)),
            left = Array(self[0..<middle]),
            right = Array(self[middle..<count])
        
        left.mergeSort()
        right.mergeSort()
        self = merge(left: &left, right: &right)
    }
    
    /// 快速排序
    /// - 先在数组中随机找到一个数，小于这个数的放在左边，大于这个数的放在右边，
    /// - 递归排好序然后将左右拼接得到排序好的数组
    mutating func fastSort() {
        guard count > 1 else { return }
        let randomValue = self[Int(arc4random_uniform(UInt32(count)))]
        
        var left = [Element]()
        var right = [Element]()
        (0..<count).map { self[$0] }.forEach { $0 <= randomValue ? left.append($0) : right.append($0) }
        left.fastSort()
        right.fastSort()
        self = left + right
    }
    
}
