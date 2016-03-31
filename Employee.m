//
//  Employee.m
//  Home Work 6
//
//  Created by Dmitriy Belyaev on 24.03.16.
//  Copyright © 2016 Dmitriy Belyaev. All rights reserved.
//

#import "Employee.h"

@implementation Employee

//Метод кодирования
-(void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject: _name forKey:@"name"];
    [aCoder encodeObject: _surname forKey:@"surname"];
    [aCoder encodeInt:_salary forKey:@"salary"];
}

//Метод декодирования
-(id)initWithCoder:(NSCoder *)aDecoder {
    self=[super init];
    if(self){
        _name = [aDecoder decodeObjectForKey:@"name"];
        _surname = [aDecoder decodeObjectForKey:@"surname"];
        _salary = [aDecoder decodeIntForKey:@"salary"];
        [_name retain];
        [_surname retain];
    }
    return self;
}

@end
