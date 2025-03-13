extends CanvasLayer

# a boolean signal that commuicates with player to shoot if user's response is correct
signal response(bool)

var questions_array: Array = []
var answers_array: Array = []

var random: int

# conncects text input function when node is ready 
func _ready() -> void:
	# load questions
	var question_file = FileAccess.open("res://assets/math/mathques.txt", FileAccess.READ)
	var questions_string = question_file.get_as_text().replace("\r", "") # now a whole string 
	questions_array = questions_string.split("\n") # splits questions into an arr
	question_file.close()

	# load answers 
	var answer_file = FileAccess.open("res://assets/math/mathans.txt", FileAccess.READ)
	var answers_string = answer_file.get_as_text().replace("\r", "")
	answers_array = answers_string.split("\n")
	answer_file.close()
	
	# conncect user input
	$VBoxContainer/LineEdit.text_submitted.connect(_on_LineEdit_text_entered)
	# create question
	create_math_question()

# returns user input for comparison 
func _on_LineEdit_text_entered(math_answer) -> void:
	var user_ans: int = math_answer.to_int()
	var calc_ans: int = calc_response(random)
	calcuate(user_ans, calc_ans)
	
# random generates a math question from loading from a txt file and displays it 
func create_math_question() -> int:
	random = randi() % 100 + 1 
	$VBoxContainer/Label.text = questions_array[random]
	return random

# compares the user input to the correct answer 
func calcuate(ans: int, calc: int) -> void:
	if (ans == calc):
		response.emit(true)
	else:
		response.emit(false)
	
# returns corresponding value to math question
func calc_response(index: int) -> int:
	var answer: String = answers_array[index]
	return answer.to_int()

	
