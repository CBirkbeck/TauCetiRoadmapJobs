# FIX-DESIGN-GaloisActionOnEtaleCohomology~4

This round repairs the findings of `REV-DESIGN-GaloisActionOnEtaleCohomology~3`: three findings, one P1 and two P2. I checked all three against the sources, the pins and the suppliers, and all three are right. Files edited: `packages/GaloisActionOnEtaleCohomology/design/README.md` and `packages/GaloisActionOnEtaleCohomology/design/plan.json`. `sources.toml` is unchanged: the one new locator, stacks03N1 line 3745 (proof of Theorem 53.1, Tag 03Q9), is in a work and tag the manifest already records, and that work is already cited for 0.3. A design package has no `Suggested.lean`. So no Lean statement changed and no `#check` pass was run.

## REV-DESIGN-GaloisActionOnEtaleCohomology~3/R01 (P2) — applied

Verified: stacks03N1 lines 3745–3746 use the opposite category, with affine neighbourhoods initial. §0.3 changes from "cofinal, equivalent to the poset" to: initial in `N(ξ_C)`, equivalent to `P^op`, with stalk `colim_{L∈P}`. A `ℚ_3(√3)` direction Check is added (Hom counts 1/0 against 0/1). Also updated: the §§2.3 and 2.4 routes, the §1.5 contract and plan 0.3.

## REV-DESIGN-GaloisActionOnEtaleCohomology~3/R02 (P2) — applied

Verified: the pinned `TauCeti.ContinuousRep` (line 82; `toContRepresentation` at line 150) asks only for joint continuity. §3.2 changes from "finite free ⇒ ContinuousRep" to a `TauCeti.ContinuousRep G_K ℤ_ℓ H` on all of `H`, torsion included, with §F.4.0 as its finite projective subcategory. A `ℤ_ℓ/ℓ` Check is added. §3.3, §4.3(c), the Enriques Check, the contracts and plan 3.2–4.3 are updated to match.

## REV-DESIGN-GaloisActionOnEtaleCohomology~3/R03 (P1) — applied

Verified: `0 → ℤ/ℓ(j) → ℤ/ℓ^{n+1}(j) → ℤ/ℓ^n(j) → 0` and `H^{N+1}(ℤ/ℓ(j)) = 0` make the `H^N` transitions surjective. §4.3(d) changes from "`H^q_cont = 0` for `q > N+1`, and for `N+1` if `H^N` is finite" to "for all `q > N`", with no finiteness hypothesis, via the pinned `ModuleTower` lemmas. `milnor_top` is replaced by the char-2 disc and point Checks.

## Pattern repairs beyond the cited lines

- **R01 pattern** (neighbourhood colimits written over `N(ξ)` with no direction):
  - §2.3 route: "neighbourhoods … are cofinal (§0.3)" → initial subcategory `≃ P^op`, with the colimit over `P` and pullback transition maps.
  - §2.4 route: "colimit over étale neighbourhoods `Spec L`" → over the opposite category, with the same initial subcategory.
  - ClassicalAdicEtaleCohomology §1.5 contract: the stalk formula is now written `colim_{N(ξ)^op}`, with the note that the supplier writes `colim_{N(ξ)}` for its cofiltered `N(ξ)`.
  - §2.1 was already correct and is unchanged: its index set is ordered by inclusion and `X` is the final object of the system.
- **R02 pattern** (`ContinuousRep` described as needing finite projectivity):
  - Scope list: §F.4.0 is now "continuous representations on finite projective modules and their stable lattices".
  - EtaleCohomologyFoundations §F.4.0 and ArithmeticGaloisRepresentations §1.1 contracts now name the pinned carrier.
  - New Tau Ceti contract bullets cover `TauCeti.ContinuousRep` and `TauCeti.ContinuousRep.toContRepresentation`.
  - Updated `*Needs:*` lines: §§3.2, 3.3, 4.3. Updated dependency lines: Layers 3 and 4.
  - The hypothesis on `A` in §3.3 now says "that is, a `TauCeti.ContinuousRep G_K ℤ_ℓ A`".
  - In the plan, the `what` of the EtaleCohomologyFoundations supplier now reads "finite projective ContinuousRep (carrier: Tau Ceti TauCeti.ContinuousRep)".
- **R03 pattern** (vanishing of `lim¹` credited to finiteness when surjectivity already forces it): §3.1 says the naive and continuous groups agree when the tower is Mittag–Leffler, "in particular when its terms are finite". That sentence is true and is unchanged. §4.4's "vanishing for `i > 2d`" now also covers `H_cont`, with no further edit. The ×ℓ tower Check in §3.1 is kept as the illustration that an arbitrary tower can fail to be Mittag–Leffler, and the new §4.3 Check says why such a tower is never the degree-`N` tower under (d).

## Checks run

Dependency gate, after all edits:

    candidate: GaloisActionOnEtaleCohomology is not in the merge order yet; checked as if placed after PadicDifferentialEquationsAndRigidCohomology (the intake inserts it when its design is accepted)
    depcheck: 229 roadmaps, 2062 edges, 0 problem(s)

There is no UPWARD and no CYCLE line.

Other checks:

- `roadmaps resolve` on the edited README found no cross-roadmap citations and no Lean names anywhere unresolved. The tool did not check Lean names outside TauCetiRoadmap, so I grepped them at the pin:
  - `TauCeti.ContinuousRep` is `namespace TauCeti` line 78, structure at line 82.
  - `TauCeti.ContinuousRep.toContRepresentation` is inside `namespace ContinuousRep`, line 89 → def at line 150.
  - `TauCeti.ModuleTower.isMittagLeffler_of_surjective` and `TauCeti.ModuleTower.subsingleton_limOne_of_isMittagLeffler` are inside `namespace TauCeti.ModuleTower`, lines 56–58 → lines 104 and 191.
- `plan.json` parses as JSON. It has 81 tests: 79, plus `direction` and `torsion_carrier`, with `milnor_top` replaced by `top_degree_surjective`.
- `sources.toml` parses as TOML.
- The README has no LaTeX delimiters and no machine path.
- No gate failures were listed for this round.
- No source was fetched and no `needs-references.toml` was written. Every text I used is cached (stacks03N1) or a pinned file.

Ownership: no new object was introduced. R01 corrects an existing statement. R02 and R03 replace planned wording with pinned Tau Ceti declarations, which are cited and not restated. The supplier texts I re-read for this round are on main, or at the open heads the tool indexes:

- EtaleCohomologyFoundations §F.4.0 (main, README line 854: the carrier "for … a finite projective `A`-module").
- ArithmeticGaloisRepresentations §1.1 (open head: it identifies its carrier with `TauCeti.ContinuousRep` "stated for any topological module").
- DerivedModuleAlgebra (main, lines 38 and 66–69: §1.T.1 resolves to the Tau Ceti tower declarations).
- ClassicalAdicEtaleCohomology §1.5 (open head: stalk formula over the cofiltered `N(ξ)`).

The overlap report lists no other open pull request that changes this roadmap, no dropped id and no id defined only by an open revision.

## Adversarial pass on the changed statements

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| §0.3 connected nbhds `≃ P^op`, initial in `N(ξ_C)` | `K = ℚ_3`, `L = K(√3)`; `K = C`; `V = Spa K ⊔ Spa K`; `L₁, L₂` two finite separable | `#Hom_N(L→K) = 1`, `#Hom_N(K→L) = 0`; `#Hom_P(K,L) = 1`, `#Hom_P(L,K) = 0`, so the match is with `P^op`. `K = C`: `P = {C}` and the stalk is `F(Spa C)`. Disconnected `V` receives a map from the first component. `L₁L₂` is finite separable and maps to both. | holds with `P^op`; `P` is refuted (`N` has a terminal object, `P` has no largest element for `ℚ_3`) | R01 |
| §0.3 stalk `= colim_{L∈P} F(Spa L)` | `F = μ_4`, `K = ℚ_3`; wrong indexing `P^op` | `colim_P μ_4(L) = μ_4(K^sep) = {±1, ±i}` (4 elements). Over `P^op`, which has terminal object `K`, the value would be `μ_4(ℚ_3) = {±1}` (`−1` is not a square mod 3), 2 elements | the inclusion-filtered colimit is right | R01 |
| §2.3 route `(R^i f_*M)_ξ = colim_{L∈P} H^i(X_L, M_L)` | `X = Spa(ℚ_2(2^{1/3}))` over `ℚ_2`, `M = ℤ`, `i = 0` | `H⁰(X_L, ℤ) = ℤ^{Hom(L₀, L)}`, with colimit `ℤ^{Hom(L₀, K^sep)}` of rank 3, the same as §1.2 (rank 3, transposition trace 1) | consistent | R01 pattern |
| §2.4 route over the opposite neighbourhood category | `k = ℝ`, `X = Spec ℂ`, `μ_4` | `P = {ℝ ⊆ ℂ}`, colim `= H⁰(Spec(ℂ⊗_ℝℂ), μ_4) = μ_4(ℂ)²`, which is the §2.4 Check | consistent | R01 pattern |
| §3.2 `TauCeti.ContinuousRep G_K ℤ_ℓ H` on all of `H` | `ℤ_ℓ/ℓ`, discrete, trivial action; `X = ∅`; `X = Spa K`, `j = 1`; non-qc `⊔ Spa(K(μ_{ℓ^m}))`; discrete `ℚ_ℓ` | `(σ,x) ↦ x` is continuous and `ℓ·1 = 0`, so the structure is accepted and the module is not projective. `H = 0` is accepted. `χ_ℓ` on `ℤ_ℓ(1)` is finite free, so it is in the subcategory. Non-qc: the stabiliser `G_{K(μ_{ℓ^∞})}` is not open, so joint continuity fails (qcqs is used). Discrete `ℚ_ℓ`: the orbit map `ℤ_ℓ^× → ℚ_ℓ` is not continuous | holds; `toContRepresentation` needs `Ring ℤ_ℓ` and `IsTopologicalAddGroup H`, and both hold | R02 |
| §3.3 `V` is a `TauCeti.ContinuousRep G_K ℚ_ℓ V` for every `A` | `A = ℚ_ℓ` indiscrete; `A = ℤ_ℓ/ℓ`; `A = ℤ_ℓ(1)`; `A = ℤ_ℓ ⊕ ℤ/ℓ` | Indiscrete `V`: every map into it is continuous, so the structure is accepted (no Hausdorff field). `V = 0`. `ℚ_ℓ(1)`, `ℓ`-adic, character `χ_ℓ`. `V = ℚ_ℓ`, finite-dimensional | holds; Hausdorffness is not claimed | R02 |
| §4.3(c) torsion quotient and rationalisation | Enriques, `ℓ = 2`; `X = Spa K`; all-torsion `H = ℤ/ℓ²` | `H = ℤ_2^{10} ⊕ ℤ/2`, `H_tors = ℤ/2`, `H/H_tors = ℤ_2^{10}`, `dim H²(ℚ_2) = 10`. `H_tors = 0`. `H/H_tors = 0` and `V = 0`. `id × q` is an open surjection, so the quotient action is continuous. The quotient topology and the `ℓ`-adic topology are both compact Hausdorff, and `ℓ^n(H/T)` is open, so they are equal | holds | R02 |
| §4.3(d) `H^q_cont = 0` for all `q > N` | `X = Spa K`, `N = 0`; char 2 closed disc, `N = 1`; `ℙ¹_K`, `N = 2`; `X = ∅`; `n = 1` | Point: `ℤ/ℓ^{n+1}(j) → ℤ/ℓ^n(j)` is onto, so `H¹_cont = 0`. Disc: `H^{≥2}(𝔽_2) = 0`; `H¹` is infinite (`a_{2^k(2m+1)} = c_m`, so `c_m = 0`); the transitions are onto, so `H²_cont = 0`. `ℙ¹`: `H²(ℤ/ℓ^n(j)) = ℤ/ℓ^n(j−1)`, reductions are onto, so `H³_cont = 0`. Empty: everything is 0. `n = 1`: `0 → ℤ/ℓ → ℤ/ℓ² → ℤ/ℓ → 0`, with kernel of reduction `ℓℤ/ℓ²` | holds; the old "finite `H^N`" hypothesis is unnecessary | R03 |
| ×ℓ tower `ℤ ← ℤ ← ⋯` (wrong model for (d)) | transitions and `lim¹` | the image of each transition is `ℓℤ ≠ ℤ` and `lim¹ = ℤ_ℓ/ℤ ≠ 0`: not surjective, so it is never a degree-`N` tower under (d) | consistent with §3.1 | R03 |
| Contract: `TauCeti.ContinuousRep` hypotheses | the structure signature at the pin | `[Monoid Γ] [TopologicalSpace Γ] [Semiring A] [AddCommMonoid M] [Module A M] [TopologicalSpace M]`: no topology on `A` and no continuity of the multiplication of `Γ` | the wording "topological monoid" was corrected to "monoid with a topology" | R02 |
| Contract: `ModuleTower` Mittag–Leffler lemmas | signatures at the pin | `[Ring R]`, `F : ModuleTower R = ℕᵒᵖ ⥤ ModuleCat R`, hypothesis `∀ n, Surjective (F.transition n)` → `F.IsMittagLeffler` → `Subsingleton F.limOne` | they apply to towers of `ℤ_ℓ`-modules | R03 |

## For the maintainer

- No section, target id or target name of this roadmap changed, apart from plan api and test names inside target 0.3 (`connected_cofinal` → `connected_initial`) and target 4.3 (`milnor_top` → `top_degree_surjective`). No other roadmap cites those names.
- No supplier edge was added. The new citations are pinned Tau Ceti declarations, and the roadmaps named were already suppliers. The gap `proper-rigid-finiteness` is unchanged.
- EtaleCohomologyFoundations §F.4.0 on main still describes its `ContinuousRep` as built on finite projective modules, while the pinned `TauCeti.ContinuousRep` is general. This roadmap now cites the pin for the carrier and §F.4.0 only for the finite projective case. A revision of EtaleCohomologyFoundations that aligns its wording with the pin would be outside this package.
- The `open_disc` Check of §4.3 (unchanged) uses the open unit disc, which is not quasi-compact, so it lies outside §4.3's standing qcqs hypothesis. What it says, that hypothesis (a) fails, is true, and no finding raised it, so it is left as it is.
