# Hashicorp's tls proivider - Algorithm for the Key Pair
resource "tls_private_key" "key_pair" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

# Hashicorp's local proivider - Save the file
resource "local_file" "ssh_key" {
  filename = "${aws_key_pair.key_pair.key_name}.pem"
  content  = tls_private_key.key_pair.private_key_pem
}

# Create the Key Pair
resource "aws_key_pair" "key_pair" {
  key_name   = "my-key-pair"
  public_key = tls_private_key.key_pair.public_key_openssh
}
