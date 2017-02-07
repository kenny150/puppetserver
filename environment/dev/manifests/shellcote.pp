$from = "file1"
$to = "file2"
$execut = shellquote("$from","$to")
$com = "/bin/mv ${execut}"
notify { "O resultado é : $com": }
