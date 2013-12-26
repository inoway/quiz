//
//  Problem.m
//  quiz
//
//  Created by 井上　昌信 on 13/12/19.
//  Copyright (c) 2013年 University of Kitakyu. All rights reserved.
//

#import "Problem.h"

@interface Problem ()

@end

@implementation Problem {
    //問題文
    NSString *question;
    //答え(◯のとき「0」×のとき「1」)
    int answer;
}

//初期化処理、+(クラスメソッド)
+(id)initProblem {
    return [[self alloc]init];
}

//問題文と答えを格納
- (void)setQ:(NSString *)q withA:(int)a {
    question =q;
    answer =a;
}

//問題文を読み出し
-(NSString *)getQ {
    return question;
}

//答えを読み出し
-(int)getA {
    return answer;
}




- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
