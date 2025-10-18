#region Gravity
if isDashing = false
{	
	ysp += 0.4 //Gravity
	xsp = 0	//Reset xsp
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
if keyboard_check_pressed(vk_space) && isGrounded = true
{
	ysp = -jumpPower //max jump power
}
if ysp < 0 && !keyboard_check(vk_space) && isDashing = false
{
	ysp = max(ysp, -jumpPower/2.5) //If let go of space, ysp will not be -2.5
}
#endregion
#region Dash
if keyboard_check_pressed(ord("X")) && isDashing = false
{
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

//x += xsp; //oPlayer.x is xsp
//y += ysp; //oPlayer.y is ysp

move_and_collide(xsp, ysp, platformGround)
#endregion

#region COLLISION
if place_meeting(x , y + 1, platformGround)
{
	ysp = 0 //stop the gravity if meeting oPlatform
	isGrounded = true
}
else 
{
	isGrounded = false
}

/*if place_meeting(x, y, oExitDoor)
{
	VictoryTextMessagesVisible = true //make victory message visible
	visible = false //make player invisible after completing the stage
}*/

/*if keyboard_check_pressed(vk_anykey) && VictoryTextMessagesVisible = true
{
	room_goto_next() //go to next the room
}*/
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

