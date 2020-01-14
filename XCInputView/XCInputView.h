//
//  CustomInputView.h
//  自定义账号输入框
//
//  Created by 樊小聪 on 2016/11/25.
//  Copyright © 2016年 樊小聪. All rights reserved.
//




/*
 *  备注：自定义账号、密码输入框视图 🐾
 */




#import <UIKit/UIKit.h>

IB_DESIGNABLE

@interface XCInputView : UIView

/** 👀 左侧图标：正常状态下（没有输入内容的时候显示） 👀 */
@property (strong, nonatomic) IBInspectable UIImage *normalLeftIcon;
/** 👀 左侧图标：选中状态下（有输入内容的时候显示） 👀 */
@property (strong, nonatomic) IBInspectable UIImage *selectedLeftIcon;
/// 隐藏文字开的图标
@property (strong, nonatomic) IBInspectable UIImage *secureOnImage;
/// 隐藏文字关的图标
@property (strong, nonatomic) IBInspectable UIImage *secureOffImage;
/** 👀 输入框的文本的文字 👀 */
@property (copy, nonatomic) IBInspectable NSString *text;
/** 👀 输入框文本提示语 👀 */
@property (copy, nonatomic) IBInspectable NSString *placeholder;
/// 文字颜色：默认黑色
@property (strong, nonatomic) IBInspectable UIColor *textColor;
/// 文字大小：默认 15
@property (assign, nonatomic) IBInspectable NSInteger fontSize;
/** 👀 允许输入的最大数量 👀 */
@property (assign, nonatomic) IBInspectable NSInteger maxCount;
/** 👀 是否显示右侧的视图：默认为 NO 👀 */
@property (assign, nonatomic) IBInspectable BOOL showRightView;
/// 键盘类型：数值与 UIKeyboardType 一一对应
@property (assign, nonatomic) IBInspectable NSInteger keyboardType;

/** 👀 是否隐藏分隔线 👀 */
@property (assign, nonatomic) IBInspectable BOOL hideSepratorLine;


@end





