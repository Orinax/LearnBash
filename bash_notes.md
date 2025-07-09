# Bash Notes
From the book: "The Ultimate Linux Shell Scripting Guide" by Donald A. Tevault

## From chapters 1-2
# A find command that finds all .png files in the /home directory and its subdirectories
`sudo find /home -name "*.png" -exec cp {} /backup/ \;`

Important to remember that the ; at the end of the command is needed to terminate the `-exec` option.
Also, the ; must be escaped with a backslash (\) to prevent the shell from interpreting it as a command separator.

Another note to remember is that the basic structure for running commands or scripts in the shell is:
command [options] [arguments]

The options are often preceded by a hyphen (-) or double hyphen (--), and they modify the behavior of the command.
Sometimes these are called flags or switches.


