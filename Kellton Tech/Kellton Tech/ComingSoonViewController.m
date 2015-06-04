//
//  ComingSoonViewController.m
//  Kellton Tech
//
//  Created by KELLTONTECH on 01/06/15.
//  Copyright (c) 2015 Kellton Tech. All rights reserved.
//

#import "ComingSoonViewController.h"

@interface ComingSoonViewController ()


@end

@implementation ComingSoonViewController

-(void)viewWillAppear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:NO animated:YES];
   
    
    NSDictionary *textAttributes = [NSDictionary dictionaryWithObjectsAndKeys:
                                    [UIColor colorWithRed:0.0f/255.0f green:128.0f/255.0f blue:255.0f/255.0f alpha:1.0f],NSForegroundColorAttributeName,
                                    [UIColor whiteColor],NSBackgroundColorAttributeName,nil];
    
    self.navigationController.navigationBar.titleTextAttributes = textAttributes;
    
    
    self.title=_headerTitle;
    

    [super viewWillAppear:animated];
}
-(void)viewDidLoad
{
    //[self.navigationController setNavigationBarHidden:NO animated:YES];
    //self.navigationController.navigationItem.title=_titleString;
    [super viewDidLoad];
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
