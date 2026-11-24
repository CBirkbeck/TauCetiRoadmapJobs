# Review of QuantumHarmonicOscillator (pull request #3033 at 98724fc)

**Verdict:** needs changes

**Summary.** Changes are needed, for one reason: the second Example of Layer 1 asserts a tower decomposition and an intertwining criterion that are false on the incomplete inner product spaces the layer is written for (R01, a two-sentence repair). The seven stated theorems were recomputed and hold as written, in the README and in `Suggested.lean`; the Dixmier and DLMF locators agree with the texts. There is one small correction (the Teschl page numbers are those of the first edition) and one format note; two facts are left for the human reviewers.

## R01 (P2) — The second Example of Layer 1 is false when `ker a` has no orthonormal algebraic basis, and "the same Hilbert dimension" does not give an isometric intertwiner

The layer says that `V` is "not necessarily complete", and the Example (README, Layer 1, Examples, second bullet, lines 157–160) then says that 1.2 "makes `V` the orthogonal direct sum, over an orthonormal basis `(ε_k)` of `ker a`, of the towers spanned by `bⁿ ε_k/√(n!)`", and that "two such spaces with `ker a` of the same Hilbert dimension are isometrically intertwined". An implementer who takes this as the algebraic core of 2.1 would try to prove something false.

Take `K = ℓ²`, `F` the algebraic Fock space (finite combinations of `e_0, e_1, …` with `a e_m = √m e_(m−1)`, `b e_m = √(m+1) e_(m+1)`), and `V = F ⊗ K` (algebraic tensor product) with `a ⊗ 1`, `b ⊗ 1`. The hypotheses of the layer hold, `V` is spanned by eigenvectors of `N`, and `ker a = e_0 ⊗ K ≅ ℓ²`. An orthonormal family whose finite combinations exhaust `ℓ²` does not exist (for an infinite orthonormal family `(ε_k)` the vector `Σ 2^(−k) ε_k` is not a finite combination), so for the standard basis the towers span only `F ⊗ c₀₀ ≠ V`. For the second sentence compare `V₁ = F ⊗ ℓ²` and `V₂ = F ⊗ c₀₀`: in both, a maximal orthonormal family of `ker a` is countable, but an isometric intertwiner would restrict to an isometric isomorphism `ℓ² ≅ c₀₀`, complete onto incomplete.

What 1.2 does give, and what step 3 of 2.1 uses, is this: `V` is the orthogonal algebraic direct sum of the eigenspaces `bⁿ(ker a)`, and `y ⊗ e_n ↦ bⁿ y/√(n!)` is an isometric isomorphism of `ker a ⊗ F` onto `V` carrying `1 ⊗ a_F`, `1 ⊗ b_F` to `a`, `b`; two such spaces are isometrically intertwined when their kernels are isometrically isomorphic. The decomposition into towers over an orthonormal family holds when `ker a` has an orthonormal algebraic basis, for instance in countable dimension. Replacing the two sentences by these makes the Example true.

## C01 — The page numbers given for Teschl are those of the first edition, while the reference is to the second

The README cites "Teschl, §8.3, p. 178" (1.1, line 90), "Teschl, Theorem 8.6, p. 180" (2.1, step 2 and the Needs line, lines 210–211 and 280) and, in the References, "2nd ed., AMS, 2014 (author's PDF); §8.3, pp. 178–179; §8.4, Theorem 8.6, p. 180". In the second edition on the author's page, §8.3 is on pp. 212–214 (the ladder argument around (8.40) is on p. 213) and Theorem 8.6 with its proof on pp. 214–215; pages 178–180 are where the same section and theorem stand in the first edition (GSM 99, 2009). The theorem and section numbers are the same in both, and the content supports the two uses. Either give the second-edition pages, or cite the first edition. The pull request's description repeats the same pages under "Prior work".

## N01 — Three places in the README narrate how it was written

The scope section says that Indritz's proof "could not be read here" (lines 588–589), the References mark two works "(not consulted)" (lines 678, 684), and five Checks say "checked symbolically" or "checked exactly" (lines 140, 264, 336, 391, 395). A Check states what is true and what a wrong variant gets wrong; how it was verified, and which texts were not opened, belongs in the description. Would drop these phrases (the Rellich citation can stay as "cited through Dixmier").

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 1.1 `exists_nat_eigenvalue_eq` | `V = 0`; `μ = 0`; Fock `x = e_2`; ℤ-shift with `a e_k = (½+k)e_(k−1)` | vacuous; `‖ax‖² = 0`, `n = 0`; `N e_2 = 2e_2`, `a²e_2 = √2 e_0`, `a³e_2 = 0`; `ba e_0 = ½e_0`, `⟪ae_1,e_0⟫ = 3/2 ≠ 1` | holds; adjoint hypothesis needed | none |
| 1.2 `vacuum_tower` | `n = 0, 1, 2` on Fock basis; `ker a = 0` (`C_c^∞`) | `b⁰a⁰ = 1` = empty product; `b²a² = N(N−1)`; `a b² = b²a + 2b`; `‖b²e_0‖² = 2`; both sides `0` | holds | none |
| Layer 1, second Example | `V = F ⊗ ℓ²`; `F ⊗ ℓ²` vs `F ⊗ c₀₀` | towers over the standard basis span `F ⊗ c₀₀ ≠ V`; kernels `ℓ²`, `c₀₀` not isometric | false | R01 |
| 2.1 `rellich_dixmier` | Schrödinger pair; `H = 0`; `H = ℂ`, `P = Q = 0`; `C_c^∞(0,1)`; `n = 0` in Lean | `x h_n = √(n/2)h_(n−1)+√((n+1)/2)h_(n+1)`, `−ih_n′ = i√((n+1)/2)h_(n+1)−i√(n/2)h_(n−1)`; `κ` empty; CCR fails (`0 ≠ −i`); `‖Q̄‖ ≤ 1` vs `n+½`; `√(0/2) = 0` kills `e(k, 0−1)` | holds; both hypotheses needed | none |
| 2.1 route | `SR`, `RS`; `A = (i/√2)T`; word bound | `SR = P²+Q²−1`, `RS = P²+Q²+1`; `Q̄ = (A+A*)/√2`, `P̄ = (i/√2)(A*−A)`; `2^(m/2)√((n+m)!/n!) ≤ 2^(n/2)2^m m!` | consistent with statement and with Dixmier pp. 265–267 | none |
| 3.1 `hasSum_groundStateTransform_ouSemigroup` | `g = He_n`; `t = 0`; `t = −1`; no dilation | `W(He_n/√n!) = h_n`; `‖Wg‖² = (2π)^(−1/2)∫e^(−u²/2)g²`; `ouKernel 0 x` = point mass; `P_(−1)He_2 = e²x²−1 ≠ e²He_2`; `He_2 ↦ (x²−1)e^(−x²/2)` not ∝ `h_2` | holds for `t ≥ 0` | none |
| 3.2 `heat_eq_mehlerHeatKernel` | trace; diagonal; transport; `t = 0`; `(0,0)` | `Σe^(−t(n+½)) = 1/(2 sinh(t/2))`; `(2π sinh t)^(−1/2)√(π/tanh(t/2)) = 1/(2 sinh(t/2))`; both sides `ρ^(1/2)(π(1−ρ²))^(−1/2)exp(−((x²+y²)(1+ρ²)−4ρxy)/(2(1−ρ²)))`; kernel `0`; `(2π sinh t)^(−1/2)` | holds for `t > 0` | none |
| 4.1 `propagator_eq_mehlerPropagatorKernel` | `t = π/2`; limit `ε → 0`; `f = (1+|y|)^(−1)` | kernel `e^(−iπ/4)(2π)^(−1/2)e^(−ixy)`, `e^(−iπ/4)(−i)^n = e^(−i(π/2)(n+½))`; `1−z² → 2 sin t·e^(i(π/2−t))`, exponent `i((x²+y²)cos t−2xy)/(2 sin t)`; `|Kf|` not integrable | holds; `L¹` needed | none |
| 4.2 `heisenberg_rotation` | `h_m`-coefficients; `t = π`; Fock matrices | both sides `√(m/2)e^(−it(m−½))c_(m−1)+√((m+1)/2)e^(−it(m+3/2))c_(m+1)`; `U = −i·parity`, `U*QU = −Q`; `U*aU = e^(−it)a` | holds for all real `t` | none |
| Conventions | Fourier dilation; halving | `𝓕D = DF₁` with `D f(x) = (2π)^(1/4)f(√(2π)x)`; `e^(−(t/2)(2n+1)) = e^(−t(n+½))` | consistent | none |
| Teschl locators | 2nd ed. vs 1st ed. | §8.3 at pp. 212–214, Thm 8.6 at p. 214 (2nd); pp. 178–179, 180 (1st) | pages are the 1st edition's | C01 |

- Source locators checked against the text: 7 (Dixmier, Théorème 1 p. 265, the account of Rellich p. 264, proof pp. 265–267; Teschl §8.3 and Theorem 8.6 in both editions; DLMF 18.18.28 and 18.14.9).
- Library declarations opened at the pin: 23 (the Hermite function files `Function/{Basic,Lp,Ladder,Oscillator,Operator,Schwartz,Parseval,HilbertBasis}.lean` and `Fourier/{Basic,HilbertBasis}.lean`, `OperatorIdeal/Nuclear/Basic.lean:53,166`, `ApproximationNumber/Diagonal.lean:42`, `ApproximationNumber/Isometry.lean:68`, `Normed/Lp/Diagonal/Basic.lean:38`, `Algebra/Lie/Heisenberg.lean:125`, the Gaussian Hermite basis and `WeightL2Isometry.lean:114`); no Mehler kernel or oscillator semigroup in Mathlib or Tau Ceti at the pins.
- Cross-roadmap citations resolved: 26 (UnboundedOperators §§5.1, 5.3, 5.6 and its `Suggested.lean`; VonNeumannAlgebras V10.ClosedOperators; SelfAdjointSpectralTheory SA-E01, 03, 08, 09, 10, 13; QuantumFoundations §§4.2, 6.4, 6.6, 6.7, 9.2; MetaplecticAutomorphicForms §§0.18, 1.2, 1.3, 2.4c; ThetaKernelsForUnitaryDualPairs §3.45; SpecialFunctionsAffineHeisenbergGroups §3.4; OrnsteinUhlenbeckSemigroup 1.1, 1.2, 2.4, 3.3). The copied definitions agree with their owners' text.
- Automatic checks: all passed. Dependency check: `depcheck: 132 roadmaps, 1466 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration: `Suggested.lean` elaborates with `sorry` the only warning (7 declarations). Elaborated types compared with the README statements: no binder lost, nothing changed. One-tactic probe (`simp`, `rfl`, `infer_instance`, `aesop`) closes none of the 7 theorems.
- Headline theorems (1.1, 1.2, 2.1, 3.1, 3.2, 4.1, 4.2) are all stated; none is declared not statable.
- No change outside the roadmap folder.

Overlap check: read OrnsteinUhlenbeckSemigroup, QuantumFoundations, UnboundedOperators (scope and the cited sections), and searched WienerChaosAndMalliavinCalculus, SchrodingerOperatorsAndSpectralTypes, SpecialFunctionsAffineHeisenbergGroups, SelfAdjointSpectralTheory and OrthogonalL2Bases by object; shared objects and owners: the Ornstein–Uhlenbeck kernel, semigroup and `mehlerKernel` (OrnsteinUhlenbeckSemigroup, copied and cited), `CommonInvariantDomain` and Nelson's theorem (UnboundedOperators §5.3, copied and cited), the closed oscillator and its functional calculus (QuantumFoundations §9.2, cited), the Hermite functions (Tau Ceti, from OrthogonalL2Bases). The ladder theorem, Rellich–Dixmier, the heat and unitary kernels and the Heisenberg rotation are stated by no other roadmap on main or open.

Source independence: 7 passages compared with 3 sources (Dixmier, Teschl, DLMF), none shared beyond formulas; largest share Dixmier, 5 of 12 locators; contents compared with Dixmier (introduction, one degree of freedom, several degrees of freedom): independent, only Layer 2 touches it.

Research link: Layer 2 is the uniqueness theorem of Dixmier (1958), sharpening Rellich (1946), for the canonical commutation relation; Layers 3–4 are Mehler's formula (DLMF 18.18.28) for the oscillator semigroup and group, tied to the Ornstein–Uhlenbeck semigroup and, in 4.2, to the metaplectic action of rotations. Rests on the README and on Dixmier's text.

## Not verifiable

- Rellich (1946): not read; the README cites it through Dixmier, whose p. 264 supports what is said of it.
- Indritz (1961): not read; it supports no target (scope section only).
- The symbolic computations the Checks mention were not rerun; the identities they concern were recomputed by hand (table above).
- The physlib development named in the scope section was not compared with `Suggested.lean`.

## Source issues

- **Misprint** in Teschl, *Mathematical Methods in Quantum Mechanics*, 1st ed. (2009), at Theorem 8.6, printed page 180: the source says that `Aψ₀` satisfies `H₁ψ₁ = ψ₁`; it should be `H₁ψ₁ = Eψ₁`; affects nothing; corrected in print at 2nd ed. (2014), Theorem 8.6, p. 214.

## For the human reviewers

- Licence: the README (scope section, "Related formal work") names the physlib library's oscillator development and says nothing is taken from it; the declarations of `Suggested.lean` were not compared with that repository.
- Scope: five of the seven targets (1.1, 1.2, 3.1, 4.1, 4.2) are marked "Proved here" and carry no refereed locator for the statement itself; the cited sources are Dixmier (Compositio Math., 1958), Teschl (AMS, 2014) and DLMF.
