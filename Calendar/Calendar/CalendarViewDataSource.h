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


//-(DayCell *)dateForCellAtIndexPath :(UICollectionView*)collectionView IndexPath:(NSIndexPath *)indexPath;
//
//-(DayCell *) weekOfDaysAtIndexPath:collectionView Index:indexPath;
@property (strong,nonatomic) NSArray *calendars;

typedef NS_ENUM(NSInteger, CalendarViewDataSourceSection) {
    CalendarViewWeekOfDays,
    CalendarViewDates,
    CalendarViewNumberOfSecssion
   
};


- (instancetype) initWithCalendars:(NSArray<CalendarLogic *> *) calendars;

@end
