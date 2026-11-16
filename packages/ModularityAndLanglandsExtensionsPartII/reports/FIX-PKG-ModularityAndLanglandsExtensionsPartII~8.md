# FIX-PKG-ModularityAndLanglandsExtensionsPartII~8

Findings of `REV-PKG-ModularityAndLanglandsExtensionsPartII~7` (five; one P1, four P3). Every finding
was checked against the sources (`nt21`, `nt21b`, `nt26`, `th24`) and the suppliers at their open heads
(PotentialAutomorphyInfrastructurePartII, ModularityAndLanglandsExtensions, SerreWeightAndLevelOptimisation).
Edited: `packages/ModularityAndLanglandsExtensionsPartII/README.md` and the top-level `gaps` list of
`packages/ModularityAndLanglandsExtensionsPartII/design/plan.json`. `Suggested.lean`, `sources.toml` and
`metadata.toml` are unchanged.

## F01 (P1) — applied differently

**Changed.** §13.8 now cites the new gap `auxiliary-place-reducible-lifting` (PotentialAutomorphyInfrastructurePartII,
§8.16 (Layer 8); its README contract line and its `design/plan.json` entry carry the same text) in place
of the alias. The sketch builds the place `w` (`ε̄(σ) = −1`, th24 pp. 46–47). Two Checks were added: the
negative control and the cyclotomic hypothesis. *Needs* and Layer 13 *Dependencies* now name the gap.

**Evidence.** th24 Theorem 7.5 (`th24` lines 1965–1998, pp. 44–45) replaces ANT's clause
`F(ζ_p) ⊄ F̄^{ker ad ρ̄}` by a place `w` with `H⁰(F_w, ad ρ̄(1)) = 0`. nt26 Proposition 6.3 applies this
theorem (`nt26` lines 2325–2334). The alias target, ModularityAndLanglandsExtensions §4.2, keeps the old
clause. PotentialAutomorphyInfrastructurePartII §8.16 proves only the finiteness form. `roadmaps grep`
found no roadmap that states the lifting form.

**Why "differently".** The reviewer's instance uses `a = 3`, but §13.8 requires `a > a₀(p)` with
`a₀(p) ≥ 3` (`th24` line 1885). The Check therefore uses an odd `a > a₀(7)` (then `7^a ≡ 3 mod 4`). For
the place, th24 takes `ε̄(σ) = −1` in every case (`th24` lines 2068–2086), not only when
`[F(ζ_p) : F] = 2`. In addition:
- the gap is written in terms of `ρ̄^{ss}` and keeps §8.16's no-`l`-power-quotient hypothesis, which the
  new Check verifies for this application;
- the first step of the sketch now states the linear disjointness that the choice of `σ` uses (th24 p. 45);
- the Theorem 7.5 locator gains "and proof, p. 45".

**Pattern.** The alias is used in one other place, §7.3. There §7.2(4) proves the old clause (nt21
Lemma 7.2), so §7.3 is unchanged. §13.9 needs no change.

**Owner.** ModularityAndLanglandsExtensions cannot host the lifting form: it would need
PotentialAutomorphyInfrastructurePartII §8.16, and PotentialAutomorphyInfrastructurePartII already
consumes its §4.2, so that would be a cycle. PotentialAutomorphyInfrastructurePartII owns §8.16 and the
route ingredients (§§7.19, 8.4–8.6).

## F02 (P3) — applied

**Changed.** §6.2 Check, old: "the Hecke algebra is of level prime to `v`". New: "the level at `v` is
Iwahori, as for the unipotent ring (nt21 §6, p. 79), so forms unramified at `v` contribute to `𝕋_D`, and
their Galois representations need not be points of `R^{St}_v`", followed by the instance `n = 3`, `p = 5`,
`q_v = 11` (ratios `1 ≠ 11`).

**Evidence.** `Iw_ṽ` is the level for both `R^1_v` and `R^{St}_v` (`nt21` line 3868, p. 79). "need not"
replaces the reviewer's "do not": one point outside `R^{St}_v` is all the Check needs.

## F03 (P3) — applied

**Changed.**
- §3.3: "labels the twin by the original index `i`" → "writes `z ∈ X_{i′}`; the twin `z′` is meant, as its
  proof says".
- §5.2: "p. 61" → "pp. 61–62".
- §9.4: "pp. 9–11" → "pp. 10–11".
- §13.8: "p. 49" → "pp. 49–50".
- §14.2: "Theorem 8.1;" → "Theorem 8.1, p. 91;".

**Evidence.** `nt21` line 2657; page markers at `nt21` line 3010 (p. 62), `nt21b` line 443 (p. 10, where the
unitary group starts), `nt26` line 2327 (p. 50) and `nt21` line 4421 (p. 91, Theorem 8.1 at line 4435).
§13.7's "Corollary 6.2, p. 49" is correct (`nt26` lines 2296–2310).

## F04 (P3) — applied

**Changed.** §12.6 Check, old: "For `γ = 0` there is no twisting action and `R′_∞ = R_∞`." New: "Since
`q ≥ |S ∪ S_∞|`, `γ ≥ 2`: for `q = |S ∪ S_∞| = 3`, `γ = 2` and `Ĝ_m^γ[2](𝒪) = {±1}²` has order `4`
(`−1 ∈ 1 + 𝔪_𝒪` as `p = 2`); without the bound, `q = 0` gives `γ = −1`."

**Evidence.** `nt26` line 1643. The same sentence in §9.6 stays, because §9.6 has `q ≥ |S ∪ S_∞| − 2`, so
`γ = 0` occurs there.

## F05 (P3) — applied

**Changed.** SerreWeightAndLevelOptimisation contract: ", Edixhoven Theorem 2.6" deleted.

**Evidence.** There is no Edixhoven entry in `sources.toml` or in References, and the supplier's §3.2
carries the attribution. A regex scan found no other author-plus-theorem citation without a manifest key.

## Checks run

**Lean elaboration.** Command: `lake env lean packages/ModularityAndLanglandsExtensionsPartII/Suggested.lean`,
run from the content checkout. Exit 0. Output: two warnings, "declaration uses `sorry`", at lines 98 and
117. No `TauCeti.*` module needed building. The file was not changed this round.

**Signatures.** `#check @name` was run in one scratch file for all four declarations:
`symPowerEulerFactor`, `HasQuadraticSelfTwist`, `symPowerEulerProduct_levelOne_entire` and
`symPowerEulerProduct_entire_of_not_hasQuadraticSelfTwist`. The elaborated types are unchanged and match
the README: `1 ≤ n`; the Satake hypothesis; `[NeZero N]`; `2 ≤ k`; `¬HasQuadraticSelfTwist f`; the product
over `p ∤ N`. No binder was lost.

**Dependency check.** Output:

    depcheck: 245 roadmaps, 2267 edges, 0 problem(s)

No UPWARD, CYCLE or `moved:` line. The new gap names PotentialAutomorphyInfrastructurePartII, which is
earlier in the merge order. Chebotarev is on main.

**Citations** (`roadmaps resolve` on the README): "Cross-roadmap citations found nowhere: None. Lean names
found nowhere: None."

**Gaps.** 14 slugs. For each, the README's "What … must provide (gap:…)" line equals `design/plan.json`
`needs` (compared by script).

**Ownership against open pull requests.** Checked with `roadmaps grep` over the open heads and main, for
th24 Theorem 7.5 and for the vanishing condition `H⁰(G_{F_w}, ad …(1))`. Only
PotentialAutomorphyInfrastructurePartII §8.16 (finiteness form) matched, so the lifting form had no
owner, and it becomes a gap on that roadmap.

## Adversarial pass (changed or added statements)

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| §13.8 negative control (old clause fails) | `p = 7`, `a = 5` (stand-in for odd `a > a₀(7)`), image `{g ∈ GL_2(𝔽_{7^5}) : det g = ±1}` | `7^5 = 16807 = 4·4201 + 3`, so `−1` is a non-square; scalars `λ² = ±1` in `𝔽_{16807}` give `λ = ±1`, det `1`, `ε̄ = 1` on `ker ad r̄`. `[ℚ(ζ_7)⁺(ζ_7) : ℚ(ζ_7)⁺] = 2` | ANT clause fails over every CM `K ⊇ F` | Check added; reviewer's `a = 3` corrected (`a > a₀(7) ≥ 3`) |
| §13.8 negative control, reviewer's value | `a = 3` | `a₀(7) ≥ 3` and the statement needs `a > a₀(7)`, so `a ≥ 4` | instance outside the hypotheses | odd `a > a₀(7)` used instead |
| Kernel equality `ker ad (Sym^{p+r−1} r̄)^{ss} = ker ad r̄` | `r̄(σ) = α(1 + N)`, `N ≠ 0`; `r̄(σ) = diag(α, β)` | eigenvalues `α^{p+r−1−i}β^i` all equal forces `α = β`; then `φ_p(1 + N) ⊗ Sym^{r−1}(1 + N) − 1 ⊇ φ_p N ⊗ 1 ≠ 0`, not scalar | equality holds | stated in the Check |
| §13.8 auxiliary place | `p = 7`, `r = 4` (`n = 11`), `ε̄(σ) = −1`, ratio `α/β` of order `> 20` | `ad(Sym^{10} r̄)(1)` eigenvalues `−(α/β)^j`, `|j| ≤ 10`; `j = 0`: `−1 ≠ 1`; `j ≠ 0`: `(α/β)^j = −1` would force order `∣ 2|j| ≤ 20` | `H⁰ = 0` | sketch sentence added |
| Existence of the ratio of large order | `q = p^a ≥ 5^4 = 625`; torus centraliser of `g` in `PSL_2(𝔽_q)` has cyclic part of order `(q ∓ 1)/2 ≥ 312` | `312 > 2(p + r − 1)` for `p = 5` (`≤ 16`); for `p = 7`, `(2401 − 1)/2 = 1200 > 24` | ratio exists | bound written as `> 2(p + r − 1)` (sharper than `4(…)`) |
| Gap ⇐ old clause (consistency with §4.2) | `σ ∈ ker ad ρ̄^{ss}`, `ε̄(σ) ≠ 1` | Chebotarev gives `w` with scalar Frobenius and `q_w ≢ 1`; all eigenvalues on `ad(1)` equal `q_w ≠ 1` | old clause implies the new place hypothesis | none |
| Gap, `n = 1` (degenerate) | character `ρ̄` unramified at `w` | `H⁰(G_{F_w}, k(1)) = 0` iff `q_w ≢ 1 mod l` (§8.16's own Check) | consistent; §4.2 has `n ≥ 2` anyway | none |
| Gap hypotheses in §13.8 | `p = 5`, `r = 1..4` | `l = p ≥ 5 > 3`; `n = p + r ∈ {6,…,9}`, `5 ∤ n`; ranks `(p − r, 2r)` distinct | `l > 3`, `l ∤ n`, multiplicity-free | none |
| Cyclotomic hypothesis Check | `p = 5`, `F = ℚ`: index `[ℚ(ζ_5) : ℚ] = 4 < 10`; `SL_2(𝔽_5)` (`q = 5 ≥ 4`) perfect; `k^×/{±1}` of order `(|k| − 1)/2`, prime to `5` | a `5`-power quotient is trivial | holds | Check added |
| Cyclotomic Check, twist | `ψ̄^{−1} ⊗ r̄` | derived subgroup unchanged (scalars central) and contains `SL_2(𝔽_{p^b})` | argument unchanged | stated |
| §6.2 Check (F02) | `n = 3`, `p = 5`, `q_v = 11` | `11 − 1 = 10 ≡ 0 mod 5`; unramified lift with Frobenius `1` has ratios `1 ≠ 11`; level `Iw_ṽ` (nt21 line 3868) | point at Iwahori level outside `R^{St}_v` | reason corrected |
| §12.6 Check (F04) | `q = |S ∪ S_∞| = 3`; `q = 0` | `γ = 2 − 3 + 3 = 2`, `|{±1}²| = 4`; `2 − 3 + 0 = −1`; `p = 2`: `−1 = 1 − 2 ∈ 1 + 𝔪_𝒪`, and `x² = 1` in a domain gives `x = ±1` | `γ ≥ 2` | Check replaced |
| §9.6 Check kept | `q = |S ∪ S_∞| − 2` | `γ = 2 − |S ∪ S_∞| + |S ∪ S_∞| − 2 = 0` | genuine boundary | none |
| §3.3 (F03) | nt21 lines 2656–2660 | statement `z ∈ X_{i′}`; proof puts `z′` in `X_{i′}` | misprint is the point, not the index | text corrected |

## For the maintainer

- **New supplier gap** `auxiliary-place-reducible-lifting` on PotentialAutomorphyInfrastructurePartII
  §8.16 (Layer 8). That roadmap is asked to state, beside §8.16, the lifting form of Thorne 2024
  Theorem 7.5. Its inputs are §8.16's finiteness and the route of ModularityAndLanglandsExtensions §4.2.
- **No Lean names changed.** No ids that other roadmaps cite were dropped or renumbered.
- **Suspicious text:** none found in the review.
