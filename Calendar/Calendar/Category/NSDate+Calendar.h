//
//  NSDate+Calendar.h
//  Calendar
//
//  Created by Manami Ichikawa on 4/13/17.
//  Copyright © 2017 Manami Ichikawa. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>


typedef NS_ENUM(NSInteger, DaysOfTheWeek){
    
    
    Sunday,
    Monday,
    Tuesday,
    Wednesday,
    Thursday,
    Friday,
    Saturday
    
};


//@import UIKit;

@interface NSDate (Calendar)

-(NSDate *)monthAgoDate;
-(NSDate *)monthLaterDate;
-(NSString *)dateStringWithFormat:(NSString *)format;
//-(NSArray*)weekdayType;

//-(DaysOfTheWeek)weekdayType;




@end
