# Repair report: FIX-PKG-HyperbolicDynamicsAndThermodynamicFormalism~3

Review settled: REV-PKG-HyperbolicDynamicsAndThermodynamicFormalism~2 (three findings, all P2). It is the only review, so the findings are named by their plain ids.

## F01 (P2) — applied differently

The finding is right: the corestriction requested from TangentialBordism is at the pins. The review proposed Tau Ceti's local retraction. Instead the README cites Mathlib's `ContMDiff.iff_comp_isImmersion`, which states the corestriction criterion directly, with no boundaryless hypothesis and no local argument.

Changes, old → new:
- `README.md`, "From Mathlib": new bullet for `Manifold.IsSmoothEmbedding` and `ContMDiff.iff_comp_isImmersion`, applied with `TauCeti.isSmoothEmbedding_coe_sphereBundle`; used by §9.3.
- The subsection "From TauCetiRoadmap.TangentialBordism — §2.3 (B1.5)" and its gap line are deleted.
- In Scope, the TangentialBordism clause is gone, and the library list now names Mathlib's immersion criterion.
- §9.3: "by the corestriction theorem requested from TangentialBordism (gap:sphere-bundle-embedding)" → "because the inclusion of SM is a smooth immersion and a continuous map into SM is smooth as soon as its composite with that immersion is (`ContMDiff.iff_comp_isImmersion`)".
- §9.3 `*Needs:*`: "TangentialBordism §2.3 and gap:sphere-bundle-embedding" → "Mathlib `Manifold.IsSmoothEmbedding`, `ContMDiff.iff_comp_isImmersion`".
- Layer 9 Dependencies: "TangentialBordism §2.3" → "Mathlib's smooth immersions".
- `Suggested.lean`, module docstring: the parenthesis now says that Tau Ceti has the maximal geodesic flow on its open domain in TM and SM as an embedded manifold, into which Mathlib's criterion corestricts smooth maps. Building the restricted `Flow ℝ` rests on two theorems of §9.3: the geodesic spray of a compact manifold is complete, and SM is invariant. The review's clause about the connection map is not used. The connection map is needed for the proof, not for the statement, so it is not something the headline lacks in order to be stated.
- `design/plan.json`: unchanged. The `sphere-bundle-embedding` entry stays in the top-level `gaps` list because target 9.3's `prerequisites` still name it, and this job cannot edit that field (see "Gate failure repaired" below).

Evidence:
- Mathlib `1b1ccf4`, `Mathlib/Geometry/Manifold/Immersion.lean` line 995: `ContMDiff.iff_comp_isImmersion (hφ : IsImmersion J J' n φ) : CMDiff n f ↔ Continuous f ∧ CMDiff n (φ ∘ f)`. It needs no `IsManifold` and no boundaryless instance.
- `Mathlib/Geometry/Manifold/SmoothEmbedding.lean` line 70: `IsSmoothEmbedding` has the fields `isImmersion` and `isEmbedding`.
- Tau Ceti `2fd255d`, `TauCeti/Geometry/Manifold/VectorBundle/Riemannian/Sphere.lean` line 181: `TauCeti.isSmoothEmbedding_coe_sphereBundle` gives `Manifold.IsSmoothEmbedding … (Subtype.val : {p // ‖p.2‖ = r p.proj} → TotalSpace F V)`. The carrier is the literal subtype with the subspace topology, so no comparison of carriers is needed either.
- A scratch file elaborated without error against the pinned Mathlib. It proves: for any subtype `S` of a charted space `N` whose inclusion is a `Manifold.IsSmoothEmbedding`, and any C^n map `F : X → N` with values in `S`, the corestriction is C^n. The proof is `(ContMDiff.iff_comp_isImmersion hS.isImmersion).2 ⟨hF.continuous.subtype_mk hFS, hF⟩`.

Pattern: every other mention of TangentialBordism or of the gap was searched for in `README.md`, `Suggested.lean`, `sources.toml` and `metadata.toml`. None remains.

## F02 (P2) — applied

§8.4, second API bullet. Old: "locally maximal for f⁻¹ with the same U, and for f^k, k ≥ 1, with … U ∩ f(U) ∩ ⋯ ∩ f^(k−1)(U)". New: "locally maximal for f⁻¹ with the same U; if moreover f(Λ) = Λ, it is locally maximal for f^k …". The new text also gives the two-line proof (Λ = f^j(Λ) ⊆ f^j(U); every integer is kn − j with 0 ≤ j < k). A new Check gives the review's witness, f = −Id, Λ = {(1, 0)}, k = 2.

Pattern:
- The f⁻¹ clause and the conjugation clause hold for every set and stay unconditional.
- §8.5's time-t bullet already assumes an invariant Λ. §8.5's rescaling and reversal clauses depend only on orbits as sets.
- The three-copy Check uses the invariant Λ = {a}.
- The new Check sits in §8.4's first Check list, so §8.5's reference "the fourth Check of §8.4" was renamed to "the Check of §8.4 in which the bracket leaves Λ".

## F03 (P2) — applied

§8.5, third API bullet. Old: "A nonempty Λ is not a hyperbolic set of the diffeomorphism g^t". New: "A nonempty hyperbolic set Λ of a C¹ flow g (§7.2) is not a hyperbolic set of the diffeomorphism g^t". The reason is kept: for x ∈ Λ, Dg^(nt) X(x) = X(g^(nt) x) is bounded above and below. Added as a counterexample: for the linear field (x, −y), {0} is invariant and locally maximal, and it is hyperbolic for g^t = diag(e^t, e^(−t)), but it is not a hyperbolic set of the flow.

Pattern: §7.7, the time-t sentence (README line 598), is stated for Anosov flows on a nonempty compact manifold, where the hyperbolic-set hypothesis holds. It is correct as it stands, so no other occurrence needed the repair.

## Checks run

- **Elaboration.** `lake env lean packages/HyperbolicDynamicsAndThermodynamicFormalism/Suggested.lean`, run from the content checkout: no error. There are 15 warnings, all `declaration uses sorry`, at lines 194, 211, 223, 286, 302, 406, 464, 475, 539, 557, 591, 601, 617, 668 and 686. These are the same 15 theorems as before, shifted by the two docstring lines. No `TauCeti.*` module had to be built.
- **Signatures.** All 50 declarations of `Suggested.lean` were put as `#check @name` in one scratch copy of the file and elaborated once (no error). Each elaborated type was compared mechanically with the one recorded before this round: all 50 are identical, since only the module docstring changed. No README statement changes with them. The earlier leads about dropped binders (`MeasurableSpace` on `iteratedPartitionLabel`, and the others the round-2 review lists) are binders the bodies do not use. They are unchanged.
- **Dependency check** (output): `depcheck: 234 roadmaps, 2231 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line. TangentialBordism is no longer a supplier.
- **Citations** (`roadmaps resolve` on the README): no cross-roadmap citation and no Lean name found nowhere.
- **Overlaps.** The one lead, "GeneralizedCohomology §G4.0b is defined only by an open revision", is wrong. Main (`818115d`) has G4.0b in `TauCetiRoadmap/GeneralizedCohomology/README.md` (the block at line 939 and the ownership rows at lines 39–40). No citation changes.
- **Sources.** No new source was cited. `sources.toml` is unchanged and nothing was added to `needs-references.toml`.
- **Ownership.** The repairs add no construction. They cite one Mathlib declaration and drop one supplier, so no ownership question arises.

## Gate failure repaired

- **`design/plan.json` removed the gap `sphere-bundle-embedding`, which plan targets still name.** The removal was undone: `design/plan.json` is restored byte for byte to its committed version (its only change had been deleting that 11-line entry), and `git diff` on it is now empty. A mechanical pass over the restored file shows that its `gaps` list holds `connection-map-jacobi-derivative` and `sphere-bundle-embedding`. Every `gap:<slug>` the plan names is one of these two. Nothing else changed: the README, `Suggested.lean`, `metadata.toml` and `sources.toml` are as they were after the findings were applied. The README's resolution of F01 still holds: §9.3 takes the corestriction from Mathlib's `ContMDiff.iff_comp_isImmersion`, and the README has no `gap:sphere-bundle-embedding` contract line. The kept plan entry is therefore a record carried by the plan's target 9.3, not a contract the roadmap consumes.
- **Dependency check rerun after the restore** (output): `depcheck: 234 roadmaps, 2231 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line. `Suggested.lean` was not touched by this repair, so the elaboration and signature results above still hold. It was not elaborated again.

## Adversarial pass

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| Mathlib bullet: corestriction into SM | scratch Lean example on an arbitrary embedded subtype; SM empty; a non-injective immersion | example elaborates; empty source: every map is smooth, vacuous; for a figure-eight immersion continuity of φ ∘ f does not give continuity of f, but for a subspace corestriction `Continuous.subtype_mk` gives it | holds; continuity is automatic here | new bullet |
| §9.3 smoothness of the restricted flow | n = ∞, F = flow ∘ (id × inclusion) : ℝ × SM → TM | F is smooth into TM, its values satisfy ‖v‖ = 1, and its corestriction is continuous, so it is C^∞ into SM by the criterion with M = ℝ × SM, N = SM, N' = TM; ℝ × SM needs no `IsManifold` | holds | sentence and `*Needs:*` |
| §8.4 iterate clause with f(Λ) = Λ | k = 1; k = 2, m = 3 and m = −3; f = id; Λ = ∅; three-copy example; −Id | k = 1: U₁ = U; 3 = 2·2 − 1 and −3 = 2·(−1) − 1, so j = 1 in both; f = id: local maximality forces U ⊆ Λ, and U_k = U; ∅ with U = ∅; three-copy: U ∩ f(U) = B(a) ∩ f(B(a)) excludes c; −Id: f(Λ) = {(−1, 0)} ≠ Λ, hypothesis fails | holds; hypothesis needed | bullet restated |
| §8.4 new Check (−Id) | U = B((1, 0), 1/2), k = 2 | points of U have x₁ > 1/2, and y₁ > 1/2 with −y₁ > 1/2 is impossible, so no f-orbit lies in U; f² = Id; U ∩ f(U) = B((1, 0), 1/2) ∩ B((−1, 0), 1/2) = ∅ (centres 2 apart, radii sum 1) | Check correct | Check added |
| §8.4 first API bullet and the f⁻¹ and conjugation clauses | Λ arbitrary; orbit of a point | (⇒) x ∈ S ⊆ U with S invariant has its orbit in S ⊆ U, so x ∈ Λ; (⇐) the orbit of x is an invariant subset of U; f and f⁻¹ have the same orbits; h maps orbits of f to orbits of hfh⁻¹ | hold without invariance | none |
| §8.5 repaired sentence | cat suspension γ₀, t = 1; linear field (x, −y), {0}, t = 1; Λ = ∅ | γ₀: X = ∂_s and Dg^n ∂_s = ∂_s, so the norm stays 1 for all n, whereas a hyperbolic splitting of g¹ sends nonzero vectors to 0 or ∞; linear field: g¹ = diag(2.718, 0.368) is hyperbolic at {0} with C = 1 and λ = e^(−1) = 0.368, but X(0) = 0, so {0} is not a hyperbolic set of the flow and the sentence does not speak of it; ∅: hyperbolic for both, vacuously, so "nonempty" is needed | holds; hypothesis needed | sentence restated, counterexample added |
| §8.5 splitting dichotomy used in the sentence | v = v_s + v_u with v_u ≠ 0; v = v_s ≠ 0 | ‖Dfⁿv‖ ≥ C⁻¹λ^(−n)‖v_u‖ − Cλⁿ‖v_s‖ → ∞; ‖Dfⁿv_s‖ ≤ Cλⁿ‖v_s‖ → 0; X(gⁿᵗx) has norm between min_Λ‖X‖ > 0 and max_Λ‖X‖ | holds | none |
| `Suggested.lean` docstring (geodesic flow not stated) | pinned Tau Ceti `Geodesic/Flow.lean`, `Flow/Complete.lean`, `IntegralCurve/GlobalFlow.lean` | the geodesic flow is a maximal integral-curve flow with domain in TM × ℝ (`maximalIntegralCurveFlowDomain_geodesicSpray`); `globalFlow` needs `IsCompleteVectorField`, which no pinned declaration supplies for `geodesicSpray` (grep: no hit) | reason accurate | wording |
| Plan gap list against the slugs the plan names | `design/plan.json` gaps; every `gap:<slug>` in the plan; README "What … must provide" lines | plan gaps: `connection-map-jacobi-derivative`, `sphere-bundle-embedding`; slugs named in the plan: the same two, none missing; README: one contract line, `connection-map-jacobi-derivative` (line 126), cited at §9.3 lines 792 and 806 | plan internally consistent; the README consumes only the first gap | entry kept (restored) |

## For the maintainer

- `design/plan.json` beyond its `gaps` list is outside what this job may edit. Three plan fields are stale relative to the README:
  - the `suppliers` list still has a TangentialBordism §2.3 entry;
  - target 9.3's `prerequisites` still list `roadmap:TangentialBordism §2.3` and `gap:sphere-bundle-embedding`;
  - for that reason the top-level `gaps` list keeps the `sphere-bundle-embedding` entry.

  The README, which is the roadmap, does not consume TangentialBordism. The corestriction is at the pins: Mathlib `ContMDiff.iff_comp_isImmersion` together with Tau Ceti `TauCeti.isSmoothEmbedding_coe_sphereBundle`. When the plan is regenerated from the README, the prerequisite, the supplier entry and the gap entry should all go together.
- No name that another roadmap cites has changed. In the README, TangentialBordism loses this roadmap as a consumer. The plan's stale gap entry is not a contract the README announces to TangentialBordism.
- No suspicious instructions were found in the review text.
