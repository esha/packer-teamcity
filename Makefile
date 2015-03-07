JDK_VERSION ?= 7

.PHONY: clean agent

agent: agent.json cookbooks
	@packer validate -var 'jdk_version=$(JDK_VERSION)' agent.json
	@packer build -var 'jdk_version=$(JDK_VERSION)' agent.json

cookbooks:
	@berks vendor cookbooks

clean:
	@rm -rf cookbooks
