//
//  ViewController.m
//  youtubeEmbed
//
//  Created by raja on 2016-03-03.
//  Copyright © 2016 Vishal. All rights reserved.
//

#import "YoutubeViewController.h"

@interface YoutubeViewController ()

@property(nonatomic, strong) IBOutlet YTPlayerView *playerView;
//@property(nonatomic, strong) IBOutlet
@property (weak, nonatomic) IBOutlet UIButton *playlistCountingButton;
@property (weak, nonatomic) IBOutlet UIButton *playlistAdditionButton;
@property (weak, nonatomic) IBOutlet UIButton *playlistSubtractionButton;
@property (weak, nonatomic) IBOutlet UIButton *playlistShapeButton;
@property (weak, nonatomic) IBOutlet UIButton *previousVidButton;
@property (weak, nonatomic) IBOutlet UIButton *playVidButton;
@property (weak, nonatomic) IBOutlet UIButton *prevVidButton;
@property (weak, nonatomic) IBOutlet UIImageView *thumbnailView;


@end

@implementation YoutubeViewController

- (void)setButtonLayout:(UIButton*) button{
    
    [[button layer] setCornerRadius:4.0f];
    [[button layer] setBorderWidth:1.0f];
    [[button layer] setBorderColor:[UIColor lightGrayColor].CGColor];
}

- (void) setShadows: (UIButton*) button{
    
    button.layer.cornerRadius = 4.0f;
    button.layer.masksToBounds = NO;
    
    button.layer.shadowColor = [UIColor blackColor].CGColor;
    button.layer.shadowOpacity = 0.8;
    button.layer.shadowRadius = 12;
    button.layer.shadowOffset = CGSizeMake(12.0f, 12.0f);
}


// sets video parameters
- (NSDictionary *)setVidPara {
    NSDictionary *playerVars = @{
                                 @"playsinline": @0,
                                 @"loop": @1,
                                 @"controls": @0,
                                 @"nologo": @1,
                                 @"autoplay": @1,
                                 @"controls": @0,
                                 @"disablekb": @1,
                                 @"enablejsapi": @1,
                                 @"modestbranding": @1,
                                 @"rel": @0,
                                 @"showinfo": @0,
                                 @"autohide": @1,
                                 @"color": @"white",
                                 @"iv_load_policy": @3,
                                 @"frameborder": @0,
                                 @"fs": @1,
                                 };
    
    return playerVars;
}//F9B243

- (void)selectPlayList:(int) IDnum{
    [[self playlistCountingButton] setEnabled:YES];
    [[self playlistAdditionButton] setEnabled:YES];
    [[self playlistSubtractionButton] setEnabled:YES];
    [[self playlistShapeButton] setEnabled:YES];
    
//    [self.playerView setBackgroundColor:[UIColor whiteColor]];
//    
//    NSURL *url = [[self playerView] videoUrl];
//    [[[self thumbnailView] setImage:<#(UIImage * _Nullable)#>];
    
    
    
//    [self.playerView setImageWithURL:[NSURL URLWithString:@"http://img.youtube.com/vi/LKk6SvGmJj4/1.jpg"] placeholderImage:[UIImage imageNamed:@"placeholder-avatar"]];
    
    if(IDnum==1){
        NSDictionary *vars = [self setVidPara];
        
        [self.playerView loadWithPlaylistId:@"PLbyOj3J9avYW7hT5I7RgxXwTYepUB72GY" playerVars:vars];
        [[self playlistCountingButton] setEnabled:NO];
    }
    else if(IDnum==2){
        NSDictionary *vars = [self setVidPara];
        
        [self.playerView loadWithPlaylistId:@"PLbyOj3J9avYVbwDpLm65Chhtd-G9CTP7J" playerVars:vars];
        [[self playlistAdditionButton] setEnabled:NO];
    }
    else if(IDnum==3){
        NSDictionary *vars = [self setVidPara];
        
        [self.playerView loadWithPlaylistId:@"PLbyOj3J9avYVT4eyM4GDk2nh2GdBGNo0p" playerVars:vars];
        [[self playlistSubtractionButton] setEnabled:NO];
    }
    else if(IDnum==4){
        NSDictionary *vars = [self setVidPara];
        
        [self.playerView loadWithPlaylistId:@"PLbyOj3J9avYWisg1kIZDcnaPnen7Mj0np" playerVars:vars];
        [[self playlistShapeButton] setEnabled:NO];
    }
}

//loads the video for the view
- (void) loadVideo {
    [self selectPlayList:1];
}

//plays counting playlist
- (IBAction)playlistCountingButton:(id)sender {
    [self selectPlayList:1];
}

- (IBAction)playlistAdditionButton:(id)sender {
    [self selectPlayList:2];
}

- (IBAction)playlistSubtractionButton:(id)sender {
    [self selectPlayList:3];
}

- (IBAction)playlistShapeButton:(id)sender {
    [self selectPlayList:4];
}

//plays video
- (IBAction)playVideo:(id)sender {
    [self.playerView playVideo];
}

//plays next video in playlist
- (IBAction)nextVideo:(id)sender {
    [self.playerView nextVideo];
    [self.playerView stopVideo];
}

//plays video
- (IBAction)previousVideo:(id)sender {
    [self.playerView previousVideo];
    [self.playerView stopVideo];
}

/*
 player.getPlayerState():Number
 Returns the state of the player. Possible values are:
 -1 – unstarted
 0 – ended
 1 – playing
 2 – paused
 3 – buffering
 5 – video cued
 
 */

//
//- (IBAction)stopVideo:(id)sender {
//    [self.playerView stopVideo];
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //playsinline plays vid in app rather than playing full screen
    
    self.navigationItem.title = @"Tutorial";
    
    
    
    [[self.playerView layer] setBorderWidth:1.0f];
    [[self.playerView layer] setBorderColor:[UIColor blackColor].CGColor];
    [[self.playerView layer] setCornerRadius:10.0f];
    self.playerView.clipsToBounds = YES;
    
    //setting button layouts
    [self setButtonLayout:(_previousVidButton)];
    [self setButtonLayout:(_playVidButton)];
    [self setButtonLayout:(_prevVidButton)];
    [self setButtonLayout:(_playlistCountingButton)];
    [self setButtonLayout:(_playlistAdditionButton)];
    [self setButtonLayout:(_playlistSubtractionButton)];
    [self setButtonLayout:(_playlistShapeButton)];
    
    //setting shadows
    [self setShadows:(_playlistCountingButton)];
    [self setShadows:(_playlistAdditionButton)];
    [self setShadows:(_playlistSubtractionButton)];
    [self setShadows:(_playlistShapeButton)];
    
    // load the video
    [self loadVideo];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
