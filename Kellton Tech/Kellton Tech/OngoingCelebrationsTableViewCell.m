//
//  OngoingCelebrationsTableViewCell.m
//  Kellton Tech
//
//  Created by KELLTONTECH on 17/04/15.
//  Copyright (c) 2015 Kellton Tech. All rights reserved.
//

#import "OngoingCelebrationsTableViewCell.h"

@implementation OngoingCelebrationsTableViewCell

- (void)awakeFromNib {
    // Initialization code
    
    [self.buttonUpload.layer setMasksToBounds:NO];
    [self.buttonUpload.layer setCornerRadius:4.0f];
    [self.buttonUpload.layer setBorderColor:[self colorWithHexString:@"1E90FF"].CGColor];
    [self.buttonUpload.layer setBorderWidth:1.5f];
    [self.buttonUpload.layer setShadowColor:[UIColor blackColor].CGColor];
    [self.buttonUpload.layer setShadowOffset:CGSizeMake(2, 2)];
    [self.buttonUpload.layer setShadowOpacity:0.5f];
    [self.buttonUpload.layer setShadowRadius:2.0f];

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


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
