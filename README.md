# justpub
A command line tool to automate the process of publishing modules to the npm registry after automatically increasing the version number.


# Installation

For usage from the command line

```bash
[sudo] npm install -g justpub
```

# Usage from the command line

### For patch version update

Incrememnt the **patch** version (i.e. 0.0.x), Create a git commit (only if inside a git repo), Invoke npm publish.

    justpub

or

    justpub patch

### For minor version update

    justpub minor

### For minor version update

    justpub major

# Command Line Options

 Options:

    -h, --help     output usage information
    -V, --version  output the version number
    -v, --verbose  output additional information


# LICENCE

[MIT](LICENSE)

