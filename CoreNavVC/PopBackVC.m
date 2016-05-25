//
//  PopBackVC.m
//  CoreNavVC
//
//  Created by Charlin on 16/5/25.
//  Copyright © 2016年 冯成林. All rights reserved.
//

#import "PopBackVC.h"
#import "CoreNavVC.h"

@interface PopBackVC ()<UIAlertViewDelegate>

@end

@implementation PopBackVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    __weak typeof(self) weakSelf=self;
    
    self.PopAction = ^{
    
        UIAlertView *av = [[UIAlertView alloc] initWithTitle:@"拦截Pop事件" message:@"无需自定义即可拦截Pop事件" delegate:weakSelf cancelButtonTitle:@"很强大" otherButtonTitles:@"我要Pop", nil];
    
        [av show];
    };
    
}


-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{

    if (buttonIndex == 1){
    
        [self.navigationController popViewControllerAnimated:YES];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
