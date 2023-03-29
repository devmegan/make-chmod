# [make chmod](https://github.com/devmegan/make-chmod)

A makefile that wraps the unix [`chmod`](https://man7.org/linux/man-pages/man1/chmod.1.html) command to set file system object permissions, and echo the new permissions after the update. These make commands are longer, more inconvenient, and provide less control. I can't think of a use case for them, just use `chmod -v` instead.

## Usage

### Help
- `make help` : get help on usage

### Execute permissions (x)
- `make executable FILE=<relative_file_path> [CLASS=<user_class[a|g|o|u]>]` : make a file executable
- `make unexecutable FILE=<relative_file_path> [CLASS=<user_class[a|g|o|u]>]` : make a file unexecutable
