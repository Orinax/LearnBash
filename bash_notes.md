# A find command that finds all .png files in the /home directory and its subdirectories
`sudo find /home -name "*.png" -exec cp {} /backup/ \;`

Important to remember that the ; at the end of the command is needed to terminate the `-exec` option.
Also, the ; must be escaped with a backslash (\) to prevent the shell from interpreting it as a command separator.


