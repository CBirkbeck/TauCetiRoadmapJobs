# FIX-PKG-ModularityAndLanglandsExtensionsPartII~11

Findings of `REV-PKG-ModularityAndLanglandsExtensionsPartII~10` (three findings, all P3). Each was
read against the cached source texts before it was applied. Files changed:
`packages/ModularityAndLanglandsExtensionsPartII/README.md` and the top-level `gaps` list of
`packages/ModularityAndLanglandsExtensionsPartII/design/plan.json` (two `needs` strings, each kept
identical to its README contract line). `Suggested.lean`, `sources.toml` and `metadata.toml` are
unchanged.

## F01 (P3) — applied

Verified. nt26 line 1647 defines `γ = 2 − |S ∪ S_∞| + q`, and lines 1665–1672 give the free
`Ĝ_m^γ`-action on `Sp R′_∞`, `δ^{−1}(1) = Sp R_∞` and the `Ĝ_m^γ[2]`-actions. `qn + 4|S ∪ S_∞|` is the
dimension of the component `Z` of `Spec P_∞` (lines 1691–1694), not a torus rank. Lines 1695–1705
give the transitivity and the orbit argument.

§12.7 proof sketch: "the torus action of rank `n + 4|S ∪ S_∞|` and the formal `Ĝ_m^γ[2]`-torsor act
transitively … lift to both patched modules" → the free `Ĝ_m^γ`-action (`γ` as in §12.6) and the
torsor `Sp R_∞ = δ^{−1}(1)` make `Ĝ_m^γ[2](𝒪)` transitive on the components of `Spec R_∞`. The
component through `𝔭_∞` has dimension `qn + 4|S ∪ S_∞| = dim W′_∞` and lies in `Supp H_{G,∞}`.
Then the orbit argument, as in §9.7.

Pattern search: "torus", "torsor" and `Ĝ_m` were checked across the README. §§9.6, 9.7 and 12.6
and the formal-torus contract already use `Ĝ_m^γ` with the right `γ`. No other place gives a rank.

## F02 (P3) — applied

Verified. nt21 line 646 (p. 14) says a discrete extension has all `l_i = 1` and `J`, `K` empty. The
converse is elementary. For distinct conjugate self-dual `ρ_i`, Schur's lemma makes the centraliser
`(ℂ^×)^{|I|}`, and the extension cuts it down to `{±1}^{|I|}`. The reviewer's witness `σ ⊕ σ` (`n = 2`,
sign `+1`) was recomputed. It extends, and its centraliser contains `Sp_2(ℂ)`.

§4.3 proof sketch: "(all `l_i = 1` and no `τ_k`)" → "(the extended parameter has finite centraliser in
`GL_n(ℂ)`: all `l_i = 1`, no `σ_j` and no `τ_k`; nt21 p. 14)". A fourth Check was added: `σ ⊕ σ` extends
but is not `θ`-discrete, and its packet comes from parabolic induction from `Res GL_1` of `U(1, 1)`.

Pattern search: "discrete" occurs elsewhere only in the explicit-tempered-unitary-packets contract
(it names the source's term without a parenthesis) and in an unrelated sentence (§5).

## F03 (P3) — applied

All five ranges were checked against the page markers of the cached texts:

- §7.4: "pp. 85–89" → "pp. 85–88". Proposition 7.4 is at nt21 line 4164 (p. 85) and the proof ends at line 4328. The marker of p. 89 is line 4329.
- §7.4 sketch: "nt21 pp. 88–89" → "nt21 p. 88" (descent at lines 4312–4328).
- §7.5: "proof, p. 89" → "proof, pp. 89–90" (proof at lines 4331–4384; marker of p. 90 is line 4376).
- §8.2: "pp. 92–95" → "pp. 92–96" (proof ends at line 4685; marker of p. 96 is line 4662).
- Contract `gap:tensor-taylor-wiles-primes`: "pp. 34–35" → "pp. 34–36". Proposition 4.9 continues to nt26 line 1672, and the Taylor–Wiles passage is at lines 1677–1682 (marker of p. 36 is line 1663). The same change was made to the `needs` string in `design/plan.json` `gaps`.

The pattern was then swept with a script. It compares every "<source> Theorem/Proposition/Lemma/Corollary X [and proof], p./pp." locator into nt21, nt21b, nt26, th24, ct17, ct15 and at20 with the heading line and the end-of-proof mark in the text. It also covered the "…; proof, pp." locators and the bare page ranges. It found two more instances of the same slip:

- §4.4: "nt21 Proposition 1.12, pp. 15–16" → "p. 16". The definitions of `τ(v)`, `C`, `λ(v, θ)` start at line 712 and Proposition 1.12 with its proof runs lines 731–752, all on p. 16 (marker at line 710). p. 15 holds only an introductory sentence.
- Contract `gap:unobstructed-auxiliary-prime-and-slope-count`: "nt21 pp. 92–95" → "pp. 92–96". The patched module of full support is at nt21 lines 4670–4678, on p. 96. The same change was made in `design/plan.json` `gaps`, and the two texts are again identical (compared by script for all 14 slugs).

The script's other flags were statements spanning two pages, or proofs printed apart from their statements, and each was read and is correct: nt21 Lemma 2.29 (pp. 44–46), Theorem 3.2 (pp. 53–54), Theorem 3.1 (pp. 53, 57), Corollary 1.13 (pp. 16–17), Proposition 1.15 with its §1.8 set-up (pp. 17–18), Lemma 7.2 (pp. 83–84); ct17 Proposition 4.1, Lemma 5.5 and Theorem 5.1; nt26 Theorem 4.1 (pp. 25–26). The other locators of the form "proof, pp." also match their texts: nt21 Theorems 4.1 and 6.1, nt21b Theorems 2.1 and 3.1, nt26 Theorem 5.9. The plan's non-`gaps` body still carries the old locators. This brief does not allow that part to be edited.

## Adversarial pass on the changed text

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| §12.7 sketch, torus | `q = |S ∪ S_∞| = 3`, `n = 4` | `γ = 2 − 3 + 3 = 2` (not `16`); `Ĝ_m^γ[2](𝒪) = {±1}²`, order `4` | agrees with §12.6, Check 3 |
| §12.7 sketch, component dimension | same; `n = 2` (`r = 1`) | `dim W′_∞ = 1 + nq + 4|S ∪ S_∞| − 1 = 24 = qn + 12`; for `n = 2`: `2q + 4|S ∪ S_∞|` | full-dimensional, as needed for a module finite free over `W′_∞` |
| §12.7 sketch, minimal `q` | `q = |S ∪ S_∞|` | `γ = 2` for every `|S ∪ S_∞|`; `q = 0` excluded by the bound of §12.6 | consistent |
| §4.3 `θ`-discrete, negative | `n = 2`, `σ ⊕ σ`, sign `+1` | `m = 2` even: extends; opposite sign to `(−1)^{n−1} = −1`, centraliser `⊇ Sp_2(ℂ)` | excluded by "no `σ_j`" (new Check) |
| §4.3 `θ`-discrete, negative | `n = 2`, `ρ ⊕ ρ` sign `−1`; `τ ⊕ τ^{w_c,∨}` | centraliser `⊇ O_2(ℂ)`; `⊇ GL_1(ℂ)` | excluded by `l_i = 1`, no `τ_k` |
| §4.3 `θ`-discrete, positive | `n = 1`, `χ`; `n = 3`, `St_2(χ) ⊞ 1` | centraliser `{±1}`; `χ` conjugate symplectic (`χ|_{F⁺×} = ε_{F/F⁺}`) ⊗ `Sym¹` (sign `−1`) gives sign `+1`, and the trivial character has sign `+1`, each once: centraliser `{±1}²` | discrete; Check 4 of §4.3 (`St_2(χ) ⊞ 1`) still holds |
| New §4.3 Check, packet | `π = σ × σ` | `π_1 = σ`, `π_1^θ = σ^{w_c,∨} = σ`, `π_1 × π_1^θ = σ × σ` (nt21 lines 694–697 with `n − 2n_1 = 0`) | packet = subquotients of the Borel induction of `U(1, 1)` |
| Page ranges | the seven ranges above | line numbers against the markers, as listed | corrected |

## Checks run

- `lake env lean packages/ModularityAndLanglandsExtensionsPartII/Suggested.lean` (from the content checkout): exit 0. The output is two warnings, "declaration uses `sorry`", at lines 98 and 117, and nothing else. No `TauCeti.*` module needed building. The file is unchanged this round.
- Signatures: `#check @name` for all four declarations (`symPowerEulerFactor`, `HasQuadraticSelfTwist`, `symPowerEulerProduct_levelOne_entire`, `symPowerEulerProduct_entire_of_not_hasQuadraticSelfTwist`), elaborated once in a scratch copy. Each type carries `1 ≤ n`, the Satake hypotheses (with `¬p ∣ N` for the second theorem), `[NeZero N]`, `2 ≤ k`, `¬HasQuadraticSelfTwist f`, and the products over `Nat.Primes` and over `{p // ¬p ∣ N}`. They agree with README §§14.4–14.5. No binder lost, nothing changed.
- Dependency check (`gate --depcheck … --movable`): output `depcheck: 243 roadmaps, 2293 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line.
- `design/plan.json`: valid JSON. Only `gaps` differs from the previous head, and the README contract line equals the `needs` string for every one of the 14 slugs.

## For the maintainer

- No Lean name, section number or cross-roadmap citation changed. No other roadmap is affected.
- No source was fetched and none is missing. `needs-references.toml` was not written.
- Ownership: this round added no construction. The text added is one proof-sketch clause, one parenthesis, one Check and corrected locators. No ownership question arises.
- No suspicious instruction was found in the review text.
