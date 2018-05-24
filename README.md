# auditmated
Automated NPM auditing

# Usage

The `auditmated` binary will run `npm audit fix` in the current repo. If `package.json` and `package-lock.json` have been updated `auditmated` will commit those changes
with a commit message of `<branch-name> npm audit fix`. 

`auditmated` will not run for `master` or `develop` branches.

# Example with Husky
This will run auditing as a pre-push hook using [husky](https://www.npmjs.com/package/husky):
```
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
  },
}
```
