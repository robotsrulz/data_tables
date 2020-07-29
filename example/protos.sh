#!/bin/sh

protoc --dart_out=grpc:lib/generated -Iprotos protos/tabular.proto