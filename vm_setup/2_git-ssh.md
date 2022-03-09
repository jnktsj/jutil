# Set up github
git config --global user.name "Junko Tsuji"
git config --global user.email $(whoami)@broadinstitute.org
git config --global core.editor emacs

# Run this manually with a password set
ssh-keygen -t rsa -b 4096 -C $(whoami)@broadinstitute.org
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa

# after generating the key, add the public key to github account:
# https://docs.github.com/en/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account
