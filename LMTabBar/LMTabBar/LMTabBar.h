//
//  LMTabBar.h
//  LMTabBar
//
//  Created by ponted on 2018/11/26.
//  Copyright © 2018 Shenzhen Blood Link Medical Technology Co., Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LMTabBar : UITabBar

@property (nonatomic, assign) NSInteger locateIndex;

@property (nonatomic, assign) NSInteger maxIndex;

@property (nonatomic, copy)   NSString *tabImageName;

@property (nonatomic, copy)   NSString *tabTitle;

@property (nonatomic, assign) float margin;

@property (nonatomic, assign) float  tabHeight;

@property (nonatomic, assign) float tabCenterY;

@property (nonatomic, strong) UIFont *tabFont;

@property (nonatomic, strong) void(^tapBtnBlock)(void);

@end

NS_ASSUME_NONNULL_END
