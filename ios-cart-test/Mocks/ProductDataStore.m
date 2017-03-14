//
//  ProductDataStore.m
//  ios-cart-test
//
//  Created by Bill Wetter on 3/13/17.
//  Copyright © 2017 HauteLook. All rights reserved.
//

#import "ProductDataStore.h"
#import "Product.h"

@interface ProductDataStore()
@property(nonatomic, strong) NSMutableArray<Product *> *products;
@end

@implementation ProductDataStore

+ (instancetype)shared {
    static ProductDataStore *_shared;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _shared = [[ProductDataStore alloc] init];
    });
    return _shared;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _products = [NSMutableArray array];
    }
    return self;
}

- (NSArray<Product *> *)loadProducts {
    if ([self.products count] < 1) {
        [self _setupProducts];
    }
    
    return self.products;
}

- (void)_setupProducts {
    [self.products addObject:[[Product alloc] initWithDictionary:@{
                                                                   @"styleId" : @"th-001",
                                                                   @"brand" : @"Tommy Hilfiger",
                                                                   @"name" : @"Belted Jacket",
                                                                   @"price" : @30.99,
                                                                   @"inventory" : @4,
                                                                   @"thumbnailUrl" : @"https://www.hltestcdn.com/images/belted-jacket.jpg"
                                                                   }]
     ];
    
    [self.products addObject:[[Product alloc] initWithDictionary:@{
                                                                   @"styleId" : @"th-002",
                                                                   @"brand" : @"Tommy Hilfiger",
                                                                   @"name" : @"Trench Coat",
                                                                   @"price" : @45.99,
                                                                   @"inventory" : @5,
                                                                   @"thumbnailUrl" : @"https://www.hltestcdn.com/images/trench-coat.jpg"
                                                                   }]
     ];
    
    [self.products addObject:[[Product alloc] initWithDictionary:@{
                                                                   @"styleId" : @"th-003",
                                                                   @"brand" : @"Tommy Hilfiger",
                                                                   @"name" : @"Rain Jacket",
                                                                   @"price" : @25.99,
                                                                   @"inventory" : @1,
                                                                   @"thumbnailUrl" : @"https://www.hltestcdn.com/images/rain-jacket.jpg"
                                                                   }]
     ];
    
}

@end
