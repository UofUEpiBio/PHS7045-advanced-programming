# AGENTS.md — PHS 7045, Lab 11 (Simulating π on CHPC)

<!-- Students: copy this file into your lab11/ folder on CHPC. Codex reads it
     when it starts in that folder, on top of CHPC's own system prompt.
     Add ONE rule of your own at the end (see the lab instructions). -->

## Context

This folder holds a student's lab for an advanced R programming course. The goal is to learn how to run an R simulation on CHPC with Slurm. The student must understand every line they submit, so explain your reasoning briefly and keep the code short and commented.

The shared functions live in `simpi.R`. Every correct version of the simulation (serial, multicore, job array) must print **exactly the same** estimate of pi for the same `nsims` and `n`, because each replicate `i` uses its own seed `seeds[[i]]` from `make_seeds()`. Never change `simpi.R` or `make_seeds()`; reuse them.

## Rules

1. **Never run `sbatch`, `scancel`, or `salloc` yourself.** Write the command, explain it, and let the student run it.
2. **No heavy computing on the login node.** You may run R here only for quick tests with `nsims <= 100`. Anything larger goes through Slurm.
3. Use `--account=notchpeak-shared-short --partition=notchpeak-shared-short` unless the student says otherwise. Always set `--time`, `--mem`, and `--cpus-per-task`.
4. Inside R, take the number of cores from `SLURM_CPUS_PER_TASK`. Never use `parallel::detectCores()`.
5. Every array task writes its own output file (include the task ID in the file name).
6. Do not write the solutions for Hands-on 1 (`01-sapply`, `02-mclapply`); the student does those by hand. Help only when asked a specific question.
7. When you finish a task, list the files you created or changed and the exact commands the student should run next.

## Student's own rule

<!-- Add one rule here, e.g. about naming, comments, or how you want answers. -->
