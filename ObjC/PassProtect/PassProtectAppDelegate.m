//  PassProtectAppDelegate.m
//  PassProtect
//
//  Created by Kassym Dorsel on 11-04-01.
//

#import "PassProtectAppDelegate.h"

@implementation PassProtectAppDelegate
@synthesize appID;
@synthesize appDic;
@synthesize appList;
@synthesize appListD;
@synthesize appListW;
@synthesize defaults;

- (id)init {
  self = [super init];
  if (self) {
    debug = TRUE;
    defaults = [NSUserDefaults standardUserDefaults];
    NSNotificationCenter *center = [[NSWorkspace sharedWorkspace] notificationCenter];
    [center addObserver:self selector:@selector(watchD:) name:NSWorkspaceDidLaunchApplicationNotification object:nil];
    [center addObserver:self selector:@selector(watchW:) name:NSWorkspaceWillLaunchApplicationNotification object:nil];
    appID = [[NSMutableDictionary alloc] initWithCapacity:10];
    if (![[NSFileManager defaultManager] fileExistsAtPath:[@"~/Library/Preferences/Kassym-Dorsel.PassProtect.plist" stringByExpandingTildeInPath]] || [defaults boolForKey:@"virgin"]) {
      appList = [[NSMutableArray alloc] initWithCapacity:10];
      [appList addObject:@"Activity Monitor"];
      [appList addObject:@"Terminal"];
      appListD = [[NSMutableArray alloc] initWithCapacity:10];
      appListW = [[NSMutableArray alloc] initWithCapacity:10];
      [appListW addObject:@"Activity Monitor"];
      [appListW addObject:@"Terminal"];
      appDic = [[NSMutableDictionary alloc] initWithCapacity:10];
      [appDic setObject:[NSNumber numberWithInt:0] forKey:@"Activity Monitor"];
      [appDic setObject:[NSNumber numberWithInt:0] forKey:@"Terminal"];
      //show prefrence window
    }
    else {
      appListD = [defaults objectForKey:@"appListD"];
      appListW = [defaults objectForKey:@"appListW"];
      appList = [defaults objectForKey:@"appList"];
      appDic = [defaults objectForKey:@"appDic"];
    }
  }
  if (debug) NSLog(@"init completed");
  return self;
}
- (void)watchD:(NSNotification *)aNotification {
  NSDictionary *info = [aNotification userInfo];
  NSString *name = [info objectForKey:@"NSApplicationName"];
  [appID setObject:[[info objectForKey:@"NSApplicationProcessIdentifier"] stringValue] forKey:name];
  for (NSString *element in appListD) {
    if ([element isEqualToString:name]) {
      passwordClass *appClass = [[passwordClass alloc] init:info:[defaults objectForKey:@"testing"]];
      [appClass process:@"pause"];
      [NSBundle loadNibNamed:@"passwordWindow" owner:appClass];
      [appClass order:self];
    }
    if (debug) NSLog(@"watchDid with %@",element);
  }
}
- (void)watchW:(NSNotification *)aNotification {
  NSDictionary *info = [aNotification userInfo];
  NSString *name = [info objectForKey:@"NSApplicationName"];
  [appID setObject:[[info objectForKey:@"NSApplicationProcessIdentifier"] stringValue] forKey:name];
  for (NSString *element in appListW) {
    if ([element isEqualToString:name]) {
      passwordClass *appClass = [[passwordClass alloc] init:info:[defaults objectForKey:@"testing"]];
      [appClass process:@"pause"];
      [NSBundle loadNibNamed:@"passwordWindow" owner:appClass];
      [appClass order:self];
    }
    if (debug) NSLog(@"watchWill with %@",element);
  }
}
- (void)dealloc {
  [appList release];
  [appListD release];
  [appListW release];
  [appDic release];
  [appID release];
  [super dealloc];
}
- (void)output {
  for (NSString *element in appList) {
    NSLog(@"In appList : %@",element);
  }
  for (NSString *element in appListW) {
    NSLog(@"In appListW : %@",element);
  }
  for (NSString *element in appListD) {
    NSLog(@"In appListD : %@",element);
  }
}


-(void)awakeFromNib
{
  @try {
    [newPassword setStringValue:[defaults objectForKey:@"testing"]];
    [newPassword2 setStringValue:[defaults objectForKey:@"testing"]];
    [startLaunch setState:[defaults integerForKey:@"startLaunch"]];
  }
  @catch (NSException *exception) {}
  @finally {
    NSLog(@"No pref file found");
    [prefWindow makeKeyAndOrderFront:self];
  }
}
- (IBAction)submitPrefs:(id)sender
{
  NSString *test = [newPassword stringValue];
  NSString *test2 = [newPassword2 stringValue];
  bool testCont = FALSE;
  bool testSet = FALSE;
  
  if ([test isEqualToString:test2] && ![test isEqualToString:@""]) {
    [infoPassword setStringValue:@"OK"];
    testCont = TRUE;
    testSet = TRUE;
  }
  else if ([test isEqualToString:@""] && !([defaults objectForKey:@"testing"] == nil)) {
    testCont = TRUE;
    if (debug) NSLog(@"previous ok");
  }
  else {
    [infoPassword setStringValue:@"Invalid Password"];
  }
  
  if (testCont) {
    [prefWindow orderOut:sender];
    if (testSet) [defaults setObject:test forKey:@"testing"];
    [defaults setObject:appListW forKey:@"appListW"];
    [defaults setObject:appListD forKey:@"appListD"];
    [defaults setObject:appList forKey:@"appList"];
    [defaults setObject:appDic forKey:@"appDic"];
    [self startUp:[startLaunch state]];
    [defaults setBool:NO forKey:@"virgin"];
    if (debug) NSLog(@"Preferences are set");
  }
  
}
- (IBAction)deleteApp:(id)sender
{
  NSInteger indexNum = [appListTable selectedRow];
  if (indexNum == -1) return;
  NSString *temp = [appList objectAtIndex:indexNum];
  if (debug) NSLog(@"Deleted: %@ from row: %ld",temp,indexNum);
  if ([appDic objectForKey:temp] == [NSNumber numberWithInt:0]) {
    [appListW removeObjectAtIndex:[appListW indexOfObject:temp]];
  }
  else {
    [appListD removeObjectAtIndex:[appListD indexOfObject:temp]];
  }
  [appList removeObjectAtIndex:indexNum];
  [appListTable reloadData];
}
- (IBAction)addApp:(id)sender;
{
  NSOpenPanel *open = [NSOpenPanel openPanel];
  [open setCanChooseDirectories:NO];
  [open setAllowsMultipleSelection:NO];
  [open setAllowedFileTypes:[NSArray arrayWithObject:@"app"]];
  [open setTitle:@"Select application to protect"];
  [open setPrompt:@"Select"];
  [open setDirectoryURL:[NSURL URLWithString:[NSString stringWithFormat:@"/Applications"]]];
  if ([open runModal]) {
    NSString *name = [[[open URLs] objectAtIndex:0] lastPathComponent];
    name = [name substringToIndex:[name length]-4];
    bool cont = TRUE;
    for (NSString *element in appList) {
      if ([name isEqualToString:element]) {
        cont = FALSE;
        break;
      }
    }
    if (cont) {
      [appDic setObject:[NSNumber numberWithInt:0] forKey:name];
      [appList addObject:name];
      [appListTable reloadData];
      [appListW addObject:name];
    }
    if (debug) NSLog(@"Added: %@",name);
    if (debug) [self output];
  }
}
- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView
{
  return [appList count];
}
-(id)tableView:(NSTableView *)tableView objectValueForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row
{
  if (tableColumn == appNameColumn) {
    return [appList objectAtIndex:row];
  }
  else if (tableColumn == appCheckColumn) {
    return [appDic objectForKey:[appList objectAtIndex:row]];
  }
  return nil;
}
- (void)tableView:(NSTableView *)tableView setObjectValue:(id)anObject forTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row
{
  [appDic setObject:anObject forKey:[appList objectAtIndex:row]];
  NSString *temp;
  bool cont = FALSE;
  
  for (NSString *element in appListW) {
    if ([element isEqualToString:[appList objectAtIndex:row]]) {
      temp = element;
      cont = TRUE;
    }
  }
  if (cont) {
    [appListW removeObjectAtIndex:[appListW indexOfObject:temp]];
    [appListD addObject:temp];
    if (debug) NSLog(@"Switched %@ to Did",[appList objectAtIndex:row]);
    if (debug) [self output];
    return;
  }
  
  for (NSString *element in appListD) {
    if ([element isEqualToString:[appList objectAtIndex:row]]) {
      temp = element;
      cont = TRUE;
    }
  }
  if (cont) {
    [appListD removeObjectAtIndex:[appListD indexOfObject:temp]];
    [appListW addObject:temp];
    if (debug) NSLog(@"Switched %@ to Will",[appList objectAtIndex:row]);
    if (debug) [self output];
  }
}
-(void)startUp:(NSInteger)start
{
  NSFileManager *manager = [NSFileManager defaultManager];
  NSString *pathPlist = [@"~/Library/LaunchAgents/Kassym-Dorsel.PassProtect.plist" stringByExpandingTildeInPath];
  if (start == 1) {
    [defaults setInteger:1 forKey:@"startLaunch"];
    if ([manager fileExistsAtPath:pathPlist]) {
      if (debug) NSLog(@"launch plist exists");
      return;
    }
    else {
      NSMutableDictionary *plist = [NSMutableDictionary dictionary];
      [plist setObject:@"PassProtect" forKey:@"Label"];
      [plist setObject:[NSNumber numberWithBool:YES] forKey:@"RunAtLoad"];
      [plist setObject:[NSNumber numberWithBool:NO] forKey:@"OnDemand"];
      [plist setObject:[[NSBundle mainBundle] executablePath] forKey:@"Program"];
      [plist writeToFile:[@"~/Library/LaunchAgents/Kassym-Dorsel.PassProtect.plist" stringByExpandingTildeInPath] atomically:YES];
      if (debug) NSLog(@"launch plist created");
    }
  }
  else {
    [defaults setInteger:0 forKey:@"startLaunch"];
    [manager removeItemAtPath:pathPlist error:NULL];
    if (debug) NSLog(@"launch plist removed");
  }
}

@end