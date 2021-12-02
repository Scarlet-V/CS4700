extends Node

var currentBullet = 1
var maxBullet = 1
var playerHealth = 1
var playerMaxHealth = 1
var playerScore = 0
var currentLevel = 1

var enemyMS = 100
var blocker1HP = 1
var blocker2HP = 1
var shooterHP = 1
var blocker1maxHP = 1
var blocker2maxHP = 1
var shootermaxHP = 1

var bulletAvailable = true
var rapidfirepu = false
var laserPowerUp = true
var clone = false

var powerUptimer = 1

func reset():
	currentBullet = 1
	maxBullet = 1
	playerHealth = 1
	playerMaxHealth = 1
	playerScore = 0
	currentLevel = 1

	enemyMS = 100
	blocker1HP = 1
	blocker2HP = 1
	shooterHP = 1
	blocker1maxHP = 1
	blocker2maxHP = 1
	shootermaxHP = 1

	bulletAvailable = true
	rapidfirepu = false
	laserPowerUp = true
	clone = false

	powerUptimer = 1
