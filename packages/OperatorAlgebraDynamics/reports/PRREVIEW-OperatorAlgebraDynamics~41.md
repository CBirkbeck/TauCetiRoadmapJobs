# Review of OperatorAlgebraDynamics (pull request #1137 at 0db5735)

**Verdict:** accepted

Incremental re-review of the 3 lines changed since 98be87d. The one finding of the previous review is repaired, the repair introduces no new problem, and the gate passes. No finding remains.

## Previous findings

- R01 — repaired: `TauCetiRoadmap/OperatorAlgebraDynamics/README.md` lines 2754–2755 now read "the continuous Hilbert fields of HilbertModules H5 alone do not supply these targets", the wording the previous review asked for.

## Verified sound

### The change

- `git diff 98be87d..0db5735` touches one sentence of `README.md` (2 insertions, 1 deletion) and nothing else: `Suggested.lean`, the manifest and every file outside the folder are identical to the head the previous review read. `git diff --stat origin/main...HEAD` lists only the folder's `README.md` and `Suggested.lean`.
- **The citation resolves.** HilbertModules is on main; its `TauCetiRoadmap/HilbertModules/README.md` line 356 is "H5. Continuous fields, continuous trace, and Dixmier–Douady theory", and its lines 400–406 build the continuous Hilbert field of a Hilbert `C₀(X)`-module and the converse. So "the continuous Hilbert fields of HilbertModules H5" names an object that section states. `H5` now occurs once in the README (line 2754), with its roadmap.
- **The sentence stays a non-dependency.** H5 is in no *Needs:* line and no supplier contract (the D5.Fields *Needs:* line names Mathlib, SelfAdjointSpectralTheory SA-B85 and VonNeumannAlgebras V4.0.Fields and V4.0.Decomposition only). The claim is true as mathematics: H5's fields are continuous fields over a space, and carry neither a quasi-invariant measure class nor the inter-fibre unitaries `U_γ` that D5 constructs.
- **Form of the new text.** No line over 100 characters is added, no process word, no pull-request number, no path; the wrapped line break falls inside prose.
- **Description.** It makes no statement about H5; its supplier list ("HilbertModules H1 and H3") is still correct, since H5 is not consumed. Counts (nine `TauCeti.*` imports, 23 declarations, 18 theorems, five definitions) are unchanged with the unchanged Lean file.

### Gate, dependency check, elaboration (run at 0db5735)

- **Gate:** every counter 0, `OK`; the worker's `gate.md` agrees, with `build=0`.
- **Dependency check:** `depcheck: 228 roadmaps, 2122 edges, 0 problem(s)`. No UPWARD, CYCLE or `moved:` line.
- **Elaboration:** `lake env lean` on `Suggested.lean` exits 0; the output is 18 `declaration uses sorry` warnings and no other line.
- **Signatures and padding:** `Suggested.lean` is byte-identical to the file read at 98be87d, so the previous review's comparison of all 23 signatures with the README and its one-tactic probe (all 18 theorems fail) stand.

### Seeded sample

- **D5.Fields** is the sampled target nearest the change (the changed sentence closes the paragraph after its *Needs:* line). Rechecked at this head: `williams-cpcsa-draft31` line 23776 has Theorem E.17 with separable H and second-countable X, on PDF page 417, printed p. 405 (offset 12), as the README cites; the source itself refers to "Theorem E.17 on page 405" at line 24413. The README's remark that Definition F.1 requires nonzero fibres is unchanged.
- **Saddle flow** and **Concrete Cuntz families** lie in untouched text; the previous review's checks (rows 19 and 8, 21 below) carry forward.
- The README flags no locator as unverified.

### Overlaps and ownership

- `scratch/overlaps.md` is unchanged in substance: no dropped id, none that only an open revision defines. The one conflicting pull request, the pin bump #1187, is ordered in the description's generated `merge-order` block (this pull request first).
- The change states no new object, so the previous review's ownership audit is unaffected.

### Cross-roadmap citations and library declarations

- Resolved this round: 1 (HilbertModules H5, main at 8101f2c, line 356).
- Carried from the previous review, whose text and pins are unchanged: 50 Mathlib names and 107 Tau Ceti names checked at the pins, and the CStarAlgebras, VonNeumannAlgebras, HilbertModules, BanachAlgebras, AmenableGroups, SelfAdjointSpectralTheory, LieGroupoidsPoisson and FreeProbability sections it lists.

### Adversarial table

Row 35 is the changed statement, with values computed at this head. Rows 1–34 are untouched statements, carried from the previous report (review at 98be87d), which computed them.

| # | Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|---|
| 1 | `exists_integratedOperator` | ℤ, `f=δ_0⊗a+δ_1⊗b` | `T=π(a)+π(b)U_1`; `‖integrand‖≤‖f(g)‖‖ξ‖` | holds (previous report, row 1) | none |
| 2 | `exists_covariantRepresentation_integratedFull` | G trivial, `A=ℂ²`; `L=0` | recovered `(L,1)`; span of `L(x)ξ` is 0 for `L=0`, excluded by `hL` | holds (row 2) | none |
| 3 | `fullCrossedProductMap_exact` | `I=ℂ⊕0` in `ℂ²`; `I=A` | kernel of second projection is first summand; `I=A` gives B=0 | holds (row 3) | none |
| 4 | `CentralCocycle`, `centralIntegrated_twistedConvolution` | ℤ/2, `ω(a,a)=−1`, `U_a=i` and `U_a=1` | `δ_a*δ_a=−δ_e`, `T²=i²=−1`; `U_a=1` gives `1≠−1` | holds (row 4) | none |
| 5 | `continuous_of_measurable_monoidHom` | Hamel ℚ-linear map | discontinuous, hence not Borel | holds (row 5) | none |
| 6 | `existsUnique_groupTopology_of_isAnalyticBorelSpace` | ℝ with φ swapping `[0,1)`, `[1,2)`; counting measure | `φ(U−1)=(−3/2,−1)∪[1,3/2)` not open; counting measure not σ-finite | holds (row 6) | none |
| 7 | `injective_integratedFull_regular_of_amenable` | ℤ; F₂ with the four-generator sum | `‖λ(f)‖=sup\|f̂\|`; trivial character gives 4, `λ(h)/4` has spectrum in `[−1,1−ε]` | holds (row 7) | none |
| 8 | `exists_residue_family` (sampled) | n=2, k=3; n=1 | `S_j*b_k=[k%n=j]b_(k/n)`; `S_0*b_3=0`, `S_1*b_3=b_1`; `Σ_jS_jS_j*b_k=b_k` | holds (row 8) | none |
| 9 | `transitive_commutant_scalar` | swap on two points; trivial action | `(f(i)−f(j))T_ij=0`; trivial action leaves `diag(1,0)` | holds (row 9) | none |
| 10 | `exists_powers_partition` | `F={b}`, `w=ab²`; ℤ at N=3 | `wbw⁻¹=aba⁻¹`; ℤ fails (C at most ½, D at most ⅓) | holds (row 10) | none |
| 11 | `reducedFreeGroup_isSimpleRing`, `_trace_unique` | singleton basis | `C(𝕋)`: `ev_z(λ(b))=z≠0=τ(λ(b))` | holds (row 11) | none |
| 12 | `exists_fullGroupCStarAlgebra_equiv_zeroAtInfty_dual` | ℤ/2; S₃ | `δ_a↦(1,−1)`, `(δ_a*δ_a)^=(1,1)`; `C*(S₃)=ℂ²⊕M_2` | holds (row 12) | none |
| 13 | `exists_fullGroupCStarAlgebra_dual_equiv_zeroAtInfty` | G=ℤ; ν↦cν | unitary at z goes to `n↦zⁿ`; f for cν is cf | holds (row 13) | none |
| 14 | `lcaWeyl_classification` | ℤ; ℤ/3 | phase `conj(z^s)`; `U_1V_χU_1*=ω⁻¹V_χ`, `V_χU_1V_χ*=ωU_1` | holds (row 14) | none |
| 15 | `cuntz_isSimpleRing` | n=1 bilateral shift; H=0 | `C(𝕋)` not simple; zero ring not simple | holds (row 15) | none |
| 16 | `mem_extremePoints_kmsStates_iff` | `ℂ⊕ℂ`; `M_2`, `K=diag(0,1)` | `(½,½)` neither extreme nor factor; Gibbs state extreme and factor | holds (row 16) | none |
| 17 | `vonNeumannEntropy_strong_subadditivity` | GHZ; `\|0⟩⟨0\|⊗Φ⁺` | `0+log2≤2log2`; `0+log2=log2+0`, wrong marginal gives `log2≤0` | holds (row 17) | none |
| 18 | D1 convolution and involution | ℤ/3 shift on ℂ³ | `(f*g)(2)=e_0α_1(e_2)=e_0`; inverse convention gives 0 | holds (row 18) | none |
| 19 | Saddle flow (sampled) | `(1,1)`, `(−1,−1)`, `(1,−2)` | three orbits, two with `xy=1`; `{x>0,\|xy\|<ε}` open, saturated, misses the origin | holds (row 19) | none |
| 20 | D5.Fields (sampled) | `N={0}` below ½, `{0,1}` from ½; `S=[0,½]` | `1_(x≥½)E_01` is a field, constant `E_10` is not; zero fibres give `L²(S)`; E.17 at line 23776, printed p. 405 (rechecked) | holds (row 20) | none |
| 21 | Concrete Cuntz families (sampled) | basis change W | `WS_jW*b′_k=b′_(nk+j)` | holds (row 21) | none |
| 22–34 | Conventions and Checks (cocycle directions, `E_ω` inverse, regular module, rotation algebra, P₂ estimate, D5 dictionaries, KMS sign, `U_σ`, `a†`, Weyl operators and moments, D9 norms, relative entropy) | as in the previous report | e.g. `uv=e^(2πiθ)vu`; `ω(a*a)=1/(e^(βε)+1)`; `U_σU_τe_123=e_3⊗e_1⊗e_2`; bound `1/(2+16e)`; `−2log2+log2=−log2` | hold (rows 22–34) | none |
| 35 | D5 sentence on continuous Hilbert fields (changed) | the id `H5`; X a point; X=`[0,1]` with the constant field ℂ | README: 1 occurrence of `H5`, with "HilbertModules"; main HilbertModules line 356 is H5; over a point H5 gives one Hilbert space and no measure class; the constant field over `[0,1]` has section space `C([0,1])`, which fixes no quasi-invariant measure and no `U_γ` | holds; citation now complete | repaired |

## Not verifiable

Unchanged from the previous review; the manifest records these as uncertified and they were not read:

- **Cuntz 1977, §1**, behind the sampled "Concrete Cuntz families" target: checked by computation only (rows 8, 15, 21).
- **Bratteli–Robinson 1 and 2, Renault 1980, Brown–Ozawa Proposition 5.1.3, Rudin's Fourier Analysis on Groups**: cited by locator; checked on instances only.

## Source issues

- none
