//
//  AboutViewControl.h
//  Bulleyes2.0
//
//  Created by 吴迪 on 8/13/15.
//  Copyright (c) 2015 吴迪. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AboutViewControl : UIViewController
@property (weak, nonatomic) IBOutlet UIWebView *webView;
-(IBAction)close;
@end
