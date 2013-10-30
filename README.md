# motd_handler-cookbook
Updates /etc/motd that Chef is currently running or failed.

Restores original /etc/motd upon successful chef run.

# Requirements
Chef 10.x

Chef 11.x

# Usage
Place the `motd_handler-cookbook` as early in the run list as possible.

# Attributes

`node['motd_handler']['in_progress_message'] - message to be displyed while chef run is in progress`
`node['motd_handler']['failure_message'] - message to be displayed if chef run failed`

# Recipes
* Default - Installs the motd chef-handler

# Author

Author:: Intuit, Inc. (<kevin_young@intuit.com>)
