# Review of AutomorphicLFunctionsAndLocalFactors (pull request #3027 at e47c8ec)

**Verdict:** accepted

**Summary.** An incremental re-review of the 33 lines changed since `71bbefa`: accepted, with no finding, no small correction and no format note. The previous review raised no finding; its three small corrections are all repaired: the exponent bound AL.3.3.8a is now stated over every nonarchimedean local field with Zelevinsky's Theorem 9.7 (b) as its classification input, the completeness lemma of the rank-(n−1) route of AL.3.9.7 is stated as part of the target with its locator, and the description's sentence on the generality of the added sections is true again. Left for a human: the source the added sections cite most (Jacquet–Piatetski-Shapiro–Shalika 1983) and three others are paywalled and could not be compared.

## Previous findings

The previous review, of `71bbefa`, had no finding (R). Its three small corrections:

- C01 — repaired: "Let F be a nonarchimedean local field … F of either characteristic … (Zelevinsky … Theorem 9.7 (b), p.199, over every nonarchimedean local field, §1.1, p.170)"; the exception in the Conventions is gone.
- C02 — repaired: "Part of this target is the completeness lemma that gives `f=0`: a smooth function on `GL_(n−1)(F)` that transforms under `N_(n−1)` by `ψ_N⁻¹` … is zero (Jacquet–Liu, proof of Lemma 2.4, the case `j=0`, pp.7–8 …)".
- C03 — repaired: with C01 applied, AL.3.3.8a has the generality of its sources, so the description's "stated in the generality of its source" holds for this folder without a further exception.

## Verified sound

| Statement | Instances tried | Values computed | Result |
| --- | --- | --- | --- |
| Seeded sample: Check for the theta-Mellin formula (AL.3.5.1, untouched) | point mass, n=2, `|det g|=3`, θ₀=5, `|a|=2`, η=1, s=1 | `3¹·5·2^(2·1)=60`; without n: `3·5·2=30`; CogdellColumbia line 264–267 has `|a|^(ns)`, `Re(s)>1`, η unitary | holds |
| AL.3.3.8a classification input, every characteristic | Zelevinsky1980 line 231 (§1.1, p.170); line 1332–1338 (9.7, p.199); line 1404–1416 (9.10, p.201) | F any local nonarchimedean field; (b): nondegenerate irreducible = product of pairwise unlinked `⟨Δ_i⟩ᵗ`, multiset unique; (b) proved in 9.10 | locators and statement agree |
| AL.3.3.8a, which representation of a segment | Zelevinsky 9.2–9.3 (line 1295–1303) against SR.5.2a (v) | `⟨Δ⟩ᵗ` is Steinberg for the trivial-`⟨Δ⟩` segment and quasi-square-integrable: it is SR's `L(Δ)`, not `Z(Δ)`; `Z` would give the trivial representation, not generic | README's `L(Δ)` is right |
| AL.3.3.8a route in positive characteristic | steps of 9.10 against SR.5.2a, SR.5.1 at this head | 9.10 uses 8.1 (derivatives), 9.8 (= SR.5.2a (ii)), uniqueness (= SR.5.2a (i)); SR.5.2a is over any nonarchimedean F; the genericity step is declared part of the target | owned; no unowned input |
| AL.3.3.8a bound, `F=𝔽_q((t))` | complementary series `ν^tχ×ν^(−t)χ` of GL₂ | factor `L(s−2t,χ×χ⁻¹)=(1−q^(2t−s))⁻¹`, pole at `s=2t`; no pole on `Re(s)≥1` forces `t<1/2`; t=1/2 reducible; nothing characteristic-dependent | holds |
| AL.3.3.8a Tadić Theorem D in positive characteristic | Tadic1986 line 230, 1323–1326 | F any locally compact nonarchimedean field; the appendix removes the one characteristic-zero input | source not restricted |
| AL.3.9.7 completeness lemma | n−1=1: f on `F^×`, compact support on each `|a|=C`, `∫_{|a|=C} fχ=0` for all χ | on `|a|=q^(−k)` a locally constant f is a finite sum of characters of `O^×`; all Fourier coefficients zero gives f=0 | holds |
| AL.3.9.7 completeness lemma, equivariance | f transforms by `ψ⁻¹`, W by ψ | `f(ug)W(ug)=ψ⁻¹(u)ψ(u)f(g)W(g)`: integrand `N`-invariant, integral over `N\{|det|=C}` defined; compact support mod N gives convergence | well posed |
| AL.3.9.7 locator | JacquetLiu2018 line 270–345 | Lemma 2.4 p.7; proof, j=0, pp.7–8: level sets compact mod `U`, Laurent series in `q^(−s)`, per-level equality, spectral theory, reference to Henniart 1993 §3 | agrees with the README |
| Conventions (line 37) against AL.3.3.8a | grep for "characteristic zero" in the README | no local target of AL.0–AL.3 is restricted to characteristic zero any more; the sentence "each local target names its input in positive characteristic" holds for AL.3.3.8a | consistent |

The rows of the previous review for the untouched statements (AL.3.2.4, AL.3.3.2a, AL.3.7.1a, the other forms and Checks of AL.3.9.7 and AL.3.3.8a) stand as in the previous review, of `71bbefa`.

- Source locators checked against the text: 7 (Zelevinsky §1.1 p.170, Theorem 9.7 (b) p.199, 9.10 p.201, 9.3 p.198; Jacquet–Liu Lemma 2.4 and its proof pp.7–8; Tadić §1.1 and appendix; Cogdell Columbia §1.1.3).
- Cross-roadmap citations resolved at this head: 12 (SR.5.1 *mirabolic-derivatives*, SR.5.2 *modular-generic-segments* and *segment-representations*, SR.5.2a clauses (i), (ii), (v), SR.1.1; AlgebraicCurves Layers 0, 4, 5, 9 and §§12A, 12D; ArithmeticGaloisDuality §R02.3.2; AdelicAlgebraicGroups §§0.1–0.4, 2.2–2.3; SchemeAndStackFoundations Layer 3).
- Of the 33 changed lines, the `*Needs:*` lines at AL.0.1, AL.0.3, the function-field section of AL.0, AL.3.2, AL.3.3 and AL.3.6.2 are `main`'s text, brought in by the merge; against `main` the folder changes by 121 insertions and 6 deletions, all in Layer AL.3, the Conventions, the supplier contracts and the references.
- Record: the merge-base README has 6 layers; none removed or retitled, 0 headings removed, 5 added. `Suggested.lean` is unchanged by the pull request.
- Dependency check: `depcheck: 132 roadmaps, 1478 edges, 0 problem(s)`.
- Elaboration of `Suggested.lean`: exit 0, 14 `sorry` warnings and nothing else.
- Automatic checks: all passed. No file changed outside the folders the pull request owns.
- The pull request's text against this head: no sentence about this folder is contradicted; the five added sections fall under "49 existing roadmaps receive 196 sections".

Overlap check: read AutomorphicLFunctionsAndLocalFactorsPartII, GL2AutomorphicRepresentationsAndTransfer, AutomorphicSpectralTheory, LocalFactorsOfTwistsAndTypes, GlobalShtukasAndFunctionFieldLanglands, MetaplecticAutomorphicForms, CongruenceSpectralGap; shared: the exponent bound (owner AL.3.3.8a, now in every characteristic; LocalFactorsOfTwistsAndTypes 6.3 cites it as its general theorem, still with the words "for `F` of characteristic zero", which is true and narrower than the owner now allows), the local converse theorem (owner AL.3.9.7; LocalFactorsOfTwistsAndTypes 6.4 is a corollary); γ-multiplicativity, the pairing at s = 0 and the transpose-inverse contragredient as in the previous review.

Source independence: changed passages only. 4 passages compared with 2 sources (Zelevinsky 1980, 9.7 and 9.10; Jacquet–Liu, proof of Lemma 2.4), none shared beyond what the mathematics forces; largest share of the added sections' locators Jacquet–Piatetski-Shapiro–Shalika 1983, 10 of 34 (the 30 of the previous head and the four added since), not readable (paywalled); no layer added, removed or reordered, so the arrangement was not compared.

Research link: the added AL.3 sections are the local Rankin–Selberg theorems of Jacquet–Piatetski-Shapiro–Shalika (1983), the generic unitary dual of Bernstein (1984) and Tadić (1986), and the local converse theorems of Henniart (1993) and Jacquet–Liu (2018), which Henniart (2002) uses to characterise the local Langlands correspondence for GL(n). Rests on the README's sources and Henniart 2002 §1.9, Jacquet–Liu p.3, read.

## Not verifiable

- Jacquet–Piatetski-Shapiro–Shalika, *Rankin–Selberg convolutions* (Amer. J. Math. 1983): paywalled; its locators in AL.3.2.4, AL.3.3.2a and AL.3.3.8a were not read.
- Henniart, *Caractérisation … par les facteurs ε de paires* (Invent. Math. 1993): paywalled; §3, to which the completeness lemma of AL.3.9.7 is traced, was not read. That Jacquet–Liu refer to it for the lemma was read (p.8).
- Bernstein, *P-invariant distributions on GL(N)* (LNM 1041, 1984): paywalled; §8.9 was not read.
- Jacquet–Shalika, *On Euler products … I* (Amer. J. Math. 1981): paywalled; Proposition (1.5) and Corollary (2.5) were not read.

## Source issues

- none

## For the human reviewers

- Not tested: the source with the largest share of the added sections' locators, Jacquet–Piatetski-Shapiro–Shalika 1983 (10 of 34), is paywalled. Wording and arrangement were not compared against it, nor against Henniart 1993, Bernstein 1984 or Jacquet–Shalika 1981.
- The two recorded decisions of the human reviewers concern roadmaps under RiemannHypothesisForDirichletLFunctions; neither bears on this folder, which removes nothing.
