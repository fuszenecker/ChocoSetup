$current = git branch --show-current

Write-Output "Updating $current from master."

$lines = (git diff | Measure-Object -Line).Lines

if ($lines) {
    Write-Output "Saving changes..."
    git stash
}
else {
    Write-Output "No changes detected."
}

git checkout master
git pull
git checkout $current
git merge master

if ($lines) {
    Write-Output "Restoring changes..."
    git stash pop
} else {
    Write-Output "No changes restored."
}

