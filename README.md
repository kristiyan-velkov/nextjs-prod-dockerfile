<div align="center">
  <img src="./public/next.svg" alt="Next.js Prod Dockerfile Logo">
</div>

This project is a production-ready Next.js application configured to run as a static export using a Dockerized Nginx server. It is optimized for deployment with a multi-stage Dockerfile that builds the Next.js app and serves the static files with Nginx for efficient performance.

## More about me 

- [Blogs on Medium](https://medium.com/@kristiyan.velkov)
- [LinkedIn](https://www.linkedin.com/in/kristiyan-velkov-763130b3/)

## Prerequisites

- Docker installed on your machine.
- Make installed to use the Makefile commands.

## Usage

| Command                | Description                          |
| ---------------------- | ------------------------------------ |
| `make help`            | Show available commands.             |
| `make build`           | Build the Docker image.              |
| `make run`             | Run the Docker container.            |
| `make build-run`       | Build and run the Docker container.  |
| `make stop`            | Stop the Docker container.           |
| `make restart`         | Restart the Docker container.        |
| `make logs`            | Show logs from the Docker container. |
| `make clean`           | Remove Docker image and container.   |
| `make clean-container` | Remove only the Docker container.    |
| `make clean-image`     | Remove only the Docker image.        |

---

### Environment Variables

The following variables are defined in the `Makefile` and can be customized if needed:

- `IMAGE_NAME`: The name of the Docker image. Default is `nextjs-app`.
- `CONTAINER_NAME`: The name of the Docker container. Default is `nextjs-container`.
- `HOST_PORT`: The port on the host machine that the container will map to. Default is `3000`.
- `CONTAINER_PORT`: The port inside the Docker container where Nginx serves the application. Default is `80`.
- `DOCKERFILE`: The Dockerfile to use. Default is `Dockerfile`. If you want to use standalone version of the build use Dockerfile.standalone

---

### Next.js Configuration

To configure the next.config.js file for different output options, use the following setup:

```typescript
import type { NextConfig } from "next";

const nextConfig: NextConfig = {
  // output: "standalone", // Use the Dockerfile.standalone file with this option
  output: "export",
};

export default nextConfig;
```

- **Standalone Mode**: Uncomment the line output: "standalone" if you want to use Dockerfile.standalone.
- **Export Mode**: By default, this configuration uses output: "export", which enables static export of the Next.js app.

---

### How to Build and run the project under Docker

1. **Build the Docker Image**:

```bash
  make build
```

2.  **Run the Docker Container**:

```bash
  make run
```

3. **Build and Run with a Single Command**
   Alternatively, you can build and run in one step with:

```bash
 make build-run
```

---

## Deployment

This configuration is designed for deployment on environments where Docker is available. The Nginx server efficiently serves the static Next.js build, making it suitable for production use.

---

## Notes

- Ensure Docker is properly configured to allow external access to port `3000` on the host machine if necessary.
- Modify the Makefile variables as needed for custom image names, container names, and ports.

---

### TO-DO

- Optimize the Docker.standalone file
- Create Docker file for default output config option
