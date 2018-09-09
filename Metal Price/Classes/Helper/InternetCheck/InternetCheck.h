//
//  InternetCheck.h
//  
//
//  Created by M. Arqam Owais on 2/22/18.
//  Copyright © 2017 M. Arqam Owais. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Reachability/Reachability.h"

@interface InternetCheck : NSObject {
}

+(BOOL)IsConnected;
+(NSString*)errorMessageForNetworkOrServerDown;

@end
