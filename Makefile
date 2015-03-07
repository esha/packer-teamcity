VAR_FILE ?= variables.json

.PHONY: clean agent

agent: agent.json $(VAR_FILE) cookbooks
	@packer validate -var-file=$(VAR_FILE) agent.json
	@packer build -var-file=$(VAR_FILE) agent.json

cookbooks:
	@berks vendor cookbooks

clean:
	@rm -rf cookbooks
