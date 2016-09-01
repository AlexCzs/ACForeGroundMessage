//
//  UILabel+Extension.h
//
//  Created by 陈昭燊 on 16/3/23.
//  Copyright © 2016年 陈昭燊. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (Extension)
/// 创建 UILabel
///
/// @param title     标题
/// @param color     标题颜色
/// @param fontSize  字体大小
///
/// @return UILabel(文本水平居中)
+ (instancetype)labelWithTitle:(NSString *)title color:(UIColor *)color fontSize:(CGFloat)fontSize;

/// 创建 UILabel
///
/// @param title     标题
/// @param color     标题颜色
/// @param fontSize  字体大小
/// @param alignment 对齐方式
///
/// @return UILabel
+ (instancetype)labelWithTitle:(NSString *)title color:(UIColor *)color fontSize:(CGFloat)fontSize alignment:(NSTextAlignment)alignment;
/*!
 * 计算label的size
 *
 * @return size
 */
-(CGSize)caculatedSize;
@end
