Contributing
===

All contributions are welcome, including new features, bug fixes, and documentation improvements.
Please follow the guidelines below to make the contribution process as smooth as possible.

Style guide
---

### Branch Naming

We use the [Git-Flow](https://nvie.com/posts/a-successful-git-branching-model/) branching model.
The branch names are prefixed with `feature/`, `bugfix/`, `hotfix/` or `ci/`.
The `main` branch is the stable branch. Your pull requests should be made against the `main` branch.

### Commit Convention

All of commits should follow the [Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0/) convention.
This convention is used to generate the changelog and bump project version by `commitizen`.
So, please follow the convention when you commit.

### Code Style

All of code should follow the [Shell Style Guide](https://google.github.io/styleguide/shellguide.html).
If you don't know how to write shell scripts, please read the [Learn Linux Shell](https://learn.openwaterfoundation.org/owf-learn-linux-shell/)

How to contribute
---

1. Fork the repository on GitHub
2. Create a branch for the new feature
3. Make your changes, committing at logical breaks
4. Push your changes to a topic branch in your fork of the repository.
5. Submit a pull request to the original repository

Versioning
---

We use [SemVer](http://semver.org/) for versioning. For the versions available, see the tags on this repository. 
The version bump is done by `commitizen` and the Github Actions. If you want to see this mechanism,
please refer our [bump-version](.github/workflows/bump-version.yml) action
or commitizen [documentation](https://commitizen-tools.github.io/commitizen/).
