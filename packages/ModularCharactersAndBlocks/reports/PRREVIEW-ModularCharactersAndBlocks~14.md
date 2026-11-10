# Review of ModularCharactersAndBlocks (pull request #1775 at 581ed75)
Folder: `TauCetiRoadmap/RepresentationTheory/ModularCharactersAndBlocks/`
**Verdict:** needs changes

🤖 Incremental AI re-review of the 30 lines in the folder that changed since `6aae470`. The previous R02 is repaired. The previous R01, the ownership sentence in the family index, is unchanged and is carried below as R01. The new Downstream consumers entry leaves out three of the twelve items that §8.4 now exports (R02). The other changed passages are correct on every instance computed below. These are the new *Needs:* lines, the Layer 5 and Layer 7 Dependencies, the §8.4 export list, the Scope sentence and the `Suggested.lean` docstring. Both findings are P3. The dependency check is clean and the build passes.

## R01 (P3) — the family index still names this roadmap the owner of Brauer characters

**Location:** `TauCetiRoadmap/RepresentationTheory/README.md:132–133`: “[ModularCharactersAndBlocks](ModularCharactersAndBlocks/README.md) consumes both and owns Brauer characters, decomposition matrices and blocks with defect.”

**Claim:** this roadmap owns the Brauer character.

**Witness:** the folder imports it. `README.md:80–85`, `:185–188`, `:364–372` and `:492` take it from GL2AutomorphicRepresentationsAndTransfer §R17.5.11, and that section is at its open head (`README.md:2927`). `git diff --stat 6aae470 HEAD` lists only the folder's two files, so the index is unchanged.

This is the previous report's R01 (first raised as R05), carried. No repair report marks it `not actionable`. The brief makes the family index part of this pull request, and the pull request's own diff already changes 24 lines of the index, this sentence among them.

**Repair:** in the index, write “… consumes both, takes the Brauer character from GL2AutomorphicRepresentationsAndTransfer §R17.5.11, and owns its basis theorem, decomposition matrices and blocks with defect.” Also update the description's paragraph on the family index, which currently repeats the old claim (“names it the owner of Brauer characters, …”). Tested: every use of the Brauer character in the folder (`README.md:80–85, 185–188, 364–372, 492`) then agrees with the index.

## R02 (P3) — the Downstream consumers entry leaves out three items that §8.4 exports

**Location:** `README.md:918–920`: “**GlaubermanZStar**: at `p = 2`, the interfaces of §8.4: sections, the splitting modular system, the block partition, the principal block and its kernel, generalized decomposition numbers, the second main theorem, block-section orthogonality and the local third main theorem.”

**Claim:** the list after the colon is the content of §8.4.

**Witness:** §8.4 (`:896–902`) also exports three items the entry leaves out:
- the compatibility of the decomposition map with a change of splitting modular system (§2.4);
- normal `p'`-subgroups (§8.2);
- the modular containment (§8.3).

GlaubermanZStar's contract at its head (`README.md:144–157`) consumes the first as “M2: the comparison between splitting modular systems”. It consumes the other two under M8, as the triviality of the simple modules of `B₀(H)` on `O(H)` and as inflation along a quotient by a normal subgroup of odd order.

**Repair:** replace the list after the colon by “sections; the splitting modular system, its root lifting, and the compatibility of the decomposition map with a change of splitting modular system; the block partition and the principal block; generalized decomposition numbers; the second main theorem and block-section orthogonality; the local third main theorem; normal `p'`-subgroups, the kernel theorem and the modular containment.” Alternatively, end the entry at “the interfaces of §8.4.” Tested: each of GlaubermanZStar's six citation groups (M1, M2, M4, M5, M7, M8) then has an entry, and each of the twelve items of §8.4 appears once.

## Previous findings

- R01 — not repaired: `TauCetiRoadmap/RepresentationTheory/README.md:132–133` still reads “consumes both and owns Brauer characters, decomposition matrices and blocks with defect” (this report's R01).
- R02 — repaired: `Suggested.lean:24–25` now reads “(Layers 4, 7 and 8)”. These are the homes of the block partition (§4.2, `README.md:548`), block-section orthogonality (§7.2, `:789`) and the kernel theorem (§8.3, `:877`).

## Verified sound

**Scope of this round.** The worktree is at `581ed7584bdcc6197845d4c4e534251281a8ba35` and clean. `git diff --stat 6aae470 HEAD` lists the folder's `README.md` (+17/−11) and `Suggested.lean` (one docstring line). The family index, `lake-manifest.json` and `lean-toolchain` are unchanged. The pins are Mathlib `1b1ccf4` and Tau Ceti `2fd255d`. The brief's command for changes outside the folder and the family index prints nothing.

**Gate.** The worker's gate on this head: every counter is `0`, `build=0`, `OK`. My runs:
- The brief's command as written gives `depcheck=1` (“NOT IN ORDER: ModularCharactersAndBlocks”) and `outside-folder=1` (`TauCetiRoadmap/RepresentationTheory/README.md`).
- The same command with `--order` set to the candidate merge order and with `--build` gives `depcheck=0`, `build=0` and only `outside-folder` on the family index.

Neither is a finding. The configured order does not list the roadmap yet, while the candidate lists it at line 101, right after its open supplier GL2AutomorphicRepresentationsAndTransfer (line 100). The brief names the family index as this pull request's own.

**Dependency check** (the brief's command), complete output:

```text
depcheck: 228 roadmaps, 2122 edges, 0 problem(s)
```

**Elaboration.** `lake env lean` on `Suggested.lean` exits `0` with eight `declaration uses sorry` warnings (lines 42, 56, 72, 99, 117, 127, 139, 153) and nothing else.

**Signatures.** I elaborated `#check @…` for all eleven declarations on a scratch copy of the file. The output agrees with `signatures.md`. For example, `brauer_first_main` keeps `[IsAlgClosed k] [Fact p.Prime] [CharP k p]`, `IsPGroup p D` and an `≃` between the two block subtypes. `brauer_third_main_local` keeps `P ⊔ C_G(P) ≤ H ≤ N_G(P)`. The diff touches no declaration, so nothing changed. The padding probe of the earlier rounds stands: no `sorry` closes with `rfl`, `simp`, `infer_instance` or `decide`.

**Library declaration opened.** `TauCeti.sum_characterTable_mul_conj` is at the pinned `TauCeti/RepresentationTheory/CharacterTable/Table.lean:585`. It states `∑_i χ_i(C) conj(χ_i(C')) = if C = C' then |G| / |C| else 0`. Since `|G| / |C| = |C_G(g)|`, this is the column orthogonality that §5.2's new *Needs:* line and Layer 5's Dependencies cite. CharacterTheory §3.5 on main names it (its `README.md:497, 508`).

**The changed passages, checked.**
- **Scope (`:28`) and §8.4 (`:896–902`).** Each of the ten sections that §8.4 names exists and states the exported item; the line numbers are in row C07. GlaubermanZStar's six citation groups at its head (`README.md:144–157`) each map to an item of §8.4 (row C01). That roadmap's head says it consumes them at `p = 2` (its `:54`), as §8.4 says.
- **§5.2 *Needs:* (`:624`) and Layer 5 Dependencies (`:643`).** The union of the two *Needs:* lines is Layers 0, 2 and 3, and no `§4.x` is cited (C03).
- **§7.2 *Needs:* lines (`:788`, `:793`).**
  - The block form needs §4.2 only in the case `u = v` with `φ` and `ψ` in different blocks of `C_G(u)`, where the block-diagonal Cartan matrix of §4.2 gives `c^u_{φψ} = 0`. The line lists §4.2 (C04).
  - Block-section orthogonality expands `χ(ux)` by §§0.1 and 5.1 and then applies the block form with `u ≠ v`, so its line is complete (C05).
- **Layer 7 Dependencies (`:828`).** The union of the *Needs:* lines of §§7.1–7.3 is Layers 0, 4, 5 and 6 (C06).

**Sources read at the locator this round.** Martínez printed page = extraction page − 8; Sambale printed page = extraction page.
- Sambale, Theorems 1.12–1.14 (`sambale` lines 442, 445, 465–474, p. 16). Theorem 1.14 has the value `c_{φψ}` exactly when `u = v`, `b_u = b_v` and `b_u^G = B`. Theorem 1.15 (line 478, p. 17).
- Martínez, Corollary 2.4 (`martinez` line 451, p. 11): `g` `p`-regular and `x` `p`-singular. Theorem 8.5(iii) (line 1933, p. 52): for a normal `p'`-subgroup `N`, a block of `G/N` inside `B` has the same `Irr`, the same `IBr` and defect groups `PN/N`.

Each supports the README's statement as written.

**The seeded sample.** Four sampled targets fall in or under the changed passages: §5.2 (its *Needs:* line), §7.2 (its two *Needs:* lines, locators above), §8.4 (no locator; every reference resolves, C07) and §8.2 (cited by §8.4; Martínez 8.5(iii) above). The other sampled targets (§§0.2, 1.2, 2.1, 2.3, 2.4, 3.1, 4.1, 4.2, 5.1, 7.3, 8.3) are untouched by the diff and were passed by earlier reviews. Of these, §§2.4, 4.2, 5.1 and 8.3 were re-read only to confirm that they state what §8.4 exports.

**Cross-roadmap citations and ownership.**
- GL2AutomorphicRepresentationsAndTransfer §R17.5.11 resolves at its open head (`README.md:2927`).
- The overlap and citation reports (main `8101f2c`, 438 heads) list nothing. The diff drops no id: it renumbers no section and renames no heading.
- `roadmaps grep` for the new §8.4 wording finds it only in this folder.

**Remarks on untouched text.**
- Layer 8's Dependencies (`:914`, “Layers 3–7”) omit Layers 0–2. §§8.1–8.2 use them directly (§0.2 block idempotents, §2.1 inflation of Brauer characters), and §8.4 now names them. The build order is unaffected, since Layer 3 needs Layers 1–2 and those need Layer 0.
- Notes for the consumer, not changes here. GlaubermanZStar's head cites block-section orthogonality as “M5” (its `README.md:51, 147–150, 911, 927`), but here it is §7.2. It takes `O(G)` from LocalFiniteGroupTheory L1 (its `:44–45`), while §8.2 here defines `O_{p'}(G)` and §8.4 exports it. Its M8 inflation law, for a normal subgroup of odd order at `p = 2`, is §8.2's “same ordinary and Brauer characters” (Martínez 8.5(iii)), plus the one-line step that `e_N` acts as the identity on `χ` exactly when `N ≤ ker χ`.

**Adversarial computations.** Notation: `r = (123)`, `ζ = ζ₃`; in `S₃` at `p = 2`, `B₀ = {1, sgn}` and `{std}` is the block of defect zero. Rows C01–C10 were computed this round for the changed statements. The rows marked “r13” are carried from the previous report for statements the diff leaves untouched.

| Row | Statement | Instances | Values on the two sides | Result | Change |
| --- | --- | --- | --- | --- | --- |
| C01 | Scope `:28`: GlaubermanZStar consumes the interfaces of §8.4 | GlaubermanZStar contract `README.md:144–157` | M1 → §1.1 root bijection (`:284`); M2 → §2.4 (`:468`); M4 → §§4.2 (`:557–560`), 4.3; M5 → §5.1, §7.2 (`:789`); M7 → §§7.2, 7.3; M8 → §8.3 (`:879`, `:884`), §8.2 (`:849–850`): 6 of 6 | Pass | none |
| C02 | §5.2 *Needs:* `TauCeti.sum_characterTable_mul_conj` | pinned `Table.lean:585`; `S₃`, `C₃` | `S₃` columns `(12),(12)`: `1 + 1 + 0 = 2 = 6/3`; `1,(12)`: `1 − 1 + 0 = 0`; `r,r`: `1 + 1 + 1 = 3 = 6/2`; `C₃` `r,r`: `∑ ζ^j ζ^{−j} = 3 = 3/1` | Pass | none |
| C03 | Layer 5 Dependencies `:643` | the *Needs:* of §§5.1, 5.2 | §5.1: §§0.1, 2.2, 2.4 → {0, 2}; §5.2: §§3.1, 5.1 → {3}; union {0, 2, 3}; no §4.x | Pass | none |
| C04 | §7.2 block form, *Needs:* §§4.2, 5.2, second main theorem | `S₃`, `p = 2`; `(u, v, φ, ψ, B)` as listed | `(1,1,1,1,B₀)`: `1 + 1 = 2 = c₁₁`; `(1,1,1,1,{std})`: `0`; `((12),(12),1,1,B₀)`: `1 + 1 = 2 = c^{(12)}`; `(1,(12),1,1,B₀)`: `1 − 1 = 0`; `(1,1,1,std,B₀)`: `0 + 0 = 0 = c_{1,std}` (needs §4.2) | Pass | none |
| C05 | block-section orthogonality, *Needs:* §§0.1, 4.2, 5.1, block form | `S₃`, `p = 2`; `(g, h) = (1,(12))`, `(r,(12))` | `B₀`: `1·1 + 1·(−1) = 0` both; `{std}`: `2·0 = 0`, `(−1)·0 = 0` | Pass | none |
| C06 | Layer 7 Dependencies `:828` | the *Needs:* of §§7.1–7.3 | §7.1: §§4.2, 6.2–6.3; §7.2: §§5.1, 6.3, 7.1, then §§4.2, 5.2 and §§0.1, 4.2, 5.1; §7.3: §4.3, Layer 6; union {0, 4, 5, 6} | Pass | none |
| C07 | §8.4 export list | its ten section references | §0.1 `:205`; §1.1 `:284–285`; §2.4 `:467–468`; §4.2 `:557–560`; §4.3 `:574`; §5.1 `:597`; §7.2 `:777, 789`; §7.3 `:810`; §8.2 `:846`; §8.3 `:879, 884`: 10 of 10 | Pass | none |
| C08 | Downstream consumers `:918–920` | its list vs §8.4 | §8.4: 12 items; the entry: 9; missing §2.4 change of system, §8.2 normal `p'`-subgroups, §8.3 modular containment | **Fail** | R02 |
| C09 | `Suggested.lean:24–25` layer list | the bullet's three items | homes §4.2 `:548`, §7.2 `:789`, §8.3 `:877` vs “Layers 4, 7 and 8” | Pass | none (previous R02 repaired) |
| C10 | family-index ownership | index `:132–133` vs folder `:80–85`, GL2 `:2927` | index: owner of Brauer characters; folder: imports them from GL2 §R17.5.11 | **Fail** | R01 |
| B01 | §1.1 `F → K` bijective on `e`-th roots (r13) | `G = 1`, `p = 5`; `S₃`, `p = 2`; `C₂`, `p = 2`; `C₄`, `p = 5` | `μ₁ = {1}` both, all roots `2` vs `4`; `6 = 6`; `{±1}` both; `4 = 4` | Pass | none |
| B02 | §1.2 Check `G = 1` (r13) | lattices `O`, `mO` | `O/m ≅ k`, `m/m² ≅ k`, class `1` each | Pass | none |
| B03 | §5.2 relations over `Irr(G)` (r13) | `C₂`, `S₃` at `p = 2` | `∑ d¹dᵗ = 0`, `∑ dᵗdᵗ = 2`; `Q*Q = diag(2,1,2)` | Pass | none |
| B04 | §5.2 as Sambale 1.14 summed (r13) | `S₃`, `p = 2` | `B₀`: `2`, defect zero `0`, total `2 = c₁₁` | Pass | none |
| B05 | §7.1 first main rule = `b ↦ b^G` (r13) | `S₅`, `p = 3`, `D = ⟨r⟩` | `λ_{(1+s)/2} = 4 ≡ 1 = λ_{B₁} ≡ 10`; `λ_{(1−s)/2} = 2 ≡ −10` | Pass | none |
| B06 | §7.1 `N_G(D) ≤ H ≤ G` (r13) | `H = S₅`, `H = N_G(D)` | identity on `{B₁, B₂}`; transitivity | Pass | none |
| B07 | §7.1 product criterion (r13) | `H = C_G(D)`, `N_G(D)` | `(1+s)/2·(1+s)/2 ≠ 0`, `·(1−s)/2 = 0` | Pass | none |
| B08 | §7.1 `S₅` Check (r13) | `e_B` on `C_G(D)` | `e_{B₁} = (1+s)/2`, `e_{B₂} = (1−s)/2`; ranks `3`, `1` on `χ₄` | Pass | none |
| B09 | §7.2 block form, statement (r13) | `S₅`, `p = 3`, `u = v = r` | `B₂`: `∑ d₋² = 3 = c`, `∑ d₊² = 0`; `B₁`: `3`; `χ₆`: `0` | Pass | none |
| B10 | §7.2 block-section orthogonality, statement and Check (r13) | `S₅`; `C₃`; `S₃` | `1 + 4 − 5 = 0`; `∑ ζ^{2j} = 0`; `2 + 4 = 6` | Pass | none |
| A01 | §0.1 class sizes (r13) | `S₃`, `p = 2` | `3 = 3·1`; `2 = 1·2` | Pass | none |
| A02 | §0.2 blocks (r13) | `𝔽₃[C₂]`, `𝔽₂[C₂]` | `(2+2t)² = 2+2t`; `e₊e₋ = 0`; `(1+t)² = 0` | Pass | none |
| A03 | `complete_blockIdempotents_unique` (r13) | `𝔽₃[C₂]`; `G = 1` | swap; singletons | Pass | none |
| A04 | §1.1 residue field (r13) | `e = 3`, `p = 2, 3`; `e = 4`, `p = 3` | `𝔽₄`; `𝔽₃`; `𝔽₉` | Pass | none |
| A07 | §1.3 lifts (r13) | `ℤ₂[C₃]`; `ℤ₂[C₂]` | `(2−r−r²)/3 ↦ r + r²`; `(1±t)/2 ∉ ℤ₂[C₂]` | Pass | none |
| A08 | `existsUnique_blockIdempotent_map_residue` (r13) | `ℤ₂[C₃]` | unique central lifts | Pass | none |
| A09 | §2.1 induced and dual (r13) | `Ind_1^{S₃} 1`; `C₃/𝔽₄` | `(6,0) = 2(1,1) + 2(2,−1)`; `r ↦ ζ²` | Pass | none |
| A10 | `card_simpleModules_eq_card_pRegularClasses` (r13) | `S₃`, `p = 3, 2`; `C_p`; `C₃/𝔽₂` | `2 = 2`; `2 = 2`; `1 = 1`; `2 ≠ 3` | Pass | none |
| A11 | §2.3 residue splitting (r13) | `C₃` over `𝔽₄`, `𝔽₂`, `𝔽₄(T)`, `𝔽₂(T)` | `3`; `1, 2`; `k³`; `k × k[x]/(x²+x+1)` | Pass | none |
| A12 | §2.3 endomorphism count (r13) | `n = [k₁ : k₀]` | `n = n²` forces `n = 1` | Pass | none |
| A13 | §2.4 decomposition map (r13) | `S₃`, `p = 3, 2`; `C₂` | `(2,0) = (1,1) + (1,−1)`; `[[1],[1]]` | Pass | none |
| A14 | §2.4 surjectivity route (r13) | projection formula | each term in `im(d ∘ Ind_E)` | Pass | none |
| A15 | §3.1 reciprocity (r13) | `S₃`, `p = 3, 2`; `C_p` | `[[2,1],[1,2]]`, `det 3`; `diag(2,1)`; `[p]` | Pass | none |
| A16 | §3.1 Hom formula (r13) | `S₃`, `p = 2` | `(2+4)/6 = 1`; `(4−4)/6 = 0` | Pass | none |
| A17 | §4.2 central characters (r13) | `S₃`, `p = 2`; `S₅`, `p = 3` | `3, −3, 0`; `≡ 1, 2, 2, 1, 2, 1, 0` | Pass | none |
| A18 | §4.3 augmentation (r13) | `𝔽₂[S₃]`; `G = 1` | `1`, `0`; `1` | Pass | none |
| A19 | §5.1 (r13) | `C₃`; `S₃`, `p = 3`; `S₅` | `ζ^j`; `(1,1,−1)`; `d₊ = 0`, `d₋ = 1` | Pass | none |
| A22 | `brauerProjection_mul` (r13) | `S₃`, `P = ⟨(12)⟩`; controls | `0 = 0`; `1 ≠ 0`; `2 ≠ 0` | Pass | none |
| A23 | §6.1 Rosenberg (r13) | primitive `e` | one summand a unit of `eAe` | Pass | none |
| A24 | `IsDefectGroup` (r13) | `S₃`, `p = 2`; `C₃`; `G = 1` | `Br(1+r+r²) = 1`; `Br(r+r²) = 0`; `1` | Pass | none |
| A25 | `isDefectGroup_conj` (r13) | any field | `e Z(k[G])` local | Pass | none |
| A26 | `isDefectGroup_iff_sylow_of_augmentation_ne_zero` (r13) | `S₃`; `S₅`, `N_G(D)` | Sylow for `e₀`; `aug((1±s)/2) = 1, 0` | Pass | none |
| A28 | `brauer_first_main`, Lean (r13) | `S₅`, `p = 3`; `S₃`; `D = 1` | `≠ 0`; `≠ 0`; identity | Pass | none |
| A29 | §7.2 second main theorem (r13) | `S₃`, `u = (12)`; `S₅`, `u = r` | `(1,−1,0)`; `χ₄`: `d₋ ≠ 0` only | Pass | none |
| A30 | `brauer_third_main_local` (r13) | `S₅`; `S₃`; `P = 1` | `(1+s)/2` nonzero only with itself; `1`; `e₀` | Pass | none |
| A31 | §8.1 (r13) | `S₃`, `p = 3`, `N = C₃` | `1 ↦ e₊ + e₋` | Pass | none |
| A32 | §8.3 kernel theorem (r13) | `S₃`, `p = 2, 3`; `C_p` | `C₃`; `1`; `1` | Pass | none |

## Not verifiable

- **Navarro, Theorem 6.10 (`navarro`), and Serre, Part III (`serre`)**: settled as uncertified and cited by locator only. Neither locator is in a changed passage.
- **Ownership against open pull requests** rests on `roadmaps grep` and the overlap report over the heads in the index of 2026-11-10T17:49:16Z. Pull requests that index does not carry were not searched.

## Source issues

- none
