json.array!(@produits) do |produit|
  json.extract! produit, :id, :nom, :description, 
  json.url produit_url(produit, format: :json)
end
