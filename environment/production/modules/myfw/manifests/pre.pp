# Adicionando as regras
class myfw::pre {
 Firewall {
 require => undef,
 }
 firewall { '0000 Allow all traffic on loopback':
 proto => 'all',
 iniface => 'lo',
 action => 'accept',
 }
 firewall { '0001 Allow all ICMP':
 proto => 'icmp',
 action => 'accept',
 }
 firewall { '0002 Allow all established traffic':
 proto => 'all',
 state => ['RELATED', 'ESTABLISHED'],
 action => 'accept',
 }
 firewall { '0022 Allow all TCP on port 22 (ssh)':
 proto => 'tcp',
 dport => '22',
 action => 'accept',
 }
 firewall { '8139 Allow all tcp on port 8139 and 8140 (puppetagent and puppetmster)':
 proto => 'tcp',
 dport  => ['8139','8140'],
 action => 'accept',
 }
 firewall { '0514 Permite a comunicacao com o servidor de auditoria':
 proto => 'tcp',
 dport => '514',
 action => 'accept',
 }
}
