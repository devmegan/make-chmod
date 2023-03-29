help:
	@echo "Usage:"
	@echo "- make help: Display this help message"
	@echo "- make executable FILE=<relative_file_path> [CLASS=<user_class[a|g|o|u]>]: Make the specified file executable"
	@echo "- make unexecutable FILE=<relative_file_path> [CLASS=<user_class[a|g|o|u]>]: Make the specified file unexecutable"

executable:
	$(MAKE) -s set_permissions OPERATOR=+x FILE=$(FILE) CLASS=$(CLASS)

unexecutable:
	$(MAKE) -s set_permissions OPERATOR=-x FILE=$(FILE) CLASS=$(CLASS)

set_permissions:
	chmod $(if $(CLASS),$(CLASS))$(OPERATOR) $(FILE)
	$(print_permissions)
	$(MAKE) -s print_permissions FILE=$(FILE)

print_permissions:
	@echo "Updated permissions for $(FILE):"
	@echo "`ls -l $(FILE) | cut -d" " -f1`"

.PHONY: help executable unexecutable set_permissions print_permissions
.SILENT:
