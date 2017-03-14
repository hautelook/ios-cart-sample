//
//  Product.h
//  ios-cart-test
//
//  Created by Bill Wetter on 3/10/17.
//  Copyright © 2017 HauteLook. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Product : NSObject
@property (nonatomic, strong) NSString *styleId;
@property (nonatomic, strong) NSString *brand;
@property (nonatomic, strong) NSString *name;
@property (nonatomic,strong) NSNumber *price;
@property (nonatomic, strong) NSNumber *inventory;
@property (nonatomic, strong) NSString *thumbnailUrl;

- (instancetype)initWithDictionary:(NSDictionary *)dict;
@end
