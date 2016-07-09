//
//  LeftMenuTableViewController.m
//  Turaco
//
//  Created by eder yifrach on 5/16/16.
//  Copyright © 2016 magalcom. All rights reserved.
//

#import "LeftMenuTableViewController.h"
#import "PhoneNumberViewController.h"
#import "NSString+FontAwesome.h"

@interface LeftMenuTableViewController ()

@end

@implementation LeftMenuTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    MAIN_MENU.leftMenuViewController = self;
    _isNotificationCellOpen = NO;
    
    _imgLogo.layer.cornerRadius = 50;
    _imgLogo.layer.borderColor = [UIColor whiteColor].CGColor;
    _imgLogo.layer.borderWidth = 5;
    _imgLogo.layer.masksToBounds = YES;
    
    [self initIcons];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)initIcons
{
    UIFont *awesome = [UIFont fontWithName:kFontAwesomeFamilyName size:18];
    _lblCameraIc.font = awesome;
    _lblLogoutIc.font = awesome;
    _lblPanicIc.font = awesome;
    _lblPushIc.font = awesome;
    _lblSetupIc.font = awesome;
    _lblShowHistoryIc.font = awesome;
    _lblZoneStatusIc.font = awesome;
    
    _lblCameraIc.text = [NSString fontAwesomeIconStringForEnum:FAVideoCamera];
    _lblLogoutIc.text = [NSString fontAwesomeIconStringForEnum:FASignOut];
    _lblPanicIc.text = [NSString fontAwesomeIconStringForEnum:FAExclamationCircle];
    _lblPushIc.text = [NSString fontAwesomeIconStringForEnum:FABell];
    _lblSetupIc.text = [NSString fontAwesomeIconStringForEnum:FAClockO];
    _lblShowHistoryIc.text = [NSString fontAwesomeIconStringForEnum:FAhistory];
    _lblZoneStatusIc.text = [NSString fontAwesomeIconStringForEnum:FACheckSquareO];
}

#pragma mark - Table view data source

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//    return 1;
//}

//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    return 8;
//}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0)
    {
        return 128;
    }
    else if(indexPath.row == 5 || indexPath.row == 7)//&& _isNotificationCellOpen)
    {
        return 0;//100;
    }
    else{
        return 50;
    }
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row)
    {
        case 4://logout
            [MAIN_MENU logOut];
            break;
        case 5://push notification
            _isNotificationCellOpen = !_isNotificationCellOpen;
            [self.tableView reloadData];
            break;
        case 6://panic
        {
            [self panicPressed];

            break;
        }
        default:
            break;
    }
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"toAddPhone"])
    {
    PhoneNumberViewController * vc =  [segue destinationViewController];
    vc.shouldCallPanic = YES;

    }
}






-(void) panicPressed
{
    UIAlertController * alert = [UIAlertController alertControllerWithTitle:@"Confirm" message:@"Please confirm that you want to send a panic alert" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *sendAction = [UIAlertAction actionWithTitle:@"Send" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action)
    {
            NSString *phone = [DATA_MANAGER getPhoneNumber];
            if(phone != nil)
            {
                [DATA_MANAGER panic];
            }
            else
            {
                [self performSegueWithIdentifier:@"toAddPhone" sender:nil];
            }
    }];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleDefault handler:nil];
    
    [alert addAction:sendAction];
    [alert addAction:cancelAction];
    [self presentViewController:alert animated:YES completion:nil];

}




@end
