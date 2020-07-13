# creat new item
if [[ $# == 0 ]]; then
	read -p "输入目录名: " dir
else
	dir=$1
fi
status=1
while [[ $status == 1 ]]; do
	if [[ -e $dir ]]; then
		read -p "$dir已经存在，结束程序[0]/重新输入目录名[1]：" yon
		if [[ $yon == 1 ]]; then
			read -p "输入目录名: " dir
			status=1
		else
			status=0
		fi
	else
		mkdir "$dir/" "$dir/img/" "$dir/ref/"
		echo "创建目录：" "$dir/" "$dir/img/" "$dir/ref/"
		yaml="---\ntitle:$dir\ntypora-root-url: ./img\n---\n"
		echo -e $yaml > "$dir/$dir.md"
		echo "生成文件：" "$dir/$dir.md"
		status=0
	fi
done

