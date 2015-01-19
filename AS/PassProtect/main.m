//
//  main.m
//  PassProtect
//
//  Created by Kassym Dorsel on 11-03-04.
//  Copyright 2011 Kassym Dorsel. All rights reserved.
//

#import <Cocoa/Cocoa.h>

#import <AppleScriptObjC/AppleScriptObjC.h>

int main(int argc, char *argv[])
{
    [[NSBundle mainBundle] loadAppleScriptObjectiveCScripts];
    return NSApplicationMain(argc, (const char **)argv);
}
