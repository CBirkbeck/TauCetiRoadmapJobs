# Review of AutomorphicPadicLFunctionsPartII (pull request #1543 at 6748ded)

**Verdict:** accepted

**Summary.** Accepted: this incremental re-review of the 12 lines changed since 8e0fa4d finds the three small corrections of the previous review repaired (the interpolation theorem and its supporting statements in §§8.3–8.5 and the overview are now restricted to characters whose CM type is the fixed ordinary Σ, the section pointer in §2.1 names its supplier, and the description lists MordellLawrenceVenkatesh), and no repair introduced a new problem. The title and description agree with this head except for one sentence, which is the single small correction; three format notes are carried over, none blocking. The acceptance remains conditional on the ten supplier gaps the README declares, and four points are left for the human reviewers.

## C01 — The description says this roadmap supplies "the first" arithmetic p-adic L-function, which main contradicts

In the summary that opens the description: "none of them constructs an arithmetic p-adic L-function; this roadmap supplies the first." The first half is true of the suppliers (PadicMeasuresIwasawaAlgebras excludes the Kubota–Leopoldt measure from its scope, line 79 of its README). The second half reads as a statement about Tau Ceti, and there it is not so: DirichletPadicLFunctions, on main, identifies its smoothing series with the Kubota–Leopoldt pseudomeasure that IntegralIwasawaTheory §5.0 owns, and ModularSymbolsPadicLFunctions is earlier in the merge order. A reader placing the roadmap is misled about what exists.

The text that would be right: "none of them constructs a p-adic L-function for Hecke characters of a totally imaginary field; this roadmap supplies it."

## N01 — Three slips of wording in *Needs:* lines and one assumption (carried over)

The *Needs:* line of §1.2 lists "P2.3/P2.8; … P2.8" and "§2.23; §2.23 (gap:…)", and that of §8.2 lists `AbstractMeasure.dirac` twice; the assumption of §7.1 (line 1004) reads "contract in the integral multivariate Amice contract is needed".

## N02 — AlgebraicTopology is cited by its former Stage numbering (carried over)

"Stage 5 items 3–4, Stage 6, Stage 8 items 5, 7 and 8" (lines 280, 292, 309, 434, 1287, 1363) resolve through that roadmap's table of former numbering, so the citations are valid; the names on main are Layer 5 §§5.3–5.4, Layer 6 and Layer 8 §§8.5, 8.7 and 8.8.

## N03 — Two locator slips (carried over)

Equations (5.5.9)–(5.5.11) cited in §7.3 (line 1057) are on p.72 of KS-v4, not pp.71–72; "Propositions 5.4–5.6" in §6.1 (line 884) includes Lemma 5.5.

## Previous findings

The previous review (of 8e0fa4d) raised no finding (no R-numbered point). Its small corrections and format notes:

- C01 — repaired: the description now names "MordellLawrenceVenkatesh (#1231)" among the suppliers that merge first, and states the §0.1 and §5.1 targets and the three suppliers on main.
- C02 — repaired: §2.1, line 253, "affine quasi-coherent acyclicity from SchemeAndStackFoundations §2.6".
- C03 — repaired: §8.5, line 1231, "for every critical algebraic χ with CM type Σ_χ=Σ"; the overview says "critical for this Σ"; §8.3 (lines 1164, 1170) and §8.4 (line 1218) carry the same restriction.
- N01 — not repaired: written again as N01.
- N02 — not repaired: written again as N02.
- N03 — not repaired: written again as N03.
- N04 — an offer (Weil's classification is statable in `Suggested.lean`), not taken up; nothing is owed.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result; change |
| --- | --- | --- | --- |
| §8.5 interpolation, restricted to Σ_χ=Σ (also the overview's last theorem) | L=ℚ(i), Σ={σ}: χ=λ⁻⁴; χ=barλ⁻⁴; ψ³ | μ=−4σ: α=4, β=0, ε=(−1)^(0+4+0+1)=−1. μ=−4barσ: Σ_χ={barσ}, α=0 on Σ, excluded. α=3: ε=+1. | Agrees with §0.1 (line 47), the Check of §5.9 (line 864) and KS-v4 lines 3392–3396; none |
| §8.3 well-definedness and all-type formula, restricted to Σ_χ=Σ | same two characters, integrand χ(q_f(t⁻¹,s))·t⁻¹ at d=1 | λ⁻⁴: t^(4−1)s⁰=t³, a=3, β=0, a critical monomial. barλ⁻⁴: t⁻¹s⁻⁴, negative exponents, not one; the restriction is needed. | Consistent with §7.4's index (a,β); none |
| §8.4 desmoothing route, "another type with Σ_χ=Σ" | χ₃=ψ³, χ₄=ψ⁴ of the §8.5 example | ε(1,2,0)=+1, ε(1,3,0)=−1; both have Σ_χ=Σ, so division of the §8.3 formula by δ_c(χ) applies to each. | Consistent with §8.3 as restricted; none |
| §2.1 proof route, supplier pointer | SchemeAndStackFoundations on main; this roadmap's own §2.6 | Supplier §2.6 is "Quasi-coherent cohomology" (README line 4357), §2.23 "Equivariant sheaf cohomology" (line 5661); own §2.6 (line 354) is de Rham cohomology. | Pointer now unambiguous and matches the *Needs:* line; none |

The rows for the untouched statements stand as in the previous review, of 8e0fa4d.

- Source locators checked against the text: 1 (KS-v4 Theorem 5.27, p.74, lines 3392–3396: the source restricts to characters with attached CM type Σ, as the repaired §8.5 now does). None of the fifteen seeded sample sections falls in a changed passage.
- Library declarations opened at the pins: none; the diff changes no Lean statement and no library citation.
- Cross-roadmap citations resolved: SchemeAndStackFoundations §§2.6 and 2.23 on main (the one citation the diff touches). Citations of this roadmap's §8.5 by AutomorphicCongruences, ModularIwasawaMainConjecturesPartII and NonordinaryCMSpecialValues still resolve; the diff renumbers nothing.
- The pull request's text against the head: title (adds a roadmap) correct; ten gap slugs counted in the README, as the description says; the four suppliers not on main are exactly ComplexMultiplicationAndExplicitReciprocity, AbelianSchemesAndArithmeticModuliPartII, PeriodsAndSpecialValues and MordellLawrenceVenkatesh (all open, new roadmaps), GlobalNumberFields being completed and the other thirteen on main; four Lean declarations as described; Poisson summation from ThetaSeries and the Mathlib inputs as in the scope section (line 1284). One sentence wrong (C01).
- Dependency check: `depcheck: 199 roadmaps, 2195 edges, 0 problem(s)`; no UPWARD, CYCLE or moved line. The diff outside the folder against main is empty.
- Automatic checks: all pass on this head. Elaboration: `lake env lean` on `TauCetiRoadmap/AutomorphicPadicLFunctionsPartII/Suggested.lean` gives the two `sorry` warnings (lines 67 and 91) and nothing else; the file is unchanged since 8e0fa4d, so the signature comparison and the one-tactic probe of the previous review stand.
- Declared gaps: unchanged by the diff; ten slugs in the README, each as accepted in the previous review.

Overlap check: closest-roadmap lists unchanged apart from two suppliers (AbelianSchemesAndArithmeticModuliPartII, PeriodsAndSpecialValues) now appearing in them; read this round for shared objects NonordinaryCMSpecialValues, ModularIwasawaMainConjecturesPartII and DirichletPadicLFunctions (scope), with a search of all open heads and main for the Eisenstein–Kronecker class and the Kings–Sprang measure: owned here, cited by the first two and by AutomorphicCongruences; nothing shared.

Source independence: changed passages only; 5 changed passages compared with 1 source (KS-v4 at Theorem 5.27), none shared (the added words are the roadmap's own notation Σ_χ=Σ); largest share KS-v4, 56 of 66 locators, as in the previous review; the diff adds, removes or reorders no layer, so the contents were not compared again.

Research link: The headline targets are the main theorems of Kings–Sprang (arXiv v4 2024, Annals 2025): Theorem 4.10, Corollaries 4.14–4.15 and Theorem 5.27, extending Katz's measure for CM fields (Hida–Tilouine 1993) and Bannai–Kobayashi 2010 at d=1; rests on the README's references and on KS-v4 and BK-2010 as read.

## Not verifiable

- The targets that go beyond the cited proofs (integral unit-index descent of §5.4 and §8.3, the uniform congruences of §8.4) are consistent with every instance computed, but a `sorry` build and scalar checks do not establish them.
- HK-2018 and HT-1993 were not opened (outside the sample and the changed passages).
- The description's merge-order chain and task list are generated blocks and were not checked beyond the four open suppliers.

## Source issues

- none (no new one in the passages read this round; the seven recorded by the review of 8e0fa4d stand)

## For the human reviewers

- §8.5 (lines 1232–1233) states the interpolation formula with a sign ε(d,α−1,β) absent from the published KS-v4 Theorem 5.27; the description now says so. The derivative step and the d=1 parity in BK-2010 were recomputed in the previous review.
- The folder is named `…PartII`, but no roadmap `AutomorphicPadicLFunctions` exists on main, in the merge order or among the open pull requests, and the README's title does not say "part II".
- The package design lists twelve gap slugs; the README states ten. `unit-type-classification` is now the target §0.1 and `hecke-padic-avatar` is replaced by the citation of AG2.0, so any request announced to GlobalNumberFields for them is obsolete.
- AutomorphicCongruences (open, README lines 262, 274, 749) requests `gap:katz-ht93-normalization` of this roadmap; this README declares no such contract and cites HT-1993 in §8.5 for the parity factor only.
