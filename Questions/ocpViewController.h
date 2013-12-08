//
//  ocpViewController.h
//  Questions
//
//  Created by Sanjeeve Manickam on 12/7/2013.
//  Copyright (c) 2013 Sanjeeve Manickam. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>

@interface ocpViewController : UIViewController <UINavigationControllerDelegate, UIImagePickerControllerDelegate, MFMailComposeViewControllerDelegate>{
    UITextField *title;
    UITextField *categories;
    UITextView *question;
}

@property (nonatomic, retain) IBOutlet UITextField *title;
@property (nonatomic, retain) IBOutlet UITextField *categories;
@property (nonatomic, retain) IBOutlet UITextView *question;

@property(nonatomic) NSMutableArray *capturedImages;

-(IBAction)submitQuestion:(id)sender;
//-(IBAction)attachPhoto:(id)sender;

@end
