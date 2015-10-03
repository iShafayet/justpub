
commander = require 'commander'
fs = require 'fs'
path = require 'path'

commander.version '0.0.1'
commander.option '-v, --verbose', 'output additional information'
commander.parse process.argv

typeArray = ['major','minor','patch']

verbose = (commander.verbose is true)
type = (if commander.args.length > 0 and commander.args[0] in typeArray then commander.args[0] else 'patch' )
typeIndex = typeArray.indexOf type
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

json = JSON.parse fs.readFileSync jsonPath, { encoding: 'utf8' }

newVersion = do =>

  versionFragments = json.version.split '.'
  unless versionFragments.length is 3
    console.log 'unsopperted version indicator. please use semver.'
    process.exit(2)

  for fragment, index in versionFragments
    versionFragments[index] = fragment = parseInt fragment

    if isNaN fragment
      console.log 'unsopperted version indicator. please use semver.'
      process.exit(3)

  if type is 'patch'
    versionFragments[2] += 1
  else if type is 'minor'
    versionFragments[1] += 1
    versionFragments[2] = 0
  else if type is 'major'
    versionFragments[0] += 1
    versionFragments[1] = 0
    versionFragments[2] = 0

  return versionFragments.join '.'

console.log newVersion
