# Armenian Composer Heritage Website

This folder contains a website version of the legacy CD-ROM projects for Aram Khachaturian and Komitas.

## Files
- index.html — home page
- aram.html — Aram Khachaturian profile
- komitas.html — Komitas profile
- gallery.html — image gallery
- media.html — audio and media section
- archive.html — archive overview and migration plan
- styles.css — styling
- deploy.sh — packages the site into a deploy folder for simple hosting

## Preview locally
Run a local server from this folder, for example:

```bash
python -m http.server 8000
```

Then open http://127.0.0.1:8000/index.html

## Publish online
You can publish the contents of the project folder to GitHub Pages, Netlify, or any static host.
For a simple bundle, run:

```bash
bash deploy.sh
```

The deploy folder will contain the files ready to upload.
