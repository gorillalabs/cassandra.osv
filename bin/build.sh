capstan delete cassandra.osv
capstan delete cassandra-1.osv
capstan delete cassandra-2.osv
capstan delete cassandra-3.osv
rm -rvf ~/.capstan/repository/cassandra.osv/
rm -rvf ~/.capstan/repository/cassandra-[0-9]*.osv/
capstan build -v -p vbox

mkdir ~/.capstan/repository/cassandra-1.osv/
cp ~/.capstan/repository/cassandra.osv/cassandra.osv.vbox ~/.capstan/repository/cassandra-1.osv/cassandra-1.osv.vbox
VBoxManage internalcommands sethduuid ~/.capstan/repository/cassandra-1.osv/cassandra-1.osv.vbox a3c17b1e-b68f-497e-a46b-de922426f4b1

mkdir ~/.capstan/repository/cassandra-2.osv/
cp ~/.capstan/repository/cassandra.osv/cassandra.osv.vbox ~/.capstan/repository/cassandra-2.osv/cassandra-2.osv.vbox
VBoxManage internalcommands sethduuid ~/.capstan/repository/cassandra-2.osv/cassandra-2.osv.vbox 177e04b2-ca15-44ce-9bdf-e285e687f761

mkdir ~/.capstan/repository/cassandra-3.osv/
cp ~/.capstan/repository/cassandra.osv/cassandra.osv.vbox ~/.capstan/repository/cassandra-3.osv/cassandra-3.osv.vbox
VBoxManage internalcommands sethduuid ~/.capstan/repository/cassandra-3.osv/cassandra-3.osv.vbox b58d122f-2b09-4359-bed6-3407fc5ec1fc
