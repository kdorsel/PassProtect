//
//  passwordClass.m
//  PassProtect
//
//  Created by Kassym Dorsel on 11-05-12.
//

#import "passwordClass.h"

@implementation passwordClass


-(id) init:(NSDictionary *)dic :(NSString *)a
{
  self = [super init];
  if (self) {
    test=a;
    appID=[[dic objectForKey:@"NSApplicationProcessIdentifier"] stringValue];
    [appID retain];
    appName=[dic objectForKey:@"NSApplicationName"];
    debug = TRUE;
  }
  NSLog(@"init");
  return self;
}
- (IBAction)selectCont:(id)sender
{
  if ([test isEqualToString:[unlockPassword stringValue]]) {
    [self process:@""];
    if (debug) NSLog(@"Continue Selected on: %@",appName);
    [passWindow close];
  }
  else [testPassword setStringValue:@"Incorect Password"];
}
- (IBAction)selectQuit:(id)sender
{
  if ([test isEqualToString:[unlockPassword stringValue]]) {
    [self process:@""];
    if (debug) NSLog(@"Quit Selected on: %@",appName);
    [[NSApplication sharedApplication] terminate:self];
    [passWindow close];
  }
  else [testPassword setStringValue:@"Incorect Password"];
}
- (IBAction)selectPrefs:(id)sender
{
  if ([test isEqualToString:[unlockPassword stringValue]]) {
    [self process:@""];
    //show pref window
    if (debug) NSLog(@"Preferences Selected on: %@",appName);
    [passWindow close];
  }
  else [testPassword setStringValue:@"Incorect Password"];
}
- (IBAction)selectCancel:(id)sender
{
  [self process:@"quit"];
  if (debug) NSLog(@"Cancel Selected on: %@",appName);
  [passWindow close];
}
- (void)process:(NSString *)cont
{
  [unlockPassword setStringValue:@""];
  [testPassword setStringValue:@""];
  NSString *com = @"-CONT";
  if ([cont isEqualToString:@"pause"]) com = @"-STOP";
  else if ([cont isEqualToString:@"quit"]) com = @"";
  [NSTask launchedTaskWithLaunchPath:@"/bin/kill" arguments:[NSArray arrayWithObjects:com,appID,nil]];
}
-(void)order:(id)sender
{
  [passWindow makeKeyAndOrderFront:sender];
}
-(void)awakeFromNib
{
  [passWindow setTitle:[@"Enter your password to unlock " stringByAppendingString:appName]];
}
-(void)dealloc
{
  [appID dealloc];
  [super dealloc];
}
@end