import 'package:foo/app-core.dart';
import 'package:test/test.dart';
import 'package:api_tools/api_tools.dart';
import 'package:api_tools/src/testing.dart';

// Test double for SaasTenantEntityIdProvider
class SaasTenantEntityIdProviderTestDouble
    implements SaasTenantEntityIdProvider {
  final String tenantId;
  int getTenantIdCallCount = 0;

  SaasTenantEntityIdProviderTestDouble(this.tenantId);

  @override
  Future<String> getTenantId() async {
    getTenantIdCallCount++;
    return tenantId;
  }
}

// Test double that throws exceptions
class ThrowingSaasTenantEntityIdProviderTestDouble
    implements SaasTenantEntityIdProvider {
  final Exception exception;

  ThrowingSaasTenantEntityIdProviderTestDouble(this.exception);

  @override
  Future<String> getTenantId() async {
    throw exception;
  }
}

void main() {
  group('SaasTenantAPIClient', () {
    late APIClientTestDouble baseClient;
    late SaasTenantEntityIdProviderTestDouble tenantProvider;
    late SaasTenantAPIClient client;

    setUp(() {
      baseClient = APIClientTestDouble(
        requestCallback: (endpoint) async => dummyAPIResponse(),
        requestMultipartCallback: (endpoint) async => dummyAPIResponse(),
      );
      tenantProvider = SaasTenantEntityIdProviderTestDouble('test-tenant-123');
      client = SaasTenantAPIClient(
        client: baseClient,
        tenantProvider: tenantProvider,
      );
    });

    group('request', () {
      test('adds tenant ID header to request', () async {
        final endpoint = Endpoint(
          method: "GET",
          path: "/api/test",
          headers: {'Content-Type': 'application/json'},
        );

        await client.request(endpoint);

        expect(baseClient.requestCallCount, equals(1));
        expect(tenantProvider.getTenantIdCallCount, equals(1));
      });

      test('uses default tenant header key', () async {
        Endpoint? capturedEndpoint;
        baseClient = APIClientTestDouble(
          requestCallback: (endpoint) async {
            capturedEndpoint = endpoint;
            return dummyAPIResponse();
          },
        );
        client = SaasTenantAPIClient(
          client: baseClient,
          tenantProvider: tenantProvider,
        );

        final endpoint = Endpoint(
          method: "GET",
          path: "/api/test",
          headers: {},
        );

        await client.request(endpoint);

        expect(capturedEndpoint, isNotNull);
        expect(capturedEndpoint!.headers['SAAS_TENANT_ENTITY_ID'],
            equals('test-tenant-123'));
      });

      test('uses custom tenant header key when provided', () async {
        Endpoint? capturedEndpoint;
        baseClient = APIClientTestDouble(
          requestCallback: (endpoint) async {
            capturedEndpoint = endpoint;
            return dummyAPIResponse();
          },
        );
        client = SaasTenantAPIClient(
          client: baseClient,
          tenantProvider: tenantProvider,
          tenantHeaderKey: 'X-Custom-Tenant-ID',
        );

        final endpoint = Endpoint(
          method: "GET",
          path: "/api/test",
          headers: {},
        );

        await client.request(endpoint);

        expect(capturedEndpoint, isNotNull);
        expect(capturedEndpoint!.headers['X-Custom-Tenant-ID'],
            equals('test-tenant-123'));
        expect(
            capturedEndpoint!.headers.containsKey('SAAS_TENANT_ENTITY_ID'),
            isFalse);
      });

      test('preserves existing headers from endpoint', () async {
        Endpoint? capturedEndpoint;
        baseClient = APIClientTestDouble(
          requestCallback: (endpoint) async {
            capturedEndpoint = endpoint;
            return dummyAPIResponse();
          },
        );
        client = SaasTenantAPIClient(
          client: baseClient,
          tenantProvider: tenantProvider,
        );

        final endpoint = Endpoint(
          method: "POST",
          path: "/api/test",
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer token123',
          },
        );

        await client.request(endpoint);

        expect(capturedEndpoint, isNotNull);
        expect(capturedEndpoint!.headers['Content-Type'],
            equals('application/json'));
        expect(capturedEndpoint!.headers['Authorization'],
            equals('Bearer token123'));
        expect(capturedEndpoint!.headers['SAAS_TENANT_ENTITY_ID'],
            equals('test-tenant-123'));
      });

      test('retrieves tenant ID from provider for each request', () async {
        final endpoint = Endpoint(
          method: "GET",
          path: "/api/test",
          headers: {},
        );

        await client.request(endpoint);
        await client.request(endpoint);
        await client.request(endpoint);

        expect(tenantProvider.getTenantIdCallCount, equals(3));
      });

      test('propagates exceptions from tenant provider', () async {
        final throwingProvider = ThrowingSaasTenantEntityIdProviderTestDouble(
          Exception('Failed to get tenant ID'),
        );
        client = SaasTenantAPIClient(
          client: baseClient,
          tenantProvider: throwingProvider,
        );

        final endpoint = Endpoint(
          method: "GET",
          path: "/api/test",
          headers: {},
        );

        expect(
          () => client.request(endpoint),
          throwsA(isA<Exception>()),
        );
      });

      test('returns response from underlying client', () async {
        final expectedResponse = dummyAPIResponse();
        baseClient = APIClientTestDouble(
          requestCallback: (endpoint) async => expectedResponse,
        );
        client = SaasTenantAPIClient(
          client: baseClient,
          tenantProvider: tenantProvider,
        );

        final endpoint = Endpoint(
          method: "GET",
          path: "/api/test",
          headers: {},
        );

        final response = await client.request(endpoint);

        expect(response, equals(expectedResponse));
      });
    });

    group('requestMultipart', () {
      test('adds tenant ID header to multipart request', () async {
        final endpoint = EndpointMultipart(
          method: "POST",
          path: "/api/upload",
          headers: {'Accept': 'application/json'},
          fields: {},
        );

        await client.requestMultipart(endpoint);

        expect(baseClient.requestMultipartCallCount, equals(1));
        expect(tenantProvider.getTenantIdCallCount, equals(1));
      });

      test('uses default tenant header key for multipart', () async {
        EndpointMultipart? capturedEndpoint;
        baseClient = APIClientTestDouble(
          requestMultipartCallback: (endpoint) async {
            capturedEndpoint = endpoint;
            return dummyAPIResponse();
          },
        );
        client = SaasTenantAPIClient(
          client: baseClient,
          tenantProvider: tenantProvider,
        );

        final endpoint = EndpointMultipart(
          method: "POST",
          path: "/api/upload",
          headers: {},
          fields: {},
        );

        await client.requestMultipart(endpoint);

        expect(capturedEndpoint, isNotNull);
        expect(capturedEndpoint!.headers['SAAS_TENANT_ENTITY_ID'],
            equals('test-tenant-123'));
      });

      test('uses custom tenant header key for multipart when provided',
          () async {
        EndpointMultipart? capturedEndpoint;
        baseClient = APIClientTestDouble(
          requestMultipartCallback: (endpoint) async {
            capturedEndpoint = endpoint;
            return dummyAPIResponse();
          },
        );
        client = SaasTenantAPIClient(
          client: baseClient,
          tenantProvider: tenantProvider,
          tenantHeaderKey: 'X-Custom-Tenant-ID',
        );

        final endpoint = EndpointMultipart(
          method: "POST",
          path: "/api/upload",
          headers: {},
          fields: {},
        );

        await client.requestMultipart(endpoint);

        expect(capturedEndpoint, isNotNull);
        expect(capturedEndpoint!.headers['X-Custom-Tenant-ID'],
            equals('test-tenant-123'));
        expect(
            capturedEndpoint!.headers.containsKey('SAAS_TENANT_ENTITY_ID'),
            isFalse);
      });

      test('preserves existing headers from multipart endpoint', () async {
        EndpointMultipart? capturedEndpoint;
        baseClient = APIClientTestDouble(
          requestMultipartCallback: (endpoint) async {
            capturedEndpoint = endpoint;
            return dummyAPIResponse();
          },
        );
        client = SaasTenantAPIClient(
          client: baseClient,
          tenantProvider: tenantProvider,
        );

        final endpoint = EndpointMultipart(
          method: "POST",
          path: "/api/upload",
          headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer token123',
          },
          fields: {},
        );

        await client.requestMultipart(endpoint);

        expect(capturedEndpoint, isNotNull);
        expect(capturedEndpoint!.headers['Accept'], equals('application/json'));
        expect(capturedEndpoint!.headers['Authorization'],
            equals('Bearer token123'));
        expect(capturedEndpoint!.headers['SAAS_TENANT_ENTITY_ID'],
            equals('test-tenant-123'));
      });

      test('retrieves tenant ID from provider for each multipart request',
          () async {
        final endpoint = EndpointMultipart(
          method: "POST",
          path: "/api/upload",
          headers: {},
          fields: {},
        );

        await client.requestMultipart(endpoint);
        await client.requestMultipart(endpoint);

        expect(tenantProvider.getTenantIdCallCount, equals(2));
      });

      test('propagates exceptions from tenant provider in multipart',
          () async {
        final throwingProvider = ThrowingSaasTenantEntityIdProviderTestDouble(
          Exception('Failed to get tenant ID'),
        );
        client = SaasTenantAPIClient(
          client: baseClient,
          tenantProvider: throwingProvider,
        );

        final endpoint = EndpointMultipart(
          method: "POST",
          path: "/api/upload",
          headers: {},
          fields: {},
        );

        expect(
          () => client.requestMultipart(endpoint),
          throwsA(isA<Exception>()),
        );
      });

      test('returns response from underlying client for multipart', () async {
        final expectedResponse = dummyAPIResponse();
        baseClient = APIClientTestDouble(
          requestMultipartCallback: (endpoint) async => expectedResponse,
        );
        client = SaasTenantAPIClient(
          client: baseClient,
          tenantProvider: tenantProvider,
        );

        final endpoint = EndpointMultipart(
          method: "POST",
          path: "/api/upload",
          headers: {},
          fields: {},
        );

        final response = await client.requestMultipart(endpoint);

        expect(response, equals(expectedResponse));
      });
    });

    group('integration scenarios', () {
      test('works with different tenant IDs from provider', () async {
        Endpoint? capturedEndpoint;
        baseClient = APIClientTestDouble(
          requestCallback: (endpoint) async {
            capturedEndpoint = endpoint;
            return dummyAPIResponse();
          },
        );

        // First client with tenant A
        final tenantA = SaasTenantEntityIdProviderTestDouble('tenant-a');
        final clientA = SaasTenantAPIClient(
          client: baseClient,
          tenantProvider: tenantA,
        );

        await clientA.request(Endpoint(
          method: "GET",
          path: "/api/test",
          headers: {},
        ));
        expect(
            capturedEndpoint!.headers['SAAS_TENANT_ENTITY_ID'], equals('tenant-a'));

        // Second client with tenant B
        final tenantB = SaasTenantEntityIdProviderTestDouble('tenant-b');
        final clientB = SaasTenantAPIClient(
          client: baseClient,
          tenantProvider: tenantB,
        );

        await clientB.request(Endpoint(
          method: "GET",
          path: "/api/test",
          headers: {},
        ));
        expect(
            capturedEndpoint!.headers['SAAS_TENANT_ENTITY_ID'], equals('tenant-b'));
      });
    });
  });
}
