function MoveX(key, spd)
{
	if(keyboard_check(ord(key)))
	{
		x += spd;
	}
}

function MoveY(key, spd)
{
	if(keyboard_check(ord(key)))
	{
		y += spd;
	}
}

function Jump(jumpPower)
{
	vspeed = jumpPower;
}


/*function Dash(key, dashSpd, dashPower)
{
	if(keyboard_check(key))
	{
		dashSpd = dashPower;
	}
}*/