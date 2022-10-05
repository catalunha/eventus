import 'package:eventus/app/routes.dart';
import 'package:eventus/app/view/controllers/auth/splash/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final _splashController = Get.find<SplashController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(() => Text(
            "Olá, ${_splashController.userModel!.profile!.community?.name ?? 'Atualize seu perfil.'}.")),
        // title: Obx(() => Text(
        //     "Olá, ${_splashController.userModel!.profile!.name ?? 'Atualize seu perfil.'}.")),
        actions: [
          IconButton(
            onPressed: () {
              _splashController.logout();
            },
            icon: const Icon(Icons.exit_to_app),
          ),
        ],
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            child: const Text('Vídeo de orientações'),
            onPressed: () {
              Get.toNamed(Routes.userProfile,
                  arguments: _splashController.userModel!.profile);
            },
          ),
          Card(
            child: ListTile(
              title: const Text('1º Passo'),
              subtitle: const Text('Clique aqui para atualizar seus dados'),
              onTap: () {
                Get.toNamed(Routes.userProfile,
                    arguments: _splashController.userModel!.profile);
              },
            ),
          ),
          // Card(
          //   child: ListTile(
          //     title: const Text('2º Passo'),
          //     subtitle:
          //         const Text('Cadastrar conjuge ou similar se necessário.'),
          //     onTap: () {
          //       Get.toNamed(Routes.userProfile,
          //           arguments: _splashController.userModel!.profile);
          //     },
          //   ),
          // ),
          // Card(
          //   child: ListTile(
          //     title: const Text('3º Passo'),
          //     subtitle: const Text('Cadastrar filhos se necessário.'),
          //     onTap: () {
          //       Get.toNamed(Routes.userProfile,
          //           arguments: _splashController.userModel!.profile);
          //     },
          //   ),
          // ),
          Card(
            child: ListTile(
              title: const Text('2º Passo'),
              subtitle: const Text('Escolher seu treinamento ou palestra.'),
              onTap: () {
                Get.toNamed(Routes.event);
              },
            ),
          )
        ],
      ),
    );
  }
}
