//
//  PhoneNumberViewController.m
//  Turaco
//
//  Created by eder yifrach on 03/06/2016.
//  Copyright © 2016 magalcom. All rights reserved.
//

#import "PhoneNumberViewController.h"

@interface PhoneNumberViewController ()

@end

@implementation PhoneNumberViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [_txtPhoneNumber becomeFirstResponder];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)btnCancelPressed:(UIButton *)sender
{
    [_txtPhoneNumber resignFirstResponder];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)btnSavePressed:(UIButton *)sender
{
    if ([self isValidPhone:_txtPhoneNumber.text])
    {
        [_txtPhoneNumber resignFirstResponder];
        [DATA_MANAGER setPhoneNumber:_txtPhoneNumber.text];
        if (self.shouldCallPanic)
        {
            [DATA_MANAGER panic];
        }
        [self dismissViewControllerAnimated:YES completion:nil];
    }
    else
    {
        UIAlertController * alert = [UIAlertController alertControllerWithTitle:@"Invalid Phone" message:@"please enter a valid phone number and press \"Save\"" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:nil];
        
        [alert addAction:action];
        [self presentViewController:alert animated:YES completion:nil];
    }
    

}

-(BOOL)isValidPhone:(NSString*)phone
{
    if (phone.length < 9 || phone.length > 11)
    {
        return NO;
    }
    return YES;
}
@end
