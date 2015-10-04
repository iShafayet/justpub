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


# Customization

Please create an issue regarding what sort of additional feature and customization you would like to see. We usually make things happen pretty soon.

# Contributing

We actively check for issues even for the least used repositories (unless explicitly abandoned). All of our opensource repositories are being used in commercial projects by teamO4 or bbsenterprise. So, it is very likely that we will sort out important issues not long after they are posted.

Please create a github issue if you find a bug or have a feature request.

Pull requests are always welcome for any of our public repos.

