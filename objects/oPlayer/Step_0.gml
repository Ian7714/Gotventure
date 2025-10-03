if isDashing = false
{	
	ysp += 0.14 //Gravity
	xsp = 0	//Reset xsp
}

#region MOVEMENT
#region Move
if keyboard_check(ord("D")) || keyboard_check(vk_right)
{
	if isDashing = false
	{
		xsp = playerSpd
	}
}
if keyboard_check(ord("A")) || keyboard_check(vk_left) 
{
	if isDashing = false
	{
		xsp = -playerSpd
	}
}

//Facing up and down
if keyboard_check(ord("W")) || keyboard_check(vk_up) 
{
	//look up
}

if keyboard_check(ord("S")) || keyboard_check(vk_down) 
{
	//look down
}

//Reset Array
/*function ResetFacing()
{
	for(var i = 0; i < array_length(isFacing); i++)
	{
		isFacing[i] = false
	}	
}*/
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
		xsp = dashPower	
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
#endregion

move_and_collide(xsp, ysp, oPlatform) //enable player to move
#endregion

if place_meeting(x, y + 1, oPlatform)
{
	ysp = 0 //stop the gravity if meeting oPlatform
	isGrounded = true 
}
else 
{
	isGrounded = false
}

if place_meeting(x, y, oExitDoor)
{
	VictoryTextMessagesVisible = true //make victory message visible
	visible = false //make player invisible after completing the stage
}

if keyboard_check_pressed(vk_anykey) && VictoryTextMessagesVisible = true
{
	room_goto_next() //go to next the room
}






