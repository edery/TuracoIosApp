//
//  ZoneDetails.m
//  Turaco
//
//  Created by eder yifrach on 01/06/2016.
//  Copyright © 2016 magalcom. All rights reserved.
//

#import "ZoneDetails.h"

@implementation ZoneDetails



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
                              zoneBypassed:(BOOL)zoneBypassed
{
    ZoneDetails* zone = [[ZoneDetails alloc] init];
    zone.zoneID = zoneID;
    zone.zoneNotActive = zoneNotActive;
    zone.zone24HAlarm = zone24HAlarm;
    zone.zoneConfirmedAlarm = zoneConfirmedAlarm;
    zone.zoneSensorWatchAlarm = zoneSensorWatchAlarm;
    zone.zoneTamperOpen = zoneTamperOpen;
    zone.radioZoneSupervisonAlarm = radioZoneSupervisonAlarm;
    zone.radioZoneBatteryLow = radioZoneBatteryLow;
    zone.zoneAlarm = zoneAlarm;
    zone.zoneBypassed = zoneBypassed;
    return zone;
}

@end
