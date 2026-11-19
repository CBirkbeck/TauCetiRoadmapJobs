# Review of InertAnticyclotomicCMMainConjecture (pull request #2435 at 069a185)

**Verdict:** accepted

**Summary.** Accepted: the folder is unchanged since the last review, and the title and description as they now stand, read sentence by sentence against this head, say nothing about the mathematics, the suppliers, the consumers or the Lean file that the head contradicts; the one sentence the last review corrected is repaired. There is no small correction and there are two format notes carried over, none blocking. Two items remain for the human reviewers: Brumer's paper is cited by locator only, and the cached copy of the most-cited article carries a publisher-archive download footer.

## N01 — The overview says the roadmap is "following" two papers

The third sentence of the README's Summary still ends "following Burungale, Kobayashi and Ota (BKO21) and Agboola and Howard (AHII05)", and the description's summary has "It follows Burungale–Kobayashi–Ota". The layers are not arranged as either paper is, so the phrase undersells the text; "the results are those of …" would say what is meant without presenting a source as the plan.

## N02 — The route of §3.4 is one paragraph of about 1,400 words

It carries six separate arguments (torsion of X_str, the rank of S_rel, the strict–relaxed sequence, the two-variable ranks, the specialisation along γ⁺−1, torsion-freeness of S_rel). Paragraph breaks at those points would let an implementer find the step a later section cites; nothing in the content needs to change.

## Previous findings

- The previous report had no finding (no R-numbered remark); its three other remarks are accounted for here.
- C01 (previous) — repaired: the description's summary now reads "ModularIwasawaMainConjecturesPartII defers the inert main conjecture and rank bounds here; CMRankZeroConverse distinguishes that conjecture from the cyclotomic CM equality", as both roadmaps do at their open heads.
- N01 (previous) — not repaired: README Summary, "following Burungale, Kobayashi and Ota (BKO21) and Agboola and Howard (AHII05)"; written again as N01.
- N02 (previous) — not repaired: the route of §3.4 is still one paragraph; written again as N02.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result |
|---|---|---|---|
| Description: consumers sentence (ModularIwasawaMainConjecturesPartII defers; CMRankZeroConverse distinguishes) | the two READMEs at their open heads | Part II: one mention, in its scope list, naming this roadmap for BKO Theorems 6.1–6.2; CMRankZeroConverse: one mention, "supply different main-conjecture statements" | agree; also agrees with README Downstream consumers (line 763) |
| Description: rank bound "plus one in the opposite parity" (§6.4) | χ trivial (c=0), order p (c=2), order p² (c=3); ε=±1 | ε=+: ord, ord, ord+1; ε=−: ord+1, ord+1, ord. Root number (−1)^c·ε is +1 exactly on Ξ^ε, −1 where the bound is ord+1≥1 | agrees with README Summary and §6.4; parity consistent |
| Description: opposite-sign dual torsion with characteristic ideal (L_p), integral (§4.6) | ξ=π·v_ε, R/O of ramification index e | L_p=π, (L_p)=(ϖ_R)^e, μ=e; after inverting p the ideal is the unit ideal, μ=0 | agrees with README Summary and Conventions |
| Description: "four missing inputs are requested from suppliers", listed as three bullets | requests in the README's supplier contracts (lines 815, 851, 857, 859) | 4: Wiles reciprocity (AnticyclotomicLocalUnits §4.3); restriction of scalars and character-prime multiplicity (PadicMeasuresIwasawaAlgebras §4.6); Leopoldt (IntegralIwasawaTheory §4.4) | agree |
| Description: norm relations and Rubin's theorem from ModularIwasawaMainConjecturesPartII §2.2, §§4.7, 4.8(ii) | headings at that roadmap's open head | §2.2 "Elliptic units of every modulus", §4.7 "Rubin's Iwasawa modules", §4.8 "Rubin's main conjecture and its all-prime classical form" | present; README §3.5 Needs line cites the same |
| Description: Billot's identity "stated and proved in §4.3, for … E over H(E[p])", via §3.2 | README §3.2 and §4.3 | §3.2: M=H or K₀=H(E[p]), #G = h_K or h_K(p²−1), prime to p for p∤h_K (p=5: 24·h_K); §4.3 follows Billot's proof over K₀ | agree |
| Description: `Suggested.lean` states no declaration; headlines §§4.2, 4.4, 4.6, 6.4 named | the file at this head | empty namespace; docstring has four bullets (§4.6, §4.2, §4.4, §6.4), each naming the missing carriers | agree |
| Description: the folder is added (README, `Suggested.lean`, `metadata.toml`) | diff against the base | 3 files, 923 insertions, 0 deletions; nothing changed outside the folder | agree |

The rows of the previous reviews for the statements of the folder stand as in the previous review, of `069a185`: no statement changed.

- Changed lines in the folder since `069a185`: 0; files changed outside the folder: none.
- Source locators checked against the text this round: 0 (no passage changed; the seeded sample falls in no changed passage).
- Library declarations opened at the pins: 4, the ones the description names: `TauCeti.ContCohomology.SelmerStructure` (TauCeti/RepresentationTheory/Homological/ContCohomology/SelmerStructure.lean line 69), `WeierstrassCurve.kummerSelmerMap` and its injectivity (TauCeti/AlgebraicGeometry/EllipticCurve/GaloisCohomology/Selmer/Basic.lean lines 223, 238), `TauCeti.Iwasawa.charIdeal` (TauCeti/RingTheory/Iwasawa/Char/Ideal.lean line 85).
- Cross-roadmap citations resolved again: ModularIwasawaMainConjecturesPartII §§2.2, 4.7, 4.8 and CMRankZeroConverse's scope paragraph at their open heads; PadicMeasuresIwasawaAlgebras and IntegralIwasawaTheory are on main. No cited id is dropped by an open pull request and no other open pull request changes this roadmap.
- Declared supplier gaps: four, unchanged, each stated once in the supplier contracts with a named supplier; the acceptance is conditional on them.
- Supplier order: `depcheck: 198 roadmaps, 2172 edges, 0 problem(s)`; no upward or cyclic edge.
- Elaboration: `Suggested.lean` elaborates with no message; it declares nothing, so there is nothing to probe for padding and no signature to compare; no `set_option`, no sorry'd data. Automatic checks: all passed.
- Overlap check: read ModularIwasawaMainConjecturesPartII, CMRankZeroConverse (scope paragraphs, this round) and, as in the previous reviews, AnticyclotomicLocalUnits, NonordinaryCMSpecialValues, ModularIwasawaMainConjectures, EulerSystemsAndKolyvaginSystems, SelmerIwasawaCohomology; nothing shared.

Source independence: changed passages only: 0 passages compared (the folder is unchanged and no layer was added, removed or reordered); as in the previous review, largest share BKO21, 33 of 96 locators; contents compared with BKO21 and AHII05: independent.

Research link: The headline targets are Theorems 6.1 and 6.2 of Burungale–Kobayashi–Ota (2021), built on Agboola–Howard (2005), Rubin's two-variable main conjecture (1991) and Billot (1986); the README's References and the texts read support this. BKO21 line 909 announces the equality case in later work.

## Not verifiable

- BRU67 (Brumer 1967, pp.121–124): recorded as waived and not read.
- The description's account of how the package was produced (the number of review and red-team rounds) cannot be checked from the pull request.
- The items of the previous reviews stand: BIL86 Proposition 3.17 to Theorem 3.22 (formulas missing from the extraction), RUB91 §1 pp.28–29, and the reciprocity laws behind the suppliers' statements.

## Source issues

- **Error** in BKO21 at Theorem 6.1 with §6.0.1, pp.961–962: the source says the characteristic ideal is taken over the algebra with coefficients O and puts the elliptic unit in the O-module of local units, while the Selmer module has coefficients R; it should be over the Iwasawa algebra with coefficients R, with the unit extended to R; affects a stated result.
- **Misprint** in AHII05 at the proof of Proposition 5.3, p.620: the source says the product of the plus and minus elements is γ to the power p^k, minus one; it should be γ to the power p^n, minus one; affects nothing.
- **Misprint** in AHII05 at the proof of Theorem 4.1, p.616: the source says the complex-conjugation symmetry is Lemma 2.1.2 of its first reference; it should be Lemma 1.2.1 of AHI06, p.1010; affects nothing.
- **Misprint** in BIL86 at the introduction, p.342: the source says the pseudo-isomorphism and the equality of characteristic series are Theorems 3.24 and 3.25; it should be Theorems 3.23 and 3.24 (3.25 is a lemma); affects nothing.

## For the human reviewers

- Licence: the cached text of BKO21, recorded as an institutional-repository copy, carries a publisher-archive download footer on every page (BKO21 lines 242–244); whether that copy is the repository's open deposit is for a human to confirm.
- Not tested: BRU67 is cited by locator only (waived); the Ax–Brumer input of §4.3 is requested from IntegralIwasawaTheory §4.4 and was not checked against Brumer's text.
