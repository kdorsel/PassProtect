//
//  passwordClass.h
//  PassProtect
//
//  Created by Kassym Dorsel on 11-05-12.
//

#import <Foundation/Foundation.h>
#import <Cocoa/Cocoa.h>
#import "PassProtectAppDelegate.h"

@interface passwordClass : NSWindowController {
  
  NSString *test,*appID,*appName;
  
  IBOutlet NSTextField *unlockPassword;
  IBOutlet NSTextField *testPassword;
  IBOutlet NSWindow *passWindow;
  
  bool debug;
}

- (id)init:(NSDictionary*)dic :(NSString *)a;

- (IBAction)selectCont:(id)sender;
- (IBAction)selectQuit:(id)sender;
- (IBAction)selectPrefs:(id)sender;
- (IBAction)selectCancel:(id)sender;

- (void)process:(NSString *)cont;
-(void)order:(id)sender;

@end
