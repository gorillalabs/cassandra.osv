# elasticsearch.osv
So far, this is a toy project to try out to run [Elasticsearch](https://www.elastic.co/products/elasticsearch) in an [OSv](http://osv.io/) unikernel.



# Setting up OSv/Capstan correctly on Mac OS X.

On OS X, I had some trouble first building new OSv images. I finally figured out it had to do with my firewall / security setting for qemu. So, if you also encounter problems, try this first:

Make sure you have cleaned old artefacts if you encountered problems.

    capstan delete elasticsearch.osv


and delete the related files/folders under `~/.capstan/repository/elasticsearch.osv`.


Install qemu using homebrew:

    brew install qemu


Find out where your qemu is located:

    which qemu-system-x86_64

For me it was `/usr/local/bin/qemu-system-x86_64`.

Run ``/usr/local/bin/qemu-system-x86_64` and make sure to open your firewall by accepting incoming network requests to qemu.

And make sure to export CAPSTAN_QEMU_PATH ([track this issue](https://github.com/cloudius-systems/capstan/issues/152)):

    export CAPSTAN_QEMU_PATH=/usr/local/bin/qemu-system-x86_64

Now you should be good to go.


# Setup

You need to copy things (aka all jars exept the elasticsearch-2.0.0.jar) from your unpacked `elasticsearch-2.0.0/lib` to `ROOTFS/lib`, because these are needed in the OSv disk image and
its not possible from the Capstanfile to copy a directory.


<!--

# Run

Run the image on VirtualBox using this command (which will also build it):

    capstan run -p vbox -f 5555:5555 -f 5556:5556 -f 8001:8000

It's essential to forward the ports, as otherwise I cannot access my guest machine. Bridged network is somewhat broken for me here :(
You can find the Dashboard/REST API on http://localhost:8001/

# Clear artefacts

You might need to clear the artefacts if you change things.

Use

    capstan delete riemann.osv

to delete the instance.

In order to get Capstan to rebuild correctly, you might need to clear the image. I think there's no capstan command for this right now, although you might check your images using `capstan I`. You just need to move `~/.capstan/respository/riemann.osv` to the trash.


# Send data to riemann.osv

Once installed correctly you can run `riemann-health` to send data to your Riemann setup.

# Check whether it's ok
I added a prn to the config in order to push events down to the console for debugging reasons.
-->
