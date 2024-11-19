extends Node2D

@export var audio_stream_player: AudioStreamPlayer
@export var rich_text_label: RichTextLabel

const DELAY = 10.0
var timer = 0.0

func _ready() -> void:
  rich_text_label.text = ""
  for i in range(60):
    rich_text_label.text += "\n"


func _process(delta: float) -> void:
  set_line(1, "get_bus_index of &\"Music\":[color=#4466FF]" + str(AudioServer.get_bus_index(&"Music")))
  set_line(2, "audio_stream_player.bus = [color=#4466FF]" + audio_stream_player.bus)
  timer += delta
  if timer < DELAY: return

  audio_stream_player.bus = &"Music"


func set_line(linenum: int, rich_text: String) -> void:
  var current_text := rich_text_label.text.split("\n")
  var new_text := ""
  for line_index in current_text.size() - 1:
    var line := current_text[line_index]

    if line_index + 1 == linenum:
      new_text += "[color=orange]" + str(line_index + 1) + "[color=gray]:[color=white] " + rich_text
    else:
      new_text += line

    new_text += "\n"

  rich_text_label.text = new_text
