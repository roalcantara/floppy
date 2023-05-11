# https://github.com/pblazyca/unity-webgl-localhost-docker
# https://docs.unity3d.com/Manual/EditorCommandLineArguments.html
# https://docs.unity.cn/Packages/com.unity.test-framework@1.3/manual/reference-command-line.html
SHELL := /bin/bash
UNITY_VERSION := 2021.3.24f1
TARGET_PLATFORM := WebGL
DOCKER_HOSTNAME := unity-docker-builder
SUPPORT_PATH := $(PWD)/scripts/support
LICENSE_FILE := support/Unity_v2021.x.local.ulf
LICENSE := $(PWD)/scripts/$(LICENSE_FILE)
LICENSE_DOCKER_FILE := support/Unity_v2021.x.docker.ulf
LICENSE_DOCKER := $(PWD)/scripts/$(LICENSE_DOCKER_FILE)
ifeq ($(shell uname -s),Linux)
  UNITY_BIN = /opt/Unity/Editor/Unity
else ifeq ($(shell uname -s),Darwin)
  UNITY_BIN = /Applications/Unity/Hub/Editor/$(UNITY_VERSION)/Unity.app/Contents/MacOS/Unity
else ifeq ($(shell uname -s),Windows)
  UNITY_BIN = C:\Program Files\Unity\Editor\Unity.exe
endif

default:
	@make -s all

all:
	@make -s help | fzf --cycle | cut -d ' ' -f1 | xargs -r make

$(SUPPORT_PATH):
	@mkdir -p $(SUPPORT_PATH)

$(LICENSE): $(SUPPORT_PATH)
ifneq (, $(shell which gopass))
	$(shell gopass cat dev/floppy/Unity_v2021.x.local.ulf > $(LICENSE))
endif

$(LICENSE_DOCKER): $(SUPPORT_PATH)
ifneq (, $(shell which gopass))
	$(shell gopass cat dev/floppy/Unity_v2021.x.docker.ulf > $(LICENSE_DOCKER))
endif

.PHONY: activation_file
activation_file: $(SUPPORT_PATH) ## Generate Manual Activation File $(PWD)/scripts/support/Unity_v2021.1.7f1.local.alf
	$(UNITY_BIN) \
		-batchmode \
		-nographics \
		-quit \
		-logfile /dev/stdout \
		-createManualActivationFile
	mkdir -p $(PWD)/scripts/support
	mv $(PWD)/Unity_v2021.1.7f1.alf $(SUPPORT_PATH)/Unity_v2021.1.7f1.local.alf
	@echo "Please activate the license file $(SUPPORT_PATH)/Unity_v2021.1.7f1.local.alf.."
	open https://license.unity3d.com/manual

.PHONY: activate
activate: $(LICENSE) ## Activate the unity editor with license file $(PWD)/scripts/support/Unity_v2021.x.local.ulf
	$(UNITY_BIN) \
		-batchmode \
		-nographics \
		-quit \
		-logfile /dev/stdout \
		-manualLicenseFile $(LICENSE)

.PHONY: build
build: activate ## Build WebGL locally to $(PWD)/dist
	$(UNITY_BIN) \
		-batchmode \
		-nographics \
		-quit \
		-logfile /dev/stdout \
		-projectPath $(PWD)/src \
		-executeMethod UnityBuilderAction.BuildScript.Build \
		-buildTarget WebGL \
		-customBuildPath $(PWD)/dist \
		-buildVersion 1.0.0 \
		-androidVersionCode 1 \
		-customBuildName $(TARGET_PLATFORM)

.PHONY: run
run: ## Run the $(PWD)/dist folder on localhost:8080 and open browser
	pnpm dlx http-server $(PWD)/dist -o

.PHONY: test
test: ## Run all tests from the command line
	$(UNITY_BIN) \
		-runTests \
		-batchmode \
		-nographics \
		-projectPath $(PWD)/src \
		-testResults $(PWD)/out/tests_results.xml \
		-testPlatform $(TARGET_PLATFORM)

.PHONY: test/edit
test/edit: ## Run all tests from the command line
	$(UNITY_BIN) \
		-runTests \
		-batchmode \
		-nographics \
		-projectPath $(PWD)/src \
		-testResults $(PWD)/out/tests_results_editmode.xml \
		-testPlatform editmode

.PHONY: test/play
test/play: ## Run all tests from the command line
	$(UNITY_BIN) \
		-runTests \
		-batchmode \
		-nographics \
		-projectPath $(PWD)/src \
		-testResults $(PWD)/out/tests_results_playmode.xml \
		-testPlatform playmode

.PHONY: docker/activation_file
docker/activation_file: ## Generate license file `Unity_v2021.1.7f1.alf`
	docker run --rm \
		--hostname $(DOCKER_HOSTNAME) \
		--workdir=/app
		-v $(PWD)/src:app \
		unityci/editor:ubuntu-$(UNITY_VERSION)-webgl-1.1.2 \
		sh -c 'unity-editor --batchmode --nographics --quit --logfile /dev/stdout -createManualActivationFile'
	mv $(PWD)/src/Unity_v2021.1.7f1.alf $(SUPPORT_PATH)/Unity_v2021.1.7f1.alf
	@echo "Please activate the license file $(SUPPORT_PATH)/Unity_v2021.1.7f1.alf.."
	open https://license.unity3d.com/manual

.PHONY: docker/build
docker/build: $(LICENSE_DOCKER) ## Build WebGL from docker container
	docker run --rm \
		--name $(DOCKER_HOSTNAME) \
		--hostname $(DOCKER_HOSTNAME) \
		-e UNITY_VERSION=$(UNITY_VERSION) \
		-v $(PWD)/src:/app \
		-v $(PWD)/dist:/app/Builds \
		-v $(SUPPORT_PATH):/app/support \
		-w /app \
        unityci/editor:ubuntu-$(UNITY_VERSION)-webgl-1.1.2 \
			sh -c '\
			unity-editor -nographics -quit -logfile -manualLicenseFile $(LICENSE_DOCKER_FILE); \
			unity-editor \
				-nographics \
				-quit \
				-logfile \
				-projectPath /app \
				-executeMethod UnityBuilderAction.BuildScript.Build \
				-buildTarget $(TARGET_PLATFORM) \
				-customBuildPath /app/Builds \
				-buildVersion 1.0.0 \
				-androidVersionCode 1 \
				-customBuildName $(TARGET_PLATFORM)'

.PHONY: docker/test
docker/test: $(LICENSE_DOCKER) ## Run all tests from docker container
	docker run --rm \
		--name $(DOCKER_HOSTNAME) \
		--hostname $(DOCKER_HOSTNAME) \
		-e UNITY_VERSION=$(UNITY_VERSION) \
		-v $(PWD)/src:/app \
		-v $(PWD)/out:/app/out \
		-v $(SUPPORT_PATH):/app/support \
		-w /app \
		unityci/editor:ubuntu-$(UNITY_VERSION)-webgl-1.1.2 \
			sh -c '\
			unity-editor -nographics -quit -logfile -manualLicenseFile $(LICENSE_DOCKER_FILE); \
			unity-editor \
				-runTests \
				-nographics \
				-projectPath /app \
				-testResults /app/out/tests_results.xml \
				-testPlatform $(TARGET_PLATFORM)'

.PHONY: docker/test/edit
docker/test/edit: $(LICENSE_DOCKER) ## Run all EditMode tests from docker container
	docker run --rm \
		--name $(DOCKER_HOSTNAME) \
		--hostname $(DOCKER_HOSTNAME) \
		-e UNITY_VERSION=$(UNITY_VERSION) \
		-v $(PWD)/src:/app \
		-v $(PWD)/out:/app/out \
		-v $(SUPPORT_PATH):/app/support \
		-w /app \
		unityci/editor:ubuntu-$(UNITY_VERSION)-webgl-1.1.2 \
			sh -c '\
			unity-editor -nographics -quit -logfile -manualLicenseFile $(LICENSE_DOCKER_FILE); \
			unity-editor \
				-runTests \
				-nographics \
				-projectPath /app \
				-testResults /app/out/tests_results_editmode.xml \
				-testPlatform editmode'

.PHONY: docker/test/play
docker/test/play: $(LICENSE_DOCKER) ## Run all PlayMode tests from docker container
	docker run --rm \
		--name $(DOCKER_HOSTNAME) \
		--hostname $(DOCKER_HOSTNAME) \
		-e UNITY_VERSION=$(UNITY_VERSION) \
		-v $(PWD)/src:/app \
		-v $(PWD)/out:/app/out \
		-v $(SUPPORT_PATH):/app/support \
		-w /app \
		unityci/editor:ubuntu-$(UNITY_VERSION)-webgl-1.1.2 \
			sh -c '\
			unity-editor -nographics -quit -logfile -manualLicenseFile $(LICENSE_DOCKER_FILE); \
			unity-editor \
				-runTests \
				-nographics \
				-projectPath /app \
				-testResults /app/out/tests_results_playmode.xml \
				-testPlatform playmode'

.PHONY: clear
clear: ## Clear local and temporary folders
	rm -rf $(PWD)/dist
	rm -rf $(PWD)/out
	rm -rf $(PWD)/scripts/support

.PHONY: help
help: ## Display available tasks
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z\-_0-9%:\/]+:.*?## / {printf "\033[36m%-30s→\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST) | sed s/://
