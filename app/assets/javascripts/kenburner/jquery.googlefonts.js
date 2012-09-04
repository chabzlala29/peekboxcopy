;
(function (window, document, undefined) {
    function i(a) {
        return function () {
            return this[a]
        }
    }
    var j;

    function n(a, b) {
        var c = arguments.length > 2 ? Array.prototype.slice.call(arguments, 2) : [];
        return function () {
            c.push.apply(c, arguments);
            return b.apply(a, c)
        }
    };

    function o(a, b) {
        this.K = a;
        this.c = b
    }
    o.prototype.createElement = function (a, b, c) {
        a = this.K.createElement(a);
        if (b) for (var d in b) if (b.hasOwnProperty(d)) d == "style" ? q(this, a, b[d]) : a.setAttribute(d, b[d]);
        c && a.appendChild(this.K.createTextNode(c));
        return a
    };

    function r(a, b, c) {
        a = a.K.getElementsByTagName(b)[0];
        if (!a) a = document.documentElement;
        if (a && a.lastChild) {
            a.insertBefore(c, a.lastChild);
            return true
        }
        return false
    }
    function aa(a, b) {
        function c() {
            document.body ? b() : setTimeout(c, 0)
        }
        c()
    }

    function s(a, b) {
        if (b.parentNode) {
            b.parentNode.removeChild(b);
            return true
        }
        return false
    }
    function t(a, b) {
        return a.createElement("link", {
            rel: "stylesheet",
            href: b
        })
    }
    function u(a, b) {
        return a.createElement("script", {
            src: b
        })
    }
    function v(a, b, c) {
        a = b.className.split(/\s+/);
        for (var d = 0, e = a.length; d < e; d++) if (a[d] == c) return;
        a.push(c);
        b.className = a.join(" ").replace(/^\s+/, "")
    }

    function w(a, b, c) {
        a = b.className.split(/\s+/);
        for (var d = [], e = 0, f = a.length; e < f; e++) a[e] != c && d.push(a[e]);
        b.className = d.join(" ").replace(/^\s+/, "").replace(/\s+$/, "")
    }
    function x(a, b, c) {
        a = b.className.split(/\s+/);
        b = 0;
        for (var d = a.length; b < d; b++) if (a[b] == c) return true;
        return false
    }
    function q(a, b, c) {
        if (a.c.getName() == "MSIE") b.style.cssText = c;
        else b.setAttribute("style", c)
    };

    function y(a, b, c, d, e, f, g, h) {
        this.Ba = a;
        this.Ha = b;
        this.oa = c;
        this.na = d;
        this.Ea = e;
        this.Da = f;
        this.ma = g;
        this.Ia = h
    }
    j = y.prototype;
    j.getName = i("Ba");
    j.xa = i("Ha");
    j.Y = i("oa");
    j.ua = i("na");
    j.va = i("Ea");
    j.wa = i("Da");
    j.ta = i("ma");
    j.w = i("Ia");

    function z(a, b) {
        this.c = a;
        this.k = b
    }
    var ba = new y("Unknown", "Unknown", "Unknown", "Unknown", "Unknown", "Unknown", undefined, false);
    z.prototype.parse = function () {
        return this.c.indexOf("MSIE") != -1 ? ca(this) : this.c.indexOf("Opera") != -1 ? da(this) : this.c.indexOf("AppleWebKit") != -1 ? ea(this) : this.c.indexOf("Gecko") != -1 ? fa(this) : ba
    };

    function A(a) {
        var b = C(a, a.c, /(iPod|iPad|iPhone|Android)/, 1);
        if (b != "") return b;
        a = C(a, a.c, /(Linux|Mac_PowerPC|Macintosh|Windows)/, 1);
        if (a != "") {
            if (a == "Mac_PowerPC") a = "Macintosh";
            return a
        }
        return "Unknown"
    }
    function D(a) {
        var b = C(a, a.c, /(OS X|Windows NT|Android) ([^;)]+)/, 2);
        if (b) return b;
        if (b = C(a, a.c, /(iPhone )?OS ([\d_]+)/, 2)) return b;
        if (a = C(a, a.c, /Linux ([i\d]+)/, 1)) return a;
        return "Unknown"
    }

    function ca(a) {
        var b = C(a, a.c, /(MSIE [\d\w\.]+)/, 1);
        if (b != "") {
            var c = b.split(" ");
            b = c[0];
            c = c[1];
            return new y(b, c, b, c, A(a), D(a), E(a, a.k), F(a, c) >= 6)
        }
        return new y("MSIE", "Unknown", "MSIE", "Unknown", A(a), D(a), E(a, a.k), false)
    }

    function da(a) {
        var b = "Unknown",
            c = "Unknown",
            d = C(a, a.c, /(Presto\/[\d\w\.]+)/, 1);
        if (d != "") {
            c = d.split("/");
            b = c[0];
            c = c[1]
        } else {
            if (a.c.indexOf("Gecko") != -1) b = "Gecko";
            d = C(a, a.c, /rv:([^\)]+)/, 1);
            if (d != "") c = d
        }
        if (a.c.indexOf("Version/") != -1) {
            d = C(a, a.c, /Version\/([\d\.]+)/, 1);
            if (d != "") return new y("Opera", d, b, c, A(a), D(a), E(a, a.k), F(a, d) >= 10)
        }
        d = C(a, a.c, /Opera[\/ ]([\d\.]+)/, 1);
        if (d != "") return new y("Opera", d, b, c, A(a), D(a), E(a, a.k), F(a, d) >= 10);
        return new y("Opera", "Unknown", b, c, A(a), D(a), E(a, a.k), false)
    }

    function ea(a) {
        var b = A(a),
            c = D(a),
            d = C(a, a.c, /AppleWebKit\/([\d\.\+]+)/, 1);
        if (d == "") d = "Unknown";
        var e = "Unknown";
        if (a.c.indexOf("Chrome") != -1 || a.c.indexOf("CrMo") != -1) e = "Chrome";
        else if (a.c.indexOf("Safari") != -1) e = "Safari";
        else if (a.c.indexOf("AdobeAIR") != -1) e = "AdobeAIR";
        var f = "Unknown";
        if (a.c.indexOf("Version/") != -1) f = C(a, a.c, /Version\/([\d\.\w]+)/, 1);
        else if (e == "Chrome") f = C(a, a.c, /(Chrome|CrMo)\/([\d\.]+)/, 2);
        else if (e == "AdobeAIR") f = C(a, a.c, /AdobeAIR\/([\d\.]+)/, 1);
        var g = false;
        if (e == "AdobeAIR") {
            g = C(a, f, /\d+\.(\d+)/, 1);
            g = F(a, f) > 2 || F(a, f) == 2 && parseInt(g, 10) >= 5
        } else {
            g = C(a, d, /\d+\.(\d+)/, 1);
            g = F(a, d) >= 526 || F(a, d) >= 525 && parseInt(g, 10) >= 13
        }
        return new y(e, f, "AppleWebKit", d, b, c, E(a, a.k), g)
    }

    function fa(a) {
        var b = "Unknown",
            c = "Unknown",
            d = false;
        if (a.c.indexOf("Firefox") != -1) {
            b = "Firefox";
            var e = C(a, a.c, /Firefox\/([\d\w\.]+)/, 1);
            if (e != "") {
                d = C(a, e, /\d+\.(\d+)/, 1);
                c = e;
                d = e != "" && F(a, e) >= 3 && parseInt(d, 10) >= 5
            }
        } else if (a.c.indexOf("Mozilla") != -1) b = "Mozilla";
        e = C(a, a.c, /rv:([^\)]+)/, 1);
        if (e == "") e = "Unknown";
        else if (!d) {
            d = F(a, e);
            var f = parseInt(C(a, e, /\d+\.(\d+)/, 1), 10),
                g = parseInt(C(a, e, /\d+\.\d+\.(\d+)/, 1), 10);
            d = d > 1 || d == 1 && f > 9 || d == 1 && f == 9 && g >= 2 || e.match(/1\.9\.1b[123]/) != null || e.match(/1\.9\.1\.[\d\.]+/) != null
        }
        return new y(b, c, "Gecko", e, A(a), D(a), E(a, a.k), d)
    }
    function F(a, b) {
        a = C(a, b, /(\d+)/, 1);
        if (a != "") return parseInt(a, 10);
        return -1
    }
    function C(a, b, c, d) {
        if ((a = b.match(c)) && a[d]) return a[d];
        return ""
    }
    function E(a, b) {
        if (b.documentMode) return b.documentMode
    };

    function ga(a, b, c, d) {
        this.a = a;
        this.g = b;
        this.U = c;
        this.j = d || ha;
        this.h = new G("-")
    }
    var ha = "wf";

    function H(a) {
        v(a.a, a.g, a.h.e(a.j, "loading"));
        I(a, "loading")
    }
    function J(a) {
        w(a.a, a.g, a.h.e(a.j, "loading"));
        x(a.a, a.g, a.h.e(a.j, "active")) || v(a.a, a.g, a.h.e(a.j, "inactive"));
        I(a, "inactive")
    }
    function ia(a) {
        w(a.a, a.g, a.h.e(a.j, "loading"));
        w(a.a, a.g, a.h.e(a.j, "inactive"));
        v(a.a, a.g, a.h.e(a.j, "active"));
        I(a, "active")
    }
    function I(a, b, c, d) {
        a.U[b] && a.U[b](c, d)
    };

    function ja() {
        this.fa = {}
    }
    function ka(a, b) {
        var c = [];
        for (var d in b) if (b.hasOwnProperty(d)) {
            var e = a.fa[d];
            e && c.push(e(b[d]))
        }
        return c
    };

    function L(a, b, c, d, e) {
        this.a = a;
        this.A = b;
        this.n = c;
        this.u = d;
        this.D = e;
        this.V = 0;
        this.ja = this.ea = false
    }
    L.prototype.watch = function (a, b, c, d, e) {
        for (var f = a.length, g = 0; g < f; g++) {
            var h = a[g];
            b[h] || (b[h] = ["n4"]);
            this.V += b[h].length
        }
        if (e) this.ea = e;
        for (g = 0; g < f; g++) {
            h = a[g];
            e = b[h];
            for (var l = c[h], k = 0, m = e.length; k < m; k++) {
                var B = e[k],
                    p = this.A,
                    K = h;
                v(p.a, p.g, p.h.e(p.j, K, B, "loading"));
                I(p, "fontloading", K, B);
                p = n(this, this.qa);
                K = n(this, this.ra);
                (new d(p, K, this.a, this.n, this.u, this.D, h, B, l)).start()
            }
        }
    };
    L.prototype.qa = function (a, b) {
        var c = this.A;
        w(c.a, c.g, c.h.e(c.j, a, b, "loading"));
        w(c.a, c.g, c.h.e(c.j, a, b, "inactive"));
        v(c.a, c.g, c.h.e(c.j, a, b, "active"));
        I(c, "fontactive", a, b);
        this.ja = true;
        M(this)
    };
    L.prototype.ra = function (a, b) {
        var c = this.A;
        w(c.a, c.g, c.h.e(c.j, a, b, "loading"));
        x(c.a, c.g, c.h.e(c.j, a, b, "active")) || v(c.a, c.g, c.h.e(c.j, a, b, "inactive"));
        I(c, "fontinactive", a, b);
        M(this)
    };

    function M(a) {
        if (--a.V == 0 && a.ea) a.ja ? ia(a.A) : J(a.A)
    };

    function N(a, b, c, d, e, f, g, h, l) {
        this.H = a;
        this.$ = b;
        this.a = c;
        this.n = d;
        this.u = e;
        this.D = f;
        this.Aa = new la;
        this.v = new O;
        this.L = g;
        this.B = h;
        this.sa = l || ma;
        this.O = na(this, oa);
        this.P = na(this, pa);
        this.ca = this.O;
        this.da = this.P;
        this.Q = P(this, oa);
        this.R = P(this, pa)
    }
    var oa = "arial,'URW Gothic L',sans-serif",
        pa = "Georgia,'Century Schoolbook L',serif",
        ma = "BESbswy";
    N.prototype.start = function () {
        this.ia = this.D();
        this.J()
    };
    N.prototype.J = function () {
        var a = this.n.p(this.Q),
            b = this.n.p(this.R);
        if ((this.O != a || this.P != b) && this.ca == a && this.da == b) Q(this, this.H);
        else if (this.D() - this.ia >= 5E3) Q(this, this.$);
        else {
            this.ca = a;
            this.da = b;
            qa(this)
        }
    };

    function qa(a) {
        a.u(function (b, c) {
            return function () {
                c.call(b)
            }
        }(a, a.J), 25)
    }
    function Q(a, b) {
        s(a.a, a.Q);
        s(a.a, a.R);
        b(a.L, a.B)
    }
    function na(a, b) {
        b = P(a, b, true);
        var c = a.n.p(b);
        s(a.a, b);
        return c
    }
    function P(a, b, c) {
        b = a.a.createElement("span", {
            style: R(a, b, a.B, c)
        }, a.sa);
        r(a.a, "body", b);
        return b
    }

    function R(a, b, c, d) {
        c = a.v.expand(c);
        return "position:absolute;top:-999px;left:-999px;font-size:300px;width:auto;height:auto;line-height:normal;margin:0;padding:0;font-variant:normal;font-family:" + (d ? "" : a.Aa.quote(a.L) + ",") + b + ";" + c
    };

    function S(a, b, c, d, e) {
        this.a = a;
        this.X = b;
        this.g = c;
        this.u = d;
        this.c = e;
        this.M = this.N = 0
    }
    S.prototype.q = function (a, b) {
        this.X.fa[a] = b
    };
    S.prototype.load = function (a) {
        var b = new ga(this.a, this.g, a);
        this.c.w() ? ra(this, b, a) : J(b)
    };
    S.prototype.ya = function (a, b, c, d) {
        var e = a.Z ? a.Z() : N;
        if (d) a.load(n(this, this.Ca, b, c, e));
        else {
            a = --this.N == 0;
            this.M--;
            if (a) this.M == 0 ? J(b) : H(b);
            c.watch([], {}, {}, e, a)
        }
    };
    S.prototype.Ca = function (a, b, c, d, e, f) {
        var g = --this.N == 0;
        g && H(a);
        this.u(n(this, function (h, l, k, m, B, p) {
            h.watch(l, k || {}, m || {}, B, p)
        }, b, d, e, f, c, g))
    };

    function ra(a, b, c) {
        c = ka(a.X, c);
        a.M = a.N = c.length;
        for (var d = new L(a.a, b, {
            p: function (h) {
                return h.offsetWidth
            }
        }, a.u, function () {
            return (new Date).getTime()
        }), e = 0, f = c.length; e < f; e++) {
            var g = c[e];
            g.z(a.c, n(a, a.ya, g, b, d))
        }
    };

    function G(a) {
        this.za = a || sa
    }
    var sa = "-";
    G.prototype.e = function () {
        for (var a = [], b = 0; b < arguments.length; b++) a.push(arguments[b].replace(/[\W_]+/g, "").toLowerCase());
        return a.join(this.za)
    };

    function la() {
        this.ha = "'"
    }
    la.prototype.quote = function (a) {
        var b = [];
        a = a.split(/,\s*/);
        for (var c = 0; c < a.length; c++) {
            var d = a[c].replace(/['"]/g, "");
            d.indexOf(" ") == -1 ? b.push(d) : b.push(this.ha + d + this.ha)
        }
        return b.join(",")
    };

    function O() {
        this.G = ta;
        this.o = ua
    }
    var ta = ["font-style", "font-weight"],
        ua = {
            "font-style": [
                ["n", "normal"],
                ["i", "italic"],
                ["o", "oblique"]
            ],
            "font-weight": [
                ["1", "100"],
                ["2", "200"],
                ["3", "300"],
                ["4", "400"],
                ["5", "500"],
                ["6", "600"],
                ["7", "700"],
                ["8", "800"],
                ["9", "900"],
                ["4", "normal"],
                ["7", "bold"]
            ]
        };

    function T(a, b, c) {
        this.aa = a;
        this.Fa = b;
        this.o = c
    }
    T.prototype.compact = function (a, b) {
        for (var c = 0; c < this.o.length; c++) if (b == this.o[c][1]) {
            a[this.aa] = this.o[c][0];
            return
        }
    };
    T.prototype.expand = function (a, b) {
        for (var c = 0; c < this.o.length; c++) if (b == this.o[c][0]) {
            a[this.aa] = this.Fa + ":" + this.o[c][1];
            return
        }
    };
    O.prototype.compact = function (a) {
        var b = ["n", "4"];
        a = a.split(";");
        for (var c = 0, d = a.length; c < d; c++) {
            var e = a[c].replace(/\s+/g, "").split(":");
            if (e.length == 2) {
                var f = e[1];
                a: {
                    e = e[0];
                    for (var g = 0; g < this.G.length; g++) if (e == this.G[g]) {
                        e = new T(g, e, this.o[e]);
                        break a
                    }
                    e = null
                }
                e && e.compact(b, f)
            }
        }
        return b.join("")
    };
    O.prototype.expand = function (a) {
        if (a.length != 2) return null;
        for (var b = [null, null], c = 0, d = this.G.length; c < d; c++) {
            var e = this.G[c],
                f = a.substr(c, 1);
            (new T(c, e, this.o[e])).expand(b, f)
        }
        return b[0] && b[1] ? b.join(";") + ";" : null
    };
    window.WebFont = function () {
        var a = (new z(navigator.userAgent, document)).parse();
        return new S(new o(document, a), new ja, document.documentElement, function (b, c) {
            setTimeout(b, c)
        }, a)
    }();
    window.WebFont.load = window.WebFont.load;
    window.WebFont.addModule = window.WebFont.q;
    y.prototype.getName = y.prototype.getName;
    y.prototype.getVersion = y.prototype.xa;
    y.prototype.getEngine = y.prototype.Y;
    y.prototype.getEngineVersion = y.prototype.ua;
    y.prototype.getPlatform = y.prototype.va;
    y.prototype.getPlatformVersion = y.prototype.wa;
    y.prototype.getDocumentMode = y.prototype.ta;
    y.prototype.isSupportingWebFont = y.prototype.w;

    function U(a, b) {
        this.a = a;
        this.d = b
    }
    var va = {
        regular: "n4",
        bold: "n7",
        italic: "i4",
        bolditalic: "i7",
        r: "n4",
        b: "n7",
        i: "i4",
        bi: "i7"
    };
    U.prototype.z = function (a, b) {
        return b(a.w())
    };
    U.prototype.load = function (a) {
        r(this.a, "head", t(this.a, ("https:" == document.location.protocol ? "https:" : "http:") + "//webfonts.fontslive.com/css/" + this.d.key + ".css"));
        var b;
        b = this.d.families;
        var c, d, e;
        c = [];
        d = {};
        for (var f = 0, g = b.length; f < g; f++) {
            e = void 0;
            var h = void 0;
            h = void 0;
            h = b[f].split(":");
            e = h[0];
            h = h[1] ? wa(this, h[1]) : ["n4"];
            e = {
                W: e,
                T: h
            };
            c.push(e.W);
            d[e.W] = e.T
        }
        b = {
            pa: c,
            T: d
        };
        a(b.pa, b.T)
    };

    function wa(a, b) {
        a = b.split(",");
        b = [];
        for (var c = 0, d = a.length; c < d; c++) {
            var e = a[c];
            if (e) {
                var f = va[e];
                b.push(f ? f : e)
            }
        }
        return b
    }
    window.WebFont.q("ascender", function (a) {
        var b = (new z(navigator.userAgent, document)).parse();
        return new U(new o(document, b), a)
    });

    function V(a, b, c, d, e, f, g, h, l) {
        V.Ga.call(this, a, b, c, d, e, f, g, h, l);
        a = ["Times New Roman", "Lucida Sans Unicode", "Courier New", "Tahoma", "Arial", "Microsoft Sans Serif", "Times", "Lucida Console", "Sans", "Serif", "Monospace"];
        b = a.length;
        c = {};
        d = P(this, a[0], true);
        c[this.n.p(d)] = true;
        for (e = 1; e < b; e++) {
            f = a[e];
            q(this.a, d, R(this, f, this.B, true));
            c[this.n.p(d)] = true;
            if (this.B[1] != "4") {
                q(this.a, d, R(this, f, this.B[0] + "4", true));
                c[this.n.p(d)] = true
            }
        }
        s(this.a, d);
        this.t = c;
        this.la = false
    }(function (a, b) {
        function c() {}
        c.prototype = a.prototype;
        b.prototype = new c;
        b.Ga = a;
        b.Ja = a.prototype
    })(N, V);
    var xa = {
        Arimo: true,
        Cousine: true,
        Tinos: true
    };
    V.prototype.J = function () {
        var a = this.n.p(this.Q),
            b = this.n.p(this.R);
        if (!this.la && a == b && this.t[a]) {
            this.t = {};
            this.la = this.t[a] = true
        }
        if ((this.O != a || this.P != b) && !this.t[a] && !this.t[b]) Q(this, this.H);
        else if (this.D() - this.ia >= 5E3) this.t[a] && this.t[b] && xa[this.L] ? Q(this, this.H) : Q(this, this.$);
        else qa(this)
    };

    function ya(a) {
        this.I = a ? a : ("https:" == window.location.protocol ? "https:" : "http:") + za;
        this.f = [];
        this.S = []
    }
    var za = "//fonts.googleapis.com/css";
    ya.prototype.e = function () {
        if (this.f.length == 0) throw new Error("No fonts to load !");
        if (this.I.indexOf("kit=") != -1) return this.I;
        for (var a = this.f.length, b = [], c = 0; c < a; c++) b.push(this.f[c].replace(/ /g, "+"));
        a = this.I + "?family=" + b.join("%7C");
        if (this.S.length > 0) a += "&subset=" + this.S.join(",");
        return a
    };

    function Aa(a) {
        this.f = a;
        this.ga = [];
        this.ka = {};
        this.F = {};
        this.v = new O
    }
    var Ba = {
        ultralight: "n2",
        light: "n3",
        regular: "n4",
        bold: "n7",
        italic: "i4",
        bolditalic: "i7",
        ul: "n2",
        l: "n3",
        r: "n4",
        b: "n7",
        i: "i4",
        bi: "i7"
    },
        Ca = {
            latin: ma,
            cyrillic: "&#1081;&#1103;&#1046;",
            greek: "&#945;&#946;&#931;",
            khmer: "&#x1780;&#x1781;&#x1782;",
            Hanuman: "&#x1780;&#x1781;&#x1782;"
        };
    Aa.prototype.parse = function () {
        for (var a = this.f.length, b = 0; b < a; b++) {
            var c = this.f[b].split(":"),
                d = c[0],
                e = ["n4"];
            if (c.length >= 2) {
                var f = c[1],
                    g = [];
                if (f) {
                    f = f.split(",");
                    for (var h = f.length, l = 0; l < h; l++) {
                        var k;
                        k = f[l];
                        if (k.match(/^[\w ]+$/)) {
                            var m = Ba[k];
                            if (m) k = m;
                            else {
                                m = k.match(/^(\d*)(\w*)$/);
                                k = m[1];
                                m = m[2];
                                k = (k = this.v.expand([m ? m : "n", k ? k.substr(0, 1) : "4"].join(""))) ? this.v.compact(k) : null
                            }
                        } else k = "";
                        k && g.push(k)
                    }
                }
                if (g.length > 0) e = g;
                if (c.length == 3) {
                    c = c[2];
                    g = [];
                    c = c ? c.split(",") : g;
                    if (c.length > 0) if (c = Ca[c[0]]) this.F[d] = c
                }
            }
            if (!this.F[d]) if (c = Ca[d]) this.F[d] = c;
            this.ga.push(d);
            this.ka[d] = e
        }
    };

    function W(a, b, c) {
        this.c = a;
        this.a = b;
        this.d = c
    }
    W.prototype.z = function (a, b) {
        b(a.w())
    };
    W.prototype.Z = function () {
        if (this.c.Y() == "AppleWebKit") return V;
        return N
    };
    W.prototype.load = function (a) {
        var b = this.a;
        this.c.getName() == "MSIE" && this.d.blocking != true ? aa(b, n(this, this.ba, a)) : this.ba(a)
    };
    W.prototype.ba = function (a) {
        for (var b = this.a, c = new ya(this.d.api), d = this.d.families, e = d.length, f = 0; f < e; f++) {
            var g = d[f].split(":");
            g.length == 3 && c.S.push(g.pop());
            c.f.push(g.join(":"))
        }
        d = new Aa(d);
        d.parse();
        r(b, "head", t(b, c.e()));
        a(d.ga, d.ka, d.F)
    };
    window.WebFont.q("google", function (a) {
        var b = (new z(navigator.userAgent, document)).parse();
        return new W(b, new o(document, b), a)
    });

    function X(a, b) {
        this.a = a;
        this.d = b
    }
    X.prototype.load = function (a) {
        for (var b = this.d.urls || [], c = this.d.families || [], d = 0, e = b.length; d < e; d++) r(this.a, "head", t(this.a, b[d]));
        a(c)
    };
    X.prototype.z = function (a, b) {
        return b(a.w())
    };
    window.WebFont.q("custom", function (a) {
        var b = (new z(navigator.userAgent, document)).parse();
        return new X(new o(document, b), a)
    });

    function Y(a, b, c) {
        this.m = a;
        this.a = b;
        this.d = c;
        this.f = [];
        this.s = {};
        this.v = new O
    }
    Y.prototype.C = function (a) {
        return ("https:" == this.m.location.protocol ? "https:" : "http:") + (this.d.api || "//f.fontdeck.com/s/css/js/") + this.m.document.location.hostname + "/" + a + ".js"
    };
    Y.prototype.z = function (a, b) {
        a = this.d.id;
        var c = this;
        if (a) {
            this.m.__webfontfontdeckmodule__ || (this.m.__webfontfontdeckmodule__ = {});
            this.m.__webfontfontdeckmodule__[a] = function (d, e) {
                for (var f = 0, g = e.fonts.length; f < g; ++f) {
                    var h = e.fonts[f];
                    c.f.push(h.name);
                    c.s[h.name] = [c.v.compact("font-weight:" + h.weight + ";font-style:" + h.style)]
                }
                b(d)
            };
            r(this.a, "head", u(this.a, this.C(a)))
        } else b(true)
    };
    Y.prototype.load = function (a) {
        a(this.f, this.s)
    };
    window.WebFont.q("fontdeck", function (a) {
        var b = (new z(navigator.userAgent, document)).parse();
        return new Y(window, new o(document, b), a)
    });

    function Z(a, b, c, d, e) {
        this.m = a;
        this.c = b;
        this.a = c;
        this.k = d;
        this.d = e;
        this.f = [];
        this.s = {}
    }
    Z.prototype.z = function (a, b) {
        var c = this,
            d = c.d.projectId;
        if (d) {
            var e = u(c.a, c.C(d));
            e.id = "__MonotypeAPIScript__" + d;
            e.onreadystatechange = function (f) {
                if (e.readyState === "loaded" || e.readyState === "complete") {
                    e.onreadystatechange = null;
                    e.onload(f)
                }
            };
            e.onload = function () {
                if (c.m["__mti_fntLst" + d]) {
                    var f = c.m["__mti_fntLst" + d]();
                    if (f && f.length) {
                        var g;
                        for (g = 0; g < f.length; g++) c.f.push(f[g].fontfamily)
                    }
                }
                b(a.w())
            };
            r(this.a, "head", e)
        } else b(true)
    };
    Z.prototype.C = function (a) {
        var b = this.protocol(),
            c = (this.d.api || "fast.fonts.com/jsapi").replace(/^.*http(s?):(\/\/)?/, "");
        return b + "//" + c + "/" + a + ".js"
    };
    Z.prototype.load = function (a) {
        a(this.f, this.s)
    };
    Z.prototype.protocol = function () {
        var a = ["http:", "https:"],
            b = a[0];
        if (this.k && this.k.location && this.k.location.protocol) {
            var c = 0;
            for (c = 0; c < a.length; c++) if (this.k.location.protocol === a[c]) return this.k.location.protocol
        }
        return b
    };
    window.WebFont.q("monotype", function (a) {
        var b = (new z(navigator.userAgent, document)).parse();
        return new Z(window, b, new o(document, b), document, a)
    });

    function $(a, b, c) {
        this.m = a;
        this.a = b;
        this.d = c;
        this.f = [];
        this.s = {}
    }
    $.prototype.C = function (a) {
        var b = "https:" == window.location.protocol ? "https:" : "http:";
        return (this.d.api || b + "//use.typekit.com") + "/" + a + ".js"
    };
    $.prototype.z = function (a, b) {
        var c = this.d.id,
            d = this.d,
            e = this;
        if (c) {
            this.m.__webfonttypekitmodule__ || (this.m.__webfonttypekitmodule__ = {});
            this.m.__webfonttypekitmodule__[c] = function (f) {
                f(a, d, function (g, h, l) {
                    e.f = h;
                    e.s = l;
                    b(g)
                })
            };
            r(this.a, "head", u(this.a, this.C(c)))
        } else b(true)
    };
    $.prototype.load = function (a) {
        a(this.f, this.s)
    };
    window.WebFont.q("typekit", function (a) {
        var b = (new z(navigator.userAgent, document)).parse();
        return new $(window, new o(document, b), a)
    });
    window.WebFontConfig && window.WebFont.load(window.WebFontConfig);
})(this, document);