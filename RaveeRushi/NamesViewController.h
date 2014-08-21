//
//  NamesViewController.h
//  RaveeRushi
//
//  Created by Ravee Khandagale on 18/08/14.
//  Copyright (c) 2014 Ravee Khandagale. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NamesViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITextField *textFieldfirstname;
@property (strong, nonatomic) IBOutlet UITextField *textFieldlastname;

@property(strong) NSManagedObject *name;

@end
