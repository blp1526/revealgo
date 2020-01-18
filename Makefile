export GO111MODULE=on

.PHONY: deps
deps:
	go mod tidy
	go get -u github.com/mattn/go-bindata/...@46b8933a6deb6b385630110eb59ee560775a68bd

.PHONY: bindata
bindata: deps
	go-bindata -pkg revealgo -o assets.go assets/revealjs/lib/... assets/revealjs/plugin/... assets/revealjs/css/... assets/revealjs/js/... assets/templates

.PHONY: install
install: bindata
	go install github.com/yusukebe/revealgo/cmd/revealgo
