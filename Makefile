spider_in_file=spider/main.go
search_in_file=searcher/main.go

spider_out_file_linux=cmd/spider
search_out_file_linux=cmd/search

spider_out_file_win=$(spider_out_file_linux).exe
search_out_file_win=$(search_out_file_linux).exe


help:
	@echo 'Here is the command list:'
	@echo '------------------------'
	@cat Makefile |grep '^\w.*:$$'

go_get:
	@go get github.com\gin-gonic\gin
	@go get github.com\go-ego\riot

build_win:
	@go build -ldflags "-w -s" -o $(spider_out_file_win) $(spider_in_file)
	@go build -ldflags "-w -s" -o $(search_out_file_win) $(search_in_file)

cross_build_linux:
	@make build_linux

build_linux:
	@GOOS=linux GOARCH=amd64 go build -ldflags "-w -s" -o $(spider_out_file_linux) $(spider_in_file)
	@GOOS=linux GOARCH=amd64 go build -ldflags "-w -s" -o $(search_out_file_linux) $(search_in_file)

clean:
	@rm -rf $(spider_out_file_linux) $(search_out_file_linux)
	@rm -rf $(spider_out_file_win) $(search_out_file_win)
