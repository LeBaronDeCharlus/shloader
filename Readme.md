[![Maintainer](https://img.shields.io/badge/maintainer-corentinderet-blue)](https://github.com/Kaderovski)
[![MIT License](https://img.shields.io/badge/license-MIT-green)](https://choosealicense.com/licenses/mit/)
<p align="center">
    <img src="./statics/shloader.png" width="50%">
</p>
<h1 align="center">Shloader</h1>
<p align="center"><i>Shloader is a 100% shell library to display modern loader.</i></p>

## Table of contents

- [Preview](#preview)
- [Installation](#installation)
- [Usage](#usage)
- [License](#license)

# Preview

## Preview
<p align="center">
    <img src="./statics/shloader.gif">
</p>

# Features
`shloader` has nice features such as :

- emoji support
- emoji loader support
- dynamic message on load step
- message on step ending
- multiple loading templates
- light and easy to use on existing scripts  

# Installation

Nothing to do except copy `./lib/shloader.sh` in your current working directory and source it.

# Usage 

Here is an example you can use on your own :
```shell
source ./lib/shloader.sh

shloader -l dots8 -m "Testing" -e "✨ finishing !" 

  sleep 2   # remove it in your code
  # … your logic goes here

end_shloader

```

## Options

#### Display help

```shell
# e.g
shloader -h
```

| Parameter | Type     | Description                |
| :-------- | :------- | :------------------------- |
| `-h --help` | `none` | Optional. Show help usage |

#### Chose loader

```shell
# e.g
shloader -l arrow
```

| Parameter | Type     | Description                |
| :-------- | :------- | :------------------------- |
| `-l --loader` | `string` | Optional. Chose loader template|

#### Display info on loading

```shell
# e.g
shloader -m "my loading message" 
```

| Parameter | Type     | Description                |
| :-------- | :------- | :------------------------- |
| `-m --message` | `string` | Optional. Show a text message while displaying loader|

#### Display info on ending

```shell
# e.g
shloader -e "\u2728 all done"
```

| Parameter | Type     | Description                |
| :-------- | :------- | :------------------------- |
| `-e --end` | `string` | Optional. Show an end text message when loader ends|


# License

[MIT](https://choosealicense.com/licenses/mit/)

