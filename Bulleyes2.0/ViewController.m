//
//  ViewController.m
//  Bulleyes2.0
//
//  Created by 吴迪 on 8/11/15.
//  Copyright (c) 2015 吴迪. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
{
    int  _sliderValue;
    int _targetValue;
    int _score;
    int _round;
}
#pragma mark - void
- (void)viewDidLoad {
    UIImage *thumbImageNormal = [UIImage imageNamed:@"SliderThumb-Normal"];
    [self.Slider setThumbImage:thumbImageNormal forState:UIControlStateNormal];
    UIImage *thumbImageHighlighted = [UIImage imageNamed:@"SliderThumb-Highlighted"];
    [self.Slider setThumbImage:thumbImageHighlighted forState:UIControlStateHighlighted];
    UIImage *trackLeftImage =
    [[UIImage imageNamed:@"SliderTrackLeft"]
     resizableImageWithCapInsets:UIEdgeInsetsMake(0, 14, 0, 14)]; [self.Slider setMinimumTrackImage:trackLeftImage
                                                                                           forState:UIControlStateNormal];
    UIImage *trackRightImage =
    [[UIImage imageNamed:@"SliderTrackRight"]resizableImageWithCapInsets:UIEdgeInsetsMake(0, 14, 0, 14)];
    [self.Slider setMaximumTrackImage:trackRightImage forState:UIControlStateNormal];
    
    [super viewDidLoad];
    [self startNewGame];
    [self updateLabel];// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}


-(void)startNewRound
{   _round++;
    _targetValue = 1 + arc4random_uniform(100);
    _sliderValue = 50;
    self.value.text =@"50";
    self.Slider.value = _sliderValue;
    

}
-(void)updateLabel
{
    self.TargetLabel.text = [NSString stringWithFormat:@"%d",_targetValue];
    self.ScoreLabel.text = [NSString stringWithFormat:@"%d",_score];
    self.RoundLabel.text = [NSString stringWithFormat:@"%d",_round];
}
-(void)startNewGame
{
    _round = 0;
    _score = 0;
    
    [self startNewRound];
}

-(void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    [self startNewRound];
    [self updateLabel];
}

#pragma mark - IBAction

-(IBAction)sliderValue:(UISlider *)slider
{
    _sliderValue = roundf(slider.value);
    self.value.text = [NSString stringWithFormat:@"%d",_sliderValue];
}
-(IBAction)showAlert
{
    int point = 100 - abs(_targetValue- _sliderValue);
   
    
    NSString *title;
    
    if (point == 100) {
        title =@"perfect";
        point +=100;
    } else if (point >=95) {
        title = @"you alomst get it!";
        if (point == 99) {
            point +=50;
        }
    } else if (point >=90){
        title = @"nice job!";
    }else {
        title = @"you can try your best next time!";
    }
     _score +=point;
    
    NSString* message = [NSString stringWithFormat:@"You Get %d points!",point];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:message delegate:self
                                          cancelButtonTitle:@"cancel" otherButtonTitles: nil];
    [alert show];
    
   
}
-(IBAction)startOver
{
    CATransition *transition = [CATransition animation]; transition.type = kCATransitionFade; transition.duration = 1;
    transition.timingFunction = [CAMediaTimingFunction
                                 functionWithName:kCAMediaTimingFunctionEaseOut];
   
    
    [self startNewGame];
    [self updateLabel];
    [self.view.layer addAnimation:transition forKey:nil];
}

@end
