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

/** 👀 输入框的文本的文字 👀 */
@property (copy, nonatomic) IBInspectable NSString *text;

/** 👀 输入框文本提示语 👀 */
@property (copy, nonatomic) IBInspectable NSString *placeholder;

/** 👀 允许输入的最大数量 👀 */
@property (assign, nonatomic) IBInspectable NSInteger maxCount;

/** 👀 超过最大数量的提示语 👀 */
@property (copy, nonatomic) IBInspectable NSString *overMaxCountPlaceholder;

/** 👀 是否显示右侧的视图：默认为 NO 👀 */
@property (assign, nonatomic) IBInspectable BOOL showRightView;


/**
 是否是数字键盘：目前只支持  数字、英文 这两种类型的键盘；默认为 英文键盘；之前准备用枚举，但是 IBInspectable 不支持枚举类型，固此处用 BOOL 类型来代替
 */
@property (assign, nonatomic) IBInspectable BOOL isNumberKeyboard;

/** 👀 是否隐藏分隔线 👀 */
@property (assign, nonatomic) IBInspectable BOOL hideSepratorLine;


@end





