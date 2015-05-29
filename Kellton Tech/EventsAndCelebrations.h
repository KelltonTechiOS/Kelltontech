//
//  EventsAndCelebrations.h
//  Kellton Tech
//
//  Created by KELLTONTECH on 15/04/15.
//  Copyright (c) 2015 Kellton Tech. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface EventsAndCelebrations : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSNumber * year;
@property (nonatomic, retain) NSString * type;
@property (nonatomic, retain) NSData * photo;

@end
