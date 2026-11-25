# Review of HolderMapsBetweenManifolds (pull request #3015 at 6c5a9ef)

**Verdict:** accepted

**Summary.** Accepted: the folder is unchanged since the last review, and this round read the pull request's title and description against the head; every sentence of them agrees with the README and `Suggested.lean`, including the sentence on §4.2 that the last review asked to be brought up to date. There are no findings and no small corrections; one format note is carried over, not blocking. The human reviewers still have to decide about de la Llave–Obaya, the source with the most locators, of which no legal copy could be read; Hirsch is paywalled and was not read either.

## N01 — Several targets still carry no source locator

§1.3, Layer 2, §§3.1–3.3, §§4.1 and 4.4 and §§5.1–5.3 cite no source. The Hirsch citation of §4.2 is by chapter; a theorem number would let a reader find the statement.

## Questions for the author

- Is the openness statement cited in §4.2 Hirsch's Theorem 1.6 of Chapter 2, §1? I recall that number but could not read the book (Springer, paywalled), so I do not ask for it.

## Previous findings

- C01 — repaired: the description now reads "The openness of diffeomorphisms (§4.2) carries a proof outline and cites Hirsch, *Differential Topology*, Chapter 2, for the `C^1` statement", which agrees with README lines 455–457 and 702–704.
- N01 — not repaired: the folder is unchanged; §1.3, Layer 2, §§3.1–3.3, 4.1, 4.4 and 5.1–5.3 cite no source, and §4.2 cites "Hirsch, *Differential Topology*, Chapter 2" by chapter. Carried over as N01.

## Verified sound

The diff changes no statement; the rows are statements the description cites, recomputed.

| Statement | Instances tried | Values computed on each side | Result |
|---|---|---|---|
| Description, Layer 1: the quantitative inverse bound covers "orders `1` to `k` and the top Hölder seminorm" (§1.3 item 2) | `φ_c(x) = x − c`, `k = α = 1`, `K = [−1/2, 1/2]`, `c = 0` and `c = 10` | `C^{1,1}` norm of `φ_c` on `φ_c⁻¹(K)`: derivative part `1`, `‖(φ_c')⁻¹‖ = 1` for both; `sup_K ‖φ_c⁻¹‖ = 1/2` and `10.5` | True: order zero is rightly excluded |
| Description, Layer 3: `HolderDiff` is the generated subgroup and equals the generating set "for `1 ≤ k` and `0 < α ≤ 1`" (§3.3, `coe_holderDiff`) | `k = 0`, `α = 1/2`, `s(x) = sign(x)‖x‖^{1/2}` near `0` | `s` is `1/2`-Hölder; `s⁻¹ = sign(x)x²` is locally Lipschitz; `s∘s = sign(x)‖x‖^{1/4}`, quotient at `0`: `h^{1/4}/h^{1/2} = h^{−1/4} → ∞` | Set not closed for `k = 0`, `α < 1`; the hypothesis `1 ≤ k` is needed, as stated |
| Summary block and Layer 4: the full `C^{k,α}` topology is not a group topology on nonempty compact boundaryless `M` of positive dimension (§4.3) | `u = ψ‖x‖^α`, `h_t = u(· + t) − u`, points `0` and `−t`; `M` a point | `h_t(0) = t^α`, `h_t(−t) = −t^α`, quotient `2t^α/t^α = 2`, while `sup‖h_t‖ ≤ t^α → 0`. `M` a point: group trivial, statement would be false | True with the stated nonemptiness and positive dimension (`[Nonempty M] [Nontrivial E]` in Lean) |
| Summary block and Layer 4: convergence in every lower exponent gives a group topology (§4.4, via §1.2) | same `h_t`, `β < α`; `α = 1`, `β = 1/2`, `t = 1/100` | `[h_t]_β ≤ 2^{1−θ}(sup‖h_t‖)^{1−θ}[h_t]_α^θ ≤ 2 t^{α−β}` with `[u]_α = 1`: `2·(1/100)^{1/2} = 0.2`, against `[h_t]_α ≥ 2` | True: tends to `0` below the top exponent only |
| Description: order-zero exponents multiply, cited from Mathlib `HolderOnWith.comp` (§1.1 item 1, `ContMDiffHolder.comp_zero`) | `f = g = ‖x‖^{1/2}` on `[−1, 1]` | `g∘f = ‖x‖^{1/4}`: `1/4`-Hölder with constant `1 = [g]_{1/2}[f]_{1/2}^{1/2}`; for exponent `1/2` the quotient at `0` is `h^{−1/4} → ∞` | True and sharp; `Mathlib/Topology/MetricSpace/Holder.lean` line 105 |

The rows for the untouched statements stand as in the previous review, of `6c5a9ef`.

- Changed passages in the folder: 0. Nothing changed outside the folder. The seeded sample falls on no changed passage and stands as in the earlier reviews (4 of 4 DKRH locators read, 0 of dLO, 0 of Hirsch).
- Pull request text: title, the three paragraphs of the summary block, the five layer bullets, the supplier paragraph, the `Suggested.lean` paragraph (12 theorems and 9 definitions, each named one present; the not-statable paragraph agrees with the module docstring), the sources paragraph and the topic (`math.DS`, as in `metadata.toml`) read against the head: no sentence contradicted, no change unstated (a new roadmap; no section, declaration or supplier removed).
- Library declarations opened at the pins (11): Mathlib `HolderOnWith.comp` (`Topology/MetricSpace/Holder.lean` 105), `HolderOnWith.interpolate` (same file, 162), `ContDiffPointwiseHolderAt` (`Analysis/Calculus/ContDiffHolder/Pointwise.lean` 55); Tau Ceti `ContMDiffMap.chartCkSeminorm` (`Geometry/Manifold/ContMDiffMap/Chart/Seminorm.lean` 118), `TauCeti.HolderSpace` (`Analysis/Holder/Normed.lean`), `TauCeti.Diff` (`Geometry/Diffeomorphism/Group.lean` 214), `Diffeomorph.continuous_symm` and `Diffeomorph.isTopologicalGroup` (`Geometry/Diffeomorphism/Inversion.lean` 215, 241), `TauCeti.isLocalDiffeomorphAt_of_mfderiv_eq` (`Geometry/Manifold/LocalDiffeomorph/Basic.lean`), `riemannianExp` (`Geometry/Manifold/Riemannian/Geodesic/Exponential.lean` 104), `IsNormalDomain` and `riemannianLog` (`Geometry/Manifold/Riemannian/Geodesic/Normal/Basic.lean`).
- Cross-roadmap citations resolved (7): GeometricTopology Layer 3 (diffeomorphism groups), SmoothBundlesConnections B6.0 (uniform normal radius on compact sets, README lines 1565–1566), HeegaardFloer §2.3, PseudodifferentialOperators §5.4, PDE §1.7, ComplexHessianEquations §5.2, all on main as the description says; HyperbolicDynamicsAndThermodynamicFormalism §8.7 at its open head, named as a possible consumer only, not a supplier.
- Dependency check: `depcheck: 124 roadmaps, 1405 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration: `lake env lean` on `TauCetiRoadmap/HolderMapsBetweenManifolds/Suggested.lean` gives 12 `sorry` warnings and nothing else. All automatic checks pass on this head. `Suggested.lean` is unchanged, so the `#check` comparison of signatures and the one-tactic probe of the earlier reviews stand.

Overlap check: read HyperbolicDynamicsAndThermodynamicFormalism, ManifoldOptimization, LorentzianGeometry, DifferentialGeometry, SobolevMapsBetweenManifolds, MorseTheory, RiemannianManifoldsWithConvexBoundary (scopes as in the previous reviews; the folder is unchanged, and there is no dropped id, no second copy and no other pull request changing this roadmap); nothing newly shared. Shared objects, each cited with its owner: real `C^k` spaces (HeegaardFloer §2.3), bundle `C^{k,α}` norms (PseudodifferentialOperators §5.4), Hölder compactness on compact complex manifolds (ComplexHessianEquations §5.2), Euclidean Hölder spaces of real functions (PDE §1.7).

Source independence: changed passages only: 0 passages changed in the folder, so none compared this round (the earlier comparisons, with DKRH alone, stand); largest share dLO, 7 of 12 locators, whose text and table of contents could not be read; no layer added, removed or reordered, so the arrangement was not compared again.

Research link: Layer 3's `C^{1+α}` diffeomorphisms, §3.4's estimate (DKRH (2.2)) and §5.4's smoothing (DKRH Lemma B.1) are inputs to Dolgopyat, Kanigowski and Rodriguez Hertz, *Exponential mixing implies Bernoulli* (2024); Layer 4 rests on de la Llave and Obaya (1999). Rests on the README and DKRH lines 12–31, 417–421, 2482–2499.

## Not verifiable

- dLO §§3, 4 and 6 (§§1.1, 1.2, 4.3): no legal copy (the DOI's landing page is on a host in no licence class; the mp_arc preprint archive likewise). The statements were checked by computation.
- Hirsch, Chapter 2 (§4.2): the DOI resolves only to the paywalled Springer page; the statement is the standard one and §4.2 gives its own proof outline.

## Source issues

- none

## For the human reviewers

- **Not tested.** dLO has the largest share of locators, 7 of 12 (§§1.1, 1.2, 4.3 of `TauCetiRoadmap/HolderMapsBetweenManifolds/README.md`). Its text and table of contents could not be read, so wording and arrangement were not compared with it.
- **Licence.** Is the mp_arc preprint archive (`web.ma.utexas.edu`, preprint 98-11) an open repository from which dLO may be read? If so, the seven dLO locators can be checked.
