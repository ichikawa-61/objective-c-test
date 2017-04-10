//
//  ViewController.m
//  Calendar
//
//  Created by Manami Ichikawa on 4/10/17.
//  Copyright © 2017 Manami Ichikawa. All rights reserved.
//

#import "CalendarViewController.h"
#import "DayCell.h"


@implementation NSDate (Extension)


- (NSDate *)monthAgoDate{
    
    
    NSInteger addValue = -1;
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *dateComponents = [NSDateComponents new];
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

@interface CalendarViewController (){

    NSInteger numberOfItems;
    NSInteger numberOfWeeks;

}

@property (nonatomic,strong) NSArray *weekDays;
@property (nonatomic,strong) NSDate *prevMonth;
@end

@implementation CalendarViewController


static NSUInteger const DaysPerWeek = 7;
static CGFloat const CellMargin = 2.0f;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    //今日の日付
    self.showdMonth = [NSDate date];
    //ヘッダー
    
    
    NSDateFormatter* dayFormat = [[NSDateFormatter alloc] init];
    dayFormat.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"ja"];
    NSArray *monthName = dayFormat.shortWeekdaySymbols;
    self.weekDays = monthName;

    
    [self getTitleOfController];
    [self firstDateOfMonth];
    
    UINib *nib = [UINib nibWithNibName:@"DayCell" bundle:nil];
    [self.collectionView registerNib:nib forCellWithReuseIdentifier:@"Cell"];
    
}

-(void)getTitleOfController{

    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    formatter.dateFormat = @"yyyy年MM月";
    self.title = [formatter stringFromDate:self.showdMonth];

}



- (NSDate *)firstDateOfMonth{
    
    NSDateComponents *components = [[NSCalendar currentCalendar] components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay
     fromDate:self.showdMonth];
    
    //今日の日付になっているので、月の最初の日付を指定
    components.day = 1;
    
    
    
    NSDate *firstDateMonth = [[NSCalendar currentCalendar] dateFromComponents:components];
    
    return firstDateMonth;
}



- (NSDate *)dateForCellAtIndexPath:(NSIndexPath *)indexPath{
 
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
        numberOfWeeks = rangeOfWeeks.length;
        numberOfItems = numberOfWeeks * DaysPerWeek;
        
       
        return numberOfItems;

    }
    
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    DayCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    
    
    if(indexPath.section == 0){
        
        cell.dayLabel.textAlignment = NSTextAlignmentCenter;
        cell.dayLabel.text = self.weekDays[indexPath.row];
    
    }else{
    
        NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
        formatter.dateFormat = @"d";
        cell.dayLabel.textAlignment = NSTextAlignmentCenter;
        cell.dayLabel.text = [formatter stringFromDate:[self dateForCellAtIndexPath:indexPath]];
    
    }
    
    if((indexPath.row+1)%7 == Sunday){
    
        cell.dayLabel.textColor = [UIColor redColor];
    }else if((indexPath.row+1)%7 == Saturday){
    
        cell.dayLabel.textColor = [UIColor blueColor];
        
    }
    
    if(indexPath.row < DaysPerWeek -1){
    
        cell.dayLabel.textColor = [UIColor yellowColor];
    }else if (indexPath.row < DaysPerWeek + numberOfWeeks -1){
    
       
    
    }else if(indexPath.row < numberOfItems){
    
         cell.dayLabel.textColor = [UIColor yellowColor];
    }
    
    
    
    return cell;
    
    
}



#pragma mark - UICollectionViewDelegate methods


//セルの大きさ=>高さを幅の1.5倍　セル同士の間隔は定数で2.0f　6行7列で表示させる
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

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    if ([indexPath isEqual:[NSIndexPath indexPathForRow:3 inSection:1]]){
        ;
    }
    NSLog(@"選択したのは%ld",indexPath.row);

}




- (IBAction)gotToNextMonth:(id)sender {
    
    self.showdMonth = [self.showdMonth monthLaterDate];
    
    [self getTitleOfController];
    [self.collectionView reloadData];
}

- (IBAction)goToLastMonth:(id)sender {
    
    self.showdMonth = [self.showdMonth monthAgoDate];
    
    [self getTitleOfController];
    [self.collectionView reloadData];

}
@end
