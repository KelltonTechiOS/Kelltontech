//
//  CelebrationsViewController.h
//  Kellton Tech
//
//  Created by Kellton Tech on 08/04/15.
//  Copyright (c) 2015 Kellton Tech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CelebrationsViewController : UIViewController
@property (nonatomic, strong) NSString *selectCelebration;
@property (nonatomic, strong) NSMutableArray *arrayOfSelectImages;
@property (nonatomic) BOOL buttonUploadShow;
@property(nonatomic)BOOL imagesPresent;
@property (nonatomic, strong) NSString *celebrationDocumentPathString;


@end
