# Review of SpecialFunctionsGroupModels (pull request #2694 at d7697fa)

**Verdict:** accepted

**Summary.** Accepted: no finding remains. Both findings of the previous review are repaired (the weight spaces of the left regular representation of the circle now carry the sign `−j`, and the weight decomposition is a theorem of its own, separate from the weight law of matrix elements), the three small corrections are taken up, and the new boundary with VonNeumannAlgebras Layer 9 was recomputed and holds. There is one format note, not blocking. As before, none of the six cited books could be read from a legal copy, so no source locator was verified; that is left to the human reviewers.

## N01 — The multiplicity-one theorem is still called `rank_fixedSubmodule_le_one` (README 5.3, line 1033; `Suggested.lean` line 1245), though `fixedSubmodule` no longer exists and the statement is about `(U.restrict K.subtype).invariants`; a name such as `rank_invariants_restrict_le_one` would match what it states.

## Previous findings

- R01 — repaired: "For the left regular representation `f ↦ f(u⁻¹ ·)` of the circle … `weightSpace j` is the line of `fourierLp 2 (-j)`", with the negative control "`fourierLp 2 1` lies in `weightSpace (-1)`, not in `weightSpace 1`".
- R02 — repaired: `isHilbertSum_weightSpace` takes only `U`, `hU`, `κ`, `hκ` and concludes the Hilbert sum; the transformation law is the separate `matrixElement_weightSpace`, and README 3.3 has the two bullets.
- C01 — repaired: `fixedSubmodule` is deleted; the three statements of 5.3 use `(U.restrict K.subtype).invariants`, and the supplier contracts name `ContRepresentation.restrict`, `invariants` (Mathlib) and `mem_invariants_restrict` (Tau Ceti). The leftover theorem name is N01.
- C02 — repaired: "`k_{2π} = −1`, a sanity check of the coordinates (`SU11.coe_rotation_two_pi`, the Check of 0.1)"; the module docstring lists it among the five sanity checks.
- C03 — repaired: Scope and ownership says "VonNeumannAlgebras Layer 9 owns the holomorphic discrete series of `PSL₂(ℝ)` on the upper half-plane for even weight `n ≥ 2`", with the Cayley relation; 2.3 points to it.
- N01 — repaired: "The numbers are those of the layers above"; "The Checks of the layers compare with those functions numerically".
- N02 — not changed (the two values taken by `h.choose`, kept by the author with a docstring); nothing is wrong and it is not raised again.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 3.3 Check, left regular representation of the circle | `f = e^{inθ}`, `u = e^{iφ}`; `n = 1`; `j = 0` | `(U(u)f)(θ) = e^{in(θ−φ)} = u^{−n} f`; `fourierLp 2 1` has weight `−1`; readings agree only at `0` | holds | none |
| 3.3 `isHilbertSum_weightSpace` | `H = 0`; `κ` trivial; unitarity dropped; continuity dropped | all spaces `0`, sum holds; weight `0` is `H`, others `0`; orthogonality fails; discontinuous characters of the circle escape | holds, both hypotheses needed | none |
| 3.3 `matrixElement_weightSpace` | general; circle on `L²`, `e_n = e^{inθ}`, `g` rotation by `φ` | `⟪U(κu₁)⁻¹e_m, U(g)e_n⟫u₂^{jn}`, `conj(u₁^{−jm}) = u₁^{jm}`; `δ_{mn}e^{−in(φ+θ₁+θ₂)} = u₁^{−n}u₂^{−n}D(g)` | holds | none |
| 2.1 weights and `k_{2π}` | `m = n − ε`, `ε ∈ {0, ½}` | `e^{2πi(n−ε)} = (−1)^{2ε}`: `1`, `−1` | holds | none |
| 5.3 `K`-fixed vectors as invariants of the restriction | definitions at the pin | carrier `{v | ∀ k : K, U(k)v = v}`; equals `{v | ∀ k ∈ K, U k v = v}` by `mem_invariants_restrict` | same object as before | N01 |
| Scope: Cayley relation with VonNeumannAlgebras Layer 9 | `k = 5`, three random `w`; `k = 2`, `f = 1` | `1 − |z|² = 4y/|w+i|²`, `|dz/dw|² = 4/|w+i|⁴`; `0.0739796748` both sides; `∫∫|w+i|⁻⁴ = π/4 = 4⁻¹π/1` | holds | none |

The rows of the previous review for the untouched statements stand as in the previous review, of `6d84140`.

- Source locators checked against the text: 0 (no legal copy of any of the six books; the change adds no locator).
- Library declarations opened at the pin: `ContRepresentation.restrict` and `ContRepresentation.invariants` (Mathlib `RepresentationTheory/Continuous/Basic.lean:446, 477`), `ContRepresentation.mem_invariants_restrict` (Tau Ceti `RepresentationTheory/Continuous/Invariants.lean:105`); the README attributes each to the right library.
- Cross-roadmap citations resolved: VonNeumannAlgebras Layer 9 on main (README lines 2513–2518: weighted Bergman spaces on the half-plane, reproducing kernels, unitarity, square integrability, formal degree, even weight `n ≥ 2` for `PSL₂(ℝ)`), as the new boundary describes it.
- Dependency check: `depcheck: 172 roadmaps, 2004 edges, 0 problem(s)`; the roadmap is not in the merge order yet and is placed after its last supplier; no UPWARD or CYCLE line; no change outside the folder.
- Elaboration: `lake env lean` on `Suggested.lean`, 80 `sorry` warnings (76 theorems, 4 instances of proposition-valued classes), no error; the elaborated types of the five changed statements compared with the README, binders all explicit.
- One-tactic probe on a copy: `isHilbertSum_weightSpace` and `matrixElement_weightSpace` tried with `simp` on the definitions, `rfl`, `infer_instance`, `exact?`; neither closes.
- Description against the head: 76 theorems and 4 instances with `sorry`, 62 definitions (57 `def`, 2 `abbrev`, 3 `structure`), five sanity checks, VonNeumannAlgebras Layer 9 and `mem_invariants_restrict` named; all as stated, the title and summary unchanged in what they describe.

Overlap check: read SpecialFunctionsSU2MatrixElements (open), NoncompactQuantumSymmetry (main), QuantumFoundations (open), QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups (open), as in the previous review, and VonNeumannAlgebras Layer 9 (main) for the change; the general matrix element and the Gel'fand-pair theory are owned here; the `SL(2,ℝ)` dual, the Heisenberg models and the Euclidean adapters are NoncompactQuantumSymmetry's; the unitary Stone–von Neumann theorem is MetaplecticAutomorphicForms'; the half-plane Bergman model of even weight and its formal degree are VonNeumannAlgebras Layer 9's, the disc model for all `k ≥ 2` is this roadmap's; nothing else shared.

Source independence: changed passages only; 0 passages compared with 0 sources (none of the six texts could be read; the change adds no locator and no layer); largest share Vilenkin–Klimyk Vol. 1, 32 of 90 locator citations; contents not compared with its table of contents, which could not be opened.

Research link: The `SU(1,1)`, Heisenberg and motion-group models with their weight and Casimir dictionaries are the concrete forms of the unitary duals that NoncompactQuantumSymmetry classifies; Layer 5 is the Gel'fand-pair harmonic analysis of Dieudonné 1980 and Wawrzyńczyk 1984 that the planned special-function sequels use. Rests on the README's scope and consumer sections.

## Not verifiable

- Vilenkin–Klimyk, Vol. 1 (Kluwer 1991): paywalled; every locator into it unverified.
- Klimyk–Vilenkin, Encyclopaedia of Mathematical Sciences 59 (Springer 1995): paywalled.
- Wawrzyńczyk (Reidel 1984): paywalled.
- Dieudonné, CBMS 42 (AMS 1980), Miller (Academic Press 1968), Edmonds (Princeton 1957): no legal copy found in the previous round; not looked for again.
- The four misprints the README attributes to its sources, for the same reason; the corrected forms were computed in the previous review and hold.

Automatic checks set aside as false positives: the four `instance … := by sorry` declarations for the motion groups are instances of proposition-valued classes (topological group, local compactness), so they are theorems stated as instances and carry no admitted data. The remark that `multiplierRep` takes its value by choice is true but not a defect: the uniqueness statement determines the value and the docstring says so.

## Source issues

- none

## For the human reviewers

- **Not tested.** No text of any of the six cited books was readable legally, so neither wording nor arrangement was compared with a source; Vilenkin–Klimyk Vol. 1 has the largest share (32 of 90 locator citations).
- **Licence.** README "Prior formalization" says the names and statements of 0.1, 1.1–1.3, 2.1 and 3.1–3.2 are those of the author's own repository `bjbraams/lean-SFVK`, stated there as Apache-2.0; that repository was not opened.
- **Licence.** Three texts (Dieudonné, Miller, Edmonds) were asked of the operator in the previous round; the other three resolve only to paywalled pages.
