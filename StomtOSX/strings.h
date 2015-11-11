//
//  strings.h
//  StomtiOS
//
//  Created by Leonardo Cascianelli on 15/09/15.
//  Copyright (c) 2015 Leonardo Cascianelli. All rights reserved.
//

#ifndef StomtOSX_strings_h
#define StomtOSX_strings_h

#define kToken @"[STOMT]Token"
#define kRToken @"[STOMT]RefreshToken"
#define kCurrentUser @"[STOMT]CurrentUser"

static const NSString* kAPIURL;

#define kLoginPath @"/authentication/authorize/token"
#define kStomtCreationPath @"/stomts"
#define kImageUploadPath @"/images"
#define kLogoutPath @"/authentication/session"
#define kFacebookLoginPath @"/authentication/session"
#define kReadStomtPath @"/stomts/"
#define kSearchPath @"/search/stomts/"
#define kGetTargetPath @"/targets/"
#define kGetBasicTargetPath @"/targets/"
#define kAuthorizePath @"/authentication/authorize"

#define kD_Id @"id"
#define kD_DisplayName @"displayname"
#define kD_Category @"category"
#define kD_Images @"images"
#define kD_Profile @"profile"
#define kD_Avatar @"avatar"
#define kD_Url @"url"
#define kD_Stats @"stats"
#define kD_Verified @"verified"
#define kD_User @"user"
#define kD_AccessToken @"accesstoken"
#define kD_RefreshToken @"refreshtoken"
#define kD_NewUser @"newuser"

#endif
