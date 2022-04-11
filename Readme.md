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

# Shell expansions [more about shell expansions](https://www.gnu.org/software/bash/manual/bash.html#Shell-Expan)

> Brace expansion

```bash

echo beg{i, a, u}n # begin began begun
echo {0..5} # 0 1 2 3 4 5
```

> Command substitution

[Some details](https://unix.stackexchange.com/a/440123)

```bash
s=123
echo "hello $(s=world; echo "$s")"

#output: hello world

echo "$s"

#output: 123
```

> Arithmetic expansion

```bash
result=((((10+5*3) - 7) / 2))
echo $result #9
```

# Stream, pipes and lists

> Streams

There are three descriptors

|Code|Descriptor|Description
|---|---|---|
|0|stdin|The standard input.
|1|stdout|The standard output.
|2|stderr|The errors output.

Operators, used for streams

|Operator|Description
|---|---
|>|Redirecting output
|&>|Redirecting output and error output
|&>>|Appending redirected output and error output
|<|Redirecting input
|<<|[Here documents](http://tldp.org/LDP/abs/html/here-docs.html) syntax
|<<<|[Here strings](http://www.tldp.org/LDP/abs/html/x17837.html)

> [Redirection](https://stackoverflow.com/a/818284) 

`>` - means send to as a whole completed file, overwriting target if exist

`>>` - means send in addiction 

> Pipes

By using pipes we can send output of one program to input of another

```bash
ls -l | grep .md$ | less
```

> List of commands 

**A list of commands is a sequence of one or more pipelines separated by ;,&, && or || operator.**

     # command2 will be executed if, and only if, command1 finishes successfully (returns 0 exit status)  
     command1 && command2  
   
  The OR-list has the form:  
   
    # command2 will be executed if, and only if, command finishes unsuccessfully (returns code of error)  
    command1 || command2  

# If statement

```bash
# Single-line

if [[ 1 -eq 1 ]]; then echo "true"; fi

# Multi-line

if [[ 1 -eq 1 ]]; then
  echo "true"
fi
```

# Switch case statement

```bash
case "$extension" in
  "jpg"|"jpeg")
    echo "It's image with jpeg extension."
  ;;
  "png")
    echo "It's image with png extension."
  ;;
  "gif")
    echo "Oh, it's a giphy!"
  ;;
  *)
    echo "Woops! It's not image!"
  ;;
esac

```
