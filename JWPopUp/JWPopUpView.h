//
//  JWPopUpView.h
//  JWPopUp
//
//  Created by Jhonathan Wyterlin on 26/08/16.
//  Copyright © 2016 Jhonathan Wyterlin. All rights reserved.
//

#import <UIKit/UIKit.h>

/*!
 * @typedef JWPopUpViewArrow
 * @brief A list of pop up view arrow directions.
 * @constant JWPopUpViewArrowNone None arrow will appear.
 * @constant JWPopUpViewArrowTop The arrow will appear on top of the view.
 * @constant JWPopUpViewArrowTopLeft The arrow will appear on top and left of the view.
 * @constant JWPopUpViewArrowTopCenter The arrow will appear on top and center of the view.
 * @constant JWPopUpViewArrowTopRight The arrow will appear on top and right of the view.
 * @constant JWPopUpViewArrowBottom The arrow will appear at the bottom of the view.
 * @constant JWPopUpViewArrowLeft The arrow will appear at the left of the view.
 * @constant JWPopUpViewArrowRight The arrow will appear at the right of the view.
 */
typedef NS_ENUM(NSInteger, JWPopUpViewArrow) {
    JWPopUpViewArrowNone,
    JWPopUpViewArrowTop,
    JWPopUpViewArrowTopLeft,
    JWPopUpViewArrowTopCenter,
    JWPopUpViewArrowTopRight,
    JWPopUpViewArrowBottom,
    JWPopUpViewArrowLeft,
    JWPopUpViewArrowRight
};

@interface JWPopUpView : UIView

/*!
 * @discussion A custom initializer with frame and color defined.
 * @param frame A CGRect to be used to define the frame of the view.
 * @param color An UIColor to define the main color of the view.
 * @return The pointer to the JWPopUpView's object created in the memory.
 */
-(id)initWithFrame:(CGRect)frame color:(UIColor *)color;

/*!
 * @discussion A custom initializer with frame and color defined.
 * @param frame A CGRect to be used to define the frame of the view.
 * @param message An NSString to define the message that will appear on the view.
 * @return The pointer to the JWPopUpView's object created in the memory.
 */
-(id)initWithFrame:(CGRect)frame message:(NSString *)message;

/*!
 * @discussion A custom initializer with frame and color defined.
 * @param frame A CGRect to be used to define the frame of the view.
 * @param color An UIColor to define the main color of the view.
 * @param message An NSString to define the message that will appear on the view.
 * @return The pointer to the JWPopUpView's object created in the memory.
 */
-(id)initWithFrame:(CGRect)frame color:(UIColor *)color message:(NSString *)message;

/*!
 * @brief An enum to define where the arrow will appear.
 */
@property(nonatomic) JWPopUpViewArrow popUpViewArrow;

@end
