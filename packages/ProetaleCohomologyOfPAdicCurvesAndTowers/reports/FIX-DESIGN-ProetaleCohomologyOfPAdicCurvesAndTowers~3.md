# FIX-DESIGN-ProetaleCohomologyOfPAdicCurvesAndTowers~3

Files edited: `packages/ProetaleCohomologyOfPAdicCurvesAndTowers/design/README.md`, `design/plan.json`, `sources.toml`.

## F01 (P2) — applied

Verified: CDN23 line 328 defines supercuspidal as "`WD(M)` irreducible and of slope 1/2"; CDN20 line 182 omits the slope, but CDN20 §2.1 (lines 644, 654, 702) and footnote 10 (line 664) assume it. Old Layer 7 preamble: "supercuspidal when `WD(M)` is irreducible; then `N = 0` and a single slope". New: "irreducible and `φ` has slope `1/2` (CDN23 line 328)", with the CDN20 locators. §§7.4–7.5 now repeat the slope hypothesis in their statements and locators. Two negative-control Checks added: the unramified twist `M′`, slope `3/2`, for §7.4, and `X^+_st(M′) = 0` for §7.5. `plan.json` 7.4/7.5: the hypothesis "M of slope 1/2" and two non-example tests added. §7.8 and the Layer 7 Example inherit the definition and need no other change.

## F02 (P3) — applied

Verified at the PrismaticCohomologyPartIII head: §6.3 (line 234) is the generic-fibre statement with `d` inverted; §6.25 (line 621) is the integral one, and its worked example (line 836) is the `S = O_C` statement. Old: "§6.3" alone. New: "§6.25 with §6.3 (`Δ_{S/A} = A_inf(S)`, tilting)". Changed in the scope line, the supplier contract (now applied to `S = R^+`), the §6.7 route and `*Needs:*`, the Layer 6 Dependencies, and `plan.json` 6.7 prerequisites and `suppliers`.

## F03 (P3) — applied

Verified: CDN-STEIN line 2270 cites [33, Thm 4.5] and [35, Prop. 4.5]. Its bibliography gives [33] as Grosse-Klönne, *Integral structures…*, Represent. Theory 9 (line 3291). GK07 Theorem 4.4 (line 1109) is the reduction computation. I fetched [33] from the AMS open archive as `GK05-RT`, certified. Its Theorem 4.5 is at line 1770, and lines 93–99 apply it to `Ω^s_X`. §6.6 old: "GK07 Proposition 4.5 and Theorem 4.4". New: "after GK05-RT Theorem 4.5 … and GK07 Proposition 4.5". Also updated: the `plan.json` 6.6 locator, the GK07 manifest locator (Theorem 4.4 dropped), and References.

## F04 (P3) — applied

- §6.3: "`φ^f = q²` on `H²_rig(ℙ¹_k)`" → "`H²_rig(M/S₀) = H²_rig(M♥/S₀) = 0` since `M♥` is affine (GK05 line 1257)". GK05 lines 1256–1257 confirm the passage to `M♥`.
- The gap `period-rings-general-C`: "§§1.2–1.3 and 3.2" → "§§1.2–1.3 and 3.2–3.3". `plan.json` `neededBy` gains "3.3".
- §6.7: added a clause saying why it is semistable (that is how AInfCohomology §AI.6.2 supplies `AΩ`), and that CDN-DUKE Theorem 2.9 (line 370, read: "flat formal model") is more general.

## Checks

Dependency check, verbatim:

    candidate: ProetaleCohomologyOfPAdicCurvesAndTowers is not in the merge order yet; checked as if placed after ModpRepresentationsOfGL2OverLocalFields (the intake inserts it when its design is accepted)
    depcheck: 56 roadmaps, 662 edges, 0 problem(s)

No UPWARD or CYCLE line. Citation resolver: one lead, "PadicLocalLanglandsForGL2QpPartII §4.1". It is false: that roadmap is a board design package, cited only as a consumer. No Lean names were found missing. `plan.json` parses. There is no `Suggested.lean` at the design stage, so there was no elaboration or `#check` comparison.

## Adversarial pass (changed statements)

| Statement | Instances | Values | Result | Change |
| --- | --- | --- | --- | --- |
| Preamble: irreducibility forces `N = 0` | 2-dim WD rep with `N ≠ 0` | `ker N` is a `W_F`-stable line (`N` is `W_F`-equivariant up to `|·|`) ⟹ reducible | holds | none |
| §7.4 with slope `1/2` | `M` slope `1/2`; twist `M′`, `φe = pe` | multiplicity `φ`-module slope `1/2` for both; `M̆` slope `1/2`, `M̆′` slope `3/2` | holds for `M`; `M′` excluded | hypothesis + Check |
| §7.5 first row | `M′` slope `3/2` | `φ(x) = py`, `p³φ(y) = px` ⟹ `φ²y = p^{−1}y` ⟹ `X^+_st(M′) = 0`; `H¹_ét[M′] = H¹_ét[M] ≠ 0` | false without slope `1/2` | hypothesis + Check |
| §7.5 at slope `1/2` | `L/ℚ_p` finite | `Dim X^+_st(M) = ([L:ℚ_p], 2)` (CDN20 lines 706–707) | holds | none |
| §7.8(e) under new definition | `n = 1`, depth-zero `θ ≠ θ^q`, `θ̃(ϖ) = 1` | `ω(ϖ) = 1` ⟹ slope `1/2` (CDN20 line 142: `2sf − f = 0`) | unchanged | none |
| §6.7 integral input | `S = R^+`; `S = O_C` | §6.25: `H⁰ = ℤ/p^n` (connected), `H¹ = coker(F − 1)`, killed pro-étale locally; `O_C`: `F − 1` onto `W_n(O_C^♭)` | holds | citation |
| §6.3 at `d = 1` | `s = 0, 1, 2` on `ℙ¹_k` log at `q + 1` points; double point | `φ^f = 1`; `q`-dim `H¹`, `φ^f = q`; `H² = 0` (affine `M♥`); point: `H⁰` only | holds; `s = 2` is vacuous | wording |
| §6.6 vanishing | `j = 0, 1`, `d = 1` | GK05-RT Thm 4.5 (i)–(iii) for strongly dominant `Ω^s_X`; `H¹(X, O) = 0`, `H⁰(X, Ω¹) = Sp^cont_1(O_K)^*` | holds | locator |
| Gap `period-rings-general-C` for §3.3 | `A_cris`, `F¹A_cris` in §3.3 | §3.3's `*Needs:*` already names the gap | consistent now | `neededBy` |

## For the maintainer

- No Lean name or section number of this roadmap changed. The new manifest key is `GK05-RT`, certified (publisher-open). The `needs-references.toml` stub written by the first, failed fetch attempt was deleted after the open copy was fetched; no references are outstanding.
- Source issue (supports the review's note): CDN20 Théorème 0.4 and Théorème 0.8 are printed without the slope-`1/2` hypothesis that CDN20 §2.1 and CDN23 line 328 carry. The README cites them with that hypothesis.
- PrismaticCohomologyPartIII §6.25 is now consumed alongside §6.3. That roadmap is earlier in the merge order.
- Ownership against open pull requests outside the sibling checkouts was not checked. No new object is owned here.
