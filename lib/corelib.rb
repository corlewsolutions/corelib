#See bottom of http://stackoverflow.com/questions/4527992/require-all-files-in-sub-directory
#Dir[File.join(".", "**/*.rb")].each { |f| require f unless f[/^\.\/spec\//]}

#Old Way
require "corelib/version"
require "corelib/array/alias"
require "corelib/array/core"
require "corelib/array/helpers"
require "corelib/array/math"
require "corelib/boolean/true"
require "corelib/boolean/false"
require "corelib/nil/nil"
require "corelib/numeric/core"
require "corelib/string/core"