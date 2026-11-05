# PORT-ExcursionOperatorsAndSpectralActionPartII

- **Branch:** `roadmap/excursion-operators-and-spectral-action-part-ii`, from `3b51055`.
- **Head commit:** `cc4ec51c` (`ExcursionOperatorsAndSpectralActionPartII: roadmap (README, Suggested.lean, metadata)`). It touches only `TauCetiRoadmap/ExcursionOperatorsAndSpectralActionPartII/{README.md,Suggested.lean,metadata.toml}`.
- **Build:** `lake build TauCetiRoadmap.ExcursionOperatorsAndSpectralActionPartII.Suggested` ended with `Build completed successfully (9004 jobs).` There is **1 warning**, `TauCetiRoadmap/ExcursionOperatorsAndSpectralActionPartII/Suggested.lean:51:8: declaration uses `sorry``, and no other output.
- **Gate:** `gate ExcursionOperatorsAndSpectralActionPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK` (exit 0).
- **Dependency check** (`gate --depcheck … --movable`), run on the committed README, exit 0. Its whole output:

  ```text
  depcheck: 228 roadmaps, 2152 edges, 0 problem(s)
  ```

  There is no UPWARD, CYCLE or `moved:` line.
- **Citation resolver** (`roadmaps resolve` on the ported README): no cross-roadmap citation and no Lean name is found nowhere.

## Draft pull request body

Build Hansen's theory of the stable Bernstein centre on top of the Fargues–Scholze geometric spectral action. The roadmap covers:

- the stable and very stable subspaces of the smooth Bernstein centre, with their character criteria;
- Euler-characteristic Hecke operators on virtual characters, both on one group and between basic inner forms;
- Fu's quantitative weight equidistribution for the representations of highest weight 4mρ̂, and the discriminant-weighted Hecke averaging estimate built from it.

From these it proves that the image of the Fargues–Scholze centre map consists of very stable distributions, for every connected reductive group over every p-adic field, with no tameness, quasi-splitness or residue-characteristic restriction. Two consequences follow:

- the Fargues–Scholze semisimple parameter is constant on the constituents of every atomically stable virtual character;
- for each extended pure inner form of a quasi-split group there is a surjection between the two Fargues–Scholze centres, compatible with normalized Levi restriction, stable tempered character transfer and matching test functions.

The excursion operators, the spectral action and the parameter are imported from AutomorphicGaloisRepresentationsPartII AG2.6, which constructs them and stops there; this Part II starts at their image in the Bernstein centre. The Hecke functors come from HeckeStacksAndLocalShtukas. The stable harmonic analysis the proofs need is stated as exact contracts on EndoscopicTransferAndUnitaryTraceComparison, SmoothRepresentationsOfLocalGroups, BunGAndNewtonStrata and HeckeStacksAndLocalShtukas, rather than rebuilt here. `Suggested.lean` states the root-lattice form of the weight-equidistribution bound on Tau Ceti's highest-weight and formal-character API. Its docstring names the other headline theorems and the carriers they lack at the pins.

AI assistance: Claude (Opus 5.5) did the port, the supplier and ownership checks, the mathematical self-review and the Lean signature validation.

## Dependencies still in pull requests

These suppliers are named in the README's supplier contracts, *Needs:* lines or Dependencies:

- AutomorphicGaloisRepresentationsPartII
- HeckeStacksAndLocalShtukas
- LanglandsParameterStacks
- BunGAndNewtonStrata
- GeometricSatakeAndFusion
- EndoscopicTransferAndUnitaryTraceComparison
- SmoothRepresentationsOfLocalGroups
- VectorBundlesAndIsocrystals (coefficient field and Frobenius of BunGAndNewtonStrata's isocrystals)

IgusaVarietiesAndTorsionConcentration (§3.0i, §7.9a) is named only in a scope remark and nothing is consumed from it.

The suppliers on main are ReductiveGroups (Layers 1, 2, 7, 10A–10B), ReductiveGroupsPartII (§§RG2.1.5, RG2.5) and RepresentationTheory/LieHighestWeight (Layer 6).

All of these come before this roadmap in the merge order, or are on main.

## What moved from the Lean to the README

Nothing. The package's `Suggested.lean` already met the acceptance-test form:

- one theorem, `weightPushforward_sum_abs_sub_uniform_le` (§2.4(a)), stated on native carriers;
- no definitions, no sorry'd data, no `set_option`, no examples;
- a module docstring that lists every headline that cannot be stated at the pins, with the carriers each one lacks.

The only Lean change is the theorem's docstring. It now says that m ≥ 1 is assumed, that 2ρ is the sum of the positive roots of `b`, that such an `M` is the irreducible module of dimension (4m+1)^N, and that `C` depends on `φ` but not on `m` or `M`.

No other headline is statable at the pins. Very stability (H26 Theorem 1.1), Corollary 1.2, Theorem 1.4(i)–(ii), its final assertion and the §0.0 comparisons all need the smooth Bernstein centre of a p-adic reductive group, D_lis(Bun_G), stable orbital integrals or Harish-Chandra characters, and none of these is at the pins. The docstring records each one.

The import block is `module` / `public import Mathlib` plus the three `TauCeti.*` modules actually used:

- `TauCeti.Algebra.Lie.HighestWeight.Basic`
- `TauCeti.Algebra.Lie.Weights.FormalCharacter`
- `TauCeti.LinearAlgebra.RootSystem.Weyl.Vector`

All three exist at the Tau Ceti pin `358314d`.

**Binder check.** I temporarily appended `#check @TauCetiRoadmap.ExcursionOperatorsAndSpectralActionPartII.weightPushforward_sum_abs_sub_uniform_le` to the module, built it with the permitted `lake build` command, and then restored the file. The elaborated type keeps every hypothesis:

- `Field K`, `CharZero K`, `IsAlgClosed K`;
- `LieRing L`, `LieAlgebra K L`, `IsKilling K L`, `FiniteDimensional K L`;
- `H.IsCartanSubalgebra`, the base `b`, `AddCommGroup A`, `Fintype A`;
- `φ` with `Function.Surjective ⇑φ`.

The conclusion is `∃ C, 0 ≤ C ∧ ∀ m, 1 ≤ m → ∀ M … v, IsHighestWeightVector b ((2*m) • twoWeylVector …) v → lieSpan K L {v} = ⊤ → ∑ a, |… / finrank K M − 1/card A| ≤ C/m`, with `C` quantified before `m` and `M`. This agrees with README §2.4(a) in generality and quantifier order. Nothing was lost and nothing changed.

## Supplier replacements and duplication removals

**No restatement removed.**

- I grepped every Mathlib and Tau Ceti name the README cites at the pins (Mathlib `f6090c7`, Tau Ceti `358314d`), and each exists in the stated file:
  - `Finsupp`, `Finsupp.mem_support_iff`, `Submodule`, `Subalgebra`;
  - `Finset.expect`, `Fintype.expect_eq_sum_div_card`;
  - `AddChar.complexBasis`, `AddChar.wInner_cWeight_eq_boole`;
  - `AlgHom.range`, `AlgHom.rangeRestrict`, `AlgHom.rangeRestrict_surjective`;
  - `Ideal.quotientKerEquivRange` (namespace `Ideal`, `Mathlib/RingTheory/Ideal/Quotient/Operations.lean`);
  - `MeasureTheory.norm_integral_le_of_norm_le_const`;
  - `TauCeti.ExactK0`, `TauCeti.ExactK0.lift`, `TauCeti.AbelianK0.homologyEulerChar`;
  - `TauCeti.formalCharacter`, `TauCeti.IsHighestWeightVector` (whose definition includes `v ≠ 0`), `TauCeti.twoWeylVector`;
  - `TauCeti.formalCharacter_mul_weylDenominator_eq_weylNumerator`, `TauCeti.finrank_eq_prod_coweightPairing_div`.
- I resolved every cross-roadmap section against the open heads given by `roadmaps show` and against main:
  - AG2.6, “Bundle strata, lisse categories and the geometric Hecke action” and “The parameter stack and geometric spectral action”, with `HeckeFunctor`, `excursionOperator`, `geometricSpectralAction`, `semisimpleParameter` and the θ dictionary;
  - HS0.6, HS1.1–HS1.3, HS1.5–HS1.7, HS3.8, HS3.10, HS4.1–HS4.3 and HS4.6;
  - LP §§1.2, 3.6 and 3.9;
  - BunG §§0.6, 1.11, 1.13, 1.18–1.19, 1.23, 1.36 and 1.44;
  - GS4 (both layers of that number) with §§4.26 and 4.29;
  - ET §§1.2, 1.3, 1.6, 1.11, 1.13–1.16, 2.1, 2.4, 2.11, 2.16 and 4.7;
  - SR.0.4, SR.0d.2, SR.1.1, SR.1.3 (*bernstein-centre-corners*), SR.2.2, SR.3.1–SR.3.3 and SR.3a.1 (*admissibility-of-irreducibles*);
  - ReductiveGroups Layers 1, 2, 7 and 10A–10B, ReductiveGroupsPartII §§RG2.1.5 and RG2.5, and LieHighestWeight Layer 6.
- I checked each of the 16 supplier gaps against its named supplier, and none is already stated there:
  - ET §2.16 states only that each Θ_π is nonzero, not that characters are independent.
  - SR has no distribution realization and no Levi restriction of the centre.
  - HS has neither the all-weight shriek trace formula nor the non-quasi-split parabolic comparison.
  - BunG has no comparison of HKW's invariant with ET's.

  So each gap stays a contract.

**Duplication sweep by object, on main and every open roadmap head (`roadmaps grep`).** I searched for:

- stable or very stable Bernstein centre, `Z_st`/`Z_vst`, atomically stable characters, the Fargues–Scholze image centre;
- inner-form surjections of centres;
- Hecke operators on virtual characters;
- weight equidistribution;
- `Ψ_G^b=Ψ_(G_b)`;
- Fargues–Scholze Corollary IX.7.3 and HKW Theorem 6.5.2.

Nothing duplicates this roadmap:

- The equidistribution hits (DeligneWeightsAndPurity, ModularityAndLanglandsExtensions, CurvesOverFiniteFields) are Frobenius or mass equidistribution.
- IgusaVarietiesAndTorsionConcentration §§7.9a–7.9b prove the parameter compatibilities and the minuscule elliptic trace comparison only for GL_n, its inner forms and products. The README already records this in Scope as not consumed.
- EndoscopicTransferAndUnitaryTraceComparisonPartII (relative unitary endoscopy) and HeckeStacksAndLocalShtukasPartII (affine Deligne–Lusztig dimensions) are unrelated, so no later roadmap owns a notion this roadmap needs and nothing moves down.

This roadmap owns the stable and very stable centre, the averaging kernel and the image-centre surjection.

## README fixes made in the upstream-reviewer pass

1. **Mathematical error (§“From TauCetiRoadmap.HeckeStacksAndLocalShtukas”, z-embedding Check).** The Check read `H¹(E,μ₂)=E^×/E^(×2)` for the centre of SL₂(D). SL₂(D), with D a quaternion algebra, is an inner form of SL₄, so its centre is μ₄. The Check now reads `H¹(E,μ₄)=E^×/E^(×4)→H¹(E,G_m)=0`, which is still non-injective, so the conclusion stands. This also agrees with the Check's own `E^(×4)` reduced-norm computation. The same Check wrote the torus quotient as `D(E)`, which clashes with the quaternion algebra D; it is now `(G′/G)(E)=E^×`.
2. **Part II introduction.** No Part I roadmap exists anywhere: not on main, not in an open pull request, not on the board. The Summary now says that AutomorphicGaloisRepresentationsPartII AG2.6 constructs the excursion operators, the spectral action, its centre map and the parameter and stops there, and that this Part II starts from that centre map.
3. **Summary accuracy.** It used to say “Its quantitative Hecke averaging theorem gives constancy of semisimple parameters”. Constancy comes from very stability through §§4.2–4.3, and averaging is an input to very stability, so the sentence was reworded to say that.
4. **Scope is now definite.** “belongs to the continuation of EndoscopicTransferAndUnitaryTraceComparison … stays in the local-shtuka direction” is replaced by the full list of what each supplier contract asks of ET, HS, SR and BunG. “Remains the separate expectation” is replaced by “is outside this roadmap”. The process word “retained” is gone (twice in Scope; “central weights retained” in §2.2).
5. **Library-status phrases outside Scope.** I replaced them with the declarations they mean:
   - “the existing Grothendieck-group universal property” (§1.1) → `TauCeti.ExactK0.lift`;
   - “the pinned Mathlib declarations” (§2.4) → `AddChar.complexBasis`, `AddChar.wInner_cWeight_eq_boole`;
   - “the pinned Weyl formulas” (§2.4 *Needs:*) → the four Tau Ceti names;
   - “the pinned finite-measure integral norm bound” (§3.2) → `MeasureTheory.norm_integral_le_of_norm_le_const`;
   - “the existing first-isomorphism equivalence” (§5.2) → `Ideal.quotientKerEquivRange`.

   The §2.4 *Needs:* line no longer lists the Fourier declarations twice.
6. **Locator wording.** In §2.2, “corrected positive-root convention” now reads “with the positive roots of Ĝ as in FU25”. The References entry for H26 already records the misprint.
7. **Downstream consumers.** The section now names SmoothRepresentationsOfLocalGroupsPartII as consuming the §0.0 parameter, §0.0(b) and §§4.1–4.3 for finite extensions of ℚ_p. Depcheck is unchanged.
8. **Formatting.** I removed a stray blank line that split the §2.2 Checks list.

## Adversarial mathematics pass

I verified each value below by hand against the stated formula. Rows cover the conventions, every target and the Lean headline.

| Statement | Instances tried | Values computed | Result / change |
|---|---|---|---|
| Convolution convention `(z*f)(x)=z(g↦f(g⁻¹x))`, `δ₁(z*f^∨)=z(f)` | z=δ_t, t central, t²≠1, f(t)=1, f(t⁻¹)=0 | (δ_t*f)(1)=f(t⁻¹)=0; (δ_t*f^∨)(1)=f^∨(t⁻¹)=f(t)=1 | holds; dropping inversion turns 1 into 0 (existing Check) |
| `(y*z)(f)=y(z^∨*f)` for central distributions | y=δ_s, z=δ_t central | LHS f(st); z^∨=δ_(t⁻¹), (z^∨*f)(x)=f(tx), RHS f(ts) | equal by centrality |
| Character action `(z·Θ)(f)=Θ(z*f)`, scalar z_π | z=δ_t | π(δ_t*f)=∫f(t⁻¹x)π(x)dx=π(t)π(f) | z_π = central character at t |
| δ_P and normalized induction | GL₂, upper Borel, m=diag(ϖ,1) | Ad(m) on Lie U is ×ϖ, δ_P(m)=q⁻¹; δ_P(diag(1,ϖ))=q | Check value holds |
| Spherical eigenvalue | i_B(χ), χ=(2,3), K-coset decomposition (q cosets [[ϖ,a],[0,1]] plus diag(1,ϖ)) | q·q^(−1/2)·2+q^(1/2)·3=5√q; Satake-normalized ×q^(−1/2) gives 5; inverse half-modulus gives 2q^(3/2)+3q^(−1/2)=11/√2 at q=2, while 5√2=10/√2 | holds |
| Inner-form sign (HKW (3.3.3)) | GL₂/D^×, μ=(1,0) | ⟨e₁−e₂,(1,0)⟩=1, (−1)¹=−1; doubled sum gives (−1)²=+1; e(D^×)=(−1)^(2−1)=−1 | holds; value 3 ↦ −3 |
| Hansen ↔ supplier label dictionary | GL₁, μ=1; AG T_(χ_n): κ↦κ−n (AG2.6 Check, HS1.2 Check, HS3.10 Check) | Hansen reverse needs κ 0→1: T^AG_(χ₋₁) gives 0+1=1, T^AG_(χ₁) gives −1; forward needs κ 1→0: T^AG_(χ₁) gives 0, T^AG_(χ₋₁) gives 2 | dictionary T^H_V=T^AG_(V^∨) consistent |
| Normalized versus raw coordinate | GL₁, χ(geometric Frobenius)=2, θ=inversion | normalized t↦2; raw (θ∘φ) t↦1/2 | matches AG2.6's two-leg Check |
| Self-duality of V_(μ_m) | −w₀(4mρ̂)=4mρ̂; A₁, m=1: weights ±2α, ±α, 0 | symmetric weight multiset | θ*V≅V^∨≅V; labels immaterial in §1.1 |
| z-embedding Check (SL₂(D)↪GL₂(D)) | D quaternion over E | Z(SL₂(D))=μ₄ (inner form of SL₄); Nrd(λ)=λ⁴, v(ϖ)=1∉4ℤ; H¹(E,μ₄)=E^×/E^(×4)≠0 → H¹(E,G_m)=0 | **changed**: μ₂, E^(×2) → μ₄, E^(×4); conclusion unchanged |
| GL₂(D)=(GL₄)_(b₀) | b₀ basic, κ=2 | slope 2/4=1/2, isocrystal N_(1/2)^⊕2, End = M₂(quaternion) | holds |
| gap:general-parabolic-excursion-comparison twist | GL₂, B, q=4, σ=(2,3) | δ^(−1/2)(diag(ϖ,1))=√q=2, δ^(−1/2)(diag(1,ϖ))=1/2: (4,3/2), trace 11/2; (2ρ̂)(√q)=diag(2,1/2): diag(4,3/2); opposite twist diag(1,6), trace 7 | holds |
| gap:normalized-bernstein-levi | GL₂, M=T, z acting by 2, tr(f∣i_B χ)=3 | tr χ((z*f)_T)=tr i_B χ(z*f)=6; tr χ(r_T(z)*f_T)=2·3=6; f=0 gives 0; z=1 gives 3 | holds |
| gap:irreducible-character-independence Check | GL₁, characters with values 2, 3 at ϖ | value matrix [[2,3],[1,1]]·vol(𝒪^×), det=−vol²≠0; (1,1),(2,2) give det 0 | holds; negative control is correct |
| gap:kazhdan-cuspidal-decomposition Check | GL₂, f=1_K | f_T(m)=δ^(1/2)(m)·vol(U(𝒪))=1 on T(𝒪); O_(diag(a,b))(1_K)=1 for units with \|a−b\|=1 | 1_K is not cuspidal; both directions are exhibited |
| gap:stable-orbital-inversion-duality | torus, t²≠1, f(t)=1, f(t⁻¹)=0 | SO_t(f^∨)=f(t⁻¹)=0=SO_(t⁻¹)(f); SO_(t⁻¹)(f^∨)=f(t)=1=SO_t(f) | holds |
| Bipolar description of stable distributions | pairing H(G)×H(G)* with weak-* topology | closure of span{SO_γ} = (⊥{SO_γ})^⊥ = U(G)^⊥ | annihilator definition matches ET §2.4 |
| §0.0 Checks | trivial datum; zero creation; GL₁ t at value 2; GL₂ trace at (2,3) | 1; 0; t↦2, t⁻¹↦1/2; 2+3=5=tr diag(2,3); q^(−1/2)·5√q=5 | holds |
| FS parameter Checks | diag(2,3), diag(3,2), diag(2,4); unipotent SL₂ | (tr,det)=(5,6),(5,6),(6,8); unipotent (2,1) = trivial (2,1) | semisimplicity needed, and kept |
| §0.1 Z_st | torus: O_t(f)=f(t), U(T)=0; zero distribution; δ₁; ℂ² model | Z_st(T)=Z(T); 0∈Z_st; δ₁(f)=f(1)=0 on U; (a,b)·(1,−1)=a−b | holds |
| §0.2 Z_vst | torus; δ₁, 0; GL_n; ℂ² model diag(a,b) on span(1,−1) | U(T)=0; 0*u=0, δ₁*u=u; D(T,GL_n)=0, so Z_vst=Z; diag(1,0)(1,−1)=(1,0)∉U | holds |
| §0.3 Z_vst ⊆ Z_st, module structure | z very stable, f∈U | z(f)=δ₁(z*f^∨)=0 since f^∨∈U; z^∨*f=(z*f^∨)^∨∈U (computed from centrality); (y*z)(f)=y(z^∨*f)=0 | holds |
| §0.4 equivalences | ℂ² model U=span(1,−1), stable line span(1,1) | diag(2,2) preserves both; diag(1,0): (1,−1)↦(1,0)∉U, (1,1)↦(1,0)∉ stable line | both implications separate the same failure |
| §0.5 faithfulness | torus; scalar line | U=0 ⇒ z*f^∨=0 ⇒ z(f)=0; 2·1=2, only 0 annihilates | holds |
| §1.1 T_μ, condition 1∈B(G,μ) | μ=0; shift A[n]; A⊕B; GL₂, μ=(1,0) vs (1,−1) | T₀=id; Euler factor (−1)^n; 1+1=2; κ=1 excludes 1, κ=0 includes it | holds |
| §1.2 commutation | diagonal z=diag(1,2), swap S on (1,1) | S z(1,1)=(2,1), z S(1,1)=(1,2) | negative control holds |
| §1.3 stable Hecke modulo induced | constant elliptic value 3, dim V_μ=5 | output 15, correction 15−15=0; induced input 0 ↦ 0 | holds |
| §1.4 directed operators | μ=0, b=1; shift by one; GL₁, μ=1 | identity both ways; −1 in both constructions; labels −1/+1 (Hansen) ↔ +1/−1 (supplier) | holds |
| §1.5 central commutation | b=1, μ=0; scalars 2, sign −1 | z·Θ=z·Θ; −4=−4; target scalar 3 gives −6≠−4 | holds |
| §1.6 inner Hecke formula | GL₂/D^×, μ=(1,0), quadratic elliptic T_g | X_*(T_g)_Γ=ℤ²/(e₁−e₂)≅ℤ, both weights ↦1, multiplicity 1+1=2; e(G)e(G_b)=−1; value 3 ↦ −6 | holds |
| §2.1 Av | values (2,6); singleton; zero; weights (1/4,3/4) | 4 (not 8); 2 (not 1); 0; 5≠4 | holds |
| §2.2 μ_m and d_m | no roots; dual A₁; B₂; m=0 | μ_m=0, d_m=1; μ₁=2α, d₁=5 (2mρ̂ gives 3); positive coroots e₁−e₂, 2e₂, 2e₁, e₁+e₂ sum to 4e₁+2e₂, μ_m=8me₁+4me₂ (G-roots sum to 3e₁+e₂); Weyl dimension Π⟨(4m+1)ρ̂,α^∨⟩/⟨ρ̂,α^∨⟩=(4m+1)^N | holds |
| §2.2 character identity | λ=4mρ̂, n=4m+1 | Σ_w ε(w)e^(w(nρ̂))=Π_α(e^(nα/2)−e^(−nα/2)), ratio Π_α Σ_(k=−2m)^(2m) e^(kα) | holds |
| §2.3 kernel C_m and H_g | dual A₁ ↦ ℤ/2 (the elliptic SL₂ case: X_*(T)=ℤα^∨, Γ acts by −1); torus; GL₁ | even weights 2m+1, odd 2m: masses (2m+1)/(4m+1), 2m/(4m+1); m=1: 3/5, 2/5; torus H_g=0, mass 1; GL₁ H_g=ker(ℤ→ℤ)=0 | holds; H_g = image of (Q^∨)_Γ, finite for elliptic T, equals D(T,G;E) |
| §2.4(a), Lean `weightPushforward_sum_abs_sub_uniform_le` (truth) | general: M is cyclic on a highest-weight vector, so M_λ is one-dimensional; with Weyl complete reducibility M is irreducible, character Π_α Σ_k e^(kα); nontrivial ψ on A gives ψ∘φ nontrivial on some positive root, ζ=ψφ(α)≠1 | \|Σ_(k=−2m)^(2m) ζ^k\|≤2/\|1−ζ\|, Fourier coefficient ≤ 2/(\|1−ζ\|(4m+1)); ℓ¹ error ≤ (\|A\|−1)·max_ψ coefficient ≤ C/m | true; C depends only on φ |
| §2.4(a) witnesses | A₁, φ(α)=1∈ℤ/2; m=0; φ(α)=0 (not surjective); no roots; A=0; v=0 | error 1/(2(4m+1))·2=1/(4m+1) = Fourier bound (ζ=−1, \|1−ζ\|=2); m=1: 1/5, m=2: 1/9, C=1/4 works; m=0: masses (1,0), error 1, Lean C/0=0 (hence 1≤m); non-surjective: error 1 for all m; no roots forces A=0 and dim M=1, error 0; v=0 is excluded by `v ≠ 0` in `IsHighestWeightVector` (otherwise M=0, 0/0=0 and error 1) | hypotheses m≥1, surjective φ and v≠0 are all needed; no change |
| §2.4(b) | N=0; finitely many torus types | R_g singleton, error 0; max of finitely many C | holds |
| §2.5 | GL₂/ℚ₅, diag(2,3), diag(3,2), inverse; masses at m=1,2 | D=(1/3)(−1/2)=−1/6, \|D\|₅=1, inverse gives the same product; 18/5 vs 4, error 2/5; 34/9 vs 36/9, error 2/9 | holds |
| §3.1 compact representatives | torus, C_T={1}; empty C_T; SL₂ orbit | U={1}; U=∅; diag(ϖ^n,ϖ^(−n))[[0,−1],[1,0]]diag(ϖ^(−n),ϖ^n)=[[0,−ϖ^(2n)],[ϖ^(−2n),0]] | unbounded orbit, so representatives are needed |
| §3.2 cuspidal estimate | piece of measure 2, bounds 3 and 5/m; f=0; GL₂ 1_K | 2·3·5/m=30/m; 0; split term nonzero, f not cuspidal | holds |
| §3.3 very stability | constant c with \|c\|≤C/m for all m≥1 | c=1 fails at m>C, so c=0 | holds |
| §4.1 atomic stability | zero; torus singleton; two torus characters; SD=span{(1,2,0),(1,1,1)} | empty support excluded; support 1; singleton competitors of size 1<2; partial sums (1,0,0),(0,1,0),(0,0,1),(1,1,0),(1,0,1),(0,1,1) all outside {(a+b,2a+b,b)}, while (1,2,0)∈SD | holds |
| §4.2 scalar rigidity | Θ=(1,2), eigenvalues (3,5) | z·Θ=(3,10), z·Θ−3Θ=(0,4), nonzero with smaller support | holds |
| §4.3 parameter constancy | diag(2,3) vs diag(3,2) vs diag(2,4) | (5,6),(5,6),(6,8) | holds |
| §5.1 kernel inclusion | D^× (no proper Levi); b=1; elliptic detection | M=G only; equal kernels; 3·2·(−1)=−6≠0 | holds |
| §5.2 τ_G | ℂ[X] with id and ev₀; pr₁, pr₂ on ℂ×ℂ; torus T_b=T | X↦0, X+2↦2; x=(0,1) forces τ(0)=1 against τ(0)=0 | kernel-inclusion direction is detected |
| §5.3 Levi square | M=G; a=0,1 | both composites are τ_G; 0↦0, 1↦1 | holds |
| §6.1 transfer compatibility | elliptic value 3, e(G)=−1, scalar 2 | Trans(z·Θ)=−1·6=−6; τ(z)·Trans(Θ)=2·(−3)=−6 | holds |
| §6.2 matching | stable values a, −a with scalar 2, a=3 | 6 and −6; irrelevant classes stay 0 | holds |

No statement was found false apart from the μ₂ Check (row 10). No README theorem is quantified over arbitrary data without a hypothesis tying the data to the construction. The Lean statement's context is fully explicit in its own signature: there are no section `variable`s.

## Unresolved, outside this folder

- **Supplier disagreement on Fargues–Scholze's Hecke labels.**
  - AutomorphicGaloisRepresentationsPartII AG2.6 says Fargues–Scholze's `T_V` is its `T_(θ*V)`.
  - HeckeStacksAndLocalShtukas HS4.2's last Check argues that the two functors agree with the same labels (both carry degree d to d+1 on Bun_(G_m)).

  This roadmap's dictionary (Conventions) does not go through Fargues–Scholze. It is fixed by Kottwitz-invariant shifts against Hansen/HKW's convention, b∈B(G,μ) with κ(b)=μ^♯. Hansen's headline theorems are unchanged under pulling the action back along φ↦θ∘φ, because θ* is an automorphism of Z_spec common to G* and its inner forms. The disagreement is for those two roadmaps to settle.
- **SmoothRepresentationsOfLocalGroupsPartII (open pull request, later in the order)** cites this roadmap as “ExcursionOperatorsAndSpectralActionPartII SC3–SC4”. No section has those labels; the matching targets are §0.0 (parameter), §0.0(b) (Levi compatibility) and §§4.1–4.3. Its semisimple-parameter contract also asks for every nonarchimedean local field, but this roadmap covers finite extensions of ℚ_p only, as Conventions fix. That consumer needs to re-cite and to restrict its range, or obtain equal characteristic elsewhere.
- **Dangling name on main.** EnhancedDerivedSheaves (main, lines 2957–2958) lists `ExcursionOperatorsAndSpectralAction`, a roadmap that does not exist, as a downstream consumer. The open heads of ArithmeticGaloisDuality and FunctionFieldArithmetic name it too. HeckeStacksAndLocalShtukas no longer cites the old “ES1” section at its head.
- **The 16 supplier gaps stay contracts on earlier roadmaps**:
  - EndoscopicTransferAndUnitaryTraceComparison: 9;
  - SmoothRepresentationsOfLocalGroups: 2;
  - HeckeStacksAndLocalShtukas: 2;
  - BunGAndNewtonStrata: 3.

  The accepted review made them conditional; `plan.json` is unchanged.
- **Ownership against open pull requests** was checked with the tools this brief provides: `roadmaps grep`/`show` at the heads of 2026-11-05 and the sibling checkouts. Board packages were checked by directory. No competing owner was found.
- **Suspicious text.** None was found in the package, the reports or the supplier READMEs.


Pull request: #1832 (roadmap/excursion-operators-and-spectral-action-part-ii at cc4ec51)
