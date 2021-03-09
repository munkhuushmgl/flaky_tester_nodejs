# Flaky test tool - ML APIs Node

> Note: This tool is a work-in-progress, and may not work
> for all ML API nodejs repos.

## Samples nodejs directory

Currently, node directory has test and Google video intelligence sample which fails if it reaches quotas limitation to produce the flakiness.

### Prerequisites

You will need to set up the local development environment by
[installing the Google Cloud SDK][cloud-sdk] and running the following commands in command line:
`gcloud auth login` and `gcloud config set project [YOUR PROJECT ID]`.

### Installation and setup

Go to samples directory

```code
cd samples/
```

Install node dependencies

```code
npm i

```

## Using the shell script

* make bash script file executable

    ```
    chmod +x flaky_tester_node.sh
    ```

* execute the script in context to make available for usage

    ```
    source flaky_tester_node.sh 
    ```

* call bash function with **flaky_node_tester** *node_test.js* 

1. Node test module name (required)

    ```
    source flaky_report_tool.sh "analyzing faces in video"
    ```
