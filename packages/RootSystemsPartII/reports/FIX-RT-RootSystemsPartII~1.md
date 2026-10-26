# FIX-RT-RootSystemsPartII~1

Two reviews are covered. Review r1a has F01 and F02. Review r1b has F01 to F07. The sections follow that order, and each heading carries the id the review gave the finding.

F02 of r1a and F05 of r1b make the same claim: realization uniqueness re-derives a pinned theorem. That claim is settled once, under F05 of r1b.

## F01 (P3) — applied

Review r1a, §4.2 Check. Old text: "taking a full period sum would incorrectly change the latter to 1", with no starting root and no period. New text: A₂ reversal, δ = 2(α₁+α₂), original coefficients (2,2), folded coefficient 2. The period-4 sum starting at α₁ is 2(α₁+α₂), and using it as the simple root gives coefficient 1. At period 2 the full and distinct sums coincide.

## F02 (P3) — applied

Review r1a. This is the same claim as F05 of review r1b, and it is settled there.

## F01 (P1) — applied

Review r1b. RootSystemsPartIIDominanceAndDemazure and RootSystemsPartIIMinusculeBounds exist nowhere. `roadmaps grep` finds no match on main or at any open head, and there is no board package. Both names were removed from Scope and from Downstream consumers. These directions are now described as extensions of RootSystems that supply nothing here.

## F02 (P1) — applied differently

Review r1b. The gap is real: §4.4 applied §4.3 "on E" without naming a root pairing there. The witness is wrong, though. At the pin, `RootPairing.restrictScalars` (`BaseChange.lean`, an abbrev of `restrictScalars'`) with K = L = ℝ is a pairing on `span ℝ (range P.root)` and `span ℝ (range P.coroot)`, and its `IsRootSystem` instance is in the same file. So no new construction is needed. Instead, §4.4 gained a prose target "The root-span restriction", with API bullets and three Checks; the route, the *Needs:* line, the Mathlib contract and the line-31 `cartanMatrix_nondegenerate` remark were updated to match. This round also corrects one detail: the `IsBalanced` and anisotropy instances in `Finite/Nondegenerate.lean` need `[Fintype ι]`, so the contract and the §4.4 *Needs:* line now say to use `Fintype.ofFinite`.

## F03 (P3) — applied

Review r1b. Rap00 lines 195–214 use only sign tests: (2.11)–(2.12) for ⟨α,β∨⟩ ≥ 0, and (2.13) with nonpositive Cartan entries. Endpoint integrality is never used. `hlam_int` and `hmu_int` were removed from `stembridge_step`, `invariant_step`, `ambient_coroot_step` and `torsion_lattice_coroot_step`. README §1.2, §4.3, §4.4 and the Conventions were changed to match. An A₁ check with non-integral endpoints was added, together with the non-comparable pair 0, α/2.

## F04 (P3) — applied

Review r1b. λ + β ∈ L follows from `hroots` and closure under addition, so `hstable` was removed from `ambient_coroot_step` and "σ-stable" from §4.4. The same pattern was repaired in two more places: in §4.3 ("no σ-stability of L is needed") and in the §2.1 *Needs:* line, where the clause "if σ preserves L" was dropped.

## F05 (P3) — applied

Review r1b; this also settles r1a F02. Both declarations were checked at the pin:
- `RootPairing.IsRootSystem.ext` (`Basic.lean:197`; `[Finite ι]` comes from line 81).
- `Module.Dual.eq_of_preReflection_mapsTo` (`Reflection.lean:339`).

The averaging route in §2.2 was replaced. The evaluation fields identify the perfect pairings and `root_eq` identifies the roots, so `ext` makes the pairings equal. A `Base` is fixed by its `support`, since its other fields are propositions (`Base.lean:68–76`). Both names were added to the Mathlib contract and to the §2.2 *Needs:* line.

## F06 (P3) — disputed

Review r1b. The witness does not refute the text. The D₅ tree 1–2–3, 3–4, 3–5 has diameter 3, and its centre is the two adjacent vertices {2,3}, both of which are central vertices. The fork exchange fixes 2 and 3, so the first alternative ("fixes a central vertex") holds. §3.1 now spells out what the centre is, without changing the mathematics. The reviewer's repair is also correct, because it measures distance to the central edge.

## F07 (P3) — applied

Review r1b. `rootLE` and `fixedSpace` each had a one-term body and were not needed to state any headline. Both were deleted, and their bodies were inlined:
- `y - x ∈ TauCeti.posRootCone P b`;
- `LinearMap.fixedSubmodule sigma.weightMap`.

Increments are now written as `P.root i ∈ …` and `orbitSum P sigma i ∈ …`; this is equivalent by `add_sub_cancel_left`. The README now describes both notions in prose, with no backticked own name.

## Checks run

- `lake env lean packages/RootSystemsPartII/Suggested.lean`: exit 0. There are exactly 10 warnings, all `declaration uses sorry`, at lines 31, 91, 109, 121, 138, 150, 164, 178, 200 and 226. There are no errors.
- Signature audit: one scratch file held the module and `#check @` for all 15 declarations, and it was elaborated once. Each elaborated type matches its README statement. No section binder was dropped: every instance and hypothesis sits in the declaration's own signature. Nothing changed in `Suggested.lean` this round.
- The same scratch file tested the library claims:
  - With only `[Finite ι]`, `(P.restrictScalars ℝ)` fails, because `P.IsBalanced` cannot be synthesized.
  - With `Fintype.ofFinite`, both `IsBalanced` and `(P.restrictScalars ℝ).IsRootSystem` are inferred.
  - `restrictScalars_coe_root`, `restrictScalars_coe_coroot` and `restrictScalars_pairing` (equal pairings) elaborate.
  - `(P.restrictScalars ℝ).IsReduced` is not an instance. This matches the README, which lists reducedness as something to prove.
- Dependency check, output:

      depcheck: 56 roadmaps, 641 edges, 0 problem(s)

  There is no UPWARD, CYCLE or moved line.
- `roadmaps resolve`: no cross-roadmap citation and no Lean name is found nowhere.
- Supplier citations were re-resolved:
  - RootSystems Layers 1, 2, 4, 5 and 6 on main (README lines 218, 245, 296, 321, 356).
  - ReductiveGroups §9A.1b on main (line 1290) and its three named parts (lines 1339, 1371, 1457).
  - ReductiveGroupsPartII §RG2.1.4 and §RG2.4.3 at the head of its open pull request (README lines 2421 and 5994). That roadmap is earlier in the merge order.
- Ownership: `roadmaps grep` for the root-span restriction finds only LieHighestWeight's use of `RootPairing.restrictScalarsRat`, which restricts to ℚ for a different purpose. No roadmap owns the based restriction with chamber and cone transfer, so this roadmap owns that adapter.

## Adversarial pass on changed statements

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| `stembridge_step` without endpoint integrality | A₁, λ=α/10, μ=11α/10; A₂, λ=f/2, μ=3f/2 (f=α₁+α₂); rank 0 | ⟨λ,α∨⟩=0.2, ⟨μ,α∨⟩=2.2, β=α, budget 0. A₂: values (½,½) and (3/2,3/2); simple increments give (5/2,−½) and (−½,5/2), both rejected; θ gives (3/2,3/2), budget 0. Rank 0: Q⁺={0}, so `hne` and `hle` cannot both hold | true |
| `invariant_step` without endpoint integrality | A₂ reversal, λ=f/4, μ=5f/4; D₄ triality, λ=2ρ, μ=λ+θ | values (¼,¼) and (5/4,5/4); orbit sum f gives λ+f=μ, fixed, budget 0. D₄: bad orbit (1,3,1,1) leaves (0,−1,0,0); θ leaves 0 | true |
| `ambient_coroot_step` without `hstable` | GL₂, L=ℤ², σ = 2 on the central line; real endpoints with L=⊤ | σ(1,0)=(3/2,1/2)∉L, yet λ=(0,0), μ=(1,−1) gives β=(1,−1)∈L and λ+β=μ. Real case: λ=(0.1,−0.1), μ=(1.1,−1.1) have values 0.2 and 2.2, β=(1,−1), budget 0 | true |
| `torsion_lattice_coroot_step` without integrality | A=ℤ⊕ℤ/2, r=(2,0), f(n,t)=n, τ=id | λ=(0,1), μ=(2,1): β=(2,0), λ+β=μ, torsion 1 kept. fμ−fλ=2≠0, as forced by injectivity on ⟨r⟩ | true |
| Root-span restriction P_E | GL₂ roots ±(1,−1); torus; spanning A₂ | E=E′=ℝ(1,−1), pairing 2 in P and P_E, (−1,1) gives −2 in both; pairing E with all of V∨ has kernel ℝ(1,1). Torus: E=0, Q⁺={0}. A₂: E=V, Cartan [[2,−1],[−1,2]] unchanged | true |
| §2.2 uniqueness via `IsRootSystem.ext` | A₃ fold; rank 0 | norms 4 and 2, inner product −2, entries −2,−1. The alternative −2 would send β₂ to β₂+2β₁, of norm 2+16−8=10, which is not a root. Empty index: equal pairings on 0 | true |
| §4.2 period Check | A₂, δ=2f, start α₁, periods 2 and 4 | period 2: sum f, coefficient 2; period 4: sum 2f, coefficient 1; m/d gives 2/2=1 and 4/2=2 | consistent with §2.1 |
| §3.1 tree centre | D₅ fork; A₄, A₃ and E₆ reversal; D₄ triality | D₅: centre {2,3} fixed, distances from 2 are 1,1,2,2, and leaves 4 and 5 are not adjacent. A₄: centre {2,3} exchanged, n=2. A₃: centre {2}. E₆: centre {4}. D₄: centre {2} | true |
| `rootLE`/`fixedSpace` inlined | A₂, λ=0, β=θ | (λ+θ)−λ=θ, the same membership; fixed vectors (t,t) under `LinearMap.fixedSubmodule` | elaborated types unchanged apart from the inlined bodies |

## Notes for the maintainer

- Lean names removed: `TauCetiRoadmap.RootSystemsPartII.rootLE` and `TauCetiRoadmap.RootSystemsPartII.fixedSpace`.
- Four theorems lost hypotheses: `stembridge_step`, `invariant_step`, `ambient_coroot_step` and `torsion_lattice_coroot_step`. The board package GeometricSatakeAndFusionPartII, at the design stage, cites `RootSystemsPartII:invariant-step` and `ambient-coroot-export` by atlas id. Its obligations only shrink.
- `design/plan.json` still has `rootLE_*` node names and a restructure proposal naming the two nonexistent continuations. Only its `gaps` list is editable, and no gap is needed.
- No source was fetched and no `needs-references.toml` was written. The reviews contained no instruction-like text.
