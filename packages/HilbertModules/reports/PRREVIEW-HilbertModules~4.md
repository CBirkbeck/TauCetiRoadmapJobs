# Review of HilbertModules (pull request #861 at bbc2ad5)

**Verdict:** accepted

Incremental re-review of the 147 lines changed since 5476fe8 (26 insertions, 121 deletions, both files of the folder, nothing outside it). The head repairs all three P3 findings of the previous review and introduces no new defect; the gate passes every check and the dependency check reports no UPWARD or CYCLE line. No finding.

## Previous findings

- R01 — repaired: `TauCetiRoadmap/HilbertModules/Suggested.lean` is 83 lines, the `TorusLine` and `TorusFiniteRank` sections are gone, the docstring ends at "projectivity (H2)." (lines 15–17), and README lines 115–117 read "states the headline theorems of H2 that are statable against the pinned Mathlib module classes; this README is the specification."
- R02 — repaired: README lines 460–466 say the unit is proved by the displayed computations with external inputs SmoothBundlesConnections B6.3 and DifferentialGeometry 5.2, and lines 468–470 cite CharacteristicClasses C1.6 and Hatcher, Proposition 3.10 for the freeness and isomorphism criteria; every locator resolves (below).
- R03 — repaired: README lines 613–617 index the colimit by "CharacteristicClasses C1.2's small cofinal system of point-neighborhood covers … with its common-refinement and cofinality laws", and the supplier contract at lines 90–92 names the same system; the restated sentences are gone.

## Verified sound

**Gate and dependency check.** The worker's gate at bbc2ad5 passes every check (`build=0`, `depcheck=0`, `stray-files=0`, `readme-ids-missing=0`, `outside-folder=0`). My rerun of the dependency check on this README:

```
depcheck: 235 roadmaps, 2060 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. `git diff --stat origin/main...HEAD` outside `TauCetiRoadmap/HilbertModules` is empty. The folder holds `README.md`, `Suggested.lean`, `metadata.toml` only. `roadmaps resolve`: no citation and no Lean name found nowhere. Grep of the folder for process words, pull-request references, `lemma`, `set_option`, `#eval`, `#print`, `#synth`: none (the only hits are the source theorem names "Lemma 2.5", "Lemma 2.65" in the Sources list). None of the ten deleted Lean names (`charge`, `phase`, `latticeShift`, `covS`, `covT`, `IsCovariant`, `coordinates`, `transition`, `pairing`, `Plane`) survives in backticks in the README.

**Lean.** `git diff 5476fe8..HEAD` on `Suggested.lean` touches only the docstring (lines 13–21) and deletes lines 87–188; the four H2 declarations are byte-identical to the previous head. A scratch copy with `#check @` for all four, elaborated with `lake env lean`, gives `sorry` the only warnings (three, on the three theorems); the elaborated types agree with the worker's signature file and the README: `adjointPair_exists_continuousLinearMaps` carries `[StarOrderedRing A] [CompleteSpace E] [CompleteSpace F]`, `norm_adjoint_comp_self` carries `[StarOrderedRing A]` and no completeness, `exists_parseval_frame_iff_finite_projective` carries `[CStarAlgebra A]` (unital, README line 229) `[CompleteSpace E] [Module Aᵐᵒᵖ E]`. No binder lost. Single `import Mathlib`; no sorried data; the one definition has a real body. One-tactic probe on the same scratch copy: `simp_all [IsAdjointPair]` leaves `‖S ∘SL T‖ = ‖T‖ ^ 2` unsolved (goal printed), so the C*-identity is not padding; the previous report's probes on the other two theorems carry over unchanged. Convention witness closed at the pin by `exact CStarModule.inner_op_smul_right`: `⟪x, op a • y⟫ = op a * ⟪x, y⟫`, so `⟨x, y a⟩_A = ⟨x,y⟩_A a` as README line 14 and the docstring say.

**Headline audit.** Unchanged from the previous report: the H2 statements are the statable headlines; the docstring (lines 19–32) names each non-statable headline with the missing carrier (adjointable and compact module operators, interior tensor product, `H_A`, minimal tensor product, unitary dual and continuous-trace predicate, Čech cohomology of the function sheaves, module-valued adjoints and localization), and `Mathlib/Analysis/CStarAlgebra/Module/` at the pin holds only `Defs`, `Constructions`, `Synonym`. The torus classification would need a `CStarModule` instance on `Γ_(a,b)`, which would be sorried data: correctly absent.

**Changed passages and the seeded sample.**

- H5.TorusLineSections (lines 427–484). The new proof-route sentence names two external inputs. SmoothBundlesConnections B6.3 "Rank-one Chern–Weil" is on main at `TauCetiRoadmap/SmoothBundlesConnections/README.md` line 1716: `c₁(P)_ℝ = [F/(2π)]` under `deRhamHom`, identified with the Čech comparison by B6.1, with the T² Check at lines 1728–1730 (constant forms `c dx∧dy` are curvatures iff `2πc ∈ ℤ`). DifferentialGeometry 5.2 "Integration of top forms" is at `TauCetiRoadmap/DifferentialGeometry/README.md` line 511 (`integralTopForm`, linearity, positivity). CharacteristicClasses C1.6 is at `TauCetiRoadmap/CharacteristicClasses/README.md` line 537: complex-line isomorphism classes ≃ `H²(X;ℤ)` for CW complexes and paracompact Hausdorff bases of CW type, with tensor and dual maps; T² is a finite CW complex by AlgebraicTopology Stage 4.5 (README line 519). Hatcher, Proposition 3.10, is hatcherVBKT line 3359–3361 (pdf page 90, printed p. 86): `c₁ : Vect¹_ℂ(X) → H²(X;ℤ)` is a homomorphism and an isomorphism for X of CW homotopy type; it matches lines 468–470 and 555–559. The phrase "as the determinant computation of H5.TorusFiniteRankSections is" refers to line 513, which computes `det C_a(r)` in place.
- H5.TorusFiniteRankSections (lines 486–560): unchanged since the previous head; the Hatcher locator at line 555–559 is the same statement verified above.
- H5.CommutativeFiberExample: unchanged since the previous head; cites Mathlib only (`idealOfSet_ofIdeal_eq_closure`, `exists_restrict_eq`), verified at the pin in the previous report.
- The Čech unit (lines 596–640) and the supplier contract (lines 90–105). CharacteristicClasses C1.2 on main, lines 450–457: the early cover-theoretic interface is "for arbitrary topological spaces", "impose[s] no local-compactness hypothesis", and C1.2 chooses "a small cofinal system of point-neighborhood covers and prove[s] its common-refinement/cofinality laws", then defines Čech cohomology as the colimit over the directed preorder ordered by existence of refinement (lines 458–461). The README's "of an arbitrary topological space", "coefficient-free" and "imposes no compactness or finiteness on the covers" (lines 91, 616–617) say no more than C1.2 does. H5 keeps as its own the fixed-cover complexes, refinement maps and homotopies for its three sheaves and the colimit for them (lines 101–105), which C1.2 does not state (its colimit is for constant coefficients A viewed as a ℤ-module, line 459). CharacteristicClasses is on main and earlier than this roadmap; the edge already existed (lines 90–93, 625) and the dependency check accepts it.

**Adversarial table** (values computed on each side; rows for untouched statements carry forward from the previous report, PRREVIEW-HilbertModules~3, with the same values):

| Statement | Instances tried | Values | Result |
|---|---|---|---|
| Chern number of `L_k` by the displayed route (changed, lines 452–466) | k = 1, −1, 0; connection `∇_s = ∂_s − 2πik t`, `∇_t = ∂_t` | `[∇_s,∇_t] = ∂_s∂_t − ∂_t∂_s + 2πik = 2πik`, so `F = 2πik ds∧dt`; `iF/2π = −k ds∧dt`; DG 5.2 with `∫_{T²} ds∧dt = 1` gives −k: k = 1 ↦ −1, k = −1 ↦ 1, k = 0 ↦ 0; SBC B6.3 Check: `2πc ∈ ℤ` with `c = ±k` holds | true; inputs are exactly B6.3 and DG 5.2 |
| `M_k` free iff k = 0, `M_k ≃ M_l` iff k = l via C1.6/Hatcher 3.10 (changed, lines 467–470) | (k,l) = (0,0), (1,1), (1,−1), (2,3) | `c₁` injective on CW type: classes −k, −l equal iff k = l; free line ⇔ trivial bundle ⇔ `c₁ = 0` ⇔ k = 0; zero-twist model `M_0 = A` by the identity section | true; T² is CW (AT 4.5) |
| colimit over C1.2's point-neighbourhood system (changed, lines 613–620) | X = {a,b} discrete; X = ℝ with `U_x = (x−1,x+1)` | point-neighbourhood covers `{U_x}_{x∈X}`: any cover `{V_i}` is refined by choosing `U_x ⊆ V_{i(x)}`; two systems `{U_x}`, `{U'_x}` have `{U_x ∩ U'_x}` in the system; no compactness used | true; matches CC lines 456–461 |
| `IsAdjointPair` convention | `inner Aᵐᵒᵖ x (op a • y)` | `inner_op_smul_right` closes at the pin: `op a * ⟪x,y⟫` | agrees (as PRREVIEW-HilbertModules~3) |
| `adjointPair_exists_continuousLinearMaps` | additivity via nondegeneracy; closed graph on complete E, F; E = 0; zero algebra | as PRREVIEW-HilbertModules~3 | true as stated |
| `norm_adjoint_comp_self` | `‖Tx‖² = ‖⟨x,STx⟩‖ ≤ ‖ST‖‖x‖²`; T = 0; E = 0 | as PRREVIEW-HilbertModules~3; `simp_all` does not close it (this round) | true |
| `exists_parseval_frame_iff_finite_projective` | n = 0 (E = 0); Roe 10.2 | as PRREVIEW-HilbertModules~3 | true |
| H5.CommutativeFiberExample, fiber `C(h⁻¹{x})` and fiber-norm continuity ⇔ h open | witness `Y = [0,1]⊔{p} → [0,1]`, `f = 1_{p}` | as PRREVIEW-HilbertModules~3 | true at the pin |
| `M_k` sections, inner product, norm, tensor/dual comparisons; sign bookkeeping against SBC | (1,0), (0,1) shifts; `F_ℝ = 2πk ds∧dt` | as PRREVIEW-HilbertModules~3 | true |
| `det C_a(r) = (−1)^(b−1)e^{2πiar}`, `det E_(a,b) ≃ L_a`, orthonormal basis for a = 0, section extension, unstable classification, sum/dual/tensor/cancellation | b = 1..4, numeric a = 2, r = 0.3; gauge `e^{πi(b−1)s}` | as PRREVIEW-HilbertModules~3 | true |
| Čech refinement homotopy two-point witness, empty-intersection convention, `ČHⁿ(X,C(−,ℝ)) = 0` | X = {a,b}; constant presheaf on ∅; partition of unity | as PRREVIEW-HilbertModules~3 | true |
| H1 `a_n = p_n/√(n+1)`, H2 `C([0,1])` counterexamples, H4 `K(H)` nonseparable, H6 symmetric criterion, `C₀(ℝ)` model, deficiency API, H7 separation and sum theorem, finite-factor model | as PRREVIEW-HilbertModules~3 | as PRREVIEW-HilbertModules~3 | true |

**Library declarations opened at the pin this round.** `CStarModule.inner_op_smul_right` (`Mathlib/Analysis/CStarAlgebra/Module/Defs.lean` line 78, closed the witness); `ContinuousLinearMap.comp` norm notation `∘SL` as elaborated. The declarations listed in the previous report were not reopened; the statements citing them are unchanged.

**Cross-roadmap citations resolved this round.** CharacteristicClasses C1.2 (main lines 450–461) and C1.6 (537); SmoothBundlesConnections B6.3 (main 1716) and B2, B3, B6 (557, 869, 1304, unchanged citations); DifferentialGeometry 5.2 (main 511); AlgebraicTopology Stage 4.5 `cwProductKelley` (main 752, unchanged); TopologicalKTheory T1.3, T1.5, T1.5a (unchanged). The CStarAlgebras cross-citation noted in the previous report (CStarAlgebras' open head cites H5.CommutativeFiberExample while this README consumes its C1–C9) is unchanged on this side; its repair lives in CStarAlgebras' own review.

**Ownership.** Unchanged: no other roadmap on main or at the open heads this brief lists owns the torus section modules `M_k`, `Γ_(a,b)` (NoncommutativeGeometry N7 owns the θ = 0 Fourier spectral triple, not these modules; HeisenbergImprimitivity names H5 as its comparison partner), Kasparov stabilization, Brown–Green–Rieffel, continuous trace or the local–global principle; no other `Suggested.lean` declares a `TauCetiRoadmap.HilbertModules.*` name except the child HeisenbergImprimitivity's own sub-namespace.

## Not verifiable

- Raeburn–Williams, *Morita Equivalence and Continuous-Trace C*-Algebras*; Williams, *Crossed Products of C*-Algebras*; Blackadar, *Operator Algebras*: paywalled books, cited by locator only (uncertified); the theorem numbers at README lines 840–853 and 862 were not checked against the text.
- Dixmier–Douady (Numdam) and Teschl, *Mathematical Methods in Quantum Mechanics*: not in the sources cache on this worker; their locators are unchanged since the round that located them and were not re-read.

## Source issues

- none
