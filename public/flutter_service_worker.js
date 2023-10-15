'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/asset/icons/icon-alcohol.png": "1d989c4d24b0e6d6718837aa33ad3c51",
"assets/asset/icons/icon-beverage.png": "7ba7106d9e2ea192ceeed6cbbdc02805",
"assets/asset/icons/icon-burger.png": "cb6f0b63a661cb0b45c483a11c0b4ab8",
"assets/asset/icons/icon-desserts.png": "46d9c0bbc9c6961d4fde68821fa5d133",
"assets/asset/icons/icon-drinks.png": "f12f2780595ba57fa1434ddcbb627e32",
"assets/asset/icons/icon-ice-cream.png": "b1491d4c65cbc25bf2fbc195ede4ff61",
"assets/asset/icons/icon-noodles.png": "02ddee28a5c01f83bab075015e48a15b",
"assets/asset/icons/icon-snack.png": "108236ab0d5538922e61aba0ecd2b14b",
"assets/asset/items/1.png": "a7991fc43be6e3c997636d5a988b857d",
"assets/asset/items/10.png": "a23c3289779589eaf6affdf6ed461137",
"assets/asset/items/11.png": "5c3a3b0765b182966faf6c82f65e0f38",
"assets/asset/items/12.png": "d7479f4162c17a1c36155bebe72895da",
"assets/asset/items/2.png": "de1e202a53ec0e2fb89d1ea642b5860d",
"assets/asset/items/3.png": "7eaf615cc969ecec8976c69ec85df793",
"assets/asset/items/4.png": "ff7c308897b5735cbf70700e8767e981",
"assets/asset/items/5.png": "a0e2c09c24dac4972f9b9bdf52e8e3bc",
"assets/asset/items/6.png": "20e6ca8c3583ea02da7478982dd55901",
"assets/asset/items/7.png": "fbfc6691e85152afccdc1260bd0d507d",
"assets/asset/items/8.png": "976db3d9db59ae6ee07ac5eb2498ce72",
"assets/asset/items/9.png": "774e60358d3479a686e9ed6ae41c8476",
"assets/asset/items/ABC.png": "e6732160751ee2cdbd8c133e87f092d4",
"assets/asset/items/anchor.png": "5a198ff4eb1c048e686852746ac4bd05",
"assets/asset/items/anchor_strong.png": "0d64d53e133e1466a23f5a9f92dbfac6",
"assets/asset/items/bento.jpg": "ffd64cc9568102cc33fc3765b923b4a2",
"assets/asset/items/budweiser.jpg": "ef6ce07fdd7b21fa557bffdf0ff9e4f5",
"assets/asset/items/coke.jpeg": "95ec50a92e961b8daf8201e93a290864",
"assets/asset/items/dasani.jpeg": "8c8b5bc7e7844cc8e3da678461ec36a4",
"assets/asset/items/hanami.jpeg": "45592dbc4da3139ca149892f20455700",
"assets/asset/items/ice-cream_chocolate.jpg": "247f0c849248c71ccab65fc9a37f6ff4",
"assets/asset/items/ice-cream_rainbow.jpg": "732fc211bf38e711f28df4a9a9f9b6bb",
"assets/asset/items/ice-cream_setec.jpg": "25b32e494356763cb9f20c84cb2c978a",
"assets/asset/items/ice-cream_strawberry.jpg": "873e3fa7087846b2d53c5baf8df8176b",
"assets/asset/items/ice-cream_vanilla.jpg": "148d626372e778c595f7db7953fb4e97",
"assets/asset/items/jinro-strawberry.jpg": "879fd2e7e1d933859c6b229590d1f0bd",
"assets/asset/items/mee-krob.jpeg": "c39d3196afa5898680003258c03fd951",
"assets/asset/items/oishi-lemon.webp": "9c986468f76f2263b62c61d586b49faf",
"assets/asset/items/oishi.png": "eb18f696ef8b0411da2569e525217bf7",
"assets/asset/items/pepsi-zero-sugar.webp": "ad5bbe4f197143c574fd0f24e9e76ecf",
"assets/asset/items/pepsi.webp": "17a7a2fdb9b9538b2e6d0c23bd5897ce",
"assets/asset/items/potato-chips.jpg": "c6de0d9dd665a65f646e745f2863015a",
"assets/asset/items/seaweed.jpg": "4286bb4f0d44ebc6768e5d2de8a7e95d",
"assets/asset/items/singha.jpg": "9697f489c8734f5e91272013bba292ae",
"assets/asset/items/stick-thai.jpg": "d9413543b22fd749ac225f95c78e2692",
"assets/asset/items/sting.jpg": "cd628287a104c37c8b48455302ce9792",
"assets/asset/items/tiger-soju.jpg": "e8fdf7503cde9dd1bffabbd504730fbe",
"assets/asset/items/vital.webp": "d76e887b96fed2b69085af9e348c00fe",
"assets/asset/items/Yakult.png": "79f5aa59ca4351f1c5dfd002aee554c2",
"assets/asset/items/yogurt.png": "75bf7ed9a61d905b26de3c6ea72ce015",
"assets/asset/setec.png": "b037b5d234a22916b23b76fd18e9b16e",
"assets/AssetManifest.bin": "fa8840bab445717db734cecd6b3b5263",
"assets/AssetManifest.json": "5b6d81bfe789b2b9b9151300aa78cea7",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/fonts/MaterialIcons-Regular.otf": "ce75fc8c350a22fed723ea37a8402450",
"assets/NOTICES": "dd09d0c7cef79460553d503136691535",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "38f38fbab4fc86e9f7828c4b8efe0c3f",
"assets/shaders/ink_sparkle.frag": "f8b80e740d33eb157090be4e995febdf",
"canvaskit/canvaskit.js": "5caccb235fad20e9b72ea6da5a0094e6",
"canvaskit/canvaskit.wasm": "d9f69e0f428f695dc3d66b3a83a4aa8e",
"canvaskit/chromium/canvaskit.js": "ffb2bb6484d5689d91f393b60664d530",
"canvaskit/chromium/canvaskit.wasm": "393ec8fb05d94036734f8104fa550a67",
"canvaskit/skwasm.js": "95f16c6690f955a45b2317496983dbe9",
"canvaskit/skwasm.wasm": "d1fde2560be92c0b07ad9cf9acb10d05",
"canvaskit/skwasm.worker.js": "51253d3321b11ddb8d73fa8aa87d3b15",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "6b515e434cea20006b3ef1726d2c8894",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "ce3aa07f523f52f800ad292782b7d17e",
"/": "ce3aa07f523f52f800ad292782b7d17e",
"main.dart.js": "92d4b3f6db1d6879b197f33835f02858",
"manifest.json": "d28484da0e1bf5c61209d53a11fe9ef4",
"version.json": "bcb802c11bcddc06d75f420392c8593f"};
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
