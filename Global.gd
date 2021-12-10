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

export var max_delay = 10	#Max time between shots
export var min_delay = 3	#Min time between shots

var bulletAvailable = true
var bulletReloadTimer = 0.25

var rapidfirepu = false
var rapidfirepuDuration = 3

var invinciblepu = false
var invinciblepuDuration = 4

var laserPowerUp = false
var laserPowerUpActive = false
var laserPowerUpAvail = false
var laserPowerUpDuration = 2.5


var cloneMaxBullet =1 
var clonecurrentBullet =1
var clonebulletAvailable = true
var clonepuDuration = 4
var clone = false
var cloneActive = false
#var cloneCreated = false

var lightningPowerUp = false
var lightning = false

var timePu = false
var paused = false
var timeDuration = 3

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
	max_delay = 10
	min_delay = 3

	bulletAvailable = true
	bulletReloadTimer = 0.25

	rapidfirepu = false
	rapidfirepuDuration = 3
	
	invinciblepu = false
	invinciblepuDuration = 4

	laserPowerUp = false
	laserPowerUpActive = false
	laserPowerUpAvail = false
	laserPowerUpDuration = 2.5
	
	clone = false
	cloneActive = false
	#cloneCreated = false
	
	lightningPowerUp = false
	lightning = false
	
	timePu = false
	paused = false
	timeDuration = timeDuration
	
	powerUptimer = 1
