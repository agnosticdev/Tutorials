//
//  main.m
//  BinaryTree
//
//  Created by Matt Eaton on 11/21/18.
//  Copyright © 2018 Matt Eaton. All rights reserved.
//

#import <Foundation/Foundation.h>
#include "BinaryTree.h"


int main(int argc, const char * argv[]) {
    @autoreleasepool {

        NSArray *binaryTreeRawData = @[@5, @6, @17, @1, @15, @32, @3, @8, @91];
        
        Node *root = [[Node alloc] init];
        BinaryTree *tree = [[BinaryTree alloc] init];
        // Create the
        root = [tree createBinaryTree:binaryTreeRawData andRoot:root];
        [tree printBinaryTree:root];
        int level = [tree find:15 atLevel:0 onTree:root];
        
        NSString *message = @"Numeric value not found in Binary Tree";
        if (level != -1) {
            message = [NSString stringWithFormat:@"Numeric value found at level: %d", level];
        }
        NSLog(@"%@", message);
    }
    return 0;
}
