# Review of AutomorphicLFunctionsAndLocalFactors (pull request #924 at 0e699b2)

**Verdict:** needs changes

This is a full review of the folder at 0e699b2, the same head as the previous review, so the change set is empty. All six findings are P3; none blocks. Five need a folder edit; R06 needs only an edit to the pull-request description. Line numbers refer to `TauCetiRoadmap/AutomorphicLFunctionsAndLocalFactors/README.md` (written `:N`) unless `Suggested.lean` is named.

## Previous findings

- **R01 of the previous review (P3), pull-request description: not repaired.** The head is unchanged. The description still says the consumers "take rank-one Hecke continuation and the global standard L-function from here". It still says "The common adelic Tate/Fourier prefix and the rank-one scalar comparison are consumed from ArithmeticGaloisRepresentations §2.7". It still says LFunctions and ZerosOfLFunctions "must merge first". It is carried below as R06.

## R01 (P3) — Two negative-control Checks in AL.0.1 blame local constancy for a failure caused by non-compactness, and one of them is false

**Location.**

- `:438` (AL.0.1.11): "A real Gaussian has nonconstant transform; continuity cannot replace local constancy of the pairing."
- `:326` (AL.0.1.4): "The real multiplication pairing is continuous but not locally constant; its annihilator of `ℤ·1` is not open."

**Claim.** Both Checks are offered as evidence that the locally-constant-pairing hypothesis cannot be dropped. Neither instance satisfies the compactness hypotheses of its target, so neither tests that hypothesis. The AL.0.1.11 Check is also false: in that target's setting, joint continuity already gives the conclusion.

**Witness.**

- *The Gaussian violates a different hypothesis.* The support of `e^(−πx²)` is ℝ. The only compact subgroup of ℝ is {0}, so no compact U contains the support, and AL.0.1.11's hypothesis "U compact, support(f)⊆U" fails.
- *Continuity suffices in AL.0.1.11.* AL.0.1.11 assumes W is a topological group and U is compact. If the pairing is merely jointly continuous, the tube lemma gives an open N∋0 with `ψ(L(U,N))⊆{Re z>0}`. For w∈N, the map `u↦ψ(L(u,w))` is a homomorphism, so its image is a subgroup of the circle inside `{Re z>0}`, hence trivial. So N⊆U⊥, U⊥ is open, and AL.0.1.10 makes Ff locally constant.
- *The AL.0.1.4 instance is not compact.* There, U=ℤ·1 is not compact.

**Repair.** Make each Check name the hypothesis it actually breaks.

- At `:438`: "A real Gaussian has support ℝ, which lies in no compact subgroup of ℝ, and its transform `e^(−πy²)` is not locally constant at 0; the compact-support hypothesis cannot be dropped."
- At `:326`: "Over ℝ the multiplication pairing and the non-compact `U=ℤ·1` give the annihilator `ℤ·1` (AL.0.1.3), which is not open; compactness of U cannot be dropped."

**Tested.**

- `Ff(0)=1` and `Ff(1)=e^(−π)≈0.0432`, so Ff is not locally constant. U=ℤ gives U⊥=ℤ, which is not open.
- With U={0}, the only compact subgroup of ℝ, the annihilator is all of W and the transform is constant, consistent with both targets.

## R02 (P3) — `Suggested.lean` and the README say the rank-one theorem "is the case n = 0" of `AL2.godementJacquetLocal`, but neither statement implies the other

**Location.**

- `Suggested.lean:288–289`: "The rank-one theorem `TateZeta.localZetaIntegral_functionalEquation` is the case `n = 0`."
- `:1211`: "…`TateZeta.localZetaIntegral_functionalEquation` is its `n=1` case."

**Claim.** Taken as Lean statements, this is false. If it were true, the rank-one headline would be a boundary case of another headline, which is padding.

**Witness.**

- The rank-one theorem asserts integrability exactly on `0<Re(s)+r` and `r<Re(s)` (`Suggested.lean:150–156`).
- `godementJacquetLocal` gives convergence only on `c<Re(s)` for an existential c (`Suggested.lean:307, 312`). At n=0, with χ=1 and f=1_O, it already holds with c=5, so it says nothing at s=1/2, where the rank-one theorem asserts integrability.
- In the other direction, the rank-one theorem states neither the polynomial `P` with `P(0)=1` nor the monomial epsilon factor.

**Repair.**

- In `Suggested.lean:288–289`, write: "At `n = 0` this gives the rank-one equation of `TateZeta.localZetaIntegral_functionalEquation`, which also fixes the convergence half-planes `Re(s) > −r` and `Re(s) > r`; neither statement implies the other."
- Make the same change at `:1211`.

**Tested.** The χ=1, f=1_O instance above. The rank-one integral is `Σ_{n≥0}q^(−ns)`, which converges exactly on `Re(s)>0`.

## R03 (P3) — AL.3.9.4 cites Cogdell's Lecture 9 §5 for completed-tensor estimates that the passage says are not written up

**Location.** `:1887`: "Cogdell, Fields lectures, §§7–9, especially Lecture 9 §5, pp.72–73, for the completed-tensor integral estimates".

**Claim.** The locator claims a text that does not contain the cited estimates.

**Witness.**

- CogdellFields lines 3357–3370 treat only m=n and m=n−1.
- For m<n−1, lines 3373–3382 say the global analysis would have to be redone on the completed tensor product, and that the authors hope to write up the details.
- Lines 3383–3386 then send the reader to Gelbart–Shahidi.

**Repair.** In the `:1887` source line, cite "Cogdell, Fields lectures, Lecture 9 §5, pp.72–73" only for the K-finite cases m=n and m=n−1 and for the outline of the completed-tensor extension, which that text does not carry out. Keep Gelbart–Shahidi, Theorem 4.1 and Corollary 4.2, as the source of the all-rank strip bound. State that the completed-tensor estimate is this roadmap's own argument, or cite a text that carries it out.

**Tested.** The `GL₄×GL₂` instance in the Check at `:1885` has m=n−2, which lines 3373–3382 leave open.

## R04 (P3) — AL.4.2.1's *Needs:* line cites two "AL.4 conditional … comparison" items that are not targets anywhere

**Location.** `:2322`: "…; AL.4 conditional classical weight-k normalization comparison; AL.4 conditional Hilbert normalization comparison."

**Claim.** These two entries name no heading, no target and no supplier section. Their content is AL.4.2.1's own body at `:2316` ("The classical and Hilbert `GL₂` comparisons here take an actually compatible arithmetic realization … as an input"). So the line points either at nothing or back at its own target.

**Witness.**

- Each phrase occurs once in the README, on this line, and never as a heading.
- The first commit, df302fb, already had the same two entries with no matching targets.
- A scan of every *Needs:*/Prerequisites line found these two as the only entries that are not targets.

**Repair.** Delete both entries from `:2322`. The compatible arithmetic realization is already stated as a hypothesis at `:2316`.

**Tested.** After the deletion, every remaining entry resolves:

- AL.4.1.1, AL.2.1.4, AL.3.2.3 and AL.R.2 are headings of this README;
- ArithmeticGaloisRepresentations §§2.4, 2.5 and 2.7 are headings at the head of its open pull request.

## R05 (P3) — "c(π) = 1" in AL.1.3.5 clashes with the README's own notation

**Location.** `:1001`: "…`ρ(c|·|^s) = N(𝔡𝔣)^{s−1/2}ρ₀(c)` for ramified c with conductor `𝔣` and `c(π) = 1`."

**Claim.** In this sentence, c is Tate's quasi-character and π is a uniformizer. Elsewhere in the README the same symbols mean something else:

- the same paragraph uses c for a conductor exponent ("(ii) `ω` ramified with conductor c");
- `:1304` (AL.2.2.3) defines c(π) as the conductor exponent of a representation π;
- the Conventions at `:49` fix ϖ, not π, as the uniformizer.

So "c(π) = 1" reads as "conductor exponent one".

**Witness.**

- From (ii) on the same line, `ρ(χ|·|^s)=1/ε(s,χ,ψ)=N(𝔡𝔣)^(s−1/2)χ(ϖ)^(−(ν+a))𝔤(χ,ψ)⁻¹`. The condition is therefore a normalization of the character's value at the uniformizer.
- Over ℚ₃, take χ the quadratic unit character with χ(3)=1, ν=0 and 𝔣=(3). Then `𝔤=−i` and `ρ=i·3^(s−1/2)=3^(s−1/2)/𝔤`.

**Repair.** At `:1001`, write: "`ρ(χ|·|^s) = N(𝔡𝔣)^{s−1/2}ρ₀(χ)` for a ramified unitary character χ of conductor `𝔣`, normalized by `χ(ϖ) = 1`, with `ρ₀(χ) = 𝔤(χ,ψ)⁻¹` by (ii)."

**Tested.** The ℚ₃ instance above, which agrees with the AL.1.3.2 Check at `:944`: `ε=−i·3^(1/2−s)` and `L=1`.

## R06 (P3) — The pull-request description still contradicts the README (carried; no folder change)

**Location.** The description text quoted under "Previous findings".

**Witness.**

- `:2500` says the consumers' rank-one Hecke continuation is AnalyticNumberTheoryPartI §2.3a.
- `:11` gives the Fourier analysis to AnalyticNumberTheoryPartII §§5.3g–5.3h and the local zeta integral to its §5.3j.
- `TauCetiRoadmap/LFunctions`, `TauCetiRoadmap/ZerosOfLFunctions` and `TauCetiRoadmap/ReductiveGroupsPartII` are folders on main.
- The merge-order block does not list #248 or #253.

**Repair.** Edit only the description, as in the previous review's repair:

- change "take rank-one Hecke continuation and the global standard L-function from here" to "take the global standard L-function from here; their rank-one Hecke continuation is AnalyticNumberTheoryPartI §2.3a";
- replace the §2.7 sentence with "The local and adelic Fourier analysis and local zeta integrals are AnalyticNumberTheoryPartII §§5.3g–5.3j; the rank-one scalar comparison uses ArithmeticGaloisRepresentations §2.7";
- delete the LFunctions/ZerosOfLFunctions sentence;
- drop ReductiveGroupsPartII from the open pull requests.

## Verified sound

### Gate, dependency check, elaboration and scope (run on this head)

**Gate.** `gate … --base origin/main` printed `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK` and exited 0. The worker's run also reports `build=0`.

**Dependency check.** It printed `depcheck: 239 roadmaps, 2336 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line, and this roadmap sits at line 94 of the merge order.

**Scope.**

- `git diff --stat origin/main...HEAD` outside the folder is empty.
- The folder holds `README.md`, `Suggested.lean` and `metadata.toml`.

**Elaboration.**

- `lake env lean` on `Suggested.lean` exits 0 in 8 s.
- It prints exactly 14 `declaration uses sorry` warnings and nothing else, at lines 75, 80, 91, 125, 138, 164, 222, 290, 366, 382, 428, 523, 606 and 682.

**`#check @` audit.**

- I ran `#check @` on all 33 declarations, appended to a scratch copy of the file. Every elaborated type carries its binders.
- The two `signatures.md` leads, `hbesselK` in the two Bessel theorems, are false positives: it appears as the anonymous premise `(∀ ν c, besselK ν c = …) →`.
- The `GL2Blueprint` theorems carry the F-instances and V-instances through `localK1 F n` and π.

**One-tactic probe.** On a scratch copy, `first | rfl | simp | infer_instance | trivial | norm_num | decide | omega` left unsolved goals on all 14 `sorry`s. There is no padding by the probe.

**Instances.**

- `#synth` gives `Units.instMeasurableSpace`, which is `.comap Units.val` (Mathlib `MeasureTheory/Group/Arithmetic.lean:668`), on both `GL (Fin 2) F` and `Fˣ`. Left multiplication is measurable for it, so Haar measures exist and the measure hypotheses are not vacuous.
- The quotient `GL ⧸ N` carries `QuotientGroup.measurableSpace`.
- `Representation.IsIrreducible` is `IsSimpleOrder (Subrepresentation ρ)`.

### Seeded sample: Check for the theta-Mellin formula (AL.3.5.1, `:1706–1708`)

- CogdellColumbia lines 256–267 (§1.1.3, printed p.4) define `E(g,s;Φ,η)=|det g|^s∫Θ′_Φ(a,g)|a|^(ns)η(a)d×a` for Re(s)>1, with the ξ=0 term removed.
- Lines 273–289 (p.5) give the poles at iσ and 1+iσ, the functional equation `E(ᵗg⁻¹,1−s,Φ̂,η⁻¹)` and the `P_(n−1,1)` section sum.
- The Check's value is `3¹·5·2^(2·1)=60`; dropping n gives `3·5·2=30`. On a point mass, s=1 raises no convergence issue.
- The locator "§1.1.3, pp.4–5" is correct (physical page = printed page). The README flags no locator as unverified.

### Library declarations checked at the pins

About 45 Mathlib names passed `#check` without error. They include:

- `VectorFourier.fourierIntegral_comp_add_right` and `_const_smul`, `integral_indicator_const`, `IsLocallyConstant.isOpen_fiber`, `generalized_tube_lemma` and `IsLocallyConstant.iff_exists_open`;
- `AddSubgroup.zmultiples` and `HasCompactSupport.of_support_subset_isCompact` (which needs `[R1Space]`);
- `Matrix.charpolyRev`, `eval_charpolyRev`, `coeff_charpolyRev_eq_neg_trace`, `reverse_charpoly`, `charpoly_units_conj` and `charpoly_fromBlocks_zero₁₂`;
- `MeromorphicOn.divisor_fun_mul` and `divisor_fun_inv`, `meromorphicOrderAt_mul` and `Complex.Gammaℝ_mul_Gammaℝ_add_one`;
- `gaussSum_mul_gaussSum_eq_card`, `DirichletCharacter.IsPrimitive.completedLFunction_one_sub`, `TemperedDistribution.delta`, `dotProductBilin`, `Matrix.GeneralLinearGroup.upperRightHom` and `transposeMulEquiv`.

I read the definition of `Distribution.dsupport` at `Analysis/Distribution/Support.lean:94`. It is the intersection of the closed sets off which the distribution vanishes on test functions supported there, so the hypothesis of `pointSupported_finiteJet` means what the README says.

Tau Ceti names:

- by `#check`: `traceBilinForm_apply` (`(X*Y).trace`), `traceBilinForm_isSymm`, `traceBilinForm_nondegenerate`, `permutationGL` (the permutation matrix of σ⁻¹) and `upperUnitriangularGroup` (`IsUpperUnitriangular`);
- located in the source: `exists_differentiableOn_eq_dedekindZeta_sub` and `ne_zero_of_eqOn_dedekindZeta` (`NumberTheory/NumberField/DedekindZeta.lean:154, 196`), `CuspForm.abscissaOfAbsConv_qExpansion_coeff_le`, `LSeries_qExpansion_coeff_eq` and `hasEntireExtension_qExpansion_coeff` (`ModularForms/LFunction/Basic.lean:145, 177, 192`), `HeckeRing.GL2.Newform.LSeries_eulerProduct_hasProd` (`EulerProduct.lean:187`), `fourierPontryaginDualEquiv`, `RestrictedProductGroup` and `rationalDiagonal`.

**Duplication by object.** There is no exponential integral, mirabolic or last-row subgroup, or Whittaker-functional carrier in the pinned Mathlib or Tau Ceti. So `negativeEi`, `lastRowStabilizer` and `whittakerFunctionals` duplicate nothing.

### Cross-roadmap citations resolved (at open heads, or on main)

- **AnalyticNumberTheoryPartI (#1126).** `besselK` (Suggested.lean:626) has the body of `hbesselK` token for token, so the `rfl` claim holds. Also checked: §0.29 "Centered growth", §§0.29a–0.29b, §2.1a, §2.3a with `heckeContinuation`, `heckeFiniteFactor`, `heckeArchFactor` and `heckeConductorScale`, and §2.22a.
- **AnalyticNumberTheoryPartII (#1167).** §5.3g covers completions of number fields only, which is why AL.0.3.1 owns positive characteristic. §5.3h is checked, and §5.3j's measures (`2dxdy/|z|_ℂ` on ℂ) match AL.1.2.4. §5.3j defines the local zeta integral but states no local functional equation, so AL.1.3.2 is the single owner of that equation.
- **ArithmeticGaloisRepresentations (#856).** Checked §§2.4, 2.5 and 2.7, and the anchors `#local-constant-gauss-sum` (bold lead "Arithmetic character constants"), `#standard-test-function-evaluations` and `#root-number-product-formula`. Its Gauss sum `q^(−a/2)Σω⁻¹(y)ψ(y/c)` agrees with AL.1.3.4. Its additive-character scaling gives (3.29) after the self-dual rescaling `|β|^(1/2)`. `Conductor.artinConductor`, `artinConductorNat` and §5.13 are present.
- **SmoothRepresentationsOfLocalGroups (#1688).** SR.1.1, SR.2.3 *whittaker-functionals* (GL₂ uniqueness only; all-rank uniqueness is AL.3.1.1 here), SR.5.1 *mirabolic-derivatives* and SR.5.3 *highest-derivative-adapter* are present. It uses the same `TauCeti.upperUnitriangularGroup`.
- **ClassFieldTheory on main.** `characterConductorExp` is declared under `[IsNonarchimedeanLocalField K]` (Suggested.lean:657, 2155), so it covers both characteristics as AL.1.1.1 uses it.
- **EtaleCohomologyFoundations on main.** §0.11 has `ClassicalAlgebraic.smoothTrace` and `curveDuality`.
- **InverseGaloisAndArithmeticFundamentalGroups (#850).** §IG.0.T3 has `VanishingCycles.etaleTraceFormula`.
- **Cogdell's Fields lectures**, used for the Lean docstrings.
  - Lines 2334–2370: Prop 6.2 (convergence for unitary inputs), the ideal independent of j, and Theorem 6.1.
  - Lines 2386–2393: Prop 6.3 and Cor 6.3.1.
  - Lines 2434–2464: Theorem 6.2 with `ω_{π′}(−1)^(n−1)` and `W̃(g)=W(w_nᵗg⁻¹)`, and Prop 6.5 (monomial ε).
  - These match `rankinSelbergLocal`'s quantifiers.
- **Humphries, Godement–Jacquet tests**, lines 37–62. Theorem 1.2 and (1.3) match AL.3.3.7's test function.

### Ownership against open work

- **GlobalShtukasAndFunctionFieldLanglands (#1490).** Its README line 21 gives GL_r Lafforgue, the curve HN theory and the two-leg shtukas to this roadmap.
- **AutomorphicSpectralTheory (#925).** §3.6a consumes AL.3.9.4's scalar strip bound and adds only operator estimates.
- **AutomorphicLFunctionsAndLocalFactorsPartII (#1756).** Line 7 names this roadmap as base and imports it.
- **GL2AutomorphicRepresentationsAndTransfer (#931).** It uses "supplied newvectors".
- **Old titles.** The titles cited by MetaplecticAutomorphicForms (#1063, line 61), ExoticMonoidalStructuresAndAbstractAutomorphicity (#1737, line 59) and AbelianSurfacesModularity (#1746, line 152) resolve through the id map at `:15–41`.
- **FunctionFieldArithmetic (#1474, merge order 354).**
  - Its §2.2 `selfDual_global_volumes` restates the comparison of self-dual and integral volumes that AL.0.6.1 (`:576`) proves.
  - This roadmap (merge order 94) is the earlier owner, so the citation repair belongs to that roadmap's review; this folder needs no change.
- **Gaps declared on this roadmap.** Seven other roadmaps (#1404, #1504, #1737, #1746, #1758, #1805, #1837) declare `gap:` contracts on this roadmap. The intake announces those on this roadmap's job; they are not findings here.

### Adversarial table

| Statement | Instances | Values computed (each side) | Result |
|---|---|---|---|
| `AL0.pointSupported_finiteJet` | T=δ₀′ on ℝ, f=x·e^(−x²); T=0 | f(0)=0 and f′(0)=1, so δ₀′(f)=±1: N=0 fails and N=1 works; T=0 has N=0 | Pass |
| `AL0.BesselHalfOrderDerivative` | c=1 | central difference of `∫e^(−cosh t)cosh(νt)dt` gives 0.166597; `−√(π/2)e·Ei(−2)` gives 0.166597 | Pass |
| `AL0.BesselLaplaceMellin` | m=1, t=0.3, s=1.2 | quadrature 0.03091; closed form 0.030923. In G–R 6.621.3 with α=β, ₂F₁(…;0)=1 gives the displayed Γ-ratio with μ=s+½, ν=t+½ | Pass |
| `hbesselK` vs AnalyticNumberTheoryPartI `besselK` | its Suggested.lean:626 | `(1/2)∫exp(−c(u+u⁻¹)/2)exp(ν log u)/u` on both sides | Pass (`rfl`) |
| `archimedeanEigenSpace` convention | ℝ, χ(a)=a⁻¹ | `T(f(a⁻¹·))` with T=δ₀′ gives `a⁻¹δ₀′(f)`; χ=1 gives δ₀ | Pass |
| `finiteEigenSpace_finrank` | χ=1; χ=|·|⁻¹ | χ=1 gives ℂδ₀, and `r′(ϖ)λ₀=λ₀−δ₀` shows no second line; at χ=|·|⁻¹, z(−1,1) with `L(−1,1)=(1−q)⁻¹` finite extends `|x|⁻¹d×x`, so the dimension is 1 | Pass |
| `localZetaIntegral_functionalEquation` | 𝔽₃((t)), χ=1, f=1_O, ν(ψ)=0 | Z=(1−3^(−s))⁻¹ is integrable exactly on Re s>0=−r; f̂=f; γ=(1−3^(−s))/(1−3^(s−1)); at s=0 it is an identity of germs | Pass |
| `hmod` pins the modulus a | x=0, any U with 0<μU<∞ | μ{0}=0 forces a(0)=0; x=ϖ gives a(ϖ)=q⁻¹ | Pass |
| `archimedeanLocalFunctionalEquation` | ℝ, Gaussian; ℂ, `e^(−2πzz̄)` | Γ_ℝ(s) and `Γ_ℝ(1−s)/Γ_ℝ(s)`; `4π∫e^(−2πr²)r^(2s−1)dr=(2π)^(1−s)Γ(s)=πΓ_ℂ(s)` | Pass |
| `AL2.godementJacquetLocal` | trivial rep of GL₂(F), Φ=1_{M₂(O)} | `Σ_k(Σ_{j≤k}q^j)q^(−k(s+½))` equals `(1−q^(−s−½))⁻¹(1−q^(½−s))⁻¹`, convergent iff Re s>½; P(0)=1 | Pass |
| GJ dual transform | `fourierIntegral … (−Y)` | `∫ψ(−tr(X(−Y)))Φ=∫ψ(tr XY)Φ`; Zd(1−s) has exponent (1−s)+n/2 | Pass |
| `casselmanNewvector` | unramified principal series; Steinberg; n=c−1 | n+1; n; (c−1)+1−c=0 | Pass |
| `newvectorLevelExists`, `hinf` | ramified χ∘det of GL₂(ℚ₃) | diag(2,1)∈K₁(P^m) acts by χ(2)=−1, so no fixed vector, and `hinf` excludes it | Pass |
| `localK1 F 0` | quotient by the unit ideal | the last-row condition holds in the zero ring, so the subgroup is GL₂(O) | Pass |
| `whittakerUniqueness` | GL₁; trivial GL₂ rep | rank 1 (dual of a line); ℓ=ψ_N(u)ℓ forces ℓ=0, rank 0 | Pass |
| `rsIntegrand` independent of the representative | y′=yu, u∈N | factor ψ(u⁻¹) from W and ψ⁻¹(u⁻¹) from W′; product 1; det and x unchanged | Pass |
| W̃ character | `w ᵗu⁻¹ w⁻¹` | the superdiagonal entries are −u_{i,i+1}, so W̃ is ψ⁻¹-Whittaker and the dual pair is opposite | Pass |
| `rankinSelbergLocal` exponent | GL₂×GL₁ point masses, W=2, W′=3, |det|=4, s=1 | `2·3·4^(1/2)=12`; with exponent s, 24 | Pass |
| `rankinSelbergLocalEqualRank` | GL₁×GL₁ point mass, Φ=5, |det|=2, s=1 | 60 | Pass |
| AL.3.2.3 Check, ramified | ℚ₃ quadratic χ, χ(3)=1 | `L(s,χ×χ)=(1−3^(−s))⁻¹`, 3/2 at s=1; the rootwise product gives 1 | Pass |
| `genericNewform` | GL₁, c(χ)=1; ramified χ∘det of GL₃ | K₁(P^m)=1+P^m, so c=1 and a line; χ∘det has no Whittaker functional, excluded by `hwhit` | Pass |
| AL.3.5.1 theta–Mellin (sample) | point mass, n=2, |det|=3, θ=5, |a|=2, s=1 | 60; 30 without n; source `|a|^(ns)` | Pass |
| AL.3.5.2 residues | n=2, g=1, η=1 | −κΦ(0)/2 at 0, κΦ̂(0)/2 at 1 | Pass |
| AL.0.1.11 Check (R01) | `e^(−πx²)`, ψ=e(x) | support ℝ, not in a compact subgroup; Ff(0)=1, Ff(1)=0.0432; continuous pairing with compact U gives an open U⊥ | Fail (R01) |
| AL.0.1.4 Check (R01) | U=ℤ·1 | U⊥=ℤ is not open, but U is not compact | Fail (R01) |
| rank-one theorem vs GJ at n=0 (R02) | χ=1, f=1_O | rank one: integrable at s=½; GJ at n=0 holds with c=5 and is silent at s=½ | Fail (R02) |
| AL.3.9.4 locator (R03) | CogdellFields lines 3373–3382 | m<n−1 is left unwritten; m=n−2 (`GL₄×GL₂`) is uncovered | Fail (R03) |
| AL.4.2.1 *Needs:* (R04) | heading scan | 0 headings for the two phrases; 1 occurrence each | Fail (R04) |
| AL.1.3.5 ρ formula (R05) | ℚ₃ quadratic, ν=0, 𝔣=(3) | `1/ε=i·3^(s−½)=3^(s−½)/𝔤` with 𝔤=−i; formula sound, notation not | Fail (R05) |
| AL.1.3.1 Check | ℚ₃, ψ₀(3·), ν=1 | `𝔤=3·3^(−3/2)·(−i√3)=−i`; ε=−i·3^(1−2s); at s=0, −3i; omitting ν gives −i√3 | Pass |
| AL.1.6.1 Check | χ₄ over ℚ | Gauss sum `e^(−πi/2)−e^(−3πi/2)=−2i`, 𝔤=−i, ω₂(2)=1, ε_∞=i, product 1 | Pass |
| AL.0.3.1 alternating Check | 𝔽₃((t)), a=(t⁻¹,0) | τ=−1, f̂̂=f; f̂̂(a)=1 and f(−a)=0 since 2t⁻¹∉O | Pass |
| AL.0.3.1 Mat₂ Check | ν=1 | index 3⁴, vol=3⁻²; the scalar volume 3^(−1/2) gives 27 | Pass |
| AL.2.1.8 | factorization | `q(α+β)²−αβ(q+1)²=qα²+qβ²−αβ(q²+1)=(qα−β)(α−qβ)` | Pass |
| AL.1.4.4 table | real discrete (k,t), k=2 | det Ind((z/|z|)^(k−1))=sgn^k; ε=i²=−1; shift ½ | Pass |
| AL.2.2.4 central character | g∈K₀(p^c) | `g·diag(1,d⁻¹)` has last row (g₂₁,1); diag(d⁻¹,1)∈K₁ at every level | Pass |
| AL.3.10.3 Check | ℙ¹/𝔽₃, t²+1 | q_v=9, `(1−αβz²)⁻¹`; n(ψ_v)=−1 gives ε∝(z²)⁻¹ | Pass |
| AL.3.12.2 degrees | χ(V⊗V∨)=(2−2g)n² | `h¹=2d−(2−2g)n²=(2g−2)n²+2d` | Pass |
| AL.3.16.1 | r=0.7 | Γ_ℝ(1)=1; `Γ_ℝ(1+2ir)Γ_ℝ(1−2ir)=1/cosh(πr)=0.21911` | Pass |
| AL.5.4.1 | p=3, k=0, j=1, α=1 | `(1−3)(1−1/3)=−4/3` | Pass |
| AL.5.2.2 | y²=x³−x, p=3 | a(3)=0; with α=1, β=3, `a_α(3)=−3≠1` | Pass |

## Not verifiable

- **Tate's thesis**, for its normalization behind "c(π)=1". It is not in the manifest or the source cache. R05 rests on the README's own formula (ii) and needs no Tate text.
- **Gelbart–Shahidi (JAMS 2001)** and **Jacquet–Piatetski-Shapiro–Shalika, *Conducteur*.** Both are paywalled and were not read. The claims citing them are cross-checked through CogdellFields lines 3383–3388 and through HumphriesGJTests and CogdellFields Theorem 6.3, respectively.
- **Kudla's *Tate's Thesis*, Casselman (1973), Bernstein–Zelevinsky, Lafforgue's Chapters I–VI and Yu.** I did not re-open their locators in this round. Locators I did not open are not claimed as verified.
- **Ownership against all 466 open pull requests.** I checked it only by targeted searches: Godement–Jacquet, supplier gaps, and the closest-vocabulary roadmaps listed above. I did not read every open roadmap.

## Source issues

- **Misprint** in CogdellFields at Lecture 6 §3, before Proposition 6.5, printed p.49: the source writes the first ε-factor of the double-application identity with arguments π×π; it should be π×π′; affects nothing.
- **Misprint** in CogdellFields at Lecture 9 §5, printed p.73: the archimedean equal-rank sum writes the second Whittaker function with a stray trailing "y" after its index; it should be W′_{v,i}; affects nothing.
