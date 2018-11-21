help:
	@echo 'Here is the command list:'
	@echo '------------------------'
	@cat Makefile |grep '^\w.*:$$'

build_win:
    @go build -ldflags "-w -s" -o litebt.exe spider/main.go