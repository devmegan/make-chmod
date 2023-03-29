help:
	@echo "Usage:"
	@echo "- make help: Display this help message"
	@echo "- make executable FILE=<relative_file_path> [CLASS=<user_class[u|g|o|a]>]: Make the specified file executable"
	@echo "- make unexecutable FILE=<relative_file_path> [CLASS=<user_class[u|h|o|a]>]: Make the specified file unexecutable"

executable:
	chmod $(if $(CLASS),$(CLASS))+x $(FILE)
	$(print_permissions)

unexecutable:
	chmod $(if $(CLASS),$(CLASS))-x $(FILE)
	$(print_permissions)

define print_permissions
	@echo "Updated permissions for $(FILE):"
	@echo "`ls -l $(FILE) | cut -d" " -f1`"
endef

.PHONY: executable unexecutable help
.SILENT: