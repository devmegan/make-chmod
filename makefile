help:
	@echo "Usage:"
	@echo "- make help: Display this help message"
	@echo "- make executable FILE=<file>: Make the specified file executable"
	@echo "- make unexecutable FILE=<file>: Make the specified file unexecutable"

executable:
	chmod +x $(FILE)
	$(print_permissions)

unexecutable:
	chmod -x $(FILE)
	$(print_permissions)

define print_permissions
	@echo "Updated permissions for $(FILE):"
	@echo "`ls -l $(FILE) | cut -d" " -f1`"
endef

.PHONY: executable unexecutable help
.SILENT: