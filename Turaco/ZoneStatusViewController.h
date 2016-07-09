//
//  ZoneStatusViewController.h
//  Turaco
//
//  Created by eder yifrach on 01/06/2016.
//  Copyright © 2016 magalcom. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZoneDetailTableViewCell.h"
#import "ZoneHeaderTableViewCell.h"

@interface ZoneStatusViewController : TuracoBaseViewController <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableViewZonesDetails;

@property (strong, nonatomic) NSArray * zonesArr;
@property (strong, nonatomic) NSMutableArray * arrOpenSections;

@end
