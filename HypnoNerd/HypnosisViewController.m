//
//  HypnosisViewController.m
//  HypnoNerd
//
//  Created by Shaofeng Mo on 6/15/15.
//  Copyright (c) 2015 Seanmok. All rights reserved.
//

#import "HypnosisViewController.h"
#import "HypnosisView.h"

@interface HypnosisViewController () <UITextFieldDelegate>

@end

@implementation HypnosisViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.tabBarItem.title = @"Hypnosis";
    }
    
    return self;
}

// custom methods
- (void)drawOneRandomTextField:(NSString *)text {
    CGRect viewRect = self.view.bounds;
    for (int i = 0; i < 10; i++) {
        float originX = arc4random() % (int)viewRect.size.height;
        float originY = arc4random() % (int)viewRect.size.width;
        
        UITextField *textField = [[UITextField alloc] init];
        textField.text = text;
        textField.textColor = [UIColor whiteColor];
        [textField sizeToFit];
        
        CGRect textFieldNewFrame = textField.frame;
        textFieldNewFrame.origin = CGPointMake(originX, originY);
        textField.frame = textFieldNewFrame;
        
        [self.view addSubview:textField];
        
        UIInterpolatingMotionEffect *motionEffect;
        motionEffect = [[UIInterpolatingMotionEffect alloc]
                        initWithKeyPath:@"center.x"
                        type:UIInterpolatingMotionEffectTypeTiltAlongHorizontalAxis];
        motionEffect.minimumRelativeValue = @(-150);
        motionEffect.maximumRelativeValue = @(150);
        [textField addMotionEffect:motionEffect];
        
        motionEffect = [[UIInterpolatingMotionEffect alloc]
                        initWithKeyPath:@"center.y"
                        type:UIInterpolatingMotionEffectTypeTiltAlongVerticalAxis];
        motionEffect.minimumRelativeValue = @(-150);
        motionEffect.maximumRelativeValue = @(150);
        [textField addMotionEffect:motionEffect];
    }
}

// inherited methods
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    NSLog(@"textField should return; text: %@", textField.text);
    [self drawOneRandomTextField:textField.text];
    textField.text = @"";
    [textField resignFirstResponder];
    return YES;
}

- (void)loadView {
    CGRect frame = [UIScreen mainScreen].bounds;
    HypnosisView *backgroundView = [[HypnosisView alloc] initWithFrame:frame];
    
    CGRect textFrame = CGRectMake(40, 70, 240, 30);
    UITextField *textField = [[UITextField alloc] initWithFrame:textFrame];
    textField.borderStyle = UITextBorderStyleRoundedRect;
    textField.placeholder = @"hip me!";
    textField.returnKeyType = UIReturnKeyDone;
    textField.delegate = self;
    
    [backgroundView addSubview:textField];
    
    self.view = backgroundView;
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
