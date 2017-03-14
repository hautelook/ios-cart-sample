//
//  ProductDataStore.h
//  ios-cart-test
//
//  Created by Bill Wetter on 3/13/17.
//  Copyright © 2017 HauteLook. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Product;

@interface ProductDataStore : NSObject
+ (instancetype)shared;
- (NSArray<Product *> *)loadProducts;
@end
