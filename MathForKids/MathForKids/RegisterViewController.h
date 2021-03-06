//
//  RegisterViewController.h
//  MathForKids
//
//  Created by Shuo Yuan on 2016-03-16.
//  Copyright © 2016 398group16. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RegisterViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource>{
    IBOutlet UIImageView* user_img;
    IBOutlet UITextField* user_name;
    IBOutlet UIButton* submit;
    IBOutlet UIPickerView* user_favor;
    __weak IBOutlet UIButton *shadowButton;
    NSMutableArray *source;
}
- (IBAction)textFieldDimiss:(id)sender;

@property (nonatomic, strong) NSString* imgName;

-(IBAction)submit:(id)sender;

@end
