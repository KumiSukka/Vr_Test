extends Node3D

var childs = 0
func _ready():
	for i in self.get_child_count():
		var temp = i - 1
		childs = temp
		
func _on_child_exiting_tree(node):
	childs -= 1
	if childs <= 0:
		print("tuhoa huone")
		for n in self.get_children():
			self.remove_child(n)
			n.queue_free()
			self.queue_free 
	else:
		print(childs)
