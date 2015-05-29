//
//  UserDetails.h
//  Kellton Tech
//
//  Created by KELLTONTECH on 16/04/15.
//  Copyright (c) 2015 Kellton Tech. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface UserDetails : NSManagedObject

@property (nonatomic, retain) NSString * applyingFor;
@property (nonatomic, retain) NSString * emailID;
@property (nonatomic, retain) NSString * experience;
@property (nonatomic, retain) NSString * highestQualification;
@property (nonatomic, retain) NSNumber * isSubmitted;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * previousCompany;
@property (nonatomic, retain) NSDate * appliedDate;

@end
