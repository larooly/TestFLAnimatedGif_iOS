//
//  ViewController.m
//  TestGifEvent
//
//  Created by active on 2021/04/07.
//

#import "ViewController.h"
#import "FLAnimatedImage.h"//gif 오픈소스
#import "FLAnimatedImageView.h"//gif 오픈 소스

@interface ViewController ()

@end

@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self BasicStartGifViewSetting];
    [self BasicGifSetting:@"emo1"];
    
    //번외편
    //큰 버튼 조절 연습
    
    [_bigButton layoutIfNeeded];//이거 미리 안하면 사이즈 안맞으니 주의 (특히 처음 로딩시)
    AnimationView2 = [[FLAnimatedImageView alloc] init];
    AnimationView2.frame = CGRectMake(0, 0, _bigButton.bounds.size.width,_bigButton.bounds.size.height);
    AnimationView2.contentMode = UIViewContentModeScaleAspectFit;
    [_bigButton addSubview:AnimationView2];
    
    NSURL *SampleURL=[[NSBundle mainBundle]URLForResource:@"sample" withExtension:@"gif"];
    FLAnimatedImage * GifImage2 = [FLAnimatedImage animatedImageWithGIFData:[NSData dataWithContentsOfURL:SampleURL]];
    AnimationView2.animatedImage = GifImage2;
    
    [AnimationView2 startAnimating];
    [AnimationView2 setLoopCompletionBlock:^(NSUInteger loop){
        int num = (-1)*(int)loop;
        if((num%5)==0){//별로 안좋은 방법인데 생각나는 방법이 없다.
            [self->AnimationView2 stopAnimating];
            [self->AnimationView2 setLoopCompletionBlock:nil];
        }
    }];
    

}
-(void)BasicStartGifViewSetting{//이미지 뷰어 처음에만 하면 됨
    [_imageview layoutIfNeeded];//이거 미리 안하면 사이즈 안맞으니 주의 (특히 처음 로딩시)
    AnimationView = [[FLAnimatedImageView alloc] init];
    AnimationView.frame = CGRectMake(0, 0, _imageview.bounds.size.width,_imageview.bounds.size.height);
    AnimationView.contentMode = UIViewContentModeScaleAspectFit;
    [_imageview addSubview:AnimationView];
}
-(void)BasicGifSetting:(NSString*)GifName{
    //일단 기본 5번 돌면 멈추게 만들자
    NSURL *SampleURL=[[NSBundle mainBundle]URLForResource:GifName withExtension:@"gif"];
    FLAnimatedImage * GifImage = [FLAnimatedImage animatedImageWithGIFData:[NSData dataWithContentsOfURL:SampleURL]];
    AnimationView.animatedImage = GifImage;
    
    [AnimationView startAnimating];
    [AnimationView setLoopCompletionBlock:^(NSUInteger loop){
        int num = (-1)*(int)loop;
        if((num%5)==0){//별로 안좋은 방법인데 생각나는 방법이 없다.
            [self->AnimationView stopAnimating];
            [self->AnimationView setLoopCompletionBlock:nil];
        }
    }];
    
}

- (IBAction)Clickbtn4:(id)sender {
    [self BasicGifSetting:@"sample"];
}

- (IBAction)Clickbtn3:(id)sender {
    [self BasicGifSetting:@"emo3"];
}

- (IBAction)Clickbtn2:(id)sender {
    [self BasicGifSetting:@"emo2"];
}

- (IBAction)Clickbtn1:(id)sender {
    [self BasicGifSetting:@"emo1"];
}

- (IBAction)bigClick:(id)sender {
    NSURL *SampleURL=[[NSBundle mainBundle]URLForResource:@"sample" withExtension:@"gif"];
    FLAnimatedImage * GifImage2 = [FLAnimatedImage animatedImageWithGIFData:[NSData dataWithContentsOfURL:SampleURL]];
    AnimationView2.animatedImage = GifImage2;
    
    [AnimationView2 startAnimating];
    [AnimationView2 setLoopCompletionBlock:^(NSUInteger loop){
        int num = (-1)*(int)loop;
        if((num%5)==0){//별로 안좋은 방법인데 생각나는 방법이 없다.
            [self->AnimationView2 stopAnimating];
            [self->AnimationView2 setLoopCompletionBlock:nil];
        }
    }];
}
@end
