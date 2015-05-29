//
//  JobVacanciesViewController.m
//  Kellton Tech
//
//  Created by KELLTONTECH on 17/04/15.
//  Copyright (c) 2015 Kellton Tech. All rights reserved.
//

#import "JobVacanciesViewController.h"

@interface JobVacanciesViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableview;
@property (weak, nonatomic) IBOutlet UILabel *labelExperience;
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (strong, nonatomic) NSArray *arrayOfJobs;
//@property (strong, nonatomic) NSArray
@end

@implementation JobVacanciesViewController

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.arrayOfJobs = [NSArray arrayWithObjects:@"QA Lead",@"Technical Lead - Mobile",@"Technical Lead .NET",@"Business Development",nil];
    // Do any additional setup after loading the view.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.arrayOfJobs count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (cell == nil) {
        cell = [tableView dequeueReusableCellWithIdentifier:@"cellIDT"];
    }
    cell.textLabel.text = self.arrayOfJobs[indexPath.row];
    
     [self performSegueWithIdentifier:@"JobPortalViewController" sender:self];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
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
