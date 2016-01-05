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
    
    self.nav_topView = [HeaderTopView topView];
   
    [self addScrollNavbarWithScrollView:self.tableView autoToggleNavbarHeight:40 originHeight:160];
}


-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    [self.navigationController showNavBarWithAnim:NO];
    [self popGestureEnable:NO];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self popGestureEnable:YES];
    });
}

-(void)viewWillDisappear:(BOOL)animated{
    
    [super viewWillDisappear:animated];
  
    [self.navigationController showNavBarWithAnim:YES];
}

-(void)viewDidDisappear:(BOOL)animated{
    
    [super viewDidDisappear:animated];
    
    [self.navigationController showNavBarWithAnim:YES];
}

-(void)dealloc{
    [self removeScrollNavbarWithScrollView:self.tableView];
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
