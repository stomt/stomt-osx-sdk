//
//  Stomt.h
//  StomtiOS
//
//  Created by Leonardo Cascianelli on 10/09/15.
//  Copyright (c) 2015 Leonardo Cascianelli. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AppKit/AppKit.h>
#import "block_declarations.h"
#import "StomtRequest.h"
#import "STUser.h"
#import "STCategory.h"
#import "STStats.h"
#import "STObject.h"
#import "STImage.h"
#import "STImageView.h"
#import "STFeed.h"
#import "STSearchFilterKeywords.h"

@class STUser;
@class STTarget;

/*!
 * @brief Handles connection to Stomt.
 */
@interface Stomt : NSObject

/*!
 * @brief The application ID.
 */
@property (nonatomic,strong) NSString* appid;

/*!
 * @brief The access token.
 */
@property (nonatomic,strong) NSString* accessToken;

/*!
 * @brief The refresh token, used to regenerate an access token.
 */
@property (nonatomic,strong) NSString* refreshToken;

/*!
 * @brief Is the user authenticated?
 * @warning Returns 'YES' even if anonymously authenticated.
 */
@property (nonatomic) BOOL isAuthenticated;

@property (nonatomic,strong) STUser* loggedUser;

+ (instancetype)sharedInstance;
+ (void)setAppID:(NSString *)appid;
- (void)setAccessToken:(NSString *)accessToken;

// Easy access
+ (NSString*)appID;
+ (NSString*)accessToken;
+ (NSString*)refreshToken;
+ (STUser*)loggedUser;

// Private
/// @warning Private usage only.
+ (void)setAPIHost:(NSString*)host;

/*!
 * @brief Unused.
 */
+ (void)requestNewAccessTokenInBackgroundWithBlock:(BooleanCompletion)completion; //Unused!

/*!
 * @brief Logout the current user.
 */
+ (void)logout; //Only works with connection.


@end
