//
//  InternetCheck.m
//  Radius
//
//  Created by M. Arqam Owais on 2/22/18.
//  Copyright © 2017 M. Arqam Owais. All rights reserved.
//

#import "InternetCheck.h"

//static BOOL internetConnectivityChecked = NO;
//static BOOL gotInternet = NO;

#define kNetworkError @"No connection found – Updated will not be available unless connected to the internet."
#define kServerDownError @"Server is temporarily unavailable, please try after few minutes."

@implementation InternetCheck

+(BOOL)IsConnected {
    //if(internetConnectivityChecked)
    //    return gotInternet;
    
    Reachability *reachability = [Reachability reachabilityForInternetConnection];
    NetworkStatus networkStatus = [reachability currentReachabilityStatus];
    return networkStatus != NotReachable;
}

+(NSString*)errorMessageForNetworkOrServerDown {
    //Check for internet or our backend server availabilty and provide approperiate error!
    BOOL isConnectedWithInternet = [InternetCheck IsConnected];
    
    if (isConnectedWithInternet) {
        return kServerDownError;
    }
    
    return kNetworkError;
}

@end

