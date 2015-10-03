
commander = require 'commander'
fs = require 'fs'
path = require 'path'

commander.version '0.0.1'
commander.option '-v, --verbose', 'output additional information'
commander.parse process.argv

verbose = (commander.verbose is true)
type = (if commander.args.length > 0 and commander.args[0] in ['patch','major','minor'] then commander.args[0] else 'patch' )
dir = process.cwd()

locateFileSystemEntity = (dir, name)->

  until fs.existsSync path.join dir, name
    dir = path.join dir, '../'
    if dir in [ '.', 'C:', './', '', '/', '\\' ]
      return false
  return path.join dir, name

jsonPath = locateFileSystemEntity dir, 'package.json'

unless jsonPath
  console.log 'justpub only work on nodejs modules (where there is a package.json file)'
  process.exit(1)

isGit = (locateFileSystemEntity dir, '.git') isnt false

