help:
	@echo "makefile usage:\n"
	@echo "help:"
	@echo "- make help: Display this help message"
	${MAKE} -s help-read help-write help-execute

help-read:
	@echo "\nread:"
	@echo "- make readabable FILE=<relative_file_path> [CLASS=<user_class[a|g|o|u]>]: Make the specified file readabable"
	@echo "- make unreadable FILE=<relative_file_path> [CLASS=<user_class[a|g|o|u]>]: Make the specified file unreadable"

help-write:
	@echo "\nwrite:"
	@echo "- make writebable FILE=<relative_file_path> [CLASS=<user_class[a|g|o|u]>]: Make the specified file writable"
	@echo "- make unwriteable FILE=<relative_file_path> [CLASS=<user_class[a|g|o|u]>]: Make the specified file unwritable"

help-execute:
	@echo "\n execute:"
	@echo "- make executable FILE=<relative_file_path> [CLASS=<user_class[a|g|o|u]>]: Make the specified file executable"
	@echo "- make unexecutable FILE=<relative_file_path> [CLASS=<user_class[a|g|o|u]>]: Make the specified file unexecutable"

readable:
	$(MAKE) -s set_permissions OPERATOR=+r FILE=$(FILE) CLASS=$(CLASS)

unreadable:
	$(MAKE) -s set_permissions OPERATOR=-r FILE=$(FILE) CLASS=$(CLASS)

writable:
	$(MAKE) -s set_permissions OPERATOR=+w FILE=$(FILE) CLASS=$(CLASS)

unwritable:
	$(MAKE) -s set_permissions OPERATOR=-w FILE=$(FILE) CLASS=$(CLASS)

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

.PHONY: help help-read help-execute help-write
.PHONY: readable unreadable writable unwritable executable unexecutable
.PHONY: set_permissions print_permissions
.SILENT:
