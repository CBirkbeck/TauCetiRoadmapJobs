# Review of ScatteringDiagrams (pull request #2650 at 77c1a41)

**Verdict:** accepted

**Summary.** Accepted: the 48 changed lines repair all four small corrections of the previous review, and the one new mathematical statement, Dynkin's form of the truncated BCH element in §0.4, is true as written (I recomputed it against `log(exp X exp Y)` in the free associative algebra through degree 5). The description now agrees with the head. There are no findings and no small corrections; four format notes remain, three of them carried over unchanged, none blocking. Two facts are left for the human reviewers, as before.

## N01 — The new API fact "Dynkin's form" in §0.4 carries no source locator

Lines 304–307 and the route at lines 337–340 name Dynkin's formula and the Dynkin–Specht–Wever lemma without a reference, while every other fact of §0.4 has one. A locator into a standard text on free Lie algebras, at the statement of each, would let an implementer check the normalisation (right-nested brackets, division by the total degree) without recomputing it.

## N02 — §6.3 names the overlap maps `h_II` and `h_III` after the charts II and III of GS Figure 2.1, which the README never introduces

Lines 2168–2176, unchanged. A clause saying that `h_II` is the identity transition on the lower overlap and `h_III` the transition on the upper one would read without GS at hand.

## N03 — The reference entry for KS names §2.1, but the only KS locator in the text is Proposition 3.3.2

Unchanged; the entry would list §3.3.

## N04 — §0.4 says the symmetrization is Tau Ceti's degreewise map on each symmetric power, which at the pin exists only for `R : Type`

Line 291, unchanged. A clause "for `R` in `Type`; in general by the same formula" would keep it exact against `exists_pbwSymmetrizationEquiv`, which is stated for `R : Type*`.

## Previous findings

The previous review, of `de3257f`, had no findings (no R-numbered point). Its small corrections and format notes at this head:

- C01 — repaired: the nine sections now open "Sources: …" (§2.3 line 1030, §5.1, §5.3, §5.5, §5.6, §6.3, §7.1, §7.3, §7.4); no sentence says a section follows a source.
- C02 — repaired: the description now says §0.7 "cites `Comma.initial_snd_of_isConnected_costructuredArrow`, the general form of the instance `Comma.initial_snd` it cited before", and describes the section-level "Sources:" lines.
- C03 — repaired: §3.1 line 1124 cites "MAN (3)–(4)", §4.1 line 1358 cites "(MAN (5))" at the bracket of `z^n∂_m`; both read at MAN lines 163, 170 and 180.
- C04 — repaired: "Adjacent roadmaps" (lines 2712–2720) names the Dynkin series of LieGroups Layer 3, and §0.4 states Dynkin's form of *bchElement c* as an API fact with a route.
- N01, N02, N03 of that review — not repaired (untouched text): written again as N02, N03, N04 above.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| §0.4 Dynkin's form of *bchElement c* | `c=0,1,2`; exact computation in `ℚ⟨X,Y⟩` through degree 5 | `c=0`: empty sum, `0`; `c=1`: `X+Y`; `c=2`: `n=1` gives `X+Y+½[X,Y]`, `n=2` gives `−¼([X,Y]+[Y,X])=0`; Dynkin sum minus `log(exp X exp Y)` is `0` through degree 5 | true | N01 |
| §0.4 formula is well formed | index ranges, denominators | `r_i+s_i≥1` forces `n≤c`, a finite sum; denominator `(Σ(r_i+s_i))·∏r_i!s_i!≥1`, a unit in a `ℚ`-algebra; one-letter word is the letter | true | none |
| §0.4 route: bracketing multiplies degree `d` Lie elements by `d` | degree components `d=1…5` of `log(exp X exp Y)`, right-nested bracketing | bracketing of the degree-`d` component equals `d` times it for `d=1,…,5`; degree 3 has `XXY:1/12`, `XYX:−1/6`, `YXX:1/12` | true | none |
| §0.4 route: `U(𝔣)` free associative | pinned Mathlib | `FreeLieAlgebra.universalEnvelopingEquivFreeAlgebra : UniversalEnvelopingAlgebra R (FreeLieAlgebra R X) ≃ₐ[R] FreeAlgebra R X`, `Mathlib/Algebra/Lie/Free.lean` line 269 | as cited | none |
| Scope: comparison with LieGroups `B(X,Y)` | LieGroups README on main line 459; its open revision line 568 | both define `B(X,Y)` by the degreewise Dynkin series with first terms `X+Y+½[X,Y]+1/12([X,[X,Y]]+[Y,[Y,X]])`; my degree-3 terms agree | true | none |
| §3.1 bracket axiom, locator MAN (3)–(4) | MAN lines 160–170 | (3): `[g_{n1,m1},g_{n2,m2}]⊂g_{n1+n2,μ}`; (4): `μ=⟨n2,m1⟩m2−⟨n1,m2⟩m1`, the README's `m(ρ(n'))m'−m'(ρ(n))m` | supported | none |
| §4.1 bracket, locator MAN (5) | MAN line 180 | `[z^{n1}∂_{m1},z^{n2}∂_{m2}]=z^{n1+n2}∂_μ` in Example 2.1(i) | supported | none |

The rows for the untouched statements stand as in the previous review, of `de3257f`.

- Source locators checked against the text: 2 changed locators (MAN (3)–(4), MAN (5)) read at MAN lines 160–194, fetched from arXiv 1503.06183v5. No sampled section other than through its "Sources:" line was changed; those lines keep the locators the previous review read.
- Library declarations opened at the pin: `FreeLieAlgebra.universalEnvelopingEquivFreeAlgebra` (`Mathlib/Algebra/Lie/Free.lean` lines 266–273); `AddMonoidAlgebra.toMultiplicativeAlgEquiv` (`Mathlib/Algebra/MonoidAlgebra/Basic.lean` line 720) for the description.
- Cross-roadmap citations resolved: RepresentationTheory/LieGroups Layers 0, 3, 5 on main (lines 252, 446, 518; the Dynkin series at 459) and at its open revision (line 568); no open pull request drops an id this roadmap cites.
- Automatic checks: all pass on my rerun. Dependency check output: `depcheck: 197 roadmaps, 2162 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line. Nothing outside the folder changes.
- Elaboration of `Suggested.lean`: `sorry` warnings at lines 66, 75, 93, 109 and 168, nothing else. The diff changes no Lean statement; the README's new backticked name is a Mathlib declaration.
- Description read against the head: 27 example bullets under the eight `### Examples` headings; the nine section-level "Sources:" lines; the heading removed (Completion criteria, now Convention 5) and the four added are all stated; no Lean declaration removed or restated; no supplier roadmap added or dropped. No sentence contradicted.
- Computation: `log(exp X exp Y)`, the Dynkin sum and the right-nested bracketing map were computed with exact rationals on noncommutative polynomials in two letters, truncated at degree 5.

Overlap check: read ClusterAlgebras and AnalyticToricGeometry (the other two lists are empty) and RepresentationTheory/LieGroups; universal BCH element: the algebraic truncations and their Dynkin form are owned here (§0.4), the formal series `B(X,Y)` with its analytic convergence by LieGroups Layer 3, and the scope paragraph now states the comparison; everything else as in the previous review.

Source independence: changed passages only: 5 passages compared with 1 source (MAN) and with the LieGroups roadmap's wording, none shared beyond formulas the mathematics forces; largest share BLM, 20 of 79 locators, as before with one MAN locator added; no layer added, removed or reordered, so the contents comparison stands: independent.

Research link: Layers 2–3 are the reconstruction and consistent-completion theorems of Kontsevich–Soibelman, Bridgeland, Mandel and Gross–Hacking–Keel–Kontsevich (Theorem 1.21); Layer 5 the broken-line theta functions of GHKK and Carl–Pumperla–Siebert; Layer 7 the positivity of GHKK Theorem 1.13 and Burcroff–Lee–Mou 2025. Rests on the README's references and those texts.

## Not verifiable

- No source was opened for Dynkin's formula or the Dynkin–Specht–Wever lemma, since the README cites none; both were verified by computation through degree 5, not in general degree.
- ZIE Chapter 1, SCH §8.3 and PET Hypothesis 8.1 remain as in the previous review (untouched text).
- Ownership against open pull requests was checked by object search over the open heads, not by reading every roadmap.

## Source issues

- **Misprint** in BLM at Remark 5.20, p. 34: the source says the condition is `|a d_{2,k} − b d_{2,k}| = 1`, with the second coordinate twice; it should be `|a d_{2,k} − b d_{1,k}| = 1`, the case `m = 1` of Theorem 5.17; affects nothing.

## For the human reviewers

- The source with the largest share of locators, BLM (20 of 79), is cited as arXiv 2503.03719v1 (2025); Layer 7's polynomial positivity (§§7.1, 7.3–7.5) rests on it. Whether it has been refereed was not established.
- §6.3 restates the construction of GS §2.3 (the rings, the maps `h_II`, `h_III` and the gluing identity) in formulas with the roadmap's own prose; GS is an arXiv preprint (0808.2749v2).
