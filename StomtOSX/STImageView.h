//
//  STImageView.h
//  StomtiOS
//
//  Created by Leonardo Cascianelli on 07/10/15.
//  Copyright (c) 2015 Leonardo Cascianelli. All rights reserved.
//

#import <AppKit/AppKit.h>

@class STImage;

/*!
 * This class permits to add your STImages to view hierarchy without worrying about 
 * asynchronous download, image placeholder and refresh.
 */
@interface STImageView : NSImageView

/// The placeholder to be displayed when the image is downloading or missing.
@property (nonatomic,strong) NSImage* placeholder;
/// The STImage instance that contains info about the actual image.
@property (nonatomic,strong) STImage* downloadManager;

/*!
 * @brief Creates an STImageView instance with the given STImage and placeholder.
 *
 * @param STImage @see STImage
 * @param placeholder The UIImage instance to be displayed when the desired image is downloading or missing.
 *
 * @return An instance of STImageView
 */
- (instancetype)initWithFrame:(CGRect)frame STImage:(STImage*)stImage placeholder:(NSImage*)placeholder;
@end
