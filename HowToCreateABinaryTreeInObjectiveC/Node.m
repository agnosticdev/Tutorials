//
//  Node.m
//  BinaryTree
//
//  Created by Matt Eaton on 11/21/18.
//  Copyright © 2018 Matt Eaton. All rights reserved.
//

#import "Node.h"

@implementation Node

- (id)initWithValue:(int)value {
    
    self = [super init];
    if (self != nil) {
        self.num = value;
        self.left = NULL;
        self.right = NULL;
    }
    return self;
}

@end
