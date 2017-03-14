//
//  UIImageView+FakeNetworkLoad.m
//  ios-cart-test
//
//  Created by Bill Wetter on 3/13/17.
//  Copyright © 2017 HauteLook. All rights reserved.
//

#import "UIImageView+FakeNetworkLoad.h"

@implementation UIImageView (FakeNetworkLoad)
- (void)loadUrl:(NSURL *)url {
    [self setImage:[UIImage imageNamed:url.lastPathComponent]];
}

@end
