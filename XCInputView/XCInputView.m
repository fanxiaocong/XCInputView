//
//  CustomInputView.m
//  自定义账号输入框
//
//  Created by 樊小聪 on 2016/11/25.
//  Copyright © 2016年 樊小聪. All rights reserved.
//



/*
 *  备注：自定义账号、密码输入框视图 🐾
 */



#define RGBA_COLOR(R,G,B,A)     [UIColor colorWithRed:R/255.f green:G/255.f blue:B/255.f alpha:A]


/*
 *  备注：配置一些默认数据：一个项目一般只会设置一次 🐾
 */
#define K_LEFT_ICON_WH                  20   // 左侧图标的宽高

#define K_SEPERATOR_COLOR              RGBA_COLOR(226, 226, 226, 1)   // 分隔线的颜色

#define K_PLACEHOLDER_COLOR            RGBA_COLOR(198, 198, 198, 1)   // 输入框占位文字的颜色

/*⏰ ----- 右侧图标：如果是密码输入框，则右侧可能会出现一个 “小眼睛” 按钮，
 用来控制输入框文本的显示和隐藏；需要就传；不需要就不传 ----- ⏰*/
#define K_NORMAL_RIGHT_ICON_NAME        @"1.jpg"         // 普通状态：不显示明文
#define K_SELECT_RIGHT_ICON_NAME        @"2.jpg"         // 选中状态：显示明文






#import "XCInputView.h"



@interface XCInputView () <UITextFieldDelegate>

/** 👀 具体的内容视图 👀 */
@property (strong, nonatomic) IBOutlet UIView *contentView;

/** 👀 文本输入框 👀 */
@property (weak, nonatomic) IBOutlet UITextField *textField;
/** 👀 分隔线 👀 */
@property (weak, nonatomic) IBOutlet UIView *sepratorView;

/** 👀 右侧图标 👀 */
@property (weak, nonatomic) IBOutlet UIImageView *rightIcon;
/** 👀 右侧图标父视图 👀 */
@property (weak, nonatomic) IBOutlet UIView *rightView;
/** 👀 右侧图标父视图的宽度的约束 👀 */
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *rightViewWidthConstraint;

/** 👀 左侧图片 👀 */
@property (weak, nonatomic) IBOutlet UIImageView *leftIcon;
/** 👀 左侧图片宽度的约束 👀 */
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *leftIconWidthConstraint;
/** 👀 左侧图片高度的约束 👀 */
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *leftIconHeightConstraint;

@end

@implementation XCInputView

#pragma mark - 👀 Init Method 👀 💤

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder])
    {
        // 设置默认参数
        [self setupDefaults];
    }
    
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        // 设置默认参数
        [self setupDefaults];
    }
    
    return self;
}

// 设置默认参数
- (void)setupDefaults
{
    UIView *contentView = [[[NSBundle mainBundle] loadNibNamed:@"XCInputView" owner:self options:nil] lastObject];
    self.contentView    = contentView;
    self.contentView.backgroundColor = [UIColor clearColor];
    [self addSubview:contentView];
    
    // 默认：暗文、隐藏右侧视图
    self.leftIconWidthConstraint.constant  = K_LEFT_ICON_WH;
    self.leftIconHeightConstraint.constant = K_LEFT_ICON_WH;
    self.sepratorView.backgroundColor = K_SEPERATOR_COLOR;
    self.rightIcon.image = [UIImage imageNamed:K_NORMAL_RIGHT_ICON_NAME];
    self.rightIcon.highlightedImage = [UIImage imageNamed:K_SELECT_RIGHT_ICON_NAME];
    
    /*⏰ ----- 输入框文字发生改变的时候调用 ----- ⏰*/
    [self.textField addTarget:self action:@selector(textDidChangeAction) forControlEvents:UIControlEventEditingChanged];
    
    /*⏰ ----- 添加点击事件 ----- ⏰*/
    [self.rightView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didClickRightViewAction)]];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.contentView.frame = self.bounds;
}

#pragma mark - 👀 Setter Method 👀 💤

- (void)setShowRightView:(BOOL)showRightView
{
    _showRightView = showRightView;
    
    if (showRightView)
    {
        // 显示右侧的 “眼睛视图”
        self.rightViewWidthConstraint.constant = self.bounds.size.height;
        self.rightView.hidden = NO;
        self.textField.secureTextEntry = YES;
    }
    else
    {
        // 隐藏右侧的 “眼睛视图”
        self.rightViewWidthConstraint.constant = 0;
        self.rightView.hidden = YES;
        self.textField.secureTextEntry = NO;
    }
}

- (void)setNormalLeftIcon:(UIImage *)normalLeftIcon
{
    _normalLeftIcon = normalLeftIcon;
    
    self.leftIcon.image = normalLeftIcon;
}

- (void)setSelectedLeftIcon:(UIImage *)selectedLeftIcon
{
    _selectedLeftIcon = selectedLeftIcon;
    
    self.leftIcon.highlightedImage = selectedLeftIcon;
}

- (void)setText:(NSString *)text
{
    _text = [text copy];
    
    self.leftIcon.highlighted = text.length;
    self.textField.text = text;
}

- (void)setPlaceholder:(NSString *)placeholder
{
    _placeholder = [placeholder copy];
    
    self.textField.placeholder = placeholder;
}

- (void)setIsNumberKeyboard:(BOOL)isNumberKeyboard
{
    _isNumberKeyboard = isNumberKeyboard;
    
    if (isNumberKeyboard)
    {
        // 纯数字键盘
        self.textField.keyboardType = UIKeyboardTypeNumberPad;
    }
    else
    {
        // 英文键盘
        self.textField.keyboardType = UIKeyboardTypeASCIICapable;
    }
}

- (void)setHideSepratorLine:(BOOL)hideSepratorLine
{
    _hideSepratorLine = hideSepratorLine;
    
    self.sepratorView.hidden = hideSepratorLine;
}

#pragma mark - 🎬 👀 Action Method 👀

/**
    文字发生改变的回调
 */
- (void)textDidChangeAction
{
    if (self.maxCount && self.textField.text.length > self.maxCount && self.textField.markedTextRange == nil)
    {
        self.textField.text = [self.textField.text substringToIndex:NSMaxRange([self.textField.text rangeOfComposedCharacterSequenceAtIndex:self.maxCount-1])];
    }
    
    self.leftIcon.highlighted = self.textField.text.length;
    self.text = self.textField.text;
}

/**
    点击了右侧的视图
 */
- (void)didClickRightViewAction
{
    // 当点击了 右侧的图片：高亮为显示明文；普通为隐藏明文
    self.rightIcon.highlighted = !self.rightIcon.isHighlighted;
    self.textField.secureTextEntry = !self.rightIcon.isHighlighted;
}


@end


