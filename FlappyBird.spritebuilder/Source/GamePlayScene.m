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
    _parallaxBackground.position = ccp(_parallaxBackground.position.x - (character.physicsBody.velocity.x * delta), _parallaxBackground.position.y);
    
    // loop the bushes
    for (CCNode *bush in _bushes) {
        // get the world position of the bush
        CGPoint bushWorldPosition = [_parallaxBackground convertToWorldSpace:bush.position];
        // get the screen position of the bush
        CGPoint bushScreenPosition = [self convertToNodeSpace:bushWorldPosition];
        
        // if the left corner is one complete width off the screen,
        // move it to the right
        if (bushScreenPosition.x <= (-1 * bush.contentSize.width)) {
            for (CGPointObject *child in _parallaxBackground.parallaxArray) {
                if (child.child == bush) {
                    child.offset = ccp(child.offset.x + 2*bush.contentSize.width, child.offset.y);
                }
            }
        }
    }
    
    // loop the clouds
    for (CCNode *cloud in _clouds) {
        // get the world position of the cloud
        CGPoint cloudWorldPosition = [_parallaxBackground convertToWorldSpace:cloud.position];
        // get the screen position of the cloud
        CGPoint cloudScreenPosition = [self convertToNodeSpace:cloudWorldPosition];
        
        // if the left corner is one complete width off the screen,
        // move it to the right
        if (cloudScreenPosition.x <= (-1 * cloud.contentSize.width)) {
            for (CGPointObject *child in _parallaxBackground.parallaxArray) {
                if (child.child == cloud) {
                    child.offset = ccp(child.offset.x + 2*cloud.contentSize.width, child.offset.y);
                }
            }
        }
    }
    }

-(void)touchBegan:(CCTouch *)touch withEvent:(CCTouchEvent *)event
{
    [character flap];
}




@end
