# Review of OrthogonalTamagawaAndLatticeMass (pull request #1222 at e35529e)

**Verdict:** needs changes

This is an incremental re-review of the 4 lines changed since `215caed`, all in `README.md`. Previous findings R02 and R03 are repaired, and the repairs introduce nothing new. The branch-pin finding (previous R01) is unchanged and is held as R01 below. It is the only finding.

## R01 (P2) — The branch pins a Tau Ceti that lacks 17 of the 27 cited Tau Ceti files

Carried from R01 of the previous review, and held since the review of `be1d8b4`. No repair report marks it as not actionable.

**Location.** `lake-manifest.json` pins Tau Ceti `a91d3aa`. README line 28 reads: "§1.1 uses the integral compact-open family `TauCeti.QuadraticMap.OrthogonalCompactOpens.integral` of a basis (in `TauCeti/NumberTheory/QuadraticForm/OrthogonalGroup/Integral/CompactOpen.lean`)". Line 30 reads: "The rank-24 lattices of §4.2 are native: `TauCeti.RootfulNiemeierType` …".

**Claim.** The README's Tau Ceti citations exist at the pinned Tau Ceti.

**Witness.**
- The README cites 27 distinct `TauCeti/…lean` files. At `a91d3aa`, 17 are absent, among them:
  - `OrthogonalGroup/Integral/CompactOpen.lean` and `OrthogonalGroup/DoubleCoset/Basic.lean`, the two files §1.1's *Needs:* line (223) consumes;
  - the five `IntegralLattice/Rank24/` files;
  - `GroupTheory/Coxeter/Restriction.lean`.
- `leechLattice`, `RootfulNiemeierType`, `OrthogonalCompactOpens.integral` and `finiteAdelicSpecialOrthogonalDoubleCoset` are not declared anywhere at `a91d3aa`.
- At main's pin `2fd255d` all 27 files exist. For example, `integral` is at `Integral/CompactOpen.lean` line 71, `finiteAdelicSpecialOrthogonalDoubleCoset` at `DoubleCoset/Basic.lean` line 70, and `leechLattice` at `Rank24/Leech/Basic.lean` line 236.

**Repair.** Merge `origin/main` into the branch. The manifest then pins `2fd255d`. Neither `README.md` nor `Suggested.lean` needs an edit.
- `git merge-tree --write-tree HEAD origin/main` exits 0 at `origin/main` = `34f48ff`.
- The four Tau Ceti modules that `Suggested.lean` imports exist at both pins.
- `Suggested.lean` is unchanged since `215caed`.

The repair is outside the folder, so a folder-only repair round cannot make it. The author or the worker has to merge main. Rewriting the citations against `a91d3aa` is not an option: that pin has no carrier for §1.1's proper double-coset set or for the rank-24 lattices.

## Previous findings

- R01 — not repaired: `lake-manifest.json` still pins Tau Ceti `a91d3aafa8cd…`, and line 28 still cites `Integral/CompactOpen.lean` and `DoubleCoset/Basic.lean`, both absent there. Held as R01.
- R02 — repaired: line 221 reads "(Belolipetsky–Gan v2, §2, pp.2–3, for the indexing of a genus by these double cosets and the mass as a quotient volume in the totally definite case, under their standing assumption of dimension at least three)".
- R03 — repaired: line 28 now ends "(in `TauCeti/NumberTheory/QuadraticForm/OrthogonalGroup/DoubleCoset/Basic.lean`). Tau Ceti puts no Haar or Tamagawa measure on an adelic orthogonal group; the adelic quotient and its measure in §1.1's display are AdelicAlgebraicGroups AA.1–2's." `fullAdelicSpecialOrthogonal` no longer occurs in the folder.

## Verified sound

### Gate, dependency check and Lean

- **Worker's gate** (`gate.md`, at `e35529e`): `OK`. Every counter is 0, `build=0` included.
- **My re-run of the gate** on this head: also `OK` with every counter 0, `outside-folder=0` and `stray-files=0` included. As in the previous round, its line has no `build` field.
- **Folder contents.** `git diff --stat origin/main...HEAD` outside the folder is empty. The folder holds `README.md`, `Suggested.lean` and `metadata.toml`.
- **Dependency check** with `--movable`:

  ```text
  depcheck: 238 roadmaps, 2320 edges, 0 problem(s)
  ```

  It printed no UPWARD, CYCLE or moved line. Line 28's new pointer to AdelicAlgebraicGroups (merge order 52, before this roadmap at 149) adds no new supplier. AdelicAlgebraicGroups AA.1–2 is already on §1.1's *Needs:* line and in the supplier contract at line 58.
- **Elaboration.** `lake env lean` of `Suggested.lean` at the branch pins took 13 s. It printed exactly six warnings, `declaration uses 'sorry'`, at lines 130, 160, 167, 171, 175 and 179, the same as at `215caed`.
- **Binder audit.** `git diff 215caed e35529e -- Suggested.lean` is empty. `signatures.md` shows no dropped binder for the 21 declarations, so the earlier `#check @` audit stands.

### The changed passages

- **Line 28, "Tau Ceti puts no Haar or Tamagawa measure on an adelic orthogonal group".**
  - At `a91d3aa` and at `2fd255d`, no file under `TauCeti/NumberTheory/QuadraticForm` or `TauCeti/Topology/Algebra/RestrictedProduct` mentions `Measure`, `haar`, `MeasurableSpace` or `BorelSpace`.
  - At `2fd255d`, no file that mentions `OrthogonalCompactOpens`, `finiteAdelicSpecialOrthogonal` or `fullAdelicSpecialOrthogonal` mentions `Measure` or `haar`.
  - `OrthogonalGroup/` declares no `LocallyCompactSpace` or `MeasurableSpace` instance, so even Mathlib's generic Haar measure has no instance path to these groups.
  - The claim agrees with the `Suggested.lean` docstring (lines 21–23).
- **Line 28, "the adelic quotient and its measure in §1.1's display are AdelicAlgebraicGroups AA.1–2's".** Resolved at the AdelicAlgebraicGroups head `989a3a7`:
  - AA.1.1–1.2, "Affine points and integral models" and "Restricted-product realization" (README lines 1004 and 1156), give the adelic points with the point topology;
  - AA.2.2 *quotient-measure* (line 1853) gives the invariant measure on a coset space;
  - AA.2.3 "Rational quotients" (line 1886) applies it to a discrete subgroup with a finite-measure fundamental domain.
  
  This is the measure §1.1's display (line 217) names.
- **Line 28, the Tau Ceti names that remain.**
  - `OrthogonalCompactOpens.integral` (`Integral/CompactOpen.lean` line 71, at `2fd255d`) takes `Q.Nondegenerate` and a basis.
  - `finiteAdelicSpecialOrthogonalDoubleCoset` (`DoubleCoset/Basic.lean` line 70) is `DoubleCoset.Quotient` of the range of `finiteAdelicSpecialOrthogonalDiagonal` on the left by `integralSubgroup U.specialOrthogonal` on the right. That matches line 28's description.
  - These are exactly the Tau Ceti names on line 223.
- **Line 221, the Belolipetsky–Gan locator.** The text read is arXiv math/0307195v2 (BelolipetskyGan line 5).
  - §2 "Basic Notions" opens on printed p.2 (line 38).
  - The standing assumption d = dim V ≥ 3 is at lines 68–70. The source calls it a convenience of exposition.
  - The stabilizer K_L, the indexing of the genus by `G(F)\G(A_f)/K_L` and `L_α = V ∩ αL̂` are at lines 71–80, on p.2.
  - Page 3 begins at line 81. It gives `Γ_α`, the mass as Σ1/#Γ_α for totally definite q, and the mass as the volume of `G(F)\G(A)` for the measure giving `G(F⊗ℝ)×K_L` volume 1 (lines 83–99).
  - So "§2, pp.2–3" and "under their standing assumption of dimension at least three" are both correct.
  - Line 221's "No rank is excluded" rests on GeometryOfNumbersAndQuadraticArithmetic §3.3.4, at the unchanged head `3b084ef`; the previous review resolved it there. Rows N3–N4 below check the display in ranks 1 and 2.
- **Seeded sample.** Of the sampled targets, the diff touches only 1.1 (the locator above). The other sampled targets (0.0, 0.1, 0.1a, 0.2, 0.3, 1.2, 1.3, 1.4, 2.1, 2.2, 3.2, 4.1, 4.2, 4.3) are untouched, and their verification in the earlier reports stands.
- **Overlaps and citations.**
  - `overlaps.md` lists no other pull request that changes this roadmap and no dropped id. Its IntegralLattices "only an open revision defines" lines are false positives: on main, IntegralLattices has 7A (line 2833), 7B, assigned to this roadmap's §1.1 (line 83), 4B (line 2786), 2C (line 2868) and 7C (line 2884).
  - The one resolver lead in `citations.md`, `IntegralQuadraticLattice.ofCarrier`, is GeometryOfNumbersAndQuadraticArithmetic 2.2.1's name at `3b084ef`, as the previous review found. It is not a missing name.

### Adversarial table

Rows N1–N4 cover the changed statements and were computed this round. Rows 1–17 are carried from the previous report (`215caed`) for statements this head leaves untouched, with the values recorded there.

| # | Statement | Instances | Values on each side | Result | Change |
| --- | --- | --- | --- | --- | --- |
| N1 | Line 28: no Haar or Tamagawa measure on an adelic orthogonal group | Tau Ceti at `a91d3aa` and at `2fd255d` | files with `Measure`/`haar`/`MeasurableSpace`/`BorelSpace` under `NumberTheory/QuadraticForm` or `Topology/Algebra/RestrictedProduct`: 0 and 0. `LocallyCompactSpace`/`MeasurableSpace` instances under `OrthogonalGroup/`: 0 at `2fd255d`. The claim says none | True | none |
| N2 | Line 28: the adelic quotient and its measure are AA.1–2's | AdelicAlgebraicGroups at `989a3a7` | AA.1.2 restricted-product realization (line 1156); AA.2.2 *quotient-measure* (line 1853); AA.2.3 rational quotients (line 1886). Line 217 names "the quotient measure of AdelicAlgebraicGroups AA.2" | Consistent | none |
| N3 | Line 221: the source assumes dim ≥ 3, yet "No rank is excluded" (rank 1) | ⟨1⟩ | SO trivial, one double coset, Γ = 1. The display gives vol(pt)/(vol(pt)·1) = 1, and m⁺(⟨1⟩) = 1 | The display holds outside the source's range | none |
| N4 | The same, rank 2 | A₂, B = [[2,−1],[−1,2]] | one proper class, Γ = SO(A₂) of order 6, acting freely on SO(ℝ)×K_f⁺. The display gives vol(SO(ℝ))·vol(K_f⁺)/6 ÷ (vol(SO(ℝ))·vol(K_f⁺)) = 1/6 = m⁺ | Holds | none |
| 1 | §1.1 Check, A₂ (carried) | B = [[2,−1],[−1,2]] | \|SO\| = 6, m⁺ = 1/6; \|O\| = 12, m = 1/12; m⁺ = 2m | True | none |
| 2 | §1.1 Check, −23 genus (carried) | [[4,±1],[±1,6]], [[2,1],[1,12]] | 3 proper classes, each with \|SO\| = 2, so m⁺ = 3/2; m = 3/4; 2 O-double cosets | True | none |
| 3 | §1.1 stabilizer bullet (carried) | the class of [[2,1],[1,12]] | SO(M) = {±1}, weight 1/2; an O-stabilizer of order 4 gives 1/4 | True | none |
| 4 | §1.1 Check, I₃ rotation at 3 (carried) | [[3/5,−4/5],[4/5,3/5]] ⊕ 1 | det 1, v₃(5) = 0; the classes are distinct and the double cosets are equal | True | none |
| 5 | §1.1 Check, Q versus q (carried) | ℤ³ | Q(e₁) = 1/2, q(e₁) = 1 | True | none |
| 6 | §1.1, rank 0 and 1 (carried) | ∅, ⟨1⟩ | m⁺ = m = 1 in rank 0; m⁺ = 1, m = 1/2 in rank 1 | True | none |
| 7 | §1.1 display against §1.3 (carried) | I₃ | \|SO(ℤ³)\| = 24, m⁺ = 1/24 = 2·(1/48) | Consistent | none |
| 8 | §1.2, index 2 through 2.4.6 (carried) | 9 lattices | reflections in least-valuation vectors with q(v) = 2, 1, 14, 6, 26, 34, 9, 14, 28; det −1 and 2-integral | True | none |
| 9 | §1.2 gauge (carried) | n = 3 to 8 | s_nV_n = 4π², 16π⁴, 32π⁶/3, …, matching γ_G; ratio 1.000 | True | none |
| 10 | §1.3 unramified β_p (carried) | 10 lattice–prime pairs | β = 4/3, 4/5, 6/5, 6/7, 8/9, 24/25, 2/3, 6/5, 64/81, 64/81 by count and by formula | True | none |
| 11 | §1.3 convergence (carried) | n = 3, 4 | \|β_p⁻¹ − 1\| = O(p⁻²) | True | none |
| 12 | §1.3 `SameGenus` Check (carried) | [1], [9] | separated only at p = 3 | True | none |
| 13 | `Suggested.lean` docstring (carried) | both pins | no `Measure` on orthogonal adelic carriers | True | none |
| 14 | `genusMass_eq` (carried) | I₃; diag(1,1,2); A₃; E₈; n = 1, 2 | 1/48; 1/16; α₂ = 192; 1/696729600; n = 1 gives 1 against 1/2 | True; `3 ≤ n` needed | none |
| 15 | `evenUnimodularMass_eq`, `rank16_classNumber` (carried) | n = 8, 16; n = 0, 4 | M₈ = 1/696729600; M₁₆ = 691/277667181515243520000; n = 0 and 4 fail without the hypotheses | True | none |
| 16 | `rank24_classNumber`, rank-32/40 bounds (carried) | 23 rows + Leech; 2M₃₂, 2M₄₀ | the sum equals M₂₄; 80618465.87; 8.786·10⁵¹ | True | none |
| 17 | §§0.0–0.2, 1.4, 3.2, 4.1, 4.2 Checks (carried) | as in the earlier reports | Weyl orders 192, 51840, 2903040, 696729600; B₃₈; walls A₅, D₆; D₄⁶ factor 2160 | True | none |

### Headline inventory (unchanged since `9f4cf30`)

- **Stated:** `genusMass_eq`, `evenUnimodularMass_eq`, `rank16_classNumber`, `rank24_classNumber`, and the rank-32 and rank-40 lower bounds.
- **Named in the docstring as not statable:**
  - 0.1 Spin structure theorems;
  - 1.2–1.3 measure identities, with §1.1 explicitly without a headline;
  - 0.1a;
  - Cho's model (2.1–2.2);
  - 0.3;
  - 1.4.
- **Padding.** The declarations are unchanged, so the padding probe was not repeated. The earlier probe found no padding.

### Remark on untouched text (no change requested)

- The previous report's remark still applies once R01 is merged. Main's pin has `TauCeti.specialOrthogonalGroupVolume` (`TauCeti/Geometry/Euclidean/Volume/OrthogonalGroup.lean` line 426), which is §1.2's Vₙ, and it could be named in the From Tau Ceti contract.

## Not verifiable

- **Conway–Sloane, *Low-dimensional lattices IV*, equations (2), (3) and (6)** (§§1.2–1.3, untouched). The cached copy is an image-only scan, and this worker has no OCR. Earlier rounds checked the formulas numerically instead.
- **O'Meara 104:4–5.** The manifest records it as uncertified and settled.
- **Elaboration at main's pins.** This review's Lean command uses the branch pins. The Tau Ceti names valid only at `2fd255d` were checked by reading their source at that pin.

## Source issues

- none
