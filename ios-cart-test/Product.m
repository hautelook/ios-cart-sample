//
//  Product.m
//  ios-cart-test
//
//  Created by Bill Wetter on 3/10/17.
//  Copyright © 2017 HauteLook. All rights reserved.
//

#import "Product.h"

@implementation Product

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [self init];
    if (self != nil) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

- (void)setValue:(id)value forUndefinedKey:(nonnull NSString *)key {
    if ([key isEqualToString:@"_links"] && [value isKindOfClass:[NSDictionary class]]) {
        NSDictionary *image = [value objectForKey:@"image"];
        if (image != nil) {
            _thumbnailUrl = [image objectForKey:@"href"];
        }
    }
}

@end
