# Review of PresentationsOfMonoidalCategories (pull request #2308 at 7e4cf77)

**Verdict:** needs changes

## R01 (P2) — `Suggested.lean` is absent; the gate fails on `missing-files`

**Location:** `TauCetiRoadmap/PresentationsOfMonoidalCategories/` (the folder holds `README.md` and `metadata.toml` only); README lines 119–125, 132, 148 backtick `TauCeti.FusionRules`, `TauCeti.FSymbols`, `TauCeti.RSymbols`, `FSymbols.Model`, `TauCeti.IsSplitSimpleBasis`.

**Claim:** A roadmap folder carries `Suggested.lean`, and each backticked name of the roadmap's own is declared there.

**Witness:** Gate at 7e4cf77: `missing-files=1 FAIL`, `TauCetiRoadmap/PresentationsOfMonoidalCategories/Suggested.lean`. No declaration of `FusionRules`, `FSymbols`, `RSymbols` or `IsSplitSimpleBasis` exists anywhere.

**Repair:** Add `Suggested.lean` (`import Mathlib`, `namespace TauCetiRoadmap.PresentationsOfMonoidalCategories`). Give `FusionRules`, `FSymbols`, `RSymbols` and `IsSplitSimpleBasis` real bodies as structures and a predicate on `Matrix`, `HomOrthogonal` and `Module.finrank`, and state the headlines that need only these. The module docstring names the headlines that are not statable because `FSymbols.Model` with its monoidal structure is a construction (Layer 1 main theorem, reconstruction, classification, autoequivalences, Layers 4–6 on `Model P`). No `sorry`'d `def` or `instance`.

## R02 (P2) — Classification, autoequivalences and `SplitK0` lack the hypothesis that `R` is nontrivial

**Location:** README line 183, "`Model P` and `Model Q` are related by an `R`-linear monoidal equivalence iff `Q = g • P.reindex σ`"; line 144, "`SplitK0 (Model P)` is ring-isomorphic to `ι →₀ ℤ`"; lines 191–196.

**Claim:** These hold over every commutative ring `R` (line 30 fixes the generality; only the sub-bullet at line 185 says "nontrivial").

**Witness:** `R = 0`, `ι = {u, x}`: `x⊗x = u` and `x⊗x = u + x` both carry `FSymbols` (every matrix identity holds), both models have all Homs zero, so they are equivalent; no `σ` matches `N`. `SplitK0 = 0 ≠ ℤ²`. Every relabeling lies in the kernel.

**Repair:** State `[Nontrivial R]` in each of the three items: "For nontrivial `R`, `SplitK0 (Model P)` is …", "For nontrivial `R`, `Model P` and `Model Q` are related … iff …", "For nontrivial `R`, … its kernel is `{(id, ∂η)}`". Add the zero-ring instance above as a negative-control Check in Layer 3.

## R03 (P2) — Declarations listed as existing in Mathlib and Tau Ceti that are absent at the pins

**Location:** README line 94, "paired by `ExactPairing.tensorOf`"; line 113, "`TauCeti.VecTwisted k G c`, built from `TauCeti.TwistedGradedObject`" (under "What Mathlib and Tau Ceti already have").

**Claim:** These three declarations exist at the pinned libraries.

**Witness:** Pinned Mathlib has `ExactPairing.tensor` (`Mathlib/CategoryTheory/Monoidal/Rigid/Basic.lean:141`), no `tensorOf`. Pinned Tau Ceti has neither `VecTwisted` nor `TwistedGradedObject`; `VecTwisted` is a `sorry`'d target, `TauCetiRoadmap/PivotalSpherical/Suggested.lean:448`. `TwistedGradedObject` occurs in no roadmap.

**Repair:** Line 94: "paired by Mathlib's `ExactPairing.tensor`". Line 113: move out of the "already have" list and write "`Vec^ω_G` for a normalized 3-cocycle `ω`: PivotalSpherical Layer 8 (`VecTwisted k G c`, `c : ThreeCocycle k G` with `c.ω = ω`)"; delete `TauCeti.TwistedGradedObject`. Line 201: say `c.ω = ω`, since `c` is otherwise undefined here.

## R04 (P2) — Dual bases for split simple families: cited from an open revision and planned twice

**Location:** README line 109, "dual bases over a field: `homDual`, `sum_sum_homDual_comp_eq_id`"; lines 153–157, "**API** (the ring analogues of PivotalSpherical's `homDual` results)".

**Claim:** Tau Ceti has `homDual` over a field, and the ring version (free Homs, perfect pairing, completeness) is this roadmap's target.

**Witness:** `homDual` is absent from pinned Tau Ceti and from PivotalSpherical on main. Open pull request #2311 (PivotalSpherical) README lines 382–397 plans the same three facts over a commutative ring, under "Split simple families", with `b.homDual`.

**Repair:** One owner. Either delete lines 154–157 and cite "PivotalSpherical, Layer 3, *Dual bases of morphisms, over a commutative ring*", naming that revision as a dependency in the description; or keep lines 154–157, drop line 109 and "the ring analogues of PivotalSpherical's `homDual` results", and have the PivotalSpherical revision cite `IsSplitSimpleBasis` here. `sum_sum_homDual_comp_eq_id` is defined at neither head: drop the name.

## R05 (P2) — "Duals of biproducts" restates a pinned Tau Ceti declaration

**Location:** README lines 216–217, "**Duals of biproducts:** in a monoidal preadditive category, a finite biproduct of objects with right (left) duals has a right (left) dual."

**Claim:** This is a target to build in Layer 5.

**Witness:** `TauCeti.ExactPairing.biproduct : ExactPairing (⨁ X) (⨁ Y)` at `TauCeti/CategoryTheory/Monoidal/Rigid/Biproduct.lean:163`, with `biproduct_evaluation` and `biproduct_coevaluation` (lines 202, 209), in a monoidal preadditive category; it gives both the right and the left dual.

**Repair:** Delete the bullet from Layer 5 and add to the Tau Ceti list at line 106: "`TauCeti.ExactPairing.biproduct` (`TauCeti/CategoryTheory/Monoidal/Rigid/Biproduct.lean`): exact pairings of finite biproducts". The **Rigidity** bullet then reads "… by `TauCeti.ExactPairing.biproduct` applied to the standard pairings of the simples".

## R06 (P3) — No statement carries a source locator

**Location:** README lines 249–257 (`## References`): five works, none cited at a claim, none with a theorem, section or page.

**Claim:** Each theorem has an exact locator at the claim.

**Witness:** 0 locators in the README. Verified candidates: EGNO2015 line 1589 (Prop. 2.2.4, p. 24), line 4165 (§4.9, (4.12)–(4.13), p. 77), line 4087 (Prop. 4.8.1, p. 76); Kitaev2006 line 3656 (eq. (177), p. 68).

**Repair:** Cite at the claims: line 142, derived unit triangles: EGNO Prop. 2.2.4, p. 24. Line 53, `F`: EGNO §4.9, (4.12)–(4.13), p. 77; Kitaev §E.1, eq. (177), p. 68 (arXiv v3). Pentagon: Kitaev Fig. 17a, p. 69. Hexagons: Kitaev §E.3, Fig. 20, p. 81. Gauge: Kitaev §E.6, p. 89. `Vec^ω_G`: EGNO Ex. 2.3.8, p. 28, Prop. 2.6.1, p. 33. Dual involution: EGNO Prop. 4.8.1, p. 76 (a field; the ring statement is this roadmap's own, say so). Pivotal, spherical: EGNO Def. 4.7.7, p. 74, Def. 4.7.14, p. 75. Give Kelly, Joyal–Street and Bonderson a theorem or section each, or drop them.

## R07 (P3) — No Checks, no per-target dependencies, and the README shape

**Location:** README lines 117–240: `FusionRules`, `FSymbols`, `RSymbols`, `FSymbols.Model`, `IsSplitSimpleBasis`, `s_a`, `Ρ^{abc}`, `D^{ab}_c` have no `**Checks.**`; no layer has `### Examples` or `### Dependencies`; no target has `*Needs:*`.

**Claim:** Every definition has at least three discriminating Checks and every layer its dependencies.

**Witness:** 0 Checks in the README. The numerical checks against Rep(A4) and Rep(D(S3)) are named only in the pull request description.

**Repair:** Add Checks with computed values, for instance: (i) `ι = ℤ/2`, `F^{111}_1 = −1`: `s_1 = −1`, `Ρ^{110} = Ρ^{101} = Ρ^{011} = 1`, `D^{11}_0 = 1`, `t_1 = ±1`, `leftDim = rightDim = −t_1`, both spherical. (ii) `D^{aā}_u = 1` always, so `t_a t_ā = 1`. (iii) Fibonacci `s_τ = φ⁻¹`, Yang–Lee `s_τ = −φ`, and `s_τ` is gauge invariant when `τ̄ = τ`. (iv) under `φ^{āa→u} ↦ x_a φ`, `φ^{aā→u} ↦ y_a φ`: `s_a ↦ (x_a/y_a) s_a` and `D^{ab}_c ↦ (x_c y_a y_b)/(x_a x_b y_c) · D^{ab}_c`. (v) R02's zero-ring control. Replace `## Ordering` by a `### Dependencies` list in each layer with a `*Needs:*` line per target (Layer 6 needs Layer 3's `Aut` computation and Layer 5; Layer 4's converse needs Layer 2), and use the headings `## Scope and ownership`, `## Conventions`, `## Exact supplier contracts`, `## How to read the build`, `## Layer k: …`, `## Downstream consumers`.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
| --- | --- | --- | --- | --- |
| Composite rule `M(s₁≫s₂) = M(s₁)M(s₂)` (l. 57) | substitute the definition twice | `src = M(s₁)(s₁≫mid) = M(s₁)M(s₂)(s₁≫s₂≫tgt)` | holds | none |
| Pentagon (l. 62–67) | index types of each factor against Mathlib `pentagon` | LHS: `α_{p,C,D}` then `α_{A,B,r}`, sum over `l : N_{pr}^E`; RHS: `F^{ABC}_q`, `F^{AtD}_E`, `F^{BCD}_s`, sum over `t,x,y,z` | types and order agree | none |
| Hexagons (l. 73–76) | each factor against `hexagon_forward`, `hexagon_reverse` at the pin | forward: rows `Left a b c d`, `Left b c a d`, `Left b a c d`; reverse: `Right a b c d`, `Right c a b d`, `Right a c b d` | agree | none |
| Triangle only (l. 68–69) with `F^{ubc} = F^{abu} = 1` (l. 142) | `L_j = (λ_b ▷ c) ≫ φ_j`, `R_j = λ_{b⊗c} ≫ φ_j` | `L_j = α ≫ R_j` by the derived triangle (EGNO Prop. 2.2.4) | `F = 1` | locator (R06) |
| `α.inv`, `β.inv` entries (l. 137, 207) | `Mat R`: `f ≫ g = f * g`, basis maps as indicator columns | `α.hom · Fᵀ = 1`, so `α.inv[y,x] = F[x,y]`; `β.inv[j,i] = R[i,j]` | matches the README | none |
| Gauge action (l. 79–83) | `L' = G_L L`, `R' = G_R R` | `F' = G_L F G_R⁻¹`; `∂η`: `G_L = G_R = η_aη_bη_c/η_d`, so `F' = F`, `R' = R` | holds; `∂η ∈ Stab P` | none |
| `s_a = F̄^{aāa}_a[u,u] = F^{āaā}_ā[u,u]` (l. 85) | both zigzags; non-reduced `R` | zigzags give `s`, `t`; `s·(η'≫ε₂) = (η'⊗η')≫(a◁ε▷ā)≫ε₂ = t·(η'≫ε₂)`, and `η'≫ε₂ = 1` | `s = t` over any commutative `R` | none |
| Criterion `ExactPairing` iff `s_a` unit (l. 219) | `ε' = xε`, `η' = yψ` | zigzag scalar `x y s_a = 1` | iff holds | none |
| `Ρ^{abc}` (l. 88–92) | derive from `η_ā = s_ā⁻¹ψ^{āa}`, `ε_c̄ = φ^{cc̄→u}` | `Σ_k F̄^{āab}_b[(c,i,k),(u,0,0)] F̄^{ācc̄}_ā[(u,0,0),(b,k,m)]`, rows `Right`, columns `Left` | matches | none |
| `D^{ab}_c` (l. 93) | `(a,ā,u)`; semion; rescaling `x_a, y_a` | `D^{aā}_u = 1`; semion `D^{11}_0 = 1`; both sides scale by `(x_c y_a y_b)/(x_a x_b y_c)` | consistent | Checks (R07) |
| Dimensions (l. 236) against `leftTrace`, `rightTrace` at the pin | `Pivotal/Trace.lean:87–102` | `leftDim = s_ā⁻¹ t_a⁻¹`, `rightDim = s_a⁻¹ t_a`; `rightDim(ā) = leftDim(a)` with `t_a t_ā = 1` | matches | none |
| Spherical iff `t_a² = s_a/s_ā` (l. 238) | `SphericalCategory` at `Pivotal/Spherical.lean:69` | `(t_a s_ā)⁻¹ = t_a s_a⁻¹ ⟺ t_a² = s_a/s_ā`; traces additive over simples | holds | none |
| Pivotal bijection (l. 231) | `PivotalCategory` takes `[RigidCategory C]` as a parameter (`Pivotal/Basic.lean:76`) | naturality on `φ_i`: `t_c φ = t_a t_b D φ`; `(u,u,u)` gives `t_u = 1` | holds for the fixed duals | none |
| Classification (l. 183) | `R = 0`; `R = k×k`; Fibonacci and Yang–Lee | `R = 0`: fails (R02). `k×k`: `rank End = Σ n_a² = 1` forces a simple. `s_τ`: `φ⁻¹` against `−φ` | needs nontrivial `R` | R02 |
| `SplitK0 (Model P)` (l. 144) | `R = 0`; nontrivial `R` | `0` against `ℤ^ι`; nontrivial: iso classes are `ι → ℕ` by invariant basis number | needs nontrivial `R` | R02 |
| `N` associative, `N_{ab}^c = N_{ba}^c` (l. 126–128) | `R = 0`; nontrivial `R` | invertible `Left × Right` matrix gives equal cardinalities | holds as hypothesised | none |
| Rigid converse (l. 224) | dual of `S_a` over nontrivial `R` | `End(S_aᘁ) ≅ R` gives one `ā`; `rank Hom(āa,u) = rank Hom(aā,u) = 1` by the perfect pairing | holds | none |
| Abelian comparison (l. 167–175) | `ℤ`; a field | `2 : simple u ⟶ simple u` mono, epi, not iso; over `k` a mono into `S_a` is zero or iso | holds | none |
| `Vec^ω_G` (l. 199–202) | `F = ω⁻¹` in the pentagon; triangle | `ω(ab,c,d)ω(a,b,cd) = ω(a,b,c)ω(a,bc,d)ω(b,c,d)`, as `IsThreeCocycle`; `ω(a,1,c) = 1` needed, supplied by `ThreeCocycle` | consistent with PivotalSpherical Layer 8 | R03 |
| Duals of biproducts (l. 216) | pinned Tau Ceti | `TauCeti.ExactPairing.biproduct` | already in the library | R05 |

- Source locators checked against the text: 0 in the README; 9 candidate locators opened in EGNO2015 and Kitaev2006 (R06).
- Library declarations opened at the pins: 24; absent: `ExactPairing.tensorOf`, `TauCeti.VecTwisted`, `TauCeti.TwistedGradedObject`, `homDual`, `sum_sum_homDual_comp_eq_id`. Present: `MonoidalCategory.ofTensorHom` (`Monoidal/Category.lean:227`), `Monoidal.induced`, `Monoidal.transport`, `BraidedCategory.ofFaithful`, `Equivalence.IsMonoidal`, `HomOrthogonal.matrixDecomposition`, `rigidCategoryOfEquivalence`, `IsFiniteSemisimpleCategory`, `fusionCoeff`, `SplitK0` with `instRing`, `PivotalCategory`, `leftDim`, `rightDim`, `SphericalCategory`, `sphericalCategory_iff_leftDim_eq_rightDim`, `PivotalCategory.instTorsor`.
- Cross-roadmap citations resolved: PivotalSpherical on main (Layer 8, no bundled fusion class at README lines 101 and 389) and at the head of #2311.
- Dependency check: `depcheck: 244 roadmaps, 2197 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Gate: fails, `missing-files=1` (R01). Elaboration, `#check` comparison and the one-tactic probe: not run, there is no Lean file.
- No change outside the roadmap folder.
- Overlap check: read PivotalSpherical (main and #2311), CategoricalOperatorAlgebras, TemperleyLieb; dual bases for split simple families are shared with PivotalSpherical #2311 (R04); `Vec^ω_G` is PivotalSpherical Layer 8 and cited; F-symbols, R-symbols and the gauge action have no other owner.
- Source independence: 6 passages compared with 2 sources (EGNO2015, Kitaev2006), none shared; largest share: none, 0 of 0 locators; contents compared with EGNO2015 Chapters 2, 4, 8 and Kitaev2006 §§E.1–E.7: independent. Bonderson2007, Kelly1964 and JoyalStreet1993 were not read.

## Not verifiable

- Bonderson2007: the Caltech thesis repository timed out; not read.
- Kelly1964 and JoyalStreet1993: the DOIs resolve to a paywalled publisher page; not read.
- The description's numerical checks against Rep(A4) and Rep(D(S3)): the computations are not in the pull request.

## Source issues

- none

## For the human reviewers

- **Licence.** EGNO2015 was read from the first author's page; each page states that it is the author's final version made available with the publisher's permission and that restrictions may apply to redistribution.
- **Not tested.** The README has no source locator, so no source has a share; wording and arrangement were compared with EGNO2015 and Kitaev2006 only.
