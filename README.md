# dev_config

Configuration files for my dev tools:
 - Git
 - Emacs

## Git

### .gitignore templates

Create useful .gitignore files for your project thanks to https://www.gitignore.io/

### Ignore files everywhere

Depending on your IDE, you might have generated local files to ignore with git.
To do so, you can ignore them _globally_, e.g. in any git repository on your
machine

1. Run `git config --global core.excludesfile ~/.gitignore_global`
2. Add your extensions in the `~/.gitignore_global` file
