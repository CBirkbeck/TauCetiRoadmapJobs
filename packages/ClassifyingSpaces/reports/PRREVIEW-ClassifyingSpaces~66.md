# Review of ClassifyingSpaces (pull request #1807 at 89357f3)

**Verdict:** needs changes

Previous review read (`3adc047`): accepted, no finding to re-check. The folder is byte-identical to the one at `8d8b243`.

## R01 (P2) — 2.3 claims a cohomological connecting map for a short exact sequence of representations

**Location.** `TauCetiRoadmap/ClassifyingSpaces/README.md:1109–1112`: "The isomorphisms are natural in `A` and carry the connecting maps of a short exact sequence of representations to `groupHomology.δ` and `groupCohomology.δ`, through the pinned …" (two homology lemmas); the same wording at lines 436–438.

**Claim.** For cohomology the clause has no object: `Homₖ(−, N)` is not exact, so a short exact sequence in `A` gives neither a `groupCohomology.δ` nor a long exact sequence of `Hⁿ(X; L_A, N)`. The pin's cohomological statement is a Bockstein in `N` with `A` projective over `k`, and no cohomology lemma is named.

**Witness.** `k = ℤ`, `G = 1`, `X` a point, `N = ℤ`, `0 → ℤ →(2) ℤ → ℤ/2 → 0`: `H⁰` gives `0 → ℤ →(2) ℤ` with cokernel `ℤ/2`, while `H¹(X; L_{ℤ/2}, ℤ) = 0`. Pin: `TauCeti/AlgebraicTopology/ClassifyingSpace/LocalCoefficients.lean` 331, `[Module.Projective k A]`.

**Repair.** Replace the bullet by: "The homology isomorphisms are natural in `A` and carry the connecting map of a short exact sequence of representations to `groupHomology.δ` (pinned `TauCeti.classifyingSpaceTwistedHomologyIsoGroupHomology_hom_naturality`, `TauCeti.twistedHomologyδ_comp_classifyingSpaceTwistedHomologyIsoGroupHomology_hom`). The cohomology isomorphisms are natural in `A` and in `N` (pinned `TauCeti.classifyingSpaceTwistedCohomologyIsoGroupCohomology_hom_naturality_left` and `…_naturality_right`); when the module of `A` is projective over `k`, they carry the Bockstein of a short exact sequence `0 → N₁ → N₂ → N₃ → 0` of `k`-modules to `groupCohomology.δ` of `0 → Homₖ(A, N₁) → Homₖ(A, N₂) → Homₖ(A, N₃) → 0` (pinned `TauCeti.twistedCohomologyBockstein_comp_classifyingSpaceTwistedCohomologyIsoGroupCohomology_hom`). No connecting map is claimed for a short exact sequence in `A`." Add the three cohomology names to the *Needs:* line of 2.3 and to *From Tau Ceti* (lines 432–438), and add the witness above as a negative-control Check of 2.3.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| 1.1 homotopy extension property of a point | `x` in an open `n`-cell, `n ≥ 1`; `{0} ∪ {1/m}`; `D²` with `x` on the boundary circle | `r = (1 − ‖z₀‖)/2` gives `‖z‖ ≤ (1 + ‖z₀‖)/2 < 1`; `c = 1` on `e ∖ U`, so the two open pieces agree; data match `NDRPair.ofHomotopyRel`'s five arguments; retraction forces `(1, 0) ↦ (0, 0)` | sound | none |
| 1.1 existence, vertex | `δ := δ₀ · λ⁻¹`; `e_* = ι_* ∘ ψ`, `g_* = φ ∘ ψ` | `e ∘ δ ≃ (e∘δ₀)(e∘δ₀)⁻¹τ = τ`; `e_* ∘ ℓ^δ = β_τ ∘ (e∘ℓ)_* = ι_*`, so `ψ ∘ ℓ^δ = id` and `g_* ∘ ℓ^δ = φ` | sound | none |
| 1.1 another base point | `S¹`, `v = 1`, `x = −1`, `α` upper half circle | `f_* = β_{f₀∘α} ∘ (f₀)_{*,x} = (f₀)_{*,v} ∘ β_α = φ`; trace of rotations by `π − πt` at `x`: angles `2π → π`, equal to `f₀ ∘ α` | sound | none |
| 1.1 universes | `Y : Type v`, pinned `exists_mapOfEq_cellularClassifyingSpace` (`S`, `Z` in one universe) | presentation of `ULift π₁` in `max u v`; `exists_comp_homotopic` has three independent universes | sound | none |
| 1.2 another base point | squares of `F`, `H` over `α` | `f'∘α ≃ τ_f⁻¹`; `f'_{*,v} = φ ∘ β_α⁻¹`; `H_x ≃ τ_f⁻¹ τ_g`; trace `τ_f τ_f⁻¹ τ_g τ_g⁻¹` null | sound | none |
| 1.2 Check `[0, 1]`, `x = 1/2` | `(s, t) ↦ f((1 − s)t + s/2)` | `s = 0`: `f`; `s = 1`: `f(1/2) = y`; `t = 1/2`: constant `1/2` | Check correct | none |
| 1.3 pointed uniqueness | pinned `IsAspherical.exists_homotopyEquiv` (one universe, base point changed); Warsaw circle | route uses 1.1, `isWeakHomotopyEquivalence_iff`, `homotopyEquiv` (independent universes, `CWType` both sides) | sound | none |
| 2.1 degree one | loop `γ` at `b₀`, `g = FGME γ`; `(g, g⁻¹)`, `(1, 1)` | lift ends at `g⁻¹ • e₀`; boundary `g⁻¹e₀ − e₀ = d[g⁻¹]`; class `↦ [g⁻¹]`; `[g⁻¹] − [1] + [g]` and `[1]` are boundaries, so `[g⁻¹] = −[g]`; pinned Hurewicz form gives `[g]` | sign claim correct | none |
| 2.1 Checks | circle; `ℤ/m`, degrees 1, 2 | ccw loop `↦ −1`; `ℤ ←0— ℤ ←m— ℤ ←0— ℤ`: `H₁ = ℤ/m`, `H₂ = 0` | agree | none |
| 2.2 Checks | circle, `M = ℤ`; `ℤ/2` with `0 → ℤ/2 → ℤ/4 → ℤ/2 → 0` | `[1] ↦` path `(0,0) → (0,1)`, a loop with `FGME = −1`, value `−1`; pairing with 2.1: `(−1)(−1) = 1`; Bockstein injective between groups of order 2 | agree with 2.1 | none |
| 2.3 route, steps 1–4 | class of `a ⊗ (g • e₀)`, loop `γ` | `↦ m(γ)⁻¹ g⁻¹ • a = FGME(γ) • (g⁻¹ • a)`; `G = ℤ`: `(0, −1) ↦ −(−1) = 1`, monodromy `u` | sound | none |
| 2.3 connecting maps (R01) | `k = ℤ`, `G = 1`, `N = ℤ`, `0 → ℤ → ℤ → ℤ/2 → 0` | `Hom(−, ℤ)`: `0 → 0 → ℤ →(2) ℤ`, cokernel `ℤ/2`; `H¹ = 0` | cohomology clause fails | R01 |
| 2.3 Checks | `ℤ/2` sign module; `S² ∨ S¹`; `u = diag(1, −1)` | `H₀ = ℤ/2`, `H₁ = 0`, `H₂ = ℤ/2`; `H₂ = ℤ ≠ 0`; `(−b, a) ≠ (b, −a)` when `2 ≠ 0` | correct | none |
| Headline `exists_continuousMap_mapOfEq_eq_of_isAspherical` | binders; `Y = S²` | `[T2Space X] [CWComplex univ] [PathConnectedSpace X]`, `x` arbitrary, `Y : Type v`, `IsAspherical Y y`; equals 1.1 + 1.2 | matches README | none |
| Headline `exists_homotopyEquiv_of_isAspherical` | binders | both spaces T2 and CW, two universes, `F.toFun x = y`; equals 1.3 | matches README | none |
| Headlines `nonempty_twisted(Co)homology_iso_group(Co)homology` | binders; pinned carriers | one universe `u`; `Rep.{u,u,u}`; `ofRepresentation x (A.ρ.comp Ψ)`; `ihom A` of `Rep.trivial k G N`, as pinned iso for Milnor's model | match 2.3 | none |
| Stage/item map | citations in FreeGroupsAndLimitGroups (lines 29, 40, 2413, 2554, 2771), FinitenessAndDualityOfGroups (Stage 2 item 10, 3 item 12, 4 item 16) | each resolves to a line of the map; the dropped Stage 2 heading is named in it | complete | none |

- Source locators: 9 checked against `hatcher-at` (lines 818, 3800, 3897, 3905, 3928–3950, 6472–6480, 14349–14373, 15549, 22629; printed pages 15, 87, 90, 90, 91, 148, 328–329, 357, 522): all agree.
- Library names: 226 backticked names elaborated with `#check` at the pins, 0 unknown (two unqualified prose abbreviations of pinned names excepted); 14 declarations opened and read, among them `Homotopy/Extension/NDRPair.lean`, `Extension/Prod.lean` 72, `Extension/Basic.lean` 97 and 235, `Singular/ModuleChains/GroupHomology.lean` 228–249, `ClassifyingSpace/LocalCoefficients.lean` 136–345, `ClassifyingSpace/Torus.lean` 172, `ClassifyingSpace/WedgeCircles.lean` 227.
- Duplication: no pinned statement of the four headlines, of the homotopy extension property of a point of a CW complex, or of a transport of `ofRepresentation` along an isomorphism of representations; `roadmaps grep` finds no other owner at the open heads or on main.
- Cross-roadmap citations resolved: AlgebraicTopology 8.8, 8.8a, 8.8b, 8.14 and its *From TauCetiRoadmap.ClassifyingSpaces* contract (same hypotheses: arbitrary base point, independent universes); CharacteristicClasses C1.1b, C1.5a.
- Gate at `89357f3`: every check passes. Dependency check: `depcheck: 245 roadmaps, 2243 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line. No change outside the pull request's declared folders.
- Elaboration: `Suggested.lean` exits 0 with four `sorry` warnings only (lines 84, 102, 123, 138). One-tactic probe (`simp`, `infer_instance`, `rfl`, `exact?`) closes none of the four. Elaborated signatures compared with 1.1–1.3 and 2.3: no binder lost.
- Pull request text for this folder (summary clause, "drops 26 named declarations, adds three headlines", "Stages 1–4 become Layers 1–2, with an item map"): agrees with the head.
- Overlaps: no cited id dropped or defined only by an open revision; the dropped Stage 2 heading is mapped; #1808 is ordered after this pull request in the merge-order block.

Overlap check: read AlgebraicTopology (this pull request's head), FinitenessAndDualityOfGroups, UniversalCovers, StableHomotopyKTheory; the nerve model and its comparison are AlgebraicTopology's (8.8a, 8.8b), the pointed classification of maps into an aspherical space is this roadmap's (1.1, 1.2), covering-space theory is UniversalCovers'; nothing has two owners.

Source independence: 8 passages compared with 1 source (`hatcher-at`), none shared beyond a six-word forced formula; largest share `hatcher-at`, 10 of 14 locators; contents compared with `hatcher-at`: independent (Layer 1 uses two statements of its Section 1.B in the order the *Needs:* lines of 1.3 force; Layer 2 draws on Sections 2.2 and 3.H); `segal-1968` not opened this round, the three uncertified texts not read.

## Not verifiable

- Brown, Chapter III, Section 1; Milnor 1956; Schwamberger–Vogt 2009, §2: settled as uncertified, cited by locator only.
- The orientation of Mathlib's `Circle.fundamentalGroupMulEquiv` (counterclockwise loop to `1`), on which the `ℤ` Checks rely: not recomputed.
- The Conventions Check on the degree `1 → 0` boundary of `TauCeti.cellularClassifyingSpaceResolution`: the pin states no formula for that boundary; the end point of the lift was recomputed, the cell's orientation was not.
- The description's sentence that the check reads this roadmap's `TauCeti/AlgebraicTopology/` paths as citations: the dependency check prints no per-roadmap loops.
- Ownership against open pull requests: checked through the worker's index only.

## Source issues

- none

## For the human reviewers

- none
