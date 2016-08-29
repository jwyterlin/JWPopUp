//
//  JWRoundedView.m
//  JWPopUp
//
//  Created by Jhonathan Wyterlin on 26/08/16.
//  Copyright © 2016 Jhonathan Wyterlin. All rights reserved.
//

#import "JWRoundedView.h"

@interface JWRoundedView()

@property(nonatomic,strong) UIColor *color;

@end

@implementation JWRoundedView

#pragma mark - View Lifecycle

-(id)initWithFrame:(CGRect)frame {
    
    if ( self = [super initWithFrame:frame] ) {
        
        self.color = [self colorDefault];
        [self setup];
        
    }
    
    return self;
    
}

-(id)initWithFrame:(CGRect)frame color:(UIColor *)color {
    
    if ( self = [super initWithFrame:frame] ) {
        
        self.color = color;
        [self setup];
        
    }
    
    return self;
    
}

#pragma mark - Private methods

-(void)setup {
    
    self.backgroundColor = self.color;
    self.layer.cornerRadius = 7.0f;
    
}

-(UIColor *)colorDefault {
    return [UIColor colorWithRed:16.0f/255.0f green:129.0f/255.0f blue:171.0f/255.0f alpha:1.0f];
}

@end
