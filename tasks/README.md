# Puppet Bolt Tasks

This folder contains tasks for [Puppet Bolt][puppet-bolt] that automate
Google Cloud Storage operations.

This module contains the following tasks:

- `tasks/upload.rb`:
  Uploads a local file to Google Cloud Storage

## Debugging Tasks

In case you need to debug tests in this module you can set the following
variables to increase verbose output:

Variable                | Side Effect
------------------------|---------------------------------------------------
`GOOGLE_HTTP_VERBOSE=1` | Prints debug related to the network calls being made.
`GOOGLE_HTTP_DEBUG=1`   | Prints the payload of network calls being made.

During execution of Puppet based tasks you can also set:

Variable                | Side Effect
------------------------|---------------------------------------------------
`PUPPET_HTTP_VERBOSE=1` | Prints network access information by Puppet provider.
`PUPPET_HTTP_DEBUG=1`   | Prints the payload of network calls being made.
`BOLT_VERBOSE=1`        | Run puppet with --verbose and outputs in case of error
`BOLT_DEBUG=1`          | Run puppet with --debug and outputs in case of error


[puppet-bolt]: https://puppet.com/docs/bolt/
