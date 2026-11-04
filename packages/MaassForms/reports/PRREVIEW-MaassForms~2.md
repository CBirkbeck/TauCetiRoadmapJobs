# Review of MaassForms (pull request #1717 at 8ddd85a)

**Verdict:** needs changes

🤖 Independent AI review. Eight findings, three blocking (P1/P2). The gate passes. No pull-request file was changed. This is a full review of the repaired folder, not an incremental review. Numerical tests below test formulas; they do not certify database records or prove the admitted theorems.

## R01 (P1) — The blanket Eisenstein rejection excludes an actual Maass form

**Location:** `TauCetiRoadmap/MaassForms/README.md:1752`: “The Eisenstein series `E(z, s)` … but not square-integrable”.

**Claim:** Every value of the continued Eisenstein family fails the L² condition in §1.1.

**Witness:** At level one, E(z,0)=1: the residues of E*(z,s) and Λ(2s) at zero are both −1/2. Its squared quotient norm is π/3, and Δ1=0. See duke-imamoglu-toth lines 514–524, (5.3)–(5.5), p.962.

**Repair:** State this rejection for Re s>1, or specify precisely the nonzero continuous-spectrum values intended. Add E(z,0)=1 as a negative control for the unrestricted assertion. At s=2 the leading y² term has squared cusp integral (Y³−1)/3, which diverges; at s=0 the constant has cusp integral 1 and is an L² Maass form, although not cuspidal. This also preserves §1.1's constant-function Check. [Published source](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p08-p.pdf).

## R02 (P2) — Qualify positivity and rejection claims by nonzeroness

**Location:** `TauCetiRoadmap/MaassForms/README.md:1428`: “`λ ≥ 0`, and `λ > 0` for cusp forms”.

**Claim:** The opening inequalities follow from the predicates defining M₃(λ) and S₃(λ). The later API bullet correctly restricts cusp positivity to nonzero forms, but the opening statement does not. The holomorphic rejection at README line 1758 likewise omits F≠0.

**Witness:** f=0 satisfies all their conditions at λ=−1: Δ₃0=(−1)0=0, norm²=0, torus integral=0. The claimed inequality becomes −1≥0. At λ=0 the asserted strict cusp inequality becomes 0>0.

**Repair:** Quantify these assertions over nonzero forms, or over nonzero eigenspaces, exactly as §2.5 does. Retain zero in every submodule. On the zero witnesses the revised implication has false antecedent; on the constant 1 it gives λ=0≥0 and makes no cusp-positivity claim, since its constant term is 1. Add the negative-λ zero-form test beside the existing zero-function Check. Also restrict the worked holomorphic rejection to F≠0: at F=0, y^(k/2)F=0 belongs to every Maass submodule, so the unrestricted rejection is false.

## R03 (P2) — The character-dependent bad-prime headline is absent from Lean

**Location:** `TauCetiRoadmap/MaassForms/README.md:1081`; `TauCetiRoadmap/MaassForms/Suggested.lean:419`: “for general `χ` the trichotomy”.

**Claim:** The acceptance file tests the full Atkin–Lehner–Li newform theorem promised by §4.6, including ramified nebentypus.

**Witness:** Both bad-prime signatures require `IsNewform N 1 lam f`. Neither applies to the even primitive quadratic character modulo 5, whose primitive branch requires norm a(5)=1, whereas the trivial-character branch requires a(5)²=1/5.

**Repair:** State the general-character trichotomy with the local conductor exponents and prime-to-p character factor. These are native character/arithmetic data. A scratch signature for the primitive-character branch, using `hf : IsNewform N χ lam f`, `χ.IsPrimitive`, `p.Prime`, `p ∣ N`, and conclusion `‖fourierCoefficient f p‖ = 1`, elaborated with only sorry warnings. The two modulus-5 characters must select different branches (1 versus 1/√5 in absolute value). This is an omitted deep theorem, not a request for extra small-value Checks. `DirichletCharacter.IsPrimitive` and `conductor` are at `Mathlib/NumberTheory/DirichletCharacter/Basic.lean:291` and `:245`; no missing carrier justifies the omission. The docstring does not list this theorem as unstatable.

## R04 (P3) — Several sampled claims still have no exact source locator

**Location:** `TauCetiRoadmap/MaassForms/README.md:419`, `:795`, `:944`, `:1000`, `:1197`, `:1393`: “Reflection and energy comparison”; “Adjoints and simultaneous diagonalization”.

**Claim:** The reference apparatus identifies a source statement or a specified adaptation for every theorem.

**Witness:** §§0.2, 3.2, 4.2 and 4.4 have no attached theorem/page locator. Section 5.5 still cites Huxley by year and an unnamed Iwaniec chapter. Section 7.1 has only a broad chapter reference in the bibliography.

**Repair:** Attach exact theorem/equation and printed-page locators, or identify an adaptation and its precise source inputs, as §§2.2 and 6.2 now do. Resolve the unrestricted level/character hypotheses rather than citing level-one statements as their proof. For §6.3 supply the page of Iwaniec–Kowalski (5.7), not merely its equation number. Replace the DIT “§5.2” citation (README lines 682, 714, 1324 and 1808) by §5, the unnumbered Spectral expansion subsection: (5.2) there labels the Eisenstein-series equation, not a subsection. The source table below distinguishes what was actually read from unavailable texts. This is the remaining part of previous R19; a bibliography entry or a supplier name alone does not repair it.

## R05 (P3) — Completed-function agreement is definition padding

**Location:** `TauCetiRoadmap/MaassForms/Suggested.lean:513`: `completedLFunction_eq`.

**Claim:** This is one of the deep acceptance statements.

**Witness:** Its definition chooses an extension agreeing on Re s>1 when one exists, and otherwise returns the same gamma product. Both branches therefore satisfy the conclusion for every function f, without the newform hypothesis.

**Repair:** Delete it from `Suggested.lean`; keep the agreement law in the README. A scratch copy removed `hf` and closed the declaration by unfolding, splitting the conditional, using `h.choose_spec.2 s hs`, and `rfl`. It elaborated successfully. For f=0 the two sides are 0; for arbitrary f, either branch gives the same product. Keep `differentiable_completedLFunction` and the functional equation: those do assert substantive mathematics. The closure facts used to construct `maassCuspSpace` and `newSpace` are necessary carrier scaffolding and are not included in this finding.

## R06 (P3) — The adjoint Check uses the wrong exponential notation

**Location:** `TauCetiRoadmap/MaassForms/README.md:965`: “the eigenvalue is e(iπ/4), its conjugate is −i times that value”.

**Claim:** This scalar witnesses the adjoint relation when χ(n)=i.

**Witness:** The conventions define e(x)=exp(2πix). Thus e(iπ/4)=exp(−π²/2)=0.0071918833558, real. Its conjugate is that positive real number, whereas −i times it is purely imaginary.

**Repair:** Write exp(iπ/4), equivalently e(1/8). Then both sides of conj(a)=−ia equal (1−i)/√2. This also makes the following “not real” Check true. The adjoint theorem itself has the correct character factor.

## R07 (P3) — Section-level Check counts do not cover every definition

**Location:** `TauCetiRoadmap/MaassForms/README.md:404`, `:1335`: `IsSmoothOnUpperHalfPlane`; “analytic conductor”.

**Claim:** Each definition now has three discriminating local Checks and its API.

**Witness:** All three §0.1 Checks are Laplacian or weight-shift evaluations, not tests distinguishing the smoothness predicate. Section 6.3 has only one conductor evaluation; its other two Checks concern Satake roots.

**Repair:** Complete the definition-specific tests, without adding them to Lean. For smoothness, use 1 (smooth), abs(Re z) (not C¹ on Re z=0), and a locally smooth function with controlled behavior near im z=0 to test the open-domain restriction. For conductor, retain 49/4, add N=4,δ=r=0,s=1/2 giving 49, and N=1,δ=1,r=0,s=1/2 giving 81/4; check r↦−r separately. Audit the other grouped blocks the same way, especially point/width/multiplier/mode definitions. These distinguish omitted level and parity factors. This is the remaining part of previous R20; nine layer-ending pairs and many three-bullet blocks repair the document outline, not automatically every definition's test contract.

## R08 (P3) — Certificate records remain construction targets

**Location:** `TauCetiRoadmap/MaassForms/README.md:1641`: “A Maass certificate … consists of an interval … a finite list of coefficient intervals”.

**Claim:** `Certificate`, `CertifiesNewform`, and `CertifiesCount` packaging is part of the mathematical construction deliverable.

**Witness:** The interval record is still introduced as a target even though the two residual/projection theorems use mathematical vectors and bounded functionals directly. Removing the record does not change either theorem or any bound.

**Repair:** Remove the certificate record and its packaging predicates as construction targets; retain the residual theorem, the rank-one quantitative estimate, and a prose explanation of the database's semantics. The brief excludes certificate construction, while permitting its mathematical background. For an exact eigenvector η=0, the retained theorem still returns distance 0 and coefficient error 0. Previous R22 is repaired in Lean but not in the README.

## Verified sound

The following records distinguish computed checks, resolved contracts and source verification from proof. Every numbered subsection was read, together with all definitions, theorem signatures, API bullets, Checks and worked examples. Fields irrelevant to these characteristic-zero analytic objects (nonreduced schemes, inseparability, zero rings) were not manufactured as tests.

**Previous findings, checked before the full pass.** Each quotation below is from the repaired head, not an instruction from a previous review. No repair report marking a finding “not actionable in this package” was supplied.

| Previous | Passage at this head | Assessment |
|---|---|---|
| R01 | §5.5 “For odd χ the automorphic space is zero”; Lean `weyl_law` has `hχ`. | Repaired: modulo-3 odd count is 0; even Weyl constant is 1/3. |
| R02 | §2.4 “square-integrability forces the whole zero mode to vanish”. | Repaired: √y and √y log y give log Y and (log Y)³/3. |
| R03 | §§2.3/4.5 “α_n / 2”; “√d a_f(n/d)”. | Repaired: α=1 reconstructs with a=1/2; d=4 gives a(4)=2. |
| R04 | §2.1 “fixed real r ≠ 0”; separate K₀ logarithm. | Repaired: K₀(exp(−10))=10.11593152. |
| R05 | §7.4 “T_{in} = R T_n = T_n R”. | Repaired: T_i acts by −1 on R-odd forms. |
| R06 | §7.5 “Γ_ℂ(s + ir/2) Γ_ℂ(s - ir/2)”; “A J-odd form has a(1) … 0”. | Repaired: half-shift gamma product .6825694503; the normalized class excludes J-odd forms, not arbitrary Picard forms. |
| R07 | §7.2 “For 0 ≤ λ < 1 use t = √(1−λ)”. | Repaired branch: constant gives 0=1−1. Nonzero quantification is a separate remaining issue, R02 here. |
| R08 | §8.3 “nonzero … belongs to the operator domain”. | Repaired: g=0 no longer satisfies the theorem. |
| R09 | Lean `oldSpace_le_maassCuspSpace` includes `[NeZero N]`. | Repaired; `newSpace` and `IsNewform` carry it too. |
| R10 | §2.1 “complex-order solution I_ν of AutomorphicSpectralTheory §§0.25–0.28”. | Repaired: those sections really define complex order, including i and 0. Wronskian is made a target here. |
| R11 | §5.5 “index channels by χ-regular cusps only”; §3.5 weighted sum. | Repaired: χ(4)≠1 removes cusp 1/3 at level 9; the weight transforms by χ. |
| R12 | Lean starts with `module`. | Repaired: gate passes and direct elaboration has only sorry warnings. |
| R13 | §2.4 “δ_σ = min(κ_σ,1−κ_σ)”. | Repaired: κ=1/3 gives exp(−2πy/(3w)). |
| R14 | §8.3 “P … has rank one”; “b > C_1 q”. | Repaired: the diagonal 2×2 counterexample fails rank one; the stated denominator bound gives 2/9 in its Check. |
| R15 | §6.1 “absolute convergence for Re s > 1, unconditionally”. | Repaired: AL.3.6.1 supplies the asserted standard Euler convergence; the local/classical comparison is now explicitly owned here. |
| R16 | §0.1 “coordinate specialization”; §0.3 native `functionCharSpace`. | Repaired: pinned native character space is consumed; no second Bessel function or level-one carrier is introduced. |
| R17 | Lean all-cusp κ-shifted expansion; cross-level multiplicity one; character-dual functional equation. | The three requested repairs are present, including exceptional order. R03 here identifies another omitted branch of the headline inventory. |
| R18 | Former named rejection/zero/definition-wrapper declarations removed. | Old examples repaired; necessary carrier closures remain. New definition padding is R05 here. |
| R19 | §§2.2/2.3/6.2 cite DIT equations and pages. | Partly repaired; missing sampled locators remain, R04. |
| R20 | “Exact supplier contracts”; nine `Examples`/`Dependencies` pairs. | Partly repaired; definition-specific discrimination remains incomplete, R07. |
| R21 | Reference gives “arXiv:2201.08760v2”. | Repaired; fetched title and author are Seymour-Howell. |
| R22 | The three certificate declarations are absent from Lean; §8.3 still defines their packaging. | Partly repaired, R08. |

**Gate, Lean, signatures and padding.** The supplied gate at this exact head reports every scanner and targeted build passing, including no stray files, outside-folder edits, sorry-data or `set_option`. `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/MaassForms'` is empty; the worktree stayed clean. Direct `lake env lean` on the acceptance file completed with 32 sorry warnings and no errors or other warnings. Its 36 definitions and 36 theorem declarations were each checked with `#check @name` in a scratch copy (72 named declarations; the worker inventory says 73 entries). The elaborated binders agree with the explicit signatures: positive levels in substantive spectral/newform statements; κ range and multiplier relation; positive y; cross-level N/M/χ/ψ; even character for Weyl; nonzero g and L² Δg for the residual result. No lost section hypothesis was found. No original file was changed.

Each of the 32 sorried bodies was tried with `simp`, `rfl`, and `infer_instance` in the scratch copy; none closed. The separate definition-unfolding probe for R05 succeeded without the newform hypothesis. The primitive-character bad-prime signature probe succeeded. Necessary submodule closure facts were inspected rather than counted as headline mathematics. There are no duplicate fully qualified declarations against the readable sibling files: the declarations use `TauCetiRoadmap.MaassForms`.

**Headline inventory.** README §§2.2–2.4: all-cusp Fourier–Bessel expansion, limit coefficients, decay and injectivity; §3.4: finite multiplicity, discreteness, spectral basis; §§4.1–4.6: Hecke relations, newforms, cross-level strong multiplicity one, all bad-prime branches, Fricke and parity; §§5.3–5.5: 3/16, level-one bound, scattering and Weyl; §§6.1–6.4: convergence, Euler product, entire completion, dual functional equation and card; §§7.2–7.5: Picard spectral/Fourier/Hecke/L-function theory; §8.3: residual localization and quantitative isolated coefficient recovery. The Lean file states the principal available headlines, with R03's exception. Its docstring explicitly names the quotient-operator/spectral-basis, scattering-family, card, Picard-action/quotient and spectral-projection/functionals carriers missing at the pins. Those omissions are not replaced by empty predicates. Named conjectures are not admitted as theorems.

**Supplier order.** The requested command, with the candidate order and `--movable`, returned exactly:

```text
depcheck: 204 roadmaps, 1594 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line was emitted. Every `*Needs:*` line and supplier paragraph was read. No declared gap is present. Main was read at `6eba6f5e`; the worker's citation inventory describes an earlier main `95d4c02`, so its leads were not treated as authoritative missing-name findings. The six `IsNewform.*` names in that inventory are local declarations; the seven LMFDB names are knowl/column identifiers, not purported library declarations.

**Pinned objects opened.** Paths in this report are library/repository-relative, not machine paths.

| Pinned file and line | Declaration/body inspected; consequence |
|---|---|
| `TauCeti/NumberTheory/ModularForms/HeckeSlash/Nebentypus/Ring.lean:88` | `functionCharSpace`: all Γ₀ slash relations on ℍ→ℂ. It includes no smoothness, holomorphicity or L² hypothesis. Weight zero gives exactly the adopted law. |
| `TauCeti/NumberTheory/ModularForms/HeckeSlash/Nebentypus/Basic.lean:121` | `twistedHeckeSlashSum`: character-weighted representative sum. Its file explicitly does not yet prove preservation of the character space; §4.1's preservation/normalization work is substantive. |
| `TauCeti/NumberTheory/ModularForms/Fricke/Matrix.lean:69` | `frickeGL` requires nonzero N in the field; the positive-level slash uses [0,−1;N,0]. |
| `Mathlib/NumberTheory/DirichletCharacter/Basic.lean:245` and `:291` | `conductor` and `IsPrimitive`; usable for R03 without a new local-representation carrier. |
| `Mathlib/MeasureTheory/Group/FundamentalDomain.lean:68` | `IsFundamentalDomain` asks null measurability, a.e. coverage and pairwise a.e. disjoint translates. It does not by itself assert integrability, finite volume, or that a noneffective action admits such a domain. |
| Same file `:355`, `:407` | `integrableOn_iff`, `setIntegral_eq`: require invariant integrands and both fundamental domains. Norm-square and f·conj(g) have that invariance for the same character. |
| `Mathlib/Analysis/InnerProductSpace/Laplacian.lean:231` | `laplacian_eq_iteratedFDeriv_complexPlane`: the two real second derivatives, with the roadmap's −y² factor supplied separately. |
| `Mathlib/Analysis/InnerProductSpace/JointEigenspace.lean:110`, `:121` | Finite-dimensional symmetric commuting operators. The roadmap's normal-operator argument first takes real/imaginary symmetric parts, rather than applying the theorem directly to nonreal Hecke operators. |
| `Mathlib/Analysis/InnerProductSpace/LinearPMap.lean:241`, `:340` | `IsSelfAdjoint.dense_domain`, `IsSelfAdjoint.isClosed`; self-adjointness is still a hypothesis, not supplied by the mere partial-map carrier. |
| `Mathlib/NumberTheory/LSeries/Basic.lean:164`, `:178` | `LSeries`, `LSeriesSummable`: ordinary series and summability; they do not automatically analytically continue a divergent series. |
| `Mathlib/Analysis/SpecialFunctions/Gamma/Deligne.lean:45` | `Complex.Gammaℝ s = π^(−s/2) Γ(s/2)`, fixing both parity gamma shifts. |
| `Mathlib/Analysis/SpecialFunctions/Bessel.lean:55` | `Complex.besselJ` is the first-kind hypergeometric definition; it is not a substitute for complex-order K or I. |
| `TauCeti/Geometry/Manifold/Riemannian/Hyperbolic/UpperHalfSpace.lean:78`, `:91`, `:135` | Native positive-height carrier and height. The file supplies metric/manifold geometry, not the Picard quotient action/measure required by the omitted headlines. |

**Ownership and citations resolved.** Object searches used `roadmaps grep` and `roadmaps show`, pinned-library searches, the main repository, the supplied open checkouts and available board packages. Broad “Picard” searches hit algebraic Picard groups and were narrowed to Maass/Bessel/scattering objects. Main examples read for shape were ModularForms, PDE and Completed/OrthogonalL2Bases. The board index contains five additional packages; no ownership claim was inferred from a missing local package checkout. The following are the relevant resolved boundaries, not newly planned replacements:

| Owner and locator | Resolved contract and direction |
|---|---|
| AutomorphicFormsOnReductiveGroups §4.5, `README.md:689` | Congruence-subgroup invariant Maass carrier; shared cosh K integral/ODE/decay; level-one factor-two Fourier/Hecke/adelization normalization. MaassForms owns character and cusp comparisons. |
| AutomorphicSpectralTheory §§0.25–0.28, `README.md:519`–`:592` | Complex-order I, Whittaker comparison and growing asymptotics. The required orders i,0 and real [0,1] are within the stated range. |
| Same §1.16, `README.md:1282`; §1.16a | Weight Laplacian and Γ₀ Friedrichs realization. At k=1,f=1, the comparison gives (1/4−1/4)√y=0; no normalization conflict remains. |
| Same §§2.4, 4.3–4.4, 1.23, 4.8–4.9, Layer 6 | General spectral/Eisenstein/trace inputs and untwisted modular comparisons. The character-weighted classical construction is now an explicit MaassForms target in §§3.5/5.5, not falsely attributed to the untwisted section. |
| CongruenceSpectralGap §§0.1–0.2, 0.5b–0.6, 5.3; `README.md:148`, `:285`, `:299`, `:826` at supplied head | Quotient measure, maximal operator domain, principal-level cusp compactness, residual constants and 21/100 bound. Character restriction is downstream. Its own declared supplier gaps were not treated as MaassForms defects. |
| AutomorphicLFunctionsAndLocalFactors AL.0.5.1, AL.2.1.1, AL.2.2.4, AL.R.1–R.3, AL.3.5.3, AL.3.6.1, AL.3.7.1 | Shared K adapter/order dependence, newvectors, real-place/tensor inputs, positive self-pair convergence and strong multiplicity one. AL.3.6.1 explicitly concludes standard absolute Euler convergence on Re s>1. MaassForms now owns its all-place classical comparison. |
| LFunctions Layer 0, `README.md:348`–`:400` | Single completed-function card, positive conductor, real/complex gamma multisets, dual and agreement on Re s>1. Section 6.4 meets this domain. |
| ModularForms Layers 0,3–6,9 on main | Character conventions, exact-divisor matrices, old/new and self-duality templates. Holomorphic theorems are not asserted to prove nonholomorphic cases without the comparison. |
| FuchsianOrbifolds and pinned cusp/covolume modules | Effective-action fundamental domains, cusp scaling/width and finite cusp geometry. This roadmap supplies the explicit Γ₀ arithmetic width/character comparison. |
| KleinianGroups Layers 0,1,3, `README.md:229`, `:258` | H³ action/measure, discrete quotient and Gaussian covolume. It is a supplier; BianchiModularForms is not. |
| BianchiModularForms `README.md:104` at supplied head | Explicitly separates weight-zero Maass functions from its harmonic weight-two 1-forms. No second scalar Picard owner was found in the supplied sibling work. |
| MetaplecticAutomorphicForms §§7.2,7.32 | `halfWeightMaass` and `biroLevelSpaces` exist at those sections and remain outside this scope. |
| CharacterSumsOverFiniteFields | Character Kloosterman sums and all-modulus bounds remain an ownership boundary, not an upward consumed input. |
| SelfAdjointSpectralTheory Parts C–E on main, `README.md:781`, `:1041`, `:1186` | Reducing restriction, real-gap inverse (SA-D23) and spectral projections. Cusp compactness comes from CongruenceSpectralGap, not from self-adjointness alone. |
| PDE Lane E on main, `README.md:322`; Completed/OrthogonalL2Bases B2 | Elliptic regularity and element-level Hilbert-basis packaging. Neither automatically supplies automorphic quotient domains; those comparisons remain targets here. |

No route-specific good-prime shortcut, cyclic supply, re-planned entire roadmap, copied source passage or computational algorithm was found in the mathematical development. R03 concerns incomplete acceptance coverage, and R08 concerns retained certificate packaging. No code from fetched sources was executed.

**Computed adversarial pass (172 rows).** The rows cover every numbered target, the sampled targets, all headline signatures and the assertions implicated in findings. Repeated API descriptions of the same statement share its row. A local Fourier mode tests a differential/normalization identity, not existence of a global automorphic eigenform. Finite-dimensional operator models test the stated spectral implications, not the analytic construction of the quotient operator. Decimals are ordinary quadrature/arithmetic checks without certified error intervals; exact fractions and symbolic expressions are exact. “Pass” means the stated test did not refute the assertion, not that the theorem was proved.

| Statement | Instances tried | Values computed on the two sides | Result / change |
|---|---|---|---|
| 0.1 coordinate Laplacian | f=1,y² | Δ1=0=0·1; Δy²=−2y²=2(1−2)y² | Pass; positive convention |
| 0.1 unitary weight comparison | k=1,f=1,F=√y | Δ₁1=0; y^(−1/2)((1/4−1/4)√y)=0 | Pass |
| 0.1 comparison scalar | k=0,1,1/2 | k²/4−k/2=0,−1/4,−3/16 | Pass; last is algebra, not half-weight carrier |
| 0.1 smoothness definition | 1; abs(x); y^(−1) on y>0 | Derivatives 0; left/right x derivatives −1/+1; y derivatives (−1)^m m! y^(−m−1) exist | Definition separates smooth/nonsmooth; R07 tests missing |
| 0.2 reflection covariance | y²,x,x² | Both compositions −2y²,0,−2y² respectively | Pass |
| 0.2 dilation covariance | f=y²,d=2 | Δ(4y²)=−8y²=(Δf)(2z) | Pass |
| 0.2 energy identity | g(t)=t³(1−t)³ on [0,1], zero elsewhere; f=g(x)g(y−1) | ∫g²=1/12012, ∫g′²=1/770; both energy sides 1/4624620 | Pass; compact C² test |
| 0.3 native character membership | N=1, f=1; odd χ mod 3 | 1=1; −I law would require 1=−1 | Pass; odd space zero |
| 0.3 translation and weight specialization | T=[1,1;0,1], k=0 | χ(1)=1; (cz+d)^0=1 | Pass; no analytic property follows |
| 0.3 reflection/Fricke character targets | cubic χ, χ(4)=ζ₃ | Reflection keeps ζ₃; Fricke gives ζ₃²; (ζ₃²)²=ζ₃ | Pass; conjugate character matters |
| 0.4 widths and positivity | N=4, c=0,1,2 | 4/gcd(c²,4)=1,4,1; all divide 4 | Pass |
| 0.4 stabilizer generator | cusp 1/3,N=9,w=1 | σTσ⁻¹=[−2,1;−9,4]; lower-left divisible by 9, lower-right 4 | Pass; plus sign in χ(1+acw) |
| 0.4 multiplier order | same cusp, ζ=ζ₃ | ζ^(9/1)=1; 4^9≡1 mod 9 | Pass |
| 0.4 regular cusp and constant term | f=1,N=1,4 | c∞=1; I∞=1,4=Nc∞ | Pass |
| 0.4 irregular integral | g(x)=e(x/3),N=9,w=1 | ∫₀⁹g=0; ∫₀¹g=3(ζ₃−1)/(2πi)≠0 | Pass; full period essential |
| 0.4 cuspidality predicate | 0;1;e(x);1+e(x), at ∞ | I=0,N,0,N; constant terms 0,1,0,1 | Pass; local modes only |
| 0.4 cusp count | N=1,4,9 | Divisor sums 1; 1+1+1=3; 1+2+1=4 | Pass |
| 0.5 effective quotient | −I; N=1,2 | −I acts as identity; areas π/3,π | Pass; PSL removes ineffective kernel |
| 0.5 L² predicate | 1,√y on width-one cusp | ∫₁∞y^(−2)dy=1; ∫₁^Yy^(−1)dy=log Y→∞ | Pass |
| 0.5 fundamental-domain independence | same χ, |χ(d)|=1 | |χ(d)f|²=|f|²; χ(d)f·overline(χ(d)g)=f·conj(g) | Pass; pinned hypotheses apply |
| 0.5 Petersson convention/closure | 0,i,1,2i; area V | ⟨0,1⟩=0; ⟨i,1⟩=iV,⟨1,i⟩=−iV; ‖2i‖²=4V | Pass; first slot linear |
| 0.5 positive definiteness | continuous f=1,0 | Norm²=V>0,0 | Pass; continuity needed to pass from a.e. zero |
| 0.5 character projections | effective C₂ at N=5, D²=1 | P±=(1±D)/2; P±²=P±, P+P−=0, P++P−=1 | Pass |
| 0.5 odd projection | N=3, D(−1)=1,χ(−1)=−1 | (1−1)/2=0 | Pass |
| 0.5 covering norm | N=5,constant1 | Γ₀ area=2π, effective Γ₁ area=4π; ratio2; (1/√2)²·4π=2π | Pass; distinguish inherited and Petersson norms |
| 1.1 Maass vs cusp | constant1,N>0,λ=0 | Δ1=0, norm²=volume; cusp integral N≠0 | Pass |
| 1.1 zero and submodule closures | 0 at λ=−1; f+(−f);2f | Δ0=−1·0=0; sums0; Δ(2f)=2λf=λ(2f) | Pass; no spectral existence from zero |
| 1.1 disjoint eigenvalues | λ=1,μ=2, same f | Both equations imply (1−2)f=−f=0 | Pass |
| 1.1 change level | level-one normalized f at N=2 | Same f, same λ; norm² gains index3 | Pass; injection preserves zero/nonzero |
| 1.2 real/complementary branch | λ=1/4,1/5,0,5/4 | Orders 0,1/√20,1/2,i; squares 0,1/20,1/4,−1=1/4−λ | Pass |
| 1.2 total real sqrt | λ=1/5 | sqrt(−1/20)=0; 1/4+0²=1/4≠1/5 | Wrong real-only model excluded |
| 1.2 s parameter/injectivity | λ=0; r=±1 | s=1 gives s(1−s)=0; both signed r give5/4, nonnegative branch picks1 | Pass |
| 2.1 realness/order symmetry | r=0,±1,u>0 | cos(rt)=cos(−rt) real in the integral; bound by cos(0t)=1 | Pass; imaginary sine integral zero |
| 2.1 complementary bound | t=0,1/2,u=1 | K₀=.4210244382≤K₁/₂=.4610685044, both >0 | Pass; endpoint bound explicit |
| 2.1 strip bound | Reν=0,u≥1 | |cosh(νt)|≤1; K₀(u)≤e^(−u/2)∫e^(−cosh(t)/2)dt | Pass; constant independent of Imν |
| 2.1 zero-order asymptotic | u=e^(−10) | Quadrature10.1159315214; −log(u/2)−γ=10.1159315157 | Pass; bounded-at-r=0 model rejected |
| 2.1 positive-order small u | t=1/2 | Exact K=√(π/(2u))e^(−u); divided by (Γ(1/2)/2)(u/2)^(−1/2) gives e^(−u)→1 | Pass; endpoint tests normalization |
| 2.1 Mellin transform | ν=1.3i,s=2.5 | Integral after Fubini=.726036530106716; independent Lanczos gamma product=.726036530106715 | Pass |
| 2.1 ODE basis/Wronskian | ν=1/2,u=1 | K=.4610685044,I=.9376748882; explicit derivatives give KI′−K′I=1 | Pass; reversed order gives−1 |
| 2.1 growing/decaying separation | ν=1/2,u→∞ | K/e^(−u/2)→0; I/e^(−u/2)~e^(3u/2)/√(2πu)→∞ | Pass |
| 2.2 point/mode definitions | y=1; e(x),n=1,2 | pt(x,1)=x+i; ∫₀¹1dx=1, ∫₀¹e(−x)dx=0 | Pass; no claim at y≤0 |
| 2.2 shifted lattice | w=1,κ=1/3,g=e(x/3) | Shifted n=0 integral1; translation ratioζ₃≠1 | Pass; integer-only expansion rejected |
| 2.2 zero-mode ODE | y^s at s=0,1,1/2 | −y²g″=0,0,(1/4)√y=s(1−s)g | Pass |
| 2.2 repeated root | g=√y log y | −y²g″=(1/4)√y log y; independent from √y | Pass |
| 2.2 nonzero-mode ODE | b=1/2,λ=0,k=2π | √yK₁/₂(ky)=constant·e^(−ky); −y²g″+k²y²g=0 | Pass |
| 2.3 elimination of I | nonzero β, k>0 | |√y I(ky)|²/y²~constant·e^(2ky)/y²; integral diverges | Pass |
| 2.3 factor-two coefficient | α=1,w=1,n=1 | a=α/2=1/2; 2a=1 restores mode | Pass; a=α would double f |
| 2.3 coefficient limit | g=α√y K_b(2π|n|y/w) | e^(2π|n|y/w)g→α√w/(2√|n|); multiplier√(|n|/w) yieldsα/2 | Pass |
| 2.3 zero-index total definition | n=0 | √|0|=0; defined coefficient0 | Pass; cannot encode constant term |
| 2.3 Fourier reconstruction | ±1 modes, a±=1 | At x=0 sum4√yK; at x=1/4 sum0 | Pass; even normalization |
| 2.4 critical zero modes | √y,√y log y | Truncated squared integrals log Y,(log Y)³/3 | Pass; both excluded from L² |
| 2.4 complementary zero mode | s=3/4 | ∫₁^Y|y^s|²y⁻²=2(√Y−1); ∫₁∞|y^(1−s)|²y⁻²=2 | Pass; only growing coefficient forced zero |
| 2.4 irregular decay | κ=1/3,w=1 | min|n+κ|=1/3; leading exponential e^(−2πy/3), not e^(−2πy) | Pass |
| 2.4 regular decay / Lean decay_atImInfty | κ=0,w=1,zero term absent | Smallest |n|=1; e^(−2πy) on both sides of rate comparison | Pass |
| 2.4 trivial coefficient bound | at y=1/|n|, mode extraction | √y=|n|^(−1/2); solving for a(n) gives constant·√|n| | Pass; fixed nonzero Bessel pairing needed |
| 2.4 coefficient injectivity | cusp f−g with every coefficient0 | Each mode0, reconstruction0; constant term0 | Pass; constant1 would refute omission of cusp hypothesis |
| 2.5 energy positivity | zero,constant1,λ=1/5 nonzero | 0=λ·0; 0=0·V; λ‖f‖²=(1/5)‖f‖²>0 | Pass; no inference λ≥1/4 |
| 3.1 domain/reducing comparison | D=diag(1,−1),A=diag(1,2) | DA=AD=diag(1,−2); P+AP+=diag(1,0) | Pass; commuting projection hypothesis matters |
| 3.2 maximal restriction/closedness | same full-domain 2D model | Restricted A on first line=1, adjoint=1; domain whole line | Pass; construction still needs named supplier |
| 3.2 nonnegativity/kernel | constants χ=1; χ(d)=−1 | Δ1=0; (1−(−1))c=2c=0 forcesc=0 | Pass |
| 3.2 odd zero space | χ odd mod3 | Space{0}, spectrum empty; no first positive λ | Pass |
| 3.3 smooth representatives | constant1,λ=0 or2 | Δ1−λ1=0 or−2 | Pass; only first is eigenvector |
| 3.4 cusp restriction | constant1 vs zero | Full-period integrals N vs0; first removed, second retained | Pass |
| 3.4 compact resolvent implication | diagonal eigenvalues1,2,3,… | (A+1)⁻¹ diagonal1/2,1/3,…→0; count below2.5=2 | Pass; zero space gives count0, no infinite sequence |
| 3.4 finite multiplicity/count | A=diag(1,1,2),T=0,1,2 | Counts0,2,3; distinct eigenvalue counts0,1,2 differ | Pass; retains multiplicity |
| 3.4 exceptional residual boundary | constant eigenfunction; λ=1/5 | Constant λ0 is outside(0,1/4); λ1/5 lies inside and must use cusp sector | Consistent with supplier §0.6 |
| 3.5 orthogonality | eigenvalues1,2; first-slot product h | 1h=2h forcesh=0; cusp constant inner product0 | Pass |
| 3.5 weighted incomplete series | χ(δ)=ζ₃ | Reindexing weight factor conj(χ(δ⁻¹))=ζ₃; unweighted factor1 | Pass |
| 3.5 regular-channel necessity | stabilizer multiplierζ₃ | Seed coefficient would satisfya=ζ₃a, hencea=0 | Pass |
| 4.1 Hecke preservation/identity | n=1 | Sole (a,d,b)=(1,1,0); 1/√1=1; T₁f=f | Pass |
| 4.1 good-prime normalization | level1, n=2 | T₂f=(f(2z)+f(z/2)+f((z+1)/2))/√2 | Pass; coefficient at m becomesa(2m)+1_(2∣m)a(m/2) |
| 4.1 coefficient/Hecke product | m=n=2,χ(2)=1 | a(2)²=a(4)+a(1); T₂²=T₄+T₁ | Pass |
| 4.1 coprime multiplication | m=2,n=3 | Only divisor1; a(2)a(3)=a(6),T₂T₃=T₆ | Pass |
| 4.1 bad-prime powers | χ(p)=0 | Tₚ²=Tₚ²-index+0·T₁; a(p²)=a(p)² | Pass; no good-prime exclusion |
| 4.2 adjoint convention | χ(n)=i,a=exp(iπ/4) | conj(a)=(1−i)/√2=−ia; a=i·conj(a) | Pass theorem; R06 repairs its Check |
| 4.2 printed exponential Check | a=e(iπ/4) | conj(a)=.00719188336; −ia=−.00719188336i | FAIL R06 |
| 4.2 normal vs symmetric | scalar a=(1+i)/√2 | aa*=a*a=1; a−a*=√2i≠0 | Pass; normal not self-adjoint |
| 4.2 simultaneous diagonalization | T=diag(1,i),U=diag(2,−3) | TU=UT=diag(2,−3i); real/imaginary diagonal parts commute | Pass route to native symmetric theorem |
| 4.3 reflection coefficients | e(x)±e(−x) | Reflection eigenvalues+1,−1; axis values2,0 | Pass |
| 4.3 involution/splitting | projections(1±ι)/2 | ι²=1 implies P+P−=0 and P++P−=1 | Pass |
| 4.3 total parity | zero | ι0=0=−0; chosen parity0 | Pass; a(1)=1 excludes ambiguity |
| 4.4 Fricke source/target and square | N=4,z=i/2 | W₄z=i/2; W₄²z=z; matrix square−4I | Pass; N=0 excluded |
| 4.4 exact-divisor multiplication | N=6,Q=2,R=3; Q=R=2 | QR/gcd²=6;4/4=1 | Pass |
| 4.4 character commutation | ad=n,χ(a)=ζ₃,χ(d)=ζ₃² | χ(n)conjχ(d)=1·ζ₃=χ(a) | Pass; right T acts on dual character |
| 4.4 imaginary-axis formula | N=4,y=2 | −1/(4·2i)=i/8=i/(Ny) | Pass |
| 4.5 raw dilation coefficient | d=4,a_f(1)=1 | √d a_f(1)=2 at index4; coefficient at1=0 | Pass |
| 4.5 dilation norm | M=1,N=4 | Index=4(1+1/2)=6; squared norm=6‖f‖², not1/4 or24 | Pass |
| 4.5 old/new complement | N=1; inner product orthogonal basis e₁,e₂ | Oldspace0,newspacewhole; if oldspan e₁,newspan e₂ | Pass |
| 4.5 positive-level signature | N=0 versus1 | 1∣0 true; 0 has no NeZero instance; at1 proper divisor sum empty | Pass; repaired binder |
| 4.5 normalized newform | 0; B₄f | First coefficient0 in each case ≠1 | Pass; wrong models excluded |
| 4.6 all-index eigenform/coefficient law | normalizedf, n=1,p² | T₁f=1f; a(p²)=a(p)²−χ(p) | Pass; bad primes included |
| 4.6 strong multiplicity one | f and cf, c=2 | First coefficients1,2; onlyc=1 preserves normalization | Pass separating test; agreement outside finite primes still deep |
| 4.6 good eigenspace vs spectral multiplicity | two lines with same λ, T₂ eigenvalues1,−1 | Laplace multiplicity2; joint systems differ at2 | Pass; no simplicity overclaim |
| 4.6 trivial bad primes | p=2 exactly dividesN,η=−1; p²∣N | a(2)=1/√2,a(4)=1/2; second brancha(p)=0 | Pass |
| 4.6 ramified character branch | primitive evenχ mod5 vs trivialχ | Required norms1 vs1/√5; Lean signatures cover only latter | R03 missing headline |
| 4.6 Fricke sign/product | N=26,η₂=η₁₃=1 | ε₂₆=1; a₂=−1/√2,a₁₃=−1/√13 | Pass |
| 4.6 parity from line | ιf=uf,ι²f=f,f≠0 | u²=1 ⇒u=±1 | Pass |
| 4.7 pointwise conjugation | odd normalizedf | a_conj(f)(1)=conj(a_f(−1))=−1 | Pass; not normalized dual |
| 4.7 conjugate reflection/self-duality | a₁=1; a₂=i vsreal a₂ | Duala₁=1; duala₂=−i vsunchanged reala₂ | Pass; cubic dualχ²≠χ |
| 5.3 inherited gap | λ=21/100 | 84/400>75/400; t²=1/4−21/100=1/25,t=1/5≤1/4 | Pass |
| 5.3 constant exclusion | f=c,σ=1 | I∞=Nc=0 atN>0 ⇒c=0 | Pass; nonzero cusp form is nonconstant |
| 5.4 conjecture predicate | zero space; hypotheticalλ1/5 | Universal true on empty set; 1/4≤1/5 false on nonzero witness | Pass |
| 5.4 level-one geometric bound | strip y≥√3/2, first frequency1 | y²≥3/4;4π²·3/4=3π²; divide energy cover2 gives14.80440660 | Pass; zero mode would give0 instead |
| 5.5 scattering regularity | level9 cubic cusp1/3 | Constant-channel condition1=ζ₃ is false | Pass |
| 5.5 scalar scattering normalization | level1,s=2 | √πΓ(3/2)ζ(3)/(Γ(2)ζ(4))=(π/2)ζ(3)/ζ(4) | Pass formula at regular point |
| 5.5 functional equation/unitarity | scalar φ(1/2+it) | φ(s)φ(1−s)=1 and reality giveφ(s)conjφ(s)=1 | Consistent; analytic inputs require sources |
| 5.5 Weyl coefficient | N=1,2,3,4,6,26 | index/12=1/12,1/4,1/3,1/2,1,7/2 | Pass |
| 5.5 odd-character guard | N=3,oddχ | Count0; unguarded predicted slope4/12=1/3 | Pass revised even hypothesis |
| 5.5 continuous-term scale | M(T)=O(TlogT) | TlogT/T²=logT/T→0 | Pass implication to cusp asymptotic; not a proof of M bound |
| 6.1 LSeries zero term | n=0,1 | Native term0=0; normalized term1=1/1^s=1 | Pass |
| 6.1 Cauchy–Schwarz convergence | σ=5/4,ε=1/4 | Weighted exponents5/4 and 2σ−1−ε=5/4; both >1 | Pass |
| 6.1 good Euler factor | a_p=0,χ(p)=1,x=p^(−s) | (1+x²)⁻¹=1−x²+…; a_p²−1=−1 | Pass |
| 6.1 bad Euler factors | p∥N,η=−1; p²∣N,trivialχ | (1−p^(−s−1/2))⁻¹;1/(1−0+0)=1 | Pass |
| 6.2 even Mellin normalization | s=2,N=1 | 4·2^0·(2π)^(−2)=π^(−2) | Pass |
| 6.2 odd Mellin normalization | s=1,N=1 | Derivative factor8πi; K Mellin factor(2π)^(−2); total2i/π; divide2πi givesπ^(−2) | Pass; equals Γℝ(2+b)Γℝ(2−b) scalar |
| 6.2 level scaling | N=4 | Even outside factor√2 cancels N^(−1/4); odd outside1/√2 cancels extra N^(1/4) | Pass; remaining4^(s/2) |
| 6.2 parity/root number | ε=+1,δ=0,1 | ε(−1)^δ=+1,−1; at s=1/2 odd equationΛ=−Λ forces0 | Pass |
| 6.2 dual Fricke scalar | c=i,δ=1 | Root−i; dualrooti; product1 | Pass; not a real sign assertion |
| 6.2 exceptional/threshold gamma shifts | λ=1/5 and1/4 | δ±1/√20; δ,δ | Pass; using real sqrt alone loses first pair |
| 6.2 completed agreement signature | arbitraryf, both choice branches | On Re s>1 both return N^(s/2)γ(s)L(s,f) | R05 definition padding |
| 6.2 entire extension/zero strip | decay exp(−cy−c/y), c>0 | For any fixed real exponent, both tails have finite integral; FE sends Re s<0 to>1 | Pass route tests; existence/zero-free half-plane remain deep |
| 6.3 Ramanujan root iff | χ=1,a=2 | Roots1,1; recurrencea(p^k)=k+1=τ(p^k) | Pass |
| 6.3 phase hypothesis | χ=−1,a=2 | Roots1±√2; conj(a)=2≠−2=conjχ·a | Negative control correctly rejected |
| 6.3 complex phase valid case | χ=−1,a=2i | Polynomial(X−i)²; both rootsi have norm1 | Pass; phase law holds−2i=−(2i) |
| 6.3 conductor | N1,δ0,r0,s1/2; N4; δ1 | 49/4;49;81/4 | Formula passes; R07 asks local Checks |
| 6.3 r sign invariance | r=±1,s1/2,δ0 | Each factor3+√5/2; product identical | Pass |
| 6.4 completed card | two real gammas, no complex | Degree2·1+0·2=2; conductorN>0; polar divisorempty | Pass shape; supplier carrier not pinned |
| 6.4 dual and average growth | trivial/cubicχ; Cauchy–Schwarz partial sum | Dualχ=χ/χ² respectively; bound√(x·Cx^(1+2ε))=√C x^(1+ε) | Pass |
| 7.1 H³ Laplacian | f=y^s,s=0,1,2,3 | s(2−s)y^s=0,y,0,−3y³ | Pass; missing first derivative would give−2y² at2 |
| 7.1 H³ energy density | vertical f,g compactly supported | Integrating −f″g/y+f′g/y² gives ∫f′g′/y; the two f′g/y² terms cancel | Pass; densityy⁻³ required |
| 7.1 H³ dilation | f=y,supported local jet,d=2 | Δ₃(2y)=2y=(Δ₃f)(2P) | Pass covariance test |
| 7.2 cusp/carrier | constant1;zero atλ−1 | Constanttorus integral1; Δ₃0=−1·0=0, norm0,cusp0 | R02 missing nonzero qualification |
| 7.2 Picard cusp stabilizer | translations1,i androtation−1 | e(Re n)=e(−Im n)=1 for Gaussian n; rotation squared1 | Pass |
| 7.2 complementary branch | λ=0,1,2 | t=1⇒1−1=0; b=0; r=1⇒1+1=2 | Pass |
| 7.2 quotient tail/compactness route | y>Y, torusarea1 | ∫_Y∞y⁻³dy=1/(2Y²); nonzero frequency energy controls tail byY⁻² | Pass route test; not generic finite-volume⇒compactness |
| 7.3 Gaussian pairing | n=i,x=x₁+ix₂ | Re(nx)=−x₂; Re(conj(n)x)=+x₂ | Pass; wrong pairing detected |
| 7.3 Gaussian mode ODE | n=1,b=1/2,λ=3/4 | f_n=C√y e^(−2πy); −y²f″+yf′+4π²y²f=(3/4)f | Pass |
| 7.3 zero/repeated mode | y^s,s=0,2,1; ylogy | Eigenvalues0,0,1; Δ₃(ylogy)=ylogy | Pass |
| 7.3 I exclusion/decay | yI_b(ky),yK_b(ky) | Norm-density tails proportional e^(2ky)/y² and e^(−2ky)/y² | Pass |
| 7.3 coefficient growth/injectivity | heighty=1/|n|; all cusp coefficients0 | Kernel prefactor1/|n| ⇒|a_n|≤C|n|; reconstruction0 | Pass; constantterm must vanish |
| 7.4 R,J coefficient actions | n=1,i; n=a+bi | R sendsindex1 to−i; J sendsa+bi toa−bi | Pass |
| 7.4 involutions commute | x arbitrary, invariant under−x | RJx=i·conj(x); JRx=−i·conj(x), differ byΓrotation−1 | Pass on invariant functions |
| 7.4 unit Hecke operators | n=1,i | T₁=1; T_i=R; R-odd eigenvalues1,−1 | Pass; not ideal indexed on whole space |
| 7.4 divisor unit independence | a replaced byia | (ia)²=−a²; coefficient index changesm to−m, a(−m)=a(m) | Pass |
| 7.4 ideal eigenvalue recurrence | R-even,a(𝔭)=0 | T𝔭²=T𝔭²-index+1; a(𝔭²)=−1 | Pass |
| 7.5 convergence exponent | |a(𝔫)|≤C N𝔫^(1/2),σ=2 | MajorantCΣN𝔫^(−3/2), exponent>1; boundaryσ3/2 gives1 | Pass; strict half-plane |
| 7.5 gamma half-shifts | s=r=1 | Γ(1+i/2)Γ(1−i/2)=.6825694503; shifts±i give.2720290550 | Pass; old factor-of-two error excluded |
| 7.5 scaled Mellin/units | n=1,s=r=1 | Integral=.6825694503/(4π²)=.01728968616; fourgenerators multiply by4 | Pass |
| 7.5 conductor and completion | discriminant−4,s=1 | 16^(1/2)·[2(2π)⁻¹]²=4/π²; vertical ideal factor1/π² | Pass; Λ=4×integral |
| 7.5 inversion and J-odd exclusion | y↦1/y;J-odd atn1 | y^(2s−2)dy transforms to y^(−2s)dy (s↦1−s); a1=−a1⇒0≠1 | Pass; no general J-odd Mellin claim |
| 8.1 invariant dictionary | λ=5/4,1/5; squarefree2∣N | R=1,i/√20; a4=(±1/√2)²=1/2 | Pass |
| 8.1 ramified-part factorization | n=12,N=2,η₂=−1 | n′=3,a12=a3·a2²=a3/2 | Pass |
| 8.2 prefix/minimality | normalized level-onef;B₂f | Prefix(1,0,1); raisedform first coefficient0, not a normalized newform | Pass |
| 8.2 spectral simplicity distinction | same λ, distinctgood systems | Laplace count2, each joint line dimension1 | Pass; does not contradict strong multiplicity one |
| 8.3 residual existence | A=diag(1,2),g=e₁,λ₀=1.1,η=.1 | Residualnorm.1=η‖g‖; eigenvalue1 atdistance.1 | Pass |
| 8.3 nonzero/domain controls | g=0,λ₀=−1,η=0 | Residual0, interval{−1} contains no nonnegative eigenvalue | Repaired nonzero binder excludes witness |
| 8.3 rank-one projection | A=diag(1,2),g=(√.99,.1),Pfirstline,λ₀=1 | η=.1,d=1,q=.1; ‖g−Pg‖=.1,‖Pg‖=√.99 | Pass |
| 8.3 uniqueness guard | full projection on g=(1,1) | rank2; Ag=(1,2) not scalar multiple ofg | Repaired rank-one guard excludes witness |
| 8.3 normalized error | Cn=C1=b=1,q=.1,measurement1 | .1/.9+.1/.9=2/9; b=.1 instead gives denominator0 | Pass; strict inequality essential |
| 8.3 exact eigenvector / certificate packaging | η=0 | q0,error0; intervalradius0 pins sameeigenvalue | Math passes; R08 remove record targets |
| Worked first odd/even forms | R9.53369526135/13.77975135189 | λ91.1413453364/190.1315473199; a4=.1413365741/1.4003443717 | Arithmetic agrees to displayed precision |
| Worked level1 multiplicativity/Bessel | printed a2,a3; Rfirst | a6=.4873709344; K(2π)=6.827942759e−8,K(4π)=3.184740579e−8 | Arithmetic/quadrature pass; not certified records |
| Worked level2 | a2=1/√2,a3=−.38053857 | a4=.5,a8=.3535533906,a6=−.2690814034; λ29.5975164095 | Pass within rounded inputs |
| Worked level26 | a2=−1/√2,a3=−1.26524453 | a6=.8946629870,a4=.5,a8=−.3535533906; λ2.1459804644 | Pass |
| Worked level19 | a2=−1.23669325,a3=−1.50256421 | a4=.5294101946,a6=1.8582110162,a19=1/√19=.2294157339 | Fits stated coefficient uncertainty, not exact8-digit equality |
| Worked Eisenstein rejection | continuedE(z,0); E(z,2) | E0=1,norm²π/3; y² mode has divergent cusp norm | FAIL R01 |
| Worked oldform rejection | B₂f normalizedoriginal | a_B₂f(1)=0,a_B₂f(2)=√2 | Pass; quotient a2/a1 undefined mathematically |
| Worked holomorphic rejection | weightk=12,S,z=e^(iπ/3) | Unitary weightscalar(z/abs z)^12=1 here; atz=e^(iπ/4), scalar−1 | Nonconstant phase blocks a nonzero weight0 law; F=0 refutes unrestricted rejection (R02) |
| Worked index/cusp constants | N1,2,3,4,5,6,9,11,19,23,26,101,105 | Indices1,3,4,6,6,12,12,12,20,24,42,102,192; cusps1,2,2,3,2,4,4,2,2,2,4,2,8 | Divisor/product formulas agree |
| Worked cusp widths | N12,c=1,2,3,4,6,0 | 12/gcd(c²,12)=12,3,4,3,1,1 | Pass |
| Worked effective covering degrees | N1,…,7 | |(Z/NZ)ˣ/{±1}|=1,1,1,1,2,1,3 | Pass; not φ(N) atN≥3 |
| Worked Gaussian covolume | CatalanG=.9159655941 | G/3=.3053218647 | Arithmetic agrees with supplied covolume |

**Seeded source audit (15/15 targets attempted).** Statements were compared to the version actually fetched; unavailable text is not treated as verified. The document has no separate list of flagged unverified locators. All bibliography works were attempted through the sources service; DLMF and LMFDB were retried successfully with institutional classification. One source id is retained per work across its pages. No manifest or source text was put in the roadmap.

| Seeded target | Text/locator actually opened | Assessment of scope, hypotheses and locator |
|---|---|---|
| 0.2 reflection/energy | CongruenceSpectralGap §0.2; coordinate computation above | Reflection and compact-support energy sign pass. No attached external exact locator; Iwaniec text unavailable. R04. |
| 1.1 Maass/cusp carrier | booker-lee-strombergsson lines 118–161, arXiv v2 §1.1, printed p.3 | Defines positive-eigenvalue cusp forms with even character. The roadmap deliberately also bundles zero and L² noncuspidal forms; the constant test distinguishes that extension. No claim that BLS itself defines every extended carrier. [Text](https://arxiv.org/pdf/1803.06016v2). |
| 2.1 K supplements | dlmf lines 345–349 (10.32.9); 137–140 (10.30.3); 85–90 (10.31.2); 73–75 (10.28.2); 728–732 (10.43.19) | Integral, K₀ logarithm, Wronskian orientation and Mellin exponent agree. Mellin requires Re s>abs(Re ν); the positive-real argument satisfies the integral's sector. Complex I is also resolved in the named supplier. The additional bounds follow by the displayed integral estimates; BST's separate bounds were not source-certified. [Integral](https://dlmf.nist.gov/10.32.E9), [Wronskian](https://dlmf.nist.gov/10.28.E2), [Mellin](https://dlmf.nist.gov/10.43.E19). |
| 2.4 growth/decay | Local zero-mode integrals and κ-shifted mode calculation above; Iwaniec Chapters 1/3 not readable | Critical logarithmic divergence, complementary surviving zero mode, and irregular-cusp rate pass. No textbook theorem/page certification claimed. |
| 3.2 restricted Laplacian | CongruenceSpectralGap §§0.1–0.2; SelfAdjointSpectralTheory Part C; pinned partial-map declarations | Named domain and restriction inputs exist. The new comparison is mathematically meaningful; it still lacks its own exact source/adaptation locator (R04). |
| 4.2 adjoints/diagonalization | booker-lee-strombergsson lines 152–161, printed p.3 gives normalized Hecke definition; Mathlib joint eigenspaces | The text does not independently verify this roadmap's adjoint formula. The phase computation verifies its normalization, while refuting its Check (R06). Real/imaginary reduction matches the symmetric finite-dimensional library theorem. Exact external locator missing (R04). |
| 4.4 Atkin–Lehner/Fricke | Pinned `frickeGL`; Atkin–Lehner and Atkin–Li fetch attempts unsuccessful | Matrix square, fixed point, dual-character direction and character factor pass direct calculation. No verification of their cited theorem numbering or nonholomorphic adaptation from inaccessible texts. R04. |
| 4.5 old/new | booker-lee-strombergsson lines 168–187, arXiv v2 §1.1, printed pp.3–4 | Raw f(dz), conductor-compatible smaller levels, orthogonal newspace and normalized newform basis agree. Source does not use the roadmap's factor-two Fourier convention; √d scaling was recomputed rather than copied. |
| 5.5 scattering/Weyl | duke-imamoglu-toth lines 503–524, 565–566, equations (5.2)–(5.5),(5.10), printed pp.961–963; Huxley unavailable | Confirms level-one family/scattering and X/12 Weyl normalization, not arbitrary-character factorization. The latter is explicitly a target here; exact Huxley/general-level locator remains unverified (R04). [Text](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p08-p.pdf). |
| 6.1 Euler product | duke-imamoglu-toth lines 544–549, (5.8), printed p.962; AL.3.5.3/3.6.1 | Level-one product and Re s>1 match. General level/character uses the explicit all-place comparison, with the supplier's positive self-pair theorem; the paper is not treated as a general-nebentypus proof. |
| 6.2 completion/FE | duke-imamoglu-toth lines 551–556, (5.9), printed pp.962–963; dlmf 10.43.19 | Even case has exact source normalization. For odd parity, the paper's π^(−s) convention is π times the product of two Γℝ factors used here; that constant does not change entirety or the root number. Both Mellin constants were computed above. Character-dual equation is the roadmap's general-level target. The citation “§5.2” should be §5, unnumbered “Spectral expansion”; 5.2 is an equation number, not a subsection (R04). |
| 6.3 Ramanujan/conductor | Pinned character/Hecke conventions; Iwaniec–Kowalski §5.1 (5.7) unavailable | Phase-sensitive Satake examples pass, including χ=−1. Conductor arithmetic agrees with the stated definition. The attribution to (5.7) and its precise normalization is not certified; page missing. |
| 7.1 H³ Laplacian | KleinianGroups action/volume contract; EGM unavailable | Power law and y⁻³ energy density recomputed; omission of y∂y is detected at y². No certification of EGM chapter/page claims (R04). |
| 7.5 Picard L-function | dlmf lines 728–732, 10.43.19; lmfdb lines 90–92, `mf.maass.picard.fourierexpansion` | Mellin substitution μ=2s gives half-order shifts and factor1/4, hence conductor16 and Λ=4 times the vertical integral. Source knowl omits exclusion of n=0; roadmap corrects it. Full Picard spectral/Hecke theorem not verified against EGM. [Knowl](https://www.lmfdb.org/knowledge/show/mf.maass.picard.fourierexpansion). |
| 8.1 invariant dictionary | lmfdb lines 90–92, `mf.maass.mwf.eigenvalue`; lines 90–104, `mf.maass.label`; lines 90–99, `mf.maass.spectral_index` | λ=1/4+R² and prefix/index meanings verified. Spectral-index prose interchanges real and imaginary branches; roadmap uses the mathematically correct branches. Database coefficient identities were recomputed, not inferred from its labels. [Eigenvalue](https://www.lmfdb.org/knowledge/show/mf.maass.mwf.eigenvalue), [Index](https://www.lmfdb.org/knowledge/show/mf.maass.spectral_index). |

Additional source checks: booker-strombergsson-venkatesh lines 370–398, §3 Proposition 1 and Remark (2), printed p.9, distinguish eigenvalue existence from uniqueness; the roadmap's rank-one addition is necessary. seymour-howell lines 188–233, §2.3, printed pp.3–4, supplies the isolation/normalization comparison; lines 236–239 give the squarefree trivial-character bad-prime size. humphries lines 65–74, Theorem 1.1, printed p.2, supplies nonsquarefree spectral multiplicity, not a counterexample to strong multiplicity one. lmfdb lines 90–98 in `mf.maass.mwf.dimension` conflate the newspace and oldspace; lmfdb lines 94–108 in `rcs.rigor.maass_rigor` assert existence, approximation and completeness, without explicitly asserting rank-one uniqueness. The roadmap must not infer uniqueness solely from that knowl. lmfdb line 90 in `mf.maass.26.0.1.1.1.top` supports the stated least-squarefree-level observation. [BSV author text](https://math.stanford.edu/~akshay/research/bsv.pdf), [Seymour-Howell v2](https://arxiv.org/pdf/2201.08760v2), [Humphries v3](https://arxiv.org/pdf/1502.06885v3).

## Not verifiable

The review is finished, not parked. No unavailable book or paper was guessed from memory. These source checks remain uncertified; absence of access is not itself counted as a mathematical defect. The consolidated missing-reference file records the failed searches, excluding sources subsequently fetched and the service's settled uncertified Roelcke I entry.

| Source id / work | Needed for | Where the legal-source service looked and outcome |
|---|---|---|
| iwaniec-spectral — *Spectral Methods*, second edition | Layers 0–5, especially 2.4, 3.2, 5.4–5.5 | arXiv lookup HTTP429; AMS GSM53 landing page, no readable text returned. Chapter/theorem claims not certified. |
| iwaniec-topics — *Topics in Classical Automorphic Forms* | Regular/irregular cusps | arXiv HTTP429; AMS GSM17 landing page, no text. |
| bump — *Automorphic Forms and Representations* | §§1.9,2.1, level-one analytic background | arXiv HTTP429; Cambridge book landing page, no text. |
| atkin-lehner — *Hecke operators on Γ₀(m)* | Theorems3,5, 4.5–4.6 | Bibliographic search/arXiv HTTP429; no legal text returned. |
| atkin-li — *Twists of newforms and pseudo-eigenvalues of W-operators* | Theorem3, character bad-prime trichotomy | Bibliographic search/arXiv HTTP429; no legal text returned. Native statability of the omitted branch was checked separately. |
| huxley — *Scattering matrices for congruence subgroups* | 5.5 explicit all-level scattering | Bibliographic search/arXiv HTTP429; no legal text returned. |
| elstrodt-grunewald-mennicke — *Groups Acting on Hyperbolic Space* | Layer7; cited Chapters1–3,6–8 | arXiv HTTP429; Springer DOI classified as paywalled, no text. |
| iwaniec-kowalski — *Analytic Number Theory* | (5.7) conductor; Chapter15 background | arXiv HTTP429; AMS Colloquium53 landing page, no text. |
| booker-strombergsson-then — *Bounds and algorithms for the K-Bessel function of imaginary order* | 2.1(i),(iii) | arXiv HTTP429; Cambridge journal landing page, no text. DLMF and direct integral checks were available. |
| hejhal — *Selberg Trace Formula*, volume2 | General multiplier spectral/trace background | arXiv HTTP429; Springer DOI classified paywalled, no text. |
| maass — *Über eine neue Art …* | Original carrier/Hecke background | Bibliographic search/arXiv HTTP429; no legal text returned. |
| roelcke — *Über die Wellengleichung …* | 5.4 historical bound | arXiv HTTP429; Springer classification, no text. |
| roelcke-i — *Das Eigenwertproblem … I* | 5.4 spectral background | Bibliographic retry classified the work as uncertified/paywalled. An earlier DOI probe returned404 and was not used as evidence for a valid locator. No further request for this settled uncertified work. |
| roelcke-ii — *Das Eigenwertproblem … II* | 5.4 spectral background | arXiv HTTP429; Springer classification, no text. |
| selberg — *On the estimation of Fourier coefficients of modular forms* | Historical 3/16 statement | arXiv HTTP429; AMS PSPUM8 landing page, no text. The stronger named roadmap contract and numerical implication were checked. |

Individual LMFDB record pages, their stored error intervals, and the cited `main.py`/`web_maassform.py` code were not fetched. The report certifies the arithmetic consistency of their printed numbers only, not existence, uniqueness, ordering, rigor flags, or completeness of those records. The fetched knowls and DIT's five level-one spectral values provide only the limited corroboration described above. Broad source locators without readable text remain unverified, including the exact EGM chapter mapping. No source passages were copied into deliverables.

## Source issues

- **Misprint** in lmfdb at `mf.maass.spectral_index`, lines 95–97 (unpaginated): the source says standard parameters are imaginary and exceptional ones real; it should be real for λ>1/4 and imaginary for 0<λ<1/4; affects a stated result.
- **Misprint** in lmfdb at `mf.maass.picard.fourierexpansion`, line 91 (unpaginated): the source says the Bessel sum includes n=0; it should be summed over nonzero n, with a separate zero mode for noncuspidal forms; affects a stated result.
- **Error** in lmfdb at `mf.maass.mwf.dimension`, lines 90–94 (unpaginated): the source says the eigenspace consists of newforms but counts oldspace multiplicity as an example; it should be the full cusp eigenspace, distinguished from its newspace; affects a stated result.
