# Review of QuadraticFormInvariants (pull request #1411 at 49a703c)

**Verdict:** needs changes

This is an incremental re-review of the 59 lines changed in this folder since `c87c808`. The repairs of R01–R03 are correct and introduce nothing new. The folder's text, the Lean file, the gate's folder checks and the dependency check are all clean.

Two P3 findings remain, and both are about the pull request as a whole, not the folder's text. They carry forward the previous R04 (no merge order against #1797 and #1187) and R05 (the `Completed/LocalGaloisGroups` edit).

## R01 (P3) — No order is stated against #1797 and #1187, whose heads conflict with this one in this folder

Re-raised: H06. That answer says the description is outside this roadmap's files, so the worker has to write the paragraph. That gives the edit to someone else; it does not make it unnecessary. The description at `49a703c` is the one the previous review read.

**Location.** The "Merge order" paragraph of the pull request description. It names only #1410, #1474, #617 and #1215: "#617 and #1215 amend the same roadmap: whichever of the three merges first, the other two are rebased onto it".

**Claim.** The rebasing order between this head and every open pull request that changes this folder is stated.

**Witness.** The overlap check (index of 2026-11-09T20:14Z) still reports:
- "#1411 and #1797 conflict in `TauCetiRoadmap/QuadraticFormInvariants/README.md`, `…/Suggested.lean`";
- "#1187 and #1411 conflict in … `TauCetiRoadmap/QuadraticFormInvariants/Suggested.lean`".

**Repair.** Add to that paragraph:
- which of #1411 and #1797 merges first, and that the other is then rebased onto it without restating its changes. H06 says #1797's 295-line file is the earlier state of this folder;
- that rebasing #1187 onto this head replaces its copy of this folder's `Suggested.lean` with this one.

## R02 (P3) — `Completed/LocalGaloisGroups/Suggested.lean` is edited outside the folders reviewed as this pull request's own

Re-raised: H07. That answer says ClassFieldTheory's revision forces the edit. That is true, but it does not make the file one of the folders this pull request is reviewed and built as. The ClassFieldTheory review of this head raises the same point.

**Location.** `Completed/LocalGaloisGroups/Suggested.lean` lines 326 and 485. The changed lines are `⟨ClassFieldTheory.h2MuEquivZMod_mixed p F n hn⟩` and `⟨ClassFieldTheory.h2FpEquivZMod_of_mu p F _ (muNRepIsoTrivialFp p F ζ hζ)⟩`.

**Claim.** The pull request changes only its own folders.

**Witness.**
- Outside `QuadraticFormInvariants`, `ClassFieldTheory` and `IntegralLattices`, `git diff --stat origin/main...HEAD` lists only `Completed/LocalGaloisGroups/Suggested.lean | 4 ++--`.
- The review brief names only the other two folders as the pull request's own.
- The targeted build does not build `Completed.LocalGaloisGroups.Suggested`.

**Repair.** Make no change inside this folder. Have `Completed/LocalGaloisGroups` recorded as one of this pull request's folders where the board reads them, so that the two-line adaptation is reviewed and built with this head.

Keep the two lines. Going back to `Nonempty`-valued names in ClassFieldTheory would break that roadmap's own rule against an arbitrary `Nonempty (X ≃ Y)` where a canonical map is required (`TauCetiRoadmap/ClassFieldTheory/README.md` lines 588–589).

## Previous findings

- R01 — repaired: README 292–297 now says "`LocalFieldsRamification.square_eq_range_powMonoidHom`, `…map_norm_unitFiltration_zero` and `…mem_normGroup_iff_dvd_normalizedValuation` are Tau Ceti's declarations under that roadmap's names. Its `…card_squareClasses_dyadic` is that roadmap's prototype".
- R02 — repaired: README 2309–2312 cite "Serre … §1.2, p. 652 … Théorème 1, p. 655"; Fröhlich is gone. Line 1231 reads "EKM §11, pp. 57–58". References 2803–2807 and 2825–2830 carry the new locators by layer.
  The manifest's existing `ekm2008` and `serre1984cmh` entries are add-only (`sources fetch --add-only`: "a review adds, never rewrites"), so the References are where these locators can go.
- R03 — repaired: `Suggested.lean` 185–190 inline the proof, and the helper is gone. README 33–35 now names the one remaining extra declaration: "the local instance `qfiNativeBrauerCommGroup` of 6E, which is `TauCeti.BrauerGroup.instCommGroup`".
- R04 — not repaired: the description's merge-order paragraph still names only "#1410 … #1474 … #617 and #1215". Carried as R01.
- R05 — not repaired: `Completed/LocalGaloisGroups/Suggested.lean | 4 ++--` is still changed, and that folder is still not one the brief records. Carried as R02.

## Verified sound

**Gate and build.**
- The worker's gate at `49a703c` (`scratch/gate.md`) passes every check, with `build=0` for the targeted build of this module and `GlobalQuadraticForms.Suggested`.
- My run with `--base origin/main` gives `outside-folder=4` and nothing else. All four are files of the pull request's own sibling folders: `TauCetiRoadmap/ClassFieldTheory/{README.md,Suggested.lean}` and `TauCetiRoadmap/IntegralLattices/{README.md,Suggested.lean}`. That gate does not flag `Completed/LocalGaloisGroups/Suggested.lean`; the three-dot diff does (R02).
- `lake env lean TauCetiRoadmap/QuadraticFormInvariants/Suggested.lean` exits 0 with no output.
- The file has no `sorry`, no `set_option` and no sorry'd data.
- A grep of its declarations finds exactly what README 24–35 says:
  - 6 `example`s (lines 69, 131, 145, 200, 215, 232);
  - 7 named declarations plus `export TauCeti (formClass)`;
  - the local instance at line 163.

**Signatures.**
- I elaborated one scratch copy that ends with `#check @` for the eight consumer names, `qfiNativeBrauerCommGroup`, `TauCeti.BrauerGroup.instCommGroup`, `TauCeti.RegularFormClass.localHasse_mk` and `…quaternionSubgroupSignEquiv_apply_hasseInvariant`. It exits 0.
- The type of `hasseInvariant_eq_localHasse` is the same as in `scratch/signatures.md`, character for character. Only the proof changed. The six other named types are also unchanged, and none lost a section binder.
- `qfiNativeBrauerCommGroup : (F : Type u_1) → [Field F] → CommGroup (BrauerGroup F)` is the body `TauCeti.BrauerGroup.instCommGroup`. That instance is declared at Tau Ceti `Algebra/BrauerGroup/Group.lean:174` on `BrauerGroup.{u, u} K`, as README 33–35 and 1752–1753 say.

**Dependency check, verbatim.** `depcheck: 236 roadmaps, 2274 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line.

**Changed passages, checked in full.**
- *LocalFieldsRamification supplier bullet* (README 287–297), checked against main `3090489`, `Completed/LocalFieldsRamification/Suggested.lean`:
  - `card_squareClasses_dyadic` is `:= sorry` (708–712);
  - `square_eq_range_powMonoidHom` is the term `TauCeti.square_eq_range_powMonoidHom` (720–722);
  - `map_norm_unitFiltration_zero` is `TauCeti.map_normUnits_unitFiltration K L 0` (857–862);
  - `mem_normGroup_iff_dvd_normalizedValuation` is `TauCeti.mem_normGroup_iff_dvd_normalizedValuation` (870–875);
  - 6A uses the Tau Ceti forms (README 1303, 1310, 1330) and cites `map_norm_unitFiltration_zero` (1341).
- *Base change* (README 1223–1238): `C(ϕ_K) = C(ϕ)_K` is at `ekm2008` line 3076 (printed p. 57), and the universal property is at line 3128 (p. 58).
- *Clifford against `w₂`* (README 2307–2324):
  - `serre1984cmh` lines 53–54 (p. 652) call `w₂ = Σ_{i<j}(a_i)(a_j)` the Witt invariant, "also called the Hasse invariant";
  - lines 146–147 (p. 655) give Théorème 1, `w₂(Q_E) = e*s_n + (2)(d_E)`;
  - "the two further terms" are the `A_n` and `B_n` terms of the identity at 2315, computed in rows N5 and N6.
- *References.*
  - EKM: the page markers give printed page = file page − 8:
    - §10 is at line 2986 (p. 55), and Example 13.5(2), the Arf invariant, at 3366–3381 (p. 62);
    - Corollary 12.5 is at 3309–3311 (p. 61);
    - Lemma 14.2 is at 3434 (p. 63), and Theorem 14.3 at 3444–3456 (pp. 63–64);
    - Example 98.2 is at 20341–20344 (p. 388), §98.C at 20370–20373 (p. 388), and §98.E at 20422–20425 (p. 389).
  - Every EKM locator is used where the entry says:
    - line 40 (Excluded);
    - 1092, 1189, 1211, 1225 and 1231 (Layer 5);
    - 1521 (6C);
    - 1745 (6E).
  - Serre §1.1 (`serre1984cmh` lines 43–46, p. 652) is cited at 1785 (6E), 2126 (7B item 6) and 2170 (7C). Théorème 1′ is at lines 560–561, and its "seconde démonstration" at line 582.
- *Citation leads* (`scratch/citations.md`), all false positives:
  - `LocalFieldsRamification.map_norm_unitFiltration_zero` is the roadmap name above;
  - `ProfiniteCohomology.f2Pairing` is main's `TauCetiRoadmap/ProfiniteCohomology/Suggested.lean:5332`;
  - `QuadraticFormInvariants.wittRing` and `toWittRing` are the "Former name" column of the old → new table (README 2771).
- *Overlaps.* No id this README cites is dropped by an open pull request, and none is defined only by an open revision. The deleted helper was `private`, so no consumer could cite it. Since `c87c808`, the sibling diffs (IntegralLattices) change no line that mentions this roadmap.

**Seeded sample.**
- Inside the changed passages:
  - *Base change and the remaining API* (EKM §98.C and §11, checked above);
  - *Quaternion algebras are central simple* (§98.E);
  - *The `I²` homomorphism* (Lemma 14.2, Theorem 14.3);
  - *The classical construction* (Example 98.2, in its norm-form bullet at 1521);
  - *Milestone 1* (Corollary 12.5);
  - *Compatibility with the cup product* (Serre §1.1).
- In untouched text: *The quaternion symbol in `Br(K)`*, *The Hasse invariant*, *Classification in dimension at most three*, *The Clifford invariant*, *The symbol*, *Milestone 2* and *The value of the Evens norm on a Kummer class*. Their lines are unchanged, and r55's checks carry forward.

**Adversarial table.** Rows N1–N8 are computed this round. Rows 1–28 are carried from the previous report (r55), whose computed values are restated in short form; "s" is the Hasse invariant and "d" the discriminant.

| # | Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|---|
| N1 | `hasseInvariant_eq_localHasse`, new proof (`Suggested.lean` 170) | ℚ₂: `![−1,−1]`, `n = 0`, `![2,5,5]`; filter vs `Ioi` at `n = 3` | `(−1,−1)₂ = −1 = ε[ℍ]`. `n = 0`: empty product 1, and `ε(1) = 1`. `![2,5,5]`: `(2,5)(2,5)(5,5) = (−1)(−1)(+1) = +1`, with `ω(5) = 3` and `ε(5) = 2`. Both enumerations give pairs `{(0,1),(0,2),(1,2)}`. The type is unchanged | holds | none |
| N2 | README 24–35, the declarations of the file | grep of `Suggested.lean` | 6 examples, 7 named, 1 `export`, 1 local instance. The README's "eight names" plus "the only other declaration" give the same count. The old text would miss the instance | holds | none (R03) |
| N3 | LFR bullet, prototype vs proved (README 291–297) | main `Suggested.lean` 708–875; `ℚ₂` count | 3 proved by Tau Ceti terms, 1 `sorry`. `4·q^e = 4·2¹ = 8 = #{±1, ±2, ±5, ±10}`, the same as 6A's `TauCeti.card_squareClass` | holds | none (R01) |
| N4 | Base change of `C(q)` (README 1231) | `⟨−1,−1⟩` along ℝ → ℂ | `C = ℍ`, and `ℍ ⊗ ℂ = M₂(ℂ) = C(⟨−1,−1⟩_ℂ)`. EKM p. 57 has the statement, p. 58 the universal property | holds | none (R02(b)) |
| N5 | Serre Théorème 1, as cited (README 2311) | `E = ℚ(√3)`; `E = ℚ(i)` | `ℚ(√3)`: `Q_E = ⟨2,6⟩`, `d_E = 3`, `w₂ = (2)(6) = (2)(−1)+(2)(3) = (2)(3)`. Here `(2)(−1) = 0`, since `−1 = 1² − 2·1²`, and `(2,3)₃ = (2/3) = −1 ≠ 0`. RHS `0 + (2)(3)`, so the correction term is needed. `ℚ(i)`: `⟨2,−2⟩`, `d_E = −1`, `w₂ = 0 = (2)(−1)` | holds | none (R02(a)) |
| N6 | "acquires the two further terms" (README 2312, identity at 2315) | `E = ℚ³` (`n = 3`); `n = 2`; `⟨a,b,c⟩` | `ℚ³`: `Q_E = ⟨1,1,1⟩`, `w₂ = 0`, `A₃ = B₃ = 1`, so `c = (−1)(1)+(−1)(−1) = [ℍ_ℚ] ≠ 0 = C₀⟨1,1,1⟩`. `n = 2`: `A₂ = B₂ = 0`, so `c = w₂`. In general, `(−ab,−ac)` expands to `w₂ + (−1)(abc) + (−1)(−1)` | holds | none |
| N7 | EKM References entry (README 2825–2830) | 9 locators | Printed pages 55, 62, 57–58, 63, 63–64, 388, 389, 388, 61, as listed. Every README use falls in the layer named | holds | none (R02(c)) |
| N8 | Serre References entry (README 2803–2807) | §1.1, §1.2, Th. 1, Th. 1′ | Pages 652, 652, 655 (lines 43–46, 53–54, 146–147); Th. 1′ at 560–561; used at 1785, 2126, 2170, 2310–2311, 2488 | holds | none |
| 1 | Four-fold criterion (L2; 69) (r55) | ℚ₂ (5,5), (2,5); ℚ₃ (−1,−1); `a = 1` | (5,5): `⟨1,−5,−5⟩` vanishes at (5,1,2). (2,5): exponent `0+ω(5) = 1`, so −1. ℚ₃ splits. `b = ((b+1)/2)² − ((b−1)/2)²` | holds | none |
| 2 | Product formula (6C; 131) (r55) | ℚ: (−1,−1), (2,3) | `(−1)(−1) = +1`; `(−1)₂(−1)₃(+1)_∞ = +1` | holds | none |
| 3 | Local classification (6D; 145) (r55) | ℚ₃ `⟨1,1⟩` vs `⟨3,3⟩`; ℝ `⟨1⁴⟩` vs `⟨−1⁴⟩` | d `[1]` both; s `+1` vs `(3,−1)₃ = −1`; ℝ has the same triple but is not isometric, so the local hypothesis is needed | holds | none |
| 4 | Cup-norm (7C; 200) (r55) | ℝ (−1,−1); ℚ₂; 𝔽₃ | ℝ: unsolvable and cup ≠ 0; 𝔽₃: `H² = 0` and binary forms are universal | holds both ways | none |
| 5 | Evens value (L9; 215) (r55) | ℚ₂(i): `1+2i`, `i`, `3`; ℚ₂(√5), `2` | `(2)∪(5) ≠ 0`; `(2)∪(−1) = 0`; `0`; `(2)∪(5)` | holds | none |
| 6 | Relative `w₂` (L9; 232) (r55) | `a = 1+2i`; `a = 1`; trace 0 | LHS `(2)∪(5)` = RHS; `(2)∪(d)` both; `0` both | holds | none |
| 7 | `hasseInvariant_eq_localHasse` (r55) | ℚ₂ `![−1,−1]`; trivial ε | `−1 = (−1,−1)₂`; a constant ε is not injective on the 2-element `Q(K)` | discriminates | none |
| 8 | Central simplicity (L5) (r55) | `ℍ[ℚ,−1,−1]`; `ℍ[K,4,b]` | division; `≅ M₂(K)` | holds | none |
| 9 | Quaternion symbol in `Br` (L5) (r55) | `⟨2,−1⟩` vs `⟨1,−2⟩`/ℚ | isometric, so `[(2,−1)] = [(1,−2)] = 1` | holds | none |
| 10 | Hasse formulas (L5) (r55) | `λ•⟨a,b⟩`, `λ•⟨a,b,c⟩` | `(λ,−1)(λ,ab)(a,b)`; `s·(λ,−1)³·(λ,d)²` | holds | none |
| 11 | Dim ≤ 3 classification (L5) (r55) | ℝ ranks 3, 4 | 4 distinct pairs in rank 3; `⟨±1⁴⟩` share ([1],1) | bound sharp | none |
| 12 | Clifford formula (L5) (r55) | `n⟨1⟩`/ℝ, n = 1..8 | `C(n+1,4)` = 0,0,1,5,15,35,70,126, matching the Clifford algebras | holds | none |
| 13 | `I²` additivity (L5) (r55) | `⟨1,−1⟩⊥⟨a⟩`; `⟨−1⟩⊥⟨−1⟩`/ℝ | `1 = 1·1`; `[ℍ] ≠ 1·1` | holds | none |
| 14 | Base change (L5) (r55) | `⟨−1,−1⟩` ℝ → ℂ | `[ℍ] ↦ 1 = (−1,−1)_ℂ` | holds | R02(b), now N4 |
| 15 | The symbol (6C) (r55) | ℚ₂ (−1,−1) vs `x²+ay²` | −1 vs +1 | discriminates | none |
| 16 | Classical construction (6C) (r55) | ℚ₂(i)/ℚ₂ | norm classes `[1],[2],[5],[10]`: index 2 | holds | none |
| 17 | 6C item 13 with `tr` (r55) | ℝ; 𝔽₃; ℚ | `−1 = (−1,−1)_ℝ`; `H² = 0`; `Br(ℚ)[2]` infinite | holds | none |
| 18 | Milestone 1 (6E) (r55) | ℚ₂ | `#Q = 2`, `ε[ℍ] = −1` | holds | none |
| 19 | Milestone 2 (6E) (r55) | ℚ₂, ℚ₃ at (−1,−1) | `1/2 ↔ −1`; `0 ↔ +1` | holds | none |
| 20 | Cup compatibility (6E) (r55) | ℚ₂ (2,5), (5,5) | `≠ 0 ↔ −1`; `0 ↔ +1` | holds | none |
| 21 | `discr` Checks (L3) (r55) | `⟨1,−1⟩`, `⟨1,1⟩`; `⟨1⟩`, `⟨4⟩` | `[−1]`, `[1]` vs signed `[1]`, `[−1]`; `[1]`, `[1]` | discriminating | none |
| 22 | `localHasse` Checks (6C) (r55) | ℚ₂ `![−1]`, `![−1,2]` | `+1` (vs −1 for `i ≤ j`); `+1` vs O'Meara's `−1` | holds | none |
| 23 | Defect (6B) (r55) | ℚ₂ 5/4, 20, −5 | `0`, `16ℤ₂`, `2ℤ₂` | holds | none |
| 24 | Odd-defect discriminant (6B) (r55) | ℚ₂, −1 and 3 | −4 and 12 | holds | none |
| 25 | Clifford vs `w₂` (L8) (r55) | `⟨1,1,1⟩`/ℝ | `ι(c) = (−1)∪(−1) ≠ 0` | holds | none |
| 26 | `hilbertSign` Checks (6C) (r55) | ℚ, a=b=±1 | reversed sign at ∞; product `+1` | holds | none |
| 27 | The Fröhlich sentence (L8) (r55) | Serre §1.2, Th. 1 | the Serre half held | was R02(a) | repaired, now N5 |
| 28 | LFR "prototypes" (r55) | main 708–875 | 1 of 3 a prototype | was R01 | repaired, now N3 |

**Remark on untouched text** (no change asked). README 293–295 call `map_norm_unitFiltration_zero` and `mem_normGroup_iff_dvd_normalizedValuation` "Tau Ceti's declarations under that roadmap's names". Both adapt the hypothesis `ramificationIndex K L = 1` to `IsUnramified` before applying the Tau Ceti term, which is the reading r55 already accepted for the first of them.

## Not verifiable

The manifest records these as uncertified, and they have no legal open copy. They carry only sampled targets in untouched text, which r55 checked by computation (rows 1–3, 7–26):
- Lam III.2.7, III.2.11, V.3.4, V.3.16–3.21;
- Gille–Szamuely 1.1.9, 1.5.2, 4.4, 4.7;
- Serre, *A Course in Arithmetic* III and IV, and *Local Fields* X and XIV §2;
- O'Meara 63:11–23 and 71:18;
- Scharlau Ch. 2 §5;
- Milnor §4;
- Delzant.

Ownership against open pull requests was checked for the changed passages only: `scratch/overlaps.md`, the four conflicting revisions, and `roadmaps grep` for the deleted helper. That grep finds it only inside #1215's and #1797's own copies of this folder's `Suggested.lean` (lines 117 and 114), as a `private` helper, so it is not a citation.

## Source issues

- none
