//
//  ProductTableViewCell.m
//  ios-cart-test
//
//  Created by Bill Wetter on 3/13/17.
//  Copyright © 2017 HauteLook. All rights reserved.
//

#import "ProductTableViewCell.h"
#import "Product.h"
#import "UIImageView+FakeNetworkLoad.h"

@interface ProductTableViewCell()
@property (nonatomic, strong) UIImageView *thumbnailView;
@property (nonatomic, strong) UILabel *productNameLabel;
@property (nonatomic, strong) UILabel *brandLabel;
@property (nonatomic, strong) UILabel *priceLabel;
@property (nonatomic, strong) NSDictionary *brandStyle;
@property (nonatomic, strong) NSDictionary *detailStyle;

@end

@implementation ProductTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        _thumbnailView = [[UIImageView alloc] initWithFrame:CGRectZero];
        [self.contentView addSubview:_thumbnailView];
        
        _productNameLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _productNameLabel.numberOfLines = 1;
        [self.contentView addSubview:_productNameLabel];
        
        _brandLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _brandLabel.numberOfLines = 0;
        [self.contentView addSubview:_brandLabel];

        _addToCartButton = [[UIButton alloc] initWithFrame:CGRectZero];
        [_addToCartButton setBackgroundColor:[UIColor colorWithRed:22.0/255 green:130.0/255 blue:158.0/255 alpha:1.0]];
        [_addToCartButton setTitle:@"ADD TO CART" forState:UIControlStateNormal];
        [self.contentView addSubview:_addToCartButton];
        
        _brandStyle = @{NSFontAttributeName : [UIFont boldSystemFontOfSize:14.0f]};
        _detailStyle = @{NSFontAttributeName : [UIFont systemFontOfSize:14.0f]};

        
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGFloat fullWidth = CGRectGetWidth(self.contentView.bounds);
    self.thumbnailView.frame = CGRectMake(2.0f, 2.0f, 81.0f, 123.0f);
    [self.brandLabel sizeToFit];
    self.brandLabel.frame = CGRectMake(CGRectGetMaxX(self.thumbnailView.frame) + 5.0f, 5.0f, fullWidth - CGRectGetWidth(self.thumbnailView.bounds), CGRectGetHeight(self.brandLabel.bounds));
    self.addToCartButton.frame = CGRectMake(CGRectGetMinX(self.brandLabel.frame), CGRectGetMaxY(self.brandLabel.frame) + 5.0f, fullWidth/2, 40.0f);
}

- (void)configureWithProduct:(Product *)product {
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:@""];
    
    NSAttributedString *brandString = [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@\n", product.brand] attributes:self.brandStyle];
    NSAttributedString *detailString = [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@\n$%@", product.name, product.price] attributes:self.detailStyle];
    
    [attributedString appendAttributedString:brandString];
    [attributedString appendAttributedString:detailString];
    
    self.brandLabel.attributedText = attributedString;
    
    [self.thumbnailView loadUrl:[NSURL URLWithString:product.thumbnailUrl]];
}

@end
