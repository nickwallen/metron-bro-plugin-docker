A Docker container that enables testing of the [Metron Bro Plugin for Kafka](https://github.com/apache/metron-bro-plugin-kafka).  This contains all of the dependencies necessary to install and test the [Metron Bro Plugin for Kafka](https://github.com/apache/metron-bro-plugin-kafka) including the [Bro Network Security Monitor](https://www.bro.org/), [Bro Package Manager](#https://github.com/bro/packages), and the [Kafka C/C++ library](https://github.com/edenhill/librdkafka).

## Getting Started

### Build the Container

1. Build the container.
    ```
    docker build . --tag=bro-tester
    ```

1. Launch the container.
    ```
    docker run -it bro-tester /bin/bash
    ```

### Install using the Bro Package Manager

Follow the [installation](https://github.com/apache/metron-bro-plugin-kafka#installation) instructions to install the plugin.  Those instructions have been abbreviated below.

1. Install the Metron Bro Plugin.
    ```
    bro-pkg install apache/metron-bro-plugin-kafka --version master
    ```

1. Validate the install.
    ```
    bro -N Apache::Kafka
    ```
