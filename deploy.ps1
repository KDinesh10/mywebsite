param(
  [string]$remote = "origin",
  [string]$branch = "main"
)

# Commit and push changes
if (-not (Test-Path .git)) {
  Write-Host "Initializing git repository..."
  git init
  git add .
  git commit -m "Initial commit"
  Write-Host "Repository initialized. Please add a remote and run this script again."
  exit 0
}

git add -A
try {
  git commit -m "Site update $(Get-Date -Format o)" -ErrorAction Stop
} catch {
  Write-Host "No changes to commit or commit failed: $_"
}

git push $remote $branch

# Optional: Trigger Vercel or Netlify deploy if CLI is installed
if (Get-Command vercel -ErrorAction SilentlyContinue) {
  Write-Host "Detected Vercel CLI. Running 'vercel --prod'..."
  vercel --prod
} elseif (Get-Command netlify -ErrorAction SilentlyContinue) {
  Write-Host "Detected Netlify CLI. Running 'netlify deploy --prod --dir=.'..."
  netlify deploy --prod --dir=.
} else {
  Write-Host "No Vercel/Netlify CLI found; push completed. Install 'vercel' or 'netlify' CLI to auto-deploy from this script."
}
