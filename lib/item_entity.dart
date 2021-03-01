class ItemEntity {
  int id_item;
  String descricao;
  double valor;
  int quantidade;

  ItemEntity({this.id_item, this.descricao, this.valor, this.quantidade});

  int get get_id_item => id_item;

  String get get_descricao => descricao;
  void set set_descricao(String descricao) => this.descricao = descricao;

  double get get_valor => valor;
  void set set_valor(double valor) => this.valor = valor;

  int get get_quantidade => quantidade;
  void set set_quantidade(int quantidade) => this.quantidade = quantidade;
}
