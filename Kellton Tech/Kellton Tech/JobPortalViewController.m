//
//  JobPortalViewController.m
//  Kellton Tech
//
//  Created by Kellton Tech on 07/04/15.
//  Copyright (c) 2015 Kellton Tech. All rights reserved.
//

#import "JobPortalViewController.h"
#import "AppDelegate.h"
#import "UserDetails.h"

@interface JobPortalViewController ()<UIGestureRecognizerDelegate>
{
    NSArray *dataArray;
}

#define APP_DELEGATE (AppDelegate*)[[UIApplication sharedApplication] delegate]

@property (weak, nonatomic) IBOutlet UIButton *submitButton;
@property (weak, nonatomic) IBOutlet UIView *contentView;

@end

@implementation JobPortalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.navigationBarHidden = NO;
    self.title = @"Job Portal";
    dataArray = [[NSArray alloc] initWithObjects:@"QA Lead",@"Technical Lead - Mobile",@"Technical Lead .NET",@"Business Development",nil];
    
    [self.submitButton.layer setCornerRadius:4.0f];
    [self.submitButton.layer setMasksToBounds:NO];
    
    CGFloat borderWidth = 1.0f;
    
    self.applyingForText.frame = CGRectInset(self.applyingForText.frame, -borderWidth, -borderWidth);
    
    self.applyingForText.layer.borderColor = [UIColor colorWithWhite:0.7 alpha:0.4].CGColor;
    [self.applyingForText.layer setMasksToBounds:NO];
    [self.applyingForText.layer setCornerRadius:3.0f];
    self.applyingForText.layer.borderWidth = borderWidth;
    
    [self.contentView setUserInteractionEnabled:YES];

}

- (IBAction)gesture:(UITapGestureRecognizer *)sender {
    
//    [self.applyingForTabelView removeGestureRecognizer:sender];

    UIView *viewControllerView = sender.view;
    CGPoint location           = [sender locationInView:viewControllerView];
    
    CGRect frame = self.applyingForTabelView.frame;
    
    if (!CGRectContainsPoint(frame, location)) {
        
        [self.applyingForTabelView setHidden:YES];

    } else {
        

        // Process tap elsewhere
    }
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gesture shouldReceiveTouch:(UITouch *)touch {
    
//    UIView *view = touch.view;
//    CGRect frame = view.frame;
//    return ![NSStringFromClass([touch.view class]) isEqualToString:@"UITableViewCellContentView"];
    
    if ([NSStringFromClass([touch.view class]) isEqualToString:@"UITableViewCellContentView"]) {
        return NO;
    }
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.

}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)dropDownBtn:(id)sender {
    
    _applyingForTabelView.hidden = NO;
    CGRect frame = _applyingForTabelView.frame;
    CGRect newframe = CGRectMake(frame.origin.x, frame.origin.y, frame.size.width, 0);
    _applyingForTabelView.frame = newframe;

//    _applyingForTabelView.alpha = 0.0f;
    [UIView animateWithDuration:0.5f
                          delay:0.0f
                        options:UIViewAnimationOptionBeginFromCurrentState
                     animations:^{
                         _applyingForTabelView.frame = frame;

                     }
                     completion:^(BOOL finished) {
                     }];
}

- (IBAction)submitTouched:(id)sender {
    if ([_applyingForText.text isEqual:@""] || [_name.text isEqual:@""] || [_qualiFication.text isEqual:@""] || [_emailID.text isEqual:@""] || [_previousCompany.text isEqual:@""]|| [_experiance.text isEqual:@""])
    {
        [[[UIAlertView alloc] initWithTitle:@"Information!" message:@"Please enter all fields" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil] show];
    }
    else
    {
        UserDetails *details;
        details = [NSEntityDescription insertNewObjectForEntityForName:@"UserDetails"
                                                  inManagedObjectContext:[APP_DELEGATE managedObjectContext]];
        details.name = _name.text;
        details.emailID = _emailID.text;
        details.previousCompany = _previousCompany.text;
        details.applyingFor = _applyingForText.text;
        details.highestQualification = _qualiFication.text;
        details.experience = _experiance.text;
        details.appliedDate = [NSDate dateWithTimeIntervalSinceNow:0.0];
        
        [APP_DELEGATE saveContext];
        
        [[[UIAlertView alloc] initWithTitle:@"Thank you!" message:@"Our team will get back to you soon..." delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil] show];
        _applyingForText.text = @"";
        _name.text = @"";
        _qualiFication.text = @"";
        _emailID.text = @"";
        _previousCompany.text =@"";
        _experiance.text = @"";
    }
}

#pragma UITextFieldDelegate
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    return YES;
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];

    return YES;
}
- (void)textFieldDidEndEditing:(UITextField *)textField
{
    if (textField.tag == 1001)
    {
        _name.text = textField.text;
    }
    else if (textField.tag == 1002)
    {
        _emailID.text = textField.text;
    }
    else if (textField.tag == 1003)
    {
        _qualiFication.text = textField.text;
    }
    else if (textField.tag == 1004)
    {
        _previousCompany.text = textField.text;
    }
    else if (textField.tag == 1005)
    {
        _experiance.text = textField.text;
    }
}

#pragma UITableViewDataSource


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"TableViewCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                                      reuseIdentifier:cellIdentifier] ;
    }
    cell.textLabel.font = [UIFont fontWithName:@"Arial" size:12.0f];

    cell.textLabel.text = [dataArray objectAtIndex:indexPath.row];
    
    return cell;

}
#pragma UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    _applyingForText.text = [dataArray objectAtIndex:indexPath.row];
    _applyingForTabelView.hidden = YES;
}


@end
