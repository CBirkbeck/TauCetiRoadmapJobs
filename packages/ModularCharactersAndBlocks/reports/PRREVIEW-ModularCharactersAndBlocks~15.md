# Review of ModularCharactersAndBlocks (pull request #1775 at f49016c)
Folder: `TauCetiRoadmap/RepresentationTheory/ModularCharactersAndBlocks/`
**Verdict:** needs changes

🤖 Incremental AI re-review of the 11 lines in the folder that changed since `581ed75`. The previous R02 is repaired: the Downstream consumers entry now lists every item that §8.4 exports. The previous R01, the ownership sentence in the family index, is unchanged and is the one finding below (P3). Both changed passages are correct, the dependency check is clean and the build passes.

## R01 (P3) — the family index still names this roadmap the owner of Brauer characters

**Location:** `TauCetiRoadmap/RepresentationTheory/README.md:132–133`: “[ModularCharactersAndBlocks](ModularCharactersAndBlocks/README.md) consumes both and owns Brauer characters, decomposition matrices and blocks with defect.”

**Claim:** this roadmap owns the Brauer character.

**Witness:** the folder imports it. `README.md:80–85`, `:185–188`, `:364–372` and `:492` take it from GL2AutomorphicRepresentationsAndTransfer §R17.5.11, which is at that roadmap's open head (`README.md:2927`). `git diff --stat 581ed75 HEAD` lists only the folder's `README.md`, so the index is unchanged.

This is the previous report's R01, carried. No repair report marks it `not actionable`. The family index is part of this pull request, whose own diff already changes this sentence.

**Repair:** in the index, write “… consumes both, takes the Brauer character from GL2AutomorphicRepresentationsAndTransfer §R17.5.11, and owns its basis theorem, decomposition matrices and blocks with defect.” Tested: every use of the Brauer character in the folder (`README.md:80–85, 185–188, 364–372, 492`) then agrees with the index, and with the description, which already says the roadmap takes the Brauer character from §R17.5.11 and owns “the remaining Brauer-character formulas, the basis theorem (§2.2), …”.

## Previous findings

- R01 — not repaired: `TauCetiRoadmap/RepresentationTheory/README.md:132–133` still reads “consumes both and owns Brauer characters, decomposition matrices and blocks with defect” (this report's R01). The description's paragraph on the index no longer repeats the claim.
- R02 — repaired: `README.md:918–923` now lists the sections (§0.1), the modular system, root lifting (§1.1) and change of system (§2.4), §§4.2–4.3, §5.1, §7.2, §7.3 and §§8.2–8.3, as §8.4 does.

## Verified sound

**Scope of this round.** The worktree is at `f49016c76d0dd2c938af39eb260ac6ce46c1d53f` and clean. `git diff --stat 581ed75 HEAD` lists the folder's `README.md` only (+7/−4): the Layer 8 Dependencies line (`:914`) and the Downstream consumers entry (`:918–923`). `Suggested.lean`, the family index, `lake-manifest.json` and `lean-toolchain` are unchanged. The brief's command for changes outside the folder and the family index prints nothing.

**Gate.** The worker's gate on this head: every counter is `0`, `build=0`, `OK`. My run of the gate with `--order` set to the candidate merge order gives every counter `0` except `outside-folder=1` on `TauCetiRoadmap/RepresentationTheory/README.md`. That is not a finding: the brief names the family index as this pull request's own.

**Dependency check** (the brief's command), complete output:

```text
depcheck: 225 roadmaps, 2087 edges, 0 problem(s)
```

**Elaboration.** `lake env lean` on `Suggested.lean` exits `0` with eight `declaration uses sorry` warnings (lines 42, 56, 72, 99, 117, 127, 139, 153) and nothing else. The file is byte-identical to the one the previous review read, so its `#check @…` comparison of the eleven signatures and its padding probe stand, and `signatures.md` reports no lost binder.

**The changed passages, checked.**
- **Downstream consumers (`:918–923`).** Compared item by item with §8.4 (`:896–902`): the same items in the same order with the same section numbers (row D01). Each section reference resolves to a heading that states the item: §0.1 `:205`, §1.1 `:279`, §2.4 `:457`, §4.2 `:548`, §4.3 `:574`, §5.1 `:597`, §7.2 `:777`, §7.3 `:804`, §8.2 `:846`, §8.3 `:877`. Each of GlaubermanZStar's six citation groups at its head `581115c` (its `README.md:144–157`: M1, M2, M4, M5, M7, M8) has an item (row D02). That head consumes them at `p = 2`, as the entry says.
- **Layer 8 Dependencies (`:914`, “Layers 0–7”).** Layer 8 uses each of Layers 0–7 directly (row D03), so the line is exact and the previous report's remark on it is answered.

**The seeded sample.** The diff changes no statement, locator or hypothesis. The sampled targets §§0.1, 1.1, 2.4, 4.2, 4.3 and 8.2–8.3 are named by the changed entry and were re-read only to confirm that they state what the entry lists. The other sampled targets (§§1.3, 2.1, 4.1, 5.2, 6.2, 6.3, 7.1, 8.1) are untouched; their locators were read in the earlier rounds (Martínez, Sambale; see the previous report). The README flags no locator as unverified.

**Cross-roadmap citations and ownership.**
- GL2AutomorphicRepresentationsAndTransfer §R17.5.11 resolves at its open head (`README.md:2927`).
- GlaubermanZStar resolves at its open head; it is a consumer and appears on no *Needs:* line.
- The overlap report (437 open heads, index of 2026-11-10T18:34:22Z) lists no other pull request changing this roadmap and no dropped id. The diff renumbers no section and renames no heading.

**Remark on untouched text.** Notes for the consumer, not changes here: GlaubermanZStar's head cites block-section orthogonality as “M5” where it is §7.2 here, and takes `O(G)` from LocalFiniteGroupTheory L1 while §8.2 here defines `O_{p'}(G)`.

**Adversarial computations.** Notation: `r = (123)`, `ζ = ζ₃`; in `S₃` at `p = 2`, `B₀ = {1, sgn}` and `{std}` is the block of defect zero. Rows D01–D04 were computed this round for the changed passages. Rows marked “(r14)” or “(r13)” are carried from the previous report for statements the diff leaves untouched.

| Row | Statement | Instances | Values on the two sides | Result | Change |
| --- | --- | --- | --- | --- | --- |
| D01 | Downstream consumers `:918–923` equals §8.4 `:896–902` | item-by-item | §8.4: sections; system + root lifting; change of system; block partition + principal block; gen. decomposition numbers; second main + block-section; local third main; `p'`-subgroups + kernel + containment: 8 groups, 13 items. Entry: the same 8 groups, 13 items; missing 0, extra 0 | Pass | none (previous R02 repaired) |
| D02 | the entry covers GlaubermanZStar's contract | its `README.md:144–157` | M1 → §1.1; M2 → §2.4; M4 → §§4.2–4.3; M5 → §§5.1, 7.2; M7 → §§7.2, 7.3; M8 → §§8.2–8.3: 6 of 6 | Pass | none |
| D03 | Layer 8 Dependencies `:914` | direct uses in §§8.1–8.4 | §8.2: block idempotents (§0.2), Brauer characters (Layer 2), defect groups (Layer 6); §8.3 *Needs:* §§3.1, 4.2; §8.4: §§0.1, 1.1, 2.4, 4.2–4.3, 5.1, 7.2, 7.3; union {0, 1, 2, 3, 4, 5, 6, 7} vs “Layers 0–7” | Pass | none |
| D04 | family-index ownership | index `:132–133` vs folder `:80–85`, GL2 `:2927` | index: owner of Brauer characters; folder: imports them from GL2 §R17.5.11 | **Fail** | R01 |
| C01 | Scope `:28`: GlaubermanZStar consumes the interfaces of §8.4 (r14) | GlaubermanZStar contract `README.md:144–157` | M1 → §1.1 root bijection (`:284`); M2 → §2.4 (`:468`); M4 → §§4.2 (`:557–560`), 4.3; M5 → §5.1, §7.2 (`:789`); M7 → §§7.2, 7.3; M8 → §8.3 (`:879`, `:884`), §8.2 (`:849–850`): 6 of 6 | Pass | none |
| C02 | §5.2 *Needs:* `TauCeti.sum_characterTable_mul_conj` (r14) | pinned `Table.lean:585`; `S₃`, `C₃` | `S₃` columns `(12),(12)`: `1 + 1 + 0 = 2 = 6/3`; `1,(12)`: `1 − 1 + 0 = 0`; `r,r`: `1 + 1 + 1 = 3 = 6/2`; `C₃` `r,r`: `∑ ζ^j ζ^{−j} = 3 = 3/1` | Pass | none |
| C03 | Layer 5 Dependencies `:643` (r14) | the *Needs:* of §§5.1, 5.2 | §5.1: §§0.1, 2.2, 2.4 → {0, 2}; §5.2: §§3.1, 5.1 → {3}; union {0, 2, 3}; no §4.x | Pass | none |
| C04 | §7.2 block form, *Needs:* §§4.2, 5.2, second main theorem (r14) | `S₃`, `p = 2`; `(u, v, φ, ψ, B)` as listed | `(1,1,1,1,B₀)`: `1 + 1 = 2 = c₁₁`; `(1,1,1,1,{std})`: `0`; `((12),(12),1,1,B₀)`: `1 + 1 = 2 = c^{(12)}`; `(1,(12),1,1,B₀)`: `1 − 1 = 0`; `(1,1,1,std,B₀)`: `0 + 0 = 0 = c_{1,std}` (needs §4.2) | Pass | none |
| C05 | block-section orthogonality, *Needs:* §§0.1, 4.2, 5.1, block form (r14) | `S₃`, `p = 2`; `(g, h) = (1,(12))`, `(r,(12))` | `B₀`: `1·1 + 1·(−1) = 0` both; `{std}`: `2·0 = 0`, `(−1)·0 = 0` | Pass | none |
| C06 | Layer 7 Dependencies `:828` (r14) | the *Needs:* of §§7.1–7.3 | §7.1: §§4.2, 6.2–6.3; §7.2: §§5.1, 6.3, 7.1, then §§4.2, 5.2 and §§0.1, 4.2, 5.1; §7.3: §4.3, Layer 6; union {0, 4, 5, 6} | Pass | none |
| C07 | §8.4 export list (r14) | its ten section references | §0.1 `:205`; §1.1 `:284–285`; §2.4 `:467–468`; §4.2 `:557–560`; §4.3 `:574`; §5.1 `:597`; §7.2 `:777, 789`; §7.3 `:810`; §8.2 `:846`; §8.3 `:879, 884`: 10 of 10 | Pass | none |
| C09 | `Suggested.lean:24–25` layer list (r14) | the bullet's three items | homes §4.2 `:548`, §7.2 `:789`, §8.3 `:877` vs “Layers 4, 7 and 8” | Pass | none (previous R02 repaired) |
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
- **Ownership against open pull requests** rests on the overlap report over the heads in the index of 2026-11-10T18:34:22Z. Pull requests that index does not carry were not searched.

## Source issues

- none
