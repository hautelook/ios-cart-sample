//
//  ViewController.m
//  ios-cart-test
//
//  Created by Bill Wetter on 3/9/17.
//  Copyright © 2017 HauteLook. All rights reserved.
//

#import "ProductListViewController.h"
#import "ProductService.h"
#import "ProductTableViewCell.h"
#import "CartViewController.h"

@interface ProductListViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) ProductService *productService;
@property (nonatomic, strong) NSArray<Product *> *products;
@end

@implementation ProductListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[self navigationController] setTitle:@"Products"];
    _productService = [[ProductService alloc] init];
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    self.tableView.tableFooterView = [[UIView alloc] init];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.view addSubview:self.tableView];

    UIButton *cartButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [cartButton addTarget:self action:@selector(cartButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    [cartButton setTitle:@"Cart" forState:UIControlStateNormal];
    [cartButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [cartButton setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    [cartButton sizeToFit];
    
    UIBarButtonItem *rightBarButton = [[UIBarButtonItem alloc] initWithCustomView:cartButton];
    self.navigationItem.rightBarButtonItem = rightBarButton;

    [self.productService loadProducts:^(NSArray<Product *> *items, NSError *error, BOOL hasChanged) {
        if (hasChanged) {
            _products = items;
            [self.tableView reloadData];
        }
    }];
    // Do any additional setup after loading the view, typically from a nib.
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 150;
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.products count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"ProductCell";
    
    ProductTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (cell == nil) {
        cell = [[ProductTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
    }
    
    [cell configureWithProduct:[self.products objectAtIndex:[indexPath row]]];
    
    return cell;
}

#pragma mark - Button Tap
- (void)cartButtonTapped:(UIButton *)button {
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
