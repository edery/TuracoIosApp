//
//  ZoneDetails.h
//  Turaco
//
//  Created by eder yifrach on 01/06/2016.
//  Copyright © 2016 magalcom. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZoneDetails : NSObject

@property (nonatomic, assign) NSInteger zoneID;
@property (nonatomic, assign) BOOL zoneNotActive;
@property (nonatomic, assign) BOOL zone24HAlarm;
@property (nonatomic, assign) BOOL zoneConfirmedAlarm;
@property (nonatomic, assign) BOOL zoneSensorWatchAlarm;
@property (nonatomic, assign) BOOL zoneTamperOpen;
@property (nonatomic, assign) BOOL zoneOpen;
@property (nonatomic, assign) BOOL radioZoneSupervisonAlarm;
@property (nonatomic, assign) BOOL radioZoneBatteryLow;
@property (nonatomic, assign) BOOL zoneAlarm;
@property (nonatomic, assign) BOOL zoneBypassed;

+(ZoneDetails*)createZoneDetailsWithZoneID:(NSInteger)zoneID
                             ZoneNotActive:(BOOL)zoneNotActive
                              zone24HAlarm:(BOOL)zone24HAlarm
                        zoneConfirmedAlarm:(BOOL)zoneConfirmedAlarm
                      zoneSensorWatchAlarm:(BOOL)zoneSensorWatchAlarm
                            zoneTamperOpen:(BOOL)zoneTamperOpen
                                  zoneOpen:(BOOL)zoneOpen
                  radioZoneSupervisonAlarm:(BOOL)radioZoneSupervisonAlarm
                       radioZoneBatteryLow:(BOOL)radioZoneBatteryLow
                                 zoneAlarm:(BOOL)zoneAlarm
                              zoneBypassed:(BOOL)zoneBypassed;





@end
