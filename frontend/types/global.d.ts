declare global {
    type CartItem = {
        name: string;
        brand: string;
        store: string;
        size: string;
        unit: string;
        price: number;
        quantity: number;
    };

    type Product = {
        name: string;
        brand: string;
        store: string;
        size: string;
        unit: string;
        price: number;
    };

    type Store = {
        id: number;
        name: string;
        logo_path: string;
        active: boolean;
    }
}

export {};