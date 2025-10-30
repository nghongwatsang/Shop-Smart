import { Card, CardContent} from "@/components/ui/card";
import Image from "next/image";

interface ProductPageProps {
  params: { query: string };
}

export default function ProductPage({ params }: ProductPageProps) {
    const { query } = params; // Access the 'query' from the URL
    {/*img, itemname, brandname, lowest_price, source*/}
    function fetchQueryResults () {
        return query == "Apples" ? 
        [
            {img:"/sample.png", itemName:"Granny Smith", brandName:"Hannaford", lowest_price:1.09, source:'hannaford'},
            {img:"/sample.png", itemName:"Granny Smith", brandName:"Hannaford", lowest_price:1.09, source:'hannaford'},
            {img:"/sample.png", itemName:"Granny Smith", brandName:"Hannaford", lowest_price:1.09, source:'hannaford'}
        ]
        :
        false;
    }
    const results = fetchQueryResults();

    const stores = [
        {name: "walmart", logo_path: "/WalmartLogo.png"},
        {name: "hannaford", logo_path: "/hannafords.svg"},
        {name: "market32", logo_path: "/Market_32.png"}
    ]

    return (
        <section className="flex flex-col items-center justify-center w-screen">
            <Card className="flex items-center justify-center w-3/5">
                <CardContent className="font-medium">Results:</CardContent>
            </Card>

            {results &&
                results.map((result,index) =>
                    <Card className="flex items-center justify-center w-3/5" key={index}>
                        <section className="flex flex-row justify-between">
                            <CardContent><Image src={`${result.img}`} alt={"Img"} width={10} height={10}/></CardContent>
                            <CardContent>{result.itemName}</CardContent>
                            <CardContent>{result.brandName}</CardContent>
                            <CardContent>${result.lowest_price}</CardContent>
                        </section>
                    </Card>
                )
            }

            {!results &&
                <div>No results found</div>
            }
        </section>
    );
}