//
//  LeftMenuTableViewController.h
//  Turaco
//
//  Created by eder yifrach on 5/16/16.
//  Copyright © 2016 magalcom. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LeftMenuTableViewController : UITableViewController <UIAlertViewDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *imgLogo;
@property (weak, nonatomic) IBOutlet UILabel *lblCamera;
@property (weak, nonatomic) IBOutlet UILabel *lblSetup;
@property (weak, nonatomic) IBOutlet UILabel *lblZoneStatus;
@property (weak, nonatomic) IBOutlet UILabel *lblLogout;
@property (weak, nonatomic) IBOutlet UILabel *lblPush;
@property (weak, nonatomic) IBOutlet UILabel *lblPanic;
@property (weak, nonatomic) IBOutlet UILabel *lblShowHistory;


@property (weak, nonatomic) IBOutlet UILabel *lblCameraIc;
@property (weak, nonatomic) IBOutlet UILabel *lblSetupIc;
@property (weak, nonatomic) IBOutlet UILabel *lblZoneStatusIc;
@property (weak, nonatomic) IBOutlet UILabel *lblLogoutIc;
@property (weak, nonatomic) IBOutlet UILabel *lblPushIc;
@property (weak, nonatomic) IBOutlet UILabel *lblPanicIc;
@property (weak, nonatomic) IBOutlet UILabel *lblShowHistoryIc;

@property (assign, nonatomic) BOOL isNotificationCellOpen;


@end
