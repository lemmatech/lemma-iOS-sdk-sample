//
//  ViewController.m
//  SampleApp
//
//  Created by Lemma on 23/01/21.
//

#import "InBannerVideoViewController.h"
@import LemmaSDK;

@interface InBannerVideoViewController ()<LMInBannerVideoDelegate>
@property (nonatomic, strong) LMInBannerVideo *banner;
@property (weak, nonatomic) IBOutlet UIButton *loadBtn;
@property (weak, nonatomic) IBOutlet UIButton *playAdBtn;
@end

@implementation InBannerVideoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[LemmaSDK shared] setStoreURL:[NSURL URLWithString:@"https://itunes.apple.com/us/app/sutiawbapp/id1166499?ls=1&mt=8"]];
    
    LMAdRequest *request = [LMAdRequest new];
    request.serverUrl = @"https://sampleads.free.beeceptor.com/vads";
    request.publisherId = @"169";
    request.adunitId = @"14688";
    
    self.banner = [[LMInBannerVideo alloc] initWithAdRequest:request andAdSize:CGSizeMake(360, 640)];
    
    self.banner.frame = CGRectMake(0, 320, CGRectGetWidth(self.view.frame), 400);
    self.banner.backgroundColor = [UIColor grayColor];
    self.banner.delegate = self;
    
    self.playAdBtn.enabled = NO;
    self.loadBtn.enabled = YES;
    
    [self.view addSubview:self.banner];
}

- (IBAction)loadBtnAction:(id)sender {
    [self.banner loadAd];
    self.loadBtn.enabled = NO;
}

- (IBAction)playBtnAction:(id)sender {
    [self.banner playAd];
    self.loadBtn.enabled = YES;
    self.playAdBtn.enabled = NO;
}

-(void)bannerView:(LMInBannerVideo *)bannerView didFailToReceiveAdWithError:(NSError *)error {
    NSLog(@"Error - %@",error.localizedDescription);
    self.loadBtn.enabled = YES;
}

-(void)bannerViewDidReceiveAd:(LMInBannerVideo *)bannerView {
    NSLog(@"Ad received successfully");
    self.playAdBtn.enabled = YES;
}

- (void)bannerViewDidFinishPlayingAd:(LMInBannerVideo *)bannerView {
    NSLog(@"Ad finished playing");
    self.loadBtn.enabled = YES;
}


@end
