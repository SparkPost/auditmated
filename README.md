# auditmated
Automated npm auditing

# Usage

The `auditmated` binary will run `npm audit fix` in the current repo. If `package.json` and `package-lock.json` have been updated `auditmated` will commit those changes
with a commit message of `<branch-name> npm audit fix`. This will fix any problems identified by `npm audit` that can be fixed by patch or minor version bumps.

`auditmated` only supports bash.

# Example with Husky

This will run auditing as a pre-push hook using [husky](https://www.npmjs.com/package/husky):

```json
{
  "name": "audit-test",
  "version": "1.0.0",
  "main": "index.js",
  "husky": {
    "hooks": {
      "pre-push": "auditmated"
    }
  },
  "devDependencies": {
    "auditmated": "0.1.0",
    "husky": "^1.0.0"
  }
}
```

If you are using Husky v0, define as a `prepush` script.

```json
{
  "name": "audit-test",
  "version": "1.0.0",
  "main": "index.js",
  "scripts": {
    "prepush": "auditmated"
  },
  "devDependencies": {
    "auditmated": "0.1.0",
    "husky": "^0.14.3"
  }
}
```

## Skipping Auditing

`auditmated` will not run for `master` or `develop` branches. If you are using `husky`, you can use the `--no-verify` command line option to skip running auditing on any other branch.
