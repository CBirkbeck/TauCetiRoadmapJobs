# Review of MetaplecticAutomorphicForms (pull request #3027 at 3bddf73)

**Verdict:** accepted

**Summary.** An incremental re-review of the 44 lines changed since `a4d9b5d`: 22 `*Needs:*` lines that now cite sections instead of whole layers. Every section and declaration they name exists where it is cited (on `main` and at the pin) and states what the line says it supplies; no statement, locator or Lean declaration changed. No finding; two small corrections (the supplier contracts and layer dependencies do not yet follow the repointed lines, and the locators asked for last round are still missing) and one format note, none blocking. Nothing is left for a human to decide.

## C01 — The supplier contracts, four `### Dependencies` lines and the text of 4.1a still give the old owners of the number-field Fourier analysis

A reader of `## Exact supplier contracts` cannot find two suppliers the layers now use, and is sent to sections that do not exist. The changed `*Needs:*` lines take the number-field local and adelic Fourier analysis from AnalyticNumberTheoryPartII §§5.3g–5.3h (3.44, 4.1, 4.3, 4.4, 4.5, 5.1, 5.4, 6.3, 6.11, 6.12) and the Hecke continuation from AnalyticNumberTheoryPartI §2.3a (6.10a). Neither roadmap is named anywhere else in the README: not in the contract table (line 3670), not in the Dependencies of Layers 3–6 (lines 1233, 1375, 1984).

The table's row for AutomorphicLFunctionsAndLocalFactors still credits AL.0 with "*Adelic Schwartz spaces, Poisson summation and partial transforms*" and "*Characters, trace duality and self-dual measures*"; that roadmap has no heading of either name (its AL.0 has AL.0.1, AL.0.3, AL.0.5 and AL.0.6, and itself cites §5.3h for vector-space Poisson summation, its lines 1175 and 1583). The same row, the Dependencies of Layer 4 (line 1375) and 4.1a (lines 1251 and 1253, twice in the paragraph whose `*Needs:*` says §AL.0.6.1) place *Curve additive analysis* in AL.3; it is AL.0.6.1, and AL.3 is Rankin–Selberg theory. 4.1a also ends "AL.0 supplies the number-field versions".

Smallest change: add rows for AnalyticNumberTheoryPartII §§5.3g–5.3h and AnalyticNumberTheoryPartI §2.3a to the contract table and to the Dependencies of Layers 3–6; in the AutomorphicLFunctionsAndLocalFactors row and in 4.1a write "§AL.0.6.1" for "AL.3, *Curve additive analysis*" and drop the two heading names. The four `*Needs:*` lines that still cite bare "AL.0" for number-field vector-space Poisson summation or partial Fourier transforms (5.6a line 1479, 5.9 line 1546, 5.14a line 1624, 6.20 line 1966) would then read §5.3g or §5.3h as their neighbours do.

## C02 — Four sections added by this pull request still cite a main source without a locator, and one page range starts a page late

Unchanged since the last review. In 1.5 (line 363) Bargmann61 and Bargmann67 carry no section or equation; in 3.9a (line 847) MVW87 is cited only as "type-I pairs over a `p`-adic field"; in 6.4a (line 1736) Ichino07 has no theorem number; in 6.4b (line 1756) Weil65 has no section, while 6.4a gives §§V–VI for the same work. In 2.5a (line 525), KV78, II.1, (1.1) begins on p. 9 (KV78 line 409), so "pp. 9–11" would be right.

## N01 — In the first Check of 3.9a, (iii) for `n=0` is trivially true, not vacuous

Unchanged (line 851): for `n=0` the hypothesis of (ii) holds and `U(V)=1`, so (iii) asserts a vector with `‖φ‖²>0`, which exists. "Holds trivially" would be the accurate word.

## Questions for the author

- 6.4a (line 1732) restricts the range `n<m≤2n` to `F` totally real, `E` totally imaginary and polynomial Fock data, as "the setting of Ichino07". Does Ichino07 assume this? GQT, proof of Proposition 11.1 (ii), credits the convergent range to Ichino07 without such conditions. Ichino07 has no open copy, so I could not check.

## Previous findings

- The previous report, of `a4d9b5d`, had no finding (it accepted); its two non-blocking remarks are accounted for here.
- C01 (missing locators, KV78 page) — not repaired: lines 363, 525, 847, 1736 and 1756 read as before; written again as C02.
- N01 (`n=0` "vacuous") — not repaired: line 851 reads "(iii) is vacuous"; written again as N01.

## Verified sound

| Statement | Instances tried | Values computed | Result |
| --- | --- | --- | --- |
| 0.1 `*Needs:*` (Tau Ceti names) | the five names at the pin | `FactorSet` l.96, `FactorSet.Extension` l.180, `FactorSet.inl` l.296, `FactorSet.groupExtension` l.345 of `GroupTheory/GroupExtension/Of/FactorSet.lean`; `trivialMulDistribMulAction` l.51 of `Algebra/GroupAction/Trivial.lean` | all exist |
| 0.14, 0.15, 0.17, 2.1, 2.5, 2.6a, 2.7a, 3.3a, 6.3 → §AL.0.3.1 | local field of either characteristic; `V=F`, `B=xy` | AL.0.3.1 defines `S(F)`, `S(V)`, the self-dual measure with `vol(L)vol(L^∨)=1`, `f̂̂(x)=f(−τx)`; `vol(O)=q^(−ν/2)`; number-field completions via §5.3g | supplies what is cited |
| 3.3b → §§AL.1.3.1, AL.1.3.4 | ramified `ω`, conductor `c` | AL.1.3.1 is `ε(s,ω,ψ)`, `γ(s,ω,ψ)`; AL.1.3.4 is `𝔤(ω,ψ)` with `𝔤·conj(𝔤)=1` | supplies what is cited |
| 3.44, 5.4, 6.11 → ANT II §5.3g | `ψ_v(a·)` with pairing `B` | §5.3g: statements for `ψ_v(a·)`, `B` are those for `ψ_v`, `aB`; partial transform in `V₂` sends `f₁⊗f₂` to `f₁⊗f̂₂`; measure scales by `|a|_v^(dim V/2)` | supplies what is cited |
| 4.1, 4.3, 4.4, 4.5, 5.1, 6.3, 6.11, 6.12 → ANT II §5.3h | `V=ℚ`, `t=2` | §5.3h: `ψ` trivial on `F`, `Σf(gξ)=|det g|⁻¹Σf̂(g^*ξ)`, partial transforms placewise; Jacobi at `t=2`: both sides `1.0000069747` | supplies what is cited |
| 4.1, 4.1a, 4.3, 4.4 → §AL.0.6.1 | `ℙ¹`, `ω=dt` | AL.0.6.1 is *Curve additive analysis*: residue character, conductor sum `Σn_v deg v=2g−2=−2`, scalar Poisson; AL.3 is Rankin–Selberg | Needs right; body text stale (C01) |
| 6.10a (sampled) → §§AL.1.2.1, AL.1.3.1, AL.1.4.2, AL.2.1.4, AL.2.1.5; ANT I §2.3a | unramified `ω(ϖ)=t` | AL.1.2.1: `L(s,ω)=(1−tq^(−s))⁻¹`; AL.2.1.4: `L(s,π)=P_π(q^(−s))⁻¹`; §2.3a: `Λ_H(ω,s)=W(ω)Λ_H(ω⁻¹,1−s)` | supplies what is cited |

The rows of the previous review, of `a4d9b5d`, stand for every statement: the change touches no statement.

- Seeded sample: of its targets only 2.5 and 6.10a have a changed line (their `*Needs:*`), checked above; the other thirteen are untouched and were not re-read against their sources.
- Source locators checked against the text: none new (no locator changed).
- Library declarations opened at the pin: 5 (above).
- Cross-roadmap citations resolved: 12 sections (AL.0.3.1, AL.0.6.1, AL.1.2.1, AL.1.3.1, AL.1.3.4, AL.1.4.2, AL.2.1.4, AL.2.1.5; AnalyticNumberTheoryPartII §§5.3g, 5.3h; AnalyticNumberTheoryPartI §2.3a), each on `main` and at this head; all three roadmaps are on `main` and earlier in the merge order.
- Record: no layer or item removed or renumbered; the 22 deleted lines are each replaced by the same line with a finer citation.
- Dependency check: `depcheck: 130 roadmaps, 1465 edges, 0 problem(s)`.
- Automatic checks: all pass. `Suggested.lean` is unchanged and elaborates with four `sorry` warnings only. The pull request's other changes lie in its own roadmap folders.
- Pull request text: the description states the two lines this pull request itself corrects ("MetaplecticAutomorphicForms 3.44 and 6.10a (AnalyticNumberTheoryPartII §5.3g; §§AL.1.2.1 and AL.2.1.4)"); the other twenty came with `main`. Nothing to correct.
- Overlap check: read ThetaKernelsForUnitaryDualPairs, ThetaLiftsForDefiniteUnitaryGroups, GrossZagierAndArithmeticHeights; as in the previous review, 3.3d (a) for a non-split acting space is owned here; nothing else shared. The open change of references to this folder merges cleanly with this head.

Source independence: changed passages only; they are citation lines with no prose, so no passage was compared; largest share BFH90, 94 of 297 locator lines (as before); contents not compared, since the diff adds, removes or reorders no layer.

Research link: Layers 3–6 carry the local Howe duality of Gan–Takeda (2016) and the Siegel–Weil and Rallis inner product formulas of Gan–Qiu–Takeda (2014); the added sections are the unitary inputs (Harris–Kudla–Sweet 1996, Li 1989, Liu 2021, Wu 2013, Weil 1965) of arithmetic theta lifting. Rests on the README overview and the sources read.

## Not verifiable

- Kudla94, Weil65, Ichino07, Bargmann61, Bargmann67, MVW87, Li92, Mínguez08, Liu11, Rallis82, Braun41: not read (paywalled or not held), as in the previous review; no line citing them changed.
- The description: the copy I was given is cut short, so I could not check whether it names RepresentationTheory/SchurWeyl §8.4 as a supplier of this roadmap.

## Source issues

- none

## For the human reviewers

- none
