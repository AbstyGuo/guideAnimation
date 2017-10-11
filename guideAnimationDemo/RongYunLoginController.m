//
//  RongYunLoginController.m
//  guideAnimationDemo
//
//  Created by YaoKaige on 16/5/27.
//  Copyright © 2016年 Beijing Gan Servant Software Co., Ltd. All rights reserved.
//

#import "RongYunLoginController.h"
#import "AFHttpTool.h"
#import "RCDTextFieldValidate.h"
#import "RCAnimatedImagesView.h"

#define DEFAULTS [NSUserDefaults standardUserDefaults]

@interface RongYunLoginController ()<UITextFieldDelegate>

@property (retain, nonatomic) IBOutlet RCAnimatedImagesView* animatedImagesView;

@property (weak, nonatomic) IBOutlet UITextField* emailTextField;

@property (weak, nonatomic) IBOutlet UITextField* pwdTextField;

@property (nonatomic, strong) UIView* headBackground;
@property (nonatomic, strong) UIImageView* rongLogo;
@property (nonatomic, strong) UIView* inputBackground;
@property (nonatomic, strong) UIView* statusBarView;
@property (nonatomic, strong) UILabel* errorMsgLb;
@property (nonatomic, strong) UITextField *passwordTextField;

@property (nonatomic, strong) UILabel *appKeyLabel;
@property (nonatomic, strong) UIButton *changeKeyButton;
@property (nonatomic) int loginFailureTimes;

@end

@implementation RongYunLoginController
#define UserTextFieldTag 1000
#define PassWordFieldTag 1001

- (void)onChangeKey:(id)sender
{
    
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    
    //    self.view.translatesAutoresizingMaskIntoConstraints = YES;
    //添加动态图
    self.animatedImagesView = [[RCAnimatedImagesView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
    [self.view addSubview:self.animatedImagesView];
    self.animatedImagesView.delegate = self;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.animatedImagesView startAnimating];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    [self.animatedImagesView stopAnimating];
}

- (NSUInteger)animatedImagesNumberOfImages:(RCAnimatedImagesView*)animatedImagesView
{
    return 4;
}

- (UIImage*)animatedImagesView:(RCAnimatedImagesView*)animatedImagesView imageAtIndex:(NSUInteger)index
{
    return [UIImage imageNamed:[NSString stringWithFormat:@"%ld",index+1]];
}

#pragma mark - UI

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
    return (toInterfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (void)viewDidUnload
{
    [self setAnimatedImagesView:nil];
    
    [super viewDidUnload];
}
@end
