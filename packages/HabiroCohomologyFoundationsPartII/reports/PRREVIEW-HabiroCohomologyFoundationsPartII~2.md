# Review of HabiroCohomologyFoundationsPartII (pull request #1466 at 729dbcb)

**Verdict:** needs changes

## R01 (P2) — Reconcile the obsolete supplier-gap inventory

**Previous finding:** R01 is **not repaired**. The previous review and this review examine the same head. The plan still has fourteen gap entries, and none of their slugs appears in the PR README. Rechecking the suppliers confirms the substance of the previous finding.

**Location:** `TauCetiRoadmap/HabiroCohomologyFoundationsPartII/README.md:89`, `:92`, `:146`; `packages/HabiroCohomologyFoundationsPartII/design/plan.json:2`. The README says “Import the ordinary étale equivalence”, “Import the theorem for every étale-framed smooth S”, and “Construct the unique p-complete connective E∞ spherical lift”.

**Claim:** The plan requests twelve contracts already stated by RefinedTraceMethods and two constructions now explicitly owned by this roadmap's §0.1. These requests are redundant under the gap-minimality rule. The plan and PR README consequently describe different ownership arrangements. This is one inventory defect, not fourteen missing-prerequisite findings.

**Witness:** RefinedTraceMethods README:2531, 3046, 3142, 3166, 3349, 3557 and 3909 supply the requested trace contracts. This README:146 owns both remaining lifts. All fourteen requests remain in plan.json:2–86.

**Exact repair:** Delete the fourteen obsolete entries from the plan's top-level `gaps` list. Keep the existing section-level imports and §0.1 construction targets. Do not recreate redundant README gap requests. If a genuinely different residual requirement remains, state only that requirement, with identical slug and hypotheses in the plan and README. Preserve the distinct inherited SolidAnalyticRings contracts and the conditional enhanced contracts of HabiroCohomologyFoundations.

**Repair tested:** For S=ℤ[x,y], the supplier's full framed theorem already gives form-degree-two step h^max(2−2,0)Ω²[[h]]=Ω²[[h]], including its separate prime-two resolution comparison. Deleting the gap loses no input. For A=ℤ_p, §0.1 still constructs S_p and the identity perfection map; for toric A=ℤ_p⟨x⟩, it still constructs the root-colimit lift and its map. The repaired inventory has twelve resolved imports, two local targets, and zero outstanding requests among these fourteen names. The detailed reconciliation is below.

This does not reopen FIX-RT~2 F02's settled objection about unavailable spectral prerequisites. That report's rationale concerned a package which requested those constructions externally; the PR now explicitly owns them in §0.1. The surviving defect is the stale inventory, not a demand to edit the supplier or to implement a prerequisite before accepting a roadmap.

## Verified sound

Independent AI review of both complete files at the specified head. I read the repository's Writing a roadmap checklist and CONTRIBUTING, inspected the prose layer/API/Checks shape against the completed LocalGaloisGroups and PolynomialGaloisGroups roadmaps on main, checked all ten sampled subsections, and inspected all eight cited works in their supplied legal extractions. The report distinguishes source theorems from new assembly or extension targets.

The worker's gate passed all scanners, metadata, dependency, stray-file, outside-folder and targeted-build checks. Independently, the outside-folder diff was empty and the worktree was clean. Direct `lake env lean` elaboration of `TauCetiRoadmap/HabiroCohomologyFoundationsPartII/Suggested.lean` exited 0 with no diagnostics. No Tau Ceti object file needed building. No Lean process remains running.

The prescribed dependency check returned:

```text
depcheck: 204 roadmaps, 1641 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. All Needs lines and layer dependencies were read. The early algebraic pair/descent interface precedes the trace supplier; this roadmap assembles and applies both. No consumer is used as a supplier. No algorithm, source-passage copying, sorry'd data, set_option, stand-in theorem or additional PR file was found.

### Source verification

All locators below refer to the fixed versions named in References, using printed pagination. There are no README locators marked unverified. All eight manifest works are certified and available; no new source fetch or manifest edit was necessary.

| Sampled target | Text opened | Hypotheses and extent of support |
| --- | --- | --- |
| §0.1 completed lifting and perfection | HA line 51577, Cor. 7.4.1.28 and Remark 7.4.1.29, p.1346; HA line 52724, Thm. 7.5.0.6, p.1374; KU lines 3678, 3715, 3902, pp.82,83,87; TC line 1304, §3.4, p.31 | HA supplies ordinary étale equivalence and square-zero Postnikov machinery. KU 6.9 uses relative formal lifting; KU A.1 constructs perfection using can⁻¹φ; TC supplies the free perfect δ-ring specialization. The unrestricted completed formal equivalence and its effectivity are explicitly new §0.1 targets, not asserted to be HA's theorem. |
| §1.1 input objects and morphisms | KU lines 973, 988, 1949, 2103, 3678–3719; 3.1–3.2, 4.18/4.18a, 6.7–6.9, pp.24,46,49,82–83 | Global cotangent amplitude is separate from p-complete tests. E₁ retains torsion-freeness, the semiperfect cover and its lifted Čech diagram. The condition at 2 is retained. Structured morphisms are defined here. |
| §1.2 trace-pair assembly | KU lines 1908–1944, 2107–2158, 2162; 4.17, 4.25–4.29, pp.45–46,49–51; QH line 3514, A.14, p.76 | The trace description is for filtration completion. Pullback to qdR keeps the rational corner; Eₙ gives Eₙ₋₁. Functorial assembly is work on the defined input category, not a theorem about arbitrary ring maps. |
| §1.3 descent | QH lines 1089–1184, Thm. 3.11 and Cor. 3.13, pp.25–27; KU lines 3548–3594, 5.62–5.63, pp.79–80 | Descended h-completion is qHdg, with ascending q-Witt graded pieces. The KU comparison retains 2 invertible, (A₂), positive divisibility indices, shearing and Bott/completion order. It is a module equivalence. |
| §2.1 quotient lifts | Bu lines 50–62, 412–417, 474–488; Thms. 1.4–1.5, Def. 5.1/Thm. 5.2, Remarks 5.5/5.7, pp.2,10–12; QH line 2876, p.63; KU lines 3682–3719, pp.82–83; TC lines 1262–1344, pp.30–31 | Odd-prime bounds 2/3 and prime-two even bounds 4/6 are sufficient. Uniqueness is v-compatible. Spectral quotients need not be ordinary; regularity and torsion-freeness are separate in applications. |
| §2.2 perfected-lift criterion | QH lines 2860–2886, 2970–3017; Thm. 4.22(b), Lemmas 4.26–4.27 and proof, pp.62–66 | p-torsion-free, p-quasi-lci and relative-semiperfect hypotheses agree. The proof uses (p,h)-completed faithfully flat base change and the perfect-base identity-cover theorem. Higher powers are an application, not a restriction of the general criterion. |
| §2.3 canonical quasi-regular pair | KU lines 1908–1944, 2107–2158, 2162; QH lines 3026–3077, Construction 4.28/Thm. 4.29/Remark 4.31, pp.66–67 | The local preimage theorem concerns identity covers. The global comparison is explicitly an assembly target, retaining qdR maps, rational data and the enhanced condition for derived commutativity. |
| §3.1 canonical/framed comparison | QH lines 2501–2560, Remark 4.4/Lemmas 4.6–4.7, pp.55–56; KU lines 3726, 3852, 3873, Thm. 6.10/Remark 6.14, pp.83,86 | The specified counit is an equivalence modulo β. The canonical domain keeps small-prime inversion and n=max(d,1). The full framed comparison, corrected diagonal model and prime-two resolution comparison are supplier targets. Both filtrations are pulled back to qdR. |
| §4.1 inversion/realisation | KU line 3880, Cor. 6.15, p.86; GSWZ lines 255–275, Definition 1.1, pp.6–7 | Δ is positive and divisible by 6 and disc(F). The order is genuine fixed points, residual-circle fixed points, limit, then π₀. Finiteness is over ℤ[1/Δ]. The unexplained factor 3 is retained. |
| §4.2 arithmetic exports | GSWZ lines 260–275, Definition 1.1 and (12)–(13), pp.6–7; QH line 1174, p.27; KU line 3880, p.86 | Maps are transported by the specified inverse ε_R. Full tensor coefficients and the arithmetic Frobenius direction remain. Naturality of ε is explicitly a new target rather than attributed to an objectwise corollary. |

Also checked BS line 3898 (Thm. 15.3, pp.103–104), BS line 3960 (Prop. 15.7 and following reconstruction, p.105), and BMS2 lines 252–294 (Thm. 1.12, pp.6–7). The intrinsic Nygaard filtration, its Frobenius twist and its completion are distinct from the descended trace filtration; local homotopy evenness is not global evenness.

One source note in the previous review is withdrawn: QH line 2876 says that **Theorem** 4.22(b) implies part (a). This is correct: the hypothesis of (a) supplies the lift hypothesis of (b), so the theorem in (b) proves the conclusion in (a). It is not a reversed implication between hypotheses. It is therefore absent from Source issues below.

### Computed adversarial pass

The rows record computations of objects, coefficients, maps or distinguishing invariants on both sides. They are tests, not proofs of spectral equivalences. The 116 computed rows cover all nine headlines, every sampled subsection, their API laws and the inventory finding. “Keep” means no change requested. Denominators in q-divided powers are interpreted in the specified envelope; the numerical checks take nonzero denominators. Arbitrary noncommutative groups are not inputs to these commutative-ring statements; the nonabelian number-field example tests the relevant Frobenius issue.

| Statement | Instances | Computed values on the two sides / wrong model | Result and change |
| --- | --- | --- | --- |
| Positive-index convention | m=0,1,2 | C₁={1}, C₂ has 2 elements; order 0 gives no finite subgroup | Keep m≥1. |
| q-integers and monomials | r=0,1,2; q=1 | [0]=0, [1]=1, [2]=1+q→2; constant differential=0 | Keep separate constant case. |
| Rees sign and grading | i=1, h=0 | βt=h; modulo β, h=0; modulo h, only βt=0 | Keep degree-one quotient. |
| Double-speed/shearing | Hℤ and Σ²Hℤ | Even steps: (Hℤ,0) and (Σ²Hℤ,Σ²Hℤ,0); Σ⁻²Σ²Hℤ=Hℤ | Keep shift −2i. |
| Filtered quotient | Fⁱ=h^max(i,0)ℤ[[h]], i=0,1,2 | cofib(h:Fⁱ⁻¹→Fⁱ) gives ℤ,0,0; same-step quotient gives ℤ,ℤ,ℤ | Keep filtered convention. |
| Pair versus completed filtration | R=0, A=ℤ | F⁰=ℚ[[h]], whereas completed trace object=0 | Clause (a) rules out substitute. |
| Two completion operations | Constant Fⁱ=ℚ[[h]] | h-completion=ℚ[[h]]; lim_n cofib(id)=0 | Keep distinction. |
| p-completion before inversion | ℤ at p=2,3 | (ℤ∧_p)[1/p]=ℚ_p; (ℤ[1/p])∧_p=0 | Keep order. |
| Relative semiperfectness | ℤ[x]→ℤ, x↦1; ℤ→ℤ[x] | First relative Frobenius reaches every constant; second misses x mod p | Identity cover excludes polynomial line. |
| Ordinary/completed étale lift | ℤ[x]→ℤ[x,x⁻¹] | Mod p: localization with cotangent 0; completed source/target are ℤ_p⟨x⟩/ℤ_p⟨x,x⁻¹⟩ | Keep completed category. |
| Completed-localization Check | f=Σ p^(n²)x⁻ⁿ, radii abs(p)^(2m) | min(n²−2mn)=−m²; m=1,2,3 gives −1,−4,−9; degree-d term valuation c+2mN−dm² dominates lower degrees | Transcendence separates ordinary étaleness. |
| relativeFormalEtaleLift | C=A₀ or 0 | U_C=T or 0; reduction=A₀ or 0; relative cotangent=0 on both sides | Keep existence target. |
| Marked mapping spaces | C=A₀², A₀=ℤ_p⟨x⟩ | Unmarked automorphisms id/swap: 2; fixing reduction marking: 1 component with no higher choices | Keep markings. |
| Relative formal base change | T=(S[x])∧_p, C=A₀², x↦0 | Lift base change S_p²; reduction ℤ_p²; ordinary construction also ℤ_p² | Keep marked equivalence. |
| Nonflat formal base change | A₀=ℤ_p⟨t^(1/p∞)⟩, C=ℤ_p, A₀′=A₀/(t) | Derived tensor represented by [ℤ_p --0→ ℤ_p], π₀=π₁=ℤ_p; ordinary tensor has π₁=0 | Staticity hypothesis needed. |
| Formal-lift identity/composition | Evaluation x↦0, then identity | Both composites send x↦0 and 1↦1 | Keep coherence target. |
| Perfect δ-ring lifts | B=ℤ₂,ℤ₃,0 | Reductions ℤ₂,ℤ₃,0; at 2, π₁(S₂)=ℤ/2 but π₁(Hℤ₂)=0 | Native spectral carrier necessary. |
| Perfect free δ specialization | x↦p or 0, quotient x² | Cofibers S_p/p² and S_p⊕ΣS_p; reduction sends x to p versus 0 | Marked map excludes zero specialization. |
| sphericalPerfection | A=ℤ_p⟨x⟩, p=2,3 | Endomorphism sends x to x² or x³; x has no preimage until roots are adjoined | can and φ distinct. |
| sphericalPerfection boundaries | A=ℤ_p or 0 | Completed identity colimit=S_p or 0; reduction=A on each side | Keep. |
| Relative root tower | A=ℤ[x], B=A[t^(1/n)] | d(t^r)→p(t^(r/p))^(p−1)d(t^(r/p))=0 mod p; x still has no p-th root | Relative lifting is broader than absolute perfection. |
| Arithmetic fracture | Hℚ and sphere | Hℚ has all local completions 0 but rational corner Hℚ; sphere has π₀=ℤ, π₁=ℤ/2 | Keep rational data. |
| TraceInput global amplitude | R=ℚ[u,v]/(u²,uv,v²) | Every p-completion=0; ideal height=2, minimal generator count=3 | Local tests do not imply global lci. |
| TraceInput forget/lifts | Unit input A=R=ℤ | Forget gives ℤ; each local lift reduces to ℤ_p; identity maps 1↦1 | Keep structured carrier. |
| TraceInput morphisms | Same ring, different branch at odd p | Underlying identity exists; cross-branch morphism set empty; same-branch identity composes to identity | Category agrees with definition. |
| ofSpherical | ℤ[1/2][x] versus ℤ[x] | 2-completions 0 and ℤ₂⟨x⟩ | Second needs separate E₁ data. |
| ofEtale | ℤ[x]→ℤ[x,x⁻¹] at 2,3 | Relative Frobenius mod p is an isomorphism; completed cotangent=0 | Completed lift fits identity cover. |
| ofFramed | ℤ[x] at 2 | In cover, x=(x^(1/2))² mod 2 | Cover supplies semiperfectness. |
| ofIdentityCover | R=A versus ℤ/9 | L_A/A=0; in ℤ/9, 3·3=0 with 3≠0 | Torsion-free requirement discriminates. |
| TraceInput.unit | A=ℤ and A=0 | Local lifts S_p and 0; identity maps reduce to identity | Keep. |
| ku-lift exclusion | Free perfect δ quotient by x | Required p-th-step correction has a coefficient 1/p; ku-lift exists, spherical criterion would force missing lift | Keep spherical hypothesis. |
| tracePair object/zeroth step | Unit and R=0 | F⁰=ℤ[[h]] and ℚ[[h]]; completed objects ℤ[[h]] and 0 | Pullback has correct zeroth step. |
| tracePair_map | Identity unit input | hⁱa maps to hⁱa; mod β, a maps to a | Keep maps of pairs. |
| tracePair_map_id | Unit | id(hⁱ)=hⁱ in every nonnegative step | Keep README API. |
| tracePair_map_comp | Two identity unit maps | Composite and image of composite both send hⁱ↦hⁱ | Keep README API. |
| tracePair_completion | R=0 | Completion of constant ℚ[[h]]=0=trace of zero | Keep. |
| tracePair_modBeta | Unit, i≤0/i>0 | Quotients ℤ/0, matching fil_Hdg of ℤ over ℤ | Keep. |
| tracePair_rational | Unit | Both rational h-completed steps h^max(i,0)ℚ[[h]] | Keep final h-completion. |
| tracePair_pRational | Unit, p=2,3 | Both p-adic rational steps h^max(i,0)ℚ_p[[h]]; reversed completion gives 0 | Keep separate clause. |
| tracePair_multiplicative | n=2,∞ | Guaranteed levels 1,∞ respectively | No E∞ inference from E₂. |
| tracePair_etale | A=ℚ, R=ℚ(i), k=1,2 | Pullback H⁰=h^kℚ[[h]], H¹=(R/ℚ)[[h]]/h^k, dimensions 1,2; static h-adic substitute has H¹=0 | Keep uncompleted pullback. |
| tracePair polynomial Check | ℤ[x], i=1,2 | Completed steps [hB→B dx], [h²B→hB dx], B=ℤ[x][[h]] | hⁱqΩ has wrong dx step. |
| traceHabiro object | Unit and zero input | H gives classical Habiro ring and 0; h-completions ℤ[[h]] and 0 | Keep composition with supplied H. |
| traceHabiro_map | Two identity maps | Stage maps and composite send q↦q, 1↦1 | Keep functoriality on inputs. |
| traceHabiro_hCompletion | Polynomial line; 1,x,x² | Differential coefficients 0,h,q²−1; qdR coefficients 0,1,1+q | At q=1: 0 versus 1,2; keep qHdg. |
| traceHabiro_partialCompletion | Unit, 1 divides 2 | Both order-one completions ℤ[[h]], with q↦1+h | Direction is order 2 to order 1. |
| traceHabiro_qWittGraded | Polynomial line, m=1 | gr₀=ℤ[x], gr₁=Σ⁻¹ℤ[x]dx, gr_i=0 for i>1 | Keep ascending filtration and shift. |
| traceHabiro_smooth | Polynomial line, m=1 | Reduction differential=0, H⁰=ℤ[x], H¹=ℤ[x]dx; Bockstein x²=2x dx | Matches length-one Witt forms. |
| traceHabiro_multiplicative | E₂/E∞ input | Output E₁/E∞; same levels on reductions | Keep. |
| traceHabiro_pairEquiv | Identity unit-pair equivalence | Every finite completion sends q↦q on both routes | Marked equivalence, not arbitrary lift independence. |
| traceHabiro_periodic | Unit | β-inversion gives H[β±¹]; degreewise h-completion gives ℤ[[h]][β±¹] | Keep degreewise completion. |
| traceHabiro_cyclonic | ℤ[1/6], m=1 | Genuine C₁ operation=id, then TC⁻; degree-zero h-completion on both sides ℤ[1/6][[h]] | Keep A₂ and 2-inversion. |
| Descending/ascending distinction | Polynomial line, m=1 | qHdg/h has zero differential; ordinary dR has H¹=⊕_(r≥1)(ℤ/r)x^(r−1)dx | Different filtered objects. |
| Ordinary/derived completion input | B=M=𝔽₂ | Monic quotients of degrees 1 and 3 have dimensions 1 and 3; multiplication kernels=0 | No coefficient-flatness assumption needed. |
| E1QuotientExponent | α=0,…,7 | p=2: 00001010; p=3: 00111111 | Keep evenness and lower bound. |
| E2QuotientExponent | α=0,…,7 | p=2: 00000010; p=3: 00011111 | Distinguishes E₂ from E₁. |
| E₂ implies E₁ | p=0,1,2,3,4; α=0,…,19 | (E₂,E₁) counts: (true,true)=75, (false,true)=5, (false,false)=20, (true,false)=0 | Prime assumption stays on lift theorem. |
| quotientLift E₁ | S₃, y=3, α=2; S₂,y=2,α=4 | Relative exponents 2>1 both times; π₀ quotients ℤ/9 and ℤ/16 | Keep sufficient bounds. |
| quotientLift E₂ | S₃,α=3; S₂,α=6 | Relative exponents 3>2; π₀ quotients ℤ/27 and ℤ/64 | Keep. |
| quotientLift empty/zero/unit | r=0; y=0; y=1 | Empty tensor=T; zero cofiber=T⊕ΣT; unit cofiber=0 | No false ordinary quotient claim. |
| quotientLift_framed | S=ℤ[x], R=S/(x⁴) | ℤ-basis 1,x,x²,x³; prime-two tower exponent 2 | Torsion-free E₁ application fits. |
| quotientLift_identityCover | B=ℤ[x,t^(1/n)], R=B/(t⁴) | Basis x^a t^r, 0≤r<4; Frobenius preimage t^(r/p); no integer torsion | Relative lifting needed. |
| quotientLift_perfected | ℤ₃/(3²) | π₀ lift=ℤ/9; ker(×3)={0,3,6} | Does not imply next theorem's torsion-freeness. |
| Moore-tower base change | x↦p versus x↦0 | x^α↦p^α versus 0; cofibers S_p/p^α versus S_p⊕ΣS_p | v-compatible marking matters. |
| Sufficient, not necessary | p=2, α=3 | Exponent predicate=false; S/8 nevertheless has E₁ structure | Keep stronger supplier theorem separately. |
| High-powered positive m | 1,9,16,64,8,32,12 | true,true,true,true,false,false,false; failing valuations 3,5 at 2 and 1 at 3 | Keep positive modulus. |
| perfectedLiftNaive | A=R=ℤ₂,ℤ₃ | Fⁱ=h^max(i,0)ℤ_p[[h]]; F/β=ℤ_p for i≤0 and 0 otherwise | Includes p=2. |
| Criterion base-change route | A=R=ℤ_p | A∞=A; completed scalar extension=id; degree-zero comparison=id_ℤp | Keep completed faithfully flat descent. |
| perfectedLiftNaive_qReg | A=ℤ,R=ℚ | All local factors=0; rational steps h^max(i,0)ℚ[[h]] | Local emptiness does not kill rational pair. |
| perfectedLiftNaive_higherPowers | α=2, p=2 and 3 | Spherical predicate false/true; algebraic theorem gives q-deformation at both primes | Keep independent algebraic route. |
| Toric x−1 criterion | n=0,1,2 | Divided powers 1,x−1,(x−1)(x−q)/(1+q); q=1 gives 1,x−1,(x−1)²/2 | Envelope elements, including at 2. |
| Exponent-one obstruction | Free δ-base, p=2 | Correcting term involves hδ(x)/2; coefficient 1/2 is not integral | Spherical E₁ lift excluded, ku-lift not excluded. |
| tracePair_quasiRegular membership | Unit; toric quotient x−1 | Unit perfection map=id; toric map adjoins roots; relative Frobenius onto 𝔽_p | §2.2 criterion applies. |
| tracePair_quasiRegular pair | A=R=ℤ | Both constructions glue hⁱℤ_p[[h]] and hⁱℚ[[h]] to hⁱℤ[[h]] | Product alone gives wrong coefficients ∏ℤ_p. |
| Independence of identity lifts | Unit | Both local descriptions are the submodule hⁱℤ_p[[h]] | No mixed-branch independence inferred. |
| Quasi-regular E∞ refinement | Unit, filtration degrees 1,2 | h·h=h² in both models | Derived commutative refinement keeps supplier condition. |
| Quasi-regular Habiro consequence | Unit and zero input | Both descents H_ℤ and 0 respectively | Keep functorial consequence. |
| Quasi-regular boundary | m=1,9; polynomial line | ℤ/1=0 torsion-free; 3 kills nonzero 3 in ℤ/9; x has no Frobenius preimage in 𝔽_p[x] | Identity-cover hypotheses discriminate. |
| Jackson operator | 1,x,x²; x=0,q=1 | 0,dx,(1+q)x dx; q=1 gives 0,dx,2x dx; at x=0 last value 0 | Integral operator, no division by zero. |
| Coordinate filtration | d=2, i=0,1,2 | In degree 0 powers 1,h,h²; in degree 2 powers 1,1,1 | Keep max(i−j,0). |
| canonicalFramedTrace domain | d=0,1,2 | n=1,1,2; prime sets ∅,∅,{2} | Positive bound preserves dimension zero. |
| canonicalFramedTrace_pair | ℤ[x], i=1 | All three completed models [hB→B dx]; quotient Ω≥1 | Correct specified comparison. |
| Counit, not arbitrary map | Unit modulo β | Counit=id_ℤ; zero map sends 1↦0 | Completeness alone insufficient. |
| canonicalFramedTrace_habiro | S=A, m=1 | Both completions A[[h]], both reductions A | Keep finite-projection compatibility. |
| canonicalFramedTrace_einfty | x·x | Jackson derivative=(1+q)x dx; untwisted Leibniz=2x dx | Multiplication is enhanced/transported. |
| Canonical tensor domain | ℤ[x]⊗ℤℤ[x] | Relative dimensions 1+1=2; required primes ∅→{2} | No false tensor closure. |
| Derived reduction Check | M=[B --h∇q→ B dx] | H⁰(M)/h=ℤ; H⁰(M/ᴸh)=ℤ[x]; x,x² map to [dx],[(1+q)x dx] in H¹(M)[h] | Keep derived reduction. |
| Laurent framed Check | ℚ[x,x⁻¹]/ℚ | H¹(qdR)=0; H¹(qΩ)=ℚ[[h]]dlog x | Pullback is essential. |
| TraceInversion | F=ℚ; Δ=0,−6,1,6 | false,false,false,true; discriminant=1 throughout | Keep positivity and 6-divisibility. |
| Gaussian inversion | disc=−4; Δ=6,12 | 4∤6, 4∣12; same ring ℤ[i][1/6] but predicates false,true | Predicate concerns chosen integer. |
| Cubic inversion | F=ℚ(∛2),Δ=108 | disc=−108; all three conditions true; R=ℤ[∛2][1/6] | Keep. |
| isUnit_two_three | ℤ[1/6] | 2·(3/6)=1, 3·(2/6)=1 | Matches unit lemmas. |
| finiteEtale | ℚ,Δ=6; ℚ(i),Δ=12 | Module ranks over localized base 1,2; −4 invertible in second | No finiteness over ℤ asserted. |
| Ramified negative control | ℤ[i] mod 2 | d(i²+1)=2i di=0, so Ω⊗𝔽₂=𝔽₂[i]di≠0 | Discriminant inversion needed. |
| P_R realisation order | m=1; zero coefficient input | First fixed points=id; term=THH^hS¹; for zero all terms, limit and π₀=0 | Keep order and positive indices. |
| numberFieldTraceExports | z=ε_R(q),m=1 | ρ₁(z)=1, τ₁(z)=1+h | Specified inverse ε defines maps. |
| Base convention | Δ=6, scalar 1/6 | φ_p(1/6)=1/6 at p≠2,3; overlap=0 at p=2,3 | Δ is a unit; completed base change applies. |
| Cyclotomic exports | z=ε_R(q),m=1,2 | Finite relations q=1,q²=1; transition sends q↦1 at order 1 | Correct reduction direction. |
| Taylor exports | q at m=1,4 | Values 1+h, ζ₄+X; at m=4 Gaussian coefficient algebra R×R | Full coefficient algebra retained. |
| Tensor idempotent | (1⊗1−i⊗i)/2 | Values (1,0) under the two embeddings; e²=e | One-factor model loses information. |
| Prime-edge transition | Gaussian constant i, p=7 | Left i, right i⁷=−i; choosing f₇=−i makes right i | Constant-family shortcut fails. |
| Frobenius orientation | a=ζ₇,p=11 | 4²=2,4³=1 mod 7; φ(a²)=a; φ(a⁴)=a²≠a | Inverse convention forced. |
| Re-expansion sign | p=2,m=1 before localization | q+1=(q−1)+2, not (q−1)−2; after 1/6 localization overlap=0 | Keep sign. |
| Nonabelian field Check | x³−2 mod 5 | (x−3)(x²+3x+4); quadratic discriminant=3∉{0,1,4} | Completed Frobenius moves quadratic component. |
| Equalizer inclusion | Family (1,0,0,…) over ℤ[1/6] | At (p,m)=(5,1): left 1, right 0 | Full product is larger. |
| Equalizer converse/uniqueness | Zero family and unit family | Reconstructed elements 0 and 1; zero difference family corresponds to difference 0 via ε⁻¹ | Keep both directions. |
| h-completion/noninjectivity | ℤ[1/6] | Completion R[[h]]; component idempotent with v₂(order)=1 is nonzero but τ₁=0 | No injectivity over localized base. |
| Order-one compatibility | z=ε_R(q−1) | τ₁(z) mod h=0=ρ₁(z) | Keep square. |
| Naturality | id; ℚ→ℚ(i), common Δ=12 | Both Taylor routes take q↦ζ_m+X and 1↦1; at m=1 reduction q↦1 | Naturality remains an owned target. |
| Trace exclusion | F=ℚ,Δ=1 | R=ℤ is étale but TraceInversion=false | No invocation outside domain. |
| Independent Nygaard/trace input | R=𝔽₂,𝔽₃; i=1 | Δ̂=ℤ_p, N≥1=pℤ_p; gr¹TC⁻=pℤ_p{1}[2], gr¹TP=ℤ_p{1}[2] | Retain twist, completion and shift. |
| Normalized divided powers | q=2,x=3,y=1,d=1,2,3 | Jackson ∇δᵈ=1,2,2/3=δᵈ⁻¹; λ¹=2 while γ̃¹=−2 | Roadmap normalization correct. |
| Full-diagonal supplier correction | A=ℚ,S=ℚ²,d=0 | In Čech degree 1 uncorrected coefficient S⊗_A S=ℚ⁴; diagonal completion gives S=ℚ², the trace coefficient | Keep full diagonal in supplier contract. |
| Finite-coefficient rational corner | m=1 | Empty product of local complexes=0; dR_(0/ℚ)=ℚ and qdR_(0/ℤ)=ℚ[[h]] | Keep arithmetic pullback. |
| R01 supplied framed gap | S=ℤ[x,y],i=j=2,p=2 | Requested step Ω²[[h]] equals supplier h⁰Ω²[[h]] | Remove redundant gap. |
| R01 local lifting gaps | A=ℤ_p; toric ℤ_p⟨x⟩ | Requested objects S_p/id and root-colimit lift/map equal §0.1 targets | Remove external requests; retain targets. |

### Headline and pinned-library audit

The nine headlines are relativeFormalEtaleLift and sphericalPerfection (§0.1), tracePair (§1.2), traceHabiro (§1.3), quotientLift (§2.1), perfectedLiftNaive (§2.2), tracePair_quasiRegular (§2.3), canonicalFramedTrace (§3.1), and numberFieldTraceExports (§4.2). All nine are explicitly named in the module docstring with their missing carriers. The imported number-field realisation in §4.1 is not claimed as a new theorem here.

At Mathlib revision `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti revision `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, object searches for enhanced q-Hodge pairs, spherical Witt constructions, cyclonic spectra, relative topological Hochschild homology and the required spectral algebras found no native carriers making these nine signatures statable with a few simple definitions. Ordinary arithmetic predicates would be statable but would not state the headlines. The empty target file is appropriate.

Opened native declarations, rather than relying on their names:

| Pinned declaration | File and line | Content and boundary checked |
| --- | --- | --- |
| NumberField.discr | `Mathlib/NumberTheory/NumberField/Discriminant/Defs.lean:36` | Integer discriminant, not an unsigned or chosen integral-basis parameter. |
| Rat.numberField_discr | `Mathlib/NumberTheory/NumberField/Discriminant/Defs.lean:75` | Discriminant of ℚ is 1; verifies the Δ=6 positive example. |
| NumberField.RingOfIntegers | `Mathlib/NumberTheory/NumberField/Basic.lean:101` | Integral closure of ℤ in K; no spectral lift or Habiro ring is bundled. |
| IsLocalization.Away.algebraMap_isUnit | `Mathlib/RingTheory/Localization/Away/Basic.lean:82` | The element inverted by an away-localization becomes a unit. |
| map_dvd | `Mathlib/Algebra/Divisibility/Hom.lean:31` | Divisibility transports under a multiplicative map. |
| isUnit_of_dvd_unit | `Mathlib/Algebra/Divisibility/Units.lean:129` | A divisor of a unit is a unit, including in the zero ring. |
| Commute.isUnit_mul_iff | `Mathlib/Algebra/Group/Commute/Units.lean:74` | Commuting factors of a unit product are units; used only in the commutative setting. |
| Algebra.FormallyEtale | `Mathlib/RingTheory/Etale/Basic.lean:46` | Vanishing Kähler differentials and first cotangent homology; does not define the completed spectral cotangent complex. |
| Algebra.Etale | `Mathlib/RingTheory/Etale/Basic.lean:205` | Formally étale and finitely presented, not module-finite. Localization ℤ→ℤ[1/6] distinguishes them. |
| Algebra.Smooth | `Mathlib/RingTheory/Smooth/Basic.lean:539` | Formally smooth and finitely presented, not module-finite; ℤ[x] is the control. |
| MvPolynomial | `Mathlib/Algebra/MvPolynomial/Basic.lean:79` | Native algebraic polynomial carrier, not the framed spectral resolution. |
| Even | `Mathlib/Algebra/Group/Even.lean:54` | Generated additive predicate from IsSquare; arithmetic evenness alone does not specify a Moore tower. |
| Nat.factorization | `Mathlib/Data/Nat/Factorization/Defs.lean:50` | Multiplicities from primeFactorsList. Composite and zero indices do not acquire a prime-lift interpretation. |

There are **zero declarations** in Suggested.lean, zero sorried theorems, and zero definitions. Consequently there are no `#check @name` subjects and no one-tactic padding probes to run; this is an empty audit set, not skipped testing. There are no dropped section hypotheses, declaration-name collisions, arbitrary predicates, sorry'd data, or substitutes for missing carriers. The single Mathlib import, namespace and module docstring satisfy the form rules. All mathematical APIs and Checks remain in the README.

### Ownership and citation reconciliation

The ownership search used the roadmap service's object searches over main and open heads, checked the supplied sibling checkouts and searched board packages. Objects searched included spherical/perfect δ lifts, completed formal étaleness, q-Hodge pairs, full framed trace comparisons, q-PD diagonals, genuine fixed points, cyclonic comparisons and number-field Habiro rings. No ownership conclusion below is based only on matching this roadmap's declaration names.

The current cross-roadmap citations resolve as follows. Locations refer to each supplier's `TauCetiRoadmap/<Name>/README.md` at main or its supplied open head; completed suppliers retain their `Completed/` location where applicable. These are contracts to be implemented, not claims that every supplier is already formalised.

| Supplier | Sections and inspected line anchors | Ownership boundary |
| --- | --- | --- |
| HabiroCohomologyFoundations | §0.1:274; §§1.14–1.16:588–604; §§2.1–2.10:846–1000; §4.1:1295, §4.4:1337, §4.8:1404; §§4.12–4.24:1467–1669; §4.28:1736; §§5.2–5.8:1827–1892; §§5.15–5.23:2008–2122; §5.26:2146 | Owns algebraic carriers, pairs, animation, descent, canonical/naive filtrations and finite-coefficient arithmetic gluing. This roadmap imports those constructions. Enhanced commutativity and finite-projective base change keep their additional contracts. §§8.18–8.19:2452–2466 are boundaries, not substitute comparison theorems. |
| RefinedTraceMethods | §6.1:2517–2557; §§6.2–6.7:2584–2848; §6.9:2958–3007; §6.10:3021–3172; §§6.11–6.13:3189–3335; §6.14:3349; §7.6:3533–3575; §8.8:3909 | Owns trace machinery, local/global comparisons, corrected framed proof, finite coefficients and objectwise realisation. §0.1 here explicitly extends ordinary spectral étale lifting; §§1 and 4 assemble functors and transported arithmetic maps. |
| QWittVectors | §§2.1–2.5:319–438 | Perfect coverage, relative Adams operations and q-Witt comparisons; torsion-freeness follows on the stated domain, including the zero ring. |
| HabiroRings | §2.1:392, §§2.4–2.5:476–505; §5.1:902, §5.2:934, §5.4:978, §5.6:1007, §§5.8–5.9:1048–1069; §7.3:1290 | Owns ordinary/derived static completion comparison, arithmetic coefficient equalizer and cubic nonconstant-family example. No duplicate definition is kept here. |
| HabiroNumberFields | §§2.1–2.4:611–678 | Supplies full coefficient algebras and Frobenius/Taylor gluing through HabiroRings; no K₃ module target is imported. |
| HabiroCyclotomicCompletions | §1.4:581; §2.3:878; §5.1:1955; §5.3:2177 | Ordinary completion inputs and localized components; no backward reliance on derived Habiro categories. |
| SolidAnalyticRings | §6.4:631; inherited gap statements:71,79 | Supplies bounded-below solid comparison with completed sphere unit. Cardinal-interchange and light-countable-ab6 remain explicit inherited contracts. Exactness alone is not substituted for the latter. |
| KTheoryFiniteLocalFields | §4.0:638 | Owns genuine cyclic fixed-point foundations. Cyclotomic root equivalences and TR restrictions are not inferred from cyclonic structure. |
| StableHomotopyKTheory | §§5.13–5.18 and §§7.13–7.21; §7.32:2780; §7.34:2805 | Spectral/operadic carriers, fracture, completion and compatible Moore towers; uniqueness is for the specified compatible structures. |
| EnhancedDerivedSheaves | E5:presentability.4 and TraceClassData/IsTraceClass; E5:abstract.2; E5:cotangent-export.1:2869 | Symmetric trace-class specialisation and animated deformation machinery. §0.1 explicitly owns the spectral extension and p-complete effectivity instead of pretending the animated input already is that extension. |
| PrismaticCohomology | Layer 0 | Toric δ-structure; its Frobenius sends x to x^p, not to x. |
| PrismaticCohomologyPartII | §3.1:149; §§3.13–3.16:442–498; §§3.20–3.23:546–602; §5.7:1562, §5.8:1599; §§5.14–5.18:1716–1830 | Relative Nygaard/Frobenius-twist and q-PD/Jackson inputs. The trace supplier owns the comparison using these inputs. |
| PrismaticCohomologyPartIII | §7.0:751–787, graded declarations:767 | The three resolver leads Prismatic.Trace.gradedTCMinus, gradedTP and gradedTC are real roadmap targets here. They are not falsely advertised as pinned Lean declarations. |
| AInfCohomology | AI7.2:3815 | THH/TC input retains its own descent and filtration hypotheses; it does not identify the global trace filtration with a global Postnikov filtration. |

The nearby open work does not duplicate the new lifting targets: StableHomotopyKTheoryPartII §4.8:613 concerns spherical Witt lifts of finite fields, and GeneralAlgebraicKTheoryPartII §6.1a concerns perfect-algebra realisation relative to a Lubin–Tate E(k). Neither supplies the marked sphere-linear relative completed formal equivalence of §0.1 for its stated bases. The README's extension beyond HabiroCohomologyFoundations is therefore a legitimate Part II, rather than a re-planning of the algebraic roadmap. All supplied open-head ownership sources were available for searching; no additional unlisted open PR was assumed as a supplier.

Here is the complete reconciliation supporting R01. Each slug appears in the plan and is absent from this README; the last column gives its actual owner now.

| Obsolete gap slug | Resolved owner / witness in current files |
| --- | --- |
| spherical-base-data | RefinedTraceMethods §6.1:2531,2557 |
| local-trace-comparisons | RefinedTraceMethods §6.9:2958,2983,2995,3007 |
| global-trace-pair | RefinedTraceMethods §6.10:3021,3046,3058 |
| full-framed-trace | RefinedTraceMethods §6.10:3142 |
| framed-proof-exports | RefinedTraceMethods §6.10:3093,3119,3142 |
| cyclonic-comparison | RefinedTraceMethods §§6.11–6.13:3191,3271,3335 |
| number-field-realisation | RefinedTraceMethods §6.14:3349 |
| coherent-trace-interface | RefinedTraceMethods §8.8:3909 |
| framed-resolution-comparison | RefinedTraceMethods §6.10, prime-two resolution comparison following the full framed theorem at :3142 |
| framed-derived-commutative | RefinedTraceMethods §6.10:3166,3172; the request's §3.3 framing reference is also obsolete |
| finite-coefficient-trace | RefinedTraceMethods §7.6:3557,3575 |
| framed-pair-coherences | RefinedTraceMethods §6.10:3166,3172 |
| perfect-delta-spherical-lifts | This roadmap §0.1:146 |
| spherical-perfection-map | This roadmap §0.1:146 |

No supplier is `none`, and no additional upward dependency or unowned prerequisite was found. R01 concerns minimality and consistency of declared requests, not the fact that upstream roadmaps contain unimplemented targets. Deleting those requests changes no mathematical dependency.

## Not verifiable

- No cited source was inaccessible: all eight supplied legal texts were read, including all ten sampled targets. There is no missing-text request and no manifest change.
- The general completed relative formal lifting equivalence and p-complete effectivity of §0.1 are new targets, not the statement of HA 7.5.0.6. The source gives the ordinary étale theorem and the obstruction-theoretic route. The examples above test the proposed extension; they do not constitute a proof of that extension.
- Higher coherences, enhanced derived commutative refinements, and the inherited SolidAnalyticRings and HabiroCohomologyFoundations gap contracts are planning obligations. This review verifies their stated ownership and hypotheses, not completed formal proofs. In particular, passing an empty target file cannot certify those mathematical constructions.

## Source issues

- **Error** in GSWZ at footnote 1, printed p.6 (GSWZ line 263): the source says the forward Frobenius family embeds coefficients; it should be the inverse Frobenius family for equation (13); affects a stated result.
- **Misprint** in KU at proof of Corollary 6.15, printed p.86 (KU line 3888): the source says the étale Habiro identification is QH Corollary 3.12; it should be QH Corollary 3.13 in the cited version; affects nothing.
- **Error** in TC at §3.5 and proof of Lemma 3.7, printed pp.31–32 (TC lines 1323, 1357): the source says the uncompleted filtration is a product of local terms with vanishing rational part; it should be an arithmetic pullback retaining the rational corner, already nonzero for m=1; affects a stated result.
- **Misprint** in KU at proof of Lemma 6.11, printed p.84 (KU line 3766): the source says λᵈ((x−y)/(q−1)) equals its Pochhammer-normalized divided power; it should be (−1)ᵈ times that divided power; affects the proof.
- **Misprint** in KU at proof of Theorem 6.10, printed p.86 (KU line 3860): the source says Jackson differentiation lowers the displayed unnormalized divided power with coefficient one; it should be the normalized δᵈ=(1−q)ᵈγ̃ᵈ, or retain the missing factor for γ̃ᵈ; affects the proof.
- **Gap** in KU at Remark 3.10, printed p.27 (KU line 1117): the source says the perfectoid Čech replacement gives the alternative computation; it should be accompanied by a compatible comparison of the two resolutions and their filtered maps; affects the proof.
- **Error** in KU at §6.12(c) and Lemma 6.13, printed p.85 (KU lines 3800, 3806): the source says coordinate divided powers in S tensor powers give the framed coefficient model; it should be completed along the full diagonal, including étale idempotents; affects a stated result.
