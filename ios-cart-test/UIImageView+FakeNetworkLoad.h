//
//  UIImageView+FakeNetworkLoad.h
//  ios-cart-test
//
//  Created by Bill Wetter on 3/13/17.
//  Copyright © 2017 HauteLook. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (FakeNetworkLoad)
- (void)loadUrl:(NSURL *)url;
@end
