#!/bin/sh

set -e

bundle check || bundle install --jobs 4

exec "$@"
