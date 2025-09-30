# Bash Notes
From the book: "The Ultimate Linux Shell Scripting Guide" by Donald A. Tevault

## Chapter 1
-- Note to self: come back later and add in my notes from chapter one after I sync them
from my other computer.

## Chapter 2
A find command that finds all .png files in the /home directory and its subdirectories
`sudo find /home -name "*.png" -exec cp {} /backup/ \;`

Important to remember that the ; at the end of the command is needed to terminate the `-exec` option.
Also, the ; must be escaped with a backslash (\) to prevent the shell from interpreting it as a command separator.

Another note to remember is that the basic structure for running commands or scripts in the shell is:
command [options] [arguments]

The options are often preceded by a hyphen (-) or double hyphen (--), and they modify the behavior of the command.
Sometimes these are called flags or switches.

### History is a powerful tool
You can use the `history` command to see a list of previously executed commands.
The ! character can be used to pull commands from history.
Double exclamation marks (!!) will repeat the last command.

`!?` will be used to search for a command in history.
`!n` will repeat the nth command in history.

To see what number a command in history is, you can use the `history` command.

### Answers to Chapter 2 Review Questions
1. If I use the && command, the second command will only run if the first command was successful.

2. If I want to run a command with the $ metacharacter I can either surround the command with single quotes,
or I can escape the character with a \ like so: `\$`.

3. If I am using the find command to search the current working directory on FreeBSD,
I must use the `.` character to indicate the directory.
On Linux it is not necessary to use the `.` character, but it is a good practice to do so.

4. If I want to use the `mkdir` command and create a set of nested directories
I need to use the `-p` option to create any sub directories that do not already exist.

5. If I want to perform a command on each file that is found by the `find` command without being prompted
I can use the `-exec` command. Alternatively, if I do want to be prompted I cashould use the `-ok` command instead.


## Chapter 3
This is a short chapter but I was able to open it and read it the day after I finished chapter 2.
Small progress, but still progress nontheless.

### Answers to Chapter 3 Review Questions
1. The metacharacter that is used to help view variables is the `$` character.

2. Because environment variables are always in full caps, any programming variables that are
created shoul be in lower case to avoid confusion.

3. If I am in a shell session and I set a variable and I want to to be available in other shell sessions,
I will need to use the `export` command to add it to the environment.

4. The `|` metacharacter is used to pip the output of one command and then use it as the input for another command.

## Chapter 4

### Answers to Chapter 4 Review Questions
1. The file descritor number for stdin is 0.
stdout has the file descriptor number 1.
stderr has the file descriptor nubmer 2.

2. The following operator is for stdin: <

3. Here is a command: `tr [:lower:] [:upper:] < filelist.txt > filelist.txt`
The contents of the filelist.txt file will be wiped out, and you'll be left with just an empty file.
When using `tr`, the output should not be redirected to the same file as the input.

4. The default stdin device is the keyboard.

5. To send stderr and stdout to the same place you can use the following operators:
2>&1

## Chapter 5

### Answers to Chapter 5 Review Questions
1. To set the noclobber option, you can use either of these two commands:
`set -o noclobber` or `set-C`  . The noclobber option prevents the shell from overwriting existing files when redirecting output.

2. On a Fedora machine, this user-level configuration file will also affect login shell sessions:
`.bash_profile`

3. If a user opens a terminal emulator on their desktop Linux machine, the type of shell session that
is being used is a non-login shell session. This session is also an interactive shell session.

## Chapter 6

### Answers to Chapter 6 Review Questions
1. It is possible to use the `paste` utility to join two or more files together side-by-side.

2. It is also possible to create simple databases if one uses the `sort` and `join` utilities together.

3. The command `cat file1.txt file2.txt > file3.txt` is the correct way to save the output of the cat operation.
If a third new file is not used then some of the data from the other files would be lost.

4. The `sort` command is helpful as well. One example command that allows for a sort to happen on Field 1, and only Field 1 of a file is:
`sort -k1,1 myfile.txt`

5. For the `cat` utility, to eliminate duplicate blank lines the option switch `-s` should be used.

## Update needed...
Chapter 7 coming up soon...

