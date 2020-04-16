FROM golang:1-buster
RUN go get -u github.com/vmware/govmomi/vcsim && \
    go get -u github.com/vmware/govmomi/govc
EXPOSE 443

CMD vcsim -l 0.0.0.0:443

# +TODO: get rspec pass
# -TODO: have ip addr at machine
# +TODO: go get -u github.com/vmware/govmomi - check it
