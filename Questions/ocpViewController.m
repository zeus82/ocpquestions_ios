//
//  ocpViewController.m
//  Questions
//
//  Created by Sanjeeve Manickam on 12/7/2013.
//  Copyright (c) 2013 Sanjeeve Manickam. All rights reserved.
//

#import "ocpViewController.h"


@interface ocpViewController ()

@property (nonatomic, weak) IBOutlet UIImageView *imageView;
@property (nonatomic) IBOutlet UIView *overlayView;
@property (nonatomic) UIImagePickerController *imagePickerController;


@property (nonatomic, weak) IBOutlet UIBarButtonItem *takePictureButton;
@property (nonatomic, weak) IBOutlet UIBarButtonItem *startStopButton;
@property (nonatomic, weak) IBOutlet UIBarButtonItem *delayedPhotoButton;
@property (nonatomic, weak) IBOutlet UIBarButtonItem *doneButton;

@end

@implementation ocpViewController
@synthesize title, categories, question;

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.capturedImages = [[NSMutableArray alloc] init];
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
    [body appendFormat:@"[category %@]\n\n %@", categories.text, question.text];
    
    NSString *messageBody = [NSString stringWithString:body];
    // To address
    NSArray *toRecipents = [NSArray arrayWithObject:@"mave560hima@post.wordpress.com"];
    
    MFMailComposeViewController *mc = [[MFMailComposeViewController alloc] init];
    mc.mailComposeDelegate = self;
    [mc setSubject:emailTitle];
    [mc setMessageBody:messageBody isHTML:NO];
    [mc setToRecipients:toRecipents];

    if ([self.capturedImages count] >0){
        NSData *myData = UIImagePNGRepresentation(self.capturedImages[0]);
        [mc addAttachmentData:myData mimeType:@"image/png" fileName:@"image.png"];
    }
    
    // Present mail view controller on screen
    [self presentViewController:mc animated:YES completion:NULL];
}


- (IBAction)showImagePickerForCamera:(id)sender
{
    if (self.capturedImages.count > 0)
    {
        [self.capturedImages removeAllObjects];
    }
    
    UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
    imagePickerController.modalPresentationStyle = UIModalPresentationCurrentContext;
    imagePickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
    imagePickerController.delegate = self;

    imagePickerController.showsCameraControls = YES;
    
    /*
     Load the overlay view from the OverlayView nib file. Self is the File's Owner for the nib file, so the overlayView outlet is set to the main view in the nib. Pass that view to the image picker controller to use as its overlay view, and set self's reference to the view to nil.
     */
    [[NSBundle mainBundle] loadNibNamed:@"OverlayView" owner:self options:nil];
    self.overlayView.frame = imagePickerController.cameraOverlayView.frame;
    imagePickerController.cameraOverlayView = self.overlayView;
    self.overlayView = nil;
    
    
    self.imagePickerController = imagePickerController;
    [self presentViewController:self.imagePickerController animated:YES completion:nil];

}



- (void)finishAndUpdate
{
    [self dismissViewControllerAnimated:YES completion:NULL];
    
    if ([self.capturedImages count] > 0)
    {
        if ([self.capturedImages count] == 1)
        {
            // Camera took a single picture.
            [self.imageView setImage:[self.capturedImages objectAtIndex:0]];
        }
        
        // To be ready to start again, clear the captured images array.
        //[self.capturedImages removeAllObjects];
    }
    
    self.imagePickerController = nil;
}




// This method is called when an image has been chosen from the library or taken from the camera.
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage *image = [info valueForKey:UIImagePickerControllerOriginalImage];
    
    [self.capturedImages addObject:image];
    
    [self finishAndUpdate];
}


- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [self dismissViewControllerAnimated:YES completion:NULL];
}


- (void)mailComposeController:(MFMailComposeViewController*)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error
{
    [self dismissViewControllerAnimated:YES completion:NULL];
}

@end
