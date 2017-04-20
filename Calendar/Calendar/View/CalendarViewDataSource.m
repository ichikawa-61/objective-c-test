//
//  CalendarViewDataSource.m
//  Calendar
//
//  Created by Manami Ichikawa on 4/11/17.
//  Copyright © 2017 Manami Ichikawa. All rights reserved.


//Model
#import "CalendarLogic.h"

//View
#import "CalendarViewDataSource.h"

@implementation CalendarViewDataSource

static NSUInteger const DaysPerWeek = 7;

- (instancetype) initWithCalendars:(NSArray<CalendarLogic *> *) calendars {
    if (self = [self init]) {
        self.calendars = calendars;
    }
    return self;
}

-(DayCell *)dateForCellAtIndexPath :(UICollectionView*)collectionView IndexPath:(NSIndexPath *)indexPath Section:(NSInteger)section{
    
    DayCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    [cell getWeekOfDays];

    switch (section) {
        case CalendarViewWeekOfDays:{

            [cell setUpDaysOfWeek:indexPath.row];
            
            return cell;
        }
        case CalendarViewDates:{
            
            CalendarLogic *calendarLogic = self.calendars[indexPath.row];
            [cell setUpWithCalendar:calendarLogic Row:indexPath.row];
        
            return cell;
        }
    }
    
    return cell;
}


#pragma mark - UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    
    return CalendarViewNumberOfSecssion;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    switch (section) {
        case CalendarViewWeekOfDays:
            return DaysPerWeek;
        default:
            return self.calendars.count;
    }
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
            return [self dateForCellAtIndexPath:collectionView IndexPath:indexPath Section:indexPath.section];
}


@end
