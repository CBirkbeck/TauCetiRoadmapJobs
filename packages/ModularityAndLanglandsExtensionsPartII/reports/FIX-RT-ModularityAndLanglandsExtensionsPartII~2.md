# FIX-RT-ModularityAndLanglandsExtensionsPartII~2: red-team round 2 repaired

Ten findings from two reviews (2a: F01–F03; 2b: F01–F07). 2a/F03 and 2b/F04 overlap on the Weston
locator and are settled together. Every finding was checked against the cached sources, the supplier
roadmaps at their heads and the pinned libraries. All of them hold. `Suggested.lean` is unchanged:
no finding touches it.

## RT-ModularityAndLanglandsExtensionsPartII~2a/F01 (P2) — applied

§11.1 now also requires `ȳ` trivial on `G_{K_{1,ṽ}}` (`ṽ | p`) and on `G_{K_{2,ṽ}}` (`ṽ` above `v_0`), from `Y = Y′ ∘ N_{K_1/K_0}` (nt26 lines 763–770) and prescribed completions. Added an API bullet, the Check `s̄ = c^{1−r}·1_{2r}` and a note on nt26 line 975. §11.4 states the triviality; §11.6 "scalar" → "trivial", Check recomputed.

## RT-ModularityAndLanglandsExtensionsPartII~2a/F02 (P3) — applied

PotentialAutomorphyInfrastructure §2.5 only splits places completely and itself sends prescribed completions to PotentialModularityAndCompatibleSystems §2.16. Contract sentence corrected; §2.16 contract row added; scope updated. §2.16 is added to the sketches or Needs of §§9.1, 11.1, 12.1, 14.1 (replacing §2.5 there) and to the Dependencies of Layers 9, 11, 12, 14.

## RT-ModularityAndLanglandsExtensionsPartII~2a/F03, RT-ModularityAndLanglandsExtensionsPartII~2b/F04 (P3) — applied

The gap line and its `plan.json` `needs`: "(Weston, wes04)" → "wes04 Proposition 3.2 with Remark 3.3, pp. 5–6 … Proposition 5.3, p. 10 …: `H⁰(ℚ_l, ad⁰ r̄(1)) = 0`" (wes04 lines 202, 246, 427; nt21 line 4534). Added ct15 p. 14 (Proposition 3.10, twice), p. 22 (Lemma 4.3), §6 pp. 27–31. `sources.toml` locators for wes04 and ct15 updated.

## RT-ModularityAndLanglandsExtensionsPartII~2b/F01 (P2) — applied

The §9.7 sketch now proves enormity. `G⁰` is not a torus: a scalar one is excluded by Sen, induction by `PSL_2(𝔽_{p^a})`. So `G ⊇ SL_2`, and the commutator argument passes to `G_{K(ζ_{p^∞})}`. The witness is `Sym^{n−1}diag(a, a^{−1})`. Added two Checks; ArithmeticGaloisRepresentations §§7.6, 7.10 and PadicHodgeTheory §4.4 added to the Needs and the Layer 9 Dependencies.

## RT-ModularityAndLanglandsExtensionsPartII~2b/F02 (P3) — applied

§5.1 "λ̃(ṽ, Θ_ṽ, n) is the type of `GL_n(𝒪)`" → definitions of `λ̃(ṽ, Θ_ṽ)` (`1 ≤ n_1 ≤ n`), of the parahorics `𝔮_ṽ` (`(n_1, n_2)`) and `𝔯_ṽ` (`(n_1, 1, …, 1)`), and of `λ̃(ṽ, Θ_ṽ, n)` on `𝔮_ṽ` (not a type unless `n_2 ≤ 1`; nt21 lines 875–880). Added an API bullet and three Checks. §6.4 points to §5.1.

## RT-ModularityAndLanglandsExtensionsPartII~2b/F03 (P3) — applied

At its head 9228cb0, SmoothRepresentationsOfLocalGroupsPartII states the classification itself (§7.4) and never cites this roadmap, so the consumer claim was false. Downstream bullet → "Later roadmaps that need … take it from §4.9"; scope sentence → "it is the owner of that statement" (merge-order line 284 against 294). Removing the duplicate belongs to the other roadmap (see below).

## RT-ModularityAndLanglandsExtensionsPartII~2b/F05 (P3) — applied

Layer 0: "carriers of Newton–Thorne I §2 (nt21 §§…)" → "carriers of the continuation argument". Layer 1: "proves nt21 Theorems 2.24 …" → the mathematics of §§1.1–1.4. Scope: "exactly the logical structure of …" → "the only input they take from the seed layers; §7.6 and §14.1 discharge it". Same repair in the Layer 2 introduction.

## RT-ModularityAndLanglandsExtensionsPartII~2b/F06 (P3) — applied

In the §§11.2 and 11.6 Needs, the short titles → the full supplier headings "… with relaxed-adequate image" (§§5.5, 5.7). The Layer 5 contract now quotes the titles of §§5.4, 5.5, 5.7, 5.8. §11.2 gains the image hypothesis: `SL_2(𝔽_{p^a})`, adequate by ArithmeticGaloisRepresentations §7.9, so relaxed-adequate (§5.4). A script confirms every quoted supplier title matches.

## RT-ModularityAndLanglandsExtensionsPartII~2b/F07 (P3) — applied

§6.2 Check: "`p = 5`, `q_v = 11`, ratios `1 ≠ 11`, as in the Check of §6.3" → "`p = 7` (so `p > 2n`), `q_v = 29 ≡ 1` mod `7`, ratios `1 ≠ 29`". The §6.3 Check keeps `p = 5`: its partition rings belong to the ct17 setting (`l = 5 ∤ 6`).

## Adversarial pass on new and changed statements

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| §11.1 `ȳ` trivial above `p` | `r = 2`, `ȳ(Frob_ṽ) = c` | `s̄ = c^{1−r}1_{2r} = c^{−1}1_4`; `c = 1` gives `1_4`; `r = 3`, `c = −1` gives `1_6` already | requirement needed when `c^{r−1} ≠ 1` | Check added |
| §11.1 `ȳ` trivial above `v_0` | `ℓ_0` split in `K_0`, `ȳ′` unramified | `ȳ(Frob_ṽ) = ȳ′(Frob_λ)^{f(F_{2,w}/ℚ_{ℓ_0})}` = 1 when `f` is divisible by its order | holds | wording fixed to absolute residue degree |
| §11.4 trivial residual | `F′ = F_1` at `T_{F_1}` | `r̄` not trivial there over `F_1`; the rings there are fixed type | first wording false at `T_{F_1}` | restricted to `S_p` and `T_{F_2}`, `T_{F_3}` |
| §11.6 ordinary lift | `ζ_p ∈ F_{2,v}` | `ε̄ = 1` locally, so `⊕ε^{−i}` reduces to `1_n` | holds | "a twist of" dropped |
| §9.7 enormity | `n = 2`, `a² ≠ 1`; `n = 3`, `a = 2, −1, i` | `{a, a^{−1}}`; `{4,1,1/4}`; `{1,1,1}`; `{−1,1,−1}` | criterion `a^{2m} ≠ 1`, `m ≤ n−1` | Check reworded (not "infinite order needed") |
| §9.7 torus case | non-scalar torus, index-2 stabiliser | Borel image mod scalars is soluble; `PSL_2(𝔽_{p^a})`, `p^a ≥ 7` is simple | contradiction | "abelian" corrected to "soluble" (a non-semisimple restriction is only soluble) |
| §9.7 CM Check | `r = Ind χ` | `Sym² = 2 + 1` (line spanned by `e_1e_2`) | reducible, so not enormous | none |
| §5.1 `[GL_3(𝒪):𝔮]` | `n_1 = 2`, `q = 3` | `q²+q+1 = 13` | holds | none |
| §5.1 `[𝔮:𝔯]` | `n_2 = 2`; `n_2 = 1`; `n_1 = n` | `q+1`; `1`; `𝔮 = 𝔯 = GL_n(𝒪)` | holds | none |
| §5.1 `dim λ̃` | `n_1 = 1, 2, 3` | `1`, `q−1`, `(q−1)(q²−1)` = `|GL_{n_1}|_{p′}/(q^{n_1}−1)` | holds; `n_1 = 3` agrees with §4.4 at `q_ṽ = q²` | none |
| §5.1 sign | `n_1 = 3` | `(−1)^{2} = +1`, equal to §4.4 `R_{C̃}^{GL_3}θ̃` | consistent | none |
| §6.2 Check | `p = 7`, `n = 3`, `q_v = 29` | `7 > 6`; `29 = 4·7 + 1`; ratios `{1}` ∌ `29` | holds | none |
| §11.2 image | `p = 5`, `a ≥ 4` | `p^a ≥ 625 ≥ 6`; `[SL_2, SL_2] = SL_2` for `p^a ≥ 4` | adequate, hence relaxed-adequate | none |
| §14.1 completion at `q` | `p = 577`, `q = 3` | order of `3` mod `577` divides `576`; unramified degree of that order with the field of `r̄|_{G_{ℚ_3}}`: Galois and soluble | prescribable by §2.16 | none |
| wes04 locators | Prop 3.2 (ps/sc), Rem 3.3, Prop 5.3 (special); `k = 2` | no weight condition in either proposition | agrees with nt21 line 4534 | none |
| ct15 pages | lines 647/676, 1078/1084, TOC line 24 | p. 14, p. 22, pp. 27–31 | located | none |

## Checks run

- **Elaboration of `Suggested.lean`.** Command: `lake env lean packages/ModularityAndLanglandsExtensionsPartII/Suggested.lean`, run from the content checkout. Result: exit 0, with two `declaration uses 'sorry'` warnings, at lines 98 and 117. The Tau Ceti object `TauCeti.NumberTheory.ModularForms.Newforms.Satake` was already built.
- **Signatures.** All four declarations were checked with `#check @name` in one scratch copy, elaborated once. The elaborated types equal the README statements of §§14.4–14.5 and the worker's signature file. Nothing changed: there are no section `variable`s, so no binder can be lost.
- **Dependency check** (command of the brief), after the final edits: `depcheck: 253 roadmaps, 2423 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line.
- **`roadmaps resolve`** on the README: no cross-roadmap citation or Lean name is found missing.
- **Gaps.** By script, the README and `design/plan.json` both list the same 15 slugs, with equal `needs` and suppliers. Only the `needs` of `unobstructed-auxiliary-prime` changed.
- `sources.toml` parses: 18 sources.

## For the maintainer

- **SmoothRepresentationsOfLocalGroupsPartII.** At its head 9228cb0 it states the Kazhdan–Lusztig classification as its own §7.4 (its README line 1558). This roadmap is earlier in the merge order (284 against 294), so it owns the statement, and that roadmap should cite §4.9 instead. That edit belongs to the other roadmap; this package no longer claims the consumption.
- **PotentialAutomorphyInfrastructurePartII.** It cites PotentialAutomorphyInfrastructure §2.5 for prescribed local behaviour in its own routes (e.g. §§0.5, 5.5). This is the same pattern as 2a/F02, but it is in that roadmap, not here.
- **Source issue (nt26 Lemma 3.4 and Proposition 3.9).** nt26 makes only `r̄_{π,ι}` trivial above `p` and `v_0`, and applies a finiteness theorem stated for a trivial residual representation to `s̄`, which is only scalar there. The README now records the added triviality of `ȳ` at the claim.
- **Ownership.** No new object or target was introduced. Every addition is a definition of notation already used (§5.1), a proof step, or a citation of an existing supplier section (PotentialModularityAndCompatibleSystems §2.16, ArithmeticGaloisRepresentations §§7.6, 7.9, 7.10, PadicHodgeTheory §4.4, PotentialAutomorphyInfrastructurePartII §5.4). All of them were checked at those roadmaps' heads, and all are earlier in the merge order or already consumed. No name that other roadmaps cite was changed: section numbers and slugs are kept.
- **Suspicious text.** None found in the reviews or the fetched texts.
