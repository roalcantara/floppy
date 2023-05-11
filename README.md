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

## TODO

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
- [-] [CI/CD][19] & [DevOps][18]
  - [x] Add main workflow, for each PR
    - [x] Test
    - [x] Build
    - [x] On Success Deploy [Preview][17] app
    - [x] Notification
    - [ ] On close Shutdown [Preview][17] app
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
- [-] Dev Environment
  - [x] [Makefile][20]
  - [x] Handle Secrets
    - [x] [Gopass][25]
  - [x] [Local][22] (MacOS)
    - [x] Generate Manual Activation File
    - [x] Build WebGL
    - [x] Run WebGL from dist folder
    - [x] Run Tests
      - [x] All
      - [x] EditMode
      - [x] PlayMode
  - [ ] Linter checks
  - [ ] Unity [Accelerator][21]
- [ ] QA
  - [ ] Configure Gkerking/Cucumber
  - [ ] Add Relevant Unity Tests Scenarios
  - [ ] Add Test Coverage
  - [ ] Link Unity Tests to CI/CD
  - [ ] Link Issues to CI/CD

## Dependencies

- [git][6]
- [gitint][7]
- [pre-commit][8]
- [GNU Make][20]

## USAGE

### [Manual license activation][23]

#### Running Locally

1. Run `make activation_file` to generate the activation file $(PWD)/scripts/support/Unity_v2021.1.7f1.local.alf
2. Upload the activation file to [https://license.unity3d.com/manual](https://license.unity3d.com/manual)
3. Download and save the license file at $(PWD)/scripts/support/Unity_v2021.1.7f1.local.ulf

#### Running on CI/CD ([Activation][24])

1. Execute the Job [Activation](https://github.com/roalcantara/floppy/actions/workflows/activation.yml)
2. Download the Manual Activation File
3. Upload the activation file to [https://license.unity3d.com/manual](https://license.unity3d.com/manual)
4. Download the license file
5. Run `cat Unity_v20XX.x.ulf | pbcopy` to copy the file content
6. Add a secret named `UNITY_LICENSE` with the content of the license file

### Local commands (MacOS)

> It requires $(PWD)/scripts/support/Unity_v2021.x.local.ulf
> See [Manual license activation][23]

```sh
## Generate Manual Activation File
make activation_file

## Activate the unity editor with license file
make activate

## Build the app for WebGL to dist folder
make build

## Run the app from dist folder
make run

## Run all tests
make test

## Run edit mode tests
make test/edit

## Run play mode tests
make test/play
```

## Acknowledgments

- [Standard Readme][5]
- [Conventional Commits][7]
- [Unity Learn][10]
- [The Unity Tutorial For Complete Beginners][11]
- [Game-CI][12]
- [Vercel: Preview Deployments Overview][13]
- [Creating pipeline for Unity games using GitHub Actions][15]
- [Unity: How To Implement A Task Branch Workflow][16]
- [CI/CD workflow for easy game updates with Addressables & DevOps | Unity at GDC 2023][19]
- [Gopass: Support for binary content][25]

## Contributing

- Bug reports and pull requests are welcome on [GitHub][0]
- Do follow [Editor Config][4] rules.
- Do follow [Git lint][7] rules.
- Do follow the [Contributor Covenant][2] code of conduct.

## License

The project is available as open source under the terms of the [MIT][1] [License](LICENSE)

[0]: https://github.com/roalcantara/floppy
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
[16]: https://unity.com/how-to/devops-task-branch-workflow#task-and-task-branch 'Unity: How To Implement A Task Branch Workflow'
[17]: https://www.uffizzi.com/preview-environments-guide 'The Definitive Guide to Preview Environments'
[18]: https://unity.com/solutions/devops-explained 'What Is Devops?'
[19]: https://youtu.be/TQBXx34Otfo 'CI/CD workflow for easy game updates with Addressables & DevOps | Unity at GDC 2023'
[20]: https://gnu.org/software/make 'GNU Make: A build automation tool'
[21]: https://docs.unity3d.com/Manual/UnityAccelerator.html 'A caching proxy agent that keeps copies of a team’s imported assets to speed up teamwork'
[22]: https://docs.unity3d.com/Manual/EditorCommandLineArguments.html 'Unity Editor command line arguments'
[23]: https://docs.unity3d.com/Manual/ManualActivationGuide.html 'Manual license activation'
[24]: https://game.ci/docs/github/activation 'Activation'
[25]: https://github.com/gopasspw/gopass/blob/master/docs/features.md#support-for-binary-content 'Gopass: Support for binary content'
