spider_in_file=spider/main.go
search_in_file=search/main.go

spider_out_file_linux=cmd/spider
search_out_file_linux=cmd/search

spider_out_file_win=$(out_file_spider).exe
search_out_file_win=$(out_file_search).exe


help:
	@echo 'Here is the command list:'
	@echo '------------------------'
	@cat Makefile |grep '^\w.*:$$'

build_win:
	@go build -ldflags "-w -s" -o $(spider_out_file_win) $(spider_in_file)
	@go build -ldflags "-w -s" -o $(search_out_file_win) $(search_in_file)

build_linux:
	@go build -ldflags "-w -s" -o $(spider_out_file_linux) $(spider_in_file)
	@go build -ldflags "-w -s" -o $(search_out_file_linux) $(search_in_file)
