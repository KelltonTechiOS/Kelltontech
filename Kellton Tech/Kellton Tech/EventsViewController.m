//
//  EventsViewController.m
//  Kellton Tech
//
//  Created by Kellton Tech on 08/04/15.
//  Copyright (c) 2015 Kellton Tech. All rights reserved.
//

#import "EventsViewController.h"
#import "EventsCollectionViewCell.h"
#import "YearwiseEventTableViewCell.h"
#import "CelebrationsImageViewController.h"
#import "UploadPhotosViewController.h"

#define DocumentsDirectory [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject]
@interface EventsViewController () <UITableViewDataSource, UITableViewDelegate, UICollectionViewDataSource, UICollectionViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableview;
@property (strong, nonatomic) NSArray *arrayOfYears, *arrayOfTitles;
@property (strong, nonatomic) NSMutableArray *arrayOfImages;
@property (weak, nonatomic) IBOutlet UILabel *labelYear;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionview;
@property (strong, nonatomic) NSString *stringYear;
@property (weak, nonatomic) IBOutlet UIView *yearBackView;

@end

@implementation EventsViewController

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO];
    self.tabBarController.title=@"Events";

}

- (IBAction)yearDropdown:(id)sender {
    [self.tableview setHidden:NO];
    
    CGRect frame = self.tableview.frame;
    CGRect newframe = CGRectMake(frame.origin.x, frame.origin.y, frame.size.width, 0);
    self.tableview.frame = newframe;
    
    //    self.tableview.alpha = 0.0f;
    [UIView animateWithDuration:0.5f
                          delay:0.0f
                        options:UIViewAnimationOptionBeginFromCurrentState
                     animations:^{
                         self.tableview.frame = frame;
                         
                     }
                     completion:^(BOOL finished) {
                     }];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.arrayOfSelectImages=[[NSMutableArray alloc]initWithCapacity:0];
    self.arrayOfYears = [NSArray arrayWithObjects:@"2015",@"2014",@"2013", nil];
    self.arrayOfTitles = [NSArray arrayWithObjects:@"Ongoing Event 2015",@"FIFA July 2014",@"All Hands March 2014",@"Charity 2013", nil];
    self.arrayOfImages = [NSMutableArray arrayWithArray:self.arrayOfTitles];
    
    self.stringYear = [NSString string];
    

    [self.yearBackView.layer setCornerRadius:3.0f];
    [self.yearBackView.layer setMasksToBounds:NO];
    
    [self.yearBackView.layer setShadowColor:[UIColor blackColor].CGColor];
    [self.yearBackView.layer setShadowOffset:CGSizeMake(0, 0)];
    [self.yearBackView.layer setShadowOpacity:0.5f];
    [self.yearBackView.layer setShadowRadius:3.0f];
    self.tabBarController.title=@"Events";

    // Do any additional setup after loading the view.
}

-(UIColor*)colorWithHexString:(NSString*)hex
{
    NSString *cString = [[hex stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    // String should be 6 or 8 characters
    if ([cString length] < 6) return [UIColor grayColor];
    
    // strip 0X if it appears
    if ([cString hasPrefix:@"0X"]) cString = [cString substringFromIndex:2];
    
    if ([cString length] != 6) return  [UIColor grayColor];
    
    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    NSString *rString = [cString substringWithRange:range];
    
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 255.0f)
                           green:((float) g / 255.0f)
                            blue:((float) b / 255.0f)
                           alpha:1.0f];
}

- (IBAction)tapped:(UITapGestureRecognizer *)sender {
    
    UIView *viewControllerView = sender.view;
    CGPoint location           = [sender locationInView:viewControllerView];
    
    CGRect frame = self.tableview.frame;
    
    if (!CGRectContainsPoint(frame, location)) {
        
        [self.tableview setHidden:YES];
        
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
    } else if ([NSStringFromClass([touch.view class]) isEqualToString:@"UIView"]) {
        return NO;
    }
    return YES;
}

#pragma mark tableview data source

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView.tag == 1000) {
        return [self.arrayOfYears count];
    }       
    return 0;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView.tag == 1000) {
        UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
        
        if (cell == nil) {
            cell = (UITableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"cellIdentifier"];
        }
        
        cell.textLabel.text = self.arrayOfYears[indexPath.row];
        return cell;
    
    }
    return nil;
}

#pragma mark tableview delegate

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView.tag == 1000) {
       
        UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
        [self.labelYear setText:cell.textLabel.text];
        self.stringYear = cell.textLabel.text;
        
        if (self.labelYear.text.integerValue == 2014) {
            self.arrayOfTitles = [NSArray arrayWithObjects:@"FIFA July 2014",@"All Hands March 2014", nil];
            self.arrayOfImages = [NSMutableArray arrayWithArray:self.arrayOfTitles];
            [self.collectionview reloadData];
        
        } else if (self.labelYear.text.integerValue == 2013) {
            self.arrayOfTitles = [NSArray arrayWithObjects: @"Charity 2013",nil];
            self.arrayOfImages = [NSMutableArray arrayWithArray:self.arrayOfTitles];
            
            [self.collectionview reloadData];
        }
        else if (self.labelYear.text.integerValue == 2015) {
            self.arrayOfTitles = [NSArray arrayWithObjects:@"Ongoing Event 2015", nil];
           // self.arrayOfImages = [NSMutableArray arrayWithArray:self.arrayOfTitles];

            [self.collectionview reloadData];
            
        }
        
        
        //    NSLog(@"%@",cell.textLabel.text);
        [self.tableview setHidden:YES];
        
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.0f;
}
#pragma mark collectionview datasource

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [self.arrayOfTitles count];
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    EventsCollectionViewCell *cell = (EventsCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    
    if (cell == nil) {
       cell = (EventsCollectionViewCell*)[collectionView dequeueReusableCellWithReuseIdentifier:@"collectionCell" forIndexPath:indexPath];
    }
    [cell.imageViewLabel setText:[self.arrayOfTitles objectAtIndex:indexPath.row]];
   
    NSString *str = [self.arrayOfImages objectAtIndex:indexPath.row];
    [cell.imageViewCell setImage:[UIImage imageNamed:str]];
    
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    self.selectEvent = [NSString stringWithFormat:@"%@",[self.arrayOfTitles objectAtIndex:indexPath.row]];
    
     if ([self.labelYear.text isEqualToString:@"All"])
     {
         if (indexPath.row == 0) {
            // [self performSegueWithIdentifier:@"toUpload" sender:self];

         //   self.arrayOfSelectImages = [NSMutableArray arrayWithObjects:@"upload",@"upload", nil];
 
                 _EventDocumentPathString=[[[DocumentsDirectory stringByAppendingPathComponent:@"images"]stringByAppendingPathComponent:@"Events"]stringByAppendingPathComponent:self.selectEvent];
                 NSArray *itemsInFolder = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:_EventDocumentPathString error:NULL];

                 NSLog(@"%lu",(unsigned long)[itemsInFolder count]);
                 for (id object in itemsInFolder) {
                     
                     
                     [self.arrayOfSelectImages addObject:object];

             }
            self.buttonUploadShow = YES;
             [self performSegueWithIdentifier:@"toImages" sender:self];

         }
         if (indexPath.row == 1) {
             self.arrayOfSelectImages = [NSMutableArray arrayWithObjects:@"FIFA July 2014",@"FIFA2", nil];
             self.buttonUploadShow = NO;
             [self performSegueWithIdentifier:@"toImages" sender:self];

             
         } else if (indexPath.row == 2) {
             self.arrayOfSelectImages = [NSMutableArray arrayWithObjects:@"All Hands March 2014", @"All Hands2", nil];
             self.buttonUploadShow = NO;
             [self performSegueWithIdentifier:@"toImages" sender:self];

             
         } else if (indexPath.row == 3) {
             self.arrayOfSelectImages = [NSMutableArray arrayWithObjects:@"Charity 2013", @"Charity2", nil];
             self.buttonUploadShow = NO;
             [self performSegueWithIdentifier:@"toImages" sender:self];

         }
     }
   else if (self.labelYear.text.integerValue == 2014 ) {
        if (indexPath.row == 0) {
            self.arrayOfSelectImages = [NSMutableArray arrayWithObjects:@"FIFA July 2014",@"FIFA2", nil];
            self.buttonUploadShow = NO;
            [self performSegueWithIdentifier:@"toImages" sender:self];

            
        } else if (indexPath.row == 1) {
            self.arrayOfSelectImages = [NSMutableArray arrayWithObjects:@"All Hands March 2014", @"All Hands2", nil];
            self.buttonUploadShow = NO;
            [self performSegueWithIdentifier:@"toImages" sender:self];

        }
    
    }
    
    else if (self.labelYear.text.integerValue == 2013) {
        if (indexPath.row == 0) {
            self.arrayOfSelectImages = [NSMutableArray arrayWithObjects:@"Charity 2013",@"Charity2", nil];
            self.buttonUploadShow = NO;
            [self performSegueWithIdentifier:@"toImages" sender:self];


        }
    }
    else if (self.labelYear.text.integerValue == 2015) {
        if (indexPath.row == 0) {
           // self.arrayOfSelectImages = [NSMutableArray arrayWithObjects:@"upload",@"upload", nil];
            
            _EventDocumentPathString=[[[DocumentsDirectory stringByAppendingPathComponent:@"images"]stringByAppendingPathComponent:@"Events"]stringByAppendingPathComponent:self.selectEvent];
            NSArray *itemsInFolder = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:_EventDocumentPathString error:NULL];
            
            NSLog(@"%lu",(unsigned long)[itemsInFolder count]);
            for (id object in itemsInFolder) {
                
                
                [self.arrayOfSelectImages addObject:object];
                
            }
            
            self.buttonUploadShow = YES;
            [self performSegueWithIdentifier:@"toImages" sender:self];

           // [self performSegueWithIdentifier:@"toUpload" sender:self];

        }
    }
    
    
    [self.tableview setHidden:YES];
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"toImages"]) {
        if ([[segue destinationViewController] isKindOfClass:[CelebrationsImageViewController class]]) {
            CelebrationsImageViewController *CIVC = (CelebrationsImageViewController*)segue.destinationViewController;
            CIVC.selectedCelebration = self.selectEvent;
            CIVC.arrayOfSelectedImages = self.arrayOfSelectImages;
            CIVC.buttonShowUpload = self.buttonUploadShow;
            CIVC.OccasionString=self.EventDocumentPathString;
            CIVC.occasionSelectedString=@"Events";
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
