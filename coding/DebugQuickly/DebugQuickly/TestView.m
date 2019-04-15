//
//  TestView.m
//  DebugQuickly
//
//  Created by gaojun on 2019/4/15.
//  Copyright © 2019年 gaojun. All rights reserved.
//

#import "TestView.h"

@interface TestView ()
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIImageView *iconView;

@end
@implementation TestView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setupSubViews];
    }
    return self;
}

- (void)setupSubViews {
    [self addSubview:self.titleLabel];
    [self addSubview:self.iconView];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.titleLabel.frame = CGRectMake(0, 0, self.frame.size.width, 20);
    self.iconView.frame = CGRectMake((self.frame.size.width - 40) * 0.5, CGRectGetMaxY(self.titleLabel.frame) + 5, 40, 40);
}

//测试即时调整UI
- (void)injected {
    self.iconView.frame = CGRectMake((self.frame.size.width - 40) * 0.5, 15, 40, 40);
    self.titleLabel.frame = CGRectMake(0, CGRectGetMaxY(self.iconView.frame) + 5, self.frame.size.width, 20);
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.titleLabel.text = @"哈哈";
    //下面这句会干扰
//    [self.titleLabel sizeToFit];
}


#pragma mark - lazy load
- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [UILabel new];
        _titleLabel.text = @"哈哈哈哈哈哈哈";
    }
    return _titleLabel;
}

- (UIImageView *)iconView {
    if (!_iconView) {
        _iconView = [UIImageView new];
        _iconView.contentMode = UIViewContentModeScaleAspectFit;
        _iconView.image = [UIImage imageNamed:@"40"];
    }
    return _iconView;
}

@end
