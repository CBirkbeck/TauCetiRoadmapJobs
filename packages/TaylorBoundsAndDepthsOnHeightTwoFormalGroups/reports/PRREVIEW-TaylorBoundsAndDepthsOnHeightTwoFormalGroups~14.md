# Review of TaylorBoundsAndDepthsOnHeightTwoFormalGroups (pull request #3027 at f0da4ff)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/TaylorBoundsAndDepthsOnHeightTwoFormalGroups/`
**Verdict:** accepted

**Summary.** An incremental re-review of the 18 lines changed since `3f8c596`; the verdict is accepted, with no findings. The change credits the case of 4.5 without cocycle in one variable to Katz (1977, 1981) and to Bannai and Kobayashi (2016): Katz (1977), section V, Corollary 2 and Bannai–Kobayashi, Proposition 3.5 were read at their locators and support the README's sentences, and the published bounds are indeed sharper than the specialisation of 4.5. There is one small correction (what Proposition 5.3 of Bannai–Kobayashi states) and two format notes carried over, none blocking. Katz (1981) could not be read, and the scope and licence facts about the unrefereed main source remain for the human reviewers.

## C01 — Proposition 5.3 of Bannai–Kobayashi bounds the moments over the units only; the bound "for every integral series" is Proposition 3.5

In the Origin label of 4.5 (line 346) and in the References (line 1502) the loss of `1` "for every integral series" is cited to "Propositions 3.5 and 5.3". Proposition 5.3(i) (BannaiKobayashi2016 line 1125) bounds `∫ xⁿ dμ_φ` over `𝒪_K^×` by `p`, which is the statement for the part of the series with vanishing sum over the torsion translates; a reader who opens it does not find the statement for all of `𝒪_K`, which is only in its proof (the bound on each class `a + π𝒪_K`, lines 1130–1147). Proposition 3.5 (line 457) gives it directly: `|∂ⁿ exp_G^k(0)| ≤ |ϖⁿ|·max_{k≤m≤n}|m!/ϖ^m|`, and for `e = 1`, `q = p²` the maximum is `p` (`v_p(m!/ϖ^m) = m/(p² − 1) − s_p(m)/(p − 1) ≥ −1`, with equality at `m = p² − 1`). "Proposition 3.5 (and the proof of Proposition 5.3)" would point the reader to the right place.

## N01 — The paragraph "Corollaries of general theorems" (lines 47–54) explains a `*Corollary of:*` label that no section of this roadmap carries

A clause saying that no section here carries it would save the reader a search.

## N02 — The `*Sources:*` lines name results, not works

"(Legendre)" in 4.1, "(LP duality, complementary slackness)" in 4.6, "(Wick's theorem)" in 4.8a, and the like in 4.4, 4.19a, 4.19b, 4.19e: a label such as "Classical ingredients:" or the cited text with a locator would match the content.

## Questions for the author

- Does Main Theorem 3.11 of Katz (1981) state the divisibility `ord(Dⁿf(0)) ≥ ⌊np/(p² − 1)⌋` for every integral series with vanishing sum over the `p`-torsion translates on the Lubin–Tate groups of height two, as the Origin label of 4.5 says, or only for the series of the Weierstrass function? Bannai–Kobayashi (their Theorem 5.1 and introduction) describe the result they attribute to that theorem as the integrality and congruences of the Bernoulli–Hurwitz numbers, and cite it once as "Theorem 3.1"; I found no legal copy of Katz (1981).
- (Carried over.) Does Bosch–Güntzer–Remmert §5.1, cited in the Origin label of 4.1, treat polyradii other than 1? I could not open a legal copy of the book.

## Previous findings

- none: the previous review (at `3f8c596`) had no findings and no small corrections. Its other remarks at this head:
- N01, N02 — not repaired: unchanged text; written again above as format notes.

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result |
|---|---|---|---|
| 4.5 Origin: Katz (1977), section V, Corollary 2 | Katz1977 lines 237–263; `n = p² − 1` | source: `G` one-parameter of height two over absolutely unramified `K`, `Σ_{ξ ∈ Ker[p]} f(X + ξ) = 0`, `c(n) = Dⁿf(0)`, `ord c(n) ≥ [np/(p² − 1)]`; `n = p² − 1`: bound `p` | as the README says; hypotheses agree |
| 4.5 Origin: "announced there … without proof" | Katz1977 lines 180–215, 252–263 | the main theorem of section IV is stated with remarks on what its proof uses, no proof; Corollary 2 is deduced from it and Lemma 1 (`ord a₁(t) = p/(p² − 1)`) | holds |
| 4.5 Origin: Bannai–Kobayashi, loss `1` for every integral series | BannaiKobayashi2016 lines 273, 329–334, 457, 1121–1147; `p = 3`, `m = 8` | `v(ϖ) = 1/(p−1) − 1/(e(q−1))`; `e = 1`, `q = p²`: `p/(p² − 1) = γ_LT`. `v(m!/ϖ^m) = m/(p²−1) − s_p(m)/(p−1)`; `p = 3`, `m = 8`: `1 − 2 = −1`, the minimum. So `v(∂ⁿφ(0)) ≥ nγ_LT − 1` | holds by Prop. 3.5; see C01 for 5.3 |
| 4.5 specialised to `β = 0`, `σ = 0`, `n′ = 2`, one index | (B1)–(B4) for `β = 0`; `U = T`, `n = p²`, `p = 3` | `β = 0`: (B3) vacuous, (B4) `exp(0) = 1`; bi-power condition vacuous; `λ₀(T) = Σ_e T^{p^{2e}}/p^e`; bound `nγ_LT − (log_p n + 1)`. `g(z) = z − z^{p²}/p + ⋯`: `v(9!·(−1/3)) = 4 − 1 = 3`; 4.5 gives `≥ 27/8 − 3 = 3/8`, Bannai–Kobayashi `≥ 27/8 − 1 = 19/8` | the specialisation is the cited case, and the published bounds are sharper |
| Summary (line 5) and layer introduction (line 62) | against the two rows above | loss of one power of `p` for all integral series; `⌊nγ_LT⌋` for trace-zero series over an unramified base, where valuations of `Dⁿf(0)` are integers, so no loss | consistent with 4.5 Origin |
| References, lines 1501–1502 | Katz1977 title page (lines 5–8, 21–22); BannaiKobayashi2016 lines 5–7 | Astérisque 41–42 (1977), 55–65, title "Formal groups and p-adic interpolation"; arXiv 0804.4338v3 = Ann. Inst. Fourier 66 (2016) | bibliographic data agree |
| Family index, step 4 and description | index README and description sentence on the bound "without the cocycle" | both say: Katz announced (1977) and proved (1981) `⌊np/(p²−1)⌋` for trace-zero series; Bannai–Kobayashi `np/(p²−1) − 1` for every integral series | agree with 4.5 |

The rows for the statements the change does not touch stand as in the previous review, of `3f8c596`.

- Source locators checked against the text: 3 (Katz1977 section V, Corollary 2; BannaiKobayashi2016 Propositions 3.5 and 5.3); 1 not readable (Katz 1981, Main Theorem 3.11).
- Library declarations opened: none; the change touches no Lean statement and names no library declaration.
- Cross-roadmap citations: the change adds none. The family index's step 4 and its table row for this roadmap agree with the head.
- Seeded sample: of its targets the change touches 4.5 only (its Origin label); it is in the table. The others are unchanged since `3f8c596`.
- README on `main` against the head: no layer, section or statement removed or renumbered (0 headings removed, 1 added, 0 Lean declarations changed); the change since `3f8c596` adds text only.
- Description against the head: its sentence crediting "the bound on a formal group of height two without the cocycle to Katz and to Bannai and Kobayashi" states this change; nothing else in it is affected.
- Automatic checks: all passed for this folder. Dependency check: `depcheck: 6 roadmaps, 64 edges, 0 problem(s)`. `lake env lean` on `Suggested.lean`: three `declaration uses 'sorry'` warnings, nothing else; the file is unchanged, so binders and the one-tactic probe stand as checked before.

Overlap check: read HodgeTateLatticesAndLubinTateLogarithms, LocalGainOfThetaChains, ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties (the open-roadmap and results-and-headings lists are empty); shared: the letter logarithms, Dwork's lemma, quasi-logarithms and the colength bound, owned by HodgeTateLatticesAndLubinTateLogarithms and cited here; the Gauss norm of restricted series, owned by RestrictedPowerSeries and cited here; 4.1–4.19f owned here and consumed by the other two; no open pull request changes this roadmap. The change adds no object.

Source independence: changed passages only; 5 passages compared (the summary sentence, the clause of the layer introduction, the Origin label of 4.5, the two new reference entries) with 2 sources (Katz1977, BannaiKobayashi2016), none shared; Katz (1981) could not be read; largest share [FormalProof], all formal-proof locator lines, as before; contents not compared: no layer added, removed or reordered.

Research link: The headline bounds (4.5, 4.6, 4.19f) are steps of the announced proof of GRH for Dirichlet L-functions (Alpöge, 2026: [Announcement], [FormalProof]), used by LocalGainOfThetaChains; 4.5 without cocycle is in Katz (1977, 1981) and Bannai–Kobayashi (2016); they build on Lubin–Tate (1965), Mumford (1969), Mazur–Messing (1974). Rests on the README and the two sources read.

## Not verifiable

- Katz, *Divisibilities, congruences, and Cartier duality* (1981), Main Theorem 3.11 (Origin label of 4.5, References): no legal copy found (the sources service by citation; a URL on the author's departmental page was refused as not naming the author). Bannai–Kobayashi cite "[Ka2, Theorem 3.11]" twice for the congruences, and "Theorem 3.1" once.
- Bannai–Kobayashi was read as arXiv v3 (27 March 2015); that its Propositions 3.5 and 5.3 carry the same numbers in the printed Ann. Inst. Fourier version was not checked.
- Isserlis (1918), Wick (1950), Bosch–Güntzer–Remmert (1984) §5.1, Mumford (1969), Hazewinkel (1978), Katz (*Crystalline cohomology…*, 1981), Mazur–Messing (1974): as in the previous review, no open copy; untouched by the change.

Automatic checks set aside as false positives: the citation resolver lists `Formalism.L2.FormalSeriesBounds.RawChart.AxesSt` (4.19e) as found nowhere; it is a declaration of the formal proof, and the resolver does not search that repository. The rule that a pull request changes nothing beyond its own roadmap folders, which keeps a review from passing edits nobody read, reports the other roadmap folders of this pull request when it is run by hand without being told of them; they are the pull request's own, each with its own review, and nothing outside `TauCetiRoadmap/` is changed.

## Source issues

- **Misprint** in BannaiKobayashi2016 at References, entry [Ka1], page 26 of arXiv v3: the source says the title of Katz's Astérisque 41–42 (1977) paper is "Formal groups and p-adic integration"; it should be "Formal groups and p-adic interpolation", as on the paper's title page; affects nothing.

## For the human reviewers

- Scope: every formal-proof locator of the README points into [FormalProof], an unrefereed Lean proof announced on 2026-11-20 ([Announcement]); the classical inputs (Lubin–Tate, Mumford, Mazur–Messing, Cartier, Isserlis, Wick) are cited without locators.
- Licence: [FormalProof] was read from a local copy of the public repository; the README does not record that repository's licence. The roadmap reuses file paths and declaration names only.
- Not tested: Bosch–Güntzer–Remmert, Mumford (1969), Hazewinkel (1978) and now Katz (1981, *Divisibilities…*) could not be read, so the labels citing them were not checked against their text.
- Neither recorded decision bears on this folder: it removes no section and moves nothing to another roadmap.
