//
//  JWTriangleView.m
//  JWPopUp
//
//  Created by Jhonathan Wyterlin on 26/08/16.
//  Copyright © 2016 Jhonathan Wyterlin. All rights reserved.
//

#import "JWTriangleView.h"

@interface JWTriangleView()

@property(nonatomic,strong) UIColor *color;

@property(nonatomic) JWTriangleDirection triangleDirection;

@end

@implementation JWTriangleView

#pragma mark - View Lifecycle

-(id)initWithFrame:(CGRect)frame {
    
    if ( self = [super initWithFrame:frame] ) {
        
        self.backgroundColor = [self backgroundColorDefault];
        self.color = [self colorDefault];
        self.triangleDirection = [self triangleDirectionDefault];
        
    }
    
    return self;
    
}

-(id)initWithFrame:(CGRect)frame color:(UIColor *)color {
    
    if ( self = [super initWithFrame:frame] ) {
        
        self.backgroundColor = [self backgroundColorDefault];
        self.color = color;
        self.triangleDirection = [self triangleDirectionDefault];
        
    }
    
    return self;
    
}

-(id)initWithFrame:(CGRect)frame triangleDirection:(JWTriangleDirection)triangleDirection {
    
    if ( self = [super initWithFrame:frame] ) {
        
        self.backgroundColor = [self backgroundColorDefault];
        self.color = [self colorDefault];
        self.triangleDirection = triangleDirection;
        
    }
    
    return self;
    
}

-(id)initWithFrame:(CGRect)frame color:(UIColor *)color triangleDirection:(JWTriangleDirection)triangleDirection {
    
    if ( self = [super initWithFrame:frame] ) {
        
        self.backgroundColor = [self backgroundColorDefault];
        self.color = color;
        self.triangleDirection = triangleDirection;
        
    }
    
    return self;
    
}

#pragma mark - Overriding super methods

-(void)drawRect:(CGRect)rect {
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    CGContextBeginPath( ctx );
    
    if ( self.triangleDirection == JWTriangleDirectionUp ) {
    
        CGContextMoveToPoint   ( ctx, CGRectGetMidX( rect ), CGRectGetMinY( rect ) );  // top
        CGContextAddLineToPoint( ctx, CGRectGetMaxX( rect ), CGRectGetMaxY( rect ) );  // bottom right
        CGContextAddLineToPoint( ctx, CGRectGetMinX( rect ), CGRectGetMaxY( rect ) );  // bottom left
        
    } else if ( self.triangleDirection == JWTriangleDirectionDown ) {
        
        CGContextMoveToPoint   ( ctx, CGRectGetMidX( rect ), CGRectGetMaxY( rect ) );  // down
        CGContextAddLineToPoint( ctx, CGRectGetMaxX( rect ), CGRectGetMinY( rect ) );  // top right
        CGContextAddLineToPoint( ctx, CGRectGetMinX( rect ), CGRectGetMinY( rect ) );  // top left
        
    } else if ( self.triangleDirection == JWTriangleDirectionLeft ) {
        
        CGContextMoveToPoint   ( ctx, CGRectGetMinX( rect ), CGRectGetMidY( rect ) );  // mid left
        CGContextAddLineToPoint( ctx, CGRectGetMaxX( rect ), CGRectGetMinY( rect ) );  // top right
        CGContextAddLineToPoint( ctx, CGRectGetMaxX( rect ), CGRectGetMaxY( rect ) );  // bottom right
        
    } else if ( self.triangleDirection == JWTriangleDirectionRight ) {
        
        CGContextMoveToPoint   ( ctx, CGRectGetMaxX( rect ), CGRectGetMidY( rect ) );  // mid right
        CGContextAddLineToPoint( ctx, CGRectGetMinX( rect ), CGRectGetMinY( rect ) );  // top left
        CGContextAddLineToPoint( ctx, CGRectGetMinX( rect ), CGRectGetMaxY( rect ) );  // bottom left
        
    }
    
    CGContextClosePath( ctx );
    
    CGFloat red, green, blue, alpha;
    [self.color getRed:&red green:&green blue:&blue alpha:&alpha];
    
    CGContextSetRGBFillColor( ctx, red, green, blue, alpha );
    CGContextFillPath( ctx );
    
}

#pragma mark - Private methods

-(UIColor *)backgroundColorDefault {
    return [UIColor clearColor];
}

-(UIColor *)colorDefault {
    return [UIColor colorWithRed:16.0f/255.0f green:129.0f/255.0f blue:171.0f/255.0f alpha:1.0f];
}

-(JWTriangleDirection)triangleDirectionDefault {
    return JWTriangleDirectionUp;
}

@end
