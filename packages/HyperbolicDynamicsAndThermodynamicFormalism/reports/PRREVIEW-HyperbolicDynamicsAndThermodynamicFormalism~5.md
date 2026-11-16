# Review of HyperbolicDynamicsAndThermodynamicFormalism (pull request #2441 at fe970db)

**Verdict:** needs changes

Incremental re-review of the 2 lines changed since `bfbca4f` (README.md:451). The roadmap folder itself has no finding; the two findings below are carried from the previous report and concern the board's plan.

## R01 (P2) — Declared gap `sphere-bundle-embedding` is still in the board's plan and asks for what the pins provide

**Location** `packages/HyperbolicDynamicsAndThermodynamicFormalism/design/plan.json`, line 2442, `gaps`, slug `sphere-bundle-embedding` (supplier TangentialBordism §2.3 (B1.5)): "a C^n map … into the total space with values in the sphere bundle is C^n into the sphere bundle".

**Claim** Not repaired. The board's file still lists the entry and was last changed in `62e124d`. The pins prove the statement, and README.md:55 uses that route.

**Witness** Mathlib `ContMDiff.iff_comp_isImmersion` (Geometry/Manifold/Immersion.lean:995): `IsImmersion J J' n φ → (CMDiff n f ↔ Continuous f ∧ CMDiff n (φ ∘ f))`; Tau Ceti `isSmoothEmbedding_coe_sphereBundle` (Riemannian/Sphere.lean:181) gives the immersion and the continuity.

**Repair** Delete the `sphere-bundle-embedding` entry from `gaps` in the board's plan and withdraw its announcement on TangentialBordism's job. This is a change to the board, not to the pull request's branch; the roadmap folder needs no change.

Re-raised: H01 of the replies to PRREVIEW-HyperbolicDynamicsAndThermodynamicFormalism~1, ~2 and ~3 (each marked "applied"), and R01 of ~4. No reason was given for leaving it; the stated repair is not in the board's file.

## R02 (P2) — Declared gap `connection-map-jacobi-derivative` is still in the board's plan and asks RiemannianGeometry for what §9.3 owns

**Location** `packages/HyperbolicDynamicsAndThermodynamicFormalism/design/plan.json`, line 2453, `gaps`, slug `connection-map-jacobi-derivative` (supplier RiemannianGeometry, proposed Part II), against README.md:13: "the connection map of TM with the Jacobi-field form of the derivative of the geodesic flow, which no roadmap plans, is §9.3's".

**Claim** Not repaired. The board's file still lists the entry. It asks RiemannianGeometry for K, the isomorphism (Dπ, K) and Dφ^t ξ = (J(t), D_tJ(t)), which README §9.3 states and owns: two owners if the supplier acts on the announcement.

**Witness** README.md:800: K is a smooth bundle map and ξ ↦ (Dπ_v ξ, K_v ξ) an isomorphism onto the pull-back of TM ⊕ TM. README.md:801: Dπ(Dφ^t_v ξ) = J(t), K(Dφ^t_v ξ) = D_tJ(t).

**Repair** Delete the `connection-map-jacobi-derivative` entry from `gaps` in the board's plan and withdraw its announcement on RiemannianGeometry's job. §9.3 stays the owner; the roadmap folder needs no change.

Re-raised: H02 of the replies to PRREVIEW-HyperbolicDynamicsAndThermodynamicFormalism~1, ~2 and ~3 (each marked "applied"), and R02 of ~4. No reason was given for leaving it; the stated repair is not in the board's file.

## Previous findings

- R01 — not repaired: board `plan.json` line 2442 still has slug `sphere-bundle-embedding`, supplier TangentialBordism §2.3 (B1.5); file last changed in `62e124d`.
- R02 — not repaired: board `plan.json` line 2453 still has slug `connection-map-jacobi-derivative`, supplier RiemannianGeometry "proposed Part II".
- R03 — repaired: README.md:451 now reads "δ = 1, the point z = x is g^v x for v = −1, 0 and 1, all in [−1, 1] … Every δ₀ < 1 works, with e(δ) = min(δ, 1 − δ)". No new problem.

## Verified sound

| Target | Instances tried | Statement side | Computed on the instance | Result |
|---|---|---|---|---|
| §6.5 Check on δ ≤ δ₀ (README.md:451), against (F2) at README.md:439 | period-1 orbit, arc-length metric; δ = 1; δ = 0.6; δ = 0.9 | not unique at δ = 1; unique for δ ≤ δ₀ < 1 with e(δ) = min(δ, 1 − δ) | δ = 1, z = x: v ∈ {−1, 0, 1}, d = 0. δ = 0.6: e = 0.4, \|u\| < 0.4, \|u ± 1\| > 0.6. δ = 0.9: e = 0.1, \|u ± 1\| > 0.9 | holds |
| `HasFlowHyperbolicLocalProductStructure` (Suggested.lean:274–288) on the same instance | period-1 orbit; δ₀ = 1 and δ₀ = 0.9 | `∃! v ∈ Icc (-δ) δ` for `δ ∈ Ioc 0 δ₀` | strong sets are {x} (isometry), so v ∈ u + ℤ; δ₀ = 1 fails at δ = 1 (three v); δ₀ = 0.9 holds with e = min(δ, 1 − δ); (F3) reads 0 ≤ 0 | definition holds; agrees with the Check and with the bullet above it (README.md:450) |
| Previous R01, R02 (board plan) | board `plan.json`; pins; README §9.3 | gaps removed | slugs at lines 2442 and 2453; `ContMDiff.iff_comp_isImmersion` at Immersion.lean:995; `isSmoothEmbedding_coe_sphereBundle` at Sphere.lean:181; README.md:800–801 | not repaired (R01, R02) |
| Pull request text | title, summary block, prose, dependency sentence against the head | adds the roadmap; 3 open and 4 main suppliers | the changed Check is not described in the text, so nothing in it changes; folder still 3 files added, 0 removed | agrees |

The rows of the previous review for the untouched statements stand as in the previous review, of `bfbca4f`.

- The diff changes one README sentence (README.md:451) and no Lean statement, heading, supplier or locator; no other passage cites δ₀ = 1/4 or the replaced instance (searched the README for `δ₀` and `1/4`).
- Source locators checked: none added or changed by the diff; the changed Check cites no source. The seeded sample does not fall in the changed passage.
- Library declarations opened at the pins: `ContMDiff.iff_comp_isImmersion` (Mathlib, Geometry/Manifold/Immersion.lean:995), `isSmoothEmbedding_coe_sphereBundle` (Tau Ceti, Geometry/Manifold/VectorBundle/Riemannian/Sphere.lean:181).
- Cross-roadmap citations: none in the changed passage. The overlap lead "GeneralizedCohomology §G4.0b only an open revision defines" is void: main (`5ff4294`) states G4.0b at GeneralizedCohomology README line 1082.
- Gate at `fe970db`: every check 0, OK. Dependency check: `depcheck: 257 roadmaps, 2447 edges, 0 problem(s)`. No change outside the roadmap folder.
- Elaboration: `lake env lean` on `Suggested.lean` gives 15 `sorry` warnings and nothing else; the file is unchanged since `bfbca4f`.
- Overlap check: read ClassicalErgodicTheory, ArithmeticDynamics, Varifolds, MathematicalBilliards, RiemannianGeometry as in the previous review (the diff adds no object); pressure, equilibrium states, Gibbs, expansive and specification notions: ClassicalErgodicTheory (cited); measure entropy: GeometryOfNumbersAndQuadraticArithmetic (cited); Jacobi fields: RiemannianGeometry (cited); topological Grassmann bundle: GeometricCurrents G6 (cited); nothing else shared.
- Source independence: changed passages only; 1 passage compared with 1 source (BowenRuelle1975 lines 96–108, the definitions the Check tests), none shared; largest share BowenRuelle1975, 46 of 132 source citations; the diff adds, removes or reorders no layer, so the contents were not compared again.

## Not verifiable

- KatokHasselblatt1995, Bowen1975, FH2019, Walters1982, Newhouse1989, BowenWalters1972, HirschPalisPughShub1970: settled as uncertified; their locators were not read (none is in the changed passage).
- Ownership against the open ManifoldOptimization and LorentzianGeometry roadmaps: not rechecked in this incremental round.

## Source issues

- none

## For the human reviewers

- R01 and R02 concern the board's `packages/HyperbolicDynamicsAndThermodynamicFormalism/design/plan.json`, which this pull request does not carry; the file is unchanged since `62e124d` through five reviews. Inside the roadmap folder no finding remains at `fe970db`.
