# Review of QuadraticFormInvariants (pull request #1215 at 293f615)

**Verdict:** needs changes

This is an incremental re-review: 0 lines of `TauCetiRoadmap/QuadraticFormInvariants/` have changed since 7498694. The only change since then is in `TauCetiRoadmap/ClassFieldTheory/README.md`. The two P3 findings of the previous report are both about the pull request as a whole, and neither is repaired. The README and `Suggested.lean` have no defect.

## R01 (P3) — Four open pull requests change this folder, the heads conflict, and no merge order is stated

Previous R01, not repaired.

**Location.** The pull request's description, which is unchanged. Its title is "ClassFieldTheory: correct hypotheses, conductors and lifting", and it mentions neither QuadraticFormInvariants nor a merge order.

**Claim.** #617, #1411 and #1797 each rewrite this folder's `README.md` and `Suggested.lean` differently from this head. #1187 (the Tau Ceti bump) edits this `Suggested.lean`. All four are open. The overlap index lists each as conflicting with this head, and nothing says which pull request lands first.

**Witness.** This folder's `Suggested.lean` at the other heads:
- `theorem hilbertSymbol_mul` is at #617 (911db42) line 112, #1411 (5bfdf39) line 112 and #1797 (8709785) line 145;
- at #1187, line 2 imports `TauCetiRoadmap.ProfiniteCohomology.Suggested`.

This head has neither.

**Repair.** Add one paragraph to the description that says:
- what this pull request does to QuadraticFormInvariants: Tau Ceti carriers, the three names kept for OrthogonalSpinGroups, and the old → new list;
- that this pull request lands before #617, #1411 and #1797, and that each of those drops its QuadraticFormInvariants hunks or rebases onto this head;
- whether #1187 lands before or after this pull request. The later of the two rebases its edit of this `Suggested.lean`.

## R02 (P3) — An edit outside the pull request's named folders

Previous R02, not repaired.

**Location.** `Completed/LocalGaloisGroups/Suggested.lean` has 62 insertions and 50 deletions, for example `+import TauCeti.NumberTheory.ClassFieldTheory.Local.CohomologicalDimension.Strict` and `= ClassFieldTheory.artinMap K x` changed to `= TauCeti.ClassFieldTheory.artinMap K x`.

**Claim.** The pull request's folders are QuadraticFormInvariants, ClassFieldTheory and GlobalQuadraticForms. This file belongs to none of them, and the description does not mention it.

**Witness.** `git diff --stat origin/main...HEAD`, excluding the three folders, lists exactly this file. The file at main line 11 imports `TauCetiRoadmap.ClassFieldTheory.Suggested`, and the edit comes from commit 1abcd32 ("review repairs with consumers kept building").

**Repair.** Do one of the following:
- say in the description that this file is ClassFieldTheory's consumer repair for its renamed declarations, so that LocalGaloisGroups counts as one of this pull request's folders; or
- move the edit into a companion pull request that merges together with this one.

## Previous findings

- R01 — not repaired: the description is unchanged and states no order against #617, #1411, #1797 or #1187. All four are still open, have moved to new heads, and still conflict in this folder (now R01).
- R02 — not repaired: `Completed/LocalGaloisGroups/Suggested.lean` is still changed (62+/50−), and the description does not name it (now R02).

## Verified sound

**Gate.** The worker's gate at 293f615 passes every check, with `build=0`. My run gives 0 on every check except `outside-folder=4`. The four files are the `README.md` and `Suggested.lean` of ClassFieldTheory and of GlobalQuadraticForms, which the brief names as this pull request's own folders, so these four are not a finding. R02 rests on the diff, because the gate's `outside-folder` check does not cover `Completed/`.

**Build.** `lake env lean TauCetiRoadmap/QuadraticFormInvariants/Suggested.lean` exits 0 with no output. The file contains no `sorry`: the five headlines are `example`s or `theorem`s closed by the Tau Ceti declarations their docstrings name. `git diff 7498694 HEAD -- TauCetiRoadmap/QuadraticFormInvariants` is empty, so the r51 `#check @` comparison stands: 5 declarations, no lost binder.

**Dependency check.** Output: `depcheck: 236 roadmaps, 2274 edges, 0 problem(s)`. There is no UPWARD and no CYCLE line.

**The change outside the folder that this roadmap relies on.** This roadmap consumes ClassFieldTheory Layers 5 and 14 (README 94–100 and 331–343).
- The ClassFieldTheory diff since 7498694 does not touch Layer 5.
- In Layer 14 it adds only locators. The sentence "`QuadraticFormInvariants` consumes these comparisons and the product formula", and the declarations it names (`hilbertProductFormula`, `TauCeti.hilbertSymbol_productFormula`, the two `…_eq_hilbertSign` placewise comparisons), are unchanged. They still match README 56–60 and 331–343 here.
- I checked the new Layer 14 locators in `milne-cft`:
  - V Example 5.4 (line 8142) derives the product formula for the Hilbert symbol from Theorem 5.3(a), on printed p. 179 (line 8127). Theorem 5.3 starts at line 8123 on p. 178 and continues on p. 179, which matches "pp. 178–179".
  - VIII Theorem 4.2 (line 10937) is the exactness of `0 → Br(K) → ⊕_v Br(K_v) → ℚ/ℤ → 0` on printed p. 241 (line 10924).
  - V Theorem 5.5 (line 8152) is the existence theorem on p. 179.
- The rest of the ClassFieldTheory change, the Layer 13 principal ideal theorem route, names no object of this roadmap.

**Overlaps and citations.**
- I recomputed `roadmaps overlaps QuadraticFormInvariants`. It lists no id this README cites that an open pull request drops, none that only an open revision defines, and no id of this roadmap that this pull request drops and others cite. The four conflicting pull requests are R01.
- The two leads in `scratch/citations.md` resolve on main (3090489):
  - `LocalFieldsRamification.map_norm_unitFiltration_zero` is at `Completed/LocalFieldsRamification/Suggested.lean` line 857;
  - `ProfiniteCohomology.f2Pairing` is at `TauCetiRoadmap/ProfiniteCohomology/Suggested.lean` line 5332.

  Both are roadmap declarations, not pinned-library names.

**Seeded sample (13 targets).** All 13 are where r53 found them: README 1109, 1124, 1150, 1171, 1181, 1204, 1244, 1493, 1503, 1708, 1726, 1749 and 2437. None falls in a changed passage, because the folder has no diff, so the r46 locator verifications carry forward. The README flags no locator as unverified.

**Headlines and padding.** No declaration was added, removed or changed. The five headlines, as r46, r51 and r53 found them:
- Layer 2 four-fold TFAE;
- Layer 6D local classification;
- Layer 7C cup-norm;
- the Layer 9 Evens value and relative `w₂`.

They are stated and discharged at the pins. `hilbertSymbol`, `localHasse` and `hasseInvariant_eq_localHasse` are kept for the OrthogonalSpinGroups consumer on main.

**Duplication and ownership.** The change introduces no new object in this folder.

### Adversarial table

No statement of this folder changed. Rows 1–33 carry forward the rows of PRREVIEW-QuadraticFormInvariants~53, which carried rows 7–33 from r51 and r46. Rows 34–35 are this round's computations for the supplier text this roadmap relies on that changed, and for the build.

| # | Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|---|
| 1 | Serre Th. 1 read for `c` (r53 row 1) | `E = ℚ(∛2)` | `Q_E ≅ ⟨3,1,−1⟩`, `d_E = (−3)`; `w₂ = (3)(−1) = (2)(−3)` (both `−1` at 2, 3); `c = 0`; `C₀ ≅ (−3,1)` split | holds | none |
| 2 | Same, trivial and rank 2 (r53 row 2) | `ℝ³`, `ℝ⁴`, `ℚ(√3)`, `ℚ(i)` | `c = [ℍ]`; `c = [ℍ]`; `w₂ = (2)(3) ≠ 0` and `c = w₂`; `0 = (2)(−1)` | holds | none |
| 3 | Serre §1.2 names `w₂` the Witt invariant (r53 row 3) | `serre1984cmh` lines 47–56 | `w₂ = Σ_{i<j}(aᵢ)(aⱼ)`, `∏_{i<j}` convention | holds | none |
| 4 | Kahn's formulas are stated for `w₂` (r53 row 4) | `kahn1984` lines 50–56, 726–733, 763–786 | Delzant `w₂` is Hasse–Witt; Lemme II.2.1 has `(2,d)` | holds | none |
| 5 | Tau Ceti module documentation (r53 row 5) | `…/StiefelWhitney/Clifford.lean` lines 28–38, 89–103 | corrections `C(n−1,2)`, `C(n+1,4)` | holds | none |
| 6 | EKM exclusion locators (r53 row 6) | `ekm2008` lines 2948, 3381 | §10 at p. 55; Arf at p. 62 | holds | none |
| 7 | Local classification, 6D (r53 row 7) | `⟨1,1⟩` vs `⟨5,5⟩`, `⟨−1,−1⟩` over `ℚ₂`; `⟨1⁴⟩` vs `⟨(−1)⁴⟩` over ℝ | `s = +1 = +1`, isometric; `s = −1 ≠ +1`; ℝ has equal `(4,[1],+1)` but is not isometric, so nonarchimedean is needed | holds | none |
| 8 | Relative `w₂`, L9 (r53 row 8) | `ℚ₂(i)`, `a = 1+2i`; `ℚ₂(√5)`, `a = 1+√5`, `√5` | `(2)(5) = (2)(5)`; `(2)(5) = (2)(5)`; `0 = 0` | holds | none |
| 9 | Transfer discriminant (r53 row 9) | as row 8 | `[−5] = [−4]+[5]`; `[−5] = [5]+[−1]` | holds | none |
| 10 | Descended `w₁`, `w₂` (r53 row 10) | `⟨2,−10⟩ ≅ ⟨2,−40⟩`; `⟨1,−1⟩ ≅ ⟨2,−2⟩` | `(−20) = (−80)`; `0 = 0` | holds | none |
| 11 | Unramified symbol (r53 row 11) | `ℚ₃`, `Δ = 2`; `ℚ₂`, `Δ = 5, −3, 3` | `(2,3)₃ = −1`, `(2,9)₃ = +1`; `(5,2)₂ = −1`, `(5,3)₂ = +1` | holds | none |
| 12 | Supplier-table path (r53 row 12) | `OrthogonalGroup/Basic.lean` | exists at pin | holds | none |
| 13 | Consumers (r53 row 13) | Part II; main | imports `{1, 4, 7A, 7B, 9}`; three names kept | holds | none |
| 14 | `Suggested.lean` docstring (r53 row 14) | lines 23–31 | `formClass` is `TauCeti.formClass` | holds | none |
| 15 | Four-fold TFAE, L2 (r53 row 15) | `a = 1`; `(−1,−1)/ℝ`; `(2,5)`, `(5,5)/ℚ₂` | all true; all false; `5 = 5² − 5·2²`; `ω(5) = 1`, false | holds | none |
| 16 | Cup-norm, 7C (r53 row 16) | `a = c²`; `b = −a`; ℝ; `(2,5)/ℚ₂` | `0`; `0`; false both; nonzero iff `5 ≠ x² − 2y²` | holds | none |
| 17 | Evens value, L9 (r53 row 17) | `ℚ₂(i)`, `a = 1+2i`; `a = 1`; `√d` | `(2)(5) ≠ 0`; `(2)(−1) = 0`; `(2)(d)` both | holds | none |
| 18 | `hasseInvariant_eq_localHasse` (r53 row 18) | `n = 0, 1`; `⟨−1,−1⟩/ℚ₂` | `1 = 1`; `ε[ℍ] = −1 = (−1,−1)₂` | holds | none |
| 19 | `localHasse` Checks (r53 row 19) | `![a,−a]`; `![−1]`; `![−1,2]` | `+1`; `+1`; `s = +1`, O'Meara `−1` | holds | none |
| 20 | Quaternions central simple (r53 row 20) | `a` square or not | split when `a` is a square | holds | none |
| 21 | Binary congruence (r53 row 21) | `⟨2,−1⟩ ≅ ⟨1,−2⟩` | `1 = 1` | holds | none |
| 22 | `s(λq)`, `s(q⊥r)` (r53 row 22) | `n = 0` | ℕ junk exponent 0 vs value 1 | holds | none |
| 23 | Dimension ≤ 3 (r53 row 23) | rank 2; ℝ | `ac ∈ N(K(√−ab))` iff isometric | holds | none |
| 24 | Lam V.3.20 over ℝ (r53 row 24) | `⟨1ⁿ⟩`, `n = 1..8` | `B_n = 0,0,1,1,1,1,0,0`; `ℝ, M₂ℝ, ℍ, M₂ℍ, M₂ℍ, M₄ℍ, M₈ℝ, M₁₆ℝ` | holds | none |
| 25 | `c(q⊥r)` on `I²` (r53 row 25) | `⟨1⁴⟩ ⊥ ⟨1⟩` | `[ℍ] = [ℍ]·1` | holds | none |
| 26 | 6B defects over `ℚ₂` (r53 row 26) | `1, 5, −1, −5, 5/4` | `0, 4ℤ₂, 2ℤ₂, 2ℤ₂`; `δ(5/4) = 0` | holds | none |
| 27 | 6C Gram matrix (r53 row 27) | `{−1, 2, 5}` | `!![1,0,0;0,0,1;0,1,0]` | holds | none |
| 28 | 6D isotropy (r53 row 28) | `⟨1,1,1⟩`, `⟨1⁴⟩/ℚ₂` | `s = +1 ≠ (−1,−1)₂` | holds | none |
| 29 | Realization exceptions (r53 row 29) | `(1,[1],−1)`, `(2,[−1],−1)`, `(2,[1],−1)` | first two excluded; third is `⟨−1,−1⟩` | holds | none |
| 30 | Ramified-base control (r53 row 30) | `ℚ₂(√2)`, `a = 5` | `1 + π ≢ 1 mod π²` | holds | none |
| 31 | 6B case 3 (r53 row 31) | `ℚ₂(√2)` | `#𝒪ˣ/𝒪ˣ² = 8` | holds | none |
| 32 | `Pin⁺` (r53 row 32) | `t = (e₁−e₂)/√2` | `t² = I`; `(e₁t)⁴ = −I` | holds | none |
| 33 | ULift square, 7B.5 (r53 row 33) | transports | pullback along `absoluteGaloisGroupCongr`, `unitsCoeffCongr` | holds | none |
| 34 | Supplier ClassFieldTheory Layer 14, as consumed at README 56–60, 94–100, 331–343 (changed locators only) | `milne-cft` lines 8123–8150, 10923–10944 | Ex. 5.4: `∏_v (a,b)_v = 1` from Th. 5.3(a), p. 179; Th. 4.2: `0 → Br K → ⊕ Br K_v → ℚ/ℤ → 0`, p. 241; consumed declaration names unchanged on both sides of the diff | holds | none |
| 35 | Build of the five headlines | `lake env lean` on `Suggested.lean` at the pins | exit 0, 0 warnings, 0 `sorry`; folder diff since 7498694: 0 lines | holds | none |

## Not verifiable

- These sources are settled as uncertified in the manifest and are cited by locator only: Lam (2005), Gille–Szamuely (2017), O'Meara (1963), Milnor (1970), Serre *A Course in Arithmetic* and Serre *Local Fields*. No passage changed this round, so I re-read none of them.

## Source issues

- none
