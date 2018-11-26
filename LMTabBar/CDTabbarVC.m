//
//  CDTabbarVC.m
//  CustomTabbar
//
//  Created by Dong Chen on 2017/8/31.
//  Copyright © 2017年 Dong Chen. All rights reserved.
//

#import "CDTabbarVC.h"
#import "CDNavigationVC.h"
#import "CDTwoVC.h"

#import "LMTabBar/LMTabBar.h"


@interface CDTabbarVC ()


@end

@implementation CDTabbarVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self InitView];
    [self InitMiddleView];
}

- (void)InitMiddleView
{
    LMTabBar *tabBar = [[LMTabBar alloc] init];
    tabBar.maxIndex = 5;
    tabBar.locateIndex = 1;
    tabBar.tabImageName = @"tabar_plus_normal";
    tabBar.tabTitle = @"xxx";
    tabBar.tabHeight = 70;
    [self setValue:tabBar forKey:@"tabBar"];
    [tabBar setTapBtnBlock:^{
           // NSLog(@"%@",[self childViewControllers]);
          
//      
        CDTwoVC * onetVc = [[CDTwoVC alloc] init];
    [self presentViewController:onetVc animated:NO completion:nil];
//            [self childViewControllers][1].tabBarController.selectedIndex=4;

            
            
   
            
    }];
}
- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item
{
    //NSLog(@" --- %@", item.title);
   
}

- (void)InitView
{
    self.view.backgroundColor = [UIColor whiteColor];
    NSArray *titles = @[@"列表", @"动画", @"消息", @"我的"];
    NSArray *images = @[@"tabbar_home@3x", @"tabbar_reward@3x", @"tabbar_message_center@3x", @"tabbar_profile@3x"];
    NSArray *selectedImages = @[@"tabbar_home_selected@3x", @"tabbar_reward_selected@3x", @"tabbar_message_center_selected@3x", @"tabbar_profile_selected@3x"];
    CDTwoVC * oneVc = [[CDTwoVC alloc] init];
        CDTwoVC * sVc = [[CDTwoVC alloc] init];
    CDTwoVC * onVc = [[CDTwoVC alloc] init];
    CDTwoVC * onesVc = [[CDTwoVC alloc] init];

    NSArray *viewControllers = @[oneVc, sVc, onVc, onesVc];
    NSMutableArray *arrs = [NSMutableArray array];
    for (int i = 0; i < viewControllers.count; i++)
    {
        UIViewController *childVc = viewControllers[i];
        UINavigationController *navs = [self setVC:childVc title:titles[i] image:images[i] selectedImage:selectedImages[i]];
        [arrs addObject:navs];
    }
    
    CDTwoVC *vc = [[CDTwoVC alloc] init];
    UINavigationController *navM = [self setVC:vc title:@"11" image:@"tabbar_profile_selected@3x" selectedImage:@"tabbar_profile_selected@3x"];
//    UINavigationController *navM = [self addChildViewController:vc];
    [arrs addObject:navM];
    
    self.viewControllers = arrs;
    
}

- (UINavigationController *)setVC:(UIViewController *)VC title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage
{
    VC.tabBarItem.title = title;
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[NSForegroundColorAttributeName] = [UIColor blackColor];
    dict[NSFontAttributeName] = [UIFont systemFontOfSize:10];
    [VC.tabBarItem setTitleTextAttributes:dict forState:UIControlStateNormal];
    VC.tabBarItem.image = [[UIImage imageNamed:image] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    VC.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:VC];
    return nav;
}

@end
