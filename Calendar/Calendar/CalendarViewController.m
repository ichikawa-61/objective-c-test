//
//  ViewController.m
//  Calendar
//
//  Created by Manami Ichikawa on 4/10/17.
//  Copyright © 2017 Manami Ichikawa. All rights reserved.
//

#import "CalendarViewController.h"
#import "DayCell.h"

@interface CalendarViewController ()

@end

@implementation CalendarViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    
     self.today = [NSDate date];
    
     [self firstDateOfMonth];
    
    UINib *nib = [UINib nibWithNibName:@"DayCell" bundle:nil];
    [self.collectionView registerNib:nib forCellWithReuseIdentifier:@"Cell"];
}





- (NSDate *)firstDateOfMonth
{
    
    NSDateComponents *components = [[NSCalendar currentCalendar] components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay fromDate:self.today];
    
    NSDate *firstDateMonth = [[NSCalendar currentCalendar] dateFromComponents:components];
    
    return firstDateMonth;
}



- (NSDate *)dateForCellAtIndexPath:(NSIndexPath *)indexPath
{
 
    NSInteger ordinalityOfFirstDay = [[NSCalendar currentCalendar] ordinalityOfUnit:NSCalendarUnitDay
                                                                             inUnit:NSCalendarUnitWeekOfMonth
                                                                            forDate:[self firstDateOfMonth]];
    
   
    NSDateComponents *dateComponents = [NSDateComponents new];
    dateComponents.day = indexPath.item - (ordinalityOfFirstDay - 1);
    
    NSDate *date = [[NSCalendar currentCalendar] dateByAddingComponents:dateComponents
                                                                 toDate:[self firstDateOfMonth]
                                                                options:0];
   
    return date;
}






- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    
    return 35;
    
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    DayCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    formatter.dateFormat = @"d";
    cell.dayLabel.textAlignment = NSTextAlignmentCenter;
    cell.dayLabel.text = [formatter stringFromDate:[self dateForCellAtIndexPath:indexPath]];
    
    
    
    return cell;
    
    
}






@end
