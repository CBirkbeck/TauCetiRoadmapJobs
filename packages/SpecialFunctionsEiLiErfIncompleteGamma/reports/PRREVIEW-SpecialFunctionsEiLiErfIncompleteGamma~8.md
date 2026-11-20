# Review of SpecialFunctionsEiLiErfIncompleteGamma (pull request #2553 at ec2023f)

**Verdict:** accepted

**Summary.** Accepted on an incremental re-review of the 31 lines changed since 54c9507. The one finding of the previous review is repaired: in 10.3 the limits `Si(a, ∞)` and `Ci(a, ∞)` (DLMF 8.21.12–8.21.13) now carry `Re a < 1`, and the recomputed values agree with the repaired statement on both sides of that line. The equation number for `χ` and the source lists are corrected as well. There is one format note, not blocking. The eleven books whose locators the pull request adds still could not be read here; that, the retained section skeleton and the named prior formalisation are left to the human reviewers.

## N01 — The justification added in 10.3 names only the `Si` half

In 10.3 (line 1286) the new clause reads "by 8.21.8 the difference is `−si(a, x)`", directly after a sentence about both 8.21.12 and 8.21.13. That is the statement for `Si`; for `Ci` the difference is `−ci(a, x)`, by 8.21.9. Would read completely as "by 8.21.8–8.21.9 the differences are `−si(a, x)` and `−ci(a, x)`".

## Previous findings

- R01 — repaired: "8.21.12–8.21.13 as limits along the positive axis, for `Re a < 1` and with the stated exclusions; by 8.21.8 the difference is `−si(a, x)`, of size `x^{Re a − 1}`" (10.3, lines 1285–1287). No new problem beyond N01.
- C01 — repaired: "`χ(n) = π^{1/2} Γ(n/2 + 1)/Γ(n/2 + ½)` (DLMF 9.7.3)" (8.4, line 1109); `χ` is equation 9.7.3 at DLMF-9.7 lines 149–151.
- N01 (previous) — repaired: the Summary now gives Lebedev "Chs. 1–3 and §9.13" and Beals–Wong "§§2.6 and 6.4, Exercises 2.25, 2.27 and 8.7"; the References entry for Temme no longer lists Chapter 3; the doubled space is gone.

## Verified sound

Source ids `DLMF-<n>` are the extractions of `https://dlmf.nist.gov/<n>`. Values were computed in double precision with my own composite Gauss–Legendre quadrature on `[1, x]`, the power series on `[0, 1]` and a Lanczos Gamma.

| Statement | Instances | Values (left; right) | Result | Change |
|---|---|---|---|---|
| 10.3, 8.21.12 (`Si(a, x) → Γ(a) sin(πa/2)`), `Re a < 1` | `a = ½, 0.9, −½, ½+2i`; `x = 1000π, 1000.5π, 1001π` | `a=½`: 1.235473, 1.253311, 1.271146; limit 1.253314. `a=0.9`: 0.6085, 1.0555, 1.5024; limit 1.0555, envelope 0.447. `a=−½`: 2.506623, 2.506628, 2.506634; limit 2.506628. `½+2i`: within 1.78e−2 of `1.230524+0.237922i` | true; error equals `x^{Re a−1}` at the extremes (1.78e−2, 4.47e−1, 5.68e−6) | — |
| 10.3, 8.21.13 (`Ci(a, x) → Γ(a) cos(πa/2)`), `Re a < 1` | same | `a=½`: 1.253311, 1.271151, 1.253317; limit 1.253314. `a=0.9`: 0.167156, 0.614125, 0.167185; limit 0.167170. `a=−½`: −2.506628, −2.506623; limit −2.506628. `½+2i`: within 1.78e−2 of `0.242517−1.229627i` | true | — |
| 10.3, negative controls `Re a ≥ 1` | `a = 1, 3/2`, same `x` | `Si(1,x)`: 0, 1, 2; `Ci(1,x)`: 0, 1, 0. `Si(3/2,x)`: −55.42, 0.636, 56.70 against 0.62666; `Ci(3/2,x)`: −0.618, 55.44, −0.636 | no limit, as the text now says | — |
| 10.3, "of size `x^{Re a − 1}`" | all the above | `|Si − limit|` at `x = 1000π`: 1.78e−2, 4.47e−1, 5.68e−6, 1.00, 56.0; `x^{Re a−1}`: 1.78e−2, 4.47e−1, 5.68e−6, 1.00, 56.0 | true | — |
| 8.4, `χ` locator | DLMF-9.7 lines 105, 149–151 | 9.7.2 is the coefficient formula; 9.7.3 defines `χ(x) = π^{1/2} Γ(x/2+1)/Γ(x/2+½)`; README formula identical | correct | — |

The rows of the previous review for untouched statements stand as in the previous review, of 54c9507.

- Source locators checked against the text: 2 in the changed passages (DLMF 9.7.3 at DLMF-9.7 lines 149–151; DLMF 8.21.8 and 8.21.12–8.21.13 as read in the previous review); both correct. No sampled target falls in a changed passage.
- Source lists against the layers: Lebedev Ch. 1 is cited at lines 504 and 624; Beals–Wong Exercises 2.25, 2.27 and 8.7 at lines 480, 934 and 1664, and no Exercise 2.26 anywhere; no layer cites Temme Chapter 3.
- Library declarations opened at the pin: none needed; the diff changes no Lean name and no library citation.
- Cross-roadmap citations: the diff changes none; none is found missing on main or at the open heads.
- Dependency check: `depcheck: 198 roadmaps, 2173 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Automatic checks: all passed. Nothing changes outside the folder.
- Elaboration of `Suggested.lean` (byte-identical to main): 69 `declaration uses 'sorry'` warnings, no error, no other warning. The diff changes no Lean statement, so no `#check` comparison or one-tactic probe was repeated.
- Pull request text against the head: the description states the `Re a < 1` change in 10.3, that 10.3 has no Lean statement and that `Suggested.lean` is byte-identical; all three hold. Headings: none added or removed. No sentence is contradicted by the head.

Overlap check: read SpecialFunctionsConfluent, SpecialFunctionsParabolicCylinder (open revision and main), SpecialFunctionsHypergeometric, SpecialFunctionsGamma, SpecialFunctionsBessel, SpecialFunctionsAiry; as in the previous review, Dawson's integral and `Hh_n` are owned by SpecialFunctionsParabolicCylinder §5.1 and §5.3 and consumed here; the incomplete Gamma, `E_p`, error functions and Pincherle's theorem are owned here; nothing has two owners. No open pull request changes this roadmap or drops an id it cites, and this one drops none.

Source independence: changed passages only; 3 passages compared with 1 source (the DLMF: the new sentence of 10.3 against §8.21(v), the `χ` clause of 8.4 against §9.7(i), the Summary's source list), none shared beyond the forced formula; largest share DLMF, about 443 of 569 locators in the layers; the diff adds, removes and reorders no layer, so the arrangement was not compared again; the eleven books could not be read.

Research link: the README's own sources place it in the classical theory of Tricomi (1950), Gautschi (1967), Kölbig (1972), Temme (1996), Paris–Kaminski (2001) and MacLeod (2002); its functions are consumed by the Bessel, Airy, hypergeometric and Legendre roadmaps and identified with kernels of QSeriesPartitionsAndMockModularForms and AutomorphicLFunctionsAndLocalFactors. Rests on the README.

## Not verifiable

- Every book locator the pull request adds (Andrews–Askey–Roy, Beals–Wong, Cuyt et al., Duverney, Gautschi 2004, Lebedev, Nikiforov–Uvarov, Olver, Paris–Kaminski, Temme, Wong): no legal copy was readable in the previous review, and none was read in this one; this includes the chapter and exercise numbers the changed Summary and References lines name.
- The Cuyt et al. locator for 6.9.1 in 8.4 (p. 277, against pp. 287–290 in the DLMF's note on 6.9.1): unsettled without the book, as before.

## Source issues

- **Gap** in DLMF-8.21 at 8.21.12–8.21.13 (§8.21(v), online): the source gives the values of `Si(a, ∞)` and `Ci(a, ∞)` with only the pole exclusions; it should also require `Re a < 1`, since `si(a, x) ≍ x^{a−1} cos x`; affects a stated result.

## For the human reviewers

- Not tested: the locators in the eleven books (126 page references) could not be read from any legal source here; the description says an AI model checked them against extracted text of the books.
- Scope of the revision: the pull request keeps every section number; subsections 5.1–5.4, 10.1–10.4, 12.1–12.3, 14.1–14.3 and 15.1–15.5 still run parallel to DLMF §8.11, §8.21, §§7.7–7.9, §§7.17–7.19, §§8.17–8.18. Whether that meets the request is yours.
- Licence: `README.md` (Prior formalization) names the author's `lean-DLMF` (Apache-2.0) as a reference for every layer; `Suggested.lean` was not compared with it.
