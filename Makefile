YADAGE_WORKDIR = "$(PWD)/.yadage"

WORKFLOW_DIR = "$(PWD)/reana"
WORKFLOW_NAME = "slurm-bug-test"


.PHONY: reana-run-kuber
reana-run-kuber:
	@echo "Deploying on REANA [Kubernetes]..."
	@cd $(WORKFLOW_DIR) && \
		reana-client create -n $(WORKFLOW_NAME) -f reana-kuber.yml && \
		reana-client upload -w $(WORKFLOW_NAME) kubernetes && \
		reana-client start -w $(WORKFLOW_NAME)


.PHONY: reana-run-slurm
reana-run-slurm:
	@echo "Deploying on REANA [SLURM]..."
	@cd $(WORKFLOW_DIR) && \
		reana-client create -n $(WORKFLOW_NAME) -f reana-slurm.yml && \
		reana-client upload -w $(WORKFLOW_NAME) slurm && \
		reana-client start -w $(WORKFLOW_NAME)


.PHONY: yadage-clean
yadage-clean:
	@echo "Cleaning previous run..."
	@rm -rf $(YADAGE_WORKDIR)


.PHONY: yadage-run
yadage-run: yadage-clean
	@echo "Launching Yadage..."
	@yadage-run $(YADAGE_WORKDIR) workflow.yml \
		-p dummy="dummy" \
		-d initdir=$(WORKFLOW_DIR)/kubernetes \
		--toplevel $(WORKFLOW_DIR)/kubernetes
