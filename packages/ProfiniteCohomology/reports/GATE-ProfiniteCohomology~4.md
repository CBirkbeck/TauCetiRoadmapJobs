# GATE-ProfiniteCohomology~4: answers to the human review of `93f8a71`

Commit `cd875d05` on the pull request branch (not pushed), on top of `7dc3a79e`. Points numbered in
reading order: the review of 2026-10-30 carries F01–F05 (H01–H05); the comment of 2026-11-06 is
H06.

## H01 (CBirkbeck) — applied

Route 1 is applied: `Suggested.lean` again declares the 54 names that the four importing files on main use in code, with no `sorry`'d data. Each is a real-bodied alias of the pinned Tau Ceti or Mathlib declaration, except three short definitions (`degreeCast`, `cup`, `galoisConj`), the `D₁₆` section (`WreathC2.sectionTable`, `wreathSection`) and two theorems that Tau Ceti `358314d` lacks, stated with `sorry`: `abelianizationProPClass_generates` and `galoisEvens_galoisRes`, both Tau Ceti theorems with the same conclusions at `2fd255d` (table at the end). The targeted build passes, and so do the six other modules that import this one transitively; README `## Downstream consumers` (`README.md:3598`–`3642`), the overview (`:37`–`42`) and the Portfolio export contract (`:112`–`115`) list and describe these names.

---

## Pins

The worktree's `lake-manifest.json` pins Tau Ceti `358314d` (Lean `v4.35.0-rc3`). Main and the content checkout pin `2fd255d` (Lean `v4.36.0-rc2`, main's commit `a891cd19`), and this brief names `2fd255d` as the pin. The README is checked against `2fd255d`. `Suggested.lean` uses 47 Tau Ceti declarations; each exists at both pins with the same header (compared declaration by declaration; the only textual difference is a `noncomputable` keyword on `TauCeti.kummerMapCanonical` at `358314d`). The targeted build runs at `358314d`.

At `2fd255d` Tau Ceti proves NSW (3.6.4) (`TauCeti.subsingleton_h1_abelianizationProP` and `TauCeti.abelianizationProPClass_generates`, `ClassModule/Sylow.lean:148`, `:156`). It also proves its whole route: transfer, inflation, the cyclic, `p`-group and Sylow steps, and both halves of (3.3.11). So 11.8 cites them as Tau Ceti's. At `358314d` the final Sylow step is absent, so the README's citation relies on the branch taking main's pin, which it does at merge; `Suggested.lean` itself builds at `358314d` (see Build) and every Tau Ceti declaration it names has the same header at both pins.

These 24 backticked names in the README exist only at `2fd255d`:
- the class module: `TauCeti.subsingleton_h1_abelianizationProP`, `TauCeti.abelianizationProPClass_generates`, `…_of_isPGroup` (two), `TauCeti.abelianizationProPRes{1,2}_injective`, `TauCeti.abelianizationProP_pow_bijective`, `TauCeti.subsingleton_h1_map_abelianizationProP`, `TauCeti.explicitRes2_abelianizationProPClass_generates`, `TauCeti.ContCohomology.DiscreteShortExact.delta_conjNormalMap`;
- the Evens norm and its Galois transport: `TauCeti.galoisRes_galoisEvens`, `TauCeti.galoisEvens_add`, `TauCeti.galoisEvens_galoisRes`, `TauCeti.galoisEvens_embedding_independent`, and the three transported identities `TauCeti.ContCohomology.{trivialF2ResMap_evensNormIndexTwo, evensNormIndexTwo_polarization, evensNormIndexTwo_trivialF2ResMap}`;
- coinduction: `TauCeti.coindFunctor_preserves{Mono,Epi}morphisms`;
- names renamed at that pin: `OpenSubgroup.indexTwoDelta_eq_cup_character`, `OpenSubgroup.exact_cup_res_of_index_two`, `Subgroup.quotientOpenSubgroup`, `Subgroup.quotientSubgroupOfEquivMap`.

The worker's resolver flagged two of the renames; the other two (`TauCeti.quotientOpenSubgroup` and `TauCeti.quotientSubgroupOfEquivMap` at `358314d`) turned up in an exhaustive check of every backticked dotted name against the `2fd255d` sources. At `2fd255d` every backticked Tau Ceti name in the README resolves.

## Other repairs from the verification

- 13.1: the descent of the graph class to degree-one classes and the class-level `D₁₆` pullback are not targets. They are pinned at both pins: `TauCeti.ContCohomology.homClass` with `homClass_eq_cochainClass`, `homClass_inj`, `homClass_surjective` and `trivialF2Map_homClass`; `TauCeti.ContCohomology.evensNormIndexTwo` with `graphClass_representative_independent` and `evensNormIndexTwo_homClass`; and `TauCeti.ContCohomology.evensNormIndexTwo_eq_ind_pullback`. The bullets now cite them.
- 13.3: the Evens transport (`TauCeti.galoisEvens` and its five laws) is cited in place of "what remains to build"; its statements match the README's, read at `EvensNorm.lean:84`–`157`.
- 13.1: the two CupExact citations follow the renames above, and now say "in every degree" and "in every positive degree", as the generalised statements do.
- The overview (`:33`–`42`), `### Library scope and remaining targets`, the supplier-contract module list and the `Suggested.lean` docstring all drop the strict criterion, the class-module route and the Evens descent and transport from the remaining targets.

## Build

`lake build TauCetiRoadmap.ProfiniteCohomology.Suggested TauCetiRoadmap.ClassFieldTheory.Suggested TauCetiRoadmap.QuadraticFormInvariants.Suggested` at `cd875d05`: `Build completed successfully (10153 jobs).` The only messages for this module are the four expected `declaration uses 'sorry'` warnings, at `Suggested.lean:268` and `:276` (the two universe theorems), `:301` (`abelianizationProPClass_generates`) and `:560` (`galoisEvens_galoisRes`). `Completed.ProfiniteProPGroups.Suggested` and `Completed.LocalFieldsRamification.Suggested` build on the way.

The other modules that import this one transitively also build at `cd875d05`: `lake build Completed.LocalGaloisGroups.Suggested Completed.OrthogonalSpinGroups.Suggested TauCetiRoadmap.GlobalQuadraticForms.Suggested TauCetiRoadmap.IntegralLattices.Suggested TauCetiRoadmap.MassFormula.Suggested` gives `Build completed successfully (10301 jobs).`

One consumer proof constrained the typing. With the cup typed in `continuousCohomology (m + n) Z`, `ClassFieldTheory/Suggested.lean:1582` failed with "No goals to be solved": its `simp only [hid] at h` then also rewrites the degree-`1 + 1` side of `cup_coeffMap`, so `rw [← h]` closes the goal one step early. Main's file typed these declarations through a semireducible adapter, so `cup`, `cup_add_left`, `cup_coeffMap`, `degreeCast` and `coeffMap` now take values in `(TauCeti.ContinuousCohomology.continuousCohomologyFunctor R G n).obj X`, definitionally `continuousCohomology n X`; with that the file builds unchanged.

## Gate

`gate ProfiniteCohomology: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`

With `--build` the same line ends `build=0 OK`.

Declaring `TopPairing` made the gate read fifteen correct README citations of Tau Ceti's `TauCeti.TopPairing.*` theorems (Layer 12, `README.md:3122`–`3175`, and 13.3, `:3453`–`3455`) as names this roadmap claims. The `cup` docstring now lists them as the laws of the aliased cup. All fifteen exist at both pins. No README citation changed.

Dependency check (`gate --depcheck … --movable`):

```text
depcheck: 239 roadmaps, 2430 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line.

## Signature check

I put `#check @` for all 56 declarations of `Suggested.lean` into one scratch file and elaborated it once with `pp.universes` on.
- The two headline theorems are unchanged: `cohomologicalDimensionAt.{u_1, u_1} p G = cohomologicalDimensionAt.{0, u_1} p G`, and the same for `strictCohomologicalDimensionAt`.
- Each interface declaration has the explicit arguments, in the same order, that main's declaration of the same name had and the consumers pass (for example `abelianizationProPClass_generates (p) [Fact p.Prime] (G) … (hG : scd_p p G ≤ 2) (V) [V.Normal] (hV)`, and `galoisRes K L σ n`).
- Instance binders are those of the Tau Ceti counterparts, which is never more than main's. `trivialF2` now needs only `[Group G]`, where main's carried `[CompactSpace G] [TotallyDisconnectedSpace G]` from its section. `abelianizationProP` drops `[Fact p.Prime]`.
- The Galois aliases drop `[Algebra.IsSeparable K L]`. Tau Ceti's versions need only `[FiniteDimensional K L]`, and a `K`-embedding `σ : L → Kˢ` already forces `L/K` to be separable.
- `cd_p`/`scd_p` are `.{u}` on `G : Type u`, as README says.
- No binder that a README statement mentions is missing.

## Adversarial pass (statements this commit adds or changes)

| Statement | Instances | Values on each side | Result |
|---|---|---|---|
| `abelianizationProPClass_generates` (NSW (3.6.4)) | `ℤ_p ⊇ pℤ_p`, `p = 2, 3` | `H² = pℤ_p/p²ℤ_p`, order `p`; class `Σ_τ u(τ,1) = p`, a generator; `p^{v_p(p)} = p` | holds |
| | `V = G` | `H² = 0 = ⟨0⟩`; `p^{v_p(1)} = 1` | holds |
| | `ℤ_p × C_ℓ ⊇ ℤ_p`, `ℓ ≠ p` | `H²(C_ℓ, ℤ_p) = ℤ_p/ℓℤ_p = 0`; `p^{v_p(ℓ)} = 1` (`ℓ` would be wrong) | holds |
| | `C_p ⊇ 1` (control) | `H² = 0 ≠ p`; excluded, `scd_p C_p = ⊤` | hypothesis needed |
| `galoisEvens_galoisRes` | `C₂ × C₂ = ⟨a, b⟩ ⊇ U = ⟨a⟩`, `y = a*`, `χ = b*` | restrictions of `N(res a*)` to `⟨a⟩, ⟨b⟩, ⟨ab⟩`: `(α², 0, 0)` (`res_U N(x) = x·conj x = α²`, Mackey with `U ∩ V = 1` gives `0`); of `a*² + b*a*`: `(α², 0, w² + w²) = (α², 0, 0)`; restriction to the three `C₂` is injective on `H²` (matrix `[[1,0,1],[0,0,1],[0,1,1]]`, det `1`) | equal; the wrong models `y²` and `χ·y` give `(α², 0, w²)` and `(0, 0, w²)` |
| | `ℂ/ℝ` | `res y ∈ H¹(1) = 0`, `N(0) = 0`; `y ∈ {0, χ}`: `0` and `χ² + χ² = 0` | holds |
| `galoisRes_eq_zero_iff` | `ℂ/ℝ` | `H²(G_ℝ, 𝔽₂) = {0, χ²}`, `res` to `H²(1) = 0` kills all; `χ ⌣ H¹ = {0, χ²}` | both sides true for every `z` |
| `galoisConj` | `n = 0`, `[L:K] = 2` | `res = id`, `cor = ×2 = 0` on `𝔽₂`; `res cor y − y = −y = y` = trivial conjugation | holds |
| | `n = 0`, cyclic cubic `L/K` | `res ∘ cor = Σ_{G/U} g* = 3·id = id` on `𝔽₂`, so `res cor y − y = 0`, and the two non-identity cosets give `σ*y + σ²*y = 2y = 0` | consistent with the docstring (Galois `L/K`, normal `G_L`) |
| `galoisSubgroup_index` | `ℂ/ℝ`; `L = K` | `[C₂ : 1] = 2 = [ℂ:ℝ]`; `1 = 1` | holds |
| `WreathC2.sectionTable` | all 8 `(a, b, c)` | `(us)^i` = `(0,0,0), (1,0,1), (1,1,0), (0,1,1)`, `(us)^i s` = `(0,0,1), (1,0,0), (1,1,1), (0,1,0)` ↦ `r 0, r 1, r 2, r 3, sr 0, sr 7, sr 6, sr 5`; `r^i f = sr (−i)` | table correct |
| | wrong order `f^j r^i` | `(us)s ↦ f r = sr 1`, but `dihedralToWreath (sr 1) = s(us) = (0,1,0) ≠ (1,0,0)` | excluded by the section law |
| `wreathSection` | QuadraticFormInvariants' `wreathSection_eq_native` | equal to `TauCeti.wreathSection` on all 8 elements (`decide`, builds) | holds |
| `wreathD16Cocycle_isCocycle` | `g = 1` | `σ 1 = 1` so `c(1, h) = 0`; identity reads `c(h,j) = c(h,j)` | holds |
| `inhomogeneousCochain2_d_eq_zero` (hypothesis orientation) | `f(g,h) = χ(g)ψ(h)` | both sides `χ(g)ψ(j) + χ(h)ψ(j) + χ(g)ψ(h)` | the stated identity is `δf = 0` for the trivial action |
| `cochainClass_…_eq_of_coboundary` | `C₃`, `f' = 0`, `ψ = (0, 1, 0)` | `δψ(t,t) = 1 − 0 + 1 = 0`, `δψ(t,t²) = 0 − 0 + 1 = 1`, so `f ≠ 0`; classes both `0` (`H²(C₃, 𝔽₂) = 0`) | holds; coboundary `ψ h − ψ(gh) + ψ g` is `d¹ψ` |
| `degreeCast` | `h : 1 + 1 = 2`; `h : n = n` | identity on the same object (Eq.rec on a reflexive equation) | holds |
| `cup_add_left`, `cup_coeffMap` | `G = 1`, `ℤ` with multiplication, `m = n = 0`; `f = h = ×2`, `g = id` | `(a + a')b = ab + a'b`; `h(xy) = 2xy = (2x)y`, conclusion `2ab = (2a)b` | hold |
| `cd_p`, `scd_p` | `ℤ_p` | `1`, `2` (Tau Ceti values, as in r4) | consistent with 11.6 |

Every other interface declaration is an abbreviation of a pinned declaration, checked against its counterpart's header at both pins, and its truth is that declaration's.

## Ownership and citations

The restored names are this roadmap's own names, in its own namespace: on main they are declared in this file. `roadmaps grep 'namespace TauCetiRoadmap\.ProfiniteCohomology\b'` finds that namespace only in this roadmap (main, this pull request, and the Tau Ceti bump of #1187, which edits this file). ProfiniteCohomologyPartII uses `TauCetiRoadmap.ProfiniteCohomologyPartII`. No construction is added: every body is a Tau Ceti or Mathlib term, or one of the short definitions above. No cross-roadmap citation changed. No source was fetched, and nothing was added to `needs-references.toml`.

`overlaps.md` reports that #1187 (bump Tau Ceti to `ab00ba392`) conflicts with this pull request in `TauCetiRoadmap/ProfiniteCohomology/Suggested.lean`, among other files. Whichever of the two merges second is rebased on the other.

Untrusted text: nothing in the comments asked for an action outside this job.

## The consumer interface

| Name in `Suggested.lean` | Pinned declaration | Read by |
|---|---|---|
| `cd_p`, `scd_p` | `TauCeti.cohomologicalDimensionAt.{u}`, `TauCeti.strictCohomologicalDimensionAt.{u}` | ProfiniteProPGroups, ClassFieldTheory, LocalGaloisGroups |
| `abelianizationProP`, `abelianizationProPClass`, `H2` | `TauCeti.abelianizationProP`, `TauCeti.abelianizationProPClass`, `TauCeti.ContCohomology.H2` | LocalGaloisGroups (`H2` also QuadraticFormInvariants) |
| `abelianizationProPClass_generates` | `sorry`; `TauCeti.abelianizationProPClass_generates` at `2fd255d` | LocalGaloisGroups `:1914` |
| `TopRep`, `TopPairing`, `coeffMap`, `cup_coeffMap` | Mathlib `TopRep.{u}`, `TauCeti.TopPairing`, `TauCeti.ContinuousCohomology.coeffMap`, `TauCeti.TopPairing.cup_coeffMap` | ClassFieldTheory (`coeffMap` also QuadraticFormInvariants) |
| `cup`, `cup_add_left`, `degreeCast` | `TauCeti.TopPairing.cup` applied; `LinearMap.map_add₂`; `h ▸ x` | ClassFieldTheory, QuadraticFormInvariants |
| `Invariants`, `ofDiscreteModule`, `cochainClass` | `FixedPoints.addSubgroup`, `TauCeti.ofDiscreteModule ℤ G M`, `TopRep.cochainClass` | QuadraticFormInvariants |
| `Z2`, `H2pi`, `discreteH2Equiv`, `explicitH2IsoContinuousCohomology`, `explicitFiniteQuotientComparison2`, `explicitFiniteQuotientColimit2`, `homClass`, `inhomogeneousCochain2`, `inhomogeneousCochain2_d_eq_zero`, `cochainClass_inhomogeneousCochain2_eq_of_coboundary`, `indexTwoInd`, `continuous_wreathD16Cocycle_indexTwoInd` | the same names in `TauCeti.ContCohomology` | QuadraticFormInvariants |
| `AbsoluteGaloisGroup`, `KummerCoeff`, `UnitsCoeff`, `kummerMapCanonical`, `h2KummerToUnits`, `galoisSubgroup`, `galoisSubgroup_index`, `trivialF2`, `WreathC2`, `WreathC2.coordA/B/C`, `dihedralToWreath`, `wreathD16Cocycle`, `wreathD16Cocycle_isCocycle`, `galoisF2Iso`, `galoisRes`, `galoisCor`, `galoisEvens`, `galoisCharacter`, `galoisRes_eq_zero_iff` | the same names in `TauCeti` and `TauCeti.WreathC2` | QuadraticFormInvariants |
| `f2Pairing` | `TauCeti.trivialF2TopPairing` | QuadraticFormInvariants |
| `galoisConj`, `WreathC2.sectionTable`, `wreathSection` | `y ↦ res (cor y) − y`; the coordinate table of the section | QuadraticFormInvariants (`wreathSection_eq_native` at `:3365` compares it with `TauCeti.wreathSection`) |
| `galoisEvens_galoisRes` | `sorry`; `TauCeti.galoisEvens_galoisRes` at `2fd255d` | QuadraticFormInvariants `:3078` |
