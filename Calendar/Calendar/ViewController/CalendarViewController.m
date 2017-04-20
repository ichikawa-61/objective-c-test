//
//  ViewController.m
//  Calendar
//
//  Created by Manami Ichikawa on 4/10/17.
//  Copyright © 2017 Manami Ichikawa. All rights reserved.
//

#import "CalendarViewController.h"
#import "DayCell.h"
#import "CalendarLogic.h"
#import "NSDate+Calendar.h"
#import "CalendarViewDataSource.h"



@interface CalendarViewController (){

    NSInteger numberOfItems;
    NSInteger numberOfWeeks;

}

@property (strong, nonatomic) CalendarLogic *calendarLogic;
@property (strong, nonatomic) NSArray *weekOfDays;
@property (strong, nonatomic) NSDate *showedDate;
@property (strong, nonatomic) NSDate *aDate;
@property (strong, nonatomic) CalendarViewDataSource *calendarViewDataSource;

@end

@implementation CalendarViewController


static NSUInteger const DaysPerWeek = 7;
static CGFloat const CellMargin = 2.0f;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.aDate  = [NSDate date];
    
    self.calendarViewDataSource = [[CalendarViewDataSource alloc] initWithCalendars:[CalendarLogic calendarWithDate:self.aDate]];
    
    self.collectionView.dataSource = self.calendarViewDataSource;
    self.collectionView.delegate = self;
    
    NSDateFormatter *formatter = [NSDateFormatter new];
    formatter.dateFormat = @"MM月YYYY年";
    self.navigationItem.title = [self.aDate dateStringWithFormat:formatter.dateFormat];
    
    UINib *nib = [UINib nibWithNibName:@"DayCell" bundle:nil];
    [self.collectionView registerNib:nib forCellWithReuseIdentifier:@"Cell"];
    
    
}






#pragma mark - UICollectionViewDelegate methods


//　セル同士の間隔は定数で2.0f　7行6列で表示させる
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger numberOfMargin = 8;
    CGFloat width = floorf((collectionView.frame.size.width - CellMargin * numberOfMargin) / DaysPerWeek);
    CGFloat height = width ;
    
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


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    
    NSLog(@"didSelectItemAtIndexPath:通過しました");
    if (self.calendarLogic.isDifferentMonth){
         NSLog(@"選択したのは%d",self.calendarLogic.isDifferentMonth);
    }


}




- (IBAction)goToNextMonth:(id)sender {
    
    self.aDate = [self.aDate monthLaterDate];
    self.calendarViewDataSource.calendars = [CalendarLogic calendarWithDate:self.aDate];
    
    NSDateFormatter *formatter = [NSDateFormatter new];
    formatter.dateFormat = @"MM月YYYY年";
    self.navigationItem.title = [self.aDate dateStringWithFormat:formatter.dateFormat];
    
    [self.collectionView reloadData];
    
}

- (IBAction)goToLastMonth:(id)sender {
   
    self.aDate = [self .aDate monthAgoDate];
    self.calendarViewDataSource.calendars = [CalendarLogic calendarWithDate:self.aDate];
    
    NSDateFormatter *formatter = [NSDateFormatter new];
    formatter.dateFormat = @"MM月YYYY年";
    self.navigationItem.title = [self.aDate dateStringWithFormat:formatter.dateFormat];
    [self.collectionView reloadData];
}
@end
