extends Node3D

var childs = -1
func _ready():
	for i in self.get_children():
		print(i)
		childs += i
		print(childs)
func _on_child_exiting_tree(node):
	if childs == 0:
		self.queue_free 
