//
//  main.m
//  InsertionSort
//
//  Created by Matt Eaton on 11/17/18.
//  Copyright © 2018 Matt Eaton. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface InsertionSort: NSObject

- (NSArray *) mutableArrayInsertionSort: (NSArray *)unsortedArray;
- (void) constantArrayInsertionSort;

@end

@implementation InsertionSort

- (NSArray *) mutableArrayInsertionSort: (NSArray *)unsortedArray {
    
    
    // Time complexity: O(n^2).  Worst case: i*j.
    // Space complexity: O(1)  1 for sortedArray and the mutable copy never gets added to the autorelease pool.
    // Expensive routines:
    // * replaceObjectAtIndex
    
    NSMutableArray *returnArray = [unsortedArray mutableCopy];
    
    for (int i = 1; i < [unsortedArray count]; i++) {
        
        for (int j = i; j > 0; j--) {
            int jMinus = [[returnArray objectAtIndex: (j-1)] intValue];
            int jFlat = [[returnArray objectAtIndex: j] intValue];
            if (jMinus > jFlat) {
                [returnArray replaceObjectAtIndex: j withObject: @(jMinus)];
                [returnArray replaceObjectAtIndex: (j-1) withObject: @(jFlat)];
            }
        }
    }
    
    return returnArray;
}


- (void) constantArrayInsertionSort {
    
    NSInteger searchArray[10] = {4, 5, 1, -2, 44, 31, 50, 16, 9, 15};  // NSInteger = long
    
    size_t size = sizeof(searchArray) / sizeof(NSInteger);
    
    
    for (int i = 1; i < size; i++) {
        
        for (int j = i; j > 0; j--) {
            int jMinus = (int)searchArray[j-1];
            int jFlat = (int)searchArray[j];
            if (jMinus > jFlat) {
                searchArray[j] = jMinus;
                searchArray[j-1] = jFlat;
            }
        }
    }
    // Prints out: 1,4,5,9,15,16,31,44,50
    for (int e = 0; e < size; e++) {
        NSLog(@"%ld", searchArray[e]);
    }
    
}


@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        NSArray *unsortedData = @[@4, @5, @1, @44, @31, @50, @16, @4, @9, @15];
        
        InsertionSort *is = [[InsertionSort alloc] init];
        NSArray *sortedDataArray = [is mutableArrayInsertionSort: unsortedData];
        NSLog(@"sortedDataArray: %@", sortedDataArray);
        
        // Call the NSInteger insertionSort method.
        [is constantArrayInsertionSort];
    }
    return 0;
}
