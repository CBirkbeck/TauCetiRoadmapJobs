# Review of HolderMapsBetweenManifolds (pull request #3015 at 1db4050)

**Verdict:** accepted

**Summary.** Accepted. This head repairs both findings of the previous review. The compactness in §5.1 now assumes finite-dimensional `F`. The quantitative inverse bound of §1.3 now bounds only the derivatives of orders `1` to `k` and the top Hölder seminorm, on compact convex sets; that statement is true, and it is what §4.4 uses. The three small corrections and one of the two format notes are also repaired. There is no new finding. There are two format notes, neither blocking: one carried over (missing locators) and one new (coarse `*Needs:*` lines). The human reviewers still have to decide on dLO, the source with the most locators, because no legal copy could be read.

## N01 — Most targets still carry no source locator

§§1.2 and 1.3, Layers 2 and 4, §§3.1–3.3 and §§5.1–5.3 cite no source. The References entry describes dLO §3 (interpolation) and §6 (examples of discontinuity). These would be natural locators for §1.2 (line 163) and §4.3 (line 454). A textbook locator would suit the openness of diffeomorphisms in §4.2.

## N02 — Layers 3–5 depend on all of Layer 2, which now includes the comparisons of §2.2

Layer 2's *Needs:* line (lines 327–328) now names HeegaardFloer §2.3 and PseudodifferentialOperators §5.4 for the comparisons of §2.2. Layer 3 (line 404), Layer 4 (line 497) and Layer 5 (line 565) cite "Layer 2" as a whole, but none of them uses those comparisons. "Layer 2, without the comparisons of §2.2" would keep them from appearing to wait on PseudodifferentialOperators §5.4.

## Previous findings

- R01 — repaired: "For `α' < α`, `k' = k` and finite-dimensional `F` the inclusion is compact" (§5.1 item 1, lines 510–511). The `ℓ²` Check of Layer 5 (lines 561–563) records why.
- R02 — repaired: "for a compact convex `K` in the domain of `φ⁻¹`, `max_{1 ≤ m ≤ k} sup_K ‖D^m(φ⁻¹)‖ + [D^k(φ⁻¹)]_{α,K}` is bounded … The term `sup_K ‖φ⁻¹‖` is not controlled" (§1.3 item 2, lines 191–195). The Check at lines 199–201 adds the counterexample; §4.4 item 1 (lines 479–482) uses only the bounded terms.
- C01 — repaired: "pullback, and on boundaryless manifolds smoothing (Layer 5)" (scope, lines 595–596).
- C02 — repaired: "for `F = ℝ` and boundaryless `M`, `C^k_A(M, ℝ)` is HeegaardFloer §2.3's Banach space … `C^{k,α}_A(M, F)` is PseudodifferentialOperators §5.4's `C^{k,α}` space of sections of the trivial bundle" (§2.2, lines 280–284).
- C03 — repaired: the description now reads "On bounded convex open subsets of `ℝⁿ`, PDE §1.7's Hölder spaces of real functions are the real-valued case of Layer 1's spaces, with an equivalent norm."
- N01 — not repaired: no locator was added to §§1.2, 1.3, 3.1–3.3, 5.1–5.3 or to Layers 2 and 4. Carried over as N01.
- N02 — repaired: "Mathlib's pointwise condition `ContDiffPointwiseHolderAt` … compares `D^k f(x)` only with `D^k f(a)` at the base point `a`" (§2.1, lines 229–234).

## Verified sound

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| §1.3 item 2, convex `K` | `φ = exp`, `K = [1, 2]`, `k = α = 1` | Left side `sup\|1/y\| + Lip(1/y) = 1 + 1 = 2`. Inputs: `C^{1,1}` norm of `exp` on `[0, log 2]` is `4`, `B = 1`. Route bound `B + B³[Dφ]₁ = 3` | Holds |
| §1.3 item 2, convexity | `K = [−1, −δ] ∪ [δ, 1]`; `φ⁻¹ = 2y − 10` on the left, `y` on the right | `[Dφ⁻¹]_{1,K} ≥ 1/(2δ)`, while the norm of `φ` on `φ⁻¹(K)` is `≤ 1.06` and `B = 2` | Fails without convexity; the hypothesis is stated |
| §1.3 Check (order zero) | `φ_c = x − c`, `K = [−1/2, 1/2]` | `C^{1,1}` norm on `[c−1/2, c+1/2]` is `max(1/2, 1) + 0 = 1`; `\|1/φ_c'\| = 1`; `sup_K\|φ_c⁻¹\| = \|c\|+1/2` | True |
| §2.1, `ContDiffPointwiseHolderAt` | `k = 0`, `α = 1`, `f = x sin(1/x)`, `f(0) = 0` | `\|f(x) − f(0)\| ≤ \|x\|`; `f'(1/(2πn)) = −2πn`, unbounded | The pointwise condition holds and the neighbourhood condition fails, as stated |
| §2.2 against HeegaardFloer §2.3 | `F = ℝ`, the circle, finite `k` | On compact `M` every `C^k` map has finite norm; HF §2.3 has finite `k` and finite-atlas norm equivalence on boundaryless `X` | Same set; equivalent norms |
| §2.2 against PseudodifferentialOperators §5.4 | `F = ℝ^r` or `ℂ^r`, trivial bundle, `α = 1` | PDO allows real or complex bundles on boundaryless `M` (line 75); PDE §1.7 allows `0 < α ≤ 1` (line 1003) | Consistent at the endpoint |
| §4.4 item 1, inversion | the circle, `f_n = x + ε_n sin(2πx)/2π`, `ε_n → ε`, `\|ε\| < 1` | `B = 1/(1−\|ε_n\|)` is bounded; `[Df_n⁻¹]_{β'} ≤ B^{2+β'}[Df_n]_{β'}` is bounded; §1.2 then gives `C^{1,β}` | Route consistent |
| §5.1 compactness, finite-dimensional `F` | `F = ℝ`, the circle, `k = 0`, `α = 1`, `α' = 1/2` | Uniform limit by Arzelà–Ascoli; `[u_n−u]_{1/2} ≤ √2 (sup\|u_n−u\|)^{1/2}(2L)^{1/2} → 0` | Holds |
| `ℓ²` Check of Layer 5 | nonempty `M`, `F = ℓ²`, `u_n ≡ e_n`, any `k`, `α` | Norm `1` (the supremum is `1`; derivatives and seminorm are `0`); `‖e_n − e_m‖ = √2` | True; the hypothesis is needed |
| §5.1 at `α' = α` | ComplexHessianEquations §5.2 Check, `u_j = j^{−α} sin(jx)` | Bounded in `C^{0,α}`; quotient `≥ (2/π)^α` at `\|x−y\| = π/(2j)` | Strict `α' < α` is needed, and it is stated |
| Scope against ComplexHessianEquations §5.2 | `X` compact, boundaryless, complex; `F = ℝ`; `0 < α < 1` | CHE's spaces are PDO §5.4's for the trivial real line (CHE line 31), so through §2.2 they are §5.1's case `F = ℝ` | Consistent |

The rows for the statements this change leaves untouched stand as in the previous review, of `634bebc`.

- **Source locators:** no changed passage carries a source locator. The seeded sample targets that the change touches (§§2.1, 2.2, 4.4, 5.1 and the Checks after §5.4) were checked mathematically and against the cited sections and declarations.
- **Library:** Mathlib `ContDiffPointwiseHolderAt` (`Analysis/Calculus/ContDiffHolder/Pointwise.lean:55`, `isBigO` at `:59`) was opened at the pin.
- **Cross-roadmap citations resolved on main (592bdb1):**
  - HeegaardFloer §2.3 (line 1557);
  - PseudodifferentialOperators §5.4 (line 1280) and its Conventions (line 75);
  - ComplexHessianEquations §5.2 (line 439) and its Conventions (line 31);
  - PDE §1.7 (line 996).
- **Dependency check:** `depcheck: 132 roadmaps, 1466 edges, 0 problem(s)`, with no UPWARD or CYCLE line. The new suppliers, HeegaardFloer and PseudodifferentialOperators, are on main.
- **Gate:** every check passes. Against the repository's own order the run reports only that the roadmap is not in the order yet; the candidate order places it after its suppliers, so this is not a defect. Nothing changed outside the folder, and there are no machine paths.
- **Elaboration:** `lake env lean` on `Suggested.lean` gives 12 `sorry` warnings and nothing else.
- **Unchanged since `634bebc`:** `Suggested.lean`, so its signatures and the one-tactic probe stand as in the previous review.

Overlap check: I read HyperbolicDynamicsAndThermodynamicFormalism, ComplexManifolds, ManifoldOptimization, LorentzianGeometry, HamiltonianReduction, SobolevMapsBetweenManifolds, MorseTheory and RiemannianManifoldsWithConvexBoundary. HamiltonianReduction has no Hölder content. The shared objects are all special cases of this roadmap's spaces, and the README names each owner and states the comparison:
- the real `C^k` spaces (owner HeegaardFloer §2.3);
- the bundle `C^{k,α}` norms (owner PseudodifferentialOperators §5.4);
- the Hölder compactness on compact complex manifolds (owner ComplexHessianEquations §5.2, cited in the scope as the special case).

A search of main and the open heads for Hölder diffeomorphisms and `ContMDiffHolder` finds no other owner.

Source independence: changed passages only. Seven changed passages (§1.3 item 2 and its Check, §2.1's paragraph, §2.2's comparison, §4.4 item 1, §5.1 item 1, the `ℓ²` Check, and the scope and contracts) cite no external source and share no wording with DKRH, the only readable source. No layer was added, removed or reordered, so the arrangement was not compared again. dLO, with the largest share (5 of 9 locators), could not be read.

Research link: Layer 3's `C^{1+α}` diffeomorphisms, §3.4's estimate DKRH (2.2) and §5.4's smoothing (DKRH Lemma B.1) are inputs to Dolgopyat, Kanigowski and Rodriguez Hertz's theorem that exponential mixing implies Bernoulli (Ann. Math. 2024). Layer 4 rests on de la Llave–Obaya (1999). This rests on the README and on DKRH lines 12–31, 417–421 and 2482–2499.

## Not verifiable

- dLO, the five §4 and §6 locators of §1.1 (lines 120, 125, 127, 130, 149), which this change does not touch. As in the previous round, the DOI landing page (`aimsciences.org`) and the mp_arc preprint archive (`web.ma.utexas.edu`) are on hosts in no licence class, so no legal copy was found.

## Source issues

- none

## For the human reviewers

- **Not tested.** dLO has the largest share of locators, 5 of 9. Its text and table of contents could not be read, so the wording and arrangement checks were not run against it.
- **Licence.** Is the mp_arc preprint archive at `web.ma.utexas.edu` an open repository from which dLO (preprint 98-11) may be read? If it is, the five dLO locators of §1.1 can be checked.
