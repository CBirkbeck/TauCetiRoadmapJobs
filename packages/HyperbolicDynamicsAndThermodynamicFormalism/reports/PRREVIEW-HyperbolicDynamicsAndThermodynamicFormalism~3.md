# Review of HyperbolicDynamicsAndThermodynamicFormalism (pull request #2441 at bfbca4f)

**Verdict:** needs changes

Incremental re-review of the 2 lines changed since `3d9508c` (README.md:336). The roadmap folder itself has no finding at this head; the two findings below are on the board's design plan.

## R01 (P2) — Declared gap `sphere-bundle-embedding` is still in the plan and asks for what the pins provide

**Location** `packages/HyperbolicDynamicsAndThermodynamicFormalism/design/plan.json`, lines 2442–2451, `gaps`, slug `sphere-bundle-embedding` (supplier TangentialBordism §2.3 (B1.5)): "a C^n map … into the total space with values in the sphere bundle is C^n into the sphere bundle".

**Claim** Not repaired. The reply on the pull request says the entry was removed and `gaps` is `[]`; the board's plan at `4360de1` still lists it (the file last changed in `62e124d`). The pins prove the statement, and README.md:55 and README.md:819 use that route.

**Witness** Mathlib `ContMDiff.iff_comp_isImmersion` (Geometry/Manifold/Immersion.lean:995): `IsImmersion J J' n φ → (CMDiff n f ↔ Continuous f ∧ CMDiff n (φ ∘ f))`; field `IsSmoothEmbedding.isImmersion` (SmoothEmbedding.lean:71); Tau Ceti `isSmoothEmbedding_coe_sphereBundle` (Riemannian/Sphere.lean:181).

**Repair** Delete the `sphere-bundle-embedding` entry from the `gaps` of the plan on the board (a change to the board, not to this pull request's branch) and withdraw its announcement on TangentialBordism's job. The roadmap folder needs no change.

Re-raised: R01 of PRREVIEW-HyperbolicDynamicsAndThermodynamicFormalism~2 (answered there as H01, "applied"). The stated repair is not in the board's file, so the reason given does not hold.

## R02 (P2) — Declared gap `connection-map-jacobi-derivative` is still in the plan and asks RiemannianGeometry for what §9.3 owns

**Location** `packages/HyperbolicDynamicsAndThermodynamicFormalism/design/plan.json`, lines 2453–2462, `gaps`, slug `connection-map-jacobi-derivative` (supplier RiemannianGeometry, proposed Part II), against README.md:13: "the connection map of TM with the Jacobi-field form of the derivative of the geodesic flow, which no roadmap plans, is §9.3's".

**Claim** Not repaired. The reply says the entry was removed; the board's plan at `4360de1` still lists it. It asks RiemannianGeometry for K, the isomorphism (Dπ, K) and Dφ^t ξ = (J(t), D_tJ(t)), which README §9.3 states and owns: two owners if the supplier acts on it.

**Witness** README.md:800: K is a smooth bundle map and ξ ↦ (Dπ_v ξ, K_v ξ) an isomorphism onto the pull-back of TM ⊕ TM. README.md:801: Dπ(Dφ^t_v ξ) = J(t), K(Dφ^t_v ξ) = D_tJ(t).

**Repair** Delete the `connection-map-jacobi-derivative` entry from the `gaps` of the plan on the board and withdraw its announcement on RiemannianGeometry's job. §9.3 stays the owner; the roadmap folder needs no change.

Re-raised: R02 of PRREVIEW-HyperbolicDynamicsAndThermodynamicFormalism~2 (answered there as H02, "applied"). The stated repair is not in the board's file, so the reason given does not hold.

## Previous findings

- R01 — not repaired: `plan.json` lines 2442–2451 still declare `sphere-bundle-embedding` with supplier TangentialBordism §2.3 (B1.5); raised again as R01.
- R02 — not repaired: `plan.json` lines 2453–2462 still declare `connection-map-jacobi-derivative` with supplier RiemannianGeometry, proposed Part II; raised again as R02.
- R03 — repaired: "The disjoint union of two copies of the full two-shift is expansive … the equilibrium states of φ = 0 form a segment, joining the Bernoulli measures (1/2, 1/2) of the two copies, each of entropy log 2 = h_top" (README.md:336). No new problem.

## Verified sound

| Target | Instances tried | Statement side | Computed on the instance | Result |
|---|---|---|---|---|
| §5.2 Check, README.md:336 (changed) | two copies A, B of the full 2-shift at distance 1; 2-shift ⊔ 3-shift | segment of equilibrium states of φ = 0; one point when the entropies differ | h_top = log 2; h(tμ_A + (1 − t)μ_B) = t log 2 + (1 − t) log 2 = log 2 for all t ∈ [0, 1]; mixed case: t log 2 + (1 − t) log 3 = log 3 only at t = 0 | holds |
| §5.2 `existsUnique_isEquilibriumState_of_hasWeakSpecification` against the changed Check | same union; `HasWeakSpecification` at δ = 1/2, k = 2, x₀ ∈ A, x₁ ∈ B, n = (1, 1) | `hspec` fails, so the theorem does not apply | y within 1/2 of x₀ forces y ∈ A; T^(1 + g₀) y ∈ A is at distance 1 from x₁ for every g₀; expansive with the shift's constant; locally constant φ: Bowen sums bounded | consistent: uniqueness fails exactly where `hspec` fails |
| R01, R02 gaps | board `plan.json` at `4360de1`; pins; README §9.3 | reply: `"gaps": []` | two slugs present (lines 2442, 2453); `ContMDiff.iff_comp_isImmersion` at Immersion.lean:995; README.md:800–801 | not repaired |

The rows of the untouched statements stand as in the previous review, of `3d9508c`.

- Changed passages: 1 (README.md:336); it cites no source, no supplier section and no Lean name beyond the section's own theorem; no statement of `Suggested.lean` changed. None of the seeded sample's targets falls in it.
- Library declarations opened at the pins: 3 (`ContMDiff.iff_comp_isImmersion` Immersion.lean:995, `IsSmoothEmbedding.isImmersion` SmoothEmbedding.lean:71, `isSmoothEmbedding_coe_sphereBundle` Riemannian/Sphere.lean:181).
- Cross-roadmap citations resolved: the overlap lead GeneralizedCohomology G4.0b is defined on main (`ef3d21f`, README line 1082), so no open revision is needed for it; no other pull request changes this roadmap and none drops an id it cites.
- Gate at `bfbca4f`: every check 0, OK. Dependency check: `depcheck: 255 roadmaps, 2429 edges, 0 problem(s)`. No change outside the roadmap folder.
- Elaboration: `lake env lean` on `Suggested.lean` gives 15 `sorry` warnings and nothing else.
- Pull request text against this head: the title and description do not describe the Check that changed; the supplier list, the generality in the summary block and the validation line agree with the head.
- Overlap check: read ClassicalErgodicTheory, ArithmeticDynamics, RiemannianGeometry (as in the previous review; the change adds no object); nothing shared beyond what is cited: pressure, equilibrium states and specification with ClassicalErgodicTheory (owner, cited), Jacobi fields with RiemannianGeometry (owner, cited).
- Source independence: changed passages only; 1 passage compared with 1 source (ClimenhagaThompson2016, which has no disjoint-union or two-copies example), none shared; largest share BowenRuelle1975, 48 of 151 locators, as before; no layer added, removed or reordered, so the arrangement was not compared again.

## Not verifiable

- KatokHasselblatt1995, Bowen1975, FH2019, Walters1982, Newhouse1989, BowenWalters1972, HirschPalisPughShub1970: settled as uncertified, as in the previous review; the changed passage cites none of them.

## Source issues

- none

## For the human reviewers

- R01 and R02 concern the board's `packages/HyperbolicDynamicsAndThermodynamicFormalism/design/plan.json`, which this pull request does not carry. Two replies report the entries removed; the board's file is unchanged since `62e124d`. Inside the roadmap folder no finding remains.
