function PlayerKnockback(isKnockBack, knockbackPower, knockbackTimerRate, target, targetXsp, targetYsp, isMoving)
{
	if(isKnockBack = true)
	{
		isMoving = false		
		knockbackTimer = knockbackTimerRate
		isKnockBack = false
	}
	else if(knockbackTimer > 0)
	{
		knockbackTimer--;
		if(target.x > x)
		{
			targetXsp = knockbackPower
		}
		else
		{
			targetXsp = -knockbackPower
		}
		target.x += targetXsp
	}
	else
	{
		isMoving = true	
	}
}