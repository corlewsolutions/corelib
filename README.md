# Corelib

Many languages provide a vast library of methods or functions for developers to use, whereas Ruby only provides  basic (albeit powerful) building blocks.  At best, this leads to more complex applications and time wasted writing code another developer has probably already written; at worst it results in core class extensions being placed in helper methods or on objects that have no business owning the methods.  The lack of a good strategy for managing Ruby extentions really becomes apparent when a developer needs to share his extensions across multiple projects.

Corelib aims to solve this problem by providing a central gem for developers to share extensions & additions to the Ruby core.  Corelib focuses on:

1. Reducing Code Duplication
2. Improving Code Readability
3. Sharing Developer Knowledge
4. Reducing Errors
5. Saving Developers Time
6. Improving Code Quality & Performance

We invite all like minded developers to join us in growing the corelib library of extensions.

## Inspiration

Corelib was inspired by Smalltalk where it is quite common (and encouraged) to modify base classes with additional convience methods.  In addition, Smalltalk defines many useful classes that would benefit the Ruby community such as Set, OrderedSet, SortedCollection, Dictionary, Association, etc... 

## Installation

Add this line to your application's Gemfile:

    gem 'corelib'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install corelib

## Usage

Browse the /lib/corelib/<class name> directory find methods that extend the chosen classes. All of these methods are now available inside your application without any additional configuration.

## Contributing

If you have developed useful extensions to the Ruby core, please consider adding them to our "little" library.

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
