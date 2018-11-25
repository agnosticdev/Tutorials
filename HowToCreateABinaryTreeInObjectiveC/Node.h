//
//  Node.h
//  BinaryTree
//
//  Created by Matt Eaton on 11/21/18.
//  Copyright © 2018 Matt Eaton. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Node : NSObject

@property int num;
@property Node *left;
@property Node *right;

- (id)initWithValue:(int)value;

@end

NS_ASSUME_NONNULL_END
