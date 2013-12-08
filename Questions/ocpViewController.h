//
//  ocpViewController.h
//  Questions
//
//  Created by Sanjeeve Manickam on 12/7/2013.
//  Copyright (c) 2013 Sanjeeve Manickam. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>
#import <CoreLocation/CoreLocation.h>

@interface ocpViewController : UIViewController <UINavigationControllerDelegate, UIImagePickerControllerDelegate, MFMailComposeViewControllerDelegate, CLLocationManagerDelegate>{
    UITextField *title;
    UITextField *categories;
    UITextField *question1;
    UITextField *question2;
    UITextField *question3;
    UITextField *question4;
}

@property (nonatomic, retain) IBOutlet UITextField *title;
@property (nonatomic, retain) IBOutlet UITextField *categories;
@property (nonatomic, retain) IBOutlet UITextField *question1;
@property (nonatomic, retain) IBOutlet UITextField *question2;
@property (nonatomic, retain) IBOutlet UITextField *question3;
@property (nonatomic, retain) IBOutlet UITextField *question4;

@property(nonatomic) NSMutableArray *capturedImages;

-(IBAction)submitQuestion:(id)sender;
//-(IBAction)attachPhoto:(id)sender;

@end
