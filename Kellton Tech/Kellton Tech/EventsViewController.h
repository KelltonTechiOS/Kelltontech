//
//  EventsViewController.h
//  Kellton Tech
//
//  Created by Kellton Tech on 08/04/15.
//  Copyright (c) 2015 Kellton Tech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EventsViewController : UIViewController

@property (nonatomic, strong) NSString *selectEvent;
@property (nonatomic, strong) NSMutableArray *arrayOfSelectImages;
@property (nonatomic) BOOL buttonUploadShow;
@property (nonatomic, strong) NSString *EventDocumentPathString;


@end
