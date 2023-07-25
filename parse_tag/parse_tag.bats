#!/usr/bin/env bats

load parse_tag.bash

@test "Test tag name with a heading 'v'" {
    run parse_tag "foo-v1.2.11-054b2afd.tar.gz"
    [ "$status" -eq 0 ] # assert success
    [ "${lines[0]}" = "v1.2.11" ]
}

@test "Test app name with a '-'" {
    run parse_tag "foo-bar-v1.2.11-054b2afd.tar.gz"
    [ "$status" -eq 0 ] # assert success
    [ "${lines[0]}" = "v1.2.11" ]
}

@test "Test tag name with 'v' and '-'" {
    run parse_tag "foo-v1.2.11-test1-054b2afd.tar.gz"
    [ "$status" -eq 0 ]
    [ "${lines[0]}" = "v1.2.11-test1" ]
}

@test "Test tag name without 'v'" {
    run parse_tag "foo-4.3.0-7c82478f.tar.gz"
    [ "$status" -eq 0 ]
    [ "${lines[0]}" = "4.3.0" ]
}