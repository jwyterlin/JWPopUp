//
//  JWRoundedView.h
//  JWPopUp
//
//  Created by Jhonathan Wyterlin on 26/08/16.
//  Copyright © 2016 Jhonathan Wyterlin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JWRoundedView : UIView

/*!
 * @discussion A custom initializer with frame and color defined.
 * @param frame A CGRect to be used to define the frame of the view.
 * @param color An UIColor to define the main color of the view.
 * @return The pointer to the JWRoundedView's object created in the memory.
 */
-(id)initWithFrame:(CGRect)frame color:(UIColor *)color;

@end
