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
    timesinceobstacle += delta;
    if (timesinceobstacle >= 2.0f)
    {
        [self addObstacle];
        timesinceobstacle =0.0f;
    }
}

-(void)touchBegan:(CCTouch *)touch withEvent:(CCTouchEvent *)event
{
    [character flap];
}




@end
