//
//  ZoneStatusViewController.m
//  Turaco
//
//  Created by eder yifrach on 01/06/2016.
//  Copyright © 2016 magalcom. All rights reserved.
//

#import "ZoneStatusViewController.h"

@interface ZoneStatusViewController ()

@end

@implementation ZoneStatusViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _tableViewZonesDetails.tableFooterView = [UIView new];
    
    [self reloadData];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)reloadData
{
    [CONNECTION_MANAGER getZonesStatusWithPanelID:[DATA_MANAGER.currentPanel.panelId integerValue] andWithComplitionBlock:^(NSArray* data)
    {
        _zonesArr = data;
        _arrOpenSections = [[NSMutableArray alloc] init];
        for (NSInteger i = 0; i < _zonesArr.count ; i++ )
        {
            [_arrOpenSections addObject:@(NO)];
        }
        [_tableViewZonesDetails reloadData];
    } andFailedBlock:^{
        
    }];
}

#pragma mark - TableView DataSource + Delegate

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _zonesArr.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if ([_arrOpenSections[section] boolValue])
    {
        return 9;
    }
    else
    {
        return 1;
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0)
    {
        ZoneHeaderTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"zoneHeader" forIndexPath:indexPath];
        ZoneDetails *zone = _zonesArr[indexPath.section];
        cell.lblZoneId.text = [NSString stringWithFormat:@"%ld",(long)zone.zoneID];
        cell.lblIsActive.text = zone.zoneNotActive ? @"Not Active" : @"Active";
        return cell;
    }
    else
    {
        ZoneDetailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"zoneCell" forIndexPath:indexPath];
        
        ZoneDetails *zone = _zonesArr[indexPath.section];
        NSString* value;
        NSString* key;
        
        switch (indexPath.row) {

            case 1:
                value = zone.zone24HAlarm ? @"YES" : @"NO";
                key = @"24 Hour Alarm";
                break;
            case 2:
                value = zone.zoneConfirmedAlarm ? @"YES" : @"NO";
                key = @"Confirmed Alarm";
                break;
            case 3:
                value = zone.zoneSensorWatchAlarm ? @"YES" : @"NO";
                key = @"Sensor Watch Alarm";
                break;
            case 4:
                value = zone.zoneTamperOpen ? @"YES" : @"NO";
                key = @"Tamper Open";
                break;
            case 5:
                value = zone.zoneOpen ? @"YES" : @"NO";
                key = @"Zone Open";
                break;
            case 6:
                value = zone.radioZoneSupervisonAlarm ? @"YES" : @"NO";
                key = @"Radio Zone Supervision Alarm";
                break;
            case 7:
                value = zone.radioZoneBatteryLow ? @"YES" : @"NO";
                key = @"Battery Low";
                break;
            case 8:
                value = zone.zoneAlarm ? @"YES" : @"NO";
                key = @"Alarm";
                break;
            case 9:
                value = zone.zoneBypassed ? @"YES" : @"NO";
                key = @"Zone Bypassed";
                break;
                
            default:
                break;
        }
        cell.lblValue.text = value;
        cell.lblParameter.text = key;
        
        return cell;
    }
    ;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    BOOL value = [_arrOpenSections[indexPath.section] boolValue];
    [_arrOpenSections replaceObjectAtIndex:indexPath.section withObject:@(!value)];
    [_tableViewZonesDetails reloadSections:[NSIndexSet indexSetWithIndex: indexPath.section] withRowAnimation:UITableViewRowAnimationFade];
}




/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
