//
//  QuizViewController.m
//  quiz
//
//  Created by 井上　昌信 on 13/12/19.
//  Copyright (c) 2013年 University of Kitakyu. All rights reserved.
//

#import "QuizViewController.h"

@interface QuizViewController ()

@end

@implementation QuizViewController {

//問題(problemクラスのインスタンス)を格納する配列
NSMutableArray *problemSet;

//出題する問題数
int totalProblems;

//現在の出題済み問題数を記録
int currentProblem;

//正答数
int correntProblem;

//問題文を表示するテキストウインドウ
IBOutlet UITextView *problemText;
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

-(void)loadProblemSet{
    //ファイルの読み込み
    NSString* pass = [[NSBundle mainBundle] pathForResource:@"quiz" ofType:@"txt"];
    
    NSError* error = nil;
    int enc = NSUTF8StringEncoding;
    NSString* text = [NSString stringWithContentsOfFile:path encoding:enc error:&error];
    
    //行ごとに分割し、配列「line」に格納
    NSArray* lines = [text componentsSeparatedByString:@"\n"];
    
}


@end
