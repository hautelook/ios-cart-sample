//
//  ProductService.m
//  ios-cart-test
//
//  Created by Bill Wetter on 3/13/17.
//  Copyright © 2017 HauteLook. All rights reserved.
//

#import "ProductService.h"
#import "ProductDataStore.h"

@interface ProductService()
@property(nonatomic, strong) ProductDataStore *dataStore;
@end

@implementation ProductService

- (instancetype)init {
    self = [super init];
    if (self) {
        _dataStore = [ProductDataStore shared];
    }
    return self;
}

- (void)loadProducts:(HLOnCompleteLoad)onComplete {
    onComplete([self.dataStore loadProducts], nil, YES);
}

@end
