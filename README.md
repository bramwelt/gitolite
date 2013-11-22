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
