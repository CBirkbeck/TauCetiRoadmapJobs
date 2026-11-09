# Review of ClassifyingSpaces (pull request #1807 at 7871afe)

**Verdict:** needs changes

This is a full review of `TauCetiRoadmap/ClassifyingSpaces/README.md` (1,145 lines) and `TauCetiRoadmap/ClassifyingSpaces/Suggested.lean` (146 lines). The folder has not changed since cabeb14. There are three findings: one P1 (a sign in Layer 2), one P2 (the ownership boundary with this pull request's own AlgebraicTopology folder) and one P3. The gate passes.

## R01 (P1) — The degree-one clause of 2.1 and the circle Checks of 2.1 and 2.2 have the wrong sign

**Location.** `TauCetiRoadmap/ClassifyingSpaces/README.md` lines 886–888: "In degree one, the composite with the Hurewicz isomorphism is the abelianization of `Ψ`, followed by Mathlib's `H₁(G, ℤ) ≅ Gᵃᵇ`; for `X = BG` this is the pinned `TauCeti.classifyingSpaceFirstHomologyAddEquivGroupHomology`." Also:
- the 2.1 Check at lines 904–906 (the counterclockwise loop goes to `1`);
- the 2.2 Check at lines 958–959 (the generator goes to `1 ↦ 1`).

**Claim.** Take `X = BG` with the pinned identification `Φ`. By 2.1's second API bullet, the comparison is then the pinned `TauCeti.classifyingSpaceSingularHomologyIsoGroupHomology`. The bullet above says that, in degree one, this sends the class of a loop `γ` to the class of the `1`-cycle `Φ γ`.

**Witness.** Take `G = ℤ = ⟨t⟩` and `Φ γ = t`. The lift of `γ` ends at `(0, t⁻¹)` (`…_apply_eq_iff`), so the bar comparison gives `[t⁻¹] = −1` in `H₁(ℤ, ℤ)`. The pinned Hurewicz-based isomorphism gives `+1` (`FirstHomology.lean:189`).

**Computation.** Each step can be checked at the pins:
1. `TauCeti.classifyingSpaceSingularHomologyIsoGroupHomology` (`TauCeti/AlgebraicTopology/ClassifyingSpace/Homology.lean:69`) has two parts:
   - the identification of the chains of `BG` with `(k ⊗ C(EG))_G`, `⟦a ⊗ c⟧ ↦ a • p_* c`, with no inversion (`TauCeti/AlgebraicTopology/Singular/ModuleChains/GroupHomology.lean:215, 228`);
   - Mathlib's `groupHomologyIso` (`Mathlib/RepresentationTheory/Homological/GroupHomology/Basic.lean:254`). This compares the resolution `C(EG)` with the bar resolution and then applies `inhomogeneousChainsIso` (line 181).
2. `G` acts on chains by left translation (`TauCeti/AlgebraicTopology/Singular/ModuleChains/Resolution.lean:73`). A path simplex has boundary `g 1 − g 0` (`…/Singular/ModuleChains/Basic.lean:223`). Mathlib's bar differential is `d[g] = g·[] − []` (`Mathlib/RepresentationTheory/Homological/Resolution.lean:348`). So an equivariant comparison over `id_k` sends:
   - the point `g·e₀` to `g·[]`;
   - a `1`-simplex from `g₀·e₀` to `g₁·e₀` to `g₀·[g₀⁻¹g₁]`.
3. The lift of `γ` from `e₀ = (0, 1)` ends at `(0, Φ(γ)⁻¹)`. This follows from `TauCeti.classifyingSpaceFundamentalGroupMulEquiv_apply_eq_iff` (`ClassifyingSpace/EilenbergMacLane.lean:77`); Mathlib's `IsCoveringMap.monodromy` is the end point of the lift (`Mathlib/Topology/Homotopy/Lifting.lean:385–388`). The lift therefore goes to `[Φ(γ)⁻¹]`. `coinvariantsTensorFreeLEquiv` (`Mathlib/RepresentationTheory/Coinvariants.lean:498`) sends that to the `1`-cycle `Φ(γ)⁻¹` with coefficient `1`.
4. In `H₁(G, ℤ)` the class of `g⁻¹` is minus the class of `g`. So the composite with Hurewicz is `γ ↦ −[Φ γ]`. The pinned `classifyingSpaceFirstHomologyAddEquivGroupHomology_hurewiczHomologyAddEquiv` (`ClassifyingSpace/FirstHomology.lean:189`) sends the same class to `+[Φ γ]`. The two pinned isomorphisms therefore differ by negation, and no pinned lemma relates them.

This README already computes the cellular form of step 3: its Conventions Check at line 254 gives the lifted `1`-cell the boundary `t⁻¹ − 1` times the base lift.

Cohomology goes the other way, but the sign is the same. The comparison from the bar resolution to `C(EG)` sends `[t]` to a path from `e₀` to `t·e₀`, whose image is a loop with `Φ = t⁻¹`. So the class dual to the counterclockwise loop goes to `1 ↦ −1`.

**Repair.** Replace three passages.
- Lines 886–888: "In degree one, the composite with the Hurewicz isomorphism sends the class of a loop `γ` at `x` to the class of the `1`-cycle `(Ψ γ)⁻¹`. It is the abelianization of `Ψ`, followed by inversion and Mathlib's `H₁(G, ℤ) ≅ Gᵃᵇ`. The reason is that the lift of `c_X ∘ γ` from `(0, 1)` ends at `(0, (Ψ γ)⁻¹)`, and Mathlib's bar differential is `d[g] = g·[] − []`. For `X = BG` it is the negative of the pinned `TauCeti.classifyingSpaceFirstHomologyAddEquivGroupHomology`."
- Lines 904–906: "… the class of the counterclockwise loop goes to the class of the `1`-cycle `t⁻¹`, that is to `−1` under `H₁(ℤ, ℤ) ≅ ℤ`. A comparison that read the end-point label `m` as `Ψ`, as the pinned Hurewicz-based isomorphism does, gives `+1`."
- Lines 958–959: "… the class dual to the counterclockwise loop goes to the homomorphism `1 ↦ −1`; the Hurewicz-normalised identification gives `1 ↦ 1`."

Tested on `G = ℤ`: steps 1–4 give `−1` in homology and `1 ↦ −1` in cohomology, which are the restated values.

## R02 (P2) — Hatcher 1B.9 has two owners in this pull request, and the nerve-model comparison has none

**Location.** README lines 83–86: "The classification of pointed maps … is the case of items 1.1 and 1.2 … and is owned here, not in the algebraic-topology roadmap. This roadmap consumes nothing from the algebraic-topology roadmap". Also lines 75–82 and 1104–1112, and `Suggested.lean:84`.

**Claim.** This roadmap owns Proposition 1B.9 (items 1.1–1.2). AlgebraicTopology Stage 8.8b owns the normalised comparison of its nerve model with the pinned models, and consumes Layer 1 to do so.

**Witness.** `TauCetiRoadmap/AlgebraicTopology/Suggested.lean:693` states `exists_mapOfEq_eq_of_isAspherical_cwComplex`, binder for binder this file's line 84. Its README (lines 94–107, 2825–2857) says "ClassifyingSpaces consumes this classification … owns no second proof" and hands this roadmap the normalised comparison.

So, within one pull request:
- the same theorem is stated twice;
- the comparison of the nerve model with the Milnor and cellular models is assigned by each README to the other, so neither owns it;
- this README's *Downstream consumers* bullet is false at this head. It says Stage 8.8b's inputs are Layer 1, but AlgebraicTopology's table (line 3314) lists 8.8b's inputs as "8.8a bar model, 4, 8.5".

The review at 92defa2 raised the same point (its R01). The AlgebraicTopology side has not changed on it.

**Repair.** Choose one owner and make both folders say the same. The recommended choice keeps this README's direction. That is also the direction of main's AlgebraicTopology README (lines 93–100: 8.8b consumes this roadmap). It is also the direction of the stacked #1808, whose AlgebraicTopology table reads "8.8b normalized model comparison | AT8.8a bar model; ClassifyingSpaces Layer 1 items 1.1–1.3".
1. In `TauCetiRoadmap/AlgebraicTopology/Suggested.lean`, delete `exists_mapOfEq_eq_of_isAspherical_cwComplex` (lines 685–702).
2. In AlgebraicTopology's README, rewrite lines 94–107, 555–556 and 2825–2861 so that:
   - 8.8b consumes ClassifyingSpaces Layer 1, items 1.1–1.3; its bijection `[X, Bπ]_* ≃ Hom(π₁X, π)` is items 1.1–1.2 with the bar model as target;
   - 8.8b owns the normalised comparison of the bar model with the pinned models.
   Add ClassifyingSpaces Layer 1 to its table line 3314.
3. Here, cite AlgebraicTopology by its own numbering, "Stage 8.8a and 8.8b" (lines 77 and 1104), and change nothing else.

Tested after the repair:
- one declaration in the pull request has an `IsAspherical` target and concludes `HomotopicRel f g {x}` (`ClassifyingSpaces/Suggested.lean:84`);
- AlgebraicTopology consuming this roadmap is the only edge between the two;
- the dependency check finds no cycle, since this README cites nothing of AlgebraicTopology.

The alternative is for AlgebraicTopology to own 1B.9. Then:
- delete this file's first headline and items 1.1–1.2;
- give 1.3 a `*Needs:*` on AlgebraicTopology 8.8b;
- drop "consumes nothing from the algebraic-topology roadmap";
- own the normalised nerve comparison here.

#1854's head of this README makes that opposite choice ("Stage 3 item 11 | Hatcher, Proposition 1B.9 | the algebraic-topology roadmap, Stage 8 item 8b"). Whichever owner is chosen here, #1854 must follow when it rebases.

## R03 (P3) — Two supplier attributions, and a negative control that fails over the zero ring

- **`fundamentalGroupMulEquivOfPath` is Mathlib's.** README lines 479–483 list `FundamentalGroup.fundamentalGroupMulEquivOfPath` among the pinned Tau Ceti declarations of `TauCeti/AlgebraicTopology/FundamentalGroup/BasepointChange.lean`. At the pin it is Mathlib's (`Mathlib/AlgebraicTopology/FundamentalGroupoid/FundamentalGroup.lean:48`); only the three lemmas after it are in that Tau Ceti file (lines 197, 228, 248). Repair: move it to *From Mathlib*; item 1.1's *Needs* already calls it Mathlib's.
- **Wrong file for `Rep.trivial` and `Rep.ihom`.** README lines 279–282 place them in `Mathlib/RepresentationTheory/Homological/`. At the pin they are in `Mathlib/RepresentationTheory/Rep/Basic.lean` (lines 288 and 774). Repair: name that file for these two.
- **The negative control fails for the zero ring.** `Suggested.lean:120–121` says "for `X = S² ∨ S¹`, `G = ℤ` and `A` trivial the two sides differ in degree two". When `k` is the zero ring, which `[CommRing k]` allows, both sides are zero. Repair: say "for `k = ℤ`", where `H₂(S² ∨ S¹; ℤ) = ℤ` and `H₂(ℤ, ℤ) = 0`.

## Verified sound

**Gate and build.**
- The worker's gate at this head passes every check (`set_option`, LaTeX, sorry'd data, imports, statement hygiene, dropped ids, depcheck, stray files, build).
- The dependency check, run by this review, prints `depcheck: 236 roadmaps, 2264 edges, 0 problem(s)`, so there is no UPWARD or CYCLE line. The README cites no roadmap as a supplier, and the roadmap is on main.
- `lake env lean` on `Suggested.lean` gives exactly four warnings, `declaration uses 'sorry'` at lines 84, 102, 122 and 137.
- `#check @name` of the four headlines, from the built module in one scratch file, gives elaborated types that match the README. Layer 1 has `X` and `Y` in independent universes; Layer 2 has `k`, `G` and `X` in one universe. Every binder is in the declaration's own signature. No change was needed.
- `[PathConnectedSpace X]` in headlines 3–4 is implied by `IsAspherical`, but `ofRepresentation` needs it as an instance (`LocalCoefficient/Representation.lean:59`), so it stays.

**Padding.** In a scratch copy, each `sorry` was replaced by `first | simp | rfl | infer_instance | aesop | exact ⟨…⟩`. All four fail ("unsolved goals" or a constructor mismatch). There is no padding. Headlines 1–2 are not one lemma from the pin:
- `TauCeti.exists_mapOfEq_cellularClassifyingSpace` covers only the cellular source;
- `TauCeti.IsAspherical.exists_homotopyEquiv` works up to a path and in one universe.

Headlines 3–4 have no pinned counterpart for an arbitrary aspherical `X`.

**Library names.** All 196 backticked qualified names in the README and the Lean file elaborate in a scratch `#check @` file importing Mathlib and the 102 Tau Ceti modules that define them. These were opened and read at the pin:
- Tau Ceti `EilenbergMacLane/Basic.lean:59` (`IsAspherical` includes `PathConnectedSpace`) and `:123`;
- `ClassifyingSpace/EilenbergMacLane.lean:77`;
- `ClassifyingSpace/Homology.lean:69` and `FirstHomology.lean:73, 167, 189`;
- `Singular/ModuleChains/GroupHomology.lean:215, 242`, `Resolution.lean:73, 131` and `Basic.lean:223`;
- `Homotopy/KillHomotopyGroups.lean:249` (the tower is T2) and `:301` (the `π₁` equivalence is `MulEquiv.ofBijective` of the induced map);
- `LocalCoefficient/Representation.lean:80, 111, 122`; no transport along an isomorphism of representations exists, as 2.3 says;
- `EilenbergMacLane/Contractible.lean:53`;
- `ClassifyingSpace/Torus.lean:87, 93, 172` and `WedgeCircles.lean:126, 133, 227`; their equivalences are pointed only after a base-point path, as Layer 1's Examples say;
- `FundamentalGroup/BasepointChange.lean:197, 228, 248`;
- Mathlib `GroupHomology/Basic.lean:181, 254`, `Homological/Resolution.lean:348`, `Coinvariants.lean:498`, `Topology/Homotopy/Lifting.lean:388` and `FundamentalGroupoid/InducedMaps.lean:39`.

These signatures were compared with the routes:
- `exists_mapOfEq_cellularClassifyingSpace`, `homotopicRel_singleton_of_mapOfEq_eq_of_cwComplex` and `homotopicRel_skeletonLT_one_of_forall_homotopicRel`;
- `IsWeakHomotopyEquivalence.homotopyEquiv` (independent universes) and `exists_comp_homotopic`;
- `HasHomotopyExtensionProperty.exists_extension_of_isClosed`, `zero_one_prod_univ_union_univ_prod`, `hasHomotopyExtensionProperty_skeletonLT` and `NDRPair.ofHomotopyRel`;
- `pullback_monodromyRepresentation`, `Groupoid.natIsoOfEnd`, `isIso_twistedHomologyMap` and `twistedCohomologyMap_eq_comp`;
- the two twisted comparisons for Milnor's model and the fibre-iso lemmas;
- `cellularClassifyingSpace_universalCover_smul_def`, `UniversalCover.smul_mk` and `deckFundamentalGroupEquiv_symm_op`.

All of them match their use. The file attributions in *From Tau Ceti* are correct apart from R03.

**Sources (seeded sample; every printed page equals the PDF page minus 9).**

| Target | Locator | `hatcher-at` lines | Verdict |
| --- | --- | --- | --- |
| 1.1 existence | Prop. 1B.9, p. 90, proof pp. 90–91; `K(G, 1)` has a contractible universal cover (p. 87); `n ≥ 3` extension uses only `π_{n−1}(Y) = 0` (p. 91) | 3905–3907, 3912–3931, 3800 | correct; hypotheses as restated |
| 1.1 HEP of a point | Prop. 0.16, p. 15; Prop. A.4, p. 522; Prop. 4.22, p. 357 | 818–819, 22629–22630, 15549–15550 | correct |
| 1.2 uniqueness | Prop. 1B.9, "unique up to homotopy fixing x₀"; single `0`-cell p. 90, maximal tree p. 91 | 3906–3907, 3932–3949 | correct; the proof's vertex assumption is noted (see Source issues) |
| 1.3 pointed uniqueness | Thm. 1B.8, p. 90, deduced from 1B.9 by pointed maps inducing inverse isomorphisms | 3897–3898, 3908–3911 | correct |
| 2.1 homology | §2.2, p. 148 ("Homology of Groups", written `Hₙ(G)`); §3.H, p. 328; Ex. 3H.1, p. 329 | 6471–6479, 14326–14367, 14373–14379 | correct |
| 2.2 cohomology | §3.H, p. 328 (`Hom_{ℤ[π]}(Cₙ(X̃), M)`); Ex. 3H.1, cohomology half | 14368–14370, 14379–14383 | correct |
| 2.3 local coefficients | §3.H, p. 328 (needs a path-connected `X` with a universal cover, which a CW complex has) | 14327–14370 | correct |

Outside the sample, Segal 1968 §3 was also checked: `segal-1968` lines 95–126 compare the nerve model with Milnor's join, which is correct.

**Adversarial table** (every sampled target, every headline, every target a finding touches).

| Statement | Instance | Values computed (each side) | Result | Change |
| --- | --- | --- | --- | --- |
| Conventions, `Φ(γ) = m(γ)⁻¹` | `S₃`, `s = (1 2)`, `t = (2 3)` | `m(ℓ_s ℓ_t) = ts = (1 3 2)`; `Φ` gives `(ts)⁻¹ = st = (1 2 3) = Φ(ℓ_s)Φ(ℓ_t)`; `m` gives `(1 3 2) ≠ (1 2 3)` | holds | none |
| Conventions, sign | `G = ℤ`, lift ending at `(0, 1)` | `apply_eq_iff`: `g⁻¹ = 1`, so `Φ = −1` | holds | none |
| Conventions, deck action | `⟨t | ⟩`, `t⁻¹ • [refl] = mk[ℓ_t]` (`smul_mk`, `smul_def` via `Θ.symm`) | `∂` of the lifted cell `= (t⁻¹ − 1)·base`; without the inverse it would be `t − 1` | holds | none |
| 1.1, non-CW control | `{0} ∪ {1/m}` | a retraction would send `(1, 0) ↦ (0, 0) ≠ (1, 0)` | control valid | none |
| 1.1, NDR data | `r = (1 − ‖z₀‖)/2` | ball radius `≤ (1 + ‖z₀‖)/2 < 1`; `c⁻¹(0) = {x}`; `c < 1 ⇒` in `U`; continuous on the open cover `e`, `Xⁿ∖U` | holds | none |
| 1.1, off-vertex base point | `S¹`, `v = 1`, `x = −1`, `φ = id` | rotation by `π`: `v ↦ −1`, `x ↦ 1`; trace of the rotations by `π − πt` at `x` runs `1 → −i → −1`, which is `f₀∘α`; the end map is `id` | holds | none |
| 1.1, route identity | algebra | `e_*ℓ^δ = β_τ(eℓ)_* = ι_*` and `e_* = ι_*ψ` give `ψℓ^δ = id`, hence `g_*ℓ^δ = φ` | holds | none |
| 1.1, `δ`-correction control | wedge of 2 circles, `B(F₂)`, `λ = a` | conjugating `φ` by `a` gives `b ↦ aba⁻¹ ≠ b` | control valid | none |
| 1.1/1.2, target control | `X = Y = S²` | `id` and the constant map are both trivial on `π₁`; degrees `1` and `0` | uniqueness needs asphericity | none |
| 1.2, off-vertex base point | `[0, 1]`, `x = 1/2`, `f = exp(2πi(t − 1/2))y`, `g ≡ y` | `f(0) = f(1) = −y`; `H(s, t) = f((1 − s)t + s/2)` has `H(s, 1/2) = y` and `H(1, ·) = y` | holds | none |
| 1.2, vertex step | `[0, 1]`, `x = 0`, `f` a degree-1 loop, `g` constant | `deg K_v = 1`; `deg(g'∘σ_v) = deg((g∘σ_v)·K_v) = 1 = deg(f∘σ_v)` | holds | none |
| 1.2, reduction | trace `τ_f·H_x·τ_g⁻¹` with `H_x ≃ τ_f⁻¹τ_g` | null-homotopic; the rotation homotopy on `S¹` has trace of degree `1` | holds | none |
| 1.3 / headline 2 | `S¹ → S¹`, `e = −id` | conjugation fixes `1` and has degree `−1 = e` | holds | none |
| 1.3, `G = 1` / CW hypotheses | contractible CW vs a point; point vs Warsaw circle | pointed homotopy equivalence exists; `π_n = 0` for both, not homotopy equivalent | holds; hypotheses needed | none |
| 2.1, `ℤ/m`, `k = ℤ` | complex `ℤ –0→ ℤ –m→ ℤ –0→ ℤ` | `H₂ = ker(m)/0 = 0` for `m ≥ 2`; `H₁ = ℤ/m` | holds | none |
| 2.1, torus | `r = 2` | ranks `C(2, 1) = 2`, `C(2, 2) = 1` | holds | none |
| 2.1, degree-one bullet | `G = ℤ`, `X = BG`, `Φγ = t` | pinned general comparison: `[t⁻¹] = −1`; pinned `FirstHomology…`: `[t] = +1` | **fails** | R01 |
| 2.1, circle Check | counterclockwise loop, `Ψ` = degree | README `+1`; computed `−1` | **fails** | R01 |
| 2.2, circle Check | class dual to the counterclockwise loop | README `1 ↦ 1`; computed `1 ↦ −1` | **fails** | R01 |
| 2.2, Bockstein | `ℤ/2`, `0 → ℤ/2 → ℤ/4 → ℤ/2 → 0` | `Hom(ℤ/2, ℤ/2) → Hom(ℤ/2, ℤ/4)` injective, orders `2, 2`, so the next map is `0` and `δ : H¹ → H²` is an isomorphism | holds | none |
| 2.3, step-3 Check | `ℤ`, circle, unit `u` | lift ends at `(0, −1)`; the fibre iso gives `(−(−1))•1 = u`; without the inversion `u⁻¹`, which differs iff `u² ≠ 1` | holds | none |
| 2.3, twisted circle | `A = k`, `u` | `H₀ = k/(u − 1)k` vs constant `k` (they differ iff `u ≠ 1`, by the annihilator); `H₁ = ker(u − 1)` | holds | none |
| 2.3, sign representation | `ℤ/2`, `k = ℤ` | `d₁ = −2`, `d₂ = 0`, `d₃ = −2`: `H₀ = ℤ/2`, `H₁ = 0`, `H₂ = ℤ/2`; trivial coefficients: `ℤ`, `ℤ/2`, `0` | holds | none |
| 2.3, transport control | `k²`, swap, `u = diag(1, −1)` | `u∘swap(1, 0) = (0, −1)`, `swap∘u(1, 0) = (0, 1)` | not intertwining for `2 ≠ 0` | none |
| Headline 3 | `A = k[G]` | LHS `Hₙ(X̃; k) = k, 0`; RHS `Hₙ(G, k[G]) = k, 0` | holds | none |
| Headline 3 | `k` the zero ring | both `0` | holds; the docstring control fails | R03 |
| Headline 3, asphericity control | `S² ∨ S¹`, `k = ℤ` | `H₂ = ℤ` vs `0` | control valid for `k = ℤ` | R03 |
| Headline 4 | `A = k[G]`, `N = k` | LHS `Hⁿ(X̃; k) = k, 0`; RHS `Hⁿ(G, Coind) = k, 0` (Shapiro) | holds | none |
| Headline 1 vs AlgebraicTopology | `AlgebraicTopology/Suggested.lean:693` vs line 84 | identical binders and conclusion | duplicate | R02 |

**Earlier findings now repaired.** The review at 92defa2 raised R02–R07; all are repaired at this head:
- arbitrary base points are reached through the homotopy extension property of a point (1.1);
- the universe reason now names `groupHomology` (line 195);
- the 1B.9 locator now records the hypothesis on `Y` and p. 91;
- Layer 2 has locators;
- the circle-resolution Check now notes the degree-3 term;
- 2.2's API is in bullets.

**Cross-roadmap citations resolved.**
- `Completed/UniversalCovers` and `ProfiniteCohomology` are on main.
- AlgebraicTopology's Stage 8.8a and 8.8b exist at this head; the contradiction is R02.
- CharacteristicClasses at this head (line 831) consumes "AT8.8b's normalized model comparison" for `B(ℤ/2)`, which matches line 1113 here.
- The Stage and item map (lines 106–167) covers all 19 items of main's version of this README (main lines 110–255).
- It also resolves the heading anchor `#stage-2-the-cellular-model`, which FreeGroupsAndLimitGroups cites (main line 29). The gate reports `dropped=0`.
- Open roadmaps that cite this roadmap's Stage numbers resolve through the same map: ArithmeticLocallySymmetricSpaces (Stage 3 item 13, Stage 4 items 16–18), TangentialBordism (Stage 4), StableHomotopyKTheory (Stages 1.5–4.19) and ArithmeticKTheory (Stage 3).

**Overlaps.**
- #1808 follows this pull request, as its merge-order paragraph says. #1187 and #1854 are covered by "No open pull request must merge before this one".
- Ownership against open pull requests was checked with `roadmaps grep` for 1B.9, for `IsAspherical`/`HomotopicRel` headlines and for local-coefficient comparisons of a `K(G, 1)`. The only second owner is this pull request's AlgebraicTopology (R02). #1652's AlgebraicTopology uses 1B.9 only for its own bar model and treats the model comparison as pinned.
- Layer 2's objects have no other owner.
- The pin's general `IsQuotientCoveringMap.twistedHomologyIsoGroupHomology` and `IsCoveringMap.contractibleSpace_of_isAspherical` give an alternative route to 2.3. They do not duplicate it, because the pin has no transport for `ofRepresentation`.

**Shape.**
- The headings follow the house form.
- Every layer ends with *Examples* and *Dependencies*.
- Each definition has at least three Checks: Conventions 3 + 2, 1.1 has 8, 1.2 has 6, 1.3 has 4, 2.1 has 4, 2.2 has 3, 2.3 has 6.
- There are no process words, LaTeX delimiters or pull-request numbers.
- The four README headline names are exactly the four declarations.
- The module docstring names the headlines that are pinned theorems and the 2.1/2.2 canonical comparisons, which are left to the README because they are constructions.
- Imports are `Mathlib` plus four Tau Ceti modules, all used. Only `theorem` is used, and there is no `set_option`.

## Not verifiable

- `brown-cohomology` Chapter III §1, cited at 2.1–2.3 for (co)homology through a projective resolution: recorded as uncertified, and no legal text is held. The Hatcher locators at the same claims were verified.
- `schwamberger-vogt-2009` §2 (the Warsaw circle, at 1.3): uncertified. The fact used (path-connected, all homotopy groups trivial, not contractible) was checked by reasoning, not against the text.
- `milnor-1956` §3: uncertified. It is cited only for the pinned model.

## Source issues

- **Gap** in hatcher-at at Proposition 1B.9, printed pp. 90–91: the source says the result holds for any base point x₀ of a connected CW complex, but its proof takes x₀ to be the single 0-cell, then a vertex of a maximal tree; it should be stated for a 0-cell x₀, or reduce an arbitrary x₀ to a vertex by subdivision or homotopy extension at x₀; affects the proof.
