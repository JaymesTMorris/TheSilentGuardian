extends Node

var HealthBar: ProgressBar
var HealthDelayBar: ProgressBar
var ManaBar: ProgressBar
var ManaDelayBar: ProgressBar
var ScoreTextLabel: RichTextLabel
var NightProgressBar: ProgressBar
var CurrencyTextLabel: RichTextLabel


func updateHealthBar(value: float) -> void:
	# Get the mana/manaDelay bars
	HealthBar = getHealthBar()
	HealthDelayBar = getHealthDelayBar()
	
	HealthDelayBar.value = HealthBar.value
	HealthBar.value = value
	while HealthDelayBar.value > HealthBar.value:
		HealthDelayBar.value -= 1
		await get_tree().create_timer(0.01).timeout

func updateManaBar(value: float) -> void:
	# Get the mana/manaDelay bars
	ManaBar = getManaBar()
	ManaDelayBar = getManaDelayBar()
	
	ManaDelayBar.value = ManaBar.value
	ManaBar.value = value
	while ManaDelayBar.value > ManaBar.value:
		ManaDelayBar.value -= 1
		await get_tree().create_timer(0.01).timeout
		
func updateScoreTextLabel(value: float) -> void:
	# Get the mana/manaDelay bars
	ScoreTextLabel = getScoreTextLabel()
	ScoreTextLabel.text = str(value)

func updateCurrencyTextLabel(value: float) -> void:
	# Get the mana/manaDelay bars
	CurrencyTextLabel = getCurrencyTextLabel()
	CurrencyTextLabel.text = str(value)

func updateNightProgressBar(value: float) -> void:
	NightProgressBar = getNightProgressBar()
	NightProgressBar.value = SpawnManager.timeLeft() / float(SpawnManager.nightLength) * 100.0

#func updateCurrencyLabel(value: float) -> void:
#	currencyLabelValue = value
func getHealthBar() -> ProgressBar:
	return get_node("/root/Main/Player/CanvasLayer/UserInterface/HealthBar")

func getHealthDelayBar() -> ProgressBar:
	return get_node("/root/Main/Player/CanvasLayer/UserInterface/HealthBar/DelayBar")

func getManaBar() -> ProgressBar:
	return get_node("/root/Main/Player/CanvasLayer/UserInterface/ManaBar")
	
func getNightProgressBar() -> ProgressBar:
	return get_node("/root/Main/Player/CanvasLayer/UserInterface/NightProgressBar")

func getManaDelayBar() -> ProgressBar:
	return get_node("/root/Main/Player/CanvasLayer/UserInterface/ManaBar/DelayBar")

func getScoreTextLabel() -> RichTextLabel:
	return get_node("/root/Main/Player/CanvasLayer/UserInterface/ScoreRect/ScoreTextLabel")

func getCurrencyTextLabel() -> RichTextLabel:
	return get_node("/root/Main/Player/CanvasLayer/UserInterface/CurrencyRect/CurrencyTextLabel")
