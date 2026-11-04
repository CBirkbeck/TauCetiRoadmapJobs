# Review of SmallRamificationAndAbelianVarietyBaseCases (pull request #970 at d6e456e)

**Verdict:** needs changes

## R01 (P1) — The Kummer supplier does not provide localization to a completion

**Location:** `TauCetiRoadmap/SmallRamificationAndAbelianVarietyBaseCases/README.md:154`, “Field Kummer cohomology and localization compatibility”; application at line 1429.

**Claim:** ProfiniteCohomology Layer 9 / `kummerIso_res` supplies the restriction square needed for the S-unit map to the local field at p.

**Witness:** `TauCeti/FieldTheory/GaloisCohomology/Kummer.lean:573,682` requires `L →ₐ[K] SeparableClosure K`. No embedding ℚ₂ → ℚ̄ exists (uncountable versus countable). ProfiniteCohomology Layer 9 supplies only the finite-separable-extension square.

**Repair:** Cite the pinned field Kummer isomorphism directly, and own the missing completion comparison here, or identify a genuinely earlier supplier for it. State the continuous Galois restriction map using a chosen embedding of separable closures in the correct direction, its coefficient map, and the square sending the class of a to its local class. Do not describe the existing algebraic-extension theorem as that square. A discriminating check is ℚ → ℚ₂ with n = 2: [17] is nonzero globally and zero locally, while [−1] stays nonzero. This repair expresses both values without an impossible embedding ℚ₂ → ℚ̄. No gap with this contract is declared.

## R02 (P2) — Class-field-theory supplies run upward

**Location:** `TauCetiRoadmap/SmallRamificationAndAbelianVarietyBaseCases/README.md:139`, “Local Artin reciprocity on unit filtrations and equivariance under field automorphisms”; also lines 140, 809, 1126, 1689 and 1771.

**Claim:** ClassFieldTheory Layers 7, 11–13 can supply the local reciprocity, character, Hilbert/ray class and conductor calculations used here.

**Witness:** The gate places this roadmap at 107 and ClassFieldTheory at 261. The sections exist, but the supplier is later: §4.7 already uses its degree-18 field’s ray classes.

**Repair:** Move ownership of the required general reciprocity/class-field inputs to an earlier owner, and have the later ClassFieldTheory consume that owner; then replace every affected citation and dependency. Merely deleting the dependency lines leaves the proof inputs unowned. The order test for the repaired ownership must put the actual supplier before 107; the degree-18 ray-class calculation must still have a named source of reciprocity. The present checker reports UPWARD, not a successful relocation.

## R03 (P2) — The analytic continuation input also runs upward

**Location:** `TauCetiRoadmap/SmallRamificationAndAbelianVarietyBaseCases/README.md:132`, “Trivial-character meromorphic extension, completed functional equation and poles of Dedekind zeta”.

**Claim:** ArithmeticGaloisRepresentations §2.7 / LFunctions Layer 5 supplies the analytic input to §1.0.

**Witness:** The gate gives 107 → 311 for LFunctions. ArithmeticGaloisRepresentations §2.7 itself assigns the functional equation to LFunctions Layer 5 (`README.md:2237–2252`); citing that intermediate roadmap does not remove the dependency.

**Repair:** Give the general continuation, functional equation and pole theorem an owner before this roadmap, with LFunctions importing it, and update both the contract and §1.0. Preserve the number-field generality. Test the repaired contract on ℚ, with poles at 0 and 1 and signature (1,0), and ℚ(√−3), with signature (0,1); a right-half-plane Dirichlet series does not supply either completed functional equation.

## R04 (P2) — Remove the upward ProfiniteCohomology dependency

**Location:** `TauCetiRoadmap/SmallRamificationAndAbelianVarietyBaseCases/README.md:154`, “ProfiniteCohomology, Layer 9 / `kummerIso`, `kummerIso_res`”; also line 1689.

**Claim:** ProfiniteCohomology can be consumed here.

**Witness:** The gate gives 107 → 368. The movable check refuses relocation because PeriodsAndSpecialValues, a consumer, is at 355. The field isomorphism itself already exists at the Tau Ceti pin, `Kummer.lean:384`.

**Repair:** Import the existing pinned Kummer results in the supplier contract, retaining their invertibility and embedding hypotheses, and remove this roadmap dependency. Supply the additional local square as in R01. At n = 2 over ℚ and ℚ₂, `IsUnit (2 : K)` holds in both fields; the two native isomorphisms apply. Their existence alone does not prove their compatibility. Re-run the dependency check after the ownership repair; do not move this roadmap past its consumer.

## R05 (P2) — The domain hypothesis disappears from the rank and simplicity definitions

**Location:** `TauCetiRoadmap/SmallRamificationAndAbelianVarietyBaseCases/Suggested.lean:167–180`, “`variable {R : Type} [CommRing R] [IsDomain R]`”. README §1.10 specifies constant rank over arithmetic domains.

**Claim:** `order` and `IsSimpleGroupScheme` are the domain specializations described in their docstrings and the README.

**Witness:** Both elaborated signatures have only `[CommRing R]`. The native constant C₂ scheme over `ZMod 1` has `order = 1`, proved by `simp [order]`, versus cardinality 2.

**Repair:** Retain `[IsDomain R]` explicitly in each definition’s signature, removing the redundant section instance, or use a suitable `include`. The scratch repair elaborated with only the original `sorry` warnings and printed the domain parameter on both definitions. It excludes the zero-ring instance while retaining ℤ and the intended domains. The reason for the value 1 is pinned `Module.finrank_subsingleton`, `Mathlib/LinearAlgebra/Dimension/Finrank.lean:64`; it is not a cardinality computation. `schemeHom` itself does not need a domain.

## R06 (P2) — Snowden’s realization is narrowed to the rational-field route

**Location:** `TauCetiRoadmap/SmallRamificationAndAbelianVarietyBaseCases/README.md:2088`, “`ρ:G_ℚ → GL₂(ℚ̄_p)`”; the same restriction starts at §5.0b, and §5.0c retains only odd-degree fields.

**Claim:** The realization endpoint and its construction inputs are planned only at the generality needed by the rational terminal argument.

**Witness:** snowden line 1525, Proposition 9.4.1, p. 29: totally real F, (A1), (A2), and either odd degree or an indecomposable restriction at some v ∤ p. Lemma 9.4.3 supplies the even-degree geometric branch.

**Repair:** State and own that full realization theorem and the missing branch of its inputs; make the ℚ case an application. Retain (A2) rather than declaring it automatic over arbitrary F. Tests: [ℚ:ℚ] = 1 and [ℚ(ζ₅):ℚ] = 4 recover the present case; for F = ℚ(√5), [F(ζ₅):F] = 2, so the exceptional projective-image hypothesis cannot be dropped; an even-degree F requires the finite-place branch. The existing general descent lemma already has the appropriate base-field scope. This is a general-library scope defect, not a claim that the stated ℚ specialization is false.

## R07 (P2) — Fontaine’s other stated base fields are omitted

**Location:** `TauCetiRoadmap/SmallRamificationAndAbelianVarietyBaseCases/README.md:1273`, “The theorem here is its rational-field case”.

**Claim:** The roadmap uses only the ℚ specialization of the cited nonexistence theorem.

**Witness:** fontaine line 89, Corollary, p. 517, and line 915, §3.4.6, pp. 536–537, also cover ℚ(i), ℚ(√−3) and ℚ(√5). This roadmap supplies no target or owner for these cases.

**Repair:** Retain the full four-field endpoint, add the required field-specific finite-flat/arithmetic inputs with ownership, and present the rational result as its application. Generalize the integral-model predicate over the relevant rings of integers and state the resulting native-carrier headline. Test the zero-dimensional variety over each of the four fields: dimension 0 and one point remain allowed. The endpoint excludes every positive dimension over each field, not only over ℚ. The source’s Theorem B, pp. 516–517, distinguishes the split-filtration cases from the extension case over ℚ(√5); preserve that distinction. As in R06, the current specialization is true but does not meet the required source-supported generality.

## R08 (P3) — API and Check names claim declarations that the acceptance file does not contain

**Location:** `TauCetiRoadmap/SmallRamificationAndAbelianVarietyBaseCases/README.md:96–98`, “Names of interfaces elsewhere in this document specify mathematical targets; they do not assert declarations in that file.” Examples occur at lines 1326, 1342 and 1990–1995.

**Claim:** The README makes an exception to the repository’s own-name convention and gives undeclared API/Check names such as `SemistableCategory.inertia_pow` and `GL2TypeAction.lambdaAdicRep`.

**Witness:** Neither name is declared in the 242-line `Suggested.lean`; printing all 31 declarations confirms this. The quoted exception contradicts the requested README form. The scanner’s zero count does not make that exception valid.

**Repair:** Remove the exception and write these API bullets and Checks as mathematical prose. Keep code names for actual headline declarations, their necessary definitions and genuine suppliers. Do not pad `Suggested.lean` with these APIs. For example, state the inertia p-power identity and the marked λ-factor’s dimension two in prose; their discriminating examples remain N² = 0 and dimension 2 versus whole-Tate dimension 4.

## Verified sound

The worktree head is the requested commit. There is no diff outside this roadmap folder, and the worktree remained clean. I read the normative README and CONTRIBUTING, the entire 2,566-line roadmap and 242-line Lean file, and main-branch examples `Completed/NumberFieldArithmetic/README.md` and `TauCetiRoadmap/EffectiveBounds/README.md`. There was no previous review to reconcile. This is repairable, so the verdict is not rejection.

The worker’s gate has exactly three failures, all dependency-order failures (R02–R04). All its text, import, stray-file, outside-folder and targeted-build checks pass. The independent requested movable dependency check produced:

```text
not movable: SmallRamificationAndAbelianVarietyBaseCases consumes ProfiniteCohomology (#368) and is consumed by PeriodsAndSpecialValues (#355), which comes first: moving SmallRamificationAndAbelianVarietyBaseCases after ProfiniteCohomology would put a supplier after a consumer, a cycle through SmallRamificationAndAbelianVarietyBaseCases
UPWARD: SmallRamificationAndAbelianVarietyBaseCases (#107) -> ClassFieldTheory (#261) at README lines [139, 140, 809, 1126, 1689, 1771]
UPWARD: SmallRamificationAndAbelianVarietyBaseCases (#107) -> LFunctions (#311) at README lines [132]
UPWARD: SmallRamificationAndAbelianVarietyBaseCases (#107) -> ProfiniteCohomology (#368) at README lines [154, 1689]
depcheck: 163 roadmaps, 1178 edges, 3 problem(s)
```

The `not movable` message is an obstruction to the proposed reordering; I have not relabelled it as proof of a separate existing graph cycle. No order file was changed.

Lean verification: after building the missing imported `TauCeti.AlgebraicGeometry.AffineGroupScheme.CartierDuality.Constant` object, `lake env lean` on the unchanged acceptance module succeeded with only 13 `sorry` warnings. A scratch copy printed all 31 declarations: 18 definitions/abbreviations and 13 theorems. R05 is the material lost-hypothesis mismatch. The residual helper predicates also do not retain unused `Fintype`/`DiscreteTopology` binders, but the arithmetic theorems explicitly retain them, as their README scope requires. Finite compatible p-adic extension hypotheses survive on the local bounds. The Fontaine hypothesis retains the group identification of the generic fibre, smoothness, properness and geometrically connected fibres.

Each of the 13 admitted theorems was tested in a scratch copy with `rfl`, `simp` and `infer_instance`; none closed. Object searches and reading the pinned APIs found no one-lemma proof of one of these headlines. No padding finding is made. No `set_option`, admitted data, free predicate standing in for missing geometry, circular conclusion hypothesis, or copied source passage was found in the acceptance file.

The README’s end theorems are: the two sharp local different bounds; the unconditional Poitou bound; Tate and Serre nonexistence; simple finite-flat two-group classification; Fontaine nonexistence; Schoof’s five field criteria and geometric five-prime theorem; marked GL₂ realization/descent and its reduction interface; ordinary terminal nonexistence; weight-two and selected p+1 exclusions; the characteristic-eleven twist dichotomy; the small-weight theorem and its unrestricted characteristics 2,3,5,7 corollary; Paso 6; and the nine-row conjunction. The 13 statable headline signatures currently selected appear in Lean. Its docstring explicitly identifies the missing semistable, Tate-factor, Hodge, Hilbert-attachment, compatible-family and Serre-weight carriers for the other endpoints, and the missing meromorphic Dedekind-zeta extension. There is no substitute theorem on unconstrained scalar data. R06–R07 concern expanding the planned endpoints to their required source-supported scope.

**Seeded source sample (15 targets).** Sources were obtained through the sources service from legal author, arXiv, Numdam or publisher copies. Published Schoof and the specified Snowden preprint were checked separately from other versions. The sample has 12 targets with readable supporting statements/proof steps, two analytic targets with readable contextual support but missing displayed formulas, and one Minkowski target verified directly at the library pin rather than by a numerical assertion in the survey. These distinctions matter; the numerical checks below do not certify an unreadable display.

| Target | Locator and extraction evidence | Comparison |
| --- | --- | --- |
| 1.4 Minkowski thresholds | odlyzko-survey line 49, §1, p. 119; pinned `NumberField.abs_discr_ge'`, Discriminant/Basic.lean:208 | The survey supplies context, not the exact three thresholds. The README correctly derives its own thresholds from the pinned inequality; computations below check all three. |
| 1.6 Full-strip positivity | odlyzko-survey lines 119–129, §2, p. 122 | Full-strip rather than critical-line positivity is required. The supplied Lorentzian/product proof has the correct scaling. The displayed source formula is absent from extraction; see Not verifiable. |
| 1.7 Poitou bound | odlyzko-survey lines 107–132, §2, pp. 121–122 | The hypotheses and dropping nonnegative terms match the readable prose. Exact equation (2.3) cannot be certified from the extraction. Independent kernel, pole and numerical tests are recorded below. |
| 1.8 Finite-flat different bound | fontaine lines 28–43, Théorème A and corollary, pp. 515–516 | The source gives the strict normalized bound n + 1/(p−1) for pⁿ-torsion; the n = 1 application and additional tame factors are correct. |
| 2.1 Level one | khare lines 40–47, §1, p. 2; dieulefait-pacetti lines 106–110, Thm 1.1, p. 3 | Finite coefficients, continuity, absolute irreducibility, oddness and ramification outside p match. No weight or finite-flat condition is smuggled into level one. |
| 3.3 Ext and filtration | mazur lines 883–884, I Prop 2.1, p. 49; lines 1254–1276, I Prop 4.5 proof Steps 1–2, pp. 59–60; fontaine lines 909–914, p. 536 | Correct Ext direction. The first two reordering steps apply at two; the later odd-prime splitting step is not imported. The final filtration need not split. |
| 3.4 Isogeny point counts | schoof lines 273–284, Prop 3.1 proof, pp. 850–851 | The base finite field is fixed. Inseparable isogenies are allowed; separability is required of 1−F, whose differential is the identity. |
| 3.5 Good-reduction contradiction | fontaine lines 915–933, Cor 2, pp. 536–537; schoof lines 273–284 | The torsion growth versus a fixed point count is supported. The rational specialization is true; R07 records the omitted source cases. |
| 4.1 Semistable category | schoof lines 91–108, Def 2.1(ii), p. 848; following §2.1 | Finite flat commutative p-groups, p ≠ ℓ and square-zero inertia are the exact setting. The README correctly rejects closure under arbitrary extensions. |
| 4.2 Fixed cyclotomic base | schoof lines 235–284, Prop 3.1 proof, pp. 850–851 | The cyclic-abelianization argument and the same base for every torsion level are in the proof. |
| 4.3 Ext obstruction | schoof lines 307–313 and 422–445, Prop 4.1 and Cor 4.2, pp. 851–853 | The mod-8 and mod-9 conditions and all five vanishing pairs agree. At two it is ±ℓ being a local square, after allowing the −1 direction. The claimed supplier for the localization map fails separately (R01). |
| 4.4 Field criterion | schoof lines 507–576, Prop 5.1, pp. 853–854 | The auxiliary F, M, relative unramifiedness, strict discriminant inequality and p-power relative degree all match. Absolute unramifiedness at ℓ would be wrong. |
| 5.1 GL₂-type | snowden lines 1538–1550, §9.4, p. 29; AbelianSchemesAndArithmeticModuli A6.12 | The representation is a marked coefficient factor, not the whole Tate module. The degree-equals-dimension action and rank-two calculation agree with the supplier. The source uses the standard GL₂-type terminology; the roadmap spells out the marking. |
| 5.2 Realization descent | snowden lines 1553–1582, Lemma 9.4.4, pp. 29–30 | Both irreducibilities, finite F′/F, coefficient action, induction, multiplicity one and F-rational endomorphisms are retained. The specialized Faltings comparison is explicitly a target here. |
| 5.3 Weight-two realization | snowden lines 1525–1528 and 1584–1596, Prop 9.4.1, pp. 29–30; lines 84–93 and 288–289 for weights and (A1)/(A2) | The ℚ instance and Hodge sign agree; (A2) is automatic there. The source’s larger scope gives R06. |

**Adversarial computations.** The rows below distinguish exact algebraic/counting computations from approximate real integrals. Real-integral values were independently recomputed by Simpson quadrature with 20,000 panels and the analytic tail; they are diagnostic approximations, not certified interval proofs. “Retain” means the tested instance exposes no defect, not that an admitted theorem has been formally proved. R01 and R05 contain the failing witnesses. Every sampled target and every headline is included, together with the definitions, proof transitions and boundary conventions used by them.

| Statement or convention | Instances tried | Values on the two sides | Result / change |
| --- | --- | --- | --- |
| §1.0 completed-zeta normalization | ℚ; ℚ(√−3) | (n,r₁,r₂,log abs(d)) = (1,1,0,0); (2,0,1,log 3); omitted completion constant is 2^r₂ = 1 or 2 | Constant cancels from logarithmic derivative; retain. |
| §1.0 pole sign | F_b | 4∫₀∞ F_b(x)cosh(x/2)dx = 4b·4/π² = 16b/π² | Subtracted, not added; retain. |
| §1.1 localRootDiscrExp | ℚ₂(i); ℚ₂(√2) | d/e = 2/2 = 1; 3/2 = 1.5 | Retain. |
| §1.1 discriminant normalization | ℚ₂(ζ₁₂) | e=f=2, d=2; fd/[E:ℚ₂] = 4/4 = 1; wrong d/[E:ℚ₂] = 1/2 | Retain. |
| §1.1 vanishing and tame formula | Base field; unramified quadratic; tame e=3 | 0/1=0; 0/1=0; (e−1)/e=2/3=1−1/3 | Both directions of the zero test separate wild ramification. |
| §1.1 tower and unramified extension | Unramified quadratic over ℚ₂(√2) | d'=3, e'=2; δ'=3/2=3/2+0/2 | Retain; compatible valuations needed. |
| §1.1 upper-jump formula | Tame e=3; ramified quadratic with jump 2 | 1−1/3=2/3; (1−1/2)(2+1)=3/2 | Tame break and right-limit convention agree. |
| §1.1 global product | ℚ(√−3); ℚ(ζ₉)⁺ | rd=√3=3^(1/2); rd=81^(1/3)=3^(4/3) | Retain. |
| §1.2 prime-to-p abelian inertia | q=2 and q=3 | Divisor of q−1: order 1; order at most 2 | Base residue field, not enlarged residue field. |
| §1.2 nonabelian warning | S₃ over ℚ₂ as a tame local image; wild S₃ over ℚ₃ | Tame inertia can have order 3 although base q−1=1; wild P=C₃ has a fixed line | Abelian/nontrivial-wild hypotheses distinguish the statements. |
| §1.2 Borel conjugation | s=diag(−1,1), u=I+E₁₂ over 𝔽₃ | sus⁻¹=I−E₁₂; ratio ψ₁/ψ₂=−1 | Retain direction. |
| §1.2 cubic unit map, unramified | ℚ₃, u=1+3a | u³−1=9a+27a²+27a³; depth 1 maps onto depth 2 | Retain U²⊆(U¹)³. |
| §1.2 cubic unit map, e=2 | π²=−3 | (1+aπ)³−1 at degree 3 is (a³−a)π³; over 𝔽₃ its image is 0, kernel has 3 elements | Critical cokernel at most 3; involution acts by (−1)^i. |
| §1.3 char-two main bound | ℚ₂(ζ₈), embedded V₄ in GL₂(𝔽₄) | Conductors 0+2+3+3=8; δ=8/4=2 | Equality attained; retain ≤. |
| §1.3 char-two sharper bound | ℚ₂(√2), wild order 2 | δ=3/2 and bound=3/2 | Retain; no strict inequality. |
| §1.3 char-two nonabelian branch | Wild order 4, last group a=1 | 3−1−2/4=3/2=2−2/4 | Retain. |
| §1.3 char-three main bound | Splitting field of X³−3 | e=6,d=11, wild order 3; 11/6=13/6−1/3 | Equality attained. |
| §1.3 char-three larger wild group | ℚ₃(ζ₃,∛2,∛3) | Wild order 9; 37/18=13/6−1/9 | Retain. |
| §1.3 two sign branches | P=3, a=3; ε=+1 | ε=−1 gives 5/2−1/3−1/3=11/6; ε=+1 gives 2−3/6=3/2≤11/6 | Retain. |
| §1.4 Minkowski thresholds | n=3,6,12 | B_n^(1/n)≈2.140745>2; 3.154628>3; 4.043240>4 | All three thresholds pass. |
| §1.4 propagation | n=3; threshold 2 | B₄/B₃=(π/4)(4/3)^6≈4.4129>2 | Ratio formula has correct factorial cancellation; increases with n. |
| §1.5 kernel definition | x=0, ±1/2,1,2 | 1; 1/π on both sides; 0; 0 | Retain evenness/support normalization. |
| §1.5 convolution and integral | x=0; positive half-line | 2∫_{−1/2}^{1/2}cos²(πt)dt=1; ∫₀∞g=4/π²≈0.405285 | Retain. |
| §1.5 derivative/nonnegativity | x=3/4; x=0,1 | g(3/4)=√2(1/(2π)−1/8)≈0.048302>0; g'(0)=g'(1)=0 | Truncated cosine alone fails. |
| §1.6 cosh ratio | a=0, ±1/2,1 | sech(x/2); 1; cosh(x)/cosh(x/2) unbounded | Endpoint included, outside strip excluded. |
| §1.6 Lorentzian normalization | Frequency 0 and c | Correct transform 1 and 1/2; unscaled density gives 1 and 1/(1+4π²)≈0.024705 | Retain 2π scaling. |
| §1.6 full-strip transform | a=±1/2, f=g(·/b) | f·k_a=f; transform at 0 is ∫f=8b/π²≥0 | Boundary not just central line tested. |
| §1.7 test function | x=0,b/2,b; b=0 | F_b=1, 1/(πcosh(b/4)),0 for b>0; total division at b=0 gives sech(x/2) | b>0 excludes the noncompact junk case. |
| §1.7 Poitou ℚ check | n=r₁=1, b=1 | P≈−0.0833531≤log 1=0, within (−.09,−.08) | Retain all constants/signs. |
| §1.7 signatures | ℚ(√−3), b=1; ℚ(√5), b=1.5 | P≈1.058370<log 3≈1.098612; P≈1.597346<log 5≈1.609438 | Retain r₁ contribution. |
| §1.7 sinh integrals | b=6.5 and 8 | I₁≈.998972<1.0037<1.04; .917132<.9217<.94 | Diagnostic confirmation of the asserted margins. |
| §1.7 degree thresholds | Totally complex n=24,b=6.5; n=36,b=8 | exp(P/n)≈10.62656>10; 12.47843>12 | Retain. |
| §1.7 degree monotonicity | r₁=0, fixed b>0 | P/n=C−16b/(nπ²); increment 16b/(π²n(n+1))>0 | n=0 excluded from number-field use. |
| §1.8 strict bound | Trivial G; μ₂; μ₃ over ℤ | δ=0<2; 0<2; 1/2<3/2 | Rank-one and cyclotomic cases pass. |
| §1.8 annihilator restriction | μ₈ over ℤ | K=ℚ(ζ₈), rd=4; 4<4 is false; μ₈ is killed by 8, not by 2 | Correctly excludes higher torsion from the n=1 bound. |
| §1.8 tame factor | p=3, ℓ=2, e_ℓ=3 | Factor 2^(1−1/3)=2^(2/3); bound≈8.248378 | Retain. |
| §1.9(a) | n=15,b=41/8 | exp(P/n)≈8.417119>8.25 | Retain n≤14. |
| §1.9(b) | n=11,b=17/4 | exp(P/n)≈7.001141>6.93 | Retain n≤10. |
| §1.9(c) | n=20,b=6 | exp(P/n)≈9.769123>8.95 | Retain n≤19. |
| §1.9(d) | n=288,b=145/8 | exp(P/n)≈19.127423>19.02 | Retain n≤287. |
| §1.9(e) | n=60,b=79/8 | exp(P/n)≈14.608679>14.43 | Retain n≤59. |
| §1.9(f) | n=9,b=15/4 | exp(P/n)≈6.132437>5.72 | Retain n≤8. |
| §1.9(g) | n=6,b=23/8 | exp(P/n)≈4.549112>4.48 | Retain n≤5. |
| §1.9(h) | n=44,b=69/8 | exp(P/n)≈13.349184>13.19 | Retain n≤43. |
| §1.9(i) | n=120,b=13 | exp(P/n)≈16.988615>16.83 | Retain n≤119. |
| §1.9(j) | n=24,b=13/2 | exp(P/n)≈10.626564>10.199 | Retain n≤23. |
| §1.10 native carriers and order | Constant 1,C₂,C₂²; μ₂ | Coordinate ranks 1,2,4,2; μ₂ special-fibre points=1 | Rank is not point count; domain repair R05. |
| §1.10 zero-ring negative control | Constant C₂ over ZMod 1 | Lean order=1, intended constant cardinality=2 | R05; explicit domain binder excludes instance. |
| §1.10 schemeHom and algebraAwayRat | Identity; ℓ=2,1 | Underlying identity stays identity; 2⁻¹↦1/2; ℓ=1 gives ℤ→ℚ | Retain nonzero localization parameter. |
| §1.10 killed-by predicate | C₄; trivial group; n=0,1 | [2]C₄≠0, [4]C₄=0; all [n] on trivial group zero; [0]=0, [1] identity | Retain exponent/order distinction. |
| §1.10 simplicity | 1,C₂,μ₂,C₂² | Orders 1,2,2,4; C₂² has proper rank-2 subgroup; simple flags false,true,true,false | Nonzero condition essential. |
| §1.10 generic-fibre simplicity | Graph C_p→C_p×μ_p over ℤ_p[ζ_p] | Graph rank p, product rank p²; graph module has no proper nonzero subgroup | Retain closure/Dedekind hypotheses. |
| §1.10 constant predicate | C₂ and μ₂ over ℤ; μ₂ over ℤ[1/2] | true,false,true; two sections ±1 only separate after 2 is inverted | Retain integral model. |
| §1.10 diagonalizable predicate | μ₂,1,C₂ over ℤ; dual of nonconstant quadratic twist | true,true,false,false | Split versus multiplicative type distinguished. |
| §1.10 Ext1Vanishes | (μ₂,C₂); reversed pair; trivial endpoint | Ext=0; Katz class −1 nonzero; Ext with 0=0 | Quotient-first convention retained. |
| §1.10 geometric points | C_n, μ_p, trivial | n,p,1; μ_p in characteristic p instead has 1 geometric point | Characteristic-zero generic fibre retained. |
| §1.10 Galois action | C₃; μ₃; μ₂ | Trivial; ζ₃↦ζ₃²≠ζ₃; −1↦−1 | Postcomposition has correct orientation. |
| §1.10 torsion field | C_n,μ₂,μ₃,μ₄ | Degrees 1,1,2,2; last two fields ℚ(√−3),ℚ(i) | Retain; annihilator alone does not fix field. |
| §2.0 ResidualRep and image | Trivial image; cyclic order-three image | Image orders 1 and 3; both finite/discrete; characteristic-zero/infinite coefficient examples excluded from arithmetic theorems | Retain finite coefficients in headlines. |
| §2.0 absolute irreducibility | A=(0,1;1,1) over 𝔽₂; natural S₃ | A²=(1,1;1,0), A³=I; X²+X+1 has 0 roots in 𝔽₂, 2 in 𝔽₄; S₃ transvections have distinct fixed lines | First is irreducible but not absolute; second is absolute. |
| §2.0 inertia/unramifiedness | Trivial rep; ω₃; junk ℓ=1 | Inertia-image orders 1; 2 at 3 and 1 away; inertiaAbove 1=∅ since no proper ideal contains 1 | Arithmetic uses require ℓ prime. |
| §2.0 tameness | ω₃; splitting field X³−3 | Inertia orders 2 and 6, wild orders 1 and 3 | Tame true versus false. |
| §2.0 oddness | diag(1,−1); scalar −I; char 2 | Determinants −1,+1; in char 2 both equal −1=1 | Oddness is not irreducibility. |
| §2.0 kernelField | 1; 1⊕ω₃; real cubic rep | Degrees 1,2,3; scalar extension to 𝔽₄ keeps the cubic field degree 3 | Retain kernel rather than eigenline field. |
| §2.0 cyclotomicSubfield | n=1,2,3,4,12,0 | Degrees 1,1,2,2,4; discriminant at 12 is 144; n=0 adjoins every element and gives ℚ̄ | All arithmetic uses restrict to positive n; zero is not a number-field case. |
| §2.0 real cyclotomic subfield | n=1,2,3,4,5,9 | Degrees 1,1,1,1,2,3; n=5 gives √5; n=9 discriminant 81 | Retain. |
| §2.0 roots-adjoin finiteness | X−a; X²−2; X⁰−1 | Degrees 1,2; last polynomial is 0 with all ℚ̄ as roots | Positive exponent is essential. |
| §2.0 x0Eleven model | (a₁,a₂,a₃,a₄,a₆)=(0,−1,1,−10,−20) | b₂=−4; Δ=−161051=−11⁵; 2-torsion polynomial 4X³−4X²−40X−79 | Signs and linear-y term agree. |
| §2.1 level-one conjunction | 1⊕ω₃; J₀(11)[2] | First: odd=true, unramified outside 3=true, absolute=false; second: absolute=true, inertia at 11 nontrivial | Both predicates false for the stated reason. |
| §2.1 oneAddCyclotomic | c on 1⊕ω₃ | diag(1,−1), determinant −1, invariant first line dimension 1 | Retain. |
| §2.1 realCubicModTwo | Cosets {1,8},{2,7},{4,5} | Matrices I,A,A²; 2²=4,2³=8≡−1 modulo 9 | Character quotient and order 3 agree. |
| §2.1 actual two-torsion transport | Basis change B on J₀(11)[2] | New image BρB⁻¹ has size 6; fixed subgroup unchanged | Retain equivariance for every basis. |
| §2.1 finite coefficient extension | 𝔽₂→𝔽₄ | S₃ remains absolute; cyclic C₃ acquires 2 eigenlines; image sizes remain 6 and 3 | Discriminates absolute from ordinary irreducibility. |
| §2.1 A1 restriction | Natural GL₂(𝔽₃)→SL₂(𝔽₃) | Group orders 48→24; two unipotents fix different lines | Restriction still absolute. |
| §2.1 A1 at p=2 | ℚ(ζ₂)=ℚ | Restriction index 1, original representation unchanged | Retain. |
| §2.1 A1 compositum condition | S₃ splitting field of X³−2, p=7, F′=ℚ(√21) | L∩ℚ(ζ₇)=ℚ; √21·√−7=7√−3; residual image after cyclotomic restriction drops 6→3 and splits over 𝔽₇ | Disjointness from L alone insufficient; README excludes it. |
| §2.2 determinant | Characteristic 2 and odd p | At 2, odd-order inertia divides 1; for level-one odd p, det(c)=−1≠1 | Correct unramified determinant and total-complexity transitions. |
| §2.2 tame bounds | Totally complex degrees 6,12 at p=3 | Tame δ<1 gives rd<3; Minkowski at 6 gives rd>3 | Contradiction has strict direction. |
| §2.3 image alternatives | Cyclic C₃ over 𝔽₂; S₃; PSL₂(𝔽₄) | C₃ absolute=false; orders 6 and 60; PSL₂(𝔽₄)=A₅ | Cyclic field-irreducibility is not an allowed absolute case. |
| §2.4 Tate headline | Trivial rep; J₀(11)[2]; faithful wild order 4 | First fails absolute; second has extra ramification 11; local bound gives rd≤4 | Known examples do not contradict the exclusion. |
| §2.5 Serre headline | 1⊕ω₃; local wild S₃ | Absolute=false for diagonal; local δ=11/6, but no global irreducible odd level-one realization follows | Local existence does not assert global existence. |
| §3.1 finite étale and small fields | Finite étale group over ℤ; ℚ(i) | Nontrivial unramified number-field extension forbidden; ℚ(i) has discriminant −4 and is ramified at 2 | Retain distinction between generic étale and étale over ℤ. |
| §3.2 simple two-group headline | 1,C₂,μ₂,C₂²,C₄ | Simple flags false,true,true,false,false; C₄ has rank-2 subgroup | Includes both integral rank-2 models, excludes rank 1. |
| §3.3 Ext vanishing | S-unit classes −1,2,−2 in ℚ₂ | −1 is 7 mod 8; valuations of ±2 are 1; all three nonsquare | Restriction kernel=0; correct direction. |
| §3.3 reversed Ext | Katz class −1 | −1 not a square in ℚ; nonsplit extension with multiplicative subobject | Does not contradict Ext(μ₂,C₂)=0. |
| §3.3 reordered filtration | 1,μ₄,C₄,Katz(−1) | Rank products 1·1=1,4·1=4,1·4=4,2·2=4 | Retain; final extension may be nonsplit. |
| §3.4 numPoints | 0; E:y²=x³−x over 𝔽₅; E′:y²=x³+x | 1;8;4 (including infinity); product count 8·4=32 | Geometric isomorphism does not force equal counts. |
| §3.4 isogeny invariance | Frobenius isogeny E→E^(5) over 𝔽₅ | inseparable degree=5; both counts=8; degree(1−F)=8 | Inseparable isogeny allowed. |
| §3.5 growth contradiction | g=1,n=4,p=2, point count 8; g=0 | 2^8=256>8²=64; g=0 gives 1≤1 | Uniform finite field required; rank-zero endpoint preserved. |
| §3.5 good-reduction predicate | Trivial variety; J₀(11); y²=x³−x | true; false at 11; false at 2 | Checking only odd primes would change the predicate. |
| §3.5 source generality | ℚ,ℚ(i),ℚ(√−3),ℚ(√5) | Base degrees 1,2,2,2; source dimension conclusion 0 in all four, README covers only first | R07. |
| §4.1 semistable category | I+N with N²=0; 3×3 Jordan block | (I+N−I)²=0; (J−I)² has (1,3) entry 1 | Correctly rejects arbitrary-extension closure. |
| §4.1 subobjects/products/duals | N=E₁₂; direct sum; inverse transpose | N²=0; diag(N,N)²=0; dual operator −Nᵗ has square 0 | Retain p≠ℓ so cyclotomic inertia is trivial. |
| §4.1 inertia p-power | pᵏG=0 and N²=0 | (1+N)^(pᵏ)=1+pᵏN=1 | Tame inertia image has p-power order. |
| §4.1 extension with trivial ends | Block matrix (1,u;0,1) | (σ−1)²=0 for every u | Stronger endpoint hypothesis suffices. |
| §4.1 quadratic twist negative control | 𝔽₃ with ramified quadratic character at 7 | (−1−1)²=1 in 𝔽₃, not 0 | Tame does not imply membership in D. |
| §4.1 torsion membership | g=1,n=2,p=3 | Torsion rank 3⁴=81, with whole inertia satisfying N²=0 | Semisimplification alone would erase N. |
| §4.1 eleven boundary | J₀(11)[2] | Rank 4, image S₃ order 6, simple module dimension 2 over 𝔽₂ | Excludes a universal order-p classification. |
| §4.2 iterated-extension predicate | 1; C_{p²}; μ₂ versus C₂ over ℤ | Length 0 gives p⁰=1; length 2 gives p²; μ₂ rank 2 forces length 1 but is not étale | Retain. |
| §4.2 fixed cyclotomic splitting | Constant C_{p²}; unipotent C₃ quotient of Gal(ℚ(ζ₇)/ℚ) | First action order 1; second order 3 becomes 1 over ℚ(ζ₇) | Same base works independently of filtration length. |
| §4.2 p-group abelianization step | C₄; Q₈ | Abelianizations C₄ (cyclic) and C₂² (not cyclic) | The nonabelian group does not satisfy cyclic-abelianization premise. |
| §4.2 categorical criterion | g=1,p=3,n=3,count 8; g=0 | 3⁶=729>64; 1≤1 | Fixed-base point-count argument agrees with §3.5. |
| §4.3 Ext at two | ℓ=3,5,13,17,7 | Residues 3,5,5,1,7 mod 8; dimensions 0,0,0,1,1; −7≡1 mod 8 | Includes both signs of the exceptional square direction. |
| §4.3 Ext at three | ℓ=2,7,19 | Residues 2,7,1 mod 9; dimensions 0,0,1 | Retain; all selected pairs vanish. |
| §4.3 completion square | [17],[−1] under ℚ→ℚ₂ | Nonzero→0; nonzero→nonzero; impossible ℚ₂→ℚ̄ prevents current lemma application | R01 and R04. |
| §4.4 FieldCriterion definition | M=L for all five pairs | [L:ℚ]/(p−1)=3,4,4,9,4 = p^1,p²,p²,p²,p² | Actual fields satisfy the intended p-power normalization. |
| §4.4 relative inertia | (ℓ,p)=(2,3),(3,2), L=M | Inertia at ℓ has order 3 or 2 over ℚ; relative inertia over M has order 1 | Retain relative, not absolute, unramifiedness. |
| §4.4 strict normalized p-bound | Same five M | v_p(d_M)/degree = 7/6,1,1,7/6,1; bounds 3/2,2,2,3/2,2 | Every M passes strictly. |
| §4.4 simple-object conclusion | Simple p-module after p-group restriction | Fixed nonzero subspace forces all of simple module fixed; Δ has order p−1 and eigenspaces of dimension 1 | Resulting group order p, not p². |
| §4.5 class numbers | M₂₃, M₅₂ | Hilbert degrees 6h≤8,4h≤5 imply h=1 in both cases | Retain. |
| §4.5 cyclotomic PID | ℚ(ζ₁₂) | abs(d)=144 < (4π²/3)²≈173.172 | The direct PID criterion, not the weaker degree bound, suffices. |
| §4.5 M₁₃₂ small primes | ℚ(i,√13) | Minkowski bound 78/π²≈7.903; norm(1+i)=4; prime norms at 3,5,7 are 9,25,49 | Every relevant ideal class principal. |
| §4.6 field definitions | ℚ(ζ₃,∛2),ℚ(ζ₁₂),ℚ(i,√5) | Degrees 6,4,4; absolute discriminants 34992,144,400 | Splitting-field and compositum definitions distinguish the pure cubic and quadratic subfields. |
| §4.6 (2,3) headline | 6 divides n≤14 | n=6 or12; possible extra quotient C₂; residue-unit group 𝔽₃× has order 2 generated by −1 | Ray quotient kills C₂; n=6. |
| §4.6 (3,2) headline | 4 divides n≤10 | n=4 or8, both powers of 2 | No unnecessary class-number input. |
| §4.6 (5,2) headline | 4 divides n≤19 | n=4,8,12,16; η²=η+1 in 𝔽₄ gives η³=1,η≠1 | Unit image kills cubic quotient; n=4,8,16. |
| §4.7 (7,3) degree bound | 18 divides n≤287 | [L:M]≤15; abelianization 3-powers among ≤15 are 1,3,9 | Retain solvable small-group step. |
| §4.7 M class number | Hilbert degree 18h≤43 | h≤2; quadratic alternative would descend to degree 4 over ℚ with rd=√3<2 | Contradicts Minkowski; h=1. |
| §4.7 residue units | 𝔽₂₇, c=ζ₇+ζ₇⁻¹ | c has order 13, −1 order 2; generated group order 26=27−1 | No prime-to-3 ray quotient. |
| §4.7 intermediate cubic conductor | a=2; a=3 | δ₃=7/6+2/9=25/18<3/2; a=3 gives 3/2, forbidden | Strict inequality forces a=2. |
| §4.7 K′ class number and remaining group | Degree 54, Hilbert degree≤119 | h≤2; quadratic alternative descends as before; remaining group order≤5 | Direct calculation over K′ avoids unjustified descent of arbitrary subgroup quotients. |
| §4.8 (13,2) base and units | ℚ(i,√13), η=(3+√13)/2 | Degree 4,d=2704; η²=η+1 mod 2, order 3 in 𝔽₄× | Odd tame quotient killed. |
| §4.8 quadratic conductor | a=0,2,4,5 | δ₂=1+a/4 gives 1,1.5,2,2.25; strict <2 and nontrivial ramification leave a=2 | Retain. |
| §4.8 last class-number bound | K=M(√η), degree 8 | rd=2^(3/2)√13≈10.198039; 8h≤23 implies h≤2 | Only odd class-group part is excluded; h=1 is not asserted. |
| §4.8 small-group endpoint | π′ order≤14, π′ab=C₂; π″ index 2 | Order π″≤7; class-field calculation kills odd abelianization and Frattini step excludes even part | Solvable perfect π″ must have order 1; n=4 or8. |
| §4.9 Schoof headline | Trivial A; J₀(11) | dim 0 allowed at all five primes; dim J₀(11)=1, bad-prime set={11} | Correct exact set {2,3,5,7,13}; cannot replace by primes≤13. |
| §5.0b potential modularity disjointness | Identity avoidance field; two fields with quadratic overlap in compositum | [ℚ:ℚ]=1; A1 example above drops image 6→3 if only one field avoided | Compositum hypothesis retained. |
| §5.0b solvable descent | E=F; cyclic step of degree ℓ | Identity returns same representation; ℓ quotient characters give ℓ possible descents, restriction forgets that twist | Fixed-p character matching is needed. |
| §5.0c Picard descent | Pointless conic; identity correspondence | Pic⁰ dimension 0; diagonal acts by [1] | A rational point is unnecessary for Pic⁰. |
| §5.0c correspondence direction | f of degree d; d=2 | f_*f^*=[d]; at d=2 multiplication by 2, not identity | Retain b_*a^*. |
| §5.0c eigensummand | Odd degree 1; even degree 2 | Infinite ramified places count d−1=0 or1; quaternion ramification total must be even | Even degree needs a finite discrete-series place; R06. |
| §5.0d minimal crystalline lift | k=2,4,6 at p=5 | Hodge pairs (0,1),(0,3),(0,5); determinant inertia exponents 1,3,5≡1 mod 4 | Stable residual and determinant conventions agree. |
| §5.0d Steinberg lift | k=p+1 at p=5 | New pair (0,1), N rank 1; residual determinant exponent 5≡1 mod 4 | Distinguishes Steinberg from crystalline N=0. |
| §5.0d raw system carrier | Trivial rank 1; cyclotomic; unrelated polynomials | X−1, H={0}; X−q⁻¹,H={−1}; unrelated polynomial data accepted as raw but compatibility=false | No compatibility encoded by empty predicates. |
| §5.0d sums/tensors/duals | Two rank-2 data | Sum rank 2+2=4; tensor rank 2·2=4; dual roots α⁻¹ and labels −h | Carrier permits general rank. |
| §5.0d restriction/Tate twist | Residue degree 2; χ twist t=1 | Root α→α² under restriction; α→α/q and h→h−1 under twist | Geometric-Frobenius convention retained. |
| §5.0d arithmetic polynomial adapter | E/𝔽₅ with count 8, a₅=−2 | P=X²+(2/5)X+1/5; X²P(1/X)/P(0)=X²+2X+5 | Reciprocal normalization and nonzero constant term tested. |
| §5.0d WD adapter | N=E₁₂, rNr⁻¹=q⁻¹N | r⁻¹Nr=qN, same N | Inverting Frobenius is distinct from dualizing the representation. |
| §5.0d compatibility and selected primes | Weight 6 at prime 5; weight 14 at prime 13 | Required Hodge pairs (0,5),(0,13); selected comparisons=present even if place lies in a finite exceptional set | Correct distinction from almost-strict compatibility. |
| §5.0e ordinary local hypotheses | Five terminal pairs | k−1 modulo p−1 =1 in each: 1,3≡1,5≡1,7≡1,13≡1 | Characters 1 and ω distinct for every odd p involved. |
| §5.0e exact level | Unramified away from p plus crystalline at p | Away-p conductor exponents 0; crystalline ordinary comparison supplies p-exponent 0 | Level product=1; modularity alone would not compute p-part. |
| §5.1 marked GL₂ action | Elliptic K=ℚ; surface K=ℚ; zero A | [K:ℚ]=1 versus dim 1,2,0 | Pass,false,false; zero ring of endomorphisms cannot bypass degree equality. |
| §5.1 λ-factors and J₀(23) | g=2,[K:ℚ]=2 | Whole Tate dimension 4; factor rank 2g/[K:ℚ]=2 | Marking and coefficient factor are essential. |
| §5.1 endZeroAlgebra | Non-CM E; CM E with rational CM; E² | ℚ dimension 1; quadratic field dimension 2; M₂(ℚ) dimension 4 | Base-field endomorphisms retained. |
| §5.1 isogeny transport | f=[2], quasi-inverse g=[1], n=2 | (1/2)fag=a; identity conjugation also a | Formula and inverse direction agree. |
| §5.1 conjugate marked actions | K=ℚ(√5) in M₂(ℚ), swap matrix B | A=(0,5;1,0), B A B⁻¹=(0,1;5,0), both square to 5I but are different matrices | Unmarked existence does not select λ-action. |
| §5.1 ComesFromGL2Type | Elliptic factor; J₀(23) λ-factor; a character | Ranks 2,2,1 | First two fit; one-dimensional character rejected. |
| §5.2 descent headline | F′=F; quadratic F′/F with irreducible restriction | Induced dimensions 2 and4; Hom(ρ restricted,ρ restricted) dimension 1 in both | Multiplicity one does not identify whole induction with ρ. |
| §5.2 endomorphism comparison | E² non-CM; identity extension | End⁰=M₂(ℚ), after tensor dimension 4; representation commutant M₂(ℚ_p), dimension 4 | Coefficient action and semisimplicity needed. |
| §5.3 Sylow descent | G=S₃, Sylow-2 subgroup C₂ | Index 3 is odd; remaining extension degree 2 is solvable | Retain odd-degree construction. |
| §5.3 source generality/A2 | F=ℚ; ℚ(√5); even-degree F with finite-place branch | Cyclotomic degrees at 5: 4 and2; parity degrees 1 and2 | R06; automatic A2 cannot be transported indiscriminately. |
| §5.4 one-factor reduction | g=2, quadratic K, Steinberg factors | Each factor N rank 1; whole N rank 2=g; crystalline factors each rank 0 | Retain K-equivariant comparison before whole-Tate criterion. |
| §5.4 ramified twist | N rank 1, finite inertia −I | N≠0 but inertia≠1 | Gives only potential statement; excluded from claimed multiplicative reduction. |
| §5.5 quadratic class numbers | p=3,7,11,19,43,67,163 | Class numbers all 1; at 163 bound 2√163/π≈8.1278, primes 2,3,5,7 inert, norms 4,9,25,49 | Principal inert ideals suffice. |
| §5.5 negative control | ℚ(√−23) | h=3; 2 splits (−23≡1 mod 8) | No all-p≡3 mod 4 overclaim. |
| §5.6 dihedral classification | p=23, rotation order 3; p=5,7,13 | 3 divides h(−23)=3, normalized weight 12; p=5,13 are 1 mod4, h(−7)=1 | Correct allowed boundary and excluded terminal dihedral cases. |
| §5.7 ordinary terminal headline | k=2,4,6,8,14 | Level-one cusp dimensions 0,0,0,0,0; at k=12 dimension 1 | Terminal set excludes Δ’s weight. |
| §5.8 weight-two headline | Hypothetical realization g=[K:ℚ]; zero A | g≥1 versus Fontaine g=0; zero A would need [K:ℚ]=0, impossible | Realization cannot evade contradiction using dimension zero. |
| §5.9 selected p+1 headline | p=5,7,13; p=11 | Weights 6,8,14 excluded; weight12 at 11 has cusp dimension1 and J₀(11) geometric boundary | Exact prime set retained. |
| §5.10 split/peu branch | ω⊕ω² twisted by ω⁻¹ | Characters 1⊕ω, weight2 | Retain direction of subcharacter for nonsplit case. |
| §5.10 niveau-two branch | p=11, exponents13,23; ω=ω₂¹² | Subtract12 gives1,11, the weight-two pair | Retain. |
| §5.10 opposite nonsplit branch | Sub ω, quotient ω² | Twist −1 gives sub1, quotientω, weight22; twist −2 gives subω⁹, quotient1, weight10 | No weight-two conclusion for this branch. |
| §5.11 small-weight headline | Actual weights2…8;14 at p≠11;12 | Even candidates2,4,6,8;14 uses13-adic member;12 has Δ | Published characteristic-eleven exclusion respected. |
| §5.11 unrestricted Lean corollary | p=2,3,5,7 | Normalized upper weights p+1=3,4,6,8, all within excluded range or Tate–Serre | No weight hypothesis lost accidentally. |
| §5.12 modularity transfer | p=5,k=1 and k=2 | Pairs (0,0) and(0,1); k≥2 excludes repeated weights | Original member retains its own de Rham/A1 assumptions. |
| §5.12 Paso 6 headline | Residual weights2,4,6 at5 | First two use3-adic pairs(0,1),(0,3), cusp dimensions0; last yields g≥1 against Schoof g=0 | Hypothetical modularity branch is logically valid; no circular use of full Serre modularity. |
| §6 nine-row conjunction | Tate; geometric rows; eleven boundaries | 9 rows; Fontaine bad set∅, Schoof singleton in5-prime set; neither (11,12) nor(11,14) added as exclusion | Retain endpoint distinction. |

There are **167 adversarial rows**. Algebraic examples test both positive and negative cases of the predicates; the definition checks include empty filtrations, trivial groups, dimension zero, a zero ring, nonreduced μ₂ fibres, inseparable Frobenius, small characteristics, nonabelian groups, total-function junk at n = 0, and the characteristic-eleven boundary. The real-number rows give diagnostic numerical margins rather than claims of machine-certified inequalities.

**Pinned-library audit.** The pins inspected were Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. These 14 entries record concrete declarations opened, their role and limits; paths are within the indicated library, not a newer installation.

| Pinned declaration / file and line | What was verified |
| --- | --- |
| `Module.finrank`, `Module.finrank_subsingleton`; `Mathlib/LinearAlgebra/Dimension/Finrank.lean:61,64` | Natural-valued rank and the value 1 over a subsingleton ring; this is the R05 witness. |
| `NumberField.rootDiscr`, `abs_discr_ge'`; `Mathlib/NumberTheory/NumberField/Discriminant/Basic.lean:77,208` | Absolute discriminant and degree normalization; Minkowski includes signature and factorial. |
| `NumberField.finrank_eq_one_of_unramified`; `Mathlib/NumberTheory/NumberField/ExistsRamified.lean:50` | Requires unramifiedness over ℤ of the integer ring, not just an unramified extension at a chosen prime. |
| `IsCyclotomicExtension.Rat.three_pid`; `Mathlib/NumberTheory/NumberField/Cyclotomic/PID.lean:34` | Ring of integers of the third cyclotomic field is principal; do not plan its class number anew. |
| `CuspForm.rank_eq_zero_of_weight_lt_twelve`; `Mathlib/NumberTheory/ModularForms/LevelOne/DimensionFormula.lean:155` | Correct source for weights 2,4,6,8. |
| `ModularForm.dimension_level_one`; same file:250 | Even-weight dimension formula supplies weight 14 with the cusp/Eisenstein rank relation; weight 12 remains nonzero. |
| `TauCeti.FinitePadicExtension`; `TauCeti/NumberTheory/LocalField/AbsoluteRamificationIndex.lean:63` | Bundles the p-adic algebra, finite module and valuation compatibility. An arbitrary local-field instance is not the entire hypothesis. |
| `TauCeti.AlgebraicGeometry.AbelianVariety`; `TauCeti/AlgebraicGeometry/AbelianVariety/Basic.lean:95` | Native fields are a group object, properness and geometric integrality. An integral model or a Tate representation is not a field of this structure. |
| `AbelianVariety.dim`; same file:118 | Takes values in `WithBot ℕ∞`; the roadmap’s dimension equality uses the native coercion. |
| `TauCeti.kummerIso`; `TauCeti/FieldTheory/GaloisCohomology/Kummer.lean:384` | Requires n invertible in K; gives field Kummer classes on native continuous cohomology. |
| `kummerRes`, `kummerIso_res`; same file:609,682; section parameter at 573 | The comparison is along L→Kˢ; no completion map is supplied. R01. |
| `TauCeti.integral_exp_mul_I_mul_exp_neg_mul_abs`; `TauCeti/Analysis/Fourier/ExpNegAbs.lean:40` | Positive exponential rate and unnormalized oscillatory pairing; the README correctly rescales to Mathlib Fourier frequency. |
| `isPositiveDefiniteSub_iff_posSemidef`; `TauCeti/Analysis/PositiveDefinite/AddGroup.lean:209`; `fourier_re_nonneg_of_posSemidef`, `TauCeti/Analysis/Bochner/Fourier/Nonneg.lean:581` | The latter requires integrability and continuity; compact support supplies integrability here. Positive definiteness alone is not sufficient for that integral theorem. |
| `exists_differentiableOn_eq_dedekindZeta_sub`; `TauCeti/NumberTheory/NumberField/DedekindZeta.lean:158` | Continues only to Re(s)>1−1/[K:ℚ]; it does not provide the all-plane completed functional equation used in §1.0. |

The native constant/diagonalizable finite-locally-free constructors and coordinate-Hopf-algebra projection were also read and exercised by the unchanged build and the zero-ring probe. The order-2 models are not new carriers invented by this roadmap. Searches by finite-flat rank, Ext endpoints, Tate factors, finite-field isogeny counts, compatible-system data, local different exponents and the realization/nonexistence objects were made in the pinned libraries, main roadmaps, board packages and the available open-roadmap files, using `roadmaps grep/show` and local object searches. No duplicate fully qualified acceptance declaration was found in the supplied main/open/package files. Merely finding the word “Fontaine” or “Poitou–Tate” was not treated as mathematical duplication.

**Resolved roadmap contracts and ownership.** The following 17 entries record substantive resolutions. Main-branch content was used for existing roadmaps; the available heads were used for new ones. Later suppliers remain findings even where their mathematical contract exists.

| Supplier and repository-relative locator | Resolution |
| --- | --- |
| `TauCetiRoadmap/ArithmeticGaloisRepresentations/README.md`, §§1.1–1.7, 2.1–2.3, 4.1–4.7 | Finite coefficients, inertia/kernel fields, conjugation, fixed vectors and finite image classification are imported. The arithmetic small-discriminant exclusions remain new here. |
| Same file:2237–2252, §2.7 | Functional equation resolves to LFunctions, not to an independently supplied earlier proof; R03. |
| Same file:3961–3978, §6.4 | `TateModule.lambdaTateModule` exists as a roadmap target, with action and dimension. The resolver’s missing-name lead was not a missing-target finding. |
| `TauCetiRoadmap/FiniteFlatGroupsAndIntegralPadicHodgeTheory/README.md`, §§R07.1.2, .7, .20, .23, .34–.39 | Generic points, duality, flat closure, simplicity, order-p classification and exact gluing have owners. The arithmetic predicates here are specializations on native carriers, not new general finite-flat theory. |
| Same file:2895–2918, §R07.G5 | All-prime Ext vanishing and admissible filtration explicitly supply §3.3; the supplier itself identifies this specialization. The new input here is classification/admissibility of all two-groups. Treat the general filtration as an application, not a second proof project. |
| Same file:8499–8545, §R07.6.5 | General pⁿ finite-flat ramification is supplied, including the normalization; §1.8 uses n=1 and globalizes it. |
| `TauCetiRoadmap/AbelianSchemesAndArithmeticModuli/README.md`, A2–A3, A6.5, .8, .10–.12, .30–.33; especially 3025–3035 | Torsion, quotients, polarizations, isogeny factors, rational endomorphisms, Weil restriction and induction resolve. `traceDegreeSubfield` requires a same-identity field action; its rank is 2g/f. The marked specialization does not invent equal multiplicities. |
| `TauCetiRoadmap/NeronModelsAndSemistableAbelianVarieties/README.md`, §§1.8–1.9, 3.5–3.14, 5.1–5.3, 6.10 (2843–2865 and 3972–4005 for the latter comparisons) | The supplied comparison is for the whole Tate module. The K-equivariant refinement in §5.4 is explicitly new here; no equality of conjugate Frobenius polynomials is assumed. |
| `TauCetiRoadmap/ClassFieldTheory/README.md:1312,1683,1724,1799`, Layers 7,11,12,13 | Local reciprocity, global characters, correspondence and class fields exist in the cited sections. Their order is wrong for this consumer, R02. |
| `TauCetiRoadmap/ProfiniteCohomology/README.md:1363,1473–1492`, Layer 9 | The field extension square is finite separable, with a chosen embedding. It reuses the pinned isomorphism. R01/R04, not a nonexistent general Kummer isomorphism. |
| `TauCetiRoadmap/LFunctions/README.md`, Layer 5, primitive functional equation; also Layer 3 Dedekind continuation | The primitive trivial character gives the intended poles and functional equation. A larger presentation modulus has removed Euler factors; the target correctly uses the trivial primitive character. Supplier is later, R03. |
| `Completed/NumberFieldArithmetic/README.md`, Layers 5–6; `TauCetiRoadmap/LocalFieldsRamification/README.md`, Layers 1,3,4 | Completion/different compatibility, compatible valuations and ramification conventions are the imported general objects. The native d/e expression is not a new valuation theory. |
| `TauCetiRoadmap/GL2AutomorphicRepresentationsAndTransfer/README.md:1634,1779,1987,2739,2982,3013`, R17.3.1, .3.10, .4.10, .6.4, .6.18–.6.19 | JL and solvable descent exist; the family descent requires the family/common-index inputs. R17.6.4 really includes characteristic-zero conductor equality, not only the residual inequality suggested by its heading. The target owns the additional coefficient-prime exact-level step. |
| `TauCetiRoadmap/ShimuraVarieties/README.md`, §§8.1–8.5, 8.18–8.19 (2621,2645); `TauCetiRoadmap/JacobianChallenge/README.md`, Layers D–F | Canonical tower, minimal compactification and extended correspondences are the cited objects. The target explicitly owns its unpointed Picard descent/correspondence adapter and eigenfactor construction. |
| `TauCetiRoadmap/InverseGaloisAndArithmeticFundamentalGroups/README.md:476–490`, IG.0.T1 | `VanishingCycles.curveEndomorphismTrace` includes the finite/rational curve–Jacobian comparison and orientations; the resolver’s lead does not establish drift. |
| `TauCetiRoadmap/AlgebraicModularFormsAndSerreWeights/README.md:1609`, R15.5A.2, and R15.4; `TauCetiRoadmap/LocalGaloisDeformationRings/README.md:1207–1223`, §0.3 and §§5.4–5.5 | Attachments and the weight recipe resolve. The p+1 crystalline boundary is a ℚ_p statement with branch qualifications; it is not generalized to arbitrary DVRs here. |
| `TauCetiRoadmap/ClassicalArithmeticCompletion/README.md`, §5.1; `TauCetiRoadmap/ModularCurves/README.md`, Layers 0B–0C and 10; `TauCetiRoadmap/ModularForms/README.md`, Layer 10 | Small-prime ideal-class generation, quotient foundations, modular-curve genus and weight-two dimension are the cited mathematical inputs. No numerical class-number oracle is proposed. |

The shared raw `AutomorphicSystemData` object has consumers that explicitly import it from this roadmap; no independently owned replacement was found in the object search. It keeps raw data separate from compatibility, and permits ranks other than two for tensor products. The specialized realization/descent machinery is owned here rather than being attributed to the later potential-modularity consumers. The two source-scope omissions R06–R07 therefore cannot be repaired merely by calling the missing cases “someone else’s theorem.”

The roadmap has the requested main headings and every layer ends with Examples and Dependencies. Its definitions generally retain APIs and at least three discriminating examples; the 167-row pass evaluates the important positive, negative and convention controls. R08 concerns how those APIs/Checks are named, not a request to move them into the acceptance file. Local and global proof routes retain their nontrivial prerequisites; R01 and R02–R04 identify the material supplier defects. The small finite arithmetic computations are mathematical examples and bounds, not an executable algorithm project.

## Not verifiable

- **Odlyzko’s displayed formulas**, survey §2, equations (2.1)–(2.5), pp. 121–122: fetched the legal Numdam copy, read the surrounding text (odlyzko-survey lines 107–132), and attempted the PDF view. The available extraction omits the displayed mathematics and the PDF screenshot did not expose a readable image. Thus the exact printed constants/locators behind §§1.6–1.7 remain uncertified. This does not invalidate the independent algebraic and numerical checks above. [Legal source](https://www.numdam.org/item/JTNB_1990__2_1_119_0/).
- **Bosch–Lütkebohmert–Raynaud, Néron Models**, §9.3, p. 258 and §9.4 Proposition 4, pp. 260–261: the sources service resolved only paywalled/uncertified access. I did not bypass it. The legal Milne Jacobians notes were available for the separate descent/correspondence discussion, but they do not certify the exact BLR proposition/page citation.
- The full exact integral enclosures and all formal proofs of the admitted headlines were not produced by this review. Approximate quadrature is not a substitute for them. No unavailable source was silently reported as read; recovered Schoof and Raynaud fetch failures were cleared from the scratch missing-reference list. No source manifest or PR file was edited.

## Source issues

- **Misprint** in schoof at §2.4, printed p. 850 (schoof line 223): the source says the group schemes are isomorphic exactly when their unit ratio is a pth power; it should be an isomorphism of extensions fixing the two endpoints; affects nothing.
- **Gap** in khare-wintenberger at first preprint, proof of Theorem 4.3, p. 21: the source says every weight-fourteen characteristic-eleven case has a weight-two twist; it should be restricted to the split, indicated peu-ramifiée and niveau-two branches; affects the proof; corrected in print at Theorem 5.4, printed p. 247, by excluding characteristic eleven.

For the first source issue, over ℤ[1/2] at p=3 the component-wise map x↦x² identifies G₂ with G₄, with inverse y↦y²/2ⁱ on component i; 2/4 is not a rational cube. It changes the μ₃ marking. For the second, the nonsplit subcharacter-ω/quotient-ω² branch gives weights 22 and 10 after the two twists, as computed above. The roadmap does not copy either source defect into its asserted conclusions.
