//
//  Fibonacci.cpp
//  Algorithm
//
//  Created by fighter on 2021/1/21.
//

#include "FibonacciBridging.h"
#include <iostream>
#include <vector>
#include <unordered_set>
#include <unordered_map>
using namespace std;

int *lenLongestFibSubseq(int a[9]) {
    vector<int> A(a, a + 9);
    vector<int> b = vector<int>();
    int N = (int)A.size();
    unordered_set<int> S(A.begin(), A.end());
    int ans = 0;
    for (int i = 0; i < N - 2; ++i) {
        vector<int> c = vector<int>();
        c.push_back(A[i]);
        for (int j = i + 1; j < N; ++j) {
            /* 起使值用a[i],a[j],
             * y代表未来预期的值
             * x代表当前的值 */
            int x = A[j], y = A[i] + A[j];
            int length = 2;
            while (S.find(y) != S.end()) {
                if (c.size() == 1) c.push_back(x);
                c.push_back(y);
                int z = x + y;
                x = y;
                y = z;
                ans = max(ans, ++length);
            }
        }
        b = b.size() > c.size() ? b : c;
    }
    return b.size() > 0 ? b.begin().base() : NULL;
}

int *lenLongestFibSubseq1(int a[9]) {
    vector<int> A(a, a + 9);
    int N = (int)A.size();
    unordered_map<int, int> index = unordered_map<int, int>();
    for (int i = 0; i < N; ++i) {
        index[A[i]] = i;
    }
    unordered_map<int, int> longest = unordered_map<int, int>();
    vector<int> B = vector<int>();
    int ans = 0;
    vector<int> C = vector<int>();
    for (int k = 0; k < N; ++k) {
        for (int j = 0; j < k; ++j) {
            if (A[k] - A[j] < A[j] && index.count(A[k] - A[j])) {
                int i = index[A[k] - A[j]];
                longest[j * N + k] = longest[i * N + j] + 1;
                ans = max(ans, longest[j * N + k] + 2);
                
                C.push_back(A[i]);
                C.push_back(A[j]);
                C.push_back(A[k]);
            }
        }
//        B = B.size() > C.size() ? B : C;
        for (int i = 0; i < B.size(); ++i) {
            printf("%d ", B[i]);
        }
        printf("\n");
    }
//    return ans >= 3 ? ans : 0;
    return B.size() > 0 ? B.begin().base() : NULL;
}
