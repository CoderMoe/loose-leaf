//
//  MMAllStacksManager.h
//  LooseLeaf
//
//  Created by Adam Wulf on 3/6/16.
//  Copyright © 2016 Milestone Made, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MMAllStacksManager : NSObject

+(MMAllStacksManager*) sharedInstance;

-(NSString*) stackDirectoryPathForUUID:(NSString*)uuid;

-(NSString*) createStack;

-(void) deleteStack:(NSString*)stackUUID;

-(NSArray*)stackIDs;

-(NSString*) nameOfStack:(NSString*)stackUUID;

@end