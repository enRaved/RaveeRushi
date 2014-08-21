//
//  SecondViewController.m
//  RaveeRushi
//
//  Created by Ravee Khandagale on 18/08/14.
//  Copyright (c) 2014 ___FULLUSERNAME___. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()
@property (strong, nonatomic) IBOutlet UITextField *textFieldText;
@property (strong, nonatomic) IBOutlet UIImageView *Image;
- (IBAction)buttonPressed:(id)sender;

@end

@implementation SecondViewController
@synthesize textFieldText;
@synthesize Image;
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonPressed:(id)sender {
    
    NSString *s=textFieldText.text;
    
    Image.image=[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:s]]];

}
@end
