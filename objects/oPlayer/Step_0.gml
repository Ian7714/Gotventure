#region Gravity
if isDashing = false
{	
	if(isGrounded = false && dashAnimTimer > 0)
	{
		ysp = 0 //make player stop after dash
		ysp += grav //Gravity
	}
	else if(isGrounded = false)
	{
		ysp += grav
	}
	xsp = 0 //Reset xsp
}
#endregion

#region MOVEMENT
#region Move

if keyboard_check(ord("D")) || keyboard_check(vk_right)
{
	if isDashing = false
	{
		isFacingLeft = false
		xsp = playerSpd
	}
}
else
{
	xPrev = x
}

if keyboard_check(ord("A")) || keyboard_check(vk_left) 
{
	if isDashing = false
	{
		isFacingLeft = true
		xsp = -playerSpd
	}
}
else
{
	xPrev = x
}

if (isFacingLeft = true)
{
	image_xscale = -1
}
else
{
	image_xscale = 1
}

//Facing up and down
if keyboard_check(ord("W")) || keyboard_check(vk_up) 
{
	//Look Up
}


if keyboard_check(ord("S")) || keyboard_check(vk_down) 
{
	//look down
}

#endregion
#region Jump
if(keyboard_check_pressed(vk_space) && (isGrounded = true || isJumpMercy = true))
{
	ysp = -jumpPower //max jump power
}
else
{
	yPrev = y
}
if(ysp < 0 && !keyboard_check(vk_space) && isDashing = false)
{
	ysp = max(ysp, -jumpPower/2.5) //If let go of space, ysp will not be -2.5
}
#endregion
#region Dash
if keyboard_check_pressed(ord("X")) && isDashing = false
{
	xsp = 0
	ysp = 0
	isDashing = true
	DashTimer = 4 //how long the steps to dash, less means more faster but much shorter
	dashAnimTimer = 20
	if keyboard_check(ord("D")) || keyboard_check(vk_right)
	{
		isKeyPress = true
		xsp = dashPower //the xsp value while dashing
	}
	else if keyboard_check(ord("A")) || keyboard_check(vk_left) 
	{
		isKeyPress = true
		xsp = -dashPower
	}
	
	if keyboard_check(ord("W")) || keyboard_check(vk_up) 
	{
		isKeyPress = true
		ysp = -dashPower
	}
	else if keyboard_check(ord("S")) || keyboard_check(vk_down) 
	{
		isKeyPress = true
		ysp = dashPower
	}
	
	if isKeyPress = false
	{
		if(image_xscale = -1)
		{
			xsp = -dashPower
		}
		else
		{
			xsp = dashPower	
		}
	}
	isKeyPress = false
}

if isDashing = true //dash timer
{
	DashTimer--
	if DashTimer <= 0
	{
		isDashing = false
	}
}

if(dashAnimTimer > 0)
{
	dashAnimTimer--	
}
#endregion
#endregion


#region COLLISION
move_and_collide(xsp, ysp, platformGround)//make player can move, and can collide with array platformGround

if(ysp >= 0)//check if the player fall
{
	if(place_meeting(x , y + 1, platformGround))//check if the player collide with platformGround 1 pixel below(y + 1)
	{
		ysp = 0 //stop the gravity if meeting oPlatform
		isGrounded = true 
		jumpHangTimer = jumpHangFrames
	}
	else 
	{
		//unstuck player on the ground
		if(place_meeting(x , y + ysp, platformGround) && isGrounded = false)//check if the player stop before (y + 1) in the ground
		{
			y += 1 //move player 1 pixel down so it doesn't stuck in jump situation
			isGrounded = true
		}
		else
		{
			isGrounded = false
			JumpMercy()
		}
	}
}
else
{
	if place_meeting(x , y + ysp, platformGround)
	{
		ysp = 0 //stop the gravity if meeting oPlatform
		jumpHangTimer = jumpHangFrames
	}
	else 
	{
		isGrounded = false
		JumpMercy()
	}
}

function JumpMercy()
{
	isJumpMercy = true
	if(jumpHangTimer >= 0)
	{
		jumpHangTimer--
	}
	else
	{
		isJumpMercy = false
	}	
}

#endregion


#region ANIMATION
//Idle
if(sprite_index = sPlayerIdle)
{
	if(image_index < 1)
	{
		image_speed = 0.025
	}
	else
	{
		image_speed = 1
	}
}

//Move
if(xPrev != x)
{
	image_speed = 1
	sprite_index = sPlayerMove
}
else
{
	sprite_index = sPlayerIdle
}

//Jump
if(isGrounded = false && dashAnimTimer <= 0)
{
	sprite_index = sPlayerJump
}

//Dash
if(dashAnimTimer > 0)
{
	sprite_index = sPlayerBored
}
#endregion

