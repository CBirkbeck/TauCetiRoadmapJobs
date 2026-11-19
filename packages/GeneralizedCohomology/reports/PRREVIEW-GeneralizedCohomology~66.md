# Review of GeneralizedCohomology (pull request #2535 at aa14dec)

**Verdict:** accepted

**Summary.** Accepted with no finding. The revised sentence of G3.9 is true. BordismFormalGroups F2.2 on main owns the comparison of derived p-completion with the HF_p-nilpotent completion for bounded-below spectra, and the two differ on unbounded spectra: for KU the nilpotent completion is 0 but π₀ of the p-completion is ℤ_p. One small correction, not blocking: `rationalHurewicz` is stated only for spaces in the lowest universe. Nothing is left for a human to decide.

## C01 — `rationalHurewicz` is stated only for spaces in `Type`, while G5.6 states it for every pointed space

Every other declaration of `Suggested.lean` about an arbitrary space, pair or simplicial set is universe-polymorphic, and the Conventions ask for explicitly fixed universes. Here the binder is `{X : Type}` with coefficients in `ModuleCat.{0} ℚ` (`Suggested.lean` line 204), while the README (G5.6, line 4219) says "a pointed space X". So the formal statement silently says less than the prose. A universe-polymorphic form elaborates at the pins with `{X : Type u}`, `C := ModuleCat.{u} ℚ` and `R := ModuleCat.of ℚ (ULift.{u} ℚ)`; I checked it with `lake env lean`, and the rest of the statement is unchanged. Alternatively, the README sentence could say that the Lean statement is for spaces in the lowest universe.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result |
| --- | --- | --- | --- |
| G3.9 revised sentence (2420–2422) | X = Hℤ (bounded below); X = KU (unbounded) | Hℤ: both completions have π₀ = ℤ_p. KU: HF_p∧KU ≃ 0, so its nilpotent completion is 0, while π₀ KU^∧_p = ℤ_p. | Pass. F2.2 (BordismFormalGroups 748–755) owns the comparison for bounded-below X. |
| G3.9 Checks and Hom/Ext sequence (2411–2441) | HZ, HQ; Schwede (9.10) | HZ: Ext = ℤ_p, Hom(ℤ/p^∞,0) = 0. HQ: Ext(ℤ/p^∞,ℚ) = 0 = Hom, but ℚ⊗ℤ_p = ℚ_p. F(Σ⁻¹M,E) = F(M,ΣE) matches Schwede §9.3. | Pass. |
| G1.6 boundary identities (358–380) | (D¹,S⁰), p=0; S¹×(D¹,S⁰), x∈H¹, e∈H⁰ | δ(x×e) = −x×δe = (−1)¹ a∪δb. δ(b∪i*a) = −x×δe = (−1)^(1·1) a∪δb = δb∪a. | Pass. A sign-free law fails. |
| G2.5 homotopy excision, Freudenthal, signs (638–761) | S² = D²₊∪D²₋, m=n=1; X = S², S¹; grid m=n=2, m=4 | Degree 2: ℤ→ℤ onto; degree 3: 0→ℤ not onto. π₂S²≅π₃S³; π₃S²=ℤ→ℤ/2 onto. binom-product 1 gives −1; binom(4,2)=6 gives +1. | Pass. |
| G2.6 semistability (765–793) | F₁S¹; HZ; S | F₁S¹: level n is n copies of Sⁿ, naive π₀ = ⊕ℤ, true π₀ = ℤ. HZ levels K(ℤ,k): π_(n+k) = ℤ iff n=0. | Pass. |
| G3.1 Brown (1942–1982) | H̃¹, H̃²; empty wedge; H̃⁰(S⁰) | S¹ = K(ℤ,1) and CP∞ = K(ℤ,2). The empty wedge is the point, and an empty product is a singleton. π₀ΩK(ℤ,1) = ℤ = H̃⁰(S⁰). | Pass. |
| G3.5 gap refinement (2124–2182) | ρ≡1; two arcs at ρ₁=ρ₂=½; f = Σkφ_k; closed X_i = {0}∪[1/i,1] | gap{i} = 1, V₁ = B. gap{1,2} = ½, point in V₂. f ≥ k_min, {f<n} ⊆ W_(n−1). π₀(X_i) = 2, π₀[0,1] = 1. | Pass; matches `PartitionOfUnity.gap` at Gap.lean:67. |
| G3.10 skeletal Milnor (2445–2486) | CP∞ → K(ℤ,2); nonabelian lim¹ action | Tower 0←ℤ←ℤ has limit ℤ; π₁Map(CP^m,K(ℤ,2)) = 0, so lim¹ = 0. (g·h)_m = g_m h_m r_m(g_(m+1))⁻¹ matches Tower.lean:96–97. | Pass. |
| G4.1 relative Leray–Hirsch (2797–2829) | X×CPⁿ; empty base; (D¹,S⁰) over a point | Free H*(X)-module on 1,…,xⁿ. The empty base gives 0 = 0. E^(q−1)(*) ≅ E^q(D¹,S⁰) = Ẽ^q(S¹), the suspension isomorphism. | Pass. |
| G4.3 Thom isomorphism (2862–2899) | Möbius line; trivial rank r over a point | Möbius: w₁ ≠ 0, not HZ-orientable, HF₂-orientable. Trivial: U generates Ẽ^r(S^r) ≅ E⁰(*). Cohen 10.40 assumes connective E, connected base; README lifts both. | Pass. |
| G4.4 Euler identities (2903–2924) | TS²; odd rank; trivial line | e(TS²) = 2·gen since χ = 2. v↦−v reverses orientation, so e = −e. A nonvanishing section gives e = 0. Hatcher's Φ(e) = c⌣c. | Pass. |
| G5.0 stable BSpin (3169–3329) | π_i BO, i = 1…8; Spin(4)→Spin(5); w(−ξ) | ℤ/2,ℤ/2,0,ℤ,0,0,0,ℤ becomes 0,0,0,ℤ,0,0,0,ℤ on the 3-connected cover. π₃: ℤ² → ℤ by (a,b)↦a+b. w₂(−ξ) = w₂+w₁². | Pass. |
| G5.1 Spanier–Whitehead (3333–3363) | ΣⁿS, S∨S, 0, P = S | D(ΣⁿS) = Σ⁻ⁿS; D(S∨S) = S∨S; D0 = 0; E^q(S) = π_(−q)E = E_(−q)(DS). | Pass. |
| G5.4 KSp and Pin⁺ (3484–3608) | [ℍ] = a·b⁻¹, a² = 4b, c(a) = 2u², c(b) = u⁴ | Real forget: a²b⁻¹ = 4. Complex: u²·2u²·u⁻⁴ = 2. star(ιv)ιv = −ιv·ιv = −Q(v). π_*KO for degrees 0–7: ℤ,ℤ/2,ℤ/2,0,ℤ,0,0,0. | Pass. |
| G5.6 rational theorems (4191–4254) | S², k=2; CP∞, k=2; S³, k=3 | π₂S²⊗ℚ = H₂ = ℚ; π₃S²⊗ℚ = ℚ → 0 onto. CP∞: H₄ = ℚ not hit, 4 > 2k−1 = 3. π₄S³ = ℤ/2. | Pass. |
| G5.7 Checks (4582–4587) | ℓ = 0; U = ℝ; trivial S¹ on a point | C_c(ℝ) = F_R(R∧Σ∞S¹,R) = Σ⁻¹R = Σ⁻¹P_R(ℝ), d = 1. π_(−*)F(Σ∞CP∞₊,Hℤ) = ℤ[x] with \|x\| = 2. | Pass. |
| `kanQuillen_modelCategory` | Δ[1]→Δ[0]; ∂Δ[1]→Δ[0]; Mathlib at the pin | Horn (0,1,0) has no filler, yet the map is a weak equivalence. ∂Δ[1] gives two components. No `ModelCategory SSet` instance exists at the pin. | Pass; not closable by one tactic. |
| `sSetTopAdj_unit_weakEquivalence` | X = Δ[0]; probe | \|Δ[0]\| = pt and Sing pt = Δ[0], so the unit is an isomorphism. `infer_instance` fails. | Pass; not padding. |
| `homotopyExcision` | m = n = 0; m = n = 1 on S² | m=n=0: i+1 < 0 and i+1 = 0 both false, nothing asserted. S²: degree 2 onto. T2 and CW binders present. | Pass. |
| `numerableFiberBundle_hurewicz` | F = ∅; any point x | F = ∅ forces Z = ∅, lifting vacuous. Σρ_i(x) = 1 gives some ρ_i(x) > 0, so base sets cover. | Pass. |
| `homologyComparison` | Empty CW complex; Dᵒᵖ instance | Both sides vanish by additivity. Hom carries δ-compatibility (EilenbergSteenrod.lean:80); IsAdditive covers coproducts over Type u (:214). | Pass. |
| `stableStem_isOfFinOrder` | (n,k) = (0,3), (1,4), excluded (0,2) | π₄S³ = ℤ/2; π₆S⁴ = ℤ/2; π₃S² = ℤ has infinite order but k ≥ n+3 fails. `simp` makes no progress. | Pass. |
| `rationalHurewicz` | k = 0, 1, 2 | k=0: 2·0−2 = 0 = 2·0−1 in ℕ, nothing. k=1: only the degree-1 span (abelianization). k=2: S² as in G5.6. | Pass; universe in C01. |
| Not-statable headlines (docstring) | Suspension, telescope, wedge CW at the pins | Only `TauCeti/Topology/Sphere/Suspension.lean` (S² from S¹) and `WedgeCircles.lean` exist; there is no mapping telescope. | Pass; docstring accurate. |

- Earlier findings: the previous review of this folder raised none, so there was nothing to repair.
- Source locators checked against the text: 43. They are HatcherAT (Lemma 3.6, Prop. 3.17, §3.F, Thm 3F.8, §4.1 p. 346, Lemma 4.10, Prop. 4.15, Thm 4.23, Cor. 4.24, 4D.1, 4D.8, 4D.9, pp. 441–442, p. 444, 4E.1, 4E.2), HSS (3.1.10, 4.3.2, 5.6.1, 5.6.2, 6.2.3), Cohen (Thms 10.3, 10.16, 10.19, 10.40, 10.43; Defs 10.16–10.17, 10.28), May (pp. 51, 189), HatcherVBKT (Introduction p. 1, Lemma 1.21), HatcherSSAT (1.21, 1.22), SchwedeSymSpec (I.1.16–1.18, II.7.4, 9.2, 9.3, 9.9) and LurieHTT (4.2.4.1, 4.2.4.4). All agree.
- Library declarations opened at the pins: 26. These include `TopPair.HomologyPretheory` and its `Hom` and `IsAdditive` (Mathlib EilenbergSteenrod.lean:50, 69, 214), `HomotopyGroup.hurewiczHom` (Tau Ceti Hurewicz/Basic.lean:652), `TauCeti.GroupTower.limOne` (Tower.lean:118), `PartitionOfUnity.gap` (Gap.lean:67) and `EMetricSpace.ofRiemannianMetric` (Riemannian/Basic.lean:546).
- Cross-roadmap citations resolved: BordismFormalGroups F2.2 (lines 659–765, with its moved-items list at 3788–3795); TangentialBordism B4.2 and B4.7; KanQuillen and SimplicialCategories scope; the readers of G3.9 on main (EnhancedDerivedSheaves, GeometryOfNumbersAndQuadraticArithmetic, HermitianKTheoryOfPoincareCategories). None cites G3.9 for the comparison it no longer owns.
- Automatic checks: every check passes, in the worker's record and in my own run. The diff outside the folder is empty. The change is 3 insertions and 5 deletions in the README only.
- Dependency check output: `depcheck: 200 roadmaps, 2207 edges, 0 problem(s)`. There is no UPWARD or CYCLE line; the BordismFormalGroups mention is prose, not a *Needs:* edge.
- Elaboration of `Suggested.lean`: exit 0 with seven `sorry` warnings and nothing else. `#check @name` for all ten declarations shows every binder in the README statement. One-tactic probes (`simp`, `infer_instance`) fail on the two simplest theorems.
- Pull request text: the title and description agree with the head. No section, supplier contract or Lean declaration changes.

Overlap check: read SimplicialCategories and KanQuillen (both new in #2269), Straightening (#2270), StableHomotopyKTheory, TangentialBordism, AlgebraicTopology and BordismFormalGroups. KanQuillen owns a model structure on the Kerodon class `SSet.IsWeakHomotopyEquivalence`. It explicitly leaves the realization-class structure and the comparison of the two classes to G2.1, owner here. The Bergner and straightening foundations are G2.11's, which #2269 and #2270 cite. The HF_p-nilpotent versus derived completion comparison is owned by BordismFormalGroups F2.2, which G3.9 now cites. TangentialBordism B4.2 and B4.7 on main still state it, and F2.2's moved-items list maps them to F2.2; that is a matter for those two roadmaps. Nothing else is shared.

Source independence: 50 passages compared with 8 sources (the 43 locators plus 7 prose passages: the Summary Thom paragraph, the G2.6 semistability gloss, the G3.1 axioms, the G3.5 refinement, the G5.6 rational gloss, the `numerableFiberBundle_hurewicz` docstring and the new G3.9 sentence). None shares wording beyond the 7-word statement of Hatcher Theorem 4.23, which the mathematics forces. The largest share of locators is HatcherAT, about 36 of some 86 page locators in the layers. Contents compared with HatcherAT: independent. Layers 2 and 5 have no Hatcher chapter, and Brown (Hatcher §4.E) precedes Leray–Hirsch and Thom (§4.D) here, the reverse of Hatcher's order.

Research link: Layers 2–3 supply the stable homotopy category of HSS 2000 and the derived p-completion that BordismFormalGroups F2.2–F2.3 use for the Adams spectral sequence and Quillen's theorem on MU, and EllipticCohomology uses for tmf. This rests on README lines 49–53 and BordismFormalGroups F2.2.

## Not verifiable

- QuillenHA, ABSClifford, McDuffSegal, SegalCategories and JoachimKO are settled as uncertified (paywalled) and were not read; none is cited by the changed passage or the sampled locators, except Quillen for `kanQuillen_modelCategory`, a standard theorem.

## Source issues

- none

## For the human reviewers

- none
