import type { NextConfig } from "next";

const nextConfig: NextConfig = {
  output: "standalone", // Use the Dockerfile.standalone file with this option
  // output: "export",
};

export default nextConfig;
