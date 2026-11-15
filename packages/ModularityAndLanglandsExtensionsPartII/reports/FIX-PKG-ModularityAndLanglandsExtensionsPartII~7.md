# Repair report: ModularityAndLanglandsExtensionsPartII

Findings F01–F10 come from REV-PKG-ModularityAndLanglandsExtensionsPartII~6, the only review this round. Each was checked against the cached sources, the supplier roadmaps at main or at their open heads, and the pinned libraries. All ten are correct. All ten are repaired, and the same patterns were searched for and repaired elsewhere in the package.

Files changed:

- `packages/ModularityAndLanglandsExtensionsPartII/README.md`
- `packages/ModularityAndLanglandsExtensionsPartII/Suggested.lean`: one docstring only.
- `packages/ModularityAndLanglandsExtensionsPartII/design/plan.json`: the `needs` text of the gap `tensor-taylor-wiles-primes` in the top-level `gaps` list, kept verbatim equal to the README line.

`metadata.toml` and `sources.toml` are unchanged, and no new source was needed. The review's "For the human reviewers" section changed nothing. The review contains no instruction-like text.

## F01 (P2) — applied

§11.1, data of Lemma 3.4. Old: "over `F_2`, the places above `v_0` with `q ≡ 1` …". New: "over `F_2`, the base change of `π` unramified at every place above `v_0`, and at those places `q ≡ 1` modulo `p^N` … trivial residual representation". The `F_1`, `F_2` API bullet now lists the three properties above `v_0`. New negative-control Check: an unramified extension gives `q ≡ 1`, `r̄` trivial and still ramified base change.

## F02 (P2) — applied

§13.7 *Needs*: the nonexistent PotentialAutomorphyInfrastructurePartII Layer 1 title is replaced by "ModularityAndLanglandsExtensions §2.1 (potential diagonalizability of ordinary and Fontaine–Laffaille representations)". Layer 13's Dependencies gain MLE §2.1. §13.8 *Needs*: "The ANT finiteness theorem with weak primitivity" → "Finiteness of ordinary locally Steinberg deformation rings", §8.7. Both targets were opened at their heads.

## F03 (P3) — applied

nt26 §3: "pp. 13–25" → "pp. 12–25"; standing hypotheses "pp. 13–14" → "pp. 12–13". The same pattern was repaired twice more:

- Layer 13 introduction: nt26 §§5–6 "pp. 38–50" → "pp. 37–50" (§5 heading at nt26 line 1709, after the page-37 marker at line 1707).
- Gap `tensor-taylor-wiles-primes` (README and `plan.json`): "pp. 29–30, Propositions 4.8–4.9" → "pp. 29–30; Propositions 4.8–4.9, pp. 34–35".

## F04 (P3) — applied

§14.4 and the docstring of `symPowerEulerProduct_levelOne_entire` in `Suggested.lean`: "nt21 Theorem A and its consequence for `Δ`, p. 2" → "nt21 Theorem A, p. 2; the entire continuation follows by Godement–Jacquet, as nt21 Corollary C, p. 2, records for semistable elliptic curves". No other occurrence.

## F05 (P3) — applied

The four extraction line numbers are replaced:

- "(nt21 lines 408–410, p. 9)" → "(nt21 §1, the data fixed under the standard assumptions, p. 9)". This is the reviewer's text made specific: the standard assumptions are on p. 8, and the data fixed under them are on p. 9.
- "(ct17 lines 167–170, p. 4;" → "(ct17 §2.1, p. 4;".
- "(ct17 lines 264–268, p. 6)" → "(ct17 §2.1, p. 6)".
- "(ct17 lines 269–274, p. 6)" → "(ct17 §2.1, p. 6)".

A search of the README, `Suggested.lean` and `sources.toml` finds no other "line N" locator.

## F06 (P3) — applied

`padicValNat.pow_two_sub_one` → `Nat.multiplicity_pow_two_sub_one` at the four places: Mathlib contract, §3.2 proof sketch, §3.2 *Needs*, Layer 3 Dependencies. The contract now says the theorem is stated with `multiplicity 2`. The mathematical statement is unchanged.

## F07 (P3) — applied

§12.6: "For odd `p`, `q ≥ 0` with `2q ≥ |S ∪ S_∞|`." → "For odd `p`, `q ≥ 0` is the common size of the Taylor–Wiles sets of §12.3 used in the patching, as in §9.5 (nt26 Proposition 4.8 asks only for an integer `q ≥ 0`)." This is the reviewer's repair, with the Taylor–Wiles sets located in §12.3.

## F08 (P3) — applied

§11.1: "`X X^c = ε`, `Y Y^c = ω`, `X̄ = Ȳ`" → the `p`-adic characters `x = r_{X,ι}`, `y = r_{Y,ι}` satisfy `x x^c = ε`, `y y^c = ω_p`, `x̄ = ȳ`. `ω_p` is defined there as the Teichmüller lift of `ε` modulo `p`, because §11.1 precedes §11.2. §11.3 proof sketch: `y y^c = ω` → `ω_p`, with the computation `s^c ≅ s^∨ ⊗ ε^{1−2r} ω_p^{r−1} (y y^c)^{1−r} = s^∨ ⊗ ε^{1−2r}` added.

## F09 (P3) — applied

Six headings no longer name a source section:

- Layer 11 → "the untwisted tensor product `r_π ⊗ Sym^{r−1} r_σ`".
- §5.1 → "The level-raising datum: places, types and levels".
- §5.7 → "Places, levels and algebraic modular forms for level raising at ramified places". This is plural because the setting has the places `v_0, …, v_s`.
- §9.1 → "The setting: congruent non-ordinary weight-two forms with large projective image".
- §11.1 → "Standing hypotheses and auxiliary data".
- §13.2 → "The hypotheses `S5-global` and `S5-local`".

Numbers and in-paragraph locators are unchanged. No heading now contains "§".

## F10 (P3) — applied

The supplier contracts gain:

- IntegralHeckeAndGaloisDeterminants §1.4: the reducibility ideal `I_P`, with the factorisation criterion `I_P ⊆ J`, uniqueness of the factors and Zariski closedness.
- GlobalGaloisDeformations §8.4 (presentations), §§5.3–5.4 (dyadic disjointness and Taylor–Wiles sets) and §5.5 (inertia at Taylor–Wiles places, the `Δ_Q`-structure).
- PotentialAutomorphyInfrastructurePartII §8.5 ("Connectedness: every minimal prime is potentially pro-automorphic").

The same pattern also covered ModularityAndLanglandsExtensions §4.13, which the §14.2 *Needs* line cites; it is now in the contract.

## Evidence

- **F01.** nt26 line 752 (Lemma 3.4(3), p. 16) requires `BC_{F_2/F}(π)_v` unramified for every `v | v_0`. The proof (nt26 lines 772–774) takes `F_2 = F_1 F_3` with `F_{3,v}` sufficiently large above `v_0`. §11.9 uses this clause. Before the repair it rested only on `q ≡ 1` and trivial `r̄`, which do not imply it (see the table).
- **F02.** At the open head of PotentialAutomorphyInfrastructurePartII:
  - Layer 1 has §§1.1–1.5, and Layer 8 has §§8.1–8.16.
  - Neither title occurs as a heading.
  - Its scope (line 60) gives the ordinary and Fontaine–Laffaille criteria to ModularityAndLanglandsExtensions §2.1.
  - Its §8.7 is ANT20 Theorem 6.2 with weak primitivity over `k̄`, which is the form §13.8 uses.

  ModularityAndLanglandsExtensions §2.1 at its head covers potential diagonalizability for potentially crystalline full character flags, and the Fontaine–Laffaille interval criterion.

  The quoted title "The ANT lifting theorem with weak primitivity" is kept. The supplier's own mapping table lists it as "§8.17, the ANT lifting theorem with weak primitivity → ModularityAndLanglandsExtensions §4.2", so the citation resolves.

  A scripted comparison of all 103 quoted titles in the README with the supplier's headings found only these three PotentialAutomorphyInfrastructurePartII titles missing: the two repaired ones and the mapped alias.
- **F03.** nt26 page markers: p. 12 at line 517, p. 13 at line 571, p. 37 at line 1707, p. 34 at line 1568, p. 35 at line 1615. The §3 heading is at line 554, the hypotheses at lines 559–570 and the normalisation of the image at lines 573–575. The table of contents (lines 15–18) puts §3 at p. 12, §4 at p. 25 and §5 at p. 37. Propositions 4.8 and 4.9 are at lines 1586 and 1643.
- **F04.** nt21 p. 2 (lines 43–89) contains Theorem A (lines 57–60), Theorem B (lines 62–66) and Corollary C (lines 71–73). `Δ` is not mentioned there.
- **F05.** Locations in the cached texts:
  - nt21: the §1 heading is at line 372 (p. 8); the bullet fixing `μ` is at lines 408–410, inside p. 9 (lines 386–432).
  - ct17: the §2.1 heading is at line 166 (p. 4). The table of contents puts §2.2 at p. 8, so lines 167–170 (p. 4) and 264–274 (p. 6) are in §2.1.
- **F06.** Pinned Mathlib `Mathlib/NumberTheory/Multiplicity.lean`:
  - Line 401: `@[deprecated (since := "2026-10-28")] alias padicValNat.pow_two_sub_one := Nat.multiplicity_pow_two_sub_one`.
  - Line 359: the theorem itself. `#check @Nat.multiplicity_pow_two_sub_one` elaborates without warning as `1 < x → ¬2 ∣ x → n ≠ 0 → Even n → multiplicity 2 (x ^ n - 1) + 1 = multiplicity 2 (x + 1) + multiplicity 2 (x - 1) + multiplicity 2 n`.
- **F07.** nt26 line 1586 (Proposition 4.8): "an integer `q ≥ 0`". Line 1643 (Proposition 4.9): `q ≥ |S ∪ S_∞|`, which the README already states for `p = 2`.
- **F08.** nt26 lines 759–762 (Lemma 3.4(5)) state the conditions on `x = r_ι(X)`, `y = r_ι(Y)`, and line 579 defines `ω` as the Teichmüller lift of `ε` mod `p`.
- **F09.** nt26 line 554 is the §3 title. `roadmaps grep --fixed ModularityAndLanglandsExtensionsPartII` finds this roadmap named only in PotentialAutomorphyInfrastructurePartII (line 2207) and ProetaleCohomologyOfPAdicCurvesAndTowers (line 1002), and neither cites a renamed heading.
- **F10.** All four sections exist with those titles:
  - IntegralHeckeAndGaloisDeterminants §1.4, "Reducibility ideals and quotient extensions".
  - GlobalGaloisDeformations §§5.3, 5.4, 5.5, 8.4.
  - PotentialAutomorphyInfrastructurePartII §8.5.
  - ModularityAndLanglandsExtensions §4.13, "Symmetric powers of CM and weight-one forms".

  A scripted comparison of every body citation with each supplier's contract block found no other missing section, counting ranges such as SR.2.1–SR.2.3. The other ModularityAndLanglandsExtensions sections it found (§§4.5–4.12, 4.20, 4.23, 4.29–4.31) are statements this roadmap proves, listed as such under Scope and ownership.

## Adversarial mathematics record

| Statement | Instances tried | Values computed | Result / change |
|---|---|---|---|
| §11.1, unramified base change over `F_2` above `v_0` | `p = 5`, `q_{v_0} = 19`, `r = 4` (`n = 8`) | `19² ≡ 11`, `19⁵ ≡ −1 mod 25`, order `10`; `v_5(19^{10} − 1) = v_5(360) + v_5(5) = 2`, `25 > 8`; inertia of the degree-10 unramified extension is that of `ℚ_19`, on which the parameter is `θ|_I ⊕ θ^{19}|_I`, order `5` | `q ≡ 1 mod p^N` and `r̄` trivial hold, but the base change is ramified: the clause is independent. Added, with a Check |
| same, removing the ramification | tame extension of ramification index `5` above `ℚ_{19^{10}}` | `μ_5 ⊂ ℚ_{19²}` (`361 ≡ 1 mod 5`); `θ|_{I_E} = θ^5|_I = 1` | unramified only when `p` divides the ramification index, as the Check says |
| §11.1 API: "exact power of `p` dividing `q − 1` exceeds `n`" | `q = 19^{10}`; `q = 19² = 361`; `n = 8` | `v_5 = 2`, `25 > 8`; `v_5(360) = 1`, `5 < 8` | agrees with "`q ≡ 1 mod p^N`, `p^N > n`" in both directions |
| §11.3, `s^c ≅ s^∨ ⊗ ε^{1−2r}` | `r = 2`, `r = 3`; wrong model `y y^c = 1` | `(r_π ⊗ Sym^{r−1} r_σ)^∨ ≅ (·) ⊗ ε^{2r−1} ω_p^{1−r}`; `r = 2`: `ε^{−3} ω_p (y y^c)^{−1} = ε^{−3}`; `r = 3`: `ε^{−5} ω_p² (y y^c)^{−2} = ε^{−5}`; wrong model gives `ε^{−3} ω_p` | `y y^c = ω_p` is needed. The multiplier `ε^{1−n}` (`n = 4`: `ε^{−3}`) agrees |
| §11.1 characters, Hodge–Tate check | `x x^c = ε` with `HT_{u_0}(x) = 0` | `HT_{u_0}(x) + HT_{u_0^c}(x) = HT(ε)`, so `x` has weight `±1` at `u_0^c` | consistent: no character of weight `0` at both places |
| §12.6, odd `p` | `q = 0`, `|S ∪ S_∞| = 1`; `p = 2`, `|S ∪ S_∞| = 3`, `q = 3` | old `2q ≥ |S ∪ S_∞|`: `0 ≥ 1` false, though Proposition 4.8 allows `q = 0`; `γ = 2 − 3 + 3 = 2` | the old sentence excluded an allowed value. Replaced. For `p = 2`, `q ≥ |S ∪ S_∞|` gives `γ ≥ 2` |
| §12.6 Check `dim W′_∞ − dim W_∞ = (n − 1)q` | `n = 4`, `q = 3` | `(1 + 12 + 4|S∪S_∞| − 1) − (1 + 3 + 4|S∪S_∞| − 1) = 9 = 3·3` | unaffected |
| Mathlib contract, `Nat.multiplicity_pow_two_sub_one` | `x = 5`, `n = 2, 4`; `n = 0`; odd `j = 3` | `n = 2`: `v₂(24) + 1 = 4 = 1 + 2 + 1`; `n = 4`: `v₂(624) + 1 = 5 = 1 + 2 + 2`; `n = 0`: `multiplicity 2 0 = 0`, so `1 ≠ 3`; `5³ − 1 = 124 = 4·31`, `v₂ = 2` | `n ≠ 0` and `Even n` are needed; odd `j` is outside the theorem, as the contract says |
| §13.8 with PotentialAutomorphyInfrastructurePartII §8.7 | `p = 5`, `r = 1, …, 4` | `l = 5 > 3`; `n = p + r ∈ {6, 7, 8, 9}`, none divisible by `5`; constituents of dimensions `p − r`, `2r`: `(4, 2)`, `(3, 4)`, `(2, 6)`, `(1, 8)` | §8.7's `l > 3`, `l ∤ n` and multiplicity-free hypotheses fit. Ranks sum to `p + r` |
| §13.7 with ModularityAndLanglandsExtensions §2.1, Fontaine–Laffaille criterion | `l = 5`, weights `{0, 3}`, `{0, 4}` | interval length `l − 2 = 3`: `{0, 3} ⊂ [0, 3]`; `{0, 4}` not | the criterion discriminates. Steinberg-at-`p` forms are semistable, not potentially crystalline, so §13.7 uses it only at the auxiliary prime `q` |
| IntegralHeckeAndGaloisDeterminants §1.4 contract | two blocks `ρ̄_1 ⊕ ρ̄_2`, `J = m_A`; `J = 0` | `I_red = A_{12}A_{21} ⊆ m_A` always (residually split); at `J = 0` it factors iff `A_{12}A_{21} = 0` | residual reducibility is automatic; reducibility over `A` is `V(I_P)`, closed |
| nt26 page locators | §3, §§5–6, Propositions 4.8–4.9 | page-12 marker line 517 < §3 line 554 < page-13 marker line 571; page-37 marker line 1707 < §5 line 1709; Proposition 4.8 at line 1586 (p. 34), Proposition 4.9 at line 1643 (p. 35) | pp. 12–25, 12–13, 37–50 and 34–35, as now written |
| §14.4 locator | nt21 p. 2 | Theorem A at lines 57–60, Corollary C at lines 71–73; `Δ` occurs `0` times on pp. 1–3 | locator rewritten |
| Heading renames | old titles | `0` citations of the six old titles in other roadmaps | numbers unchanged; nothing breaks |

The repairs add no theorem, definition or Lean declaration. The one new Check (F01) is a negative control.

## Checks run

- **Elaboration.** `lake env lean packages/ModularityAndLanglandsExtensionsPartII/Suggested.lean`, run from the content checkout, exits 0. Its only output is two warnings, both "declaration uses `sorry`", at lines 98 and 117. No `TauCeti.*` module needed building.
- **Signatures.** `#check @name` was run for all four declarations in one scratch copy of the file (outside the package), together with `#check @Nat.multiplicity_pow_two_sub_one`. The elaborated types are identical to the worker's elaborated-signature list for this round and to the README statements (`1 ≤ n`; the Satake hypotheses; for general level `[NeZero N]`, `2 ≤ k`, `¬HasQuadraticSelfTwist f` and the product over `p ∤ N`). The only change to `Suggested.lean` is a docstring, so no binder changed.
- **Dependency check.** Output of `gate --depcheck … --name ModularityAndLanglandsExtensionsPartII --movable`:

      depcheck: 245 roadmaps, 2257 edges, 0 problem(s)

  There is no UPWARD, CYCLE or `moved:` line.
- **Citations.** `roadmaps resolve` on the README reports "Cross-roadmap citations found nowhere: None" and "Lean names found nowhere: None".
- **Gaps.** All 13 gap slugs have README "What … must provide" lines whose text equals the `needs` field in `design/plan.json`, checked by script after the edit.

## For the maintainer

- **Headings.** Six headings were renamed (Layer 11, §§5.1, 5.7, 9.1, 11.1, 13.2). Every section number is unchanged, and no other roadmap cites the old titles. No Lean name changed.
- **Ownership.** No new object or target was introduced, so ownership is unchanged. The supplier sections now cited were checked at the heads of the open pull requests of PotentialAutomorphyInfrastructurePartII, ModularityAndLanglandsExtensions, IntegralHeckeAndGaloisDeterminants and GlobalGaloisDeformations.
- **Note for the next review, not a finding of this one; left unchanged.** §13.8's route cites the supplier alias "The ANT lifting theorem with weak primitivity" and says it "contains th24 Theorem 7.5". The alias points to ModularityAndLanglandsExtensions §4.2. At its head, §4.2 states ANT20 Theorem 6.1 with the hypothesis `F(ζ_ℓ) ⊄ F^{ker ad(ρ̄^{ss})}` and the source's primitivity. th24 Theorem 7.5 (th24 lines 1965–1983, p. 44) replaces that hypothesis by an auxiliary place `w` with `H⁰(F_w, ad ρ̄(1)) = 0`. A reviewer may want to confirm which form §13.8 needs.
