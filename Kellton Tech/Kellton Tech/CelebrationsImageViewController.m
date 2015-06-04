//
//  CelebrationsImageViewController.m
//  Kellton Tech
//
//  Created by KELLTONTECH on 14/04/15.
//  Copyright (c) 2015 Kellton Tech. All rights reserved.
//

#import "CelebrationsImageViewController.h"
#import "CelebrationsImageCollectionViewCell.h"
#import "UploadPhotosViewController.h"
#define DocumentsDirectory [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject]
@interface CelebrationsImageViewController () <UICollectionViewDataSource, UICollectionViewDelegate, UIActionSheetDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate>
{
    UIView *backView;
    NSString *str;
}
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionview;
@property (weak, nonatomic) IBOutlet UIButton *buttonUpload;

@end

@implementation CelebrationsImageViewController

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"%@",self.arrayOfSelectedImages);
    [self.titleLabel setText:self.selectedCelebration];
    [self.buttonUpload.layer setCornerRadius:3.0f];
    [self.buttonUpload.layer setMasksToBounds:NO];
        
    if (self.buttonShowUpload == NO) {
        [self.buttonUpload setHidden:YES];
    
    } else {
        [self.buttonUpload setHidden:NO];
    }

//    NSTimeZone *timeZone = [NSTimeZone systemTimeZone];
//    NSDateFormatter *dateFormatter = [NSDateFormatter new];
//    [dateFormatter setTimeZone:timeZone];
//    [dateFormatter setDateFormat:@"HH"];
//    
//    NSDateFormatter *dateFormatter2 = [NSDateFormatter new];
//    [dateFormatter2 setTimeZone:timeZone];
//    [dateFormatter2 setDateFormat:@"mm"];
//    
//    NSDate *currentDate = [NSDate date];
//    NSString *date = [dateFormatter stringFromDate:currentDate];
//    NSString *minutes = [dateFormatter2 stringFromDate:currentDate];
//    int Date = (int)date.integerValue;
//    int min = (int)minutes.integerValue;
//
//    if (Date >= 12 && Date <= 15) {
//        
//    }
    /*
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"hh:mm:ss aa"];
    
    
    NSDate *dateOne=[dateFormat dateFromString:@"12:00:00 PM" ];
    NSDate *dateTwo = [NSDate date];
    SEL action = @selector(showAlert);
    switch ([dateOne compare:dateTwo]){
        case NSOrderedAscending:
        {
            NSDate *dateThree=[dateFormat dateFromString:@"3:00:00 PM" ];
            switch ([dateTwo compare:dateThree])
            {
                case NSOrderedAscending:
                    break;
                case NSOrderedSame:
                    action = @selector(uploadBtnAction);
                    break;
                case NSOrderedDescending:
                    action = @selector(uploadBtnAction);
                    //NSLog(@"NSOrderedDescending");
                    break;
                    
            }
            NSLog(@"date is %@",dateTwo);
        }
            break;
        case NSOrderedSame:
            action = @selector(uploadBtnAction);
            break;
        case NSOrderedDescending:
            //NSLog(@"NSOrderedDescending");
            break;
    }
    [self.buttonUpload addTarget:self action:action forControlEvents:UIControlEventTouchUpInside]; */
    
    // Do any additional setup after loading the view.
}
/*
- (void) showAlert
{
    [[[UIAlertView alloc] initWithTitle:@"Info" message:@"Action can be performed in between time 12 - 3 PM" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil] show];
}
- (void) uploadBtnAction
{
//    [[[UIAlertView alloc] initWithTitle:@"Info" message:@"Coming Soon" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil] show];
    [self performSegueWithIdentifier:@"UploadToLoginVC" sender:nil];
    
}*/

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    UIView *touchedView = [touch view];
    
    if (touchedView == backView) {
        UIImageView *imageView = (UIImageView*)[self.view viewWithTag:2222];
        
        [UIView animateWithDuration:0.3f
                              delay:0.0f
                            options:UIViewAnimationOptionBeginFromCurrentState
                         animations:^{
                             [backView setBackgroundColor:[UIColor clearColor]];
                             [imageView setAlpha:0.0f];
                             [imageView removeFromSuperview];
                         }
                         completion:^(BOOL finished) {
                             [backView removeFromSuperview];
                         }];
    }
}

#pragma mark collectionview datasouce

-(NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [self.arrayOfSelectedImages count];
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CelebrationsImageCollectionViewCell *cell = (CelebrationsImageCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    
    if (cell == nil) {
        cell = (CelebrationsImageCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"cellID2" forIndexPath:indexPath];
    }
    
    

    if ([_selectedCelebration isEqualToString:@"Ongoing Event 2015"]||[_selectedCelebration isEqualToString:@"Ongoing Celebration 2015"]) {
        
        [cell.imageViewCell setImage:[UIImage imageWithContentsOfFile:[_OccasionString stringByAppendingPathComponent:[self.arrayOfSelectedImages objectAtIndex:indexPath.row]]]];
        

    }
    
    else
    {

    str = [NSString stringWithFormat:@"%@",[self.arrayOfSelectedImages objectAtIndex:indexPath.row]];
    
    
  [cell.imageViewCell setImage:[UIImage imageNamed:str]];
    
    }
    
    
    
//    NSArray *navigationArray=[self.navigationController viewControllers];
//    for (id tabbar in navigationArray)
//    {
//        if ([tabbar isKindOfClass:[UITabBarController class]])
//        {
//            UITabBarController *tabs=tabbar;
//            if (tabs.tabBar.selectedItem.tag ==0)
//            {
// [cell.imageViewCell setImage:[UIImage imageWithContentsOfFile:[_eventString stringByAppendingPathComponent:[self.arrayOfSelectedImages objectAtIndex:indexPath.row]]]];
//            }
//            
//            else
//            {
//             [cell.imageViewCell setImage:[UIImage imageWithContentsOfFile:[_celebrationString stringByAppendingPathComponent:[self.arrayOfSelectedImages objectAtIndex:indexPath.row]]]];
//            }
//        }
//    }
   
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    backView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [backView setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:backView];

    [UIView animateWithDuration:0.5f
                          delay:0.0f
                        options:UIViewAnimationOptionBeginFromCurrentState
                     animations:^{
                         [backView setBackgroundColor:[UIColor colorWithWhite:0.5f alpha:0.5f]];
                     }
                     completion:^(BOOL finished) {

                     }];
    UIImageView *view = [[UIImageView alloc] initWithFrame:CGRectMake(backView.frame.origin.x+(backView.frame.size.width/4), backView.frame.origin.y+(backView.frame.size.height/4), backView.frame.size.width/2 , backView.frame.size.height/2)];
    
    if ([_selectedCelebration isEqualToString:@"Ongoing Event 2015"]||[_selectedCelebration isEqualToString:@"Ongoing Celebration 2015"]) {
        
        view.image  =[UIImage imageWithContentsOfFile:[_OccasionString stringByAppendingPathComponent:[self.arrayOfSelectedImages objectAtIndex:indexPath.row]]];
        
    }
    
    else
    {
        
        str = [NSString stringWithFormat:@"%@",[self.arrayOfSelectedImages objectAtIndex:indexPath.row]];
        
        
        view.image  =[UIImage imageNamed:str];
        
    }

    
    //_str = [NSString stringWithFormat:@"%@",[self.arrayOfSelectedImages objectAtIndex:indexPath.row]];
    
    
    //view.image = [UIImage imageNamed:_str];
    view.tag = 2222;

    [view.layer setBorderWidth:2.0f];
    [view.layer setBorderColor:[UIColor blackColor].CGColor];
    [backView addSubview:view];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([[segue destinationViewController] isKindOfClass:[UploadPhotosViewController class]]) {
        
        UploadPhotosViewController *uploadVC = (UploadPhotosViewController *)[segue destinationViewController];
    uploadVC.selectedCelebration = self.occasionSelectedString;
    }
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

@end
