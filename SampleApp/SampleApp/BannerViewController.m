//
//  ViewController.m
//  SampleApp
//
//  Created by Lemma on 23/01/21.
//

#import "BannerViewController.h"
@import LemmaSDK;

@interface BannerViewController ()<LMBannerViewDelegate>
@end

@implementation BannerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[LemmaSDK shared] setStoreURL:[NSURL URLWithString:@"https://itunes.apple.com/us/app/sutiawbapp/id1166499?ls=1&mt=8"]];
    
    LMAdRequest *request = [LMAdRequest new];
    request.publisherId = @"169";
    request.adunitId = @"14688";

    LMBannerView *banner = [[LMBannerView alloc] initWithAdRequest:request andAdSize:CGSizeMake(640, 360)];
    
    banner.frame = CGRectMake(30, 100, 320, 50);
    banner.refreshInterval = 12;
    banner.backgroundColor = [UIColor grayColor];
    banner.delegate = self;
    
    [self.view addSubview:banner];
    [banner loadAd];
    
}

-(void)bannerView:(LMBannerView *)bannerView didFailToReceiveAdWithError:(NSError *)error {
    NSLog(@"Error - %@",error.localizedDescription);
}

-(void)bannerViewDidReceiveAd:(LMBannerView *)bannerView {
    NSLog(@"Ad received successfully");
}

@end
