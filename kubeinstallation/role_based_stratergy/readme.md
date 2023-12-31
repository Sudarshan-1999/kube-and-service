# How to create an self sign certificate and Role based authoriation stratergy
        certficates based
        token based 
        ldap based

# generate the certificates sign strategy to authorized 

        openssl genrsa -out dev-tom.key 2048

        cat dev-tom.key


# Generate the csr for the user

        openssl req -new -key dev-tom.key -subj "/CN=tom" -out dev-tom.csr


        cat dev-tom.csr

# Add the base64 data into the spec.request for the user 
        cat dev-tom.csr | base64 | tr -d "\n"

# get the certificates signing request from the kubernetes to access the resource with the kubernetes CA rootCA
vim dev-tom-certificatesreq.yaml

        apiVersion: certificates.k8s.io/v1
        kind: CertificateSigningRequest
        metadata:
            name: dev-tom
        spec:
            request: LS0tLS1CRUdJTiBDRVJUSUZJQ0FURSBSRVFVRVNULS0tLS0KTUlJQ1V6Q0NBVHNDQVFBd0RqRU1NQW9HQTFVRUF3d0RkRzl0TUlJQklqQU5CZ2txaGtpRzl3MEJBUUVGQUFPQwpBUThBTUlJQkNnS0NBUUVBMnJBa3dmZ3hzdy9sM25Uc1I1OElIa0FITDdvWjBtblZ4QXYxVTBEb3hxWU5ZdG5PCjhTcndnUXBTZGJLRkkxZWNodGxtZmJuVEFvbXR0aUhJTzNHKzV0aVFWTFV0TlgyTUFnNWhHLzNDQnBCaHJlSVYKaXhFdU42dy8yYUpBYnEwTU4xUTRJNkwvdExKL1FEVUVwY2EydHFyMlBwcVA3KzBTQXk4OXI0aXpYVUd1R3MzZAoxYjNiWTZHbTFISHBuSFA2MHZlTGx5Yks0aldFNktNaHJBTkdxYkFsTWk5M3B4TG5rL3FhUzFZQXNHWkx0YnJQCk1aNlhaNFVjcU9GNmU3QWRkM2hPVThTZUxDUDAxdDdGUXM1Y3dpMEhvczNGNmtOeTlZeVk1WnNUQ0dqYjYxQ2UKVDQxL0JZSU90ZCsrckFHa1cxVmF3eFpKdnVwR3BqWmpVb2RBOHdJREFRQUJvQUF3RFFZSktvWklodmNOQVFFTApCUUFEZ2dFQkFIeldlMGR0OVFYUnJMcTRVclA1bW85ellCRldvS0Y2V1IydFpOSXZiZTF3aTRSazYvOGFSM25aClFOQWZFNnh6SkhuYW03MUZzaGZYVTJ1V2ZUbkpqb0tnTWtUeHpZV2hyODhlQlV1cmpIaE9IZG5td3dkbkttKzcKZWxPWUJHUEUvUzEySkNjTWIyNTBnaHZ4VENpUkRwSzFnUUM0K2lWc0JkVThoNk1KaXpKN3BvMVA2elNzQVlzegpZK1JiTFBFUHZ2alh5NUtIUHNheUNxVVFwZGRGMGh0RFRaNjlWb2xDaSttQ3dWRGNzblErNGtFUUVCNFBmT1NvCnp5TENFQThNTm1PamtWWE5kLzJlNHVjaWtvVjh1S0dmV1BKR3lpWVFId2hYajVIRGZXUGxtenJEVnZ6WEljR3QKcFZuTWlJVU94TEpEKzIyeE11djU5enpKNkYvQUY2ND0KLS0tLS1FTkQgQ0VSVElGSUNBVEUgUkVRVUVTVC0tLS0tCg==
            signerName: kubernetes.io/kube-apiserver-client
            expirationSeconds: 86400  # one day
            usages:
            - client auth


# apply the certificates requests
        kubectl apply -f dev-tom-certificatesreq.yaml


# check the certificates request 
        kubectl get csr


# Approve the certificates requests by kubernetes admin

        kubectl certificate approve dev-tom


# Get the certificates sign by kubernetes CA, rootCA using the below command
        kubectl get csr dev-tom -o yaml

        from the certificates status.certificate sections

# Decode the certificates 
        echo "certificate base64 encoded data inside the quote" | base64 --decode

# and create the crt file for the dev-tom user 
        vim dev-tom.crt