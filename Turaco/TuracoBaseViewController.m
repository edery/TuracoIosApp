//
//  TuracoBaseViewController.m
//  Turaco
//
//  Created by eder yifrach on 5/17/16.
//  Copyright © 2016 magalcom. All rights reserved.
//

#import "TuracoBaseViewController.h"
#import "MoviePlayerVC.h"

@interface TuracoBaseViewController ()

@end

@implementation TuracoBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavBarIcons];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setNavBarIcons
{
    self.navigationController.navigationBar.barTintColor = RGB(23, 43, 106);
    if ([self.navigationController.parentViewController isKindOfClass:[MainViewController class]])
    {
        if (self.navigationController.viewControllers.count == 1)
        {
            UIButton *menu = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
            [menu setImage:[UIImage imageNamed:@"menu_white"] forState:UIControlStateNormal];
            [menu addTarget:self action:@selector(menuPressed) forControlEvents:UIControlEventTouchUpInside];

            
            UIView *leftBarView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 40, 30)];
            UILabel *lblUserName = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 40, 18)];
            UILabel *lblVersion = [[UILabel alloc] initWithFrame:CGRectMake(0, 18, 40, 12)];

            NSString * version = [[NSBundle mainBundle] objectForInfoDictionaryKey: @"CFBundleShortVersionString"];
            NSString * build = [[NSBundle mainBundle] objectForInfoDictionaryKey: (NSString *)kCFBundleVersionKey];
            NSString * verAndBuild = [version stringByReplacingOccurrencesOfString:@"0" withString:build];
            
            lblVersion.text = [@"ver " stringByAppendingString:verAndBuild];
            lblVersion.textColor = [UIColor whiteColor];
            [lblVersion setFont:[UIFont systemFontOfSize:8]];
            lblUserName.text = (NSString*)USER_DEFAULT_GetObjectForKey(USER_NAME);
            lblUserName.textColor = [UIColor whiteColor];
            [lblUserName setFont:[UIFont systemFontOfSize:14]];
            [leftBarView addSubview:lblVersion];
            [leftBarView addSubview:lblUserName];
            
            self.navigationItem.leftBarButtonItems = @[[[UIBarButtonItem alloc] initWithCustomView:menu], [[UIBarButtonItem alloc] initWithCustomView:leftBarView]];
            
        }
        else
        {
            
        }
        
        
        UIButton *camera = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
        [camera setBackgroundImage:[UIImage imageNamed:@"ic_camera"] forState:UIControlStateNormal];
        [camera addTarget:self action:@selector(cameraPressed) forControlEvents:UIControlEventTouchUpInside];
        
        UIButton *btnSetup = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
        [btnSetup setTitle:[DATA_MANAGER.currentPanel.panelId stringValue] forState:UIControlStateNormal];
        [btnSetup sizeToFit];
        
        if (![self isKindOfClass:MoviePlayerVC.class])
        {
            self.navigationItem.rightBarButtonItems = @[[[UIBarButtonItem alloc] initWithCustomView:camera], [[UIBarButtonItem alloc] initWithCustomView:btnSetup]];
        }else
        {
            self.navigationItem.rightBarButtonItems = @[[[UIBarButtonItem alloc] initWithCustomView:btnSetup]];
        }
        
        
        UIImageView *turacoIcon = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 35, 35)];
        [turacoIcon setImage:[UIImage imageNamed:@"logo_nav"]];
        
        [self.navigationItem setTitleView:turacoIcon];
    }

}

-(void)menuPressed
{
    [MAIN_MENU toggleLeftMenu];
}

-(void)cameraPressed
{
    NSString * storyboardName = @"Main";
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:storyboardName bundle: nil];
    MoviePlayerVC * mpvc = [storyboard instantiateViewControllerWithIdentifier:@"moviePlayerVC"];
    MAIN_MENU.navCtrl.viewControllers = @[mpvc];
}

@end
