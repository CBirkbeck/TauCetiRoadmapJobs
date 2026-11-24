# Review of TensorInductionAndFiniteGroupInputs (pull request #3027 at 3bddf73)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/TensorInductionAndFiniteGroupInputs/`
**Verdict:** accepted

**Summary.** A review of the change against `main`: 119 changed lines since `b8f3652`. The change adds `*Origin:*`, `*Method of the formal proof:*` and `*Corollary of:*` labels to 6.1, 6.2, 7.1 and 9.1 and moves ownership of three groups of statements to the general roadmaps. Each new *Corollary of:* line names a section that does state the general theorem, with the same conventions: SchurWeyl §8.4 for 7.1 on `GL_n(ℂ) × GL_m(ℂ)`, ClassicalGroups §6.6b for 9.1 (a), (c), (d), and InductionRestriction §5.3 for the induced-character clause of 6.2 (a). The new Molev locators check out, and the alternative proof routes in the *Method* labels are correct mathematics. There are no findings, two small corrections and one format note, none of them blocking. The human reviewers are asked only about sources that could not be read and about the licence of the formal proof.

## C01 — Three of the new *Origin* attributions have no locator a reader can open

A reader who wants to check where 6.2 (a) and 9.1 come from cannot find the cited results.

- The 6.2 *Origin* (line 127) and the reference entry (line 519) cite Isaacs (1976) for "Clifford theory over a cyclic quotient" without a result number.
- The 9.1 *Origin* (line 302) and the reference entry (line 516) cite Molev (2007) for (a), (b), (d) and (e) by "chapter 1" only.
- The 9.1 *Origin* attributes "its value on a highest weight vector" in (c) to these works, but the Molev (2003) entry (line 515) lists no locator for it. The value is in Molev (2003) §4.1, formula (4.1): the Harish-Chandra image `(u + l_1)⋯(u + l_n)`, `l_i = λ_i − i + 1`, of the Capelli determinant, which is `qdet(u)` here.

Fixes:

- Add `§4.1, formula (4.1)` to the Molev (2003) entry for 9.1 (c).
- Give the result numbers in Isaacs. As we recall, they are Corollary 11.22 (an invariant character extends over a cyclic quotient) and Corollary 6.17 (Gallagher's count); we could not open the book.
- Give the section numbers of Molev (2007) for each clause.

## C02 — The description's list of corrected attributions leaves out the one this change makes in 7.1

On `main`, 7.1 said that the joint highest weight line `Δ_λ` "is this roadmap's". The head says instead (lines 269–277) that `Δ_λ` is in [FormalProof] as lemmas of its duality proof, and names `Formalism.GradedWeylDivisibility.highest_weight_line` and `GlobalTheory.GLDuality.HighestLine.*`.

The description's section "Wrong statements on `main`" lists one-sentence corrections of this kind for other roadmaps, for example IntegralWeylModulesOfGeneralLinearGroups §2.2 and ChowFormsAndHeightsOfSubvarieties §5.1, but not this one. A reader who uses that list to find what changed on `main` will miss it.

Add a line such as: "TensorInductionAndFiniteGroupInputs §7.1. The joint highest weight line `Δ_λ`, which the text called this roadmap's own, is in the formal proof as lemmas of its `(GL_n, GL_m)`-duality theorems."

## N01 — The *Corollary of:* line of 6.2 (line 142) names InductionRestriction "Layer 5" rather than §5.3

The Clifford correspondence is §5.3 of that layer. The convention paragraph (line 30) says the line names "the roadmap section that states it", and the lines of 7.1 and 9.1 name sections. Citing §5.3 would match them.

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result |
|---|---|---|---|
| 6.1 (a), character formula (sampled) | `S₃ ⊃ A₃`, `ψ = ω`; `ℤ/4 ⊃ 2ℤ/4`, `ψ` the sign | `S₃`: formula gives `1` everywhere, transfer gives `1`. `ℤ/4`: both sides `(1, −1, 1, −1)`. | holds |
| 6.1 (b) against the alternative proof expansion in the new *Method* label | `ℤ/2, H = 1, ψ = −1`; `ℤ/3, H = 1, ψ₁ = ψ₂ = 1` | `ℤ/2`: README formula gives `s`, *Method* expansion gives `(−1, −1) − (−2, 0) = s`. `ℤ/3`: `1 − 1 − (3,0,0) + (3,0,0) = 0`, which is `ψ̂ = 0`. | agree |
| 6.2 (a), clause covered by the *Corollary of:* line | `S₃ ⊃ A₃`, `χ′ = ω` (not `x`-stable) | §5.3 with `T = H` gives `Irr(S₃ \| ω) = {Ind ω}`; `ρ = Ind ω`, of degree 2, with `ρ(transposition) = 0` | holds |
| 6.2 (a), (b), (b′) (sampled) | `ℤ/4 ⊃ 2ℤ/4`; `S₃`, `X = 1 + ρ` | Extensions `x ↦ ±i`, so `2 = l` of them. Norm of `X` on the coset is `(1/3)·3 = 1`; `b = 1 ∈ {±1}`. | holds |
| 6.2 (c) (sampled) | `S₃`, `Y = ω + ω²` and `Y = 1_H` | `⟨X\|_H, ω+ω²⟩ = 2`, even, and `1_H ∉ Y`. `⟨X\|_H, 1⟩ = 1`, odd, and `1_H ∈ Y`. | consistent |
| 7.1 on `GL_n × GL_m` ↔ SchurWeyl §8.4 (sampled) | action, range of `λ`, `n=2, m=3, d=2`, upper Borel | Both use `P(ᵗgXh)` and `ℓ(λ) ≤ min(n,m)`; both give `21 = 3·6 + 1·3`. `Δ_i(ᵗgXh) = det g_[i]·det h_[i]·Δ_i(X)`. | identical |
| 7.1 *Method* ↔ the formal proof's `IrreducibleDistinctUnitary.lean` | the action and the order of proof | The proof acts by `f(hᵀXg)`, the same form; the unitary irreducibility is proved first and the `GL` one uses it; no highest-weight clause | agrees |
| 7.1 `Δ_λ` lemma as described (lines 270–273) | `Δ_s` on `r × n` matrices | `Δ_s(Xu) = Δ_s(X)` for upper unipotent `u`; `E_ab` with `a < b` gives a repeated row or no row `b`, so 0; column weight `(1^s)` | holds; `highest_weight_line` exists |
| 9.1 (a), (c), (d) ↔ ClassicalGroups §6.6b (sampled) | relations, `M^a_b`, `n = 2` | Same `[E_ab, E_cd]` and `M^a_b`. Comatrix with `i = l = 1`: difference `(E11 − E22) − [E12, E21] = 0` on both. Eigenvalue `(u+ν1)(u−1+ν2)` on both. | identical |
| 9.1 (c), highest-weight value ↔ Molev 2003 (4.1) | `n = 2`, `λ = (λ1, λ2)` | `(u+λ1)(u+λ2−1)` on both sides | agrees |
| 9.1 (e) ↔ Molev 2003 Theorem 2.36, `m = 2` (new *Origin*) | evaluation rescaling; `(i,q,j,p) = (2,1,2,1)`; `n = 2` | Denominators `u(u−1)²⋯(u−n+2)²(u−n+1)` cancel. Sign `ε(2,1)² = 1`. For `n = 2`, LHS − RHS `= (E11−E22) − [E12,E21] = 0`. | agrees |
| Labels convention (lines 26–37) | the four sections | 4 of 4 carry *Origin* and *Method*; the 3 *Corollary* lines name sections that state the theorem | holds |
| Downstream consumers ↔ FiniteReductiveGroups §5.11 | routes of (d) and (e) | (d) uses 6.1 on `GL_a(k′)`, `a ≤ m`, and 6.2 (b), (b′), (c). (e) uses the orthogonality on the coset, which is 6.2 (a). | matches |
| Headlines (1), (2) in `Suggested.lean` | the three elaborated types | 6.1 (a), 6.1 (b) first sentence, and 6.2 (b), (b′), (c), with the same hypotheses; the file is unchanged by this pull request | holds |

- Source locators checked against the text: 11, namely Molev 2003 §2.6 (lines 349–409), Definition 2.26 (634), Proposition 2.27 (638), Proposition 2.35 (721), Theorem 2.36 (746), §4.1 (4.1) (1393), and MNO Propositions 2.4, 2.5, 2.7, Theorem 2.10 and Remark 2.11 (lines 1321–1511).
- Supplier sections opened at this head: SchurWeyl §8.4, ClassicalGroups §6.6b, InductionRestriction §§5.2–5.3, ArithmeticGaloisRepresentations §7.1, FiniteReductiveGroups §5.11.
- Formal-proof files read on its public repository: `IrreducibleDistinctUnitary.lean` and `HWLine.lean`.
- The record: 3 layers at the merge base; none removed, retitled or added; no heading removed; `Suggested.lean` unchanged.
- Automatic checks: all passed. Dependency check: `depcheck: 129 roadmaps, 1441 edges, 0 problem(s)`.
- Elaboration of `Suggested.lean` at the pins: three `declaration uses sorry` warnings, nothing else. The elaborated types were compared with the README statements, and no section binder was lost.
- The pull request's head has since moved on, and the newer head does not change this folder.

Overlap check: read BesselPoincareSeriesAndGramBounds, IntegralWeylModulesOfGeneralLinearGroups, FiniteReductiveGroups. BesselPoincareSeriesAndGramBounds consumes 9.1, owned here, with 9.1 (a), (c), (d) owned by ClassicalGroups §6.6b. FiniteReductiveGroups consumes 6.1 and 6.2, owned here. IntegralWeylModulesOfGeneralLinearGroups shares nothing. `(GL_n, GL_m)`-duality on `GL_n × GL_m`: owner SchurWeyl §8.4; this roadmap owns only the unitary restriction.

Source independence: 9 passages compared with 3 sources (Molev 2003, MNO, the formal proof's two files), changed passages only; none shared beyond standard names (quantum comatrix, quantum Sylvester theorem). Largest share is [FormalProof], 37 of 65 locators. Contents were not compared, because the change adds, removes or reorders no layer.

Research link: Layer 6 is the character theory of Shintani descent for `GL_n` (Shintani 1976). Layer 7 is Howe's `(GL_n, GL_m)`-duality (Howe 1989, 1995), used for compact theta correspondences. Layer 9 is the quantum-minor calculus of the Yangian of `𝔤𝔩_n` (Molev–Nazarov–Olshanski 1996; Molev 2003). All three feed the family's formal proof of GRH for Dirichlet L-functions (Alpöge 2026). This rests on the README and on Molev 2003 and MNO, which were read.

## Not verifiable

- Shintani 1976, Lemmas 1-4 and 2-11 (6.1 and 6.2 *Origin*): the Project Euclid landing page gave no PDF, and the J-STAGE URL returned "not found".
- Gluck and Isaacs 1983 (6.1 *Origin*): the Project Euclid PDF was blocked by a bot wall.
- Isaacs 1976 (6.2 *Origin*): a book with no open copy, and the README gives no locator.
- Howe 1989 and Howe 1995 (7.1 *Origin*): the AMS host is in no licence class the sources service accepts, and no legal copy of the 1995 volume was found.
- Molev 2007, chapter 1 (9.1 *Origin*): an AMS monograph with no open copy.
- The *Method* labels of 6.1, 6.2 and 9.1, which describe how the formal proof argues: only two files of the formal proof, both for 7.1, were read. The alternative proof routes in the 6.1 and 6.2 labels were checked as mathematics.

## Source issues

- none

## For the human reviewers

- Not tested: the 6.1, 6.2 and 7.1 attributions to Shintani 1976, Gluck–Isaacs 1983, Isaacs 1976 and Howe 1989/1995 could not be read from a legal host. The wording was compared only with Molev 2003 and MNO.
- Licence: the source with the largest share of locators is [FormalProof], a public Lean repository on GitHub (37 of 65 locators). Two of its files were read; its licence was not checked.
- Neither recorded decision bears on this folder: the change removes no section and moves none out of the roadmap.
