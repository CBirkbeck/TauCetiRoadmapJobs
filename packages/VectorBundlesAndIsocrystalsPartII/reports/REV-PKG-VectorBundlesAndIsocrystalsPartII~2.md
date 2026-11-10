# Review of VectorBundlesAndIsocrystalsPartII (package, round 2)

**Verdict:** needs changes

Five findings: one P1, one P2 and three P3. The package is repairable. The supplied Lean file elaborates; the new disc-tower argument does not survive its own exponential conventions. No package input was edited.

## R01 (P1) — The repaired tower starts with the wrong exponential

**Location.** `packages/VectorBundlesAndIsocrystalsPartII/README.md:630`, with consequences at lines 628, 634, 643–644: “`E_1` lies in `1 + pℤ_p{X}` (`E_2` in `1 + 4ℤ_2{X}`)”.

**Claim.** These are base-disc units, so adjoining their p-th roots gives the first geometric degree-p cover; the specified character identifies its full tower group with ℤ_p, and the displayed eigenvalues are those of a generator.

**Witness.** CN25 line 1061 defines E_a as a root of exp(pⁿaX); line 1077 gives E₁ᵖ=exp(pX). At p=2, the coefficient of X^(2ʳ) in exp(2X) has valuation 1, so E₂ is not a Tate series.

More explicitly, at p=3 a base-ring E₁ normalized at zero would have formal series exp(X), whose X³ coefficient has valuation −1. Its coefficients do not tend to zero. At p=2, E₂²=exp(4X), whereas E₂ itself is not in C{X}; the README already computes this at lines 604 and 623. The error is therefore in the new paragraph, not a missing good-prime restriction.

The indexing error propagates. Over C{X}, E₁^(1/p) at odd p has degree p² over the base, not p. Thus for p=3 the line-643 first-level geometric group has order 9, not 3, and with the stated constant field of degree 6 the total degree is 54, not 18. A primitive tower generator acts on this element through ζ₉, not ζ₃. At p=2, E₂^(1/2) is a fourth root of exp(4X), so the corresponding eigenvalue is ζ₄−1, not −2. An automorphism giving the latter eigenvalue belongs to an index-two subgroup and is not a generator of the whole tower.

**Exact repair.** Keep §3.1's E_a convention. In §3.4 define a separate base unit A=exp(pX)=E₁ᵖ for odd p and A=exp(4X)=E₂² for p=2. At level n≥1 adjoin μ_(pⁿ), p^(1/pⁿ), and A^(1/pⁿ). Identify its first geometric root with E₁ (odd p) or E₂ (p=2), and its completed geometric limit with §3.2. Replace the two test eigenlines by C{X}E₁ and C{X}E₂ respectively. Normalize the integral tower character as κ=pψ₁ at odd p and κ=2ψ₂=4ψ₁ at p=2, or explicitly retain the corresponding fractional lattice as the image of ψ₁. For κ(γ)=1, the coefficient of ψ₁ is the invariant part of the cocycle value at γ divided by ψ₁(γ), not that value unchanged. Recheck the character factors in the normed argument, cite §3.3 in its Needs line, and preserve the framed B₂ parameter 1.

**Repair test.** A has coefficients pᵏ/k! at odd p and 4ᵏ/k! at 2, with valuations tending to infinity. A^(1/p)=E₁ or E₂ now has geometric degree p. At p=3 the constant/geometric/total degrees are 6/3/18; at p=2 the geometric degree is 2. The corrected first eigenvalues have inverse norms 3^(1/2) and 2. No prime is excluded. The three-step route of the earlier F01 is structurally appropriate, but this error leaves that repair only partly successful.

## R02 (P2) — The completion action is already owned by PadicPeriodRings

**Location.** `packages/VectorBundlesAndIsocrystalsPartII/README.md:7`, lines 27–33 and 80; `packages/VectorBundlesAndIsocrystalsPartII/Suggested.lean:42`: “It also owns the two `Suggested.lean` definitions” and “No other roadmap constructs these objects.”

**Claim.** This roadmap owns construction and the continuity/action API of galoisAct on ℂ_p.

**Witness.** Open pull request #940, `TauCetiRoadmap/PadicPeriodRings/README.md:91`, §1.1, owns this same completion action and all these laws. Its `Suggested.lean:91` defines completedGaloisAction by Completion.map; line 101 states joint continuity.

This is duplication by object even though the fully qualified names differ. The supplier's §2 also covers general-base completions, so broadening the helper's K parameter does not establish a separate owner. This is not a claim that the action is already in pinned Mathlib.

**Exact repair.** Attribute the action and its laws to PadicPeriodRings §§1.1–1.2 and §2 in Scope and Exact supplier contracts. Delete its separate construction/API target here. For a concrete acceptance signature without importing another roadmap, delete the local galoisAct definition and use `UniformSpace.Completion.map σ` directly in SemilinearRep and the two headline signatures. Keep SemilinearRep and the substantive headlines. Update the README and docstrings accordingly; do not introduce an import of the open roadmap.

**Repair test.** This precise inlining was elaborated on a scratch copy: success, with only the same two sorry warnings. It has exactly the original definitional meaning on every σ; at σ=id both expressions give id, and on an algebraic ζ they give σ(ζ). The existing supplier remains earlier in the order, so no ownership cycle is introduced.

## R03 (P3) — A sampled Check reverses the curvature of C/ℚ_p

**Location.** `packages/VectorBundlesAndIsocrystalsPartII/README.md:1015`: “`C/ℚ_p` has curvature `< 0` and is not covered.”

**Claim.** C/ℚ_p is excluded from the positive-curvature orthogonality theorem of §5.2.

**Witness.** For q:C→C/ℚ_p, a BC map f:C/ℚ_p→C gives fq(x)=ax and fq(1)=0, hence a=0. Thus Hom(C/ℚ_p,C)=0, the parent's positive-curvature criterion, not negative curvature.

The parent's criterion is at `TauCetiRoadmap/VectorBundlesAndIsocrystals/README.md:1389` (open pull request #1205); its height-sign statement at line 1587 independently excludes negative curvature since ht(C/ℚ_p)=−1. The quotient's nonzero identity prevents simultaneous positive and negative curvature by curvature orthogonality.

**Exact repair.** Replace this sentence by: “C/ℚ_p has positive curvature and is covered: restriction Hom_TVS(C,P)→Hom_TVS(ℚ_p,P) is the identity on M₂/M₁, so Hom_TVS(C/ℚ_p,P)=0.” Keep the unrelated U₁/ℚ_pt_x test.

**Repair test.** For P=[0→C], the restriction is C→C, a↦a, with kernel 0. For a dense-inclusion Pair, the same restriction is the identity on its nonzero algebraic quotient, again with kernel 0. This agrees with the signed height −1 throughout §§0.4, 5.1 and 6.7.

## R04 (P3) — Proposition 4.4 is on printed page 337

**Location.** `packages/VectorBundlesAndIsocrystalsPartII/README.md:175`: “Proposition 4.4, p. 336”.

**Claim.** This locates the analyticity assertion used in sampled §0.3.

**Witness.** Fontaine03 line 2135 is the printed-page-337 heading; lines 2138–2142 state Proposition 4.4. Page 336 contains its setup and Proposition 4.3, not Proposition 4.4.

**Exact repair.** Change this locator to “Proposition 4.4, p. 337”. The accompanying Proposition 4.2 locator, p. 333, and end-of-proof locator, p. 340, are correct. No manifest rewrite is needed: the Fontaine03 manifest records §4 broadly.

**Repair test.** At the corrected locator the hypotheses are a finite stable subspace V⊂C, a C-line quotient, and η restricting to the inclusion of V. The README's quotient by ker(η|V) reduces to precisely this situation; the zero map remains analytic and does not require surjectivity.

## R05 (P3) — The generic-bundle deferral cites retired layer labels

**Location.** `packages/VectorBundlesAndIsocrystalsPartII/README.md:17`: “AlgebraicVectorBundles, Layers L0–L2: generic sheaf-theoretic and geometric vector bundles and their tensors, duals and pullbacks.”

**Claim.** This locates the owner of the generic bundle material excluded from this roadmap.

**Witness.** Main's `TauCetiRoadmap/AlgebraicVectorBundles/README.md:388` and :472 have Layers 1 and 2 for pullback and flat/internal-Hom comparison. It has no L0/L1/L2 labels or old-numbering map; Scope at lines 51–81 imports the underlying bundle foundations.

**Exact repair.** Replace the deferral with “AlgebraicVectorBundles, Scope and ownership and Layers 1–2: generic module-sheaf pullback and its tensor and internal-Hom comparisons; its supplier inventory identifies the underlying vector-bundle foundations.” Do not add a dependency on an open revision.

**Repair test.** Layer 1 explicitly owns pullback on every module sheaf and its strong monoidal comparison; Layer 2 owns flat exactness and internal-Hom comparison. This is only a scope deferral: no target's Needs line consumes the missing L0–L2, so this is a locator repair rather than an unowned prerequisite.

## Verified sound

### Earlier findings, checked before the new pass

The repair report marks all eight actionable; none is marked “not actionable in this package”. The following quotations are from the repaired package, not instructions adopted from that report.

| Earlier finding | Repaired passage and location | Result of this round |
| --- | --- | --- |
| F01, tower comparison | README:632: “By almost purity (PerfectoidSpaces §P3) each of these finite stages is almost finite étale”; README:636 explicitly needs §§3.1–3.2, P9.6, P3, P6 | **Partly repaired.** The tower/inflation/decompletion separation fixes the original domain mismatch. Its new first step has R01's false exponential and indexing assertions. |
| F02, parent numbering | README:103: “The parent's Layer 5 supplies *Sympathetic Vector Spaces*”; plan.json:2927 uses “Layer 5, VS Hom vanishing from torsion period modules” | **Repaired.** All 18 headings resolved at the parent's head; no Layer VB3 remains in this README. The same missing-label pattern in a different scope citation is R05. |
| F03, invented supplier names | README:117: “*Left hearts and strict exactness*”, “*Continuous functional extension in countable type*”, “*Strict countable inverse limits and cohomology*” | **Repaired.** All three are prose targets of LocallyAnalyticDistributions §§0.0, 0.2. The three former backticked names are absent. |
| F04, Sen names | README:113: “the Sen module and the Sen operator of a finite-dimensional continuous semilinear `C`-representation” | **Repaired.** PadicHodgeTheory §4.4 explicitly supplies this generality. No senModule/senOperator name claim remains. |
| F05, pins/lines | README:66 and 92 give pins `1b1ccf4b088b32fa3f23f2de1127433254a81e1e` and `2fd255d997f47c0b5d834ee416c7015d55444ce5` | **Repaired.** Both match lake-manifest.json. All six amended declaration lines and the remaining supplier rows were opened at these pins. |
| F06, source locators | README:1106: “Lemma 4.21, p. 28”; README:823: “Appendix A.4, p. 59”; README:500: “Appendix A, pp. 58–59” | **Repaired.** TVS25 line 1288 and CN25 lines 2873–2952 verify these; both manifest corrections are present. No old 4.21 Proposition or Appendix page-60 pattern remains. R04 is a separate locator slip. |
| F07, redundant stability | README:394: “stable because it is the kernel of the equivariant `q`”; Suggested.lean:94–100 has kernel/equivariance, no hV | **Repaired.** q(ρσv)=ρWσ(qv)=ρWσ(0)=0 for v∈V, so the deleted hypothesis follows. The signature audit confirms the deletion only. |
| F08, process sentence | README:7: “No other roadmap constructs these objects.” | **Repaired as a style correction.** No pull-request-queue narrative remains. Its mathematical ownership claim separately fails R02. |

### Principles and shape

Read all 62 numbered targets, the two Conventions Check blocks, all 64 Check blocks, proof routes, Examples and Dependencies. Each Check block has at least three bullets. Definitions carry prose APIs; the four own backticked Lean identifiers are exactly galoisAct, SemilinearRep, semilinearRep_equivariant_map_smul and fundamental_extension_surjective, all declared in the file. Mathematical notation such as B_m and Hom is not an undeclared Lean-name claim.

The package extends the parent's classical BC endpoint and imports its theory by headings. Its new arithmetic, TVS, qBC and height targets do not re-plan the parent. R02 is the narrow duplicated construction. No algorithm, copied source passage, sorry'd data, set_option, extra import, admitted example, vacuous Prop field or route-specific prime restriction was found. The p=2 extension is explicitly attempted and is retained in the repair above.

The seven layers are organized by mathematical objects and end theorems. Their order is not the source's chapter order: CN25's height material (§3.3) is placed after its §4 material here, and the two independent arithmetic/topological branches are stated as independent. No layer is named for a source chapter. Proof-route citations to a source's argument do not amount to a source-derived layer organization. The supplied shapes were compared with main's `TauCetiRoadmap/QuadraticCharactersAndReduction/README.md` and `TauCetiRoadmap/ProfiniteCohomology/README.md`.

### Sources: all 15 seeded targets

All ten manifest works were available in the supplied legal cache. There are no author-flagged unverified locators and no missing work to fetch. References, manifest keys, version notes and cached titles agree. The sample was read at these locators, including hypotheses and pages; this records support, not a claim that every new comparison already appears verbatim in a source.

| Target | Text inspected | Outcome |
| --- | --- | --- |
| 0.3 Analyticity | Fontaine03 lines 1816–1824, 1974–1993, 2125–2142, 2256–2298; printed pp. 329–340 | Construction via the finite-period pullback; analyticity after killing ker(η restricted to V), without a surjectivity assumption. R04 corrects p. 336 to 337. |
| 0.4 Almost C | CN25 lines 400–408, p. 9; Fontaine03 lines 257–264, p. 291 | Stable finite-dimensional modifications; signed height; general-base definition, finite-K structure theorem distinguished. |
| 0.5 Abelian category/Dimension | CN25 lines 407–425, p. 9; Fontaine03 lines 265–269, p. 291 | Strictness and additive invariants are finite-K assertions. The independent dimension-one BC input is explicitly identified in CN25's footnote. |
| 0.6 Finite-length periods | CN25 lines 411–414, p. 9; Fontaine03 lines 272–274, p. 291 | Length d gives (d,0), including zero length; the continuous semilinear representation convention is inherited from §0.2. |
| 1.4 Twisted complex | CN25 lines 440–453, p. 10; Fontaine03 lines 1014–1028, printed p. 309 | The inverse character in d₁, degrees 0–2 and finite-K/finite-length domain agree. Equation (2.8) is the Ext comparison, not the display of the differential. |
| 1.6 Ext table | CN25 lines 461–488, pp. 10–11 | Endpoints j=0,k and k≥1 agree. Nonzero middle-object isomorphism is distinguished from equality of framed extension classes. |
| 2.2 Pointwise exact structure | CN25 lines 960–989, pp. 20–21; Schneiders99 Corollary 1.2.21, lines 852–864, pp. 24–25 | Source defines pointwise left-heart exactness and localization. Checking its exact-category axioms and boundedness stability is correctly a target, not a theorem falsely attributed to Schneiders. |
| 3.2 Explicit cover | CN25 lines 1061–1082 and 1116, p. 23 | Odd-p computation verified. The README's p=2 quadratic equation repairs the source proof's use of exp(2X); it is not a separate theorem printed in that lemma. |
| 3.4 Normed descent | CN25 lines 1083–1107, p. 23; Colmez02 lines 975–978, 1262–1299, 1342–1366, pp. 23,29–32 | The cohomology line and bound are source claims; the source abbreviates descent/decompletion. The expanded route contains R01. Elementary p-extensions and the completed p-closure/lifting input are supported. |
| 3.5 Analytic cocycles | CN25 lines 1155–1168, p. 24 | Bound and convergence supported. README corrects the source's out-of-range index and constant-coboundary sign. |
| 3.7 Disc class | CN25 lines 1083–1107 and 1175–1184, pp. 23–25 | Fixed endpoints, λ_v=vλ_E, B₂ parameter 1 and rank-zero splitting agree. |
| 3.8 Translation invariants | CN25 lines 1185–1191, p. 25; Colmez02 Theorem 10.5, lines 3320–3323, pp. 76–77; Proposition 10.18/Remark 10.19, lines 3613–3619, p. 82 | Additive primitive and invariant C-line agree. Here O is expressly read as the completed-cover coefficient sheaf specified in §3.4; this is not an independent assertion about the uncompleted inverse-image sheaf of PerfectoidTowers P9.2. |
| 5.2 Positive orthogonality | CN25 lines 1419–1432, p. 28 | The theorem and the invertible t_x restriction agree. The package's C/ℚ_p negative-control sentence is false (R03). |
| 6.2 Exact comparison | CN25 lines 912–938, pp. 19–20; LeBras18 lines 1176–1187, p. 26, argument pp. 26–28; TVS25 lines 1054–1069, 1165–1169, 1288–1296, pp. 23–28 | Basic sheaf Ext table and enriched full-faithfulness inputs verified. TVS25 uses an enriched condensed category, not this package's left-heart TVS. The package correctly owns the intervening comparison; its full period-target range is not a single theorem of LeBras18. See limits of certification below. |
| 6.3 Positive-period limit | CN25 lines 927–930, p. 20 | Source uses surjective truncations and Ext¹(ℚ_p,V₁)=0. The explicit Milnor/lim¹ justification is a new target here; it is not an application of a finite-dimensional cohomology theorem to B_m. |

The other headline sources were checked: Fontaine03 Theorem A, line 213, p. 290; Theorem 4.1, lines 1816–1820, p. 329; CN25 Theorem 2.6, lines 431–436, p. 10; Corollary 4.31 at the end of §4.4, p. 31; Proposition 3.27, lines 939–955, p. 20. FF18's preface Theorem 2.25/Remark 2.26/Proposition 2.28 supports the stated finite-K arithmetic specializations. The broad arithmetic claims are not applied over arbitrary residue fields.

The earlier inability to verify the JEMS printed pages is resolved: AnschutzLeBras25 line 7 gives pp. 3651–3712; line 816 prints 3671 above Theorem 3.1; line 985 prints 3676 above Theorem 3.9. Corollary 3.8 and its pseudocoherence proof, lines 972–988, straddle pp. 3675–3676. These agree with §§6.4–6.5 and the manifest. Theorem 3.9 is a relative sheaf calculation; it does not silently supply sympathetic exactness.

### Computed adversarial table

Every numbered target was reread. For unchanged statements, earlier computed rows were reused only after comparison with the actual text; sections previously described without computed rows received fresh tests. The table below includes every sampled target, every headline and every finding, plus the additional tests needed for the unsampled definitions and interfaces. Zero-ring and equal-characteristic inputs are excluded from the mixed-characteristic BC base; the native period-carrier contract separately records its characteristic-p zero ring. Non-Hausdorff quotients, arbitrary model size, twists and p=2 are tested where admitted.

| Statement | Instances tried | Values computed on the two sides | Result/change |
| --- | --- | --- | --- |
| galoisAct; SemilinearRep | σ=id; σ(ζ)=ζᵃ; trivial action on C; zero module | Completion.map(id)=id; map(σ)(ζ)=ζᵃ; trivial semilinearity would equate ζ and ζᵃ; zero law is 0=0 | Mathematical body sound; ownership R02. At p=2 use ζ₄ and a=−1, giving i≠−i. |
| §0.1 exact Banach category | Split V⊕W; logχ extension; T(x)_n=pⁿx_n on c₀ | Split kernel V and cokernel W; nonzero cocycle logχ gives nonsplit conflation; preimage of (pⁿ) would be (1), outside c₀ | Algebraic exactness applies to Banach endpoints, not the non-Hausdorff quotient. |
| §0.2 / first Lean headline | W₁=0; C→C, f=a·, a∈K; C→C(1) | 0=0; f(cw)=acw=c f(w); both equivariant Hom groups to C(1) are 0 | Finite K, finite C-dimension and module topologies retained. |
| §0.3 | E=V⊕C, η=projection or 0; V=0,W=C(1) | Dimension (1,h); projection analytic, kernel dimension h; zero map analytic with image 0; twisted η=0 | Does not infer surjectivity from analyticity. R04 locator only. |
| §0.4 | ℚ_p; C; C/ℚ_p; two presentations of C⊕ℚ_p | (d,h)=(0,1),(1,0),(1,−1); heights 1−0=2−1=1 | Signed convention agrees with parent. |
| §0.5 | 0→ℚ_p→C→C/ℚ_p→0; 0→C(1)→B₂→C→0 | d:1=0+1 and 2=1+1; h:0=1−1 and 0=0+0 | Additive and strict finite-K formulation. |
| §0.6 | B₂; C(1); zero; ℚ_p | (2,0),(1,0),(0,0); ℚ_p has (0,1), not length-zero period object | Almost-isomorphism does not identify Hom(C,C(1))=0 with End(C)=K. |
| §§0.7–0.9 | a∈C outside K; B₁→B₂; End(B₁); truncated negative lattice | At 1, g(a)≠a; equivariant Hom(B₁,B₂)=0; End(B₁)=K; Hom(B⁺,t⁻¹B⁺/tB⁺)=K, not K² | Scalar rigidity and strict inequality k<ℓ needed. K closed in C, K̄ dense; density modulo t alone misses t∈B₂. |
| §1.1 | B₂ extension; ℚ_p→C→C/ℚ_p; logχ | Quotienting kernel by ℚ_pt gives a splitting through U₁/ℚ_pt; quotienting the second or logχ kernel by all ℚ_p gives zero kernel | Almost split is not split; Ext¹(C,C(1))=K remains nonzero. |
| §1.2 | Rational trivial source/target; period C,C(1); mixed types | Rational Ext⁰=ℚ_p, Ext¹ has dimension [K:ℚ_p]+1; period Ext¹=K; no mixed-type comparison asserted | Exact inclusions retain source categories. |
| §1.3 | W=0,C,B₂; γ lifts u,−u at p=3 | (W_(0),W_(1))=(0,0),(K,0),(K,Kt′); exp(log u)=exp(log(−u)) | Nilpotent t does not require an inverse operator on W. |
| §1.4 | C; C(1); B₂,z=1 | Cohomology (K,K,0), (0,K,K); d₁d₀=t′γz−t′z−(t′γz−t′z)=0; wrong inverse gives (1−χ⁽¹⁾(γ)²)t′≠0 | Differential normalization correct, also for χ⁽¹⁾(γ)=5 at p=2. |
| §1.5 duality headline | X=Y=ℚ_p; X=C,Y=C(1); zero object | Euler 1−([K:ℚ_p]+1)+0=−[K:ℚ_p]; 0−[K:ℚ_p]+[K:ℚ_p]=0; all zero | Twist (1) and degree 2 match local duality; no claim that all Ext are K-spaces. |
| §1.6 | (k,j)=(1,0),(1,1),(2,1),(2,2); k=0 | K-dimension triples (1,1,0),(0,1,1),(0,0,0),(0,1,1); source B₀=0 would give (0,0,0), so excluded | Endpoint distinction and k≥1 essential. |
| §1.7 | (N,i,j)=(0,1,2); i=j=1 | B₂ complex acyclic, Hom=Ext¹=0; identity at equal indices gives Hom≠0 | Strict inequality correctly enforced. |
| §1.8 / second Lean headline | E=V⊕C, η=(g,1) or (g,0); U₁→C | ker(g,1)={(v,−gv)}, dimension h; range(g,0)=η(V), excluded, kernel contains C; kerθ=ℚ_pt, dimension 1 | Hypothesis is image inequality, not η≠0; hV follows from q. |
| §1.9 analytic realization | ℚ_p,C,C(1); forget action | Evaluations recover ℚ_p,C,C(1); End_G(C)=K versus End_BC(V₁)=C | Exact faithful realization does not assert fullness after forgetting action. |
| §§2.1–2.3 left heart/TVS | [0→C], [C→C], dense diagonal T on c₀; pullback of split projection | Quotients C,0,c₀/T(c₀); [(pⁿ)]≠0, separated quotient 0; pullback middle term C with identity kernel map | Bounded quotient and pointwise exactness use the left heart, not Hausdorffization. |
| §2.4 BC→TVS | ℚ_p,C/ℚ_p,V₁ | Evaluations ℚ_p,C/ℚ_p,C with heights 1,−1,0 respectively; standard split kernels unchanged | Does not claim the topological carrier determines height. |
| §§2.5–2.6 | M=B_m,0,c₀₀; Λ=C; split C→C²→C | Completions B_m,0,c₀; singleton basis recovers M; base-changed sequence Λ→Λ²→Λ | Incomplete model not identified with completed evaluation. |
| §2.7 | M=B_m; balancing a,b,x; unbounded direct sum | Evaluation B_m; ab⊗x−a⊗bx=0; no single tᵐ kills ⊕_n B_n since tᵐ·1≠0 in B_(m+1) | Balanced tensor and uniform exponent discriminate wrong models. |
| §2.8 | Identity Pair; [0→B_m]; diagonal inclusion | Algebraic quotients 0,B_m,nonzero class [(pⁿ)] | Morphisms localized; dense inclusion not silently strict. |
| §3.1 | a=0; a=p odd; a=4 at 2; translation 0 | E₀=1, χ₀=1, ψ₀=0; E_p=exp(pX), E₄=exp(4X); kernel translation parameter 0 | These are the base units needed in R01, unlike E₁ and E₂. |
| §3.2 | p=3,n=0; p=2,n=0,1 | Y₀³≡X mod 3^(1/3); Z₀²+Z₀≡X mod 2; Z₁²+2^(1/2)Z₁=Z₀ | Odd and even formulas checked separately; no nonexistent predecessor. |
| §3.3 | p=2; coefficients at n=2ʳ | ψ₂=2ψ₁; v₂(2ⁿ/n!)=1; v₂(4ⁿ/n!)=n+1 | exp(2X) fails Tate convergence; exp(4X) converges; division by 2 doubles norms. |
| §3.4 new tower | p=3 and p=2, first level as written | Claimed base E₁/E₂ not present; geometric orders 9≠3 and 4≠2; primitive eigenvalues ζ₉−1 and ζ₄−1 | R01. Corrected base A gives orders 3 and 2. |
| §3.4 inflation/decompletion | Finite étale stage; zero cocycle; ψ₁ | Almost higher cohomology 0 and invariants almost base modulo pᵐ; rational kernel H¹=0 gives inflation 0→H¹(Γ)→H¹(H_C)→0; coefficients 0 and 1 | Route separates finite étale descent from normalization; R01 is needed before identifying γ-values. |
| §3.4 added binomial test | k=pʳ; v_p(c)=p/(p−1) | v_p(binom(1/p,k)cᵏ)=s_p(k)/(p−1)=1/(p−1), not tending to infinity | Root is not a Tate series at the boundary; negative control valid. |
| §3.5 | f=c; f=YZ at p=2; k=pʳm | δ(−c)=c; δ(X²/2)=YZ; i=p^(r−1) yields v_p(binom(k,i))=1 | Denominator at most p; source's i=pʳ fails at k=pʳ. |
| §3.6 | Split extension; B₂; v=0 | λ_v=0,rank 0; λ_v=v,rank 1 for v≠0; zero lift at v=0 in every extension | Nonzero v required for splitting criterion. |
| §3.7 disc headline | Split, B₂, pushout by c | λ=0,1,c respectively; arithmetic Ext¹(C,C(1))=K versus TVS Ext¹=C | Framed endpoints and category distinction preserved. |
| §3.8 | a=0,1,2; translations of X | Differences 0,0,ψ₂−2ψ₁=0; τ_x(X)−X=x, so X not invariant; constants invariant | Invariant line is C, not C{X}; coefficient convention stated above. |
| §§4.1–4.3 | c₀(ℕ,C); C^ℕ; c₀(I,C), I uncountable; dense Pair | (pⁿ)∈c₀, (1)∉c₀, (1)∈C^ℕ; uncountable coordinate basis not countable type; dense Pair quotient≠0 | Fréchet/compact type and separability kept distinct; full nonseparable targets explicitly owned in §4.9. |
| §4.4 | m=d=1,w=1; w=0; W=B₂,d=1,w=t | (tc,−c) maps to tc−tc=0; classes 1,0,0 respectively | Correct sign and quotient W/tᵈW; nonzero w can give split class. |
| §§4.5–4.6 | Finite H; zero cocycle; split C→C²→C | At most #H values lie in one step; zero in every step; middle dimension 2=1+1, bidual id | Isometric steps and separable compact-type endpoints retained. |
| §§4.7–4.8 | W=C,0,c₀,C^ℕ | Hom/Ext¹ parameters C,0,c₀,C^ℕ; (1) allowed only in product example; zero tower lim¹=0 | Norm convergence matters. Non-nuclear inverse-limit comparison remains an explicit construction obligation. |
| §§4.9–4.10 | W=B₃,d=2 or 5; W=0; d=0 control | Lengths of W[tᵈ] and W/tᵈW are 2/2,3/3,0/0; t⁰ kernel/quotient 0/0 | Scalar formulas sound; no unsupported higher Ext comparison. |
| §4.11 | ℚ_p→C; ℚ_p→dense Pair | f determined by f(1)∈C; Ext¹=0; maps to Pair parameterized by nonzero algebraic quotient | Constant-source statement is not arithmetic H¹(G_K,ℚ_p). |
| §4.12 | [0→B₂],d=1; [tB₂→B₂],d=1 | Hom=tB₂ and C respectively, both length 1 | Cokernel remains algebraic. |
| §4.13 | d=1,W=C; d=0 | Boundary C→C is id, so Ext¹(U₁,C)=0; U₀=ℚ_p reproduces §4.11 | Corrects source's displayed nonzero Ext value. |
| §4.14 | c=0,−1,p | 0=0; ℓ_v(−x)=−ℓ_v(x); p=(1+p)−1 with both summands units | Additivity closes source's nonunit omission. |
| §§4.15–4.16 | C,C; Module Pairs [0→B₁],[0→B₂]; identity dense Pair | Ext¹=C in all stated categories; Hom=tB₂≅C; identity on nonzero dense Pair≠0 | Hom of Pairs only; no Ext¹ assertion for arbitrary Pairs. |
| §5.1 | 0,ℚ_p,C/ℚ_p,pure Pair | Heights 0,1,−1,0; ℚ_p negative piece=ℚ_p; pure Pair middle=Pair | Middle piece has no asserted finite dimension. |
| §5.2 | C/ℚ_p; U₁/ℚ_pt_x; B₁ as zero-curvature source | Restriction Q→Q is id so kernel 0; t_xᵈ multiplication invertible; End(B₁)=C≠0 | The theorem passes; R03 fixes the sign of its Check. |
| §5.3 | ℚ_p⊕B₁⊕(U₁/ℚ_pt_x); pure Pair | Positive=B_x, middle=B₁, negative=ℚ_p; pure Pair outer pieces 0,0 | Universal subobject/quotient directions agree with parent. |
| §5.4 qBC headline | Pure same-type Pairs; p· on C/ℚ_p | Hom comparison reduces to §4.16; pℚ_p=ℚ_p and inverse p⁻¹, height −1=−1 | Same type retained; no abelianness or split-filtration overclaim. |
| §5.5 | J=LA→C⁰; J=id; distribution derivative δ′ | Dense proper quotient≠0, Hausdorff quotient 0; identity quotient 0; δ′ not a measure since f_n(x)=pⁿ·1_(pⁿℤ_p)(x)·x/pⁿ has sup≤p^(−n), derivative at 0=1 | Hom to ℚ_p=0; distribution class nonzero modulo measures. |
| §6.1 | 0,ℚ_pʳ,B_m,C/ℚ_p | h=0,B_dRʳ,0,0; rank/height for quotient 0 versus −1 | G-HOM must be uniform in Λ; pointwise boundedness would be automatic. |
| §6.2 | (ℚ_p,V₁),(V₁,V₁); B₂ boundary | Ext¹ comparison 0→0; Hom and Ext¹ C→C; normalized boundary sends 1↦1 | Rejects zero comparison; full construction is an additional target, not identified with enriched TVS by terminology. |
| §6.3 | B₂→B₁; zero tower; countable surjections | Kernel tC≠0; Hom B_m and Ext¹=0; ML gives lim¹ B_m=0, hence Ext¹(ℚ_p,B⁺)=0 | Does not assume B_m finite-dimensional over ℚ_p. |
| §§6.4–6.5 | ℚ_p; V₁; lattice shift k=0 | Lattice Ext¹=0 for ℚ_p; V₁ system C with zero transitions has colimit 0; boundary Hom(V₁,t⁻¹V₁)=C→Ext¹(V₁,B⁺)=C sends 1↦1 | Transition normalization, not equal dimensions alone, proves zero. |
| Scope, generic-bundle deferral | Identity pullback; flat field extension | id*E=E; for finite-dimensional M,N, K⊗Hom(M,N)=Hom(K⊗M,K⊗N), both dimension dim(M)dim(N) | Mathematics stays with supplier; R05 replaces nonexistent L0–L2 by actual Layers 1–2. |
| §§6.6–6.7 height headline | ℚ_p,C,C/ℚ_p; split ℚ_p⊕C | (rank h,rank Ext¹)=(1,0),(0,0),(0,1); 1=1+0,0=0+0,0=−1+1; split dual sequence 0→0→B_dR→B_dR→0 | Correct signed formula, vanishing restricted to nonpositive curvature. |

### Lean acceptance, signatures and padding

Ran the prescribed `lake env lean` on the absolute package file from the content checkout. Exit 0; exactly two warnings, at Suggested.lean:65 and 88, both “declaration uses sorry”. No TauCeti import requires a targeted build.

On one scratch copy, tried both sorried theorems with `simp`, `rfl`, `infer_instance` and also `simp_all`, using a final sorry fallback only to retain the goal for the signature audit. Both reached that fallback. Neither theorem restates a definition, mirrors a Check, computes a small value or treats only a boundary case. No exact single-lemma match was found among the opened pinned near-matches. The generic locally-constant condensed full-faithfulness results and intermediate-field finiteness instances do not prove either arithmetic theorem.

Appended and elaborated `#check @` for all four declarations. Compared the output with Conventions, §0.2 and §1.8. Prime p, finite K/ℚ_p, finite C-dimensions of W₁/W₂, both module topologies, continuity/equivariance, completeness of E, finite dimension of V, rank-one W, and every q/η hypothesis are present. In §1.8 `finrank C W=1` excludes infinite dimension (whose finrank is 0). Continuous additivity yields ℚ_p-linearity by density, so using additive homomorphisms does not enlarge the intended maps. No missing binder was found. F07 removed only hV. R02's separate scratch inlining test also passed.

Headline inventory from the summary and end targets:

| Headline | Acceptance-file disposition |
| --- | --- |
| Fontaine full faithfulness for C-representations, §0.2 | semilinearRep_equivariant_map_smul, line 65 |
| Fundamental extension theorem, §1.8 | fundamental_extension_surjective, line 88 |
| Full faithfulness for finite-length B⁺-representations, §0.2 | Docstring: missing period Galois action and topology |
| Almost-C abelian structure and Euler–Poincaré duality, §§0.5,1.5 | Docstring: missing arithmetic categories and their Ext |
| Disc extension isomorphism, §3.7 | Docstring: missing sympathetic and left-heart TVS carriers |
| Full faithfulness for reasonable qBC, §5.4 | Docstring: missing TVS, period Pair and qBC carriers |
| Period height–rank theorem, §6.7 | Docstring: missing sympathetic VS and period functor |

The absent carriers were searched by object in both pinned libraries. No further headline was found statable by a few simple native definitions; no stand-in is present. R02 removes duplicated foundational ownership without deleting either substantive acceptance theorem.

### Pinned declarations opened

Both revisions match the package's amended hashes. The following are relative to the pinned Mathlib and Tau Ceti trees, not newer online documentation.

| Declaration | File and line opened; material restriction |
| --- | --- |
| CategoryTheory.Functor | `Mathlib/CategoryTheory/Functor/Basic.lean:40`; objects/maps/laws, no sympathetic condition |
| TopModuleCat | `Mathlib/Algebra/Category/ModuleCat/Topology/Basic.lean:41`; topological additive group and scalar continuity, no Hausdorffness/completeness/local convexity |
| ContinuousLinearMap.isOpenMap; exists_preimage_norm_le | `Mathlib/Analysis/Normed/Operator/Banach.lean:229`, :162; completeness binders at :81 and :155, surjectivity explicit |
| Submodule.torsionBy | `Mathlib/Algebra/Module/Torsion/Basic.lean:177`; kernel of scalar multiplication |
| LinearMap | `Mathlib/Algebra/Module/LinearMap/Defs.lean:84`; actual semilinear map structure |
| BDeRhamPlus; BDeRham | `Mathlib/RingTheory/Perfectoid/BDeRham.lean:75`, :88; adic completion/localization, no classical Galois action or period topology |
| Abelian.Ext; Ext.mapExactFunctor | `Mathlib/Algebra/Homology/DerivedCategory/Ext/Basic.lean:118`; `Mathlib/Algebra/Homology/DerivedCategory/Ext/Map.lean:126`; HasExt universes and exact-functor conditions retained |
| PadicAlgCl; PadicComplex | `Mathlib/NumberTheory/Padics/Complex.lean:54`, :137; completion carrier, spectral norm at :67 and norm extension at :191 |
| krullTopology | `Mathlib/FieldTheory/KrullTopology.lean:134`; automorphism-group topology |
| spectralNorm_eq_of_equiv | `Mathlib/Analysis/Normed/Unbundled/SpectralNorm.lean:451`; use after restriction to ℚ_p |
| Completion.map; map_coe | `Mathlib/Topology/UniformSpace/Completion.lean:477`, :488; dense-image formula requires uniform continuity |
| IsModuleTopology | `Mathlib/Topology/Algebra/Module/ModuleTopology.lean:133`; topology equality, not an arbitrary topology |
| AddMonoid.End | `Mathlib/Algebra/Group/Hom/Defs.lean:975`; generated by to_additive from Monoid.End |
| WittVector.fontaineTheta | `Mathlib/RingTheory/Perfectoid/FontaineTheta.lean:166`; adic completeness and nonunit prime supplied |
| TauCeti.ExactStructure | `TauCeti/CategoryTheory/Exact/ExactStructure.lean:241`; genuine pushout/pullback axioms |
| TauCeti.ExactStructure.IsConflationExact | `TauCeti/CategoryTheory/Exact/Functor.lean:74`; additive preservation of selected conflations |

Near-match checks also opened `Mathlib/FieldTheory/IntermediateField/Algebraic.lean:54`, `Mathlib/Condensed/Discrete/Module.lean:145`, and the finite-Galois semilinear-descent specification in `TauCeti/FieldTheory/Galois/SemilinearDescent.lean:17`. Intermediate-field dimension transport, locally constant condensed modules and finite-Galois descent do not assert Fontaine full faithfulness or the fundamental extension theorem. The actual overlap is the open supplier construction R02, not a pinned theorem.

### Supplier order, ownership and overlaps

The board-packages index was read before the ownership search. Its three separately hosted packages concern analytic number theory, Lawrence–Venkatesh and logic/definability, rather than these carriers. Used `roadmaps grep` and `roadmaps show` against main and the indexed open heads, including the closest roadmaps listed by overlaps. No helpers were used and no issue or pull-request writes were made.

All 18 imported parent headings exist at the head of #1205. In `TauCetiRoadmap/VectorBundlesAndIsocrystals/README.md` their lines are: Sympathetic Vector Spaces 1287; Finite-Dimensional presentations 1310; Exact faithful Banach realization 1333; Dimension/abelian BC 1341; Dimensions of standard spaces 1349; Curvature orthogonality 1414; Tilted coherent heart 1422; Le Bras equivalence 1445; HN decomposition 1477; Canonical curvature filtration 1491; Artinian property 1525; Morphism calculus 1541; Torsion at an untilt point 1553; Curvature-zero finite-length modules 1561; VS torsion Hom vanishing 1569; Curvature/HN support 1577; Height of torsion subobjects 1601; Nonpositive extension criterion 1617. These are imported, not re-owned.

Other citations were resolved in their actual files:

- #854, `TauCetiRoadmap/LocallyAnalyticDistributions/README.md`: §§0.0–0.3 and Layer 1; left hearts at 939, functional extension at 1097, strict countable limits at 1125. Its finite-dimensional cohomology/strict Roos hypotheses are explicit, so it cannot by itself prove the non-nuclear comparison of §4.8. The package owns that additional target.
- #1062, `TauCetiRoadmap/PadicHodgeTheory/README.md:894`, §4.4: arbitrary finite-dimensional continuous semilinear C-representations. #879, `TauCetiRoadmap/FiniteFlatGroupsAndIntegralPadicHodgeTheory/README.md:1596`, §R07.P7.2: labelled rational Sen operators. These are not confused with only rational representations.
- #940, `TauCetiRoadmap/PadicPeriodRings/README.md`: §1.5 at 217, §2's general-base invariants at 284–293, §§4.1–4.3 at 417,449,470. Their periods, twists and fixed fields match. Its §1.1 is the additional owner found in R02.
- #856, `TauCetiRoadmap/ArithmeticGaloisRepresentations/README.md:779`, §1.1: continuous finite-dimensional representation interface. #858, `TauCetiRoadmap/ArithmeticGaloisDuality/README.md:700`, §R02.1.3, and :5392, §D7.4: lattice rationalization and local duality. §R02.2.1 at 1190 is correctly mentioned only as insufficient for the continuous-period complex.
- #816, `TauCetiRoadmap/PerfectoidTowers/README.md:2459`, §P9.6: smooth discretely valued base and completed geometric cover hypotheses retained in the intended route. P9.2 at 1960 distinguishes uncompleted O from Ô. The new tower instance fails for R01's separate reason.
- Main's `TauCetiRoadmap/PerfectoidSpaces/README.md`, P1/P3/P6, supplies the stated criterion, almost purity and pro-étale morphism calculus. Main's `TauCetiRoadmap/AlgebraicVectorBundles/README.md` is the generic-bundle ownership deferral, but its L0–L2 labels are stale (R05).
- #1759, `TauCetiRoadmap/CstConjectureForDaggerVarieties/README.md:14` and :102–112, expressly imports this roadmap's period-Pair/qBC/height objects and declares its additional supplier contracts. It is a consumer, not a second owner. #1064, `TauCetiRoadmap/CohomologyComparisons/README.md`, §§4.8–4.11 at 863–915, is also a consumer. Neither is a Needs edge here.

The overlap data report no other PR changing this roadmap, no dropped cited id, and no id supplied only by an unacknowledged open revision. The closest scopes were inspected rather than treating that empty structural overlap report as proof of no object duplication: R02 is the resulting P2 ownership finding. No fully qualified Lean-name collision was found.

The dependency command was run exactly in the prescribed movable mode. Output:

```text
depcheck: 236 roadmaps, 2141 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line. Every Needs line was read; suppliers are earlier or on main. Citation resolution found no cross-roadmap name or own Lean identifier nowhere. That tool reported it had no pinned Lake packages on its host; the pin inventory above was therefore checked directly in the supplied local trees, not inferred from the resolver.

G-HOM is a valid declared contract: `design/plan.json:2925` and README:105 have the same slug, named supplier and uniform quantifier order. The parent's target at README:1571 explicitly still needs the bounded-image step for arbitrary natural maps; CN25 lines 837–841 derive one N from finitely many generators. The contract asks for one N per map, independent of Λ, not for an automatic bound per element. No duplicate supplier or unowned gap was found. Acceptance after repairs remains conditional on this contract; `conditional_gaps` is not set on this needs-changes verdict.

## Not verifiable

- No cited text was unreadable, paywall-blocked or missing. No source-service fetch or manifest change was necessary.
- The new analytic descent route is not certified in its present form because of R01. CN25 abbreviates its almost-étale/decompletion step; the available source does not verify the newly written, incorrectly indexed tower.
- As in the previous review, the full nonseparable period-model comparison (§4.9) and the non-nuclear Fréchet inverse-limit step (§4.8) are not justified by the portions of CN25's proofs that were read. They are expressly owned construction targets. The tests above establish no counterexample; a sorry build supplies no proof of them.
- §6.2's entire sympathetic-VS-to-sheaf comparison is likewise a construction target. The cited sheaf Ext tables and enriched comparison theorems were verified on their own categories and hypotheses; they are not an existing proof of every claimed sympathetic comparison. This is a limit of source certification, not a missing-source request or an assertion that TVS25's categories coincide.

## Source issues

- **Misprint** in FF18 at Preface Remark 2.24(i), p. 21: the source says Galois cohomology of almost C-representations vanishes in degrees at least two; it should be degrees greater than two, since H²(G_K,ℚ_p(1))=ℚ_p; affects a stated result.
- **Misprint** in FF18 at Preface Proposition 2.28(i), p. 23: the source says the unsigned sum of Ext dimensions equals the negative height product; it should be the alternating sum with factors (−1)ⁱ; affects a stated result.

- **Misprint** in CN25 at Remark 4.3, p. 21: the source says Schneiders Corollary 1.2.20 gives the localization model; it should be Corollary 1.2.21; affects nothing.
- **Misprint** in CN25 at Lemma 2.10 proof, p. 11: the source says the nonzero range for W_(1) is 0≤j≤j−1; it should be 0≤j≤k−1; affects the proof.
- **Misprint** in CN25 at Lemma 4.13 proof, p. 24: the source says restore the constant cocycle by adding its constant to u; it should be subtract that constant, since δ(c)=−c; affects the proof.
- **Error** in CN25 at Lemma 4.13 proof, p. 24: the source says choose i=pʳ for r=v_p(k); it should be i=p^(r−1), which stays below k and has binomial valuation one; affects the proof.
- **Misprint** in CN25 at Remarks 4.17 and 4.21, pp. 25,27: the source says use the positive-positive relation for the displayed pushout; it should be the opposite-sign relation, or explicitly negate the kernel framing; affects nothing.
- **Misprint** in CN25 at Lemma 4.24(i), p. 28: the source says Ext¹_TVS(U_d,W) is W; it should be zero, as its own surjective boundary calculation proves; affects a stated result.
- **Gap** in CN25 at Lemma 4.29 proof, p. 30: the source says linearity for all integral scalars after proving only the unit case; it should be extended to nonunits by c=(1+c)−1 and additivity; affects the proof.
- **Gap** in CN25 at Proposition 4.18 proof, p. 26: the source says the reasonable Fréchet case follows from an argument treating nuclear Fréchet spaces; it should be supplemented by the general inverse-limit comparison; affects the proof.
- **Gap** in CN25 at Proposition 4.22 proof, p. 27: the source says reduction to Proposition 4.18 covers reasonable period models without separability; it should be supplemented by the nonseparable graded-piece argument; affects the proof.
- **Gap** in CN25 at Lemma 4.9 proof, p. 23: the source says its first equation uses exp(pX) for every p; it should use exp(4X) and the quadratic initial relation at p=2; affects the proof.

The last item narrows the previous report's diagnosis: E₁ itself exists at p=2 as a root, and the lemma's integral perfectoid ring is not refuted. If Z₀=(E₂−1)/2 and Z₁=(E₁−1)/2^(1/2), then Z₀=Z₁²+2^(1/2)Z₁. Thus the corrected p=2 tower and the source's tower generate the same integral algebra after reindexing; it is the displayed exponential proof that fails at 2.
