function KnocbackValue(knockbackPowerX, knockbackPowerY, knockbackTimerRate)
{
	knockbackX = lengthdir_x(knockbackPowerX, direction);
	knockbackY = lengthdir_x(knockbackPowerY, direction);
	knockbackTimer = knockbackTimerRate;
}
