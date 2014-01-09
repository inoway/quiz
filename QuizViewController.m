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


NSMutableArray *problemSet;//問題(problemクラスのインスタンス)を格納する配列,NSMutableArrayは可変配列を提供するクラス


int totalProblems;//出題数
int currentProblem;//現在の出題済み問題数
int correctAnswers;//正解数
//IBOutlet UITextView *problemText;//問題文を表示するテキストウインドウ
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
}
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self loadProblemSet];//クイズ問題を読み込み
    [self shuffleProblemSet];//クイズ問題をランダムに並び替え
    totalProblems=10;//出題数を10問とする
        
        //現在の問題番号と正解の数を0にする
    currentProblem=0;
    correctAnswers=0;
        
        //problemSetの最初の要素の問題文をクイズにセット
    problemText.text = [[problemSet objectAtIndex:currentProblem] getQ];
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
    
    NSArray* lines = [text componentsSeparatedByString:@"\n"];//行ごとに分割し、配列「line」に格納
    
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
    
    int totalQuestions=[problemSet count];//problemSetに格納された全問題の数を取得
    int i=totalQuestions;//Fisher-Yatesアルゴリズム用のカウンターを取得
    
    //Fisher-Yatesアルゴリズムによって配列の要素をシャッフル
    while (i>0) {
        srand((unsigned int)time(0));//乱数を発生
        int j=rand()%i;
        [problemSet exchangeObjectAtIndex:(i-1) withObjectAtIndex:j];//要素を並び替え
        i=i-1;//カウンターを減少させる
    }
}

//次の問題を提示
-(void)nextProblem {
    currentProblem++;//currentProblemを1進める
    if (currentProblem < totalProblems) {//これまでに出題した問題が、提示問題数に達していないとき
        problemText.text=[[problemSet objectAtIndex:currentProblem]getQ];//次の問題の問題文を表示
    }
}

//ボタンの判定
-(IBAction)answerlsTrue:(id)sender {//「◯」ボタンが押されたとき
    if ([[problemSet objectAtIndex:currentProblem]getA]==0) {//答えを確認し、次の問題を提示
        correctAnswers++;
    }
    [self nextProblem];
}


-(IBAction)answerFalse:(id)sender {//「×」ボタンが押されたとき
    if ([[problemSet objectAtIndex:currentProblem]getA]==1) {//答えを確認し、次の問題を提示
        correctAnswers++;
    }
    [self nextProblem];
}

@end
