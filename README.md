# Volet

## generate JWT RS256 key

```bash
ssh-keygen -t rsa -b 4096 -m PEM -f jwt.rs256 -N ''
openssl rsa -in jwt.rs256.key -pubout -outform PEM -out jwt.rs256.pub
# keys to string
sed -z 's/\n/\\n/g' jwt.rs256.key
sed -z 's/\n/\\n/g' jwt.rs256.key.pub
```
