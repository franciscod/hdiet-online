sudo apt-get update

sudo apt-get install -y apache2 build-essential cpanminus libgd2-xpm-dev libxml2-dev weblint-perl

sudo cpanm GD
sudo cpanm Digest::SHA1
sudo cpanm XML::LibXML
sudo cpanm Crypt::OpenSSL::AES
sudo cpanm Crypt::CBC


DATADIR="/var/lib/hackdiet"

sudo mkdir -p $(DATADIR)/{Users,Sessions}
sudo chown -R www-data:www-data $(DATADIR)

cd /vagrant/src

sudo make publish

echo "done! go to http://localhost/cgi-bin/HackDiet/"
