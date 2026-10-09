# Armenian Composer Heritage — portal

**Public URL:** <https://gareginchu.github.io/armenian-composer-heritage/>
**Role:** small landing portal that sends visitors to two separate archives, one per composer. This site holds no biographical content of its own beyond a short frame.
**Status:** §6 Phase 1 begun — old multi-page site replaced by the two-tile portal (`index.html` + `styles.css`); the old `aram.html`, `komitas.html`, `gallery.html`, `media.html`, `archive.html` have been removed. `assets/` and `media/` retained for one release cycle per §6.

The joint "Voice & Hand" thesis from the earlier iteration of this file is superseded. The two composers now get their own sites, with their own design languages, hosted in their own repositories.

---

## 1. The two archives

| Archive | Repo | URL (once deployed) | Design direction | Local folder |
|---|---|---|---|---|
| Komitas | `gareginchu/komitas-archive` | `https://gareginchu.github.io/komitas-archive/` | **The Reading Room** — bone paper, ink, candle-gold. Classical serif + Armenian display. Sheet music as centerpiece. | `C:\Users\gareg\OneDrive\Desktop\komitas-archive` |
| Aram Khachaturian | `gareginchu/khachaturian-archive` | `https://gareginchu.github.io/khachaturian-archive/` | **Modernist Poster** — cool white, deep charcoal, chalk-orange. Neue Haas Grotesk Display + working serif. Photo-essay pacing. | `C:\Users\gareg\OneDrive\Desktop\khachaturian-archive` |

Each archive has its own `CLAUDE.md` at its repo root. Read it before working there.

---

## 2. Source material

The archives are seeded from two CD-ROMs on disk:

- **Komitas CD** — `C:\Users\gareg\OneDrive\Desktop\komitas`
  - `data/pdf/` — 34 sheet-music PDFs (Antuni, Krunk, Garun a, Hov areq, Divine Liturgy, biographies of his circle)
  - `data/sound/music/` — 574 audio files
  - `data/video/clips/` — 102 video clips
  - `data/images/bigs/gallery/` — 464 gallery photographs
  - `data/images/bigs/timeline/` — 137 timeline images
  - `data/images/bigs/text/` — 43 text images
  - `data/text/{am,en,ru}/*.xml` — trilingual metadata (menu, timeline, photo, sound, video, text)

- **Aram Khachaturian CD** — `C:\Users\gareg\OneDrive\Desktop\Aram Khachatrian`
  - `audio/` — 47 audio (including Khachaturian's own recorded speeches, Sabre Dance recordings, symphonies, concertos)
  - `video/` — 14 FLV videos (Adagio, Lezginka, Masquerade, Spartacus, trilingual documentaries)
  - `images/photobook/medium/` — 495 photobook images
  - `images/life/` — 62 life images
  - `images/timeline/` — 31 timeline images
  - `xml/life/bio_{arm,eng,rus}.xml` — full trilingual biography
  - `xml/life/brief_{arm,eng,rus}.xml` — trilingual short biography
  - `xml/life/full_bio_{arm,eng,rus}.xml` — extended biography
  - `xml/{catalogue,media,photobook,principle,timeline}/*.xml` — structured data
  - **Note.** XML text nodes are encoded Windows-1251 (Cyrillic for Russian) — normalise to UTF-8 on ingest.

Treat these CDs as **read-only source material**. Never modify the CD folders. The archives ingest, transform, and re-publish, and always log provenance.

---

## 3. Portal contents

This site is deliberately small.

- Home page — one sentence framing the two archives, two large tiles linking out, a footer.
- No search, no shared navigation, no cross-archive taxonomy.
- No AI features on the portal itself.

Existing pages (`aram.html`, `komitas.html`, `gallery.html`, `media.html`, `archive.html`, `index.html`, `styles.css`) will be replaced by a single new `index.html` once the two archives are live. Until then, the current site stays as-is so the URL keeps working.

---

## 4. Stack decision (open)

The user has asked for **Fable 5** (F# → JavaScript) as the framework for the two archives.

- .NET SDK is **not installed** on the current machine. Fable is a `dotnet` tool and cannot run without it.
- The user must either install the .NET 8 SDK (or newer), or agree to a fallback stack.
- **Fallback:** Astro (SSG) with hand-written CSS.
- Whichever is chosen applies to *both* archives so the tooling knowledge transfers.
- Both archives' `CLAUDE.md` files carry the same stack section.

---

## 5. Media hosting

Both archives ship with hundreds of MB of audio and video. GitHub Pages is not the right home for that volume.

- **Primary media host:** Cloudflare R2 (S3-compatible, no egress fees, cheap at rest).
- **Fallback:** Backblaze B2.
- **Never on Pages / LFS:** raw audio and video assets. Pages ships HTML, CSS, JS, and thumbnails only.
- Each archive keeps a `content/media-manifest.yml` mapping local CD paths → R2 URLs → licence/rights notes.
- On-page players stream via signed R2 URLs; captions and transcripts live in the repo.

R2 credentials belong in the user's secrets store, not the repo.

---

## 6. Portal build plan

1. **Phase 0 (current).** Keep the existing site untouched at the current URL while the two archives are being built.
2. **Phase 1.** Once both archives are live and stable, replace this repo's home page with a two-tile portal that links out. Remove `aram.html`, `komitas.html`, `gallery.html`, `media.html`, `archive.html`. Keep the assets and audio folders as archived downloads for one release cycle, then delete.
3. **Phase 2.** Add a small "About the project" page (Maggie's role, editorial policy, contact). No content ingestion here.

---

## 7. Rules for Claude working in this folder

- Do not add features not in §3.
- Do not import content, imagery, or biography from the two composer archives into this portal.
- Do not touch the two CD folders (read-only source).
- The portal does not get its own design system — it is a plain, hand-written two-tile page.
- The Komitas archive and the Khachaturian archive have their own design languages; those live in their own repos, not here.
