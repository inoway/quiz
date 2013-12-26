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
    NSString* path = [[NSBundle mainBundle] pathForResource:@"quiz" ofType:@"txt"];
    
    NSError* error = nil;
    int enc = NSUTF8StringEncoding;
    NSString* text = [NSString stringWithContentsOfFile:path encoding:enc error:&error];
    
    //行ごとに分割し、配列「line」に格納
    NSArray* lines = [text componentsSeparatedByString:@"\n"];
    
    //問題を格納する可変配列のproblemSetを初期化
    problemSet=[[NSMutableArray alloc]init];
    
    //問題の数だけ繰り返し
    for (int i=0; i<[lines count]; i++) {
        
        //問題をカンマで区切って、要素を配列「items」に格納
        NSArray* items=[[lines objectAtIndex:i] componentsSeparatedByString:@","];
        
        //Problemクラスのインスタンスを生成•初期化し問題文と答え格納
        Problem *p=[Problem initProblem];
        NSString *q=[items objectAtIndex:0];
        int a =[[items objectAtIndex:1]intValue];
        [p setQ:q withA:a];
        
        //新たに生成したProblemクラスのインスタンスをproblemSetに追加
        [problemSet addObject:p];
    }
}

//問題文をシャッフル
- (void)shuffleProblemSet {
    
    //problemSetに格納された全問題の数を取得
    int totalQuestions=[problemSet count];
    
    //Fisher-Yatesアルゴリズム用のカウンターを取得
    int i=totalQuestions;
    
    //Fisher-Yatesアルゴリズムによって配列の要素をシャッフル
    while (i>0) {
        //乱数を発生
        srand((unsigned int)time(0));
        int j=rand()%i;
        
        //要素を並び替え
        [problemSet exchangeObjectAtIndex:(i-1) withObjectAtIndex:j];
        //カウンターを減少させる
        i=i-1;
    }
}

- (void)



@end
