//
//  AddADevice.m
//  Switchr
//
//  Created by Jeffrey Kiske on 12/16/11.
//  Copyright (c) 2011 University Of Pennsylvania. All rights reserved.
//

#import "AddADevice.h"
//#import "Device.m"



@implementation AddADevice

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    
//    defaults = [NSUserDefaults standardUserDefaults];
//    [defaults objectForKey:@"devices"];
}


- (void)viewDidUnload
{
    deviceDescription = nil;
    deviceId = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    if (textField == deviceDescription) {
        if(deviceDescription.text.length > 0){
            [deviceDescription resignFirstResponder];
            [deviceId becomeFirstResponder];
        }else{
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Invalid Device Name" message:@"You need to specify a device name" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
            [alert show];
        }
    }else if(textField == deviceId){
        NSRegularExpression *regex = [[NSRegularExpression alloc] initWithPattern:@"[0-9]{9}" options:NSRegularExpressionCaseInsensitive error:nil];
       
        //make sure it is a valid name and id
        if([regex numberOfMatchesInString:deviceId.text options:NSMatchingReportCompletion range:NSMakeRange(0, deviceId.text.length)] &&  deviceDescription.text.length > 0){
            [self addADeviceWithName:deviceDescription.text andID:deviceId.text];
            [textField resignFirstResponder];
          
            [self.navigationController popViewControllerAnimated:YES];
            //TODO: go back to first view
            
        //check to make sure it is a valid id
        }else if (![regex numberOfMatchesInString:deviceId.text options:NSMatchingReportCompletion range:NSMakeRange(0, deviceId.text.length)]){
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Invalid Device ID" message:@"The device ID must be 9 digits with no letters or special characters" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
            [alert show];
            
        //check to make sure it is a valid name again
        }else if(deviceDescription.text.length <= 0){
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Invalid Device Name" message:@"You need to specify a device name" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
            [alert show];
        }
    }
    return YES;
}

- (void)addADeviceWithName:(NSString *)dname andID:(NSString *)did{

    
    
    //IF ADD IS SUCCESSFUL
    //CHECK API HERE BEFORE CONTINUING
    

    int isEnabledAlready = 0;
    
    //********************************************
    
    
    
    
    
    
    
    NSMutableArray *objectArray = [[NSMutableArray alloc] initWithArray:[Home loadDeviceData]];
    
    NSString *dType = nil;
    if([[did substringToIndex:1] intValue] == 1){
        dType = @"Light";
    }
    else if([[did substringToIndex:1] intValue] == 2){
        dType = @"Lock";
    }
    else if([[did substringToIndex:1] intValue] == 3){
        dType = @"Door";
    }
    else {
        dType = @"Misc Switch";
    }
    
    NSLog(@"Creating Device%@", dname);
    NSLog(@"ID %@",  did);
        NSLog(@"Is Enabled %d",  isEnabledAlready);   
        NSLog(@"Type %@",  dType);  
    
    
    Device *myDevice = [[Device alloc] initWithName:dname DeviceId:[did intValue] isEnabled:isEnabledAlready type:dType lastUpdated:0];
    
    NSLog(@"Created Device: name%@", [myDevice name]);
    NSLog(@"Encoded: %@", [myDevice encode]); 

    [objectArray addObject:[myDevice encode]];
    
    [Home saveDeviceData:objectArray];
    
    //Double Check
    NSMutableArray *objectArray2 = [[NSMutableArray alloc] initWithArray:[Home loadDeviceData]];
    NSLog(@"%@", [objectArray2 lastObject]);
    
}

- (IBAction)addDeviceButton:(id)sender {
    NSRegularExpression *regex = [[NSRegularExpression alloc] initWithPattern:@"[0-9]{9}" options:NSRegularExpressionCaseInsensitive error:nil];
    
    //make sure it is a valid name and id
    if([regex numberOfMatchesInString:deviceId.text options:NSMatchingReportCompletion range:NSMakeRange(0, deviceId.text.length)] &&  deviceDescription.text.length > 0){
        [self addADeviceWithName:deviceDescription.text andID:deviceId.text];
        //[textField resignFirstResponder];
        
        [self.navigationController popViewControllerAnimated:YES];
        //TODO: go back to first view
        
        //check to make sure it is a valid id
        
        
        //[self.presentingViewController dismissModalViewControllerAnimated:YES];

    }else if (![regex numberOfMatchesInString:deviceId.text options:NSMatchingReportCompletion range:NSMakeRange(0, deviceId.text.length)]){
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Invalid Device ID" message:@"The device ID must be 9 digits with no letters or special characters" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
        [alert show];
        
        //check to make sure it is a valid name again
    }else if(deviceDescription.text.length <= 0){
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Invalid Device Name" message:@"You need to specify a device name" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
        [alert show];
    }


}


@end
