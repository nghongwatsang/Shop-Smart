declare global {
    type CartItem = {
        itemName: string;
        brandName: string;
        storeName: string;
        lowestPrice: number;
        quantity: number;
    };

    type Product = {
        itemName: string;
        brandName: string;
        storeName: string;
        lowestPrice: number;
    };

    type Store = {
        id: number;
        name: string;
        logo_path: string;
        active: boolean;
    }
}

export {};