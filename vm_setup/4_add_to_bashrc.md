```
rmate ()
{
    export RMATE_PORT=$(python3 -c "import port_for;print(port_for.select_random())");
    echo "Enter the following into the SSH menu:";
    echo "-R $RMATE_PORT:localhost:52779";
    unset -f rmate
}
```

```
jp ()
{
    export JUPYTER_PORT=$(python3 -c "import port_for;print(port_for.select_random())");
    echo "Enter the following command in the ~C ssh menu:";
    echo "-L $JUPYTER_PORT:localhost:$JUPYTER_PORT";
    jupyter notebook --no-browser --ip=127.0.0.1 --port=$JUPYTER_PORT
}
```
