//
//  MMImageSlidingSidebarView.m
//  LooseLeaf
//
//  Created by Adam Wulf on 3/29/14.
//  Copyright (c) 2014 Milestone Made, LLC. All rights reserved.
//

#import "MMImageSidebarContainerView.h"
#import "MMImageSidebarContentView.h"
#import "MMImageViewButton.h"
#import "Constants.h"

@implementation MMImageSidebarContainerView{
    MMImageSidebarContentView* contentView;
    MMImageViewButton* photoAlbumButton;
    MMImageViewButton* cameraAlbumButton;
    MMImageViewButton* twitterAlbumButton;
    MMImageViewButton* facebookAlbumButton;
    MMImageViewButton* evernoteAlbumButton;
}

@dynamic delegate;

- (id)initWithFrame:(CGRect)frame forButton:(MMSidebarButton *)_button animateFromLeft:(BOOL)fromLeft{
    self = [super initWithFrame:frame forButton:_button animateFromLeft:fromLeft];
    if (self) {
        
        CGRect contentBounds = [sidebarContentView contentBounds];
        
        CGRect buttonBounds = contentBounds;
        buttonBounds.origin.y = [UIApplication sharedApplication].statusBarFrame.size.height;
        buttonBounds.size.height = kWidthOfSidebarButton; // includes spacing buffer
        
        contentBounds.origin.y = buttonBounds.origin.y + buttonBounds.size.height;
        contentBounds.size.height -= buttonBounds.size.height;
        
        // Initialization code
        contentView = [[MMImageSidebarContentView alloc] initWithFrame:contentBounds];
        contentView.delegate = self;
        [sidebarContentView addSubview:contentView];
        
        photoAlbumButton = [[MMImageViewButton alloc] initWithFrame:CGRectMake(buttonBounds.origin.x, buttonBounds.origin.y,
                                                                               kWidthOfSidebarButton, kWidthOfSidebarButton)];
        [photoAlbumButton setImage:[UIImage imageNamed:@"photoalbum"]];
        [sidebarContentView addSubview:photoAlbumButton];

        cameraAlbumButton = [[MMImageViewButton alloc] initWithFrame:CGRectMake(buttonBounds.origin.x + kWidthOfSidebarButton, buttonBounds.origin.y,
                                                                               kWidthOfSidebarButton, kWidthOfSidebarButton)];
        [cameraAlbumButton setImage:[UIImage imageNamed:@"camera"]];
        [sidebarContentView addSubview:cameraAlbumButton];

        
        twitterAlbumButton = [[MMImageViewButton alloc] initWithFrame:CGRectMake(buttonBounds.origin.x + 2*kWidthOfSidebarButton, buttonBounds.origin.y,
                                                                                kWidthOfSidebarButton, kWidthOfSidebarButton)];
        [twitterAlbumButton setImage:[UIImage imageNamed:@"twitter"]];
        [sidebarContentView addSubview:twitterAlbumButton];
        
        facebookAlbumButton = [[MMImageViewButton alloc] initWithFrame:CGRectMake(buttonBounds.origin.x + 3*kWidthOfSidebarButton, buttonBounds.origin.y,
                                                                                 kWidthOfSidebarButton, kWidthOfSidebarButton)];
        [facebookAlbumButton setImage:[UIImage imageNamed:@"facebook"]];
        [sidebarContentView addSubview:facebookAlbumButton];
        
        evernoteAlbumButton = [[MMImageViewButton alloc] initWithFrame:CGRectMake(buttonBounds.origin.x + 4*kWidthOfSidebarButton, buttonBounds.origin.y,
                                                                                  kWidthOfSidebarButton, kWidthOfSidebarButton)];
        [evernoteAlbumButton setImage:[UIImage imageNamed:@"evernote"]];
        [sidebarContentView addSubview:evernoteAlbumButton];
        
}
    return self;
}

-(void) show:(BOOL)animated{
    [super show:animated];
    [contentView show:animated];
}

-(void) hide:(BOOL)animated{
    [super hide:animated];
    [contentView hide:animated];
}

-(void) photoWasTapped:(ALAsset *)asset fromView:(MMBufferedImageView *)bufferedImage{
    [self.delegate photoWasTapped:asset fromView:bufferedImage];
}


@end
