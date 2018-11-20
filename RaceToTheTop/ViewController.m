//
//  ViewController.m
//  RaceToTheTop
//
//  Created by walid on 11/18/18.
//  Copyright © 2018 walid. All rights reserved.
//

#import "ViewController.h"
#import "mountainPathView.h"
#import "pathMountian.h"
#define RT_SCORE_START 15000
#define RT_INTERVAL_SECOND .1
#define RT_PELANTY_SCORE 500
#define RE_DECREMENT_AMOUNT 100

@interface ViewController ()
@property (weak, nonatomic) IBOutlet mountainPathView *mointianView;
@property (strong,nonatomic)NSTimer *timer;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;

@end



@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
   UITapGestureRecognizer *tapGesture=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapDetected:)];
    [_mointianView addGestureRecognizer:tapGesture];
    
    UIPanGestureRecognizer *panGesture=[[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(panDetected:)];
    [_mointianView addGestureRecognizer:panGesture];
    

}



-(void)tapDetected:(UITapGestureRecognizer*)tapgestureRecognizer{
    CGPoint fingerPoint=[tapgestureRecognizer locationInView:_mointianView];
    NSLog(@"%f ,%f",fingerPoint.x,fingerPoint.y);
}


-(void)panDetected:(UIPanGestureRecognizer*)panGesture{
    
    CGPoint fingerPoint=[panGesture locationInView:self.mointianView];
    
    if (panGesture.state==UIGestureRecognizerStateBegan && fingerPoint.y < 800)
    {
    self.timer =[NSTimer scheduledTimerWithTimeInterval:RT_INTERVAL_SECOND target:self selector:@selector(timerFired) userInfo:nil repeats:YES];
    _scoreLabel.text=[NSString stringWithFormat:@"Score : %i",RT_SCORE_START];
        NSLog(@"the gesture is begin %f",fingerPoint.y);
    }
   
    else if (panGesture.state==UIGestureRecognizerStateChanged  )
    
    {
        for(UIBezierPath *path in [pathMountian moutaintBezierPath:self.mointianView.bounds ])
        {
            UIBezierPath *tapTarget=[pathMountian tapTargetForPath:path];
            if ([tapTarget containsPoint:fingerPoint]){
                [self decrementScore:RT_PELANTY_SCORE];
                NSLog(@"you hit the wall");
            }
            
        }
    
    }
    
    else if (panGesture.state==UIGestureRecognizerStateEnded && fingerPoint.y <= 165)
    
    {
        [self.timer invalidate];
        self.timer=nil;
    }
    else
    {
        UIAlertController *alert=[UIAlertController alertControllerWithTitle:@"Error" message:@"you must Begin from Begin " preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *action =[UIAlertAction actionWithTitle:@"ok" style:UIAlertActionStyleCancel handler:nil];
        [alert addAction:action];
        [self presentViewController:alert animated:YES completion:nil];
        [self.timer invalidate];
        self.timer=nil;
        _scoreLabel.text =[ NSString stringWithFormat:@"Score : %i",15000];
    }
    
}

-(void)timerFired{
    [self decrementScore:RE_DECREMENT_AMOUNT];
}

-(void)decrementScore:(int)amount{
    NSString *scoreString=[[_scoreLabel.text  componentsSeparatedByString:@" "] lastObject];
    int score=[scoreString intValue]-amount;
    _scoreLabel.text=[NSString stringWithFormat:@"%i",score ];
}

@end
