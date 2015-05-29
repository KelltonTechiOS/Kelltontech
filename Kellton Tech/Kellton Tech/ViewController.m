//
//  ViewController.m
//  Kellton Tech
//
//  Created by Kellton Tech on 07/04/15.
//  Copyright (c) 2015 Kellton Tech. All rights reserved.
//

#import "ViewController.h"
#import "MainViewCollectionCell.h"
@interface ViewController ()
{
    CGRect defaultFrame;
    BOOL onlyOnce;
}
@property (weak, nonatomic) IBOutlet UIButton *buttonJobPortal;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    onlyOnce = NO;
    
    defaultFrame = self.swipeView.frame;
    [self.buttonJobPortal.layer setMasksToBounds:NO];
    [self.buttonJobPortal.layer setCornerRadius:4.0f];
    
    [self.buttonJobPortal setBackgroundColor:[self colorWithHexString:@"1E90FF"]];
    
    [self.buttonJobPortal.layer setShadowColor:[UIColor blackColor].CGColor];
    [self.buttonJobPortal.layer setShadowOffset:CGSizeMake(2, 2)];
    [self.buttonJobPortal.layer setShadowOpacity:0.5f];
    [self.buttonJobPortal.layer setShadowRadius:2.0f];

    [self.swipeUpBtn.layer setMasksToBounds:NO];
    [self.swipeUpBtn.layer setCornerRadius:4.0f];
    
    [self.swipeUpBtn.layer setShadowColor:[UIColor blackColor].CGColor];
    [self.swipeUpBtn.layer setShadowOffset:CGSizeMake(2, 2)];
    [self.swipeUpBtn.layer setShadowOpacity:0.5f];
    [self.swipeUpBtn.layer setShadowRadius:2.0f];

//    [self.buttonJobPortal.layer setBorderColor:[self colorWithHexString:@"1E90FF"].CGColor];
//    [self.buttonJobPortal.layer setBorderWidth:1.0f];
    
    // Do any additional setup after loading the view, typically from a nib.
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
 - (void) viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBarHidden = YES;
    [self animateSwipeBtn];
}
- (void) animateSwipeBtn
{
    UISwipeGestureRecognizer *swipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self
                                                                                action:@selector(handleSwipe:)];
    swipe.direction = UISwipeGestureRecognizerDirectionUp;
    [_swipeUpBtn addGestureRecognizer:swipe];
    
//    [UIView animateWithDuration:1.5f
//                          delay:0.0f
//                        options:UIViewAnimationOptionCurveEaseInOut |
//     UIViewAnimationOptionRepeat |
//     UIViewAnimationOptionAutoreverse |
//     UIViewAnimationOptionAllowUserInteraction
//                     animations:^{
//                         self.swipeUpBtn.alpha = 0.5f;
//                     }
//                     completion:^(BOOL finished){
//                         // Do nothing
//                     }];
}
#pragma UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 6;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"CollectionViewCell";
    MainViewCollectionCell *cell;
        cell = (MainViewCollectionCell*)[collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    
    [cell.labelText setBackgroundColor:[UIColor clearColor]];
    [cell.labelText.layer setBorderWidth:1.5f];
    [cell.labelText.layer setBorderColor:[self colorWithHexString:@"1E90FF"].CGColor];

    [cell.cellBackView.layer setShadowColor:[UIColor blackColor].CGColor];
    [cell.cellBackView.layer setShadowOffset:CGSizeMake(1, 1)];
    [cell.cellBackView.layer setShadowOpacity:0.5f];
    [cell.cellBackView.layer setShadowRadius:3.0f];
   
    [cell.cellBackView.layer setCornerRadius:5.0f];
    [cell.cellBackView.layer setMasksToBounds:NO];

    [cell.labelText.layer setCornerRadius:5.0f];
    [cell.labelText.layer setMasksToBounds:NO];
    
    
    
    //    [cell.backgroundView]
    
    if (indexPath.row == 0)
    {
        cell.labelText.text = @"Services";
    }
    if (indexPath.row == 1)
    {
        cell.labelText.text = @"InMedia";
    }
    if (indexPath.row == 2)
    {
        cell.labelText.text = @"@ Kelltontech";
    }
    if (indexPath.row == 3)
    {
        cell.labelText.text = @"Meet Kelltonites";
    }
    if (indexPath.row == 4)
    {
        cell.labelText.text = @"Newsletter";
    }
    if (indexPath.row == 5)
    {
        cell.labelText.text = @"Events & Celebrations";
    }
    return cell;
}

#pragma UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 5) {
        [self performSegueWithIdentifier:@"MainViewToTabView" sender:self];

    } else {
          [[[UIAlertView alloc] initWithTitle:@"Info" message:@"Coming soon" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil] show];
    }
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{

}

- (IBAction)jobPortalTouched:(id)sender {
//    [self performSegueWithIdentifier:@"MainViewToJobPortal" sender:nil];
}

- (IBAction)contactUsTapped:(id)sender {
    [self handleSwipe:sender];
}

- (void) handleSwipe:(id)sender
{
    self.swipeView.hidden = NO;

    CGRect frame = defaultFrame;
//    if (!onlyOnce) {
//        onlyOnce = YES;
//        defaultFrame = frame;
//    }
//    else
//    {
//        frame = defaultFrame;
//    }
    self.swipeView.frame = CGRectMake(defaultFrame.origin.x, _swipeView.frame.origin.y+_swipeView.frame.size.height, _swipeView.frame.size.width, _swipeView.frame.size.height);
    [UIView animateWithDuration:0.8f
                          delay:0.0f
                        options: UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         self.swipeView.frame = frame;
                     }
                     completion:^(BOOL finished){
                         [self.swipeUpBtn setHidden:YES];
                         [self.swipeDownBtn setHidden:NO];

                     }];
    [self refreshUI];
    [self animateSwipeBtnDown];
}
- (void)refreshUI
{
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
    [UIView setAnimationDuration:0.5f];
    [UIView commitAnimations];
    
}

- (void) animateSwipeBtnDown
{
    UISwipeGestureRecognizer *swipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self
                                                                                action:@selector(handleDown:)];
    swipe.direction = UISwipeGestureRecognizerDirectionDown;
    [_swipeDownBtn addGestureRecognizer:swipe];
    
    [UIView animateWithDuration:1.f
                          delay:0.0f
                        options:UIViewAnimationOptionCurveEaseInOut |
     UIViewAnimationOptionRepeat |
     UIViewAnimationOptionAutoreverse |
     UIViewAnimationOptionAllowUserInteraction
                     animations:^{
                         self.swipeDownBtn.alpha = 0.5f;
                     }
                     completion:^(BOOL finished){
                         // Do nothing
                     }];
}

- (void) handleDown:(id)sender
{
    self.swipeDownBtn.hidden = YES;

    CGRect frame = CGRectMake(defaultFrame.origin.x, _swipeView.frame.origin.y+_swipeView.frame.size.height, _swipeView.frame.size.width, _swipeView.frame.size.height);

    self.swipeView.frame = self.swipeView.frame;
    [UIView animateWithDuration:0.8
                          delay:0
                        options: UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         self.swipeView.frame = frame;
                     }
                     completion:^(BOOL finished){
                         self.swipeView.hidden = YES;
                         [self.swipeUpBtn setHidden:NO];

                     }];
    [self refreshUI];
    [self animateSwipeBtn];
}
@end
