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

@property (weak, nonatomic) IBOutlet UITableView *tableView;


@end

@implementation VC2

- (void)viewDidLoad {
    [super viewDidLoad];

    self.tableView.dataSource = self;
    self.tableView.delegate = self;
        
    self.title = @"这是第二个控制器";
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"菜单" style:UIBarButtonItemStylePlain target:self action:@selector(meauBtnClick)];
    
    self.nav_topView = [HeaderTopView topView];
    //不需要再嵌套了
    [self addScrollNavbarWithScrollView:self.tableView autoToggleNavbarHeight:40 originHeight:160];
    
//    self.disablePopFunction = YES;
 

    NSLog(@"viewDidLoad");
    __weak typeof(self) weakSelf=self;
//    self.PopAction = ^{
//    
//        NSLog(@"点击了返回按钮");
//        
//        [self.navigationController popViewControllerAnimated:YES];
//    };
}

-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    NSLog(@"viewWillAppear");
    
    [self addPopFunctionWithAnim:YES];
}



-(void)viewDidAppear:(BOOL)animated{
    
    [super viewDidAppear:animated];
    
    NSLog(@"viewDidAppear");
    
    
}


-(void)viewWillDisappear:(BOOL)animated{
    
    [super viewWillDisappear:animated];
    
    NSLog(@"viewWillDisappear");
}

-(void)viewDidDisappear:(BOOL)animated{
    
    [super viewDidDisappear:animated];
    
    NSLog(@"viewDidDisappear");
}


-(void)dealloc{
    [self removeScrollNavbarWithScrollView:self.tableView];
}



-(void)meauBtnClick{

    NSLog(@"点击了菜单:%@");

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


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    UIViewController *vc = [[UIViewController alloc] init];
    vc.view.backgroundColor = [UIColor blackColor];
    [self.navigationController pushViewController:vc animated:YES];

}



@end
