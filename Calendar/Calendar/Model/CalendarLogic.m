//
//  CalendarLogic.m
//  Calendar
//
//  Created by Manami Ichikawa on 4/11/17.
//  Copyright © 2017 Manami Ichikawa. All rights reserved.
//

#import "CalendarLogic.h"



@implementation CalendarLogic

static NSUInteger const DaysPerWeek = 7;

-(NSDate*)getThisMonth{
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:(NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear) fromDate:[NSDate date]];
    NSDate *today = [calendar dateFromComponents:components];
    
    return today;
    
    
}

+(NSArray<CalendarLogic *> *)calendarWithDate:(NSDate *)date{

    //受け取った日付の入った月を要素ごとに分ける。
    NSDateComponents *components = [[NSCalendar currentCalendar] components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay fromDate:date];
    
    components.day = 1;
    
    NSDate *firstDateOfMonth = [[NSCalendar currentCalendar] dateFromComponents:components];
    
    
    NSInteger numberOfWeeks = [[NSCalendar currentCalendar] rangeOfUnit:NSCalendarUnitWeekOfMonth inUnit:NSCalendarUnitMonth forDate:firstDateOfMonth].length;
    
    
    NSInteger numberOfDaysInMonth = numberOfWeeks * DaysPerWeek;
    
    NSLog(@"ギギギg%ld",numberOfDaysInMonth);
    NSMutableArray *calendars = [@[] mutableCopy];
    
    
    //restOfTheLastMonthは一日が表示されている４２個のセルのうち何番目か取得
    NSInteger restOfTheLastMonth = [[NSCalendar currentCalendar] ordinalityOfUnit:NSCalendarUnitDay
                                                                           inUnit:NSCalendarUnitWeekOfMonth
                                                                          forDate:firstDateOfMonth];
    
    
    for (NSInteger i = 0; i < numberOfDaysInMonth; i++) {
        
        
        NSDateComponents *nextComponents = [[NSDateComponents alloc]init];
        nextComponents.day = i - (restOfTheLastMonth - 1);
        
        //表示される日
        NSDate *aDate = [[NSCalendar currentCalendar] dateByAddingComponents:nextComponents
                                                                         toDate:firstDateOfMonth
                                                                        options:0];
        
        NSLog(@"nextDate: %@",aDate);
        NSInteger month = [[[NSCalendar currentCalendar] components:NSCalendarUnitMonth fromDate:date] month];
        
        //表示される一覧の月だけを取得->ここで表示される月のうち先月、今月、来月に分かれる
        NSInteger monthOfTheDate = [[[NSCalendar currentCalendar] components:NSCalendarUnitMonth fromDate:aDate] month];
        
        
                [calendars addObject:[[CalendarLogic alloc] initWithDate:aDate isDifferentMonth:month != monthOfTheDate]];
    }
    
    return calendars;
}


- (instancetype)initWithDate:(NSDate *)date isDifferentMonth:(BOOL)isDifferentMonth {
    if (self = [super init]) {
        self.aDate = date;
        
        //今月の日付 = 0 , それ以外の日付 = 1
        self.isDifferentMonth = isDifferentMonth;
        NSLog(@"isDifferentMonthに値が入った！");
    }
    return self;
}
    
    




@end
