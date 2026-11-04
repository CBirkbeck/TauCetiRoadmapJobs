Verdict: design
Name: HochschildHomologyAndHKR
Base: none
Owner: none

## Scope

The roadmap owns the classical, ungraded Hochschild theory of an associative unital algebra `A`
over a commutative ring `k`, with coefficients in an arbitrary `A`-bimodule `M`, and the
cohomological Hochschild–Kostant–Rosenberg theorem for smooth commutative algebras, in the
generality of Loday, *Cyclic Homology*, Chapters 1 and 3, Weibel, Chapter 9, and Cartan–Eilenberg,
Chapter IX. Concretely it owns:

- the chain complex `C_•(A,M)` with `C_n(A,M) = M ⊗_k A^{⊗n}` and the Hochschild boundary `b`,
  the cochain complex `C^•(A,M)` with `C^n(A,M) = Hom_k(A^{⊗n}, M)` and the coboundary `δ` of
  the filed statement, `b² = 0`, `δ² = 0`, `HH_n(A,M)` and `HH^n(A,M)`, functoriality in `M` and
  in `A`, the long exact sequences in `M`;
- the normalised chains (quotient by degenerate tensors) and normalised cochains (vanishing when
  some argument is `1`), and the normalisation theorem: both comparison maps are quasi-isomorphisms,
  with an explicit contracting homotopy, over every commutative `k`;
- the low-degree identifications `HH_0(A,M) = M/[A,M]`, `HH^0(A,M) = M^A` (so `HH^0(A,A) = Z(A)`),
  `HH^1(A,M) = Der_k(A,M)/Inn(A,M)`, and `HH^2(A,M)` as the classes of square-zero extensions of `A`
  by `M` (the ungraded form, compared with DGAInfinity Layer 8's deformation reading);
- the bar resolution of `A` over `A^e = A ⊗_k A^{op}` and the identifications
  `HH_n(A,M) ≅ Tor_n^{A^e}(M,A)` and `HH^n(A,M) ≅ Ext^n_{A^e}(A,M)` when `A` is projective as a
  `k`-module, through Mathlib's `Tor` and `Ext`;
- the cup product on `C^•(A,A)`, its associativity and unit on cochains, the Leibniz rule for `δ`,
  and graded commutativity on `HH^•(A,A)` (Gerstenhaber); the Gerstenhaber bracket is not re-planned:
  it is imported from DGAInfinity Layer 8 through the comparison below;
- the comparison, with an explicit sign dictionary, between these ungraded complexes and the
  Hochschild cochains of DGAInfinity Layer 8 for `A` placed in degree zero (the
  Getzler–Jones/Keller convention that Tau Ceti's `TauCeti.AInfinity` coderivation files pin),
  transporting cup product and bracket; and, for `k`-flat commutative `R`, the comparison between
  `C_•(R,R)` and the derived Hochschild chains that KTheoryFiniteLocalFields §4.0 and
  RefinedTraceMethods §1.9 use, so that their antisymmetrisation `ε_n`, projection `π_n` and smooth
  HKR isomorphism `Ω^n_{R/k} ≅ HH_n(R/k)` apply to the classical complex;
- the evaluation pairing `HH^n(R,M) × HH_n(R,R) → M` for commutative `R` and symmetric `M`, and
  the polyvector fields `T^n_{R/k} = ⋀^n_R Der_k(R)` (over `R`, `T^0 = R`), the determinant cocycle
  `⟨D_1,…,D_n⟩`, the normalised and unnormalised HKR maps, and the cohomological HKR theorem in the
  general form stated below;
- the polynomial case through the Koszul resolution of `R = k[x_1,…,x_m]` over `R^e`, with explicit
  bases of `HH_•` and `HH^•` and the Jacobian determinant formula in top degree.

Boundaries. The homological antisymmetrisation map `ε_n : Ω^n_{R/k} → HH_n(R/k)`, the projection
`π_n` with `π_n ε_n = n!`, the fact that `ε` is a map of graded-commutative algebras and `ε_1` an
isomorphism, and the smooth HKR isomorphism in homology are planned at RefinedTraceMethods §1.9
(pull request #1493) and KTheoryFiniteLocalFields §4.0 (`cyclicHomologyModel`, pull request #1281),
on the derived Hochschild chains of DGAInfinity Layer 8; this roadmap imports them by name and
section and owns only the comparison of carriers. Cyclic, negative cyclic and periodic homology,
Connes' operator and the de Rham comparison are theirs. Hochschild cochains of DG and `A∞`
algebras, braces, the Gerstenhaber bracket and the `HH²`/`HH³` deformation theory are DGAInfinity
Layer 8's. Cyclic cochains with dual coefficients over `ℂ` are NoncommutativeGeometry N1's; bounded
Hochschild cohomology of Banach algebras is BanachAlgebras A6's. The algebraic de Rham complex
`Ω^•_{R/k}` with `Ω^n = exteriorPower R n (KaehlerDifferential k R)`, wedge and `d` is
DerivedDeRhamCohomology Layer 2's (§§2.1–2.12). The Koszul complex of a finite sequence is
DerivedModuleAlgebra §0.K.1's. Topological Hochschild homology, the HKR filtration on derived `HH`,
Kontsevich formality, deformation quantisation and the Schouten–Nijenhuis bracket are out of scope.

Generality. The filed statement takes `k` a field and `R` smooth of finite type for the
cohomological theorem. The sources support, and the library needs, `k` an arbitrary commutative ring
and `R` smooth over `k` in Mathlib's sense (`Algebra.Smooth`: formally smooth and finitely
presented, hence `k`-flat and finitely presented, hence `k`-projective, with `Ω¹_{R/k}` finite
projective). The filed claim that the *unnormalised* map `T^n → HH^n(R,R)` is an isomorphism "for
every `n`" over a field of any characteristic is not supportable: pairing the determinant cocycle
`⟨D_1,…,D_n⟩` against `ε_n(dr_1 ∧ … ∧ dr_n)` gives `n!·det(D_j r_i)`, so under the perfect pairing
`HH^n × HH_n → R` of a smooth algebra the class of `⟨D_1,…,D_n⟩` is `n!` times the canonical dual
of `D_1 ∧ … ∧ D_n`; in characteristic `p ≤ n` it is zero on cohomology although nonzero as a
cochain (`R = 𝔽_2[x,y]`, `n = 2`). The general theorem is therefore stated with the canonical
isomorphism, and the determinant map realises it exactly when `n!` is invertible. The field,
finite-type case is a Check.

## Final targets

1. **Hochschild complexes and the normalisation theorem.** For `k` a commutative ring, `A` an
   associative unital `k`-algebra and `M` an `A`-bimodule: the complexes `(C_•(A,M), b)` and
   `(C^•(A,M), δ)` with the boundary and coboundary of the filed statement; `b² = 0`, `δ² = 0`;
   the normalised subcomplex of cochains and quotient complex of chains; the comparison maps are
   quasi-isomorphisms (normalisation theorem), with an explicit homotopy, over every `k`. Locators:
   Loday98 §1.1 (Hochschild complex, normalised complex and normalisation theorem, Proposition
   1.1.13 to 1.1.15), §1.5 (cochains and `HH^n`); Weibel94 §9.1 (Definition 9.1.1 to Lemma 9.1.3
   and the normalised complex); CE56 Chapter IX §§1–6. All uncertified (paywalled): the design
   verifies the numbering.

2. **Low degrees and the Tor/Ext description.** `HH_0(A,M) = M/[A,M]`, `HH^0(A,M) = M^A`,
   `HH^1(A,M) = Der_k(A,M)/Inn(A,M)`, `HH^2(A,M)` classifies square-zero extensions of `A` by `M`
   with a `k`-linear section up to equivalence; when `A` is `k`-projective, the bar resolution is an
   `A^e`-projective resolution of `A` and `HH_n(A,M) ≅ Tor_n^{A^e}(M,A)`,
   `HH^n(A,M) ≅ Ext^n_{A^e}(A,M)`, naturally in `M`. For commutative `R` and `M = R`: `HH_1(R,R) ≅
   Ω¹_{R/k}` is imported from RefinedTraceMethods §1.9 (`ε_1`) through the carrier comparison of
   target 4. Locators: Loday98 Proposition 1.1.13 and §1.5 (1.5.1–1.5.6); Weibel94 §9.1 (Corollary
   9.1.5, Lemma 9.1.9 and the `HH^1`, `HH^2` interpretations in §9.1 and §9.3); CE56 Chapter IX
   §§4–6. Uncertified.

3. **Cup product and graded commutativity.** The cup product `C^p(A,A) ⊗ C^q(A,A) → C^{p+q}(A,A)`,
   associativity, unit, the Leibniz identity `δ(f ∪ g) = δf ∪ g + (−1)^p f ∪ δg`, so `HH^•(A,A)` is
   a graded `k`-algebra; it is graded commutative on cohomology; under the `Ext` identification
   of target 2 the cup product is the Yoneda product. Locators: Ger63 §7 (the commutativity
   theorem for the cup product, with the pre-Lie identity used in its proof; uncertified); Loday98
   §1.5 (cup product, 1.5.7–1.5.8; uncertified); Ginz05 §6.6 (Ginz05 lines 1340–1350: the cup
   product, the Leibniz identity for the Hochschild differential and the Yoneda comparison;
   Proposition 6.6.4 at Ginz05 line 1379 for commutativity). The Gerstenhaber bracket itself is
   DGAInfinity Layer 8's and reaches this roadmap only through target 4.

4. **Comparison of carriers and signs.** (a) For an ordinary `k`-algebra `A` viewed as a DG algebra
   in degree zero, an explicit isomorphism between `(C^•(A,A), δ)` and the Hochschild cochain
   complex of DGAInfinity Layer 8, recording the sign `(−1)^{?}` degree by degree against the
   coderivation convention pinned in `TauCeti.AInfinity` (Stasheff identities as the square of a
   bar coderivation), carrying the cup product of target 3 to Layer 8's and transporting Layer 8's
   bracket. (b) For commutative `R` flat over `k`, a quasi-isomorphism between `C_•(R,R)` and the
   derived Hochschild chains of KTheoryFiniteLocalFields §4.0, under which the antisymmetrisation
   `ε_n` and projection `π_n` of RefinedTraceMethods §1.9 become the classical formulas
   `r_0 dr_1 ∧ … ∧ dr_n ↦ Σ_σ sgn(σ) r_0 ⊗ r_{σ(1)} ⊗ … ⊗ r_{σ(n)}` and
   `r_0 ⊗ … ⊗ r_n ↦ r_0 dr_1 ∧ … ∧ dr_n`. (c) The evaluation pairing
   `C^n(R,M) ⊗ C_n(R,R) → M`, `f ⊗ (r_0 ⊗ … ⊗ r_n) ↦ r_0 f(r_1,…,r_n)`, descends to
   `HH^n(R,M) × HH_n(R,R) → M` for symmetric `M`; for `M = R` it is the duality map of HKR62
   Theorem 5.1 (HKR62 line 522). Sources: Loday98 §1.5 and §1.3 (Proposition 1.3.16 for
   `π ε = n!`, as AV20 line 241 records; uncertified); Ginz05 §9.2 (Ginz05 line 2101, the maps
   `κ` and `alt` between the Hochschild complex and forms or polyvectors).

5. **Polyvector fields and the cohomological HKR theorem.** For `R` a commutative `k`-algebra,
   `T^n_{R/k} := ⋀^n_R Der_k(R)` with `T^0 = R`. Lemma: `⟨D_1,…,D_n⟩(r_1,…,r_n) := det(D_j(r_i))`
   is `R`-multilinear and alternating in the `D_j`, a derivation in each `r_i`, and a normalised
   Hochschild `n`-cocycle; `⟨D⟩ = D` for `n = 1`. The unnormalised map `T^n → Z^n C(R,R)` is
   defined over every `k` and is injective on cochains for `n ≤` the rank of `Ω¹` where `Ω¹` is
   free; `Φ^n_HKR = (1/n!)⟨…⟩` when `n!` is invertible in `k`. Theorem (HKR, cohomological, general
   form): for `k` any commutative ring and `R` smooth over `k` (`Algebra.Smooth k R`), the pairing of
   target 4(c) together with the imported homological isomorphism `ε : Ω^•_{R/k} ≅ HH_•(R/k)`
   induces natural `R`-linear isomorphisms
   `HH^n(R,R) ≅ Hom_R(Ω^n_{R/k}, R) ≅ ⋀^n_R Der_k(R) = T^n_{R/k}` for every `n` (using that
   `Ω¹_{R/k}` is finite projective and that a bounded-below complex of projectives with projective
   homology is split); the class of `⟨D_1,…,D_n⟩` is `n!` times the image of `D_1 ∧ … ∧ D_n`, so
   `Φ^n_HKR` is an isomorphism whenever `n!` is invertible in `k`, and for `ℚ ⊆ k` the sum
   `⊕_n Φ^n_HKR` is an isomorphism of graded-commutative `R`-algebras `(T^•_{R/k}, ∧) ≅
   (HH^•(R,R), ∪)`. Checks: `k` a field and `R` smooth of finite type (the filed case); `R =
   𝔽_2[x,y]`, where `⟨∂_x, ∂_y⟩` is a nonzero cochain whose class vanishes; `HH^n(R,R) = 0` for
   `n >` the relative dimension. Locators: HKR62 Theorem 5.1 (HKR62 line 522: for any commutative
   `K` and `K`-projective commutative `R`, the duality map `Ext_{R^e}(R,R) → Hom_R(Tor^{R^e}(R,R),R)`
   and the algebra map from `Tor` to differential forms), Theorem 5.2 (HKR62 line 548: for `R`
   regular affine over a perfect field, `Tor ≅ ⋀ D_R`, `Ext ≅ ⋀ T_R`, and the duality map becomes
   the canonical map `⋀ T_R → Hom_R(⋀ D_R, R)`, an isomorphism since `D_R` is finite projective),
   Theorem 3.1 (HKR62 line 210: `Tor` of a regular quotient is the exterior algebra on `Tor_1`),
   and the characteristic-2 remark on weakly versus strongly alternating forms (HKR62 lines
   569–582); Loday98 Theorem 3.4.4 and §3.4 (smooth algebras in Loday's sense and Grothendieck's;
   uncertified); Weibel94 Theorem 9.4.7 and §9.4 (uncertified); AV20 Proposition 1.2 (AV20 line
   70: formality of `HH(R/k)` for `R` smooth over any commutative `k`, by projectivity of the
   homology) and AV20 line 241 (`Ω^t → Ω^t` is multiplication by `t!`, citing Loday); Ginz05
   Theorem 9.1.3 (Ginz05 line 2086, the field case), §9.2 (Ginz05 line 2101, the maps from the
   Hochschild complex to forms and polyvectors) and §9.3 (Ginz05 line 2173, the proof by
   localisation and Tor).

6. **The polynomial case and the Jacobian formula.** For `R = k[x_1,…,x_m]`: the elements
   `x_i ⊗ 1 − 1 ⊗ x_i` form a regular sequence in `R^e` generating the kernel of multiplication,
   and the Koszul complex of DerivedModuleAlgebra §0.K.1 is an `R^e`-free resolution of `R`; hence
   `HH_n(R,R)` is free with basis the classes of `ε(dx_{i_1} ∧ … ∧ dx_{i_n})`, `HH^n(R,R)` is free
   with basis the duals, `HH_n = HH^n = 0` for `n > m`, both over every commutative `k`; the
   comparison with the bar resolution realises the HKR maps; in top degree, for `m!` invertible,
   `Φ_HKR(g ∂_1 ∧ … ∧ ∂_m)(r_1,…,r_m) = (g/m!) det(∂r_i/∂x_j)` with `∂_j = MvPolynomial.pderiv j`,
   and the unnormalised map is `g det(∂r_i/∂x_j)`. Locators: HKR62 Theorem 3.1 (HKR62 line 210,
   `Tor` of a regular quotient as an exterior algebra) and Theorem 7.1 (HKR62 line 893, the
   Koszul-type resolution `V_R ⊗_R E(T_R)` when `T_R` is projective); Loday98 §3.2 (Hochschild
   homology of polynomial algebras) and §3.4 (uncertified); Weibel94 §9.4 (the Koszul computation
   preceding Theorem 9.4.7; uncertified); Ginz05 Proposition 9.4.1 (Ginz05 line 2216, the
   diagonal as a regular embedding and the splitting of the bar complex).

## Suppliers

- Mathlib (pinned): `Derivation` with its `R`-module structure and `Derivation.Lie`,
  `KaehlerDifferential` and `KaehlerDifferential.D`, `ExteriorAlgebra.exteriorPower` and
  `exteriorPower.ιMulti`, `Algebra.Smooth` (formally smooth and finitely presented;
  `Smooth.flat`, `projective_kaehlerDifferential`), `Module.projective_of_finitePresentation`
  (flat and finitely presented implies projective), `MvPolynomial.pderiv`, `TensorProduct` and
  `Algebra.TensorProduct` for `A^e`, `MulOpposite`, `HomologicalComplex`, `CategoryTheory.Ext`
  (`Mathlib/CategoryTheory/Abelian/Ext.lean`), `Tor` (`Mathlib/CategoryTheory/Monoidal/Tor.lean`),
  `ModuleCat`. No Hochschild complex and no Koszul complex exist at the pin.
- DerivedModuleAlgebra (main) §0.K.1 (Koszul complex of a finite sequence, acyclicity for weakly
  regular sequences), §0.2 (derived tensor products), §0.12 (smooth cotangent computation, `Ω¹`
  finite projective for smooth maps).
- DerivedDeRhamCohomology (pull request #868, merge order 19) Layer 2 §§2.1–2.12: `DeRham.Forms`,
  elementary forms, wedge product, the de Rham differential and the algebraic de Rham complex.
- DGAInfinity (main) Layers 0–1 (signed graded multilinear calculus, DG algebras) and Layer 8
  (Hochschild cochains of DG and `A∞` algebras, cup product, braces, Gerstenhaber bracket, the
  `HH²`/`HH³` deformation reading); its Tau Ceti implementation under
  `TauCeti/Algebra/Homology/AInfinity/` pins the sign conventions the comparison must match.
- KTheoryFiniteLocalFields (pull request #1281, merge order 69) §4.0 `cyclicHomologyModel`: derived
  Hochschild chains of commutative algebras, `HH_0 = A/[A,A]`, `HH_1 = Ω¹`, the smooth HKR
  isomorphism in homology.
- RefinedTraceMethods (pull request #1493, merge order 309) §1.9: `ε_n`, `π_n`, `π_n ε_n = n!`,
  `ε` an algebra map, `ε_1` an isomorphism. Importing it places this roadmap after position 309 of
  the merge order; see Risks.
- Neighbours, not suppliers: NoncommutativeGeometry N1, BanachAlgebras A6,
  GorensteinHomologicalAlgebra (pull request #323; Gorenstein dimensions over an associative ring,
  no Hochschild content, so the filed "continues GorensteinHomologicalAlgebra" is not an import).

## Consumers

- DGAInfinity Layer 8 (deformation theory of ordinary algebras can be read on the ungraded complex
  through target 4(a)) and ZigzagPreprojective Layer 7 (zigzag Hochschild cohomology and `A∞`
  deformations by a Hochschild class).
- RefinedTraceMethods §1.9–1.10 and KTheoryFiniteLocalFields §4.0 may consume the pairing and the
  cohomological side; a future roadmap on Gerstenhaber algebras, Schouten–Nijenhuis brackets,
  Kontsevich formality and deformation quantisation; Calabi–Yau and Koszul duality roadmaps
  (DGAInfinity Layers 9 and 11); the `A∞`-algebra `R_η` on `k[x_1,…,x_m]` with `m_n = ε Φ_HKR(η)`
  of the Annals of Mathematics paper the filing cites (not identified; see Risks).

## Sources

- HKR62: G. Hochschild, B. Kostant, A. Rosenberg, *Differential forms on regular affine algebras*,
  Trans. AMS 102 (1962), 383–408, DOI 10.1090/S0002-9947-1962-0142598-8. AMS open archive
  (publisher-open), certified: Theorems 3.1, 5.1, 5.2, 7.1 at HKR62 lines 210, 522, 548, 893.
  Cited for targets 4–6.
- Loday98: J.-L. Loday, *Cyclic Homology*, 2nd ed., Grundlehren 301, Springer 1998, §§1.1, 1.3,
  1.5, 3.2, 3.4 (Theorem 3.4.4). Paywalled; uncertified, cited by locator. Targets 1–6.
- Weibel94: C. A. Weibel, *An Introduction to Homological Algebra*, CUP 1994, §§9.1, 9.3, 9.4
  (Theorem 9.4.7). Paywalled; uncertified. Targets 1, 2, 5, 6.
- Ger63: M. Gerstenhaber, *The cohomology structure of an associative ring*, Ann. of Math. 78
  (1963), 267–288, DOI 10.2307/1970343, §7. Paywalled; uncertified. Target 3.
- Ger64: M. Gerstenhaber, *On the deformation of rings and algebras*, Ann. of Math. 79 (1964),
  59–103, DOI 10.2307/1970484. Paywalled; uncertified. Consumer context only.
- CE56: H. Cartan, S. Eilenberg, *Homological Algebra*, Princeton 1956, Chapter IX. Paywalled;
  uncertified. Targets 1–2.
- Mat86: H. Matsumura, *Commutative Ring Theory*, CUP 1986, §§25–30 (derivations, Kähler
  differentials, smoothness, regular sequences). Paywalled; uncertified. Background for target 5.
- AV20: B. Antieau, G. Vezzosi, *A remark on the Hochschild–Kostant–Rosenberg theorem in
  characteristic p*, Ann. Sc. Norm. Super. Pisa (2020), arXiv:1710.06039. Open repository,
  certified: Proposition 1.2 (AV20 line 70) and the `t!` remark (AV20 line 241). Target 5.
- Ginz05: V. Ginzburg, *Lectures on noncommutative geometry*, arXiv:math/0506603. Open repository,
  certified: §6.6 (Ginz05 lines 1340–1384, cup product and Gerstenhaber structure), §9 (Ginz05
  lines 2038–2222, the HKR theorem over a field, the comparison maps and the proof). Targets 3–6.
- StacksSmooth: Stacks Project, Tag 00T2 and Tag 00TN (smooth ring maps and the equivalence with
  formally smooth of finite presentation). Open. Scope.
- The Annals of Mathematics 2020, 191(2), article 3, cited by the filing's definition text, could
  not be identified by title or authors; it is recorded as a consumer lead, not a source.

## Risks

- Ownership of the homological HKR map. RefinedTraceMethods §1.9 and KTheoryFiniteLocalFields §4.0
  already plan `ε_n`, `π_n`, `π ε = n!` and the smooth isomorphism on derived chains. Importing
  them keeps the single direction of supply but places a foundational algebra roadmap after merge
  position 309. The cleaner library shape would move ownership of the classical `ε`, `π` and smooth
  HKR into this roadmap (then inserted after DerivedDeRhamCohomology, position 19) with those two
  sections importing it; that re-plans existing pull requests and is a human decision. The design
  must take one of the two routes explicitly and must not prove the homological HKR twice.
- The filed cohomological statement is wrong in characteristic `p ≤ n` for the unnormalised map
  (see Generality). The design must state the canonical isomorphism and keep the determinant map as
  `n!` times it.
- Paywalled sources: Loday, Weibel, Cartan–Eilenberg, Gerstenhaber and Matsumura are recorded as
  uncertified and cited by locator only; their theorem numbers above are from memory and the
  design must either confirm them against the open texts (HKR62, Ginz05, AV20, StacksSmooth) or
  state the results on the open sources alone. HKR62 is certified from the AMS open archive
  (fetched with the `publisher-open` licence class).
- The pinned Mathlib has no Koszul complex; DerivedModuleAlgebra §0.K.1 itself is planned against
  open Mathlib pull requests. The polynomial computation (target 6) depends on it landing.
- Sign conventions: DGAInfinity Layer 8's cochains are coderivations of a bar coalgebra in the
  Getzler–Jones/Keller convention; the dictionary of target 4(a) must be fixed on the Tau Ceti
  implementation, not on the paper sources, or the cup and bracket comparisons will carry wrong
  signs.
- Mathlib's `Algebra.Smooth` is formally smooth plus finitely presented; Loday's "smooth" is a
  local regular-sequence condition on the kernel of multiplication. The design must prove the
  implication it needs (Grothendieck smooth implies Loday smooth) or import it from
  DerivedModuleAlgebra §0.12/§0.13 and DerivedDeRhamCohomology Layer 0.
