<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13026#issuecomment-6902338060 -->
Review (claude) of 9651e2c

Verdict: needs_changes

1. **F01** (P2) The étale derived category of an arc-stack is used in three sections and defined nowhere

   **Location.** `packages/MotivesAndAlgebraicCyclesPartII/README.md:679` (§4.8): "the subcategory of `p`-power torsion objects of `Deff_mot(Marc(A))` is the left-completed derived category of `p`-power torsion étale sheaves"; `:1401` (§12.3): "`Dmot(Y, ℤ/n) ≃ Det(Y, ℤ/n) → Det(X, ℤ/n)`"; `:1415` (§12.4); *Needs* at `:691`.

   **Claim.** For every Banach ring `A` with `|p| ≥ 1` everywhere, and for every arc-stack `Y = a′^* X`, an étale derived category of `Marc(A)`, respectively `Det(Y, ℤ/n)`, exists as a named object, supplied by DiamondEtaleCohomology §§C2.2, C2.12.

   **Witness.** DiamondEtaleCohomology §C2.2 (its line 789) defines `D_ét(Y, Λ)` for "a small `v`-stack" only. For `A = ℂ`, `p = 2`: `|2| = 2 ≥ 1`, and `Marc(ℂ)` is no v-stack. The README defines `Det` of an arc-stack nowhere, nor `Dmot(Y, ℤ/n)`.

   **Exact repair.** State the object this roadmap means; it is the one the route of §4.8 already uses ("on strict bases the `p`-power torsion objects are sheaves on a profinite set").

   1. In §4.8, before "Prove:", insert: "For a small arc-stack `X` and a ring `Λ`, let `Det(X, Λ)` be the full subcategory of `Dfin(X, Λ)` of the objects `M` for which `M(C) → M(C′)` is an equivalence for every extension `C ⊂ C′` of geometric Banach points over `X`; its objects are the *étale sheaves* of `Λ`-modules on `X`. It is closed under colimits and stable under pullback. For a strict `A`, pushforward along `ν : Marc(A)_arc → M(A)` (§1.3) is an equivalence from `Det(Marc(A), Λ)` to the derived category of sheaves of `Λ`-modules on the profinite set `M(A)`, with inverse `F ↦ (B ↦ RΓ(M(B), π_B^* F))` for strict `B` over `A` and `π_B : M(B) → M(A)`; so `X ↦ Det(X, Λ)` is determined by these values (§1.1)."
   2. In the same sentence replace the third clause by: "and if `|p| ≥ 1` everywhere on `M(A)`, the `p`-power torsion objects of `Deff_mot(Marc(A))` are exactly the `p`-power torsion objects of `Det(Marc(A), ℤ)`, which on a strict `A` form the derived category of `p`-power torsion sheaves on the profinite set `M(A)`".
   3. Add to the Checks of §4.8:
      - "At a geometric Banach point `C`, `Det(Marc(C), Λ) = D(Λ)` through `M ↦ M(C)`, and the constant sheaf is étale; for `C` of characteristic `p` with `n` prime to `p` this is the étale derived category of `Spa(C, O_C)` of DiamondEtaleCohomology §C0.19."
      - "Integrally `Det` and `Deff_mot` differ. Over a nonarchimedean geometric point `C`, `Ḡ_m` is effective (§3.3) and not étale: for `C′` the completed algebraic closure of the residue field of the Gauss point of `C⟨T⟩₁`, the class of `T` in `C′^×/(1 + C′_{<1})` is not in the image of `C^×`, its residue class being transcendental over the residue field of `C`. Its reduction `Ḡ_m ⊗^L ℤ/n = μ_n[1]`, `n` prime to the residue characteristic, is étale."
      - "Over a complex Banach algebra every geometric Banach point is `ℂ` with its absolute value and every extension is an isomorphism, so `Det = Dfin`, in accordance with `Deff_mot = Dfin` there (§2.1)."
   4. In the *Needs* line of §4.8 replace "DiamondEtaleCohomology §§C2.2, C2.12 (…)" by "§§1.1, 1.3 (the strict basis and stalks along `ν`)", and delete "DiamondEtaleCohomology §§C2.2, C2.12" from the *Dependencies* of Layer 4 (README:725); Layer 12 keeps them.
   5. In §12.3, after the displayed functor add: "Here `Dmot(Y, ℤ/n)` is the category of `ℤ/n`-module objects of `Dmot(Y)`, `Det(Y, ℤ/n)` is the category of §4.8 for the arc-stack `Y`, and `Det(X, ℤ/n)` is the étale derived ∞-category of the small v-stack `X` (DiamondEtaleCohomology §§C2.2, C2.12)."
   6. In Conventions add: "For a ring `Λ`, `Deff_mot(X, Λ)` is the full subcategory of ball-invariant objects of `Dfin(X, Λ)`, and `Dmot(X, Λ)` is obtained from it by inverting the Tate object as in §8.1."

   **Repair tested.** `A = ℂ`, `p = 2`: `Det(Marc(ℂ), ℤ) = D(ℤ)` and `Deff_mot(Marc(ℂ)) = D(ℤ)`; their 2-power torsion objects agree. `A = Cont([0,1], ℂ)`: `Det = Dfin = Deff_mot` (the README's Check of §2.7). `A = ℂ_ℓ`, `p ≠ ℓ`: both sides are the `p`-power torsion objects of `D(ℤ)`, as the first Check of §4.8 says. `A = ℚ_ℓ`: `Det(Marc(ℚ_ℓ), ℤ/p)` is `M ↦ M(C)^{hG}` of §1.3, continuous Galois modules. `Y = a′^* Spa(C, C⁺)` of higher rank: `Det(Y, ℤ/n) = D(ℤ/n)`, whose image in sheaves on the chain `|Spa(C, C⁺)|` is the constant ones, the overconvergent ones (first two Checks of §12.3). Clause 2 follows from the first clause of §4.8: a `p`-power torsion `M` is the colimit of the `(M ⊗^L ℤ/p^m)[−1]`, and both subcategories are closed under colimits and cofibres.

2. **F02** (P3) A cited JacobianChallenge declaration does not exist

   **Location.** `packages/MotivesAndAlgebraicCyclesPartII/README.md:97`: "Layer D (`pointedCurvePicard_representable`, the identity component `Pic⁰`)".

   **Claim.** JacobianChallenge, Layer D, has a declaration of this name.

   **Witness.** `TauCetiRoadmap/JacobianChallenge/README.md` on main (`eb4a735`) has no occurrence; `roadmaps grep --fixed pointedCurvePicard_representable` returns "no match on main or in any open roadmap pull request"; the pinned Tau Ceti and Mathlib have none.

   **Exact repair.** Replace the parenthesis by "Layer D (§D.5 `isRepresentable_picZeroSets`: the degree-zero Picard sheaf of a smooth proper geometrically connected curve over any field is representable by an open and closed subgroup scheme `Pic⁰` of `picardScheme`; §D.8 `jacobianScheme`, its representing object)".

   **Repair tested.** JacobianChallenge on main: `isRepresentable_picZeroSets` at its line 987 (§D.5), `jacobianScheme` and `jacobianSchemeRepresentableBy` at lines 1070–1071 (§D.8). The route of §4.3 ("over the Picard scheme of JacobianChallenge Layer D form the torsor of trivializations") uses exactly these. The other two names of README:97 exist: `classGroupAddEquivLineBundleClass` (its lines 185, 393), `multiplication_isogeny` (its line 1292, `n ≠ 0`, finite locally free and surjective).

3. **F03** (P3) The universal property of `DM_et(k, ℤ)` names no target category

   **Location.** `packages/MotivesAndAlgebraicCyclesPartII/README.md:1121`: "A colimit-preserving symmetric monoidal `ℤ`-linear functor out of `DM_et(k, ℤ)` is the same as a symmetric monoidal functor out of smooth `k`-schemes satisfying étale hyperdescent and `A¹`-invariance and sending the reduced `G_m`-object to an invertible object."

   **Claim.** The sentence states a universal property.

   **Witness.** No target is named. For the target of sets, `X ↦ π₀(X)` is symmetric monoidal on smooth schemes over an algebraically closed `k`, but "reduced `G_m`-object" (a cofibre) and "hyperdescent" (a colimit condition) have no meaning there.

   **Exact repair.** Replace the bullet by: "For every presentably symmetric monoidal `ℤ`-linear stable ∞-category `𝒟`, restriction along `X ↦ M(X)` identifies the colimit-preserving symmetric monoidal `ℤ`-linear functors `DM_et(k, ℤ) → 𝒟` with the symmetric monoidal functors `F` from smooth finite-type `k`-schemes, with the product, to `𝒟` that send étale hypercovers to colimit diagrams, send `X × A¹ → X` to an equivalence, and send `cofib(F(Spec k) → F(G_m))`, formed along the unit section, to an invertible object."

   **Repair tested.** `𝒟 = Dmot(k)`, `F = ℤmot[(−)^arc]`: hypercovers go to colimits (route of §10.6), `A¹` to the unit, the cofibre is `ℤ(1)[1]`, invertible; `F` factors, which is the functor of §10.6. `𝒟 = Deff_mot(k)`, same `F`: `ℤ(1)[1]` is not invertible before stabilization (§8.1), no factorization. `𝒟 = D(ℤ)`, `F(X) = ℤ[π₀ X]`: the cofibre is `cofib(ℤ → ℤ) = 0`, not invertible, excluded. `𝒟 = D(ℤ)`, Betti chains over `k = ℂ`: the cofibre is `ℤ[1]`, invertible, `F` factors.

Three findings: one P2 and two P3; one blocking. The five findings of round 8 are repaired and the repaired passages survive the adversarial pass. The new findings are in text that no earlier repair touched (R01, R02) and in one sentence the last repair rewrote (R03). No file of the package was changed by this review.

## Verified sound

### Previous findings (round 8)

| Finding | Repaired passage | Assessment |
|---|---|---|
| F01 (P2): descent against hypercovers in §10.1 | README:1117: "obtained by imposing étale hyperdescent, that is by localizing at the étale hypercovers of smooth `k`-schemes"; README:1121 "étale hyperdescent"; README:1201 "A comparison over non-closed fields is not asserted."; README:1203, route | Repaired. CD lines 1149–1162 (Definition 2.2.2, Proposition 2.2.3, p. 25) and Bachmann lines 713–715 (§5, p. 13) read. |
| F02 (P3): "analytic" and its locator | README:26: "equivalently, every completed residue field `K(x)`, `x ∈ M(A)`, is nondiscrete, which is the form of Scholze, Definition 2.17, p. 11", with both implications proved | Repaired. Scholze line 462 (p. 11), line 509 (Definition 2.20, p. 12), lines 287 and 299 (Definitions 2.1, 2.2, pp. 7–8). |
| F03 (P3): the letter `R` | README:1254 "`μ_n(k) ⊗_ℤ S`" and "`H = ℚ[t, t⁻¹] ×_ℚ ℤ[1/p]`"; README:1267; README:1303 "`ℤ[1/p] ⊕ tℚ[t]`"; README:1309 "write `R = ℤ[1/p]`" | Repaired. In Layer 11 `R` occurs only in §11.6. |
| F04 (P3): "on main" in a heading | README:103: "### From TauCetiRoadmap.MotivesAndAlgebraicCycles, MotivicEtaleKTheory and further roadmaps" | Repaired. |
| F05 (P3): manifest and the author's copy | `sources.toml:22`: `"10.3-10.6"`, `"Conventions"`; README:1441 "(arXiv v3)" | Repaired. |

No finding of the last repair report was marked not actionable. No maintainer note was left.

**Repair-pattern audit.** F01 (a definition and its route naming different objects): every use of "descent" and of "étale" was reread; this pattern found R01, where §4.8 and §12.3 name an étale category that the cited supplier defines for another carrier. F02 (a locator that covers part of a sentence): the 15 sampled locators and 9 further ones each cover the whole sentence. F03 (one symbol for several objects): none left in Layers 0–12. F04 (status sentences): a search for "on main", "pull request", "so far", "current", "removed", "review", "optional", "deferred", "for later", LaTeX delimiters, HTML anchors and machine paths returns nothing; "merge order" (README:1437) is vocabulary that six roadmaps on main use. F05 (manifest against the text): Scholze 99, CD 11, Bachmann 5, vanDerPut 1, BLR 1, Vakil 1 locators in the body, each work in the manifest with the citing sections.

### Principles, shape and policy

- 13 layers, 82 numbered targets, 82 *Needs* lines, 52 Checks blocks, 32 API blocks, 13 *Examples* and 13 *Dependencies* subsections. Each of the 34 definitions read (§§0.1–0.4, 0.6, 0.8, 1.2, 1.4, 1.5, 2.1, 2.2, 2.5, 2.7, 3.1, 3.2, 3.4, 4.1, 4.3, 4.9, 6.1, 7.1, 7.4, 8.1, 9.5, 10.1, 10.2, 11.1, 11.3, 11.5, 11.6, 12.1, 12.2, and the inline ones of §§8.5, 12.3) has an API or stated closure properties and at least three Checks.
- A script over the 82 *Needs* lines found no citation of a later section of this roadmap. Checks do cross-refer to later sections as consistency tests (§2.7 to §8.5, §6.1 to §7.6, §9.5 to §§10.5, 11.1, 11.4); no target's statement or route does.
- No route-specific shortcut (residue characteristics 2 and 3, archimedean points, trivially normed fields and the zero ring are all treated), no algorithm, no sorry'd data, no `set_option`, no `lemma` declaration.
- The README does not say it follows a source; no layer is named after a source's section.

### Source sample (all 15 seeded targets, read at the locator)

The author flags no locator as unverified other than BLR, settled as uncertified.

| Target | Lines read | Result |
|---|---|---|
| 0.2 | Scholze 605–611 (Def. 3.1, p. 14), 614–657 (Props 3.2–3.3, pp. 14–15) | Agrees. The README tests lifting on geometric Banach points instead of all Banach fields; equivalent, since every point of `M(A)` comes from one and Prop. 3.2(i) amalgamates. |
| 2.3 | Scholze 1272–1282 (Prop. 5.10 and proof, p. 30) | Agrees: amplitude `[0, 1]`, two-column spectral sequence. |
| 2.6 | Scholze 1351–1360 (Thm 5.14, p. 32) | Agrees: the factorization is a hypothesis; base change and projection. |
| 4.2 | Scholze 1549–1572 (Lemma 6.4 and proof, pp. 36–37); vanDerPut 57–58 (Thm 1.1, p. 156), 163–166 (Cor. 1.3, p. 159), 27–29 (algebraically closed complete field) | Agrees. Separation is the README's added hypothesis, with its own witness. |
| 4.7 | Scholze 1481–1499 (Thm 6.1 and proof, p. 35) | Agrees; "nonarchimedean" is the source's standing restriction (line 1482). |
| 5.3 | Scholze 1707–1716 (Thm 7.1, Remark 7.2, pp. 40–41), 224–226 (Thm 1.9, p. 6) | Agrees. |
| 6.1 | Scholze 1872–1889 (Def. 8.3, Prop. 8.4 and proof, pp. 44–45), 182–185 (Thm 1.7(i), p. 5) | Agrees. |
| 6.2 | Scholze 1897–1936 (proof of Prop. 8.5, pp. 45–46), 1864 (connectivity, p. 44) | Agrees; the realization argument is the README's own completion of "one sees". |
| 6.3 | Scholze 1894–1896, 1937–1942 (Prop. 8.5, Cor. 8.6, pp. 45–46), 186–190 (Thm 1.7(ii), p. 5) | Agrees: eigenvalue `2ⁿ` on the `n`-th piece. |
| 7.6 | Scholze 1988–1990 (Thm 8.9, p. 47), 2007–2011 (start of proof, p. 48), 191–194 (Thm 1.7(iii), p. 5) | Agrees. |
| 9.2 | Scholze 2273–2281, 2298–2300 (proof of Prop. 10.3, pp. 54–55) | Agrees: factorization through a quasi-compact subset; tensor products of compact morphisms. |
| 9.4 | Scholze 2248–2258 (Cor. 10.2 and the following discussion, pp. 53–54) | Agrees. |
| 10.4 | CD 2048–2055 (Thm 5.2.2 with (5.2.2.a), p. 44), 1896–1901 (Thm 4.5.2, p. 41), 1907–1910 (Cor. 4.5.3, p. 41); Scholze 2401–2404 (Remark 11.2, p. 57) | Agrees; `Gr^j_γ K_{2j−q}` with `q = −i` gives `π_i = K_{i+2j}^{(j)}`. |
| 11.5 | Scholze 2538–2553 (definition of `MG_C`, band and `h_* O`, pp. 60–61) | Agrees. |
| 11.7 | Scholze 2557–2565 (Thm 11.9 and proof, p. 61) | Agrees, including "the identity of the value group, not merely a nonzero scalar". |

Also read: Scholze 136–146 (Prop. 1.5), 999–1012 (Defs 4.17, 4.19, Cor. 4.18), 1469–1479 (proof of Prop. 5.19), 1500–1548 (Def. 6.2, Thm 6.3), 1649–1672 (Cor. 6.6, Thm 6.7, Prop. 6.8), 1841–1870 (Cors 8.1–8.2), 1943–2002 (Props 8.7–8.8, Cor. 8.10), 2012–2060, 2215–2245 (Prop. 10.1), 2395–2412 (Thm 11.1), 2494–2537 (Props 11.6–11.8), 2566–2578, 2636–2659 (Props 12.3–12.4); Bachmann 70–76, 706–721; CD 1146–1162; Vakil 24235, 24276, 24285 (Exercise 20.2.A, (20.2.4.1), Exercise 20.2.B, pp. 580–582).

### Adversarial table

Values computed in this round. "Retain" means no edit.

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| Conventions, "analytic" (repaired) | trivial `k`; `ℝ`; `ℤ_p`; zero ring | `{0}` generates `0`, one discrete point: (fail, fail). `1 = 2 · (1/2)`: (hold, hold). Ideal `(p)`, units have norm `1`, residue `𝔽_p`: (fail, fail). `1 = 0`, `M = ∅`: (hold, hold). | Retain. |
| Conventions, seminormed ring | `|1|` | `|1| ≤ |−1|² ≤ 1` and `|1| ≤ |1|²`, so `|1| ∈ {0, 1}`; `0` only for the zero ring. | Retain. |
| §0.2 lifting criterion | discrete point of `M(k)` | `k ⊂ k((T))_{1/2}`, nondiscrete, restricts to the trivial norm; its completed algebraic closure is a geometric point over it. | Retain. |
| §0.3 `A((T))_{1/2}` | `u = 1/3` over `ℂ`; `1 + 2T` | `|T^{−n}| = 2ⁿ < 3ⁿ`; supremum norm of the square `2 > 1`, sum norm `4 ≤ 4`. | Retain. |
| §2.3 | complex point | Disc of dimension 2 but every finitary sheaf effective; no spectral sequence needed. | Retain. |
| §2.6 | `n = 0` | Finitary left adjoint of §1.6 followed by `L_B`. | Retain. |
| §2.7(c) | `ℙ¹_ℂ`, `N = 1` | `3N + N = 4`, sphere has dimension `2 ≤ 4`. | Retain. |
| §2.7 Check, stalk | `F_n` skyscrapers at `1/n` | Stalk at `0` of the product is `∏ℤ/⊕ℤ ≠ 0`; product of stalks `0`. | Retain. |
| §3.5 criterion | `T² + T/2 + 4` over `ℂ₂`; `T² − 1`; `n = 1` | Valuations `(2, −1, 0)`, slopes `−3, 1`, root norms `1/8, 2`; `min(4, (1/4)·4) = 1 < 2 = |a₁|`; both roots norm `1`; `a₀ ∈ T(r₁, r₂)`. | Retain. |
| §4.2 | open unit disc; doubled origin | Complement `{|1/T| ≤ 1} ∋ ∞`; `ϖⁿ` has two limits. | Retain. |
| §4.6 Check | `x^ℓ − x = T` in `k[T^{1/ℓ^∞}]` | `c₁ = 0` by descent from the top degree, `c_{1/ℓ}^ℓ = 1`, `c_{1/ℓ^{m+1}}^ℓ = c_{1/ℓ^m} ≠ 0` for all `m`. | Retain. |
| §4.7 | complex point (outside the range) | Dold–Thom; the README restricts to the nonarchimedean locus as the source does. | Retain. |
| §4.8 Check | `‖x‖ = 2^{−⌊v₂(x)/2⌋}` on `ℤ₂` | `‖2‖ = 1`; `c ≤ 1`, `c² ≤ 1/2`, `c³ ≤ 2^{−3/2} ≤ 1/2`: spectrum `[0, 2^{−1/2}]`. | Retain. |
| §4.8 third clause | `A = ℂ`, `p = 2`; `A = ℚ_ℓ` | `|2| = 2 ≥ 1`; `Marc(ℂ)` is no v-stack; no étale category defined. | Fails: R01. |
| §5.3 headline | complex point; `X = ∅` | `ℤ(1) = ℤ`, identity functor; zero category. | Retain. |
| §6.1 Check | `C = ℂ₂` | `π₀ = ℤ[1/2]`; `2 · r(1/2) = 1` has no solution in `ℤ`. | Retain. |
| §6.2 | `n = 2` | Antipodal map on `S²`: `+1` on `H⁰`, `−1` on `H²`; invariants `ℚ[0]`. | Retain. |
| §6.3 headline | eigenvalues `1, 2, 4` | Projectors `(1,0,0)`, `(0,1,0)`, `(0,0,1)`; denominators `3, −2, 6`. | Retain. |
| §7.1 | `B = ℤ ⊕ A_{<1}`, `char A = p` | `(p, −p)` is killed by `T^{1/n}` at one stage and dies in the colimit; `a = T^{1/n_i} · (a T^{−1/n_i})` with `|a T^{−1/n_i}| < 1` for large `i`. | Retain. |
| §7.1 Check | field `C` | `E_K(C)` is the pushout of `K(C) ← K(O_C) → K(k)` (octahedron). | Retain. |
| §7.4 Check | `ℚ_p` | `π₀ = π₋₁ = 0` for the fibre of `K(ℤ_p) → K(𝔽_p)`; `π₀ E_KH = ℤ`; the fibre variant gives `ℚ_p^×/(1 + pℤ_p) ≅ ℤ × 𝔽_p^×`. | Retain. |
| §7.6 headline | residue characteristic `0`; `ℂ_p` | `S = ∅`; `S = {p}`. | Retain. |
| §7.7 | `π₀` | `ℤ[1/p] ×_{ℚ_p} ℤ_p = ℤ`. | Retain. |
| §8.1 Check | `ℤ(−1)` | Terms `ℤ(n − 1)`, tensoring with `ℤ(1)` gives `(ℤ(n))_n`. | Retain. |
| §9.2 | `{|T| < 1} ⊂ {|T| < 2}`; identity of the open disc | Factors through `{|T| ≤ 1}`; no quasi-compact factorization. | Retain. |
| §9.4 | `βℕ` over `ℂ` | Dimension `0`, no embedding into a ball; covered here, not by §8.4. | Retain. |
| §9.5 Check | `E/𝔽̄_p` | `Hom(ℚmot[E], ℚ(i)[m]) = K_{2i−m}^{(i)}`, dual side `K_{m−2i}^{(1−i)}`, so `m = 2i`; `n_{0,0} = n_{1,2} = 1`; determinant of `(0,1,1; 1,0,1; 1,1,0)` is `2`; `3 > 2`. | Retain. |
| §9.6 headline | `[0, 1]` | `RΓ(j_! ℤ) = RΓ_c((0,1]) = 0`, `j_! ℤ ≠ 0`. | Retain. |
| §10.1 definition (repaired) | `ℙ¹`; Artin–Schreier in characteristic 3; imperfect `k` for Nisnevich | `ℤ ⊕ ℤ(1)[2]`; `ℤ/3 = 0`; `k^×/p ≠ 0`. | Retain. |
| §10.1 API (repaired) | targets `Dmot(k)`, `Deff_mot(k)`, `D(ℤ)` with `π₀`, sets | Factors; `ℤ(1)[1]` not invertible; cofibre `0`; cofibre undefined. | R03. |
| §10.2 Checks | `k = 𝔽̄₃`, `n = 2`; `G_m` | `μ₂ = ℤ/2`, `k^×/k^{×2} = 0`; `ℤ/2 ⊕ ℤ/2[−1]`. | Retain. |
| §10.4 | `ℙ¹`, `j = 1`; `Spec k`, `j = 0` | `π_{−2} = K₀^{(1)} = ℚ`, `π₀ = 0`; `π₀ = ℚ`. | Retain. |
| §10.6 route (repaired) | Kummer cover of `G_m` at `B = C` and `B = Cont(S, C)`; `G_m ⊂ A¹` | Root exists; exists locally, then on a finite clopen partition; fibre over `0` empty, surjectivity needed. `inf_U sup_U |b| = |b(x)|`. | Retain. |
| §10.6 headline | `k = 𝔽̄_p` | `Map(ℤ(−j), ℤ)_ℚ`: `ℚ[0]` for `j = 0`, else `0`, on both sides. | Retain. |
| §11.1 | two points, `h` the first | `(a, b) ↦ a`; pro-torus `g_* ℤ = ℤ ⊕ ℚ(−1)[−1]` once `p` is inverted. | Retain. |
| §11.3 (repaired) | `H ⊗ 𝔽_ℓ`; counit | `H/ℓH = ℤ[1/p]/ℓ = 𝔽_ℓ`; ideal `(t − 1)ℚ[t^{±1}] ≅ H ⊗ ℚ`, a localization of `H`, flat: Tor amplitude `[−1, 0]`. | Retain. |
| §11.5 (repaired) | `p = 3` | `t/2 ∈`, `1/2 ∉ ℤ[1/3] ⊕ tℚ[t]`; degree `d` part `ℚ t^d`; value group `(1/2)^ℚ ≅ ℚ`. | Retain. |
| §11.6 | band `lim_n L` | `x_n = t/n`, `x_n ↦ m x_{nm}`; colimit `R ⊕ tℚ[t]`; `A = ℤ/2` gives `(ℤ/2, 0)`. | Retain. |
| §11.7 | degree one | Both sides `ℤ[1/p] ⊕ ℚ(−1)[−1]`; the map is the identity of `ℚ`. | Retain. |
| §11.8 headline | `A = ℚ ⊕ ℚ(1)` | `N ≠ 0`, `N² = 0`; class of `π` in `Hom(ℚ, ℚ(1)[1]) = (C^×/(1 + C_{<1})) ⊗ ℚ`. | Retain. |
| §12.3 headline | constant sheaf; `j_!` from the rank-one point; `Det(Y, ℤ/n)` | Identity; `0 → ℤ/n`; the middle term has no definition. | R01. |

Remark, no change asked: §8.5 calls a map "cohomologically smooth of dimension one" when `f^! ℤ ≃ ℤ(1)[2]`; that is the case its consumer §2.7 needs (charts étale over `A¹`), and there the computation `ℤ(1)[2] ≠ ℤ` is right. The References and the manifest list CD Theorem 5.5.3, which no sentence of the body cites.

### Pinned libraries

Content checkout at `eb4a735`. Opened at the pin: Mathlib `GrothendieckTopology` (Sites/Grothendieck.lean:72), `NormedField` (Normed/Field/Basic.lean:155), `IsUltrametricDist` (Ultra/Basic.lean:47), `SSet.Quasicategory` (Quasicategory/Basic.lean:41), `continuousCohomology` (ContCohomology/Basic.lean:131), `PowerSeries.IsRestricted.subring` (PowerSeries/Restricted.lean:90, with `IsUltrametricDist` at :87), `LocallyOfFinitePresentation` (:46), `Etale` (:39), `QuasiCompact` (:41), `Smooth` (:59), `AffineSpace`, `Proj` (ProjectiveSpectrum/Scheme.lean:855). Tau Ceti: `unitBallIdeal`, `mem_unitBallIdeal` (UnitBall.lean:90, 101; `SeminormedRing`, `IsUltrametricDist`, `NormOneClass`), `norm_inverse_one_sub`, `norm_inverse_one_sub_sub_one`, `isUnit_unitClosedBall_of_norm_sub_one_lt` (:160, 171, 185; `NormedRing`, `NormOneClass`, `HasSummableGeomSeries`), `PowerSeries.isPrincipalIdealRing_isRestricted_subring` (Weierstrass/Ideal.lean:115; `NormedField`, ultrametric, complete, `0 < c`), `cohomologicalDimensionAt`, `strictCohomologicalDimensionAt` (CohomologicalDimension/Basic.lean:146, 151), `cohomologicalDimensionAt_le_of_isClosed` (ClosedSubgroup.lean:80; compact, totally disconnected), `strictCohomologicalDimensionAt_le_cohomologicalDimensionAt_add_one` (Strict.lean:181; compact), `AlgebraicGeometry.Smooth.exists_etale_affineSpace` (EtaleCoordinates.lean:98; `𝔸(ULift (Fin n); S)`), `SymmetricAlgebra.projToSpec` (SymmetricAlgebra.lean:57; `R M : Type u`), `instIsProperProjToSpec` (:115), `homogeneousSubmodule`, `projectiveLine` (ProjectiveLine.lean:139), `polynomialChartι` (:428), `range_polynomialChartι_union_range_polynomialChartι` (:520), `puncturedAffineSpace` (PuncturedAffineSpace.lean:78), `PuncturedAffineSpace.homEquiv` (:208), `ExactK0`, `StableGeneralLinearGroup`, `AlgebraicK1`.

Absence claims: neither library has a Berkovich spectrum, a Banach-ring site or a K-theory spectrum of a ring (searches for `Berkovich` definitions, `KTheory`, `arcTopology` found none). Tau Ceti has symmetric spectra (`TauCeti/AlgebraicTopology/Spectra/SymmetricSpectrum.lean`); the docstring's list (sheaves of spectra on a site, the K-theory spectrum) does not claim otherwise.

### Headline theorems, padding and the Lean file

- `lake env lean` on `packages/MotivesAndAlgebraicCyclesPartII/Suggested.lean`, run from the content checkout: exit 0, no output. The file is `import Mathlib`, one module docstring and an empty namespace.
- The nine headline families of the Summary (cancellation; `Kmot` finitary with its Adams splitting; the explicit K-cofibre; torsion and tilting; six operations and proper base change; rigidity; the étale comparison; the monodromy equivalence; the overconvergent comparison) are each named in the docstring with the missing carrier. None is statable at the pins: each needs `Dfin`, `Deff_mot`, `Dmot`, a K-theory spectrum or v-stacks.
- The one-tactic probe and the `#check @name` audit have no input: zero declarations, nothing compared, nothing changed. `library-matches.md` and `signatures.md` are empty for the same reason.
- No backticked name in the README is presented as a Lean declaration of this roadmap.

### Duplication, suppliers and order

- Every cited supplier section was found as a heading at the supplier's present head (main at `eb4a735`, or the open head through `roadmaps show`): TropicalAndBerkovichArithmetic (26), EnhancedDerivedSheaves (15 sections and 22 named declarations), AnalyticStacks (10), GeneralAlgebraicKTheory (7, with §13.8c at its line 3028), GeneralAlgebraicKTheoryPartII §1.2, SchemeKTheoryOperations (11), KTheoryFiniteLocalFields (4), RefinedTraceMethods (2), JacobianChallenge Layers A, B, D, E, PerfectoidSpaces (9), DiamondsAndVStacks (8), DiamondEtaleCohomology (9), DiamondSixOperations (3), MotivesAndAlgebraicCycles (10), MotivicEtaleKTheory §2.2, AdicCoefficientsAndComparisons L5, ProfiniteCohomology, SchemeAndStackFoundations §2.16, EtaleCohomologyFoundations (3), CharacteristicClasses §C5, MorseNovikov, AnabelianGeometryAndNonabelianChabauty (target at its line 4008). One named declaration is missing: R02.
- Content read where the heading does not show it: SchemeKTheoryOperations §2.6 states the vanishing of negative K for regular noetherian schemes (its line 747); §3.8 states supported excision for an equivalence of derived closed fibres and applies it to completion (line 1194); §6.11 has `ψ^k j_* = k^c j_* ψ^k` for trivial conormal bundle. KTheoryFiniteLocalFields §1.5 has the automorphism `p` on `K_n` of perfect `𝔽_p`-algebras, `n ≥ 1`; §1.6 has `K_{2i}(𝔽̄_p) = 0` and torsion odd groups. AnalyticStacks §1.5 asks for a flat Hopf algebra with counit of finite Tor amplitude, and its line 1303 leaves the monodromy-operator identification to this roadmap. TropicalAndBerkovichArithmetic §0.16 has the initial Banach ring `ℤ`, the surjection onto the fibre product and the inverse limit; §0.22 has Hausdorffness of separated analytifications; §2.16 has triangulations with prescribed points. MotivicEtaleKTheory §2.2 identifies Adams-weight pieces with `CH^p(X, n) ⊗ ℚ`.
- Declared gaps: the nine slugs agree between the README (README:61–93) and `design/plan.json`, each with a named supplier and section. None is provided today: SchemeKTheoryOperations has no homotopy K-theory and no valuation-ring statement; KTheoryFiniteLocalFields §2.1 is rigidity for henselian pairs and §6.5 treats local fields. Each `needs` sentence carries its hypotheses; three of them list several statements about one object. GeneralAlgebraicKTheoryPartII declares its own gaps for `KH` on the same supplier (its lines 254–260); the owner is SchemeKTheoryOperations in both, so `KH` has one owner.
- Ownership against open pull requests, by object, with `roadmaps grep` at the 458 open heads and on main: "arc-stack", "Banach arc", "ball-invarian", `DM_et`, "étale motives": no match outside this package. "Berkovich motiv" matches bibliography lines only; "nearby-cycle functor" matches the étale functors of LefschetzPencilsAndVanishingCycles and ClassicalAdicEtaleCohomology, other objects; "generalized Jacobian" matches the target of AnabelianGeometryAndNonabelianChabauty, cited in §4.3 with the difference stated.
- The overlap report lists no conflicting head, no dropped id, no revision-only id and no second copy.

Dependency check output:

```text
depcheck: 240 roadmaps, 2271 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line. The roadmap is line 381 of the merge order.

Overlap check: read ArcTopologyAndDescent, AnalyticStacks, DiamondEtaleCohomology, EnhancedDerivedSheaves, VStackSheavesAndLisseCategories, DiamondsAndVStacks, AdicSpacesPartIV; nothing shared. ArcTopologyAndDescent owns the arc-topology on schemes and this roadmap the one on Banach rings; AnalyticStacks owns the comodule description and leaves the monodromy operators here; EnhancedDerivedSheaves §E5:presentability.4 owns compact morphisms; DiamondEtaleCohomology owns `D_ét` of v-stacks (R01 keeps it the owner there); "overconvergent" objects of that category are defined here (§12.3) and only used, undefined, in VStackSheavesAndLisseCategories.

### Copyright and arrangement

- **Wording.** 27 passages were set beside the sources at the locator: the 15 sampled targets, the Conventions, the definitions of §§1.5 and 4.1, the statements of §§4.8 and 12.3, the routes of §§5.4, 7.1, 7.2, 7.7, 9.1 and 10.3, §10.1 against CD and Bachmann, and the module docstring. The longest shared runs are forced statements: 9 words in §4.8 against Scholze line 1658 (the name of a category), 7 words in §4.1 against Scholze line 1502, 6 words in the Conventions against Scholze line 509. The routes of §§7.7 and 9.1 have the steps of the proofs at Scholze 1994–2002 and 2220–2245 in the order the arguments force, in other words and with added cases.
- **Arrangement.** Scholze has sections 2–12. Against the layers: `Layer 0 ↔ §§2–3`, `Layer 1 ↔ §4`, `Layers 2–3 ↔ §5`, `Layer 4 ↔ §6`, `Layer 5 ↔ §7 and Cors 8.1–8.2`, `Layers 6–7 ↔ §8`, `Layer 8 ↔ §9`, `Layer 9 ↔ §10`, `Layers 10–11 ↔ §11 with CD and Bachmann`, `Layer 12 ↔ §12`. Not one to one: three splits, one merge, one transfer, and §§0.8, 2.7, 4.3, 10.2 and 10.4 with no counterpart. The *Dependencies* lines force `0 < 1 < 2 < 3 < 4 < 5 < 6 < 7` and `5 < 8 < 9 < 10 < 11`; Layers 6–7 and 8 are parallel and Layer 12 needs only Layers 0, 4 and 9.
- **Reuse.** No table, figure or list is taken over. The Lean file declares nothing.

Source independence: 27 passages compared with 5 sources (Scholze, CD, Bachmann, vanDerPut, Vakil), none shared beyond forced statements of at most 9 words; largest share Scholze, 99 of 118 locators; contents compared with Scholze: independent.

## Not verifiable

- BLR §9.2: settled as uncertified; not read and not requested.
- The nine supplier gaps are contracts for future work: their declaration, owner, hypotheses and present absence were checked, their truth was not.
- The corrections E1–E4 and E7 of the README were not recomputed in this round; E5, E6, E8 and E9 were (rows of §§3.5, 10.4, 11.1 and the Conventions above).

## Source issues

- **Misprint** in Scholze at the proof of Proposition 5.19, p. 35: the source says the coefficients satisfy a bound by the maximum of two quantities; it should be their minimum (`T² + T/2 + 4` over `ℂ₂`); affects the proof.
- **Misprint** in Scholze at the proof of Theorem 11.1, p. 57: the source says the dual of the pushed-forward unit represents maps from the unit into `f_* M`; it should be into `f^* M`, for `M` over the residue field; affects nothing.
- **Misprint** in Scholze at Remark 11.2, p. 57: the source says Voevodsky's étale motives form the free presentable stable category on smooth schemes with three relations; it should be the free `ℤ`-linear one; affects nothing.
- **Misprint** in Bachmann at §1, p. 2: the source says the étale variant changes step (2), the `A¹`-localization; it should be step (1), the localization at coverings; affects nothing.

## For the human reviewers

- none

<!-- tauceti-roadmap-review {"agent": "claude", "head": "9651e2c772bcea34f33c1545382c8dd983ffc71c", "job": "REV-PKG-MotivesAndAlgebraicCyclesPartII~9", "model": "fable", "worker": "chris-x88"} -->
