## Cheat sheet 🗒️

# Creating file

> Creating a bash script file

`touch example.bash`

> Making bash file executable

[Shebang](https://en.wikipedia.org/wiki/Shebang_%28Unix%29) - article on wiki

```bash
chmod +x example.bash

#example.bash

#!/usr/bin/env bash
```

# Variables (Global, positional variables)

> Global variables example

[List](https://tldp.org/LDP/Bash-Beginners-Guide/html/sect_03_02.html#sect_03_02_) of global variables

```bash
echo "Hello, $(whoami), directory: $PWD"
```

> Positional variables

- $0 - script’s name
- $1 .. $9 -  The parametrs list elements from 1 to 9
- ${10} .. ${N} The parametrs list elements from 10 to N
- $* .. $@ All positional parameters except $0
- $# The number of parameters, not counting $0
- $FUNCNAME - Function name

```bash
./example.bash first second

#example.bash
#!usr/bin/env bash

echo "Filename: $0, first arg: $1, second arg: $2"
```


# Arrays

**IFS (Input Field Separator)** - character that separates elements in array (default is empty state)


> Creating array

```bash

fruits[0]=Apple
fruits[1]=Pear

# to log all values

echo ${fruits[*]} 
echo ${fruits[@]}

#or

vegetables=(Carrot Cucumber)


```


> Slicing arrays

```bash
echo ${fruits[*]:0:1} # Apple
echo ${@:1:2} # slice of positional parameters
```

> Adding elements into an array

```bash
fruits=(Banana ${fruits[*]}  Mango)
```

> Deleting elements

```bash
unset fruits[0]
```



