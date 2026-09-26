# Dev Data Tools

A privacy-first suite of small browser-based tools for developers, analysts and data engineers.

## Tools

- Schema Detective
- Data Diff Explorer
- CSV Relationship Finder
- Data Quality Playground
- Log Pattern Analyzer
- Dependency Impact Explorer
- Regex Data Lab

## Design principles

- Browser-first: no backend is required.
- Privacy-first: input files stay in the browser.
- Standalone: every tool has its own repository and GitHub Pages site.
- Suite mode: all tools are accessible from the Dev Data Tools portal.
- Local mode: clone all repositories next to each other and serve the parent directory with a local static web server.

## Online

Portal: https://raoulmunet.github.io/dev-data-tools/

For brand-new repositories, enable GitHub Pages once for the entire suite:

```bash
chmod +x enable-pages.sh
./enable-pages.sh
```

The helper uses GitHub CLI (`gh`) and configures Pages to deploy with the included GitHub Actions workflow.

## Local installation

The portal includes an `install-suite.sh` helper. It clones every tool and can launch a local HTTP server.

## License

MIT
