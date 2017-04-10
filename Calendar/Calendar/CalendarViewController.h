//
//  ViewController.h
//  Calendar
//
//  Created by Manami Ichikawa on 4/10/17.
//  Copyright © 2017 Manami Ichikawa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CalendarViewController : UIViewController<UICollectionViewDataSource,UICollectionViewDelegate>
//@property (nonatomic,strong) NSDate *thisMonth;
@property (nonatomic,strong) NSDate *today;
//@property (nonatomic,strong) NSDate *days;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

