//
//  ScoreViewController.m
//  MathForKids
//
//  Created by Shuo Yuan on 2016-02-28.
//  Copyright © 2016 398group16. All rights reserved.
//

#import "ScoreViewController.h"
#import "scoreObjects.h"
#import "categoryList.h"

@interface ScoreViewController ()

@property (nonatomic, strong) categoryList* cateList;

@end

@implementation ScoreViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        //intialize our data to be stored in the json file
        [self loadScoreData];
    }
    return self;
}

-(void)loadScoreData{
    
    self.cateList = [[categoryList alloc] init];
    
    NSMutableArray* scoreList = [[NSMutableArray alloc] init];
    
    //convert NSString to NSNumber
    NSNumberFormatter *f = [[NSNumberFormatter alloc] init];
    f.numberStyle = NSNumberFormatterDecimalStyle;
    NSNumber* num = [f numberFromString:_score];
    
    scoreObjects* score = [[scoreObjects alloc] initWithName:_usrName score:num];
    NSLog(@"33   %@, %@", score.name, score.score);
    [scoreList addObject:score];
    
    categoryList* cate = [[categoryList alloc] init];
    cate.category = self.navigationItem.title;
    NSLog(@"22   %@", cate.category);
    cate.scoreList = scoreList;
    self.cateList = cate;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [[home layer] setCornerRadius:4.0f];
    [[home layer] setBorderWidth:1.0f];
    [[home layer] setBorderColor:[UIColor lightGrayColor].CGColor];
    
    [[share layer] setCornerRadius:4.0f];
    [[share layer] setBorderWidth:1.0f];
    [[share layer] setBorderColor:[UIColor lightGrayColor].CGColor];
    
    [[compare layer] setCornerRadius:4.0f];
    [[compare layer] setBorderWidth:1.0f];
    [[compare layer] setBorderColor:[UIColor lightGrayColor].CGColor];
    
    [label2 setFont:[UIFont boldSystemFontOfSize:27]];
    label2.text = [NSString stringWithFormat:@"%@", self.score];
    [label2 setFont:[UIFont boldSystemFontOfSize:21]];
    
    [self.navigationItem setHidesBackButton:YES animated:YES];
    
    /*write json file*/
    [self loadScoreData];
    
    NSMutableDictionary* dict = [self.cateList toNSDictionary];
    
    
    NSError* error = nil;
    NSData* jsonData = [NSJSONSerialization
                        dataWithJSONObject:dict
                        options:NSJSONWritingPrettyPrinted
                        error:&error];
    
    if ([jsonData length] > 0 && error == nil) {
        NSString *str = [[NSString alloc]initWithData:jsonData encoding:NSUTF8StringEncoding];
        NSLog(@"11  %@", str);
    }else if ([jsonData length] == 0 &&
              error == nil){
        NSLog(@"No data was returned after serialization.");
    }else if (error != nil){
        NSLog(@"An error happened = %@", error);
    }
    

}

-(void)setUsrName:(NSString*)newName{
//    NSLog(@"%@", newName);
    if(_usrName != newName){
        _usrName = newName;
    }
}

- (void)setScore:(NSString*)newScore{
//    NSLog(@"%@", newScore);
    if (_score != newScore) {
        _score = newScore;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
