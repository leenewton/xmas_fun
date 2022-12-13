function Get-Song() {
  Write-Output " "
  [String]$song = Read-Host "Name the song you want to play"
  if (!($song)) {
    [String]$song = "Never gonna to give you up"
  }
  Write-Output " "
  Write-Output "------------------"
  Write-Output " "
  $song -eq "Never gonna to give you up" ? ([String]$artist = "rick astley") : ([String]$artist = Read-Host "Name the artist who sang it (can leave it blank but results may vary!)")

  $youtubeEndpoint = "https://www.googleapis.com/youtube/v3/search?key=AIzaSyAvwLmbgGI7koVibWNtF42DDp9nCxteHgM&q=$($artist)+$($song)&maxResults=1&type=video&part=snippet"
  $video = Invoke-RestMethod -Uri $youtubeEndpoint -Method Get
  $vid = $video.items.id.videoID
  Start-Process -FilePath "C:\Program Files\Google\Chrome\Application\chrome.exe" -ArgumentList "http://www.youtube.com/watch?v=$vid"
}
function Get-Joke() {
  $xmasjokeEndpoint = "https://christmascountdown.live/api/joke"
  $joke = Invoke-RestMethod -Uri $xmasjokeEndpoint -Method Get
  Start-Sleep -Seconds 1
  Write-Output "$($joke.question)"
  Write-Output " "
  Start-Sleep -Seconds 2
  for ($i = 5; $i -ge 0; $i-- ) {
    Write-Output "----- $i -----"
    Start-Sleep -Seconds 1
  }
  Write-Output " "
  Write-Output "$($joke.answer)"
  Write-Output " "
  $userChoice = Read-Host "do you want to hear another joke? (yes / no)"
  Get-Choice($userchoice)
}

function Get-Choice($userChoice) {

  if ($userChoice -eq "yes" -or $userChoice -eq "y") {
    Write-Output " "
    Write-Output "great let me get a good one for you! "
    Write-Output "--------------------------------------"
    Write-Output " "
    Get-Joke

  } elseif ($userChoice -eq "no" -or $userChoice -eq "n") {
    Write-Output " "
    Write-Output "ok no worries lets get you a song to listen to! "
    Get-Song
  } else {
    $userChoice = Read-Host "dont be stupid just put yes or no... if your SUPER lazy you can just put y/n"
    get-Choice($userChoice)
  }
}

$userChoice = Read-Host "do you want to hear a quick joke first? (yes / no)"
& Get-choice($userChoice)
