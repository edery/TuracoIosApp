//
//  MainViewController.m
//  Turaco
//
//  Created by eder yifrach on 5/14/16.
//  Copyright © 2016 magalcom. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

static MainViewController * theInstance;

#pragma mark - initialize functions
+ (MainViewController*) sharedMainViewController
{
    return theInstance;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    theInstance = self;
    self.menuState = MenuStateClose;
    self.navCtrl = self.childViewControllers.lastObject;
}

-(void) hideKeyboard
{
    if (self.menuState == MenuStateClose)
    {
//        UINavigationController * rootNavCtrl = [self.childViewControllers lastObject];
//        UIViewController * vc = rootNavCtrl.visibleViewController;
        //        [vc hideKeyboard];
    }
}

-(void)setMenuState:(MenuState)menuState
{
    _menuState = menuState;
    CGFloat x = 0;
    if (menuState == MenuStateLeftMenuOpen)
    {
        x = _mainContainer.frame.size.width - 60;
        _leftMenuContainer.hidden = NO;
    }
//    if (menuState == MenuStateRightMenuOpen)
//    {
//        x = -(_mainContainer.frame.size.width - 60);
//        _leftMenuContainer.hidden = YES;
//    }
    else if(menuState == MenuStateClose)
    {
        x = 0;
        [self hideKeyboard];
    }
    [UIView animateWithDuration:0.3 animations:^
     {
         _mainContainer.frame = CGRectMake(x, 0, _mainContainer.frame.size.width, _mainContainer.frame.size.height);
     }];
}


-(void)toggleLeftMenu
{
    if (_menuState == MenuStateClose)
    {
        self.menuState = MenuStateLeftMenuOpen;
    }
    else
    {
        self.menuState = MenuStateClose;
    }
}

#pragma mark - UIGestureRecognizerDelegate

-(BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    if (gestureRecognizer == self.gestureTap && self.menuState == MenuStateClose)
    {
        return NO;
    }
    if ((gestureRecognizer == self.gestureTap || gestureRecognizer == self.gestureRight) && self.menuState == MenuStateClose)
    {
        [self toggleLeftMenu];
    }
    else if ((gestureRecognizer == self.gestureTap || gestureRecognizer == self.gestureLeft) && self.menuState == MenuStateLeftMenuOpen)
    {
        [self toggleLeftMenu];
    }
    return YES;
}


-(void)logOut
{
    
    if ([UIAlertController class])
    {
        
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Log Out" message:@"Are you sure you want to log out?" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* cancel = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil];
        [alertController addAction:cancel];
        
        UIAlertAction* logOut = [UIAlertAction actionWithTitle:@"Yes" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [self clearData];
            
        }];
        [alertController addAction:logOut];
        
        [self presentViewController:alertController animated:YES completion:nil];
        
    }
    else
    {
        UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"Log Out" message:@"Are you sure you want to log out?" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Yes", nil];
        
        [alert show];
    }
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 1)
    {
        [self clearData];
    }
}

-(void)clearData
{
    USER_DEFAULT_RemoveObjectForKey(IS_LOGIN);
    USER_DEFAULT_RemoveObjectForKey(USER_NAME);
    USER_DEFAULT_RemoveObjectForKey(PASSWORD);
    
    [CONNECTION_MANAGER logoutWithToken:USER_DEFAULT_GetStringForKey(TOKEN_PUSH) andWithComplitionBlock:^{

        
        [self.navigationController popToRootViewControllerAnimated:YES];
    } andfaildBlock:^{
        
    }];

}


@end
