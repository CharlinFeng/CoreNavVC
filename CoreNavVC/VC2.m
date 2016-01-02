//
//  VC2.m
//  CoreNavVC
//
//  Created by 冯成林 on 15/12/23.
//  Copyright © 2015年 冯成林. All rights reserved.
//


#import "VC2.h"
#import "CoreNavVC.h"
#import "HeaderTopView.h"
#import <objc/runtime.h>

@interface VC2 ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic,strong) UITableView *tableView;


@end

@implementation VC2

- (void)viewDidLoad {
    [super viewDidLoad];

    self.tableView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStylePlain];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.view addSubview:self.tableView];
    
    self.title = @"这是第二个控制器";
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"菜单" style:UIBarButtonItemStylePlain target:self action:@selector(meauBtnClick)];
    
    self.topView = [HeaderTopView topView];
   
    [self addScrollNavbarWithScrollView:self.tableView autoToggleNavbarHeight:30 topView:self.topView originHeight:200];
}




-(void)dealloc{
    [self removeScrollNavbarWithScrollView:self.tableView];
    [self.navigationController showNavBarWithAnim:YES];
}



-(void)meauBtnClick{

    NSLog(@"点击了菜单");
}





-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{return 30;}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *rid = @"rid";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:rid];
    
    if(cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:rid];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"这是第%@行",@(indexPath.row)];
    
    return cell;
}


@end
