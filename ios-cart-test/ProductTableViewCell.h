//
//  ProductTableViewCell.h
//  ios-cart-test
//
//  Created by Bill Wetter on 3/13/17.
//  Copyright © 2017 HauteLook. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Product;

@interface ProductTableViewCell : UITableViewCell
@property (nonatomic, strong) UIButton *addToCartButton;
- (void)configureWithProduct:(Product *)product;
@end
