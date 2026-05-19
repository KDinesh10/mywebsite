#!/usr/bin/env bash
set -e
REMOTE=${1:-origin}
BRANCH=${2:-main}

if [ ! -d .git ]; then
  echo "Initializing git repository..."
  git init
  git add .
  git commit -m "Initial commit"
  echo "Repository initialized. Please add a remote and run this script again."
  exit 0
fi

git add -A
if git commit -m "Site update $(date -u +"%Y-%m-%dT%H:%M:%SZ")"; then
  echo "Committed changes"
else
  echo "No changes to commit"
fi

git push "$REMOTE" "$BRANCH"

if command -v vercel >/dev/null 2>&1; then
  echo "Deploying with Vercel..."
  vercel --prod
elif command -v netlify >/dev/null 2>&1; then
  echo "Deploying with Netlify..."
  netlify deploy --prod --dir=.
else
  echo "No vercel/netlify CLI found. Push completed."
fi
