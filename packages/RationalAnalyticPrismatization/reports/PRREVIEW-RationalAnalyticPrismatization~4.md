# Review of RationalAnalyticPrismatization (pull request #2456 at 1d7a78e)

**Verdict:** accepted

No finding. The acceptance is conditional on the one gap the README declares, `gap:proetale-v-comparison` (DiamondsAndVStacks §D6.5), used only in 11.7.

## Previous findings

- R01 — repaired: "π: BΠ^cont → GSpec(ℚ_p) is D-prim by descent of primness along f (AnalyticStacks §0.9; HM Corollary 4.7.5(ii), p. 78, HM line 3895). It is moreover 1-truncated with D-proper diagonal, hence D-proper (AnalyticStacks §0.10)". Line 70 now reads "a map f with f∘g D-prim is then D-prim (§0.9; HM Corollary 4.7.5(ii), HM line 3895)", and the 10.2 *Needs:* line has "AnalyticStacks §0.9; AnalyticStacks §0.10".
- Remark on the 8.1 Check — repaired: "On X_cyc the divisor of q − 1 is not of degree one. X_cyc omits only the point at which every `q^{1/p^n}` equals 1".

## Verified sound

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| 0.1 Stefanich rings, Gestalten | C = D(k); unit; terminal ring | End of the unit of `Mod_{D(k)}(1Pr)` is D(k); with A_2 = 1Pr, Ani. (∗, Ani, 1Pr, …) initial; (∗, ∗, …) gives ∅ | holds; Gest line 959, 1712, 1740, 2523 |
| 1.4 Gelfand, separable, qfd | ℚ_p⟨T⟩; ℚ_p[ε]/ε²; `ℚ_{p,■}⟨ℕ[S]⟩_{≤1}`, S infinite; 0; C_p | ℚ_p⟨T⟩/ℤ_p⟨T⟩ discrete; A^u = ℚ_p Banach; summand `𝔽_{p,■}[S]` not discrete; C_p separable since ℚ̄_p is countable-dimensional | holds; ABLB line 1162, 1171, 1176, 2061, 2261 |
| 2.4 nilperfectoid basis | A = ℚ_p; A = 0; ℚ_p⟨T_n⟩ route | ℚ_p → ℚ_p^cyc has a ℚ_p-linear retraction, so index 1; empty cover for 0; colimit map of index ≤ 2 (ABLB line 2930) | holds; ALRS line 797; ABLB line 2916, 2641, 2414 |
| 2.5 Betti realization | S = two points; ∅; ℕ ∪ {∞} | ℚ_p × ℚ_p; 0; C^lc = eventually constant sequences ≠ C(S, ℚ_p) | holds; ABLB line 2214–2219; ALRS line 671, 925 |
| 4.1 †-formally étale and smooth | zero section of A¹ at A = C_p[ε]/ε²; identity | X(A) `×_{X(A^u)}` Y(A^u) = C_p·ε, Y(A) = point: not an isomorphism. Identity: both sides Y(A) | holds; ALRS line 1248, 1275, 1293; ABLB line 3051 |
| 7.6 Banach–Colmez spaces | λ = 0, 1, −1; A = ℚ_p[ε]/ε², C_p[ε]/ε²; D_λ for `D_{−λ}` | BC(O) = ℚ_p^la, kernel ℚ_p·ε; λ = −1: π₀ = C_p/ℚ_p, π₁ = C_p·ε (0 with G_a^dR); D_λ gives H⁰(O(1)) = 0 | holds; ALRS line 2869, 2915, 2931; FS line 2274 |
| 8.5 radius map | n-th copy of T; intervals (1, ∞), (0, p) | Divisor radius p^n ↔ κ = `p^{−n}`, the n-th inverse Frobenius translate of κ = 1; (1, ∞) contains no `p^{−n}` | holds; ALRS line 3291, 3309, 3327, 3347 |
| 9.6 formal Hodge–Tate squares | X = GSpec(ℚ_p) | X^cone = A¹/G_m, (X^cone_s)^dR = BG_m^dR, X^dR = point: `Q_p^{HT^}` = Â¹/G_m `×_{BG_m^dR}` point, restricting to the BG_m^†-gerbe of 9.7(2) | holds; ALRS line 3985, 3999 |
| 9.7 prismatization of ℚ_p | zeros on X_cyc; action of p | log(q)/(q − 1): primitive `p^{n+1}`-th roots, n ≥ 0; log q: also the points q = 1 ≠ `q^{1/p^k}`; p acts by q ↦ q^p | holds; ALRS line 4112–4144, 4202 |
| 9.9 prismatic logarithm | generator on X_cyc; group law | φ(log q) = p·log q, times `p^{−1}` from ⟨1⟩: invariant. (a, b)∘(a′, b′) = (aa′, a′b + b′) closes. Integral e_A ↔ p·e | holds; ALRS line 4348, 4403, 4454, 4494, 4599, 4622 |
| 10.3 G_r, G^la | G = ℤ_p, r = 1/p; ℤ/p × ℤ_p; ℤ; p = 2 | G_0(r′)(ℚ_p) = pℤ_p for 1/p ≤ r′ < 1: p discs; cd_p = ∞; ℤ^la = ℤ^cont; 3^a has c_n = 2^n, r < 2 | holds; ALRS line 5086–5120, 5137, 5169 |
| 10.7 classical decompletion | K = ℚ_p^cyc; G trivial; R = C(G, ℚ_p) | K^la = `ℚ_p(μ_{p^∞})`, completion K; R^la = R; R^la = C^la_G with uniform completion C(G, ℚ_p) | holds; ALRS line 5831, 5851, 5877, 5895, 5909, 4747; BC16 line 397 |
| 11.5 geometric Hodge–Tate stack | dim X = 1; X = D | L = dual of Lie(T^†{1}) shifted = Ω¹{−1}[−1]; two-term Higgs complex; X = D: T = 0, X^HT = D | holds; ALRS line 7976–7992; RCSen line 64 |
| 11.8 inverse Faltings' extension | transitivity for X^HT → X × K^HT → X; K = `ℚ_{p²}` | O[−1] → L → Ω¹{−1}[−1]; L[1] has the shape of FE{−1}. K ⊗ K = K × K: the product over ℚ_p has two copies | holds; ALRS line 8145–8159, 8277 |
| 12.6 Riemann–Hilbert functor (headline) | X = point; E = ℚ_p; shift; G_m character | Weight n of h_*O: 0 for n ≠ 0, ℚ_p ⊕ ℚ_p[−1] for n = 0. F(ℚ_p) = B⁺_dR; F(E[1]) = t·F(E) | holds; ALRS line 9143, 9177, 9223, 9237; Sch13 line 1936 |
| 11.6 with 11.1, 11.4 (headline) | K = `ℚ_{p²}`, `ℚ_{p³}`; π_*O | Twisted: H⁰ = (K ⊗ ℚ_p)^σ = ℚ_p; untwisted: K, dimensions 2, 4, 0 against 1, 3, 0. σ ⊗ φ: ℚ_p³ | holds; ALRS line 8082, 7756, 7921 |
| 11.7 (headline) | X = GSpec(ℚ_p), p odd and p = 2; [K : ℚ_p] = n | Dimensions 1, 2, 0 (Hom(ℚ_2^×, ℚ_2) has dimension 2), χ = −1; 1, n + 1, 0, χ = −n | holds; ALRS line 480 |
| 11.2 (headline) | M = C_p(n), n = 0, 1, −1 | n ≠ 0: K `→^{n}` K acyclic; n = 0: H⁰ = H¹ = K, H² = 0. θ = +1 on C_p(1) | holds; ALRS line 7798–7817, 7868 |
| 10.12 (headline) | G trivial, X closed disc; ℤ_p^cont/ℤ_p^cont | End(1) = ℚ_p on the connected \|X\|^Betti, ℚ_p⟨T⟩ on X: fully faithful only on O^la-modules; D = D(ℚ_p) | holds; ALRS line 4738–4754 |
| 12.2–12.4 (headline) | cone square; pullback to FF; P¹; G_m | `ω_{A¹/G_m}` = I; `ω_{Div¹}` = O⟨1⟩[2] ⊗ I = O{1}[2]; on FF: O(1) ⊗ O(−1), slope 0. P¹: (O ⊕ O{−1}[−2])^∨ = f_*(O{1}[2]) | holds; ALRS line 8745, 8753, 8875, 8938, 8952 |
| 12.5 (headline) | d = 0, 1, general d | f_*O = ⊕_j O{−j}[−2j]; twisting by {d}[2d] gives ⊕_k O{d − k}[2d − 2k], d + 1 summands on both sides | holds; ALRS line 9093 |
| 10.2 route: π is D-proper (previous R01) | Π = ℤ_p; Π = 1 | π∘f = id is prim, so π is prim; diagonal base-changed along f × f is ℤ_p^cont → point, 0-truncated affinoid; π is 1-truncated | holds; HM line 3858, 3895; AnalyticStacks §0.9, §0.10 |
| 8.1 Check on q − 1 (previous remark) | k = 1, 2 | q − 1 = (`q^{1/p^k}` − 1)·∏_{j ≤ k} `[p]_{q^{1/p^j}}` telescopes; zero locus is ⊔_{k ≥ 1} {`q^{1/p^{k−1}}` = 1 ≠ `q^{1/p^k}`}, infinitely many translates | holds; ALRS line 3028 |
| Conventions: radius and twists | untilt C, ϖ = p♭; cyclotomic e; H¹(G_m), H²(P¹) | κ = 1, φ multiplies by p. φ(log q/(q − 1)) = p·`[p]_q^{−1}`·, φ(e⟨1⟩) = `p^{−1}`: φ(e) = `[p]_q^{−1}e`. Both (ℚ_p, pφ) = O(−1) | consistent in 6.1, 6.3, 8.5, 9.8, 12.2 |
| 10.1, 10.4, 10.8 worked values | ℤ/2 on ℚ_p × ℚ_p; ϖ = `p^{1/2}`, p²; G = ℤ_p | Crossed product M_2(ℚ_p). \|p\|_ϖ = 1/4 and `2^{−1/2}`. `π_{−1}` = cokernel of the difference operator, killed by ϖ^ϵ iff `2^{−ϵ}r^{w(γ)}` ≤ 1 | holds |

- **Source locators checked against the text: 174 in 12 sources, all match.** ALRS 92, Gest 48, ABLB 19, HM 4, AHLB 3, Sch13 2, and one each in And21, BC16, FS, RCSen, Hauck and Pan22. The README flags no locator as unverified.
- **Library declarations opened at the pins (21, all at the cited lines).** Mathlib 1b1ccf4: `LightProfinite` (Basic.lean:44), `LightCondensed` (:29), `MulRingSeminorm` (:61), `spectralNorm` (:381), `WittVector` (:52), `WittVector.fontaineTheta` (:166), `BDeRhamPlus` (:75), `CondensedMod.IsSolid` (:83), `PadicComplex` (:137), `continuousCohomology` (:131), `PadicInt.mahlerEquiv` (:353). Tau Ceti 2fd255d: `LocallyAnalytic` (:45), `LocallyAnalytic.eval` (:85), `AnalyticStage.amiceMap` (:494), and the eight `TauCeti.FarguesFontaine` declarations of Y.lean, Window.lean and Quotient.lean.
- **Cross-roadmap citations resolved.** AnalyticStacks at #1687: all 36 cited sections exist, with items §2.3(1), (7), §4.4(1), (3)–(6), §6.5(3)–(4), §7.5(4), §0.9 (its line 298), §0.10, §0.11(ii), §0.12(a)–(e) and Conventions (4). MotivesAndAlgebraicCyclesPartII Layer 0 (§§0.1–0.8) at #2459. TropicalAndBerkovichArithmetic §§0.1–0.30, PrismaticCohomologyPartII §§3.8, 3.9, 3.11, 4.12, 4.13, PrismaticCohomologyPartIII §6.10 and ClassicalAdicEtaleCohomology §§3.1, 8.2, 9.3 at their open heads. DiamondsAndVStacks §§D6.4–D6.5 and NoncommutativeAndEquivariantIwasawa §0.11 on main (11d488e). `Huber.GelfandSpectrum` is AdicSpacesPartIII §R3.9 on main.
- **Gate.** The worker's gate and my re-run both pass, every check 0. Depcheck: `depcheck: 264 roadmaps, 2584 edges, 0 problem(s)`. `lake env lean` on `Suggested.lean` exits 0 with no message. No file outside the folder changes.
- **Shape.** 93 subsections, each with one *Needs:* line and at least three Checks (375 in all); the 26 without an API list state theorems, not definitions; each of the 13 layers ends with Examples and Dependencies.
- **`Suggested.lean`.** It declares nothing, so the `#check` comparison and the one-tactic probe have nothing to test. Its docstring names the seven headline theorems (11.6; 11.7; 11.2, 11.5, 11.8; 10.12, 11.9, 11.10; 12.2–12.4; 12.5; 12.6) and the carriers each lacks; the pins have no analytic rings, six-functor formalisms or Gelfand stacks, so none is statable.
- **Declared gaps.** `gap:proetale-v-comparison` is precise and not already provided: DiamondsAndVStacks §D6.5 on main compares étale sites only. The two plan entries with supplier `none` (Gestalten) are not gaps at this head: Layer 0 (0.2–0.5) states them as targets and the README declares neither.
- **Pull-request text.** Read against this head: it adds the roadmap, names the seven unstatable headlines and the supplier that is a new pull request, and no sentence is contradicted.

Overlap check: read AnalyticStacks (its scope, lines 8–25, and §§0.9–0.12, 4.2), MotivesAndAlgebraicCyclesPartII (Layer 0 and its line 1500), PrismaticCohomologyPartIII (§6.10) and, on main, EnhancedDerivedSheaves and PerfectoidSpaces as cited. Owners of shared objects: six-functor formalisms, analytic stacks, prim descendable descent and the two-level suave and prim maps are AnalyticStacks', cited here; the Banach arc-site and Marc(A) are MotivesAndAlgebraicCyclesPartII's, cited here; integral Breuil–Kisin twists and the integral prismatic logarithm are PrismaticCohomologyPartII's and PartIII's, used in Checks only; Gestalten, Gelfand rings and stacks, the analytic prismatization, twistor and Hodge–Tate stacks are this roadmap's (AnalyticStacks leaves them to it by name). A search of all open heads and main for Gestalten, Gelfand rings, twistor stacks, Hyodo–Kato stacks and classical decompletion finds no second owner.

Source independence: 26 passages compared with 10 sources (ALRS, ABLB, Gest, HM, FS, Sch13, BC16, AHLB, RCSen, And21), none shared; the longest common run is 7 words, a definition with one formulation (ABLB line 1162). Largest share ALRS, 869 of 1374 locators. Contents compared with ALRS: independent. ALRS §2 is spread over Layers 2–5 with its Appendix A placed in Layer 4 and §3.1 in Layer 5; §3.2 joins ABLB §6 and ALBM §4 in Layer 6; §4 is split between Layers 8 and 9 with §4.7 divided; Layers 0 and 1 come from Gest and ABLB. Layer 10 ↔ §5 with §5.1 last, and Layers 11–12 ↔ §6; there the order is the one the *Needs:* lines force (10.6 → 10.7 → 10.9 → 10.10; 11.1 → 11.2; 11.3 → 11.4 → 11.5, 11.6 → 11.7; 12.1 → 12.3 → 12.4 → 12.5).

## Not verifiable

- none

## Source issues

- **Error** in ALRS at Remark 6.1.5, p. 145: the source says that for K/ℚ_p unramified the twistor stack of GSpec(K) is the product GSpec(K) × Div¹; it should be the quotient of GSpec(K) × Div¹~ by GSpec(σ) × φ, since the product has H⁰ = K, not ℚ_p; affects a stated result.
- **Misprint** in ALRS at Proposition 3.7.4(2), p. 56: the source says the lower left corner of the square is the classifying stack of G_a^dR ⊗ `D_{−λ}`; it should be that of G_a^an ⊗ `D_{−λ}`, as its proof and the deduced extension use; affects nothing.
- **Misprint** in ALRS at Construction 6.7.5, p. 171: the source says h_*1 is ℚ_p ⊕ ℚ_p[1]; it should be ℚ_p ⊕ ℚ_p[−1], the second summand being the degree-one class log χ_cyc; affects nothing.
- **Misprint** in ALRS at Theorem 6.5.8(3), p. 164: the source says the upper shriek is applied to the structure sheaf of the twistor stack of Y; it should be applied to that of X; affects nothing.
- **Misprint** in ALRS at Theorem 6.2.2(4), p. 147: the source says the acting classifying stack carries the twist {−1}; it should be {1}, as in parts (1)–(3) and (6.2.2); affects nothing.
- **Misprint** in ALRS at Proposition 4.8.1, proof of (3), p. 80: the source says the factors are [p] at q^n and the denominators q to the power `p^{1/n}`, minus 1; it should be [p] at `q^{p^n}` and q to the power `p^{−n}`, minus 1; affects nothing.
- **Misprint** in ALRS at Proposition 4.2.13, proof, p. 64: the source says Frobenius maps the region (0, 1) of the prismatization onto the region (0, p) of the δ-space; it should be onto the region (0, p) of the prismatization; affects nothing.
- **Gap** in ALRS at Theorem 6.5.4(3), proof, p. 162: the source says 0-properness of Div¹ follows from (1), (2) and surjectivity of β, 0-properness being local on the source; it should give a locality result covering β, which is not a finite family of monomorphisms (HM Remark 4.4.11(iii)); affects the proof.
- **Misprint** in HM at Corollary 4.7.5, pp. 77–78: the source says the composite Z → Y → X is gf in (i)–(ii) and fg in (iii); it should use one order throughout; affects nothing.

## For the human reviewers

- Scope: the main sources are unrefereed. ALRS (869 of 1374 locators) is a 2026 preprint on an author page and Gest is 2026 lecture notes on an author page; ABLB, RCSolid and Hauck are arXiv preprints. `sources.toml` records no published versions.
- Arrangement: subsections 10.6–10.11 pair in order with ALRS §§5.3–5.8, and Layers 11–12 with ALRS §§6.1–6.7. The *Needs:* lines force that order except for the position of 10.8 (README lines 1766–1863).
