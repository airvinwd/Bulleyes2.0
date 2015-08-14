//
//  AboutViewControl.m
//  Bulleyes2.0
//
//  Created by 吴迪 on 8/13/15.
//  Copyright (c) 2015 吴迪. All rights reserved.
//

#import "AboutViewControl.h"

@implementation AboutViewControl
-(void)viewDidLoad
{
    [super viewDidLoad];
    NSString *htmlFile = [[NSBundle mainBundle]
                          pathForResource:@"BullsEye" ofType:@"html"];
    NSData *htmlData = [NSData dataWithContentsOfFile:htmlFile];
    NSURL *baseURL = [NSURL fileURLWithPath:[
                                             [NSBundle mainBundle] bundlePath]];
    [self.webView loadData:htmlData MIMEType:@"text/html" textEncodingName:@"UTF-8" baseURL:baseURL];
}
-(IBAction)close
{
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}
@end
