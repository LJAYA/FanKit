//
//  FanAlertController.h
//  FanTest
//
//  Created by 向阳凡 on 2018/6/13.
//  Copyright © 2018年 向阳凡. All rights reserved.
//

//不支持多个提示覆盖的功能

#import <UIKit/UIKit.h>
/**
 *  显示风格
 */
typedef NS_ENUM(NSInteger,FanAlertControllerStyle) {
    /**
     *  Txt
     */
    FanAlertControllerStyleText=1,
    /**
     *  loding
     */
    FanAlertControllerStyleLoding,
    
    /**
     *  带字体的加载
     */
    FanAlertControllerStyleLodingText,
    /**
     *  alert
     */
    FanAlertControllerStyleAlert,
    /**
     *  alertIcon
     */
    FanAlertControllerStyleIconAlert,
    /**
     *  单行确认框
     */
    FanAlertControllerStyleShotAlert,
    /**
     *  单行输入框
     */
    FanAlertControllerStyleInput,
    /**
     *  提示时使用
     */
    FanAlertControllerStyleTips
};



const static UIWindow * fanAlertWindow;


typedef void(^FanProgressHUDAlertBlock)(NSInteger index);

@interface FanAlertController : UIViewController
#pragma mark - 外部不能修改或者不建议修改的，在继承类里面可以修改的
/** 内容View*/
@property(nonatomic,strong)UIView *fan_cententView;
@property(nullable,nonatomic,strong)UIImageView *cententBgmView;//中间区域背景
@property(nonatomic,assign)CGFloat contentWidth;
@property(nonatomic,assign)CGFloat contentHeight;

@property(nonatomic,assign)FanAlertControllerStyle progressHUDStyle;

@property(nonatomic,copy)FanProgressHUDAlertBlock alertBlock;
/** 显示几秒后，消失*/
@property (assign, nonatomic) NSTimeInterval showTime;
@property(nonatomic,strong)NSArray *buttonTitleArray;

#pragma mark - 外部可以修改属性
@property(nonatomic,strong)UIView *blackAlphaView;
/**黑色背景透明度 默认0.5  default translucent(0.5)*/
@property(nonatomic,assign)CGFloat blackAlpha;//不要设置为>0.1，不立即释放
@property(nonatomic,strong)NSMutableArray * dataArray;
/**是不是触摸其他区域，自动消失*/
@property(nonatomic,assign)BOOL isTouchRemove;

@property(nonatomic,assign)BOOL isAnimation;//暂时没有用到

@property(nonatomic,copy)NSString *alertTitle;
@property(nonatomic,copy)NSString *subTitle;
@property(nonatomic,copy)NSString *iconName;

#pragma mark -  显示和隐藏的类方法
/**
 弹出提示对话框
 
 @param textStr 提示文本
 @return self
 */
+ (instancetype)fan_showHUDWithStatus:(NSString*)textStr;
+ (instancetype)fan_showHUDWithStatus:(NSString *)textStr afterDelay:(NSTimeInterval)seconds;

/**
 弹出加载等待框
 
 @return self
 */
+ (instancetype)fan_showProgressHUD;
+ (instancetype)fan_showProgressHUD:(NSString *)textStr;
+ (instancetype)fan_showProgressHUD:(NSString *)textStr afterDelay:(NSTimeInterval)seconds;
/**
 隐藏弹窗
 
 @return YES
 */
+ (BOOL)fan_hideProgressHUD;
//+ (BOOL)fan_hideAllProgressHUD;
//+ (BOOL)fan_hideAllProgressHUDForView:(UIView *)view;


/**
 弹窗类似系统对话框
 
 @param textStr 标题
 @param subTitle 文本内容
 @param btnTitleArray 按钮数组最多2个
 @param alertBlock 按钮回调
 @return self
 */
+ (instancetype)fan_showAlertHUDTitle:(NSString *)textStr subTitle:(NSString *_Nonnull)subTitle buttonTitles:(NSArray*_Nullable)btnTitleArray  alertBlock:(FanProgressHUDAlertBlock _Nullable )alertBlock;
+ (instancetype _Nullable )fan_showAlertHUDTitle:(NSString *_Nullable)textStr subTitle:( NSString * _Nonnull )subTitle buttonTitle:(NSString *_Nullable)buttonTitle alertBlock:(FanProgressHUDAlertBlock _Nullable)alertBlock;
/**
 弹窗类似系统对话框
 
 @param textStr 标题
 @param imageName 图标名称
 @param btnTitleArray 按钮数组最多2个
 @param alertBlock 按钮回调
 @return self
 */
+ (instancetype _Nullable )fan_showIconAlertHUDTitle:(NSString *_Nullable)textStr imageName:(NSString *_Nonnull)imageName buttonTitles:(NSArray*_Nullable)btnTitleArray  alertBlock:(FanProgressHUDAlertBlock _Nullable )alertBlock;
+ (instancetype _Nullable )fan_showIconAlertHUDTitle:(NSString *_Nullable)textStr imageName:(NSString *_Nonnull)imageName buttonTitle:(NSString *_Nullable)buttonTitle alertBlock:(FanProgressHUDAlertBlock _Nullable)alertBlock;


-(void)fan_removeSelfView:(BOOL)animation;
#pragma mark - 修改内容属性
-(void)fan_setTitleColor:(UIColor *_Nullable)titleColor subTitleColor:(UIColor *_Nullable)subTitleColor;

-(void)fan_setTitleColor:(UIColor *_Nullable)titleColor;
#pragma mark - 子类可以重写
-(void)configUIWithData;
-(void)fan_configUI;//子类重写
-(void)fan_createTextUI;
-(void)fan_createLodingUI;
-(void)fan_createAlertUI;
-(void)fan_createIconAlertUI;


#pragma mark - 子类调用的方法

-(void)buttonClick:(UIButton *)btn;
-(CGSize)fan_currentSizeWithContent:(NSString *)content font:(UIFont *)font cgSize:(CGSize)cgsize;
- (void)commonInit;//继承要执行父类方法

@end
