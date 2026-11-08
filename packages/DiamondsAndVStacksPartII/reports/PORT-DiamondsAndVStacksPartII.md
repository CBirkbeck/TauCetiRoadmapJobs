# Port report: DiamondsAndVStacksPartII

Branch `roadmap/diamonds-and-v-stacks-part-ii`, created from main `3b51055`; head commit `90959b9`
("DiamondsAndVStacksPartII: roadmap (README, Suggested.lean, metadata)"). Folder
`TauCetiRoadmap/DiamondsAndVStacksPartII/{README.md,Suggested.lean,metadata.toml}`; nothing outside
the folder was touched.

## Build

    lake build TauCetiRoadmap.DiamondsAndVStacksPartII.Suggested
    ⚠ [8972/8972] Built TauCetiRoadmap.DiamondsAndVStacksPartII.Suggested (2.8s)
    warning: TauCetiRoadmap/DiamondsAndVStacksPartII/Suggested.lean:74:8: declaration uses `sorry`
    Build completed successfully (8972 jobs).

Exit 0; one warning, the `sorry` of `exists_tate_specialization`; no Lake module-system notice.

## Gate

    gate DiamondsAndVStacksPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK

Dependency check (`gate --depcheck … --order … --movable --content …`):

    depcheck: 226 roadmaps, 2131 edges, 0 problem(s)

No UPWARD, CYCLE or `moved:` line. The roadmap sits at line 123 of the merge order, after every
supplier it names (DiamondsAndVStacks 16, SchemeKTheoryOperations 34,
FiniteFlatGroupsAndIntegralPadicHodgeTheory 46, PrismaticCohomology 55, DiamondEtaleCohomology 76,
AdicCoefficientsAndComparisons 95, ArcTopologyAndDescent 97, GeometricSatakeAndFusion 121); the
roadmaps it names as consumers are later (HeckeStacksAndLocalShtukas 178,
GeometricSatakeAndFusionPartII 198).

Citation resolver (`roadmaps resolve`, index of 441 open pull requests): one cross-roadmap lead,
"GeometricSatakeAndFusionPartII Layers 0", a board package named only as a downstream consumer (it is
in the merge order, not on main and not an open pull request); no Lean name unresolved.

## Draft pull request body

This roadmap extends DiamondsAndVStacks past its Layer D6 into the integral geometry of diamonds:
Gleason's olivine spectrum and full faithfulness of diamondification on perfect schemes and perfect
discrete adic spaces, scheme-theoretic v-sheaves with the reduction functor right adjoint to ⋄,
formally adic maps, specializing v-sheaves, prekimberlites, formal and étale formal neighbourhoods,
and then the two integral recovery theorems of Scholze–Weinstein and Lourenço (flat normal formal
schemes locally formally of finite type, and proper flat normal schemes over a complete discrete
valuation ring, are determined by their v-sheaves), the identification of flat Zariski closures with
v-closures that local models rest on, and Gleason's and Anschütz–Gleason–Lourenço–Richarz's
kimberlites: tubes, richness, the quotient theorem for specialization, the bijection of connected
components under a closed-specialization hypothesis, the specialization-triple principle for
π-adic kimberlites and the normality criterion through connected tubes over an algebraically closed
residue field (with the hypothesis the source omits). The acceptance test states the one headline
statable at the pins, the specialization theorem for Tate Huber pairs, on Tau Ceti's Huber pairs and
adic spectrum; the other headlines wait for the perfectoid v-site and formal schemes.

Dependencies still in pull requests (by name): DiamondsAndVStacks, DiamondEtaleCohomology,
AdicCoefficientsAndComparisons, FiniteFlatGroupsAndIntegralPadicHodgeTheory, PrismaticCohomology,
SchemeKTheoryOperations, GeometricSatakeAndFusion, ArcTopologyAndDescent. Suppliers on main:
AdicSpacesPartII, AdicSpacesPartIII, PerfectoidSpaces, SchemeAndStackFoundations, ModularCurves,
RigidAnalyticGeometry.

## What moved from the Lean to the README

Nothing. The package's `Suggested.lean` already had the acceptance-test shape: one definition
(`reductionSpectrum`, the closed subset V(A°°) of Spec A⁺) that makes the one statable headline
(`exists_tate_specialization`, D9.1) statable, no padding, no sorry'd data. The only changes are the
module header (`module`, `public import Mathlib`, `public import TauCeti.RingTheory.Huber.Pair`,
`public import TauCeti.AlgebraicGeometry.AdicSpace.Spa.Basic`, and `@[expose] public section` before
the namespace, the CoboundaryExpansion form on main), so that the declarations are visible to
importers. Both imported modules exist at the pinned Tau Ceti.

Signature check: a scratch file importing the module with `#check @…reductionSpectrum` and
`#check @…exists_tate_specialization` elaborated (through `lake env lean`), printing

    reductionSpectrum : {A : Type u_1} → [CommRing A] → [TopologicalSpace A] → (Aplus : Subring A) → Set (PrimeSpectrum ↥Aplus)
    exists_tate_specialization : ∀ {A} [CommRing A] [TopologicalSpace A] [IsTopologicalRing A] [TauCeti.Huber.IsTateRing A] (P : TauCeti.Huber.Pair A),
      ∃ sp, (∀ (x : ↑(spa P.plus)) (a : ↥P.plus), a ∈ (↑(sp x)).asIdeal ↔ (↑x).valuation ↑a < 1) ∧ Function.Surjective sp ∧ IsSpectralMap sp ∧ IsClosedMap sp

identical to the worker's `signatures.md`; no binder was lost (the Tate and topological-ring
instances are in the theorem's own signature). The README's D9.1 states the same generality (any
Tate ring with a ring of integral elements, no completeness, no ℤ_p-structure).

## README transformation

- Source locators: the 129 "SRC line N" extraction tokens were dropped and the link-form
  `([SW20](#references) …)` locators became `(SW20, …)`; the References list keeps the links. The
  sentences "Exact theorem and page locators and extraction lines are attached …" were removed.
- Supplier gaps: every `(gap:slug)` tag became a named contract, in the headers ("What X must
  provide (the … contract):") and in Needs and Dependencies lines. Mapping, slug → contract name:
  `strict-henselization-g-ring` → the strict-henselization G-ring contract;
  `mixed-characteristic-weak-normality` → the mixed-characteristic weak-normality contract;
  `finite-geometric-fibre-radiciality` → the finite geometric-fibre radiciality contract;
  `absolute-weak-normality-formal` → the absolute weak-normalization contract;
  `finite-residue-and-integral-stalks` → the finite residue and integral-stalk contract;
  `completed-residue-fields-general-universal-homeomorphisms` → the general residue-field contract;
  `analytic-integral-stalks-mod-p` → the integral-stalks mod p contract;
  `noetherian-definition-rational-flatness` → the noetherian-ring-of-definition flatness contract;
  `pseudorigid-jacobson-flatness` → the pseudorigid Jacobson contract;
  `finite-ideal-formal-schemes` → the finite-ideal formal-scheme contract. The review's
  `completed-etale-lifts` no longer occurs in the package head (a red-team repair replaced it by
  AdicSpacesPartIII F0.3 *adic-systems-equivalence-finite-ideal-type*, which exists on main at that
  README's line 1411); `finite-residue-` in `review.json` is the truncated
  `finite-residue-and-integral-stalks`.
- Internal references: the 51 distinct `Dk/slug` target slugs became section numbers (for example
  `D7/olivine-comparison` → D7.8, `D9/unique-formalization` → D9.3, `D11/valuative-prekimberlite`
  → D11.1); the `[D7.2](#…)` anchor links became plain section numbers; `AdicSpacesPartII:R0`
  became `AdicSpacesPartII R0`; `L1/mixed-characteristic-scheme-diamond` became `L1,
  *mixed-characteristic-scheme-diamond*`, the target's own label at the AdicCoefficientsAndComparisons
  head.
- API lists: "The construction has the following properties:" became "Its API includes the
  following facts." (the form of the SheafConvolutionOnAbelianVarieties head); "For example, The …"
  capitalisation fixed.

## Supplier replacements and citation repairs

Every cross-roadmap citation was resolved against the supplier as it is now (main for
AdicSpacesPartII, AdicSpacesPartIII, PerfectoidSpaces, SchemeAndStackFoundations, ModularCurves,
RigidAnalyticGeometry; `roadmaps show` heads for DiamondsAndVStacks, DiamondEtaleCohomology,
AdicCoefficientsAndComparisons, FiniteFlatGroupsAndIntegralPadicHodgeTheory, PrismaticCohomology,
SchemeKTheoryOperations, GeometricSatakeAndFusion, HeckeStacksAndLocalShtukas; the sibling checkout
for ArcTopologyAndDescent). All cited sections exist with the content claimed, with these repairs:

- *classical-points-constructible-density* is not an AdicSpacesPartII R1.9 target: it is a
  RigidAnalyticGeometry §8.2 target that AdicSpacesPartII imports in its supplier table and uses in
  R1.7. The README now cites RigidAnalyticGeometry §8.2 directly (new block "From
  TauCetiRoadmap.RigidAnalyticGeometry", a Scope sentence, D11.8's Needs and the Layer D11b
  Dependencies).
- DiamondEtaleCohomology has no C4.2; the range "C4.1–C4.7" became "C4.1 and C4.3–C4.7".
- GeometricSatakeAndFusion GS0 targets are cited with their numbers, §0.30 "Integral bounded
  Grassmannian families" and §0.32 "Integral parahoric ind-properness" (the head has two layers
  labelled GS0).
- DiamondsAndVStacks D2.4 and D6.1 were added to D10.6's Needs for the quasiseparatedness
  convention and for "Spd ℤ_p is not a diamond" (see the mathematics pass).

No restatement of a supplier declaration was found in the Lean file (it declares only the
specialization statement, which no supplier has: the pinned Tau Ceti has no specialization map,
`PerfectoidSpace`, `FormalScheme` or `Diamond`; grep of `.lake/packages/TauCeti` and Mathlib).

## Duplication sweep

`roadmaps grep -i --readme-only` over main and the 441 open heads, by object: `kimberlite`,
`olivine`, `scheme-theoretic v-sheaf`, `formally adic`, `constructibly Jacobson`, `enough facets`,
`specialization triple`: no match anywhere. `v-closure`: only GeometricSatakeAndFusion (§4.17 uses the
notion for its v-sheaf local model without defining it; see Unresolved). `Heuer`,
`tubular neighbourhood`, `reduction functor`, `specialization map`, `formal neighbourhood`,
`universal homeomorphism`: matches are other objects (perfectoid Heuer covers, Riemannian tubes,
perverse-sheaf reduction, nearby-cycle and étale specialization, Berthelot's classical specialization
in AdicSpacesPartIII R2.4, which this roadmap cites). `absolutely weakly normal`, `weakly normal`:
only CommRingFactorizationSystems (#453, a dropped external pull request by the maintainer's
standing rule recorded in the accepted review) and SchemeAndStackFoundations §0.26 (characteristic
p only, cited). Nothing was removed; "Scope and ownership" records the deferrals as before.
Ownership against open pull requests was checked through the service index and `roadmaps grep`; the
board package GeometricSatakeAndFusionPartII was not opened (no path in the brief).

## Mathematics pass: fixes made

1. **D10.6 (maximal diamond open) restated.** The package's proof asserted that Spd k(x) "is
   quasiseparated as the diamondification of an affine discrete pair" and applied D8.7. The parent
   roadmap (DiamondsAndVStacks D2.4) proves that the final sheaf Spd 𝔽_p is not quasiseparated
   (Spa 𝔽_p((t^{1/p^∞}))^ × itself is the punctured disc, not quasicompact), so Spd k is not
   quasiseparated either and D8.7 did not apply; "Spd ℤ_p" is itself an open sub-v-sheaf of
   Spd ℤ_p with nonempty reduction, so "largest diamond open" cannot be proved by that route. The
   target now states: the analytic locus is a quasiseparated locally spatial diamond open, its
   complement is the counit image, and every open sub-v-sheaf that is a *quasiseparated* diamond
   lies in it (proof: a point x of the complement gives Spec(k(x))^⋄ → U, so U^red ≠ ∅, against
   D8.7). The functoriality clause (ψ maps special loci to special loci and ψ^red is a map of
   perfect schemes), which is what D10.11 uses, is now proved by naturality of the counit and D8.6
   alone, with no diamond property of ψ. Checks rewritten accordingly (Spd 𝔽_p not a diamond by
   DiamondsAndVStacks D4.1; Spd ℤ_p neither quasiseparated nor a diamond).
2. **D9.9**: "It is formally adic only when S is open" (an unproved universal claim) became "It is
   formally adic when S is open, and need not be otherwise", with the origin example kept.
3. **D8.9** proof: the use of D8.7 now says U^♢ is a quasiseparated diamond and that the points of
   Spec(A_red)^⋄ have open support (so the fibre of the analytic locus over the counit is empty).
4. **D8.7** statement: "k a perfect (equivalently, algebraically closed) field" became "k a perfect
   field, equivalently for k algebraically closed".
5. **D11.14**: the locator sentence that referred to extraction lines became "(GLE Lemma 4.55,
   whose proof uses a closed specialization)".
6. **D8.3** Check: a garbled cross-reference became "(DiamondsAndVStacks D6.6)".

## Adversarial pass

O a complete DVR flat over ℤ_p with uniformizer π, C an algebraically closed perfectoid field.

| Statement | Instances | Values computed | Result / change |
|---|---|---|---|
| D9.1 (Lean headline): sp(x) = {a ∈ A⁺ : v_x(a) < 1} prime, ⊇ A°°, target V(A°°) = Spec(A⁺/A°°) | a ∈ A°°; ϖ; (ℚ_p, ℤ_p); (C, O_C); (C, C⁺) rank two; closed disc; zero ring; (ℚ((t)), ℚ[[t]]) | continuity of v_x makes {v < 1} an open neighbourhood of 0, so aⁿ ∈ it and v(a)ⁿ < 1 forces v(a) < 1; A°° ∩ A⁺ ⊆ √(ϖA⁺) since ϖ^{N+1}A₀ ⊆ ϖA⁺, so V(A°°) = V(ϖ); ℚ_p: 1 point ↦ (p); C: 1 ↦ m_C; rank two: the two continuous valuations (rings C⁺ and O_C; the trivial one is not continuous) ↦ the two primes of C⁺ over m_C; disc: Gauss point ↦ generic point of k_C[T], all classical points of |T| < 1 ↦ origin, so not injective; zero ring: ∅ → ∅; ℚ((t)): one continuous point (ℚ[[t]] is a DVR, its overrings are itself and the field, the trivial valuation is not continuous) ↦ (t), target Spec ℚ, and (1+1)² = 4 ≠ 2 shows no Frobenius is available | Statement and Lean signature agree; preimage of D(ā) is {v(a) = 1} = U(1/a), a rational subset, so spectral; no change |
| D9.1 completeness not needed | (A, A⁺) → (Â, Â⁺) | Spa unchanged by completion; A⁺ carries the ϖ-adic topology (ϖ^{n+k}A⁺ ⊆ ϖⁿA₀ ⊆ ϖ^{n−N}A⁺), so Â⁺/ϖ = A⁺/ϖ and both sides of the theorem are unchanged | Hypothesis-free statement justified |
| D7.5 minimal image point | V a field; Z = Spec V; ascending chain p₁ ⊊ p₂ ⊊ … with union 𝔪, Z = {pₙ}; descending chain Z = {pₙ} with intersection 𝔮 | field: one point; identity: closed point; ascending chain: opens of Z are tails, so Z is not quasicompact and no point specializes all others; descending chain: opens are tails, Z is quasicompact, the image contains p₁ (most special) but not 𝔮 | "Minimal" means most special, as the README spells out; agrees with SW20 Lemma 18.3.2's proof; no change |
| D7.7 olivine points of 𝔽_p[[u]] discrete | the three points of Spa | trivial/(0): generizations of rank ≤ 1 = itself (1); u-adic: itself and the trivial valuation with support (u) (2); trivial/(u): itself (1): total 4 | Matches GLE Example 2.8; no change |
| D7.7 algebraic points ↔ open primes | ℚ_p; 𝔽_p[[u]] discrete | 𝔭 ⊇ B°° ⟹ 𝔭 ⊇ I open ⟹ 𝔭 open; 𝔭 open ⟹ bⁿ ∈ 𝔭 for b ∈ B°°; ℚ_p: B·B°° = (1), no algebraic point; 𝔽_p[[u]]: B°° = 0, two algebraic points | True; no change |
| D7.10 v-covers | ∅ → Spec 𝔽_p; ∅ → ∅; Spec(K × κ) → Spec V perfect rank one | no lift of the identity test; ∅ → ∅ iso; V → K inverts m_V and V → κ kills it, no injective local extension lifts the identity test | Checks true; no change |
| D8.4 reduction values | Spd ℤ_p; Spd ℚ_p; (C, O_C); (O_C, O_C); 𝔽_p[t] discrete | (ℤ_p/p)^perf = 𝔽_p; maps Spd(R, R) → Spd ℤ_p factor through Spd 𝔽_p, disjoint from Spd ℚ_p: ∅; C·C°° = C so A_red = 0; O_C·m_C = m_C so k_C; °° = 0 so 𝔽_p[t^{1/p^∞}] | No change |
| D8.8 non-adic example | Spd ℤ_p[[T]] → Spd ℤ_p, (p, T)-adic | reduction Spec 𝔽_p; fibre over Spd 𝔽_p is Spd 𝔽_p[[T]] (T-adic), which has analytic points T ≠ 0; square not Cartesian | Check true |
| D8.10 Check 4 | Spd 𝔽_p[[T]] → Spd 𝔽_p[T] discrete | (Spd 𝔽_p[T])^red^⋄ = Spd 𝔽_p[T]; its base change is all of Spd 𝔽_p[[T]], whose reduction is Spd 𝔽_p: not formally adic | True |
| D8.7 and the quasiseparatedness convention | Spd 𝔽_p; Spd ℤ_p; Spd ℚ_p; the analytic locus of an affinoid | Spa 𝔽_p((t^{1/p^∞}))^ × itself is the punctured disc (not quasicompact), so Spd 𝔽_p is not quasiseparated; Spa C ×_{Spd ℤ_p} Spa C' for characteristic-p points is the same product, so neither is Spd ℤ_p; two affinoid perfectoids over Spd ℚ_p have fibre product (Spa C₁^♯ ×_{Spa ℚ_p} Spa C₂^♯)^♦, affinoid, so Spd ℚ_p is quasiseparated; quasicompact maps into the analytic locus of Spa(A, A⁺) land in finitely many rational subsets, over which fibre products are affinoid | D10.6 restated and D8.9 reworded (fixes 1 and 3 above) |
| D10.6 functoriality clause | ψ : 𝔛^♢ → 𝔜^♢ | ψ ∘ counit_𝔛 = counit_𝔜 ∘ (ψ^red)^⋄ by naturality; reductions are (𝔛_red)^perf, (𝔜_red)^perf by D8.6 | Proved without any diamond property; this is all D10.11 uses |
| D9.8 definition versus points | F = Spd ℤ_p⟨T⟩, S = origin; S = ∅; A = 𝔽_p[t^{1/p^∞}], S = V(t) | Spd ℤ_p[[T]] with J = (p, T) (GLE 4.19); ∅; t ↦ 0 (in S^⋄), t ↦ ϖ (in the formal neighbourhood, not in S^⋄), t ↦ a unit of O_K in the maximal ideal of a rank-two K⁺ (in sp⁻¹(S), not in the formal neighbourhood): both inclusions strict | AGLR Example 2.29 realised; GLE Proposition 4.20 confirms the factorization criterion for prekimberlite sources; no change |
| D9.9 formal adicness of formal neighbourhoods | S open; S = origin of the perfect line | open: open immersion, formally adic; origin: fibre over the counit is Spd 𝔽_p[[T]] ≠ Spd 𝔽_p | "only when" weakened to "need not be otherwise" (fix 2) |
| D9.13 Check | Spd W(𝔽_{p²}) → Spd ℤ_p; Spd ℤ_p ⊂ Spd(ℤ_p × ℤ_p) | geometric generic fibre has 2 points, p = 2, 3 alike: not an open immersion; the component is an open immersion although V → F^red is finite étale and not the identity | True |
| D10.1 Checks | A an F-algebra; F[t]; (ϖ⁻¹, 0, …) and (ϖ, 0, …) | π maps to a non-unit of R^{♯+}, so no O-map A → R^{♯+}: Spec(A)^⋄ = ∅; the entire series Σ π^{n²}Tⁿ is a non-algebraic endomorphism of the rigid line; ϖ⁻¹ ∉ R^{♯+}, ϖ ∈ both | True |
| D10.4 Checks | O[[q]]; O; O_L unramified; O[[x, y]]/(x(x−π)) | open disc, one point, Spa(L, O_L) (connected, [L:E] points after base change), two disjoint open discs x = 0 and x = π | True; nonnormal example excluded by hypothesis |
| D10.9 v-closure of the open disc | D ⊂ B over C, p = 2, k_C = 𝔽₂ | η ∉ closure(D) since U(1/T) = {|T| ≥ 1} is open and misses D; the rank-two point η_{0,−} is in closure(D), so closure(D) is not weakly generalizing; the smallest closed weakly generalizing set contains η and all η_{f̄,−}, and B ∖ ⋃_{f̄≠T}⋃_n{|fⁿ| ≤ |ϖ|} is closed and weakly generalizing; for f̄ = T² + T + 1 the class {|f| < 1} contains the degree-two classical point α with |α − a| = 1 for all |a| = 1 | Check true; no change |
| D10.11 lemma (3), (1) | ℤ_p, 𝔽_{p²}; ℤ_p[√p] | W(𝔽_{p²}) ⊗ W(𝔽_{p²}) = W(𝔽_{p²} × 𝔽_{p²}) (2 factors), equalizer of the two inclusions ℤ_p; R^sh = ⋃ W(𝔽_{pʳ}) is a non-complete DVR with completion W(𝔽̄_p); ℤ_p[√p]⊗ℤ_p[√p] = ℤ_p[√p][y]/(y² − p) is local with nilpotents mod √p | Checks true |
| D11.1 Check 3 | Spd ℤ_p⟨T, T⁻¹⟩ → Spd ℤ_p⟨T⟩ | points with |T| = 1 have rank-two specializations with |T| < 1 outside the source, so the open immersion is not partially proper; the source is valuative as a formal scheme | True |
| D11.5 rank-two field | (C, C⁺), rank two | Spa(C, C⁺) is Sierpiński with the rank-one point open; Spec(C⁺/m_C) is Sierpiński with (0) open; sp is a homeomorphism; the fibre over the closed point is the closed point, interior ∅, tube empty | GLE Example 4.43; no change |
| D11.8 Check | Spd(C, C⁺) rank two | the closed point is the complement of the open generic point, constructible, and has rank two: not cJ | True |
| D11.10 Check 3 | L the completed perfection of C(T) with Gauss norm, L⁺ over the T-adic ring of k_C(T^{1/p^∞}) | O_C ⊂ L⁺ (constants ↦ constants), two points, the rank-two one a constructible singleton: not cJ; Spa(C, C⁺) with C⁺ ⊊ O_C has no map to Spa(C, O_C) | True |
| D11.12 Check | ℤ_p⟨x, y⟩/(x(x − p)) | A/p = 𝔽_p[x, y]/(x²), reduced line A¹; tube at y = ā is {x = 0} ⊔ {x = p}, two open discs | True |
| D11.14 punctured chain | 𝔭₀ ⊊ 𝔭₁ ⊊ … with 𝔪 deleted | opens are finite initial segments or the whole space, so locally noetherian; every 𝔭ₙ specializes to 𝔭ₙ₊₁; 0 closed points | Closed-specialization hypothesis is independent of richness; kept |
| D11.17 Check 1 | B = O⟨X, Y⟩/(Y² − π²X) | B[1/π] ≅ F⟨z⟩ via X = z², Y = πz; z ∉ B, z² = X; B⁺ = O⟨z⟩, normal and integral over B; |z|² = |X| ≤ 1 on bounded valuations | True |
| D11.20 non-example and negative control | O⟨x, y⟩/(y² − π²x), p ≠ 2, x = ā a nonzero square; A = ℤ_p + pO_L, L/ℚ_p unramified of degree d > 1 | tube is {|z² − a| < 1} = {|z − √a| < 1} ⊔ {|z + √a| < 1} since |2√a| = 1; A/pA has length d with residue field 𝔽_p and A/pO_L = 𝔽_p; Spec O_L → Spec A has one point over one point with residue degree d, so d geometric points: not a universal homeomorphism, hence A is weakly normal, not normal, and its only tube Spa(L, O_L) is connected | The algebraically closed residue field of D11.20 is needed; no change |
| Conventions | DVR witness; Spec 0 | v(π) < 1, v(1) = 1 sends the point to (π), not (0); Spec 0 = ∅ with no minimal point | No change |
| D10.15 degenerate ranks | GL of rank n, μ of dimension d ∈ {0, n}; n = 0 | Gr(0, Λ) = Gr(n, Λ) = Spec O_E; rank zero has only d = 0 | No change |

Source checks: in the extractions I read GLE Definition 2.1 (olivine spectrum, rank 1 or 0 vertical
generization), Lemma 3.30, Proposition 3.19 and its proof, Definition 4.18 and Propositions
4.19–4.22, SW20 Lemma 18.3.2, Proposition 18.4.1 and its proof (which asserts the maximal diamond
open without proof), the remark that Spd ℤ_p is not a diamond, DJ95 Definition 7.0.1 and Lemma
7.3.5, BHA17 Remark 7.4.12 and Theorem 8.1.2: statements match the README. Source issues recorded by
the accepted review stand (AGLR Proposition 2.39 needs an algebraically closed residue field; the
README states it so).

## Unresolved

- GeometricSatakeAndFusion §4.17 (earlier in the merge order) constructs its v-sheaf local model "as
  the v-closure of the generic Schubert bound" without defining v-closures or citing this roadmap;
  the construction is D10.9 here. D10.15 keeps citing §4.17 as its supplier, as the accepted
  package does; the maintainer may want GeometricSatakeAndFusion to state the v-closure it uses or to
  cite D10.9 once this roadmap is merged (which would reverse that edge).
- GeometricSatakeAndFusionPartII is named as a consumer only; it is a board package without a path
  in the brief and was not opened.
- Whether `Spd k` is a diamond for a perfect field k is left out of D10.6's statement (only
  quasiseparated diamond opens are compared); SW20 asserts the unrestricted maximal-diamond-open
  property without proof, and the recovery theorems do not need it.
- The ten supplier contracts remain as declared by the accepted review (renamed as listed above).

## Review-text instructions

None were followed; reviews, supplier READMEs and sources were read as data.


Pull request: #1830 (roadmap/diamonds-and-v-stacks-part-ii at 90959b9)
