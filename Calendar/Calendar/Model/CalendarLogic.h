//
//  CalendarLogic.h
//  Calendar
//
//  Created by Manami Ichikawa on 4/11/17.
//  Copyright © 2017 Manami Ichikawa. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CalendarViewController.h"


@interface CalendarLogic : NSObject



@property (strong,nonatomic) NSDate *aDate;
@property (assign, nonatomic) BOOL isDifferentMonth;


+ (NSArray<CalendarLogic*> *)calendarWithDate:(NSDate *)date;
@property(nonatomic,strong) NSDate *referenceDate;

@end
