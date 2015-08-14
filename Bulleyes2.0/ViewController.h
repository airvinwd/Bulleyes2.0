//
//  ViewController.h
//  Bulleyes2.0
//
//  Created by 吴迪 on 8/11/15.
//  Copyright (c) 2015 吴迪. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIAlertViewDelegate>
@property (weak, nonatomic) IBOutlet UISlider *Slider;
@property (weak, nonatomic) IBOutlet UILabel *TargetLabel;
@property (weak, nonatomic) IBOutlet UILabel *ScoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *RoundLabel;

@property (weak, nonatomic) IBOutlet UILabel *value;

-(IBAction)showAlert;
-(IBAction)sliderValue:(UISlider *)slider;
-(IBAction)startOver;
@end


