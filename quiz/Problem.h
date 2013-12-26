//
//  Problem.h
//  quiz
//
//  Created by 井上　昌信 on 13/12/19.
//  Copyright (c) 2013年 University of Kitakyu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Problem : UIViewController

+ (id)initProblem;
- (void)setQ:(NSString *)q withA:(int)a;
- (NSString *)getQ;
- (int)getA;

@end
