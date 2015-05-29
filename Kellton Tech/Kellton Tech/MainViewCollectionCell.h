//
//  MainViewCollectionCell.h
//  Kellton Tech
//
//  Created by Kellton Tech on 07/04/15.
//  Copyright (c) 2015 Kellton Tech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewCollectionCell : UICollectionViewCell

@property (strong, nonatomic) IBOutlet UILabel *labelText;
@property (weak, nonatomic) IBOutlet UIView *cellBackView;
@end
