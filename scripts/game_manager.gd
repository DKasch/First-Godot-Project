extends Node

var score = 0
const TOTAL1 = 15
const TOTAL2 = 25

@onready var score_label: Label = $ScoreLabel
@onready var score_label_2: Label = $ScoreLabel2
@onready var killzone_2: Area2D = $Killzone2
@onready var animation_player: AnimationPlayer = $AnimationPlayer

func add_point():
	score += 1
	score_label.text = "You have collected \n" + str(score) + " coins."
	if score <= TOTAL1:
		score_label_2.text = "Collect\n" + str(TOTAL1 - score) +" More\n" + "Coins!"

func _on_area_2d_body_entered(body: Node2D) -> void:
	if score == TOTAL1:
		killzone_2.queue_free() 
		score_label_2.text = "Visit a\n Suspicious, Snowy\n Platform"
	if score >= TOTAL2:
		score_label_2.text = "Thank you \nfor Restoring\n Our Gold\n Please Visit\n Our Golden Garden"
		animation_player.play("platform")
