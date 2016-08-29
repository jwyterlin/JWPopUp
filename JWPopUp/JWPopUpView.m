//
//  JWPopUpView.m
//  JWPopUp
//
//  Created by Jhonathan Wyterlin on 26/08/16.
//  Copyright © 2016 Jhonathan Wyterlin. All rights reserved.
//

#import "JWPopUpView.h"

#import "JWTriangleView.h"
#import "JWRoundedView.h"

@interface JWPopUpView()

@property(nonatomic,strong) UIColor *color;
@property(nonatomic,strong) NSString *message;
@property(nonatomic,strong) UILabel *textLabel;
@property(nonatomic,strong) JWRoundedView *roundedView;

@end

@implementation JWPopUpView

#pragma mark - View Lifecycle

-(id)initWithFrame:(CGRect)frame {
    
    if ( self = [super initWithFrame:frame] ) {
        self.color = [self colorDefault];
        self.popUpViewArrow = [self popUpViewArrowDefault];
    }
    
    return self;
    
}

-(id)initWithFrame:(CGRect)frame color:(UIColor *)color {
    
    if ( self = [super initWithFrame:frame] ) {
        self.color = color;
        self.popUpViewArrow = [self popUpViewArrowDefault];
    }
    
    return self;
    
}

-(id)initWithFrame:(CGRect)frame message:(NSString *)message {
    
    if ( self = [super initWithFrame:frame] ) {
        self.color = [self colorDefault];
        self.popUpViewArrow = [self popUpViewArrowDefault];
        self.message = message;
    }
    
    return self;
    
}

-(id)initWithFrame:(CGRect)frame color:(UIColor *)color message:(NSString *)message {
    
    if ( self = [super initWithFrame:frame] ) {
        self.color = color;
        self.popUpViewArrow = [self popUpViewArrowDefault];
        self.message = message;
    }
    
    return self;
    
}

#pragma mark - Overriding super methods

-(void)didMoveToSuperview {
    
    [self setup];
    
}

#pragma mark - Private methods

-(void)setup {
    
    if ( ! self.color )
        self.color = [self colorDefault];
    
    self.backgroundColor = [UIColor clearColor];
    
    [self mountBackgroundView];
    
    [self setupMessage];
    
}

-(void)setupMessage {
    
    if ( self.message ) {
        
        CGFloat padding = 10.0f;
        
        CGFloat x = self.roundedView.frame.origin.x + padding;
        CGFloat y = self.roundedView.frame.origin.y + padding;
        CGFloat width = self.roundedView.frame.size.width - ( 2 * padding );
        CGFloat height = self.roundedView.frame.size.height - ( 2 * padding );
        
        self.textLabel.text = self.message;
        self.textLabel.frame = CGRectMake( x, y, width, height );
        self.textLabel.minimumScaleFactor = 10.0f / [self.textLabel.font pointSize];
        self.textLabel.adjustsFontSizeToFitWidth = YES;
        
        [self addSubview:self.textLabel];
        
    }
    
}

-(void)mountBackgroundView {
    
    __weak typeof(self) weakSelf = self;
    
    [self setFramesBackgroundViewWithCompletion:^(CGRect frameRoundedView, CGRect frameTriangleView) {
    
        weakSelf.roundedView = [[JWRoundedView alloc] initWithFrame:frameRoundedView color:weakSelf.color];
        [weakSelf addSubview:weakSelf.roundedView];
        
        if ( ! CGRectEqualToRect( frameTriangleView, CGRectZero ) ) {
        
            JWTriangleDirection triangleDirection = [weakSelf triangleDirectionByPopUpViewArrow];
            
            JWTriangleView *triangle = [[JWTriangleView alloc] initWithFrame:frameTriangleView color:weakSelf.color triangleDirection:triangleDirection];
            [weakSelf addSubview:triangle];
            
        }
        
    }];

}

-(JWTriangleDirection)triangleDirectionByPopUpViewArrow {
    
    JWTriangleDirection triangleDirection;
    
    if ( self.popUpViewArrow == JWPopUpViewArrowTop )
        triangleDirection = JWTriangleDirectionUp;
    else if ( self.popUpViewArrow == JWPopUpViewArrowBottom )
        triangleDirection = JWTriangleDirectionDown;
    else if ( self.popUpViewArrow == JWPopUpViewArrowLeft )
        triangleDirection = JWTriangleDirectionLeft;
    else if ( self.popUpViewArrow == JWPopUpViewArrowRight )
        triangleDirection = JWTriangleDirectionRight;
    
    return triangleDirection;
    
}

-(void)setFramesBackgroundViewWithCompletion:(void(^)(CGRect frameRoundedView, CGRect frameTriangleView))completion {
    
    CGFloat x = 0;
    CGFloat y = 0;
    CGFloat width = self.frame.size.width;
    CGFloat height = self.frame.size.height;
    
    if ( self.popUpViewArrow == JWPopUpViewArrowNone ) {
        
        CGRect frameRoundedView = CGRectMake( x, y, width, height );
        
        if ( completion )
            completion( frameRoundedView, CGRectZero );
        
        return;
        
    }
    
    CGFloat heightTriangle, widthTriangle, xTriangle, yTriangle;
    CGFloat xRoundedView, yRoundedView, widthRoundedView, heightRoundedView;
    
    if ( self.popUpViewArrow == JWPopUpViewArrowTop ) {
        
        heightTriangle = 10;
        widthTriangle = 20;
        xTriangle = x + width - ( widthTriangle * 1.5 );
        yTriangle = y;
        
        xRoundedView = x;
        yRoundedView = y + heightTriangle;
        widthRoundedView = width;
        heightRoundedView = height - heightTriangle;
        
    } else if ( self.popUpViewArrow == JWPopUpViewArrowBottom ) {
        
        heightTriangle = 10;
        widthTriangle = 20;
        xTriangle = x + width - ( widthTriangle * 1.5 );
        yTriangle = height - heightTriangle;
        
        xRoundedView = x;
        yRoundedView = y;
        widthRoundedView = width;
        heightRoundedView = height - heightTriangle;
        
    } else if ( self.popUpViewArrow == JWPopUpViewArrowLeft ) {
        
        heightTriangle = 20;
        widthTriangle = 10;
        xTriangle = x;
        yTriangle = y + height - ( heightTriangle * 1.5 );
        
        xRoundedView = x + widthTriangle;
        yRoundedView = y;
        widthRoundedView = width - widthTriangle;
        heightRoundedView = height;
        
    } else if ( self.popUpViewArrow == JWPopUpViewArrowRight ) {
        
        heightTriangle = 20;
        widthTriangle = 10;
        xTriangle = width - widthTriangle;
        yTriangle = y + height - ( heightTriangle * 1.5 );
        
        xRoundedView = x;
        yRoundedView = y;
        widthRoundedView = width - widthTriangle;
        heightRoundedView = height;
        
    }
    
    CGRect frameRoundedView = CGRectMake( xRoundedView, yRoundedView, widthRoundedView, heightRoundedView );
    CGRect frameTriangleView = CGRectMake( xTriangle, yTriangle, widthTriangle, heightTriangle );
    
    if ( completion )
        completion( frameRoundedView, frameTriangleView );
    
}

-(JWPopUpViewArrow)popUpViewArrowDefault {
    return JWPopUpViewArrowTop;
}

-(UIColor *)colorDefault {
    return [UIColor colorWithRed:16.0f/255.0f green:129.0f/255.0f blue:171.0f/255.0f alpha:1.0f];
}

#pragma mark - Lazy Instances

-(UILabel *)textLabel {
    
    if ( ! _textLabel ) {
        
        _textLabel = [UILabel new];
        _textLabel.textColor = [UIColor whiteColor];
        _textLabel.backgroundColor = [UIColor clearColor];
        _textLabel.numberOfLines = 0;
        
    }
    
    return _textLabel;
    
}

@end
