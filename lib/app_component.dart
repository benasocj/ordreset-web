import 'dart:async';

import 'package:angular_components/angular_components.dart';
import 'package:angular/angular.dart';
import 'package:http/browser_client.dart';
import 'package:http/http.dart';

import 'src/api.dart';
import 'src/application_tokens.dart';
import 'src/dashboard.dart';
import 'testing.dart';

BrowserClient browserClientFactory() => new BrowserClient();

@Component(
  selector: 'my-app',
  templateUrl: 'app_component.html',
  directives: const [Dashboard],
  providers: const [
    const Provider(BaseClient, useFactory: browserClientFactory),
    const Provider(Api, useClass: Api, deps: const [BaseClient]),
    materialProviders,
  ],
)
class AppComponent {}

Future<Null> blockApiFactory() =>
    new Future<Null>.delayed(const Duration(milliseconds: 500));

@Component(
  selector: 'my-app-test',
  templateUrl: 'app_component.html',
  directives: const [Dashboard],
  providers: const [
    const Provider(blockApi, useFactory: blockApiFactory),
    const Provider(BaseClient, useFactory: browserClientFactory),
    const Provider(Api, useClass: Api, deps: const [BaseClient]),
    const Provider(BaseClient,
        useFactory: mockClientFactory),
    materialProviders,
  ],
)
class AppComponentTest {}
