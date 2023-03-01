# README

This app was created as a small takehome test for a job application as described here:

https://honeybadger.notion.site/honeybadger/Take-home-project-for-Software-Developer-position-2023-fee9be3cd8454e1fb61e53f0172ff2e8

## Setup

The only thing this app needs to run is two environment variables that define how to communicate with Slack's API.

```
  SLACK_URL=
  SLACK_CHANNEL
```

## Tests

It has a standard rails test suite, all you have to do to run it is:

```
bundle exec rails test
```
