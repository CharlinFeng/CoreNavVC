//
//  HomeTVC.m
//  CoreNavVC
//
//  Created by Charlin on 16/5/24.
//  Copyright © 2016年 冯成林. All rights reserved.
//

#import "HomeTVC.h"
#import "FooterView.h"
#import "HomeCell.h"
#import "AppNavVC.h"
#import "PopBackVC.h"

@interface HomeTVC ()

@property (nonatomic,strong) NSArray *dataList;

@end

@implementation HomeTVC

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.dataList = @[@"一键定制NavBar",@"PopGesture",@"仿QQ无网络检测（断开WIFI）",@"拦截Pop返回事件"];
    
    self.tableView.tableFooterView = [UIView new];
    
    CGRect f = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 260);
    UIView *footerView = [[NSBundle mainBundle] loadNibNamed:@"FooterView" owner:nil options:nil].lastObject;
    footerView.frame = f;
    self.tableView.tableFooterView = footerView;
    self.view.backgroundColor = [UIColor blackColor];
    self.tableView.separatorColor = [UIColor whiteColor];
    self.tableView.rowHeight = 80;
    self.tabBarController.tabBar.tintColor = YeahColor;
    
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return  self.dataList.count;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    static NSString *rid = @"HomeTVCCell";

    HomeCell *cell = [tableView dequeueReusableCellWithIdentifier:rid];

    if (cell == nil){
    
        cell = [[NSBundle mainBundle] loadNibNamed:@"HomeCell" owner:nil options:nil].lastObject;
        
    }
    
    cell.mainLabel.text = self.dataList[indexPath.row];
  
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    [tableView deselectRowAtIndexPath:indexPath animated:YES];

    UIViewController *nextVC = nil;
    
    if (indexPath.row == 1){
    
        UIViewController *vc = [UIViewController new];
        
        vc.view.backgroundColor = [UIColor blackColor];
        nextVC = vc;
    }else if (indexPath.row == 3){
    
        PopBackVC *vc = [PopBackVC new];
        vc.view.backgroundColor = [UIColor whiteColor];
        nextVC = vc;
    }
    nextVC.title = self.dataList[indexPath.row];
    [self.navigationController pushViewController:nextVC animated:YES];
}

@end
