Set-PSReadLineOption -Colors @{
    "Command"            = [ConsoleColor]::White
    "Member"             = [ConsoleColor]::White
    "Comment"            = [ConsoleColor]::DarkGray
    "Error"              = [ConsoleColor]::DarkRed
    "Keyword"            = [ConsoleColor]::DarkGreen
    "Emphasis"           = [ConsoleColor]::DarkCyan
    "Variable"           = [ConsoleColor]::DarkCyan
    "Number"             = [ConsoleColor]::DarkMagenta
    "Operator"           = [ConsoleColor]::DarkBlue
    "Parameter"          = [ConsoleColor]::DarkCyan
    "Type"               = [ConsoleColor]::DarkBlue
    "InlinePrediction"   = [ConsoleColor]::DarkGray
}

function Get-PromptString {
    $lastStatus = $?
    $shortPWD = (Get-Location) -replace $HOME, "~"

    if ($lastStatus)
    {
        Write-Host "$shortPWD o" -NoNewline -ForegroundColor:DarkGreen
    }
    else {
        Write-Host "$shortPWD x" -NoNewline -ForegroundColor:DarkRed
    }

    return " "
}

Set-Alias -Name:"prompt" -Value:"Get-PromptString" -Description:"" -Option:None
