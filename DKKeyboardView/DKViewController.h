//
//  DKViewController.h
//  DKKeyboardView
//
//  Created by Denis Kutlubaev on 28.08.12.
//  Copyright (c) 2012 Denis Kutlubaev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DKViewController : UIViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *textField1;
@property (weak, nonatomic) IBOutlet UITextField *textField2;
@property (weak, nonatomic) IBOutlet UITextField *textField3;
@property (weak, nonatomic) IBOutlet UITextField *textField4;

@property (nonatomic, strong) NSMutableDictionary *textFields;

@end
