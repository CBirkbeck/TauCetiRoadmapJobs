# Review of TraceInequalitiesAndQuantumEntropy (pull request #2975 at db6ea07)

**Verdict:** needs changes

**Summary.** Changes are needed: five findings, all P2. Three are mathematical: the Petz–Rényi divergence target of 3.2 is false under the README's own convention `Real.log 0 = 0` when the two states have orthogonal supports; the proof route of the Fannes–Audenaert inequality in 4.2 asserts a false lower bound and does not cover `δ > 1 − 1/d`; and 2.4 calls the trace of the operator perspective the "standard" `f`-divergence, which is a different quantity. Two are about ownership: `Suggested.lean` restates four Tau Ceti definitions that import at the pin, and 5.1 plans compound matrices that PadicMeasuresIwasawaAlgebras, Section 6.4, already owns. There are three small corrections and three format notes; five of the seven cited books could not be read, which is reported to the human reviewers.

## R01 (P2) — The Petz–Rényi divergence target of 3.2 fails for states with orthogonal supports, because `log 0 = 0`

The bullet "Petz–Rényi divergences" (3.2, lines 392–394) says that `(α − 1)⁻¹ log Tr ρ^α σ^(1 − α)` does not increase under a channel for `α ∈ [0, 2] \ {1}` and density matrices, and the Conventions fix `Real.log 0 = 0` (line 90). An implementer who states this as written proves nothing: it is false.

Take `α = 1/2`, `ρ = diag(1, 0)`, `σ = diag(0, 1)` and the channel with Kraus operators `K₁ = e₁e₁ᴴ/√2`, `K₂ = e₂e₁ᴴ/√2`, `K₃ = e₂e₂ᴴ` (`∑ KⱼᴴKⱼ = 1`). Before the channel `Tr ρ^(1/2) σ^(1/2) = 0`, so the quantity is `−2 · log 0 = 0`. After it, `Φρ = diag(1/2, 1/2)`, `Φσ = diag(0, 1)`, `Tr (Φρ)^(1/2) (Φσ)^(1/2) = 2^(−1/2)`, and the quantity is `−2 · log 2^(−1/2) = log 2 ≈ 0.693 > 0`. The literature's value before the channel is `+∞`, which the real-valued formula loses. The two quasi-entropy headlines above the bullet are unaffected.

Smallest change: for `α ∈ (0, 1)` add the hypothesis `Tr ρ^α σ^(1 − α) > 0` (equivalently `ρσ ≠ 0`), or state the divergence in `EReal` with value `⊤` when the trace vanishes; and add the example above as a negative-control Check.

## R02 (P2) — The proof route of the Fannes–Audenaert inequality asserts a false bound and does not reach `δ > 1 − 1/d`

The route of 4.2 (lines 530–535) reduces to the classical bound at the sorted eigenvalue vectors, with classical distance `δ' ≤ δ`, and then says: "The right side is increasing in `δ` on `[0, 1 − 1/d]`, and for `δ ≥ 1 − 1/d` it is at least `log d ≥ |S(ρ) − S(σ)|`". The second clause is false: `g(δ) = δ log(d − 1) + h(δ)` has its maximum `log d` at `δ = 1 − 1/d` and decreases after it. At `d = 2`, `δ = 1` it is `0 < log 2`, a value the Check of the same section computes (line 544); at `d = 3`, `δ = 0.9` it is `0.949 < log 3 = 1.099`. So for `δ > 1 − 1/d` the route gives no bound, and `g(δ') ≤ g(δ)` can fail there.

The headline itself is true. The cited proof (Watrous, proof of Thm 5.26, pp. 273–274) uses both halves of Lemma 5.27: with `δ₁ = (1/2) ∑ₖ |λ↓ₖ(ρ) − λ↑ₖ(σ)|` one has `δ' ≤ δ ≤ δ₁`, the classical bound holds at `δ'` and at `δ₁` (the entropy does not see the order of the entries), and `g` is concave, so `g(δ) ≥ min(g(δ'), g(δ₁))`.

Smallest change: replace the last sentence of the route by this concavity argument. The upper bound `‖ρ − σ‖₁ ≤ ∑ₖ |λ↓ₖ(ρ) − λ↑ₖ(σ)|` is the right half of the two-sided gauge bound in Section 3.3 of the roadmap on eigenvalue and singular value inequalities, which is already the cited supplier section; the *Needs:* line can stay.

## R03 (P2) — The bullet on "standard `f`-divergences" in 2.4 states a property of the maximal `f`-divergence

The bullet (lines 328–330) reads "Joint convexity of standard `f`-divergences. For `f` operator convex on `(0, ∞)`, the trace of the operator perspective is jointly convex … on matrices this is 2.1 after taking traces". The trace of the operator perspective is the maximal `f`-divergence, as 2.1 itself says (line 231). The standard `f`-divergence is defined through the relative modular operator; on matrices it is `⟨σ^(1/2), f(L_ρ R_σ⁻¹) σ^(1/2)⟩`, and for `f(t) = t^α` it is `Tr ρ^α σ^(1 − α)` (Hiai, arXiv:1805.02050, Introduction, p. 3, and Section 2). The two differ off the commuting case: for `ρ = [[2, 1], [1, 1]]/3`, `σ = diag(1/4, 3/4)` and `f(t) = t log t` the standard divergence is `Tr ρ (log ρ − log σ) = 0.6388` and the trace of the perspective is `0.6850`; for `f(t) = t^(3/2)` they are `1.5031` and `1.5248`. So the target is named for one object and proved for another. Its locator, Thm 2.7 (ii) of Hiai's book, could not be read; in Hiai's paper the matching property (joint convexity and joint subadditivity, Section 4, item (ii)) is stated for the standard divergence, which is not the trace of the perspective. Scope item 2 (line 670) repeats the name.

Smallest change, either of two. Keep the statement and rename it to the maximal `f`-divergence, with a locator in Hiai's chapter on maximal divergences. Or keep the name and state the standard divergence: on matrices it is `⟨vec 1, opMean f (1 ⊗ σᵀ) (ρ ⊗ 1) vec 1⟩`, the perspective of 2.1 at the commuting pair `(ρ ⊗ 1, 1 ⊗ σᵀ)` in the vector `vec 1`, so joint convexity follows from 2.1 without a trace; the Petz–Rényi quasi-entropies of 3.2 are then its case `f(t) = t^α`.

## R04 (P2) — `Suggested.lean` restates four Tau Ceti definitions that import at the pin

`vonNeumannEntropy`, `relativeEntropy`, `partialTraceRight` and `partialTraceLeft` are declared as local copies (`Suggested.lean`, lines 77–114) on the ground that Tau Ceti's modules are "not built" at the pin (README lines 105–109, 686–688, 747–751; the module docstring, lines 26–31). They are built. At the pinned Tau Ceti (`2fd255d`), a file that adds `public import TauCeti.Analysis.Matrix.Entropy` and `public import TauCeti.LinearAlgebra.Matrix.Trace.Partial` to the three imports of `Suggested.lean` elaborates, and `#check` resolves `Matrix.vonNeumannEntropy`, `Matrix.relativeEntropy`, `Matrix.partialTraceRight`, `Matrix.partialTraceLeft`, `Matrix.PosSemidef.re_trace_sub_trace_le_relativeEntropy` (Klein) and `Matrix.PosSemidef.vonNeumannEntropy_le_partialTraceRight_add_partialTraceLeft` (subadditivity); the definitions are at `TauCeti/Analysis/Matrix/Entropy.lean` lines 88 and 134 and `TauCeti/LinearAlgebra/Matrix/Trace/Partial.lean` lines 51 and 153. As it stands, 16 of the 36 headlines are stated about copies, so proving them says nothing about the library's objects until someone also proves the copies equal, and the proof routes that call Tau Ceti's Klein and subadditivity do not apply to the copies as stated.

Smallest change: import the two modules, delete the four copies, write the statements with the `Matrix.*` names, and correct the sentences that say the modules are not built. The six copies from the open roadmap on operator monotone functions are a different case (a roadmap in a pull request cannot be imported) and I checked them verbatim against its `Suggested.lean`.

## R05 (P2) — Compound matrices already have an owner on main

Section 5.1 (lines 556–569) plans the `k`-th compound of a matrix, indexed by `k`-subsets with minors as entries, with `∧ᵏ(AB) = ∧ᵏA ∧ᵏB` by Cauchy–Binet and `∧ᵏ 1 = 1`; scope item 5 claims "Compound matrices over `ℂ`" and *Needs:* names only Mathlib. PadicMeasuresIwasawaAlgebras, Section 6.4 "Compound matrices and higher adjugates", on main, plans the same object over every commutative ring: `Matrix.compound` with entries `det A[S, T]`, `Matrix.compound_mul` (Cauchy–Binet), the unit rule `C_r(1) = 1`, and the identification with `exteriorPower.map` in the standard bases. Two roadmaps would build one definition and one theorem twice. The scope section mentions only the eigenvalue roadmap's real exterior powers (line 711).

Smallest change: in 5.1 cite PadicMeasuresIwasawaAlgebras, Section 6.4, for the definition, multiplicativity and the unit rule, add it to *Needs:* and to the supplier contracts, and keep here what is special to `ℂ`: `∧ᵏ(Aᴴ) = (∧ᵏA)ᴴ`, preservation of Hermitian, positive semidefinite and unitary matrices, the eigenvalues, and `∧ᵏ(A^s) = (∧ᵏA)^s`.

## C01 — The generalized Klein inequality is Proposition 8.3.5 in the versions of Tropp's monograph that can be read

1.2 (line 148) cites "Tropp, Prop 8.3.4, p. 182". In the arXiv version (1501.01571v1) and in the revised version on the author's page, 8.3.4 is the example that the trace exponential is monotone, and the generalized Klein inequality is Proposition 8.3.5 (printed p. 126 there; Prop 8.3.3 is on p. 125 and Def 8.6.1 with (8.6.1) on p. 134). I could not read the journal typesetting, whose pages 181, 182 and 194 the README uses; please check the number against it, and say under References which pagination is meant.

## C02 — The description says the Tau Ceti entropy modules are not built at the pin

The description says: "Tau Ceti's entropy, relative entropy, partial traces, Klein and subadditivity are in the pinned source but not built there; `Suggested.lean` keeps verbatim local copies of the four definitions." The modules import at the pin (R04). After the repair the sentence would read that they are consumed from `TauCeti.Analysis.Matrix.Entropy` and `TauCeti.LinearAlgebra.Matrix.Trace.Partial`, the import list gains those two modules, and the count of local definitions drops from ten to six. The phrase "standard `f`-divergence convexity" in the list of prose targets follows R03.

## C03 — The trace-one hypothesis of the mutual-information identity is not used

`relativeEntropy_kronecker_partialTrace` (3.4, line 448) assumes a density matrix, but `D(ρ ‖ ρ_A ⊗ ρ_B) = S(ρ_A) + S(ρ_B) − S(ρ)` holds for every positive semidefinite `ρ`: the support inclusion and `Tr ρ (log ρ_A ⊗ 1) = Tr ρ_A log ρ_A` do not see the trace. For `ρ = 1/2` on `ℂ² ⊗ ℂ²` both sides are `−2 log 2`. Since 2.4 and 3.1–3.2 are stated for unnormalized matrices, the hypothesis could be dropped here too, or the prose could say that it is kept only for the reading as mutual information.

## N01 — The two open supplier roadmaps are never named

The README refers to "the roadmap on operator monotone functions and matrix means" and "the roadmap on eigenvalue and singular value inequalities", and to each as "(open pull request)" in the supplier contracts (lines 759, 764). A reader cannot search for them. Name them, `OperatorMonotoneFunctionsAndMatrixMeans` and `EigenvalueAndSingularValueInequalities`, with the section, and drop the two parentheses.

## N02 — One line of `Suggested.lean` is over 100 characters

Line 412, the docstring of `re_trace_mul_pow_le`, has 101.

## N03 — The docstring of `holevo_bound` writes the measurement as `(μ_b)` while the binder is `M`

Line 344; the README writes `(M_b)`.

## Verified sound

| Statement | Instances tried | Values on each side | Result | Change |
|---|---|---|---|---|
| 1.1 monotone trace | `A = diag(−2,0) ≤ B = diag(−1,0)`, `f = x²`; empty `ι` | `4 > 1` (non-monotone `f` fails); `0 ≤ 0` | true | none |
| 1.1 Peierls | `A = [[0,1],[1,0]]`, standard basis, `f = ±x²` | `0 ≤ 2`; `0 > −2` | true | none |
| 1.1 convex trace | domain: Hermitian with spectrum in convex `I` | convex set, since `λmin` concave, `λmax` convex | true | none |
| 1.2 generalized Klein, derivative form | four pairs `(f,1),(1,−f),(−id,f′),(1,id·f′)` | sum `f(a) − f(h) − (a−h)f′(h) ≥ 0` | true | C01 locator |
| 1.2 equality case | `ρ = diag(1,0), σ = 1`; `ρ = 0`; `λ = 0 < μ` | `0 > −1`; `0 > −Tr σ`; `θ(0, μ) = μ > 0` | true both directions | R04 |
| 1.3 Gibbs, Peierls–Bogoliubov | `H = diag(0, log 2)`; `n = 1`; empty `ι` | `(2/3)log 2 + log 3 − (2/3)log 2 = log 3`; `p ≤ p`; `0/0 = 0 ≤ 0` | true | R04 |
| 2.1 EENG, positive maps | `D₀ = D₁ = 1` (converse); `Φ = Tr` on commuting pairs; `x³` on 10⁵ random `2 × 2` quadruples | reduces to matrix convexity; scalar Jensen; convexity gap has eigenvalue `−148` | true; `Kᵢ` satisfy `∑KᵢᴴKᵢ = 1` | none |
| 2.2 Lieb and Ando, tensor and trace | `p = q = 1`: `(0,0),(2,2)`; `α = 1/2`: `(1,4),(4,1)`; `p = 0` | `2 > 1`; `5/2 > 2`; `1 ⊗ B^q` concave | true; ranges sharp | none |
| 2.3 skew information | `p = 0` in both conventions | `0`; `Tr ρK(1−P)K ≥ 0` | true | none |
| 2.4 derivative, convexity, subadditivity | `ρ = diag(1,0), σ = 1/2` and reversed; `t = 0`; `k = 0` | `(1 − 2^(−ε))/ε → log 2`; `(1 − 2^(ε−1))/ε → ∞`; equality; `0 ≤ 0` | true | none |
| 2.4 `f`-divergence bullet | `ρ = [[2,1],[1,1]]/3`, `σ = diag(1/4,3/4)` | `t log t`: `0.6388` vs `0.6850`; `t^(3/2)`: `1.5031` vs `1.5248` | misnamed | R03 |
| 3.1 isometries, Kronecker | `ρ₁ = 0, ρ₂ = diag(1,0), σ₂ = diag(0,1)`; `⊤` cases | `0 = Tr ρ₂·0 + 0·⊤`; `⊤` matched with positive coefficient | true | R04 |
| 3.2 relative entropy, quasi-entropies, trace norm | `α = 0, 1`; `α = 3` on 10⁵ random channels; transpose | `Tr σ = Tr Φσ`; `17237 → 343963`; norm preserved | true; range sharp | none |
| 3.2 Rényi divergences | `α = 1/2`, orthogonal `ρ, σ`, three Kraus operators | `0` before, `log 2 = 0.693` after | false as written | R01 |
| 3.3 Pinsker | `ρ = diag(1,0), σ = 1/2`; `h → 0` | `1/2 ≤ 0.693`; ratio `→ 1` | true | R04 |
| 3.4 identity, monotonicity, Holevo | `ρ = 1/2` on `ℂ²⊗ℂ²`; `k = 1`; two orthogonal states | `−2 log 2` both sides; `0 ≤ 0`; `log 2 = log 2` | true | C03 |
| 4.1 purifications, halves, Araki–Lieb | `u = e₁⊗e₁, v = e₁⊗e₂`; `ρ = 10·(1/2 ⊗ diag(1,0))` | swap; `6.93 > −16.09` without trace one | true | R04 |
| 4.2 Audenaert, Fannes–Audenaert | `n = 1`; `ρ = diag(1,0), σ = 1/2`; `(d, δ) = (2, 1), (3, 0.9)` | `0 ≤ 0`; `log 2 = log 2`; `g = 0 < log 2`, `0.949 < 1.099` | headline true, route false | R02 |
| 5.1 compounds | owner search | PadicMeasuresIwasawaAlgebras §6.4: `Matrix.compound`, `compound_mul` | second owner | R05 |
| 5.2 Cordes | projections onto `e₁`, `(e₁+e₂)/√2`; `s = 0`; empty `ι` | `‖AB‖ = 1/√2`, `s = 2`: `0.707 > 0.5`; `1 ≤ 1`; `0 ≤ 1` | true | none |
| 5.3 Araki–Lieb–Thirring, Lieb–Thirring, power family | same projections; `m = 2`; `t = m/k, s = k` | `(1/2)^(st) ≤ (1/2)^s`; `1/4 ≤ 1/2`; reduces to (IX.13) form | true | none |

- Source locators checked against the text: 20 of Watrous (all correct: theorem numbers, printed pages, hypotheses); 4 of Tropp (one number differs, C01); Hiai's paper for the definition of the standard divergence.
- Library declarations opened at the pin: 17 (the eleven pinned by `#check`, and the four Tau Ceti definitions with Klein and subadditivity, files and lines in R04).
- Cross-roadmap citations resolved: 14 (OperatorAlgebraDynamics D9; PolarDecomposition PD-A52; RandomMatrices 2.6; CStarAlgebras 4.1–4.3; Subfactors 2.6; NoncommutativeIntegration 3.3; operator monotone functions 1.1, 2.2, 2.3, 2.6, 5.1, 5.4; eigenvalue inequalities 1.1, 3.3).
- Dependency check: `depcheck: 139 roadmaps, 1545 edges, 0 problem(s)`; no UPWARD or CYCLE line. The two open suppliers add new roadmap folders, which is permitted; the README does not name them (N01), so the check sees no edge to them.
- Elaboration of `Suggested.lean`: succeeds, `sorry` the only warning, 36 of them; the 46 elaborated signatures compared with the README, no lost binder, `log (n − 1)` and `log (card ι − 1)` are real subtractions.
- One-tactic probe (`rfl`, `simp_all`) on a copy: none of the 36 theorems closes.
- Headlines: all 36 Lean-named headlines are stated; the prose-only targets are named as such in the module docstring.
- Other changes of the pull request outside the folder: none.

Overlap check: read OperatorMonotoneFunctionsAndMatrixMeans, EigenvalueAndSingularValueInequalities, OperatorAlgebraDynamics, Subfactors, EntropyAndSourceCoding, and searched RateDistortionTheory and DifferentialEntropyAndEntropyPower; nothing shared with them (trace inequalities and Araki–Lieb–Thirring are listed as beyond scope by the first two; partial-trace monotonicity and strong subadditivity stay with OperatorAlgebraDynamics). One shared object outside the lists: compound matrices, owner PadicMeasuresIwasawaAlgebras §6.4 (R05).

Source independence: 12 passages compared with 3 sources (Watrous, Tropp, Hiai's paper), none shared beyond formulas; largest share Watrous, 20 of 68 locators; contents compared with Watrous: independent (Layer 3 draws on its 5.2.3, 3.3 and 5.3.3, Layer 4 on its 2.1, 5.1.2 and 5.2.2, in another order). Not read: Bhatia, Simon, Bratteli–Robinson, Bengtsson–Życzkowski, Hiai's book.

Research link: Layers 2–3 are the convexity and monotonicity theorems (Lieb, Ando, data processing) that the README's closing section names as the inputs to Petz recovery, the Fawzi–Renner bounds and the multivariate trace inequalities of Sutter, Berta and Tomamichel; Hiai (2018) extends the divergence theory to von Neumann algebras. Rests on the README and on Hiai's paper.

## Not verifiable

- Bhatia, *Matrix Analysis* (16 locators): paywalled; no legal copy found through the sources service.
- Simon, *Loewner's Theorem on Monotone Matrix Functions* (12 locators): paywalled.
- Hiai, *Quantum f-Divergences in von Neumann Algebras* (8 locators, Thm 2.7, 3.2, 4.4): no legal copy; only the arXiv paper 1805.02050, whose numbering differs, was read.
- Bengtsson–Życzkowski (5 locators): the publisher's page timed out; no open copy.
- Bratteli–Robinson (3 locators): paywalled; the address tried on an author's page returned 404.
- Tropp, journal pagination (pp. 181, 182, 194): only the arXiv and author-page versions were read.

Automatic checks set aside as false positives: the section comment "Supplier names cited in the README" in `Suggested.lean` was reported as heading no declaration; it heads the eleven `#check` lines that pin library names, which is the permitted use.

## Source issues

- none

## For the human reviewers

- **Not tested.** Five of the seven cited books (Bhatia, Simon, Hiai, Bengtsson–Życzkowski, Bratteli–Robinson; 44 of 68 locators) could not be read legally, so wording and locators were not compared against them. Watrous, the largest share, was read in full at its locators.
- **Licence.** Watrous was read from the author's own page and Tropp from arXiv and the author's page; nothing from either is reused beyond statements and locators.
