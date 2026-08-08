param(
  [string]$RepoName = "x-feed-control"
)

$ErrorActionPreference = "Stop"

gh auth status | Out-Host
if ($LASTEXITCODE -ne 0) {
  throw "GitHub CLI is not authenticated. Run: gh auth login"
}

git status --short
if ($LASTEXITCODE -ne 0) {
  throw "Not a git repository"
}

$remote = git remote get-url origin 2>$null
if ($LASTEXITCODE -eq 0 -and $remote) {
  throw "origin already exists: $remote"
}

gh repo create $RepoName --public --source . --remote origin --push --description "Research-backed, browser-controlled X feed diversity settings for Codex"
if ($LASTEXITCODE -ne 0) {
  throw "GitHub repository creation or push failed"
}

gh repo view $RepoName --json url --jq .url
