//
//  CelebrationsViewController.m
//  Kellton Tech
//
//  Created by Kellton Tech on 08/04/15.
//  Copyright (c) 2015 Kellton Tech. All rights reserved.
//

#import "CelebrationsViewController.h"
#import "YearwiseEventTableViewCell.h"
#import "CelebrationsImageViewController.h"
#define DocumentsDirectory [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject]
@interface CelebrationsViewController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableview;
@property (nonatomic, strong) NSArray *arrayOfCelebrations;
@property (strong, nonatomic) NSArray *arrayOfImages;
@property (weak, nonatomic) IBOutlet UITableView *tableViewYear;
@property (strong, nonatomic) NSArray *arrayOfYears;
@property (weak, nonatomic) IBOutlet UILabel *labelYear;
@property (weak, nonatomic) IBOutlet UIView *yearBackView;

@end

@implementation CelebrationsViewController

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO];
    self.tabBarController.title=@"Celebrations";

}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.arrayOfSelectImages=[[NSMutableArray alloc]initWithCapacity:0];

    self.arrayOfCelebrations = [NSArray arrayWithObjects:@"Ongoing Celebration 2015",@"Diwali Celebrations 2014",@"Independence Day Celebrations 2014",@"Holi 2014",@"Christmas 2013", nil];
    self.arrayOfImages = [NSArray arrayWithObjects:@"upload",@"Diwali2",@"Independence Day2",@"Holi2",@"Christmas2", nil];
    
    self.arrayOfYears = [NSArray arrayWithObjects:@"2015",@"2014",@"2013", nil];
    
    [self.tableview setSeparatorColor:[UIColor clearColor]];

    self.tableview.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
    self.tableview.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, self.tableview.bounds.size.width, 0.01f)];
    
    [self.yearBackView.layer setCornerRadius:3.0f];
    [self.yearBackView.layer setMasksToBounds:NO];
    
    [self.yearBackView.layer setShadowColor:[UIColor blackColor].CGColor];
    [self.yearBackView.layer setShadowOffset:CGSizeMake(0, 0)];
    [self.yearBackView.layer setShadowOpacity:0.5f];
    [self.yearBackView.layer setShadowRadius:3.0f];
    self.tabBarController.title=@"Celebrations";
//    self.buttonUploadShow = YES;

//     Do any additional setup after loading the view.
}
- (IBAction)tapped:(UITapGestureRecognizer *)sender {
    
    UIView *viewControllerView = sender.view;
    CGPoint location           = [sender locationInView:viewControllerView];
    
    CGRect frame = self.tableViewYear.frame;
    
    if (!CGRectContainsPoint(frame, location)) {
        
        [self.tableViewYear setHidden:YES];
        
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


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView == self.tableview) {
        return [self.arrayOfCelebrations count];
        
    }
    
    if (tableView.tag == 2000) {
        return [self.arrayOfYears count];
    }
    return 0;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == self.tableview) {
        
        YearwiseEventTableViewCell *cell = (YearwiseEventTableViewCell *)[tableView cellForRowAtIndexPath:indexPath];
        if (cell == nil) {
            cell = (YearwiseEventTableViewCell *)[[[NSBundle mainBundle] loadNibNamed:@"YearwiseEventTableViewCell" owner:self options:nil] objectAtIndex:0];
        }
        
        [cell.imageView1 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@", self.arrayOfCelebrations[indexPath.row]]]];
        [cell.imageView2 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@", self.arrayOfImages[indexPath.row]]]];
        
        [cell.labelYear setText:self.arrayOfCelebrations[indexPath.row]];
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        
        return cell;

    }
    
    if (tableView.tag == 2000) {
        
        UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
        if (cell == nil) {
            cell = (UITableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"yearCell"];
        }
        cell.textLabel.text = self.arrayOfYears[indexPath.row];
        return cell;
    }
    return nil;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.0f;
}

-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == self.tableview) {
        return 96.0f;
    }
    
    if (tableView.tag == 2000) {
        return 28.0f;
    }
    return 0;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == self.tableview) {
        
        self.selectCelebration = [NSString stringWithFormat:@"%@", self.arrayOfCelebrations[indexPath.row]];

        if ([self.labelYear.text isEqualToString:@"2013"]) {
            if (indexPath.row == 0) {
                self.arrayOfSelectImages = [NSMutableArray arrayWithObjects:@"Christmas 2013",@"Christmas2", nil];
                self.buttonUploadShow = NO;

            }
            
        }
        else if ([self.labelYear.text isEqualToString:@"2014"]) {
            if (indexPath.row == 0) {
                self.arrayOfSelectImages = [NSMutableArray arrayWithObjects:@"Diwali Celebrations 2014", @"Diwali2",@"Diwali3",@"Diwali4", nil];
                self.buttonUploadShow = NO;

                
            } else if (indexPath.row == 1) {
                self.arrayOfSelectImages = [NSMutableArray arrayWithObjects:@"Independence Day Celebrations 2014", @"Independence Day2", nil];
                self.buttonUploadShow = NO;

                
            } else if (indexPath.row == 2) {
                self.arrayOfSelectImages = [NSMutableArray arrayWithObjects:@"Holi 2014", @"Holi2", nil];
                self.buttonUploadShow = NO;

                
            } else if (indexPath.row == 3) {
                self.arrayOfSelectImages = [NSMutableArray arrayWithObjects:@"Christmas 2013",@"Christmas2", nil];
                self.buttonUploadShow = NO;

            }

        }
        
       else if ([self.labelYear.text isEqualToString:@"2015"]) {
            if (indexPath.row == 0) {
         //     self.arrayOfSelectImages = [NSMutableArray arrayWithObjects:@"upload", nil];
                //[self performSegueWithIdentifier:@"ToUpload" sender:self];
                _celebrationDocumentPathString=[[[DocumentsDirectory stringByAppendingPathComponent:@"images"]stringByAppendingPathComponent:@"Celebrations"]stringByAppendingPathComponent:self.selectCelebration];
                NSArray *itemsInFolder = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:_celebrationDocumentPathString error:NULL];
                
                NSLog(@"%lu",(unsigned long)[itemsInFolder count]);
                [self.arrayOfSelectImages removeAllObjects];
                
                for (id object in itemsInFolder) {
                    
                    
                    [self.arrayOfSelectImages addObject:object];
                    
                    

           
                self.buttonUploadShow = YES;
           
            }
            }
        }
        else
        {
            if (indexPath.row == 0) {
     //      self.arrayOfSelectImages = [NSMutableArray arrayWithObjects:@"upload", nil];
//                [self performSegueWithIdentifier:@"ToUpload" sender:self];
                self.buttonUploadShow = YES;
                _celebrationDocumentPathString=[[[DocumentsDirectory stringByAppendingPathComponent:@"images"]stringByAppendingPathComponent:@"Celebrations"]stringByAppendingPathComponent:self.selectCelebration];
                NSArray *itemsInFolder = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:_celebrationDocumentPathString error:NULL];
                
                NSLog(@"%lu",(unsigned long)[itemsInFolder count]);
                [self.arrayOfSelectImages removeAllObjects];

                for (id object in itemsInFolder) {
                    
                    
                    [self.arrayOfSelectImages addObject:object];
                    
                    
                    
                    self.buttonUploadShow = YES;
                }
            


            }
            else if (indexPath.row == 1) {
                self.arrayOfSelectImages = [NSMutableArray arrayWithObjects:@"Diwali Celebrations 2014", @"Diwali2",@"Diwali3",@"Diwali4", nil];
                self.buttonUploadShow = NO;


                
            } else if (indexPath.row == 2) {
                self.arrayOfSelectImages = [NSMutableArray arrayWithObjects:@"Independence Day Celebrations 2014", @"Independence Day2", nil];
                self.buttonUploadShow = NO;


                
            } else if (indexPath.row == 3) {
                self.arrayOfSelectImages = [NSMutableArray arrayWithObjects:@"Holi 2014", @"Holi2", nil];
                self.buttonUploadShow = NO;


                
            } else if (indexPath.row == 4) {
                self.arrayOfSelectImages = [NSMutableArray arrayWithObjects:@"Christmas 2013",@"Christmas2", nil];
                self.buttonUploadShow = NO;


            }
            
        }
        [self performSegueWithIdentifier:@"toCelebImages" sender:self];

    }
    
    if (tableView.tag == 2000) {
        [self.labelYear setText:self.arrayOfYears[indexPath.row]];
        
//        if ([self.labelYear.text isEqualToString:@"2014"] || [self.labelYear.text isEqualToString:@"All"]) {
        
            if ([self.labelYear.text isEqualToString:@"2014"])
                {

            self.arrayOfCelebrations = [NSArray arrayWithObjects:@"Diwali Celebrations 2014",@"Independence Day Celebrations 2014",@"Holi 2014", nil];
            self.arrayOfImages = [NSArray arrayWithObjects:@"Diwali2",@"Independence Day2",@"Holi2", nil];

            
        } else if ([self.labelYear.text isEqualToString:@"2013"]) {
            self.arrayOfCelebrations = [NSArray arrayWithObjects:@"Christmas 2013", nil];
            self.arrayOfImages = [NSArray arrayWithObjects:@"Christmas2", nil];
        }
        else if([self.labelYear.text isEqualToString:@"2015"]) {
            self.arrayOfCelebrations = [NSArray arrayWithObjects:@"Ongoing Celebration 2015", nil];

           self.arrayOfImages = [NSArray arrayWithObjects:@"upload", nil];

        }

        [self.tableview reloadData];
        [self.tableViewYear setHidden:YES];
    }
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"toCelebImages"]) {
        
        if ([[segue destinationViewController] isKindOfClass:[CelebrationsImageViewController class]]) {
            
            CelebrationsImageViewController *CIVC = (CelebrationsImageViewController *)segue.destinationViewController;
            CIVC.selectedCelebration = self.selectCelebration;
            CIVC.arrayOfSelectedImages = self.arrayOfSelectImages;
            CIVC.buttonShowUpload = self.buttonUploadShow;
            CIVC.OccasionString=_celebrationDocumentPathString;
            CIVC.occasionSelectedString = @"Celebrations";
        }
    }
}

- (IBAction)showYearTableView:(id)sender {
    [self.tableViewYear setHidden:NO];
    
    CGRect frame = self.tableViewYear.frame;
    CGRect newframe = CGRectMake(frame.origin.x, frame.origin.y, frame.size.width, 0);
    self.tableViewYear.frame = newframe;
    
    [UIView animateWithDuration:0.5f
                          delay:0.0f
                        options:UIViewAnimationOptionBeginFromCurrentState
                     animations:^{
                         self.tableViewYear.frame = frame;
                         
                     }
                     completion:^(BOOL finished) {
                     }];

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
