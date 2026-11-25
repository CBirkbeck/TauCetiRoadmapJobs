# Review of BilinearComplexityAndBorderRank (pull request #3124 at 046e674)

**Verdict:** needs changes

**Summary.** Needs changes, for one sentence: the supplier contract for `abstractRank_restrictLE` asserts, for every finite set of parties, an equivalence that fails with no party (the README's own scalar `1/2` over `ℚ` refutes it). Every stated theorem survived recomputation at degenerate parameters, and `Suggested.lean` elaborates with `sorry` as its only warning. There is one small correction (a page number in the Wigderson–Zuiddam survey) and one format note. For the humans: Bläser's survey, which carries 28 of the 31 source citations, could not be obtained through the legal-source service, so its locators, wording and table of contents were not checked.

## R01 (P2) — The contract for `abstractRank_restrictLE` states "`t ≤ ⟨r⟩` exactly when `R(t) ≤ r`" for any finite set of parties, which is false with no party

An implementer reading the contract in "From TauCetiRoadmap.AsymptoticSpectra" (README line 667) would take from the supplier an equivalence it does not state, and the sentence contradicts the README's own Conventions. With no party, restriction is equality of scalars and `⟨r⟩` is the scalar `r · 1`. Over `ℚ` take `t = 1/2` and `r = 0`: `tensorRank t = sInf ∅ = 0`, so `R(t) ≤ 0` holds, while `t ≤ ⟨0⟩` says `1/2 = 0`. The "Parties" item of the Conventions (lines 85–90) and the last Check of 2.1 record exactly this junk value. What AsymptoticSpectra 3.1 states at its head is the equality `abstractRank restrictLE t = tensorRank t` of two infima, which does hold for every finite set of parties (both are `0` here); the equivalence needs a party, so that the set of admissible `r` is nonempty and upward closed.

The smallest change: write the contract as the supplier states it ("any finite set of parties: the least `r` with `t ≤ ⟨r⟩` is `R(t)`"), or keep the equivalence and add "with at least one party". The route of 3.1 uses it for three parties only and derives membership from nonemptiness and `Nat.sInf_mem`, so nothing else changes.

## C01 — Theorem 4.12 of Wigderson and Zuiddam, its footnote 51 and the sentence `n^ω ≤ r` are on p. 51, not p. 53

A reader who opens p. 53 finds the start of §4.3 (lifting between semirings). In the version of 5 August 2025 on J. Zuiddam's page, whose footnote numbering agrees with the README (footnote 51) and whose pagination agrees with the locators AsymptoticSpectra gives for the same survey (Example 2.21 on pp. 28–29, Example 3.38 on p. 45), Theorem 4.12, footnote 51 and the remark that `R(MMₙ) ≤ r` implies `n^ω ≤ r` are all on p. 51 (WigdersonZuiddam2025 lines 2225–2239; p. 53 begins at line 2313). I could not read the copy on A. Wigderson's page that the README names; if its pagination differs, say which dated version is meant. Otherwise change "p. 53" to "p. 51" in 2.4 (line 359), in 3.3 (line 508) and in the References (line 689).

## N01 — Two library attributions in the Mathlib contract

`Fin.divNat` and `Fin.modNat` (lines 145 and 642) are declared in Batteries (`Batteries/Data/Fin/Basic.lean`), not Mathlib; `Real.logb` (line 646) is in `Mathlib/Analysis/SpecialFunctions/Log/Base.lean`, not in the file the parenthesis names for its group.

## Verified sound

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| 1.1 `mmRect_spec` | `a=0`; `(a,b,c)=(2,2,3)`; rotation and transposition index maps | `a=0`: dims `0, bc, 0` both sides, ranks `0=0`. Party 2 of `⟨2,2,3⟩`: index `k·2+i`. Rotated support `((j,k),(k,i),(i,j))` matches. | true |
| 1.2 `L ≤ R ≤ 2L` | `T=0`; `c=0`; `a=0`; `T=1/2` over `ℚ` | `T=0`: `L=0=R`. `c=0`: empty circuit, `0≤0≤0`. All-gates count: `xy` coefficient integer after one product, so `L=2>R=1`. | true; negative control true |
| 2.1 `isBorderDecomp_spec` | `W` two-term decomposition; one-term variant; no party scalars `1`, `0`, `1/2` | Sum: `X` at `(0,0,0),(0,1,1),(1,0,1)`, `X²` at `(1,1,1)`, constant `0`. Variant constant term `e₀⊗e₀⊗e₁`. Scalar `1/2`: no decomposition, rank `0`. | true with `[Nonempty ι]` |
| 2.2 interpolation, flattening | `h=0,1,2`; `S=∅`; no party | `C(2,2)=1`, `C(3,2)=3`, `C(4,2)=6`; `∑_{α≤h}(h−α+1)=(h+1)(h+2)/2`. `S=∅`, `t≠0`: flat rank `1 ≤ R̲`. No party: `1 > 0`. | true |
| 2.3 `W` | support from `i+j=l`; slices; char 2 | Support `(0,0,0),(0,1,1),(1,0,1)`. Slice span dim `2`; rank-one member has `−β²=0`, so `β=0`: no two-term decomposition in any field. Flattenings `2,2,2`. | `R=3`, `R̲=2` |
| 2.4 Bini, `12^(ω/3) ≤ 10` | `abc=0,1`; numerics | `0^(ω/3)=0` as `ω≥2`; `1≤1`. `278·log₁₀12=300.012`, `277·log₁₀12=298.93`; `3 log₁₂ 10=2.7799`. `C(3hs+2,2) ≤ (3h+2)²(s+1)²`. | true |
| 3.1 disjoint copies | `f=0`; `kmn=0,1` | `f=0`, `k=m=n=1`: `1 ≤ ⌈0/0⌉=0` fails (control). `kmn=1`: `R(f⊙⟨1,1,1⟩)=f`, `1 ≤ ⌈f/f⌉=1`. | true for `f≥1` |
| 3.2 Schönhage's example | `k=0`; `m=0`; `k=n=1`; `k=n=3,4`; the `kn+1` products | `k=0`: dims `m, n+m, 1`, rank `m`; border side empty array, `0≤1`. Order `X⁰`: `(∑a)(∑b)`; `X¹`: cancels; `X²`: `∑u_ij v_ij`. Ranks `13`, `25`; border `≤10`, `≤17`. | true |
| 3.3 asymptotic sum inequality | `p=0`; `p` copies of `⟨1,1,1⟩`; `Nᵢ=0`; `k=n=4` | `0≤0`; `p ≤ R̲(⟨p⟩)=p`, equality. `2^3.4=10.556>10.55` (`10.55⁵=130696<2¹⁷`), `3^1.7=6.473>6.46`; sum `17.03>17`. `c_s ≤ (h+2)²(s+1)^(q+2)`. | true |
| Lean parse of 3.3 and casts | two `rfl` examples on a probe copy | Big sum parses as `(∑ i, …) ≤ ↑(borderRank …)`; `9 ^ …` is real. | as README |
| Supplier contract, `abstractRank_restrictLE` (R01) | no party, `ℚ`, `t=1/2`, `r=0` | `R(t)=sInf ∅=0`, so `R(t)≤0`; `t ≤ ⟨0⟩` means `1/2=0`. Both infima are `0`. | equivalence false; equality true |
| Copies from suppliers | 10 declarations against AsymptoticSpectra's open head, 3 against AlgebraicCircuitsAndValiantsClasses on main | Bodies equal up to whitespace (docstring prefixes differ). | verbatim |

- Source locators checked against the text: 3 (ShpilkaYehudayoff2010 Thm 3.23, printed p. 46, line 2044: agrees; WigdersonZuiddam2025 Thm 4.12 with footnote 51 and the `n^ω ≤ r` sentence: p. 51, see C01).
- Library declarations opened at the pin: 24 (for example `Matrix.rank_le_iff_exists_eq_mul`, `TauCeti/LinearAlgebra/Matrix/Rank.lean:321`; `MvPolynomial.totalDegree_eq_zero_iff_eq_C`, `Mathlib/Algebra/MvPolynomial/Degrees.lean:584`; `Matrix.rank_eq_finrank_span_row`, `Mathlib/LinearAlgebra/Matrix/Rank.lean:577`; `Nat.ceil_lt_add_one`, `Mathlib/Algebra/Order/Floor/Semiring.lean:357`); all exist, two attributions off (N01).
- Cross-roadmap citations resolved: AsymptoticSpectra 3.1, 3.2, 3.3 at its open head (`isStrassenPreorder_restrictLE` with `2 ≤ Fintype.card ι`, `abstractRank_restrictLE`, `flatRank_mem_asymptoticSpectrum`, `matMulExponent_spec` with `2 ≤ ω ≤ log₂ 7`; its "not treated" list names border rank and the τ-theorem); AlgebraicCircuitsAndValiantsClasses 1.1 on main.
- Automatic checks: all passed. Dependency check output: `depcheck: 122 roadmaps, 1385 edges, 0 problem(s)`.
- Elaboration: `Suggested.lean` elaborates; 10 `sorry` warnings and nothing else. One-tactic probe (`rfl`, `simp`, `infer_instance`) on a copy: none of the 10 theorems closes.
- Elaborated types compared with the README statements for all 28 declarations: no hypothesis lost (`tensorRank` omits an unused `DecidableEq`, `ofArray3` an unused `Field`); nothing changed.
- Pull request text read against the head: counts (10 theorems, 15 definitions, 1 structure, 1 inductive, 1 abbreviation, 4 instances), the declared dependency and the copied declarations agree with the head.
- Overlap check: read AsymptoticSpectra, InformationTheoreticCryptography, AlgebraicCircuitsAndValiantsClasses; nothing shared (AsymptoticSpectra owns tensors, rank, flattening ranks, `mmTensor` and `ω`, copied here and labelled; border rank, multiplicative complexity and the τ-theorem have no other owner on main or at the open heads searched).

Source independence: 8 passages compared with 2 sources (WigdersonZuiddam2025, ShpilkaYehudayoff2010), none shared; largest share Bläser 2013, 28 of 31 source citations; its text and table of contents could not be read, so the contents comparison was not made.

Research link: The targets are the border-rank bound of Bini, Capovani, Lotti and Romani (1979) and Schönhage's τ-theorem (1981), the inputs to the laser method and later bounds on `ω`; Wigderson and Zuiddam (2025, §4.2 and §9.1) rederive and extend the τ-theorem by asymptotic spectra. Rests on the README and WigdersonZuiddam2025 lines 2216–2239, 3843–3855.

## Not verifiable

- Every locator into Bläser, *Fast matrix multiplication* (2013), including those of all nine sampled sections: the legal-source service found no copy it could classify (tried the DOI `10.4086/toc.gs.2013.005`, the journal's PDF address and a title search).
- The README's statements about Bläser's text (that Theorem 4.7 is proved after removing divisions, that the construction is written for `k = n = 3`, that Theorem 7.5 assumes `r > p`): same reason.
- The copy of the Wigderson–Zuiddam survey on A. Wigderson's page: not obtainable through the service; the copy of 5 August 2025 on J. Zuiddam's page was read instead.
- Strassen 1973, Bini–Capovani–Lotti–Romani 1979, Schönhage 1981: not read; the README attributes them without locators.
- The ten-term approximate decomposition of `⟨2, 2, 3⟩` (Check of 2.4): its terms are not written in the README, so the Check was not recomputed; the bound `R̲(⟨2, 2, 3⟩) ≤ 10` is the published one.
- Ownership against open pull requests was checked by object search over the open heads and main; no package on the board beyond those was read.

## Source issues

- **Misprint** in WigdersonZuiddam2025 at footnote 51, p. 51: the source says the hypothesis is a bound on the sum over `i` of the border ranks of the rectangular tensors; it should be a bound on the border rank of their direct sum, as in its Theorem 4.12 and Theorem 9.4; affects nothing.

## For the human reviewers

- Not tested: Bläser 2013 carries 28 of 31 source citations; its text and contents page were not read. By the README's own locators, Layer 2 draws on its pp. 25–28 and Layer 3 on pp. 29–34; wording and arrangement against it are unchecked.
- Licence: the host of Bläser's survey (the journal Theory of Computing, which the README calls open) is in no licence class known to the sources service; a human can classify it.
- Licence: `TauCetiRoadmap/BilinearComplexityAndBorderRank/README.md` lines 608–611 name a 2026 preprint and its public Lean repository (`openai/math`, Apache-2.0) and say no declaration is taken from it; the repository was not opened.
- Scope: `Suggested.lean` copies 13 declarations verbatim from AsymptoticSpectra (still an open pull request) and AlgebraicCircuitsAndValiantsClasses (on main), labelled as copies, to make its headlines statable.
