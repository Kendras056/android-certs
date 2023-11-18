echo "PRODUCT_DEFAULT_DEV_CERTIFICATE := android-certs/releasekey" > android-certs/product.mk

ota_from_target_files -k android-certs/releasekey \
    --block --backup=true \
    signed-target_files.zip \
    signed-ota_update.zip
