//
//  PDDRules.m
//  PDD
//
//  Created by Sergey Lyubeznov on 28/08/15.
//  Copyright (c) 2015 Sergey Lyubeznov. All rights reserved.
//

#import "PDDRules.h"
#import "PDDRule.h"
#import "PDDSource.h"
#import "PDDUtils.h"


@implementation PDDRules

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        self.rules = [NSMutableArray array];
        
        NSString   *path = [[NSBundle mainBundle] pathForResource:@"rules" ofType:@""];
        NSError    *error = nil;
        NSString   *data = [NSString stringWithContentsOfFile: path
                                                     encoding: NSUTF8StringEncoding
                                                        error: &error];
        NSArray *rulesNames = [data componentsSeparatedByString:@"@"];
        
        path = [[NSBundle mainBundle] pathForResource:@"items" ofType:@""];
        data = [NSString stringWithContentsOfFile: path
                                         encoding: NSUTF8StringEncoding
                                            error: &error];
        
        NSArray *itemsAll = [data componentsSeparatedByString:@"@\n"];
        
        path = [[NSBundle mainBundle] pathForResource:@"rulesDescription" ofType:@""];
        data = [NSString stringWithContentsOfFile: path
                                         encoding: NSUTF8StringEncoding
                                            error: &error];
        
        NSArray *rulesDescription = [data componentsSeparatedByString:@"===//==="];
        
        
        
        
        for (int i = 0; i < [rulesNames count]; i++) {
            
            PDDRule *rule = [[PDDRule alloc] init];
            rule.name = [rulesNames objectAtIndex:i];
            
            NSArray *items = [[itemsAll objectAtIndex:i] componentsSeparatedByString:@","];
            NSArray *ruleDescription = [[rulesDescription objectAtIndex:i] componentsSeparatedByString:@"--/--"];
            
            
            NSMutableArray *array = [NSMutableArray array];
            
            for (int j = 0; j < [items count]; j++) {
                NSString *key = [items objectAtIndex:j];
                NSString *value = [ruleDescription objectAtIndex:j];
                NSDictionary *dict = @{key:value};
                
                [array addObject:dict];
            }
            
            rule.items = array;
            
            [self.rules addObject:rule];
        }
        
        
    }
    return self;
}


@end
