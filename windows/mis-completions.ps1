using namespace System.Management.Automation
using namespace System.Management.Automation.Language

Register-ArgumentCompleter -Native -CommandName 'vboxmanage' -ScriptBlock {
  param($wordToComplete, $commandAst, $cursorPosition)

  $commandElements = $commandAst.CommandElements
  # 'Command Elements:'
  # $commandElements # nombre-comando arg1 arg2
  # $commandElements.Count # 3 
  # # el tipo es System.Collections.ObjectModel.ReadOnlyCollection[System.Management.Automation.Laguage.CommandElementAst]
  # $commandElements.GetType()
  
  "ACA"
  $commandElements[0]

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

    $command

  $completions = @(switch ($command) {
    'vboxmanage' {
      [CompletionResult]::new('list', 'list', [CompletionResultType]::ParameterName, "Print version")
      # [CompletionResult]::new('prueba', 'prueba', [CompletionResultType]::ParameterValue, "texto prueba")
      break
    }
    'vboxmanage;list' {

      [CompletionResult]::new('vms', 'vms', [CompletionResultType]::ParameterName, "Crear Maquina virtual")
      break
    }
    })

  $completions.Where{ $_.CompletionText } | 
    Sort-Object -Property ListItemText
}
