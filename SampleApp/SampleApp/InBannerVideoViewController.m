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
    
    self.banner.frame = CGRectMake(0, 0, CGRectGetWidth(self.view.frame), 400);
    self.banner.backgroundColor = [UIColor grayColor];
    self.banner.delegate = self;
    
    [self.view addSubview:self.banner];
    [self.banner loadAd];
    
}

-(void)bannerView:(LMInBannerVideo *)bannerView didFailToReceiveAdWithError:(NSError *)error {
    NSLog(@"Error - %@",error.localizedDescription);
}

-(void)bannerViewDidReceiveAd:(LMInBannerVideo *)bannerView {
    [bannerView playAd];
    NSLog(@"Ad received successfully");
}

@end
