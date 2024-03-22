class CoinbaseData {
  String address;
  String chainName;
  int chainId;
  String ownPublicKey;
  String peerPublicKey;

  CoinbaseData({
    required this.address,
    required this.chainName,
    required this.chainId,
    this.ownPublicKey = '',
    this.peerPublicKey = '',
  });

  factory CoinbaseData.fromJson(Map<String, dynamic> json) {
    return CoinbaseData(
      address: json['address'].toString(),
      chainName: json['chain'].toString(),
      chainId: int.parse(json['networkId'].toString()),
      ownPublicKey: json['ownPublicKey'] ?? '',
      peerPublicKey: json['peerPublicKey'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'address': address,
      'chain': chainName,
      'networkId': chainId,
      'ownPublicKey': ownPublicKey,
      'peerPublicKey': peerPublicKey,
    };
  }

  CoinbaseData copytWith({
    String? address,
    String? chainName,
    int? chainId,
    String? ownPublicKey,
    String? peerPublicKey,
  }) {
    return CoinbaseData(
      address: address ?? this.address,
      chainName: chainName ?? this.chainName,
      chainId: chainId ?? this.chainId,
      ownPublicKey: ownPublicKey ?? this.ownPublicKey,
      peerPublicKey: peerPublicKey ?? this.peerPublicKey,
    );
  }
}
