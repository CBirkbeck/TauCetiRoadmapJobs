# FIX-PKG-PotentialAutomorphyDworkMotivesPartII~3

Repair round for the review REV-PKG-PotentialAutomorphyDworkMotivesPartII~2 (findings R01–R18) and the statement-hygiene gate failures. Files edited: `packages/PotentialAutomorphyDworkMotivesPartII/README.md`, `packages/PotentialAutomorphyDworkMotivesPartII/Suggested.lean`, `packages/PotentialAutomorphyDworkMotivesPartII/sources.toml` (the QIAN21 locator and `cited_for`), `packages/PotentialAutomorphyDworkMotivesPartII/design/plan.json` (top-level `gaps` only: one entry removed, see R08). `metadata.toml` is unchanged.

## REV-PKG-PotentialAutomorphyDworkMotivesPartII~2/R01 (P1) — applied

Verified: with `h₀ = diag(1/2, 1/3)`, `h∞ = diag(2, 4)`, `h₁ = h₀⁻¹h∞⁻¹ = diag(1, 3/4)` (rank of `h₁ − 1` is 1), the spectra of `h₀` and `h∞` are disjoint but the triple is diagonal. Layer 0 overview: "characteristic polynomials of `h₀` and `h∞`" → "of `h∞` and `h₀⁻¹`", matching §§0.3–0.4. The witness is a new negative-control Check in §0.4 (`{2, 3} ∩ {2, 4} = {2}`). No other occurrence: §§0.3, 0.4, 4.5, 4.7, 5.1 already state coprimality for `h∞` and `h₀⁻¹`.

## REV-PKG-PotentialAutomorphyDworkMotivesPartII~2/R02 (P1) — applied

Verified: `w(2)w(−1) = diag(2, 1/2)` with `w(a) = E₁₂(a)E₂₁(−a⁻¹)E₁₂(a)` (computed exactly). Mathlib contract: "whose diagonal factor has determinant one but is not itself a product of transvections" → "which writes an element of `SL_n(K)` as transvections, a diagonal factor of determinant one, and transvections". The witness is a new Check in §0.1. The generation theorem is now cited from Tau Ceti (R03).

## REV-PKG-PotentialAutomorphyDworkMotivesPartII~2/R03 (P2) — applied

Verified at the pin: Tau Ceti Transvection.lean:600, Perfect.lean:102/116, PSL/Simple.lean:127/142; for odd `q` they exclude only `(2, 3)`. Change: §0.1's generation bullet and §0.9's SL perfectness/simplicity → citations of these five declarations; §0.9(1) keeps "proper normal subgroups are central" (new sketch) and composition factors; Tau Ceti contract, Scope, Needs, §0.11 Check updated; Mathlib `rank_two_simple`, `SL2.commutator_eq_top` dropped.

## REV-PKG-PotentialAutomorphyDworkMotivesPartII~2/R04 (P1) — applied

Verified: `N = 11`, `L = 3`, `d = 5` gives `C = {10, 0, 1}`, `C + 5 = {4, 5, 6}`, overlap `0`, old formula `−2`. §1.5 proof: `(L − |d|) + max(0, L + |d| − N)` → `max(0, L − |d|) + max(0, L + |d| − N)`, with the case analysis showing the value `L − 1` forces `|d| = 1` (using `3 ≤ L ≤ N − 2`). New Check with the witness. A brute-force count over all odd `N ≤ 41`, even `n`, `N > n + 1` and `1 ≤ d ≤ (N − 1)/2` (2660 cases) matches the formula, and `L − 1` occurs only at `d = 1`.

## REV-PKG-PotentialAutomorphyDworkMotivesPartII~2/R05 (P2) — applied

Verified: for `N = 5`, `l = 3` the residue fields of `O` and `O⁺` are `𝔽₈₁` and `𝔽₉`, and `5 ∤ 8`; BLGHT11 lines 989–1007 split `U_{λ,0}` (over `O_λ`), not the real form. §2.6: "the same splitting holds … for the self-dual real forms" → the splitting holds after extension from `O⁺` to `O`; over `O⁺_λ` the real fibre at `0` is a sum of rank-two blocks for the pairs `{i, −i} ⊂ B`. New Check with the `𝔽₉`/`𝔽₈₁` witness. No other place splits the real form into lines (§§2.3, 2.7, 4.7, 7.8 checked).

## REV-PKG-PotentialAutomorphyDworkMotivesPartII~2/R06 (P1) — applied

Verified: symplectic matrices have determinant one, so an independent `η` can empty fibres; BLGGT14 lines 1960–1966 ask only for symplectic compatibility. Change: §5.11 self-dual case — `ηᵢ` is no longer a datum but the isomorphism induced by the pairings (`e₁ ∧ f₁ ∧ ⋯ ∧ e_m ∧ f_m`, no `(n/2)!`); the API, proof sketch, §5.12 and §9.4 follow; new Check: 1320 points with the induced `η`, none with `2η`.

## REV-PKG-PotentialAutomorphyDworkMotivesPartII~2/R07 (P2) — applied

Verified: PotentialModularityAndCompatibleSystems §1.21 gives only irreducibility on `G_{F(ζ_l)}`; PotentialAutomorphyInfrastructure §2.20 and ModularityAndLanglandsExtensions §2.18 give the needed large image, crystallinity and ordinary density (merge positions 193, 196 < 243). Change: §9.9 statement (strongly irreducible, very weakly compatible `R`), route and Needs cite them; new contracts; summary paragraph, Scope, Layer 9 Dependencies; `GL₂(𝔽₇)` order-72 Check.

## REV-PKG-PotentialAutomorphyDworkMotivesPartII~2/R08 (P2) — applied

Verified: ModularityAndLanglandsExtensions (position 196 < 243, not citing this roadmap) states the same objects in §§2.9–2.12, 2.14, with `p = 2` in §2.10. Change: §§8.1–8.4, 8.6, 8.5(3), 6.8(2) deleted and cited; old §8.5 → §8.1, verifying its §2.11 hypotheses; §§2.3, 2.5, 2.7, 5.11–5.12, 7.4, 9.4 kept as described refinements; false downstream claim removed; unused contracts and gap `equivariant-toroidal-semistable-reduction` removed.

## REV-PKG-PotentialAutomorphyDworkMotivesPartII~2/R09 (P2) — applied

Verified: DK17 lines 193–195 (`deg x` over `𝔽_p`) and 204–213 (`v(p) = 1`). §7.12: "a `p`-adic valuation … normalised by `deg x`" → `v(p) = 1`, `deg x = [κ(x) : 𝔽_p]`, slopes `v(α)/deg x`, with the §1.3.2 locator added. New Check: the Kummer extension has slopes `0, 1`; with `v(p) = 2`, or dividing by the degree over `𝔽_{p²}`, the slopes become `0, 2`. Pattern: §7.13 now states the same normalisation for its `l`-adic slopes.

## REV-PKG-PotentialAutomorphyDworkMotivesPartII~2/R10 (P2) — applied

Verified: BCGNT25 lines 2086–2090 use `W^{ss}`, on p. 42 (marker line 2059). Change: §7.11 `{V_{t,λ}}` → `{V^{ss}_{t,λ}}` (self-dual too; fibre semisimplicity stated as unsettled), p. 43 → p. 42, `J₂`/`I₂` Check. Pattern: Layer 7 Examples `{V_{λ,t}(1)^{ss}}`; §9.10 `R_aux = {W^{ss}_{t,λ}}` and semisimplified `S_UA` (BCGNT25 line 3310 omits ss), with fibres at `𝔭`, `𝔯` irreducible.

## REV-PKG-PotentialAutomorphyDworkMotivesPartII~2/R11 (P3) — applied

Verified: `Φ₁₅ ≡ Φ₅² (mod 3)` and `Φ₉ ≡ (X − 1)⁶ (mod 3)`. §4.7 Check: "If `λ | N` then `ζ_N ≡ 1`" → reduction at a prime of `ℤ[ζ_N]` above `l | N` kills only the `l`-primary part of the order. With `N = 9`, `l = 3` both polynomials become `(X − 1)^n`; with `N = 15`, `l = 3` the reduction of `ζ₁₅` has order 5. The Check notes that such primes are inverted in `O`.

## REV-PKG-PotentialAutomorphyDworkMotivesPartII~2/R12 (P3) — applied

Verified: `ord₃₀₁(5) = 42`, `ord₃₀₁(3) = 42`, `3²¹ ≡ −1 (mod 301)`. §6.3 Check: "`g(b)g(−b) = 5`" → with `F = ℚ(ζ₃₀₁)` and `v | 5`, `k(v) = 𝔽_{5^{42}}` and the product is `5^{42}`. The obstruction is spelled out: inverting `ζ₃₀₁` needs `j ≡ 21 (mod 42)`, which is odd, while fixing `ζ₅` needs `4 | j`.

## REV-PKG-PotentialAutomorphyDworkMotivesPartII~2/R13 (P3) — applied

Verified: `Gal(ℚ(ζ₄₀₁, ζ₇)/ℚ(ζ₄₀₁)) ≅ (ℤ/7)^×`, of order 6. §5.9 Check: "nontrivial for `n > 1` and `l > n(n−1)/2 + 1`" → nontrivial on `G_F` exactly when the order of `ε̄_l(G_F)` does not divide `n(n − 1)/2`. Both computations are given: over `ℚ(ζ₄₀₁)` the character has order 2; over `ℚ(ζ₄₀₁, ζ₇)` it is trivial.

## REV-PKG-PotentialAutomorphyDworkMotivesPartII~2/R14 (P3) — applied differently

The Check sat in old §8.2, deleted under R08 because ModularityAndLanglandsExtensions §2.10 owns the semistable models. No occurrence remains in the package: the "nonreduced special fibre" claim appears nowhere else (searched). The reviewer's witness is correct (the fibre ideal `(xy)` is radical; the total space has dimension 2 and embedding dimension 3; `r = 1` is smooth) and belongs to that owner's checks.

## REV-PKG-PotentialAutomorphyDworkMotivesPartII~2/R15 (P3) — applied

Verified: the two-dimensional irreducible representation of `S₃` restricted to `A₃` has eigenvalues `ζ₃, ζ₃⁻¹` on a 3-cycle, whose trace is `−1`. §3.6 Check: the trivial-sheaf and sum-of-characters examples → the `S₃` sheaf pulled back along the double cover for `A₃`, with constituent dimensions `[2] → [1, 1]`. This is a cyclic cover, as in the target.

## REV-PKG-PotentialAutomorphyDworkMotivesPartII~2/R16 (P3) — applied

Verified: `3208 = 8·401`, whose odd divisors are only 1 and 401; also `3209 ≡ 2 (mod 3)`, which already fails §9.1's `l′ ≡ 1 (mod n)`. Layer 9 example: `l′ = 3209` is dropped from the data. After the larger `N` is chosen, a new `l′_N` is chosen: `≡ 1 (mod N)`, `≡ 1 (mod 3)`, `> 35`, and unramified in `F^avoid`. The parity warning `ord₄₀₁(5) = 25` is kept.

## REV-PKG-PotentialAutomorphyDworkMotivesPartII~2/R17 (P3) — applied

Verified against BLGHT11's printed footers (line 1111: 30; line 1159: 31): Lemma 4.3(3) and its proof (lines 1113–1141) are on p. 31. Change: §3.3 p. 30 → p. 31; §4.2 → pp. 30–31; §4.3 → p. 31; §4.4 → p. 31. Pattern: Lemma 4.1(2) and its proof (lines 1010–1017) are on p. 28: §§2.1, 2.2, 2.7 p. 27 → p. 28. All other BLGHT page locators match the footers.

## REV-PKG-PotentialAutomorphyDworkMotivesPartII~2/R18 (P3) — applied

Verified: ClassicalArithmeticCompletion §2.46 (main) supplies `C(p)`, `det C(p) = (−1)^d p.coeff 0` and `minpoly = p` only as prose (lines 3775–3805), and none of the three names occurs. The ClassicalArithmeticCompletion contract and §0.2 Needs now describe these laws by section, without Lean names. Pattern: `GaloisRep.grothendieck_quasiUnipotent` (ArithmeticGaloisRepresentations §2.4) is only an old name, which that roadmap maps to SmoothRepresentationsOfLocalGroups. It is replaced by a prose description of §2.4.

## Gate failures (statement-hygiene)

All eight hits are cleared in `Suggested.lean`:

- lines 92, 111, 112, 131, 150, 151: `[Fintype k]`, `[Fintype K]`, `[Fintype k₁]` and `[Fintype k₂]` → `[Finite …]` in `qian_hypergeometric_group_eq_SL`, `selfDual_hypergeometric_group_conj_Sp`, `qian_hypergeometric_group_conj_SU` and `qian_two_prime_hypergeometric_group`. No statement used a `Fintype` instance.
- line 175: `qianGauss` now has `[Finite F]` and body `-∑ᶠ x : F, (χ ^ a.val) x * ψ x`, the finite sum over `F`. `gaussSum` needs a `Fintype` instance and building one from `Finite` would put choice in the body. The docstring says the sum equals `-gaussSum (χ ^ a.val) ψ`; a scratch `example` with a `Fintype` instance proves this by `simp [qianGauss, gaussSum, finsum_eq_sum_of_fintype]`.
- line 184: `zeroShaped_gauss_product` now has `[Finite F]`, and `Fintype.card F` → `Nat.card F`.

README §6.2 states `q = Nat.card F` and the finite-sum form. No other declaration changed.

## Checks

- **Elaboration.** `lake env lean` on `packages/PotentialAutomorphyDworkMotivesPartII/Suggested.lean`, run from the content checkout: exit 0. The only warnings are five "declaration uses `sorry`", at lines 92, 111, 131, 150 and 185. No Tau Ceti import, so nothing had to be built.
- **Signatures.** All ten declarations were `#check @`-ed in one scratch file and compared with the README. Every field, characteristic, primitive-root, field-generation, rank and coprimality hypothesis is still present. The only differences are the gate's `Finite` and `Nat.card` changes; the definitions take no section variables.
- **Library names.** All 39 backticked Mathlib names in the README `#check` at the pin. The five new Tau Ceti names were read in the pinned source files, with names, namespaces and hypotheses as cited. Their object files are not built on this host, and building them is outside the commands allowed here.
- **Citations.** `roadmaps resolve` on the README: no cross-roadmap citation and no roadmap Lean name found nowhere. It did not check Mathlib or Tau Ceti names, which were checked by hand as above.
- **Dependency check** (command of the brief):

      depcheck: 236 roadmaps, 2152 edges, 0 problem(s)

  There is no UPWARD, CYCLE or moved line. The two new suppliers, PotentialAutomorphyInfrastructure and ModularityAndLanglandsExtensions, are earlier in ORDER.txt.
- **Overlaps and ownership.** The five closest open roadmaps of the overlap report were read at their heads. PotentialAutomorphyInfrastructurePartII cites §§1.1–1.4, 2.3–2.7, 4.6, 5.6, 5.10–5.12, 6.8, 7.4, 7.7–7.10 and 9.4. All of these ids are kept with their content; §6.8 still states the coefficient-independent polynomial, now citing MLE §2.9. No roadmap cites Layer 8 or a numbered item of §6.8. The R08 overlap with ModularityAndLanglandsExtensions is settled in favour of the earlier owner. Other open pull requests were searched only through the brief's tools (`roadmaps grep`, `roadmaps show`).
- **Sources.** No new source was needed and nothing was fetched. `needs-references.toml` was not written.

## Adversarial pass on the changed statements

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| Layer 0 overview, §0.4 Check (R01) | `h₀ = diag(1/2, 1/3)`, `h∞ = diag(2, 4)` over `ℚ` | `h₁ = diag(1, 3/4)`, rank of `h₁ − 1` = 1; `spec h₀ ∩ spec h∞ = ∅`; `spec h₀⁻¹ ∩ spec h∞ = {2}`; two invariant lines | old wording false; corrected wording excludes it | overview fixed; Check added |
| §0.1 Check, Mathlib contract (R02) | `w(2)`, `w(−1)` over `ℚ` | `[[0, 2], [−1/2, 0]]`, `[[0, −1], [1, 0]]`, product `diag(2, 1/2)`, det 1 | diagonal factor is a product of 6 transvections | denial deleted |
| §0.9(1), Tau Ceti ranges (R03) | odd `q ∈ {3, 5, 9}`; `n ∈ {2, 3}`; `SL₂(𝔽₅)`, `SL₂(𝔽₃)` | `n = 2`: `q ≥ 4` fails only at 3; `n ≥ 3` always; `SL₂(𝔽₃)` abelianisation order 3 and normal `Q₈` not central (excluded case); in `SL₂(𝔽₅)` the normal subgroups `{±1}` and the whole group fit "central or everything" | consistent | targets deleted, consequence kept |
| §1.5 overlap formula (R04) | `N = 11`, `L = 3`, `d = 5`; `N = 11`, `L = 9`, `d = 3`; all odd `N ≤ 41` | `0 + 0 = 0` (actual 0; old −2); `6 + 1 = 7` (actual 7); 2660 cases, 0 mismatches, `L − 1` only at `d = 1` | corrected formula exact | formula, case analysis, Check |
| §2.6 real forms (R05) | `N = 5`, `n = 2`, `l = 3`; `l = 11` | residue fields `𝔽₈₁`, `𝔽₉`; `8 mod 5 = 3`, `80 mod 5 = 0`; for `l = 11`, `𝔽₁₁ ⊃ μ₅` so lines split already (allowed by "need not split") | lines need `O`; pair blocks over `O⁺` | statement, Check |
| §5.11 symplectic data (R06) | `n = 2`, `k(λ) = 𝔽₁₁`; `n = 4` | `#Sp₂(𝔽₁₁) = 11·120 = 1320`; `2η`: no pairing-preserving `φ` (det of `Sp_{2m}` is 1, so also for `n = 4`) | independent `η` empties the fibre | `η` induced by pairings; Check |
| §9.9 prime choice (R07) | split-torus normaliser in `GL₂(𝔽₇)` | order `2·36 = 72`, irreducible; `#SL₂(𝔽₇) = 336` | irreducibility ≠ `SL₂` containment | suppliers replaced; Check |
| §8.1 (R08) | self-dual `N = 5`, `n = 2`; A'Campo `a = (1, 2, 2, 0, 0)`; `N₂` against `2N₂` | weights `{1, 2}`, `M = (5 − 1 − 2)/2 = 1`, twist gives `{0, 1}`; `C((X − 1)²)` is one block; `(2N₂)² = 0 ≠ 2N₂`, same index; A'Campo datum gives two singleton blocks, criterion not applicable | hypotheses of MLE §2.11 met for Dwork data only | Layer 8 reduced to the specialisation |
| §6.8 Check (R08) | Hesse pencil, Fermat cubic over `𝔽₇` | 9 points, `a = −1`, polynomial `X² + X + 7`, the same for every `λ` | integer, `λ`-independent | (2) imported, items renumbered |
| `qianGauss`, `zeroShaped_gauss_product` (gate) | `N = 3`, `n = 2`, `a = (0, 0, 0)`, `F = 𝔽₇`; `N = 1`, `n = 0` | `g(0) = 1`; LHS `= 343 = 7²·7` = RHS (complex evaluation); empty products `1 = 1`; `n(N − n)` always even (`N` odd) | true; finite-sum form equals `−gaussSum` (scratch proof) | binders and body |
| §7.12 normalisation (R09) | Kummer extension at `x` of degree `d`; `𝔽_{p²}`-point | eigenvalues `1, p^d`: slopes `0, 1`; with `v(p) = 2`: `0, 2`; `𝔽_{p²}`: `0, 1` (÷2), `0, 2` (÷1) | wrong scales break (iii) | normalisation fixed; Check |
| §7.11 (R10) | `J₂` against `I₂` | both have char poly `(X − 1)²`; only `I₂` is semisimple | compatibility only for ss | `V^{ss}`; §9.10 likewise |
| §4.7 Check (R11) | `N = 9`, `15` at `l = 3` | `Φ₉ ≡ (X − 1)⁶`; `Φ₁₅ ≡ Φ₅²`; reduced order of `ζ₁₅` = 5 | old Check false for composite `N` | Check |
| §6.3 Check (R12) | `N = 301`, `p = 5`, `l = 3` | `ord₃₀₁(5) = 42`, `q = 5⁴²`; `3²¹ ≡ 300 ≡ −1 (mod 301)`, `j ≡ 21 (mod 42)` odd, `4 \| j` needed | product `5⁴²`; obstruction holds | Check |
| §5.9 Check (R13) | `n = 3`, `l = 7`, `F = ℚ(ζ₄₀₁)`, `ℚ(ζ₄₀₁, ζ₇)` | orders 6 and 2; 1 and 1 | needs base-field condition | Check |
| §3.6 Check (R15) | `S₃` standard representation restricted to `A₃` | eigenvalues `ζ₃, ζ₃²`, trace `−1`; `[2] → [1, 1]` | genuine counterexample | Check |
| Layer 9 example (R16) | `3208`; `3209 mod 3` | odd divisors `{1, 401}`; `3209 ≡ 2` | `3209` fails for every larger `N` and the mod-`n` congruence | example |
| Locators (R17) | BLGHT footers | `L1111 → 30`, `L1159 → 31`, `L1045 → 28`; Lemma 4.3(3) at L1113, Lemma 4.1(2) at L1010 | pp. 31, 30–31, 28 | locators |
| §2.46 contract (R18) | `C((X − 1)²)` | `[[0, −1], [1, 2]]`, det 1, minpoly `(X − 1)²` | laws supplied, names not | prose citation |

## For the maintainer

- **Ownership (R08).** At the package stage ModularityAndLanglandsExtensions sat after this roadmap in the merge order, and the package author recorded it as a consumer. ORDER.txt now lists it earlier (196, against 243 for this roadmap), so this round makes it the supplier of the fibrewise eigenrealization, the semistable models, the ordinarity criterion near infinity, subquotients and the paired self-dual construction.
  - If ownership should instead move to this dedicated Dwork roadmap, that needs a coordinated merge-order change and ModularityAndLanglandsExtensions citing this roadmap; this package alone cannot do it.
  - That roadmap's §2.10 now needs the equivariant toroidal semistable-reduction input. The gap removed here (supplier SchemeAndStackFoundations §4.20) is not declared there.
  - Its §2.14 connectedness needs full symplectic residual monodromy at two primes, which it does not state as a target; here it is §§5.6 and 5.10, but an earlier roadmap cannot cite this one.
- **Renumbering.** Layer 8 now has a single target, §8.1 (the old §8.5 without part (3)); old §§8.1–8.4 and 8.6 are gone. In §6.8 the old item (2) became an imported statement, and (3), (4) are now (2), (3). No other roadmap cites any of these ids.
- **New suppliers.** PotentialAutomorphyInfrastructure §2.20 and ModularityAndLanglandsExtensions §§2.9–2.12, 2.14, 2.18. Both are open pull requests earlier in ORDER.txt; the dependency check is clean.
- **Lean names.** No declaration was renamed. `qianGauss` now takes `[Finite F]` and is a `∑ᶠ` sum; the five theorems take `[Finite _]`. No other roadmap cites these names.
- **Design text.** The design text in `design/plan.json`, outside `gaps`, and `design/README.md` still describe old Layer 8 and the old consumer relation; this round may not edit them.
