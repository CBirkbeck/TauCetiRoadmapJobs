<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13788#issuecomment-6849133604 -->
Review (claude) of a7162ca

Verdict: needs_changes

1. **F01** (P3) Pinned declarations that Layers 4 and 8 consume are not named in the contracts

   **Location.** `packages/HochschildHomologyAndHKR/design/README.md:322`: "Mathlib has no lemma that the differences of two copies of the variables of a polynomial ring form a regular sequence (§8.1)"; §8.1 route, line 1603: "the variables form a regular sequence"; §8.2 Needs, line 1623; §4.1, line 938.

   **Claim.** The supplier contracts list every pinned declaration the routes use; the Koszul complex is named only through DerivedModuleAlgebra §0.K.1.

   **Witness.** At the Tau Ceti pin: `MvPolynomial.isWeaklyRegular_map_X` (`TauCeti/RingTheory/MvPolynomial/RegularSequence.lean:44`, any commutative ring, no nontriviality); `TauCeti.koszulComplex` (`TauCeti/RingTheory/KoszulComplex/Basic.lean:219`), `homologyZeroEquivSpan` (:399), `exactAt_of_isWeaklyRegular` (`Regular.lean:140`). Mathlib: `instModuleTensorProductMop` (`Mathlib/Algebra/Azumaya/Defs.lean:39`).

   Nothing is restated: §8.1's target (the sequence `t_i` in `R ⊗ R`) is a transport of the pinned theorem, §8.2 specialises the Koszul complex, and DerivedModuleAlgebra §0.K.1 (on main) remains the owning section; its own contract table already records that these Tau Ceti declarations formalise §0.K.1. But a route input that exists at the pin is cited by its exact name and file, and the bimodule `A` over `Aᵉ` of §4.1 is Mathlib's abbreviation, which the open roadmap CyclicHomologyLieHomologyAndQuasiFreeAlgebras §4.1 also uses.

   **Exact repair.** Add to "From Tau Ceti" and to the "Already in the pinned libraries" paragraph: `MvPolynomial.isWeaklyRegular_map_X` (distinct variables are weakly regular over every commutative ring), and `TauCeti.koszulComplex` with `TauCeti.koszulComplex.homologyZeroEquivSpan`, `TauCeti.koszulComplex.exactAt_of_isWeaklyRegular` and the degree-two formula `oneEquiv_koszulDifferential_one` (`Basic.lean:137`: `u ∧ v ↦ φ(u) v − φ(v) u`), as the pinned form of DerivedModuleAlgebra §0.K.1. Add the first to §8.1's Needs and the others to §8.2's Needs and to plan 8.1 and 8.2. Reword line 322 to say what is missing is only the transport to `t_i`. In §4.1 name `instModuleTensorProductMop` for the bimodule `A` and add it to the Mathlib contract and plan 4.1.

   **Repair test.** `m = 1`, `k = ℤ/4`: `isWeaklyRegular_map_X [0]` over the coefficient ring `k[X]` gives `Y` regular in `k[X][Y]`, the §8.1 Check, with no nontriviality; `m = 0`: the empty list, kernel `0`; `k = 0`: weakly regular holds, regular would not. The pinned degree-two formula gives `d(e₁ ∧ e₂) = t₁ e₂ − t₂ e₁`, the README's API bullet (line 1628).

2. **F02** (P3) Two layer Dependencies paragraphs no longer match their Needs lines

   **Location.** `packages/HochschildHomologyAndHKR/design/README.md:1150`: "Mathlib graded monoids, direct sums and `Ext` composition; Tau Ceti's comparison of resolutions." Line 1730: "Layers 1–7 …; DerivedModuleAlgebra §0.K.1; Mathlib's polynomial rings and regular sequences."

   **Claim.** Layer 5 depends on a Tau Ceti comparison of resolutions; Layer 8 depends on no Tau Ceti declaration and on no Mathlib homological input.

   **Witness.** §5.3 Needs (lines 1116–1119) now lists only Mathlib declarations: no Tau Ceti item remains in Layer 5. §8.2 Needs (line 1626) lists Tau Ceti `CategoryTheory.ProjectiveResolution.extLinearEquiv`; §§8.3–8.4 list Mathlib `homotopyEquiv`, `liftHomotopy`, `mapHomotopyEquiv`.

   **Exact repair.** Layer 5 Dependencies: replace "Tau Ceti's comparison of resolutions" by "Mathlib's `Ext` classes of cocycles on projective resolutions" (and keep Tau Ceti's cochain carrier through Layer 1). Layer 8 Dependencies: add "Tau Ceti's `extLinearEquiv` (§8.2) and, after R01, its Koszul complex and regular sequence of variables; Mathlib's projective resolutions, `Ext`, left derived functors and homotopy equivalences".

   **Repair test.** After the edit every supplier named in a layer's Dependencies occurs in a Needs line of that layer and conversely: Layer 5 names no Tau Ceti resolution lemma; Layer 8 names `extLinearEquiv`, which §8.2 uses at `m = 1` (`d₁ ≫ g = (X − X) g(1) = 0`).

3. **F03** (P3) The second locator of §4.3 does not contain the statement

   **Location.** `packages/HochschildHomologyAndHKR/design/README.md:989`: "`Hom_{Aᵉ}(B_•(A), M) ≅ C^•(A,M)` over every `k`, natural in `M` (Ginz05 §5.2, lines 1033–1062; HKR62 lines 284–298)".

   **Claim.** HKR62 lines 284–298 support the evaluation isomorphism out of the bar resolution.

   **Witness.** HKR62 lines 284–298 identify `Hom_S(X, A)` with `Hom_R(R ⊗_S X, A)` for an arbitrary resolution `X` and define the map `h` (the content of §7.1, which cites them correctly). The bar resolution first appears at HKR62 line 433; the evaluation form is at lines 480–489.

   **Exact repair.** In §4.3 replace "HKR62 lines 284–298" by "HKR62 lines 480–489" (cochains of `Hom_S(Y_p, R)` evaluated as `x₀ α(1 ⊗ x₁ ⊗ ⋯ ⊗ x_p ⊗ 1) x_{p+1}`, and `ζ′(x₀ ⊗ x₁ ⊗ x₂) = x₀ ζ(x₁) x₂`). §7.1 keeps lines 284–298. The plan's locator for 4.3 (Ginz05 only) needs no change.

   **Repair test.** HKR62 line 489 at `p = 1` reads `x₀ ζ(x₁) x₂`, which is the README's degree-one clause of §4.4 (`a₀ D(a₁) a₂`) and §4.3's evaluation at `1 ⊗ a ⊗ 1`.

Three findings, all P3 (no P1, no P2). The three findings of round 3 are repaired, the repaired passages survive the adversarial pass, and every supplier citation resolves at its current head. Each finding carries a repair, so the verdict asks for changes: a fix round applies the three repairs. The declared gap `smooth-hkr-antisymmetrisation` (RefinedTraceMethods §1.9) is precise, minimal and declared in both files; it is no finding. This is a design review: there is no `Suggested.lean`, and nothing was elaborated.

## Verification of the previous repairs

Each finding of `packages/HochschildHomologyAndHKR/reports/REV-DESIGN-HochschildHomologyAndHKR~3.md` was checked against the design and against `packages/HochschildHomologyAndHKR/reports/FIX-DESIGN-HochschildHomologyAndHKR~4.md`.

| Round-3 finding | Repaired passage (`packages/HochschildHomologyAndHKR/design/README.md`) | Assessment |
| --- | --- | --- |
| R01 (P2): generic projective-homology Kronecker theorem duplicated the pin | §7.2, lines 1392–1403: "Prove that for every `R`-module `M` and every `i ≤ n` the evaluation pairing `h_i` … of §7.1 is bijective … The proof is a transport"; contract lines 343–350 cite both native theorems | **Repaired** (applied differently, and soundly). The generic statement is gone from README and plan; §7.2 is now the Hochschild statement of HKR62 Lemma 4.1 (HKR62 lines 301–310, which I read: `Tor_i` projective for `i < k` gives `h_i` bijective for `i ≤ k`). Native theorem opened: `TauCeti/Algebra/Homology/UniversalCoefficient/Basic.lean:212` (`X : ChainComplex C ℕ`, `[∀ n, Projective (X.X n)]`, `∀ j < n, Projective (X.homology j)`), `:234`. The hypothesis "every `C_j(R,R)` is `R`-projective" is exactly the native instance hypothesis. Target ids unchanged (37 targets). |
| R02 (P2): `extLinearEquiv` listed for the general Ext comparison | Contract lines 428–436: "Both vanishing hypotheses are part of the statement … used only for the Koszul resolution of §8.2, never for the bar resolution of §4.4"; §4.4 lines 1002–1009 route through `extMk` | **Repaired.** `TauCeti/Algebra/Homology/Ext/ProjectiveResolution.lean:107` read: `h₁ : ∀ f, d (n+2) (n+1) ≫ f = 0`, `h₂ : ∀ g, d (n+1) n ≫ g = 0`. §4.4 now uses `add_extMk` (`Mathlib/CategoryTheory/Abelian/Projective/Ext.lean:154`), `smul_extMk` (:188), `extMk_eq_zero_iff` (:209, needs `p + 1 = n`, so degree ≥ 1 only, as the README says), `extMk_surjective` (:224), `extLinearEquivCohomologyClass` (:286), `Ext.linearEquiv₀` (`Mathlib/Algebra/Homology/DerivedCategory/Ext/Linear.lean:88`). `isoExt_hom_comp_homologyMap` no longer occurs in README or plan. |
| R03 (P3): two plan Checks lacked qualifications | plan 6.4 test and plan 7.1 test (`k` a nonzero field; `m ≠ 0`) | **Repaired.** README lines 1338–1339 and 1383–1386 and the plan agree. Recomputed: `k = ℚ`, `R = ℚ[x]/(x²)`: `Ω² = 0`, `HH₂ = xR ≠ 0`; `k = 0`: all zero. `k = ℤ`, `m = 1`: `δm(x) = 1`, transpose of `b₁` gives `0`; `m = 0`: both `0`. |

The repaired pattern (a native theorem restated; a library declaration cited for more than it states) was then searched for in the rest of the design, by object, in the pinned libraries. That search produced R01 below (pinned declarations consumed but not named), nothing restated.

## Verified sound

### Principles and shape

Read the whole README (1783 lines, 37 targets in 8 layers), the whole plan, the manifest, the round-3 review and the round-4 repair report. No maintainer notes were supplied.

- General library: arbitrary commutative `k` throughout, characteristic two kept (the canonical map `Ψ`, not the determinant map, is the theorem), zero ring covered by a convention, non-flat and non-projective cases separated by hypotheses, not excluded.
- Nothing re-planned: brackets, braces, derived chains, antisymmetrisation, Koszul complex and exterior biduals are imported by section; the kept variants each state their difference (lines 125–148).
- No algorithm, no copied passage, no `set_option`, no sorry'd data (no Lean file), no process words, pull-request numbers, dates, HTML anchors or machine paths in the design text; no LaTeX delimiters.
- Organisation: layers are named by mathematics, none by a source chapter; the README does not say it follows a source. The order is forced: complexes → normalisation and low degrees → bar resolution, Ext, Tor → cup and Yoneda → sign dictionary and homotopy formula → duality and HKR → polynomial case (which avoids the gap).
- Every layer ends with Examples and Dependencies (R02 corrects two of the latter). Definitions and constructions carry API bullets and at least three Checks (counted on the 15 sampled targets and on 7.2, 8.1–8.3: 3 or more each where the target is a definition or construction; theorem-only targets 3.2, 4.3, 4.4, 5.2, 8.4 carry fewer, as allowed). Every target has a locator and a Needs line.
- The gap `smooth-hkr-antisymmetrisation` is precise (every commutative `k`, every smooth commutative `A`, every `n`, the named map `ε_n`), minimal (see the supplier table: RefinedTraceMethods §1.9 at its head proves `π_n ε_n = n!`, `ε₁` an isomorphism, and the smooth quasi-isomorphism only for `ℚ ⊆ k`; KTheoryFiniteLocalFields §4.0 asserts an unnamed isomorphism), and declared with the same slug in README lines 504–509 and in the plan's `gaps`.

### Adversarial table (sampled targets, headline theorems, targets touched by findings or repairs)

`E_ij` are matrix units. Values were computed in this round.

| Statement | Instances tried and values computed | Result |
| --- | --- | --- |
| 1.1 chains | `A = M = k`: `b_n = Σ_{i=0}^n (−1)^i`, so `b₁ = 0`, `b₂ = 1`: `HH₀ = k`, `HH₁ = k/k = 0`. `Mat₂`: `b(E₁₂ ⊗ E₂₁) = E₁₁ − E₂₂`; wrong last face gives `0`. | holds; no change |
| 1.2 cochains | `A = M = k`: `δ^n = Σ_{i=0}^{n+1} (−1)^i`: `δ⁰ = 0`, `δ¹ = 1`. Wrong last sign: `δδm(a,b) = 2(mab − amb)`; at `m = E₁₁, a = E₁₂, b = E₂₂`: `mab = E₁₂`, `amb = 0`, value `2E₁₂`. | holds |
| 2.2 normalised cochains | `g(1) = 1`, `g(x^j) = 0`: `δg(1,1) = 1 − 1 + 1 = 1`, not normalised, class `0`. `D(1) = 2D(1)` gives `D(1) = 0`. `A = k`: `Ā = 0`, `N^n = 0` for `n ≥ 1`. | holds |
| 3.2 `HH⁰` | `Mat₂(k)`: `E₁₁E₁₂ − E₁₂E₁₁ = E₁₂ ≠ 0` for `k ≠ 0`; scalars central. Commutative `A`: `δm = 0` for all `m`, `HH⁰ = A`. `k = 0`: `0 = 0`. | holds |
| 3.4 `HH₁ ≅ Ω¹` | `b(1 ⊗ a ⊗ c) = a ⊗ c − 1 ⊗ ac + c ⊗ a` (Leibniz). `k[x]/(x²)`: `Ω¹ = R dx/(2x dx)`: dimension 2 over `𝔽₂`, 1 over `ℚ`; periodic resolution gives `HH₁ = R/(2x)`: same. `𝔽_p/ℤ`: `b₂ = 1` onto `C₁`, `HH₁ = 0 = Ω¹`. | holds, flat or not |
| 3.5 (touched by 3.6) twisted extension | Unit `(1, −f(1,1))·(a,m) = (a, m − f(1,1)a + f(1,a)) = (a,m)`. Gauge: image product needs `f′ = f − δg`; verified termwise. `f(x,x²) = 1` on `k[x]`: `δf(x,x,x) = 1`, products `(x³,0)` and `(x³,1)`. | holds |
| 4.2 bar resolution | `(hb′ + b′h)(a₁ ⊗ a₂) = 1 ⊗ a₁a₂ + a₁ ⊗ a₂ − 1 ⊗ a₁a₂ = a₁ ⊗ a₂`. `A = k`: `… k –1→ k –0→ k –id→ k → 0` exact at each spot. `h(x·(1 ⊗ 1)) = 1 ⊗ x ⊗ 1 ≠ x ⊗ 1 ⊗ 1`. | holds |
| 4.3 Hom out of bar | `φ ∘ b′` at `1 ⊗ a ⊗ b ⊗ 1`: `a f(b) − f(ab) + f(a) b`; at `1 ⊗ a ⊗ 1`: `a m − m a`. No sign. | holds; locator R03 |
| 4.4 `HH^n ≅ Ext^n` | `A = k = M = ℤ`: `δ⁰ = 0`, `δ¹ = id`: `H⁰ = ℤ`, `H¹ = 0`; `Ext¹_ℤ(ℤ,ℤ) = 0`. `extLinearEquiv` at `n = 0` would need `id ≫ f = 0`, i.e. `1 = 0`: correctly not used. Degree 0: `extMk_eq_zero_iff` needs `p + 1 = 0`, unavailable, so the README's separate degree-zero argument is needed and given. | holds |
| 5.2 Leibniz | `p = q = 1`: both sides `a f(b) g(c) − f(ab) g(c) + f(a) g(bc) − f(a) g(b) c` (the `f(a) b g(c)` terms cancel). | holds |
| 5.3 Yoneda on resolutions (repaired Needs) | `q = 0`: `extMk_comp_mk₀` (`Ext.lean:234`) has coefficient `+1`; `p = 0`: `mk₀_comp_extMk` (:255) has `+1` and takes a `ProjectiveResolution.Hom`. | consistent with `s(p,0) = 1` |
| 5.4 cup is Yoneda | Unsigned lift, `p = 1`: `F₀b′ = −a₀f(a₁)a₂ ⊗ a₃ + a₀f(a₁) ⊗ a₂a₃`, `b′F₁ = a₀f(a₁)a₂ ⊗ a₃ − a₀f(a₁) ⊗ a₂a₃`: off by `−1 = (−1)^p`; the factor `(−1)^{pi}` repairs it. `f̃_q ≫ g = (−1)^{pq} f ∪ g`, so `θ[f ∪ g] = (−1)^{pq} s(p,q) comp`. | holds |
| 6.2 homotopy formula (used by 7.5, 8.4) | `(1,1)`, `f = g = ∂` on `k[x]`: `δ(∂²)(a,b) = −2∂a∂b`, right side `−δ(∂²) = 2∂a∂b` = left side. `(0,1)`: both sides `g(a)x − x g(a)`; at `x = E₁₁`, `g = id`, `a = E₁₂`: `−E₁₂`. | holds |
| 7.1 duality, `h_n` | `h₁(∂_x)([1 ⊗ x]) = 1`. Asymmetric `ℤ[x]`-bimodule `ℤ` (left `x = 1`, right `x = 0`), `m = 1`: `δm(x) = 1` versus `0`. `R = k`: `h₀ = id_M`. | holds; symmetry needed |
| 7.2 evaluation pairing (new) | `ℚ[x]/(x²)`: `ann(x ⊗ 1 − 1 ⊗ x) = (x ⊗ 1 + 1 ⊗ x)` (solve `a(x−y) + (c−b)xy = 0`: `a = 0`, `b = c`), so the periodic resolution is exact; `HH₁ = R/(2x) = R/(x)`, `HH₂ = ker 2x = xR`; `M = ℚ`: `HH² = ℚ`, `Hom_R(xR,ℚ) = ℚ`, `h₂(f)(x e₂) = x f(e₂) = 0`. `n = 1`: `HH₀ = R` free, `h₁ : ℚ → Hom_R(R/(x),ℚ) = ℚ` bijective. `𝔽₂`: differentials `0`, all `HH_j = R`. `𝔽_p/ℤ`: `C_j = 𝔽_p`, `δ^i = 0` (even), `id` (odd): `HH^i = 0 = Hom(HH_i, M)`, `i ≥ 1`. `k = 0`: `0 → 0`. | holds; negative control genuine |
| 7.3 exterior duality | `P = R²`: both maps give `det I₂ = 1`; `e₂* ∧ e₁*`: `−1`. Evaluation at `X = P*` gives `det(f_i(v_j))`, the transpose: same determinant. `P = 0`: `⋀⁰ = R`, identity. `P = R`, `n = 2`: `0 → 0`. | holds |
| 7.5 determinant cocycle | `Σ_σ sgn σ Π_i D_{σ(i)}(r_i) = det(D_j(r_i))`. `k[x,y]`: `⟨∂_x,∂_y⟩(x,y) = 1`, `(y,x) = −1`; on `ε^cl₂(dx ∧ dy)`: determinant `1 − (−1) = 2`, cup `1 − 0 = 1`. `𝔽₂`: `δ(D₁D₂)(a,b) = −(D₁a D₂b + D₂a D₁b) = det`. Injectivity: the cochain determines `τ_n(ξ)` on generators `dr₁ ∧ ⋯ ∧ dr_n`. `n = 0`: `⟨⟩ = 1`. | holds |
| 7.6 cohomological HKR (headline) | `𝔽₂[x,y]`: `Ψ₂` pairs to `1`, determinant class `2Ψ₂ = 0`. `ℤ[1/2]/ℤ`: `C^n = Hom_ℤ(ℤ[1/2], M) = M`, `δ` alternates `0`, `id`: `HH^n = 0 = Der`. Inseparable `𝔽₂(u)[a]/(a² − u)`: `Rᵉ = R[b]/((b − a)²)`, differentials `0` on `R`: `HH² = R ≠ 0 = T²`. `k[x, x⁻¹]`: `HH¹ = R ∂_x`, `HH² = 0`. (5): `Ω^n = 0` for `n > d`. | holds under smooth + `k`-projective + gap |
| 8.1 diagonal (R01) | `Y_i = −t_i`, a unit multiple of a variable of `MvPolynomial (Fin m) R`. `m = 0`: empty. `k[x]/(x²)`: `t(x ⊗ 1 + 1 ⊗ x) = 0`. | holds; cite the pinned theorem |
| 8.2 Koszul resolution (repaired) | `m = 1`: `d₁ ≫ g = (X − X) g(1) = 0`, `K₂ = 0`: both hypotheses of `extLinearEquiv`; `Ext⁰ = Ext¹ = R`. `m = 2`: ranks `1, 2, 1`. `m = 0`: `Ext^j = 0`, `j ≥ 1`. `d(e₁ ∧ e₂) = t₁e₂ − t₂e₁` equals the pinned `φ(u)v − φ(v)u`. | holds |
| 8.3 comparison | `b′(1 ⊗ X₁ ⊗ X₂ ⊗ 1 − 1 ⊗ X₂ ⊗ X₁ ⊗ 1) = t₁(1 ⊗ X₂ ⊗ 1) − t₂(1 ⊗ X₁ ⊗ 1)` (the `1 ⊗ X₁X₂ ⊗ 1` terms cancel). `m = 0`: `ι₀ = id_k`, `ι_n : 0 → k`. | holds |
| 8.4 polynomial bases (headline) | `h_n[∂_I cup](ε(dX_J)) = det(∂_{i_a} X_{j_b}) = δ_{IJ}`. `m = 1`: `HH₀ = HH₁ = R`, higher `0`. | holds, without the gap |
| 8.5 top degree | `m = 2`, `(X₁², X₂)`: `det = 2X₁`, normalised `g X₁`. `m = 0`, `g = 2`: cochain, class and normalised value all `2`. `m = 1`: `g∂`, no factorial. `𝔽₃`, `m = 3`: factor `6 = 0`. | holds |
| Gap `smooth-hkr-antisymmetrisation` | `𝔽₂[x,y]`: `π₂ε₂ = 2 = 0`, so `π ε = n!` does not give `ε₂` bijective; §8.4 gives it for polynomial rings independently. | precise and needed |

### Sources: the seeded sample

Read from the cached extractions: Ginz05, HKR62, AV20 (StacksSmooth not needed by the sample). Loday98, Ger63, Weibel94, CE56 and Mat86 are settled uncertified and were not requested. No author-flagged unverified locator exists. Every cited work has one manifest entry; `sources.toml` was not changed.

| Target | Locator read | Outcome |
| --- | --- | --- |
| 1.1 | Ginz05 lines 973–976 | Boundary with both end actions, as in the conventions. |
| 1.2 | Ginz05 lines 1055–1062 | `bm(a) = am − ma`, the degree-one and general coboundary: the README's `δ`. |
| 2.2 | Ginz05 lines 1120–1128 | Reduced cochains as `Hom_k(Ā^{⊗n}, M)`; field setting, as the README says. |
| 3.2 | Ginz05 lines 1066–1069 | `HH⁰(M)` is the centre of `M`; `HH⁰(A) = Z(A)`. |
| 3.4 | Ginz05 lines 1914–1926 | `Ω¹_com(A) ≅ HH₁(A)` from the 1-boundaries. |
| 4.2 | Ginz05 lines 747–782; HKR62 lines 433–447 | Bar complex, homotopy `h`, degree-two check; HKR62 gives `S`-projectivity for `K`-projective `R` and the right-linear homotopy. |
| 4.3 | Ginz05 lines 1033–1062 | Supports. HKR62 lines 284–298 do not (R03). |
| 4.4 | Ginz05 lines 984–988; HKR62 lines 337–351 | Ginz05 defines `HH^•` as `Ext` over `Aᵉ` (field setting); HKR62 gives the degree-one derivation class. |
| 5.2 | Ginz05 lines 1342–1350 | Leibniz rule and descent to cohomology. |
| 5.4 | Ginz05 lines 1348–1350; HKR62 lines 479–484 | Ginz05 asserts the Yoneda identification; HKR62 gives the value-wise product on `Hom_S(Y, R)`. The sign `(−1)^{pq} s(p,q)` is the README's own, computed above. |
| 7.1 | HKR62 lines 284–298, 352–364 | The map `h`, and `h₁` on derivations as `Σ x dy ↦ Σ x ζ(y)`. |
| 7.3 | HKR62 lines 531–535 | Dual of exterior algebra for a direct summand of a finite free module. |
| 7.5 | Ginz05 lines 2142–2156; HKR62 lines 509–521; AV20 lines 237–243 | Alternation map, `π ∘ alt = p!`; alternating forms on derivations; the factor `t!`. |
| 7.6 | HKR62 lines 301 (Lemma 4.1), 495, 522 (Theorem 5.1), 528–546, 548 (Theorem 5.2); AV20 line 70 (Proposition 1.2); Ginz05 line 2086 (Theorem 9.1.3) | All present where cited. Theorem 5.1 assumes `K`-projective `R`, as the README says; Theorem 5.2 is the perfect-field regular case, stated as a special case. |
| 8.5 | Ginz05 lines 2142–2156; HKR62 lines 495, 548 | Present; the `m = 0` and factorial statements are the README's, computed above. |

### Pinned declarations opened this round

Pins: Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e`, Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5` (the plan's `baseline` agrees).

- `Mathlib/CategoryTheory/Abelian/Projective/Ext.lean`: `extMk` 139, `add_extMk` 154, `smul_extMk` 188, `extMk_hom` 196, `extMk_eq_zero_iff` 209, `extMk_surjective` 224, `extMk_comp_mk₀` 234, `mk₀_comp_extMk` 255, `extLinearEquivCohomologyClass` 286 (no hypothesis on differentials).
- `Mathlib/Algebra/Homology/DerivedCategory/Ext/Basic.lean:171` (`comp_hom`); `Ext/Linear.lean:88` (`linearEquiv₀`).
- `Mathlib/CategoryTheory/Abelian/Projective/Resolution.lean`: `liftHomotopy` 162, `homotopyEquiv` 180; `Mathlib/CategoryTheory/Preadditive/Projective/Resolution.lean:145` (`Hom`).
- `Mathlib/Algebra/Homology/Homotopy.lean`: `CategoryTheory.Functor.mapHomotopyEquiv` 870, `HomotopyEquiv.toHomologyIso` 946; `Mathlib/Algebra/Homology/Opposite.lean:428` (`Homotopy.op`).
- `Mathlib/Algebra/Category/ModuleCat/Projective.lean:27`: `ModuleCat.projective_of_categoryTheory_projective` takes `[Module.Projective R P]` and gives `CategoryTheory.Projective P`: the direction the README uses.
- `Mathlib/Algebra/Module/Projective.lean:240` (`Projective.tensorProduct`); `Mathlib/Algebra/Category/ModuleCat/Basic.lean:437` (`ModuleCat.Algebra.instLinear`, scoped); `Mathlib/LinearAlgebra/TensorPower/Basic.lean:75` (`TensorPower.mulEquiv`); `Mathlib/LinearAlgebra/ExteriorPower/Pairing.lean:71`, `Basis.lean:182`, `Basic.lean:418`; `Mathlib/RingTheory/Smooth/Basic.lean:71`; `Mathlib/AlgebraicTopology/DoldKan/Degeneracies.lean:180`; `Mathlib/Algebra/Homology/Embedding/Basic.lean:226`; `Mathlib/CategoryTheory/Abelian/LeftDerived.lean:109`.
- `TauCeti/Algebra/Homology/UniversalCoefficient/Basic.lean:212, 234`; `TauCeti/Algebra/Homology/Kronecker.lean:106, 113, 124` (source of `kronecker` is the homology of `linearYonedaObj`, as the contract says); `TauCeti/Algebra/Homology/Ext/ProjectiveResolution.lean:107`; `TauCeti/LinearAlgebra/ExteriorPower/Basic.lean:145`; `TauCeti/RingTheory/HochschildCohomology/Coboundary.lean` (cofaces, both cocycle characterisations); `TauCeti/RingTheory/Derivation/Bimodule.lean:41`; `TauCeti/Algebra/Lie/Derivation/Basic.lean:272`; `TauCeti/LinearAlgebra/TensorProduct/Balanced/OuterFactors.lean:88`; `TauCeti/Algebra/Homology/AInfinity/Algebra/Hochschild/Cohomology.lean:213, 228`.
- Duplication by object in the Tau Ceti pin (files mentioning Hochschild, enveloping algebras, bimodule resolutions, cup products, Koszul complexes, regular sequences): the only uncited consumed objects are those of R01. `TauCeti/Algebra/Homology/Monoidal/Cup.lean` (cup product along a diagonal in a monoidal category) does not give §5.1: chain complexes of `Aᵉ`-modules under `⊗_A` are not an instance of its monoidal hypotheses at the pin, and §5.1 is defined by its formula. `TauCeti/RepresentationTheory/Quiver/PathAlgebra/BimoduleResolution.lean` is the path-algebra case, not the bar resolution. `TauCeti/Algebra/CentralSimple/Bimodule.lean` is a type synonym for one homomorphism, not the equivalence of §4.1.

No backticked identifier in the README is presented as this roadmap's own Lean declaration; the plan's `HochschildHKR.*` names are design metadata.

### Cross-roadmap citations, overlaps and supplier order

Every citation was resolved now, on main or at the open head given by the roadmaps service.

| Citation | Where it resolves | Agreement |
| --- | --- | --- |
| DGAInfinity Layers 0, 1, 8 | main, `TauCetiRoadmap/DGAInfinity/README.md:263, 293, 520` | Headings exist. |
| DerivedModuleAlgebra §0.K.1 | main, `TauCetiRoadmap/DerivedModuleAlgebra/README.md:649` | Koszul complex of a finite sequence, degree `−1` derivation `e_i ↦ x_i`; its contract table (line 126) records the Tau Ceti formalisation (R01). |
| KTheoryFiniteLocalFields §4.0 | open head, README line 639, item "Cyclic homology foundations" (line 651) | Derived chains on DGAInfinity Layer 8; smooth HKR comparison asserted without naming the map; check `HH₀(A) = A/[A,A]`. |
| RefinedTraceMethods §§1.1, 1.9, 1.10 | open head, README lines 84 (item at 115), 404, 445 | §1.1: for `k`-flat `A` the object is the totalisation of the cyclic bar. §1.9: `ε_n` (indexed by `σ⁻¹`, same chain), `π_n ε_n = n!`, `ε₁` an isomorphism for every commutative `A`, `B ε_n = ε_{n+1} d`; smooth quasi-isomorphism only for `ℚ ⊆ k`. §1.10: `HH_{2n}(𝔽_p/ℤ) = 𝔽_p`. The gap is not already provided. |
| EulerSystemsAndKolyvaginSystems §6.1 | open head, README line 3943 | "This map is an isomorphism for finite projective X", for the supplied `toExteriorBidual` of any `R`-module. |
| IntegralIwasawaTheory §12.6 | open head, README line 1846 | Shared exterior-bidual core, arguments `R, r, M`, flip of `pairingDual`, determinant formula, naturality. |
| DerivedDeRhamCohomology Layer 2 | open head, README line 3040 | Scope deferral only. |
| LanglandsParameterStacks §1.17 | open head, README line 525 | Scope deferral only. |
| NoncommutativeGeometry N1, BanachAlgebras Layer 6, ZigzagPreprojective Layer 7 | main, lines 479, 1379, 1047 | Scope deferrals only. |

`roadmaps resolve` on the README: no cross-roadmap citation and no Lean name found nowhere. The overlaps report lists no other pull request changing this roadmap, no dropped id, no id defined only by an open revision, and no second copy on main (no `HochschildHomologyAndHKR` folder on main). No board package and no open roadmap states the classification of square-zero extensions by `HH²` with bimodule coefficients (`roadmaps grep`, no match). CyclicHomologyLieHomologyAndQuasiFreeAlgebras owns quasi-free algebras and uses `Ext²` over `Aᵉ` as a characterisation; it does not own Hochschild cohomology with bimodule coefficients, and nothing is handed in either direction.

Overlap check: read CyclicHomologyLieHomologyAndQuasiFreeAlgebras, RefinedTraceMethods, DGAInfinity, NoncommutativeGeometry, ZigzagPreprojective; nothing shared (antisymmetrisation and derived chains: RefinedTraceMethods and KTheoryFiniteLocalFields, imported; brackets, braces and graded cochains: DGAInfinity, imported; the ungraded complexes with bimodule coefficients, `Ext`/`Tor` comparison and cohomological HKR: this roadmap).

Dependency check output:

```text
candidate: HochschildHomologyAndHKR is not in the merge order yet; checked as if placed after RefinedTraceMethods (the intake inserts it when its design is accepted)
depcheck: 206 roadmaps, 1900 edges, 0 problem(s)
```

No UPWARD or CYCLE line. All suppliers (IntegralIwasawaTheory, KTheoryFiniteLocalFields, EulerSystemsAndKolyvaginSystems, RefinedTraceMethods, and three on main) are earlier than the placement; none is on the never-cite list. Every Needs line was read: local edges run forward only, and Layer 8 does not use §6.4(d) or §7.6.

### Headline theorems and Lean

Headlines from the summary: normalisation over every `k`; the low-degree identifications and the `HH²` classification; `HH^n ≅ Ext^n` and `HH_n ≅ Tor_n` for `k`-projective `A`; cup equals Yoneda up to sign; the sign dictionary, homotopy formula and graded commutativity; the cohomological HKR theorem with `[⟨D₁,…,D_n⟩] = n! Ψ_n`; the polynomial bases and the top-degree formula. There is no `Suggested.lean` at the design stage: no padding probe, no binder audit and no import check apply. Elaboration: not available (this lane does not elaborate). For the package stage: §7.2 is a transport of one native theorem and should stay a README target, not a sorried statement.

Ginz05 lines 2147–2150 (the two issues recorded in round 3) were re-read and stand as recorded there; they are not repeated below.

## Not verifiable

- Loday98, Ger63, Weibel94, CE56, Mat86: settled uncertified; their section and theorem numbers were not checked against the texts.
- Lean elaboration and any one-tactic probe: no Lean file exists at this stage, and this lane does not elaborate.
- The closed form of the sign `s(p,q)` of §5.3 for `p, q ≥ 1`: the design makes it a target and does not state a formula; only `s(p,0) = 1` and the `p = 0` case were checked at the pin.
- The declared gap is a contract on RefinedTraceMethods §1.9, not a statement that exists today.
- Whether the missing sign in Ginz05 line 1051 (below) is in the typeset text or only in the extraction: read from the text extraction only.

## Source issues

- **Misprint** in Ginz05 at §5.2, the Hochschild boundary recalled before the cochain formulas, printed p. 22 (lines 1049–1053): the source says the middle sum of the boundary has no signs; it should carry `(−1)^j` on the `j`-th term, as in §5.1, printed p. 20; affects nothing.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "a7162caafbb676430a4e292b65c29af51619211e", "job": "REV-DESIGN-HochschildHomologyAndHKR~4", "model": "fable", "worker": "chris-x8"} -->
