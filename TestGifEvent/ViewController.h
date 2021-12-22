//
//  ViewController.h
//  TestGifEvent
//
//  Created by active on 2021/04/07.
//

#import <UIKit/UIKit.h>
#import "FLAnimatedImage.h"
#import "FLAnimatedImageView.h"
@interface ViewController : UIViewController{
    FLAnimatedImageView *AnimationView;
    FLAnimatedImageView *AnimationView2;
}

@property (weak, nonatomic) IBOutlet UIImageView *imageview;
- (IBAction)Clickbtn1:(id)sender;
- (IBAction)Clickbtn2:(id)sender;
- (IBAction)Clickbtn3:(id)sender;
- (IBAction)Clickbtn4:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *bigButton;
- (IBAction)bigClick:(id)sender;

@end

