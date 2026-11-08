# Review of RiemannianGeometry (pull request #1683 at 0304eae)

**Verdict:** needs changes

Incremental re-review of the 6 lines changed since `843fbeb` (the head the previous review read): the change rewrites one Check of R4.6 (`TauCetiRoadmap/RiemannianGeometry/README.md:1280–1287`), exactly as the previous R01 asked; `Suggested.lean` is byte-identical to the previous head and no file outside the folder changes. The previous R01 is repaired and the repair introduces nothing. The previous R02 (no stated order between the conflicting pull requests) is unrepaired and is written again below. One P3; nothing blocks.

## R01 (P3) — Two open pull requests change this folder and conflict with this head, and no order is stated

Re-raised: H02 (the repair's answer that the pull-request description is not editable from a repair job). The reason does not settle the finding: the overlap rule asks for a stated order between conflicting heads, and the description is the author's to edit, whoever runs the repair.

**Location.** The pull-request description (`scratch/pull-request.md`, data), which names neither #1327 nor #1187 and states no order; `TauCetiRoadmap/RiemannianGeometry/README.md` and `Suggested.lean` (the conflicting files).

**Claim.** The overlap index of 2026-11-08 (`scratch/overlaps.md`, computed from the heads) reports that #1327 (`RiemannianGeometry: curvature polarization and harmonic conventions`) conflicts with #1683 in `README.md` and `Suggested.lean`, and that #1187 (`chore: bump TauCeti to ab00ba392`) conflicts in `Suggested.lean`, `lake-manifest.json` and ten other files.

**Witness.** `scratch/overlaps.md`, "Other open pull requests that change this roadmap", both bullets. At today's heads every one of the 20 declarations of #1327's `Suggested.lean` is declared in #1683's under the same name, and #1683 declares 10 more (`einstein_factor_constant`, `fischer_decomposition`, `fischer_split`, `myers_finite_fundamentalGroup`, `paraboloidGraph`, `paraboloid_geodesic_crossings`, `paraboloid_vertex_pole`, `polynomialLaplacian`, `squaredRadius`, `two_distinct_geodesics`), so #1683 contains #1327 and the order is determined, only unstated.

**Repair.** Add one sentence to the pull-request description: "#1327 is rebased on this pull request before either merges (every declaration of its `Suggested.lean` is here under the same name); #1187's pin bump re-targets `Suggested.lean` after whichever merges first." No change to the folder.

## Previous findings

- R01 — repaired: `README.md:1280–1287` now reads "the critical values of `exp_p` are p and its antipode: `|v|=π` maps to the antipode and `|v|=2π` back to p, each with singular differential, so the set is two points"; it agrees with the definition at `:1216–1217` and its values check (table below).
- R02 — not repaired: the description still names neither #1327 nor #1187 and states no order; written again as R01 above.

## Verified sound

### The change set

| Passage | What was checked | Outcome |
|---|---|---|
| R4.6 S² Check, `README.md:1280–1287` | On unit S², `exp_p(v) = cos|v|·p + (sin|v|/|v|)·v`, so `|v| = π` gives −p, `|v| = 2π` gives p, `|v| = 3π` gives −p again. For `w ⊥ v`, `d(exp_p)_v w = (sin|v|/|v|)·w`, zero at `|v| = kπ`; for `w ∥ v` the differential is `−sin|v|·p + cos|v|·v/|v|`, never zero; so the kernel has dimension n−1 = 1 at every `|v| = kπ`, k ≥ 1, and the differential is singular there, as the Check says. The critical values are exactly {p, −p}: two points. The Jacobi field `sin(t)·E(t)` along a unit-speed great circle vanishes at t = π, so the antipode's conjugate multiplicity is n−1 = 1, as the Check and the third Check (`:1270–1271`) say. A two-point set is `TauCeti.IsNullSet` in every chart and has Riemannian volume zero, so the Check's conclusion (nullity records neither multiplicity nor the return) holds. | correct; agrees with `:1216–1217` and with the Sⁿ Check |
| The rest of the item, `:1216–1233`, `:1289–1292` | Unchanged since the previous head; the definition "conjugate values of p are the critical values of `exp_p`" is what the new Check instantiates, and the `*Needs:*` line is unchanged. | consistent |

### Gate, direction, folder, elaboration

The worker's gate at this head is all-zero with `build=0 OK`. My own run: `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=2 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0`, build passing. The `dropped=2` (`README.md:271` "the Bott-chain constructions in HomotopySpheres Stage 4B", `:1052` "HomotopySpheres.") comes from this reviewer's local dropped-names list, which the worker's gate does not apply; both lines are unchanged since `843fbeb`, are outside the diff, and are on main's README (`:165`, `:605`, there with links), where the first says R3 does not need that material and the second leaves stable homotopy calculations to that roadmap: neither is a supplier citation. The worker's gate is the record: it passes. The dependency check:

```text
depcheck: 243 roadmaps, 2457 edges, 0 problem(s)
```

No UPWARD or CYCLE line. `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/RiemannianGeometry'` is empty. The folder holds `README.md`, `Suggested.lean`, `PROGRESS.md`, `STATUS.md`, `metadata.toml`.

`lake env lean` on `TauCetiRoadmap/RiemannianGeometry/Suggested.lean` from the pull-request worktree, twice: exit 0 in 33 s, exactly 23 `declaration uses sorry` warnings (lines 70, 79, 90, 117, 129, 142, 165, 188, 199, 234, 251, 261, 272, 282, 313, 323, 335, 363, 393, 414, 444, 469, 478) and no other output. The file is byte-identical to the previous head (`git diff 843fbeb..HEAD` on it is empty), so the previous reports' one-tactic probe (23 declarations still admitted, no padding) and `#check @` comparison of all 29 elaborated types with the README stand. The worker's signature extraction failed on a missing object file in a shared lake directory, not in this worktree, where every imported Tau Ceti object file is present and the gate's targeted build passed.

### Seeded sample

None of the five sampled targets (1.1, 1.2, 1.3, 2.1, 2.2) falls in the changed lines; their locators were verified in the previous reports (Andrews Prop. 16.2.1 at `andrews-dg-ch16 line 105–106`; Nicolaescu Prop. 4.1.25 at `nicolaescu-lectures line 6793–6795` and Def. 4.1.23 at `line 6772`; Brewin `brewin-rnc line 363` and `line 614`; O'Neill 1966 Thm 2/Cor. 1 and Milnor §14 Lemma 14.4 under settled uncertified keys). The changed lines cite no source.

### Adversarial table

Rows for untouched statements carry forward from the previous report (`PRREVIEW-RiemannianGeometry~13`, "Adversarial table", itself carrying `~12`); the last row is the changed statement.

| Statement | Instances | Values on the two sides | Result |
|---|---|---|---|
| `constant_sectional_tensor_iff`, `schur`, `einstein_factor_constant` | previous reports | `K=−2−4x²`, factors 2 and 1/2 on `S³ ⊔ S³(2)` | carried |
| `IsJacobiFieldOn`, initial data | previous reports | residuals 0, 0, `2E` | carried |
| `modelSine`, `rauch_norm_ge_of_sectional_le` | previous reports | `(5/2)sin(2t/5)` vs `sin t`: `1 ≤ 1.4695` at `π/2` | carried |
| `modelBallVolume`, `bishopGromov` | previous reports | `2π(1−cos r)/r² = 2.8884, 2.2245, 1.2732` | carried |
| `cartanHadamard_isCoveringMap`, Bonnet–Myers, Synge, Killing–Hopf, closed geodesics | previous reports | `π√(2/2)`, `RP²`/`T²`/`RP³` dispositions | carried |
| paraboloid headlines, `riemannianDist_eq_sSup_smooth`, Fischer, Weitzenböck, R3/R4.9/R5a/R8.5 Checks | previous reports | `T_1(2)=5.0979`, `Δr⁴=20r²`, `p(n−p)=4,6,9` | carried |
| R4.6 transfer and flat-torus Check | previous report | ℝⁿ identity chart, density 1; torus cut locus length 2, area 0 | carried |
| R6 Euclidean genericity | previous report | Jacobian `1−t`: 0.5, 0, −1 at t = 1/2, 1, 2 | carried |
| R4.6 Check: unit S² critical values of `exp_p` (changed) | `|v| = π, 2π, 3π`; `w ⊥ v` and `w ∥ v` | images −p, p, −p; `d(exp_p)_v w = (sin|v|/|v|) w = 0` for `w ⊥ v`, nonzero for `w ∥ v`: kernel dimension 1 = n−1 at each; critical values {p, −p}, two points; Jacobi field `sin t` vanishes at π: multiplicity 1; two points are null in every chart and of volume 0 | correct |

### Ownership and citations

- The changed lines cite only this roadmap's own definition (`:1216–1217`) and pinned Tau Ceti names already verified at main's pin `2fd255d9` in the previous report (`TauCeti/Geometry/Manifold/Sard/EqualDimension.lean:105`, `Measure.lean:36`, `VolumeDensity/Measure.lean:117`). The citations tool found no unresolved citation or Lean name.
- Overlaps: no id this README cites is dropped by an open pull request, no id this pull request drops is cited elsewhere, and no id depends on an open revision (`scratch/overlaps.md`); the two conflicting heads are R01. The closest open roadmaps in vocabulary (RicciFlow #1023, PositiveMass #956, CalibratedGeometry #946) are consumers named in the scope; Poincare3D #1740 and ManifoldOptimization #1506 are not among the checkouts given, so ownership against them was not checked, nor against #1187.

## Not verifiable

- **O'Neill 1966**, **Milnor, Morse Theory**, **Fulton–Harris**, **Lee, Introduction to Riemannian Manifolds**: settled uncertified keys, cited by locator only; none is cited in the changed lines.
- The head of **#1187** is not among the checkouts given to this review (its conflict rests on the overlap index alone); #1327 was read through the roadmaps tool.

## Source issues

- none
