visible = true //make player visible

xPrev = 0
xsp = 0
ysp = 0

playerSpd = 3 //speed
jumpPower = 8 //jump
DashTimer = 0
dashPower = 20 //the xsp value while dashing

isDashing = false //check if player currently dashing
isKeyPress = false

isFacingLeft = false; //Check if the player facing left

isGrounded = false //check if the player on the ground
platformGround = [oPlatformEdge, oPlatformMiddle, oPlatformEdgeFull, oPlatformMiddleFull]

VictoryTextMessagesVisible = false //Level Completed visibility