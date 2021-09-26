//
//  InterstitialViewController.m
//  SampleApp
//
//  Created by Lemma on 19/02/21.
//

#import "InterstitialViewController.h"
@import LemmaSDK;

@interface InterstitialViewController ()<LMInterstitialAdDelegate>
@property LMInterstitialAd *instlAd;
@property (weak, nonatomic) IBOutlet UIButton *loadBtn;
@property (weak, nonatomic) IBOutlet UIButton *showBtn;

@end

@implementation InterstitialViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.showBtn.enabled = NO;
}

- (IBAction)loadBtnAction:(id)sender {
    LMAdRequest *request = [LMAdRequest new];
    request.publisherId = @"169";
    request.adunitId = @"14687";
    
    self.instlAd = [[LMInterstitialAd alloc] initWithAdRequest:request];
    
    // Switch to video
     self.instlAd.switchToVideo = YES;
    
    self.instlAd.delegate = self;

    [self.instlAd loadAd];
    self.loadBtn.enabled = NO;
}

- (IBAction)showBtnAction:(id)sender {
    [self.instlAd showFromViewController:self];
    self.loadBtn.enabled = YES;
    self.showBtn.enabled = NO;
}

- (void)interstitialDidReceiveAd:(LMInterstitialAd *)interstitial {
    self.showBtn.enabled = YES;
}

- (void)interstitial:(LMInterstitialAd *)interstitial didFailToReceiveAdWithError:(NSError *)error {
    self.loadBtn.enabled = YES;
}
@end
