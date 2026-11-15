# Answer to human review — CurvesOverFiniteFields (pull request head `ab3bbe0` → `0a47bd8`)

One comment (mycaule, 2026-11-15T20:33:34Z), one point. The cited repository was read at a fixed
commit: AxiomMath/Stacks at `c496df0d` (Apache-2.0). There, `StacksFrontier/AlgebraicGeometry/Curves/`
holds 779 files, which is the "(779)" of the comment.

## H01 (mycaule) — applied

The overlap is real and partial. 36 of the 779 files (`WeilBound/` 3, `ZetaFunction/` 13,
`BombieriStepanov/` 20) prove scheme forms of results this roadmap consumes, plus one Layer 1
lemma; the remaining files are general curve theory (nodes, stable and semistable models, linear
series, Riemann–Hurwitz, genus-one Weierstrass models) that the roadmap neither owns nor states.
Fix: the References bullet "Existing formalisations" (`TauCetiRoadmap/CurvesOverFiniteFields/README.md:1426`–1469)
now lists the folder at the pinned commit as a third proof source ("both Apache-2.0" → "all three
Apache-2.0"; "Neither states …" → "None of the three states Layer 1's polynomial theory beyond that
root symmetry, the bounds of 3.2–3.3 or a comparison with Tau Ceti's carriers"). It names four
declarations and the section each one bears on:

- `AlgebraicGeometry.WeilBound.abs_natCard_fieldValuedPoints_sub_le` (`WeilBound/WeilBound.lean`):
  `|#X(K) − #K − 1| ≤ 2g√#K` for a smooth proper geometrically irreducible curve and every finite
  extension `K`. This is the Hasse–Weil bound that Layer 3 consumes.
- `Stacks.BombieriStepanov.norm_eq_sqrt_of_smooth` (`BombieriStepanov/LowerBoundCurve.lean`):
  `‖α_i‖ = √q` from the point-count formula and the pairing `α_i α_j = q`. This is the Riemann
  hypothesis that 3.1 reads from FunctionFieldArithmetic §5.4.
- `Stacks.Zeta.exists_zeta_roots_of_isCurve` (`ZetaFunction/CurveZetaRoots.lean`): at most `2g`
  algebraic integers with `N_m = 1 + q^m − ∑ α_i^m` and `h_m = ∏(1 − α_i^m)`. These correspond to
  2.2 and 2.3.
- `Stacks.Zeta.roots_map_div_eq_of_coeff_symm` (`ZetaFunction/FrobeniusEigenvalues.lean`). This
  gives 1.4's `IsWeilSymmetric.aroots_map_div` once a nonzero `P` is divided by its leading
  coefficient.

No target is dropped and none is re-planned. An external repository is neither Mathlib, Tau Ceti
nor a roadmap, so it cannot be a supplier (`Suggested.lean` imports only Mathlib and Tau Ceti). The
README's "Porting existing work" section asks for exactly this treatment: cite the existing work in
a secondary provenance section.

## Additional gate repair (not a review point)

The gate reported `dropped=1` on a line that predates this round: line 91 named
`CohomologicalPointCounting`, which is on the never-cite list, in *Not owned here*. The phrase
"the `CohomologicalPointCounting` family," was deleted (`README.md:90`–91). The bullet still names
`WeilConjectures` and `DeligneWeightsAndPurity`, with unchanged meaning. Nothing else cites that
roadmap.

## Adversarial pass on the statements this repair adds

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| "all three Apache-2.0" | the three repositories | GitHub licence field: weil-conjectures `Apache-2.0`, AxiomMath/Weil `Apache-2.0`, AxiomMath/Stacks `Apache-2.0` | holds | — |
| Weil bound (`abs_natCard_fieldValuedPoints_sub_le`): `\|#X(K) − #K − 1\| ≤ 2g√#K`, every finite `K/k` | `g = 0`, `K = k` | the bound forces `#X(k) = q + 1`, matching `N_1(ℙ¹) = q + 1` (FunctionFieldArithmetic §5.1, quoted in 2.2) | holds; hypotheses read at the pin: `IsProper`, `Smooth`, `GeometricallyIrreducible`, `IsCurve` | — |
| RH (`norm_eq_sqrt_of_smooth`): point-count formula plus pairing `α_i α_j = q` gives `‖α_i‖ = √q` | `1.2.ac`, `q = 2`, roots `1 ± i` | `(1 + i)(1 − i) = 2 = q`; `‖1 ± i‖ = √2` | holds | — |
| Zeta roots (`exists_zeta_roots_of_isCurve`): `r ≤ 2g`, `N_m = 1 + q^m − ∑ α_i^m`, `h_m = ∏(1 − α_i^m)` | `ℙ¹` (`r = 0`); `1.2.ac`, `m = 1, 2` | `ℙ¹`: `N_m = 1 + q^m`, `h_m = 1` (empty product), matching Layer 2's Examples. `1.2.ac`: `N_1 = 1 + 2 − 2 = 1` and `h_1 = (−i)(i) = 1 = N_1`, matching 2.4's `h_F = N_1`. `m = 2`: `α² = ±2i`, `N_2 = 5`, `h_2 = (1 − 2i)(1 + 2i) = 5`, matching Layer 2's "`P^{(2)} = T² + 4`, `h = 5`" | holds; the README says "at most `2g`", as the pin states `r ≤ 2 * genus` | — |
| `roots_map_div_eq_of_coeff_symm` gives `IsWeilSymmetric.aroots_map_div` after division by the leading coefficient | monic `T² − 2T + 2`, `q = 2`; non-monic `2T² + 4`, `q = 2, g = 1`; `T² − 2`, `q = 2`; `T⁴ + T`, `q = 0` | `T² − 2T + 2`: `χ(0)χ_j = q^{2−j}χ_{2−j}` reads `2·2 = 4·1`, `2·(−2) = 2·(−2)`, `2·1 = 1·2`. `2T² + 4 → T² + 2`: `2·2 = 4·1`, `0 = 0`, `2·1 = 1·2`; roots `±i√2`, with `2/(i√2) = −i√2`. `T² − 2` meets their condition (`(−2)(−2) = 4`) but is not `IsWeilSymmetric` (`−2 ≠ 2`), so their hypothesis is the weaker one and the stated direction (theirs ⇒ ours) is the right one. `q = 0`: they require `q ≠ 0` and ours `0 < q`; the Lean signature (`signatures.md`) carries `0 < q` | holds | wording changed from "is … for monic `P`" to "gives … once a nonzero `P` is divided by its leading coefficient", because ours has no monic hypothesis |
| "None of the three states Layer 1's theory beyond that root symmetry, 3.2–3.3, or Layer 4" | code search of all of AxiomMath/Stacks | `Ihara` 0, `Weil polynomial` 0, `Mahler` 0, `Newton polygon` 0, `angle rank` 0, `maximal curve` 0, `Nat.sqrt`/`Int.floor` in `Curves/` 0. `Serre's bound`: 1 hit, Gabber's lemma for the étale site. `dickson`: 1 hit, Dickson's lemma. `supersingular`: a Drinfeld example and a trace-formula counterexample, with no polynomial predicate | holds | kept "3.2–3.3", not widened to 3.5, because 3.5 was not checked in the other two repositories |
| "rest of the folder is general curve theory …" | directory listing at `c496df0d` | `Node*`/`Nodal*`, `Stable*`, `Models/SemistableReduction/`, `LinearSeries*`, `RiemannHurwitz*`, `GenusOne/Weierstrass*` | holds | — |

Ownership: the repair adds no target, definition or construction, so no ownership check against
main or the open pull requests was needed. No source text was needed: the claim concerns a code
repository, read at its pinned commit. No `needs-references.toml` entry was made.

## Build, gate and direction check

- `Suggested.lean` is unchanged (`git diff ab3bbe02 -- …/Suggested.lean` is empty). The
  signatures in `scratch/signatures.md` therefore describe the current file: 37 declarations, 0
  with a dropped section binder. The one declaration the new text names,
  `IsWeilSymmetric.aroots_map_div`, elaborates to
  `∀ {q g} {P : ℤ[X]}, IsWeilSymmetric q g P → 0 < q → (P.aroots ℂ).map (q / ·) = P.aroots ℂ`,
  which matches the README claim. No new `#check` scratch file was elaborated, because only the
  build and gate commands are permitted here. That transcript also records one parse message
  ("line 308: unexpected token"), past the 306 lines of `Suggested.lean`, so it does not come from
  the module, which builds.
- `lake build TauCetiRoadmap.CurvesOverFiniteFields.Suggested`: `Build completed successfully (9076 jobs).`
  The only warnings are `declaration uses 'sorry'`.
- Gate (after commit `0a47bd8`):
  `gate CurvesOverFiniteFields: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`
  (the first run, before the commit, reported `dropped=1` and `dirty=1`; both are resolved above).
- Direction check: `depcheck: 240 roadmaps, 2243 edges, 0 problem(s)`, with no UPWARD, CYCLE or
  `moved:` line.
