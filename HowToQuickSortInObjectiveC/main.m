//
//  main.m
//  QuickSort
//
//  Created by Matt Eaton on 11/11/18.
//  Copyright © 2018 Matt Eaton. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QuickSort: NSObject

- (NSArray *) quickSortArray:(NSArray *)unsortedArray;
@end

@implementation QuickSort

// ---------- Start of Quick Sort -------------

- (NSArray *) quickSortArray:(NSArray *)unsortedArray {
    
    // Time complexity: O(n^2).
    //  * First time arround is to separate the entire array.
    //  * Second time around should sort the rest of the array.
    // Space complexity: O(log n)  +1 for unsortedArray but the mutable copy never gets added to the autorelease pool.
    // All of the arrays that are not attached to the returnArray are released by a compiler pass at the end of the method.
    
    int count = (int)[unsortedArray count];
    if (count <= 1) {
        return unsortedArray;
    }
    
    int pivot = [[unsortedArray objectAtIndex: (count/2)] intValue];
    NSMutableArray *smallerThanArray = [NSMutableArray array];
    NSMutableArray *largerThanArray = [NSMutableArray array];
    NSMutableArray *pivotArray = [NSMutableArray array];
    [pivotArray addObject: @(pivot)];
    
    for (int e = 0; e < count; e++) {
        int num = [[unsortedArray objectAtIndex:e] intValue];
        
        if (num < pivot) {
            [smallerThanArray addObject: @(num)];
        } else if (num > pivot) {
            [largerThanArray addObject: @(num)];
            // To address the possibly duplicate that is defined in the pivot, in this case 4.
        } else if (e != (count/2) && pivot == num) {
            [pivotArray addObject: @(num)];
        }
    }
    
    NSMutableArray *returnArray = [NSMutableArray array];
    [returnArray addObjectsFromArray: [self quickSortArray: smallerThanArray]];
    [returnArray addObjectsFromArray: pivotArray];
    [returnArray addObjectsFromArray: [self quickSortArray: largerThanArray]];
    
    return returnArray;
}

// ---------- End of Quick Sort ---------------

@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        NSArray *quickSortData = @[@4, @3, @10, @44, @6, @4, @1, @7];
        
        QuickSort *qs = [[QuickSort alloc] init];
        NSArray *sortedNumbers = [qs quickSortArray:quickSortData];
        NSLog(@"Sorted Numbers %@", sortedNumbers);
        
    }
    return 0;
}
