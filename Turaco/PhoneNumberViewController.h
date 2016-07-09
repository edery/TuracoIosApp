//
//  PhoneNumberViewController.h
//  Turaco
//
//  Created by eder yifrach on 03/06/2016.
//  Copyright © 2016 magalcom. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PhoneNumberViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *btnCancel;
@property (weak, nonatomic) IBOutlet UIButton *btnSave;
@property (weak, nonatomic) IBOutlet UITextField *txtPhoneNumber;
@property (assign,nonatomic) BOOL shouldCallPanic;

- (IBAction)btnCancelPressed:(UIButton *)sender;
- (IBAction)btnSavePressed:(UIButton *)sender;

@end
