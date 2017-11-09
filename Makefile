.PHONY=build
NAME = HobbyApp
WORKSPACE = $(NAME).xcworkspace
PROJECT = $(NAME).xcodeproj
XCODE_VERSION = "$(shell xcodebuild -version 2>/dev/null)"

help: ##Show this help
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'
count: ##Show line of code count
	cloc "HobbyApp" "HobbyAppTests"
setup: ##Setop
	bundle install & rake generate:keys
cert: ##Download all certificates from apple
	fastlane setup
synx: ## Create folder for project group
	bundle exec synx $(PROJECT) 
clean: ##Remove pods
	pod deintegrate & pod clean
keys: ## Create Keys
	rake generate:keys
lint: ## Code style autocorrect
	swiftlint autocorrect