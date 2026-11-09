# Review of ComplexComparisonPartII (pull request #848 at 3cf1bed)

**Verdict:** needs changes

This is an incremental re-review of the 11 README lines changed since `6164bde` (8 added, 3 removed). All of them are in Worked example 2, at `TauCetiRoadmap/ComplexComparisonPartII/README.md:5059–5070`:

- the K3 parenthetical is gone;
- a closing sentence lists five controls, each said to fail exactly one clause of the description of `E`.

`Suggested.lean` is unchanged (`git diff --stat 6164bde HEAD` lists only the README), and no file outside the folder changed. The new sentence repairs the previous R02, and each of its five controls is correct (row N37). The previous R01 is still not addressed and is carried below.

## R01 (P2) — The frame-torsor bijection, the holomorphic exponential sequence and the `c₁` identification still have two owners across the open heads

**Location:** `TauCetiRoadmap/ComplexComparisonPartII/README.md:146`: "C5.4 is the single owner, on every complex manifold, of the holomorphic-to-smooth forgetful adapter, the frame-torsor bijection from holomorphic line-bundle classes to `H¹(M,O_M^×)`, the holomorphic exponential sequence with its cocycle `δu`". The same claim is at :89–93 and :5117–5121.

**Claim:** C5.4 is the only owner of these objects, and its consumers take them from C5.4.

**Witness:** ComplexKahlerGeometry #1234 at `682823d`, README :731–735, says that K4.P "owns … the holomorphic exponential sequence, the isomorphism `Pic_hol(M)≃H¹(M,𝒪×)`" and "supplies this segment … to ComplexComparisonPartII C5.4". Its :826 says the same. K3Surfaces #1285 at `920b522`, README :15–16 and :184, assigns this isomorphism to ComplexKahlerGeometry.

Today's `roadmaps list` index (2026-11-09T03:41:35Z) shows that #1234 (`682823d`), #1285 (`920b522`) and K3SurfacesAndSymplecticBoundedness #1375 (`c1d6da0`, README :13) all have the same heads as at the previous review. I re-read the cited lines at those heads and they are unchanged.

On main, ComplexKahlerGeometry has no K4.P and no exponential sequence: a grep of its README for `K4.P` or "exponential seq" returns nothing.

The pull-request description at this head still has no ownership paragraph. I found no repair report that marks R01 `not actionable in this package`: the board's reports folder holds only review reports, and the commit message of `3cf1bed` covers Worked example 2 only. The finding has been carried since r20.

**Repair:** unchanged from the previous review. Add this paragraph to the merge-order block of the pull-request description. No file in the folder needs to change. ComplexKahlerGeometry is a roadmap on main, and this roadmap cannot take K4.P from a revision of it, so C5.4 has to be the owner.

> **Ownership.** ComplexComparisonPartII C5.4 is the single owner, on every complex manifold, of `Pic_hol(M) ≃ H¹(M,O_M^×)` with its tensor, dual and pullback laws, the holomorphic exponential sequence and the identification of its connecting map with the integral first Chern class. ComplexKahlerGeometry on main states none of them. ComplexKahlerGeometry #1234 drops K4.P's ownership claim (README :731–735, :826) and reads isomorphism classes of K4's line bundles directly. K3Surfaces #1285 replaces `gap:integral-topology` (README :15–16, :184, :434) by a citation of C5.4. K3SurfacesAndSymplecticBoundedness #1375 re-points README :13 to C5.4.

**Tested** on the lines that refute the claim. With this paragraph, each of #1234 :731 and :826, #1285 :15, :184 and :434, and #1375 :13 is named together with the edit that makes it cite the one owner. If the repair job cannot edit the description, it should mark R01 `not actionable in this package` and give that reason. The board can then hand the finding to a human instead of carrying it to another round.

## Previous findings

- R01 — not repaired: README :146 still says "C5.4 is the single owner, on every complex manifold, of … the frame-torsor bijection". #1234 at `682823d` :731–735 still supplies that segment "to ComplexComparisonPartII C5.4". The description has no ownership paragraph.
- R02 — repaired: the K3 parenthetical is gone. README :5066–5067 now says "the dimension excludes `E × P¹`, which has `h¹(O) = 1`; the value of `h¹(O)` excludes `P¹` and a genus-two curve". Each control fails exactly one clause (N37).

## Verified sound

### Gate, dependency check and Lean

- **Gate.** My own run on `3cf1bed` exits 0, as the worker's `gate.md` also records:

  ```text
  gate ComplexComparisonPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
  ```

- **Dependency check** (`--movable`), in full. It prints no UPWARD, CYCLE or `moved:` line, and this roadmap is at `ORDER.txt:39`. The changed lines cite no supplier.

  ```text
  depcheck: 239 roadmaps, 2332 edges, 0 problem(s)
  ```

- **Elaboration.** `lake env lean` on `Suggested.lean` exits 0. The only warnings are four `declaration uses sorry`, at :116, :127, :154 and :172.
- **Signatures.** I elaborated the four `#check @` lines in one scratch file; it exits 0. The binders `[FiniteDimensional ℂ E]` (`montelTheorem`), `[CompleteSpace F]` (`schwartzFiniteness`), `IsManifold (modelWithCornersSelf ℂ E) ⊤ M` (`holomorphicPoincare`) and `LocallyContractibleSpace ↑T` (`nonempty_sheafSingularComparison`) each appear in the elaborated type. The types match `scratch/signatures.md`. Nothing changed.
- **Unchanged Lean file.** The account from r20 carries: 4 of the 67 headline targets are stated, the other 63 are named in the docstring with the carrier each lacks, and the one-tactic probes close none of the four.
- **Outside the folder.** `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/ComplexComparisonPartII'` is empty.
- **Hygiene of the 11 lines.** They contain no process word, pull-request number, LaTeX, locator or copied passage. The equation `y²z = x³ + x²z` is Unicode inside a code span. None of the 39 leads in `scratch/citations.md` falls on lines 5057–5073. `scratch/overlaps.md` lists no dropped id and no other pull request that changes this roadmap.

### Changed passage

- **Consistency with the rest of the README.** The nodal cubic `y²z = x³ + x²z` is the homogenization of `y² = x²(x + 1)`, which §C-1 Examples (:2008) also uses as its non-smooth control and which C5.2 Examples (:3406) excludes from the de Rham comparison. The rank-one `H¹` of the nodal cubic is set against the example's rank-two `H¹(E^an, ℤ)`, in the same sentence. Removing the K3 sentence leaves nothing dangling: no other line refers to the parenthetical.
- **Untouched lines that depend on the passage.** The conclusions of the example (:5061–5064) still follow from the description. Serre duality gives `h⁰(Ω¹) = h¹(O) = 1`, and `F¹H¹_dR = H⁰(Ω¹)`. This agrees with C5.3 Examples (:3925).
- **The names it cites** are unchanged: `properDeRhamBetti`, `kaehlerHodgeDecomposition`, `multiplicativePeriodInterface` and `familyMorphismInterface`. They resolved in earlier rounds, and the gate reports `readme-ids-missing=0`.
- **Remark, no change requested.** The sentence gives no control for properness or for the marked point, and claims none. Over `ℂ`, the marked point only chooses an origin. A separated finite-type smooth connected curve with `h¹(O) = 1` is affine unless it is proper, so properness also follows from the other clauses.

### Ownership against open pull requests

At their heads in today's index, I resolved:

- ComplexKahlerGeometry #1234 (`682823d`) and #1398 (`1038b16`);
- K3Surfaces #1285 (`920b522`) and K3SurfacesAndSymplecticBoundedness #1375 (`c1d6da0`);
- GeometricQuantization #1186 (`be6ed5f`).

The heads of #1807 (`64a16e1`), #1808 (`a96d197`) and #1854 (`30817b1`) are unchanged since r26. Only #1234 and #1285 conflict (R01).

### Seeded sample

None of the fifteen seeded targets falls on a changed line, and the changed lines carry no locator. The locator checks of the seeded targets in r20, r21 and r23–r25 carry.

### Adversarial table

New row, computed this round:

| # | Statement (changed) | Instances | Values computed | Result |
| --- | --- | --- | --- | --- |
| N37 | Worked example 2 controls, :5065–5070. The clauses are proper (Pr), smooth (Sm), connected (Co), dimension one (D1), `h¹(O) = 1` (H1) and a `ℂ`-point (Pt). | `y² = x³ − x` with `∞`; `E × P¹`; `P¹`; `y² = x⁵ − 1`; `E ⊔ P¹`; `y²z = x³ + x²z` | **Elliptic curve:** all six hold; `h⁰(Ω¹) = 1`; `H¹ = ℤ²`. **`E × P¹`:** Künneth gives `h¹(O) = 1·0 + 1·1 = 1`; dimension 2; fails D1 only. **`P¹`:** `h¹(O) = 0`; fails H1 only. **Genus two:** `h¹(O) = 2`; fails H1 only. **`E ⊔ P¹`:** dimension 1; `h¹(O) = 1 + 0 = 1`; two components; fails Co only. **Nodal cubic:** singular only at `(0,0)`, with tangent cone `y² = x²`; `[0:1:0]` is smooth (`∂F/∂z = −1`); `h¹(O_C) = h²(O_P²(−3)) = h⁰(O_P²) = 1`; fails Sm only. Its normalization `t ↦ (t² − 1, t(t² − 1))` sends `t = ±1` to the node, so `C^an ≃ S² ∨ S¹`, `H¹ = ℤ` (rank 1 ≠ 2) and `χ = 1` | Each control fails exactly the clause the text names, and the nodal cubic shows the conclusion fails without smoothness. Holds (previous R02 repaired) |

Rows carried from `PRREVIEW-ComplexComparisonPartII~26.md`, and the reviews it cites, for statements this diff leaves untouched:

| Row | Statement | Key values |
| --- | --- | --- |
| N33 (r26) | Worked example 2 carrier, :5059–5061 | dim 1; `h¹(O) = 1`; `H¹ = ℤ²` with form `[[0,1],[−1,0]]` (det 1); the Fermat quartic has `h¹(O) = 0` and `p_a = 1` |
| N34–N36 (r26) | Headings :862 and :886; ResolutionOfSingularities bullet | 4 of 4 and 8 of 8 bullets classified; §5.1 at :791, §6.2 at :893; ORDER position 18, before 39 |
| N28–N30, N32 (r25) | `monodromyFunctor`; UniversalCovers; C5.4 metric; `topologicalCoefficientComparison` | the fibre of `z ↦ z²` is `{1, −1}`; the doubled origin has `π₁ = 1`; `M([0,1]) = c`; `H⁰ = 0` for monodromy `−1` over `𝔽₃` |
| N25–N27 (r24) | G1 test forms; UniversalCovers Stages 0–2; `riemannExistence` | `rank V_1 = 2` on `ℝ²`; deck group `ℤ/n`; `ℂ[ε]/(ε²)` gives `FinSet` |
| N19, N21–N23 (r23) | RealAlgebraicGeometry; HF3a; DerivedDeRham; Crystalline | 5 cells for `X² − 1`; `H¹_c(ℝ,𝔽₃) = 𝔽₃`; `d(x^p) = 0` over `𝔽_p` |
| N16–N18 (r22), N1–N13 (r21) | ModularCurves §0B; C-1, C1 and C6 examples | `(ℤ/n)ᴰ ≅ μ_n`; `H¹(ℂ*,ℤ/n) = ℤ/n`; `h⁰(O(−1)) = 0` |
| 1–4 (r20) | the four `Suggested.lean` headlines | `ℓ²` refutes Montel without `FiniteDimensional`; `h = −id` on `ℓ²`; `(z₁dz₂ − z₂dz₁)/2`; the Warsaw circle |
| 11 (r20, r24) | `realComplexCurrentComparison` signs | `(−1)^(2−2+1) = −1`; `(−1)^(2−1+1) = +1` |
| 20 (r20) | C5.4 bijection (R01) | `δ[O(1)] = +1`; Enriques `δ[K]` is nonzero 2-torsion; `[O(p−q)] ≠ 1` with `δ = 0` (:3879) |
| 5–19, 23–29 (r20) | seeded targets and C1–C5 targets | as tabulated in r20 |

## Not verifiable

These are carried from r20–r26. No changed line cites a source.

- **Kato**, *Logarithmic structures of Fontaine–Illusie* (C5.5): no legal copy found.
- **Dimca**, *Sheaves in Topology* (part of `topologicalCoefficientComparison`): paywalled (Springer).
- **Hironaka**, *Triangulations of algebraic sets*, and **Bochnak–Coste–Roy**, Thm. 9.2.1 (part of `complexAlgebraicTopology`): no open host found.
- **Kleiman's published numbering "9.6.16"** (C3.2e): the AMS chapter is paywalled. The arXiv Theorem 6.16 was verified in r20.

## Source issues

- none
