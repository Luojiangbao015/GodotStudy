extends Node2D

#创建一个变量实例玩家单例,方便调用
var 玩家数据=Player.玩家数据



#定义一个字符串类型 存储玩家数据文件的路径
var 路径:String="res://玩家数据.json"


#创建写入玩家数据的方法
func 写入数据():
	#定义一个变量 用于打开路径内的文件,write为打开写入  是一个枚举常量
	var 写入=FileAccess.open(路径,FileAccess.WRITE)
	
	#将数据写入文件内
	写入.store_line(JSON.stringify(玩家数据))
	
	#这样写入的方法就算完成了
	#接下来写读取数据的方法



#创建读取玩家数据的方法
func 读取数据():
	
	#定义一个变量 用于打开路路径内的文件  erad为获取读取  是一个枚举常量
	var 读取=FileAccess.open(路径,FileAccess.READ)
	
	#判断一下文件是否打开成功
	if FileAccess.file_exists(路径):
	#打开成功则执行下边的写入命令
	#获取文件的长度和字节吧好像
		while  读取.get_position()<读取.get_length():
			#接下来读取文件的数据
			#创建一个变量用来获取文件数据
			var 容器=JSON.parse_string(读取.get_line())
			
			#将容器获得的内容再传给玩家的数据
			玩家数据["名字"]=容器["名字"]
			玩家数据["生命值"]=容器["生命值"]
			玩家数据["魔法值"]=容器["魔法值"]
	
	#试一下打印玩家的数据
	print(玩家数据["名字"])
	print(玩家数据["生命值"])
	print(玩家数据["魔法值"])

#写完了 试着调用一下函数
#自动生成了一个文件 里面已经存储进了玩家的数据了 接下来试一下获取数据
#完成了 收工 哈哈哈
#在了测试一下改变数据吧 复杂一点的 先备份一份
#你们可以不用哈
#给三个按钮信号吧 一个读取 一个存储 一个改变
#写一个减生命值的方法
#写一个显示玩家生命值的标签
func 减掉一滴血():
	var 怪物攻击力=20
	玩家数据["生命值"]-=怪物攻击力


# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


#把按键信号发过来调用

func _on_存储_button_down():
	写入数据()
	pass # Replace with function body.


func _on_获取_button_down():
	读取数据()
	pass # Replace with function body.


func _on_修改_button_down():
	减掉一滴血()
	#因为不是每帧存储 所以都只能手动修改
	pass # Replace with function body.
