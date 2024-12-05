extends Node

@export var volume: float = 1.0
@export var isMuted: bool = false

# AudioStreamPlayer nodes for sound effects and music
var soundPlayer: AudioStreamPlayer
var musicPlayer: AudioStreamPlayer

# Store the currently playing music path
var currentMusicPath: String = ""

func _ready() -> void:
	# Initialize audio players
	soundPlayer = AudioStreamPlayer.new()
	musicPlayer = AudioStreamPlayer.new()
	
	add_child(soundPlayer)
	add_child(musicPlayer)
	
	soundPlayer.bus = "SFX"
	musicPlayer.bus = "Music"

func playSound(effectPath: String) -> void:
	if isMuted:
		return
	
	var effect: AudioStream = load(effectPath) as AudioStream
	if effect == null:
		print("Failed to load sound effect: " + effectPath)
		return

	soundPlayer.stream = effect
	soundPlayer.volume_db = linear_to_db(volume)
	soundPlayer.play()

func playMusic(musicPath: String, loop: bool = true) -> void:
	if isMuted:
		return
	
	var music: AudioStream = load(musicPath) as AudioStream
	if music == null:
		print("Failed to load music: " + musicPath)
		return
	
	# Check if the loaded music supports looping
	if music is AudioStreamOggVorbis or music is AudioStreamMP3:
		music.loop = loop
	
	if musicPlayer.playing:
		musicPlayer.stop()
	
	musicPlayer.stream = music
	musicPlayer.volume_db = linear_to_db(volume)
	musicPlayer.play()

func stopMusic() -> void:
	if musicPlayer.playing:
		musicPlayer.stop()
		currentMusicPath = "" 

func setVolume(level: float) -> void:
	volume = level
	soundPlayer.volume_db = linear_to_db(volume)
	musicPlayer.volume_db = linear_to_db(volume)

func toggleMute() -> void:
	isMuted = !isMuted
	if isMuted:
		soundPlayer.stop()
		musicPlayer.stop()
