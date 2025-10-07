window_set_size(1280, 720) //resolution

visible = true //make player visible

xsp = 0
ysp = 0

playerSpd = 3 //speed
jumpPower = 6 //jump
DashTimer = 0
dashPower = 17 //the xsp value while dashing

isDashing = false //check if player currently dashing
isKeyPress = false

/*isFacing = array_create(4, false)
isFacing[0] = true
//isFacing[0] = right
//isFacing[1] = left
//isFacing[2] = up
//isFacing[3] = down*/

isGrounded = false //check if the player on the ground
VictoryTextMessagesVisible = false //Level Completed visibility