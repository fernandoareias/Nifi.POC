# NiFi Data Integration and Migration POC Readme

## Prerequisites

Before running the POC, ensure you have the following installed:

- Apache NiFi - For orchestrating data flows.
- PostgreSQL - As the primary database system.
- Debezium - For change data capture.
- Apache Kafka - For messaging and streaming data.
- ZooKeeper - Required for Kafka coordination.
- Kafka UI - Optional UI for monitoring Kafka topics.
- NiFi Registry - For version control and management of NiFi flows.

## Running the POC

`docker-compose up --build`

### Executing After Applications are Up in Docker Compose

Once all the applications are up and running within Docker Compose, an additional step is required to properly configure the system. Follow the steps below:

1. Ensure all applications are up by running Docker Compose.

2. Execute the CURL command as defined in the **connector/request_config.txt** file to perform the final system configuration.

# Applications

| Application  | Host                                 |
| :----------- | :----------------------------------- |
| NIFI         | http://localhost:8080/nifi           |
| NIFI REGISTR | http://localhost:18080/nifi-registry |
| POSTGRESQL   | http://localhost:5432                |
| DEBEZIUM     | http://localhost:8083                |
| KAFKA        | http://localhost:9092                |
| KAFKA UI     | http://localhost:9090                |
| ZOOKEEPER    | http://localhost:2181                |

## Contributing

If you'd like to contribute to this POC, feel free to fork the repository, make your changes, and submit a pull request. Contributions, suggestions, and improvements are welcome!

## License

This POC is licensed under the [MIT License](LICENSE).

## Disclaimer

This POC is provided as-is without any warranties. It's intended for demonstration and educational purposes only. Use it at your own risk.

## Contact

For any questions or inquiries, please contact [maintainer email or username].
