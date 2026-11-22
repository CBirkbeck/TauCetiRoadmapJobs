# Review of SelmerLengthBoundsAndLocalLifting (pull request #2901 at 6c8cd88)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/SelmerLengthBoundsAndLocalLifting/`
**Verdict:** accepted

**Summary.** Accepted: no finding. The folder has not changed since the previous review of this head, so this round read the pull request's title and description against the head: every sentence about the mathematics, the suppliers, the libraries and `Suggested.lean` agrees with the files. There is one small correction (the description's prose and its two generated blocks name different pull requests for the supplier WachLatticesOverTheCyclotomicTower), one question about #2954, and two format notes carried over; none blocks. The questions for the human reviewers are unchanged.

## C01 — The description gives two different routes by which WachLatticesOverTheCyclotomicTower reaches main

The prose says of that supplier "a sub-roadmap of this family listed above this one in the family index, which #2954 carries; it merges there with this folder", and that "this pull request does not merge on its own". The two blocks that close the description say the opposite: "#2899 WachLatticesOverTheCyclotomicTower" under suppliers that "merge first", and the chain "#2899 (WachLatticesOverTheCyclotomicTower) → **this pull request** (#2901)". A reader cannot tell which pull request to wait for.

What the heads show: #2899 is open (a draft) and carries `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/WachLatticesOverTheCyclotomicTower/`, with §6.4 and §6.10 (and `e_W`, `e_U` of §6.10 (2) and (4)) as this README cites them. The text that would be right, if the family merges through #2954: one sentence in the prose saying that #2899, like this pull request, is where its folder is reviewed and does not merge on its own, so that the two blocks are read as the review order and not the merge order.

## N01 — Some declarations of the formal proof are still cited by name only, without the file

Carried from the previous two reviews: about fifteen declarations (for example `GlobalTheory.T.wachModule_uniqueness_characterisation` in 4.10e (0), line 1567, which the description also quotes) have no path, while the others give it.

## N02 — Two commits are named for the same source

Carried: the References entry (line 1959) and the description give commit `8c90877ceaa694974526e0aab9aaaf6ea0f5099e`; the family index (its line 13 and the sentence after it) says the files "are to be looked up at that first commit", `40e56bab`. The previous review found the named files identical at the two commits; naming one commit in all three places would spare a reader the comparison.

## Questions for the author

- The description says that #2954 "carries this folder as this pull request has it (at this head the folder, and the entry of the index for this roadmap, are the same in both)". Is that still so at `6c8cd88`? The previous review found #2954 without two additions to 4.10e (3). I could not check: #2954 is not among the 485 open roadmap pull requests whose heads I could read (list of 22 November 2026, 15:43 UTC), and no local copy of its head exists.

## Previous findings

The previous review, of this same head `6c8cd88`, had no finding (no R-numbered remark). Its other remarks:

- C01 (the dependency sentence out of date) — repaired: the description now reads "Every roadmap it cites as a supplier is on main except WachLatticesOverTheCyclotomicTower"; all fifteen others are on main, PadicHodgeRegulators included.
- C02 (no order stated between this pull request and #2954) — repaired in the text: "The folder therefore merges with the family through #2954, and this pull request does not merge on its own." Whether #2954 has this head's folder is the question above; the generated blocks still name #2899 (C01).
- N01, N02 — not repaired: written again above.

## Verified sound

| Statement | Instances tried | Values computed (README / description or supplier) | Result | Change |
|---|---|---|---|---|
| 4.10f, exponent (quoted in the description) | `N = 2`, `Σ = {1, χ}`, `χ` quadratic, `η = 1`, `η′ = 2`; `N = 3`, `Σ = {1, χ, χ^p}`, `η = 1` | README line 1739 and description both `k = 40(N·r′ + η(N + r′))`. First: `40(η′N² + N³) = 640 < p`, `r′ = 1`, `4r′ = 4 = N²`, `k = 200`. Second: `r′ = 2`, `8 ≤ 9`, `k = 440` | holds; texts agree | none |
| Balanced condition (description, paragraph 2) with 4.9b | `F` imaginary quadratic, `p` split, `r = 1`: `V = E(1)`; `V = E`; weights `−1` at `τ`, `0` at `τc` | left `Σ dim D_dR/Fil⁰`: `2`; `0`; `1`. Right `Σ_{v|∞} rank H⁰ = 1`. Balanced only in the third; CM criterion `r[F:ℚ]/2 = 1` agrees | holds; description states the README's definition | none |
| 4.9a, sources named in the description | AnabelianGeometryAndNonabelianChabauty §4.6 on main, line 6677; PadicHodgeRegulators §1.5, line 161; PadicHodgeTheory §3.1, line 556 | §4.6 has `H¹_e ⊆ H¹_f ⊆ H¹_g` and the extension criterion for `ℚ_p`-coefficients, extension of `ℚ_p` by `V`; §1.5: `dim H¹_f = dim D_dR/Fil⁰ + dim H⁰`; README 4.9b uses the same | supplier supports the citation | none |

The rows for the untouched statements stand as in the previous review, of `6c8cd88`.

- Source locators checked against the text: none new (0 changed lines); the two declarations of the formal proof the description quotes are in the README at lines 1567 and 1731 with the same names, the commit at line 1959.
- Library declarations opened at the pin: `TauCeti.fittingIdeal` (`TauCeti/RingTheory/FittingIdeal/Basic.lean:334`), `TauCeti.fittingIdeal_eq_minorsIdeal_ker` (same file, line 340), `TauCeti.ContCohomology.SelmerStructure` (`TauCeti/RepresentationTheory/Homological/ContCohomology/SelmerStructure.lean:69`); Mathlib has no `fittingIdeal`, as the description and line 536 say.
- Cross-roadmap citations resolved: the three sections of the table on main; all fifteen suppliers on main found there (Chebotarev and ArithmeticDirichletSeries under `Completed/`); WachLatticesOverTheCyclotomicTower §§6.4, 6.10 at the head of #2899.
- Dependency check: `depcheck: 133 roadmaps, 1482 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Automatic checks: all passed on this head. Elaboration of `Suggested.lean`: no output, exit code 0; it declares nothing (one docstring and an empty namespace), so there is no signature to compare and no one-tactic probe to run, as the description says.
- The description against the change: it adds the folder (2043 lines, 46 headings, no Lean declaration) and the family index (three files); nothing is changed outside these. Title correct.
- Headlines: the four of the README (lengths of twisted Selmer groups, twist selection, invariants modulo a lattice, lifting with loss) are each named in the module docstring with the carrier it lacks.

Overlap check: no scope was read again this round (the folder is unchanged); the previous review of this head read WachLatticesOverTheCyclotomicTower, CongruenceModulesOfThetaLifts, LengthBoundsInPadicFamilies, GluedTargetAndDivisionInequality, LocalGainOfThetaChains, PadicHodgeTheory, EulerSystemsAndKolyvaginSystems and PhiGammaModulesAndIwasawaCohomology; nothing shared. No other open pull request among those read changes this folder.

Source independence: changed passages only; the folder has 0 changed lines, so no passage was compared; largest share [FormalProof], 81 of 85 locators (previous review); no layer added, removed or reordered, so the arrangement was not compared again.

Research link: Layer 4 gives explicit lifting exponents for Bloch–Kato finite classes (Bloch–Kato 1990) through Wach lattices (Wach 1996, Berger 2004), the Herr complex (Herr 1998) and prismatic `F`-crystals (Bhatt–Scholze, arXiv:2106.14735); Layers 3 and 4 are steps of Alpöge's formal proof (2026). Rests on the README and on [FormalProof].

## Not verifiable

- The head of #2954 and the description's sentence that it carries this folder unchanged: not among the open pull requests whose files were available.
- Bloch–Kato §3 and Corollary 3.8.4, and BS23-FCRYS Theorem 1.2: not opened this round (untouched).
- The seeded sample of sections was not read again against [FormalProof]: no line of those sections changed since the review that read them.

## Source issues

- none

## For the human reviewers

- Scope: 81 of the 85 source locators point to [FormalProof], a Lean formalisation announced on 20 November 2026; no written proof or refereed source states the theorems of Layer 3 or the lifting theorems of 4.10c–4.10g.
- Scope: some cited declarations take published theorems as hypotheses: `GlobalTheory.TheoremTClosing.main` (4.10f), and `GlobalTheory.T.localLifting_of_blochKato_tateDuality_eulerChar` (4.10e (3)), which assumes `BlochKatoLocal`, `LocalTateDualityK` and `LocalEulerCharK`.
- Licence: the family index states that the formal proof "was published without a license" and is mirrored for verification only; the README cites file paths and declaration names, and `Suggested.lean` declares nothing.
- The family index and the description say "The family follows the formal Lean proof"; this folder's own layers are organised by subject.
- The family index has a section "When a roadmap is wrong" (index lines 45–75) that tells reviewers of implementing pull requests what not to block; whether a roadmap index may set review policy is yours to decide.
