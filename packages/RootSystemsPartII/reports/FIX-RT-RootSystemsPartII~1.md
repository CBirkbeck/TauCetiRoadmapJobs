# FIX-RT-RootSystemsPartII~1

Merged findings: F02 of review r1a and F05 of review r1b are the same claim (realization uniqueness re-derives a pinned theorem). They are settled together under F05 of review r1b, and the r1a F02 section points there.

Sections below follow review r1a (its F01, F02) and then review r1b (its F01 to F07); each heading carries the id the review gave the finding.

## F01 (P3) — applied

§4.2 Check, old: "taking a full period sum would incorrectly change the latter to 1" (no starting root, no period). New: A₂ reversal, δ = 2(α₁+α₂), original coefficients (2,2), folded coefficient 2. The period-4 sum starting at α₁ is 2(α₁+α₂), and using it as the simple root gives coefficient 1. At period 2 the full sum and the distinct sum agree.

## F02 (P3) — applied

Same as F05 of review r1b; see that section.

## F01 (P1) — applied

The roadmaps RootSystemsPartIIDominanceAndDemazure and RootSystemsPartIIMinusculeBounds exist nowhere: `roadmaps grep` finds no match, and there is no board package. Scope (old line 13): both names removed. The text now says these directions extend RootSystems elsewhere and supply nothing here. Downstream consumers (old line 362): reworded the same way, without names. The `restructure` entry in `design/plan.json` is outside the editable `gaps` list and was left unchanged.

## F02 (P1) — applied differently

The gap is real: the §4.4 route applied §4.3 "on E" without naming a root pairing on the root span. The reviewer's witness is wrong, though: "no root-pairing-valued declaration on the root span" is false at the pin. Mathlib `RootPairing.restrictScalars` (`Mathlib/LinearAlgebra/RootSystem/BaseChange.lean:131`), taken with K = L = ℝ, is a `RootPairing ι ℝ (span ℝ (range P.root)) (span ℝ (range P.coroot))`. It has an `IsRootSystem` instance (:92) and keeps roots, coroots and pairings (`restrictScalars_coe_root`, `restrictScalars_coe_coroot`, `restrictScalars_pairing`). `IsBalanced` comes from the instance at `Finite/Nondegenerate.lean:304`, and anisotropy from `instIsAnisotropicOfLinearOrderedCommRing` (:407). I checked mechanically that `(P.restrictScalars ℝ).IsRootSystem` is inferred for a finite crystallographic real pairing.

So no new `restrictRootSpan` construction is needed. Changes:
- Added the Mathlib supplier contract.
- Added a prose target in §4.4, "The root-span restriction". It covers reducedness, crystallographicity, the base with the same support, the restricted based automorphism, and agreement of simple-coroot values, chamber and Q⁺ on E. It has API bullets and three Checks: GL₂, a torus, and the spanning case.
- The §4.4 route and *Needs:* now cite it.
- Pattern repair: the line 31 remark on `cartanMatrix_nondegenerate` now applies it to this restriction.

## F03 (P3) — applied

Verified. The Rap00 route (lines 195–214) uses only two sign tests: ⟨β,αᵢ∨⟩ ≥ 0 from the root-sum lemma, and dominance of μ together with nonpositive Cartan entries. Integrality of λ and μ never enters. A₁ instance: λ = α/10, μ = 11α/10, values 1/5 and 11/5, step α, budget 0.

Changes:
- Removed `hlam_int` and `hmu_int` from `stembridge_step`, `invariant_step`, `ambient_coroot_step` and `torsion_lattice_coroot_step`.
- README §1.2, §4.3 and §4.4, the torsion paragraph and the Conventions (L no longer assumed integral) changed to match.
- §4.3 *Needs:* now uses only the chamber equivalence of §4.1. That equivalence holds for all fixed real vectors.
- Added the A₁ non-integral Check to §1.2, with the non-comparable pair 0, α/2 as a negative control.

## F04 (P3) — applied

Verified: λ + β ∈ L follows from `hroots` and closure under addition, and fixedness is stated through `sigma.weightMap` on M. Removed `hstable` and "σ-stable" from §4.4.

Pattern repair at two more places:
- §4.3: "σ preserving L" → "no σ-stability of L is needed".
- §2.1 *Needs:*: "if σ preserves L" dropped, because an orbit sum is a sum of roots.

## F05 (P3) — applied

Verified at the pin. `RootPairing.IsRootSystem.ext` (`Basic.lean:197`, with `[Finite ι] [CharZero R] [IsDomain R]` and both pairings root systems) and `Module.Dual.eq_of_preReflection_mapsTo` (`Reflection.lean:339`) apply. The evaluation fields give equal `toLinearMap`, and `root_eq` gives equal roots. `foldedIndices` is finite.

Changes:
- Replaced the averaging-route paragraph of §2.2 with consumption of these declarations.
- The base is determined by its support because its other fields are propositions (`Base.lean:68`).
- Updated the uniqueness API bullet.
- Added both names to the Mathlib supplier contracts and to §2.2 *Needs:*.

## F06 (P3) — applied differently

The claim is disputed as stated. In the standard meaning, a tree's centre is one vertex or two adjacent vertices, and both of the latter are "central vertices". The D₅ fork exchange fixes the central vertices 2 and 3, so it falls under the first alternative, and the argument holds. The reviewer's repair also contains an error: "except the two fixed endpoints" is wrong, because in a tree adjacent vertices always differ by exactly 1 in distance from any vertex.

I still made the wording unambiguous. The text now defines the centre, says the automorphism either fixes a vertex of it (naming the D₅ fork case) or exchanges a two-vertex centre, and states the distance-parity fact explicitly.

## F07 (P3) — applied

Verified: neither definition is needed to state any headline, and each body is one library term. Changes:
- Deleted `rootLE` and `fixedSpace` from `Suggested.lean`.
- Inlined their bodies: `y - x ∈ TauCeti.posRootCone P b` and `LinearMap.fixedSubmodule sigma.weightMap`. Increments are stated as `P.root i ∈ …` and `orbitSum P sigma i ∈ …`, which is equivalent to `(lam + β) - lam ∈ …`.
- README: §1.1 defines the order in prose as membership in `TauCeti.posRootCone`. The Conventions and §2.2 name E^σ as `LinearMap.fixedSubmodule` of the weight map. No backticked own name for either remains.

## Checks run

- `lake env lean packages/RootSystemsPartII/Suggested.lean`: exit 0, with exactly 10 `declaration uses sorry` warnings (the ten theorems). No errors.
- Signature audit: a scratch file with `#check @` for all 15 remaining declarations, elaborated once. Each type matches its README statement. The only differences from before are the deleted hypotheses (`hlam_int`, `hmu_int`, `hstable`) and the inlined bodies. No section binder was lost; every instance hypothesis is in each declaration's own signature. The same file confirmed `(P.restrictScalars ℝ).IsRootSystem` by `inferInstance`, plus the signatures of `IsRootSystem.ext`, `Dual.eq_of_preReflection_mapsTo`, `restrictScalars_coe_root` and `restrictScalars_coe_coroot`.
- Dependency check: `depcheck: 56 roadmaps, 641 edges, 0 problem(s)`. No UPWARD or CYCLE line.
- `roadmaps resolve`: no cross-roadmap citations or Lean names found nowhere.

## Adversarial pass on changed statements

| Statement | Instances | Values | Result |
|---|---|---|---|
| `stembridge_step` without integrality | A₁ λ=α/10, μ=11α/10; A₂ λ=0, μ=α₁+α₂; λ=μ | values 1/5, 11/5, β=α, budget 0; θ gives (1,1), budget 0; equal endpoints excluded by `hne` | true |
| `invariant_step` without integrality | A₂ reversal λ=f/4, μ=5f/4 (f=α₁+α₂) | original values (1/4,1/4) and (5/4,5/4), both dominant; orbit sum f, budget 0 | true |
| `ambient_coroot_step` without `hstable` / integrality | GL₂ L=ℤ², σ = 2 on the central line; λ=(0,0), μ=(1,−1) | β=(1,−1) ∈ L, λ+β=μ; σ(1,0)=(3/2,1/2) ∉ L, so L is not σ-stable, yet the conclusion holds | true |
| `torsion_lattice_coroot_step` without integrality | A=ℤ⊕ℤ/2, r=(2,0), f(n,t)=n; λ=(0,1), μ=(2,1) | β=(2,0), remaining budget 0, torsion 1 kept; fλ≠fμ forced by injectivity on ⟨r⟩ | true |
| Root-span restriction | GL₂; torus; spanning A₂ | E line, values ±2 agree in P and P_E; E=0, Q⁺={0}; P_E=P, diagonal Cartan 2 | true |
| §2.2 uniqueness via `IsRootSystem.ext` | A₃ fold; rank 0 | equal evaluation and roots force entries (−2,−1), and the alternative −2 is excluded; empty index gives equal pairings | true |
| §4.2 period Check | A₂, δ=2f, periods 2 and 4 from α₁ | period 2: sum f, coefficient 2; period 4: sum 2f, coefficient 1 | consistent with §2.1 m/d formula |
| §3.1 tree centre | D₅ fork; A₄ reversal; A₃ reversal | fixes 2 and 3 (first case); exchanges the centre {2,3} (second case); fixes vertex 2 | true |

## Notes for the maintainer

- Lean names removed: `TauCetiRoadmap.RootSystemsPartII.rootLE` and `TauCetiRoadmap.RootSystemsPartII.fixedSpace`. Four theorems lost hypotheses: `stembridge_step`, `invariant_step`, `ambient_coroot_step` and `torsion_lattice_coroot_step`. A roadmap citing those binders (ReductiveGroupsPartII §RG2.4.3 as consumer of the export) now has fewer hypotheses to check.
- `design/plan.json` still carries node names `rootLE_*` and the restructure proposal naming the two nonexistent continuations. Only its `gaps` list was editable, and no gap was needed.
- Ownership: the root-span restriction is a pinned Mathlib declaration. The adapter facts are stated here because no roadmap on main or at the supplied open heads states them (`roadmaps grep 'root span'`).
- No source was fetched. The changes use only the cached Rap00 lines already cited.
