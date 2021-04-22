//
//  TriangleShadow.c
//  Algorithm
//
//  Created by fighter on 2021/1/20.
//

#include "ThreeDimensionalBodyShadow.h"

int projectionArea(int **grid) {
//    int N = grid.size();
    int N = 50;
    int ans = 0;
    for (int i = 0; i < N; ++i) {
        int bestRow = 0; // 最大行
        int bestCol = 0; // 最大列
        for (int j = 0; j < N; ++j) {
            if (grid[i][j] == 0 && grid[j][i] == 0) break;
            if (grid[i][j] > 0) ans++; // 顶部阴影
            bestRow = bestRow > grid[i][j] ? bestRow : grid[i][j];
            bestCol = bestCol > grid[j][i] ? bestCol : grid[j][i];
        }
        ans += bestRow + bestCol;
    }
    return ans;
}
