# blog

This simple website is made using pandoc, make and bash as its core. These are the only dependencies I'm aware of, with pandoc having to be version `>= 2.8` for the `--defaults` option to be available (be careful on ubuntu, the main repos include an older version).

# Deployment
Simply clone this repo on the target server. If you cannot serve directly the `public` folder as the current user, run `INSTALL_DIR=<path> INSTALL_USER=<user> make install` to compile and install the site to the desired folder as the needed user. Otherwise, just run `make`

# Customizations
Most of the customizations will be done at first in the `style` folder to change the CSS stylesheet and html header and nav. The icon is hard-coded in base64 in the header file for simplicity (it is 16x16 in the deployed version).

For changes to the actual content, see the `md` folder. The main pages are directly in the root of this folder, while the posts are in the corresponding sub-directory. The `posts/list.md` is not meant to be changed by hand and will be overwritten during the compilation.
