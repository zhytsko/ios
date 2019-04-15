#import "DateMachine.h"

@implementation DateMachine

-(void)editStep:(BOOL) isAdd {
    int k = isAdd ? 1 : -1;
    NSDateComponents *calendarComponents = [[NSCalendar currentCalendar] components: NSCalendarUnitYear | NSCalendarUnitMonth|  NSCalendarUnitDay | NSCalendarUnitHour| NSCalendarUnitMinute fromDate:[_dateFormatter dateFromString:[_currentDateLabel text]]];
    if ([_dateUnitTextField.text isEqualToString:@"year"]) {
        calendarComponents.year += [_stepTextField.text integerValue] * k;
    } else if ([_dateUnitTextField.text isEqualToString:@"month"]) {
        calendarComponents.month += [_stepTextField.text integerValue] * k;
    } else if ([_dateUnitTextField.text isEqualToString:@"week"]) {
        calendarComponents.day += 7 * [_stepTextField.text integerValue] * k;
    } else if ([_dateUnitTextField.text isEqualToString:@"day"]) {
        calendarComponents.day += [_stepTextField.text integerValue] * k;
    } else if ([_dateUnitTextField.text isEqualToString:@"hour"]) {
        calendarComponents.hour += [_stepTextField.text integerValue] * k;
    } else if ([_dateUnitTextField.text isEqualToString:@"minute"]) {
        calendarComponents.minute += [_stepTextField.text integerValue] * k;
    }
    NSDate *date = [[NSCalendar currentCalendar] dateFromComponents:calendarComponents];
    _currentDateLabel.text = [_dateFormatter stringFromDate:date];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"dd/MM/yyyy HH:mm";
    self.dateFormatter = formatter;
    [formatter release];
    self.currentDateLabel.text = [self.dateFormatter stringFromDate:[NSDate date]];
}

- (IBAction)editingChangedStep:(id)sender {
    NSString *text = _stepTextField.text;
    if ([text integerValue] == 0) {
        _stepTextField.text = @"Step";
    }
}

- (IBAction)editingChangedStartDate:(id)sender {
    _currentDateLabel.text = _startDateTextField.text;
}

- (IBAction)editingChangedDateUnit:(id)sender {
    NSString *pattern = @"[a-z]";
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:pattern options:0 error:NULL];
    if ([regex numberOfMatchesInString:_dateUnitTextField.text options:0 range:NSMakeRange(0, [_dateUnitTextField.text length])] != [_dateUnitTextField.text length]) {
        _dateUnitTextField.text = @"Date unit";
    }
}
- (IBAction)editingDidEndDateUnit:(id)sender {
    NSArray *array = @[@"year", @"month", @"week", @"day", @"hour", @"minute"];
    if (![array containsObject: _dateUnitTextField.text]) {
        _dateUnitTextField.text = @"Date unit";
    }
}

- (IBAction)addStep:(id)sender {
    [self editStep:YES];
}

- (IBAction)subStep:(id)sender {
    [self editStep:NO];
}

- (void)dealloc {
    [_stepTextField release];
    [_dateUnitTextField release];
    [_startDateTextField release];
    [_addButton release];
    [_subButton release];
    [_currentDateLabel release];
    [_dateFormatter release];
    [super dealloc];
}

@end
