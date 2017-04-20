//
//  DayCell.h
//  Calendar
//
//  Created by Manami Ichikawa on 4/10/17.
//  Copyright © 2017 Manami Ichikawa. All rights reserved.
//

#import <UIKit/UIKit.h>

//Model
#import "CalendarLogic.h"
@interface DayCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UILabel *dayLabel;
@property (strong, nonatomic) NSArray *monthName;

-(void)setUpWithCalendar:(CalendarLogic*)calendarLogic Row:(NSInteger)row;
-(void)setUpDaysOfWeek:(NSInteger)row;
-(void)getWeekOfDays;

@end
