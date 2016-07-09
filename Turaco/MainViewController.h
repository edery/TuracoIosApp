//
//  MainViewController.h
//  Turaco
//
//  Created by eder yifrach on 5/14/16.
//  Copyright © 2016 magalcom. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LeftMenuTableViewController.h"

#define MAIN_MENU [MainViewController sharedMainViewController]
#define MENU_OPEN_NOTIFICATION @"menuOpened"
#define MENU_CLOSE_NOTIFICATION @"menuClosed"


typedef enum MenuState
{
    MenuStateClose,
    MenuStateLeftMenuOpen
}MenuState;


@interface MainViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, UIGestureRecognizerDelegate>

@property (weak, nonatomic) IBOutlet UIView *leftMenuContainer;
@property (weak, nonatomic) IBOutlet UIView *mainContainer;

@property (strong, nonatomic) IBOutlet UISwipeGestureRecognizer *gestureLeft;
@property (strong, nonatomic) IBOutlet UISwipeGestureRecognizer *gestureRight;
@property (strong, nonatomic) IBOutlet UITapGestureRecognizer *gestureTap;

@property (strong, nonatomic) UINavigationController * navCtrl;
@property (strong, nonatomic) LeftMenuTableViewController * leftMenuViewController;

@property (assign, nonatomic) MenuState menuState;

+ (MainViewController*) sharedMainViewController;

-(void)toggleLeftMenu;
-(void)logOut;
-(void)clearData;
@end
