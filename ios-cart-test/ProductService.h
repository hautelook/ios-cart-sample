//
//  ProductService.h
//  ios-cart-test
//
//  Copyright © 2017 HauteLook. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Product;

typedef void(^HLOnCompleteLoad)(NSArray<Product *> *items, NSError *error, BOOL hasChanged);

@interface ProductService : NSObject
- (void)loadProducts:(HLOnCompleteLoad)onComplete;
@end
