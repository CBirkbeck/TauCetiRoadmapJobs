# Review of SiegelModularForms (pull request #1714 at 788fba7)

**Verdict:** needs changes

## R01 (P1) — Theta-span membership does not characterize a standard L-function pole

**Location:** `TauCetiRoadmap/SiegelModularForms/README.md:2127`, also 2177 and 2195: “the pole at `s = 1` occurs exactly when `F` lies in the span”.

**Claim:** The converse is false, so the standard cards can acquire nonexistent poles.

**Witness:** In genus one, Δ=(Θ_{E₈³}−Θ_Leech)/720 belongs to the rank-24 theta span. Its standard L-function is the normalized symmetric-square L-function, entire; its pole order at 1 is 0, not 1.

**Repair:** Retain the source's sufficient holomorphy statement outside the theta span. State and prove the actual residue/nonvanishing criterion before assigning exact polar divisors in 8.4–8.5. Do not replace the residue criterion by span membership. `ThetaSeries` 8C–8D supplies the displayed identity. Gelbart–Jacquet Theorem 9.3, printed p.534 (`gelbartjacquet1978 line 2151`) supplies entirety: Δ has no nontrivial self-twist, since it is unramified at every finite prime. The repaired criterion must assign Δ no pole. `vdg line 1771` states only the sufficient direction, not the converse added here.

## R02 (P1) — Two lost signs make the displayed χ₁₉ nonmodular

**Location:** `TauCetiRoadmap/SiegelModularForms/README.md:1683`: “`θ' := (θ₁₀₀₀¹² + θ₁₀₀₁¹² + θ₁₁₀₀¹² + θ₁₁₁₁¹²)/1536`”.

**Claim:** The second and third terms must have minus signs.

**Witness:** At τ=i[[1.2,.2],[.2,1.5]], the displayed χ₁₉ is −4.32174807584·10⁻¹⁴; after τ↦τ+diag(0,1), it is +4.29942764851·10⁻¹⁴. This translation belongs to Γ₀(2), with automorphy factor 1.

**Repair:** Use signs (+,−,−,+), as in Ibukiyama's Appendix, printed p.34 (`ibukiyama1991 line 593`; the printed page was inspected). With that correction, both values are −1.08445355170·10⁻¹⁴ in the roadmap's normalization. Add this translation test. The Gaussian sums over −7≤n,m≤7 have negligible tails relative to the discrepancy; Im τ has eigenvalues 1.1 and 1.6. The weight count alone cannot detect the error.

## R03 (P1) — The diagonal Taylor sequence has the wrong kernel

**Location:** `TauCetiRoadmap/SiegelModularForms/README.md:1477`: “`0 → χ₁₀ M_{k−10}(Γ₂) → M_k^{≥2n}(Γ₂) → Sym²(M_{k+2n}^{≥n}(Γ₁))`”.

**Claim:** The first term is independent of n, although this is the coefficient of z^{2n}.

**Witness:** Set k=10,n=1. χ₁₀ belongs to the claimed kernel but its z² coefficient is nonzero, by 6.1. Thus its image is nonzero, whereas exactness requires zero.

**Repair:** Use `0 → M_k^{≥2n+2} → M_k^{≥2n} → Sym²(M_{k+2n}^{≥n}) → 0` for even k, n≥0. This is the source's sequence (`vdg line 875`, Theorem 9.1 proof, p.19). For k=10,n=1 the kernel is zero and χ₁₀ maps nontrivially. Identify multiplication by χ₁₀ with the appropriate filtered subspace only after proving the divisor statement.

## R04 (P1) — Containing a congruence group is insufficient for arithmeticity

**Location:** `TauCetiRoadmap/SiegelModularForms/README.md:562`: “every subgroup containing some `Γ_g(N)` is arithmetic”.

**Claim:** The declared ambient group is Sp₂g(ℝ), not Γ_g.

**Witness:** Γ=Sp₂(ℝ) contains Γ₁(1)=SL₂(ℤ). Their intersection is SL₂(ℤ), with infinite index in Γ; hence the defined commensurability predicate is false.

**Repair:** State the congruence implication for `Γ_g(N) ≤ Γ ≤ Γ_g`, N≥1, or explicitly require finite index over the intersection. The full real group then fails the hypotheses; Γ₀(2) passes and has the stated finite index. Keep arbitrary arithmetic subgroups as a separate class.

## R05 (P1) — A Gaussian with arbitrary Y is not a Fourier eigenfunction

**Location:** `TauCetiRoadmap/SiegelModularForms/README.md:1289`: “`P(X) exp(−π tr(XᵀX Y))` an eigenfunction of the Fourier transform”.

**Claim:** Fourier transformation changes Y to Y⁻¹; it does not preserve this function up to a scalar for arbitrary positive Y.

**Witness:** Take m=g=1,P=1,Y=2. The transform is 2⁻¹/² exp(−πξ²/2). Its ratio to exp(−2πξ²) is .7071067812 at ξ=0 and 78.71355604 at ξ=1.

**Repair:** State the Gaussian Fourier-transform identity with the inverse covariance, determinant factor and transformed polynomial. Reserve “eigenfunction” for the normalized Y=I case with the appropriate harmonic degree. The corrected identity gives exactly the two displayed ratios and supports the desired Poisson argument.

## R06 (P1) — Odd-weight cancellation is not defined on the quotient being summed

**Location:** `TauCetiRoadmap/SiegelModularForms/README.md:1058`, repeated at 1067: “for odd `k` the sum is `0` since `(C, D)` and `(−C, −D)` both occur”.

**Claim:** These pairs represent the same GL_g(ℤ)-orbit. Odd weight makes the summand dependent on the representative.

**Witness:** For g=2,k=5, the identity coset has representatives (0,I₂) and (0,diag(−1,1)). Their summands are 1 and −1. Also det(−I₂)=1, so the proposed negation does not change sign.

**Repair:** Keep the quotient definition restricted to even k and replace the odd-weight Check by this failure of representative independence. If an oriented sum is introduced, define its distinct indexing set before discussing cancellation. The existing even-weight Lean definition is unaffected: at k=4 both representatives give 1.

## R07 (P1) — Two pinned supplier claims exceed the declarations' hypotheses

**Location:** `TauCetiRoadmap/SiegelModularForms/README.md:261` and 266; application at 455: “give the generators of `Γ_g`” and “`Mᵀ J M = d J ⟹ det M = d^g`”.

**Claim:** The cited generation theorem is over fields; the cited multiplier theorem is rank two only.

**Witness:** `TauCeti/LinearAlgebra/Matrix/GeneralLinearGroup/Symplectic/TorusGeneration.lean:140` requires `[Field K]`. `TauCeti/LinearAlgebra/Matrix/SymplecticMultiplier.lean:58` requires `[Unique l]`; line86 concludes det A=d. Neither specializes to the asserted general integral/rank-2g input.

**Repair:** Restrict these supplier citations to their actual domains. Give the integral symplectic-generation input an explicit owned target or a verified earlier supplier, and prove the general determinant formula in 0.2 by a valid general-rank argument. For g=2, M=diag(I₂,2I₂) has multiplier 2 and determinant 4; the singleton-index theorem cannot be applied. A `[Field ℤ]` instance cannot repair the generation claim. This affects the generator-based routes in 4.2 and 5.2, not just bibliography wording.

## R08 (P1) — The coefficient-field proof still forms an internal dependency cycle

**Location:** `TauCetiRoadmap/SiegelModularForms/README.md:1981` and 2821: “11.2 supplies the rational structure”; 11.2's Needs includes “7.6”.

**Claim:** The number-field conclusion in 7.6 consumes the rational structure built in 11.2, while the latter depends on the whole 7.6 block.

**Witness:** The edges are 7.6→11.2→7.6. The roadmap-level dependency checker does not inspect this internal cycle. Weight-zero eigenvalues 15/8 and 40/27 need only a rational Hecke module, not the number-field conclusion as input.

**Repair:** Split 7.6's eigenform examples from its field assertion. Move the latter entirely to 11.2, or move rational structures before it; state the individual needs. Then the weight-zero calculation follows from the rational action without feeding its conclusion back into that action.

## R09 (P2) — The prose eigenform definition still admits zero

**Location:** `TauCetiRoadmap/SiegelModularForms/README.md:1843`: “`IsHeckeEigenform f := ∀ T, ∃ λ, T f = λ f`”.

**Claim:** This does not determine an eigenvalue character and disagrees with `Suggested.lean:1210`.

**Witness:** For f=0, both λ=0 and λ=1 satisfy every displayed eigenvector equation. The Lean predicate explicitly requires f≠0.

**Repair:** Add f≠0 in the prose and all interfaces extracting eigenvalues. Zero then fails; ψ₄ still passes with λ(T(2))=45. Previous R28 remains open.

## R10 (P2) — Odd character weights are excluded solely by database coverage

**Location:** `TauCetiRoadmap/SiegelModularForms/README.md:1728`: “The odd-weight part … is not recorded by the LMFDB and is not a target here.”

**Claim:** This violates the general-library requirement; the cited source supplies that part too.

**Witness:** Hayashida–Ibukiyama Theorem 1.1, p.493 (`hayashidaibukiyama2005 line 288`), gives ℂ[f₁,g₂,X,f₃] for character ψ^k. Its weight-one part contains f₁(2τ), constant coefficient 1.

**Repair:** Include the odd-weight ψ₄ spaces with their ring/module statement, API and discriminating Checks. At weight one the dimension is 1; retain the separate even-character module, whose first nonzero weight is 12. Previous R24 remains open.

## R11 (P2) — Statable headline theorems are still absent

**Location:** `TauCetiRoadmap/SiegelModularForms/README.md:865`; `TauCetiRoadmap/SiegelModularForms/Suggested.lean:21` and 1220.

**Claim:** Scalar singularity iff 2k<g is absent, although forms, Fourier coefficients and determinants are defined. The eigenbasis headline is only scalar despite the available vector-valued carrier.

**Witness:** `SiegelModularForm`, `HalfIntegral`, `fourierCoeff`, `Weight` and `cuspSubmodule` are present. Genus 8 versus 9 for Θ_E₈ distinguishes singularity: maximal nonzero coefficient ranks are respectively 8 and 8, against genera 8 and 9.

**Repair:** Add a simple singularity predicate and the scalar theorem with positive genus and nonzero-form hypotheses. State the vector-valued eigenbasis result on the existing carrier with its precise weight/exponent assumptions. Audit the degree-one comparison promised at README 705 as well; “specified in this README only” is not a missing-carrier explanation. Do not put substitutes in their place. Previous R25 remains open.

## R12 (P2) — Arakawa does not supply the claimed unrestricted vector spinor theorem

**Location:** `TauCetiRoadmap/SiegelModularForms/README.md:2100`: “Arakawa 1983 for `j > 0`”.

**Claim:** The cited theorem assumes a_F(I₂)≠0; the roadmap does not, and its added Mellin route does not state how that restriction is removed.

**Witness:** `arakawa1983 line 92`, introductory theorem, printed p.158, explicitly requires that coefficient to be nonzero. At a_F(I₂)=0 the source theorem cannot be invoked.

**Repair:** Identify an exact stronger primary theorem and the owned input removing this restriction. Separately describe Arakawa's actual result. Keep the intended general theorem, with an applicability Check distinguishing a_F(I₂)=0 from a_F(I₂)≠0. Previous R26 is only partly repaired by naming a proof route.

## R13 (P2) — Positive level and existence of a congruence level need explicit guards

**Location:** `TauCetiRoadmap/SiegelModularForms/README.md:559` and 2762: “`Γ_g(N)` normal of finite index”; “the least `N` with `Γ_g(N) ≤ Γ`”.

**Claim:** The first assertion includes N=0. The second is asserted for all arithmetic groups, including noncongruence subgroups in genus one.

**Witness:** ZMod 0=ℤ, so Γ₁(0)={1}: its index in SL₂(ℤ) is infinite and −I∉Γ₁(0), although 0≤2. A finite-index noncongruence subgroup has no positive N in the level-defining set.

**Repair:** Quantify N≥1 in 0.6's finite-index and parity assertions; retain the standing g≥1. Define least positive level only for groups proved to contain a principal congruence subgroup, or use an explicit absence value otherwise. Then N=1,2 contains −I and N=3 does not. Previous R27 is partly repaired by the standing genus convention, but not by a positive-level hypothesis.

## R14 (P2) — Several promised dimension theorems remain names rather than statements

**Location:** `TauCetiRoadmap/SiegelModularForms/README.md:1529`, 1569 and 2528: “as the explicit quasi-polynomial”; “by citation”.

**Claim:** Tsushima's formula, several level-two vector formulas and the paramodular quasi-polynomial are not actually specified; their ranges, exceptional cases and coefficients cannot serve as acceptance statements.

**Witness:** Cléry–van der Geer–Grushevsky Theorem 12.1 (`cvdgg2015 line 934`, p.20) distinguishes odd k≥3 from even k≥4 for even j≥2. At j=2 it gives dimensions 0 at k=3 and 15 at k=4.

**Repair:** Write the actual formulas, full parameter ranges and small-weight exceptions, with exact source locators. State the equations in the named conditional isotypic hypothesis rather than naming a collection of conjectures. Include the (j,k)=(2,3),(2,4) evaluations. A missing formula is not a missing Lean carrier. Previous R29 remains open.

## R15 (P2) — Constant-term invariance is overstated at general level

**Location:** `TauCetiRoadmap/SiegelModularForms/README.md:834`: “`a(0) ∈ V^{GL_g(ℤ)}`”.

**Claim:** At arbitrary arithmetic Γ, the constant term is invariant only under the Levi elements actually in Γ.

**Witness:** Θ_{A₂}^{(2)} has weight det¹, constant term 1 and is a form on Γ₂(3). For U=diag(−1,1), det(U)·1=−1≠1. That Levi element is absent from Γ₂(3).

**Repair:** State invariance under `{U : m(U)∈Γ}`; give full GL_g(ℤ)-invariance as the full-level specialization. The A₂ example then imposes no false −1 action, while the full-level parity corollary remains valid. This matches the hU binder already present in `fourierCoeff_conj`.

## R16 (P2) — The Schottky zero locus needs its decomposable boundary

**Location:** `TauCetiRoadmap/SiegelModularForms/README.md:1764`: “vanishing exactly on the Jacobian locus”.

**Claim:** For smooth-curve Jacobians this misses decomposable principally polarized abelian varieties.

**Witness:** At τ=diag(i,i,i,i), both rank-16 theta series equal E₄(i)^8, so J(τ)=0. The product of four elliptic curves with product polarization is not the Jacobian of a smooth genus-four curve.

**Repair:** State the closure of the Jacobian locus, or restrict to the indecomposable locus and specify smooth Jacobians. Name the geometric carrier and its supplier. The displayed decomposable point then belongs to the closure statement and is excluded from the indecomposable statement.

## R17 (P2) — The pluriharmonic vanishing equivalence needs a nonzero irreducible coefficient model

**Location:** `TauCetiRoadmap/SiegelModularForms/README.md:1293`: “equivalently when `P` vanishes on every matrix with a zero column”.

**Claim:** This is not equivalent to λ_g≥1 for the currently allowed P and weight representations.

**Witness:** P=0 with trivial ρ has λ_g=0, yet vanishes on every such matrix. More generally 1.1 allows reducible weights, for which one highest-weight tuple does not describe the whole representation.

**Repair:** Keep λ_g≥1 as a sufficient condition, and state any converse for a nonzero polynomial with the required irreducible coefficient representation. Treat zero separately. The corrected sufficient statement still yields the zero cusp form and no longer infers 0≥1.

## R18 (P3) — The reducible parity negative control still uses the wrong genus

**Location:** `TauCetiRoadmap/SiegelModularForms/README.md:716`: “`Γ = Γ₂`” and “`ρ(−1) = diag(1, −1)`”.

**Claim:** det(−I₂)=1, so det⁰⊕det¹ gives diag(1,1) here.

**Witness:** At genus two the two eigenvalues are (1,1); at genus one they are (1,−1). The proposed example therefore does not distinguish the erroneous parity statement.

**Repair:** Use genus one (or explicitly odd genus) in this Check and its preceding example. The constant (1,0) then has the advertised nontrivial action on the unused summand. Previous R30 remains open.

## R19 (P3) — Exact source locators still need repair

**Location:** `TauCetiRoadmap/SiegelModularForms/README.md:1444`, 1687, 1749 and 2458; `Suggested.lean:1033`: “Aoki–Ibukiyama 2005, Theorem 4.1”.

**Claim:** That theorem is a level-three ring theorem, not the Wronskian construction. Several sampled results cite only a work/year. Ikeda's cited theorem supplies the standard factorization, not the displayed spin factorization.

**Witness:** `aokiibukiyama2005 line 151` is Proposition 2.1, pp.251–253, the Wronskian result; line480 is Theorem 4.1. `ikeda2006 line 77` states a standard L-function theorem conditional on nonvanishing.

**Repair:** Replace the Wronskian locator in both files. Cite Ibukiyama Appendix Theorems A/C, pp.33–34 for 6.7; give theorem/page locators for 6.9 and 2.5. Give a source and derivation for the spin factorization in 9.8, separately from Ikeda's standard theorem. The Wronskian weight check remains 4+6+10+12+3=35. Previous R32 is partly repaired, not closed.

## R20 (P3) — The required source manifest is still absent

**Location:** `TauCetiRoadmap/SiegelModularForms/`, accompanying README References.

**Claim:** The folder has no `sources.toml`, so its citations have no persistent version/access/locator records.

**Witness:** The folder contains README.md, Suggested.lean and metadata.json; no source manifest. This round had to distinguish the 1983 Eichler–Zagier preprint and published citations anew.

**Repair:** Add the required manifest, one lifetime key per work, recording the exact version read, locators and source-service provenance; mark unavailable/paywalled texts honestly. Do not vendor source text. The 1983 preprint entry must identify Theorems 2.1 and 6.2 at its own pagination. Previous R33 remains open; the passing gate does not certify this requirement.

## R21 (P3) — A fixed-multiplier piece is not a semigroup

**Location:** `TauCetiRoadmap/SiegelModularForms/README.md:459`: “the semigroup `O_g(m)`”.

**Claim:** Multiplication changes the multiplier.

**Witness:** diag(1,2) belongs to O₁(2); its square diag(1,4) has multiplier 4 and does not belong to O₁(2).

**Repair:** Call O_g(m) the set of integral similitudes of multiplier m, and state O_g(m)O_g(n)⊆O_g(mn). Their positive-multiplier union is a semigroup. The Lean carrier is already a Set. The example now lands in O₁(4).

## Verified sound

The following evidence records checks that passed and counterexamples that did not. It is not a claim that every source-dependent theorem has been certified. The whole README and Lean file were read; the unresolved primary texts are listed separately below.

### Disposition of all 33 preceding findings

These were checked first against this head. Quoted fragments are from the repaired roadmap, not from source passages. No supplied repair report marked a finding “not actionable in this package”.

| Previous | Disposition at this head | Passage and witness |
|---|---|---|
| R01 negative Maass indices | Repaired | §9.4 “positive semidefinite”; Lean1254 guards the index. (−1,1,−1) fails positivity; (2,2,2) gives −272+512=240. |
| R02 improper reduction | Repaired | §2.1 “0≤r≤n≤m”; Lean725. Of (2,±1,3), only (2,1,3) remains reduced. |
| R03 Satoh kernel | Repaired | §6.4 “W_k := … ℂ[χ₁₀,χ₁₂]”; last Lean component has two variables. Weight-28 count is 12, formerly 13. |
| R04 theta covolume | Repaired | §5.2 “covol(L)^(−g)”; Lean956. L=2ℤ²,g=2 gives 16.00044638449/16=1.00002789903. |
| R05 false period | Repaired | Lean790,826,886 have N>0 and translation containment. For E₄(τ/2), N=2 gives coefficient 240 at its first frequency; N=1 is not an allowed period. |
| R06 weight-zero integrality | Repaired | §11.2 “k ≥ 2”; Lean1314. Weight zero gives 15/8 and 40/27, excluded from integrality but included in rationality. |
| R07 Hermitian adjoint | Repaired | §3.4 “conjugate transpose”; A=i gives i=i after conjugating the adjoint. |
| R08 Klingen parity | Repaired | §4.3 “even j > 0” and “even k > 4”. (5,7), formerly 0→ℂ, is excluded. |
| R09 uniform Sturm bound | Repaired | §3.5 “C(Γ,ρ,N)”; Δ(Nτ) begins at exponent N, so the level-dependent bound can grow. |
| R10 central Hecke generator | Repaired | §7.4 distinguishes “H_p^0” and central inversion; the central scalar p^{2k+j−6} is retained. |
| R11 squared theta weight | Repaired | §5.4's squared law has determinant weight 1, not 1/2; two half-weights add to 1. |
| R12 level-four f₃ | Repaired | §6.8 uses “θ₀₀₀₁θ₀₀₁₀θ₀₀₁₁”. Coordinate swap now preserves the stated .99250264302 value. |
| R13 common convergence bound | Repaired | §8.2 separates cusp/Klingen/Eisenstein. ψ₆ has largest spin exponent 9 and needs Re s>10; χ₁₀ needs Re s>10 for different roots. |
| R14 shared coefficient sequence | Repaired | §8.5 “separate coefficients”; χ₁₀ has b_spin(2)=240 and b_st(2)=−67/32. |
| R15 orbit/complex-line confusion | Repaired | §10.3 “simple rational constituent”; a degree-d field constituent has rational dimension d, while one complex eigenspace can have larger multiplicity. |
| R16 Jacobi/Eisenstein cycle | Repaired | §4.2 “Build the Jacobi and Maass inputs before…”; its independent comparison precedes the coefficient formula. V(E₄,₁) has constant 1/240, scaled by 240 to 1. |
| R17 unowned deep proofs | Substantially repaired | §8.3 names Mellin/unfolding/residue and realization comparisons; §10.4 explicitly owns local fixed-vector/zeta-integral theory, including p=2,3. No blanket repetition of the previous scope objection; R07/R08 identify concrete remaining input defects. |
| R18 harmonic degree zero | Repaired | Supplier contract and §5.3 say “d > 0”; P=1 gives E₄ with constant 1, not a cusp form. |
| R19 character decomposition | Repaired | §3.5 decomposes M(Γ′), with Γ′ the character kernel; nontrivial-character summands are not asserted to lie in M(Γ). |
| R20 rational span | Repaired | §6.3 distinguishes “ℂ-span” and “ℚ-span”; iψ₄ has constant i, outside the rational subspace. |
| R21 nebentypus adjoint | Repaired | §7.3 uses χ⁻¹ and normality; for χ(p)=ω, adjoint factor is ω⁻¹, not 1. |
| R22 level-three polynomial | Repaired | §6.6 “all three operators annihilate `P`”: exact polynomial differentiation gives (0,0,0); the old unsquared version gives −8 for the first operator at y=e₃. |
| R23 duplicate Jacobi/theta construction | Repaired | §4.2 calls V_l a “comparison”; supplier §6.4 owns V_l. LO.6/higher-genus-theta is named and the redundant unimodular Lean theorem is gone. |
| R24 odd Γ₀(4),ψ weights | Not repaired | §6.8 still says “not a target here”; R10. |
| R25 missing singular headline | Not repaired | §2.6 still states the result; neither the signature nor a missing-carrier explanation appears; R11. |
| R26 vector spin source | Partly repaired | §8.3 adds a proof route but still cites Arakawa without a_F(I₂)≠0; R12. |
| R27 level/genus guards | Partly repaired | Layer0 says g≥1; §0.6 still admits N=0; R13. |
| R28 zero eigenform | Not repaired | §7.2's predicate still lacks f≠0; R09. |
| R29 untranscribed formulas | Not repaired | §§6.4–6.5,10.1 still refer to formulas without stating them; R14. |
| R30 parity Check | Not repaired | §1.3 still sets Γ=Γ₂; det(−I₂)=1; R18. |
| R31 unused Lean catalogue | Repaired | The old standalone spinor/standard factors, maassCoeff/maassLift and card_evenChar declaration are absent. |
| R32 locators | Partly repaired | §4.2 now identifies the 1983 preprint and §4.3 the Arakawa propositions; Wronskian/other gaps remain, R19. |
| R33 manifest | Not repaired | No sources.toml; R20. |

### Gate, elaboration and signatures

The supplied gate is for the requested head and reports every check zero, including `build`, `outside-folder`, `stray-files`, `depcheck`, `sorry-data`, `set_option`, imports and README-name checks: **OK**. The outside-folder diff is empty and the worktree remains clean. No roadmap file was changed.

Independent `lake env lean` elaboration of the requested module succeeded with 63 `sorry` warnings and no other warnings/errors. A scratch copy appended `#check @name` for all **188 actual declarations** and also succeeded. The worker's count of 189 includes a regex match on the prose word “of”, resolving to Matrix.of; it is not a declaration of this roadmap. I compared the signatures, including the five suspected binder losses. `extendZero` and `phi` need their additive/normed carrier but no complex scalar structure merely to be defined; `fourierCoeff` can be a total Bochner integral without finite dimensionality; `gram` and the total theta sum can be defined in an arbitrary real inner-product space. Their substantive expansion, bound, finite-dimensionality and Poisson theorems retain the needed hypotheses. No binder-loss finding is justified by those five alerts.

The scratch padding probe attempted each of the 63 admitted declarations with single-tactic `simp`, `rfl`, and `infer_instance` branches, accepting a branch only if it closed all goals. All 63 remained admitted; no tactic-probe success was counted. Reading the supporting definitions distinguished the native-library adapters used to construct the carriers from the deep theorems. This does not establish truth of the admitted theorems; the computed witnesses below are separate evidence. No `set_option`, sorry-bodied data, admitted example, or imported roadmap module was found.

The dependency command was run with the supplied candidate order, `--movable`, and main content. Its complete output was:

```text
depcheck: 204 roadmaps, 1615 edges, 0 problem(s)
```

There is no UPWARD/CYCLE output for this roadmap. R08 concerns finer dependencies within the file, which this result does not inspect.

### Seeded source sample: all 15 requested targets

Source ids below identify the legal source-service texts. Preprint pagination is not silently substituted for published pagination. Where only a secondary account or inaccessible primary locator was available, that limitation is explicit.

| Target | Text, locator, hypotheses and result |
|---|---|
| 1.2 Slash operators | `vdg line 299`, Definition3.1, p.8, gives the symplectic transformation law; pinned `ModularForms/SlashActions.lean:90` supplies the genus-one determinant normalization. p=2,k=4 gives 1/2, not 1/16. No exact locator accompanies the general similitude right-action target. |
| 1.3 Forms | `vdg line 299`, Definition3.1, p.8: full level, finite-dimensional representation, extra cusp regularity for g=1. The roadmap's arithmetic-level extension is a target, not a theorem supplied by this definition. The reducible parity example fails (R18). |
| 2.6 Singular forms | `vdg line 614`, Theorem6.2, p.14: irreducible highest weight and nonzero f are both required and present. Its scalar specialization is still missing in Lean. |
| 3.4 Petersson product | `vdg line 536`, §5, p.12: det(Y)^{−g−1} measure and ρ(Y) pairing, convergent with at least one cusp input. The repaired conjugate transpose gives the right Hermitian convention. Freitag's primary treatment was not readable. |
| 4.1 Eisenstein | `vdg line 548` onward, §5, pp.12–13, treats even weight and Klingen convergence. The claimed Freitag Hilfssatz I.5.1 could not be checked. Odd-weight quotient cancellation is independently false (R06). |
| 4.2 Maass–Cohen | `ez1983 line 682`, Theorem2.1, printed pp.20–21; `ez1983 line 2416`, Theorem6.2, pp.71–72, plus §4's V_m. Even k≥4, index one and positive-semidefinite Fourier support match. OCR is imperfect, so the rational-value calculations below independently test signs/constants. The Maass 1964/1972 originals were unavailable. |
| 5.3 Pluriharmonics | `vdg line 671`, §7, pp.15–16 supports the even-unimodular scalar specialization; `lmfdb_mf_siegel_theta_series line 110` has the incorrect transposed differential indexing. Freitag's general theorem was unavailable. R05 and R17 are direct counterexamples to extra assertions. |
| 6.3 Igusa | `vdg line 858`, Theorem9.1, p.19 gives the ring presentation; line875 gives the filtered exact sequence. The ring counts agree; the roadmap's sequence does not (R03). The original Igusa papers were not accessible. |
| 6.7 Γ₀(2) ring | `ibukiyama1991 line 569`, Appendix Theorem A, p.33, and line598, Theorem C, p.34. Weights 2,4,4,6 and odd shift19 match. The printed p.34 confirms signs (+,−,−,+) in θ′, contrary to the roadmap (R02). |
| 6.9 Degrees3/4 | Tsuyumine1986 and Poor–Yuen2007 primary texts were not obtained. The displayed genus-three series was checked algebraically, not certified as the cited theorem. The smooth-Jacobian interpretation fails at a decomposable point (R16). |
| 7.2 Hecke action | `vdg line 1688`, §19, p.35, uses irreducible ρ, simultaneous eigenforms and the central-character normalization; the scalar elliptic comparison is pinned. The zero-form ambiguity remains (R09). |
| 8.1 Euler factors | `vdg line 1670`, §18, p.34; line1745, §20, pp.36–37: subset product, reciprocal standard roots, quartic and generating-series numerator agree. The χ₁₀ and Weyl-orbit computations below discriminate the normalization. |
| 8.4 Root/weight | `vdg line 1774`, §20, p.37 verifies the scalar reflection/sign. `arakawa1983 line 92`, p.158 verifies the vector statement only with nonzero identity coefficient. The polar-divisor converse is false, R01. |
| 8.5 Export | `LFunctions` Layer0, README346–412 supplies the two records and normalization translation. The coefficient-zero convention, weight shift and separate prime coefficients match. Incorrect exact poles inherited from 8.3 do not. |
| 10.2 Good factors | `pooryuen2015 line 321`, §2, preprint p.7 gives the good-prime quartic; line2180, Theorem7.1, preprint p.42 gives Q₂,Q₃ at277. The coefficient lists match. This is the 0912.0049v1 text, not an independently checked published-page locator. Bad primes are developed in 10.4, not discarded. |

### Pinned objects and supplier/ownership audit

Object searches used the roadmap index's `grep`/`show`, the main checkout, the supplied open-head files and the board design package. They searched symplectic groups/action, Jacobi spaces/index raising, scalar and harmonic theta, Petersson/Hecke operators, Fourier carriers and completed L-function records, rather than only this file's names. No competing fully qualified `TauCetiRoadmap.SiegelModularForms` declaration was found in the other owners examined. This new folder extends the classical higher-genus theory; it is not a rewrite of an existing SiegelModularForms roadmap.

Pinned declarations opened included:

| Pinned file and line | What it supplies, and its boundary |
|---|---|
| `Mathlib/LinearAlgebra/Matrix/PosDef.lean:62,164` | PosSemidef includes Hermitianity and nonnegative quadratic evaluation; PosDef uses strict positivity for nonzero vectors. Positivity alone on diagonal entries is insufficient. |
| `Mathlib/LinearAlgebra/SymplecticGroup.lean:209` | Symplectic inverse −J Mᵀ J, reused by the proved `Sp.mat_inv` adapter. |
| `Mathlib/NumberTheory/ModularForms/Basic.lean:72,80` | Degree-one slash-invariant modular/cusp carriers with their analytic/cusp conditions; not a higher-genus carrier. |
| `Mathlib/NumberTheory/ModularForms/SlashActions.lean:90` | det(γ)^{k−1}(cτ+d)^{−k} normalization. |
| `Mathlib/NumberTheory/HeckeRing/Defs.lean:75` | Existing abstract Hecke/coset machinery; it does not supply the higher-genus classical action or its finite-coset calculation. |
| `Mathlib/Algebra/Module/ZLattice/Covolume.lean:72` | Covolume as the real value of additive covolume, with lattice hypotheses in its associated theorems. |
| `Mathlib/LinearAlgebra/BilinearForm/DualLattice.lean:37` | The actual dual submodule, reused in the theta inversion signature. |
| `TauCeti/LinearAlgebra/Matrix/GeneralLinearGroup/Symplectic/Basic.lean:94,117,123` | GLSymplectic and both equivalent J-identities; J-sign comparison leaves the multiplier unchanged. |
| `TauCeti/LinearAlgebra/Matrix/SymplecticMultiplier.lean:58,86` | Singleton-index rank-two determinant theorem, not the general-rank formula claimed here. |
| `TauCeti/LinearAlgebra/Matrix/GeneralLinearGroup/Symplectic/TorusGeneration.lean:140,145` | Root generation over a field, not over ℤ. |
| `TauCeti/NumberTheory/ModularForms/Newforms/Newform.lean:104` | Normalized elliptic newform carrier; the Saito–Kurokawa theorem uses the actual level-one object. |
| `TauCeti/NumberTheory/ModularForms/HeckeSlash/Basic.lean` | Generic slash sum and representative-independence hypotheses; these do not themselves prove Siegel modularity. |

The focused pinned searches found no native Siegel half-space, paramodular subgroup, Satoh bracket or higher-genus modular-form carrier replacing the local definitions. This is a search result at the pins, not a claim about newer libraries.

Resolved supplier contracts (line numbers refer to the cited roadmap file, with the index wrapper excluded):

| Owner | Resolved section/object and convention witness |
|---|---|
| `TauCetiRoadmap/ModularForms/README.md` | Layers2/4/7/9: elliptic Hecke/newform/L/Satake interfaces; at Δ and p=2, α+β=−24, αβ=2¹¹. The pinned implementation is preferred where present. |
| `TauCetiRoadmap/ThetaSeries/README.md:423,533,591,830,854` | Poisson, positive lattice level, degree-one theta, discriminant character and general-level modularity. Θ_E₈ begins 1+240q; rank24 formula at962 gives Θ_Leech=E₄³−720Δ. |
| `TauCetiRoadmap/IntegralLattices/README.md:813` | 2G reduced bases/finiteness, within cited Layer2; 6D supplies the rank16 pair. It does not supply integral symplectic generation. |
| `packages/LevelOneAutomorphicFormsForClassicalGroups/design/README.md:1676,1703` | LO.6/higher-genus-theta and harmonic-theta: unweighted basis-lattice sum, constant1, Φ comparison; harmonic supported assignments require the stabilizer normalization. The target comparison respects these. |
| `TauCetiRoadmap/ClassicalGroupsPartII/README.md:318` | CG.0.1, characteristic-zero, g≥1, unit multiplier. J↦−J changes both sides by −1, leaving μ unchanged. |
| `TauCetiRoadmap/MetaplecticAutomorphicForms/README.md:1768,1804,2490,2506,2521,2608,2624` | §§6.18/6.20 and8.10–8.12/8.18–8.19: Jacobi carrier/theta decomposition; degree-two space/action; rank-one theta and half-integral dictionary. At zero characteristic, e(aNᵀZN) matches the √(2a)ℤ lattice. |
| `TauCetiRoadmap/HalfIntegralWeightModularForms/README.md:1549,1587,1622,1670` | §§6.1–6.4, positive Jacobi index, even-weight index-one isomorphism and V_l. V₁ coefficient sum is c(n,r); V₂ has index2 and divisor term 2^{k−1} when eligible. |
| `TauCetiRoadmap/QSeriesPartitionsAndMockModularForms/README.md:1358` | §9.1 theta-component coordinates. m=1,μ=0 begins 1+q(ζ²+ζ⁻²); μ=1 begins q^{1/4}(ζ+ζ⁻¹). |
| `TauCetiRoadmap/LatticePackingsAndPerfectForms/README.md:1381` | §5.6 requires d>0 for cuspidality. d=0,P=1 yields constant coefficient1 and is excluded. |
| `TauCetiRoadmap/LFunctions/README.md:346` | Layer0 records, coefficient-zero field and shift by w/2. w=17 sends arithmetic center9 to analytic center1/2. |
| `TauCetiRoadmap/AutomorphicLFunctionsAndLocalFactorsPartII/README.md:1530,1567,1601` | §§9.1–9.3, doubling Euler identity, continuation and functional equation, with cuspidal representations and tracked measures. This supplies a standard-function input, not a spinor theorem or an iff theta-residue criterion. |
| `TauCetiRoadmap/AdelicAlgebraicGroups/README.md:1657,1823` | §§2.2–2.3 quotient measures; quotient measure is not an arbitrary volume-one choice. |
| `TauCetiRoadmap/AutomorphicFormsOnReductiveGroups/README.md:506,523` | §§3.1–3.2 smooth automorphic vectors, actual rational stabilizers and classicalEquiv. Constants map to constants on each component. |
| `TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md:576,734,838,1019,1189,1268` | SR.0.1/.3/.4 and1.1–1.3 supply locally profinite smooth carriers, compact-open invariants, admissibility and Hecke modules, not Roberts–Schmidt newvector formulas. Averaging uses invertible volume; complex coefficients here allow it. |
| `TauCetiRoadmap/HyperellipticCurves/README.md:2093,2168` | §§5.3/5.6 good quartic/conductor. At q=2,a₁=2,a₂=4, reciprocity gives coefficients (1,2,4,4,4). |
| `TauCetiRoadmap/AbelianVarietiesOverFiniteFields/README.md:495` | §1.3 reversal of the Frobenius polynomial, constant1 and leading q^g; for an abelian surface at2, leading coefficient4. |

The index reports some supplier work as open even when it is also on main; main was used for existing roadmaps, and supplied open heads for new folders. LO.6 was resolved in its board design, not falsely reported missing because `roadmaps show` has no published folder yet. The new Jacobi and theta comparisons preserve ownership. The private module namespace creates no collision with these owners. No later-roadmap supplier was found. R07 identifies actual library-supplier drift; it is not inferred merely from the unresolved-name scanner's 27 knowl leads.

### Headline inventory and Lean coverage

The README's endpoints are: Koecher and Fourier expansion/uniqueness/bounds; singularity; Φ/cuspidality and finite dimensionality; Siegel/Klingen Eisenstein series and Maass–Cohen coefficients; lattice theta inversion/modularity and harmonic theta; Igusa/Satoh and the level2/3/4 rings and dimension formulas; Satake/eigenbasis/Hecke coefficient laws; spinor/standard continuation, functional equations, bounds and data export; Maass/Jacobi/Saito–Kurokawa, Gritsenko, Ikeda and Miyawaki lifts; paramodular newform theory, the level277 result and partner conjecture; rational structures, integrality and coefficient fields.

The actual signatures cover Fourier expansion/uniqueness, Koecher, coefficient bounds, cuspidal Fourier support, finite dimensionality, the scalar finite coefficient bound, even-rank theta inversion, Igusa even/odd generation and algebraic independence/dimensions, Satoh and its dimensions, scalar eigenbasis, T(p) coefficients, Maass dimensions/Saito–Kurokawa, the level277 cusp dimension, integrality and number-field finiteness. Simple definitions are tied to these carriers. The docstring names the missing Petersson domain/measure, Cohen/Jacobi input, Klingen parabolic, odd-rank square-root branch, level ring/character generators, Satake ring and local/paramodular representations needed by the omitted endpoints. It does not resolve the statable omissions in R11; citing an untranscribed numerical formula as a missing carrier is also insufficient (R14).

### Adversarial values

The following 109 rows give specific identity, construction, convention or theorem instances. “Pass” means the displayed instance agrees, not that numerical testing proves a general theorem. Values are exact unless decimals are shown. The table covers every numbered subsection, the seeded targets, the Lean headlines and every finding's mathematical target. Rows sharing a subsection test different assertions separately.

| Statement | Instances | Values on the two sides / competing models | Result; change |
|---|---|---|---|
| 0.1 J and inverse | g=1,J=[[0,−1],[1,0]] | J²=−I; J⁻¹=−J=−JJᵀJ | Pass; none |
| 0.1 block symplectic equations | n(1),m(2) over ℚ | n(1)ᵀJn(1)=J; m(2)=diag(2,1/2), det=1 | Pass; integral generation remains R07 |
| 0.2 multiplier/determinant | diag(I₂,2I₂) | μ=2,det=4=μ²; rank-two conclusion would give2 | Formula passes; supplier repair R07 |
| 0.2 multiplier sign | diag(I₂,−I₂) | μ=−1,det=1; positive determinant does not imply μ>0 | Pass |
| 0.2 fixed-multiplier product | diag(1,2)² | μ(product)=4≠2 | Fail; R21 |
| 0.3 positive half-space | iI₂,0,diag(i,−i) | imaginary eigenvalues (1,1),(0,0),(1,−1) | Only first admitted; pass |
| 0.3 rank-zero carrier | g=0 | unique empty symmetric matrix; positivity has no nonzero vector to test | Consistent total carrier; positive-genus theorem guards matter |
| 0.4 fractional action | J on 2i; translation by1 | −1/(2i)=i/2; (2i)+1=1+2i | Pass |
| 0.4 nonzero denominator | g=1,γ∈SL₂(ℝ),τ=i | c²+d²>0; c=d=0 contradicts det=1 | Pass |
| 0.5 automorphy cocycle | J,J,τ=i | j(J,Jτ)j(J,τ)=i²=−1=j(−I,τ) | Pass |
| 0.6 arithmetic overgroups | Γ=Sp₂(ℝ) | contains Γ₁(1):true; commensurable:false | Fail; R04 |
| 0.6 level zero | g=1,N=0 | index=∞; −I membership=false while N≤2=true | Fail; R13 |
| 0.6 finite orders/indices | g=2,p=2,3 | Sp₄(𝔽₂):16·3·15=720; Γ₀ indices3·5=15,4·10=40 | Pass |
| 0.7 paramodular specialization | N=1 | lattice=ℤ⁴; stabilizer=Sp₄(ℤ); Fricke swap squares to I | Pass |
| 1.1 polynomial weight action | j=2,A=diag(2,3),k=0 | X₀²↦4X₀²; X₀X₁↦6X₀X₁; X₁²↦9X₁² | Pass; distinguishes transpose/scaling |
| 1.2 slash normalization | g=1,k=4,diag(1,2) | 2³·2⁻⁴=1/2; e+1 gives1 | Pass |
| 1.2 right-action sign | J²=−I,k=3 | both iterated slashes multiply by−1 | Pass |
| 1.3 odd scalar/vector parity | (g,k)=(1,3); (k,j)=(10,1) | central action−1 in each; fixed space dimension0 | Pass |
| 1.3 reducible Check | det⁰⊕det¹,g=2 | actual diag(1,1), claimed diag(1,−1) | Fail; R18 |
| 1.3 cusp regularity | elliptic j-function | negative coefficient a(−1)=1; bounded-cusp requirement=false | Correct exclusion |
| 2.1 half-integral trace | T=(1,1,1),τ=[[a,z],[z,b]] | tr(Tτ)=a+z+b, not a+2z+b | Pass |
| 2.1 positive cone | (1,1,1),(1,2,1),(1,3,1) | determinants3/4,0,−5/4 | Positive, boundary, excluded; pass |
| 2.1 GL₂ reduction uniqueness | (2,±1,3) | both det=23/4; only positive-r representative satisfies 0≤r | Repaired |
| 2.1 bounded trace finiteness | PSD,trace≤0 | n=m=0 forces r=0; one index | Pass |
| 2.2 period | E₄(τ/2),N=2 | first coefficient240; N=1 endpoint jump≈−21.83644 at i | Repaired guards |
| 2.2 expansion/uniqueness | constant1 and one Fourier character | a(0)=1 versus0; single matching frequency coefficient1, others0 | Pass |
| 2.2 conjugation | odd-weight χ₃₅,U=diag(1,−1) | a(2,1,3)=1; a(2,−1,3)=−1=det(U)^35 | Pass |
| 2.3 boundedness | E₄,Imτ≥c>0 | q absolute value≤e^(−2πc)<1; at c=0 no such strict bound | Pass guarded case |
| 2.4 Koecher | genus2,T=(1,1,0); genus1,j | determinants−1/4, negative coefficient1 respectively | Genus2 coefficient0; genus1 counterexample correctly excluded |
| 2.4 general-level a(0) | Θ_A₂^(2) on Γ₂(3),U=diag(−1,1) | a(0)=1; det(U)a(0)=−1 | Fail; R15 |
| 2.5 noncusp coefficient bound | E₄, n=1,2 | a₁=240,a₂=2160; C=240 gives240≤240,2160≤3840 | Pass these instances |
| 2.5 cusp coefficient bound | Δ,n=1,2,k=12 | ‖a₁‖=1,‖a₂‖=24; n^{k/2}=1,64 | Pass these instances |
| 2.6 singularity | Θ_E₈, g=8,9 | rank bound8; 2k<g is8<8:false,8<9:true | Correct theorem; missing signature R11 |
| 2.6 zero/constant boundary | nonzero constant,k=0,g=2 | only coefficient rank0; 0<2=true | Pass; zero must remain excluded from iff |
| 3.1 Φ | E₄^(2),χ₁₀,constant1 | Φ values E₄,0,1; constant terms1,0,1 | Pass |
| 3.2 cuspidality | χ₁₀,E₄^(2) | singular coefficients all0 versus a(0)=1 | Pass |
| 3.3 invariant measure | g=1,τ↦−1/τ | dxdy factor‖τ‖⁻⁴; y'⁻²=‖τ‖⁴y⁻²; product unchanged | Pass |
| 3.4 Hermitian adjoint | A=i,v=w=1 | with A*=−i both sides i under linear-first convention; transpose-only gives−i | Repaired |
| 3.4 cusp pairing | Δ and zero | integrand for Δ self-pairing≥0, not identically0; zero pairing0 | Consistent; not a numerical integral proof |
| 3.5 finite dimension/Sturm | full-level elliptic weight12; Δ(Nτ) | dimension2; first nonzero exponent N, unbounded in N | Full-level count passes; level dependence repaired |
| 4.1 even Eisenstein | g=1,k=4 | −2k/B₄=−8/(−1/30)=240; constant1 | Pass |
| 4.1 odd quotient | g=2,k=5,identity coset | representative values1 and−1 | Fail; R06 |
| 4.2 Cohen values | r=3,N=3,4 | 2(−2/9)/((1/120)(−1/252))=13440; replacing−2/9 by−1/2 gives30240 | Pass |
| 4.2 support/boundary | H(3,0),H(3,1),H(3,2),H(2,1) | −1/252,0,0,−1/12 | Pass |
| 4.2 Jacobi/Maass normalization | k=4,c(0)=1 | V₀ constant−B₄/8=1/240; scaling240 gives1 | Pass |
| 4.3 Klingen parity | (k,j)=(5,7),(10,2) | first source dim0,target S₁₂ dim1, excluded; second Φ section of Δ | Repaired |
| 5.1 theta coefficient | even lattice,T=0 | only zero tuple: coefficient1; zero polynomial weight gives0 | Pass |
| 5.2 Poisson covolume | L=2ℤ²,g=2,τ=iI₂ | left1.00002789903; dual16.00044638449 /16 same | Repaired |
| 5.2 genus-one comparison | E₈ | constant1,first root count240; E₄ coefficients1,240 | Pass |
| 5.3 mixed Laplacian | m=2,g=1,P=x₁²−x₂² | sum over rows2−2=0; rowwise second derivatives(2,−2) | Corrected differential convention passes |
| 5.3 Fourier eigenfunction | P=1,Y=2 | ratios at0,1: .7071067812 and78.71355604 | Fail; R05 |
| 5.3 vanishing iff | P=0,ρ=1 | vanishing=true; λ_g≥1 is0≥1:false | Fail; R17 |
| 5.4 parity of characteristics | g=1,2,3 | even counts3,10,36; total counts4,16,64 | Pass |
| 5.4 χ₅ square | degree2,T=(1,1,1),(1,0,1) | 4096 and−8192 =4096·(1,−2) | Pass |
| 6.1 Igusa normalization | diagonal restriction | 30240+2·13440+2·240=57600=240²; χ₁₂:10+2=12 | Pass |
| 6.1 Φ cancellation | weight10 and12 q terms | 240−504+264=0; 441·720−250·1008−65520=0 | Pass |
| 6.2 Wronskian weight/sign | weights4,6,10,12; reflection | total35; a(2,±1,3)=(1,−1) | Pass formula; locator R19 |
| 6.3 Igusa dimensions | k=0,4,6,8,10,12,14,16,18,20 | monomial counts1,1,1,1,2,3,2,4,4,5 equal claimed list | Pass |
| 6.3 odd dimensions | k=35,37,39 | shifted monomial counts1,0,1 | Pass |
| 6.3 Taylor kernel | k=10,n=1,χ₁₀ | image nonzero; claimed kernel image0 | Fail; R03 |
| 6.4 Satoh coefficients | [ψ₄,ψ₆] at n=1,2 | 144,−3456=144·(1,−24); swapped denominators166,19116 | Pass; wrong model distinguished |
| 6.4 Satoh dimensions | k=10,12,14,16,18,20,22,28 | 1,0,2,3,3,4,7,12 from corrected six summands | Pass |
| 6.5 level-two scalar dimensions | k=0,2,4,6 | (k+1)(k²+2k+12)/12=1,5,15,35 | Pass |
| 6.5 vector dimensions | j=2,k=3,4 | source formula0,15; roadmap supplies no evaluable formula | R14 |
| 6.6 corrected differential polynomial | actual rank-four S and P of README1631–1636 | S⁻¹ has 2×2 blocks [[4,−2],[−2,4/3]]; D₁₁P=D₁₂P=D₂₂P=0 as polynomials; P(e₁,e₃)=1,P(2e₁,e₃)=4; unsquared version has D₁₁P(0,e₃)=−8 | Exact rational-coefficient differentiation passes all three operators |
| 6.7 Hilbert series | k=0,2,4,6,8 | weights2,4,4,6 give1,1,3,4,7 | Pass |
| 6.7 θ′/χ₁₉ translation | τ=i[[1.2,.2],[.2,1.5]],B=diag(0,1) | wrong χ values−4.3217481e−14,+4.2994276e−14; corrected both−1.0844536e−14 | Fail; R02 |
| 6.8 f₃ swap | diag(2i,4i) and swapped | correct .99250264302 both; former wrong model1.00744155969 versus.99253033298 | Repaired |
| 6.8 odd ψ₄ space | weight1,f₁(2τ) | coefficient at0=1; dimension1, not an empty family | R10 |
| 6.9 genus-three series | k=4,6,8,10,12 | coefficient counts1,1,1,2,4 | Algebraic pass; primary theorem unverified |
| 6.9 Schottky zero locus | product of four elliptic curves | J=E₄(i)^8−E₄(i)^8=0; smooth Jacobian membership=false | Fail; R16 |
| 7.1 dual coset | diag(1,p),g=1 | dual diag(p,1); same double coset, multiplier p | Pass |
| 7.2 eigenvalue normalization | ψ₄,ψ₆,χ₁₀,p=2 | (1+8)(1+4)=45; (1+32)(1+16)=561; χ₁₀=240 | Pass |
| 7.2 zero eigenform | f=0,λ=0,1 | both equations0=0 | Fail prose; R09 |
| 7.3 character adjoint | χ(p)=ω,ω³=1≠ω | adjoint factorω⁻¹=ω²≠1; commute still holds | Repaired |
| 7.4 Satake center | g=2,scalar k=4,p=2 | α₀²α₁α₂=2⁵=32; central operator2^{2k−6}=4 | Pass |
| 7.5 coefficient formula | weight0 constant,p=2,3 | 1+(p+1)p⁻²+p⁻³=15/8,40/27 | Pass; detects integrality exception |
| 7.6 Klingen parameters | Δ,k=12,p=2 | a₂=−24; λ₂=−24(1+2¹⁰)=−24600 | Pass local formula; cycle R08 |
| 8.1 χ₁₀ quartic | p=2 | coefficients(1,−240,−143360,−31457280,17179869184); λ₄=135424 | Pass |
| 8.1 Weyl invariance | α=(2,3,5)→(6,1/3,5) | spin roots{2,6,10,30} both; standard{1,3,1/3,5,1/5} both | Pass |
| 8.1 genus-one factors | Δ,p=2 | Q=1+24X+2048X²; standard middle sum a₂²/2048−2=−55/32 | Pass |
| 8.2 convergence distinctions | ψ₆; Klingen(Δ); χ₁₀ | maximal spin exponents9,31/2,9; sufficient abscissae10,33/2,10 | Repaired |
| 8.3 spin Maass poles | χ₁₀ | ζ(s−9) pole10; ζ(s−8) pole9 cancelled by central zero of f₁₈; completed mirror8 | Pass claimed scalar calculation |
| 8.3 standard converse | Δ,genus1,k=12 | theta-span membership1; pole order at1=0 | Fail; R01 |
| 8.3 vector applicability | a_F(I₂)=0 | Arakawa hypothesis=false; roadmap invocation unrestricted | R12 |
| 8.4 gamma shift/center | (k,j)=(8,6) | w=19; center10; arithmetic shifts0,6; analytic shifts9.5,3.5 | Pass arithmetic translation |
| 8.4 signs | χ₁₀ and elliptic Δ | (−1)^10=1; (−1)^6=1 | Pass |
| 8.5 coefficient records | χ₁₀,p=2 | spin240; standard1−33/16−33/32=−67/32; both b₀=0,b₁=1 | Repaired coefficients; poles R01 |
| 9.1 Fourier–Jacobi | T=(n,r,m) | tr(Tτ)=nτ′+rz+mτ″; Jacobi discriminant4nm−r² | Pass |
| 9.2 index raising | l=1; l=2,n=r=2 | V₁ coefficient c(n,r); V₂ has d=1,2 terms c(4,2)+2^{k−1}c(1,1) | Pass supplied operator |
| 9.3 Maass relation | χ₁₀,T=(2,2,2) | −272+2⁹·1=240 | Pass repaired positive cone |
| 9.4 Maass dimensions | k=10,12 | elliptic weights18,22 have cusp dimension1,1; Maass cusp dimensions1,1 | Pass |
| 9.5 Saito–Kurokawa | k=10,p=2 | −528+512+256=240 | Pass actual elliptic carrier |
| 9.6 Gritsenko at index1 | k=10,p=2 | specializes to same240 and degree-four factor | Consistent specialization; primary general theorem unverified |
| 9.7 Ikeda | Δ,degree4,k_total=8 | standard degree1+4·2=9; shifts7,6,5,4 | Pass parameter arithmetic |
| 9.8 Miyawaki parity | n=r=1,k_Ikeda=10,11 | 10≡2 mod2 true;11≡2 false; output weight12 in first case | Pass |
| 9.8 factor degrees | typeI,degree3 | spin2+2+4=8; standard2+2+3=7 | Degree check only; exact spin source R19 |
| 10.1 Fricke/reflection | N=1,χ₃₅ | a(2,1,3)=1=−a(3,1,2); a(2,−1,3)=−1 | Pass |
| 10.2 good quartic | f₂₇₇ at2,3 | (1,2,4,4,4),(1,1,1,3,9); λ₂=−2,λ₃=−1 | Matches primary preprint |
| 10.3 orbit versus multiplicity | rational simple constituent with field degree2,multiplicity2 | simple dimension2; isotypic dimension4; each complex eigenspace dimension2 | Repaired distinction |
| 10.4 bad-prime export | N=1 versus277 | bad-prime set∅ versus{277}; conductor1 versus277 | Consistent scope; local theorem primary unavailable |
| 10.5 dimension277 | cusp11,lift10 | quotient dimension11−10=1 | Matches Poor–Yuen Theorem1.3; not independently proved numerically |
| 10.6 partner good factors | q=2,a₁=2,a₂=4 | abelian-surface factor(1,2,4,2·2,2²) equals f₂₇₇ factor | Pass comparison; conjecture remains labelled |
| 11.1 least level | Γ₁(0) or noncongruence arithmetic subgroup | positive admissible-level set empty; no least positive N | Fail unguarded definition; R13 |
| 11.2 integrality | weight0 versus k≥2 | 15/8,40/27 not integral; at k=2 exponents k−2=0,2k−3=1 | Repaired |
| 11.2 coefficient field | weight38 elliptic polynomial | discriminant194400²+4·137403408384=587404993536=2¹⁰·3²·63737521 | Pass arithmetic |
| 11.2 rational/complex span | ψ₄,iψ₄ | constants1∈ℚ,i∉ℚ; both in complexification | Repaired |
| 11.3 lift/genuine classification | S₂₀ | two Maass conjugates plus one rational genuine form:2+1=3 | Consistent with dimension3 |
| 11.4 page coverage | genus2 scalar versus j=2 | weight10 dimensions2 versus1; these are different families | Consistent metadata comparison; no algorithm needed |

## Not verifiable

No source unavailability was treated as a mathematical counterexample or as a reason to stop this review. The source-service attempts were completed for the bibliography, with institutional alternatives for the readable Arakawa, Satoh, Ibukiyama, Aoki–Ibukiyama, Hayashida–Ibukiyama and Ikeda texts. The README marks no additional locator explicitly “unverified”. The following limits remain:

- **Paywalled/uncertified:** `freitag1983`, `cohen1975`, `psr1987`, `andrianovzhuravlev1995`, `kohnen2002`, `robertsschmidt2007`, `mizumoto1991`, `deligne1974`, `weissauer2009`. The service reached paywalled publisher records. No claim to reading these books/papers is made; they are not renewed missing-text requests.
- **Landing page, no readable legal text:** `klingen1990` (Cambridge); `tsuyumine1986`, `igusa1962`, `igusa1964ii`, `igusa1967`, `igusa1964theta` (JSTOR/publisher resolution); `pooryuen2007` (Project Euclid landing page without a fetched PDF); `ikeda2001`, `miyawaki1992`, `brumerkramer2019`, `brumeretal2019`, `rankin1939` (their source-service landing-page attempts did not yield the texts). Their primary theorem/page checks remain uncertified, including the genus3/4 dimension classification.
- **Network failure:** `andrianov1974`, `andrianovkalinin1979`, `andrianovmaloletkin1975` reached MathNet DOI targets but timed out. The standard/spin formulas were compared with the readable van der Geer account, not represented as checks of those primary articles.
- **No legal text resolved by the service:** `bocherer1985`, `maass1964`, `maass1972`, `maass1979i`, `maass1979ii`, `maass1979iii`, `tsushima1983`, `ibukiyama2007`, `gritsenko1995`. In particular, the 1964/1972 correction and the full standard residue theorem were not certified. The exact-converse error in R01 has an independent primary witness.
- **LMFDB bot-challenge responses:** fresh service fetches for `mf.siegel`, its `cusp_form`, `dimension`, `automorphic_type`, `eisenstein_series`, `hecke_operator`, `level`, coefficient-field/ring/integrality/orbit/defining-polynomial knowls, families `sp4z`, `sp4z_2`, `gamma_2`, `gamma0_3`, `gamma0_4`, `gamma0_4_psi_4`, `kp`, and lifts `gritsenko`, `miyawaki`, `miyawaki1` returned reCAPTCHA pages. A successful download of a challenge page is not verification of a knowl. No challenge was bypassed. The readable theta-series knowl and primary ring papers were checked independently.
- The Eichler–Zagier scan is OCR, with degraded displayed equations. Its theorem numbers, hypotheses and divisor-formula passage are readable; the numerical normalization checks were recomputed. The Poor–Yuen source is the available arXiv version; published pagination was not certified. No correspondence of all preprint/published page numbers is asserted.
- The all-rank harmonic theta theorem, general paramodular local formulas, full genus3/4 classification, Tsushima coefficients, complete isotypic formulas and global vector-spin continuation beyond Arakawa's nonvanishing hypothesis were not independently certified. The report's example rows are not substitutes for those missing source checks.

## Source issues

- **Misprint** in vdg at §20, printed p.37 (`vdg line 1773`): the source uses lattice rank 2g for the weight-k theta exception; it should use rank 2k; affects a stated result.
- **Misprint** in ibukiyama1991 at Appendix, printed p.34 (`ibukiyama1991 line 590`): the source labels the odd-weight vanishing group Γ₀(3); it should label Γ₀(2), the group in the surrounding appendix and Theorem C; affects a stated result.
- **Error** in lmfdb_mf_siegel_theta_series at pluriharmonic definition, web page (`lmfdb_mf_siegel_theta_series line 110`): the differential sum runs over columns with row-pair indices; it should run over quadratic-space rows for each column pair; affects a stated result.
- **Error** in lmfdb_mf_siegel_theta_series at harmonic modularity, web page (`lmfdb_mf_siegel_theta_series line 119`): ordinary homogeneity is stated to yield scalar weight m/2+ν and cuspidality without qualification; it should require the appropriate covariance and a positive-degree cusp condition; affects a stated result.
