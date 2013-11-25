# gitolite cookbook

Cookbook for installing/configuring [gitolite][1].

# Requirements

Server packages:
 - `openssh` >= 5.0
 - `git` >= '1.6.6'
 - `perl` >= '5.8.8'

Cookbooks:
 - [users][3]

Because gitolite requires a SSH pubkey to setup, [users][3] needs to be
setup and configured before hand with at least one user.

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
`default_attributes`:

```json
{
  ...
  "default_attributes": {
    "gitolite": {
      "admin_user": "myadmin"
    }
  }
  ...
}
```

# Attributes

*default*

 - `admin_user`: The [admin][2] user with the initial pubkey required to
                 clone the gitolite-admin repo.

# Recipes

*default* - Installs gitolite and initializes the gitolite-admin repo.

# Author

Author:: OSU Open Source Lab (<systems@osuosl.org>)
License:: Apache 2.0

[1]: http://gitolite.com/gitolite/
[2]: http://gitolite.com/gitolite/setup.html
[3]: https://github.com/opscode-cookbooks/users
