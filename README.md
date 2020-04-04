# GToolkit Executor

Common logic to compose and execute tasks written as commands. It handles errors, background executions, and debugging tools.

## Installation 

### In GToolkit 

```
EpMonitor current disableDuring: 
[
Metacello new
   baseline: 'GToolkitExecutor';
   repository: 'github://feenkcom/gtoolkit-executor/src';
   load.
]
```

### In Pharo (loading GToolkit too)

```
EpMonitor current disableDuring: 
[
Metacello new
   baseline: 'GToolkitExecutorWithGT';
   repository: 'github://feenkcom/gtoolkit-executor/src';
   load.
]
```
