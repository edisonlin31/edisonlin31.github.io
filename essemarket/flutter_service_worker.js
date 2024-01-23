'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"version.json": "5d38d55025f576fbdc2f8151da82d3fd",
"index.html": "9626d5fda5abe2db49de399e255fa7ee",
"/": "9626d5fda5abe2db49de399e255fa7ee",
"main.dart.js": "6fa78e634f9316f3e8e1e4afeea1dc87",
"flutter.js": "7d69e653079438abfbb24b82a655b0a4",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "c313866a02e5c874581a9db2c8765307",
"assets/AssetManifest.json": "a20744e35963ff487b31bc9f7a176608",
"assets/NOTICES": "34383811853d924fc411cade97cfa639",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/AssetManifest.bin.json": "d86fd9ab5a52ca773c18da458d5673ed",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "89ed8f4e49bcdfc0b5bfc9b24591e347",
"assets/shaders/ink_sparkle.frag": "4096b5150bac93c41cbc9b45276bd90f",
"assets/AssetManifest.bin": "53c4dc942245da7cd7b0e6407dbc45fe",
"assets/fonts/MaterialIcons-Regular.otf": "d1834faef8eb41a8cc954a64f894a2cc",
"assets/assets/images/landing_logo.png": "4f4eb6c067e9c95a539502acebad951f",
"assets/assets/images/landing_image.png": "7de995c16bef5b3763dab412456cc8b8",
"assets/assets/images/img_news.png": "c7e7803c3f95fbe6d5152c8d950d2d91",
"assets/assets/images/img_foodcourt.png": "80e8edfee99127f5d5d0025bff181b72",
"assets/assets/images/img_banner.png": "c08425f322d9f3a2bec36faddcc5ec00",
"assets/assets/images/img_merchant.png": "0f0a4d8b18e208505472ffadbc5cbcf2",
"assets/assets/images/home_logo.png": "939c26cdb37c22518afa6a3c7996a589",
"assets/assets/images/img_pou.png": "db181242b6da5b1815833620eff1b323",
"assets/assets/images/img_outlet.png": "b2d764fd84f5005ccd3bf2f2471019cd",
"assets/assets/images/img_restaurant.png": "b0fccc6f29adda5e29779c93d601cb2f",
"assets/assets/icons/ic_map_pin.png": "6b3764a25d0aa4803ac5d1297979da57",
"assets/assets/icons/ic_search_bar_leading.png": "4dcf9970c0f375a5a25ca1630c2e3aa0",
"assets/assets/icons/tab_cart.png": "51ee7b4e0ae979607f23a98e53066a54",
"assets/assets/icons/ic_item_subtract.png": "37fcc81b8c76b8f3aba86d22aa01c913",
"assets/assets/icons/ic_take_away.png": "ad19f7ad9fccf4bcf2f376d24cbfd710",
"assets/assets/icons/ic_voucher_unselect.png": "4fffc1582248ba606d3964fc10fc3afb",
"assets/assets/icons/ic_flag_sg.png": "9a63fed50c85106958e61a770a14478a",
"assets/assets/icons/tab_home.png": "b5fae598fcf6e2926caf64037f359a4e",
"assets/assets/icons/ic_voucher.png": "dfc9ef610ae1ffa524243cbf6a47c771",
"assets/assets/icons/ic_pin_location.png": "8da094f10bee2f3ab42fe1a185e74665",
"assets/assets/icons/ic_clock.png": "3f0ab897dbe00861eeb59aaefcf2c2cd",
"assets/assets/icons/ic_item_add.png": "cc2a1876f0556ba1d84c0f2bfa26f1c0",
"assets/assets/icons/ic_dine_in.png": "8bc18cb11850571baef984d4db0eac33",
"assets/assets/icons/ic_dollar.png": "34538608ee1a9acb0a71c770ec2dd2dd",
"assets/assets/icons/ic_arrow_down.png": "28bc81fc55f6d5ed1ec1314100d225f8",
"assets/assets/icons/ic_delivery.png": "e35dbb2aa43bcd171b913bebef7bcfcf",
"assets/assets/icons/tab_bag.png": "b19476663a5f05a593a57d17489ab9c2",
"assets/assets/icons/ic_pickup_location.png": "dd6861f96aeb2e40320f12b096214177",
"assets/assets/icons/tab_account.png": "8c3dec67cc8c905eddedc679de4ab0d5",
"canvaskit/skwasm.js": "87063acf45c5e1ab9565dcf06b0c18b8",
"canvaskit/skwasm.wasm": "2fc47c0a0c3c7af8542b601634fe9674",
"canvaskit/chromium/canvaskit.js": "0ae8bbcc58155679458a0f7a00f66873",
"canvaskit/chromium/canvaskit.wasm": "143af6ff368f9cd21c863bfa4274c406",
"canvaskit/canvaskit.js": "eb8797020acdbdf96a12fb0405582c1b",
"canvaskit/canvaskit.wasm": "73584c1a3367e3eaf757647a8f5c5989",
"canvaskit/skwasm.worker.js": "bfb704a6c714a75da9ef320991e88b03"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"assets/AssetManifest.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
