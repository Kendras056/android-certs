echo "PRODUCT_DEFAULT_DEV_CERTIFICATE := android-certs/releasekey" > android-certs/product.mk

croot
sign_target_files_apks -o -d android-certs/* \
    $OUT/obj/PACKAGING/target_files_intermediates/*-target_files-*.zip \
    signed-target_files.zip

ota_from_target_files -k android-certs/releasekey \
    --block --backup=true \
    signed-target_files.zip \
    signed-ota_update.zip

-include android-certs/product.mk
