#import <Foundation/Foundation.h>
#import "Employee.h"

//Генератор случайных чисел
int randomize(int begin, int end) {
    srandom((unsigned)(mach_absolute_time() & 0xFFFFFFFF));
    return (begin+(random() % (end+1)));
}

//Функция сохранения массива в файл
void saveEmployeeToFile (NSArray* arrayToSave) {
     NSData* freezedInfo = [NSKeyedArchiver archivedDataWithRootObject:arrayToSave];
    [freezedInfo writeToFile:@"EmployeeArchive.me" atomically:NO];
}

//Функция восстановления массива из файла
NSMutableArray* loadEmployees() {
    NSData* freezedInfo = [NSData dataWithContentsOfFile:@"EmployeeArchive.me"];
    NSMutableArray* array = [NSKeyedUnarchiver unarchiveObjectWithData:freezedInfo];
    return array;
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {

        NSArray *namesArray[] = {@"John", @"Tim", @"Ted", @"Aaron", @"Steven"};
        NSArray *surnamesArray[] = {@"Smith", @"Dow", @"Isaacson", @"Pennyworth", @"Jenkins"};
        NSMutableArray *employees = [[[NSMutableArray alloc] init]autorelease];
        NSMutableArray *employeesWithOddSalary = [[[NSMutableArray alloc]init]autorelease];
        
        
        for(int i = 0; i<10; ++i) {
            Employee *employeeExample = [[[Employee alloc]init]autorelease];
            employeeExample.name = namesArray[randomize(0,4)];
            employeeExample.surname = surnamesArray[randomize(0,4)];
            employeeExample.salary = randomize(1000,1000);
            [employees addObject: employeeExample];
            //[employeeExample release];
            //employeeExample = nil;
        }
        
        saveEmployeeToFile(employees);
        
        for (Employee *employeeExample in employees) {
            NSLog(@"\n%@ %@'s salary is $%u",employeeExample.name,employeeExample.surname,employeeExample.salary);
            
            if (!(employeeExample.salary%2)) {
                [employeesWithOddSalary addObject:employeeExample];
            }
        }
        NSLog(@"\n\n");
        
        for (Employee *employeeExample in employeesWithOddSalary)
            [employees removeObject:employeeExample];
        
        //[employeesWithOddSalary release];
        //employeesWithOddSalary = nil;
        
        for (Employee *employeeExample in employees)
            NSLog(@"\n%@ %@'s salary is $%u",employeeExample.name,employeeExample.surname,employeeExample.salary);
        NSLog(@"\n\n");
        //[employees release];
        //employees = nil;
        
        employees = loadEmployees();
        
        for (Employee *employeeExample in employees)
            NSLog(@"\n%@ %@'s salary is $%u",employeeExample.name,employeeExample.surname,employeeExample.salary);
        
        
    }
    return 0;
}
