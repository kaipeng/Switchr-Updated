//
//  AddADevice.h
//  Switchr
//
//  Created by Jeffrey Kiske on 12/16/11.
//  Copyright (c) 2011 University Of Pennsylvania. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Device.h"
#import "DeviceCell.h"
#import "Home.h"

@interface AddADevice : UIViewController <UITextFieldDelegate>{
    NSUserDefaults *defaults;
    __weak IBOutlet UITextField *deviceDescription;
    __weak IBOutlet UITextField *deviceId;
}
- (void)addADeviceWithName:(NSString *)dname andID:(NSString *)did;

- (IBAction)addDeviceButton:(id)sender;


@end
