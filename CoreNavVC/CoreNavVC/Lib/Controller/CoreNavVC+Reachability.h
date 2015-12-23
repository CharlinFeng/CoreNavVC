//
//  CoreNavVC+Reachability.h
//  CoreNavVC
//
//  Created by 冯成林 on 15/12/23.
//  Copyright © 2015年 冯成林. All rights reserved.
//

#import "CoreNavVC.h"

@interface CoreNavVC (Reachability)

#pragma mark  监听网络状态
-(void)beginReachabilityNoti;

/** 网络状态变更 */
-(void)netWorkStatusChange;

@end
