//
//  JobVacanciesViewController.m
//  Kellton Tech
//
//  Created by KELLTONTECH on 17/04/15.
//  Copyright (c) 2015 Kellton Tech. All rights reserved.
//

#import "JobVacanciesViewController.h"
#import "JobPortalViewController.h"

@interface JobVacanciesViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableview;
@property (weak, nonatomic) IBOutlet UILabel *labelExperience;
@property (weak, nonatomic) IBOutlet UILabel *positionsLbl;

@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (strong, nonatomic) NSArray *arrayOfJobs;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *tableViewHeight;

@property (strong, nonatomic) NSArray *experienceArray;
@property (strong, nonatomic) NSArray *positionsArray;

@property (strong, nonatomic) NSArray *descriptionArray;


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
    self.experienceArray=[NSArray arrayWithObjects:@"5+ years",@"5+ years",@"5-8 years",
                          @"2-4 years",nil];
    
    
    self.descriptionArray=[NSArray arrayWithObjects:@"1.Experience in working with product designers and developers at all stages to promote quality \n2.Clear understanding of different testing concepts \n3.Experience in estimations\n4.Demonstrated past leadership experience in Quality Assurance \n5.Experience in test planning, test case creation, execution and is aware of different test case writing techniques \n6.Experience in tracking and managing defects \n7. Experience with automation tools preferred \n8.Experience in writing and executing sql queries \n9.Good communication skills",
        @"1.Strong Knowledge in JAVA / J2EE/J2ME (mandatory)\n2.Sound Experience in either Blackberry (RIM APIs) or Android Technologies. (6 months to 1 year recent experience on the same would do)\n3.Must have excellent knowledge of UI framework as well as back end APIs.\n4.Good problem solving and communication skills",
        @"1.Experience in developing web-based applications on Microsoft Technologies using ASP .Net, C#, SQL Server, Web Services.\n2.Good understanding of Design Patterns. The person should have good understanding of UML\n3.Good working knowledge of N-Tier Architecture\n4.Should Be Comfortable with HTML, JavaScript & Databases.\n5.Should have knowledge of AJAX.\n6.Understanding of Software development Lifecycle\n7.Work experience in programming for medium to large-scale projects.\n8.Advanced analytical and problem solving skills.\n9.Experience in leading team as well as working as individual contributor.",
                           @"1.Making Outbound Sales calls to prospective Customers primarily in USA & Europe.\n2.Online research on the prospect.\n3.Running outbound sales & marketing campaign on email and telephone for prospective Customers primarily in USA & Europe.\n4.Providing Live Chat / Email & Voice support to customers.\n\nCandidate should also: -\n1.Has to work in night shift.\n2.Should have experience in outbound voice process.\n3.Strong communication and interpersonal skills."
             ,nil];

    self.positionsArray=[NSArray arrayWithObjects:@"2",@"6",@"3",@"1", nil];
    [self.tableview setTableFooterView:[[UIView alloc] initWithFrame:CGRectZero]];
    _tableViewHeight.constant=44*[self.arrayOfJobs count];
    [self.tableview needsUpdateConstraints];
    CGPoint bottomOffset = CGPointMake(0, self.tableview.contentSize.height - self.tableview.bounds.size.height);
    [self.tableview setContentOffset:bottomOffset animated:YES];
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
    
    if(indexPath.row == 0)
    {
        [tableView
         selectRowAtIndexPath:indexPath
         animated:TRUE
         scrollPosition:UITableViewScrollPositionNone
         ];
        
        [[tableView delegate]
         tableView:tableView
         didSelectRowAtIndexPath:indexPath
         ];
        
    }

    
    return cell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    _labelExperience.text=[_experienceArray objectAtIndex:indexPath.row];
    _positionsLbl.text=[_positionsArray objectAtIndex:indexPath.row];
    _textView.text=[_descriptionArray objectAtIndex:indexPath.row];

     self.jobsString = [NSString stringWithFormat:@"%@",[_arrayOfJobs objectAtIndex:indexPath.row]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([[segue identifier] isEqualToString:@"JobPortalViewSegue"])
    {

            JobPortalViewController *jobPortalVC = [segue destinationViewController];

            jobPortalVC.jobLblValue=self.jobsString;
    }
}


- (IBAction)applyButtonPressed:(id)sender {
  
    [self performSegueWithIdentifier:@"JobPortalViewSegue" sender:self];

}
@end
