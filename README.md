# PTK Brooms — Portfolio Website

This is a static portfolio website for PTK Brooms built with HTML, CSS and vanilla JavaScript.

## Local preview
Serve the folder locally to test before deploying:

```bash
# Python (simple static server)
python -m http.server 8000
# open http://localhost:8000

# or using Node.js
npx serve .
```

## Git (prepare repository)

git init
git add .
git commit -m "Initial site files"
# Create a GitHub repo and add remote
git remote add origin https://github.com/<your-username>/<repo-name>.git
git branch -M main
git push -u origin main
```

## GitHub Pages (recommended for simple static sites)
1. Push the repo to GitHub.
2. Go to **Settings → Pages** in your repository.
3. Choose the `main` branch and set folder as `/ (root)`.
4. Save — the site will be published at `https://<your-username>.github.io/<repo-name>/`.

A GitHub Actions workflow (`.github/workflows/pages.yml`) is included to assist deployment on push to `main`.

## Netlify
- Connect your GitHub repository to Netlify and set the publish directory to `/` (root).
- Or drag-and-drop the project folder into Netlify.
- `netlify.toml` is included for configuration.

## Vercel
- Connect your GitHub repository in Vercel (auto-deploy on push), or run the Vercel CLI:

```bash
npm i -g vercel
vercel login
vercel --prod
```

`vercel.json` is included to serve static files.

## Deploy scripts
Two helper scripts are included for convenience:

- `deploy.sh` — Bash script (macOS/Linux)
- `deploy.ps1` — PowerShell script (Windows)

They will commit local changes, push to the configured remote, and attempt to invoke `vercel` or `netlify` CLI if installed.

Example usage:

```bash
# make executable then run
chmod +x deploy.sh
./deploy.sh origin main

# PowerShell
deploy.ps1 -remote origin -branch main
```

## Notes
- Replace placeholder remote URL with your GitHub repo URL.
- If you want me to add a CI/CD step for building (e.g., bundling assets), tell me what build tool you prefer and I will add it.
