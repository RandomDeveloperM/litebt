spider_in_file=spider/main.go
spider_out_file_linux=cmd/spider
spider_out_file_win=$(spider_out_file_linux).exe

searcher_out_file_linux=cmd/searcher
searcher_in_file=searcher/main.go
searcher_out_file_win=$(searcher_out_file_linux).exe

downloader_in_file=downloader/main.go
downloader_out_file_linux=cmd/downloader
downloader_out_file_win=$(downloader_out_file_linux).exe

help:
	@echo 'Here is the command list:'
	@echo '------------------------'
	@cat Makefile |grep '^\w.*:$$'

go_get:
	@go get github.com\gin-gonic\gin
	@go get github.com\go-ego\riot

build_win:
	@go build -ldflags "-w -s" -o $(spider_out_file_win) $(spider_in_file)
	@go build -ldflags "-w -s" -o $(searcher_out_file_win) $(searcher_in_file)
	@go build -ldflags "-w -s" -o $(downloader_out_file_win) $(downloader_in_file)

cross_build_linux:
	@make build_linux

build_linux:
	@GOOS=linux GOARCH=amd64 \
		go build -ldflags "-w -s" -o $(spider_out_file_linux) $(spider_in_file)
	@GOOS=linux GOARCH=amd64 \
		go build -ldflags "-w -s" -o $(searcher_out_file_linux) $(searcher_in_file)
	@GOOS=linux GOARCH=amd64 \
		go build -ldflags "-w -s" -o $(downloader_out_file_linux) $(downloader_in_file)
clean:
	@rm -rf $(spider_out_file_linux) $(searcher_out_file_linux) $(downloader_out_file_linux)
	@rm -rf $(spider_out_file_win) $(searcher_out_file_win) $(downloader_out_file_win)
