//
//  LMTabBar.m
//  LMTabBar
//
//  Created by ponted on 2018/11/26.
//  Copyright © 2018 Shenzhen Blood Link Medical Technology Co., Ltd. All rights reserved.
//

#import "LMTabBar.h"
#import <LMTools/UIView+Size.h>
#import <LMTools/UIButton+Edge.h>

@interface LMTabBar()
@property (nonatomic, strong) UIButton *middleBtn;
@property (nonatomic, strong) UIButton *sendBtn;

@end

@implementation LMTabBar

- (void)setMaxIndex:(NSInteger)maxIndex
{
    if (maxIndex) {
        _maxIndex = maxIndex;
    }else
    {
        _maxIndex = 1;
    }
}

- (UIButton *)sendBtn{
    if (!_sendBtn) {
        _sendBtn = [[UIButton alloc] init];
        [_sendBtn setImage:[UIImage imageNamed:_tabImageName] forState:UIControlStateNormal];
        [_sendBtn setTitle:_tabTitle forState:UIControlStateNormal];
        _sendBtn.titleLabel.font = _tabFont?_tabFont:[UIFont systemFontOfSize:10];
        [_sendBtn addTarget:self action:@selector(didClickPublishBtn:) forControlEvents:UIControlEventTouchUpInside];
        _sendBtn.adjustsImageWhenHighlighted = NO;
        _sendBtn.size = CGSizeMake(self.bounds.size.width/_maxIndex, _tabHeight?_tabHeight:70);
        _sendBtn.x = self.width /_maxIndex*_locateIndex;
        _sendBtn.centerY = _tabCenterY?_tabCenterY:12;
        [_sendBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        self.middleBtn = _sendBtn;
    }
    return _sendBtn;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    if (self.middleBtn == nil) {
        [self addSubview:self.sendBtn];
    }
    
    [self.sendBtn setImagePositionWithType:SSImagePositionTypeTop spacing:_margin?_margin:5];
    // 其他位置按钮
    NSUInteger count = self.subviews.count;
    for (NSUInteger i = 0 , j = 0; i < count; i++)
    {
        UIView *view = self.subviews[i];
        Class class = NSClassFromString(@"UITabBarButton");
        if ([view isKindOfClass:class])
        {
            view.width = self.bounds.size.width / _maxIndex;
            view.x = self.bounds.size.width * j / _maxIndex;
            j++;
            if (j == _locateIndex)
            {
                j++;
            }
        }
    }

}
// 发布
- (void)didClickPublishBtn:(UIButton*)sender {
    if (self.tapBtnBlock) {
        self.tapBtnBlock();
    }
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    if (self.isHidden == NO)
    {
        CGPoint newP = [self convertPoint:point toView:self.middleBtn];
        if ( [self.middleBtn pointInside:newP withEvent:event])
        {
            return self.middleBtn;
        }else
        {
            return [super hitTest:point withEvent:event];
        }
    }
    else
    {
        return [super hitTest:point withEvent:event];
    }
}



@end
