//
//  QuizViewController.h
//  quiz
//
//  Created by 井上　昌信 on 13/12/19.
//  Copyright (c) 2013年 University of Kitakyu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Problem.h"

@interface QuizViewController : UIViewController{
    
    __weak IBOutlet UILabel *problemText;
}
-(IBAction)answerlsTrue:(id)sender;
-(IBAction)answerFalse:(id)sender;

@end
