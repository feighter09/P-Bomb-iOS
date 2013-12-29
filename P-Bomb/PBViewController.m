//
//  PBViewController.m
//  P-Bomb
//
//  Created by Austin Feight on 12/28/13.
//  Copyright (c) 2013 Lost in Flight Studios. All rights reserved.
//

#import <CoreTelephony/CTMessageCenter.h>

#import "PBViewController.h"

@interface PBViewController ()

@property (strong, nonatomic) IBOutlet UIPickerView *numPicker;
@property (strong, nonatomic) NSArray *numChoices;
@property (strong, nonatomic) IBOutlet UITextView *messageTextBox;
- (IBAction)sendBomb:(id)sender;

@end

@implementation PBViewController

- (void)viewDidLoad
{
  [super viewDidLoad];
  [self initPicker];
  [_messageTextBox setDelegate:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Picker Mgmt

- (void)initPicker {
  [_numPicker setDelegate:self];
  [_numPicker setDataSource:self];
  _numChoices = @[@1, @5, @10, @20, @50, @100, @500, @1000];
  [NSString stringWithFormat:@"%d", 2];
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
  return [_numChoices count];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
  return 1;
}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view {
  UILabel *label = [[UILabel alloc] init];
  [label setText:[NSString stringWithFormat:@"%@", [_numChoices objectAtIndex:row]]];
  [label setTextAlignment:NSTextAlignmentCenter];
  [label sizeToFit];
  return label;
}

#pragma mark - Text View 

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
  [self.view endEditing:YES];
}

#pragma mark - Text Sending

- (IBAction)sendBomb:(id)sender {
  [CT]
}
@end
