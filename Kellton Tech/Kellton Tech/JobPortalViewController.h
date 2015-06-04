//
//  JobPortalViewController.h
//  Kellton Tech
//
//  Created by Kellton Tech on 07/04/15.
//  Copyright (c) 2015 Kellton Tech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JobPortalViewController : UIViewController<UITextFieldDelegate,UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITextField *qualiFication;
@property (weak, nonatomic) IBOutlet UITextField *emailID;
@property (strong, nonatomic) IBOutlet UILabel *applyingForText;
@property (strong, nonatomic)  NSString *jobLblValue;

@property (weak, nonatomic) IBOutlet UITableView *applyingForTabelView;
@property (weak, nonatomic) IBOutlet UITextField *previousCompany;
@property (weak, nonatomic) IBOutlet UITextField *experiance;
@property (weak, nonatomic) IBOutlet UITextField *name;

@end
