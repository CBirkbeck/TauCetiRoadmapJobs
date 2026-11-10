# Review of ModularCharactersAndBlocks (pull request #1775 at f491552)
Folder: `TauCetiRoadmap/RepresentationTheory/ModularCharactersAndBlocks/`
**Verdict:** needs changes

Incremental re-review of the 4 lines that changed in the folder since `07303de`. They all fall in one Check of §3.1. The previous R01 (the wrong value in the §3.1 pairing Check) is repaired. The new wording is correct on all three instances computed below and introduces no new problem. The previous R02 (the family-index ownership sentence) is unchanged, and it is the one finding of this report (P3). The worker's gate passes, the dependency check reports no problem, `Suggested.lean` is unchanged and elaborates with only `sorry` warnings, and the §3.1 locators of the seeded sample check out against the texts.

## R01 (P3) — The family index still names this roadmap the owner of Brauer characters

Re-raised: H02 (the earlier repair report's H01 marked this finding `Not actionable in this package`; the last repair report's H02 answered it for the same reason, without the marker).

**Location:** `TauCetiRoadmap/RepresentationTheory/README.md:132–133`: “[ModularCharactersAndBlocks](ModularCharactersAndBlocks/README.md) consumes both and owns Brauer characters, decomposition matrices and blocks with defect.”

**Claim:** this roadmap owns the Brauer character.

**Witness:** the folder imports the Brauer character, its projective pairing and the independence of the simple Brauer characters from GL2AutomorphicRepresentationsAndTransfer §R17.5.11 (`README.md:91–100`, `:551–558`). It also imports the decomposition map over finite extensions of `ℚ_p` from ArithmeticGaloisDuality §R02.4.4 (`README.md:81–90`). Since `07303de` the index is unchanged (`git diff 07303de HEAD` lists only the folder README).

**Why the stated reason does not settle it:** the repair report says the index is outside the files a repair round may edit. That is a limit on what the repair round can edit. It does not make the sentence correct. The brief makes the family index part of this pull request, and the pull request's own diff already changes this sentence (`git diff --stat origin/main...HEAD` lists the index with 24 changed lines). So the author owes the edit before merge.

**Repair** (the replacement the last repair report already proposes, unchanged): in the index, write “[ModularCharactersAndBlocks](ModularCharactersAndBlocks/README.md) consumes both, takes the Brauer character and its projective pairing from GL2AutomorphicRepresentationsAndTransfer §R17.5.11 and the decomposition map over finite extensions of `ℚ_p` from ArithmeticGaloisDuality §R02.4.4, and owns the Brauer-character basis theorem, the decomposition map of an arbitrary `p`-modular system, decomposition matrices, Brauer reciprocity and blocks with defect.” Tested clause by clause against the folder at this head: the basis theorem is §2.2, the arbitrary-system decomposition map is §§1.2 and 2.4 (`README.md:85–90`), reciprocity is §3.1 (`:559–561`) and blocks are Layers 4–8. The two imports match `:81–100`.

## Previous findings

- R01 — repaired: `README.md:579–582` now reads “in place of both `P` and `U` (its Brauer character in place of `Φ_P`) it would give `1·1/2 = 1/2`, whereas `dim End(k) = 1` … Replacing `P` alone shows nothing: … `1·2/2 = 1 = dim Hom(k, k[C₂])`, the socle `k(1 + t)`.”
- R02 — not repaired: `TauCetiRoadmap/RepresentationTheory/README.md:132–133` still reads “consumes both and owns Brauer characters, decomposition matrices and blocks with defect.” Carried as R01.

## Verified sound

**Head and scope.** The worktree is clean at `f491552`. `git diff --stat 07303de HEAD` lists only the folder `README.md` (+3/−1, lines 579–582). `Suggested.lean`, the family index, `lake-manifest.json` and `lean-toolchain` are unchanged since `07303de`. The brief's command for changes outside the folder and the family index prints nothing. Nothing else in the README depends on the changed bullet: a grep for `k[C₂]`, `1/2` and `Proposition 10.2.1` finds only the §3.1 statement (`:553`), this bullet, and two unrelated `1/2` values (`:660`, `:725`).

**The changed Check, recomputed.** For `G = C₂` at `p = 2`, only `1` is `2`-regular, so the formula of Webb Proposition 10.2.1 gives `Φ_P(1)·φ_U(1)/2`.
- `P = U = k[C₂]`: `2·2/2 = 2`, and `dim End_{k[C₂]}(k[C₂]) = dim k[C₂] = 2`. The formula holds.
- `P = U = k` (not projective; `φ_k(1) = 1` in place of `Φ_P(1)`): `1·1/2 = 1/2`, but `dim End(k) = 1`. The formula fails, so the control works.
- `P = k`, `U = k[C₂]`: `1·2/2 = 1`, and `Hom_{k[C₂]}(k, k[C₂]) = k[C₂]^{C₂} = k(1 + t)`, which has dimension 1. This is the socle of `k[C₂] ≅ k[x]/(x²)` with `x = 1 + t`. Equality holds, so replacing `P` alone shows nothing, as the bullet now says.
- Not stated in the bullet, but consistent with it: `P = k[C₂]`, `U = k` gives `2·1/2 = 1 = dim Hom(k[C₂], k)`.

Substituting the Brauer character for `Φ_P` is exactly how Webb states the formula (with `φ_P`, which agrees with `Φ_P` on `p`-regular elements for projective `P`). The generator `t` of `C₂` is used the same way, without introduction, elsewhere in the README (`:294`, `:354`, `:382`, `:608`).

**Gate.**
- The worker's gate on this head: every counter `0`, `build=0`, `OK`.
- My run of the brief's command (configured order): `depcheck=1` (“NOT IN ORDER: ModularCharactersAndBlocks (insert it after its last supplier)”) and `outside-folder=1` on `TauCetiRoadmap/RepresentationTheory/README.md`. Every other counter is `0`.
- The same command with `--order` set to the candidate merge order and with `--build`: `depcheck=0`, `build=0`, and only `outside-folder=1` on the family index.
- None of these is a finding. The candidate order lists this roadmap at line 102, right after its open supplier GL2AutomorphicRepresentationsAndTransfer (line 101), with ArithmeticGaloisDuality at line 62. The brief names the family index as this pull request's own.

**Dependency check** (the brief's command), complete output:

```text
depcheck: 235 roadmaps, 2133 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line.

**Elaboration.** `lake env lean` on `Suggested.lean` gives ten `declaration uses sorry` warnings (lines 47, 61, 77, 118, 136, 146, 158, 175, 187, 210) and nothing else. The file is unchanged (10 theorems, 5 definitions). So the previous review's signature comparison (no binder lost) and its padding probe (all ten theorems fail `first | rfl | infer_instance | simp | aesop | decide`) still hold at the same pins.

**Seeded sample, where it falls in the change: §3.1.** Each locator was checked against the text. Webb's printed page = PDF page − 7; Martínez's printed page = PDF page − 8.

| Claim in §3.1 | Locator | Text |
| --- | --- | --- |
| `Φ_φ` vanishes on `p`-singular elements | Martínez Prop 1.12, p. 5 | `martinez` 264 (PDF p. 13) |
| `|G|_p` divides `Φ_φ(1)` | Martínez Cor 1.13, p. 6 | `martinez` 300 (PDF p. 14) |
| `Φ_φ = ∑_χ d_{χφ} χ` (splitting system, `R` complete) | Webb Thm 9.5.4(2), p. 159 | `webb` 6670–6676 (PDF p. 166): the matrix of `e` is `D` |
| dim Hom formula, `P` projective, `U` finite-dimensional, `p`-modular system | Webb Prop 10.2.1, p. 174 | `webb` 7383–7386 (PDF p. 181) |
| `C = DᵀD` | Webb Prop 9.5.1, p. 157 and Cor 9.5.6, p. 160 | `webb` 6623 (`c = de`, PDF p. 164), 6712–6713 (splitting system, `C = DᵀD`, symmetric, PDF p. 167) |
| projective `O[G]`-modules determined by ordinary character | Webb Cor 10.3.3, p. 183 | `webb` 7720–7723 (PDF p. 190) |

The other seeded targets (§§0.1, 0.2, 1.1, 1.3, 2.1, 4.1–4.3, 5.1, 6.2, 7.2, 7.3, 8.1, 8.2) are outside the changed passage and untouched since `07303de`. The previous review checked §§0.1, 0.2, 1.3, 2.1, 4.1, 4.2, 7.2, 7.3 and 8.2 against the texts. The README flags no locator as unverified.

**Citations the changed section depends on, resolved this round.**
- GL2AutomorphicRepresentationsAndTransfer §R17.5.11 is at its open head (`roadmaps grep`: its `README.md:2927`, “R17.5.11 Prime-regular characters and reduction comparison”).
- Tau Ceti at the pin: `TauCeti.projectiveSimplePairing` (`RepresentationTheory/GrothendieckGroup/CartanMatrix.lean:77`), `TauCeti.projectiveSimplePairing_isPerfPair` (`:115`), `TauCeti.cartanMatrix` (`:138`), all in `namespace TauCeti` (`:53`).
- The worker's resolver lists no citation or Lean name as found nowhere.
- `overlaps.md` reports no other pull request changing this roadmap, no cited id dropped and no id defined only by an open revision.
- The change adds no object, so ownership is as in the previous review.

**Pull-request description.** Nothing in it is made wrong by the change. Its claim that neither the roadmap nor the family index names LocalFiniteGroupTheory holds (0 occurrences in each).

**Adversarial table.** Rows for statements the diff leaves untouched are carried from the previous review (r17, at `07303de`), with its values. S08 was recomputed this round. F01 was rechecked against this head. Notation: `r = (123)`, `t = (12)` (in `C₂` its generator), `ζ = ζ₃`, `α ∈ 𝔽₄` with `α² + α + 1 = 0`; in `𝔽₂[S₃]`, `e₀ = 1 + r + r²`, `e₁ = r + r²`.

| Row | Statement | Instances | Values on the two sides | Result | Change |
| --- | --- | --- | --- | --- | --- |
| S08 | §3.1 pairing Check (changed) | `C₂`, `p = 2`: `P = U = k[C₂]`; `P = U = k`; `P = k`, `U = k[C₂]`; `P = k[C₂]`, `U = k` | `2·2/2 = 2` vs `dim End = 2`; `1·1/2 = 1/2` vs `dim End(k) = 1`; `1·2/2 = 1` vs `dim k(1+t) = 1`; `2·1/2 = 1` vs `1` | Pass (control fails as the bullet says) | none (previous R01 repaired) |
| S08′ | §3.1 other Checks (unchanged, r17) | `S₃` at 3, 2 | `DᵀD = [[2,1],[1,2]]`, `det 3`; `diag(2,1)`; `⟨Φ_1, φ_1⟩ = (2 + 4)/6 = 1`, `⟨Φ_1, φ_std⟩ = (4 − 4)/6 = 0` | Pass | none |
| H01 | `complete_blockIdempotents_unique` (r17) | `𝔽₃[C₂]`; `𝔽₂[S₃]`; `G = 1` | `(2+2t)² = 2+2t`, `e₊e₋ = 0`; `{e₀, e₁}`; `{1}` | Pass | none |
| H02 | `existsUnique_blockIdempotent_map_residue` (r17) | `ℤ₂[C₃]`; `ℤ₂[C₂]` | `(1+r+r²)/3 ↦ e₀`, `(2−r−r²)/3 ↦ e₁`; `1 ↦ 1`, `(1±t)/2 ∉ ℤ₂[C₂]` | Pass | none |
| H03 | `card_simpleModules_eq_card_pRegularClasses` (r17) | `S₃` at 2, 3; `G = 1`; `C₃/𝔽₂` | `2 = 2`; `2 = 2`; `1 = 1`; control `2 ≠ 3` | Pass | none |
| H04 | `brauerProjection_mul` (r17) | `S₃`, `p = 2`, `P = ⟨t⟩`; controls | `Br(e₁²) = 0 = 0²`; over `ℚ`: `(r+r²)² = 2 + r + r²`; `P = C₃`: `3e₀ = e₀ ≠ 0 = Br(x)²` | Pass | none |
| H05 | `IsDefectGroup`, `isDefectGroup_conj` (r17) | `S₃`, `p = 2` | `e₀`: `Br_{⟨t⟩} = 1 ≠ 0`, 3 conjugates; `e₁`: `Br_{⟨t⟩} = 0`, defect `1` | Pass | none |
| H06 | `isDefectGroup_iff_sylow_of_augmentation_ne_zero` (r17) | `𝔽₂[S₃]` | `aug e₀ = 1`: Sylow; `aug e₁ = 0`: defect `1` | Pass | none |
| H07 | `brauer_first_main` (r17) | `S₅`, `p = 3`; `D = 1` | `ω(K_s)`: `1, 2, 2` mod 3; `(1+s)/2 · (1−s)/2 = 0`; `e·e = e` | Pass | none |
| H08 | `sum_sameBlock_mul_conj_eq_zero` (r17) | `S₃` at 2, 3; controls | `1 − 1 = 0`; `(−1)·0 = 0`; `1 + 1 − 2 = 0`; same `p`-parts `2 ≠ 0`; `p ∉ M` control `2 ≠ 0` | Pass | none |
| H09 | `brauer_third_main_local` (r17) | `S₃`, `p = 2`, `P = H = ⟨t⟩`; `P = 1` | `Br_P(e₀) = 1`, `aug 1 = 1`; `H = G`: `e₀ b ≠ 0 ⇔ b = e₀` | Pass | none |
| H10 | `mem_pPrimeCore_iff_forall_principalBlock` (r17) | `S₃` at 2, 3; `G = 1` | `p = 2`: `−6 ∈ M`, `−3 ∉ M`, `C₃ = O_{2'}`; `p = 3`: `1 = O_{3'}`; control `C₃ ≠ 1` | Pass | none |
| H11 | `SameBlock` (r17) | `C₃`, `M ∋ 2`, `M ∋ 3` | three classes; `(1 − ζ)² = −3ζ ∈ M`: one class | Pass | none |
| S01–S07 | §§0.1–2.4 (r17) | as in r17 | e.g. `S₃` at 2: sizes `3 + 3`; `𝔽₄` sum `= r + r²`; `(6,0) = 2(1,1) + 2(2,−1)`; `det [[1,1],[1,−1]] = −2`; `C₂ × C₂` at 3: `i ∉ ℚ₃` | Pass | none |
| S09–S17 | §§4.1–8.3 (r17) | as in r17 | e.g. `e₊e₋ = (1 − t²)/4 = 0`; `ω(K_t) = 3, −3, 0`; `det Q = −3`; `Tr_1^P(r) = r + r²`; `d^u = (1, −1, 0)`; `e_N = e₀` | Pass | none |
| C01–C02 | library conventions (r17) | `S₃`, `C = [t]`; trivial `𝔽₂[C₃]`-module `𝔽₂²` | `1 + 1 + 0 = 2 = 6/3`; trace `0`, Brauer value `2` | Pass | none |
| F01 | family-index ownership | index `:132–133` against folder `:91–100` at `f491552` | “owns Brauer characters” vs “imported from §R17.5.11” | Mismatch | R01 |

No remark on untouched text.

## Not verifiable

- **Navarro (`navarro`)** and **Serre (`serre`)**: settled as uncertified and cited by locator only. The changed section cites neither.
- **Ownership against open pull requests** rests on `roadmaps grep` and `overlaps.md` over the heads in the index of 2026-11-10T21:14:57Z. Pull requests that index does not carry were not searched. The change adds no new object.

## Source issues

- none
