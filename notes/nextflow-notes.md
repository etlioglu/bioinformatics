# Nextflow Notes

## General

- `Nextflow` is a DSL, built on top of `Groovy`
- Processes -> functions -> tasks
- Channels -> variables -> queue, FIFO
- Features:
    - parallelization
    - rerentrancy
    - reusability

- Hypens
    - `-` for `Nextflow` options
    - `--` for pipeline-specific options

- Find all previous runs in the current directory
    `nextflow log
    
- variables defined by `params.` can be changed/overridden via command line arguments

- every function applied to a `channel` is a `channel operator`

- `.flatten()` is the opposite of `.collect()`

- `.view()` sends to standard output

- configuration when done within a nextflow script does not require `=`

- configuration when done within a config file requires `=`

- Within a config file, whatever is within `"` and `"` are expanded. `'` can be used if expansion is not desired.