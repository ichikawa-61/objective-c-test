//
//  ViewController.h
//  Calendar
//
//  Created by Manami Ichikawa on 4/10/17.
//  Copyright © 2017 Manami Ichikawa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CalendarViewController : UIViewController<UICollectionViewDataSource,UICollectionViewDelegate>

@property (nonatomic,strong) NSDate *showdMonth;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
- (IBAction)gotToNextMonth:(id)sender;

- (IBAction)goToLastMonth:(id)sender;

typedef NS_ENUM(NSInteger, DaysOfTheWeek){
    
    Saturday,
    Sunday,
    Monday,
    Tuesday,
    Wednesday,
    Thursday,
    Friday
    
    
    
    
};
@end

