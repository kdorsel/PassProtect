//
//  PassProtectAppDelegate.h
//  PassProtect
//
//  Created by Kassym Dorsel on 11-04-01.
//

#import <Cocoa/Cocoa.h>
#import "passwordClass.h"

@interface PassProtectAppDelegate : NSObject <NSApplicationDelegate> {
  bool debug;
  
  IBOutlet NSWindow *prefWindow;
  
  IBOutlet NSTableView *appListTable;
  IBOutlet NSTableColumn *appNameColumn;
  IBOutlet NSTableColumn *appCheckColumn;
  
  IBOutlet NSTextField *newPassword;
  IBOutlet NSTextField *newPassword2;
  IBOutlet NSTextField *infoPassword;
  IBOutlet NSButton *startLaunch;
}
@property(retain) NSMutableArray *appListD;
@property(retain) NSMutableArray *appListW;
@property(retain) NSMutableArray *appList;
@property(retain) NSMutableDictionary *appDic;
@property(retain) NSMutableDictionary *appID;
@property(retain) NSUserDefaults *defaults;

- (IBAction)submitPrefs:(id)sender;

- (IBAction)deleteApp:(id)sender;
- (IBAction)addApp:(id)sender;

- (void)output;
- (void)startUp:(NSInteger)start;


@end

