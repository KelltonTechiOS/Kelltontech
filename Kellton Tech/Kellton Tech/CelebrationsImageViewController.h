//
//  CelebrationsImageViewController.h
//  Kellton Tech
//
//  Created by KELLTONTECH on 14/04/15.
//  Copyright (c) 2015 Kellton Tech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CelebrationsImageViewController : UIViewController
@property (strong, nonatomic) NSString *selectedCelebration;
@property (strong, nonatomic) NSArray *arrayOfSelectedImages;
@property (nonatomic) BOOL buttonShowUpload;
@end
