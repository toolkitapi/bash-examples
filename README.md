# ToolkitAPI — bash Examples

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

Runnable `curl`-based bash examples for every [ToolkitAPI.io](https://toolkitapi.io) endpoint, organized by toolkit.

## Prerequisites

- `bash` 4+
- `curl`
- [`jq`](https://jqlang.github.io/jq/) (optional — used for pretty-printing JSON responses)

## Setup

```bash
export TOOLKITAPI_KEY=tk_live_...
```

## Running an example

Each file is a self-contained script. Run any one directly:

```bash
bash dns/lookup.sh
bash email/validate_email.sh
bash auth/jwt_generate.sh
```

## Toolkits

| Toolkit | Folder |
|---------|--------|
| Authentication & security | [`auth/`](auth/) |
| Barcode & QR codes | [`barcode/`](barcode/) |
| File & data conversion | [`convert/`](convert/) |
| Developer utilities | [`devtools/`](devtools/) |
| DNS & domain tools | [`dns/`](dns/) |
| Email validation | [`email/`](email/) |
| Geo & IP | [`geo/`](geo/) |
| Image processing | [`image/`](image/) |
| Media extraction | [`media/`](media/) |
| PDF tools | [`pdf/`](pdf/) |
| Web scraping | [`scrape/`](scrape/) |
| Text analysis (AI) | [`textanalysis/`](textanalysis/) |
| Webhooks | [`webhook/`](webhook/) |

## Links

- [ToolkitAPI docs](https://toolkitapi.io/docs)
- [Node.js examples](https://github.com/toolkitapi/node-examples)
- [Python examples](https://github.com/toolkitapi/python-examples)
- [Go examples](https://github.com/toolkitapi/go-examples)
