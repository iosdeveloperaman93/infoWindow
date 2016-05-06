//
//  ViewInfoWindow.h
//  InfoWindowView
//
//  Created by Ama n Gangurde on 29/04/16.
//  Copyright © 2016 KloudData Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewInfoWindow : UIView<UIGestureRecognizerDelegate>

+(id)sharedManager;
-(void)createViewInfoWindow;
@end
