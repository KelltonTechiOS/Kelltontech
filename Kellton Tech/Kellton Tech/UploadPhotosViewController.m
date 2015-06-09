//
//  UploadPhotosViewController.m
//  Kellton Tech
//
//  Created by KELLTONTECH on 15/04/15.
//  Copyright (c) 2015 Kellton Tech. All rights reserved.
//

#import "UploadPhotosViewController.h"
#import "EventsViewController.h"
#import "CelebrationsViewController.h"
#import "LoginViewController.h"

#define DocumentsDirectory [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject]

@interface UploadPhotosViewController ()<UIActionSheetDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UIImagePickerController *imagePicker;
@property (weak, nonatomic) IBOutlet UILabel *labelCode;
@property (weak, nonatomic) IBOutlet UITextView *commentsTextView;
@property (weak, nonatomic) IBOutlet UIButton *buttonUpload;
@property (weak, nonatomic) IBOutlet UIButton *buttonAddPhoto;

@property (weak, nonatomic) IBOutlet UITableView *tableview;
@property (weak, nonatomic) IBOutlet UIImageView *userimageIMGVIEW;
@end

@implementation UploadPhotosViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self.labelCode setText:self.particularOccassion];
    
    [self.commentsTextView.layer setBorderWidth:0.5f];
    [self.commentsTextView.layer setBorderColor:[UIColor grayColor].CGColor];
    
    [self.buttonUpload.layer setMasksToBounds:NO];
    [self.buttonUpload.layer setCornerRadius:2.0f];
    
    [self.buttonAddPhoto.layer setMasksToBounds:NO];
    [self.buttonAddPhoto.layer setCornerRadius:2.0f];
    
    [self.tableview setTableFooterView:[[UIView alloc] initWithFrame:CGRectZero]];

    // Do any additional setup after loading the view.
}


- (IBAction)upload:(id)sender {
       
//        NSUserDefaults * userDefaults = [NSUserDefaults standardUserDefaults];
//        
//        if (([userDefaults objectForKey:@"imagepath"] == nil) || ([[userDefaults objectForKey:@"imagepath"] isEqualToString:@""])|| ([[userDefaults objectForKey:@"imagepath"] isKindOfClass:[NSNull class]]))
//        {
//            
//        }
//        else
//        {
//            NSFileManager *fileManager = [[NSFileManager alloc] init];
//            [fileManager removeItemAtPath:[DocumentsDirectory stringByAppendingPathComponent:[userDefaults objectForKey:@"imagepath"]] error:NULL];
//        }
    
    
        NSDate *now = [NSDate date];
    NSDateFormatter *format=[[NSDateFormatter alloc]init];
    [format setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss"];

        NSString *caldate = [format stringFromDate:now];
          NSString *imagesPath=[DocumentsDirectory stringByAppendingPathComponent:@"images"];
    
    NSFileManager *fileManager=[NSFileManager defaultManager];
    

    NSString *selectedCode=self.labelCode.text;

    if (_selectedCelebration)
    {

            
            if (![fileManager fileExistsAtPath:[[imagesPath stringByAppendingPathComponent:_selectedCelebration] stringByAppendingPathComponent:selectedCode]])
            {
                
                [fileManager createDirectoryAtPath:[[imagesPath stringByAppendingPathComponent:_selectedCelebration] stringByAppendingPathComponent:selectedCode] withIntermediateDirectories:YES attributes:nil error:nil];
            }
    }
    
    NSString *filePath= [NSString stringWithFormat:@"%@.png",caldate];
    
    _stringForFilePath=[[[imagesPath stringByAppendingPathComponent:_selectedCelebration]stringByAppendingPathComponent:selectedCode] stringByAppendingPathComponent:filePath];


    
    NSData * dataImage = UIImagePNGRepresentation(self.userimageIMGVIEW.image);
    
    
        [dataImage writeToFile: _stringForFilePath atomically:YES];
        
//        //[userDefaults setValue:urlstring forKey:@"imagepath"];
    NSLog(@"%@",_stringForFilePath);
    
//        [self performSegueWithIdentifier:@"toLogin" sender:self];
}

-(BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender
{
    if ([identifier isEqualToString:@"toLogin"]) {
        
        if (self.userimageIMGVIEW.image == nil) {
            
            [[[UIAlertView alloc] initWithTitle:@"Warning!" message:@"No images selected..." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil] show];
            return NO;
        }
        return YES;
    }
    return NO;
}

- (IBAction)addPhoto:(id)sender {
    
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"SOURCE" delegate:self cancelButtonTitle:@"cancel" destructiveButtonTitle:nil otherButtonTitles:@"Camera", @"Photo Library", nil];
    [actionSheet showInView:self.view];
}

- (IBAction)showingTableView:(id)sender {
   
    [self.tableview setHidden:NO];
   
    CGRect frame = self.tableview.frame;
    CGRect newframe = CGRectMake(frame.origin.x, frame.origin.y, frame.size.width, 0);
    self.tableview.frame = newframe;
    
    [UIView animateWithDuration:0.5f
                          delay:0.0f
                        options:UIViewAnimationOptionBeginFromCurrentState
                     animations:^{
                         self.tableview.frame = frame;
                         
                     }
                     completion:^(BOOL finished) {
                     }];

}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    UIView *touchedView = [touch view];
    
    if (touchedView != self.tableview) {
        [self.tableview setHidden:YES];
    }
    [self.commentsTextView resignFirstResponder];
}

#pragma mark table view data source

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
  
    return 4;
}



-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
//    eventCellID
    
    if (cell == nil) {
        cell = (UITableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"eventCellID"];
    }
    [cell.textLabel setFont:[UIFont fontWithName:@"Helvetica" size:14.0f]];
    
    
    NSArray *navigationArray=[self.navigationController viewControllers];
    for (id tabbar in navigationArray)
    {
        if ([tabbar isKindOfClass:[UITabBarController class]])
        {
            UITabBarController *tabs=tabbar;
            if (tabs.tabBar.selectedItem.tag ==0)
            {
                
                switch (indexPath.row) {
                        
                    case 0: [cell.textLabel setText:@"Govt Trust June 2015"];
                        break;
                    case 1: [cell.textLabel setText:@"FIFA July 2015"];
                        break;
                        
                    case 2: [cell.textLabel setText:@"Nasscom 2014"];
                        break;
                        
                    case 3: [cell.textLabel setText:@"Charity 2013"];
                        break;
                        
                    default:
                        break;
                
                }
            }
            
            else
            {
                switch (indexPath.row)
                {
                    case 0: [cell.textLabel setText:@"Holi 2015"];
                        break;
                        
                    case 1: [cell.textLabel setText:@"Independence Day Celebrations 2015"];
                        break;
                    case 2: [cell.textLabel setText:@"Diwali Celebrations 2014"];
                        break;

                    case 3: [cell.textLabel setText:@"Christmas 2013"];
                        break;
                        
                        default:
                        break;

                        
            
                }
            }
    }
    
    }

    return cell;
}

#pragma mark table view delegate 

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
        return @"";
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    [self.labelCode setText:cell.textLabel.text];
    [self.tableview setHidden:YES];
    
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([[segue identifier] isEqualToString:@"toLogin"]) {
        
        if ([[segue destinationViewController] isKindOfClass:[LoginViewController class]]) {
            
            LoginViewController *loginVC = (LoginViewController *)segue.destinationViewController;
            loginVC.selectedOcassion=self.selectedCelebration;
}
    }
}
#pragma mark capturing image

-(void)fixLiveCameraOrientation

{
    CGFloat scaleFactor = 1.3f;
    if ([UIDevice currentDevice].orientation == 4)
    {
        _imagePicker.cameraViewTransform = CGAffineTransformScale(CGAffineTransformMakeRotation(M_PI * 90 / 180.0), scaleFactor, scaleFactor);
    
    } else if ([UIDevice currentDevice].orientation == 3) {
        
        _imagePicker.cameraViewTransform = CGAffineTransformScale(CGAffineTransformMakeRotation(M_PI * -90 / 180.0), scaleFactor, scaleFactor);
    }
}

- (void)actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex

{
    if (buttonIndex==actionSheet.cancelButtonIndex)
    {
        [actionSheet dismissWithClickedButtonIndex:actionSheet.cancelButtonIndex animated:YES];
   
    } else if(buttonIndex==0) {
        
        if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
        {
            _imagePicker = [[UIImagePickerController alloc] init];
            
            _imagePicker.delegate = self;
            
            _imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
            
            _imagePicker.wantsFullScreenLayout = NO;
            
            _imagePicker.allowsEditing = NO;
 
            if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)
            {
                [[_imagePicker navigationBar] setTintColor:[UIColor whiteColor]];
                
            }

            //Add notification for camera live feed rotation of 180 degrees
            
            [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(fixLiveCameraOrientation) name:UIDeviceOrientationDidChangeNotification object:nil];

            //Begin fix to ensure live camera feed is initially shown in correct orientation
            
            CGFloat scaleFactor = 1.3f;
  
            switch ([UIApplication sharedApplication].statusBarOrientation)
            {
                case UIInterfaceOrientationLandscapeLeft:
                {
                    _imagePicker.cameraViewTransform = CGAffineTransformScale(CGAffineTransformMakeRotation(M_PI * 90 / 180.0), scaleFactor, scaleFactor);
                    break;
                }
                case UIInterfaceOrientationLandscapeRight:
                {
                    _imagePicker.cameraViewTransform = CGAffineTransformScale(CGAffineTransformMakeRotation(M_PI * -90 / 180.0), scaleFactor, scaleFactor);
                    break;
                }
                    
                default:
                    break;
            }
            
            [self presentViewController:_imagePicker animated:YES completion:nil];

            //End orientation fix for camera live feed
        
        } else {
            
                UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Information" message:@"CAMERA_NOT_AVAILABLE" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
                
                [alert show];
        }
    }
    
    else if(buttonIndex == 1)
        
    {
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        
        picker.delegate = self;
        
        picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        
        picker.wantsFullScreenLayout = YES;
        
        picker.allowsEditing = NO;
        
        [self presentViewController:picker animated:YES completion:nil];
    }
    
}

- (void)willPresentActionSheet:(UIActionSheet *)actionSheet

{
    
    //#warning iOS7 test bed
    
    //Gets an array af all of the subviews of our actionSheet
    
    NSArray *subviews = [actionSheet subviews];

    for (UIView *v in subviews)
        
    {
        
        if ([v isKindOfClass:[UIButton class]]) {
            
            UIButton *b = (UIButton*)v;
            
            [b setTitleColor:[UIColor colorWithRed:110.0f/255.0f green:110.0f/255.0f blue:110.0f/255.0f alpha:1.0f] forState:UIControlStateNormal];
            
            [b setTitleColor:[UIColor colorWithRed:243.0f/255.0f green:6.0f/255.0f blue:23.0f/255.0f alpha:1.0f] forState:UIControlStateHighlighted];
        }
    }
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker

{
    [picker dismissViewControllerAnimated:YES completion:nil];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(NSDictionary *)editingInfo

{
    UIImage *fixedImage = [self fixOrientation:image];
    [self.userimageIMGVIEW setImage:fixedImage];

    
    [picker dismissViewControllerAnimated:YES completion:nil];
}

-(UIImage *)fixOrientation:(UIImage*)image

{

    
    // No-op if the orientation is already correct
    
    //    if (self.imageOrientation == UIImageOrientationUp) return nil;
    
    
    
    // We need to calculate the proper transformation to make the image upright.
    
    // We do it in 2 steps: Rotate if Left/Right/Down, and then flip if Mirrored.
    
    CGAffineTransform transform = CGAffineTransformIdentity;
    
    UIImageOrientation imageOrientation = [image imageOrientation];
    
    switch (imageOrientation)
    
    {
            
        case UIImageOrientationDown:
            
        case UIImageOrientationDownMirrored:
            
            transform = CGAffineTransformTranslate(transform, image.size.width, image.size.height);
            
            transform = CGAffineTransformRotate(transform, M_PI);
            
            break;
            
            
            
        case UIImageOrientationLeft:
            
        case UIImageOrientationLeftMirrored:
            
            transform = CGAffineTransformTranslate(transform, image.size.width, 0);
            
            transform = CGAffineTransformRotate(transform, M_PI_2);
            
            break;
            
            
            
        case UIImageOrientationRight:
            
        case UIImageOrientationRightMirrored:
            
            transform = CGAffineTransformTranslate(transform, 0, image.size.height);
            
            transform = CGAffineTransformRotate(transform, -M_PI_2);
            
            break;
            
    }
 
    switch (imageOrientation)
    
    {
            
        case UIImageOrientationUpMirrored:
            
        case UIImageOrientationDownMirrored:
            
            transform = CGAffineTransformTranslate(transform, image.size.width, 0);
            
            transform = CGAffineTransformScale(transform, -1, 1);
            
            break;
            
            
            
        case UIImageOrientationLeftMirrored:
            
        case UIImageOrientationRightMirrored:
            
            transform = CGAffineTransformTranslate(transform, image.size.height, 0);
            
            transform = CGAffineTransformScale(transform, -1, 1);
            
            break;
            
    }
    // Now we draw the underlying CGImage into a new context, applying the transform
    
    // calculated above.
    
    CGContextRef ctx = CGBitmapContextCreate(NULL, image.size.width, image.size.height,
                                             
                                             CGImageGetBitsPerComponent(image.CGImage), 0,
                                             
                                             CGImageGetColorSpace(image.CGImage),
                                             
                                             CGImageGetBitmapInfo(image.CGImage));
    CGContextConcatCTM(ctx, transform);
    
    switch (imageOrientation)
    
    {
        case UIImageOrientationLeft:
            
        case UIImageOrientationLeftMirrored:
            
        case UIImageOrientationRight:
            
        case UIImageOrientationRightMirrored:
            
            // Grr...
            
            CGContextDrawImage(ctx, CGRectMake(0,0,image.size.height,image.size.width), image.CGImage);
            break;
  
        default:
            
            CGContextDrawImage(ctx, CGRectMake(0,0,image.size.width,image.size.height), image.CGImage);
            
            break;
            
    }

    // And now we just create a new UIImage from the drawing context
    
    CGImageRef cgimg = CGBitmapContextCreateImage(ctx);
    
    UIImage *img = [UIImage imageWithCGImage:cgimg];
    
    CGContextRelease(ctx);
    
    CGImageRelease(cgimg);
    
    return img;
    
}

-(UIImage*)imageWithImage:(UIImage*)sourceImage scaledToSize:(CGSize)newSize

{
    
    CGFloat targetWidth =sourceImage.size.width;  //newSize.width;
    
    CGFloat targetHeight = sourceImage.size.height;// newSize.height;
    
    
    
    CGImageRef imageRef = [sourceImage CGImage];
    
    CGBitmapInfo bitmapInfo = CGImageGetBitmapInfo(imageRef);
    
    CGColorSpaceRef colorSpaceInfo = CGImageGetColorSpace(imageRef);
    
    
    
    if (bitmapInfo == kCGImageAlphaNone) {
        
        bitmapInfo = kCGImageAlphaNoneSkipLast;
        
    }
    
    
    
    CGContextRef bitmap;
    
    
    
    
    
    if (sourceImage.imageOrientation == UIImageOrientationUp || sourceImage.imageOrientation == UIImageOrientationDown) {
        
        bitmap = CGBitmapContextCreate(NULL, targetWidth, targetHeight, CGImageGetBitsPerComponent(imageRef), CGImageGetBytesPerRow(imageRef), colorSpaceInfo, bitmapInfo);
        
        
        
    } else {
        
        bitmap = CGBitmapContextCreate(NULL, targetHeight, targetWidth, CGImageGetBitsPerComponent(imageRef), CGImageGetBytesPerRow(imageRef), colorSpaceInfo, bitmapInfo);
        
        
        
    }

    CGContextDrawImage(bitmap, CGRectMake(0, 0, targetWidth, targetHeight), imageRef);
    
    CGImageRef ref = CGBitmapContextCreateImage(bitmap);
    
    UIImage* newImage = [UIImage imageWithCGImage:ref];
    
    
    
    CGContextRelease(bitmap);
    
    CGImageRelease(ref);
    
    
    
    return newImage;
    
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
