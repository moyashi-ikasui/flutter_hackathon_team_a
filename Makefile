.PHONY: build_runner_watch build_runner_force

build_runner_watch:
	flutter pub run build_runner watch

build_runner_force:
	-rm -rf ./lib/infrastructure/openapi/
	flutter pub run build_runner build --delete-conflicting-outputs

