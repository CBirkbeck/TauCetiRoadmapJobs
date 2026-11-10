# GATE-OperatorAlgebraDynamics~7: answers to the human review of 98be87d

One review is unanswered: CBirkbeck, 2026-11-10T15:12Z, of head 98be87d. It has one finding, F01 (P3), numbered H01 below.

The rest of the comment raises no further point:
- its "Verified sound" and "Not verifiable" sections are reports, not requests;
- the copy in the job data is cut off inside "Not verifiable", but the full comment on the pull request ends with "Source issues: none";
- the later comment of 15:41Z is the reply to F01, not a new point.

The branch head 0db5735 already carries the wording the review proposes. This round checked that repair against HilbertModules on main and at its open head, and searched the whole README for the same defect. It found no other occurrence. Nothing was changed, so there is no new commit.

## H01 (CBirkbeck) — applied

`TauCetiRoadmap/OperatorAlgebraDynamics/README.md` line 2754 (D5, the intertwiner paragraph) changed from "continuous Hilbert fields in H5 alone do not supply these targets" to "the continuous Hilbert fields of HilbertModules H5 alone do not supply these targets". This is the proposed wording, made in commit 0db5735 (the branch head; README only, two lines added and one removed). The sentence is true as cited: HilbertModules H5 on main (`TauCetiRoadmap/HilbertModules/README.md` lines 356–704, "Continuous fields, continuous trace, and Dixmier–Douady theory") builds continuous Hilbert fields over a locally compact Hausdorff space and contains no groupoid, measure, quasi-invariance, inter-fibre unitary or disintegration content. No *Needs:* line of this README mentions H5, so the sentence remains a non-dependency.

## The same defect elsewhere

The README cites 56 distinct cross-roadmap section ids by prefix:
- CStarAlgebras C1.3–C8.4 and C2.AnnHull;
- CStarClassification CL2–CL5;
- VonNeumannAlgebras V1–V11 with their named subsections;
- HilbertModules H1, H2, H3, H5;
- BanachAlgebras A7;
- SelfAdjointSpectralTheory SA-A21 and SA-B14–SA-B85;
- LieGroupoidsPoisson G0, G0.0;
- FreeProbability F3;
- OperatorKTheory K7, K7.5;
- NoncompactQuantumSymmetry M1, M2, P.2, P.6.

Each id was checked for at least one occurrence in a paragraph or bullet that names its roadmap. All pass except two. Both read correctly in context, so neither is edited:
- `C1.4`, line 609, sits in a bullet under the lead-in "CStarAlgebras supplies, as a roadmap on main cited by section, …" at line 603.
- `B85`, line 2735, is the shorthand "SA-B79/B85", two lines after "[SelfAdjointSpectralTheory SA-B85]" at line 2727. SA-B85 is named with its roadmap in 10 paragraphs.

Section and layer citations were also read in context, and each names its roadmap in the same sentence or bullet:
- MetaplecticAutomorphicForms §1.2: lines 104 and 2445.
- CStarClassification §§5.7–5.8: lines 121, 1559–1560 and 4073.
- CStarAlgebras §2.6, which is C2.AnnHull: line 626.
- QuantumFoundations §6.3, §6.4, §§6.2–6.4 and Layer 6: lines 3690, 3699–3701 and 4136–4138.
- HeisenbergImprimitivity Layer 1, §1.1 and §3.1: lines 1149, 4076–4088 and 4115.
- CompactQuantumMetricSpaces §6.0 and Layer 6: line 4109.
- AmenableGroups Layers 5 and 7: lines 1571–1572.
- NoncompactQuantumSymmetry Layer 0, P.2, P.6, M1 and M2: the bullet at lines 4056–4068.

## Build

`lake build TauCetiRoadmap.OperatorAlgebraDynamics.Suggested` at 0db5735: `Build completed successfully (18520 jobs)`, module elaborated in 14 s. There are no errors. There are 18 warnings, all `declaration uses 'sorry'`, one per theorem, at lines 109, 122, 137, 222, 241, 267, 287, 303, 324, 345, 356, 373, 389, 411, 437, 449, 472 and 491.

## Gate

`gate OperatorAlgebraDynamics: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`

## Dependency check

`depcheck: 229 roadmaps, 2144 edges, 0 problem(s)`

There is no UPWARD, CYCLE or `moved:` line for this roadmap.

## Signatures

`Suggested.lean` is unchanged since the reviewed head: 98be87d..0db5735 touches only the README. The file has no `variable` or `include` line, so no declaration can lose a section binder.

The elaborated types were produced from one scratch file, identical to the current `Suggested.lean` plus `#check @name` for all 23 declarations. Each type was compared with its README statement. All 23 agree in hypotheses and generality. Two points were checked specifically:
- **Mackey's theorem.** The Lean `T2Space` on τ and τ′ equals the README's wording at lines 1281–1293. The README's first sentence omits "Hausdorff", but Hausdorffness is automatic: an analytic Borel structure separates points, so a group topology with those Borel sets is T₀ and hence Hausdorff.
- **LCA Weyl classification.** `ContRepresentation` at the pinned Mathlib (`Mathlib/RepresentationTheory/Continuous/Basic.lean` line 55) is a bare monoid hom `G →* V →L[R] V`. Strong continuity is therefore carried only by `hUc` and `hVc`, as the README requires, and norm continuity is not imposed.

Nothing changed.

## Citations, ownership, overlaps

- **H5 at the open head.** HilbertModules H5 is identical at the open head that adds HeisenbergImprimitivity (a diff of the H5 section against main is empty). The repaired citation therefore survives that merge. The repair adds no construction, so no ownership question arises.
- **No dropped ids.** `scratch/overlaps.md` lists no dropped id and none that only an open revision defines.
- **Pin bump #1187.** The one open pull request that changes this roadmap, the TauCeti pin bump #1187, conflicts with this branch in `Suggested.lean`. This round changes neither file, so the conflict is as before: one of the two is rebased on the other before either merges.
- **Sources.** No source was cited or fetched this round, and no `needs-references.toml` was written.
- **Untrusted text.** None of the review text asked for anything outside the job.

## Adversarial pass

Values computed this round. Rows 1–2 concern the repaired sentence and the pattern search; rows 3–25 are the 23 declarations of `Suggested.lean`, each on an instance chosen independently of the review's table.

| # | Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|---|
| 1 | D5 sentence: H5's continuous Hilbert fields alone do not supply quasi-invariance, `U_γ`, conull reduction, disintegration | HilbertModules README on main, H5 = lines 356–704; same section at its open head | H5 heading at line 356; 0 lines in 356–704 match groupoid / quasi-invariant / disintegrat / measurable field / direct integral / conull; open-head H5 diff empty; 0 *Needs:* lines mention H5 | holds; id names its roadmap | none (repair already at 0db5735) |
| 2 | Every cross-roadmap id is attached to its roadmap | 56 distinct ids, plus § and Layer citations | 54 ids appear in a paragraph naming the roadmap; `C1.4` (609) sits under the CStarAlgebras lead-in (603); `B85` (2735) is "SA-B79/B85" after SA-B85 is named at 2727 | holds | none |
| 3 | `exists_integratedOperator` | ℤ/2 with counting μ, A=ℂ, H=ℂ², π(z)=z·1, `U_a`=swap, f(e)=1, f(a)=−2; π=0 | T=1−2·swap, eigenvalues −1 on (1,1) and 3 on (1,−1), ‖T‖=3=‖f‖₁; π=0 gives T=0 | holds, bound sharp; covariance unused | none |
| 4 | `exists_covariantRepresentation_integratedFull` | ℤ/2, A=ℂ, trivial action, C*(ℤ/2)≅ℂ², L = sign character on H=ℂ; L=0 | pair π=id, `U_a`=−1, integrated form at δ_a = −1 = L(δ_a); for L=0 the span of L(x)ξ is 0, not dense | holds; `hL` excludes L=0 | none |
| 5 | `fullCrossedProductMap_exact` | G trivial, A=ℂ², I=ℂ⊕0, B=ℂ, q=second projection; I=A, B=0 | maps x↦(x,0) and (x,y)↦y; first injective, second onto, kernel ℂ⊕0 = range; I=A gives kernel A = range of the identity | holds | none |
| 6 | `CentralCocycle` | (ℤ/2)², A=ℂ, α trivial, ω(s,t)=(−1)^(s₂t₁); ω≡−1 | ω(s,t)ω(r,s+t) = (−1)^(s₂t₁+r₂s₁+r₂t₁) = ω(r,s)ω(r+s,t); ω(e,s)=1. ω≡−1 fails `one_left`. Lean law at α trivial reads ω(s,t)ω(r,st)a = ω(r,s)ω(rs,t)a | holds | none |
| 7 | `CentralCovariantPair` | same ω, H=ℂ², π scalar, U_(s₁,s₂)=σ_x^(s₁)σ_z^(s₂) | U_sU_t=(−1)^(s₂t₁)U_(s+t) from σ_zσ_x=−σ_xσ_z; U_(0,1)U_(1,0)=−U_(1,1) with ω=−1; U_(1,0)U_(0,1)=U_(1,1) with ω=1; same U with ω=1 fails `projective` | holds; distinguishes ω from 1 | none |
| 8 | `twistedConvolution` | same data, counting μ, f=δ_(0,1), g=δ_(1,0) | f*_ωg = ω((0,1),(1,0))δ_(1,1) = −δ_(1,1); g*_ωf = +δ_(1,1); `.snd` is right multiplication a·m (DoubleCentralizer, `snd x * y = x * fst y`) | holds; argument order (r, r⁻¹s) pinned | none |
| 9 | `centralIntegrated_twistedConvolution` | rows 7–8; G trivial with μ=c·δ_e | T_fT_g = σ_zσ_x = −σ_xσ_z = T_(f*_ωg); trivial G gives c²·f g ξ on both sides | holds | none |
| 10 | `continuous_of_measurable_monoidHom` | ℝ→𝕋, x↦e^(2πix); Hamel ℚ-linear h with h(1)=1, h(√2)=0 | first is Borel and continuous; if h were Borel it would be continuous, hence ℝ-linear, but h(√2)=0≠√2·h(1) | holds; measurability needed | none |
| 11 | `IsAnalyticBorelSpace` | ℝ with Borel σ-algebra; ℝ with all subsets | X=ℝ, s=univ, identity: true; an analytic structure is countably generated (at most 𝔠 sets) while ℝ's power set has 2^𝔠: false | holds | none |
| 12 | `existsUnique_groupTopology_of_isAnalyticBorelSpace` | ℤ with ⊤ and counting μ; ℝ with counting μ | ℤ: τ discrete, μ Haar, and every countable LC T2 group is discrete by Baire, so τ is unique. ℝ: μ not σ-finite; discrete ℝ is not second-countable and the usual topology makes μ not locally finite, so no τ exists | holds; σ-finiteness needed; T2 automatic, as in the Signatures section | none |
| 13 | `injective_integratedFull_regular_of_amenable` | ℤ/2, A=ℂ, ρ=id; F₂ | ℤ/2: image of (x,y) ∈ C*(ℤ/2)≅ℂ² is xP₊+yP₋, with both swap eigenprojections nonzero, so injective. F₂: Kesten gives ‖λ(h)‖=2√3<4 for h = sum of a^(±1), b^(±1), so the trivial character does not factor and the map is not injective | holds; amenability needed | none |
| 14 | `transitive_commutant_scalar` | I=G=ℤ/3 by translation, value f i = i; trivial G; constant value | ℤ/3: T commuting with diag(0,1,2) and the cyclic shift is d·1. Trivial G: diag(1,0,0) commutes. Constant value: the all-ones matrix commutes with everything | holds; transitivity and `hsep` needed | none |
| 15 | `exists_powers_partition` | F={a,b}, L=2, w=ab², N=2 | wbw⁻¹=aba⁻¹ and waw⁻¹=ab²ab⁻²a⁻¹ both start with a and end with a⁻¹. For x starting with b^(±1), wfw⁻¹x starts with a, so lies outside C₀. b¹D₀ and b²D₀ have maximal b-prefix of length 1 and 2, so are disjoint. γ_j=b^j·w | holds | none |
| 16 | `generatedCStarAlgebra` | bilateral shift u on ℓ²(ℤ); unilateral shift S on ℓ²(ℕ); empty family | C*(u)≅C(𝕋), commutative; 1−SS* is the rank-one projection on e₀, so K(ℓ²ℕ) lies inside; empty family gives ℂ·1. Both theorems' families contain or sum to 1, so a unital versus non-unital closure gives the same algebra | holds | none |
| 17 | `reducedFreeGroup_isSimpleRing` | coordinate law; ι={a} | (λ_gξ)(k)=ξ(g⁻¹k) gives λ_gδ_h=δ_(gh), the left regular representation. One generator: C(𝕋) has the ideal {f(1)=0} | holds; `a≠b` needed | none |
| 18 | `reducedFreeGroup_trace_unique` | τ on group unitaries; ι={a} | τ(λ_g)=⟨δ₁,δ_g⟩=[g=1]; τ(λ_gλ_h)=[gh=1]=[hg=1]. One generator: ev_z is a trace with ev_z(λ_a)=z≠0=τ(λ_a) | holds | none |
| 19 | `exists_fullGroupCStarAlgebra_equiv_zeroAtInfty_dual` | ℤ/3, counting μ, χ_k(g)=ζ^(kg) | δ₁↦(ζ^k)_k; δ₁*δ₁=δ₂↦ζ^(2k)=(ζ^k)²; δ₁*=δ₂↦ζ^(2k)=conj(ζ^k) | holds; positive-character convention consistent | none |
| 20 | `exists_fullGroupCStarAlgebra_dual_equiv_zeroAtInfty` | G=ℤ, Ĝ=𝕋, ν normalized; ν↦2ν | f(χ_z)=z ↦ t ↦ ∫z·z^t dν = [t=−1], which lies in C₀(ℤ); for 2ν a different e exists | holds | none |
| 21 | `lcaWeyl_classification` | K=ℤ/2 Schrödinger pair on ℂ², and its double on ℂ⁴; U=1 | U₁=swap, V_χ=diag(1,−1): U₁V_χU₁*=diag(−1,1)=conj(χ(1))V_χ. ℂ⁴ gives ι=Fin 2. U=1 with V_χ=diag(1,−1) violates `hcov` (V≠−V) | holds | none |
| 22 | `cuntz_isSimpleRing` | n=2 on ℓ²(ℕ), S₀e_k=e_(2k), S₁e_k=e_(2k+1); n=1; n=0 | S₀*S₁=0 and S₀S₀*+S₁S₁*=P_even+P_odd=1. n=1, bilateral shift: C(𝕋) not simple (U=1 on ℂ gives ℂ, simple, so n=1 is not always true). n=0: the empty sum 0=1 forces H=0, which `Nontrivial H` excludes | holds; `2≤n` needed | none |
| 23 | `exists_residue_family` | n=3, k=5; n=1; n=0 | S₂b₁=b₅; S_j*b₅=[5 mod 3=j]b_(⌊5/3⌋)=[j=2]b₁; ΣS_jS_j*b₅=b₅. n=1: S₀=id. n=0: the empty sum 0≠1 on H≠0 | holds; `0<n` needed | none |
| 24 | `mem_extremePoints_kmsStates_iff` | ℂ² with trivial dynamics, β=1; M₂ with K=diag(0,1) | ℂ²: (½,½) is not extreme and has GNS centre the diagonals≠ℂ; δ₁ is extreme with GNS ℂ. M₂: the unique Gibbs state with weights 1/(1+e^(−1)) and e^(−1)/(1+e^(−1)) is extreme; GNS is left multiplication on M₂, centre ℂ | holds both ways | none |
| 25 | `vonNeumannEntropy_strong_subadditivity` | a=b=c=Unit, ρ=(t); product density ρ_A⊗ρ_B⊗ρ_C; GHZ | ρ=(t): each entropy is −t log t, so both sides are −2t log t. Product: S_A+S_B+S_C+S_B on both sides. GHZ: 0+log 2 ≤ 2 log 2. Index check: `partialTraceLeft` on a×(b×c) gives b×c; `reindex (prodAssoc a b c).symm` gives (a×b)×c, whose `partialTraceRight` gives a×b | holds | none |

Duplication at the pins was spot-checked for the one target with a nearby library result. Tau Ceti's `TauCeti/Analysis/Matrix/Entropy.lean` (subadditivity section at line 262) proves only bipartite subadditivity, so strong subadditivity stays a target.
