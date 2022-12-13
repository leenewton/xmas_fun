function Wrap-Gift([string[]]$presents) {
  $wrappedPresents = [string[]]::new($presents.length)
  for ($i = 0; $i -lt $presents.length; $i++) {
    $wrappedPresents[$i] = ("*" * $($presents[$i].length + 6) + "`n") + ("** $($presents[$i]) ** `n") + ("*" * ($presents[$i].length + 6) + "`n")
  }
  $wrappedPresents
}

$presents = @("car", "ring", "computer", "phone", "watch" , "Holiday")
Wrap-Gift($presents)