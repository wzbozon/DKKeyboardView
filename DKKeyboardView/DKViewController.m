//
//  DKViewController.m
//  DKKeyboardView
//
//  Created by Denis Kutlubaev on 28.08.12.
//  Copyright (c) 2012 Denis Kutlubaev. All rights reserved.
//

// quick creation of localized strings
#define LS(string) NSLocalizedString(string, nil)

#import "DKViewController.h"

@interface DKViewController ()

@end

@implementation DKViewController
@synthesize textField1;
@synthesize textField2;
@synthesize textField3;
@synthesize textField4;

#pragma - mark - View Lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    self.textFields = [[NSMutableDictionary alloc] init];
    
    self.textField1.delegate = self;
    self.textField1.tag = 0;
    [self initiateTextField:self.textField1];
    
    self.textField2.delegate = self;
    self.textField2.tag = 1;
    [self initiateTextField:self.textField2];
    
    self.textField3.delegate = self;
    self.textField3.tag = 2;
    [self initiateTextField:self.textField3];
    
    self.textField4.delegate = self;
    self.textField4.tag = 3;
    [self initiateTextField:self.textField4];
}

- (void)viewDidUnload
{
    [self setTextField1:nil];
    [self setTextField2:nil];
    [self setTextField3:nil];
    [self setTextField4:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

#pragma - mark - KeyboardView Methods

- (void)addAccessoryViewToTextField:(UITextField*)aTextField
{
    NSUInteger tag = aTextField.tag;
    
    UIToolbar *toolbar = [[UIToolbar alloc] init];
    [toolbar setBarStyle:UIBarStyleBlackTranslucent];
    [toolbar sizeToFit];
    
    UIBarButtonItem *prevButton = [[UIBarButtonItem alloc] initWithTitle:LS(@"Previous") style:UIBarButtonItemStyleDone target:self action:@selector(previousClicked:)];
    prevButton.tag = tag;
    
    UIBarButtonItem *nextButton = [[UIBarButtonItem alloc] initWithTitle:LS(@"Next") style:UIBarButtonItemStyleDone target:self action:@selector(nextClicked:)];
    nextButton.tag = tag;
    
    UIBarButtonItem *flexButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    
    UIBarButtonItem *doneButton =[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(doneClicked:)];
    doneButton.tag = tag;
    
    NSArray *itemsArray =  [NSArray arrayWithObjects:prevButton, nextButton, flexButton, doneButton, nil];
    
    [toolbar setItems:itemsArray];
    
    [aTextField setInputAccessoryView:toolbar];
}

- (void)nextClicked:(id)sender
{
    UIBarButtonItem *barButtonItem = sender;
    NSInteger tag = barButtonItem.tag;
    NSInteger tagToActivate = tag + 1;
    if (tagToActivate >= ([self.textFields count])) {
        return;
    }
    else {
        UITextField *textField = [self.textFields objectForKey:[NSString stringWithFormat:@"%d", tagToActivate]];
        [textField becomeFirstResponder];
    }
    return;
}

- (void)previousClicked:(id)sender
{
    UIBarButtonItem *barButtonItem = sender;
    NSInteger tag = barButtonItem.tag;
    NSInteger tagToActivate = tag - 1;
    if (tagToActivate < 0) {
        return;
    }
    else {
        UITextField *textField = [self.textFields objectForKey:[NSString stringWithFormat:@"%d", tagToActivate]];
        [textField becomeFirstResponder];
    }
    return;
}

- (void)doneClicked:(id)sender
{
    [self.view endEditing:YES];
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Done clicked" message:nil delegate:self cancelButtonTitle:@"Ok" otherButtonTitles: nil];
    [alert show];
}

- (void)initiateTextField:(UITextField*)textField
{
    [self addAccessoryViewToTextField:textField];
    [self.textFields addEntriesFromDictionary:[NSDictionary dictionaryWithObject:textField forKey:[NSString stringWithFormat:@"%d", textField.tag]]];
}


@end
