//
//  ocpViewController.m
//  Questions
//
//  Created by Sanjeeve Manickam on 12/7/2013.
//  Copyright (c) 2013 Sanjeeve Manickam. All rights reserved.
//

#import "ocpViewController.h"
#import <MessageUI/MessageUI.h>


@interface ocpViewController ()

@end

@implementation ocpViewController
@synthesize title, categories, question;

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



-(IBAction)submitQuestion:(id)sender
{
    // Email Subject
    NSString *emailTitle = title.text;
    // Email Content
    
    NSMutableString* body = [[NSMutableString alloc]init];
    
    if ([self.capturedImages count] >0){
        [body appendFormat:@"[category %@]\n\n %@", categories.text, question.text];
    }
    
    NSString *messageBody = [NSString stringWithString:body];
    // To address
    NSArray *toRecipents = [NSArray arrayWithObject:@"mave560hima@post.wordpress.com"];
    
    MFMailComposeViewController *mc = [[MFMailComposeViewController alloc] init];
    mc.mailComposeDelegate = self;
    [mc setSubject:emailTitle];
    [mc setMessageBody:messageBody isHTML:NO];
    [mc setToRecipients:toRecipents];
    
    // Present mail view controller on screen
    [self presentViewController:mc animated:YES completion:NULL];
}


@end
