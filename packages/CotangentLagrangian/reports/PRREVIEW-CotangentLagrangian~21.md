# Review of CotangentLagrangian (pull request #1651 at 4347340)
Folder: `TauCetiRoadmap/SymplecticGeometry/CotangentLagrangian/`
**Verdict:** accepted

No finding. Both findings of the previous review are repaired, the repairs introduce no new problem, and the gate passes. This folder is ready for a human's final approval.

## Previous findings

- R01 — repaired: `README.md:352`–353 now reads "H₁=π₁^ab by Tau Ceti's degree-one Hurewicz isomorphism for a path-connected space (`TauCeti.HurewiczOne.hurewiczHomologyAddEquiv`)"; SmoothBundlesConnections B6.1 is no longer cited (B1 at :347 and B2–B4 at :705 stay).
- R02 — repaired: `README.md:135`–137 now reads "the dimension counts, for a map with an injective differential at some point, `2 dim N ≤ dim M` when it is isotropic and `2 dim N = dim M` when it is Lagrangian, and `dim M ≤ 2 dim N` for coisotropic maps from a nonempty source, with no injectivity hypothesis".

## Verified sound

:robot: AI review. **Incremental re-review** of the 9 lines changed in the folder since `c1e867d` (5 insertions, 4 deletions, all in `README.md`; `Suggested.lean` is byte-identical to the head the previous review read). No pull-request file was edited.

**Scope and pins.** HEAD `43473404`; pins unchanged from the previous review (Tau Ceti `2fd255d9`, Mathlib `1b1ccf4b`). The folder holds `README.md` and `Suggested.lean` only. The prescribed exclusion diff prints nothing outside the three folders the pull request owns. The other file changed since `c1e867d`, `ConvexityToric/README.md`, is the pull request's own and has its own review; its diff does not mention this roadmap or any of its section ids.

**The two changed passages, checked at the pin (4 declarations opened).**
- `TauCeti/AlgebraicTopology/Homotopy/Hurewicz/One/Basic.lean:705`, `TauCeti.HurewiczOne.hurewiczHomologyAddEquiv [PathConnectedSpace X] (x : X) : Additive (Abelianization (FundamentalGroup X x)) ≃+ ((singularChains ℤ).obj X).homology 1`, with `X : TopCat.{0}` (:77). This is the statement the sentence uses, and the README states its one hypothesis (path-connectedness); the Heisenberg-lattice quotient times a circle is connected. What the declaration does not include: coefficients other than ℤ and any comparison with de Rham cohomology, which the same sentence takes from DifferentialGeometry Layer 8, as before.
- `TauCeti/Geometry/Symplectic/Lagrangian/Manifold.lean:258` `IsIsotropicMap.two_mul_finrank_le` and :265 `IsLagrangianMap.two_mul_finrank` both assume `hx : Function.Injective (mfderiv J I f x)` at one point `x`; :272 `IsCoisotropicMap.finrank_le_two_mul_finrank` takes a point `x : N` and no injectivity (its docstring says so). The README sentence now matches all three, hypothesis for hypothesis.
- No new cross-roadmap edge: the changed sentence removes one citation of SmoothBundlesConnections and adds a pinned-library citation. The roadmap still consumes the Hurewicz isomorphism rather than stating it; DGFloer's extension of it is untouched.

**Gate and dependency check.** The worker's gate at this head: every counter zero, `build=0`, OK. My run of the prescribed gate: every content counter zero; `outside-folder=4` lists only the two `ConvexityToric` and two `IntegrableSystems` files, which the brief names as the pull request's own. Dependency check output: `depcheck: 234 roadmaps, 2265 edges, 0 problem(s)`; no UPWARD or CYCLE line.

**Elaboration.** `lake env lean` on `Suggested.lean`: exit 0, eight warnings (lines 183, 217, 246, 263, 281, 303, 340, 359), all `declaration uses sorry`. The file is unchanged, so the `#check @` comparison of the 11 declarations and the one-tactic padding probe of the previous report (all eight theorems resist `rfl | simp | infer_instance | trivial`) stand.

**Headlines.** Unchanged: the eight stated theorems and the five named as not statable, as listed in the previous report. The Kodaira–Thurston example remains named in the docstring (`Suggested.lean:122`) with its missing carrier; the repair of R01 changes its route, not its statability.

**Sources.** The seeded sample (fixed points and finite iterates; chains of generating functions; convex planar billiards; finite-volume recurrence; neighborhood germs with prescribed ambient derivative) falls entirely outside the changed passages; the previous report verified each at its locator in `CannasDaSilvaLSG` (Prop. 5.1 line 1300, Prop. 5.2 line 1331, §5.2 lines 1361–1418, Thm. 5.3 line 1420, Thm. 8.4 line 1974) and those passages are untouched. The changed passages cite no external source.

**Overlaps.** One lead: #1187 (pin bump) conflicts in this folder's `Suggested.lean`; the description's merge-order block orders this pull request first in `CotangentLagrangian`. No cited id is dropped, none is defined only by an open revision, and this pull request drops none.

**Adversarial table.** Rows for the changed passages are recomputed; the other 30 rows are carried forward unchanged from the previous report (review at `c1e867d`, "Adversarial table"), whose statements this diff does not touch.

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| Isotropic count, as now stated (`README.md:135`–136) | constant `ℝ³ → (ℝ², dq∧dp)`; inclusion of the `q`-axis `ℝ → ℝ²`; `id : ℝ² → ℝ²` | constant: differential 0, not injective, so excluded (it would give `6 ≤ 2`); axis: injective, isotropic, `2·1 = 2 ≤ 2`; identity: injective but `ω(∂q,∂p) = 1 ≠ 0`, not isotropic | true with the hypothesis, false without | none |
| Lagrangian count (`README.md:136`) | `q`-axis in ℝ²; constant `ℝ⁰ → ℝ²` | axis: `2·1 = 2`; point: image 0 is isotropic but `0^ω = ℝ² ≠ 0`, not Lagrangian, and `2·0 ≠ 2` | equality holds exactly on Lagrangian maps | none |
| Coisotropic count without injectivity (`README.md:137`) | `ℝ³ → ℝ²`, `(x,y,z) ↦ (x,y)`; empty source into ℝ² | projection: image ℝ², `(ℝ²)^ω = 0 ⊆ ℝ²`, coisotropic, differential not injective, `2 ≤ 6`; empty source: vacuously coisotropic with `2 > 0` | true with a point, false for the empty source; "nonempty" stated | none |
| `H₁ = π₁^ab` for Kodaira–Thurston (`README.md:351`–353) | Heisenberg lattice × ℤ; `T⁴`; non-example `S¹ ⊔ S¹` | lattice: commutator subgroup = centre ℤ, abelianization `ℤ² × ℤ = ℤ³`, `b₁ = 3` odd; `T⁴`: ℤ⁴, `b₁ = 4` even; two circles: `π₁^ab = ℤ` at any base point but `H₁ = ℤ²` | path-connectedness needed and stated | none |
| Generating function, chain dictionary, billiards, recurrence, relative Moser and Darboux, prescribed derivative, Weinstein, coisotropic, conventions (30 rows) | as in the previous report | as in the previous report | carried forward | none |

## Not verifiable

- Nothing: the changed passages cite only pinned declarations, both opened at the pin.

## Source issues

- **Misprint** in CannasDaSilvaLSG at §5.2, printed p. 32: the source says the cyclic sum of the generating function equals the sum of the side lengths; it should be minus that sum, since the generating function is minus the chord length; affects nothing.
