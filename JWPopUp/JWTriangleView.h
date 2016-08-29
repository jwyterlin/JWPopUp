//
//  JWTriangleView.h
//  JWPopUp
//
//  Created by Jhonathan Wyterlin on 26/08/16.
//  Copyright © 2016 Jhonathan Wyterlin. All rights reserved.
//

#import <UIKit/UIKit.h>

/*!
 * @typedef JWTriangleDirection
 * @brief A list of arrow directions.
 * @constant JWTriangleDirectionUp The arrow will point up.
 * @constant JWTriangleDirectionDown The arrow will point down.
 * @constant JWTriangleDirectionLeft The arrow will point left.
 * @constant JWTriangleDirectionRight The arrow will point right.
 */
typedef NS_ENUM(NSInteger, JWTriangleDirection) {
    JWTriangleDirectionUp,
    JWTriangleDirectionDown,
    JWTriangleDirectionLeft,
    JWTriangleDirectionRight
};

@interface JWTriangleView : UIView

/*!
 * @discussion A custom initializer with frame and color defined.
 * @param frame A CGRect to be used to define the frame of the view.
 * @param color An UIColor to define the main color of the view.
 * @return The pointer to the JWTriangleView's object created in the memory.
 */
-(id)initWithFrame:(CGRect)frame color:(UIColor *)color;

/*!
 * @discussion A custom initializer with frame and color defined.
 * @param frame A CGRect to be used to define the frame of the view.
 * @param triangleDirection An enum JWTriangleDirection to set the direction that the arrow will point.
 * @return The pointer to the JWTriangleView's object created in the memory.
 */
-(id)initWithFrame:(CGRect)frame triangleDirection:(JWTriangleDirection)triangleDirection;

/*!
 * @discussion A custom initializer with frame and color defined.
 * @param frame A CGRect to be used to define the frame of the view.
 * @param color An UIColor to define the main color of the view.
 * @param triangleDirection An enum JWTriangleDirection to set the direction that the arrow will point.
 * @return The pointer to the JWTriangleView's object created in the memory.
 */
-(id)initWithFrame:(CGRect)frame color:(UIColor *)color triangleDirection:(JWTriangleDirection)triangleDirection;

@end
