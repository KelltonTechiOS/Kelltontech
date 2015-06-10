//
//  LoginViewController.m
//  Kellton Tech
//
//  Created by KELLTONTECH on 14/04/15.
//  Copyright (c) 2015 Kellton Tech. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController () <UITextFieldDelegate>
{
    UIAlertView *alertView;
}

@property (weak, nonatomic) IBOutlet UITextField *textFieldUserName;
@property (weak, nonatomic) IBOutlet UITextField *textFieldPassword;
@property (weak, nonatomic) IBOutlet UIButton *buttonSignin;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.buttonSignin.layer setCornerRadius:3.0f];
    [self.buttonSignin.layer setMasksToBounds:NO];
    alertView.delegate=self;
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
    
    textField.keyboardType = UIKeyboardTypeDefault;
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

- (IBAction)signIn:(id)sender
{
    if ([self.textFieldUserName.text isEqualToString:@""] || [self.textFieldPassword.text isEqualToString:@""])
    {
      alertView = [[UIAlertView alloc] initWithTitle:@"Warning!" message:@"Please enter both fields" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alertView show];
     }
  else  if ([self.textFieldUserName.text isEqualToString:@"admin"] && [self.textFieldPassword.text isEqualToString:@"password"])
  {
        alertView = [[UIAlertView alloc] initWithTitle:@"Your images are in queue for moderation" message:nil delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        self.textFieldUserName.text=@"";
        self.textFieldPassword.text = @"";
        [alertView show];
        alertView.tag=100;
  }
    else {
        [[[UIAlertView alloc] initWithTitle:@"Error!" message:@"Please enter valid credentials" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
    }
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (alertView.tag == 100)
    {
        if (buttonIndex == 0)
        {
               [self performSegueWithIdentifier:@"exitSegue" sender:self];
        }
        else
        {
            NSLog(@"cancel");
        }
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
