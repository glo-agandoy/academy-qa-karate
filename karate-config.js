function fn() {
    var config = {
        urlBaseGoRest: 'https://gorest.co.in/public/v2',
        tokenGoRest: 'Bearer 91657a895133a52ce4eb4a285d29c44e938521c5ab9e3ec4be536e5205385e1f'
    };

    karate.configure('ssl', true);

    return config;
}