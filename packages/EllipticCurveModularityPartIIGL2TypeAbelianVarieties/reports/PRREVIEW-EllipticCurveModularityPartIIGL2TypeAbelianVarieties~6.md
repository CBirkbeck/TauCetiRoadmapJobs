# Review of EllipticCurveModularityPartIIGL2TypeAbelianVarieties (pull request #1036 at db80937)

**Verdict:** accepted

**Summary.** Accepted: this is an incremental re-review of the 27 lines changed since `d30b928`, and the eight small corrections of the previous review are all repaired correctly, with no new mathematical problem; the new E-equivariance step of §1.3 and the new Eisenstein negative control of §3.2 were recomputed and hold. Two small corrections remain, both in the pull request description (it states for every GL₂-type variety what the roadmap proves for ℚ-simple ones, and it attributes to Ribet a route the README now calls its own), and five format notes, four of them carried over. Nothing blocks; the two points for the human reviewers are unchanged.

## C01 — The description states for every GL₂-type variety what §§3.6, 4.1 and 4.2 prove for ℚ-simple ones

The prose of the description says: “every such variety is a quotient of a modular Jacobian J₁(N), with the attached weight-two newform having coefficient field the endomorphism algebra, conductor Nⁿ and least modular level N”. For `A = B × B` with B a non-CM elliptic curve of conductor N and `E = ℚ(i)` (the first Check of §1.3) the endomorphism algebra is `M₂(ℚ)`, not the coefficient field ℚ of the newform, and A is not a quotient of `J₁(N)`: §3.6 itself says that powers need “enough oldform copies at a suitable larger level”, and §§4.1–4.2 are stated “With the simple A” and “For ℚ-simple GL₂-type A”. Only the conductor survives (`cond(B × B) = N²`).

Text that would be right: “every such variety is a quotient of a modular Jacobian J₁(N); when it is ℚ-simple, the attached weight-two newform has coefficient field the endomorphism algebra, the conductor is Nⁿ and the least modular level is N”.

## C02 — The description says the proof “follows Ribet” through steps that the README now says are not Ribet's

The summary block says: “The proof follows Ribet and Khare–Wintenberger: strong Serre modularity gives … residual witnesses, a pigeonhole … selects one, and exact coefficient identification and Tate-module comparison feed Faltings' isogeny criterion.” Since this head, §§3.4 and 3.5 (README lines 715 and 740) say of exactly the last two steps that “the route above is the roadmap's own and differs from Ribet's”; Ribet's proof (Ribet92 lines 339–360) passes from the pigeonhole to nonzero maps of ℓ-torsion for infinitely many ℓ and Faltings' finiteness. Text that would be right: “The reduction to Serre's conjecture and the pigeonhole are Ribet's and Khare–Wintenberger's; the exact coefficient identification and the Tate-module comparison that feed Faltings' isogeny criterion are the roadmap's own route.”

## N01 — Four pointers still have the wrong direction since the scope and the contracts moved to the end

“the contracts above” (lines 82 and 1088) should read “below”; “imported at the layers specified below” (line 1473) and “The `J₀(23)` worked checks below” (line 1495) should read “above”.

## N02 — Two supplier names stand in code font although no pinned library declares them

`TateModule.lambdaTateModule` and `TateModule.residualRep` (lines 47, 337, 357, 1490) are intended signatures of ArithmeticGaloisRepresentations §§6.4 and 6.1; “the supplier's intended `…`” once would tell a reader so.

## N03 — §1.1 still says the division algebra acts “on `End⁰_ℚ(A)`”

Line 123: D acts on A up to isogeny, through the unital map `D → End⁰_ℚ(A)`; it does not act on the endomorphism algebra.

## N04 — §6.3 could say, as §§3.4–3.5 now do, which part of its statement is the roadmap's own deduction

Its locators give the definition of modularity and the modularity of ℚ-curves; the statement over an arbitrary solvable Galois field with every finite local factor is the consequence of its steps 1–4.

## N05 — In the new step 4 of §1.3, “an integer multiple of it” has two possible antecedents

Line 219: “Composing the isogeny with an integer multiple of it makes it E-equivariant”. What is meant is an integer multiple of the conjugating element of `GL_n(F)` (a quasi-isogeny of `Bⁿ`, whose multiple is an isogeny); “with an integer multiple of this element” would say so.

## Previous findings

The previous review, of `d30b928`, had no finding; its small corrections and format notes are accounted for here.

- C01 — repaired: “Downstream consumers” now names AbelianSurfacesModularity (§3.6) and SatoTateGroups (Layer 1, §§1.4–1.5, §5.1), and gives §6.4 as the input of Caraiani–Newton and Freitas–Le Hung–Siksek; both roadmaps cite these sections at their open heads.
- C02 — repaired: the summary block reads “Its quadratic-field theorem is the ℚ-curve input of Caraiani–Newton's Corollaries 7.2.5 and 7.3.4”; the relative clause of the prose is gone.
- C03 — repaired: the prose says “The strong form of Serre's conjecture, used in §3.2, is consumed from SerreModularityByCompatibleSystems Layer S6; ClassicalSerreModularity is not a supplier”; the chain now ends with SerreModularityByCompatibleSystems.
- C04 — repaired: step 4 of §1.3 conjugates the transported embedding into the regular representation by an E-linear isomorphism of `Fⁿ`, and *Needs:* gains `Algebra.leftMulMatrix`; the direct argument is correct and needs no Skolem–Noether declaration (N05 on its wording).
- C05 — repaired: §3.9 reads “This is the Γ₀ refinement of [Ribet92], Theorem 4.4, p. 8”.
- C06 — repaired: §§3.4–3.5 read “consequence of [Ribet92], Theorem 4.4, pp. 8–9, with [Ribet80], Corollary 4.2, p. 51; the route above is the roadmap's own”; both locators read and correct.
- C07 — repaired: the module docstring says Tate's vanishing “is derived in the roadmap from the supplier's `ℚ/ℤ` form; it is an auxiliary result, not a headline”.
- C08 — repaired: the Check adds “with `ρ̄_λ` absolutely irreducible” and the prime `(11, a₂ − 3)` as a negative control; the congruences were recomputed.
- N01 — not repaired: written again as N01.
- N02 — not repaired: written again as N02.
- N03 — not repaired: written again as N03.
- N04 — not repaired: written again as N04.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
| --- | --- | --- | --- | --- |
| §1.3 step 4 and `ribetTheorem21` (E-equivariance) | `B × B`, `E = ℚ(i)`, `ι(i) = J = [[1,−2],[1,−1]]`; n = 1 | `J² = −I`; g with columns `e₁, Je₁ = (1,1)` gives `g⁻¹Jg = [[0,−1],[1,0]]`, the matrix of i on (1, i); n = 1: g a scalar, nothing to conjugate | True: `Fⁿ` has E-dimension `n/[E:F] = 1` on both sides; `Algebra.leftMulMatrix` at `Mathlib/LinearAlgebra/Matrix/ToLin.lean:949` | N05 |
| §3.2 Check, `J₀(23)` at 11 | roots of `x² + x − 1` mod 11; `a₃ = −2a₂ − 1` | `3² + 3 − 1 = 11`, `7² + 7 − 1 = 55`: roots 3 and 7; at `a₂ ≡ 3`: `a₃ ≡ −7 ≡ 4`; `1 + 2 = 3`, `1 + 3 = 4`; at `a₂ ≡ 7`: `7 ≠ 3`, not Eisenstein; `11 ≡ 1 mod 5` splits; torsion order `num(22/12) = 11` | True; exactly one of the two primes above 11 is excluded | none |
| §3.9 sentence on the Γ₀ refinement | `J₀(23)`; `J₁(13)` | E real, ε = 1, quotient of `J₀(23)`; ε of order 6, `J₀(13) = 0` | Agrees with Ribet92 lines 336–338 (Theorem 4.4, printed p. 8) | none |
| §§3.4–3.5 source lines | Ribet92 Theorem 4.4; Ribet80 Corollary 4.2 | Ribet92 lines 336–360 span printed pp. 8–9; Ribet80 line 384 under the running head of printed p. 51 (line 349), rational endomorphism algebra of `A_f` equal to the coefficient field | Locators correct; the proof at lines 339–360 does not identify coefficients, as the new line says | none |
| Downstream consumers | AbelianSurfacesModularity and SatoTateGroups at their open heads | the first consumes “§3.6, Modularity of abelian varieties of GL₂-type” in its supplier contracts; the second names `End0`, `totallyRealOrCm` (§1.5), `IsGeometricQCurve` (§5.1), §1.4 and primitivity | Agrees; AbelianSurfacesModularity is later in the merge order (431 against 267) | none |
| Description, non-simple case | `B × B`, B elliptic of conductor N, `E = ℚ(i)` | endomorphism algebra `M₂(ℚ)` against newform field ℚ; one copy of B in `J₁(N)` up to isogeny, two needed; `cond = N²` holds | Sentence true for ℚ-simple A only | C01 |

The rows for the untouched statements stand as in the previous review, of `d30b928`.

- Source locators checked against the text: 3 (Ribet92 Theorem 4.4 with its proof, and its Theorem 2.1 proof for step 4; Ribet80 Corollary 4.2); the sampled targets that fall in changed passages are §3.2 and §3.9.
- Library declarations opened at the pin: 1 (`Algebra.leftMulMatrix`, `Mathlib/LinearAlgebra/Matrix/ToLin.lean:949`).
- Cross-roadmap citations resolved: 2 consumers at their open heads (AbelianSurfacesModularity, SatoTateGroups); the diff changes no supplier citation.
- Automatic checks: all passed at this head. Dependency check: `depcheck: 200 roadmaps, 2199 edges, 0 problem(s)`; no UPWARD or CYCLE line. No change outside the folder.
- Elaboration: `Suggested.lean` gives three `declaration uses sorry` warnings (lines 77, 92, 101) and nothing else. The diff changes one sentence of the module docstring and no declaration, so the signatures and the one-tactic probe stand as in the previous review.
- Headlines unchanged: §§1.3, 1.5 and 5.6 stated; the others named in the module docstring as not statable.
- Overlap check: read EllipticCurveModularity, EllipticCurveModularityTotallyReal, ClassicalSerreModularity, AutomorphicGaloisRepresentations, EllipticCurveModularityImaginaryQuadratic, AlgebraicModularFormsAndSerreWeights, SerreWeightAndLevelOptimisation, SmallRamificationAndAbelianVarietyBaseCases in the previous review; the change adds or moves no object, and no open pull request changes this roadmap or drops an id it cites; nothing with two owners.

Source independence: changed passages only; 5 passages compared with 2 sources (Ribet92, Ribet80), none shared (step 4 of §1.3 has no counterpart in Ribet92, whose proof stops at the isogeny with `Bⁿ`); largest share Ribet92, as in the previous review; the diff adds, removes or reorders no layer, so the contents were not compared again: independent.

Research link: the headline targets are Ribet's 1992 theorems on GL₂-type varieties and ℚ-curves, made unconditional by Khare–Wintenberger 2009 (Corollary 10.2); modularity of ℚ-curves over quadratic fields is used by Freitas–Le Hung–Siksek 2015 (§12) and Caraiani–Newton 2023 (Corollaries 7.2.5, 7.3.4). Rests on Ribet92, KW-I, FLHS15 and CN23 as read.

## Not verifiable

- Shimura71, Theorem 1, p. 206 (§5.7), FW84, Theorem 1, p. 204 (§2.9) and DS05, §5.10 (§4.4): not read, as in the previous review; the change does not touch them.
- The generated merge-order block of the description still chains through ClassicalSerreModularity; whether another supplier in the chain requires it was not checked (the block is generated and outside the check of the text).

## Source issues

- none

## For the human reviewers

- **Arrangement.** Targets 2.3–2.11 of the README follow Ribet92's results (3.1)–(3.7), (4.1), (4.2) one for one and in that order; the dependency lines force it except for the place of 2.5. The layers themselves do not follow the source's sections.
- **Not tested.** Shimura71, FW84 and DS05 (one locator each) could not be read; no statement of the roadmap rests on them alone.
