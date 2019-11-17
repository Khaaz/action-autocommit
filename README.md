# action-autocommit

This action will commit and push all changes made to the current repo.  
With this action you can make changes within a CI and automatically push it to the current branch.

Example of usage:

```yaml
name: Docgen

on:
  push:
    branches:
    - master

jobs:
  docgen:
    name: Docgen
    runs-on: ubuntu-latest
    steps:
      - name: Checkout repository
        uses: actions/checkout@master

      - name: Install Node v12
        uses: actions/setup-node@master
        with:
          node-version: 12

      - name: Install dependencies
        run: yarn install

      - name: Build docs
        run: yarn install

      - name: Commit and push
        uses: khaazz/action-autocommit@master
```
