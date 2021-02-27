# recompile-bug-repro

Repro for <https://youtrack.jetbrains.com/issue/KT-44890>: gradle recompiles test sources when a resource changes (but not the 'main' code).

This can be triggered by running `test_build.sh` which gives the following output:

```
Doing build with unchanged resources (output in build1.txt)
Skipping task ':compileKotlin' as it is up-to-date.
Skipping task ':processResources' as it is up-to-date.
Skipping task ':compileTestKotlin' as it is up-to-date.
Skipping task ':test' as it is up-to-date.
4 actionable tasks: 4 up-to-date

Rebuilding after modifying one resource file (output in build2.txt)
Skipping task ':compileKotlin' as it is up-to-date.
Task ':processResources' is not up-to-date because:
Task ':compileTestKotlin' is not up-to-date because:
Task ':test' is not up-to-date because:
4 actionable tasks: 3 executed, 1 up-to-date
```

I would expect only `:processResources` and `:test` to run after a resource change, not `:compileTestKotlin`. (Note that `:compileKotlin` is still considered up-to-date regardless of the resource change).
