# gitolite cookbook

Cookbook for installing/configuring [gitolite][1].

# Requirements

Gitolite depends on these packages on a server:
 - `openssh` >= 5.0
 - `git` >= '1.6.6'
 - `perl` >= '5.8.8'

# Usage

Include `gitolite` in your node's `run_list`:

```json
{
  "name": "mynode",
  ...
  "run_list": [
    "recipe[gitlite::default]"
  ]
  ...
}
```

If you don't like any of the default attributes, override them in
`default\_attributes`:

```json
{
  ...
  "default_attributes": {
    "gitolite": {
      "install_method": "source"
    }
  }
  ...
}
```

# Attributes

*default*

 - `install_method`: The method of installation for gitolite. Options
                     are `source` and `package`. *default*: package.

 - `repo_dir`: Directory of where the repos should live.
 
 - `user`: The [username][2] gitolite will use to manage all
           files and directories.


# Recipes

*default* - Does it all. Installs gitolite, sets up the git user,  configures the server.
            Because gitolite requires a sshkey to get access, one will
            be generated during the installation, and the placed into an
            encrypted databag.

# Author

Author:: OSU Open Source Lab (<systems@osuosl.org>)
License:: Apache 2.0

[1] http://gitolite.com/gitolite/
[2] http://gitolite.com/gitolite/gitolite.html#install-nnc
