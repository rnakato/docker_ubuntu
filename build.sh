for tag in 18.04
do
    docker build -t rnakato/ubuntu:$tag .
    docker push rnakato/ubuntu:$tag
done

rm *~

