/*function KnockbackCreate()
{
	damageCooldown = 0 //prevent the object from damage player too fast
	damageCooldownRate = 1

	isKnockback = false //do Knockback situation to player
	knockbackTimer = 0
	knockbackTimerRate = 8
	knockbackPower = 10
}

function KnockbackBool()
{
	if(damageCooldown <= 0)
	{
		isKnockback = true //do Knockback
		knockbackTimer = knockbackTimerRate
		damageCooldown = damageCooldownRate
	}
	else
	{
		damageCooldown--
	}
}

function KnockbackStep(object, target)
{
	if(isKnockback = true)
	{
		knockbackTimer--
		if(knockbackTimer <= 0)
		{
			isKnockback = false
			target.isMoving = true
			//target.playerHealth -= 1 //decrease player health by 1
		}
		else
		{
			target.isMoving = false
		
			if(object.isFacingLeft = false)
			{
				if(object.x > target.x)
				{
					target.xsp = sign(-object.xsp) * knockbackPower //make the player move back when touch the object
				}
				else
				{
					target.xsp = sign(object.xsp) * knockbackPower //make the player move back when touch the object
				}
			}
			else if(object.isFacingLeft = true)
			{
				if(object.x < target.x)
				{
					target.xsp = sign(-object.xsp) * knockbackPower //make the player move back when touch the object
				}
				else
				{
					target.xsp = sign(object.xsp) * knockbackPower //make the player move back when touch the object
				}
			}
			target.ysp = 4
		}
	}
}*/