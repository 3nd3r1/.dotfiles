---
name: genmedia
description: Generate images, video, audio, speech or 3D assets with fal.ai using the genmedia CLI. Use when asked to generate or edit media with fal, search fal models, inspect schemas or pricing, upload inputs, or fetch async job results.
---

# genmedia

Use the `genmedia` CLI to run fal.ai models.

## Rules

- Pass `--json` whenever reading command output.
- Start with smart routing (`genmedia run "<prompt>" --json`) for default requests. Only pick an explicit endpoint when the user names a model, needs custom parameters, or the default route is wrong.
- Never guess endpoint IDs. Search with `genmedia models "<query>" --json`.
- Check `genmedia schema <endpoint_id> --json` (or `genmedia run <endpoint_id> --help`) before passing custom flags, or requests fail with 422. Check `genmedia pricing <endpoint_id> --json` before expensive video or high-res runs.
- Use `--download` to save outputs instead of curl.
- Use `--async` for slow jobs (video, audio, 3D) and poll with `genmedia status`.

## Commands

Run `genmedia --help --json` for the full command and flag list.

| Command | Purpose |
|---|---|
| `genmedia run "<prompt>" --json` | Smart-routed run (returns `endpoint_id` and `routed`) |
| `genmedia run <endpoint_id> --<param> <val> --json` | Explicit model run |
| `genmedia status <endpoint_id> <request_id> --json` | Poll async job (`--result`, `--logs`, `--cancel`, `--download`) |
| `genmedia models "<query>" --json` | Search catalog (`--category`, `--no-classify`, `--endpoint_id`, `--limit`) |
| `genmedia schema <endpoint_id> --json` | Inspect input and output fields |
| `genmedia pricing <endpoint_id> --json` | Check cost per call |
| `genmedia upload <path-or-url> --json` | Upload local file or URL to fal CDN |
| `genmedia docs "<query>" --json` | Search fal documentation |

`--download [template]` saves every media URL in the result and implies `--result` on `status`. Template placeholders are `{index}`, `{name}`, `{ext}` and `{request_id}`. A trailing `/` saves into that directory with source filenames.

## Examples

Smart route and download:

```bash
genmedia run "a cat on the moon" --download "./out/{request_id}_{index}.{ext}" --json
```

Upload an input and run an explicit model:

```bash
URL=$(genmedia upload ./photo.jpg --json | jq -r '.url')
genmedia run fal-ai/nano-banana-pro/edit \
  --image_urls "$URL" \
  --prompt "make the sky stormy" \
  --download "./out/" \
  --json
```

Async submit and poll:

```bash
SUBMIT=$(genmedia run "a 5-second clip of waves" --async --json)
REQ=$(echo "$SUBMIT" | jq -r '.request_id')
EP=$(echo "$SUBMIT" | jq -r '.endpoint_id')
genmedia status "$EP" "$REQ" --download "./out/" --json
```

## Local setup

`genmedia` is managed by Home Manager in `modules/home-manager/apps/genmedia.nix` with auto-updates disabled. Never run `genmedia update`, `genmedia init`, `genmedia skills` or the curl installer.

On 401 errors, ask the user to run `genmedia setup` once or pass `FAL_KEY` in the environment. Never print or log the key.
