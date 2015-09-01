//
//  PDDSignTypes.m
//  PDD
//
//  Created by Sergey Lyubeznov on 28/08/15.
//  Copyright (c) 2015 Sergey Lyubeznov. All rights reserved.
//

#import "PDDSignTypes.h"
#import "PDDSignType.h"
#import "PDDSign.h"

@implementation PDDSignTypes

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        NSString   *path = [[NSBundle mainBundle] pathForResource:@"signTypes" ofType:@""];
        NSError    *error = nil;
        NSString   *data = [NSString stringWithContentsOfFile: path
                                                     encoding: NSUTF8StringEncoding
                                                        error: &error];
        NSArray *arrayData = [data componentsSeparatedByString:@"===//==="];
        NSString *stringTypes = [arrayData objectAtIndex:0];
        NSArray *signTypes = [stringTypes componentsSeparatedByString:@"@\n"];
        NSString *stringNumbers = [arrayData objectAtIndex:1];
        NSArray *signNumbers = [stringNumbers componentsSeparatedByString:@"@\n"];
        NSString *stringNumbers2 = [arrayData objectAtIndex:2];
        NSArray *signNumbers2 = [stringNumbers2 componentsSeparatedByString:@"--/--"];
        NSString *stringDescriptions = [arrayData objectAtIndex:3];
        NSArray *signDescriptors = [stringDescriptions componentsSeparatedByString:@"--/--"];
        
        NSMutableArray *array = [NSMutableArray array];
        
        for (int i = 0; i < [signTypes count] ; i++) {
            
            PDDSignType *signType = [[PDDSignType alloc] init];
            
            
            signType.name = [signTypes objectAtIndex:i];
            
            if (i < 8) {
            signType.imageName = [NSString stringWithFormat:@"s%@.png",[signNumbers objectAtIndex:i]];
            } else {
                signType.imageName = [NSString stringWithFormat:@"m%@.png",[signNumbers objectAtIndex:i]];
            }
            
            NSArray *separatedArraySign = [[signNumbers2 objectAtIndex:i] componentsSeparatedByString:@","];
            NSArray *separatedArrayDes = [[signDescriptors objectAtIndex:i] componentsSeparatedByString:@"@"];
            
            NSMutableArray *signs = [NSMutableArray array];
            
            for (int j = 0; j < [separatedArraySign count]; j++) {
                
                PDDSign *sign = [[PDDSign alloc] init];
                sign.name = [separatedArraySign objectAtIndex:j];
                
                if (i < 8) {
                    sign.imageName = [NSString stringWithFormat:@"s%@.png",[separatedArraySign objectAtIndex:j]];
                } else {
                    sign.imageName = [NSString stringWithFormat:@"m%@.png",[separatedArraySign objectAtIndex:j]];
                }
                
                
                sign.signDescription = [separatedArrayDes objectAtIndex:j];
                
                [signs addObject:sign];
            }
            
            signType.signs = signs;
            
            [array addObject:signType];
            
        }
        
        self.signTypes = array;
        
        
        
    }
    return self;
}

@end
