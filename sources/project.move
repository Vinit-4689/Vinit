module MyModule::RentalPlatform {

    use aptos_framework::signer;
    use aptos_framework::coin;
    use aptos_framework::aptos_coin::AptosCoin;

    /// Struct representing a rental agreement
    struct RentalAgreement has store, key {
        tool_owner: address,
        renter: address,
        rental_period: u64,  // Period in seconds
        rental_price: u64,   // Price in coins
        is_active: bool,     // Flag to check if the agreement is active
    }

    /// Function for tool owners to offer a tool for rent
    public fun offer_for_rent(owner: &signer, renter_address: address, rental_period: u64, rental_price: u64) {
        let agreement = RentalAgreement {
            tool_owner: signer::address_of(owner),
            renter: renter_address,
            rental_period,
            rental_price,
            is_active: true,
        };
        move_to(owner, agreement);
    }


}
