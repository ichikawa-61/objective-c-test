//
//  NSDate+Calendar.m
//  Calendar
//
//  Created by Manami Ichikawa on 4/13/17.
//  Copyright © 2017 Manami Ichikawa. All rights reserved.
//

#import "NSDate+Calendar.h"

@implementation NSDate (Calendar)


//- (DaysOfTheWeek)weekdayType {
//    NSCalendar *calendar = [NSCalendar currentCalendar];
//    NSDateComponents *components = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay|NSCalendarUnitWeekday
//                                               fromDate:self];
//    return [components weekday];
//}



-(NSString *)dateStringWithFormat:(NSString *)format{

    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    formatter.dateFormat = format;
    return [formatter stringFromDate:self];

}


-(NSDate *)monthAgoDate{

    NSInteger addValue = -1;
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *dateComponents = [[NSDateComponents alloc]init];
    dateComponents.month = addValue;
    return [calendar dateByAddingComponents:dateComponents toDate:self options:0];
    
    
}


- (NSDate *)monthLaterDate{
    
    NSInteger addValue = 1;
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *dateComponents = [NSDateComponents new];
    dateComponents.month = addValue;
    return [calendar dateByAddingComponents:dateComponents toDate:self options:0];
}


@end
