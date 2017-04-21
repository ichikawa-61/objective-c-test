//
//  DayCell.m
//  Calendar
//
//  Created by Manami Ichikawa on 4/10/17.
//  Copyright © 2017 Manami Ichikawa. All rights reserved.
//

#import "DayCell.h"
#import "NSDate+Calendar.h"
#import "NSString+Localizable.h"

@interface DayCell()

//typedef NS_ENUM(NSInteger, DaysOfTheWeek){
//    
//    Saturday,
//    Sunday,
//    Monday,
//    Tuesday,
//    Wednesday,
//    Thursday,
//    Friday
//    
//};


@end

@implementation DayCell




- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}


-(void)getWeekOfDays{
    
    NSDateFormatter* dayFormat = [[NSDateFormatter alloc] init];
    dayFormat.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"ja"];
    self.monthName = dayFormat.shortWeekdaySymbols;
    
    
    //return monthName;
}




-(void)setUpDaysOfWeek:(NSInteger)row{
    //NSString *test = [self.monthName objectAtIndex:row];
    
   // NSLog(@"ええええええ%@",test);
    self.dayLabel.text = [self.monthName objectAtIndex:row] ;
    
    switch (row) {
        case Sunday:
            self.dayLabel.textColor = [UIColor redColor];
            break;
            
        case Saturday:
            self.dayLabel.textColor = [UIColor blueColor];
            break;
            
        default:
            self.dayLabel.textColor = [UIColor blackColor];
    }

}



-(void)setUpWithCalendar:(CalendarLogic*)calendarLogic Row:(NSInteger)row{
    
    NSDateFormatter *formatter = [NSDateFormatter new];
    formatter.dateFormat = @"d";
    
    self.dayLabel.text = [calendarLogic.aDate dateStringWithFormat:formatter.dateFormat];
    if (calendarLogic.isDifferentMonth) {
        self.dayLabel.textColor = [UIColor lightGrayColor];
        return;
    }
    
    switch (row%7) {
        case Sunday:
            self.dayLabel.textColor = [UIColor redColor];
            break;
            
        case Saturday:
            self.dayLabel.textColor = [UIColor blueColor];
            break;
            
        default:
            self.dayLabel.textColor = [UIColor blackColor];
            break;
    }

    
}

@end
