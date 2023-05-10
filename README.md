# floppy

[![Main](https://github.com/roalcantara/floppy/actions/workflows/main.yml/badge.svg)](https://github.com/roalcantara/floppy/actions/workflows/main.yml)
[![Release](https://github.com/roalcantara/floppy/actions/workflows/release.yml/badge.svg)](https://github.com/roalcantara/floppy/actions/workflows/release.yml)
[![Publish](https://github.com/roalcantara/floppy/actions/workflows/publish.yml/badge.svg)](https://github.com/roalcantara/floppy/actions/workflows/publish.yml)

A simple [unity][9] app

[![MIT license](https://img.shields.io/badge/License-MIT-brightgreen.svg)](LICENSE) [![Contributor Covenant](https://img.shields.io/badge/Contributor%20Covenant-2.0-4baaaa.svg)][2] [![standard-readme compliant](https://img.shields.io/badge/readme%20style-standard-brightgreen.svg)][5] [![Editor Config](https://img.shields.io/badge/Editor%20Config-1.0.1-crimson.svg)][4] [![Conventional Commits](https://img.shields.io/badge/Conventional%20Commits-1.0.0-yellow.svg)][3] [![Semantic Release](https://img.shields.io/badge/%20%20%F0%9F%93%A6%F0%9F%9A%80-semantic--release-e10079.svg)][14]

## Install

```sh
git clone https://github.com/roalcantara/floppy.git
```

## Roadmap

- [x] Setup
  - [x] Create Unity Project
  - [x] Add Standard Readme
  - [x] Setup Semantic Commits
  - [x] Setup Pre-Commit Hooks
- [x] Unity Demo App
  - [x] Add Simple Unity Game
  - [x] Add Simple Unity PlayMode Tests
  - [x] Add Simple Unity EditMode Tests
  - [x] Configure WebGL Build
- [x] CI/CD
  - [x] Add main workflow, for each PR
    - [x] Test
    - [x] Build
    - [x] On Success Deploy Preview app
    - [x] Notification
    - [ ] On close Shutdown Preview app
  - [x] Add release workflow
    - [x] On push to main
      - [x] Build the app
      - [x] [Semantic Release][14] the app
        - [x] Create Github Release/Tag
        - [x] Store the build
        - [x] Send Notification
  - [x] Add publish workflow
    - [x] On release created
      - [x] Download release build
      - [x] Publish to [Itch.io][15]
      - [x] Send Notification

## Dependencies

- [git][6]
- [gitint][7]
- [pre-commit][8]

## Acknowledgments

- [Standard Readme][5]
- [Conventional Commits][7]
- [Unity Learn][10]
- [The Unity Tutorial For Complete Beginners][11]
- [Game-CI][12]
- [Vercel: Preview Deployments Overview][13]
- [Creating pipeline for Unity games using GitHub Actions][15]

## Contributing

- Bug reports and pull requests are welcome on [GitHub][0]
- Do follow [Editor Config][4] rules.
- Do follow [Git lint][7] rules.
- Do follow the [Contributor Covenant][2] code of conduct.

## License

The project is available as open source under the terms of the [MIT][1] [License](LICENSE)

[0]: https://github.com/roalcantara/Dockers
[1]: https://opensource.org/licenses/MIT 'Open Source Initiative'
[2]: https://contributor-covenant.org 'A Code of Conduct for Open Source Communities'
[3]: https://conventionalcommits.org 'Conventional Commits'
[4]: https://editorconfig.org 'EditorConfig'
[5]: https://github.com/RichardLitt/standard-readme 'Standard Readme'
[6]: https://git-scm.com 'Git'
[7]: https://jorisroovers.com/gitlint 'git commit message linter'
[8]: https://pre-commit.com 'A framework for managing and maintaining multi-language pre-commit hooks'
[9]: https://unity.com 'Unity is a cross-platform game engine developed by Unity Technologie'
[10]: https://learn.unity.com 'Unity Learn: Online learning platform that offers courses to help anyone learn to code'
[11]: https://youtu.be/XtQMytORBmM 'The Unity Tutorial For Complete Beginners'
[12]: https://game.ci 'Game-CI: the fastest and easiest way to automatically test and build games'
[13]: https://vercel.com/docs/concepts/deployments/preview-deployments 'Vercel: Preview Deployments Overview'
[14]: https://semantic-release.gitbook.io/semantic-release 'Semantic Release'
[15]: https://jaidengerig.medium.com/create-a-cd-pipeline-to-auto-publish-unity-games-from-github-to-itch-io-in-30-minutes-for-free-bae3b254283c 'Creating pipeline for Unity games using GitHub Actions'
