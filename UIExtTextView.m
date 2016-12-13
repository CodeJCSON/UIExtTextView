//
//  UIExtTextView.m
//  meituan
//
//  Created by apple on 16/4/25.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "UIExtTextView.h"
@interface UIExtTextView()<UITextViewDelegate>
@property (nonatomic, strong) UILabel *placeLabel;//默认文字文本框
@end
@implementation UIExtTextView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createLabel];
    }
    return self;
}
//-(instancetype)init
//{
//    if (self= [super init]) {
//        [self createLabel];
//    }
//    return self;
//}

- (void)createLabel
{
    
    [self.layer setBorderWidth:1];
    [self.layer setBorderColor:klineColor.CGColor];
    self.delegate = self;
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius = 5;
    self.backgroundColor = [UIColor whiteColor];
    _placeLabel = [[UILabel alloc] init];
    _placeLabel.textColor = kPHTColor;
    _placeLabel.numberOfLines = 0;
    [self addSubview:_placeLabel];
}

- (void)layoutSubviews
{
   CGSize size = [Unit getSizeWithStrNo:self.placeLabel.text width:self.width font:14];
    
    _placeLabel.frame = CGRectMake(3, 8, self.width, size.height);
    _placeLabel.font = [UIFont systemFontOfSize:14];
}
-(void)setPlaceHolder:(NSString *)placeHolder
{
    _placeHolder =placeHolder;
    self.placeLabel.text=placeHolder;
}
- (void)textViewDidBeginEditing:(UITextView *)textView
{
    NSLog(@"2222");
    
    _placeLabel.hidden=YES;
    
}
- (void)textViewDidEndEditing:(UITextView *)textView
{
//    NSLog(@"2222");

    if (self.text.length > 0) {
        _placeLabel.hidden = YES;
    }else{
        _placeLabel.hidden = NO;
    }

}

@end
