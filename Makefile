.PHONY=build
NAME = HobbyApp
WORKSPACE = $(NAME).xcworkspace
PROJECT = $(NAME).xcodeproj
XCODE_VERSION = "$(shell xcodebuild -version 2>/dev/null)"

help: ##Show this help
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'
count: ##Show line of code count
	cloc "HobbyApp" "HobbyAppTests"
clean: ##Remove pods
	pod deintegrate & pod clean
lint: ## Code style autocorrect
	swiftlint autocorrect