---
title: "How Build This Site"
date: 2018-02-17T21:09:19Z
draft: false
---

I think it is a good idea for the first post explain how i build this site.
It was built using [Hugo](https://gohugo.io/). Hugo is a very popular
open-source static site generators.

Install and quickstart with Hugo
--------------------------------

First of all you have to install Hugo in your system. For this work follow
the instruction on the [official Hugo's docs](https://gohugo.io/documentation/).

In my case, I did not want to install directly into my system so I used
[Docker](https://www.docker.com/what-docker).
[This image](https://hub.docker.com/r/jguyomard/hugo-builder/) has everything
you need to run `hugo` command.

### Create new static site

```bash
  docker run --rm -it -v $PWD:/src -u hugo \
    jguyomard/hugo-builder hugo new site new_site
```

### Create repository with the initial files:

Create repository on Github for you website code source [here](https://github.com/new).

Then create your local repository and add the remote:

```bash
  cd new_site
  git init
  git add .
  git commit -m "first commit"
  git remote add origin git@github.com:fedeotaran/<repo_name>.git
  git push -u origin master
```

### Download and install Hugo theme

The simplest way to start using Hugo is to use one of his themes.
See all Hugo's themes availables [here](https://themes.gohugo.io/).

Then clone the repository inside `themes` folder:

```bash
  git clone https://github.com/nishanths/cocoa-hugo-theme.git themes/cocoa
```

If you want customize any theme, fork the repository and add as submodule:

```bash
  git submodule add https://github.com/budparr/cocoa-hugo-theme.git \
    themes/cocoa
```

Now setup your theme on the config files:

```bash
  echo 'theme = "cocoa"' >> config.toml
```

For full configuration example you can use the files inside `exampleSite` folder:

```bash
  cp exampleSite/* .
```
### Serve your site locally

```bash
  docker run --rm -it -v $PWD:/src -p 1313:1313 -u hugo \
    jguyomard/hugo-builder hugo server -w -t cocoa \
    --bind=0.0.0.0 --verbose --baseUrl=http://<your_id_address>
```

> It's very important that you complete the flag `--baseUrl=` with
> your ip to serve correctly

Now visit `http://<your_ip_address>:1313/`

> It's importat that the image profile exist on `img` folder with the correct
> name for the server up correctly
