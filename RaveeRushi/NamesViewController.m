//
//  NamesViewController.m
//  RaveeRushi
//
//  Created by Ravee Khandagale on 18/08/14.
//  Copyright (c) 2014 Ravee Khandagale. All rights reserved.
//

#import "NamesViewController.h"

@interface NamesViewController ()

@end

@implementation NamesViewController
@synthesize textFieldfirstname;
@synthesize textFieldlastname;
@synthesize name;

//we need this to retrieve managed object context and later save the device data

-(NSManagedObjectContext *)managedObjectContext
{
    NSManagedObjectContext *context = nil;
    
    id delegate = [[UIApplication sharedApplication]delegate];
    if ([delegate performSelector:@selector(managedObjectContext)]) {
        context = [delegate managedObjectContext];
    }
    return context;
}
- (IBAction)savePressed:(id)sender {
    NSManagedObjectContext *context = [self managedObjectContext];
    
    if(name){
        //update name
        [name setValue:textFieldfirstname.text forKey:@"firstname"];
        [name setValue:textFieldlastname.text forKey:@"lastname"];
        
    } else{
    
    //create a new name
    NSManagedObject *newName = [NSEntityDescription insertNewObjectForEntityForName:@"Names" inManagedObjectContext:context];
    [newName setValue:textFieldfirstname.text forKey:@"firstname"];
    [newName setValue:textFieldlastname.text forKey:@"lastname"];
    }
    NSError *error=nil;
    //Save the context
    if(![context save:&error]){
        NSLog(@"Save Failed! %@ %@",error,[error localizedDescription]);
    }
    
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (IBAction)cancelPressed:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
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
    
    if(name) {
        [textFieldfirstname setText:[name valueForKey:@"firstname"]];
        
        [textFieldlastname setText:[name valueForKey:@"lastname"]];
        
        
    }
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
 {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
