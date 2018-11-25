//
//  BinaryTree.h
//  BinaryTree
//
//  Created by Matt Eaton on 11/21/18.
//  Copyright © 2018 Matt Eaton. All rights reserved.
//

#import <Foundation/Foundation.h>
#include "Node.h"

NS_ASSUME_NONNULL_BEGIN

@interface BinaryTree : NSObject

- (Node *) insertNode: (Node *)node withData:(int)value;
- (Node *) createBinaryTree:(NSArray *)treeData andRoot:(Node *)root;
- (void) printBinaryTree: (Node *)node;
- (int) find:(int)value atLevel:(int)level onTree:(Node *)tree;

@end

NS_ASSUME_NONNULL_END
