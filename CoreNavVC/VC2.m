//
//  VC2.m
//  CoreNavVC
//
//  Created by 冯成林 on 15/12/23.
//  Copyright © 2015年 冯成林. All rights reserved.
//


#import "VC2.h"
#import "CoreNavVC.h"

@interface VC2 ()<UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;


@end

@implementation VC2

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"这是第二个控制器";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"菜单" style:UIBarButtonItemStylePlain target:self action:@selector(meauBtnClick)];
    
    self.tableView.dataSource = self;
    
    self.tableView.delegate = self;
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 200)];
    headerView.backgroundColor = [UIColor brownColor];
    self.tableView.tableHeaderView = headerView;
    
    [self addScrollNavbarWithScrollView:self.tableView];
}

-(void)dealloc{

    [self removeScrollNavbarWithScrollView:self.tableView];
}

-(void)meauBtnClick{

    NSLog(@"点击了菜单");
}



-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    [self.navigationController hideNavBar];
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
