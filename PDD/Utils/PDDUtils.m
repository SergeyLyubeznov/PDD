//
//  PDDUtils.m
//  PDD
//
//  Created by Sergey Lyubeznov on 28/08/15.
//  Copyright (c) 2015 Sergey Lyubeznov. All rights reserved.
//

#import "PDDUtils.h"

void PDDLog(NSString* format, ...) {
    
#if LOGS_ENABLED
    
    va_list argumentList;
    va_start(argumentList, format);
    
    NSLogv(format, argumentList);
    
#endif
    
}
