if isDashing = false
{	
	ysp += 0.1 //Gravity
	xsp = 0	//Reset xsp
}

#region MOVEMENT
#region Move
if keyboard_check(ord("D")) || keyboard_check(vk_right)
{
	if isDashing = false
	{
		xsp = 1
		ResetFacing()
		isFacing[0] = true
	}
	/*else
	{
		xsp = +dashPower
	}*/
}
if keyboard_check(ord("A")) || keyboard_check(vk_left) 
{
	if isDashing = false
	{
		xsp = -1
		ResetFacing()
		isFacing[1] = true
	}
	/*else
	{
		xsp = -dashPower
	}*/
}

//Facing up and down
if keyboard_check(ord("W")) || keyboard_check(vk_up) 
{
	ResetFacing()
	isFacing[2] = true
}
if keyboard_check(ord("S")) || keyboard_check(vk_down) 
{
	ResetFacing()
	isFacing[3] = true
}

//Reset Array
function ResetFacing()
{
	for(var i = 0; i < array_length(isFacing); i++)
	{
		isFacing[i] = false
	}	
}
#endregion
#region Jump
if keyboard_check_pressed(vk_space) && isGrounded = true
{
	ysp = -2.5 //max jump power
}
if ysp < 0 && !keyboard_check(vk_space) && isDashing = false
{
	ysp = max(ysp, -1) //If let go of space, ysp will not be -2.5
}
#endregion
#region Dash
if keyboard_check_pressed(ord("X")) && isDashing = false
{
	isDashing = true
	DashTimer = 7 //how long the steps to dash, less means more faster but much shorter
	if isFacing[0] = true 
	{
		xsp = dashPower //the xsp value while dashing
	}
	if isFacing[1] = true
	{
		xsp = -dashPower
	}
	if isFacing[2] = true
	{
		ysp = -dashPower
	}
	if isFacing[3] = true
	{
		ysp = dashPower
	}
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
