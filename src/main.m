#import <Cocoa/Cocoa.h>
#import <SpriteKit/SpriteKit.h>

@interface AppDelegate : NSObject <NSApplicationDelegate>

@property (nonatomic, strong) NSWindow *window;
@property (nonatomic, strong) SKView *skView;
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
    
    // Create an SKView to display SpriteKit content
    self.skView = [[SKView alloc] initWithFrame:NSMakeRect(0, 0, 400, 200)];
    [self.window.contentView addSubview:self.skView];
    
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
    
    // Call the method to set up the game interface after a short delay to show the status label update
    [self performSelector:@selector(setupGameInterface) withObject:nil afterDelay:1.0];
}

- (void)setupGameInterface {
    // Remove or hide the start button and status label
    [self.startButton setHidden:YES];
    [self.statusLabel setHidden:YES];
    
    // Create an SKScene instance
    SKScene *gameScene = [[SKScene alloc] initWithSize:self.skView.bounds.size];
    gameScene.scaleMode = SKSceneScaleModeAspectFill;
    
    // Add game elements to the scene
    SKLabelNode *gameLabel = [SKLabelNode labelNodeWithText:@"Game is now running..."];
    gameLabel.position = CGPointMake(CGRectGetMidX(gameScene.frame), CGRectGetMidY(gameScene.frame) + 100);
    [gameScene addChild:gameLabel];
    
    // Draw a character using SKShapeNode
    // Head
    SKShapeNode *head = [SKShapeNode shapeNodeWithCircleOfRadius:20];
    head.fillColor = [NSColor colorWithRed:0.94 green:0.85 blue:0.73 alpha:1.0]; // Skin tone color
    head.position = CGPointMake(CGRectGetMidX(gameScene.frame), CGRectGetMidY(gameScene.frame) + 50);

    // Eyes
    SKShapeNode *leftEye = [SKShapeNode shapeNodeWithCircleOfRadius:3];
    leftEye.fillColor = [NSColor blackColor];
    leftEye.position = CGPointMake(-7, 5);

    SKShapeNode *rightEye = [SKShapeNode shapeNodeWithCircleOfRadius:3];
    rightEye.fillColor = [NSColor blackColor];
    rightEye.position = CGPointMake(7, 5);

    [head addChild:leftEye];
    [head addChild:rightEye];

    // Mouth
    SKShapeNode *mouth = [SKShapeNode shapeNodeWithRectOfSize:CGSizeMake(10, 2)];
    mouth.fillColor = [NSColor blackColor];
    mouth.position = CGPointMake(0, -10);

    [head addChild:mouth];

    // Body
    SKShapeNode *body = [SKShapeNode shapeNodeWithRectOfSize:CGSizeMake(20, 40)];
    body.fillColor = [NSColor colorWithRed:0.94 green:0.85 blue:0.73 alpha:1.0]; // Skin tone color
    body.position = CGPointMake(CGRectGetMidX(gameScene.frame), CGRectGetMidY(gameScene.frame) + 10); // Adjusted position

    // Left arm
    SKShapeNode *leftArm = [SKShapeNode shapeNodeWithRectOfSize:CGSizeMake(10, 30)];
    leftArm.fillColor = [NSColor colorWithRed:0.94 green:0.85 blue:0.73 alpha:1.0]; // Skin tone color
    leftArm.position = CGPointMake(CGRectGetMidX(gameScene.frame) - 20, CGRectGetMidY(gameScene.frame) + 10); // Adjusted position

    // Right arm
    SKShapeNode *rightArm = [SKShapeNode shapeNodeWithRectOfSize:CGSizeMake(10, 30)];
    rightArm.fillColor = [NSColor colorWithRed:0.94 green:0.85 blue:0.73 alpha:1.0]; // Skin tone color
    rightArm.position = CGPointMake(CGRectGetMidX(gameScene.frame) + 20, CGRectGetMidY(gameScene.frame) + 10); // Adjusted position

    // Left leg
    SKShapeNode *leftLeg = [SKShapeNode shapeNodeWithRectOfSize:CGSizeMake(10, 30)];
    leftLeg.fillColor = [NSColor colorWithRed:0.47 green:0.36 blue:0.29 alpha:1.0]; // Pants color
    leftLeg.position = CGPointMake(CGRectGetMidX(gameScene.frame) - 5, CGRectGetMidY(gameScene.frame) - 30); // Adjusted position

    // Right leg
    SKShapeNode *rightLeg = [SKShapeNode shapeNodeWithRectOfSize:CGSizeMake(10, 30)];
    rightLeg.fillColor = [NSColor colorWithRed:0.47 green:0.36 blue:0.29 alpha:1.0]; // Pants color
    rightLeg.position = CGPointMake(CGRectGetMidX(gameScene.frame) + 5, CGRectGetMidY(gameScene.frame) - 30); // Adjusted position
    
    // Add the body parts to the scene
    [gameScene addChild:head];
    [gameScene addChild:body];
    [gameScene addChild:leftArm];
    [gameScene addChild:rightArm];
    [gameScene addChild:leftLeg];
    [gameScene addChild:rightLeg];
    
    // Present the scene
    [self.skView presentScene:gameScene];
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
