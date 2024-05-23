#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate>

@property (nonatomic, strong) NSWindow *window;
@property (nonatomic, strong) NSButton *startButton;
@property (nonatomic, strong) NSTextField *statusLabel;

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Create a window
    self.window = [[NSWindow alloc] initWithContentRect:NSMakeRect(0, 0, 400, 200)
                                              styleMask:NSWindowStyleMaskTitled | NSWindowStyleMaskClosable | NSWindowStyleMaskResizable
                                                backing:NSBackingStoreBuffered
                                                  defer:NO];
    [self.window setTitle:@"SimulatorGame"];
    [self.window makeKeyAndOrderFront:nil];
    
    // Create a start button
    self.startButton = [[NSButton alloc] initWithFrame:NSMakeRect(150, 100, 100, 30)];
    [self.startButton setTitle:@"Start"];
    [self.startButton setButtonType:NSButtonTypeMomentaryPushIn];
    [self.startButton setTarget:self];
    [self.startButton setAction:@selector(startButtonClicked:)];
    [self.window.contentView addSubview:self.startButton];
    
    // Create a status label
    self.statusLabel = [[NSTextField alloc] initWithFrame:NSMakeRect(50, 50, 300, 30)];
    [self.statusLabel setEditable:NO];
    [self.statusLabel setBezeled:NO];
    [self.statusLabel setBackgroundColor:[NSColor clearColor]];
    [self.statusLabel setAlignment:NSTextAlignmentCenter];
    [self.statusLabel setStringValue:@"Press Start to Begin"];
    [self.window.contentView addSubview:self.statusLabel];
}

- (void)startButtonClicked:(id)sender {
    // Handle start button click
    [self.statusLabel setStringValue:@"Game Started!"];
}

@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSApplication *application = [NSApplication sharedApplication];
        AppDelegate *appDelegate = [[AppDelegate alloc] init];
        [application setDelegate:appDelegate];
        [application run];
    }
    return 0;
}
