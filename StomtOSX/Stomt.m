//
//  Stomt.m
//  StomtiOS
//
//  Created by Leonardo Cascianelli on 10/09/15.
//  Copyright (c) 2015 Leonardo Cascianelli. All rights reserved.
//

#define __DBG__

#import "Stomt.h"
#import "dbg.h"
#import "StomtRequest.h"
#import "declarations.h"
#import "STTarget.h"
#import "STUser.h"

NSString* kAPIURL;

@interface Stomt ()
- (void)setup;
@end

@implementation Stomt

@synthesize loggedUser;

#pragma mark Setup

+ (instancetype)sharedInstance
{
	static Stomt* privateInstance = nil;
	if(!privateInstance)
	{
		privateInstance = [[Stomt alloc] init];
		[privateInstance setup];
	}
	return privateInstance;
}

- (void)setup
{
	kAPIURL = @"https://rest.stomt.com";
	NSLog(@"%@",kAPIURL);
}

+ (void)setAppID:(NSString *)appid
{
	if(!appid) _err("No appid. Aborting...");
	[Stomt sharedInstance].appid = appid;
error:
	return;
}

#pragma mark Authentication Related

+ (void)logout
{
	if(![Stomt sharedInstance].appid) _err("No AppID set. Aborting logout...");
	
	@synchronized(self)
	{
        // logout on client side
        [Stomt sharedInstance].accessToken = nil;
        [Stomt sharedInstance].refreshToken = nil;
		[Stomt sharedInstance].loggedUser = nil;
		
        // logout on server side
		StomtRequest* logoutRequest = [StomtRequest logoutRequest];
		[logoutRequest logoutInBackgroundWithBlock:nil];
	}
	
error:
	return;
}

#pragma mark TODO

// NOT YET IMPLEMENTED -----------
+ (void)requestNewAccessTokenInBackgroundWithBlock:(BooleanCompletion)completion
{
	NSString* access = [Stomt sharedInstance].accessToken;
	NSString* refresh = [Stomt sharedInstance].refreshToken;
	if(access && refresh)
	{
		//Magic not available.
		return;
	}
error:
	_warn("Requesting new token without logging in first!");
}
// NOT YET IMPLEMENTED -----------

#pragma mark Private
+ (void)setAPIHost:(NSString *)host
{
	kAPIURL = host;
}

- (void)setLoggedUser:(STUser *)user
{
	NSData *usr = [NSKeyedArchiver archivedDataWithRootObject:user];
	[[NSUserDefaults standardUserDefaults] setObject:usr forKey:kCurrentUser];
	[[NSUserDefaults standardUserDefaults] synchronize];
}

- (STUser*)loggedUser
{
	if(!loggedUser)
	{
		NSData *extUser = [[NSUserDefaults standardUserDefaults] objectForKey:kCurrentUser];
		STUser *usr = [NSKeyedUnarchiver unarchiveObjectWithData:extUser];
		if(usr)
		{
			loggedUser = usr;
		}
	}
	return loggedUser;
}

#pragma mark Accessory

+ (NSString*)appID //Easy access appid from class
{
	return [Stomt sharedInstance].appid;
}

+ (NSString*)accessToken //Easy access accessToken from class
{
	return [Stomt sharedInstance].accessToken;
}

+ (NSString*)refreshToken //Easy access refreshToken from class
{
	return [Stomt sharedInstance].refreshToken;
}

+ (STUser*)loggedUser //Easy access to the authenticated user. (Not anonymous!)
{
	return [Stomt sharedInstance].loggedUser;
}

+ (BOOL)isAuthenticated //Easy access isAuthenticated from class
{
	return [Stomt sharedInstance].accessToken != nil;
}

#pragma mark Private accessors

- (void)setAccessToken:(NSString *)accessToken
{
	@synchronized(self)
	{
		[[NSUserDefaults standardUserDefaults] setObject:accessToken forKey:kToken];
		[[NSUserDefaults standardUserDefaults] synchronize];
	}
}

- (NSString*)accessToken
{
	return [[NSUserDefaults standardUserDefaults] objectForKey:kToken];
}

- (void)setRefreshToken:(NSString *)refreshToken
{
	@synchronized(self)
	{
		[[NSUserDefaults standardUserDefaults] setObject:refreshToken forKey:kRToken];
		[[NSUserDefaults standardUserDefaults] synchronize];
	}
}

- (NSString*)refreshToken
{
	return [[NSUserDefaults standardUserDefaults] objectForKey:kRToken];
}

#pragma mark UI


@end
