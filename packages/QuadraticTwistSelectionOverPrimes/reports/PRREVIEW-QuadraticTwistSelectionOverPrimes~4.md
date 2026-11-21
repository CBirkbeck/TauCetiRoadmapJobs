# Review of QuadraticTwistSelectionOverPrimes (pull request #2878 at 8da6fc0)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/QuadraticTwistSelectionOverPrimes/`
**Verdict:** accepted

**Summary.** Accepted: I found no false or unsupported statement. Every identity, Check and worked example of 2.7a–2.7d was recomputed, each step of the routes of 2.7b–2.7d was checked against the supplier sections it cites, and the three Lean headlines say what the README says. The earlier finding on missing locators is no longer blocking, because the hypotheses and constants of 2.7b–2.7d are now derived in the text from cited sections and those derivations hold; what remains of it is one small correction. There are also two format notes. The standing of the formal proof as a source, which could not be read, is left to the human reviewers.

## C01 — The reference to the formal proof names no file or declaration, so the sentence that it is the source of 2.7b–2.7d cannot be followed

In the References (line 380), [FormalProof] "is the source of the twist-selection theorem (2.7b–2.7d) and its route", and the entry now says where the archive is (footnote 1 of the announcement; the fourteen parts are listed at Announcement line 53). It still gives no file or declaration, so a reader who opens the archive has nothing to search for, and nobody can compare the statements of 2.7b–2.7d with the ones proved there.

This does not touch the statements themselves. Each of `δ₀ < 1/12`, `b < 1/4`, `a < 1/2`, the factor `(2 + ε)/δ₀` and the two box heights is derived in the README from a cited section, and I checked each derivation (rows of the table below). I could not read the archive or the repository, so I ask for nothing about their content. Naming, for 2.7b (ii), 2.7b (iv), 2.7c and 2.7d (ii), the declaration of the archive that states each would make the sentence checkable. If instead the forms stated here are the roadmap's own deductions from the supplier sections, the entry would be accurate reading "the route of 2.7b–2.7d is that of [FormalProof]; the statements are derived here".

## N01 — The supplier contract quotes Mertens in the form `Σ_{n≤x} Λ(n)/n = log x + O(1)` under AnalyticNumberTheoryPartI §0.11, whose own statement is the prime form

On main, §0.11 states `Σ_{p<X} (log p)/p = log X + O(1)`; the von Mangoldt weight `Λ(n)/n` is the export of its subsection §0.11a. Citing §0.11a in the contract (line 359) and in the *Needs:* lines of 2.7b (ii) and 2.7c would point at the statement used.

## N02 — Downstream consumers lists one consumer; FrobeniusRestrictedRieszSums also has a supplier contract on 2.7c–2.7d

The open head of FrobeniusRestrictedRieszSums has a subsection "From QuadraticTwistSelectionOverPrimes" consuming §2.7d (i) and (ii) with the hypotheses of §2.7c. A line for it under Downstream consumers (line 345) would complete the list.

## Earlier findings

- R01 of the previous review (no source locator for 2.7a–2.7d; the readable announcement states none of the targets): partly repaired. The reference now reads "distributed as a Lean archive in fourteen parts on its author's page (footnote 1 of [Announcement])" and "The hypotheses and constants of these targets are accounted for by their routes above". The consequence that finding named, that a reader cannot tell where the hypotheses and constants come from, is repaired: each is derived and each derivation checks. No file or declaration is given; that remainder is C01. It is not a finding at this head: the targets are supported by routes from cited supplier sections, and the unlocated text could not be opened, so no change to it can be required.
- C01 of the previous review (the description said every family pull request carries an identical index): repaired. The description now says the heads of FiniteReductiveGroups and AdelicHeightsAndSuccessiveMinima "carry older versions"; the index at the FiniteReductiveGroups head indeed differs (this roadmap's entry is at line 43 there, line 48 here and at the RieszSumsOverPrimesAndExceptionalZeros head).
- N01 of the previous review (Summary's "odd part `s` of `n` prime to `m₀`"): repaired. Line 3 now reads "`s` is the product of the primes `p ∤ m₀` that divide `n` to an odd power", with `8 ∣ m₀` and `q ∤ n` stated; `s_8(18) = 1` agrees.

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| 2.7a (i) reciprocity on a class (sampled) | m₀ ∈ {8,24,40,120}, all a₀, n ≤ 60 and 18, 75, 360, 1001, 2310, primes q < 3000 | (n/q)·(q/s) constant on every class; ε(8,3,2)=−1, ε(8,3,3)=−1; (3/11)=1=−(2/3) | holds | none |
| 2.7a (ii) | s=15, m₀=8, u=41 | 41≡1 (8), (41/3)=−1, (41/5)=1, so (41/15)=−1 | holds | none |
| 2.7a (iii) (α) and its second form | 1−β₁ ≥ c·m₀^(−3/4) | min(1,(1−β₁)log U) ≥ c/m₀; matches RieszSums 1.7b (iii) with x=U ≥ m₀^L | holds | none |
| 2.7a (iii) (β), surviving term and its sign | b = a₀′u, u≡1 (m₀) | Σ_b (b/s)χ₁(b) = χ₁(a₀′)φ(s); term −χ₁(a₀′)Li(U^β₁)/φ(m₀) | holds; Check 1 sign right | none |
| 2.7a (iii) Page step | conductors N₁,N₂ ≤ m₀Y^A | c₀/log(m₀Y^A) ≤ 3c_star/log(N₁N₂) iff c₀ ≤ 3c_star/2; ANT-I §0.17 has `3c_star/log(N₁N₂)` | holds | none |
| Li(U^β) ≤ 3U^(β−1)Li U | U=10^6, 10^12, 10^30; β=1/2, 3/4, 1 | ratios 0.749, 0.697, 0.677; 0.460, 0.451, 0.447; 0.333 | holds; limit 2/3 at β=1/2 | none |
| Headline (1) `abs_sum_jacobiSym_primes_le` | U=10^5, 10^6; (m₀,a₀,s)=(8,3,3),(8,5,15),(24,7,5),(40,3,21) | card P 19609, 19580, 9803, 4913 vs bound 6032, 6032, 3016, 1508; abs sums 31, 50, 13, 41 | consistent | none |
| (1) degenerate inputs | m₀ ≥ 8, s ≥ 3 | m₀s ≥ 24 forces U ≥ 24^L; log(m₀s) > 0; q > √U > s so q ∤ s | no junk value used | none |
| `primesInClass` | m₀=8, a₀=3, U=121 | {19,43,59,67,83,107}; 11 excluded by the strict √U; Σ(q/3)=0 | right | none |
| 2.7b (i) mean-square inequality (sampled) | 150 random (c, κ) each: (8,3,N=7), (24,7,N=9), (8,1,N=11), worst s as s* | max LHS/RHS 0.447 (η=0.019), 0.328 (η=0.029), 0.441 (η=0.053) | holds | none |
| 2.7b (i) pair count | same prime; two primes; r=p; r=pp′ | Σ sP²; RR²; 2B·RR; 2B², each ≥ the pairs of its kind | holds | none |
| 2.7b (ii) five terms | p ≤ y, p > y, a < 1/2 | sP ≤ 3 log y, ≤ 2y log p/p; RR² ≪ y + y^(2a)log²y; η-term ≤ y·L₁²log²Y/Y | holds, C=C(a) | none |
| 2.7b (iii) window passage and bump Check (sampled) | block [Y′, 2Y′] | Σ sup ≤ (2 + 2 log 2)MY′log(2Y′)card P ≤ 4M…; Markov 16M log(2Y′)Y′^(−2τ); bumps need n ≥ 2^(1+2τ)Y^(2τ)/(M log Y) | holds | none |
| 2.7b (iv) primitive form | n ≤ Y, Y<n<y, n ≥ y | differences 0, (n−Y)/n, (y−Y)/n; v·D_q(v) = S_Z(v; q, κ·1_{(v,∞)}) | holds | none |
| 2.7c identity G_χ = −S_Z − xT_Z (sampled) | q=11, x=37.5, Z=200; q=19, x=Z=200 | 15.60188765 both sides; 88.50397706 both sides | holds | none |
| 2.7c width `δ₀ < 1/12` | ANT-I §1.7 at σ=1−δ₀, T=Q=FU ≤ U^(3/2) | exponent (5+3)δ₀·3/2 = 12δ₀; equals 1 at δ₀=1/12 | holds; Check right | none |
| 2.7c tail and `b < 1/4` | RieszSums 1.4e corollary, x=Y^K, Z=x^(1/δ₀) | x·abs(T_Z) ≤ K′Y^(2b+Kδ/δ₀); 2·0.299<0.6, 2·0.301>0.6 | holds | none |
| 2.7c (b) | RieszSums 1.4f, Q=FU ≥ cond(ξ)·q ≥ 3 | bound ((2+ε)/δ₀)log log Q + C(δ₀,ε); log log 4 = 0.327 | holds | none |
| 2.7c reduction to `8 ∣ m₀` | m₀=1,2,3,4,6,12,16,5 | classes above a₀: 4,4,4,2,4,2,1,4; log m₀′ ≤ log m₀ + 2.08 | holds | none |
| Headline (2) `twistSelection` (sampled 2.7c) | Ξ empty; ξ trivial; χ of another level M | G=P; agreement off N·q forces every prime of M to divide N·q, so χ = ξ·(·/q) at level N·q | matches 2.7c, not vacuous | none |
| (2) quantifier order | elaborated type | C₂(ε) chosen after δ₀ only; C₁, Y₀ before ε, Y, m₀, a₀, U, F, family | as README | none |
| Headline (3) `twistSelection_two_of_conductorBound` (sampled 2.7d) | second step, 2R characters; d vs q | conductors ≤ N₀q ≤ F₂(q); d > √U₂ ≥ F₂(q) ≥ q; heights F₁U₁, F₂(q)U₂ | follows from (2) twice | none |
| 2.7d worked example | z=2, 8, 100; z, log Y ≥ 8C₁ | log 16 + z + z log 4 ≤ 4z true at all three; 4C₁z + C₁log Y ≤ z log Y(1/2+1/8) | holds | none |
| Supplier sections cited | RieszSums 1.4e, 1.4f, 1.7b (ii)–(iv); RHSAC 8.4a (b); ANT-I 0.2, 0.11, 0.12, 0.17, 0.34, 0.34a, 1.7 | each exists at its head or on main and states what is quoted; 0.11 in prime form | resolved | N01 |
| [FormalProof] reference | README line 380; Announcement line 53 | fourteen parts listed; no file or declaration named; archive and repository unreadable | not checkable | C01 |

- Source locators checked against the text: 1 (footnote 1 of [Announcement], line 53); the announcement read in full (190 lines). Gallagher 1970 is paywalled and cited by pages only.
- Library declarations opened at the pins: 11, all elaborated with `#check`: `jacobiSym.quadratic_reciprocity` (LegendreSymbol/JacobiSymbol.lean:423), `jacobiSym.at_two` (:321), `ZMod.χ₈` (LegendreSymbol/ZModChar.lean:118), `ZMod.chineseRemainder` (Data/ZMod/Basic.lean:889), `legendreSym.eq_neg_one_iff` (LegendreSymbol/Basic.lean:190), `Chebyshev.psi_le_const_mul_self` (NumberTheory/Chebyshev.lean:485), `MeasureTheory.integral_mul_le_Lp_mul_Lq_of_nonneg` (Integral/Bochner/Basic.lean:1232), `DirichletCharacter.LFunction_apply_one_ne_zero` (LSeries/Nonvanishing.lean:412), `DirichletCharacter.IsPrimitive` (DirichletCharacter/Basic.lean:291), `DirichletCharacter.LFunction` (LSeries/DirichletContinuation.lean:60), `TauCeti.Real.logIntegral` (Analysis/SpecialFunctions/LogIntegral.lean:141).
- Cross-roadmap citations resolved: 16 (7 sections of AnalyticNumberTheoryPartI and 3 items of SieveMethodsAndPrimePatterns on main; 5 items of RieszSumsOverPrimesAndExceptionalZeros and 1 of RiemannHypothesisStatementsAndConsequences at their open heads). Consumers read: ThetaChainsAndFrobeniusPrimeSums and FrobeniusRestrictedRieszSums cite §§2.7c–2.7d as stated here.
- Dependency check output: `depcheck: 171 roadmaps, 1989 edges, 0 problem(s)`; no UPWARD or CYCLE line. Changes outside the folder: only the three files of the family index, which belong to this pull request; the index states no mathematics of its own and its `Suggested.lean` declares nothing.
- Automatic checks: all passed. Elaboration of `Suggested.lean`: three `sorry` warnings (lines 82, 103, 130), nothing else.
- `#check @name` on all 7 declarations in one probe file: the elaborated types match the README statements; no binder lost; nothing changed.
- One-tactic probe: `simp` leaves headline (1) unsolved and does not evaluate `primesInClass 8 3 121`; (2) and (3) need the zero-density and progression inputs. No padding. All three headlines are statable and stated.
- Duplication by object: no declaration of the pinned Mathlib or Tau Ceti states an average of Jacobi symbols over primes of a class or a twist selection; no other roadmap, open or on main, declares `primesInClass` or `twistSelection`.

Overlap check: read RieszSumsOverPrimesAndExceptionalZeros, FrobeniusRestrictedRieszSums, ThetaChainsAndFrobeniusPrimeSums, QuasiRiemannHypothesis, GeneralizedRiemannHypothesisFromWindowBounds (open), SieveMethodsAndPrimePatterns, AnalyticNumberTheoryPartI, ExplicitPrimeCounting (main). Shared objects: `G_χ`, owner RiemannHypothesisStatementsAndConsequences §8.4a (b), cited; zero-free-box bounds and Linnik-range prime number theorem, owner RieszSumsOverPrimesAndExceptionalZeros §§1.4e–1.4f, 1.7b, cited; Mertens, Page, Landau–Siegel exclusion, zero density, owner AnalyticNumberTheoryPartI, cited; quadratic large sieve, owner SieveMethodsAndPrimePatterns §2.7, not restated; twist selection, owner this roadmap, the others consume it.

Source independence: 7 passages compared with 1 source ([Announcement]: the Summary, the routes of 2.7a (iii), 2.7b (iii) and 2.7c, a Check of 2.7d, the module docstring of `Suggested.lean`, the References entry), none shared; largest share Gallagher1970 and Announcement, 1 of 2 locators each; contents compared with Announcement: independent (it has no sections on this material). Gallagher1970 (paywalled) and [FormalProof] could not be read, so wording and arrangement were not compared with them. The order 2.7a → 2.7d is forced by the *Needs:* lines (2.7b (ii) needs 2.7a (iii); 2.7c needs 2.7b (iv); 2.7d needs 2.7c).

Research link: 2.7c–2.7d select the auxiliary primes used by ThetaChainsAndFrobeniusPrimeSums in the family following Alpöge's 2026 formal proof; inputs are Gallagher's (1970) theorem in Linnik's range via RieszSumsOverPrimesAndExceptionalZeros §1.7b and Jutila's (1977) zero density via AnalyticNumberTheoryPartI §1.7. Rests on the README and those two sections.

## Not verifiable

- [FormalProof]: the repository's host is in no licence class of the legal-source fetcher, and the archive part on the author's page is returned as a file that is not a document. Not read; no statement of 2.7b–2.7d was compared with it.
- Gallagher, Invent. Math. 11 (1970), 329–339: paywalled, cited by its page range; the page range was not checked against the text.
- The seeded sample 2.7a–2.7d against a source text: no target carries a locator into a readable text; the targets were checked instead against the supplier sections their routes cite and by computation (table).
- The date "20 November 2026" of the announcement: the text read bears no date.

## Source issues

- none

## For the human reviewers

- Scope: the source named for 2.7b–2.7d is [FormalProof], an unrefereed Lean formalisation; its announcement (Announcement lines 5–53) is an informal four-page note that states no theorem of this roadmap.
- Licence: [FormalProof] could not be read (repository host unclassified, archive not a document), so its licence was not seen and `Suggested.lean` was not compared with it for adaptation.
- Not tested: wording and arrangement were not compared with Gallagher 1970 (paywalled) or with [FormalProof]; only the announcement was compared.
- Headline 2.7a (iv) depends, through RieszSumsOverPrimesAndExceptionalZeros §1.7b (iv), on AnalyticNumberTheoryPartI §0.34 on main, the uniform exclusion of Landau–Siegel zeros, sourced there to its references [109] and [110].
