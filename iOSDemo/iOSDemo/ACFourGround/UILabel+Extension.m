//
//  UILabel+Extension.m
//
//  Created by 陈昭燊 on 16/3/23.
//  Copyright © 2016年 陈昭燊. All rights reserved.
//

#import "UILabel+Extension.h"


@implementation UILabel (Extension)
/// 创建 UILabel
///
/// @param title     标题
/// @param color     标题颜色
/// @param fontSize  字体大小
///
/// @return UILabel(文本水平居中)
+ (instancetype)labelWithTitle:(NSString *)title color:(UIColor *)color fontSize:(CGFloat)fontSize{
    return [self labelWithTitle:title color:color fontSize:fontSize alignment:NSTextAlignmentCenter];
}

+ (instancetype)labelWithTitle:(NSString *)title color:(UIColor *)color fontSize:(CGFloat)fontSize alignment:(NSTextAlignment)alignment {
    
    UILabel *label = [[UILabel alloc] init];
    
    label.text = title;
    label.textColor = color;
    label.font = [UIFont systemFontOfSize:fontSize];
    label.numberOfLines = 0;
    label.textAlignment = alignment;
    //    label.preferredMaxLayoutWidth =
    
    [label sizeToFit];
    
    return label;
}

/*!
 * 计算label的size
 *
 * @return size
 */
-(CGSize)caculatedSize{
    CGSize size = CGSizeMake(self.frame.size.width, MAXFLOAT);
    
    NSDictionary *dict = [NSDictionary dictionaryWithObject:[UIFont systemFontOfSize:self.font.pointSize] forKey:NSFontAttributeName];
    
    CGRect rect = [self.text boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil];
    
    return rect.size;
}

//+(CGFloat)getLabelHeightWithSizeOfFont:(CGFloat)fontSize width:(CGFloat)width content:(NSString*)content{
//    CGSize size = CGSizeMake(width,MAXFLOAT);
//
//    NSDictionary *dict = [NSDictionary dictionaryWithObject:[UIFont systemFontOfSize:fontSize] forKey:NSFontAttributeName];
//
//    CGRect rect = [content boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil];
//
//    return rect.size.height;
//}

@end
