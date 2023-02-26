FROM alpine:latest as runner

# Add bash to run the compiled app
RUN apk add --no-cache bash

# Set the default shell to bash instead of sh
SHELL ["/bin/bash", "-c"]

# Add libc6-compat to run the compiled app
RUN apk add libc6-compat

# Set the working directory to /app
WORKDIR /app

# Copy the compiled app from the builder image
COPY --from=builder /app .

# Run the app
CMD ["./compiled-app"]