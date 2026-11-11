# Review of ModularCharactersAndBlocks (pull request #1775 at ef8b735)
Folder: `TauCetiRoadmap/RepresentationTheory/ModularCharactersAndBlocks/`
**Verdict:** needs changes

This is an incremental re-review of the 19 lines changed since `ab56c2d`. Only the folder's `README.md` changed; `Suggested.lean` and the family index did not. Both repairs made at this head are correct. One P3 finding remains, carried from the previous review, and nothing blocks.

## R01 (P3) — The family index still names this roadmap the owner of Brauer characters

Re-raised: H02 (repair report on `ab56c2d`; the previous review's R02, and R05 before that)

**Location:** `TauCetiRoadmap/RepresentationTheory/README.md:132–133`: “[ModularCharactersAndBlocks](ModularCharactersAndBlocks/README.md) consumes both and owns Brauer characters, decomposition matrices and blocks with defect.”

**Claim:** this roadmap owns the Brauer character.

**Witness:** the folder imports the Brauer character and its projective pairing from GL2AutomorphicRepresentationsAndTransfer §R17.5.11 (folder `README.md:93–102`, `:232–240`). That section's *Needs* line at its open head (its README line 2938) says “Modular characters and their projective pairing are owned here”.

**Why the reason fails:** the repair report agrees that the sentence is wrong. It left the sentence alone because that repair round could edit only the folder's two files. That limits who can make the edit; it does not make the sentence right.
- This brief makes the index one of this pull request's own files.
- This pull request wrote the sentence: `git diff origin/main...HEAD` changes 24 lines of the index, including this bullet.
- If the pull request merges unchanged, the index and the folder name different owners for the same object.

The edit has to be made on the pull request branch by someone who can change the index (for example the author, in the same edit as the #1146 rebase the description already plans).

**Repair:** replace the sentence with: “[ModularCharactersAndBlocks](ModularCharactersAndBlocks/README.md) consumes all three, takes the Brauer character and its projective pairing from GL2AutomorphicRepresentationsAndTransfer §R17.5.11 and the decomposition map over finite extensions of `ℚ_p` containing the `|G|`-th roots of unity from ArithmeticGaloisDuality §R02.4.4, and owns the Brauer-character basis theorem, the decomposition map of an arbitrary `p`-modular system, decomposition matrices, Brauer reciprocity and blocks with defect.”

**Tested:**
- “All three” are CharacterTheory, GrothendieckEulerForms and ModularInduction, which the bullet names just before the sentence (index `:130–132`).
- Both imports resolve in this round's index:
  - §R17.5.11 is at the GL2AutomorphicRepresentationsAndTransfer head (its README line 2927).
  - *Surjectivity of the decomposition map* is a paragraph inside ArithmeticGaloisDuality §R02.4.4 at its head (README line 3635, between the §R02.4.4 heading at 3505 and §R02.4.5 at 3869).
- Each owned item is a target of the folder:
  - the basis theorem: §2.2;
  - the decomposition map of an arbitrary system: §§1.2 and 2.4;
  - Brauer reciprocity: §3.1;
  - blocks with defect: Layers 4–7.

## Previous findings

- R01 — repaired: `README.md:642–649`: “The same identity, with the same `D` and `C`, holds for every complete discrete valuation ring `O` with `CharZero O` and residue field `k` of characteristic `p` whose fraction field `K` and residue field `k` are both splitting fields for `G` (Webb, Theorem 9.5.4 …”; Checks at `:658–663`.
- R02 — not repaired: index `:132–133` still reads “consumes both and owns Brauer characters, decomposition matrices and blocks with defect”. The index is unchanged since `ab56c2d`. Carried as R01 above.
- R03 — repaired: `README.md:336–337`: “(Webb, §9.4, p. 148, for the splitting system; Lemma 10.1.1, p. 170, for the bijection of roots of unity)”.

## Verified sound

**Head and scope.**
- The worktree is clean at `ef8b735`.
- `git diff --stat ab56c2d HEAD` lists only the folder's `README.md`: 17 insertions, 2 deletions.
- `git diff --stat origin/main...HEAD` lists the folder's `README.md` (+1174), its `Suggested.lean` (+312) and the family index (24 lines), which this brief makes the pull request's own.
- The brief's command for changes outside these prints nothing.

**Gate.**
- The worker's gate at this head: every counter is `0`, including `build=0`, and the result is `OK`.
- The brief's command, run here, gives two nonzero counters; every other counter is `0`:
  - `depcheck=1`: “NOT IN ORDER: ModularCharactersAndBlocks”. The default order does not list the roadmap.
  - `outside-folder=1`: `TauCetiRoadmap/RepresentationTheory/README.md`, the family index.
- Neither is a finding, as in the previous review. The candidate order lists the roadmap at line 102, after GL2AutomorphicRepresentationsAndTransfer (101) and ArithmeticGaloisDuality (62).

**Dependency check** (the brief's command), complete output:

```text
depcheck: 235 roadmaps, 2133 edges, 0 problem(s)
```

**Elaboration.**
- `lake env lean` on `Suggested.lean`: exit 0. There are 12 warnings, all “declaration uses `sorry`”, at lines 54, 68, 84, 103, 139, 214, 232, 242, 254, 271, 283 and 306, one per theorem.
- A scratch copy with fully qualified `#check @name` for all 17 declarations elaborates with no error.
- The elaborated type of `cartanMatrix_eq_transpose_mul_decomposition` carries `[IsAdicComplete …]`, `[CharZero O]`, `hζ`, `[IsArtinianRing …]`, `hind`, `hPnoniso`, `hPexh`, `hSnoniso`, `hSexh`, `hcover`, the `Module.Free`/`Module.Finite` lattice binders, `hirr`, `hnoniso` and `hexh`, as at `ab56c2d`.
- `Suggested.lean` is byte-identical to `ab56c2d`, so the previous review's comparison of all 17 signatures and its padding probe (every one-tactic attempt fails) still apply. Nothing changed.

**The new §3.1 bullet, checked against the source** (`webb`; printed page = PDF page − 7).
- Theorem 9.5.4, printed p. 159 (`webb` 6667–6671), assumes a splitting `p`-modular system, meaning `F` and `k` both split `G` (definition at `webb` 6228–6229), and `R` complete. This is the bullet's hypothesis.
- Corollary 9.5.6, printed p. 160 (`webb` 6707, 6712–6713), gives `C = Dᵀ D`.
- The proof uses splitting exactly at `webb` 6679–6684: through the identity `dim_F Hom(F ⊗ P̂_S, T) = dim_k Hom(P_S, T₀/πT₀)` (Corollary 9.5.3, `webb` 6663–6668) and endomorphism rings of dimension 1. This is the bullet's description.
- Example 9.5.7 (`webb` 6714–6725) gives the same `D` and `C` for `S₃` in characteristic 2 as the new Check.

**The new §1.1 locator.** Lemma 10.1.1, printed p. 170 (`webb` 7141–7158), gives the isomorphism `μ_F → μ_k` for `a` = the l.c.m. of the orders of the `p`-regular elements (`webb` 7131), which is `e'`. A group isomorphism is multiplicative and compatible with powers, as §1.1 says. Printed p. 148 is `webb` 6199 for §9.4.

**Implication cited in the bullet** (“CharacterTheory §4.5 for `K`, §2.3 for `k`”).
- CharacterTheory §4.5 on main (`5fc1aa8`, its README line 817) consumes `FDRep.exists_simple_nonempty_iso_baseChange_of_isPrimitiveRoot`: an absolutely irreducible model over any field that contains the roots of unity. So `K ∋ ζ_e` splits `G`.
- Folder §2.3 (`README.md:498–501`): a field of characteristic `p` containing a primitive `e'`-th root of unity splits `G` and all its subgroups. The reduction of `ζ_e^(e/e')` is such a root, because `X^e' − 1` is separable modulo `p`.

**Ownership.**
- A `roadmaps grep` for Brauer reciprocity, decomposition matrices and Cartan matrices over main and the 439 heads of the index of 2026-11-11T00:06:25Z finds no second owner of reciprocity.
- The hits outside this pull request are:
  - ArithmeticGaloisDuality (full row rank, inside its imported §R02.4.4 material);
  - Brauer reciprocity of class field theory in HeightsRationalPointsAndObstructions;
  - a reference title in EtaleDualityAndPerverseSheaves;
  - the old exclusion bullet of the family index on main and at the #1047, #1146 and #1220 heads.
- `overlaps.md` and `citations.md` list nothing to act on.

**Remarks on untouched text** (no change requested):
- The §3.1 *Needs* line (`README.md:627–630`) does not name CharacterTheory §4.5, which the new bullet uses for `K`. Layer 3 reaches it through Layer 1, whose Dependencies list it (`README.md:411–412`), so the build order is unaffected.
- The description says “#1220, the other open pull request that changes the index”. CompactGroupsPartII's head `bc17800c` also adds two bullets to the index. Its patch applies cleanly on this head (`git apply --check`: hunks at lines 51 and 104), so no merge order is needed.

**Adversarial table.** Rows H01–H12, D01–D02, S01 and S03–S16 cover statements this diff leaves untouched and are carried from the previous review (r20) with their values. S02 and S07 are re-run where the diff touches them. N01–N05 are new.

| Row | Statement | Instances | Values on the two sides | Result | Change |
| --- | --- | --- | --- | --- | --- |
| H01 | `complete_blockIdempotents_unique` (r20) | `𝔽₃[C₂]`; `G = 1` | `(2+2t)² = 2+2t`, `(2+2t)(2−2t) = 0`, sum `1`; `{1}` | Pass | none |
| H02 | `existsUnique_blockIdempotent_map_residue` (r20) | `ℤ₂[C₃]`; `ℤ₂[C₂]` | `(2−r−r²)/3 ↦ r+r²`, `(1+r+r²)/3 ↦ e₀`; only `1 ↦ 1` | Pass | none |
| H03 | `card_simpleModules_eq_card_pRegularClasses` (r20) | `S₃` at 2, 3; `C_p`; control `C₃/𝔽₂` | `2 = 2`; `2 = 2`; `1 = 1`; `2 ≠ 3` | Pass | none |
| H04 | `span_decompositionRows_eq_top` (r20) | `S₃` at 3; `C₂` at 2; `Q₈/ℤ₂[i]`; `G = 1` | rows span `ℤ²`; `ℤ`; `ℤ`; `ℤ` | Pass | none |
| H05 | `cartanMatrix_eq_transpose_mul_decomposition` (r20) | `S₃` at 3, 2; `C₄`, `Q₈` over `ℤ₂[i]`; `G = 1` | `[[2,1],[1,2]]`; `diag(2,1)`; `4 = 4`; `8 = 8`; `1 = 1` | Pass | none (general form registered, N01) |
| H06 | `brauerProjection_mul` (r20) | `S₃`, `p = 2`, `P = ⟨t⟩`; over `ℚ` | `Br(e₁²) = 0 = 0²`; control `2 ≠ 0` | Pass | none |
| H07 | `IsDefectGroup`, `isDefectGroup_conj` (r20) | `𝔽₂[S₃]`; `𝔽₂[C₃]` | `Br_⟨t⟩(e₀) = 1`, three conjugate maxima; `Br_⟨t⟩(e₁) = 0` | Pass | none |
| H08 | `isDefectGroup_iff_sylow_of_augmentation_ne_zero` (r20) | `𝔽₂[S₃]`; `G = 1` | `aug e₀ = 1` → Sylow; `aug e₁ = 0` excluded | Pass | none |
| H09 | `brauer_first_main` (r20) | `S₃`, `p = 2`, `D = ⟨t⟩`; `D = 1`; `C_p` | `N = D`, block `1 ↔ e₀`; defect zero ↔ itself; both empty | Pass | none |
| H10 | `sum_sameBlock_mul_conj_eq_zero` (r20) | `S₃` at 2, 3; control `g = h = 1` | `1 − 1 = 0`; `1 + 1 − 2 = 0`; control `2 ≠ 0` | Pass | none |
| H11 | `brauer_third_main_local` (r20) | `S₃`, `p = 2`, `P = ⟨t⟩`; `P = 1` | `Br_P(e₀) = 1 ≠ 0` ↔ `aug 1 = 1`; `e₀e₁ = 0` | Pass | none |
| H12 | `mem_pPrimeCore_iff_forall_principalBlock` (r20) | `S₃` at 2, 3; `G = 1` | `C₃ = O_{2'}`; `1 = O_{3'}`; `1 = 1` | Pass | none |
| D01 | `SameBlock` (r20) | `S₃`, `M ∋ 2`; `M ∋ 3` | `−6 ∈ M`, `−3 ∉ M`; `−3 ∈ M` twice | Pass | none |
| D02 | `pPrimeCore` (r20) | `S₃`; wrong model `O_p`; infinite `G` | `C₃`, `1`; `1`, `C₃`; `Nat.card = 0` excluded | Pass | none |
| S01, S03–S06, S08–S16 | §§0.1, 1.2, 2.1–2.3, 4.1–8.4 (r20) | as recorded in r20 | as recorded in r20 | Pass | none |
| S02 | §1.1 system (locator changed) | `e = 3`, `p = 2`; `e = 3`, `p = 3`; `e = 1`, `p = 5` | `ℚ₂(ζ₃)` unramified, `k = 𝔽₄`; `ℚ₃(ζ₃)` ramified, `k = 𝔽₃`, `e' = 1`; `ℚ` has 2 roots of unity, `ℚ₅` has 4 | Pass | none |
| S07 | §3.1 pairing (unchanged, re-run) | `S₃`, `p = 2` | `(2·1 + 2·2·1)/6 = 1`, `(2·2 + 2·2·(−1))/6 = 0` | Pass | none |
| N01 | §3.1 splitting-field form of `C = Dᵀ D` | `S₃/ℤ₂`; `S₃/ℤ₃`; `G = 1` | `D = [[1,0],[1,0],[0,1]]`, `Dᵀ D = diag(2,1) = C`; `ℚ₃ ∌ ζ₃` (`ℚ₃(ζ₃) = ℚ₃(√−3)` and `v₃(−3) = 1` is odd), `D = [[1,0],[0,1],[1,1]]`, `Dᵀ D = [[2,1],[1,2]] = C`; `(1) = (1)` | Pass outside the root-of-unity headline | none |
| N01c | same, controls (`K` does not split `G`) | `C₄/ℤ₂` (`−1 ≡ 7` mod 8, so `i ∉ ℚ₂`); `Q₈/ℤ₂` (`(−1,−1)` is a division algebra over `ℚ₂`); `Q₈/ℤ₂[i]` | `1+1+4 = 6 ≠ 4`; `1+1+1+1+16 = 20 ≠ 8`; `4·1 + 2² = 8 = C` | Hypothesis excludes the failures | none |
| N02 | “root-of-unity hypothesis implies it” | `e = 6`, `p = 2`; `e = 6`, `p = 3`; residue char `0` | `ζ₆² = ζ₃ ↦` primitive cube root, `k ⊇ 𝔽₄` splits; `ζ₆³ = −1 ↦ 2 ∈ 𝔽₃`, `e' = 2`; the bullet requires char `p`, and the headline's last sentence gives `C = Dᵀ D = I` | Pass | none |
| N03 | new Check `S₃` over `ℤ₂` | `X²+X+1` at `0, 1` in `𝔽₂`; `𝔽₂[S₃]` | `1, 1`: no root, so `ζ₆ ∉ ℚ₂`; `dim P₁ = 2` with factors `1, 1`, 2-dimensional simple projective, `2 + 2·2 = 6` | Pass | none |
| N04 | reworded Check “a splitting hypothesis is needed” | `C₄/ℤ₂` | `End(2-dim) = ℚ₂(i)`, so `ℚ₂` does not split `C₄`; `𝔽₂` does (one simple, `End = 𝔽₂`); `Dᵀ D = 6 ≠ 4` | Pass: the failing hypothesis is the one on `K` | none |
| N05 | §1.1 root bijection, Lemma 10.1.1 with `a = e'` | `e = 3`, `p = 2`; `e = 6`, `p = 3`; contrast `e`-th roots, `p = 2` | `{1, ζ₃, ζ₃²} ↦ {1, α, α²}`; `{±1} ↦ {1, 2}`; `μ₂(ℚ₂) = {±1} ↦ {1}`, not injective, so only `e'` is claimed | Pass | none |
| F01 | index ownership sentence | index `:132–133` vs folder `:93–102` and §R17.5.11 *Needs* | “owns Brauer characters” vs “imported”/“owned here” | Mismatch | R01 |

## Not verifiable

- **Navarro (`navarro`), Theorem 6.10** (the kernel theorem): settled as uncertified and cited by locator only. Untouched by this diff; it was checked by computation (rows H12, D02).
- **Serre (`serre`)**: settled as uncertified, and no claim depends on it.
- **Ownership against open pull requests** rests on `roadmaps grep` and `overlaps.md` over the heads of the index of 2026-11-11T00:06:25Z. Pull requests that index does not carry were not searched.

## Source issues

- **Gap** in webb at Corollary 9.5.6, printed p. 160: the source states `C = Dᵀ D` for any splitting `p`-modular system, but derives it from Theorem 9.5.4, which also assumes `R` complete; it should either assume completeness or pass to the completion explicitly; affects nothing.
