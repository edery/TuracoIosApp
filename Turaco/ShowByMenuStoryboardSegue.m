//
//  LeftMenuTableViewController.h
//  Turaco
//
//  Created by eder yifrach on 5/16/16.
//  Copyright © 2016 magalcom. All rights reserved.
//

#import "ShowByMenuStoryboardSegue.h"
#import "LeftMenuTableViewController.h"
#import "MainViewController.h"

@implementation ShowByMenuStoryboardSegue

-(void)perform
{
    UIViewController * source = self.sourceViewController;
    UIViewController * dest = self.destinationViewController;
    UINavigationController * RootNavCtrl = MAIN_MENU.navCtrl;
    

    if (MAIN_MENU.menuState != MenuStateClose)
    {        
        if ([source isKindOfClass:[LeftMenuTableViewController class]])
        {
            [MAIN_MENU toggleLeftMenu];
        }
    }
    // the new selection is like the visible root view - dont replace it just close menu
    if (RootNavCtrl.viewControllers.count == 1 && [RootNavCtrl.visibleViewController isKindOfClass:[dest class]])
    {
        return;
    }
    else
    {
        RootNavCtrl.viewControllers = @[dest];
    }
}

@end
