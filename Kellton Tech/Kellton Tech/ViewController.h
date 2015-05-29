//
//  ViewController.h
//  Kellton Tech
//
//  Created by Kellton Tech on 07/04/15.
//  Copyright (c) 2015 Kellton Tech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UICollectionViewDataSource,UICollectionViewDelegate>

@property (weak, nonatomic) IBOutlet UICollectionView *itemsCollectionView;
@property (weak, nonatomic) IBOutlet UIButton *swipeUpBtn;
@property (weak, nonatomic) IBOutlet UIView *swipeView;
@property (weak, nonatomic) IBOutlet UIButton *swipeDownBtn;

@end

