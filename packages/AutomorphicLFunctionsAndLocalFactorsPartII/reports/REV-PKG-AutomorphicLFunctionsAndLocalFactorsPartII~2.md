<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1023#issuecomment-6393876077 -->
Review (codex) of 38b858c

Verdict: needs_changes

1. **F01** (P1) The scalar model and critical induced fiber have the wrong central character

   **Location:** `packages/AutomorphicLFunctionsAndLocalFactorsPartII/README.md:593`, “Its generating compact type is W_Λ∨”; also :611, :655, :711 and :719, “I_EHLS(χ_u,s_crit)”.

   **Claim:** The displayed automorphy function realizes that dual compact type and, after differentiation, belongs to the specified induced representation.

   **Witness:** Take n=1,m=3,a_χ=2,b_χ=0 and z=exp(iπ/4). At zI₂, J=z and J′=z̄: J_χ=i, whereas W_(3;−1)∨ and χ_u(z) both give −i. The range condition is 4≥2.

   **Explanation:** The factor formulas are confirmed by EHLS (92) and its preceding definitions, printed p.72, EHLS line 3351. On zI_(2n), the function has character z^(n(a_χ−b_χ)); the proposed dual compact type has z^(n(b_χ−a_χ)). Every norm/modulus factor is 1 here, so no choice of s_crit repairs the discrepancy. Right differentiation commutes with left P-translation, so raising operators do not repair it either. The older a_χ=b_χ=0 Check cannot discriminate these conventions.

   **Exact repair and retest:** Keep the displayed automorphy function and right action, explicitly identify the compact coordinates with (J, conjugate J′), and give its generator weight (−m+a_χ repeated n; m−b_χ repeated n). In the dual-label convention this is Λ=(m−a_χ;−m+b_χ), with repetitions. Recompute the branching labels and opposite twist in §§4.5–4.7 from that dictionary. In §4.8 the induced character must be χ_u⁻¹, and on the displayed multiplier-one Levi the parameter is s_crit=t−n/2. Retain the separate GU multiplier calculation. Propagate the corrected fiber through §§4.9–4.10 and the unitary L-character comparison. The central witness then gives i on both sides. At B=2,λ=1 the function is 2⁻⁴=1/16; δ_P^(1/2)·4^(−3/2)=(1/2)(1/8)=1/16. Add both the phase and positive-Levi tests; do not restrict to a_χ=b_χ.

2. **F02** (P1) The inverse intertwiner omits quadratic conjugation

   **Location:** `packages/AutomorphicLFunctionsAndLocalFactorsPartII/README.md:434`, “The normalized intertwiner has inverse obtained with χ⁻¹ and ψ⁻¹.”

   **Claim:** Inverting χ gives the inducing character of the returning intertwiner.

   **Witness:** README:334 and :338 correctly compute χʷ=(χ^c)⁻¹. For E=ℂ, F=ℝ and χ(z)=z/|z|, χʷ=χ. At B=i, χʷ(i)=i but χ⁻¹(i)=−i.

   **Exact repair and retest:** State the typed maps I_EHLS(χ,s)→I_EHLS((χ^c)⁻¹,−s) and the returning map indexed by (χ^c)⁻¹, with the specified ψ reversal. Track the GU multiplier separately. Applying the character operation twice gives χ, and the returning map now has the actual source of the first map's output. Add this angular-character test alongside the existing norm-character test. Recheck §3.4's dual-character description against these typed maps.

3. **F03** (P2) The Whittaker-exactness contract loses its wave-front bound

   **Location:** `packages/AutomorphicLFunctionsAndLocalFactorsPartII/README.md:103`, “is exact on Casselman–Wallach representations of GL_(kc)(F)”; the same needs sentence occurs in `packages/AutomorphicLFunctionsAndLocalFactorsPartII/design/plan.json`, gap `archimedean-whittaker-exactness`.

   **Claim:** MODELS supplies exactness on the entire Casselman–Wallach category, with no bound on the wave-front set.

   **Witness:** MODELS line 219 invokes GGS Corollary G. GGS17 lines 241–252 define the wave-front-bounded category and its quotient; Corollary G asserts exactness there. Its proof, GGS17 lines 1310–1326, uses that restriction.

   **Exact repair and retest:** Require all three terms of a short exact sequence to have wave-front set contained in the closure of O=(k^c), or formulate the exact functor on the corresponding quotient by representations with no O in their wave-front set. Keep the continuous generalized-Whittaker functor and its dual convention explicit. This is enough for the finite-length ρ_c(τ) argument in §5.2. For GL₄, (2,2) satisfies the bound (prefix sums 2,4), while a generic representation with orbit (4) fails it (first prefix 4>2). The repair includes the intended model and excludes the unlicensed larger-orbit example. Update the identical plan/README contract and cite GGS17 Corollary G directly. No general exactness theorem outside this category has been established by the cited passage.

4. **F04** (P2) Three remaining supplier contracts do not specify the proposition requested

   **Location:** `packages/AutomorphicLFunctionsAndLocalFactorsPartII/README.md:69`, “vanishing for larger or incomparable rectangular orbits”; :93, “the stable-factor cancellation needed”; :113, “pole criteria needed on the closed doubling half-plane”. The corresponding plan gaps have the same wording.

   **Claim:** These sentences are precise, minimal supplier contracts.

   **Witness:** A generic GL₄ representation has nonzero orbit (4), larger than (2,2). At u=1, the untwisted GL₁ symmetric-square factor has a pole. Neither sentence names the bound or exact factor needed to distinguish these cases.

   **Exact repair and retest:**

   - For `rectangular-orbit-support`, quantify the nonarchimedean field, GL_(kc), the finite-length admissible representation, the specified rectangular orbit and the hypothesis controlling its highest successive derivatives or wave-front support. State the actual Jacquet/derivative identification and the larger/incomparable-orbit vanishing it implies. Use the SR derivative constructors already cited. The generic orbit-(4) example must fail the hypothesis for a requested (2,2) bound; a type-(2,2) model must satisfy it.
   - Split `controlled-supercuspidal-globalization` into the prescribed-local classical globalization used in §10.6 and the controlled GL test globalization used in §10.5. For the latter specify the number field, isolated finite place, finite forbidden set, prescribed supercuspidal component and compatible central character; require the test representation to be unramified at the other forbidden places. Permit extra ramification only at places where the classical representation and candidate transfer are unramified, so §6.8 compares factors for arbitrary generic tests. This changes the number of uncontrolled bad-place factors from one to zero. State the required central-character compatibility, rather than assuming that stability applies to arbitrary local central data.
   - For `twisted-square-normalizers`, name τ, χ, S, the two partial factors L^S(u,τ,Sym²⊗χ) and L^S(u,τ,∧²⊗χ), and the exclusion of every essential χ⁻¹-self-duality. The precise sufficient assertion used in CFK lines 1725–1729 is holomorphy on Re(u)≥0, followed by the explicit shifts of §6.8. Delete an unspecified request for extra pole criteria, or state them separately if actually consumed. The trivial GL₁ example with χ=1 is excluded; a ramified nontrivial χ is not mistaken for the pole at u=1.

   Synchronize the resulting slugs and exact needs sentences in the plan and README. These are refinements of declared contracts, not findings that their future implementations are absent.

5. **F05** (P2) The Schur supplier is cited beyond its coefficient field

   **Location:** `packages/AutomorphicLFunctionsAndLocalFactorsPartII/README.md:61`, “with the chosen characteristic-zero coefficient field”; :639 and :651 use this input over an arbitrary characteristic-zero field.

   **Claim:** RepresentationTheory/ClassicalGroups Layers 2–3 supplies this field generality and the rational structures needed by Layer 4.

   **Witness:** `TauCetiRoadmap/RepresentationTheory/ClassicalGroups/README.md:28` fixes ℂ, and :34 restricts decompositions to ℂ. At the pin, `TauCeti.YoungTableau.weylModule` instead has `[CommRing k] [Algebra ℚ k]`, in `TauCeti/RepresentationTheory/ClassicalGroups/WeylModule/Basic.lean:130`.

   **Exact repair and retest:** Cite the pinned general-field Weyl modules directly: `TauCeti.weylModuleOfShape`, `TauCeti.weylRepOfShape`, and `TauCeti.isIrreducible_weylRepOfShape_iff` (Basic.lean:429, :441; Irreducible.lean:160). Use their rational Young-symmetrizer construction in §4.4 and make the field-compatible polynomial decomposition and selected projectors explicit parts of that specialization. Keep the complex highest-weight supplier for the complex compact-type comparison. Do not request a duplicate Weyl-module constructor or silently narrow the theorem to ℂ. For degree two over E=ℚ(i), the projectors (1±swap)/2 are E-linear idempotents, with ranks 3 and 1 for E²; the Cauchy dimension remains 10=9+1. An arbitrary complex rescaling by π would not establish the claimed E-normalization, which is why a complex decomposition alone is insufficient.

6. **F06** (P3) The infinite-length Check uses a nonexistent conductor-one character

   **Location:** `packages/AutomorphicLFunctionsAndLocalFactorsPartII/README.md:845`, the Check choosing “characters χ_n of F× of exact conductor n≥1”.

   **Claim:** That family exists over the allowed finite local fields and supplies the displayed admissible infinite-length example.

   **Witness:** Over ℚ₂, ℤ₂×=1+2ℤ₂. Thus ℤ₂×/(1+2ℤ₂) has order 1, and a character of exact conductor 1 cannot exist. Residue characteristic 2 is explicitly included in the conventions.

   **Exact repair and retest:** Use ℚ₂ and characters of exact conductors n≥2, or explicitly use an odd-residue-cardinality field for this Check. With the ℚ₂ choice, at K(m), m≥1, the added determinant-character lines contribute max(m−1,0) fixed dimensions; the total is dim π^K(m)+max(m−1,0), finite. Their generic Whittaker spaces vanish, leaving dimension 1 from π. The model remains infinite length. Keep the general admissible definition unchanged.

7. **F07** (P3) The CPS94 proof locator stops one page too early

   **Location:** `packages/AutomorphicLFunctionsAndLocalFactorsPartII/README.md:1577` and :1652; `packages/AutomorphicLFunctionsAndLocalFactorsPartII/sources.toml`, CPS94 locator: “Lemmas 2.1–2.3, pp.161–164”.

   **Claim:** That page interval includes the cited lemmas and the inverse-Satake bound used in §10.3.

   **Witness:** CPS94 line 296 begins printed p.165. Lines 298–311 contain Lemma 2.3's inverse-parameter argument. The lemma starts on p.164, but its proof does not finish there.

   **Exact repair and retest:** Change the joint locator to pp.161–165, retaining Lemmas 2.1–2.3 and the specific line references. Opening the enlarged interval now includes both the direct bound and the inverse bound used in the target. The author's manifest entry was not rewritten during review.

Seven findings: two P1, three P2 and two P3; five blocking findings. The scope is a genuine Part II extension and is repairable. The principal mathematical failure is an incompatible central character in the holomorphic model, independently visible in its proposed induced fiber. No package mathematics was edited during this review.

### Previous findings, checked first

The identifiers below refer to the previous review and its repair report. Quotations are from the repaired package, not from source texts. An administrative record is distinguished from a mathematical prerequisite.

| Previous finding | Status | Repaired passage and verification |
|---|---|---|
| F01, legacy unowned G1–G6 | Not repaired administratively; settled | README:11: “the unitary Siegel Eisenstein family of §1.3 is its specialization”; README:13: “The holomorphic theta criterion and rational projected-kernel comparison of §§4.8–4.10 are additional targets.” The six legacy records remain referenced by immutable coverage. Their obligations now have local targets or named contracts. The repair report's “not actionable in this package” reason is valid; this finding is not re-raised. |
| F02, hidden analytic proof obligations | Repaired | README:1230: “Part of this target is the generic uniqueness of the equivariance space in (A.2)”; README:1302: “the same attainment is part of this target”. CFK22 Lemma 7.3, KAP23 Theorem 25 and YAM14 Theorem 7.1 are explicitly cited without claiming to have read them. |
| F03, redundant ordered-residue route | Repaired locally; propagated character still fails | README:334 identifies the Weyl character as “(χ^c)⁻¹”. AST supplies discrete-data continuation, so the replacement route is appropriate. The conflicting inverse character elsewhere is R02. |
| F04, duplicate character-prescription request | Repaired | README:77: “Consume R16.1.8, finite Hecke characters with prescribed full local components”. The cited section really permits auxiliary ramification and increased order. The obsolete gap is absent from the README and gap list. |
| F05, nongeneric support and character-change ownership | Repaired | README:121: “equal supports give equal γ-factors”; README:125 explicitly requests the nongeneric ε-character-change law. The remaining implication is assigned to EndoscopicTransferAndUnitaryTraceComparison §10.29. The convergence argument is now a local target at §10.3. |
| F06, archimedean MVW input | Repaired | README:495: “Over ℝ or ℂ compute θ on a fundamental Cartan subgroup”. ADAMS14 Theorem 1.2 and Corollary 1.4 have the required hypotheses; the nonarchimedean supplier is no longer used for the real case. |
| F07, central sign in auxiliary equation | Repaired | README:1230: “γ_GL Z_GL=ω_π(−1)^(k−1)Z_GL*”. For sgn on GL₁(ℝ), k=2 gives −1 and k=3 gives +1; sgn∘det on GL₂ has value +1 at −I. §6.5 also uses ω_π(i_G). |
| F08, compound supplier gaps | Partly repaired | README:111 states the exact normalized M₂ and its half-plane; README:109 and :115 separate pole detection and Hermitian support. The five archimedean contracts are separated, but one drops a source hypothesis (R03), and three contracts remain insufficiently specified (R04). |
| F09, supplier locators | Repaired | README:65: “SR.5.2 segment-representations and SR.5.3 highest-derivative-adapter”; README:133: “§3.3's unitary splitting data with the §3.3b oscillator normalizations”. The actual sections were opened. The HARRIS references now distinguish Remark 4.4(iii) and (iv). |
| F10, missing-headline docstring references | Repaired | Suggested.lean:19: “Highly ramified local stability (README §6.10)”. All seventeen listed headline groups now point to their intended sections; no substitute declarations were introduced. |
| F11, integer versus unitary exponent | Repaired as arithmetic; new model failure | README:711: “Thus t=m−(a_χ+b_χ)/2.” At m=3,a_χ=2,b_χ=0, t=2 and 4³·2⁻²=16=4². The phase, which this positive-real test cannot see, fails in R01. The vocabulary changes are present throughout. |
| F12, finite length in the model definition | Partly repaired | README:819 now defines the model on admissible representations and places finite length on ρ_c(τ). This matches MODELS Definition 1. The new infinite-length Check assumes a nonexistent conductor-one character over ℚ₂ (R06). |

## Verified sound

The review covered all 62 numbered targets, 127 individual API laws, their 62 Needs lines, 11 layer endings, 31 Checks blocks, the conventions, all 20 named supplier contracts and the seventeen headline groups. Every definition-bearing Checks block has at least three bullets; R01 and R06 concern their correctness/discriminating power. The readable source sample contains all fifteen requested targets. Source verification is distinguished below from proofs that remain unavailable. The computations are falsification tests, not claims to have proved every analytic theorem.

The previous adversarial table contains numerical or symbolic computed values for its 62 target rows. Unchanged rows below retain those eligible computations; all repaired passages and all fifteen seeded targets were read anew, and the listed arithmetic was recomputed. Pure assertions of soundness from the earlier report were not used as evidence. In particular, the scalar-model row was replaced by a phase-sensitive test.

### Adversarial computations: conventions and numbered targets

“Pass” means the displayed instance agrees with the stated formula under its hypotheses; it does not certify an unread source. “Dependent” identifies a theorem whose construction cannot be accepted until its preceding finding is fixed. The third column gives actual values, including wrong-model controls.

| Statement | Instances tried | Computed values on the two sides / negative control | Result and change |
|---|---|---|---|
| Conventions: local fields, norms, characters | ℚ₂, ℚ₃, ℂ/ℝ, split F×F | q=2,3; norm(2) in ℂ is 4, not 2; norm((2,1/2))=1. q=1 and positive-characteristic base fields fail the standing hypotheses. | Pass; preserve residue characteristic 2. |
| Conventions: dimensions, scalar domain | Zero space, split algebra, inseparable algebra, zero ring | U(0)=1; multiplier-recording GU(0)=Gₘ; (1,0)(0,1)=0 in F×F. Characteristic-zero quadratic étale excludes inseparability and the zero ring. | Pass; the split algebra is not assigned a field instance. |
| Conventions: variables and meromorphic quotients | s_U=1/4; s_G=1/2; germ t⁻¹/t⁻² | z=3/4 reflects to 1/4 and s_U to −1/4; s_E=0; germ quotient=t, including its continuation at 0. | Pass; no pointwise division of infinities. |
| 0.1 doubled Hermitian space | h=diag(1,−1); diagonal/antidiagonal vectors; rank zero | Cross-pairing is 2h; coordinates (3,1) become (1,2), with inverse (1+2,2−1)=(3,1); zero-dimensional multiplier remains free. | Pass. |
| 0.2 Siegel modulus | n=1,B=2,λ=1; B=2,λ=4 | Conjugation modulus=1/4 in the first case; scalar similitude gives 1. Replacing the modulus by its inverse gives 4 in the first case. | Pass. |
| 0.3 standard degree and central determinant | Sp₂, SO₃, GSpin₅ | N=3,2,4 respectively; scalar tI₄ has determinant t⁴=χ², not χ or 1. | Pass. |
| 1.1 normalized induction | n=1,B=2,χ=1,s=0 | δ_P^(1/2)=1/2. An extra norm character changes the value to 2; this distinguishes normalized characters. | Pass. |
| 1.2 Godement section | Rank one, positive dilation 4, section normalization; Haar×3 | The square-root dilation factor is 2; rescaling the measure changes value 2 to 6. Zero Schwartz function gives 0. | Pass; explicit measure retained. |
| 1.3 continuation and Weyl transport | χ=norm^i; z=3/4; χ∘det on GL₂ modulo center | χ(2)=4^i transports to 4^(−i); reflected z=1/4. The character has finite L² norm on the finite-volume adelic quotient modulo center. | Repaired discrete-data route passes; compare R02. |
| 2.1 normalized local period | Pairing 2, integral 6; vectors scaled by 5 | I=6/2=3=(30/10); pairing 0 makes normalization undefined and is excluded. | Pass. |
| 2.2 unramified denominator | n=0,1,2; q=2, nonsplit quadratic character, s=0 | d₀=1; d₁=2; d₂=8/9. Replacing the quadratic character by 1 gives 8/3. | Pass. |
| 2.3 spherical identity | Split rank one, X=1/2,Y=1/3 | Z=2+1/2=5/2; d=6/5; dZ=3=2·(3/2). The cross-factor is essential. | Pass. |
| 2.4 returning intertwiner | ℂ/ℝ, χ(z)=z/abs(z), B=i | (χ^c)⁻¹(i)=i; claimed χ⁻¹(i)=−i. Applying conjugate-inverse twice gives χ. | Fail, R02. |
| 3.1 global period pairing | Standard S₃ module, v=(1,−1,0), ℓ=x₃ | ℓ(v)=0 but ℓ((23)v)=−1; incompatibility of representations differs from an orthogonal pair of vectors. | Pass: package avoids the source's erroneous zero-pairing inference. |
| 3.2 MVW/real Cartan | U(1) character z²; GL₂(ℝ) rotation Cartan | Inversion gives z⁻²; inverse-transpose sends aR_φ to a⁻¹R_φ, whereas conjugating by diag(1,−1) gives a⁻¹R_(−φ), the actual inverse. | Repaired real Chevalley route passes. |
| 3.3 Garrett map | Order-three character; zero section; scalar transport | Output χ(g)=ζ₃ differs from χ⁻¹(g)=ζ₃²; section 0 gives 0; f↦3f multiplies the paired value by 3; embedding×2 and dual×1/2 preserve pairing 1. | Pass; arbitrary fixed-section Hecke equivariance is correctly excluded. |
| 3.4 completed unitary function | z=s+1/2; rank-one good factor | Reflection gives −s; normalization gives dZ=3, not 5/2. | Analytic scope passes; character transport depends on R02. |
| 4.1 positivity and dual module | a=b=1, κ=(1;−1), κ=(0;0); compact signature | Gaps are 2 and 0; required bound=2; μ=(0,0) for the first. With a=0, ab=0 and there is no cross-block inequality. | Pass; weak ≥ in the source was visually confirmed. |
| 4.2 scalar realization | n=1,m=3,a_χ=2,b_χ=0,z=exp(iπ/4) | Function value i; proposed dual compact-type scalar −i. At identity both factor determinants are 1 and J_χ=1, while the zero map gives 0. | Fail, R01. |
| 4.3 injectivity | Nonzero generator; same central witness | J_χ(1)=1 excludes a zero map, but the asserted equivariance requires i=−i. | Dependent on R01; nonzero evaluation alone cannot construct the map. |
| 4.4 Cauchy decomposition and Borel | u=2,d=2; u=d=0; two noncommuting shears | 10=3²+1²; constant space has dimension 1. Correct pullback gives [[1,−1],[−1,2]], competing order [[2,−1],[−1,1]]. X₁₁ changes by −1 under the wrong first Borel. | Algebraic checks pass; supplier field repair R05. |
| 4.5 branching | Zero partitions, m=2,a_χ=b_χ=0; then unequal exponents | Old symmetric test gives weights (−2;2); unequal-exponent central scalar must be i, while the stated branch label gives −i. | Dependent on R01; symmetric test insufficient. |
| 4.6 raising operator | r=s=0; r=(1,1), A=[[1,2],[3,4]] | Identity symbol=1, degree 0; Δ₂(A)=−2 versus Δ₁(A)²=1, both degree 2. Weighted minor degree=2, unweighted differences sum=1. | Polynomial/PBW part passes; type label depends on R01. |
| 4.7 highest-line projection | Zero partitions, identically normalized highest line; rescale line by 2 | P=1 initially, coefficient changes by 1/2 under target-line rescaling; zero projection would give 0. | Conditional on corrected branching and rational forms, R01/R05. |
| 4.8 critical section | m=3,a_χ=2,b_χ=0; B=2; unit circle and positive Levi | t=2; 4³·2⁻²=16=4². Central values i versus −i. Corrected χ_u⁻¹,s=3/2 gives 1/16 on the positive Levi, matching J_χ. | Fail, R01; norm arithmetic itself repaired. |
| 4.9 nonvanishing | Scalar disk model, m=2 | Integral 2π∫₀¹r dr=π, finite and nonzero; zero selected vector would give 0 and is excluded. | Correct scalar control; full critical section depends on R01. |
| 4.10 algebraicity and Haar | Same disk, Haar×2; compact signature | π⁻¹I=1; Haar×2 gives 2; ab=0 gives π⁰=1. An arbitrary transcendental rescaling need not lie in E. | Measure check passes; R01/R05 remain upstream. |
| 5.1 (k,c) character | k=3,c=1, adjacent entries 3,7 and nonadjacent entry 4; k=1 | Adjacent trace sum=10, not 14; k=1 gives empty sum 0 and ψ=1. | Pass. |
| 5.2 model definition and Speh comparison | k=1,c=2; infinite-length sum over ℚ₂ | χ∘det has rectangular functional dimension 1 and ordinary generic Whittaker dimension 0. There are 0 exact conductor-one characters over ℚ₂; corrected n≥2 yields max(m−1,0) fixed lines at K(m). | Definition repair passes; R03/R04 support hypotheses and R06 Check remain. |
| 5.3 root elimination | k=2,c=3,l=1; determinant norm=1/2 | The exponent (kc−kl−c+l)/2=(6−2−3+1)/2=1; its value is 1/2. In the 2×2 block ordering, reindexing is (1,3,2,4). | Pass with both transformed factors and the specified permutation. |
| 5.4 doubling geometry | k=1; GSpin₂; Sp₂,k=2 | U is trivial at k=1; dim center=2, dim C_G^•=1, quotient dimension=1, not 0. Adjacent trace values 1,2 give ψ(3). | Pass; distinguished central quotient retained. |
| 5.5 section family | s=1/2; meromorphic scalar (1−q⁻ˢ)⁻¹ | Norm exponent s−1/2=0, factor 1; scalar has a pole at 0, so a meromorphic family is not automatically entire. | Pass. |
| 5.6 estimates | Spherical GL₂ Whittaker, trivial Satake parameters; opposite SL₂ cell | W(ϖ^m)=0 for m<0 and q^(−m/2)(m+1) for m≥0. The opposite-cell absolute integral converges for positive chamber parameter and has logarithmic divergence at 0. | Pass; chamber hypothesis discriminates. |
| 6.1 local integral | k=1; central a and inverse a | Inner unipotent integral reduces to evaluation; central character factors multiply to a·a⁻¹=1. Wrong uncancelled factor a changes descent. | Pass. |
| 6.2 continuation/nonzero data | SO₂, trivial data, q=2,s=1 | L=4,b=4/3,Z=3; Z is nonzero and rational in q⁻ˢ. Zero input gives 0, so existence does not mean every datum is nonzero. | Pass. |
| 6.3 multiplicity one | Generic parameter, equal versus nonisomorphic irreducibles | Open-orbit Hom has dimension 1 versus 0. At exceptional parameters the theorem gives no dimension bound, rather than asserting 1. | Scope passes; full distribution proof is not certified below. |
| 6.4 Whittaker normalization | λ(s)↦exp(s)λ(s); s=0,1/4 | C multiplies by exp(2s−1), giving exp(−1) at 0; reflection 1/4→3/4→1/4. | Pass; excludes an arbitrary rescaled functional with unchanged C. |
| 6.5 gamma definition | c=2,k=1,s=1, trivial characters; Sp₀ | θ=2 over ℚ₂ and 1 over ℚ₃; at s=1/2 its norm factor is 1. Sp₀ contributes (1−q⁻ˢ)/(1−q^(s−1)), not constant 1. | Pass, including residue characteristic 2 and corrected ω_π(i_G). |
| 6.6 gamma identities | Reflected pair; ψ_b with N=3,k=1,b=2 over ℝ | Two reflected gamma factors multiply to 1; norm scalar at s=1/2 is 1 and at s=1 is 2^(3/2). Norm twists shift s additively. | Pass; character factors must also be retained. |
| 6.7 L/epsilon construction | P(X)=1−2X; empty classical GL block; shifts ±1/4 | P(0)=1 versus 3 for 3P; L=(1−2q⁻ˢ)⁻¹; empty Sp tail still contributes L(s,τ); two GL twists give L(s+1/4)L(s−1/4). | Pass on these instances; no zero-germ division. |
| 6.8 spherical normalizer | c=2; rank-one τ; Sp case | b=Sym²-factor at 2s times exterior-square factor at 2s+1; exterior square in dimension 1 is 0 and its L-factor=1; Sp contributes L(s+1,τ). | Pass. |
| 6.9 tempered holomorphy and ratio | SO₂, trivial tempered data; positive Langlands exponent a | L=(1−q⁻ˢ)⁻² is holomorphic for Re(s)>0 and has a pole at 0. The removed negative-shift factor leaves positive-shift L(s+a), nonzero and holomorphic on the claimed boundary. | Pass; unitary and unramified/archimedean restrictions retained. |
| 6.10 stability | Deep ramified twist; GSpin standard degree 4 | Stable local L-factors are 1 on both sides; determinant character is χ², not χ. Equality of gamma factors must use matching central characters before twisting. | Statement passes; CFK22 proof remains uncertified. |
| 7.1 auxiliary integral | k=1,c=2; k=2,c=1; k=c=1 without Schwartz cutoff | Determinant exponents are s+1/2 and s−1/2. The last uncut integral requires Re(s)>0 near 0 and Re(s)<0 near infinity simultaneously. | Pass; k=1 Schwartz datum is essential. |
| 7.2 auxiliary equation | π=sgn on GL₁(ℝ), k=2,3; π=sgn∘det on GL₂ | Sign is −1,+1,+1 respectively; replacing central ω_π by the classical χ_π loses the first sign. | Repaired. |
| 7.3 common divisor | P=1−X/2; {P⁻¹,XP⁻¹}; {t⁻¹,t⁻²} | Pole order at X=2 is 1; inverse-polynomial gcd=P⁻¹. Second family needs order 2 and t²·t⁻²=1 attains it. Multiplication by exp(s) changes orders by 0. | Pass; zero-free ambiguity and multiplicities correct. |
| 7.4 auxiliary RS attainment | L_RS=t⁻¹, auxiliary representative=t⁻² | L_RS/auxiliary=t is entire; reverse ratio t⁻¹ is not. | Pass; domination direction correct. |
| 7.5 open-chart reduction | k=2,c=3,l=1, determinant norm=1/2 | Combined determinant factor has exponent 1 and value 1/2; the inverse convention gives 2. | Pass. |
| 7.6 doubling pole attainment | Z=t⁻²,L=t⁻¹; s_G=1/2 | ord Z=−2≤−1=ord L; quotient t⁻¹ may have a pole. Supplier variable is s_G−1/2=0. | Repaired k=1 scope passes; YAM14 proof remains uncertified. |
| 8.1 global Speh family | c=1; s_G=1/2; section×3 | ρ₁(τ)=τ; s_E=0; each convergent summand and its sum multiply by 3. | Pass; residual representation imported. |
| 8.2 two-term constant term | c=2, c′=1 | M₁ boundary is Re(s)>−1/2; normalized M₂ requires Re(s)>0; M₂=L(2s)/L(2s+1)·N₂. Reversing numerator and denominator is a different operator. | Pass; package correctly repairs the source's analytic-role swap. |
| 8.3 residual exponents | c=2,Re(s₀)=1/4; endpoint 0 | First exponent=−3/4; tail≤1/4; partial sums≤−3/4,−1/2. At 0 the final bound is 0 and no strict L² conclusion follows. | Pass; boundary handled by separate unitary-axis input. |
| 8.4 no essential self-duality | GL₁ τ=1, θ ramified quadratic | On some unit u, θ(u)=−1 while every norm^it(u)=1; forbidden equality cannot hold. With θ=1 it does hold at t=0. | Pass. |
| 8.5 normalizer holomorphy | c=2,s=1/2, trivial rank-one self-pair | The symmetric-square argument is 2s=1 and can have a pole; this case fails the no-essential-duality hypothesis. | Target boundary consistent; contract needs R04. |
| 9.1 global unfolding | SO₂,q=2,s=1; zero vector; GSpin₂ | b_vZ_v=(4/3)·3=4=L_v; moving the place into S changes no product. Zero vector gives 0; distinguished quotient dimension is 1, not 0. | Pass; low-rank source adaptation explicitly checked. |
| 9.2 completed product | One local factor 2; rational b=2; arbitrary idele | Enlarging S gives (1/2)·2=1. Product of rational norms is 2·(1/2)=1; real-only idele has norm 2. | Pass. |
| 9.3 functional equation/strips | SO₂ trivial completion | Completed Λ(s)² equals Λ(1−s)², epsilon 1; pole at 1 means the entireness-dependent strip assertion cannot be invoked. | Pass; strip proof not inferred from the equation alone. |
| 9.4 entireness by orders | ord Q=−1, ord of holomorphic left side≥0 | ord L≥1, hence ≥0. Allowing poles in Q strengthens rather than reverses the conclusion. | Pass. |
| 10.1 weak transfer | Sp₂; two one-dimensional Satake characters a,b | Degree N=3; GL₂ polynomial=(1−aT)(1−bT)=1−(a+b)T+abT². | Pass; determinant and degree retained. |
| 10.2 coarse transfer | GL₂ trivial versus Steinberg | Both supports={ν^(1/2),ν^(−1/2)}; gamma ratio cancellation uses (1−x)/(1−1/x)=−x, while their L-functions differ by L(s−1/2). | Pass; equality of support does not imply isomorphism. |
| 10.3 twisted converse | N=2,3; Satake bound; rational ψ-change | Test ranks are {1} and {1,2}. A term bounded by q^(σ₀+1/2−σ) has prime sum convergence for σ>σ₀+3/2. If ∏abs(α_i)=1, then abs(α_i⁻¹)≤q^((N−1)σ₀). Global ψ-change scalar=1. | Mathematical scope passes; locator R07. |
| 10.4 nongeneric weak transfer | Deep character over ℚ₂; π ramified versus unramified | For deep conductor m≥4, squaring may reduce conductor to m−1, still positive; at an odd prime it preserves deep conductor. η²χ ramified cannot be an unramified norm twist. | Pass; conductor margin and finite local prescription retained. |
| 10.5 every-place coarse comparison | Isolated place η_v₀=1; other bad places; GSpin degree 4 | Isolated test factor is multiplied by 1; matched central determinant is χ². Uncontrolled auxiliary bad factors count 1 rather than 0 unless the contract specifies their locations. | R04 must make cancellation precise. |
| 10.6 existence of coarse local transfer | General local datum; GL₂ trivial/Steinberg support example | Degree bookkeeping N=N₀+2l; same support can give two nonisomorphic representations, so no uniqueness of Π is asserted. | Pass subject to precise globalization contract, R04. |
| 10.7 transfer of general automorphic constituents | Sp₂ and SO₃ with GL₁ Levi block | Degrees 2+1=3 and 2+0=2; the Sp₀ tail differs from SO₁. | Pass; cuspidal-support realization is a declared supplier contract. |

### Individual API-law controls

The suffix A1, A2, … is the order of the prose API bullets within that target. These rows supplement the target and source tables. For linearity/transport rows, choose permitted nonzero data at a regular parameter and rescale their value to 1; then compare scalings 2 and 3, or a realization map 2·id with dual inverse (1/2)·id. These are tests on the stated carriers and normalization laws, not proposed Lean acceptance declarations. Conditional rows do not cure R01.

| Statement | Instance and computed values | Result/change |
|---|---|---|
| 0.1 A1, Gram blocks | h=[1] gives diag(1,−1); its value at (1,1) is 0, not 2. | Pass. |
| 0.1 A2, polarization inverse | (3,1)→(1,2)→(3,1); forgetting the factor 1/2 gives (6,2). | Pass. |
| 0.1 A3, block embedding | For scalar isometries u=i,v=−1, blocks multiply to diag(−1,1) after squaring; GU multipliers 4 and 1 do not define a common similitude. | Pass. |
| 0.1 A4, doubled transport | Isometry multiplication by i sends (x,x) to (ix,ix) and (x,−x) to (ix,−ix); both retain the same subspace. | Pass. |
| 0.1 A5, determination | A-linear part 2 and D-linear part 3 give value 2·1+3·2=8 on polarization coordinates (1,2); zero restrictions give 0. | Pass. |
| 0.2 A1, Levi coordinates | n=1,B=2,λ=1 gives diag(1/2,2), with Δ=2,ν=1; B=2,λ=4 gives diag(2,2),ν=4. | Pass. |
| 0.2 A2, radical addition | Over ℂ, X=i and Y=2i give X+Y=3i; multiplication by i gives −1−2=−3, all Hermitian. | Pass. |
| 0.2 A3, modulus | Previous Levi pair gives 1/4 and 1, respectively; inverse convention gives 4 in the first case. | Pass. |
| 0.2 A4, coordinate injectivity iff | Equal (B,λ)=(2,1) gives identical diag(1/2,2); changing λ to 4 gives diag(2,2)≠diag(1/2,2). | Both directions pass. |
| 0.2 A5, unique factorization | n(X)n(Y)=n(X+Y), so n(i)n(2i)=n(3i); with fixed diagonal, upper-right block recovers X uniquely. | Pass. |
| 0.3 A1, five degrees | Sp₂→3; SO₂→2; SO₃→2; GSpin₂→2; GSpin₃→2. | Pass. |
| 0.3 A2, central restriction | Nonspin χ=1; GSpin scalar character χ evaluated at 2 remains χ(2), not a full-center character in rank 2. | Pass. |
| 0.3 A3, determinant | GSpin₅ scalar tI₄ gives t⁴=(t²)²; Sp₂ standard identity has determinant 1. | Pass. |
| 0.3 A4, pinned transport | Conjugating diag(2,1/2,1) preserves degree 3 and determinant 1. | Pass. |
| 1.1 A1, covariance | n=1,s=0,B=2,λ=1 gives 1/2; χ multiplied by norm gives 2. | Pass. |
| 1.1 A2, common compact picture | At k=1, values of the same compact function are 1 for s=0 and s=1; only extension along P changes. | Pass. |
| 1.1 A3, multiplier-one restriction | ν=1 gives 1^(sn/2)=1 for all s; ν=4,n=1,s=1 gives 2. | Pass. |
| 1.1 A4, extension | Spherical compact value 1 extends at B=2,s=0 to 1/2, and zero compact function extends to 0. | Pass. |
| 1.1 A5, determination | Two compact values 1,1 extend to 1/2,1/2 at that Levi; differing values 1,2 give 1/2,1. | Pass in both directions. |
| 1.2 A1, linearity | Normalized regular values 1+2 map to 3; zero Schwartz function maps to 0. | Pass. |
| 1.2 A2, parabolic law | p=diag(4,1),s=0,trivial χ gives 2 on both sides of covariance. | Pass. |
| 1.2 A3, right translation | For the second row and diag(2,1), (0,x)diag(2,1)=(0,x); composing translations by 2 and 3 gives diag(6,1). | Pass. |
| 1.2 A4, extensionality | Identical Φ have difference 0, hence section difference 0; measure×3 would instead change 1 to 3 and is not an allowed equality. | Pass. |
| 2.1 A1, trilinearity | Scaling the three inputs by 2,3,5 sends normalized Z=1 to 30. | Pass. |
| 2.1 A2, evaluation normalization | I=3,pairing=2 gives 6=Z; zero pairing makes the quotient unavailable. | Pass. |
| 2.1 A3, Haar scale | Haar×3 sends (Z,I)=(6,3) to (18,9); 9·2=18. | Pass. |
| 2.1 A4, realization transport | Vector×2, dual×1/2 preserve matrix coefficient 1 and integral 1. | Pass. |
| 2.2 A1, Tate parity | q=2,n=2,s=0 gives factors 4/3 and 2/3, product 8/9; wrong parity gives 4/3·2=8/3. | Pass. |
| 2.2 A2, recurrence | d₁(1/2)=4/3; new odd-character factor=2/3; d₂(0)=8/9. | Pass. |
| 2.2 A3, inverse character | If χ(ϖ)=2, its inverse is 1/2; with q^(−s−1/2)=1/4 the two Euler arguments are 1/2 and 1/8. | Pass; signs distinguishable. |
| 2.2 A4, empty product | n=0 gives 1; no positive-rank normalized induction is inferred from it. | Pass. |
| 3.2 A1, involution/homomorphism | On the split group θ(g)=g^(−t), so θ(gh)=g^(−t)h^(−t), unlike ordinary inversion; θ²g=g. | Pass on noncommuting shears. |
| 3.2 A2, contragredient | U(1) weight 2 becomes weight −2, evaluating to i and −i at exp(iπ/4). | Pass. |
| 3.2 A3, inner change | Conjugating diag(2,1/2) by the swap matrix gives diag(1/2,2); trace remains 5/2 and the representations are intertwined by the swap. | Pass. |
| 3.2 A4, functoriality | Pullback fixes scalar intertwiner 2·id; two pullbacks return 2·id, composition of 2·id and 3·id remains 6·id. | Pass. |
| 3.3 A1, paired period | Normalized pullback pairing is 1 and corresponding unfolded period is 1; zero section gives 0 on both sides. | Pass. |
| 3.3 A2, bilinearity | Section×2 and cusp vector×3 give paired value 6. | Pass. |
| 3.3 A3, specialized Hecke action | For a scalar eigenvalue a=2 the transported eigenvector has value 2 times its original value; inverse character ζ₃² differs from ζ₃ in the non-self-dual test. | Scope retained; not arbitrary fixed-section equivariance. |
| 3.3 A4, embedding transport | Cusp embedding×2 and dual×1/2 give pairing multiplier 1. | Pass. |
| 4.1 A1, generator | κ=(2;−1) gives dual weight (−2;1), and the p⁻ annihilator is 0 on the generator. | Pass. |
| 4.1 A2, restricted dual | Dualizing again returns (2;−1); annihilation exchanges p⁻ and p⁺. | Pass. |
| 4.1 A3, cohomology degree | a=b=1 gives degree 1 and dimension 1; a=0 gives degree 0, not 1. | Pass in stated range. |
| 4.1 A4, universal extension | Generator map 1↦2 extends 1,x to 2,2x; sending generator to 0 extends to 0. | Pass with annihilator hypothesis. |
| 4.1 A5, equality on generator | Two equivariant extensions with 1↦2 agree on x^j as 2x^j; 1↦3 gives 3x^j and is distinct. | Pass. |
| 4.2 A1, generator image | At identity, v maps to 1; at the central phase in R01 the proposed equivariance demands i=−i. | R01. |
| 4.2 A2, cocycles | Central phases z,w give J(zw)=zw=J(z)J(w), J′(zw)=z̄w̄; for z=w=i both are −1. | Factors pass; module label fails separately. |
| 4.2 A3, GU character | Powers ν⁰ and ν¹ are 1 and 4 at ν=4, although both restrict to 1 on U. | Pass as required extra datum. |
| 4.2 A4, base-point transport | Identity transport leaves J(1)=1; central transport commutes with base-point change, so it cannot change i into −i. | Conditional; R01 persists. |
| 4.6 A1, PBW symbol | r=(1,1) gives Δ₂, value −2 on [[1,2],[3,4]], versus 1 for Δ₁². | Pass. |
| 4.6 A2, rationality | Δ₂ has coefficients +1,−1 in ℚ⊂E; a scalar π multiple is not the chosen algebraic normalization. | Pass once R05 inputs are cited. |
| 4.6 A3, degree | r=(1,1): weighted degree 2; r=(0,0): degree 0. | Pass. |
| 4.6 A4, algebra map | Commuting tangent variables x,y have xy=yx and bracket 0; symbol(x+y)=x+y, symbol(xy)=xy. | Pass. |
| 4.6 A5, recovery | Operators for Δ₂ and Δ₁² have distinct leading symbols, values −2 and 1 on the test matrix; equal polynomials have symbol difference 0. | Pass. |
| 4.8 A1, formula | Zero partitions, B=2,g=1 give 2·1·1=2. | Function formula passes. |
| 4.8 A2, covariance | R01 gives actual phase i and proposed phase −i; corrected inverse χ gives i. | R01. |
| 4.8 A3, rescaling | B:1→2 gives function 1→2 at identity and normalized nonzero integral 1→2. | Formal linearity passes. |
| 4.8 A4, algebraic rescaling | a=3 gives B=2→6, values 2→6 and integral multiplied by 3. | Formal linearity passes; duplicates A3 mathematically but is not Lean padding. |
| 4.8 A5, compact determination | Within the corrected fiber compact values 1,1 extend equally; values 1,2 extend in ratio 2. | Conditional on R01. |
| 5.1 A1, character multiplication | ψ(x)=exp(2πix), adjacent traces 1/3 and 1/6 give ψ(1/2)=−1=exp(2πi/3)exp(πi/3). | Pass. |
| 5.1 A2, stabilizer iff | k=2,c=1, equal Levi scalars preserve trace 1/3; ratio 2 changes ψ(1/3) to ψ(2/3), unequal. | Both directions pass. |
| 5.1 A3, c=1 | GL₃ adjacent entries 1/3,1/6 give ordinary Whittaker value −1 on both definitions. | Pass. |
| 5.1 A4, identity | Adjacent trace 0 gives ψ(0)=1. | Pass. |
| 5.1 A5, ψ-scaling | b=2, trace 1/3 gives exp(4πi/3), different from exp(2πi/3). | Pass. |
| 5.2 A1, coefficient equivariance | W(1)=1 and ψ(u)=ζ₃ give W(u)=ζ₃, not 1. | Pass under model hypotheses. |
| 5.2 A2, diagonal character | k=1,c=2, τ=sgn, g=diag(−1,1): τ(det g)=−1, matching τ∘det. | Pass. |
| 5.2 A3, functional rescaling | λ↦2λ gives W(1):1→2; the image comparison is scalar 2, not unchanged point values. | Pass. |
| 5.2 A4, image kernel | On 1⊕σ with λ on the first summand, (1,0) maps to constant 1 and (0,v) to 0; kernel contains the σ summand. | Pass; excludes false faithfulness. |
| 5.2 A5, function extensionality | Same function 1 has equal value at every g; two preimages differing by (0,v) still give 1, so inverse preimage equality is false. | Pass. |
| 5.2 A6, unique model constituent | k=1,c=2 gives length 1 and model dimension 1; in reducible families exactness is used only after the orbit bound. | R03; finite-length property is not reinserted into the general definition. |
| 5.3 A1, c-split integral | k=1 gives a singleton integration group of mass 1, so value 1 remains 1. | Pass. |
| 5.3 A2, nonzero restriction | For that irreducible line the only nonzero subrepresentation is the line and functional value is 1, not 0. | Pass; assertion is not about arbitrary subquotients. |
| 5.3 A3, transform surjectivity | For the rank-one line, the unit vector maps to nonzero scalar 1 and spans the one-dimensional target. | Pass. |
| 5.3 A4, determinant twist | k=2,c=3,l=1 gives exponent 1 and norm-1/2 factor 1/2 versus untwisted 1. | Pass. |
| 5.4 A1, kernel | Sp/SO kernel dimension 0; GSpin₂ diagonal distinguished center has dimension 1, not the whole-center dimension 2. | Pass. |
| 5.4 A2, transported character | Trace 1/3 and ψ=exp(2πix) give ζ₃⁻¹=ζ₃² on the transported side, not ζ₃. | Sign test passes. |
| 5.4 A3, Levi placement | At g=1, δe(1,ι1)δ⁻¹=1 has radical coordinate 0; the defining graph relation is preserved on multiplication. | Pass boundary control; full coordinates are owned targets. |
| 5.4 A4, simultaneous conjugation | A permutation conjugates diag(2,1/2) to diag(1/2,2); determinant and quotient-volume multiplier stay 1 when the measure is pushed forward. | Pass. |
| 5.5 A1, half-modulus | At s=1/2 the explicit norm twist is 1; a Levi with modulus 4 contributes half-modulus 2, not 4. | Pass. |
| 5.5 A2, compact picture | Same compact vector at identity has value 1 at s=0 and s=1. | Pass. |
| 5.5 A3, polynomial sections | Multiplying a standard section by 1+q⁻ˢ gives value 2 at s=0; multiplying by (1−q⁻ˢ)⁻¹ gives a pole and is not Laurent-polynomial. | Pass. |
| 5.5 A4, extension | Zero compact model function extends to 0; normalized compact vector extends with the half-modulus 2 at the preceding Levi. | Pass. |
| 5.5 A5, equality iff | Compact functions differing by a factor 2 extend in ratio 2; equal compact functions give zero difference everywhere. | Pass. |
| 6.1 A1, trilinearity | Input scalars 2,3,5 give total multiplier 30. | Pass. |
| 6.1 A2, central quotient | Central factors a,a⁻¹ multiply to 1; retaining only a=2 would change the integrand by 2. | Pass. |
| 6.1 A3, two measures | Scaling inner and outer Haar by 2 and 3 multiplies Z=1 to 6. | Pass. |
| 6.1 A4, representation transport | Vector×2 and dual×1/2 retain coefficient and integral 1. | Pass. |
| 6.4 A1, target data | s=1/4→3/4→1/4; with χ_π=1, τ→τ∨→τ. | Pass. |
| 6.4 A2, functional identity | Normalize λ(s)(v)=2; then λ(1−s)(M*v)=2; replacing M* by 2M* gives 4 and fails. | Pass discriminant. |
| 6.4 A3, scalar ratio | Functional values 2 and 3 force normalization multiplier 2/3 in the identity; arbitrary multiplier 1 gives 3≠2. | Pass. |
| 6.4 A4, uniqueness | If a·3=b·3=2, then a=b=2/3; at zero functional 0=0 would not determine a scalar and is excluded. | Pass. |
| 6.4 A5, inducing transport | Transport by 2·id with functional×1/2 gives the same normalized value 2. | Pass. |
| 6.5 A1, defining equation | For a regular datum normalized to Z=1, γ equals the transformed right side; scaling section by 2 multiplies both sides by 2. | Pass under nonzero-data theorem. |
| 6.5 A2, uniqueness | γ·1=γ′·1 implies γ=γ′; restricting to zero sections would give 0=0 and fail uniqueness. | Pass. |
| 6.5 A3, tails | Sp₀ Tate ratio at q=2,s=2 is (3/4)/(−1)=−3/4; trivial SO₀/SO₁ tails give 1. | Pass. |
| 6.5 A4, isomorphism | Evaluation factors 2 and 1/2 cancel; the defining quotient has multiplier 1. | Pass. |
| 6.7 A1, reciprocal polynomial | P=1−2X, constant 1; at X=1/4, L=2, while P=1/2. | Pass. |
| 6.7 A2, Langlands product | Twists ±1/4 contribute L(s+1/4)L(s−1/4); empty Sp remainder contributes L(s,τ), not 1. | Pass. |
| 6.7 A3, epsilon rearrangement | For regular values γ=3,L=2,Ldual=5, ε=6/5 and ε·5/2=3. | Algebraic normalization check passes. |
| 6.7 A4, presentation transport | Same normalized P has constant 1 in both realizations; rescaling by 3 gives constant 3 and is excluded. | Pass. |
| 7.1 A1, integral/multilinearity | k=2,c=1 exponent s−1/2 is 0 at s=1/2; coefficient×2 and model×3 multiply Z by 6. | Pass. |
| 7.1 A2, convolution family | On a normalized one-dimensional compact test, convolution of total mass 1 preserves value 1; mass 2 gives 2 in the same linear family. | Pass; no k=1 deletion inferred. |
| 7.1 A3, GJ/RS limits | k=1 retains Φ; for c=k=1, removing Φ demands Re(s)>0 and Re(s)<0 at the two ends. | Pass; excluded wrong model. |
| 7.1 A4, transport | Matrix coefficient transport 2·(1/2)=1 preserves the same integral value. | Pass. |
| 7.3 A1, entire quotient | {t⁻¹,t⁻²} divided by t⁻² gives {t,1}, both entire. | Pass. |
| 7.3 A2, local attainment | At t=0, the second quotient is 1; first is 0, so “some” cannot be replaced by “every”. | Pass. |
| 7.3 A3, entire defect | Product divisor t⁻² and target t⁻¹ give defect A=t, which vanishes at 0 and is not a unit. | Pass. |
| 7.3 A4, uniqueness up to unit | Multiplying representative by exp(s) changes each quotient by exp(−s), order 0 everywhere; multiplying by t changes attainment at 0. | Pass in both directions. |
| 8.1 A1, sum definition | Zero section gives each summand 0 and sum 0; multiplying section by 3 multiplies every summand by 3. | Pass. |
| 8.1 A2, local matching | c=1 gives ρ₁(τ)=τ, s_G=1/2 gives local exponent 0, identical to s_E=0. | Pass. |
| 8.1 A3, parameter shift | s_G=3/4 gives s_E=1/4; forgetting the half-unit shift gives 3/4 instead. | Pass. |
| 8.1 A4, linearity/translation | Section×2 and right translation by identity give 2E; two right translations compose with the same group product in every summand. | Pass. |
| 9.1 A1, open orbit | k=1 has U={1}; SO₂ example gives local unfolded value Z=3. | Pass. |
| 9.1 A2, Euler normalization | b=4/3,Z=3 give 4=L, not 3. | Pass. |
| 9.1 A3, quotient measure | One measure×2 changes both global integral and corresponding local factor by 2. | Pass. |
| 9.1 A4, trilinearity | Section/vector/vector scalars 2,3,5 give multiplier 30. | Pass. |
| 9.2 A1, product | Partial value 3 and local correction 2 give completed value 6. | Pass. |
| 9.2 A2, S-independence | Moving local factor 2 changes 3 to 3/2 and 2 to 4; total remains 6. | Pass. |
| 9.2 A3, ψ-independence | Rational b=2 gives norm product 2·1/2=1; real-only idele gives 2. | Pass. |
| 9.2 A4, continuation uniqueness | Difference on the convergence half-plane is 0, hence zero continued germ; adding constant 1 already gives difference 1 there. | Pass. |
| 10.1 A1, good Satake match | Sp₂ identity class gives characteristic polynomial (1−T)³ on both standard sides. | Pass. |
| 10.1 A2, infinite character | Trivial standard parameter has three zero eigenvalues for Sp₂ transfer; a nonzero infinitesimal character is excluded. | Pass. |
| 10.1 A3, isomorphism invariance | Conjugating a 3×3 Satake matrix preserves trace, determinant and characteristic polynomial; identity class remains I₃. | Pass. |
| 10.1 A4, witness converse | Good match outside S={v₁,v₂} leaves exactly two permitted finite exceptions; adding an infinite mismatch still fails the separate archimedean clause. | Pass. |
| 10.2 A1, gamma tests | GL₂ trivial/Steinberg yield equal test gamma functions, although their ordinary Whittaker dimensions are 0 and 1. | Pass. |
| 10.2 A2, reduction to supercuspidals | A test induced from two characters gives product γ₁γ₂; matching each γ_i matches their product. Omitting one leaves an uncontrolled factor. | Pass with multiplicativity. |
| 10.2 A3, support class | Both GL₂ examples have support {ν^(1/2),ν^(−1/2)} and cancellation (1−x)/(1−1/x)=−x. N=1 would have no allowed lower-rank tests. | Pass with N≥2 for converse. |
| 10.2 A4, isomorphism invariance | Transport preserves all local factors with scalar multiplier 1, as vector/dual scalings 2 and 1/2 cancel. | Pass. |

### Declared supplier contracts: precise scope and computed controls

The twenty named slugs and needs sentences agree exactly between the README and the plan. They are contracts, so absence of their future implementation is not itself a finding. R03–R04 identify defects in the requested propositions, not missing implementations. The six legacy G records are handled under F01 above; they are not newly counted as unowned gaps.

| Gap slug | Computed control and scope decision |
|---|---|
| hermitian-unitary-groups | Zero rank gives U=1, GU=Gₘ; split E has two nonzero idempotents with product 0. The requested group schemes, multiplier and block morphisms are extra to the supplied form carriers. |
| gspin-group-schemes | For q(x,y)=xy, q(1,1)=1 is a unit; even Clifford elements supply the intended rational points. At c=2 the full central dimension is 2 and the distinguished cocharacter dimension 1. Existing Spin→SO does not supply this reductive group scheme. |
| classical-support-quotient | For GL₂ support {ν^(1/2),ν^(−1/2)}, the chosen ordering has trivial quotient and Steinberg subrepresentation; reversing the ordering exchanges the roles. A support subquotient statement alone does not specify the required quotient orientation. |
| rectangular-orbit-support | Prefix sums for (4) and (2,2) start at 4 and 2. A generic GL₄ representation cannot be required to vanish at (4) without a support/derivative hypothesis. R04. |
| standard-archimedean-transfer | Trivial Sp₂ parameter maps to I₃, determinant 1; GSpin₅ scalar maps to tI₄, determinant t⁴=χ². The existing real GL parameter theory does not supply the standard classical transfer. |
| opposite-unipotent-estimate | In the SL₂ real opposite cell the absolute integrand behaves as (1+x²)^(−s−1/2): integral finite for s>0, logarithmically divergent for s=0. Open positivity and continuity of the bilinear form are meaningful extra requirements. |
| real-chevalley-contragredient | On ℝ×, π(x)=abs(x) becomes abs(x)⁻¹ under inversion; the identity involution leaves abs(x). Fundamental-Cartan inversion excludes the latter. ADAMS14 supports the requested range. |
| controlled-supercuspidal-globalization | A single uncontrolled ramified auxiliary place leaves one uncancelled local factor; requiring auxiliary places to be good for π and Π reduces this count to zero by §6.8. Exact sets and local prescriptions are still needed, R04. |
| archimedean-wavefront-whittaker | A character of GL₂ has orbit (1,1): ordinary generic Whittaker dimension 0, while its zero-orbit functional space has dimension 1. The maximal-orbit condition distinguishes these two cases. |
| archimedean-induced-wavefront | Inducing two GL₁ characters generically gives GL₂ orbit (2), dimension 2, although each inducing orbit has dimension 0. A direct sum of two copies doubles the associated-cycle multiplicity from 1 to 2. |
| archimedean-derivative-models | For k=c=2, two highest derivatives of order 2 take GL₄→GL₂→GL₀ and a terminal line has dual dimension 1. Orbits (3,1) and (4) have first prefix >2 and must be excluded by the derivative hypothesis. |
| archimedean-degenerate-derivative | For k=1,c=2, χ∘det differentiates to χ on GL₁; the next derivative reaches a line on GL₀. At c=1 the empty GL₀ datum is one-dimensional, not zero. |
| archimedean-whittaker-exactness | (2,2) satisfies the relevant bound; (4) fails 4≤2. The contract is broader than GGS17 Corollary G and than the application, R03. |
| eisenstein-pole-cuspidal-detection | A rank-one Eisenstein residue with leading term t⁻¹ has order 1; its cuspidal-support constant term has the same order 1. A bare meromorphic-continuation statement permits order 0 in an unrelated projection and is insufficient. |
| speh-cusp-normalized-intertwiner | c′=1 gives Re(s)>0; c′=3 gives Re(s)>−1/2. The normalized ratio is L(2s+c′)/L(2s), and undoing it gives the reciprocal ratio. This is an extension beyond the supplier's generic GL estimate. |
| twisted-square-normalizers | GL₁ τ=χ=1 has symmetric-square factor ζ(u), with a pole at u=1. No-essential-duality must exclude it; precise factors and u-range are missing, R04. |
| hermitian-residual-support | For the SL₂ residual constant representation, support exponents ρ and −ρ are in the same Weyl orbit; the Weyl action is the sign change. Hermitian support is an extra condition beyond square integrability. |
| automorphic-constituent-support | The trivial SL₂ constituent is a quotient at positive parameter ρ; for a cuspidal representation P=G and λ=0. The supplier's decomposition needs the stated realization theorem to cover both cases. |
| gamma-supercuspidal-support | At N=1 the test-rank set is empty, so distinct characters would pass vacuously; N≥2 excludes this. For N=2, trivial and Steinberg have identical support but distinct representations, as the target correctly permits. |
| nongeneric-pair-epsilon-character-change | N=2,k=1,b=2 and trivial central characters give local multiplier 2^(2s−1) over ℝ, equal to 2 at s=1; the ℚ₂ multiplier is 1/2, so their global product is 1. |

### Source sample and repaired-source verification

All locators below refer to the cached version actually read. CFK uses arXiv v5; MODELS and GGS17 use the recorded preprints; EHLS/HARRIS/GARRETT use their recorded page numbering. Printed-page glyphs in EHLS pp.70,72–73 were also inspected in the PDF: the positivity signs are weak inequalities and the conjugations in J′ are present. OCR omissions of those marks are not source errata. The new GGS17 source was fetched through the add-only source service from arXiv; no existing manifest entry was changed.

| Requested target | Locator opened | Hypotheses and comparison outcome |
|---|---|---|
| 2.4 unitary local functional equation | EHLS §§4.1.3–4.1.4, pp.45–48, EHLS lines 1893–2079; MetaplecticAutomorphicForms §6.10a | EHLS describes the period/section conventions, not a complete proof of the exact transported local scalar. The target correctly assigns the comparison locally and imports the general theorem. Its returning character still fails R02. |
| 3.3 Garrett pullback | EHLS §§9.1.1–9.1.4, equation (178), Theorem 9.1.3, pp.149–150, EHLS lines 6350–6415 | Output is π in the specified function realization. Nearly holomorphic specialized Hecke compatibility is narrower than arbitrary fixed-section equivariance; the package preserves that distinction. |
| 3.4 unitary standard L-function | EHLS §§4.1.4–4.2.1, pp.45–49, EHLS lines 2020–2115; MetaplecticAutomorphicForms §§6.10a–6.11 | Unramified comparison and Euler extraction support the normalization route; the complete local/global theory comes from the named supplier. Meromorphy, finite S and nonzero local data are retained; the character repair R02 propagates here. |
| 4.2 scalar holomorphic model | EHLS §4.4.2, (92), pp.71–73, EHLS lines 3330–3435; PDF p.72 | Integers, scalar range and J/J′ factors were checked. The author's conversion to a dual compact type reverses the central character, R01. |
| 4.8 critical section | EHLS Lemma 4.5.2, Remark 4.5.3, (107), p.80, EHLS lines 3630–3683; algebraic character at EHLS line 3373 | The source fixes an actual critical inducing character; integer m and unitary t differ as repaired. Neither the norm calculation nor an unspecified parameter can correct the phase in R01. |
| 4.9 critical nonvanishing | EHLS Proposition 4.5.5, pp.80–81, EHLS lines 3684–3695; HARRIS Remark 4.4(iv), pp.27–28, HARRIS lines 1184–1196 | Nonvanishing is for the holomorphic Siegel–Weil/theta image and specified pairing. The package now owns that specialized comparison rather than assuming arbitrary theta nonvanishing. Its input section still depends on R01. |
| 5.2 (k,c) models | MODELS Definition 1, Proposition 2, Theorem 4 and following discussion, pp.2–6, MODELS lines 94–128, 147–222 | Admissibility versus finite length, unitary quotient construction and reducible induced model are distinguished correctly. The exactness step invokes a restricted theorem, R03; the ℚ₂ Check fails R06. |
| 6.5 gamma factor | CFK (3.6)–(3.7), Remark 3.4, pp.15–16, CFK lines 613–633 | Central ω_π(i_G), χ_π/χ_τ, all powers of 2, Sp-only factor and low-rank tails match. ψ and measure choices remain fixed. |
| 6.9 tempered holomorphy | CFK Theorem 3.8 and Corollary 3.9, p.18, CFK lines 711–724 | Finite unramified or archimedean π, tempered versus unitary generic τ, unitary χ_π and the nonzero meromorphic ratio are retained. The boundary distinction Re(s)>0 versus Re(s)≥1/2 is correct. |
| 7.1 auxiliary integral | CFK Appendix A.1, (A.1) and preceding k=1 formula, pp.42–43, CFK lines 1832–1881 | Both determinant exponents and the additional Schwartz function at k=1 match. No nonexistent common convergence strip is asserted for the two unregularized tails. |
| 7.3 common pole divisor | CFK Theorem A.6, (A.19), pp.50–51, CFK lines 2336–2381 | Unitary generic τ, k>1 and the finite-unramified/archimedean π range match. At infinity the invariant is a divisor; the multiplicative defect is entire, not necessarily invertible. |
| 8.3 residual exponents | CFK Lemma 4.4 and proof of Theorem 4.1, (4.6)–(4.8), pp.36–38, CFK lines 1584–1655 | The last partial sum j=c remains strictly negative only for Re(s₀)>0. The separate unitary-axis assertion and Hermitian-support contract are necessary and present. Even orthogonal/spin alternatives are retained. |
| 9.1 global period/unfolding | GK §3.2, Corollary 3.7 and (3.8), pp.70–73, GK lines 4022–4198; CFK (4.10), pp.38–39, CFK lines 1653–1712 | Cuspidality, global Speh Fourier support, initial convergence, second involution and central quotient were checked. GK lines 4193–4198 explicitly discuss low-rank adaptations; SO₂ was not silently excluded. |
| 9.2 completed function | CFK §4.3, pp.38–39, CFK lines 1653–1713; local laws in Theorem 3.5 | All places, including infinity, enter. Moving a good place between partial and local products cancels; global ψ-change uses rational b and global central characters. |
| 10.3 twisted converse | CFK Theorem 2.1, pp.8–9, CFK lines 321–353; CKPSS01 §2, pp.8–10, CKPSS01 lines 141–232; CPS94 Lemmas 2.1–2.3, pp.161–165 | Nonempty finite S of finite places, ranks 1 through N−1, unitary fixed twist, entire dual completions, strip bounds, central descent and equality at every place outside S match. CKPSS's standard modules and mirabolic argument were read, not inferred from the theorem's title. R07 corrects the CPS proof page interval. |

HLS §3.1 was also reread at HLS lines 1707–1831: its normalized Eisenstein setup is present, and footnotes 7–8 explicitly qualify the general unitary archimedean continuation reference. This was not treated as a read primary proof. Its denominator and base-change-rank misprints are explicitly corrected in EHLS lines 2109–2116. The compact-support local integral must retain its evaluation pairing: with volume 1 and pairing 2 its value is 2, not 1.

Additional changed-source passages checked: ADAMS14 Theorem 1.2/Corollary 1.4 at ADAMS14 lines 35–65 and the globalization interpretation at lines 300–320; HEN02 Proposition 1.9 at lines 216–227 and proof at lines 604–659; CPS94's ψ-change proof at lines 186–255; CFK Remark 3.11 at lines 730–737 and Theorem A.1/(A.3) at lines 1882–1918; HARRIS Remark 4.4(iii) at lines 1170–1183; GARRETT's measure and qualitative theorem at lines 164–217. The latter theorem concerns its E-rational convolution kernel, so the package correctly retains a separate comparison rather than declaring arbitrary scalar kernels algebraic.

### Library and ownership audit

The content main revision read was `7bd35ba3a6197cb1fadd5dac74e67499aa22b3b4`. The pins were Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Three main-branch roadmaps were read for shape: RepresentationTheory/ClassicalGroups, OrthogonalSpinGroups and ReductiveGroups. Open revisions of existing roadmaps were not substituted for main.

The paths in the following table are relative to the respective pinned library root. These were opened, not inferred from declaration names.

| Pinned declaration or object | File and line | What it actually supplies; computed control |
|---|---|---|
| `Matrix.fromBlocks` | `Mathlib/Data/Matrix/Block.lean:45` | A rectangular block constructor; empty blocks are allowed. A 1×1 block pair 1,2 remains the ordered pair 1,2. |
| `Matrix.fromBlocks_multiply` | `Mathlib/Data/Matrix/Block.lean:213` | Finite contracted indices and nonunital nonassociative semiring coefficients; upper-left block is AE+BG. Scalars 1,2,3,4 give 1·3+2·4=11. |
| `Matrix.conjTranspose` | `Mathlib/LinearAlgebra/Matrix/ConjTranspose.lean:43` | Transpose followed by star; [i]ᴴ=[−i]. Star alone carries no topology. |
| `Matrix.IsHermitian` | `Mathlib/LinearAlgebra/Matrix/Hermitian.lean:44` | Equality Aᴴ=A; zero and diag(1,−1) both satisfy it. Neither positivity nor nondegeneracy follows. |
| `Matrix.trace` | `Mathlib/LinearAlgebra/Matrix/Trace.lean:43` | Finite diagonal sum over an additive commutative monoid; diag(3,7) has trace 10 and empty trace is 0. |
| `AddChar` | `Mathlib/Algebra/Group/AddChar.lean:70` | Zero/addition preservation for additive-monoid to multiplicative-monoid maps. Constant 1 qualifies; nontriviality, continuity and unitarity must be separately asserted. |
| `lipschitzGroup` | `Mathlib/LinearAlgebra/CliffordAlgebra/SpinGroup.lean:61` | Subgroup closure of invertible vectors inside Clifford units. This is not a reductive group scheme or a root datum. For q(x,y)=xy, (1,1) has unit norm 1. |
| `spinGroup` | `Mathlib/LinearAlgebra/CliffordAlgebra/SpinGroup.lean:292` | Even elements of the star-unitary part, presented as a submonoid. It is not automatically the GSpin similitude group; scalar 2 has norm 4, not 1. |
| `CliffordAlgebra.mem_lipschitzGroup_iff_involute_act_ι_mem_range_ι` | `TauCeti/LinearAlgebra/CliffordAlgebra/Lipschitz/CliffordGroup.lean:138` | Field, finite dimension, invertible 2, nondegenerate Q and a vector of unit Q-value. On even elements the main involution is identity; zero rank lacks the unit-value witness. |
| `TauCeti.YoungTableau.weylModule` | `TauCeti/RepresentationTheory/ClassicalGroups/WeylModule/Basic.lean:130` | Actual Young-symmetrizer image over a commutative ℚ-algebra; no full Schur functor on arbitrary modules is claimed by this definition. |
| `TauCeti.weylModuleOfShape`, `TauCeti.weylRepOfShape` | Same file :429 and :441 | Shape-selected module and GL action over the same coefficients; the empty diagram gives the tensor-unit line. These repair R05 without rebuilding the carrier. |
| `TauCeti.isIrreducible_weylRepOfShape_iff` | `TauCeti/RepresentationTheory/ClassicalGroups/WeylModule/Irreducible.lean:160` | Field of characteristic zero; irreducible iff number of rows≤n. For n=1, (2) is allowed and (1,1) is zero. |
| Schur–Weyl character comparison | `TauCeti/RepresentationTheory/ClassicalGroups/WeylModule/SchurWeyl.lean:20` | The file explicitly distinguishes its character identity from a constructed module decomposition. At n=d=2 its dimension identity is 4=3+1. It does not by itself supply the two-block Cauchy isomorphism. |

Eight Mathlib names were also elaborated together with `#check @name` in one scratch file; the hypotheses above agree with the expanded signatures. The Tau Ceti declarations were checked at source; no unused Tau Ceti import was added. Existing algebraic representations, Weyl modules, polynomial/matrix carriers and adelic scalar rings are not confused with admissible smooth representations, Casselman–Wallach globalizations or automorphic representation spaces.

Ownership searches used `roadmaps grep` by object (generalized doubling, Speh, Siegel Eisenstein, Garrett kernels, rectangular Whittaker support, wave-front sets, Chevalley contragredients, GSpin schemes and rational Schur constructions), then `roadmaps show` to open relevant hits. They covered main and the service's 352 open-head index. The board-package index was read before checking its twenty separate heads: five had package READMEs, and fifteen had design documents instead, all searched by object. AutomorphicCongruences uses the existing doubling theory for p-adic interpolation; its occurrence is a consumer, not a second owner of this complex analytic construction. GanGrossPrasadUnitaryGroups requests related Hermitian group schemes from ReductiveGroupsPartII; it does not own a rival generic U/GU construction. ClassicalGroupsPartII's rational GSp direction is not a replacement for the arbitrary-GL coefficient citation in R05. No competing owner of the new generalized-doubling normalization, holomorphic kernel comparison or nongeneric weak-transfer proof was found. The names of external pull requests are not used as dependencies.

### Cross-roadmap citations resolved and direction checked

Every Needs line and supplier citation was read. `roadmaps resolve` reported no unresolved roadmap citation or Lean name; its host did not have the pinned Lake packages, so that result was supplemented by the direct pin checks above. The table records the relevant section contents, including limitations, rather than treating successful name lookup as proof of supply. Paths here are relative roadmap paths, at main or the supplied open head as applicable.

| Supplier path and resolved sections | Evidence and boundary |
|---|---|
| `TauCetiRoadmap/ReductiveGroups/README.md:627`, Layer 7 | Rational parabolics, Levi and root/Weyl structure for a given reductive group. Layer 10A at :1733 supplies rational representation and base-change machinery, not an automatic rational normalization of an arbitrary complex isomorphism. |
| `TauCetiRoadmap/OrthogonalSpinGroups/README.md:306` and :383, Layers 0–1 | General-field orthogonal/SO carriers and Clifford/Spin maps, with characteristic different from 2; not arbitrary quadratic-étale U/GU. |
| `TauCetiRoadmap/ReductiveGroupsPartII/README.md:464`, RG2.0.1–0.2; RG2.0a; RG2.4; RG2.5.1–5.2 | Point topology/local group, restriction of scalars, decompositions/modulus, dual and L-groups of supplied reductive groups. Hermitian and GSpin concrete group schemes are correctly named gaps. |
| `TauCetiRoadmap/RepresentationTheory/ClassicalGroups/README.md:216` and :237 | Schur and highest-weight theory over the standing field ℂ (:28). General-field attribution fails R05; the native Weyl constructors supply a repair. |
| `TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md:800`, SR.0.4; :1833, :1962, :2122, SR.2.1–2.3; :2768, SR.3.3; Layer 4; :4324 and :4717, SR.5.2–5.3 | Admissible duals, normalized induction/Jacquet/geometric lemma, conditional tempered-support classification, Satake, segments and highest derivatives. The segment and highest-derivative targets are different sections and have the corrected orientation. General orbit support is not silently read into ordinary Jacquet exactness. |
| `TauCetiRoadmap/AdelicAlgebraicGroups/README.md:558`, §§0.1–0.4; AA.1; :1648 and :1815, §§2.2–2.3 | Restricted products, measures/Fubini, adelic points, quotient integration and central quotients. Their local compactness, measurability and countability conditions remain in the package conventions. |
| `TauCetiRoadmap/GL2AutomorphicRepresentationsAndTransfer/README.md:579`, R16.1.8 | Finite-image characters on full local multiplicative groups, trivial infinite components, extra finite ramification and larger global order. This supplies the prescription removed from the gap list. |
| `TauCetiRoadmap/AutomorphicLFunctionsAndLocalFactors/README.md`, AL.0–AL.4 and Representation prerequisites | Fourier/Tate/Godement–Jacquet, generic GL pair factors and exponent bounds, Euler products, isobaric sums and strong multiplicity one. The specialized fixed-twist outside-S converse has a different testing family and remains a target here. |
| `TauCetiRoadmap/AutomorphicFormsOnReductiveGroups/README.md:364`, §§2.1–2.7; :553, §§3.4–3.5; :616, §4.2; :762 and :784, §§5.3–5.4; :922 and :943, §§6.1–6.2 | Real normalized induction, Harish–Chandra/CW and restricted tensors, cuspidal occurrences and cohomological/Hermitian structures. §4.2's occurrence statement is not a prescribed-local globalization theorem; the package names a gap, whose precision needs R04. Ordinary GL parameters do not supply classical standard transfer. |
| `TauCetiRoadmap/AutomorphicSpectralTheory/README.md:891`, §§1.1–1.4; :1536, §§2.1–2.6; :1591, §2.3a; :1621, §2.4a; :2526, §4.14a; :2905, §5.12 | Discrete unitary data, meromorphic smooth Eisenstein families including unitary-axis regularity, GL estimates, residual Speh and support decomposition. The extra pole/support/Speh-block assertions are declared contracts; the global residual representation is not constructed twice. |
| `TauCetiRoadmap/EndoscopicTransferAndUnitaryTraceComparison/README.md:1892`, §5.1; :4054, §10.29 | Same AST residual block; nongeneric GL factors from ordered segment/Langlands data. Equal-support gamma invariance follows; converse and nongeneric ψ-change are named additions. Global endoscopic transfer is not used to prove the target transfer. |
| `TauCetiRoadmap/GeometryOfNumbersAndQuadraticArithmetic/README.md:1194`, §2.9 | Although the classification subsection has odd-residue-characteristic hypotheses, its opening paragraph explicitly gives the signed-Hermitian carrier/adjoint over any commutative involutive field. Hence the carrier citation does not exclude ℚ₂; its classification theorems are not consumed at that generality. |
| `TauCetiRoadmap/MetaplecticAutomorphicForms/README.md:607`, §3.2a; :619 and :647, §§3.3/3.3b; §§3.5–3.7; :733, §3.15; :1554, §6.2; :1675 and :1689, §§6.10a–6.11 | Split étale pairings, oscillator normalization/theta, nonarchimedean MVW, Siegel–Weil family, classical standard doubling/factors/gcd/archimedean tests/completion. The package owns its exact EHLS transport and specialized holomorphic comparison, with R01–R02 still required. |

The dependency check was run with the requested `--movable` option and returned, verbatim:

```text
moved: AutomorphicLFunctionsAndLocalFactorsPartII moved in the merge order from #26 to #167, right after its last supplier MetaplecticAutomorphicForms (SmoothRepresentationsOfLocalGroups, AdelicAlgebraicGroups, AutomorphicFormsOnReductiveGroups, GeometryOfNumbersAndQuadraticArithmetic, AutomorphicLFunctionsAndLocalFactors, AutomorphicSpectralTheory, GL2AutomorphicRepresentationsAndTransfer, EndoscopicTransferAndUnitaryTraceComparison also came after it); checked as moved (the worker moves it there when it submits)
depcheck: 48 roadmaps, 547 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. The reported move is permitted and is not a defect; no merge-order file was edited. Internal construction order is acyclic: Layers 5–6 feed the independent pole-attainment and Eisenstein-holomorphy arguments in Layers 7–8, which meet in Layer 9 before transfer in Layer 10. The general analytic and representation inputs are earlier suppliers after the permitted move.

### Headline and Lean acceptance audit

`lake env lean` on the package's actual `Suggested.lean`, run from the pinned content checkout with the package file supplied by absolute path to the command, exited 0 with no output and no warnings. The file has one `import Mathlib`, one module docstring and the correct empty namespace. There are zero declarations, zero admitted data definitions, zero `set_option` commands and zero admitted examples. Consequently the per-declaration expanded-signature comparison and one-tactic padding probe each have an empty domain; nothing was proved in place or inserted as padding. No Tau Ceti module is imported, so no missing object build was required.

The headline list in the summary and layer endpoints was compared against the docstring, not against a count quota:

| Headline group | README | Missing carrier accurately named in the docstring |
|---|---|---|
| Unitary Eisenstein continuation/functional equation | 1.3 | Normalized unitary induction and automorphic Eisenstein families. |
| Unitary local equation and exact spherical normalization | 2.2–2.4 | Admissible unitary representations, section families, doubling intertwiner and local factors. |
| Global unitary identity and Garrett pullback | 3.1–3.3 | Cuspidal adelic unitary representations, Petersson realizations and kernels. |
| Meromorphic completed unitary standard function | 3.4 | Those automorphic carriers and ramified local factors. |
| Holomorphic injection/branching/highest-line projection | 4.3–4.7 | Harish–Chandra U(a,b) modules, holomorphic discrete series and branching maps. |
| Critical integral nonvanishing/algebraicity | 4.8–4.10 | Actual critical induced fiber and rational projected-kernel integral. |
| (k,c) models and root elimination | 5.1–5.3 | Smooth/CW GL representations, generalized Speh and continuous Whittaker functionals. |
| Generalized local continuation/multiplicity/equation | 6.1–6.6 | Classical normalized induction, equivariant continuous Hom spaces and local factors. |
| Ramified stability | 6.10 | Those admissible carriers and canonical nongeneric pair factors. |
| Auxiliary pole domination/attainment | 7.1–7.6 | Speh matrix-coefficient integrals, families and Langlands data. |
| Nonessentially self-dual Eisenstein holomorphy | 8.1–8.5 | Residual automorphic Speh data and cuspidal exponents. |
| Global unfolding/equation/strip bounds | 9.1–9.3 | Adelic cuspidal classical representations and completed-factor families. |
| Ramified-twist entireness | 9.4 | Those automorphic and completed-factor carriers. |
| Fixed-twist converse | 10.3 | Admissible adelic GL representations, automorphy and all-rank pair completions. |
| Nongeneric cuspidal weak transfer | 10.4 | Cuspidal classical/automorphic GL representations and archimedean standard transfer. |
| All-place coarse compatibility/local existence | 10.5–10.6 | Local/global admissible representations, support and gamma testing. |
| General automorphic weak transfer | 10.7 | Cuspidal-support realization and automorphic isobaric induction. |

The algebraic Cauchy calculation in §4.4 is a statable supporting representation-theoretic result, not one of the claimed holomorphic headline substitutes; its native Weyl modules are explicitly acknowledged above. Its existence does not make a theorem about Harish–Chandra branching statable on the pins. No missing statable end theorem or padding declaration was identified. Searches distinguished these analytic carriers from abstract algebraic `Representation`, matrix actions, native Weyl modules, modular-form Eisenstein series and idele rings.

The README otherwise has the required title, Summary, ownership, conventions, exact suppliers, build paragraph, 11 numbered layers with Examples and Dependencies, consumers and references. It retains full ramified and archimedean scope, has no good-prime-only replacement, no computational algorithm and no copied source passage identified in the checked material. No forbidden Lean import, route-specific substitute, namespace collision or general-theory re-plan was found. No suspicious instruction embedded in a source was followed.

## Not verifiable

- **CFK22 Lemma 7.3 and the full corrected local-theory proof:** the manifest records this text as uncertified. Its citation in CFK and the described extensions were read; the primary proof was not. It was not requested again.
- **KAP23 Theorem 25:** settled uncertified. CFK's precise uniqueness statement and attribution were checked, but the primary uniqueness proof was not read. It was not requested again.
- **YAM14 Theorem 7.1 and proof:** settled uncertified. The package's explicit k=1 target and the supplying roadmap's good-section/holomorphic-section assertions were checked, not the unavailable primary proof. It was not requested again.
- **Complete analytic proofs behind the generalized local theory and GK distribution vanishing:** GK Theorem A, its distribution hypotheses/geometry and §3.2 unfolding were inspected. This does not certify every conormal-distribution argument or the unavailable corrected CFK22 proof. These are owned mathematical targets, not empty assumptions.
- **Fifteen board package READMEs absent at their indexed heads:** their available design documents were searched instead. They are ArithmeticLocallySymmetricSpacesPartII, CompletedCohomologyAndLocalGlobalCompatibilityPartII, CrystallineCohomologyPartII, EndoscopicTransferAndUnitaryTraceComparisonPartII, HigherHidaAndColemanTheory, LawrenceVenkateshMethod, OrdinaryAutomorphicFormsAndModularityLiftingPartII, PELModuliPartII, PadicHodgeTheoryPartII, PadicLocalLanglandsForGL2QpPartII, RealSurfacePeriodIndex, SchemeAndStackFoundationsPartII, ShimuraVarietiesPartII, VStackSheavesAndLisseCategoriesPartII and VectorBundlesAndIsocrystalsPartII. No claim that those roadmaps exist nowhere is made.

No new missing-text request remains. GGS17 was legally obtained and recorded. The prior EHLS inequality/conjugation ambiguity was resolved by viewing the PDF pages, not left as an unread locator.

## Source issues

- **Misprint** in EHLS at §4.1.1, printed p.44: the source says the unrescaled polarized radical consists of Hermitian blocks; it should be skew-adjoint blocks, made Hermitian by a chosen trace-zero scalar; affects nothing.
- **Error** in EHLS at §4.1.4, printed p.47: the source says a zero Petersson pairing forces all corresponding doubling periods to vanish; it should be vanishing for incompatible representations, since orthogonal vectors can have nonzero translated matrix coefficients; affects a stated result.
- **Misprint** in CFK at proof of Lemma 4.3, printed p.36: the source says holomorphy of the shifted numerator and nonvanishing of the unshifted denominator establish holomorphy after undoing normalization; it should be holomorphy of L(2s) and nonvanishing of L(2s+c′), in the reciprocal ratio; affects the proof.
- **Misprint** in HEN02 at §5.3, printed p.602: the source says the testing condition uses π in the rank-r class and s as the second additive-character argument; it should be ρ in the rank-r supercuspidal class and ψ as the additive character; affects the proof.
- **Error** in HEN02 at §5.3, printed p.602: the source says Proposition 5.2 implies π=π′ in the nonsupercuspidal case; it should be equality of supercuspidal supports, as Proposition 1.9 states; affects the proof.
- **Misprint** in HEN02 at the parameter argument of §5.3, printed p.602: the source says Weil–Deligne parameters belong to representation class A⁰ and concludes equality from Proposition 5.2; it should be parameter class G⁰ and equality of the restrictions to the Weil group in the reducible case; affects the proof.
- **Misprint** in HLS at (3.1.2.5), printed p.44 of the recorded author version: the source says the quadratic-character exponent contains an additional n−1; it should be the exponent without that n−1, with the inducing-character restriction retained; affects a stated result; corrected in print at EHLS §4.2.1, printed p.49.
- **Misprint** in HLS at the base-change comparison following (3.1.2.8), printed p.45 of the recorded author version: the source says the base-change representation has rank m; it should be rank n; affects nothing; corrected in print at EHLS §4.2.1, printed p.49.
- **Error** in HLS at (3.1.2.9), printed p.45 of the recorded author version: the source says the compact-support local integral equals vol(K_v) for the chosen vectors; it should be vol(K_v) times their evaluation pairing, or explicitly assume that pairing equals one; affects a stated result.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "38b858c23a1acaa334208b86d85a3bdfa95c0f1b", "job": "REV-PKG-AutomorphicLFunctionsAndLocalFactorsPartII~2", "model": "gpt-6-astra", "worker": "chris-8"} -->
