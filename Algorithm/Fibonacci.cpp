//
//  Fibonacci.cpp
//  Algorithm
//
//  Created by fighter on 2021/1/21.
//

#include "FibonacciBridging.h"
#include "Fibonacci.hpp"
#include <vector>
#include <unordered_set>
#include <set>
int *lenLongestFibSubseq(int a[9]) {
    vector<int> A(a, a + 9);
    vector<int> b;
    int N = (int)A.size();
    set<int> S(A.begin(), A.end());
//    unordered_set<int> S(A.begin(), A.end());
    int ans = 0;
    for (int i = 0; i < N - 2; ++i) {
        vector<int> c;
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
                b = b.size() > c.size() ? b : c;
            }
        }
    }
    return b.size() > 0 ? b.begin().base() : NULL;
}
