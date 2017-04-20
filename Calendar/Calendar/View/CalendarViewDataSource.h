//
//  CalendarViewDataSource.h
//  Calendar
//
//  Created by Manami Ichikawa on 4/11/17.
//  Copyright © 2017 Manami Ichikawa. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DayCell.h"

@interface CalendarViewDataSource : NSObject<UICollectionViewDataSource>

@property (strong,nonatomic) NSArray *calendars;

typedef NS_ENUM(NSInteger, CalendarViewDataSourceSection) {
    CalendarViewWeekOfDays,
    CalendarViewDates,
    CalendarViewNumberOfSecssion   
};

- (instancetype) initWithCalendars:(NSArray<CalendarLogic *> *) calendars;

@end
