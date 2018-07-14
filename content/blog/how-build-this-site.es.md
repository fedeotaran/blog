---
title: "¿Cómo construir este sitio?"
date: 2018-02-17T21:09:19Z
draft: false
---

Creo que es una buena idea para el primer post explicar como construí éste sitio. Fué contruido utilizando [Hugo](https://gohugo.io/). Hugo es un herramienta muy popular y open-soruce, para genrar sitios estáticos.

Instalación y cómo comenzar con Hugo
------------------------------------

Primero que nada tienes que instalar Hugo en tu sistema. Para esto sigue las
siguiente instrucciones en [documentación oficial de Hugo](https://gohugo.io/documentation/)

En mi caso, yo no quería instalarlo directamente en mi sistema asi que utilicé 
[Docker](https://www.docker.com/what-docker).
[Ésta imagen](https://hub.docker.com/r/jguyomard/hugo-builder/) Tiene todo lo que necesitas
para correr `hugo`.

### Crea un sitio estático

```bash
  docker run --rm -it -v $PWD:/src -u hugo \
    jguyomard/hugo-builder hugo new site new_site
```

### Crea un repositorio con los archivos iniciales

Crea un repositorio en Github para el código fuente de tu sitio web [así](https://github.com/new).

Luego crea tu repositorio local y agrega el remoto:

```bash
  cd new_site
  git init
  git add .
  git commit -m "first commit"
  git remote add origin git@github.com:<github_user>/<repo_name>.git
  git push -u origin master
```

### descarga e instala un theme para Hugo

La forma más simple para empezar a usar Hugo es usar unos de los themes que se
encuentra publicados. Mira todos los temas disponibles [aquí](https://themes.gohugo.io/).

Luego clona el repositorio dentro de la carpeta `themes`:

```bash
  git clone https://github.com/nishanths/cocoa-hugo-theme.git themes/cocoa
```

Si to quieres personalizar algú tema has un fork del repositorio y agregalo
como submódulo de tu proyecto:

```bash
  git submodule add https://github.com/<github_user>/cocoa-hugo-theme.git \
    themes/cocoa
```

Ahora configura tu theme en el archivo de configuración:

```bash
  echo 'theme = "cocoa"' >> config.toml
```

Para un ejemplo de configuracion completo puede ver el archivo dento de la carpeta `exampleSite`:

```bash
  cp exampleSite/* .
```
### Levanta un servidor local de tu sitio

```bash
  docker run --rm -it -v $PWD:/src -p 1313:1313 -u hugo \
    jguyomard/hugo-builder hugo server -w -t cocoa \
    --bind=0.0.0.0 --verbose --baseUrl=http://<your_id_address>
```

> Es muy importante completar el flag `--baseUrl=` con la ip correcta del
> servidor

Ahora visita `http://<your_ip_address>:1313/`
> Es importante que la imagen de perfil (avatar) exista en la carpeta `img`
> con el nombre correcto para que el server levante sin errores

Finalmente, si quieres deployar tus sitio estático en Github Pages lee
[éste artículo](https://gohugo.io/hosting-and-deployment/hosting-on-github/).
