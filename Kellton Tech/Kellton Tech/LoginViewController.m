//
//  LoginViewController.m
//  Kellton Tech
//
//  Created by KELLTONTECH on 14/04/15.
//  Copyright (c) 2015 Kellton Tech. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *textFieldUserName;
@property (weak, nonatomic) IBOutlet UITextField *textFieldPassword;
@property (weak, nonatomic) IBOutlet UIButton *buttonSignin;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.buttonSignin.layer setCornerRadius:3.0f];
    [self.buttonSignin.layer setMasksToBounds:NO];
    
    // Do any additional setup after loading the view.
}

-(void)textFieldDidBeginEditing:(UITextField *)textField
{
   
}

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
        return YES;
}

-(void)textFieldDidEndEditing:(UITextField *)textField
{
    
    if (textField == self.textFieldPassword) {
        
        if ([self.textFieldPassword.text isEqualToString:@""]) {
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Warning!" message:@"Please enter Password" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alertView show];
        }
    }

    if (textField == self.textFieldUserName) {
        
        if ([self.textFieldUserName.text isEqualToString:@""]) {
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Warning!" message:@"Please enter User Name" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alertView show];
        }
    }

    
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if (textField == self.textFieldUserName) {
        textField.text = self.textFieldUserName.text;
        [self.textFieldPassword becomeFirstResponder];
    
    } else if (textField == self.textFieldPassword) {
        textField.text = self.textFieldPassword.text;
        [self.textFieldPassword resignFirstResponder];
    }
    return YES;
}

- (IBAction)signIn:(id)sender {
    
    if ([self.textFieldUserName.text isEqualToString:@""] || [self.textFieldPassword.text isEqualToString:@""]) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Warning!" message:@"Please enter both fields" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alertView show];
        
    } else {
        
        [[[UIAlertView alloc] initWithTitle:@"Error!" message:@"Please enter valid credentials" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
    }
    
    if ([self.textFieldUserName.text isEqualToString:@"sateesh.yemireddi@kelltontech.com"] && [self.textFieldPassword.text isEqualToString:@"123456"]){
        
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"uploaded!" message:nil delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        self.textFieldPassword.text = @"";
        [alertView show];
        
    }else if ([self.textFieldUserName.text isEqualToString:@"dheeraj.raju@kelltontech.com"] && [self.textFieldPassword.text isEqualToString:@"234567"]){
        
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"uploaded!" message:nil delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        self.textFieldPassword.text = @"";
        [alertView show];
    
    }
    
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

@end
