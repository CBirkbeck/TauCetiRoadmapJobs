# Review of MaassForms (pull request #1717 at cccfc9b)

**Verdict:** needs changes

🤖 Independent AI review. No pull-request file was changed.

## R01 (P1) — Weyl's law contradicts the odd-character vanishing theorem

**Location:** `TauCetiRoadmap/MaassForms/Suggested.lean:634` and `TauCetiRoadmap/MaassForms/README.md:788`: “Weyl's law for the cuspidal spectrum”.

**Claim:** For every character modulo N, the counting-function quotient tends to the index divided by 12. Section 3.4 also asserts an infinite sequence of eigenvalues without excluding odd characters.

**Witness:** Take N=3 and the nontrivial character modulo 3. It has χ(−1)=−1. Section 0.3 gives S(3,χ,λ)=0 for every λ, hence the limit is 0; the asserted limit is 4/12=1/3.

**Repair:** Require χ(−1)=1 in the positive Weyl asymptotic and infinite-spectrum assertion. Retain the zero-space theorem for odd χ, or state the counting limit with the even-character indicator. On this witness the corrected limit is 0. The same branch distinction is needed when Layer 8 identifies a real spectral parameter with every eigenvalue.

## R02 (P1) — The critical constant terms are not square-integrable

**Location:** `TauCetiRoadmap/MaassForms/README.md:548`: “holds for every `α, β`”.

**Claim:** A constant term with exponents of real part 1/2 is square-integrable against y⁻²dy.

**Witness:** Set s=1/2, α=1, β=0. The integral from 1 to Y of |√y|²y⁻² is log Y, which tends to infinity. This also contradicts the Eisenstein rejection Check at line 1069.

**Repair:** For λ≥1/4, require the entire zero mode to vanish. At the repeated root use A√y+B√y log y and prove A=B=0. For 0≤λ<1/4 retain only the integrable exponent 1−s, including s=1: the constant function has λ=0 and integral ∫₁∞y⁻²dy=1. Do not assert s∈(1/2,1) for λ=0.

## R03 (P1) — Level raising loses a square-root factor

**Location:** `TauCetiRoadmap/MaassForms/README.md:530`, `:539` and `:697`: “`a_{B_d f}(n) = a_f(n/d)`”.

**Claim:** Raw dilation B_d f(z)=f(dz) leaves the nonzero coefficient unchanged apart from its index.

**Witness:** In the stated expansion, f(dz)=2√d√y Σ a_f(m)K(2π|dm|y)e(dmx). Thus a_{B₄f}(4)=2a_f(1)=2 for a normalized form; the proposed formula gives 1.

**Repair:** First reconcile §2.2 with §2.3: the former writes a mode as α√yK, so the latter must define a(n)=α/2, not α. For α=1 the limit gives 1/2 and the stated reconstruction otherwise doubles the mode. Keep B_d as defined and write a_{B_df}(n)=√d a_f(n/d) when d divides n, and 0 otherwise. Check d=1,2,4 and n=1,d. The existing unnormalized Petersson norm scaling is consistent with raw dilation; changing B_d to a normalized dilation would also require changing that norm formula.

## R04 (P1) — The small-argument Bessel bound fails at r=0

**Location:** `TauCetiRoadmap/MaassForms/README.md:501`: “`|K_{ir}(u)| ≤ C_r` … for … real `r`”.

**Claim:** K of every imaginary order is bounded near zero.

**Witness:** At r=0, K₀(u)∼−log u (dlmf line 137, §10.30). Directly from the defining integral, K₀(u)≥e⁻¹ arcosh(1/u) for 0<u≤1, which is unbounded.

**Repair:** State the bounded estimate for fixed r≠0, and the logarithmic estimate K₀(u)=−log(u/2)−γ+o(1) at r=0. Preserve the threshold λ=1/4 in the Fourier theory. The lower bound at u=e⁻ᵐ grows at least linearly in m, so the corrected logarithmic branch passes this test. [DLMF 10.30.3](https://dlmf.nist.gov/10.30.E3).

## R05 (P1) — The Gaussian unit-index Hecke identity is false

**Location:** `TauCetiRoadmap/MaassForms/README.md:925`: “`T_{in} = R T_n R`”.

**Claim:** Multiplying the index by i conjugates T_n by the rotation R.

**Witness:** At n=1 the sum has one coset, so T₁=Id and T_i=R. The proposed right side is R²=Id. On the R-odd component the left side is −Id and the right side is Id.

**Repair:** Derive the unit-index rule from the cosets: T_{in}=R T_n=T_n R, with T_{−n}=T_n. Keep ideal-indexing restricted to R-even forms. Check n=1 on both rotation eigenspaces: the corrected rule returns +1 and −1 respectively, rather than forcing both to +1.

## R06 (P1) — The Picard L-function has the wrong archimedean shifts

**Location:** `TauCetiRoadmap/MaassForms/README.md:941`: “`Γ_ℂ(s + ir) Γ_ℂ(s - ir)`”.

**Claim:** The Fourier kernel yK_{ir}(2π|n|y), with λ=1+r² and norm-indexed coefficients, yields shifts ±ir.

**Witness:** Mellin integration gives ∫₀∞y^{2s−1}K_{ir}(2π|n|y)dy=(1/4)π^{−2s}|n|^{−2s}Γ(s+ir/2)Γ(s−ir/2). At s=r=1 the gamma product is 0.6825694503, versus 0.2720290550 with the proposed shifts.

**Repair:** Use shifts {ir/2,−ir/2}, retaining the norm index |n|² and λ=1+r²; derive the fixed scalar in the Mellin comparison under the four-unit convention. Changing the shifts to ±ir/2 makes the displayed integral agree. Also state how the vertical-geodesic argument handles a J-odd form, whose restriction to that geodesic is zero, rather than claiming that restriction alone proves continuation for all R-even forms. The Mellin identity is dlmf line 730, [DLMF 10.43.19](https://dlmf.nist.gov/10.43.E19).

## R07 (P1) — The H³ spectral dictionary excludes its own constant form

**Location:** `TauCetiRoadmap/MaassForms/README.md:887`: “`λ = 1 + r²` with `spectralParameterH3 λ := √(λ - 1)`”.

**Claim:** This dictionary holds for M₃(λ), after proving only λ≥0.

**Witness:** The constant function 1 is smooth, invariant and square-integrable on the finite-volume Picard quotient; Δ₃1=0. Real.sqrt(0−1)=0, so the claimed identity becomes 0=1.

**Repair:** Give the real branch only for λ≥1 and the complementary branch t=√(1−λ) for 0≤λ<1. At λ=0 the corrected identity is 0=1−1². If the intended cusp-only real-parameter claim uses a theorem excluding small Picard cusp eigenvalues, name and source that theorem before using it; nonnegativity alone does not supply it.

## R08 (P1) — The README residual estimate allows the zero approximate vector

**Location:** `TauCetiRoadmap/MaassForms/README.md:1001`: “if `g` is a smooth cuspidal automorphic function in the form domain”.

**Claim:** The residual inequality alone locates a cuspidal eigenvalue near λ₀.

**Witness:** Set g=0, λ₀=−1, η=0. All stated conditions and 0≤0 hold, but the conclusion requires a cuspidal eigenvalue −1, contradicting nonnegativity. Suggested.lean:755 correctly includes g≠0 and Δg∈L².

**Repair:** Match the Lean statement: N>0, η≥0, nonzero g, and g in the operator domain, with g and Δg square-integrable. A form-domain vector alone need not have an L² residual. The zero witness is then excluded; an exact nonzero eigenvector with η=0 returns its actual eigenvalue.

## R09 (P1) — The oldspace inclusion is false at level zero

**Location:** `TauCetiRoadmap/MaassForms/Suggested.lean:507` and `:514`: “`oldSpace N χ lam ≤ maassCuspSpace N χ lam`”.

**Claim:** The inclusion holds for every natural level, including zero.

**Witness:** At N=0, choose M=d=1 and trivial character. Every nonzero level-one cusp form lies in oldSpace 0. But Γ₀(0) is the translation group projectively; its quotient contains infinitely many modular fundamental domains, so that form has infinite squared norm.

**Repair:** Add `[NeZero N]` to the inclusion and carry positive level through definitions that use it, or define the zero-level oldspace separately as zero. Here 1 divides 0, 0/1=0 and 1 divides 0, so the indexed summand really occurs; `DirichletCharacter.changeLevel_one` preserves the trivial character even at modulus zero. Each modular tile contributes the same positive Petersson norm, giving infinity rather than a finite integral. The corrected positive-level statement excludes this instance and retains M=d=N=1, where the proper-level oldspace is zero. Pinned witnesses: `Mathlib/NumberTheory/ModularForms/CongruenceSubgroups.lean:79` and `Mathlib/NumberTheory/DirichletCharacter/Basic.lean:219`.

## R10 (P1) — The growing mode is attributed to an unavailable, wrong-typed supplier

**Location:** `TauCetiRoadmap/MaassForms/README.md:506`: “the growing solution `I_ν` of Tau Ceti main's `Real.besselI`”.

**Claim:** This supplies the complex-order I_{ir} needed in 2.2 and 7.3.

**Witness:** Neither pinned library contains Real.besselI; the README itself places it beyond the pin at line 348. A real-order function also does not supply I_i for the perfectly ordinary test r=1.

**Repair:** Replace the beyond-pin dependency with a precise earlier supplier contract for complex-order growing solutions and the Wronskian, or make the missing comparison a target here. AutomorphicSpectralTheory §§0.26–0.28 already plan complex Whittaker functions, Bessel comparison and asymptotics; resolve their exact needed range instead of creating a second special-function owner. Test ν=i and ν=0, not only real order 1/2. No gap for this input is declared.

## R11 (P1) — Character scattering is neither indexed correctly nor supplied at the cited location

**Location:** `TauCetiRoadmap/MaassForms/README.md:778`: “for each pair of cusps … and `χ`”.

**Claim:** AutomorphicSpectralTheory §§1.23 and 4.8 supply E_𝔞(z,s;χ) for every cusp, with a scalar constant term at each cusp.

**Witness:** At N=9, the roadmap's cubic even character has ζ=χ(4)≠1 at 1/3. A nonzero constant mode cannot satisfy g(x+1)=ζg(x). The cited §4.8 discusses untwisted level subgroups, not this character construction.

**Repair:** Index the scattering matrix by χ-regular cusps. Supply the character-weighted Eisenstein construction and its classical comparison as a target, or declare an exact supplier gap with the same slug in the plan and README. Cite the relevant general adelic Eisenstein theory only together with that comparison. The irregular cusp 1/3 must contribute no channel. Correct the unweighted incomplete-Eisenstein sum in §3.5 at the same time: it is invariant, whereas a nontrivial χ-space requires a character weight.

## R12 (P1) — The worker's build gate still fails

**Location:** `TauCetiRoadmap/MaassForms/Suggested.lean:1`.

**Claim:** The acceptance file meets the required warning discipline.

**Witness:** The worker records `build=1 FAIL`: importing Mathlib without opting into the module system emits a non-sorry warning. Re-running the targeted Lake build reproduces that warning, despite exit status 0.

**Repair:** Opt into the pinned module system with `module`, preserve the permitted imports, and rerun the targeted build and gate. Direct `lake env lean` succeeds with only sorry warnings, but does not exercise this Lake warning. This finding is P1 under the brief's mandatory severity for a failing build gate; it is not a claim that elaboration currently fails.

## R13 (P2) — Irregular cusps have a smaller decay exponent

**Location:** `TauCetiRoadmap/MaassForms/README.md:544`: “at every cusp … `O(e^{-2πy/w_σ})`”.

**Claim:** Removing a zero mode gives the same exponential rate at regular and irregular cusps.

**Witness:** Section 2.2 allows frequencies κ+ℤ. For κ=1/3 and w=1, the first allowed mode decays as e^{−2πy/3}; its ratio to e^{−2πy} is e^{4πy/3}, unbounded.

**Repair:** Use δ_σ=min{|ν|:ν∈κ_σ+ℤ,ν≠0}, and rate e^{−2πδ_σ y/w_σ}; δ_σ=1 at a regular cusp after cuspidality, and min(κ_σ,1−κ_σ) at an irregular cusp. The κ=1/3 test then gives precisely e^{−2πy/3}. The weaker rate still proves boundedness and the later Green/Mellin arguments. This is a failure of the stated local-mode argument, independently of asserting existence of a particular global exceptional form.

## R14 (P2) — A large spectral projection does not identify an eigenvector or coefficient error

**Location:** `TauCetiRoadmap/MaassForms/README.md:1003`: “the coefficients of the eigenvector it exhibits are within explicit bounds”.

**Claim:** A norm lower bound for projection onto an interval supplies the eigenvector and its coefficient bounds.

**Witness:** For A=diag(1,2), g=(1,1), and I=[1,2], P_Ig=g and θ=0, but Ag=(1,2) is not a scalar multiple of g. The projected vector is not an eigenvector.

**Repair:** State an actual quantitative theorem: isolate a rank-one joint eigenspace, specify a positive separation from the other spectrum, control the relevant coefficient functionals, and bound the normalizing first coefficient away from zero. Give the bound and its quantifiers. The two-dimensional witness fails rank-one isolation. BSV explicitly disclaims uniqueness (booker-strombergsson-venkatesh lines 389–398); Seymour-Howell §2.3 uses a separation δ_i and normalization W_i (seymour-howell lines 188–233). [BSV, §3](https://math.stanford.edu/~akshay/research/bsv.pdf), [Seymour-Howell, §2.3](https://arxiv.org/abs/2201.08760).

## R15 (P2) — The completed-L-function contract is weakened silently

**Location:** `TauCetiRoadmap/MaassForms/README.md:856`: “Dirichlet-series agreement on `Re s > 3/2`”.

**Claim:** This verifies the LFunctions Layer 0 predicate, with Re s>1 only under Ramanujan–Petersson.

**Witness:** `TauCetiRoadmap/LFunctions/README.md:371` requires agreement on Re s>1. At s=5/4 the supplier's predicate applies but the promised unconditional theorem does not. The trivial √n estimate gives exponent 3/4 in the comparison series, which diverges.

**Repair:** Supply unconditional absolute convergence for Re s>1, for example through a precisely owned Rankin–Selberg mean-square bound and Cauchy–Schwarz, and prove the supplier's actual predicate. Resolve the average-growth input too. Do not redefine the card predicate or require Ramanujan for this standard unconditional property. On s=5/4, a mean-square bound Σ_{n≤x}|a(n)|²≪x gives dyadic absolute tails ≪2^{−k/4}, which are summable.

## R16 (P2) — Existing objects are being planned again

**Location:** `TauCetiRoadmap/MaassForms/README.md:375`, `:402`, `:355`; `TauCetiRoadmap/MaassForms/Suggested.lean:58`, `:84`.

**Claim:** The hyperbolic Laplacian and the plain-function nebentypus space are missing foundations owned here.

**Witness:** AutomorphicSpectralTheory §1.16 already owns Δ₀, powers and slash invariance. Pinned `TauCeti/NumberTheory/ModularForms/HeckeSlash/Nebentypus/Ring.lean:88` defines `functionCharSpace k χ` on arbitrary ℍ→ℂ, not merely holomorphic forms.

**Repair:** Consume the weight-zero specialization of the existing Laplacian target and the native `functionCharSpace 0 (MulChar.equivToUnitHom χ)`; retain only genuine character/cusp extensions and necessary normalization comparisons. At k=0 and γ∈SL₂, the slash law reduces to f(γz)=χ(d)f(z), exactly the proposed carrier. Correct the blanket absence claim and cite the existing weighted Hecke sums at `HeckeSlash/Nebentypus/Basic.lean:121` when introducing the unitary normalization. This is repairable overlap, not a reason to reject the entire new roadmap.

## R17 (P2) — Statable headline cases are missing from the acceptance file

**Location:** `TauCetiRoadmap/MaassForms/Suggested.lean:354`, `:559`, `:693`, and module docstring `:10`.

**Claim:** The file serves as the acceptance test for the README's headline expansion, strong multiplicity one, and functional equation.

**Witness:** `fourierMode_eq` requires λ≥1/4 and only treats ∞; strong multiplicity one fixes N,χ,λ; the functional equation requires χ=1. README §§2.2–2.3, 4.6 and 6.2 promise the other cases as well.

**Repair:** State the all-cusp expansion including κ-shifts and the exceptional branch, cross-level newform multiplicity one, and the character-conjugate functional equation on the real carriers already present. These need only cusp matrices, scalar parameters, the existing integral kernel, and the simple conjugate-reflection map. The test λ=1/5 uses real Bessel order √(1/20), which the present cosine-kernel theorem cannot accept. The N=9 cubic-character functional equation must map to χ̄ rather than disappear. Inventory the remaining headlines explicitly, giving a missing carrier for each genuinely unstatable one; broad labels such as “Picard-group layer” are not that inventory.

## R18 (P3) — Delete padding from Suggested.lean

**Location:** `TauCetiRoadmap/MaassForms/Suggested.lean:164`, `:189`, `:209`, `:253`, `:269`, `:303`, `:307`, `:330`.

**Claim:** These declarations belong among the acceptance theorems.

**Witness:** `not_isRegularCusp_nine` is the README's N=9 rejection Check; `mem_maassCuspSpace` is `Iff.rfl`; the bridge at line 189 is exactly `hF.setIntegral_eq hF' hinv`; line 307 is `Submodule.zero_mem _`.

**Repair:** Delete these Checks, definition restatements, zero/boundary cases and routine API wrappers from `Suggested.lean`; keep their mathematics in the README. Remove associated definitions that no retained headline needs. In particular, do not repair padding by proving it in place. The all-sorry one-tactic probe tried `simp`, `rfl`, and `infer_instance`; none closed a sorried declaration without unfolding. A separate full-file probe replaced the N=9 proof by the single tactic `exact hχ` and elaborated successfully; the other displayed one-step proofs establish further padding. Retain closure proofs only when genuinely needed to build a small native carrier for a retained headline.

## R19 (P3) — Most target locators are not exact enough to verify

**Location:** `TauCetiRoadmap/MaassForms/README.md:516`, `:653`, `:681`, `:765`, `:782`, `:1119`.

**Claim:** The references identify the text supporting each target at its stated generality.

**Witness:** Sections 2.2, 4.2 and 4.4 have no attached theorem/page locator. Section 5.4 names an entire chapter; 5.5 names a paper and an unnamed chapter. The bibliography cannot identify which proof supports the character extensions.

**Repair:** Attach exact theorem/equation and printed-page locators to each claim, distinguish source theorems from adaptations, and specify the version read. For example BLS §1, preprint pp.3–4 supports the old/new definitions, while DIT §5 (5.7)–(5.9) is level one. Do not describe these as a source theorem for unrestricted character/level without supplying the extension. Unreadable texts are listed below rather than guessed.

## R20 (P3) — The definitions lack the required local API and discriminating Checks

**Location:** `TauCetiRoadmap/MaassForms/README.md:373` through `:1010`.

**Claim:** The prose and global worked examples provide the required definition-by-definition specification.

**Witness:** The README contains zero `**Checks.**` blocks, zero layer-ending `### Examples`/`### Dependencies` pairs, and no `## Exact supplier contracts`. The H³ parameter definition has no local constant-function Check, which would expose R07 immediately.

**Repair:** Reshape the document to the requested Summary/Conventions/Exact supplier contracts/How to read the build structure. Give each definition an API list and at least three discriminating local Checks, with each layer's Examples and Dependencies and explicit `*Needs:*` lines. Preserve the useful worked values. Use the counterexamples above as negative controls. Remove process/beyond-pin narration and place ownership deferrals only in Scope and ownership.

## R21 (P3) — The Seymour-Howell arXiv identifier identifies a different paper

**Location:** `TauCetiRoadmap/MaassForms/README.md:1156`: “Seymour-Howell … (arXiv:2204.11761)”.

**Claim:** The cited identifier is the squarefree-level Seymour-Howell paper.

**Witness:** The fetched 2204.11761v2 title page identifies Kieran Child and arbitrary level/character. Seymour-Howell's squarefree-level paper is 2201.08760v2 (seymour-howell lines 5–9).

**Repair:** Cite [Seymour-Howell, arXiv:2201.08760](https://arxiv.org/abs/2201.08760) for the squarefree theory, and [Child, arXiv:2204.11761](https://arxiv.org/abs/2204.11761) separately where its general-level certification theorem is actually used. Checking the corrected identifier returns the named author and title. The LMFDB source knowl lists multiple works; it does not identify them as one paper.

## R22 (P3) — Certificate records are outside the requested mathematical deliverable

**Location:** `TauCetiRoadmap/MaassForms/Suggested.lean:720` and `TauCetiRoadmap/MaassForms/README.md:990`.

**Claim:** A data record containing interval centres, error widths, stored parity and coefficient bounds belongs in the roadmap acceptance file.

**Witness:** `Certificate`, `CertifiesNewform`, and `CertifiesCount` are data/certificate packaging and have no retained theorem using them. The nontrivial residual theorem at line 755 uses the mathematical functions directly.

**Repair:** Delete this certificate packaging from `Suggested.lean` and remove it as a construction target under the brief's no-certificates rule. Retain the general residual and quantitative spectral-isolation theorems, with R08/R14's hypotheses, and discuss database semantics only as motivation. The spectral theorem remains statable after the three declarations are removed.

## Verified sound

Finite examples do not prove universal statements: “passes” means the displayed instance agrees. Source verification and elaboration are recorded separately.

The head matches the brief. The outside-folder diff is empty; the two-file folder has no stray files, sorry-defined data, `set_option` or forbidden imports. The projective quotient correctly removes the ineffective −I action.

**Build and signature evidence.** Direct `lake env lean` elaboration succeeded with only 53 sorry warnings. The targeted Lake build also exited successfully, but emitted the additional Mathlib module-system warning recorded as a failing check by the supplied gate; acceptance is therefore blocked by R12. The gate's other scanners pass. A full scratch copy with `#check @name` for every actual named declaration elaborated successfully. There are 104 declarations, not 106: the worker's loose scanner also treated prose beginning “lemma with” and “theorem),” as declarations. All 104 elaborated signatures were compared with their definitions and README claims. No section binder silently disappeared; the missing explicit positive-level binder at line 514 is R09, and the restricted headline signatures are R17. No reviewed file was edited.

Every one of the 53 sorried declarations was tried on a scratch copy with one of `simp`, `rfl`, or `infer_instance`; none closed by those tactics alone. The separate one-tactic `exact hχ` probe closed `not_isRegularCusp_nine`. Explicit one-step proofs and semantic boundary/API checks identify the remaining padding in R18. This does not claim that every possible single library lemma was exhaustively searched.

Dependency-check output:

```text
depcheck: 204 roadmaps, 1555 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. Every Needs line and supplier contract was read; R10, R11 and R15 survive the mechanical check.

**Headline inventory.**

| README headline | Suggested.lean coverage |
|---|---|
| §§2.2–2.5 Fourier expansion, growth, injectivity, positivity | Infinity/tempered expansion and analytic consequences present; exceptional/all-cusp formulas absent (R17). |
| §3 self-adjoint cusp operator, compact resolvent, basis, discrete spectrum | Finite dimension/local finiteness stated; operator carriers explicitly assigned to suppliers. Infinite-spectrum claim fails for odd χ. |
| §4 Hecke diagonalization, newforms, multiplicity one, bad primes | Fixed-level eigenform/parity/Fricke/bad-prime results present; cross-level multiplicity one absent. |
| §5 Selberg, level-one bound, Weyl | All stated; Weyl false as quantified. |
| §6 Euler product, entire completion, functional equation, Ramanujan consequence, card | All except general-character equation and card stated; card carrier unavailable. |
| §7 Picard spectral, Fourier, Hecke and L-function theory | Whole layer named unavailable, but missing individual headline inventory. |
| §8 spectral localization/isolation | Residual localization present; quantitative isolation under-specified. |

**Pinned-library audit.** Mathlib pin f6090c7095e1e56b3464c1daba5f24631f1290d2 and Tau Ceti pin 358314d4ab97483df4fc4cb8adcc02e74a8d9f5a were searched by objects, not merely proposed names. The following 17 groups of declarations/definitions were opened; paths in this table are relative to the respective pinned library.

| Pinned file and line | Content actually supplied, and relevant limit |
|---|---|
| `Mathlib/MeasureTheory/Group/FundamentalDomain.lean:69` | `IsFundamentalDomain`: null-measurability, almost-everywhere coverage and pairwise almost-disjoint translates. It does not itself assert finite measure. An ineffective nonidentity element violates disjointness on a positive-measure domain. |
| Same file, `:355`, `:407` | `integrableOn_iff`, `setIntegral_eq`; the latter already proves the roadmap's bridge with its action/measure instances. |
| `Mathlib/Analysis/InnerProductSpace/Laplacian.lean:231` | `laplacian_eq_iteratedFDeriv_complexPlane`: the two real second derivatives, before multiplication by −y². |
| `Mathlib/Analysis/InnerProductSpace/JointEigenspace.lean:121` | `iSup_iInf_eq_top_of_commute`: commuting symmetric maps on a finite-dimensional inner-product space. It is not an infinite-dimensional compact-resolvent theorem or directly a theorem about arbitrary normal maps. |
| `Mathlib/Analysis/InnerProductSpace/LinearPMap.lean:241`, `:340` | `IsSelfAdjoint.dense_domain`, `IsSelfAdjoint.isClosed`; closedness uses completeness. Neither is compactness of the cusp restriction. |
| `Mathlib/Analysis/SpecialFunctions/Bessel.lean:55` | `Complex.besselJ`. Searching both pins finds no `Real.besselI`; the imaginary-order growing-mode contract is not supplied here. |
| `Mathlib/Analysis/SpecialFunctions/Gamma/Deligne.lean:45`, `:53` | `Complex.Gammaℝ`, `Complex.Gammaℂ`: π^(−s/2)Γ(s/2), respectively 2(2π)^(−s)Γ(s). |
| `Mathlib/NumberTheory/LSeries/Basic.lean:164`, `:178` | `LSeries`, `LSeriesSummable`: actual series with a special zero-index term; totalized sum is not itself analytic continuation. |
| `Mathlib/NumberTheory/ModularForms/CongruenceSubgroups.lean:79` | `Gamma0`: lower-left entry zero modulo N; at N=0 this means literally zero, not full level. |
| `Mathlib/NumberTheory/DirichletCharacter/Basic.lean:65`, `:219` | `changeLevel`, `changeLevel_one`; the trivial character is preserved without excluding target modulus zero. |
| `TauCeti/NumberTheory/ModularForms/HeckeSlash/Nebentypus/Ring.lean:88`, `:106`, `:114` | `functionCharSpace`, membership and coefficient-function relation: arbitrary functions with the nebentypus slash law, not just holomorphic forms. |
| `TauCeti/NumberTheory/ModularForms/HeckeSlash/Nebentypus/Basic.lean:121` | `twistedHeckeSlashSum`, the finite character-weighted sum. A unitary-normalization adapter is still needed. |
| `TauCeti/NumberTheory/ModularForms/DiamondOperators.lean:344` | `mem_modFormCharSpace_iff_nebentypus`: the modular-form diamond/slash bridge. Its holomorphic carrier does not by itself construct the Maass Hilbert space. |
| `TauCeti/NumberTheory/ModularForms/Fricke/Matrix.lean:69` | `frickeGL` and its matrix/determinant facts: the matrix is [0,−1;N,0]. |
| `TauCeti/Analysis/Complex/Fuchsian/Cusp/Datum.lean:167` | `CuspDatum`: cusp, scaling, positive width and a stabilizer generator, with conjugation law; not character regularity or a Fourier expansion. |
| `TauCeti/Analysis/Complex/Fuchsian/Covolume.lean:101`, `:108` | Fundamental-domain existence for the discrete group, and the associated instance. |
| Same file, `:114` | `Subgroup.IsCofinite` includes discreteness and finite covolume; it is stronger than finite measure of an arbitrary chosen set. |

**Ownership and supplier audit.** `roadmaps grep`/`show`, main, supplied open checkouts and board packages were searched by the mathematical objects. No competing scalar weight-zero Picard spectral library was found. The namespace search returned only this folder; no fully qualified declaration collision was found. Kleinian geometry and weight-two Bianchi differential forms are distinct; this folder can be repaired as an extension. All following paths denote roadmap READMEs.

| Citation resolved | Scope verified |
|---|---|
| `TauCetiRoadmap/AutomorphicFormsOnReductiveGroups/README.md:689`, §4.5 | Maass setup; level-one Fourier/Hecke/parity and factor two. General-character adapters remain distinct. |
| `TauCetiRoadmap/AutomorphicSpectralTheory/README.md:555`, `:583`, `:594`, §§0.26–0.28 | Whittaker functions, Bessel comparison, asymptotics; use exact growing-solution input (R10). |
| Same, `:1281`, §§1.16–1.16a | Weight-k Laplacian, powers, slash invariance, self-adjoint extension already owned (R16). |
| Same, §§1.23,4.8 (`:2402`),4.9 (`:2413`) | Untwisted Eisenstein/spectral expansion and modular Weyl estimates; no stated character-scattering adapter (R11). |
| `TauCetiRoadmap/CongruenceSpectralGap/README.md`, §§0.1–0.2,0.5b–0.6,5.3 (`:834`) | Measure, domains, principal-congruence cusp spectrum, 21/100. Declared upstream gaps respected. |
| Main `TauCetiRoadmap/ModularForms/README.md`, Layers0,3–6,9; `TauCetiRoadmap/FuchsianOrbifolds/README.md`, Layers0–4 | Congruence/Hecke/newform/Fricke algebra and cusp geometry. Character regularity and analytic adapters belong here. |
| Main `TauCetiRoadmap/OperatorTheory/SelfAdjointSpectralTheory/README.md`, Parts C–E; `TauCetiRoadmap/PDE/README.md:322`, Lane E; `Completed/OrthogonalL2Bases/README.md`, B2 | Spectral calculus, elliptic regularity, Hilbert-basis transport; not quantitative coefficient isolation. |
| `TauCetiRoadmap/LFunctions/README.md:347`, `:371`, L0 | Agreement required on Re(s)>1 (R15). |
| `TauCetiRoadmap/AutomorphicLFunctionsAndLocalFactors/README.md:816`, `:1795`, AL0.5.1,AL2.6.1–2 | Archimedean comparison and level-one Maass L-functions already owned. |
| `TauCetiRoadmap/MetaplecticAutomorphicForms/README.md:1853`, `:2218`, §§7.2,7.32 | Half-weight and bi-level carriers, excluded here. |
| `TauCetiRoadmap/KleinianGroups/README.md:227`, `:316`, `:339`, Layers0,3,4 | H³, Bianchi groups, covolumes; §7.2's covolume citation should include Layer4. |
| Open `TauCetiRoadmap/BianchiModularForms/README.md`, `TauCetiRoadmap/AutomorphicSpectralTheoryPartII/README.md` | Weight-two harmonic forms and trace extensions, respectively; neither supplies the scalar Picard theorems. |

**Adversarial table: acceptance headlines and finding witnesses.** Names are relative to `TauCetiRoadmap.MaassForms`; V=π/3. The table retains the headline and defect evidence from the declaration audit. Local-mode tests check normalization, not existence of global forms; normalized-form tests assume the stated newform hypotheses. Boundary tests do not establish nonvacuity.

| Statement / line | Instances and computed values on the two sides | Result / change |
|---|---|---|
| `hyperbolicLaplacian`, 58 | f=1,y,y²: Δf=0,0,−2y²; opposite sign gives +2y². | Correct sign; ownership R16. |
| `automorphicSpace`, 84 | At odd χ its only value is f=0; at trivial χ it contains 1 and i, with 1+i unchanged by γ. | Duplicate carrier R16. |
| `not_isRegularCusp_nine`, 164 | w=1, multiplier χ(4); conclusion is exactly χ(4)≠1. | `exact hχ` succeeds; delete padding R18. |
| `setIntegral_normSq_eq_of_isFundamentalDomain`, 189 | f=1,N=1, translated domains: both integrals V. | Exact library wrapper; R18. |
| `mem_maassCuspSpace`, 303 | Same predicate on both sides, for 0 true↔true, for 1 at λ=0 false↔false. | `Iff.rfl`; R18. |
| `fourierMode_eq`, 354 | Kernel asymptotic 2√y K_ir(2πny)∼n⁻¹/²exp(−2πny); coefficient limit multiplies by √n, yielding 1. | Tempered formula consistent; missing branches R17. |
| `hasSum_fourierMode`, 363 | For local exp(−2πy)e(x), only n=1 survives, sum equals exp(−2πy)e(x); zero sum gives 0. | Fourier convention passes. |
| `fourierCoefficient_le`, 369 | n=0: 0≤C·0; normalized n=1: 1≤C; scaling f↦2f requires C↦2C. | Quantifiers permit the required dependence. |
| `fourierCoefficient_injective`, 375 | Opposite coefficients for f,−f can agree only if all a(n)=0; Fourier sum then gives f=−f=0. | Nonzero modes suffice in cusp space. |
| `finiteDimensional_maassCuspSpace`, 392 | Odd χ: finrank 0; hypothetical m-dimensional eigenspace contributes m, including m=2. | Does not assert simple spectrum. |
| `cuspidalSpectrum_finite`, 398 | T=0 gives empty set from positivity; odd χ gives empty set for all T. | Correct local finiteness boundary. |
| `heckeOperator_mul`, 432 | N=1,f=1,m=n=2: T₂²=9/2; T₄+T₁=7/2+1=9/2. | Pass. |
| `petersson_heckeOperator`, 440 | χ(n)=i,a(n)=1+i, norm²1: left 1+i; right i·(1−i)=1+i. | Conjugate placement correct. |
| `oldSpace_le_maassCuspSpace`, 514 | N=0, nonzero level-one f: each modular tile has norm²v>0; total ∑v=∞. Left membership true, right false. | False; R09. |
| `IsNewform.eq_of_eventually_eq`, 559 | f=g: all prime differences 0; scaling g=2f is rejected by a_g(1)=2. | Correct restricted statement; cross-level version absent R17. |
| `IsNewform.fourierCoefficient_sq_of_dvd`, 566 | p=2,η=±1: (∓1/√2)²=1/2; p=3 gives 1/3. | Trivial-character bad-prime normalization. |
| `IsNewform.fourierCoefficient_eq_zero_of_sq_dvd`, 572 | p²∣N,χ=1: a_p=0; recurrence at this bad prime gives a_p²=0. | Local Euler factor becomes 1. |
| `IsNewform.fourierCoefficient_prime_level`, 593 | p=2,sign−1: +0.70710678; p=19,sign−1: +0.22941573. | Minus sign passes. |
| `selberg_three_sixteenths`, 610 | Supplier bound 21/100=84/400 exceeds 3/16=75/400; exceptional t≤1/5<1/4. | Numerical implication correct. |
| `SelbergEigenvalueConjecture`, 616 | A nonzero space at λ=1/5 would give false 1/4≤1/5; odd χ gives true vacuously. | Correct as a conjecture predicate. |
| `levelOne_eigenvalue_ge`, 621 | Strip y≥√3/2 gives y²≥3/4; Parseval 4π² times 3/4 divided by cover multiplicity 2 gives 3π²/2. | Route constant 14.8044, not 1/4. |
| `weyl_law`, 634 | N=3,odd χ: cuspCount/T=0, claimed limit index/12=1/3. N=1 expected 1/12. | False; R01. |
| `lfunction_summable`, 645 | Re s=2: majorant Cn⁻³/² sums; Re s=3/2 would give harmonic C/n and is excluded. | Correct sufficient range. |
| `lfunction_eulerProduct`, 652 | At p, expansion (1−aX+χX²)⁻¹=1+aX+(a²−χ)X²+…; χ=0 gives 1+aX+a²X². | Matches both Hecke recurrences. |
| `completedLFunction_eq`, 678 | λ=1/4,δ=0: ir=0 and gamma product Γℝ(s)²; λ=1/5 cannot instantiate hlam. | Restricted equality, missing branch R17. |
| `differentiable_completedLFunction`, 686 | f=0 gives zero extension (though not a newform); a normalized newform forces a₁=1, excluding that trivial test as a proof. | Entireness is substantive, not contained in premise. |
| `completedLFunction_functional_equation`, 693 | ε=+1,δ=1,s=1/2: Λ=−Λ forces Λ=0; δ=0 gives Λ=Λ. | Trivial-character sign correct; general χ missing. |
| `norm_fourierCoefficient_le_card_divisors`, 705 | a_p=2,χ=1: a(p²)=3 reaches τ(p²)=3; χ=i,a_p=1+i: a(p²)=i, norm1≤3; n=1 gives 1≤1. | Good-prime tests pass; bad-prime input needed. |
| `Certificate`, 720 | Data allow ε=−1,δ=2,M=0; empty coefficient index set then imposes zero coefficient inequalities. | Data alone prove nothing; remove packaging R22. |
| `CertifiesNewform`, 739 | ε=−1 makes existence false; an interval with two distinct newforms makes ∃! false; M=0 makes coefficient clause true. | Semantics not a certification theorem; R22. |
| `CertifiesCount`, 749 | Odd χ gives cuspCount=0, so k=0 true and k=1 false; R and −R give same threshold 1/4+R². | Definition restatement/packaging R22. |
| `exists_eigenvalue_near`, 755 | A=diag(1,2),g=(1,0),λ₀=1.1,η=.1: residual²=.01=η²norm², nearest distance .1. g=0 excluded explicitly. | Spectral inequality correctly quantified in Lean. |

**Adversarial table: README constructions, all sampled targets and examples.** These rows retain the prose formulas, proof-route tests and headline cases, including every sampled target.

| README statement | Instances and computed values | Result / change |
|---|---|---|
| Conventions, weight conversion | k=0 gives shift 0; k=1/2 gives k(k−2)/4=−3/16. The weight-zero conversion retains λ. | Keep weight-specific laws separate. |
| §0.2 H² measure/invariance | Dilation (x,y)↦(2x,2y): dxdy multiplies by 4, y⁻² by 1/4; product unchanged. | Pass. |
| §0.4 widths/regularity | N=4 widths at 0,1/2,∞ are 4,1,1; N=9 cubic χ gives multiplier ζ₃ at 1/3. | Both regular and irregular branches exercised. |
| §0.5 projective Petersson rescaling | N=1,…,7: projective Γ₀/Γ₁ indices 1,1,1,1,2,1,3; at N=5 the pullback norm² is twice the original. | Correct effective index, not φ(N) unconditionally. |
| §1.2 exceptional dictionary | λ=1/5: t=√(1/20), 1/4−t²=1/5; real sqrt(λ−1/4)=0. | Use real t or imaginary r, not the totalized real sqrt. |
| §2.1 K integral and symmetry | ν=±1/2,u=1: K=√(π/2)e⁻¹≈0.4610685044 on both orders. | dlmf §§10.27,10.39 support this. |
| §2.1 K differential equation | h(u)=u⁻¹/²e⁻ᵘ: u²h″+uh′−(u²+1/4)h=0. | Half-order normalization passes. |
| §2.1 small-u and large-u laws | r=0,u=e⁻ᵐ: K₀(u)≥e⁻¹arcosh(eᵐ)→∞; for large u, √u eᵘKν(u)→√(π/2). | Small-u claim false R04; large-u law sound. |
| §2.1 numerical Checks | Simpson quadrature with 50,000 and 100,000 panels: K₀(1)=.4210244382407084; K_iR(2π)=6.82794275895e−8; K_iR(4π)=3.18474057880e−8. Mellin at ν=1.3i,s=2.5 gives .7260365301067159 by the integral, .7260365301067155 by gamma integrals. | Agreement at displayed precision; numerical test, not an interval proof. |
| §2.1 Mellin law | μ=2,ν=0: ∫uK₀(u)du=Γ(1)²=1. μ=2,ν=i gives Γ(1+i/2)Γ(1−i/2). | Hypothesis Re μ>abs(Re ν) matters. |
| §2.2 shifted modes and ODE | κ=1/3,w=1,g=e(x/3)e^(−2πy/3): gν=e^(−2πy/3); −y²gν″+(2π/3)²y²gν=0. | Shift and sign correct; growing-solution supplier R10. |
| §2.2 zero-mode repeated root | g=√y and √y log y both satisfy −y²g″=(1/4)g; at λ=0 the independent modes are 1,y. | Repeated root retained. |
| §2.3 exclusion of I and coefficient limit | Mode α√yK with α=1 has limit coefficient 1/2, not 1. Squared growing e^(cy) gives divergent ∫e^(2cy)y⁻²dy; decaying e^(−cy) gives finite integral. Raw B₄ multiplies coefficient by 2. | Exclusion sound; dilation R03. |
| §2.4 all-cusp decay | κ=1/3,w=1: actual mode envelope e^(−2πy/3); divided by claimed e^(−2πy) gives e^(4πy/3)→∞. | Correct exponent uses distance of shifted lattice from zero, R13. |
| §2.4 zero-mode integrability | √y gives log Y; √y log y gives (log Y)³/3; constant gives ∫₁∞y⁻²dy=1. | R02; also checks λ=0 endpoint. |
| §2.5 Green identity | Constant 1: eigenvalue and energy 0; compactly supported nonconstant f: energy ∫abs(∇f)²>0. | Cusp condition excludes the zero-energy constant. |
| §3.1 diamond projection | Cubic character projector on a trivial vector is (1+ζ₃+ζ₃²)/3=0; trivial projector returns 1. | Character-isotypic convention consistent. |
| §3.2 restricted kernel | On constants, Δ=0; χ(d)=ζ₃≠1 gives c=ζ₃c, hence c=0. | Kernel distinction correct. |
| §3.3 representative/eigenvector equivalence | Constant 1 has weak and classical Δ=0; norm² V>0. Zero representative has L² class 0. | Smoothness plus continuity identifies representatives; no extra eigenvalues from null changes. |
| §3.4 compact restriction and spectrum | Restriction to zero space has compact resolvent, empty spectrum and empty Hilbert basis; it does not have λ₁,λ₂,… . | R01: compactness does not imply infinite spectrum for odd χ. |
| §3.5 orthogonality/incomplete Eisenstein | λ=1,μ=2 gives (1−2)⟨f,g⟩=0, hence inner product 0; an unweighted Eisenstein sum has trivial automorphy, not χ(d)=i. | Orthogonality sound; character complement R11. |
| §4.2 simultaneous diagonalization | On ℂ², A=diag(1,2),B=diag(3,4): AB=BA=diag(3,8); A+iB has eigenvalues 1+3i,2+4i, not real. | Splitting normal maps into commuting symmetric parts is necessary and supplied. |
| §4.3 parity splitting | P±=(1±R)/2 gives P±²=P± and P+P−=0 from R²=1; cosine and sine have eigenvalues +1,−1. | Correct; reflection is not coefficient conjugation. |
| §4.4 exact-divisor involutions | Q=R=2 gives QR/gcd(Q,R)²=1; W₂²=[−2,0;0,−2] acts identically. For χ(a)=i,χ(d)=−1,χ(n)=−i: χ(n)χ̄(d)=i. | Fricke character intertwining factor passes. |
| §4.5 old/new norm | M=1,N=2,d=2: index 3, so raw dilation has norm² 3‖f‖²; coefficient at 2 is √2a(1), coefficient at 1 is 0. | Norm formula consistent; coefficient formula R03; zero-level signature R09. |
| §4.6 general-character bad primes | Primitive local χ gives abs a_p=1; unramified Steinberg branch gives abs a_p=p⁻¹/²; higher-power imprimitive branch gives 0. For p=2 these are 1,0.70710678,0. | Distinct Euler-factor degrees; source transcription remains uncertified below. |
| §4.7 conjugate form | Original a(1)=1+i,a(−1)=−1−i: conjugation gives a′(1)=−1+i; conjugation after reflection gives 1−i. | The reflection in the normalized dual is necessary. |
| §5.3 Selberg conversion | s=3/4 gives s(1−s)=3/16; 1/4−21/100=1/25. | Claimed weakening of supplier bound correct. |
| §5.4 level-one strip argument | y²≥3/4; first nonzero Fourier frequency contributes 4π²; strip lies in two modular-domain translates: lower bound 3π²/2≈14.80440660. | Computed route constant, not a source certification. |
| §5.5 scattering and Weyl | N=9 cusp1/3 with χ(4)=ζ₃ has no frequency0; N=3 odd χ gives count0 versus Weyl constant1/3. | Regular-cusp indexing R11; Weyl R01. |
| §6.1 local Euler factors | χ(p)=1: quadratic denominator; χ(p)=0: linear; a_p=χ(p)=0: factor1. Coefficient of X² is a_p²−χ(p). | Covers good, Steinberg and degree-zero cases. |
| §6.2 Mellin/FE | δ=1,ε_N=1 gives root−1 and central value0; δ=0,ε_N=1 gives root+1. N=4 contributes 4^(s/2)=2^s. | Signs/conductor agree for trivial character. |
| §6.3 Ramanujan equivalence and conductor | Without the adjoint relation, χ=1,a=2i has abs a=2 but roots i(1±√2), norms 2.4142 and .4142. N=1,δ=r=0,s=1/2 gives conductor (3.5)²=12.25. | README correctly retains the adjoint relation; conjecture is not assumed proved. |
| §6.4 data contract | At Re s=5/4 the crude majorant is Cn⁻³/⁴ (divergent); a mean-square bound ∑_{n≤X}abs a_n²=O(X) gives dyadic contribution O(2^(−k/4)). | Stronger unconditional input supplies the missing strip, R15. |
| §7.1 H³ Laplacian and energy | Δ₃1=0,Δ₃y=y,Δ₃y²=0,Δ₃y³=−3y³; integration by parts against y⁻³ leaves gradient density y⁻¹. | Correct dimension/sign. |
| §7.2 Picard carrier and parameter | Constant1 has λ=0 and finite norm² G/3≈.3053218647, but real sqrt(λ−1)=0 gives 1+r²=1. Cusp tail volume ∫Y∞y⁻³dy=1/(2Y²). | Finite volume sound; spectral dictionary R07. |
| §7.3 Fourier–Bessel | n=i,x=u+iv gives Re(nx)=−v; dual mode uses +v. Substitution g=yh(cy) leaves order²=1−λ. At λ=1, zero modes y,y log y have divergent L² integrals log Y,(log Y)³/3. | Correct pairing/ODE; exceptional branch must be added. |
| §7.4 rotation/conjugation | n=1: T₁=1,T_i=R; R-odd eigenvalue −1 versus R T₁ R=+1. For n↦−n, rotation in Γ gives unchanged coefficients. | R05. |
| §7.5 Picard Mellin and norm indices | μ=2s,c=2πabs n gives shifts ±ir/2 and norm abs n². At s=r=1: gamma products .6825694503 versus .2720290550. Four unit generators contribute 4 equal terms on R-even forms. | R06; conductor16 does not repair wrong shifts. |
| §8.1 spectral invariant dictionary | R=0 gives λ=1/4; R=1 gives 5/4; exceptional t=1/5 gives λ=21/100, not a real-R datum. | Threshold/exceptional distinction required. |
| §8.2 labels and multiplicity | One eigenspace of dimension2 contributes count2; two normalized newforms with the same λ falsify the proposed simple-spectrum predicate. An oldspace of dimension2 alone does not. | No claim that label ordering proves multiplicity one. |
| §8.3 residual existence | g=0,λ₀=−1,η=0: residual inequality 0≤0 but required nonnegative eigenvalue at distance0 does not exist. | README R08; Lean excludes zero. |
| §8.3 projection/coefficient control | A=diag(1,2),g=(1,1),I=[1,2]: ‖P_Ig‖=‖g‖=√2, θ=0; Ag=(1,2) is not scalar g. | Isolation/rank1 needed, R14. |
| Worked examples: first odd/even forms | R=9.5336952613535577 gives λ=91.1413453364; R=13.779751351890739 gives 190.1315473199. (−1.06833355)²−1=.1413365741; product with −.45619735=.4873709344; 1.54930448²−1=1.4003443717. | Rounded arithmetic agrees; provenance limitations below. |
| Worked examples: levels2,26,19 | R=5.4173348068446783 gives λ=29.5975164095; R=1.3769460644538554 gives 2.1459804644. At bad p=2: a₂=±1/√2,a₄=1/2,a₈=±1/(2√2). At p=19: 1/√19=.2294157339. | Signs/powers agree to displayed precision. |
| Worked examples: indices/cusps | For N=1,2,3,4,5,6,9,11,19,23,26,101,105, N∏(1+1/p)=1,3,4,6,6,12,12,12,20,24,42,102,192; divisor-totient cusp sum gives 1,2,2,3,2,4,4,2,2,2,4,2,8. | Both displayed lists agree. |
| Worked examples: Γ₀(12) widths | At c=1,2,3,4,6,0, formula 12/gcd(c²,12) gives 12,3,4,3,1,1. | All six agree. |
| Worked rejection tests | Constant has cusp integral N; B₂f has a₁=0; odd-character −I gives 2f=0; holomorphic weight k has nonconstant phase (cz+d)^k/abs(cz+d)^k after y^(k/2) rescaling. | Distinguishing tests pass; Eisenstein zero-mode rejection contradicts R02. |

**Seeded source audit (all 15 targets).** No locator was marked unverified. Texts were fetched through the sources service. Lines below refer to those named versions; special cases do not certify generalizations.

| Target | Text opened; scope of verification |
|---|---|
| 2.2 | dlmf line 62, §10.25 equation; line 345, §10.32 integral. The substitution was recomputed above. Iwaniec/Bump general-cusp locator unavailable. |
| 2.3 | duke-imamoglu-toth line 483, author preprint p.12, (5.7): level-one factor two. booker-lee-strombergsson line 135, arXiv:1803.06016v2 p.3: general even character, different coefficient normalization. R03 still fails. |
| 3.4 | Supplier compact restriction checked; lmfdb line 90, mwf.dimension, is terminology, not a compact-resolvent theorem. General textbook locators unverified. |
| 4.2 | booker-lee-strombergsson lines 142–161, p.3, Hecke normalization; pinned joint-eigenspace theorem checked. Exact adjoint theorem locator absent. |
| 4.3 | duke-imamoglu-toth lines 487–490, p.12, parity for level one. General-character reflection recomputed above. |
| 4.4 | Native Fricke matrix checked; Atkin–Li published theorem text unavailable. No exact nonholomorphic involution locator supplied. |
| 4.5 | booker-lee-strombergsson lines 168–187, p.4, positive-level dilation, orthogonal newspace, normalized eigenbasis. This directly confirms the raw-dilation convention used to refute the coefficient formula. |
| 5.4 | Strip proof constant recomputed; cited Roelcke/Iwaniec text unavailable. duke-imamoglu-toth lines 508–513 confirms only level-one Weyl data and the listed five approximate eigenvalues/parities. |
| 5.5 | Huxley text unavailable; supplier is untwisted. No certification of character scattering; R01/R11. |
| 6.1 | duke-imamoglu-toth lines 490–499, p.12, (5.8)–(5.9), supports level-one Euler product/entire completion. General-level sources unavailable. |
| 6.3 | Satake quadratic and adjoint-relation test recomputed. Iwaniec–Kowalski §5.1/(5.7) is absent from the available Chapter-11 excerpt. |
| 7.3 | lmfdb line 91, picard.fourierexpansion, confirms kernel and pairing, but mishandles zero mode. EGM text unavailable; differential substitution recomputed. |
| 7.5 | dlmf line 730, §10.43.19, Mellin formula with Re μ>abs(Re ν); substituted μ=2s,ν=ir. Refutes gamma shifts; does not independently certify the full Picard functional equation. |
| 8.1 | lmfdb lines 90–97, spectral_index: formula and threshold verified, real/imaginary descriptions reversed. Several column/form pages inaccessible. |
| 8.3 | booker-strombergsson-venkatesh lines 370–398, Proposition 1/remarks, p.9: level-one existence, explicitly no uniqueness guarantee. seymour-howell lines 188–233, arXiv:2201.08760v2 pp.3–4: isolation and normalization inputs are required. |

Additional source checks: dlmf §10.27 line 110 (order symmetry), §10.39 line 83 (half-order value), §10.30 line 137 (K₀ logarithm); humphries lines 65–74, arXiv:1502.06885v3 Theorem 1.1, p.2 (non-squarefree new-spectrum multiplicity); seymour-howell lines 236–239 (squarefree trivial-character bad primes). Published pagination of the author preprints was not presumed identical. The wrong Seymour-Howell arXiv identifier resolves to Child's paper, whose title/author are at lines 5–9 of that extraction.

## Not verifiable

Unverified texts and attempts are recorded below and in the consolidated missing-reference file; the verdict is not waiting on them.

- Iwaniec, *Spectral Methods*, and *Topics*; Bump; Selberg: sources-service bibliographic/publisher searches yielded landing pages rather than the cited chapters.
- Iwaniec–Kowalski: author-hosted Chapter 11 is readable, but not the cited §5.1 or Chapter 15.
- Atkin–Lehner 1970 and Maass 1949: EuDML/GDZ catalogue/viewer pages did not yield readable paper text.
- Booker–Strömbergsson–Then 2013: publisher landing page, author-host SSL failure, and rejected CORE redirect; the claimed bounds were not certified from that paper.
- Huxley: bibliographic search found no readable full text.
- Atkin–Li 1978; Elstrodt–Grunewald–Mennicke; Hejhal II; Roelcke's 1953/55, 1966 and 1967 works: service returned paywalled/uncertified results. Their published locators remain uncertified; no paywall was bypassed.
- LMFDB Fourier-expansion/rigor knowls and the first-form page returned reCAPTCHA; the spectral-parameter column URL returned 404. Database row provenance and stored error radii were not independently certified. Displayed coefficient/eigenvalue arithmetic was recomputed, not treated as evidence of the existence or uniqueness of those database rows.
- The cited GitHub implementation filenames are not mathematical theorem sources. No claim that their code proves a headline was accepted.

## Source issues

- **Error** in lmfdb at `mf.maass.spectral_index`, lines 95–97, unpaginated: the source says standard parameters are imaginary and exceptional parameters real; it should be standard parameters real and exceptional parameters imaginary for λ=1/4+R²; affects a stated result.
- **Error** in lmfdb at `mf.maass.mwf.dimension`, lines 90–94, unpaginated: the source says the eigenspace consists of newforms while listing oldspaces as a multiplicity cause; it should distinguish the full cuspidal eigenspace from its new subspace; affects a stated result.
- **Misprint** in lmfdb at `mf.maass.picard.fourierexpansion`, line 91, unpaginated: the source says sum the Bessel expression over all Gaussian integers; it should sum over nonzero indices and add the general zero mode separately; affects a stated result.
