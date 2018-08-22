Rush - Linux Workstation Bootstrapper
==================================================

```
_______                       ______  
____  /  ___________  ___________  /_ 
___  /   __  ___/  / / /_  ___/_  __ \
__  /    _  /   / /_/ /_(__  )_  / / /
_  /     /_/    \__,_/ /____/ /_/ /_/ 
/_/      Linux Workstation Bootstrapper
```


Rush is a simple bash script that executes other bash scripts from compatible 
GitHub repositories. 

See [this minimal rush repo](repo), or a real life example
repo at [DannyBen/rush][1].

Rush was designed to easily allow bootstrapping of new linux machines with 
your desired configuration and installed packages.


Install
--------------------------------------------------

    sudo wget -qO /usr/local/bin/rush \
    https://raw.githubusercontent.com/DannyBen/rush-command/master/rush && \
    sudo chmod +x /usr/local/bin/rush

Or, manually place the [rush](rush) script anywhere in your `PATH`.


Usage
--------------------------------------------------

Execute a package from any Rush GitHub repository:

    $ rush <username> <package name>

For example:
    
    $ rush dannyben hello

In case the repository's name is different than `rush`, simply provide the 
full user/repo name:

    $ rush dannyben/rushrepo hello

You can set a default repository to use in the `RUSH_REPO`environment
variable:

    $ export RUSH_REPO=dannyben
    $ rush hello

Getting packages from non GitHub repositories is also easy. Just use a 
full URL in the command line, or in `RUSH_REPO`:

    $ rush http://localhost:3000 hello
    # or
    $ export RUSH_REPO=http://localhost:3000
    $ rush hello


For additional usage options, run:

    $ rush --help



Building your own Rush repository
--------------------------------------------------

You can fork [my rush repository][1], and edit it to your needs, or follow 
these instructions to create one from scratch.

1. Create a new repository on GitHub, named `rush`.
2. Each folder you create in this repository is considered a package.
3. Each package needs to have bash script named `main`, and optionally
   a plain text file called `info`.
4. In the `main` script, you have several environment variables available:
    - `$REPO`: contains the full URL of the repository
    - `$PACK`: contains the package name only
    - `$SELF`: contains the full URL of the package (== `$REPO/$PACK`)



Development
--------------------------------------------------

### For Rush Command Developers

Use the provided [docker-compose](docker-compose.yml) and use the `repo` 
folder to place your mock scripts. Remember to remove any additional scripts
from this folder before committing.

Then, you will be ready to run:

    $ docker compose run bash
    $ rush hello   # or whatever command you wish to test


### For Rush Repository Developers

For local development of your own rush repo, you can use the provided
[docker-compose-example](docker-compose-example.yml) file.

Place it in your rush repo, and run:

    $ docker compose run bash
    $ rush bootstrap   # or whatever command you wish to test

The docker compose stack is set up to:

- Start fresh (with rush installed), and store its data in volumes so you can 
  logout and login as needed.
- Have `RUSH_REPO` point to http://web:3000


[1]: https://github.com/dannyben/rush
