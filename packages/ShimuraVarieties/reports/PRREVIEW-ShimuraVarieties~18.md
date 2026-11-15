# Review of ShimuraVarieties (pull request #933 at 314489c)

**Verdict:** accepted

Incremental re-review of 0 changed lines since `314489c`; this round reads the pull request's title and description, as they stand now, against the head. No finding.

## Previous findings

- R01 — repaired: the description now reads "AdelicAlgebraicGroups, SchemeAndStackFoundations, ReductiveGroups, ReductiveGroupsPartII, ModularCurves, ClassFieldTheory, AlgebraicCurves, SmoothRepresentationsOfLocalGroups, RepresentationTheory/LieGroups and the completed RestrictedProducts are on main."; all ten folders are on main at `8ad4192`.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| Description: "canonical models over the reflex field E(D)", "main theorem of complex multiplication"; §5.1 `CMType.reflexField_isCMField` | `ℚ(i)`, `Φ={id}`; `ℚ(ζ₈)`, `Φ={1,5}`; `ℚ(ζ₅)`, `Φ={1,2}` | type trace `a ↦ a`, field `ℚ(i)`; `tr(ζ₈)=ζ₈+ζ₈⁵=0`, `tr(i)=2i`, stabilizer `{1,5}`, field `ℚ(i)`, degree 2; stabilizer of `{1,2}` in `(ℤ/5)×` trivial, field `ℚ(ζ₅)`, degree 4 | all three CM fields, as stated | — |
| §5.1 `CMType.reflexField_representation`, both directions | `ℚ(i)`, `Φ={id}`, `k=ℚ` and `k=ℚ(i)` | `k=ℚ`: any `ρ` has rational trace, `tr ρ(i) ∈ ℚ ≠ i`, left side false, `ℚ(i) ≤ ℚ` false; `k=ℚ(i)`: `n=1`, `ρ(a)=a`, trace `a`, left true, right true | iff holds on both instances | — |
| Description: "The GL₂ instances are identified with … modular curves over ℚ" | `μ_h(z)=diag(z,1)` | every Galois conjugate of `μ_h` is `GL₂(ℂ)`-conjugate to it, so `E(D)=ℚ`, the field of §§8.10, 8.14, 8.15 | description and README agree | — |

The rows of the previous reviews, of `314489c`, stand for every untouched statement; the diff changes none.

- **Description against the head, sentence by sentence.** Title equals the README's `# Roadmap:` heading. `CanonicalTower.general_data` and `CanonicalModel.general_minimal` are §§8.22 and 8.23 (README lines 2870, 2891). "CM reciprocity and Siegel existence, Hodge and abelian-type descent, … marked-conjugation route" are Layers 5, 6, 7 (lines 1425, 1765, 1925); "full, fixed-pairing, Γ₁ and coarse Γ₀" are §§8.10, 8.12, 8.14, 8.15. Conditional uniqueness, translation descent and disjoint reflex fields are §§4.10–4.12. The nine consumers named match "Downstream consumers" (line 2923). Folder contents are README, `Suggested.lean`, `metadata.toml`; the Lean imports `Mathlib` and one Tau Ceti module, no roadmap. The text presents the roadmap as new, which it is (3449 insertions, 0 deletions, no heading or declaration removed).
- **Suppliers named against suppliers cited.** Of the roadmaps in the merge order or on main that the README names, ten are on main and all ten are in the description's sentence; the ten still open (AlgebraicModuliForArithmeticGeometry, ComplexComparisonPartII, AbelianSchemesAndArithmeticModuli, InverseGaloisAndArithmeticFundamentalGroups, ArithmeticGaloisRepresentations, ArithmeticLocallySymmetricSpaces, NeronModelsAndSemistableAbelianVarieties, ModularCurvesPartII, AutomorphicSpectralTheory, GL2AutomorphicRepresentationsAndTransfer) are all in the merge-order chain the prose points to.
- Remark (no change asked): README line 889 names AffineMorseLefschetz A4.1 (on main, fibre-dimension theorem at its README line 965) as the semialgebraic statement the general fibre law specializes to; it is a comparison, not a prerequisite, so its absence from the description's supplier sentence is not a defect.
- **Gate.** My run on `314489c`: every counter 0, `OK`; the worker's run on the same head adds `build=0`.
- **Dependency check.** `depcheck: 247 roadmaps, 2245 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- **Elaboration.** `lake env lean` on `Suggested.lean` exits 0 with 27 warnings, all `declaration uses sorry`. The worker's signature file reports 0 of 39 declarations with a lost binder; file and pins are unchanged since the round that compared them with `#check @`.
- **Outside the folder.** `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/ShimuraVarieties'` is empty. Library declarations opened at the pin: 6 (`TauCeti/Geometry/RealAlgebraic/Semialgebraic/Dimension/Basic.lean:248`, `Closure.lean:47`, `Product.lean:49`, `Projection.lean:89`, `Manifold.lean:40` and `:72`), the names of README line 889.
- **Overlaps.** No other open pull request changes this roadmap, no cited id is dropped, none is defined only by an open revision; no roadmap in the list by results and headings.
- Overlap check: read LogicAndDefinabilityInNumberTheory, ShimuraData, ShimuraCompactifications; o-minimal structures and their dimension theory (the first, which cites §§3.4b–3.4e), pure data, special pairs and Hermitian components (the second), towers, Baily–Borel and canonical models (the third) are each owned by ShimuraVarieties and cited by the other.
- Source independence: changed passages only; 0 passages compared with 0 sources, because the folder did not change; arrangement not compared again (no layer added, removed or reordered).

## Not verifiable

- **This round's seeded sample** (0.4, 1.5, 2.7, 3.5, 4.6, 4.9b, 5.2, 5.4, 5.7, 7.0b, 7.9, 7.10, 8.13, 8.14, 8.18): falls in no changed passage, so it was not re-read against the sources; 8.14 enters only through the reflex-field row of the table.
- **The description's "AI assistance" sentence** (which models ran which author-side passes): a statement about the pull request's history, not checkable against the head.
- **Margulis 1977 and 1991, van den Dries 1998, and the settled `uncertified` sources** (van den Dries–Miller 1994, Clozel 1986, Platonov–Rapinchuk 1994): unchanged from the previous reviews.

## Source issues

- none

## For the human reviewers

- none
