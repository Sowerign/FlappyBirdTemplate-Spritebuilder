#import "GamePlayScene.h"
#import "Character.h"
#import "Obstacle.h"

@implementation GamePlayScene

- (void)initialize
{
    character = (Character*)[CCBReader load:@"Character"];
    [physicsNode addChild:character];
    [self addObstacle];
    timesinceobstacle = 0.0f;
}

-(void)update:(CCTime)delta
{
    }

-(void)touchBegan:(CCTouch *)touch withEvent:(CCTouchEvent *)event
{
    [character flap];
}




@end
