# Review of QuadraticTwistSelectionOverPrimes (pull request #2878 at e73c24f)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/QuadraticTwistSelectionOverPrimes/`
**Verdict:** needs changes

**Summary.** The adversarial pass found no mathematical error. The identities, Checks and worked example of 2.7a–2.7d hold when recomputed, and the three Lean headlines say what the README says, given the supplier sections they cite. The one finding is that no target has a source locator: the formal proof named as the source of 2.7b–2.7d is cited only as a repository, so none of the sampled targets can be checked against it. There are four small corrections and two format notes, none blocking. The scope (an unrefereed formal proof announced on 20 November 2026) and the unreadable main source are left to the human reviewers.

## R01 (P2) — No target in 2.7a–2.7d has a source locator, so the claim that the formal proof establishes them cannot be checked

A reader or implementer cannot find where any source proves these statements with these exact hypotheses and constants. These include the width bound `δ₀ < 1/12`, the exponents `b < 1/4` and `a < 1/2`, and the constant `(2 + ε)/δ₀` in (b). A referee cannot confirm that the source states them as written.

None of 2.7a (i)–(iv), 2.7b (i)–(iv), 2.7c and 2.7d (i)–(ii) carries a locator. The References (lines 374–376) give Gallagher (1970) without theorem or page, and the announcement without a section. They give [FormalProof] as a repository URL with no commit, file or declaration, and line 375 says it "is the source of the twist-selection theorem (2.7b–2.7d) and its route". The orthogonality statements 2.7a (iii)–(iv) cite no source at all beyond their supplier inputs. The Summary (line 5) and the Scope (line 352) call 2.7a (iii) "the published form" without naming a publication.

The smallest repair is to add a locator after each target: the file and declaration name in the formal proof at a fixed commit, and the section or page of the announcement where it states the result. For the standard facts 2.7a (i)–(ii) (reciprocity, Chinese remainder theorem), a textbook locator is enough. Either name the publication meant by "the published form", or write "the form with the exceptional term".

## C01 — The Riesz remainder `G_χ` belongs to RiemannHypothesisStatementsAndConsequences §8.4a (b), which this README does not cite

RiemannHypothesisStatementsAndConsequences §8.4a (b), at the head of its open pull request, defines the remainder of a primitive character. Its formula is `Σ_{n≤y} Λ(n)χ(n)(y/n − 1) + y·(L′/L)(1, χ)` for `χ ≠ 1`, the same object as `G_χ` in the Conventions here (lines 16–22) and `rieszRemainder` in `Suggested.lean` (lines 45–50). Its list of downstream consumers names this roadmap as taking that remainder. This README never mentions that roadmap, so an implementer of 2.7c would define the remainder a second time. Cite §8.4a (b) for `G_χ` in the Conventions and add it under the supplier contracts. The local `rieszRemainder` can stay, since the Lean file cannot import an open roadmap, and its docstring could say that it is that definition, restated at the pin.

## C02 — ThetaChainsAndFrobeniusPrimeSums, named as the consumer of 2.7c–2.7d, exists neither on main nor in any open pull request

The Summary links `../ThetaChainsAndFrobeniusPrimeSums/README.md` (line 7). Downstream consumers cites "ThetaChainsAndFrobeniusPrimeSums §10.7" (line 344), and the Scope repeats the use (line 352). A reader who follows the link or looks up the section finds nothing. Cite that roadmap by name only, as the member the family index plans, without the link and the section number. Or add the link and section once that roadmap is opened.

## C03 — The docstring of the two-step headline promises the `C₂` of 2.7c, but the Lean statement chooses its own

The docstring of `twistSelection_two_of_conductorBound` says that `C₂` is the one from 2.7c (line 118), and 2.7d (i) fixes its constants "as in 2.7c". The statement, however, opens with its own `∃ C₂ : ℝ → ℝ` (line 129), unrelated to the one in `twistSelection`. As written, the formal statement is weaker than its docstring. Either write "for some `C₂` depending only on `(δ₀, ε)`" in the docstring, or state the two headlines in one theorem that shares `C₂`.

## C04 — Two sentences of the description do not describe this head

The description says that the docstring of `Suggested.lean` "says which other headlines are not statable and which carriers they lack". The module docstring (lines 7–8) says that all three headlines are statable and stated. It also says that every automatic check passes except the one requiring a pull request to change nothing outside its own roadmap folder, which flags the three files of the family index. At this head every automatic check passes: the family index belongs to this pull request, so its three files are no change outside the pull request's own folders. Would read: "its docstring says that all three headlines are statable at the pins and are stated", and "Validation at this head: every automatic check passes; …".

## N01 — The borrowed numbering puts two unrelated "§2.7"s side by side

The single layer is numbered 2 and its sections 2.7a–2.7d "follow that layer's numbering" of SieveMethodsAndPrimePatterns (line 350). The Scope paragraph (line 352) therefore sets "SieveMethodsAndPrimePatterns §2.7" beside this roadmap's 2.7a–2.7d, which cover a different subject. One clause saying that the ids are this roadmap's own would help. Two roadmaps of the family already cite them.

## N02 — In the first Check of 2.7a (iii) (line 121), the sign `ε` is not the `ε` of 2.7a (i)

It is the value of `χ₁` on the class that is `a₀` modulo `m₀` and `1` modulo `s`, so the surviving term is `−χ₁(a₀′) Li(U^(β₁))/φ(m₀)` for that lift `a₀′`. Would name it.

## Questions for the author

- Are the ids "Layer 2" and 2.7a–2.7d the numbering of the announcement or of the formal proof? If so, the layer would reproduce a source's arrangement. Neither text could be read through a legal source, and SieveMethodsAndPrimePatterns §2.7 has no subsections a–d, so I could not tell where the numbering comes from.

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| 2.7a (i) reciprocity on a class | m₀=8, a₀=3: n=3,q=11; n=6,q=11,19; m₀=24, a₀=11, n=3 | (3/11)=1=−(11/3); (6/11)=−1=1·(11/3); (6/19)=1=(19/3); (3/11)=(3/59)=1 with s=1 | holds | none |
| 2.7a (ii) nontriviality on class of 1 | s=15, m₀=8, u≡41 mod 120 | (41/15)=(2/3)(1/5)=−1, so (·/15) is nontrivial on u≡1 (8) | holds | none |
| 2.7a (iii) cancellation over classes b mod m₀s | CRT b↔(a₀, t mod s) | Σ_t (t/s)=0; Σ_b (b/s)χ₁(b)=±φ(s) iff χ₁'s s-part is (·/s); survivor Li(U^β₁)/φ(m₀) | holds | N02 |
| 2.7a (iii) Page step | log(N₁N₂) ≤ 2 log(m₀Y^A) | need c₀/log(m₀Y^A) ≤ 3c_star/log(N₁N₂): holds iff c₀ ≤ 3c_star/2, as stated | holds | none |
| Li(U^β) ≤ 3U^(β−1) Li U (Check) | β=1, β=1/2 | limit ratio 1/β: 1 and 2, both < 3; any constant below 2 fails at β=1/2 | holds | none |
| Headline (1) `abs_sum_jacobiSym_primes_le` | m₀=0; s=9; s=3, m₀=24; m₀=8, a₀=3, U=121, s=3 | m₀=0: Coprime s 0 forces s=1, vacuous; s=9: Σ=#P; s∣m₀: abs Σ=#P; P={19,43,59,67,83,107}, Σ(q/3)=0 | each hypothesis needed; consistent | none |
| (1), bound on #P | π(U)−π(√U) vs RieszSums 1.7b (iv) | relative error ≤1/3 at larger L absorbs π(√U;a₀,m₀) ≤ √U/m₀+1 | holds with larger L | none |
| 2.7b (i) mean-square inequality | c=1_{n=p}, κ=1; m₀=8, n=9, n′=2; η=1 | LHS=#P, RHS ≥ #P; s₈(18)=1; RHS ≥ #P(Σc)² ≥ LHS | holds | none |
| 2.7b (i), pairs with s=s* | n=p^k, n′=p′^k′ | r prime: ≤ B²+2B·RR; r=pp′: ≤ 2B²; both ≤ 2B²+2B·RR | holds | none |
| 2.7b (ii) mean square | sP(p), p≤y and p>y | ≤ log y+2 log p ≤ 3 log y; ≤ 2y log p/p ≤ 2 log y; RR² ≪ y+y^(2a)log²y ≪_a y log y | holds, C=C(a) | none |
| 2.7b (iii) window passage | block [Y′, 2Y′]; bump Check | Σ‖f‖² ≤ 4MY′log(2Y′)#P; Markov 16M log(2Y′)Y′^(−2τ)#P; bumps need n ≥ 2^(1+2τ)Y^(2τ)/(M log Y) | holds | none |
| 2.7b (iv) primitive form | min(1,y/n)−min(1,Y/n) | equals ∫_Y^y 1_{v<n} dv/n; v·D_q(v)=S_Z(v;q,κ·1_(v,∞)) | holds | none |
| G_χ = −S_Z − xT_Z (2.7c) | x ≤ Z | expansion gives Σ_{n≤x}Λχ(x/n−1)+x·L′/L(1,χ) exactly | holds | none |
| Headline (2) `twistSelection` | δ₀ edge; Ξ=∅; ξ trivial mod 1; uniqueness of χ | (3/2)·8·δ₀<1 iff δ₀<1/12; G=P; (·/q) has conductor q>1, never ζ; nonzero RHS forces primes(M) ⊆ primes(N_i q) | holds; χ unique | none |
| 2.7c constraint on b (Check) | τ=1/10 | b<0.3: 2·0.299=0.598<0.6; 2·0.301=0.602>0.6 | holds | none |
| 2.7c reduction to 8∣m₀ | m₀ odd; m₀≡2 mod 4 | 8m₀: 4 odd classes above a₀; 4m₀: 4 classes; log m₀′ ≤ log m₀+3 | holds | none |
| Headline (3) `twistSelection_two_of_conductorBound` | k=0 twist; C₂ | k=0: χ forced to be prim(ξ·(·/d)) despite coprimality to N_i·q·d; C₂ separately existential | holds; C₂ weaker than docstring | C03 |
| 2.7d worked example | z ≥ 8C₁, log Y ≥ 8C₁ | log m₂(q) ≤ 2.77+2.39z ≤ 4z (z ≥ 1.71); C₁ log Y(4z+log Y) ≤ z(log Y)²; count π(z) ≤ Y^(1/4) | holds | none |
| `primesInClass` | m₀=8, a₀=3, U=121 | {19,43,59,67,83,107}; inclusive √U ≤ q would add 11 | definition right | none |
| `rieszRemainder` vs RHSAC §8.4a (b) | nonprincipal primitive χ | both Σ_{n≤y}Λ(n)χ(n)(y/n−1)+y·L′/L(1,χ) | same object, uncited | C01 |
| `TwistBounds` (b) | H=FU ≥ 4 | log log 4 ≈ 0.327 > 0; L(1,χ) ≠ 0 for χ ≠ 1 | well defined | none |
| Consumer ThetaChainsAndFrobeniusPrimeSums §10.7 | main and 494 open heads | not found | dangling | C02 |

- Source locators checked against the text: 0. The README gives none, and none of its 3 references is legally readable (2 unclassified hosts, 1 paywalled).
- Library declarations opened at the pins: 11 (`jacobiSym.quadratic_reciprocity` JacobiSymbol.lean:423, `jacobiSym.at_two` :321, `ZMod.χ₈` ZModChar.lean:118, `ZMod.chineseRemainder` Data/ZMod/Basic.lean:889, `legendreSym.eq_neg_one_iff` LegendreSymbol/Basic.lean:190, `Chebyshev.psi_le_const_mul_self` Chebyshev.lean:485, `MeasureTheory.integral_mul_le_Lp_mul_Lq_of_nonneg` Bochner/Basic.lean:1232, `DirichletCharacter.LFunction_apply_one_ne_zero` Nonvanishing.lean:412, `DirichletCharacter.IsPrimitive` DirichletCharacter/Basic.lean:291, `DirichletCharacter.LFunction` DirichletContinuation.lean:60, `TauCeti.Real.logIntegral` LogIntegral.lean:141).
- Cross-roadmap citations resolved: 16 of 17 (AnalyticNumberTheoryPartI §§0.2, 0.11, 0.12, 0.17, 0.34, 0.34a, 1.7 on main; RieszSumsOverPrimesAndExceptionalZeros §§1.4e and its corollary, 1.4f, the 1.7b convention, 1.7b (ii), (iv) at head 370c7ee; SieveMethodsAndPrimePatterns §2.7, Layer 3 `li`, `π(x;q,a)` on main). ThetaChainsAndFrobeniusPrimeSums §10.7 is not found.
- Dependency check: `depcheck: 171 roadmaps, 1989 edges, 0 problem(s)`. No UPWARD or CYCLE line.
- Automatic checks: all passed. The change outside the folder is only the family index, which is this pull request's own.
- Elaboration: `lake env lean` on `Suggested.lean` gives only three `sorry` warnings (lines 81, 102, 128). A `#check @` probe of the four definitions matches the README signatures, and no binder is lost.
- One-tactic probe, by reading: none of the three headlines closes with one tactic (each needs zero-density or prime-number-theorem input). No padding.
- Ownership against open pull requests: checked by searching every open head and main for the objects (twist selection, the set P, the remainder G_χ, the selection hypotheses).

Overlap check: read RieszSumsOverPrimesAndExceptionalZeros, GeneralizedRiemannHypothesisFromWindowBounds, QuasiRiemannHypothesis and ErdosProgressionPowers (open, by vocabulary), and SieveMethodsAndPrimePatterns, AnalyticNumberTheoryPartI and ExplicitPrimeCounting (on main, by vocabulary); the list by results was empty. Shared objects: the Riesz remainder `G_χ`, whose owner is RiemannHypothesisStatementsAndConsequences §8.4a (b) (found by object; C01); the zero-box and Linnik-range inputs, owned by RieszSumsOverPrimesAndExceptionalZeros and cited; the Mertens, Page, Landau–Siegel exclusion and zero-density inputs, owned by AnalyticNumberTheoryPartI and cited; the quadratic large sieve, owned by SieveMethodsAndPrimePatterns §2.7 and not restated.

Source independence: 0 passages compared with 0 sources. No cited text is legally readable: [FormalProof] and [Announcement] are on unclassified hosts and Gallagher 1970 is paywalled. The README carries no source locators, so no source has a share, and the contents were not compared. The order 2.7a → 2.7d is forced by the *Needs:* lines (2.7b (ii) needs 2.7a (iii); 2.7c needs 2.7b (iv); 2.7d needs 2.7c).

Research link: Layer 2 supplies the auxiliary primes for the announced 2026 Lean proof of the Riemann hypothesis for Dirichlet L-functions ([FormalProof], [Announcement]). Its inputs are Gallagher's (1970) prime number theorem in Linnik's range and Jutila's (1977) log-free zero density through AnalyticNumberTheoryPartI §1.7. This rests on the README; no source was read.

## Not verifiable

- [FormalProof], the repository at github.com/leanprover-community/riemann-hypothesis: its host is in no licence class of the legal-source service; it was not read.
- [Announcement] at alpo.ge: its host is in no licence class; it was not read.
- Gallagher, Invent. Math. 11 (1970): the DOI resolves only to a paywalled publisher, so it is uncertified; it is cited without a locator.
- The seeded sample 2.7a–2.7d against its source: there are no locators, and the named source is unreadable.

## Source issues

- none

## For the human reviewers

- Scope: the only named source for 2.7b–2.7d is [FormalProof], a Lean repository whose proof was announced on 20 November 2026 ([Announcement]). No refereed publication of these theorems is cited (README lines 374–376).
- Licence and not tested: neither [FormalProof] (github.com) nor [Announcement] (alpo.ge) is on a classified host. The repository's licence was not read, and wording and arrangement were not compared with either text.
- Headline (1) (2.7a (iv)) rests on AnalyticNumberTheoryPartI §0.34 on main (uniform exclusion of Landau–Siegel zeros), whose sources there are a 2026 release [109] and a 2026 preprint [110].
