# homebrew-tap

A single Homebrew tap for [rayvn](https://github.com/phoggy/rayvn) projects and the tools they depend on.

## Usage

```bash
brew tap rayvn-central/tap
brew trust --tap rayvn-central/tap
brew install wardn   # or valt, or rayvn
```

Homebrew 7 asks before using formulas from a tap you haven't trusted; `brew trust` trusts all formulas in this tap.

## Formulas

| Formula | Updated by |
|---|---|
| `rayvn`, `valt`, `wardn` | `rayvn release PROJECT` |
| `mrld` | [mrld](https://github.com/phoggy/mrld)'s release workflow (cargo-dist) |
| `phraze` | `.github/workflows/update-phraze.yml`, weekly, from [sts10/phraze](https://github.com/sts10/phraze)'s releases |

The `phraze` formula installs the prebuilt binaries from Sam Schlinkert's phraze releases; it's here so that valt's
dependencies all come from one tap.
