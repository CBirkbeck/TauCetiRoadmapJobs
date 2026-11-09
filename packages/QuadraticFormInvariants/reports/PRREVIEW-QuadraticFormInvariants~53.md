# Review of QuadraticFormInvariants (pull request #1215 at 7498694)

**Verdict:** needs changes

This is an incremental re-review of the 28 README lines changed since 8f8c72c. The repair of the previous R03 is correct: the Grove, O'Meara 1955 and Fröhlich citations are gone, and the new Serre and EKM locators check out against the texts. The new sentence about the Tau Ceti module documentation is true at the pin. The README and `Suggested.lean` have no defect. Two P3 findings remain, both about the pull request as a whole; neither is in this folder's text.

## R01 (P3) — Four open pull requests change this folder, the heads conflict, and no merge order is stated

Previous R01, not repaired.

**Location.** The pull request's description, which is unchanged. Its title is "ClassFieldTheory: correct hypotheses, conductors and lifting". It mentions neither QuadraticFormInvariants nor a merge order.

**Claim.** #617, #1411 and #1797 each rewrite this folder's `README.md` and `Suggested.lean` differently from this head. #1187 (the Tau Ceti bump to `ab00ba392`) edits this `Suggested.lean`. The overlap index lists all four as conflicting with this head, and nothing says which pull request lands first.

**Witness.** `Suggested.lean` at the other heads:
- #617 (066ccf5): `export TauCeti (RegularFormClass formClass)` at line 73, `theorem hilbertSymbol_mul` at line 112;
- #1411 (6819093): `export TauCeti (formClass)` at line 62, `theorem hilbertSymbol_mul` at line 123;
- #1797 (2654a44): `export TauCeti (RegularFormClass formClass)` at line 64, `theorem hilbertSymbol_mul` at line 145.

This head declares neither.

**Repair.** Add one paragraph to the description saying:
- what this pull request does to QuadraticFormInvariants: Tau Ceti carriers, the three names kept for OrthogonalSpinGroups, and the old → new list;
- that it lands before #617, #1411 and #1797, which drop their QuadraticFormInvariants hunks or rebase onto this head;
- whether #1187 lands before or after this pull request, with the later of the two rebasing its edit of this `Suggested.lean`.

## R02 (P3) — An edit outside the pull request's named folders

Previous R02, not repaired.

**Location.** `Completed/LocalGaloisGroups/Suggested.lean`, with 62 insertions and 50 deletions.

**Claim.** The pull request's folders are QuadraticFormInvariants, ClassFieldTheory and GlobalQuadraticForms. This file belongs to none of them, and the description does not mention it.

**Witness.** `git diff --stat origin/main...HEAD`, excluding those three folders, lists exactly this file. On main the file imports `TauCetiRoadmap.ClassFieldTheory.Suggested`, so it is ClassFieldTheory's consumer repair for that roadmap's renames. The gate's `outside-folder` check does not cover `Completed/`, so this finding rests on the diff.

**Repair.** Either:
- say in the description that this file is ClassFieldTheory's consumer repair for the renamed declarations, so that LocalGaloisGroups counts as one of this pull request's folders; or
- move the edit into a companion pull request that merges together with this one.

## Previous findings

- R01 — not repaired: the description is unchanged and states no order against #617, #1411, #1797 and #1187. All four are still open and still list QuadraticFormInvariants (now R01).
- R02 — not repaired: `Completed/LocalGaloisGroups/Suggested.lean` is still changed (62+/50−), and the description does not name it (now R02).
- R03 — repaired: README 73–75 now read "EKM Ch. II (totally singular forms, §10, p. 55; the Arf invariant, §13, p. 62) records how different that theory is". The Grove and O'Meara 1955 References entries are deleted, and no mention of either remains.

## Verified sound

**Gate.** The worker's gate at 7498694 passes every check, with `build=0`. My run gives 0 on every check except `outside-folder=4`. The four files are the ClassFieldTheory and GlobalQuadraticForms `README.md` and `Suggested.lean`, which the brief names as this pull request's own folders.

**Build.** `lake env lean TauCetiRoadmap/QuadraticFormInvariants/Suggested.lean` exits 0 with no output. `git diff 8f8c72c HEAD` on `Suggested.lean` is empty, so the r51 `#check @` results stand: 5 declarations, no lost binder. The signatures file's `of` entry is the tool reading "theorem of Layer 7C" in the module docstring, as r51 found.

**Dependency check.** It prints `depcheck: 236 roadmaps, 2273 edges, 0 problem(s)`: no UPWARD and no CYCLE line.

**Changed passages checked (4 hunks).**

- *Exclusions, README 73–75.* I checked the EKM locators in `ekm2008`. The table of contents (lines 39 and 42) gives §10 "Totally singular forms" at p. 55 and §13 "The discriminant" at p. 61. The §10 heading is at line 2948, on printed p. 55. The term "Arf invariant" is defined at line 3381, on printed p. 62 (the extraction's page 70; the index at line 22919 also gives p. 62). Both locators are correct.
- *Layer 8, "The comparison with the Clifford invariant, exact", README 2258–2276.* Four claims, each checked:
  - "Serre calls `w₂` itself the Witt invariant (§1.2)": `serre1984cmh` lines 47–56. In §1.2, "Formes quadratiques", `w₂(Q) = Σ_{i<j}(aᵢ)(aⱼ)` is called the Witt invariant, also called the Hasse invariant.
  - "Théorème 1 … correction term `(2) ∪ (d_E)`": `serre1984cmh` lines 136–147. With `Q_E` the form `x ↦ Tr_{E/K}(x²)` and `d_E` the discriminant of the étale algebra `E`, the theorem is `w₂(Q_E) = e*s_n + (2)(d_E)`. This matches the README.
  - "Kahn's formulas … stated for `w₂`": `kahn1984` lines 50–56 state Théorème 2 for Delzant's classes. Lines 726–733 say Delzant's `w₂` is the Hasse–Witt invariant, the `∏_{i<j}` convention. Lines 763–765 give Lemme II.2.1 with the term `(2, d)`.
  - "The module documentation of that file reads Serre's and Kahn's formulas … against it": at the pinned Tau Ceti, `TauCeti/FieldTheory/QuadraticForm/StiefelWhitney/Clifford.lean`, the section "Conventions in the literature" (lines 28–38) says that Serre's trace-form formula, Fröhlich's comparison and Kahn's formulas are stated for this `w₂`. It says that to read them for `c(q)` one adds the two correction terms of `TauCeti.brauer2EquivH2_cliffordInvariant`. That theorem (lines 89–103) has `C(n-1,2)` and `C(n+1,4)`, the README's `A_n` and `B_n`. The README dropping Fröhlich from its sentence is consistent with dropping him from References.
- *References, README 2725–2737 and the end of the list.* The Serre entry now lists §1.2, Théorème 1 and Théorème 1′. These are the locators used at README 2260–2262 and 2440. No mention of Grove, Fröhlich or O'Meara 1955 remains (grep finds 0 in the README and in `Suggested.lean`). The only body mentions of O'Meara are of the 1963 book, which keeps its entry.

**What cites the changed text.** README 2259–2260 still points at "the convention table", and README 178–195 is that table. It identifies `s(q) = ∏_{i<j}` with Serre's `ε` and calls `c(q)` the Witt–Clifford invariant. The new sentence resolves exactly the naming clash between this and Serre's "invariant de Witt" for `w₂`. No other passage mentions a "documentation note".

**Sibling folder.** The GlobalQuadraticForms change since 8f8c72c (208 lines) touches no line naming QuadraticFormInvariants. README 89–91 and 2686–2690, which cite it, still match its contract.

**Overlaps and citations.**
- `scratch/overlaps.md` lists no id this README cites that an open pull request drops, none that only an open revision defines, and no id this pull request drops that others cite.
- The two leads in `scratch/citations.md` resolve on main:
  - `LocalFieldsRamification.map_norm_unitFiltration_zero` is at `Completed/LocalFieldsRamification/Suggested.lean` line 857;
  - `ProfiniteCohomology.f2Pairing` is at `TauCetiRoadmap/ProfiniteCohomology/Suggested.lean` line 5332.

  Both are roadmap names, not names in the pinned libraries, so the tool's report that they occur nowhere does not apply to them.

**Seeded sample.** None of the 13 targets falls in a changed hunk. The targets are at README 1109, 1124, 1150, 1171, 1181, 1204, 1244, 1493, 1503, 1708, 1726, 1749 and 2437; the hunks are 71–79, 2257–2276, 2728–2740 and 2761–2763. The r46 verifications stand. I re-read Lemme II.2.1 (`kahn1984` lines 763–788) for the Evens-norm target at 2437 because the changed text cites Kahn. It gives `(Tr a, −d·N a) + (2, d)` when `Tr a ≠ 0` and `(2, d)` when `Tr a = 0`, as stated. The README flags no locator as unverified.

**Headlines and padding.** No declaration was added, removed or changed. The five headlines are as r46 and r51 found them.

**Duplication and ownership.** The change introduces no new object.

**Remark (no change asked).** The manifest entry `serre1984cmh` keeps the single locator "Théorème 1′" with `cited_for` "Layer 9". The README now also cites §1.2 and Théorème 1 in Layer 8. The manifest's locators are representative rather than exhaustive (`ekm2008` lists only "II §7"), so this is not a finding.

### Adversarial table

Rows 1–6 compute the changed statements. Rows 7–33 carry forward r51's rows for statements the diff leaves untouched, citing PRREVIEW-QuadraticFormInvariants~51; rows 15–33 are r51's carry-forward of the r46 rows.

| # | Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|---|
| 1 | Serre Th. 1 read for `c`: `ι c(Q_E) = w₂(Q_E) + A_n (−1)∪(d_E) + B_n (−1)∪(−1)`, with `w₂(Q_E) = e*s_n + (2)∪(d_E)` | `E = ℚ(∛2)` (`n = 3`) | `Tr` Gram on `1, α, α²` is `[[3,0,0],[0,0,6],[0,6,0]]`, so `Q_E ≅ ⟨3,1,−1⟩` and `d_E = (−3)` (disc `−108`). `w₂ = (3)∪(−1)`. Serre: `s_3 = 0` (restriction to a transposition, the Sylow subgroup, is 0), so `w₂ = (2)∪(−3)`. Local symbols: `(3,−1)` is `−1` at 2 and 3; `(2,−3)` is `−1` at 2 and 3; `+1` at ∞ for both, so they are equal. `A_3 = B_3 = 1`: `c = (3)(−1) + (−1)(−3) + (−1)(−1) = (3)(−1) + (−1)(3) = 0`. Direct: `C₀⟨3,1,−1⟩ ≅ (−3, 1)`, split, so `c = 0` | holds | none |
| 2 | Same identity, the trivial and the rank-2 cases | `E = ℝ³`, `ℝ⁴`, `ℚ(√3)`, `ℚ(i)` | `ℝ³`: `w₂⟨1,1,1⟩ = 0 = e*s_3 + (2)(1)`; `c = 0 + (−1)(1) + (−1)(−1) = [ℍ]` = `C₀ = (−1,−1)`. `ℝ⁴`: `A_4 = C(3,2) = 3 → 1`, `B_4 = C(5,4) = 5 → 1`, `c = [ℍ]` = `Cl₄,₀ ≅ M₂(ℍ)`, matching README 1264. `ℚ(√3)`: `Q_E = ⟨2,6⟩`, `w₂ = (2)(6) = (2)(3)`, Serre `(2)∪(d_E) = (2)(12) = (2)(3)`; `(2,3)₃ = −1`, so nonzero; `A_2 = B_2 = 0`, so `c = w₂`. `ℚ(i)`: `⟨2,−2⟩`, `w₂ = 0 = (2)(−1)` | holds | none |
| 3 | "Serre calls `w₂` the Witt invariant", §1.2 | `serre1984cmh` lines 47–56 | §1.2 "Formes quadratiques": `w₂(Q) = Σ_{i<j}(aᵢ)(aⱼ)` named the Witt invariant (also called the Hasse invariant), which is the `∏_{i<j}` convention of README 178 | holds | none |
| 4 | "Kahn's formulas are stated for `w₂`" | `kahn1984` lines 50–56, 726–733, 763–765, 776–786 | Théorèmes 1–3 use Delzant's `wᵢ`; line 733 says `w₂` is the Hasse–Witt invariant; Lemme II.2.1 computes `w₂(T⟨a⟩) + (2,d)` | holds | none |
| 5 | "The module documentation of that file reads Serre's and Kahn's formulas against it" | Tau Ceti `…/StiefelWhitney/Clifford.lean` lines 28–38 and 89–103 | The docstring names Serre, Fröhlich and Kahn as stated for this `w₂` and says to add the two correction terms of `brauer2EquivH2_cliffordInvariant`; that theorem's coefficients are `(rank−1).choose 2` and `(rank+1).choose 4` | holds | none |
| 6 | EKM exclusion locators (§10 p. 55; Arf §13 p. 62); dropped citations | `ekm2008` lines 39, 42, 2948, 3381, 22919; grep of README and `Suggested.lean` | §10 heading on printed p. 55; "Arf invariant" defined on printed p. 62 inside §13 (from p. 61); index gives 62. "Grove", "Fröhlich", "1955": 0 hits | holds | none |
| 7 | Local classification, 6D (r51 row 1) | `V : Type`, `W : Type 1`; `⟨1,1⟩` vs `⟨5,5⟩` and `⟨−1,−1⟩` over `ℚ₂`; `⟨1⁴⟩` vs `⟨(−1)⁴⟩` over ℝ | `⟨5,5⟩`: `d = [25] = [1]`, `s = (5,5)₂ = +1`, isometric. `⟨−1,−1⟩`: `s = −1 ≠ +1`, not isometric. ℝ: `(4, [1], +1)` on both sides yet not isometric, so the nonarchimedean hypothesis is needed | holds | none |
| 8 | Relative `w₂`, L9 (r51 row 2) | `ℚ₂(i)`, `a = 1+2i`; `ℚ₂(√5)`, `a = 1+√5` and `√5` | LHS `(2)∪(5)` vs RHS `(2)∪(5)`; `(2)∪(5)` vs `(2)∪(5)`; `0` vs `0` | holds | none |
| 9 | Transfer discriminant, L9 (r51 row 3) | as row 8 | `[−20] = [−5]` vs `[−4]+[5]`; `[−80] = [−5]` vs `[5]+[−1]` | holds | none |
| 10 | Descended `w₁`, `w₂` (r51 row 4) | `⟨2,−10⟩ ≅ ⟨2,−40⟩`; `⟨1,−1⟩ ≅ ⟨2,−2⟩` | `w₁ = (−20) = (−80)`; `w₂`: `(2)∪(4) = 0`, so equal; `0 = 0` | holds | none |
| 11 | `hilbertSymbol_unramified`, `exists_unramified_class` (r51 row 5) | `ℚ₃`, `Δ = 2`; `ℚ₂`, `Δ = 5, −3, 3` | `(2,3)₃ = −1`, `(2,9)₃ = +1`; `(5,2)₂ = −1`, `(5,3)₂ = +1`; `Δ = 3` excluded and fails the criterion | holds | none |
| 12 | Supplier-table path, Layer 1 (r51 row 6) | `OrthogonalGroup/Basic.lean` | exists at the pin | holds | none |
| 13 | Consumers (r51 row 7) | #1834; main | Part II imports `{1, 4, 7A, 7B, 9}`; the three names, and old → new for the other 8 | holds | none |
| 14 | `Suggested.lean` docstring (r51 row 8) | lines 23–31 | every `formClass` is `TauCeti.formClass` | holds | none |
| 15 | Four-fold TFAE, L2 (r46 row 1) | `a = 1`; `(−1,−1)` over ℝ; `(2,5)` and `(5,5)` over `ℚ₂`; `a = c²` | all true; all false; `5 = 5² − 5·2²`, true; `ω(5) = 1`, false; norm form vanishes at `(c,1,0,0)` | holds | none |
| 16 | Cup-norm, 7C (r46 row 3) | `a = c²`; `b = −a`; ℝ; `(2,5)/ℚ₂` | `(a) = 0`; `(a)∪(−a) = 0`; false on both sides; cup `≠ 0` iff `5 ≠ x² − 2y²` | holds | none |
| 17 | Evens value, L9 (r46 row 4) | `ℚ₂(i)`, `a = 1+2i`; `a = 1`; `√d` | `(2)∪(5) ≠ 0`; `(2)∪(−1) = 0`; `(2)∪(d)` on both sides | holds | none |
| 18 | `hasseInvariant_eq_localHasse` (r46 row 6) | `n = 0, 1`; `⟨−1,−1⟩/ℚ₂` | 1 on both sides; `ε[ℍ] = −1 = (−1,−1)₂` | holds | none |
| 19 | `localHasse` Checks (r46 row 7) | `![a,−a]`; `![−1]`; `![−1,2]` | `+1`; `+1`; `s = +1`, O'Meara `−1` | holds | none |
| 20 | Quaternions central simple, L5 (r46 row 8) | `a` square or nonsquare | split when `a` is a square | holds | none |
| 21 | Binary congruence (r46 row 9) | `⟨2,−1⟩ ≅ ⟨1,−2⟩` | `[(2,−1)] = [(1,−2)] = 1` | holds | none |
| 22 | `s(λq)`, `s(q⊥r)` (r46 row 10) | `n = 0` | ℕ junk exponent 0 vs the true value 1 | holds | none |
| 23 | Dimension ≤ 3 (r46 row 11) | rank 2; ℝ | `ac ∈ N(K(√−ab))` iff isometric | holds | none |
| 24 | Lam V.3.20 over ℝ (r46 row 12) | `⟨1ⁿ⟩`, `n = 1..8` | `B_n = 0,0,1,1,1,1,0,0`; algebras `ℝ, M₂ℝ, ℍ, M₂ℍ, M₂ℍ, M₄ℍ, M₈ℝ, M₁₆ℝ` | holds | none |
| 25 | `c(q⊥r)` on `I²` (r46 row 13) | `⟨1⁴⟩ ⊥ ⟨1⟩` | `[ℍ] = [ℍ]·1` | holds | none |
| 26 | 6B defects over `ℚ₂` (r46 row 14) | `1, 5, −1, −5, 5/4` | `0, 4ℤ₂, 2ℤ₂, 2ℤ₂`; `δ(5/4) = 0` | holds | none |
| 27 | 6C Gram matrix (r46 row 15) | `{−1, 2, 5}` | `!![1,0,0;0,0,1;0,1,0]` | holds | none |
| 28 | 6D isotropy (r46 row 16) | `⟨1,1,1⟩`, `⟨1⁴⟩/ℚ₂` | `s = +1 ≠ (−1,−1)₂` | holds | none |
| 29 | Realization exceptions (r46 row 17) | `(1,[1],−1)`, `(2,[−1],−1)`, `(2,[1],−1)` | the first two excluded; the third realized by `⟨−1,−1⟩` | holds | none |
| 30 | Ramified-base control (r46 row 18) | `ℚ₂(√2)`, `a = 5` | `1 + π ≢ 1 mod π²` | holds | none |
| 31 | 6B case 3 (r46 row 19) | `ℚ₂(√2)` | `#𝒪ˣ/𝒪ˣ² = 8`; unit norms of index 2 | holds | none |
| 32 | `Pin⁺` (r46 row 20) | `t = (e₁−e₂)/√2` | `t² = I`; `(e₁t)⁴ = −I` | holds | none |
| 33 | ULift square, 7B.5 (r46 row 21) | transports | pullback along `absoluteGaloisGroupCongr`, `unitsCoeffCongr` | holds | none |

## Not verifiable

- Lam (2005), Gille–Szamuely (2017), O'Meara (1963), Milnor (1970), Serre *A Course in Arithmetic* and Serre *Local Fields*: the manifest settles these as uncertified, and they are cited by locator. No changed passage cites them, except Lam V.3.20, whose exponents are unchanged and which I checked on `⟨1ⁿ⟩` over ℝ (row 24) and `⟨3,1,−1⟩` over ℚ (row 1).

## Source issues

- none
