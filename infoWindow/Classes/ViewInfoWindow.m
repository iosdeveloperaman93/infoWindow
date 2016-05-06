//
//  ViewInfoWindow.m
//  InfoWindowView
//
//  Created by Aman Gangurde on 29/04/16.
//  Copyright © 2016 KloudData Inc. All rights reserved.
//

#import "ViewInfoWindow.h"
#import "SecondViewController.h"

#define viewInfoWindowTag           101

#define windowWidth                 200
#define textViewWidth               180

#define windowHeight                200
#define headerHeight                40
#define textViewHeight              140

@implementation ViewInfoWindow
{
  BOOL flag;
  BOOL isWindowButtonTouched;
  BOOL newWindow;
  
  int windowheight;
  
}

+ (id)sharedManager {
  static ViewInfoWindow *sharedMyManager = nil;
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    sharedMyManager = [[self alloc] init];
  });
  return sharedMyManager;
}

-(id)init
{
  if ([super init])
  {
  
  }
  return self;
}

-(void)createViewInfoWindow
{
  
  if(flag)
    return;
  
    self.tag = viewInfoWindowTag;
    self.frame = CGRectMake(10, 100, windowWidth, windowHeight);
    self.backgroundColor = [UIColor redColor];
    self.layer.borderWidth = 4;
  
    UIView *headerView = [[UIView alloc]init];
    headerView.frame = CGRectMake(0, 0, windowWidth, headerHeight);
    headerView.backgroundColor = [UIColor blackColor];
    [self addSubview:headerView];
    
    UITextView *viewTemp = [[UITextView alloc]init];
    viewTemp.frame = CGRectMake(10, 50, textViewWidth, textViewHeight);
    viewTemp.backgroundColor = [UIColor whiteColor];
    [self addSubview:viewTemp];
    
    UIButton *buttonCancel = [[UIButton alloc]init];
    buttonCancel.frame = CGRectMake(160, 5, 35, 30);
    buttonCancel.backgroundColor = [UIColor clearColor];
    [buttonCancel setTitle:@"X" forState:UIControlStateNormal];
    [headerView addSubview:buttonCancel];
    
    [buttonCancel addTarget:self action:@selector(btnClickedCancel:) forControlEvents:UIControlEventTouchUpInside];
    
    UIPanGestureRecognizer *recognizer = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(GestureRecognizer:)];
    recognizer.delegate = self;
    [self addGestureRecognizer:recognizer];
  flag = YES;
}

-(void)btnClickedCancel:(id)sender
{
  [self removeFromSuperview];
  flag = NO;
  isWindowButtonTouched = NO;
}

-(void)GestureRecognizer:(UIPanGestureRecognizer*)recognizer
{
  CGPoint translation = [recognizer translationInView:self];
  
  recognizer.view.center = CGPointMake(recognizer.view.center.x + translation.x, recognizer.view.center.y + translation.y);
  
  [recognizer setTranslation:CGPointMake(0, 0) inView:self];
}


@end
