# Review of VonNeumannAlgebras (pull request #1041 at 296b9d1)

**Verdict:** needs changes

No finding is blocking. One P3 finding is carried:
- **R01 (P3):** the branch is still not rebased on main (`CONFLICT (add/add)` on both files), and its own Lake pin lacks every Tau Ceti module the README's contracts and the new V10.KMS text cite. Carried from the previous review's R02 and the one before it (R03). The repair is the worker's rebase step; nothing in the two reviewed files needs editing for it.

Everything else the previous review asked for is repaired, and the full review below found no new defect: the W*-KMS headline is stated and true as written, the Phragmén–Lindelöf, Gaussian, Tau Ceti KMS/Gibbs and prime-comparison citations exist with the stated signatures at main's pin (and the Mathlib ones at both pins), and the seeded sample (13.1, 13.2) checks against the texts.

## Previous findings (review of 772fc38)

- **R01 (the W*-KMS characterization called not statable): repaired.**
  - `Suggested.lean:388–410` states `existsUnique_isKMS_flow` exactly in the tested form: faithful normal state (`φ 1 = 1`, positivity, `IsNormalFunctional M φ`, faithfulness), `∃! σ : ℝ → (M.toStarSubalgebra ≃⋆ₐ[ℂ] M.toStarSubalgebra)` with the group law, pointwise SOT continuity through `toPointwiseConvergenceCLM`, and for every pair a bounded continuous strip function, holomorphic inside, with `F t = φ (σ t x * y)` and `F (t + I) = φ (y * σ t x)`.
  - `Suggested.lean:48–52` (docstring): "The KMS characterization of the modular group needs none of them in its existence-and-uniqueness form, which is stated below."
  - `README.md:2836–2843`: "a faithful normal state φ on a concrete von Neumann algebra M has exactly one one-parameter group of star automorphisms of M, pointwise continuous in the strong operator topology, … This is `existsUnique_isKMS_flow`"; the continuity-class remark cites Hiai §2.2, p. 17, whose identity is at hiai-lectures lines 679–681, and Theorem 2.14 is at lines 737–739 ("uniquely determined as a weakly continuous one-parameter automorphism group … at β = −1"), with "weakly (hence strongly) continuous" in its proof at lines 751–752.
  - `README.md:4813–4815` names it in the OperatorAlgebraDynamics consumer line.
  - Elaboration: the file exits 0 with 24 `declaration uses 'sorry'` warnings, the new one at `:399`, and nothing else.
- **R02 (branch not rebased): not repaired.** It is R01 below.
- **R03 (V10.KMS rebuilt Mathlib's Phragmén–Lindelöf and restated Tau Ceti's KMS/Gibbs theorems): repaired.**
  - `README.md:2848–2856`: "The strip estimates are Mathlib's Phragmén–Lindelöf principle … `PhragmenLindelof.horizontal_strip` … `PhragmenLindelof.eqOn_horizontal_strip` … The Gaussian integrals are Mathlib's `integral_cexp_quadratic` … and `fourierIntegral_gaussian`"; `:2857–2860` keep as owned only the Fourier smoothing estimate and the analytic elements of a weakly continuous group.
  - `:2861–2865` state the crosswalk `G(z)=F(z+i)`, β=−1, a=y, b=x; `:2873–2883` reduce the one-block case to `Matrix.IsHermitian.isKMSState_gibbsState` and `isKMSState_iff_eq_gibbsState` and own the multi-block case through `isKMSFunction_apply_mul_entireExtension_iff`.
  - The contracts `README.md:194–207` (Mathlib) and `:262–282` (Tau Ceti) list the declarations; the Needs line `:2884–2890` and the Layer 10 dependencies `:3196–3199` name them. The crosswalk and the uniqueness-of-the-group Checks `:2902–2914` are new.
- **R04 (V10.AffineAP owned the prime comparison): repaired.**
  - `README.md:3085–3096`: "Mathlib's `Rat.HeightOneSpectrum.primesEquiv` is the bijection … and Tau Ceti's `Rat.HeightOneSpectrum.absNorm_asIdeal` gives `absNorm v = natGenerator v`. Own only the counting identity `π_(d,a₀)(x) = TauCeti.primeCount ℚ {𝔭 | absNorm 𝔭 % d = a₀ % d} x`"; the scope `:68–73` and the Needs line `:3104–3108` match.

## R01 (P3) — The branch is still not rebased, and cites Tau Ceti declarations absent at its own pin

**Location:**
- `README.md:216–236` and `:262–282` (the Tau Ceti contract: `PositiveLinearMap.toGNS` …, `NonUnitalStarAlgHom.IsNondegenerate`, `VonNeumannAlgebra.adjoin` …, `StarSubalgebra.exists_forall_norm_sub_apply_lt_of_mem_centralizer_centralizer`, `TauCeti.CStarAction.IsKMSFunction`, `IsKMSState`, `IsKMSFunction.eqOn`, `isKMSFunction_apply_mul_entireExtension_iff`, `selfAdjoint.cstarAction`, `selfAdjoint.entireExtension_cstarAction`, `Matrix.gibbsState`, `Matrix.IsHermitian.isKMSState_gibbsState`, `isKMSState_iff_eq_gibbsState`, `LinearMap.existsUnique_trace_mul_eq`), ending "Each is used as stated at the pin."
- `Suggested.lean:17–18`: "written out so that the file imports only Mathlib".

**Claim:** at this pull request's own pin none of these declarations exists, so the contract sentence is false for the branch as it stands, and the pull request cannot merge.

**Witness:**
- `git merge-tree --write-tree origin/main HEAD` prints `CONFLICT (add/add)` for both `README.md` and `Suggested.lean` (merge base `350e970c`).
- `lake-manifest.json` pins Tau Ceti `a91d3aaf` and Mathlib `6b7abb3c`; main pins `2fd255d9` and `1b1ccf4b`. At `a91d3aaf`, `TauCeti/Analysis/CStarAlgebra/` contains only `CharacterSpaceMeasure.lean` and `UnitaryCharacter.lean`: no `Action/`, no `GNS.lean`, no `Representation/Nondegenerate.lean`; there is no `TauCeti/Analysis/VonNeumannAlgebra/`, and `TauCeti/LinearAlgebra/Matrix/Trace/` has only `Basic.lean` and `FinTwo.lean` (no `Duality.lean`).
- At main's pin `2fd255d9` every cited name exists: `Action/KMS/Basic.lean:83` (`IsKMSFunction`), `:106` (`eqOn`), `:182` (`isKMSFunction_apply_mul_entireExtension_iff`), `:222` (`IsKMSState`); `Action/Inner.lean:43`, `:70`; `Action/Gibbs.lean:61`, `:86`, `:117`; `LinearAlgebra/Matrix/Trace/Duality.lean:31`; `NumberField/Ideal/IntegersRat.lean:183`.

**Repair:** rebase onto main keeping this head's two files (the worker's step; the previous review's R02 gives the rest: write the Layer 0 nondegeneracy clause as `π.IsNondegenerate` with its import once the pin has it, and delete `Suggested.lean:17–18`). Control: after the rebase `git merge-tree --write-tree origin/main HEAD` prints only a tree id, and `grep -rl IsKMSFunction .lake/packages/TauCeti/TauCeti/Analysis/CStarAlgebra/Action/KMS` finds `Basic.lean`.

## Verified sound

**Gate.** My run at 296b9d1 (`tauceti-roadmap … gate … VonNeumannAlgebras --base origin/main`) printed `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`, exit 0; the worker's run adds `build=0`. `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/VonNeumannAlgebras'` is empty.

**Dependency check** (verbatim, exit 0):

```text
depcheck: 238 roadmaps, 2323 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line; the merge order lists VonNeumannAlgebras at line 5. Every supplier named in a `*Needs:*` line or contract (OperatorTheory, BanachSpaceTheory, SemisimpleAlgebras, CompactGroups, AmenableGroups, BanachAlgebras, GlobalNumberFields, OptimalTransport, Chebotarev) is on main; OperatorAlgebraDynamics, CStarAlgebras, TypeAHeckeAlgebras and SelfAdjointSpectralTheory appear only as consumers.

**Lean.**
- `lake env lean TauCetiRoadmap/VonNeumannAlgebras/Suggested.lean`: exit 0, 12.8 s, exactly 24 `declaration uses 'sorry'` warnings at `:101, 112, 123, 132, 143, 172, 181, 208, 225, 245, 274, 283, 290, 319, 335, 362, 380, 399, 427, 443, 461, 496, 503, 513`.
- **`#check @name` for all 41 declarations** (24 theorems, 17 definitions) in one scratch copy: every H-declaration keeps `[NormedAddCommGroup H] [InnerProductSpace ℂ H] [CompleteSpace H]`; `existsUnique_isKMS_flow` keeps `{M : VonNeumannAlgebra H}`, the four state hypotheses and the three clauses exactly as the README states them (elaborated type quoted in my scratch); the three separable theorems keep `[SeparableSpace H]` (and `[SeparableSpace K]` for the two uniqueness theorems); `tomiyama` keeps `[PartialOrder A] [StarOrderedRing A]`. Nothing changed in the folder.
- **One-tactic probe** (`first | rfl | infer_instance | simp | aesop | trivial` at every `sorry`): all 24 sites fail (the probe reports 24 errors, one per site), so there is no padding.
- README and Lean agree: every backticked own name in the README is declared (gate `readme-ids-missing=0`), and `existsUnique_isKMS_flow` is named at `README.md:2842` and `:4815`.

**Library declarations opened (file and line).**
- Mathlib at the branch pin `6b7abb3c` and at main's pin `1b1ccf4b` (same lines unless noted): `Analysis/Complex/PhragmenLindelof.lean:113` (`horizontal_strip`: `DiffContOnCl` on `im ⁻¹' Ioo a b`, growth `=O[…] exp(B * exp(c * |re z|))` with `c < π/(b−a)`, `‖f z‖ ≤ C` on both lines, conclusion on `a ≤ im z ≤ b`) and `:249` (`eqOn_horizontal_strip`, `EqOn f g (im ⁻¹' Icc a b)`); `Analysis/SpecialFunctions/Gaussian/FourierTransform.lean:173` (`:174` at main; `integral_cexp_quadratic`, `Re b < 0`, value `(π/−b)^(1/2) · cexp(d − c²/(4b))`) and `:200` (`fourierIntegral_gaussian`, `0 < Re b`, value `(π/b)^(1/2) · cexp(−t²/(4b))`); `NumberTheory/Padics/HeightOneSpectrum.lean:90` (`natGenerator`), `:109` (`primesEquiv : HeightOneSpectrum R ≃ Nat.Primes`, under `[IsIntegralClosure R ℤ ℚ] [IsDedekindDomain R] [IsFractionRing R ℚ]`, which `𝓞 ℚ` satisfies). The README's descriptions of all five match.
- Tau Ceti at main's pin `2fd255d9`: `Analysis/CStarAlgebra/Action/KMS/Basic.lean:83–89` (`IsKMSFunction`: continuous on `im ⁻¹' uIcc 0 β`, differentiable on `uIoo`, bounded image, `F t = φ (a * α_t b)`, `F (t + β I) = φ (α_t b * a)`), `:106` (`eqOn`), `:182–184` (`isKMSFunction_apply_mul_entireExtension_iff`), `:222–225` (`IsKMSState`: `‖ω‖ = 1` and a KMS function for every pair, under `[StarOrderedRing A]`); `Action/Inner.lean:43` (`cstarAction`), `:61–63` (`cstarAction_apply`: `exp((I t) • h) * a * exp(−(I t) • h)`), `:70–73` (`entireExtension_cstarAction`); `Action/Gibbs.lean:61` (`gibbsState`: `Tr(exp(−(β • K)) x) / Tr(exp(−(β • K)))`), `:86`, `:117`; `LinearAlgebra/Matrix/Trace/Duality.lean:31` (`∃! ρ, ∀ x, f x = (ρ * x).trace`, over a commutative semiring); `NumberField/Ideal/IntegersRat.lean:183` (`absNorm_asIdeal`); `Chebotarev/PrimeCounting/PrimesCongruent.lean:50, 63`; `ArithmeticDirichletSeries/Counting.lean:654` (`primeCount` as the inclusive prime summatory of an indicator).
- Tau Ceti at the branch pin `a91d3aaf`: `IntegersRat.lean:162` (`absNorm_asIdeal`) and the two Chebotarev lines exist; the modules of R01 do not.

**Cross-roadmap citations, overlaps and ownership.**
- `roadmaps resolve` and `roadmaps overlaps` report nothing for this roadmap (worker's run). The merge-order paragraph of the description names no dependency, which is right: every supplier is on main.
- OperatorAlgebraDynamics on main (`TauCetiRoadmap/OperatorAlgebraDynamics/README.md:110–112`) declares `gap:modular-theory` asking VonNeumannAlgebras for "V10's modular operator and modular group of a faithful normal state, its W*-KMS …"; its open revision #1137 (`README.md:121–127`) consumes V10.KMS for the same theorem and cites Tau Ceti's `Matrix.gibbsState` for the matrix case (`:405`). So this roadmap is the single owner of the W*-KMS theorem and of the multi-block finite-dimensional identification, and the matrix Gibbs theorem is Tau Ceti's for both. `roadmaps grep -i 'modular (automorphism )?group'` finds, among operator-algebra roadmaps, only this one and OperatorAlgebraDynamics.
- `Completed/OneParameterSemigroups/README.md` has no "KMS" or "modular" line, consistent with the scope sentence `README.md:44–52`.
- CStarAlgebras on main (`README.md:48–53`, `:118–119`) consumes V13b.SpatialNorm and does not own the spatial norm; consistent with `README.md:87–88`.
- No other open `Suggested.lean` uses the namespace `TauCetiRoadmap.VonNeumannAlgebras`, and no other roadmap defines normal functionals, normal semifinite traces, the projection predicates, the type decomposition or a KMS flow of a von Neumann algebra (greps of the 468 open heads and main).
- The ids this head drops relative to main (`V2.AbelianClassification`, `V2.AbelianLocalizable`, `V2.AbelianRepresentationMultiplicity`, `V7.GroupApplications`) are cited nowhere outside this folder (gate `dropped=0`; they reappear as `V4.…` and `V8.GroupApplications`).

**Sources: the seeded sample (13.1 and 13.2) and the new locators.** Printed page = pdf page − 6 for anantharaman-popa; = pdf page for hiai-lectures and peterson-notes.
- **13.1:** Hiai Theorem 6.5 (hiai-lectures line 2666, p. 55: a C*-algebra and a C*-subalgebra, properties (ii) and (v) of Theorem 6.4), proof restricted to the von Neumann case at lines 2668–2669; Peterson Theorem 6.2.1 (peterson-notes line 3948, p. 98: unital A, unital B ⊂ A, `‖E‖ ≤ 1`); Anantharaman–Popa Definition 10.2.1 (line 7191, p. 161) and Proposition 10.2.2(i)–(iii) (lines 7198–7205).
- **13.2:** Anantharaman–Popa Proposition 10.2.5 (line 7269, p. 163: amenable iff hypertrace), Theorems 10.2.8–10.2.9 (lines 7325, 7333–7350, pp. 164–165: the operator form (10.1)–(10.2) with `‖T‖₂,Tr = 1`, positive finite rank), Theorem 10.3.1 (line 7413, p. 166: finite-rank projection, `‖uPu*−P‖ < ε‖P‖`, II₁ factor), Theorem 10.3.4 (line 7532, p. 168), Definitions 11.1.1–11.1.2 and Theorem 11.1.3 (lines 7685–7702, p. 173), Theorem 11.2.2(1)–(5) (lines 8294–8302, p. 186), Remark 11.2.3 and the AFD definition and Corollary 11.2.4 (lines 8358–8377, p. 188), the Notes (line 8397, p. 189); Peterson Theorem 6.3.8 (line 4146, p. 103); Hiai §1.8 (lines 327–334, p. 9); Haagerup 1989 p. 265 (line 52) and Theorem 6.1 (line 1177); Haagerup 2016 Theorems 1.1–1.2 (lines 49, 52); Connes–Feldman–Weiss Definitions 5–6, Proposition 7, Lemmas 8–9, Theorem 10 (lines 265, 281, 336, 382, 480, 520).
- **V10.KMS:** Hiai Definition 2.11 (lines 686–689: at β=−1 the strip `0 < Im z < 1`, `f(t)=φ(α_t(x)y)`, `f(t+i)=φ(yα_t(x))`, which is the Lean statement's convention), Lemma 2.12 (line 702), Lemma 2.13 with the Gaussian means `√(n/π)∫e^(−nt²)α_t(x)dt` (lines 713–726, p. 18), Theorem 2.14 (lines 737–739), the strong-continuity identity (lines 679–681, p. 17), and Theorem 2.2's standing situation (lines 409–411: M on H with a cyclic separating Ω).
- **V4.Core, V6:** Anantharaman–Popa Definition 2.5.1 (line 1925), Theorem 2.5.5 and Remark 2.5.7 (lines 1983, 2042), Definition 8.3.1 (lines 5742–5761); Peterson §3.2 (lines 1698–1717), Theorem 3.3.1 (line 1888), Theorem 4.9.4 (line 3080). These were re-read for the adversarial rows below.

**Adversarial pass.** Every value below was computed this round; "holds" means the instance agrees with the statement as written.

| Statement | Instances | Values computed | Result |
| --- | --- | --- | --- |
| `existsUnique_isKMS_flow` (existence) | M₂(ℂ), φ=Tr(h·), h=diag(2/3,1/3), x=e₁₂, y=e₂₁ | σ_t(e₁₂)=h^{it}e₁₂h^{−it}=(2/3)^{it}(1/3)^{−it}e₁₂=2^{it}e₁₂; F(z)=(2/3)2^{iz}: F(t)=(2/3)2^{it}=2^{it}φ(e₁₁)=φ(σ_t(x)y); F(t+i)=(2/3)2^{it}·2^{−1}=(1/3)2^{it}=2^{it}φ(e₂₂)=φ(yσ_t(x)); bounded by 2/3 on the strip | holds |
| `existsUnique_isKMS_flow` (uniqueness) | same φ; α_t=Ad(diag(r^{it},1)), r>0; trivial group | α_t(e₁₂)=r^{it}e₁₂, φ-invariant since h is diagonal; the bounded strip function with F(t)=(2/3)r^{it} is (2/3)r^{iz} (`eqOn_horizontal_strip`), F(t+i)=(2/3)r^{it}/r must equal (1/3)r^{it}, so r=2; r=3 gives (2/9)3^{it}≠(1/3)3^{it}; r=1 gives 2/3≠1/3 | only Ad(h^{it}) passes; holds |
| `existsUnique_isKMS_flow` (tracial, degenerate) | φ tracial; H=0; M=ℂ1 on H≠0 | tracial: F constant, φ(σ_t(x)y)=φ(xy)=φ(yx) for all y, faithfulness forces σ_t(x)=x; H=0: 1=0 so φ 1=0≠1, vacuous; ℂ1: σ=id, the only automorphism | holds |
| `existsUnique_isKMS_flow` (faithfulness needed) | M₂(ℂ), φ(x)=x₁₁ (kills e₂₂), diagonal groups Ad(diag(r^{it},1)) | F(t)=φ(α_t(e₁₂)e₂₁)=r^{it}φ(e₁₁)=r^{it}, so F(z)=r^{iz} and F(t+i)=r^{it}/r≠0=r^{it}φ(e₂₂)=φ(e₂₁α_t(e₁₂)) for every r: no diagonal group satisfies the condition | existence fails without `hφf`; hypothesis needed |
| continuity class (docstring) | pointwise SOT ⇒ σ-weak ⇒ Hiai's weak | ‖σ_t(x)‖=‖x‖, so SOT convergence on bounded nets is σ-weak convergence; conversely Hiai's identity ‖(α_t(x)−x)ξ‖²=⟨ξ,α_t(x*x)ξ⟩−⟨α_t(x)ξ,xξ⟩−⟨xξ,α_t(x)ξ⟩+⟨ξ,x*xξ⟩→0 | the ∃! class contains the modular group and is inside Hiai's uniqueness class; holds |
| V10.KMS crosswalk | Tau Ceti β=−1, a=y, b=x; G(z)=F(z+i) | Tau Ceti asks G(t)=φ(aα_t(b))=φ(yα_t(x)) and G(t+βi)=G(t−i)=φ(α_t(b)a)=φ(α_t(x)y); F(t+i)=φ(yα_t(x)) and F(t)=φ(α_t(x)y); strip `uIcc 0 (−1)`=[−1,0] is [0,1] shifted by −i; on the instance G(z)=(1/3)2^{iz}, G(t)=(1/3)2^{it}, G(t−i)=(2/3)2^{it} | matches the README `:2861–2865` and the Check `:2908–2911` |
| V10.KMS Gibbs crosswalk | K=log h, β=−1 and β=1 | β=−1: Tr(e^{K}·)/Tr(e^{K})=Tr(h·)/Tr h=Tr(h·); β=1: h⁻¹=diag(3/2,3), Tr=9/2, state Tr(diag(1/3,2/3)·); inner dynamics exp(itK)x exp(−itK)=h^{it}xh^{−it}=σ_t(x) | matches `:2873–2877` and `:2908–2909` |
| V10.KMS multi-block identity | general M=⊕M_{n_k}, h invertible positive | α_{t−i}(x)=h^{i(t−i)}xh^{−i(t−i)}=h^{it}hxh^{−1}h^{−it}; Tr(h·y·h^{it}hxh^{−1}h^{−it})=Tr(y h^{it}hxh^{−it}) (cyclicity, h commutes with h^{it}) =Tr(h h^{it}xh^{−it} y) | the stated identity holds; it is Tau Ceti's analytic KMS identity at β=−1 |
| V10.KMS several blocks | M=ℂ⊕ℂ | every h central, σ^φ=id; for any state F≡φ(xy)=φ(yx) (commutative), so every state satisfies the condition; group uniqueness for faithful φ holds by the theorem | matches `:2912–2914` |
| V10.ModularTheory Checks (consumed by V10.KMS) | GNS of φ=Tr(h·) on M₂, Ω=h^{1/2}, Δξ=hξh⁻¹ | Δ^{1/2}(xΩ)=h^{1/2}xh^{−1/2}h^{1/2}=h^{1/2}x, J=adjoint gives x*h^{1/2}=x*Ω; reversed h⁻¹ξh on x=e₁₂: J(h^{−1/2}e₁₂h)=he₂₁h^{−1/2}=(1/3)(3/2)^{1/2}e₂₁=6^{−1/2}e₂₁≠(2/3)^{1/2}e₂₁ | holds; convention pinned |
| V10.AffineAP identity | d=4, a₀=3, x=10, 7, 6.9; d=1 | primes ≡3 mod 4: 3, 7; count 2 at x=10 and (inclusive) at x=7, 1 at x=6.9; `natGenerator((3))=3`, `absNorm=3`, likewise 7, so the ideal count is the same; d=1: `a₀ % 1 = 0 = absNorm % 1`, both count all primes | holds; `primeCount` is the inclusive summatory (`Counting.lean:654`) |
| `tomiyama` (13.1) | diagonal E on M₂, a=diag(2,3), b=diag(5,7), x=[[1,2],[3,4]]; P(x)=e₁₁xe₁₁; transpose; A=0 | axb=[[10,28],[45,84]], E(axb)=diag(10,84)=aE(x)b; P has norm 1, fixes ℂe₁₁, P(1)=e₁₁≠1; transpose sends e₁₂↦e₂₁, fails fixing; A=0: ‖P‖=0, vacuous | holds; nonunital form needed |
| 13.1 Checks | transpose⊗id on Σe_ij⊗e_ij; ρ=[[1/2,c],[c̄,1/2]] | the image is the flip, eigenvalue −1 on e₁⊗e₂−e₂⊗e₁; ρ≥0 iff 1/4−|c|²≥0 iff |c|≤1/2 | holds |
| `IsInjective`, `IsHyperfinite`, `isInjective_iff_isHyperfinite` | ℂ1 on ℓ²; ℓ∞(ℕ); B(ℓ²); L(F₂) | P(x)=⟨e₀,xe₀⟩1 has norm 1; diagonal expectation norm 1; A_n=P_nB(ℓ²)P_n+ℂ(1−P_n) increasing with union weakly dense; L(F₂): a hypertrace restricted to ℓ∞(F₂) is a left-invariant mean, and F₂=W(a)⊔aW(a⁻¹)=W(b)⊔bW(b⁻¹) gives m(W(a))+m(W(a⁻¹))=1=m(W(b))+m(W(b⁻¹)) with the four sets disjoint, total 2>1 | holds |
| Følner Checks (13.2) | ℂ², τ=(a+2b)/3, u=(1,−1), x=(1,0), ε=1/10 | L²M basis √3δ₁, √(3/2)δ₂ (‖δ₁‖²=1/3, ‖δ₂‖²=2/3); for P=vv*, v=(α,β): (uP−Pu)_{ij}=v_iv̄_j(u_i−u_j), HS norm² 8|α|²|β|²; Tr(xP)/Tr P=|α|²; 8s(1−s)≤1/100 gives s≤0.00125 or s≥0.99875, neither within 1/10 of 1/3; P=1 gives 1/2; T=diag(3^{−1/2},(2/3)^{1/2}): Tr T²=1, Tr(xT²)=a/3+2b/3=τ(x); T=e₁₁: commutes, Tr(xT²)=1≠1/3 | holds |
| Semidiscreteness Checks (13.2) | ℓ∞ truncations; E_n1_[0,1/3] | x=(1,1,…): ‖x−(x₁,…,x_N,0,…)‖=1; the dyadic interval containing 1/3 gives E_nf=frac(2ⁿ/3)∈{1/3,2/3} there, so ‖E_nf−f‖_∞≥1/3, ‖E_nf−f‖₁≤2^{−n} | holds |
| V13b.SpatialNorm Checks | u=e₁₂⊗e₁₂+e₂₁⊗e₂₁; 1⊗1 | u swaps e₁⊗e₁↔e₂⊗e₂ and kills the other two, u*u rank-2 projection, ‖u‖=1 vs 2; ‖1⊗1‖=1 vs √2·√2=2 | holds |
| Bicentralizer Checks | h=diag(2/3,1/3), convention (aφb)(x)=φ(bxa) | (e₁₂φ)(e₂₁)=φ(e₂₁e₁₂)=φ(e₂₂)=1/3; (φe₁₂)(e₂₁)=φ(e₁₂e₂₁)=φ(e₁₁)=2/3 | holds |
| `exists_faithful_nondegenerate_representation` | A=0; A=ℂ²; control diag(z,0) on ℂ² for A=ℂ | K=0, span{0} dense in 0; diag(a,b) spans ℂ²; control is injective but span ℂ×0 not dense | holds; nondegeneracy discriminates |
| `exists_injective_nondegenerate_representation_lp` | A=ℂ; A=0 | π(z)=z·1 on ℓ² is injective and π(1) has range ℓ², so the span is ℓ²; A=0 has only π=0, span 0≠ℓ², so `[Nontrivial A]` is needed | holds |
| `double_commutant_iff_isClosed_image_ofCLM` | ℂI; finite rank+ℂ on ℓ² | (ℂI)''=ℂI closed; A''=B(ℓ²)≠A and A not WOT closed | holds |
| `closure_unitBall_eq_unitBall_double_centralizer` | ℂI; q=even projection, A=finite rank+ℂ | equal balls; qP_n→q SOT, ‖q−(c+F)‖≥max(|1−c|,|c|)≥1/2 | holds |
| `closure_isStarProjection_eq_positive_contractions` | H=ℂ; ℓ², C=1/2 | {0,1}∌1/2; block [[1/2,1/2],[1/2,1/2]] has eigenvalues 1,0 and compression 1/2 | holds; hypothesis needed |
| `IsCentralProjection`, `IsAbelianProjection`, `IsFiniteProjection` | M₂⊕ℂ; ℂ1 on ℂ²; M₂; L∞[0,1]; B(ℓ²) with the shift S | (e₁₁⊕0)(e₁₂⊕0)=e₁₂⊕0≠0=(e₁₂⊕0)(e₁₁⊕0); e₁₁∈(ℂ1)′ but ∉ℂ1; e₁₁M₂e₁₁=ℂe₁₁ abelian while e₁₂e₂₁=e₁₁≠e₂₂=e₂₁e₁₂; every L∞ projection abelian; S*S=1, SS*=1−e₀₀≤1 so 1 is not finite, e₀₀ finite (rank-1 vv*≤e₀₀ forces equality) | discriminating |
| `exists_predual`, `exists_vonNeumannAlgebra_starAlgEquiv` | ℂ1 on ℂ; B(ℂⁿ); M=ℂ² | X=ℂ with z↦z̄; X=conj S₁(ℂⁿ); diagonal on ℂ² | holds |
| `IsNormalFunctional`, `isNormalFunctional_iff_exists_tsum_inner` | ultrafilter state on ℓ∞; φ_w=Σ2^{−n−1}x_n; H=0 | φ(1_{0..N})=0↛1; 1−2^{−N−1}→1; ξ_n=2^{−(n+1)/2}e_n, Σ‖ξ_n‖²=1; ultrafilter state: any Σω_{ξ_n} has Σ_kφ(δ_k)=Σ‖ξ_n‖²=1 vs 0, both sides false; H=0: τ=0, ξ=0 | holds both directions |
| `isCyclic_iff_isSeparating_commutant` | M₂ on ℂ²; diagonal; H=0 | e₁ cyclic for M₂, separating for ℂI; (1,0): diag(0,1)(1,0)=0, neither; 0 both on H=0 | holds |
| `equivalent_of_subequivalent` | B(ℓ²), p=1, q=1−e₀₀ | S*S=1, SS*=q; q≼1 via v=q; p∼q, p≠q | holds |
| `tracialState_unique`, `exists_faithful_tracialState`, `isSimpleRing_of_isTypeIIOne` | M₂; ℂ⊕ℂ; B(ℓ²); R | τ(e₁₁)=τ(e₂₂)=1/2 forces tr/2, x↦x₁₁ fails (1 vs 0); t·pr₁+(1−t)pr₂ all tracial (factor needed); τ(1)=2τ(1); R: product trace normal and faithful, e₁₁ minimal excludes M₂; q_i=v_i*pv_i∈I, Σq_i=1 | holds |
| `IsNormalSemifiniteTrace`, `exists_isNormalSemifiniteTrace_of_isFactor` | Tr on B(ℓ²); τ≡∞ off 0; τ=0; ‖·‖ on M₂; τ'=0 | Tr(e₀₀)=1; ∞-map not semifinite; zero map semifinite not faithful; ‖e₁₁+e₂₂‖=1≠2; τ'=0·τ needs c=0∈ℝ≥0 | each clause independent; holds |
| `exists_conj_commutant_eq_of_isCyclic` | diag ℂ², Ω=(1,1); M₂ on M₂ (HS), Ω=I/√2; M₂ on ℂ²; H=0 | J=coordinate conjugation, JMJ=diag=M′; J(x)=x*, JMJ=right multiplications=M′; trace condition forces Ω=0, not cyclic (vacuous); J=0 | holds |
| `IsTypeIIInfinity`, `existsUnique_typeDecomposition` | R⊗̄B(ℓ²); B(ℓ²); R; M₂; III; M₂⊕R; H=0 | (0,0,1,0), (1,0,0,0), (0,1,0,0), (1,0,0,0), (0,0,0,1), (1⊕0,0⊕1,0,0) with (1,0,0,0) excluded by q=0⊕1; all 0=1 on H=0; each z_iz′_j (i≠j) forced to 0 | holds, unique |
| `ergodicSMul_dense_subgroup` | ℚ⊂ℝ; ℤ⊂ℝ | ℚ ergodic; ⋃[n,n+1/2) ℤ-invariant, neither null nor conull | holds; density needed |
| `HasTypeITwoSummand`, `exists_unique_extension_of_finitelyAdditive`, `dye` | M₂; M₂⊕M₃; M₃; M₄; ℂ²; M₃ with μ=Tr(diag(1,−1,0)·); M₂ Bloch | true; true (z=1⊕0); false (2·rank e=3); false (eM₄e≅M₂); false (e∼f forces e=f); C=1, ‖φ‖=2≤4; Bloch value 3/4 vs affine 1/2+1/(4√2)≈0.677; swap on ℂ²; transpose on M₃ Jordan only; Bloch map inner product −3/5 | holds |
| II₁ and II∞ uniqueness (13.2) | R vs L(S_∞); M₂; R⊗̄B(ℓ²); B(ℓ²) | both ≅R by Theorem 11.2.2; M₂ excluded (minimal projection); II∞ via Corollary 11.2.4; B(ℓ²) excluded | holds |

## Not verifiable

- **Arveson 1969, Theorem 1.2.3; Haagerup 1985; Haagerup 1987; Connes–Størmer 1978:** settled as uncertified, no legal full text in the cache.
- **Tomiyama 1957, Theorem 1:** the cached text for `tomiyama-1957` is five lines ending "Request unsuccessful. Incapsula incident ID …" (lines 1–5), a bot-block page, while the manifest records it as `certified` with `fetched_at = 2026-11-07`. Hiai Theorem 6.5 and Peterson Theorem 6.2.1 cover the statement 13.1 makes.
- **Paywalled books, not in the manifest:** Takesaki I–III (IV.4.9; VIII.1.2; XV.3; XVI.1.9, 1.22–1.23; XVII.3.12; XVIII), Runde 6.4.14, 6.4.24–6.4.25, Sakai 4.1.6, Goodman–de la Harpe–Jones §3.3, Reed–Simon I, Rudin; Connes–Woods 1985 §7; Bost–Connes, Laca–Raeburn, Neshveyev.
- **Connes, *Periodic automorphisms*:** image-only scan; OCR is not installed on this worker.

## Source issues

- **Gap** in hiai-lectures at Theorem 6.5, pp. 55–56: the source states Tomiyama's theorem for any C*-algebra and C*-subalgebra but proves only the case of a unital von Neumann subalgebra of a von Neumann algebra; it should give the bidual reduction for the general case; affects the proof.
- **Misprint** in anantharaman-popa at Definition 10.2.1, p. 161: the source writes "a von Neumann M" without "algebra"; it should read "a von Neumann algebra M"; affects nothing.
