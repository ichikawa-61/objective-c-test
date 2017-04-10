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

@property (nonatomic,strong) NSArray *weekDays;

@end

@implementation CalendarViewController



static NSUInteger const DaysPerWeek = 7;
static CGFloat const CellMargin = 2.0f;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    //今日の日付
    self.today = [NSDate date];
    //ヘッダー
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    formatter.dateFormat = @"yyyy年MM月";
    self.title = [formatter stringFromDate:self.today];
    
    self.weekDays = @[@"日",@"月",@"火",@"水",@"木",@"金",@"土"];

    
     [self firstDateOfMonth];
    
    UINib *nib = [UINib nibWithNibName:@"DayCell" bundle:nil];
    [self.collectionView registerNib:nib forCellWithReuseIdentifier:@"Cell"];
    
}





- (NSDate *)firstDateOfMonth
{
    
    NSDateComponents *components = [[NSCalendar currentCalendar] components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay  fromDate:self.today];
    

    //今日の日付になっているので、月の最初の日付を指定
    components.day = 1;
    
    
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



#pragma mark - UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    
    
    return 2;
}



- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    
    
    if(section == 0 ){
        
        return 7;
    }else{
    NSRange rangeOfWeeks = [[NSCalendar currentCalendar] rangeOfUnit:NSCalendarUnitWeekOfMonth
                                                              inUnit:NSCalendarUnitMonth
                                                             forDate:self.firstDateOfMonth];
    NSUInteger numberOfWeeks = rangeOfWeeks.length;
    
    //6行7列で表示
    NSInteger numberOfItems = numberOfWeeks * DaysPerWeek;
    
    
    return numberOfItems;
    }
    
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    DayCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    
    if(indexPath.section == 0){
        
        cell.dayLabel.text = self.weekDays[indexPath.row];
        
        
    
    }else{
    
        NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
        formatter.dateFormat = @"d";
        cell.dayLabel.textAlignment = NSTextAlignmentCenter;
        cell.dayLabel.text = [formatter stringFromDate:[self dateForCellAtIndexPath:indexPath]];
    
    }
    
    return cell;
    
    
}



#pragma mark - UICollectionViewDelegateFlowLayout methods


//セルの大きさ=>高さを幅の1.5倍　セル同士の間隔は定数で2.0f
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger numberOfMargin = 8;
    CGFloat width = floorf((collectionView.frame.size.width - CellMargin * numberOfMargin) / DaysPerWeek);
    CGFloat height = width * 1.5f;
    
    return CGSizeMake(width, height);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(CellMargin, CellMargin, CellMargin, CellMargin);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return CellMargin;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return CellMargin;
}







@end
