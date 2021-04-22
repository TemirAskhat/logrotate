# Logrotate

Logrotate docker image which is primarily used as a sidecar in k8s deployment.

[What is a sidecar pattern?](https://www.magalix.com/blog/the-sidecar-pattern)

## k8s manifest example

```yaml
image: temaskhat/logrotate
          imagePullPolicy: IfNotPresent
          securityContext:
            privileged: true
          env:
            - name: LOGROTATE_SIZE
              value: "40M"
            - name: LOGROTATE_COMPRESSION
              value: "compress"
            - name: LOGROTATE_CRON
              value: "* * * * *"
            - name: LOGROTATE_DIRECTORY
              value: "/var/logs"
            - name: LOGROTATE_ROTATE
              value: "1"
            - name: LOGROTATE_DELETION_MTIME
              value: "+0"
          volumeMounts:
            - name: {yourVolumeMountName}
              mountPath: {mountedDirectoryPath}
```

## Usage

docker pull temaskhat/logrotate

## Supported ENV variables are
```
LOGROTATE_SIZE, LOGROTATE_COMPRESSION, LOGROTATE_CRON, LOGROTATE_DIRECTORY, LOGROTATE_ROTATE, LOGROTATE_DELETION_MTIME
```

Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

## An official documentation of the logrotate
https://linux.die.net/man/8/logrotate

## License
[MIT](https://choosealicense.com/licenses/mit/)
