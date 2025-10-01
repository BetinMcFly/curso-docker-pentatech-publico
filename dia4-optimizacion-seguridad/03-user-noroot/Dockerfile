FROM alpine:3.18

RUN addgroup -S appgroup && adduser -S appuser -G appgroup
USER appuser

CMD ["sh", "-c", "echo Running as UID: $(id -u)"]
