import 'package:flutter/material.dart';

class AppCombustivel extends StatefulWidget {
  const AppCombustivel({Key? key}) : super(key: key);

  @override
  _AppCombustivelState createState() => _AppCombustivelState();
}

class _AppCombustivelState extends State<AppCombustivel> {
  TextEditingController valor_abastecer = TextEditingController();

  TextEditingController valor_gasolina = TextEditingController();
  TextEditingController media_gasolina = TextEditingController();

  TextEditingController valor_alcool = TextEditingController();
  TextEditingController media_alcool = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _resetFields(){
    valor_abastecer.text = "";
    valor_gasolina.text = "";
    media_gasolina.text = "";
    valor_alcool.text = "";
    media_alcool.text = "";

    setState(() {
      _msnText_1 = "";
      _msnText_2 = "";
    });

    _formKey = GlobalKey<FormState>();

  }

  void _calculate_km(){
    setState(() {
      double valorAbastercer = double.parse(valor_abastecer.text);
      double valorGasolina = double.parse(valor_gasolina.text);
      double mediaGasolina = double.parse(media_gasolina.text);
      double valorAlcool = double.parse(valor_alcool.text);
      double mediaAlcool = double.parse(media_alcool.text);

      double lt_gasolina = valorAbastercer / valorGasolina;
      double lt_alcool = valorAbastercer / valorAlcool;

      double km_gasolina = lt_gasolina * mediaGasolina;
      double km_alcool = lt_alcool * mediaAlcool;

      _msnText_1 = " Roda na Gasolina -  $km_gasolina ";
      _msnText_2 = " Roda no Álcool -  $km_alcool ";

      //print('Litros em Gasolina: ' + lt_gasolina.toStringAsPrecision(3));
      //print('Litros em Álcool: ' +lt_alcool.toStringAsPrecision(3));

    });
  }

  String _msnText_1 = "Informe seus dados ";
  String _msnText_2 = "Informe seus dados ";

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text("KM do seu Carro"),
        centerTitle: true,
        backgroundColor: Colors.green,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _resetFields,
          ),
        ], // actions
      ),

      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(20.0, 0, 20.0, 0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Icon(Icons.person_outline, size: 100.0, color: Colors.green),

              TextFormField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    labelText: "Valor Abaster",
                    labelStyle: TextStyle(color: Colors.green)),
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.green, fontSize: 15.0),
                    controller: valor_abastecer,
                    validator: (value) {
                      if(value!.isEmpty){
                        return "Insira o valor para abastecer";
                      }
                    },
              ),

              TextFormField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    labelText: "Preço Gasolina ",
                    labelStyle: TextStyle(color: Colors.green)),
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.green, fontSize: 15.0),
                    controller: valor_gasolina,
                    validator: (value) {
                      if(value!.isEmpty){
                        return "Insira o valor da gasolina";
                      }
                    },
              ),

              TextFormField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    labelText: "Média Gasolina ",
                    labelStyle: TextStyle(color: Colors.green)),
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.green, fontSize: 15.0),
                    controller: media_gasolina,
                    validator: (value) {
                      if(value!.isEmpty){
                        return "Insira a média que seu carro faz";
                      }
                    },
              ),

              TextFormField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    labelText: "Preço Alcool ",
                    labelStyle: TextStyle(color: Colors.green)),
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.green, fontSize: 15.0),
                    controller: valor_alcool,
                    validator: (value) {
                      if(value!.isEmpty){
                        return "Insira o valor do alcool";
                      }
                    },
              ),

              TextFormField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    labelText: "Média Alcool",
                    labelStyle: TextStyle(color: Colors.green)),
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.green, fontSize: 15.0),
                    controller: media_alcool,
                    validator: (value) {
                      if(value!.isEmpty){
                        return "Insira a média que seu carro faz";
                      }
                    },
              ),

              SizedBox(height: 10),
              Container(
                height: 50.0,
                child: ElevatedButton(
                  onPressed: (){
                    if(_formKey.currentState!.validate()){
                      _calculate_km();
                    }
                  }, // chama a função criada
                  child: const Text('Caclcular'),
                  style: ElevatedButton.styleFrom(primary: Colors.green),
                  //style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.green) ),
                ),
              ),

              const SizedBox(height: 10),

              Text(
                _msnText_1,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.green, fontSize: 15.0),
              ),
              Text(
                _msnText_2,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.blue, fontSize: 15.0),
              ),

            ],
          ),
        )
      ),
    );
  }
}
