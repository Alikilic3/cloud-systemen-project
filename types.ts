import { ObjectId } from "mongodb";

export interface Manufacturer {
  id: string;
  name: string;
  country: string;
  foundedYear: number;
  isActive: boolean;
  logoUrl: string;
}

export interface Motorcycle {
  id: string;
  name: string;
  description: string;
  engineCapacity: number;
  isAvailable: boolean;
  releaseDate: string;
  imageUrl: string;
  category: "Naked" | "Sport" | "Adventure" | "Cruiser";
  features: string[];
  manufacturer: Manufacturer;
}

export interface User {
  // w<e gebruiken een ? omdat we zelf nooit een id invullen want MongoDB doet dat voor ons.
  _id?: ObjectId;
  email: string;
  password?: string;
  role: "ADMIN" | "USER";
}
