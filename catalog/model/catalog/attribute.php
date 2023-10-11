<?php
class ModelCatalogAttribute extends Model {
    public function getAttributes() {
        $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "attribute_description ORDER BY name ASC");

        return $query->rows;
    }

    public function getAttribute($attribute_id) {
        $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "attribute_description WHERE attribute_id = '" . (int)$attribute_id . "'");

        return $query->row;
    }

    public function getProductByAttribute($attribute_id)
    {
        $attribute_id = (int)$attribute_id;

        $query = $this->db->query("
        SELECT *
        FROM " . DB_PREFIX . "product p
        LEFT JOIN " . DB_PREFIX . "product_attribute pa ON (p.product_id = pa.product_id)
        LEFT JOIN  oc_product_description pd ON (p.product_id = pd.product_id AND p.product_id = pa.product_id)
        WHERE pa.attribute_id = '$attribute_id' And pa.language_id = 1  
    ");

        return $query->rows;
    }

    public function getUnusedAttributes(){
        $query = $this->db->query("
        SELECT *
        FROM oc_attribute a
        LEFT JOIN oc_attribute_description ad ON (a.attribute_id = ad.attribute_id)
        WHERE ad.language_id = 1
          AND a.attribute_id NOT IN (
            SELECT pa.attribute_id
            FROM oc_product_attribute pa
            WHERE pa.language_id = 1
        ); 
    ");

        return $query->rows;
    }

}

