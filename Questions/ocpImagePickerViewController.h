//
//  ocpImagePickerViewController.h
//  Questions
//
//  Created by Sanjeeve Manickam on 12/7/2013.
//  Copyright (c) 2013 Sanjeeve Manickam. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ocpImagePickerViewController : UIViewController <UINavigationControllerDelegate, UIImagePickerControllerDelegate>{
    NSMutableArray *capturedImages;
}

@end
