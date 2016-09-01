//
//  FoureGroundView.m
//  iOSDemo
//
//  Created by 陈昭燊 on 16/9/1.
//  Copyright © 2016年 陈昭燊. All rights reserved.
//

#import "FoureGroundView.h"
#import "Masonry.h"

@interface FoureGroundView()
@property (nonatomic, strong) UIImageView *icon_imageView;
@property (nonatomic, strong) UILabel *title_label;
@property (nonatomic, strong) UILabel *content_label;
@property (nonatomic, strong) UILabel *time_label;
@property (nonatomic, strong) UIView *line_view;
@property (nonatomic, strong) UIView *main_view;
@end

@implementation FoureGroundView

- (instancetype)init{
    if (self = [super init]) {
        [self initWithUI];
        [self addGestureRecognizer];
        self.windowLevel = UIWindowLevelAlert;
    }
    return self;
}

- (void)initWithUI{
    self.backgroundColor = [UIColor clearColor];
    self.main_view = [[UIView alloc]init];
    self.main_view.backgroundColor = [UIColor blackColor];
    [self addSubview:self.main_view];
    [self.main_view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.equalTo(self);
        make.height.equalTo(@77);
    }];
    
    self.line_view = [[UIView alloc]init];
    self.line_view.backgroundColor = [UIColor grayColor];
    [self.line_view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@100);
        make.height.equalTo(@20);
        make.centerX.equalTo(self);
        make.bottom.equalTo(self.mas_bottom);
    }];
    
    
    self.icon_imageView = [[UIImageView alloc]init];
    
    self.title_label = [[UILabel alloc]init];
    self.content_label = [[UILabel alloc]init];
    self.title_label = [[UILabel alloc]init];
}

- (void)dealloc{
    NSLog(@"弹框销毁");
}

-(void)addGestureRecognizer{
    UISwipeGestureRecognizer *swipeUpGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeUpGesture:)];
    swipeUpGesture.direction = UISwipeGestureRecognizerDirectionUp;
    [self addGestureRecognizer:swipeUpGesture];
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGesture:)];
    [self addGestureRecognizer:tapGesture];
    
    UISwipeGestureRecognizer *swipeDownGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeDownGesture:)];
    swipeDownGesture.direction = UISwipeGestureRecognizerDirectionDown;
    [self addGestureRecognizer:swipeDownGesture];
}
//上滑手势
- (void)swipeUpGesture:(UISwipeGestureRecognizer*)gesture{
    if (gesture.direction == UISwipeGestureRecognizerDirectionUp) {
        [self removeWithAnimation];
    }
}
//点击手势
- (void)tapGesture:(UITapGestureRecognizer*)gesture{
    
}
//下滑手势
- (void)swipeDownGesture:(UISwipeGestureRecognizer*)gesture{
    
}
//移除消息
- (void)removeWithAnimation{
    
}
@end
