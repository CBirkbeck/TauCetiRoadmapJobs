# Review of ModularCharactersAndBlocks (pull request #1775 at 6aae470)
Folder: `TauCetiRoadmap/RepresentationTheory/ModularCharactersAndBlocks/`
**Verdict:** needs changes

🤖 Incremental AI re-review of 60 changed lines in the folder since `03f9b14`. Previous findings R01–R04 are repaired and the new mathematics is correct on every instance computed below. Two P3 items remain. R01 is the family-index ownership sentence, carried from the previous R05. R02 is a layer number in `Suggested.lean` that the move of block-section orthogonality left stale. The gate passes and the dependency check is clean.

## R01 (P3) — the family index still names this roadmap the owner of Brauer characters

**Location:** `TauCetiRoadmap/RepresentationTheory/README.md:132–133`: “[ModularCharactersAndBlocks](ModularCharactersAndBlocks/README.md) consumes both and owns Brauer characters, decomposition matrices and blocks with defect.”

**Claim:** the Brauer character is owned by this roadmap.

**Witness:** the folder imports it: `README.md:80–85`, `:185–188`, `:364–372` take it from GL2AutomorphicRepresentationsAndTransfer §R17.5.11. That roadmap's open head (its `README.md:2927`, *Needs:* line `:2938`) says modular characters and their projective pairing are owned there. `git diff --stat 03f9b14 HEAD` lists only the folder README, so the index is unchanged.

This is the previous report's R05, carried. The repair reply (H05) agreed with it but made no change, because the index is outside the files a repair round may edit. That reply does not settle the finding. The brief makes the family index part of this pull request, and the pull request's own diff changes 24 lines of the index, this sentence included. So the edit is still owed here, by the author if a repair round cannot make it.

**Repair:** in the index sentence write “… consumes both, takes the Brauer character from GL2AutomorphicRepresentationsAndTransfer §R17.5.11, and owns its basis theorem, decomposition matrices and blocks with defect.” Tested: every use of the Brauer character in the folder (`README.md:80–85, 185–188, 364–372, 492`) then agrees with the index. The index's catalogue entry (`:29`) lists contents, not ownership, and needs no change.

## R02 (P3) — `Suggested.lean` still places block-section orthogonality in Layer 5

**Location:** `Suggested.lean:24–25`: “The ordinary block partition, block-section orthogonality and the kernel theorem `⋂_{χ ∈ Irr(B₀)} ker χ = O_{p'}(G)` (Layers 4, 5 and 8).”

**Claim:** these three headlines that cannot be stated at the pins live in Layers 4, 5 and 8.

**Witness:** at this head, block-section orthogonality is a bullet of §7.2 (`README.md:789–792`), and §8.4 exports it as §7.2 (`:895`). §5.2 (`:611–634`) no longer states it. The docstring's other bullets give each headline's home layer ("Layers 2–3", "Layers 5 and 7"), so the "5" here now names no item of its bullet. The R04 repair moved the README text but not this line.

**Repair:** replace “(Layers 4, 5 and 8)” by “(Layers 4, 7 and 8)”. Tested: the block partition is §4.2 (`README.md:548`), block-section orthogonality §7.2 (`:789`) and the kernel theorem §8.3 (`:876`). The docstring's reason still holds for each: the pins have no partition of `Irr(G)` into `p`-blocks.

## Previous findings

- R01 — repaired: `README.md:753–762`: the `brauer_first_main` bullet now identifies its rule with block induction `b ↦ b^G` at `H = N_G(D)`. A new bullet gives the bijection for `N_G(D) ≤ H ≤ G` by block induction (Sambale, Theorem 1.12). The product criterion is restricted to `D C_G(D) ≤ H ≤ N_G(D)`, and the `S₅` instance is the fourth Check (`:769–775`).
- R02 — repaired: `README.md:290–292`: “restricts to a bijection from the `e`-th roots of unity of `F` onto the `e`-th roots of unity of `K`; `K` can contain further roots of unity (… `F = ℚ` has two and `K = ℚ₅` has four).”
- R03 — repaired: `README.md:316–317`: “the lattices `O` and `mO` both reduce to the class `1`, although the reductions `O/m` and `m/m²` are different subquotients of `V`.”
- R04 — repaired: the block form and block-section orthogonality are now §7.2 bullets (`README.md:785–792`), and the `S₃`, `B₀` Check is §7.2's fourth (`:798–801`). Layer 5 reads “Layers 0, 2–4.” (`:643`) and §8.4 cites §7.2 (`:895`). The repair missed `Suggested.lean:25` (this report's R02).
- R05 — not repaired: `TauCetiRoadmap/RepresentationTheory/README.md:132–133` still reads “consumes both and owns Brauer characters, decomposition matrices and blocks with defect” (this report's R01).

## Verified sound

**Scope of this round.** The worktree is at `6aae4703f38a05e44fcb9daff3753cb6bdfc8872` and clean. `git diff --stat 03f9b14 HEAD` lists one file, the folder's `README.md` (39 insertions, 21 deletions). `Suggested.lean`, the family index, `lake-manifest.json` and `lean-toolchain` are unchanged. The pins are Mathlib `1b1ccf4` and Tau Ceti `2fd255d` (from `lake-manifest.json`). The brief's command for changes outside the folder and the family index prints nothing.

**Gate.** The worker's gate on this head: every counter `0`, `build=0`, `OK`. My runs:
- The brief's command as written gives `depcheck=1` (“NOT IN ORDER: ModularCharactersAndBlocks”) and `outside-folder=1` (`TauCetiRoadmap/RepresentationTheory/README.md`).
- The same command with `--order` set to the candidate merge order and `--build` gives `depcheck=0`, `build=0`, and only `outside-folder` on the family index.

Neither is a finding. The configured order does not list the roadmap, while the candidate lists it at line 101, right after its open supplier GL2AutomorphicRepresentationsAndTransfer (line 100). The brief names the family index as this pull request's own.

**Dependency check** (the brief's command), complete output:

```text
depcheck: 228 roadmaps, 2122 edges, 0 problem(s)
```

**Elaboration.** `lake env lean` on `Suggested.lean`: exit `0`, eight `declaration uses sorry` warnings (lines 42, 56, 72, 99, 117, 127, 139, 153) and nothing else.

**Signatures.** I elaborated `#check @…` for every declaration on a scratch copy; the `module` header hides them from an import. The output matches `signatures.md` and the previous review's binder comparison. For example, `brauer_first_main` carries `[IsAlgClosed k] [Fact p.Prime] [CharP k p]` and `IsPGroup p D`, and `brauer_third_main_local` carries `P ⊔ C_G(P) ≤ H ≤ N_G(P)`. Nothing changed. I did not repeat the padding probe because the file is byte-identical; the previous result stands (all eight `sorry`s resist `rfl`/`simp`/`infer_instance`/`decide`).

**The changed passages, checked.**
- **§1.1.** `F = ℚ(ζ_e)` supplies `e` distinct `e`-th roots, and `X^e − 1` has at most `e` roots in the field `K`, so the restriction is a bijection. This holds when `p ∣ e` too, since `K` has characteristic `0` (B01).
- **§1.2.** The Check is now correct (B02).
- **§5.2.** The new route uses column orthogonality for `G`, then for `ux` and `vy` the section parametrization of §0.1, then the dual-basis statement of §3.1 for `H = C_G(u)`, giving `∑_{φ,ψ} c_{φψ} φ(x) conj(ψ(y)) = |C_H(x)|` or `0`. Linear independence of `IBr(H)` from §2.2, through §5.1, then identifies the coefficients. Summing Sambale 1.14 over the blocks `B` gives the same statement, because `c^u_{φψ} = 0` for `φ` and `ψ` in different blocks of `C_G(u)` (B03, B04).
- **§7.1.** At `H = N_G(D)`, Martínez Corollary 4.6 makes `Br_D(e_B) e_b` equal to `e_b` or `0` according as `b^G = B` or not. The intermediate-`H` bullet is the composite of the two first-main bijections, by transitivity of block induction (stated in §7.1). It carries the first main theorem's hypotheses, `k` algebraically closed, as Sambale does (B05–B08).
- **§7.2.** The block form follows from §5.2 and the second main theorem. Block-section orthogonality follows from the block form by expanding `χ(ux)` and `χ(vy)` (B09, B10).
- **§8.4.** Its references resolve (B11). The layer order has no `5 → 7` edge left (B13).
- **Layer 5's Dependencies.** The line follows the previous repair's wording and still lists Layer 4, which no Layer 5 target needs after the move (§5.1 needs §§0.1, 2.2, 2.4; §5.2 needs §§3.1, 5.1). Layer 4 precedes Layer 5, so the build order is unaffected.

**Sources read at the locator this round** (Martínez printed page = extraction page − 8; Webb printed = extraction − 7; Sambale printed = extraction):
- Sambale: Proposition 1.11 (`sambale` line 438), Theorem 1.12 (line 442: `N_G(P) ≤ H ≤ G`, Brauer correspondence is a bijection on blocks with defect group `P`), Theorem 1.13 (line 445) and Theorem 1.14 (line 465: block `B`, `φ ∈ IBr(b_u)`, `ψ ∈ IBr(b_v)`, value `c_{φψ}` iff `u = v`, `b_u = b_v`, `b_u^G = B`), all p. 16.
- Martínez: Theorem 4.5 and Corollary 4.6 (lines 1004, 1055, p. 26: `P C_G(P) ≤ H ≤ N_G(P)`, `Br_P(e_B) = ∑_{b^G = B} e_b`), Theorem 4.10 (line 1085, p. 27: `b ↦ b^G` on `Bl(N_G(D)|D)`, inverse by `Br_D`), Corollary 2.4 (line 451, p. 11: `g` `p`-regular, `x` `p`-singular), Theorem 1.7 and Lemma 1.8 (lines 189, 196, p. 4).
- Webb: §9.4 (line 6211, p. 148), Theorem 9.4.8 (line 6434, p. 153).

Each supports the README's statement as written.

**The seeded sample.** These sampled targets fall in the changed passages: §1.1, §1.2, §7.2 (locators above) and §8.4 (no locator; it names §§0.1, 7.2, 4.3, 8.3, 7.3). The other sampled targets (§§2.1, 2.2, 2.3, 3.1, 4.1, 4.3, 5.1, 6.2, 7.3, 8.1, 8.2) are untouched by the diff and were passed by earlier reviews.

**Cross-roadmap citations and ownership.**
- GL2AutomorphicRepresentationsAndTransfer §R17.5.11 resolves at its open head (`README.md:2927`).
- `roadmaps grep` over main and the 438 indexed heads finds no other owner of the moved objects. “Section orthogonality” and “second main theorem” occur only here and in GlaubermanZStar, a consumer. “Brauer correspondence” occurs only here. The other hits for “generalized decomposition” are unrelated Lie-theory uses.
- The overlap and citation reports list nothing.
- A note for the consumer, not a change here: GlaubermanZStar's head cites block-section orthogonality as “ModularCharactersAndBlocks M5” (its `README.md:51`, `:147–150`, `:905`, `:911`, `:927`). At this head that result is in Layer 7 (§7.2), so those citations need M7 in GlaubermanZStar.

**Remark on untouched text.** The Scope and Downstream consumers say GlaubermanZStar consumes “Layers 4–8”, while §8.4 also exports the Layer 0 sections (§0.1).

**Adversarial computations.** `r = (123)`, `τ = (12)`, `s = (45)`, `t` generates `C₂`, `ζ = ζ₃`. In `S₅`, `B₁ = {1, χ₄', χ₅'}` and `B₂ = {sgn, χ₄, χ₅}`, where `χ₄` is the standard character (`χ₄(τ) = 2`) and `χ₆` has defect zero. Rows B01–B14 were computed this round. The rows marked “carried” are from the previous report (r12) for statements this diff leaves untouched.

| Row | Statement | Instances | Values on the two sides | Result | Change |
| --- | --- | --- | --- | --- | --- |
| B01 | §1.1 `F → K` bijective on `e`-th roots | `G = 1`, `p = 5`; `S₃` (`e = 6`), `p = 2`; `C₂`, `p = 2`; `C₄`, `p = 5` | `μ₁(ℚ) = μ₁(ℚ₅) = {1}`, all roots `2` vs `4`; `|μ₆(ℚ(ζ₃))| = 6 = |μ₆(ℚ₂(ζ₃))|`; `μ₂(ℚ) = μ₂(ℚ₂) = {±1}` (`p ∣ e`); `|μ₄(ℚ(i))| = 4 = |μ₄(ℚ₅)|` | Pass | none |
| B02 | §1.2 Check, `G = 1`, `V = K` | lattices `O`, `mO` | `V/mV = 0`; `O/m ≅ k`, `m/m² ≅ k`, class `1` each, as the pairs `O ⊇ m` and `m ⊇ m²` | Pass | none |
| B03 | §5.2 relations over `Irr(G)`, new route | `C₂`, `p = 2`; `S₃`, `p = 2` | `d¹ = (1,1)`, `dᵗ = (1,−1)`: `∑ d¹dᵗ = 0`, `∑ dᵗdᵗ = 2 = c^t`; `S₃`: `Q*Q = diag(2,1,2) = diag(c¹, c^τ)`, `c¹ = diag(2,1)`, `c^τ = [2]` | Pass | none |
| B04 | §5.2 as Sambale 1.14 summed over blocks | `S₃`, `p = 2`, `u = v = 1`, `(φ,ψ) = (1,1)`, `(1,std)` | `B₀`: `1 + 1 = 2`, defect zero: `0`; total `2 = c_{11}`; `(1, std)`: `0 + 0 = 0 = c_{1,std}` | Pass | none |
| B05 | §7.1 `brauer_first_main` rule = `b ↦ b^G` | `S₅`, `p = 3`, `D = ⟨r⟩`, transposition class sum `K` (`10` in `G`, `4` in `N_G(D)`) | `λ_{(1+s)/2}(K ∩ N) = 4 ≡ 1` (`−3 + 1 ≡ 1` on `sgn ⊗ +`) `= λ_{B₁}(K) = 10 ≡ 1`; `λ_{(1−s)/2} = 3 − 1 = 2 = λ_{B₂}(K) ≡ −10`; `Br_D(e_{B₁})·(1+s)/2 ≠ 0`, `·(1−s)/2 = 0` | Pass | none |
| B06 | §7.1 `N_G(D) ≤ H ≤ G`, block induction | `H = G = S₅` (`S₃ × S₂` is maximal in `S₅`); `H = N_G(D)` | `b ↦ b^G` is the identity on `{B₁, B₂}`; `(b'^H)^G = b'^G` gives the composite of the two bijections | Pass | none |
| B07 | §7.1 product criterion for `D C_G(D) ≤ H ≤ N_G(D)` | `H = C_G(D) = ⟨r⟩ × ⟨s⟩`; `H = N_G(D)` | blocks `(1 ± s)/2`; `(1+s)/2 · (1+s)/2 ≠ 0`, `(1+s)/2 · (1−s)/2 = 0`: one `B` per `b` | Pass | none |
| B08 | §7.1 `S₅` Check | `e_B(g) = |G|⁻¹ ∑_{χ ∈ B} χ(1) χ(g⁻¹)` on `C_G(D)` | `e_{B₁}`: `7/20 ≡ 2` at `1`, `−1/10 ≡ 2` at `s`, `0` at `r`, `rs`: `2 + 2s = (1+s)/2`; `e_{B₂}`: `7/20 ≡ 2`, `12/120 ≡ 1`: `2 + s = (1−s)/2`; on `χ₄`, ranks `3` and `1` | Pass | none |
| B09 | §7.2 block form | `S₅`, `p = 3`, `u = v = r`, `C_G(r) = C₆`, `c^r = diag(3,3)` | `B₂`: `(χ(r), χ(rs)) = (1,−1), (1,−1), (−1,1)`, so `d₋ = 1, 1, −1`, `d₊ = 0`: `∑ d₋² = 3 = c`, `∑ d₊² = 0` (`b₊^G = B₁`); `B₁`: `d₊ = 1, 1, −1`, `∑ = 3`; `χ₆`: `0` | Pass | none |
| B10 | §7.2 block-section orthogonality and its Check | `S₅`, `p = 3`, `(1, r)`; `C₃`, `p = 3`, `(r, r²)`; `S₃`, `p = 2`, `B₀` | `B₁`, `B₂`: `1 + 4 − 5 = 0`; `∑_j ζ^j conj(ζ^{2j}) = ∑ ζ^{2j} = 0`, without `conj` `3`; `1 − 1 = 0`; `2 + 4 = 6 = |S₃|` | Pass | none |
| B11 | §8.4 references | §§0.1, 7.2, 4.3, 8.3, 7.3 | headings at `README.md:205, 777, 574, 876, 803`; §7.2 states the result (`:789`) | Pass | none |
| B12 | `Suggested.lean:24–25` layer list | the bullet's three items | homes §4.2, §7.2, §8.3 vs “Layers 4, 5 and 8” | **Fail** | R02 |
| B13 | layer order after the move | the *Needs:* lines | §5.2: §§3.1, 5.1; §7.2 block form: §5.2 and the second main theorem; Layer 5: `0, 2–4`; Layer 7: `5–6`; no edge `5 → 7` | Pass | none |
| B14 | family-index ownership | index `:132–133` vs folder `:80–85`, GL2 `:2938` | two owners named for the Brauer character | **Fail** | R01 |
| A01 | §0.1 class-size formula (carried) | `S₃`, `p = 2` | `3 = [S₃ : C₂] · 1`; `2 = 1 · 2` | Pass | none |
| A02 | §0.2 blocks of `𝔽₃[C₂]`, `𝔽₂[C₂]` (carried) | `e_± = −(1 ± t)` | `(2+2t)² = 2+2t`; `e₊e₋ = 0`; `(1+t)² = 0` in `𝔽₂[C₂]` | Pass | none |
| A03 | `complete_blockIdempotents_unique` (carried) | `𝔽₃[C₂]`; `G = 1` | the swap `(e₊, e₋) ↦ (e₋, e₊)`; singletons | Pass | none |
| A04 | §1.1 residue field (carried) | `e = 3`, `p = 2, 3`; `e = 4`, `p = 3` | `𝔽₄`; `𝔽₃`, `e' = 1`; `𝔽₉` | Pass | none |
| A07 | §1.3 lifts (carried) | `ℤ₂[C₃]`; `ℤ₂[C₂]` | `(2−r−r²)/3 ↦ r + r²`; `(1 ± t)/2 ∉ ℤ₂[C₂]` | Pass | none |
| A08 | `existsUnique_blockIdempotent_map_residue` (carried) | `ℤ₂[C₃]` | unique central lifts; `b̄ = c₁ + … + c_n` forces `n = 1` | Pass | none |
| A09 | §2.1 induced and dual (carried) | `Ind_1^{S₃} 1`, `p = 2`; `C₃/𝔽₄` | `(6, 0) = 2(1,1) + 2(2,−1)`; `r ↦ α² ↦ ζ²` | Pass | none |
| A10 | `card_simpleModules_eq_card_pRegularClasses` (carried) | `S₃`, `p = 3, 2`; `C_p`; `C₃/𝔽₂` | `2 = 2`; `2 = 2`; `1 = 1`; `2 ≠ 3` without splitting | Pass | none |
| A11 | §2.3 residue splitting (carried) | `C₃` over `𝔽₄`, `𝔽₂`, `𝔽₄(T)`, `𝔽₂(T)`; `C₅`, `p = 5` | `3`; dims `1, 2`; `k³`; `k × k[x]/(x²+x+1)`; one simple | Pass | none |
| A12 | §2.3 endomorphism count (carried) | `T` simple, `n = [k₁ : k₀]` | `dim End = n` and `n²`: `n = 1` | Pass | none |
| A13 | §2.4 decomposition map (carried) | `S₃`, `p = 3, 2`; `C₂` | `(2,0) = (1,1) + (1,−1)`; `(2,−1)` simple; `[[1],[1]]` | Pass | none |
| A14 | §2.4 surjectivity route (carried) | projection formula | each term in `im(d ∘ Ind_E)` | Pass | none |
| A15 | §3.1 reciprocity (carried) | `S₃`, `p = 3, 2`; `C_p` | `DᵀD = [[2,1],[1,2]]`, `det 3`; `diag(2,1)`; `[p]` | Pass | none |
| A16 | §3.1 Hom formula (carried) | `S₃`, `p = 2`, `P₁`, `U = k`, `std` | `(2 + 4)/6 = 1`; `(4 − 4)/6 = 0` | Pass | none |
| A17 | §4.2 central characters (carried) | `S₃`, `p = 2`; `S₅`, `p = 3` | `3, −3, 0`; `10, −10, 5, −5, 2, −2, 0 ≡ 1, 2, 2, 1, 2, 1, 0` | Pass | none |
| A18 | §4.3 augmentation (carried) | `𝔽₂[S₃]`; `G = 1` | `1`, `0`; `1` | Pass | none |
| A19 | §5.1 (carried) | `C₃`; `S₃`, `p = 3`; `S₅`, `χ₄` | `ζ^j`; `(1, 1, −1)`; `d₊ = 0`, `d₋ = 1` | Pass | none |
| A22 | `brauerProjection_mul` (carried) | `S₃`, `P = ⟨τ⟩`; non-invariant; over `ℚ`; `P = C₃`, char 2 | `0 = 0`; `1 ≠ 0`; `2 ≠ 0`; `1 + r + r² ≠ 0` | Pass | none |
| A23 | §6.1 Rosenberg (carried) | primitive `e`, `eAe` local | one summand a unit of `eAe` | Pass | none |
| A24 | `IsDefectGroup` (carried) | `S₃`, `p = 2`; `C₃`, `p = 2`; `G = 1` | `Br(1+r+r²) = 1`; `Br(r+r²) = 0`; `C₃` excluded; `1` | Pass | none |
| A25 | `isDefectGroup_conj` (carried) | route over any field | `e Z(k[G])` local | Pass | none |
| A26 | `isDefectGroup_iff_sylow_of_augmentation_ne_zero` (carried) | `S₃`, `p = 2`; `S₅`, `N_G(D)` | Sylow for `e₀`; `aug((1±s)/2) = 1, 0` | Pass | none |
| A28 | `brauer_first_main`, Lean statement (carried; file unchanged) | `S₅`, `p = 3`; `S₃`, `p = 2`; `D = 1` | `(1+s)/2 · (1+s)/2 ≠ 0`; `1 · 1 ≠ 0`; identity | Pass | none |
| A29 | §7.2 second main theorem (carried) | `S₃`, `p = 2`, `u = τ`; `S₅`, `u = r` | `(1, −1, 0)`; `χ₄`: `d₋ ≠ 0` only, `(1−s)/2 = Br_D(e_{B₂})` | Pass | none |
| A30 | `brauer_third_main_local` (carried) | `S₅`, `p = 3`; `S₃`, `p = 2`; `P = 1` | `(1+s)/2` nonzero with `(1+s)/2`, zero with `(1−s)/2`; `1`; `e₀` | Pass | none |
| A31 | §8.1 (carried) | `S₃`, `p = 3`, `N = C₃` | `1 ↦ e₊ + e₋` | Pass | none |
| A32 | §8.3 kernel theorem (carried) | `S₃`, `p = 2, 3`; `C_p` | `C₃`; `1`; `1` | Pass | none |

## Not verifiable

- **Navarro, Theorem 6.10 (`navarro`), and Serre, Part III (`serre`)**: settled as uncertified and cited by locator only. Neither locator is in a changed passage.
- **Ownership against open pull requests** rests on `roadmaps grep` over the heads in the index of 2026-11-10T16:49:06Z. Pull requests that index does not carry were not searched.

## Source issues

- **Misprint** in webb at §9.4, printed p. 148: the source says that when `F` contains a primitive `m`-th root of unity, `m` the exponent of `G`, the residue field `k` contains one too; it should be the prime-to-`p` part of `m`, since characteristic `p` has no primitive `p`-th roots of unity; affects nothing.
