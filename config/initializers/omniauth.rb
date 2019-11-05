namespace1 = "http://schemas.xmlsoap.org/ws/2005/05/identity/claims"
namespace2 = "http://schemas.microsoft.com/identity/claims"
attributes_map = {
  uid: ["#{namespace2}/objectidentifier"],
  name: ["#{namespace2}/displayname"],
  email: ["#{namespace1}/emailaddress"]
}
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :saml,
           issuer: "test",
           assertion_consumer_service_url: "https://localhost:3000/omniauth/saml/callback",
           idp_sso_target_url: Rails.application.credentials.dig(:sso, :idp_sso_target_url),
           idp_slo_target_url: "https://login.microsoftonline.com/common/wsfederation?wa=wsignout1.0",
           attribute_statements: attributes_map,
           idp_cert: Rails.root.join("config", "test.cer").read,
           idp_cert_fingerprint: Rails.application.credentials.dig(:sso, :idp_cert_fingerprint),
           name_identifier_format: "urn:oasis:names:tc:SAML:2.0:nameid-format:transient",
           uid_attribute: attributes_map[:uid].first
end