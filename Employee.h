//
//  Employee.h
//  Home Work 6
//
//  Created by Dmitriy Belyaev on 24.03.16.
//  Copyright © 2016 Dmitriy Belyaev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Employee : NSObject <NSCoding>

@property unsigned salary;
@property NSString *name;
@property NSString *surname;

@end
