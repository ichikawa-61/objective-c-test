//
//  CalendarViewDataSource.m
//  Calendar
//
//  Created by Manami Ichikawa on 4/11/17.
//  Copyright © 2017 Manami Ichikawa. All rights reserved.
//

#import "CalendarViewDataSource.h"
#import "CalendarLogic.h"

@implementation CalendarViewDataSource

static NSUInteger const DaysPerWeek = 7;



- (instancetype) initWithCalendars:(NSArray<CalendarLogic *> *) calendars {
    if (self = [self init]) {
        self.calendars = calendars;
    }
    NSLog(@"initWithCalendars:通過しました");
    return self;
}




-(DayCell *)dateForCellAtIndexPath :(UICollectionView*)collectionView IndexPath:(NSIndexPath *)indexPath Section:(NSInteger)section{
    NSLog(@"dateForCellAtIndexPath:通過しました");
    
    DayCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    [cell getWeekOfDays];

    switch (section) {
        case CalendarViewWeekOfDays:{

            //CalendarLogic *calendarLogic = self.calendars[indexPath.row];
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


//- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
//    
//    if ([indexPath isEqual:[NSIndexPath indexPathForRow:3 inSection:1]]){
//        ;
//    }
//    NSLog(@"選択したのは%ld",indexPath.row);
//}




- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{

            return [self dateForCellAtIndexPath:collectionView IndexPath:indexPath Section:indexPath.section];
}


@end
