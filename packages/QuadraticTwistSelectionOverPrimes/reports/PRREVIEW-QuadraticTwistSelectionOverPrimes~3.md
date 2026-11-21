# Review of QuadraticTwistSelectionOverPrimes (pull request #2878 at d64cc31)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/QuadraticTwistSelectionOverPrimes/`
**Verdict:** needs changes

**Summary.** No mathematical error was found. I recomputed every identity, Check and worked example of 2.7a–2.7d, and the three Lean headlines match the README and the supplier sections they cite. The one finding is re-raised from the earlier review: no target has a source locator. The only cited text that can be read legally, the announcement, states none of the targets, and the description's reason for giving no locators does not hold. There is one small correction (a sentence of the description about the family index) and one format note. Scope, licence and an untested main source are left to the human reviewers.

## R01 (P2) — No target of 2.7a–2.7d has a source locator, and the one readable cited text states none of them

Re-raised: R01

Without locators, a referee or implementer cannot check where the specific hypotheses and constants come from, or compare the statements with the formal proof they are said to come from. These include the width bound `δ₀ < 1/12`, the exponents `b < 1/4` and `a < 1/2`, the factor `(2 + ε)/δ₀` in (b), and the two box heights of 2.7d.

None of 2.7a (iii)–(iv), 2.7b (i)–(iv), 2.7c or 2.7d (i)–(ii) carries a locator. The References (lines 379–381) give [FormalProof] as a repository, with no version, file or declaration, and say that it "is the source of the twist-selection theorem (2.7b–2.7d) and its route". [Announcement] can be read legally as its author's own page, and I read all of it. Its four informal pages state no theorem of this roadmap. No Jacobi symbol, quadratic twist, zero-free box, mean square over prime moduli or width `1/12` occurs in it, and "twisting" appears only in passing (Announcement lines 173, 181).

The description gives as its reason for omitting locators that "neither host is among the project's accepted legal sources". That reason fails on three counts:

- The announcement's host is accepted as the author's own page.
- The same page distributes the formal proof itself, as archive parts (Announcement line 53).
- A locator does not need a readable copy: a paywalled theorem is cited by its locator and recorded as uncertified.

The smallest change: after each of these targets, or in one provenance paragraph, give the file and declaration of the formal proof that states it, at a fixed version (the archive of Announcement line 53 or a repository commit). Where a target is instead this roadmap's own deduction from the cited supplier sections, say so and narrow the sentence in the References to what the formal proof does state. 2.7a (i)–(ii) need at most a textbook locator.

## C01 — The description says every pull request of the family carries the family index with identical content; two do not

The description says the family index "is carried, with identical content, by every pull request of the family; it lists the sub-roadmaps in merge order". That holds for 37 of the 39 open family pull requests, including both suppliers' (#2877, #2885). FiniteReductiveGroups (#2881) and AdelicHeightsAndSuccessiveMinima (#2883) carry an older index, which differs from this one in several places:

- Its paragraph on the formal proof does not name the author or the two links (lines 9–14 here).
- Several member descriptions differ.
- It lists HeckeIdealsAndTaylorWilesRelations, BernoulliBoundsForClassGroupEigenspaces and FiniteReductiveGroups in a different order.

Whichever of these merges second will conflict on the index. Either bring those two heads up to this version, or drop "with identical content" and state which version the family index takes.

## N01 — The Summary's "the odd part s of n prime to m₀" (line 3) is not the `s_{m₀}(n)` of the Conventions

The Conventions (lines 14–15) define `s_{m₀}(n)` as the product of the primes `p ∤ m₀` that divide `n` to an odd power. The two integers differ: at `n = 18`, `m₀ = 8` the odd part prime to `m₀` is `9`, while `s_8(18) = 1`. The Jacobi symbols agree, since `(q/9) = (q/1)` for `q ≠ 3`. The Summary would read better as "for the product `s` of the primes `p ∤ m₀` dividing `n` to an odd power".

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| 2.7a (i) reciprocity on a class | m₀ ∈ {8,24,40,56}, 14 values of n, primes q < 4000 | (n/q)·(q/s) constant on each class; (3/11)=1=−(11/3); m₀=24,a₀=5: (3/29)=(3/53)=−1, s=1 | holds | none |
| 2.7a (ii) nontrivial on class of 1 | s=15, m₀=8, u=41 | 41≡1 (8); (41/15)=(2/3)(1/5)=−1 | holds | none |
| 2.7a (iii) (β) cancellation over b mod m₀s | CRT b ↔ t mod s | Σ_t (t/s)=0 kills Li U/φ(M); survivor φ(s)Li(U^β₁)/φ(M)=Li(U^β₁)/φ(m₀) iff s-part of χ₁ is (·/s) | holds | none |
| 2.7a (iii) Page step | log(N₁N₂) ≤ 2 log(m₀Y^A) | c₀/log(m₀Y^A) ≤ 3c_star/log(N₁N₂) iff c₀ ≤ 3c_star/2, as stated | holds | none |
| Li(U^β) ≤ 3U^(β−1) Li U | U=10^6, 10^12, 10^30; β=1/2, 3/4, 1 | ratio 0.749, 0.697, 0.677 at β=1/2; 0.46, 0.45, 0.45 at 3/4; 1/3 at β=1 | holds; Check's 1/(3β) right | none |
| Headline (1) `abs_sum_jacobiSym_primes_le` | m₀=0; m₀=8,a₀=3,U=121,s=3; U=10^6, m₀=8, all a₀, s=3,15 | m₀=0 forces s=1: vacuous; P={19,43,59,67,83,107}, Σ(q/3)=0; #P 19515–19626 vs U/(12 log U)=6032; abs Σ ≤ 95 | consistent | none |
| (1), bound on #P | RieszSums 1.7b (iv) at x=U, q=m₀ | π(U) ≥ U/(3φ log U); dropping π(√U) ≤ √U absorbed by relative error ≤ 1/4 after enlarging L | holds | none |
| 2.7b (i) mean-square inequality | 200 random (c, κ) each: m₀=8,a₀=3,N=7; m₀=24,a₀=7,N=9; worst s as s* | max LHS/RHS 0.494 (η=0.067), 0.392 (η=0.129); s₈(18)=1 | holds | none |
| 2.7b (ii) five terms | p ≤ y and p > y; a < 1/2 | sP(p) ≤ 3 log y, ≤ 2y log p/p; RR² ≪ y + y^(2a)log²y ≪_a y log y; η-term ≤ y·L₁²log²Y/Y | holds, C=C(a) | none |
| 2.7b (iii) window passage; bump Check | block [Y′, 2Y′] | Σ sup abs(f_q)² ≤ 4MY′log(2Y′)#P; Markov 16M log(2Y′)Y′^(−2τ)#P; bumps need n ≥ 2^(1+2τ)Y^(2τ)/(M log Y), second hypothesis n ≪ MY^(−2τ)log Y | holds | none |
| 2.7b (iv) primitive form | n ≤ Y, Y < n < y, n ≥ y | min(1,y/n)−min(1,Y/n) = 0, (n−Y)/n, (y−Y)/n = ∫_Y^y 1_{v<n}dv/n; vD_q(v)=S_Z(v;q,κ1_{(v,∞)}) | holds | none |
| 2.7c identity G_χ = −S_Z − xT_Z | 0 < x ≤ Z | expansion gives Σ_{n≤x}Λχ(x/n−1) + x(L′/L)(1,χ) exactly | holds | none |
| 2.7c tail via RieszSums 1.4e corollary | x=Y^K, Z=x^(1/δ₀) | Y^K·abs(T_Z) ≤ K′Y^(2b+Kδ/δ₀) ≤ Y^(1/2)/2 iff 2b+Kδ/δ₀ < 1/2; Q ≥ x^(1/δ₀+3) from log U ≥ C₁(log Y)² | holds | none |
| 2.7c count of B₁ (ANT-I §1.7) | δ₀=1/12 edge; Q=T=FU ≤ U^(3/2) | exponent (3/2)(8+2ε′)δ₀ equals 1 at δ₀=1/12, ε′=0; < 1 iff δ₀ < 1/12 | holds; Check on δ₀ ≥ 1/12 right | none |
| 2.7c (b) via RieszSums 1.4f | x=(log Q)^(2+ε), δ=δ₀ε/(2+ε), Q=FU ≥ cond(χ) | x^(−1+δ/δ₀)(log Q)²=1; Mertens gives ((2+ε)/δ₀)log log Q + O(1) | holds, C₂=C(δ₀,ε) | none |
| 2.7c reduction to 8 ∣ m₀ | m₀=1,3,2,6,4,12 | m₀′/m₀ = 8,8,4,4,2,2; classes above a₀: 4,4,4,4,2,2; log m₀′ ≤ log m₀ + 2.08 | holds | none |
| 2.7c Checks on b and a | τ=1/10; a=1/2 at Y=10^6 | 2·0.299=0.598<0.6, 2·0.301=0.602>0.6; loss factor log Y = 13.8 | holds | none |
| Headline (2) `twistSelection` | Ξ empty; ξ trivial mod 1; uniqueness of χ; quantifier order | G=P; χ=(·/q), nonprincipal; agreement off N_i·q forces χ=prim(ξ(·/q)); C₂(ε) before K; C₁,Y₀ before ε | matches 2.7c | none |
| (2) non-vacuity | any C₁ | C₁(log Y)² ≤ log U ≤ Y^b satisfiable for Y large; m₀=1 meets the count | not vacuous | none |
| `TwistBounds` (b) | H=FU ≥ 4 | log log 4 = 0.327 > 0; L(1,χ) ≠ 0 as conductor ≥ 3 | well defined | none |
| `rieszRemainder` vs RHSAC §8.4a (b) | primitive nonprincipal χ | both Σ_{1≤n≤y}Λ(n)χ(n)(y/n−1) + y·logDeriv L(1,χ) | same object, cited | none |
| `primesInClass` | m₀=8, a₀=3, U=121 | {19,43,59,67,83,107}; non-strict √U would add 11 | right | none |
| Headline (3) `twistSelection_two_of_conductorBound` | second step with 2R characters; k=0 twists; d vs q | d > √U₂ ≥ N₀q > q; agreement off N_i·q·d forces prim(ξ(·/d)); G₂ chosen per q | follows from (2) twice | none |
| 2.7d worked example | z ≥ 8C₁, log Y ≥ 8C₁ | log m₂ ≤ 2.77+2.39z ≤ 4z for z ≥ 1.72; θ(z) ≤ z log 4 (z < 5000); C₁log Y(4z+log Y) ≤ z(log Y)² | holds | none |
| Sources of 2.7a–2.7d | README References; Announcement lines 1–190 | no target locator; Announcement has no twist, Jacobi, box or 1/12 term (only "twisting", lines 173, 181) | unsupported | R01 |
| Summary "odd part s" | n=18, m₀=8 | odd part prime to 8 is 9, s₈(18)=1; (q/9)=(q/1)=1 for q ≠ 3 | value right, name differs | N01 |
| Description: identical family index | 39 family heads | 37 identical; FiniteReductiveGroups, AdelicHeightsAndSuccessiveMinima differ (attribution, descriptions, order) | false | C01 |

- Source locators checked against the text: no target locator exists. [Announcement] was read in full as an author page (190 lines). Gallagher 1970 is uncertified (paywalled DOI), and [FormalProof] could not be read.
- Library declarations opened at the pins (12), all also `#check`ed: `jacobiSym.quadratic_reciprocity` (JacobiSymbol.lean:423), `jacobiSym.at_two` (:321), `ZMod.χ₈` (ZModChar.lean:118), `ZMod.chineseRemainder` (Data/ZMod/Basic.lean:889), `legendreSym.eq_neg_one_iff` (LegendreSymbol/Basic.lean:190), `Chebyshev.psi_le_const_mul_self` (Chebyshev.lean:485), `MeasureTheory.integral_mul_le_Lp_mul_Lq_of_nonneg` (Bochner/Basic.lean:1232), `DirichletCharacter.LFunction_apply_one_ne_zero` (Nonvanishing.lean:412), `DirichletCharacter.IsPrimitive` (DirichletCharacter/Basic.lean:291), `DirichletCharacter.LFunction` (DirichletContinuation.lean:60), `DirichletCharacter.primitive_mul` (DirichletCharacter/Basic.lean:424), `TauCeti.Real.logIntegral` (LogIntegral.lean:141).
- Cross-roadmap citations resolved: 18. On main: AnalyticNumberTheoryPartI §§0.2, 0.11 (the Λ-weight form is in 0.11a), 0.12, 0.17, 0.34, 0.34a and 1.7, and SieveMethodsAndPrimePatterns §2.7, Layer 3 `li` and `π(x;q,a)`. At the open heads: RieszSumsOverPrimesAndExceptionalZeros §§1.4e (with its corollary) and 1.4f, the 1.7b convention, 1.7b (ii) and (iv), and RiemannHypothesisStatementsAndConsequences §8.4a (b). ThetaChainsAndFrobeniusPrimeSums appears only as a planned member of the family index.
- Dependency check: `depcheck: 171 roadmaps, 1989 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Automatic checks: all passed. The only change outside the folder is the family index, which is this pull request's own.
- Elaboration: `lake env lean` on `Suggested.lean` gives only three `sorry` warnings (lines 82, 103, 130). A `#check @` probe of the four definitions matches the README, with no lost binder; the theorems' elaborated types were compared with 2.7a (iv), 2.7c and 2.7d (ii).
- One-tactic probe, done by reading: none of the three headlines closes with one tactic, since each needs prime-number-theorem or zero-density input. No padding.
- Ownership against open pull requests: checked by object (twist selection, Jacobi symbols over primes, zero-free boxes, `G_χ`), searching main and every open head.

Overlap check: I read the scope of RieszSumsOverPrimesAndExceptionalZeros, FrobeniusRestrictedRieszSums, QuasiRiemannHypothesis and GeneralizedRiemannHypothesisFromWindowBounds (open, by vocabulary), of SieveMethodsAndPrimePatterns, AnalyticNumberTheoryPartI and ExplicitPrimeCounting (on main, by vocabulary), and of RieszSumsOverPrimesAndExceptionalZeros again (by results). The shared objects and their owners:
- `G_χ`: owned by RiemannHypothesisStatementsAndConsequences §8.4a (b), and cited here.
- The zero-free-box control and the prime number theorem in Linnik's range: owned by RieszSumsOverPrimesAndExceptionalZeros §§1.4e–1.4f and 1.7b, and cited.
- Mertens, Page, the Landau–Siegel exclusion and zero density: owned by AnalyticNumberTheoryPartI, and cited.
- The quadratic large sieve: owned by SieveMethodsAndPrimePatterns §2.7, and not restated.
- Twist selection: owned here. FrobeniusRestrictedRieszSums (a remark in 1.9) and GeneralizedRiemannHypothesisFromWindowBounds (its scope) mention it as consumers.

Source independence: 6 passages compared with 1 source (the Summary, 2.7a (iii) route, 2.7b (iii) route, 2.7c statement, the `Suggested.lean` module docstring and the References, against [Announcement]), none shared. The largest share of the locators is Gallagher1970's, 1 of 1 (an article page range). Contents were not compared: Gallagher1970 is paywalled and [FormalProof] is unreadable. The order 2.7a → 2.7d is forced by the *Needs:* lines: 2.7b (ii) needs 2.7a (iii), 2.7c needs 2.7b (iv) and 2.7a (iii), and 2.7d needs 2.7c.

Research link: 2.7c–2.7d supply the auxiliary primes for the theta-chain argument of Alpöge's announced 2026 Lean proof of the Riemann hypothesis for Dirichlet L-functions ([Announcement], [FormalProof]). The inputs are Gallagher's (1970) prime number theorem in Linnik's range, through RieszSumsOverPrimesAndExceptionalZeros §1.7b, and Jutila's (1977) zero density, through AnalyticNumberTheoryPartI §1.7. This rests on the README and on AnalyticNumberTheoryPartI §1.7.

## Not verifiable

- [FormalProof]: the legal-source fetcher does not classify the repository host (github.com, leanprover-community/riemann-hypothesis), and the archive on the author's page (Announcement line 53) is not a document. Not read.
- Gallagher, Invent. Math. 11 (1970), 329–339: the DOI resolves only to a paywalled publisher, so the citation is uncertified; no theorem locator to check.
- The seeded sample 2.7a–2.7d against its source: there are no locators, the named source is unreadable, and the readable announcement states none of the targets.

## Source issues

- none

## For the human reviewers

- Scope: the only source named for 2.7b–2.7d is [FormalProof], an unrefereed Lean formalisation announced on 20 November 2026. The announcement (Announcement lines 5–53) is a four-page informal note that states no theorem of this roadmap.
- Licence: [FormalProof]'s repository host is unclassified, and its author-page archive (Announcement line 53) is not a readable document. Its licence, and any adaptation of `Suggested.lean` from it, were not checked.
- Not tested: Gallagher 1970, the only work with a locator (its page range), is paywalled. Wording and arrangement were not compared with it or with [FormalProof].
- Headline 2.7a (iv) rests on AnalyticNumberTheoryPartI §0.34 on main (uniform exclusion of Landau–Siegel zeros), whose sources there are [109] and [110], both dated 2026.
