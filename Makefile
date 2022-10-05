.PHONY: quality
quality:
	which golangci-lint || go install github.com/golangci/golangci-lint/cmd/golangci-lint@v1.49.0
	golangci-lint run

.PHONY: build
build:
	goreleaser build --snapshot --rm-dist

.PHONY: image
image:
	cp ./dist/tfvc_linux_amd64_v1/tfvc ./tfvc
	docker buildx build -t tfvc-test --no-cache --platform=linux/amd64 .
	rm ./tfvc