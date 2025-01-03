using namespace System.Management.Automation
using namespace System.Management.Automation.Language


# Repo de completions en BASH -> https://github.com/gryf/vboxmanage-bash-completion
Register-ArgumentCompleter -Native -CommandName 'vboxmanage' -ScriptBlock {
  param($wordToComplete, $commandAst, $cursorPosition)

  $commandElements = $commandAst.CommandElements
  # 'Command Elements:'
  # $commandElements # nombre-comando arg1 arg2
  # $commandElements.Count # 3 
  # # el tipo es System.Collections.ObjectModel.ReadOnlyCollection[System.Management.Automation.Laguage.CommandElementAst]
  # $commandElements.GetType()
  
  # "ACA"
  # $commandElements[1]

  $command = @(
    'vboxmanage'
    for ($i = 1; $i -lt $commandElements.Count; $i++) {
      $element = $commandElements[$i]
      if ($element -isnot [StringConstantExpressionAst] -or
      $element.StringConstantType -ne [StringConstantType]::BareWord -or
      $element.Value.StartsWith('-') -or
      $element.Value -eq $wordToComplete) {
        break
      }
      $element.Value
    }) -join ';'

     # "hola" + $command

  $completions = @(switch ($command) {
    'vboxmanage' {
      [CompletionResult]::new('list', 'list', [CompletionResultType]::ParameterValue, "Print version")
      [CompletionResult]::new('showvminfo', 'showvminfo', [CompletionResultType]::ParameterValue, "Show vm info")
      break
    }
    'vboxmanage;list' {
      [CompletionResult]::new('vms', 'vms', [CompletionResultType]::ParameterName, "Lista Maquina virtual")
      [CompletionResult]::new('cpu-profiles', 'cpu-profiles', [CompletionResultType]::ParameterName, "List cpu-profiles")
      [CompletionResult]::new('dhcpservers', 'dvds', [CompletionResultType]::ParameterName, "List dhacpservers")
      [CompletionResult]::new('groups', 'groups', [CompletionResultType]::ParameterName, "List groups")
      [CompletionResult]::new('hostinfo', 'hostinfo', [CompletionResultType]::ParameterName, "List hostinfo")
      [CompletionResult]::new('inets', 'inets', [CompletionResultType]::ParameterName, "List inets")
      [CompletionResult]::new('natnets', 'natnets', [CompletionResultType]::ParameterName, "List natnets")
      [CompletionResult]::new('ostypes', 'ostypes', [CompletionResultType]::ParameterName, "List ostypes")
      [CompletionResult]::new('runnigvms', 'runnigvms', [CompletionResultType]::ParameterName, "List runnigvms")
      break
    }
    'vboxmanage;showvminfo' {
      [CompletionResult]::new('<uuid | vmname>', '<uuid | vmname>', [CompletionResultType]::ParameterValue, "List runnigvms")
      [CompletionResult]::new('--details', 'details', [CompletionResultType]::ParameterName, ":)")
      [CompletionResult]::new('--machinereadable', 'machinereadable', [CompletionResultType]::ParameterName, ":)")
      [CompletionResult]::new('--password-id', 'password-id', [CompletionResultType]::ParameterName, ":)")
      [CompletionResult]::new('--password', 'password', [CompletionResultType]::ParameterName, ":)")

    }
    })

  $completions.Where{ $_.CompletionText } | 
    Sort-Object -Property ListItemText
}
