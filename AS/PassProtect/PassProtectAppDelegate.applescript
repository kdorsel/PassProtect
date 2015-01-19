--
--  PassProtectAppDelegate.applescript
--  PassProtect
--
--  Created by Kassym Dorsel on 11-03-04.
--

script PassProtectAppDelegate
  property parent : class "NSObject"
  
  property appName : missing value
  property testing : missing value
  property startLogVa : missing value
  property pathLaunch : missing value
  
  property debug : true
  property ud : missing value
  
  property missP : missing value
  property nameApp : missing value
  property checkP : missing value
  
  property test1 : missing value
  property test2 : missing value
  property temp : missing value
  property startLog : missing value
  property appTemp : missing value
  
  property winPass : missing value
  property winPref : missing value
  
  on applicationDidFinishLaunching_(aNotification)
    set virgin to false
    set pathLaunch to POSIX path of (path to home folder) & "Library/LaunchAgents/kassymdorsel.PassProtect"
    set ud to current application's NSUserDefaults's standardUserDefaults()
    
    set appName to ud's stringForKey_("appName") as string
    set testing to ud's stringForKey_("test")
    set startLogVa to ud's integerForKey_("startLog") as integer
    if debug then log "defaults are read, " & appName & space & startLogVa
    
    if appName = "" or appName = missing value or testing = "" or testing = missing value or startLogVa = missing value then set virgin to true
    
    if virgin or (current application's NSEvent's modifierFlags() is equal to current application's NSCommandKeyMask) then
      fadeIn(winPref)
      if debug then log "no preference plist or command key held down"
    end if
    if application appName is running then
      tell application "System Events" to set visible of process appName to false
      appCall()
    end if
    set noter to current application's NSWorkspace's sharedWorkspace()'s notificationCenter()
    noter's addObserver_selector_name_object_(me, "watch:", current application's NSWorkspaceWillLaunchApplicationNotification, missing value)
    
    if debug then
      log "completed finishlaunching"
    end if
  end applicationDidFinishLaunching_
  
  on selectApp_(sender)
    set appPath to choose file with prompt "Select the Application you want to protect" of type {"com.apple.application"} default location (path to applications folder)
    set appName to appPath as string
    set Applescript's text item delimiters to ":"
    set appName to text item -2 of appName
    set Applescript's text item delimiters to ""
    set appName to characters 1 thru -5 of appName as string
    nameApp's setStringValue_(appName)
  end selectApp_
  
  on submitPref_(sender)
    set test1Va to test1's stringValue()
    set test2Va to test2's stringValue()
    set startLogVa to startLog's intValue()
    
    if (test1Va's isEqualToString_(test2Va) as boolean) and not (test1Va's isEqualToString_("") as boolean) then
      missP's setStringValue_("OK")
      set cont to true
      else
      missP's setStringValue_("Passwords do not match")
      set cont to false
    end if
    
    if debug then log appName
    if appName = missing value or appName = "" or appName = "missing value" then
      nameApp's setStringValue_("No application selected")
      set cont2 to false
      if debug then log " appName is missing value"
      else
      set cont2 to true
    end if
    
    if cont and cont2 then
      set testing to test1Va
      fadeOut(winPref)
      setLogIn()
      setDefaults()
      if application appName is running then tell application appName to activate
      if debug then log "saved pref2 " & appName
    end if
  end submitPref_
  
  on continue_(sender)
    set tempVa to temp's stringValue()
    if checking(tempVa) then
      ignoring application responses
        fadeOut(winPass)
        pausinggg("paused")
        tell application appName to activate
        temp's setStringValue_("")
      end ignoring
      if debug then log "User selected continue"
      else
      checkP's setStringValue_("Incorrect Password")
    end if
  end continue_
  
  on quit_(sender)
    set tempVa to temp's stringValue()
    if checking(tempVa) then
      pausinggg("paused")
      fadeOut(winPass)
      tell application appName to activate
      if debug then log "User selected quit"
      tell me to quit
      else
      checkP's setStringValue_("Incorrect Password")
    end if
  end quit_
  
  on setPref_(sender)
    set tempVa to temp's stringValue()
    test1's setStringValue_(testing)
    test2's setStringValue_(testing)
    if checking(tempVa) then
      pausinggg("paused")
      fadeOut(winPass)
      fadeIn(winPref)
      temp's setStringValue_("")
      if debug then log "User selected preferences"
      else
      checkP's setStringValue_("Incorrect Password")
    end if
  end setPref_
  
  on cancel_(sender)
    pausinggg("kill")
    fadeOut(winPass)
    temp's setStringValue_("")
    if debug then log "User selected cancel"
  end cancel_
  
  on pausinggg(pause_or_play)
    ignoring application responses
      set text item delimiters to ""
      set get_PID to do shell script " ps -ax | grep -i " & quoted form of appName
      set the_PID to word 1 of get_PID as string
      if pause_or_play is "paused" then
        do shell script "kill -CONT " & the_PID
        else if pause_or_play is "kill"
        do shell script "kill " & the_PID
        else
        do shell script "kill -STOP " & the_PID
      end if
    end ignoring
  end pausinggg
  
  on checking(a)
    if (testing's isEqualToString_(a) as boolean) then return true
    return false
  end checking
  
  on fadeOut(a)
    tell a
      tell animator() to setAlphaValue_(0)
      performSelector_withObject_afterDelay_("orderOut:", missing value, 1)
    end tell
  end fadeOut
  
  on fadeIn(a)
    if a is winPref then
      a's setLevel_(1)
      if debug then log appName & " is set to display"
      if appName = missing value or appName = "missing value" or appName = "" then
        
        else
        nameApp's setStringValue_(appName)
      end if
    end if
    tell a
      setAlphaValue_(0)
      a's makeKeyAndOrderFront_(me)
      tell animator() to setAlphaValue_(1)
    end tell
    tell me to activate
  end fadeIn
  
  on appCall()
    ignoring application responses
      pausinggg("playing")
    end ignoring
    checkP's setStringValue_("To unlock " & appName & " enter your password")
    fadeIn(winPass)
    if debug then log "password prompted"
  end appCall
  
  on watch_(aNotification)
    if aNotification's userInfo's NSApplicationName as string = appName then
      if debug then log "app is launched, appCall()"
      appCall()
    end if
    if debug then log "called watch"
  end watch_
  
  on setDefaults()
    ud's setObject_forKey_(appName, "appName")
    ud's setObject_forKey_(testing, "test")
    ud's setInteger_forKey_(startLogVa, "startLog")
    if debug then
      log "defaults are set to " & appName & space & testing & space & startLogVa
      set log1 to ud's stringForKey_("appName")
      set log2 to ud's stringForKey_("test")
      set log3 to ud's objectForKey_("startLog")
      log "Reading the values back " & log1 & space & log2 & space & log3
    end if
  end setDefaults
  
  on setLogIn()
    if startLogVa = 1 then
      set pathMe to current application's NSBundle's mainBundle()'s executablePath() as string
      tell application "Finder" to get exists file "kassymdorsel.PassProtect.plist" of folder "LaunchAgents" of folder "Library" of home
      if result is false then
        do shell script "defaults write '" & pathLaunch & "' '{\"Label\"=kassymdorsel.PassProtect; \"Program\"=\"" & pathMe & "\";}'"
        do shell script "defaults write '" & pathLaunch & "' RunAtLoad -bool YES"
        do shell script "defaults write '" & pathLaunch & "' OnDemand -bool NO"
        else
        do shell script "defaults write '" & pathLaunch & "' Program " & pathMe
        do shell script "defaults write '" & pathLaunch & "' RunAtLoad -bool YES"
      end if
      if debug then log "set new plist"
      else
      tell application "Finder" to get exists file "kassymdorsel.PassProtect.plist" of folder "LaunchAgents" of folder "Library" of home
      if result is true then
        do shell script "defaults write '" & pathLaunch & "' RunAtLoad -bool NO"
      end if
      if debug then log "no plist"
    end if
  end setLogIn
  
  on applicationShouldTerminate_(sender)
    if debug then log "will self terminate"
    set pathMe to current application's NSBundle's mainBundle()'s executablePath() as string
    do shell script "defaults write '" & pathLaunch & "' Program " & pathMe
    return current application's NSTerminateNow
  end applicationShouldTerminate_
  
end script