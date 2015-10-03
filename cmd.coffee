
commander = require 'commander'
fs = require 'fs'
path = require 'path'

commander.version '0.0.1'
commander.option '-v, --verbose', 'output additional information'
commander.parse process.argv

isVerboseMode = (commander.verbose is true)
versionType = (if commander.args.length > 0 and commander.args[0] in ['patch','major','minor'] then commander.args[0] else 'patch' )

console.log process.cwd(), versionType