# Review of TraceInequalitiesAndQuantumEntropy (pull request #2975 at 121a07a)

**Verdict:** accepted

**Summary.** Accepted: no finding. The five findings of the previous review are repaired, every stated inequality survived the degenerate cases and a numerical test on random matrices (singular arguments and the boundary exponents included), and `Suggested.lean` elaborates with `sorry` as its only warning. There are three small corrections (a Mathlib lemma named for square matrices where the rectangular one is used, a supplier section cited for a statement made one section earlier, an unused trace hypothesis) and three format notes, none blocking. Five of the seven cited books could not be read, which is reported to the human reviewers.

## C01 — The equal-spectra step of 4.1 names the square-matrix lemma, but `X` is rectangular

The route of 4.1 (line 521) proves that `X Xᴴ` and `Xᴴ X` have the same nonzero eigenvalues by "Mathlib's `Matrix.charpoly_mul_comm` up to powers of the variable", for `X : Matrix ι κ ℂ`. At the pin `Matrix.charpoly_mul_comm` takes `A B : Matrix n n R` and has no power of the variable (`Mathlib/LinearAlgebra/Matrix/Charpoly/Basic.lean`, line 279), so it does not apply when `ι` and `κ` differ. The statement the route describes is `Matrix.charpoly_mul_comm'` (same file, line 249): `X ^ card n * (A * B).charpoly = X ^ card m * (B * A).charpoly` for `A : Matrix m n R`, `B : Matrix n m R`. Name that lemma in 4.1, in the Mathlib contract (line 758) and in the `#check` list.

## C02 — Operator concavity of `t^r` is cited to Section 2.6 of OperatorMonotoneFunctionsAndMatrixMeans, which does not state it

The route of 2.2 uses "the operator convex `-t^p`" and says "`X ↦ X^r` is operator monotone and operator concave (Section 2.6 there)" (line 283); the *Needs:* line names Section 2.6 only. Section 2.6 of that roadmap gives the monotone range `0 ≤ r ≤ 1` and the convex range `[-1, 0] ∪ [1, 2]` of `t^r`; it says nothing about concavity. Concavity of `t^r` for `0 ≤ r ≤ 1` follows from its Section 2.4 (a continuous nonnegative function on `[0, ∞)` is operator monotone iff operator concave). Add Section 2.4 to the route, to the *Needs:* line of 2.2, to the Dependencies of Layer 2, to the supplier contract and to the supplier list of the description.

## C03 — The trace-one hypothesis of `mutualInformation_kraus_le` is not used

The Lean statement assumes `ρ.trace = 1`. The route applies 3.2 and the identity `relativeEntropy_kronecker_partialTrace`, both now stated for every positive semidefinite matrix, and the local channel preserves both reductions' traces, so the inequality holds without normalization. The hypothesis could be dropped as it was for the identity, or the prose could say it is kept for the reading as mutual information of a state.

## N01 — The module docstring does not name the headlines that are not statable at the pins

Two prose-only targets lack a carrier in the pinned libraries: the complex compound calculus of 5.1 (no `Matrix.compound` in Mathlib or Tau Ceti at the pin) and Araki's log-majorization of 5.3 (no weak log-majorization predicate). The docstring could name these two and what each lacks; the other prose-only targets are corollaries of stated ones.

## N02 — Sentences about "Tau Ceti beyond the pin" will go out of date

Scope and ownership (lines 717–721, 727–728) and Prior formalization (lines 825–828) list what Tau Ceti proves after the pin. These describe a moment, not the roadmap; saying only that these results are not targets here, with their owner, would stay true.

## N03 — Tropp's generalized Klein inequality has another number in the open version

The README uses the journal edition (Prop 8.3.4, p. 182). In the arXiv version (1501.01571v1) Example 8.3.4 is the monotonicity of the trace exponential and the generalized Klein inequality is Proposition 8.3.5, p. 126. A parenthesis giving the arXiv number would help a reader who has only that version.

## Verified sound

| Statement | Instances tried | Values on each side | Result | Change |
|---|---|---|---|---|
| 1.1 monotone, Peierls, convex trace | `diag(-2,0) ≤ diag(-1,0)`, `x²`; `[[0,1],[1,0]]`, `±x²`; 3000 random with `exp` | `4 > 1`; `0 ≤ 2`, `0 > -2`; minimum slack `≥ -3e-14` | true | none |
| 1.2 generalized Klein, derivative form | four pairs `(f,1),(1,-f),(-id,f'),(1,id·f')` | sum is `f(a) - f(h) - (a-h)f'(h) ≥ 0`; random slack `≥ 4.6e-7` | true | N03 |
| 1.2 equality case | `ρ=diag(1,0), σ=1`; `ρ=0`; `λ=0<μ`; kernel failure | `0 > -1`; `0 = -Tr σ` iff `σ=0`; `θ(0,μ)=μ>0`; `⊤ ≠` real | iff holds both ways | none |
| 1.3 Gibbs, Peierls–Bogoliubov | `H=diag(0,log 2)`; `n=1`; empty index | `(2/3)log 2 + log 3 - (2/3)log 2 = log 3`; `p ≤ p`; `0/0 = 0 ≤ 0` | true | none |
| 2.1 EENG, positive maps | `D₀=D₁=1`; `Kᵢ=(θᵢDᵢ)^(1/2)D^(-1/2)`; `x³`; transpose-composed maps, four `f` | `opMean f 1 C = f(C)`; `∑KᵢᴴKᵢ = 1`; min eigenvalue `-600`; slack `≥ -1e-11` | true, sharp | none |
| 2.2 Lieb, Ando, tensor and trace | `p=q=1`; `α=1/2`; `p=0`, singular `A`; rectangular `K` | `2 > 1`; `5/2 > 2`; `1⊗B^q` concave; random min eigenvalue `≥ 2e-7` | true | C02 |
| 2.3 skew information | `p=0,1`; singular `ρ`; random | `0`; AM–GM sum equals `Tr ρK²`; slack `≥ -2e-13` | true | none |
| 2.4 derivative, convexity, subadditivity | `ρ=diag(1,0), σ=1/2` and reversed; `k=0`; `t=1` with `⊤` | `(1-2^(-ε))/ε → log 2`; `(1-2^(ε-1))/ε → ∞`; `0 ≤ 0`; `0·⊤ = 0` | true | none |
| 2.4 maximal against standard divergence | `ρ=[[2,1],[1,1]]/3`, `σ=diag(1/4,3/4)` | `0.68504` vs `0.63883`; `1.52480` vs `1.50307` | Check true | none |
| 3.1 isometries, Kronecker | `ρ₁=0`; `D(ρ₁‖σ₁)=⊤` with `ρ₂≠0`; random | `0 = Tr ρ₂·0 + 0·⊤`; `⊤ = ⊤ +` finite; difference `≤ 1e-11` | true | none |
| 3.2 relative entropy, quasi-entropies, trace norm | `α=0,1`; `α=3`; transpose then channel; `r=0` | `Tr σ = Tr Φσ`; `123.5 → 308.5`; slack `≥ -3e-15`; forces empty index | true, range sharp | none |
| 3.2 Rényi divergences | `α=1/2`, `diag(1,0)`, `diag(0,1)`, three Kraus operators | `∑KᴴK=1`; trace `0` before, `2^(-1/2)` after; excluded by the new hypothesis | true as restated | none |
| 3.3 Pinsker | `ρ=diag(1,0), σ=1/2`; random densities | `1/2 ≤ 0.693`; constant `1` fails; slack `≥ -1e-16` | true | none |
| 3.4 identity, monotonicity, Holevo | `ρ=1/2` on `ℂ²⊗ℂ²`; `k=1`; two orthogonal states; random | `-2 log 2` both sides; `0 ≤ 0`; `log 2 = log 2`; slack `≥ -3e-15` | true | C03 |
| 4.1 purifications, halves, Araki–Lieb | `vec X`; `e₁⊗e₁`, `e₁⊗e₂`; `10·(1/2 ⊗ diag(1,0))` | `Tr_B = XXᴴ`, `Tr_A = (XᴴX)ᵀ`; swap; `6.93 > -16.09` | true | C01 |
| 4.2 Audenaert, Fannes–Audenaert | `n=1`; `ρ=diag(1,0), σ=1/2`; `g(1)`; random | `0 ≤ 0`; `log 2 = log 2`; `log(d-1) < log d`; slack `≥ -1e-16` | true; route now uses concavity | none |
| 5.1 compounds over `ℂ` | `s=0`, singular `A`; negative `s` | `∧ᵏ1 = 1 = (∧ᵏA)^0`; `0 = 0^s` | true | N01 |
| 5.2 Cordes | projections onto `e₁`, `(e₁+e₂)/√2`; `s=0`; empty index | `‖AB‖ = 0.707`, `s=2`: `0.707 > 0.5`; `1 ≤ 1`; `0 ≤ 1` | true | none |
| 5.3 Araki–Lieb–Thirring, reversal, Lieb–Thirring, power family | same projections; `m=0,2`; random `s ≤ 3`, `t ≤ 4` | `(1/2)^(st) ≤ (1/2)^s`; `Tr 1 ≤ Tr 1`, `1/4 ≤ 1/2`; slack `≥ -4e-15` | true | none |

Earlier findings: R01 repaired (hypothesis `Tr ρ^α σ^(1 − α) > 0` and a negative-control Check); R02 repaired (concavity of `g` between `δ₀` and `δ₁`); R03 repaired (the bullet is the maximal `f`-divergence, with a Check separating the two); R04 repaired (the four Tau Ceti definitions are imported); R05 repaired (5.1 consumes PadicMeasuresIwasawaAlgebras, Section 6.4); C02, C03, N01–N03 applied; C01 answered by fixing the edition (N03 above).

- Source locators checked against the text: 21 of Watrous (theorem numbers, printed pages, hypotheses, all correct); 3 of Tropp in the arXiv version (statements agree, one number differs, N03); Hiai's paper arXiv:1805.02050 for the Rényi monotonicity range `[0, 2]` under Schwarz maps.
- Library declarations opened at the pin: the 20 pinned by `#check`, `Matrix.relativeEntropy` (`TauCeti/Analysis/Matrix/Entropy.lean`, line 134), `Matrix.vonNeumannEntropy` (line 88), `Matrix.charpoly_mul_comm'`; no trace, perspective or product inequality of the roadmap exists at the pin.
- Cross-roadmap citations resolved: 17 (OperatorAlgebraDynamics D9; PolarDecomposition PD-A52; PadicMeasuresIwasawaAlgebras 6.4; RandomMatrices 2.6; CStarAlgebras 4.1–4.3; Subfactors 2.6; NoncommutativeIntegration 3.3; OperatorMonotoneFunctionsAndMatrixMeans 1.1, 2.2, 2.3, 2.6, 5.1, 5.4; EigenvalueAndSingularValueInequalities 1.1, 2.4, 3.3). The six local definitions agree verbatim with their owner's.
- Dependency check: `depcheck: 136 roadmaps, 1514 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration of `Suggested.lean`: exit 0, 36 `sorry` warnings and nothing else; the 36 elaborated signatures were compared with the README, no binder lost, `log (↑n - 1)` and `log (↑(card ι) - 1)` are real subtractions.
- One-tactic probe (`simp`, `rfl`) on a copy: none of the 36 theorems closes.
- Headlines: every headline of the summary that is statable at the pins is stated; changes outside the folder: none; the description agrees with the head.

Overlap check: read OperatorMonotoneFunctionsAndMatrixMeans, EigenvalueAndSingularValueInequalities, OperatorAlgebraDynamics, Subfactors, and searched RateDistortionTheory, DifferentialEntropyAndEntropyPower and EntropyAndSourceCoding with every other roadmap for the objects of the five layers; nothing shared. Compound matrices: owner PadicMeasuresIwasawaAlgebras, consumed; partial-trace monotonicity: owner OperatorAlgebraDynamics, consumed.

Source independence: 12 passages compared with 3 sources (Watrous, Tropp, Hiai's paper), none shared beyond formulas; largest share Watrous, 21 of about 74 locators; contents compared with Watrous: independent (Layer 3 draws on its 5.2.3, 3.3 and 5.3.3, Layer 4 on its 2.1, 5.1.2 and 5.2.2, in another order; Layers 1, 2 and 5 are not in it). Not read: Bhatia, Simon, Bratteli–Robinson, Bengtsson–Życzkowski, Hiai's book.

Research link: Layers 2–3 are the Lieb, Ando and data-processing theorems that the README's closing section names as inputs to Petz recovery, the Fawzi–Renner bounds and the multivariate trace inequalities of Sutter, Berta and Tomamichel; Hiai (2018) extends the divergence theory to von Neumann algebras. Rests on the README and on Hiai's paper.

## Not verifiable

- Bhatia, *Matrix Analysis* (about 19 locators): paywalled; no legal copy.
- Simon, *Loewner's Theorem on Monotone Matrix Functions* (about 12 locators): paywalled.
- Hiai, *Quantum f-Divergences in von Neumann Algebras* (Def 3.1, Thm 3.2 (8), (4.2), Thm 4.4): no legal copy; the arXiv paper has the Rényi monotonicity as item (9) of its own list.
- Bengtsson–Życzkowski (6 locators): the publisher's page is not an open source; no open copy.
- Bratteli–Robinson (Lemma 6.2.21, Prop 6.2.22, p. 278): paywalled.
- Tropp, journal numbering and pages 181, 182, 194: only the arXiv version was read.
- What Tau Ceti proves after the pin (Scope, Prior formalization): only the pin was read, where none of it exists.

Automatic checks set aside as false positives: the section comment "Supplier names cited in the README" in `Suggested.lean` was reported as heading no declaration; it heads the twenty `#check` lines that pin library names, which is the permitted use.

## Source issues

- none

## For the human reviewers

- **Not tested.** Five of the seven cited books (Bhatia, Simon, Hiai, Bengtsson–Życzkowski, Bratteli–Robinson; about 49 of 74 locators) could not be read legally; wording and locators were not compared with them. Watrous, the largest share, was read at every locator.
- **Licence.** Watrous was read from the author's own page, Tropp and Hiai's paper from arXiv; nothing is reused beyond statements and locators.
