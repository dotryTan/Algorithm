//
//  Sort.swift
//  Algorithm
//
//  Created by fighter on 2021/4/22.
//

import Foundation

extension Array where Element: FixedWidthInteger {
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
    /// - 改进1：设置标志位pos，每一层排完序之后，就记录排到最大的哪一位在什么位置，
    /// - 因为每一层最大的数就是它所在数组的倒数的位数,下一次就没必要再循环一遍
    mutating func bubbleSortForPos() {
        var i = count - 1
        while i > 0 {
            var pos = 0
            (0..<i).forEach {
                guard self[$0] > self[$0 + 1] else { return }
                swapAt($0, $0 + 1)
                pos = $0
            }
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
        }
    }
    
    /// 选择排序
    /// - 首先在未排序序列中找到最小（大）元素，存放到排序序列的起始位置，
    /// - 然后，再从剩余未排序元素中继续寻找最小（大）元素，然后放到已排序序列的末尾。
    mutating func selectSort() {
        (0..<count - 1).forEach {
            var pos = $0
            ($0 + 1..<count).forEach {
                guard self[pos] > self[$0] else { return }
                pos = $0
            }
            swapAt($0, pos)
        }
    }
    
    /// 二分法选择排序
    /// - 改进：插入时使用二分查找
    mutating func selectSorForDichotomy() {
        (1..<count).forEach { (i) in
            var tmp = self[i], left = 0, right = i - 1
            while left <= right {
                
                let mid = Int(ceil(Double((left + right) / 2)))
                if tmp < self[mid] {
                    right = mid - 1
                } else {
                    left = mid + 1
                }
            }
            var j = i - 1
            while j >= left {
                self[j + 1] = self[j]
                j -= 1
            }
            self[left] = tmp
        }
//        for (var i = 1; i < arr.length; i++) {
//            var tmp = arr[i],left=0,right=i-1;
//            while (left <= right) {
//                var mid = parseInt((left+right)/2);
//                if (tmp < arr[mid] ) {
//                    right = mid -1;
//                }else {
//                    left = mid +1;
//                }
//            }
//            for(var j = i -1; j>=left; j--){
//                arr[j+1] = arr[j];
//            }
//            arr[left] = tmp;
//        }
    }
    
    /// 快速排序
    mutating func fastSort() {
        guard count > 1 else { return }
        var num = Int(floor(Double(count / 2)))
        var midValue = count % 2 == 0 ? (self[num] + self[num - 1]) / 2 : self[num]
        var left = [Element]()
        var right = [Element]()
        for i in 0..<count {
            if self[i] < midValue {
                left.append(self[i])
            } else {
                right.append(self[i])
            }
        }
        left.fastSort()
        right.fastSort()
        left.append(midValue)
        left.append(contentsOf: right)
        self = left
//        if (a.length <=1) {
//                return a;
//            }
//        var num = Math.floor(a.length/2);
//        var centerVal = a.splice(num,1); //获取中间值
//        var left =[];
//        var right =[];
//        for (var i = 0; i < a.length; i++) {
//            if (a[i] < centerVal) {
//                left.push(a[i]);
//            }else {
//                right.push(a[i]);
//            }
//        }
//        return sortArray(left).concat(centerVal,sortArray(right));
    }
}
