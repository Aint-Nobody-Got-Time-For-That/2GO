# 2GO

Ain’t nobody got time to wait in line for food.

With our application, no one needs to wait in line for food by providing users can order ahead of time before picking up their order. Sellers can opt into our service, and provide a better experience for their customers.

## User Stories

- [x] Users can create a new account to sign up to be a seller
- [ ] Users can create a new account to sign up to be a buyer
- [x] Users sees an app icon in home screen and styled launch screen
- [x] Users can log in and log out of his or her account
- [x] The current signed in user is persisted across app restarts
- [x] Buyer can scroll through a list of restaurants nearby
- [x] Buyer can tap a cell to see a detail view of the restaurant and food
- [x] Buyer can put food into a cart
- [ ] Buyer can see a confirmation screen
- [x] Sellers can create menu for a business, (adding photos and text fields)
- [x] Sellers can edit their business
- [ ] Sellers can get a notification on any orders that are coming.

## Optionals

- [ ] Get resturants based on the user’s location
- [ ] Apple Pay for paying
- [ ] Email receipt when user decided to confirm on order

![](https://i.imgur.com/UZl6kS5.gifv)

## Data Model

| Buyer            |               |
| -----------------|:-------------:|
| First Name       | String        |
| Last Name        | String        |
| Buyer ID         | Int           |
| Cart             | [MenuItem]    |

| Seller           |               |
| -----------------|:-------------:|
| First Name       | String        |
| Last Name        | String        |
| Seller ID        | Int           |
| ID Resturant(s)  | [Int]         |

| Restaurant       |               |
| -----------------|:-------------:|
| ID               | Int           |
| Name             | String        |
| Photo (URL)      | [String]      |
| Category         | [String]      |
| Address          | String        |
| Latitude         | Double        |
| Longitude        | Double        |
| Phone Number     | String        |
| Menu             | [MenuItem]    |

| MenuItem         |               |
| -----------------|:-------------:|
| ID               | Int           |
| Rating           | Double        |
| Photo (URL)      | [String]      |
| Description      | String        |
| Allegeries       | String        |
| Reviews          | [String]      |
