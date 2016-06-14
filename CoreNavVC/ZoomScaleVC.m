//
//  ZoomScaleVC.m
//  CoreNavVC
//
//  Created by 冯成林 on 16/6/12.
//  Copyright © 2016年 冯成林. All rights reserved.
//

#import "ZoomScaleVC.h"
#import "TopView.h"
#import "CoreNavVC.h"

@interface ZoomScaleVC ()<UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;


@end


@implementation ZoomScaleVC

-(void)viewDidLoad{
    
    [super viewDidLoad];
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
  
    //安装
    self.nav_topView = [[NSBundle mainBundle] loadNibNamed:@"TopView" owner:nil options:nil].lastObject;
    
    [self addScrollNavbarWithScrollView:self.tableView autoToggleNavbarHeight:240 originHeight:200];

    self.enableParallax = YES;
    self.parallaxValue = 100;
}

-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    [self viewWillAppear_scrollNavbar];
}




-(void)viewWillDisappear:(BOOL)animated{
    
    [super viewWillDisappear:animated];

    [self viewWillDisappear_scrollNavbar];
}

-(void)dealloc{

    [self removeScrollNavbarWithScrollView:self.tableView];
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {return 40;}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];

    cell.textLabel.text = [NSString stringWithFormat:@"%i",indexPath.row];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
