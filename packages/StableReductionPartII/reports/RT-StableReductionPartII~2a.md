<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1599#issuecomment-6484685627 -->
Red team round 2 pass a (codex) of 295c94f

Verdict: needs_changes

1. **F01** (P3) Definition Checks remain nondiscriminating

   **Location:** `packages/StableReductionPartII/README.md:1071` (§2.14): “The identity coefficient map induces the identity on R.” Also §§2.32, 2.41, 2.64–2.65, 2.76–2.77 and 2.88.

   **Claim:** Each construction has three discriminating computed Checks. This is the unrepaired portion of B-F04; A-F01's specifically replaced blocks are substantially repaired.

   **Witness:** §2.14's three Checks are identity, zero preservation, and its defining generator law. §2.41 merely repeats the representative and multiplicativity laws. §2.88 repeats the unit and multiplication laws and tests a singleton.

   **Exact repair text:** Replace §2.14's Checks by: “For ℤ→𝔽₂, γ=1 and δ=s=t=0, 2v maps to 0 although 2v≠0. For ℤ→ℤ/4 with s=3 and γ=δ=t=0, c maps to u′−3 and F maps to X²−1. For ℤ→ℤ/4→𝔽₂, 3u+2v maps successively to 3u′+2v′ and u″; direct reduction gives u″.” Replace each listed construction's repeated law with three analogous computed instances of its actual map, retaining the laws in its API.

   **Retest:** Reduction gives 2=0, 9=1 modulo 4, and (3,2)=(1,0) modulo 2. Exchanged coordinates, unmapped parameters, and an injectivity assumption fail these tests.

2. **F02** (P3) API statements still reappear as numbered targets

   **Location:** `packages/StableReductionPartII/README.md:1359` (§2.31); §2.21 API at 1188. “The underlying ring element of P_J(z) equals cz₀−dz₁.”

   **Claim:** B-F02 removed the duplicate law targets while preserving their API statements.

   **Witness:** §2.31 repeats §2.21's first API law; §2.36 repeats §2.30's inverse formula; §2.44 repeats its reconstruction law; §§2.47–2.48 repeat its coefficient/root laws. These are not the four retained precursor route targets.

   **Exact repair text:** Delete §§2.31, 2.36, 2.44, 2.47 and 2.48 as separate targets; keep their statements in §§2.21 and 2.30, and repoint their dependents to those constructions. Apply the same semantic duplicate check to the remaining law targets, not only character-equal paragraphs.

   **Retest:** In ℤ[u,v]/(u²), P_J(2,3)=2u−3v; E⁻¹(2+v,3)=2+v+3u; E(2+v)=(2+v,0); E(u)=(0,1). Both copies give exactly these values, with identical hypotheses and carriers.

3. **F03** (P2) Native augmentations precede their chain-complex construction

   **Location:** `packages/StableReductionPartII/README.md:3613` (§2.151): “π_J:C(false)→single₀ J”; §2.152 has the same issue for the dual.

   **Claim:** The targets are in construction order.

   **Witness:** §2.120 constructs the differential; §2.150 proves its square zero. The native `ChainComplex` C is constructed only in §2.164 (line 3870), after the two native augmentation morphisms.

   **Exact repair text:** Move “The native polynomial section chain complex” immediately after “The section chain differential squares to zero”. Add that construction to the Needs of both native augmentation targets. Renumber and update links. Do not replace native morphisms with unbundled component functions.

   **Retest:** In ℤ[u,v]/(u²), C₀=C₁=R² and d₁=Ψ for the ideal resolution. P_JΨ(1,0)=uv−vu=0. Constructing C from this differential and its square-zero law first makes π_J a well-typed subsequent target; no later augmentation is needed to construct C.

4. **F04** (P3) Residual locator templates cite the wrong operations

   **Location:** `packages/StableReductionPartII/README.md:5120` (§2.222): “HomologicalComplex.Hom.isoOfComponents”; also §2.224 and the `IsLimit` citations in §§2.153 and 2.155.

   **Claim:** The cited native declarations support the deduction claimed at that target.

   **Witness:** `isoOfComponents` builds an isomorphism from component isomorphisms; it proves no exactness. `IsLimit.lift_self` needs an established limit, whereas §§2.153/155 only construct cones, before §§2.190/200 prove their limit properties.

   **Exact repair text:** In §2.222 replace the deduction locator by “Deduction from §2.209 and the differential identification of §2.214.” In §2.224 use “Deduction from §2.222 and `HomologicalComplex.ExactAt.isZero_homology`.” For §§2.153/155 cite the transition/evaluation and tensor naturality laws that establish the cone equations; remove `IsLimit.hom_ext` and `IsLimit.lift_self`. This is the remaining portion of B-F03, not a challenge to its settled monic-division citations.

   **Retest:** In the zero-parameter fixture, ker Φᵀ={(vx+uy,−ux)}=im Ψᵀ, giving positive homology zero. For the cone, reduction of 1+2v+4v² modulo 4 is 1+2v; this verifies a cone equation without any limit premise.

5. **F05** (P3) A projective identity disk need not be self-dual

   **Location:** `packages/StableReductionPartII/README.md:5401` (§2.235): “For finite projective M … an exact self-dual hull”.

   **Claim:** The displayed identity disk on every finite projective M is self-dual under the specified shifted dual.

   **Witness:** For R=ℤ[ω], ω²−ω+6=0, I=(2,ω) is invertible but I² is not principal. Thus I≄I*; the two disks have terms I and I*, respectively.

   **Exact repair text:** “For finite projective M, the identity disk E⁰=M→E¹=M is an exact hull with coker d⁻¹=M. Its shifted dual is the identity disk on M*, again in degrees 0 and 1; an isomorphism M≅M* is not asserted.”

   **Retest:** The norm is a²+ab+6b². Its only elements of norm 4 are ±2. Yet I²≠(2): modulo (2), ω²=ω≠0, whereas I² contains ω². Also I·(2,1−ω)=(2), so I is invertible. Hence [I]²≠1 and I≄I⁻¹=I*. Both disks are exact, and both cokernels in the stated degree are their own respective modules. Contractibility gives a homotopy equivalence, not the claimed termwise self-duality.

6. **F06** (P2) The algebraic completion headline is still absent from Lean

   **Location:** `packages/StableReductionPartII/README.md:5439` (§2.238), “Knudsen completion theorem”; `packages/StableReductionPartII/Suggested.lean:10–13` excludes completed-local transfer as geometric.

   **Claim:** All statable local headline theorems appear in the acceptance file.

   **Witness:** §2.238 uses only Noetherian local rings, maximal-ideal `AdicCompletion`, tensor modules, flatness, and the newly defined `IsRelativelyStablyReflexive`. No sheaf, moduli stack or formal deformation groupoid occurs.

   **Exact repair text:** Add an admitted headline for §2.238: for a flat local map of Noetherian local rings A→R and finite M, set Â=AdicCompletion(maximalIdeal A,A), R̂=AdicCompletion(maximalIdeal R,R), M̂=R̂⊗_R M; with the completed local algebra map extending A→R, assert R̂ is Â-flat and both equivalences SR_A(M)↔SR_A(M̂) and SR_A(M̂)↔SR_Â(M̂). Use the native completion carriers and a real compatible completed-algebra map (or quantify its local algebra structure with the scalar-tower compatibility), not a free predicate. Retain only the genuinely geometric completed-local globalization in the unstatable list. Record the theorem's Lean name in §2.238.

   **Retest:** A=R=ℤ_(2), M=R gives Â=R̂=ℤ₂ and three true conditions. For M=R/(2), M̂=ℤ₂/(2); all three are false by coefficient nonflatness. For A=R=k the completion is k and the theorem reduces to the same finite vector-space condition. Pinned carriers are in `Mathlib/RingTheory/AdicCompletion/Algebra.lean:73`, `LocalRing.lean:85,116`, `AsTensorProduct.lean:327`; the relative predicate is already in this file. This is an omission, not a request to reprove the geometric hull in Lean.

## Verification of round-one findings

A-Fnn and B-Fnn identify the two earlier reviews. Each row checks the repair at this head; a repair report is not evidence that the mathematics is correct. The accepted disputes in B-F02, B-F03, B-F09 and B-F10 are not re-raised.

| Earlier finding | Status and repaired passage in README, unless Lean is specified | Witness at this head |
|---|---|---|
| A-F01 | Repaired at its specified blocks: §§2.5, 2.37, 2.53–2.54, 2.112 now use “1/3”, “2+3u”, and explicit finite quotient values. General Check deficiency remains under B-F04/S01. | 1/3=3 mod 8; (1+2v+4v²)/3=3+6v+4v² mod 8; reduction mod 4 gives 3+2v. Coefficient-level checks in §§2.53–54 do not pretend σ is a coefficient in Â. |
| A-F02 | Repaired: §2.123 says the value is “forced” and calls it a value check. | 3e₂(1/3)=1 mod 4 forces e₂(1/3)=3; this is consistent with e₃(σ/3)=3+6v+4v². |
| A-F03 | Repaired: Lean:101–112 defines `HasUniversalCoefficients`; :145 states `pointedSection_universalCoefficients`. | Both actual Hom exchange maps are determined on pure tensors, and both positive Ext families are included. With N=ℤ/2, ε⊗1 sends v to u⊗1≠0. The omitted completion headline is a different omission, S06. |
| A-F04 | Repaired: §4.14 uses “N=N_{g,0}(15)” and the supplier's ample determinant. | `TauCetiRoadmap/SchemeAndStackFoundations/README.md:5895` supplies `level_structure_cover_ample`; the proof uses that cover, rather than asserting its theorem for an arbitrary finite cover. For g=2,d=2, multiplication has ranks 15→11 and kernel rank 4. |
| A-F05 | Repaired: §2.214 says “after transporting along those identifications”; §0.5 names the stable pointed moduli pseudofunctor. | The heterogeneous-equality/process slug is absent. Transported Hom differentials have the same source and target; in the zero-parameter chart they are the same signed transpose map. |
| A-F06 | Repaired: §2.259 cites “Lemma 53.20.1, tag 0C59”. | mc0-stacks-curves line 2165 labels the nodal-family criterion 0C59; 0C58 labels its enclosing section. |
| A-F07 | Repaired: contract at README:228 and §4.6 import “K3SurfacesAndSymplecticBoundedness §6.0b”. | Current supplied open head, `TauCetiRoadmap/K3SurfacesAndSymplecticBoundedness/README.md:851`, states the canonical formula. The remaining gap asks for positivity. E×B has χ=0,L=O; a Jacobian K3 over P¹ has χ=2,deg L=−2. |
| A-F08 | Repaired: §4.8 identifies the characteristic-zero restriction with “AbelianSchemesAndArithmeticModuliPartII §B4.1”; §§6.12/7.13 agree. | Current supplied open head, that README:1983–2014, constructs fine curve level and quasi-finite Torelli over ℚ(ζ_ℓ). This package adds the integral extension. At N=2, −I=I, explaining why fine-level statements retain N≥3. |
| A-F09 | Repaired: contract README:174–182 imports “perfect_proper_pushforward”, “single_degree_free_locus” and “universal_functions”. | EnhancedDerivedSheaves §E1.9, README:1057; AlgebraicModuliForArithmeticGeometry §7.2, README:8331–8368, provide these inputs. Removed gap is absent from both declarations. P¹ has H⁰=O,H¹=0; an elliptic fibre has H¹ rank 1. |
| A-F10 | Repaired: README:61 declares “gap:stable-tricanonical-embedding”; §§1.2–1.3 consume it. | Same slug and StableReduction Layer 8 owner in plan.json. Main Layer 8 gives global generation/vanishing, not the required very ampleness. The new very-ampleness contract retains reducible/self-nodal curves; dm line 105 supports ω³. |
| A-F11 | Repaired: Lean:152 states `relativelyStablyReflexive_iff_universalCoefficients` with the finite/flat/Noetherian binders. | Ile Definitions 3.1/3.4, Proposition 3.5 and Remark 3.6, ile lines 268–365. M=ℤ gives true↔true; M=ℤ/2 gives false↔false. |
| B-F01 | Repaired: §7.12 and contract README:256 cite “ModularCurves §§1C–1D, 2D, 4A–4B and 9E”. | Main has these sections: README:486,563,751,1063,1077,2008. The groupoid/coarse distinction preserves inversion, including characteristics 2 and 3. |
| B-F02 | Partly repaired: 170 literal copies were removed; §§2.113/2.263 retain their milestones, and finite-free stages retain their retraction role. | New §§2.31/36/44/47/48 still repeat construction APIs; S02 gives exact pairs and values. The four retained precursor targets and finite-free proof stages are not challenged. |
| B-F03 | Partly repaired: §2.116 now cites Proposition 3.1 and finite presentation; §2.214 cites `CochainComplex.of`. | S04 identifies residual `isoOfComponents` and `IsLimit` mismatches. The disputed monic-division citations are valid: R is A-free and R→A is split, making its kernel A-flat. |
| B-F04 | Partly repaired: §§2.21,2.63,2.75 have “P_J(v,u)=0”, “v²”, and “(v,−u)”. | Signed maps give 0 while unsigned P_J gives 2uv over ℤ. C_D(ev_v)=(v,−u). N=ℚ₂ kills every finite 2-power quotient but not R̂[1/2]. S01 lists remaining nondiscriminating definition Checks. |
| B-F05 | Repaired: §§2.215–2.216 name `CategoryTheory.Abelian.Ext`, and the former projection headings are absent. | Native Ext has the stated module-category arguments at the pin. `Module.instIsReflexiveDual` is in `Mathlib/LinearAlgebra/Dual/Defs.lean:263`; its underlying reflexivity hypothesis is retained. |
| B-F06 | Repaired: README:232 names “MordellLawrenceVenkatesh §§5.9, 5.11 and 5.12”; §4.11 uses the declared topology gap. | The current supplier has mapping classes at :1775, twists at :1809, and their homology action at :1831. Prior process slugs and removed narrative phrases are absent; no instruction-like payload was encountered. |
| B-F07(a) | Repaired: §2.176 qualifies the sign test by “whenever 6≠0”. | In ℤ, 3≠−3; in ℤ/3 and ℤ/2 they agree. |
| B-F07(b) | Repaired: the polynomial-degree check excludes the zero-ring degree conclusion. | Over the zero ring q=0 and natDegree q=0, not 2. The normal-form equivalence still has zero modules on both sides. |
| B-F07(c) | Repaired: §2.7 says “discriminant 0” for the double-line example. | γ=δ=0 gives γ²−4δ=0. The matrix composite is u² before quotient and 0 after quotient; this checks quotient exactness, not a nodal hypothesis. |
| B-F07(d) | Repaired: C2 occurrences specify arbitrary versus “finite projective” N at the relevant constructions. | N=ℚ₂ is excluded from the finite-projective comparison; finite quotients tensor ℚ₂ are 0 whereas R̂⊗ℚ₂≠0. |
| B-F07(e) | Repaired: §§2.231–2.232 and §§2.219–2.220 omit the unrelated M-clause. | Their assertions are respectively ordinary reflexivity and native Ext; no unused coefficient object appears in those contexts. |
| B-F07(f) | Repaired: retraction targets say “N is projective, hence flat”. | A direct summand of Aʳ is flat; A=ℤ,N=ℤ/2 has Tor₁(N,ℤ/2)=ℤ/2 and is excluded. |
| B-F07(g) | Repaired: §2.1 gives “−(γ²−4δ)”. | γ=1,δ=0 gives determinant det((2,1),(1,0))=−1. In characteristic 2 the same equality becomes 1=1. |
| B-F07(h) | Repaired: §2.6 specifies “B[[x,y]]”. | For γ=1,δ=0, the coefficient system determinant −1 is a unit; f=x is represented with x-coefficient 1 and y-coefficient 0. |
| B-F08 | Repaired: the old §4.2 and its tags 01Q3/01VG are absent. | Neither incorrect citation remains. Ampleness descent now cites 0GFB, whose statement is verified at stacks-spaces-cohomology line 1804. |
| B-F09 | Repaired at the reported sites: backticked native names and deduplicated Needs, including `AdicCompletion.evalₐ`. | At `Mathlib/RingTheory/AdicCompletion/Algebra.lean:132` this is the quotient evaluation algebra map. The disputed §2.79 really uses monic normal form, so that edge stays. |
| B-F10 | Repaired: C3 binds “λₙ”; §§2.78/2.80 bind coefficient map/base change; §§2.49–50 bind p. | λ₃(5)=5 mod 8; 1/3 reduces to 3 mod 8 and 1 mod 2. No unnamed K is needed in the disputed ideal argument. The removed arbitrary-N sentences do not recur at the cited sites. |

The 21 original finding IDs above have 18 repaired and 3 partly repaired statuses; B-F07 is expanded into its eight subcases. No original finding is wholly unrepaired. S01, S02 and S04 concern residual actionable portions, not matters the repair report settled as not actionable. S03, S05 and S06 are additional defects identified in this pass.

## Sampled adversarial computations

The full pass covered 375 numbered README targets. These 26 retained rows sample the computations, including all six findings; they are instances, not proofs of universal statements. “Survives” means the instances do not refute the claim. C1 means A=ℤ, γ=δ=s=t=0, R=ℤ[u,v]/(u²), J=(u,v), ε(u)=0 and ε(v)=u. No Lean execution was used.

| Statement / location | Instances and computed values on both sides | Result / change |
|---|---|---|
| §0.1 Finite-stage models of pointed curve diagrams (`README.md:274`) | C over k[ε]/ε² descends with ε²=0 to a finite presentation; base-changing that model returns the same equation, not its reduction ε=0. | Survives these instances; no change |
| §0.4 Geometric realization of the pointed moduli pseudofunctor (`README.md:336`) | (0,3): −2+3=1, automorphism=1; (0,2):0, excluded; (1,1) inversion remains, so fibre is not a set. | Survives these instances; no change |
| §1.2 Arbitrary-base tricanonical comparison (`README.md:474`) | g=2: deg ω³=6, χ(ω³)=6+1−2=5, P(2)=11; rational 3-flag component: deg ω³=3; unstable 2-flag component:0, excluded. | Survives these instances; no change |
| §1.8 The projective-frame torsor (`README.md:600`) | rank E=5: PGL dimension=25−1=24; replacing E by E⊗O(1) leaves P(E) unchanged; forgetting this twist would distinguish equal frames. | Survives these instances; no change |
| §2.1 The binary quadratic node form (`README.md:805`) | γ=1,δ=0: discriminant=1, derivative determinant=−1; in F₂: −1=1; γ=δ=0 gives discriminant0 and is excluded from nodal claims. | Survives these instances; no change |
| §2.14 Coefficient map of pointed node rings (`README.md:1052`) | Z→Z/4→F₂, s=3: c↦u′−3↦u″−1 and F↦X²−1; 3u+2v↦3u′+2v′↦u″; direct and iterated images equal. N=0 gives zero, not a test of injectivity. | S01 |
| §2.21 The ordered surjection to the section ideal (`README.md:1176`) | C1: P_J(2,3)=2u−3v; P_J(v,u)=0 while unsigned map gives2uv≠0; ker P_J=im Ψ; coker Ψ≅J. Mod2 this remains exact; augmentation homology degree0=J, positive=0. | Survives these instances; no change |
| §2.31 Evaluation of the ordered ideal presentation (`README.md:1359`) | C1: P_J(2,3)=2u−3v; P_J(v,u)=0 while unsigned map gives2uv≠0; ker P_J=im Ψ; coker Ψ≅J. Mod2 this remains exact; augmentation homology degree0=J, positive=0. | S02 |
| §2.63 The ordered surjection to the section dual (`README.md:1928`) | C1: P_D(u,v)=u incl−vε=0; P_D(v,u)(v)=v²≠0. ker P_D=im Φ, coker Φ≅D; ε∉R since u/v∉R. Mod2 presentation remains exact. | Survives these instances; no change |
| §2.75 Dual Hom coordinates with coefficients (`README.md:2155`) | C1: C_D(ev_v)=(v,−u); bidual inverse sends ev_v to v and ev_u to u; evaluating only at ε sends ev_v to u, the wrong answer. N=Z/2: u≠v; N=0: both sides0. | Survives these instances; no change |
| §2.88 Algebraic tensor comparison for a pointed node (`README.md:2384`) | Z→Z/4→F₂, s=3: c↦u′−3↦u″−1 and F↦X²−1; 3u+2v↦3u′+2v′↦u″; direct and iterated images equal. N=0 gives zero, not a test of injectivity. | Survives these instances; no change |
| §2.151 The native augmentation to the actual section ideal (`README.md:3611`) | C1: P_J(2,3)=2u−3v; P_J(v,u)=0 while unsigned map gives2uv≠0; ker P_J=im Ψ; coker Ψ≅J. Mod2 this remains exact; augmentation homology degree0=J, positive=0. | S03 |
| §2.164 The native polynomial section chain complex (`README.md:3868`) | C1: Φ(x,y)=(uy,−ux+vy), Ψ(x,y)=(vx−uy,ux); ker Φ=im Ψ, ker Ψ=im Φ; ΦΨ(1,0)=(u²,0)=0 in R, ≠0 before quotient. N=Z/2 gives the same identities and kernels. | Survives these instances; no change |
| §2.176 Residue equivalence for the actual dual quotient (`README.md:4150`) | C1 ρ(r incl+αε)=α; [(3+v)ε]↦3. I=(2,u,v): completed D/R=Z₂; I=(u,v): Z. In F₂/F₃,3=−3, so that negative control requires6≠0. | Survives these instances; no change |
| §2.214 The native polynomial section Hom cochain complex (`README.md:4943`) | C1 Hom of the two free resolutions: ker d^{n+1}/im d^n=0 for n≥0, giving Ext^{n+1}(J,R)=Ext^{n+1}(D,R)=0. Coefficients Z/2 preserve exactness; degree0 is Hom(J,R⊗N) or Hom(D,R⊗N), not generally0. | Survives these instances; no change |
| §2.222 Positive-degree exactness of the native Hom complex (`README.md:5110`) | C1: Φᵀ(x,y)=(−uy,ux+vy), Ψᵀ(x,y)=(vx+uy,−ux); ker Φᵀ=im Ψᵀ and ker Ψᵀ=im Φᵀ; both products=0; H^{n+1}=0. Mod2 the minus signs agree. | S04 |
| §2.235 Universally acyclic complete hull (`README.md:5379`) | Disk on M=R: coker d⁻¹=R, cycles Z¹=R, other cycles0, shifted dual in degrees0,1. Invertible I=(2,ω) over disc−23 ring: disk terms I versus I*, I²≠(2), so self-duality Check fails (S05). | S05 |
| §2.238 Knudsen completion theorem (`README.md:5439`) | A=R=Z_(2): completion Z₂; M=R gives SR=true before/after and Hom(R,R⊗N)=N. M=R/2 gives nonflat modules before/after, SR=false. R→0 is flat and kills the bad module, so cannot reflect. | S06 |
| §3.1 Separating clutching morphism (`README.md:5900`) | Two nonisomorphic elliptic tails on genus3 marked-middle chain: 2 node choices, 2 preimages, not1; each clutching fibre finite, unramified, not globally embedded. | Survives these instances; no change |
| §3.4 The stack of persistent nodes (`README.md:5984`) | xy=t over k[t]: Sing=Spec k, nonflat; xy=ε over k[ε]/ε²: Sing=Spec k with no section over base. Two nodes: incidence V(t₁)⊔V(t₂), boundary V(t₁t₂). (1,1) normalization=BC₂, not point. | Survives these instances; no change |
| §4.6 Nefness on pointed normalization components (`README.md:6292`) | P¹×P¹ zero+diagonal sections, m=a₁=a₂=2: discrepancy2−4=−2; pushforwards O(2) and O(0), degrees2 and0, unequal but nef. Constant rational family total weight2m−1,2m,2m+1 gives ranks0,1,2. | Survives these instances; no change |
| §4.14 One determinant line over the integer base (`README.md:6433`) | g=2,d=2: Sym² rank15,ω⁶ rank11,kernel4; d=1 kernel0 does not cut out curve. Constant positive-dimensional family determinant degree0 not ample; integral level15 retains char3 and5. | Survives these instances; no change |
| §5.1 The Hodge bundle of stable pointed curves (`README.md:6467`) | Genus0: E=0,det E=O, d(ω) grade−1,d(O) grade1; genus2:E rank2,det rank1,d(ω) grade1. Forgetting mark leaves rank2; no ψ correction. | Survives these instances; no change |
| §5.5 Global units on integral stable moduli (`README.md:6557`) | Γ integral stack=Z,units={±1}; after C base units=C×. Vertical divisor2X_F2−X_F3=div(4/3); multiplying rational section by3/4 removes it. | Survives these instances; no change |
| §6.1 Maximal variation of a curve family (`README.md:6834`) | Constant family on P¹: image dimension0<1,λ degree0,not big. Point: d=0,top degree1,big. Generically finite degree e: deg h*A=e deg A; relative Frobenius on curve e=p, not1. | Survives these instances; no change |
| §7.12 Elliptic-stack and coarse-scheme comparison (`README.md:7436`) | Elliptic smooth marked curve has group zero at mark; coarse j-space=A¹, inversion persists on stack in char2/3; no fine universal family on j-line. | Survives these instances; no change |

## Lean declaration and headline ledger

The entire 162-line file and all twelve supplied elaborated signatures were read. There are eight real definitions/abbreviations and four admitted theorems, all in `TauCetiRoadmap.StableReductionPartII`, Layer 2. All binders below are explicit; no implicit section hypothesis is needed to recover the advertised statement. The supplied signature extraction was compared with the README; I did not rerun Lean, as this review prohibits Lean execution.

| Declaration (Suggested.lean line) | Variable and instance context | Computed instances / values | Outcome |
|---|---|---|---|
| pointedNodeEquation (44) | A:Type u, CommRing A; γ,δ,s,t:A | Zero parameters give X²; γ=1,δ=s=t=0 over 𝔽₂ gives X²+XY; s=3 over ℤ/4 gives X²−1; zero ring gives 0. | Native polynomial; parameter mapping preserved. |
| pointedNodeRing (50) | Same A/parameters | Zero parameters give A[u,v]/u², with u²=0 but v² free; over A=0 the quotient is 0. | Actual quotient, not arbitrary coordinates satisfying an equation. |
| pointedSectionIdeal (54) | Same A/parameters; ideal's inherited module over the quotient | C1: J=(u,v), quotient R/J=ℤ. Over 𝔽₂, γ=1, J=(u,v) remains nonprincipal at the node; at a smooth section J is locally invertible. | Defines the ideal, not its presentation cokernel. |
| nodePhi (61) | Same A/parameters; Matrix (Fin 2) (Fin 2) R | C1: Φ=((0,u),(−u,v)); Φ(1,0)=(0,−u), Φ(0,1)=(u,v); determinant=u²=0 in R. Over ℤ[u,v] determinant=u²≠0. | Column convention and negative lower-left entry checked. |
| nodePsi (70) | Same A/parameters | C1: Ψ=((v,−u),(u,0)); Ψ(1,0)=(v,u), Ψ(0,1)=(−u,0); ΦΨ=ΨΦ=diag(u²,u²)=0 in R. | Adjugate with the correct signs. |
| IsStablyReflexive (80) | R:Type u, CommRing R; M:Type u, AddCommGroup, Module R | R=M=ℤ: M**=ℤ and Extⁿ=0 for n>0. M=ℤ/2: M*=M**=0 so evaluation has kernel ℤ/2. M=0: all four modules/maps zero. | True, false, true respectively; dual Ext is independently required. |
| IsRelativelyStablyReflexive (91) | A,R:Type u, commutative, Algebra A R; M:Type u, Module R/A, scalar tower; quantified maximal q of R | A=R=ℤ,M=ℤ: every residue fibre 𝔽_p is reflexive and flatness true. M=ℤ/2: A-flatness false. A=R=0: only zero M, flatness true, no maximal q. | True, false, true. Definition admits broader input rings; the criterion carries the Noetherian and map-flatness hypotheses. |
| HasUniversalCoefficients (101) | Same ring/module/tower context; every N:Type u with AddCommGroup and Module A; every i:ℕ | A=R=M=ℤ: both maps send 1⊗n to evaluation with value n, Ext^{i+1}=0. M=ℤ/2,N=ℤ: β:ℤ/2→Hom(0,ℤ)=0 is not bijective. N=0: both Hom spaces/tensors and Ext vanish. | Canonical maps determined by pure-tensor laws; no unconstrained equivalence substitutes for them. |
| nodeSection_universallyExact (118) | A:Type u commutative, four parameters; N:Type v arbitrary additive A-module, no flatness | C1: ker Φ={(vk+ug,uk)}=im Ψ; ker Ψ={(ug,vg+uk)}=im Φ. Transpose: ker Φᵀ={(−vk+ug,uk)}=im Ψᵀ. Tensor N=ℤ/2 gives the same coefficient equations in 𝔽₂[v]². N=0 gives im=ker=0. | Four exactness assertions retain arbitrary coefficients and quotient relation. No good-discriminant shortcut. |
| pointedSection_reflexive (134) | A:Type u commutative, four parameters | C1: incl(u)=u,incl(v)=v, ε(u)=0,ε(v)=u; evaluations at u and v distinguish the two bidual coordinates. A=0 gives the unique 0→0 isomorphism. Smooth chart gives invertible J, hence J**=J. | Native evaluation, including J*; source theorem is substantive. |
| pointedSection_universalCoefficients (145) | Same A/parameters; predicate quantifies N in common universe u | C1,N=ℤ/2: (ε⊗1)(v)=u⊗1≠0 and (v⊗1)(ε)=u⊗1. Both positive Ext families are 0 by the coefficient-exact augmented complexes. A=0 gives zero maps between zero modules. | Repairs A-F03, without losing arbitrary/nonflat coefficients. |
| relativelyStablyReflexive_iff_universalCoefficients (152) | A,R commutative Noetherian, Algebra A R, Flat A R; M finite over R, Module A/R, scalar tower, all Type u | (A,R,M)=(ℤ,ℤ,ℤ): true↔true; (ℤ,ℤ,ℤ/2): false↔false; zero ring: true↔true; field k and kʳ, r=0,1,2: evaluation rank r, all positive Ext zero. | Matches Ile at the stated finite Noetherian generality. Both directions tested; no lost binder. |

One-tactic probe: none of the four retained theorems is a definition expansion, small-value calculation, or direct application of a pinned theorem giving this actual section ideal. Generic projective/reflexive facts do not cover its nonprojective nodal stalk. No padding deletion is requested for these four.

Headline inventory: polynomial universal exactness, pointed-ideal biduality and universal coefficients, the relative stable-reflexivity criterion, the algebraic two-base completion theorem, the pointed-node formal hull, expansion–contraction/universal-curve equivalence, decorated boundary normalization/conormal lines, integral fine symplectic curve level, the integral Noether line isomorphism, stable compactification after finite base change, compactified Torelli/Hodge positivity, and degree-Picard/lifting comparisons. The four polynomial/module criterion theorems are present. The algebraic completion theorem is statable but missing (S06). The remaining geometric headlines are individually named in the module docstring with their missing carriers. `FamilyOfCurves` alone supplies neither nodality, stability, nor those moduli objects: `TauCeti/AlgebraicGeometry/Curves/Family.lean:56` extends properness, flatness, local finite presentation, and relative dimension **at most** one. The file has one `import Mathlib`, no additional imports, no `set_option`, no admitted data, no `lemma`, no free Prop stand-ins, and no conclusions hidden in hypotheses.

## Supplier, ownership and gap audit

All 21 named roadmap supplier subsections were compared with current main or supplied open-head text. The range citations were resolved by section, not inferred from names. Relevant exact witnesses include:

| Supplier | Resolved section / witness and scope check |
|---|---|
| StableReduction | Main Layers 1–3 and 8, README:576: nodal families/duality/stability, global generation and vanishing; very ampleness is separately contracted. |
| SchemeAndStackFoundations | Main §4.15, README:5895: the fixed integral level-15 ample line. §§0–5 supply the listed generic foundations; added all-base, stack and surface extensions remain explicit gaps. |
| EnhancedDerivedSheaves | Main §E1.9, README:1057: proper-supported perfect pushforward with the relative-flat input. Applied here to O of a proper flat finitely presented family. |
| AlgebraicModuliForArithmeticGeometry | §§1.1–1.7,2.1–2.2,3.1–3.5,5.1–5.4,7.2–7.3,7.6,8.1–8.3; §3.5 actually names `ModuliDescent.polarizedDescentComparison`; §7.2 names the rank locus and universal functions. The resolver's one missing-name lead is a false positive. |
| JacobianChallengePartII | §§0.1–0.4,1.1–1.4,4.4,6.1–6.3, README:131,168,257,693,1010–1038. Noetherian smooth input and integral stable Lie comparison retained. Its later curve-level consumer is not imported. |
| JacobianChallenge | Main Layers A–F, README:111,135,143,218,332,448: coherent H¹, relative cohomology, Jacobian and Abel map, not étale H¹. |
| AlgebraicVectorBundles | Main L0A–C, README:215–268: finite locally free sheaf operations and ordinary determinant; no integer-graded complex determinant is inferred. |
| PadicMeasuresIwasawaAlgebras | Main §5.1, README:3172: arbitrary-ring finite-projective determinant with locally constant parity. Rank-one swap gives −1; integer refinement remains a gap. |
| StablePeriodicCurved | Main Layer 2, README:223–244; pinned `TauCeti/Algebra/Homology/TotallyAcyclic.lean:87,149`: finite terms, projectivity, ordinary and dual acyclicity. Relative A-universality is new here. |
| NeronModelsAndSemistableAbelianVarieties | §§4.1/4.13, README:1923/2589: geometric nodal normalization sequence and integral Noetherian stable Pic⁰. Arbitrary-base extension is contracted, not claimed already supplied. |
| AbelianSchemesAndArithmeticModuli | §§A3.5–A3.8,A6.18, README:1492,1640,3236: Cartier-dual torsion and automorphism rigidity on the entire finite kernel scheme. |
| AbelianSchemesAndArithmeticModuliPartII | Supplied open head §B4.1, README:1983: characteristic-zero fine curve level and Torelli; comparison prevents duplicate ownership. |
| K3SurfacesAndSymplecticBoundedness | Supplied open head §6.0b, README:851: full canonical formula, torsion and wild coefficients; no χ≥0 conclusion silently imported. |
| MordellLawrenceVenkatesh | §§5.9,5.11,5.12, README:1775,1809,1831: orientation-fixed twists and x↦x+⟨x,b⟩b. |
| PELModuli | §§M5.1–M5.3,M6.9–M6.10, README:3499,3570,4007,4039: full-level polarized families, Hodge line, classifying interface. Genus-one pairing comparison is explicit. |
| ShimuraCompactifications | §§C4.1–C4.10,C5.13–C5.18; README:1784,2003,2572,2609. Ample line is on the minimal model; the package does not infer ampleness on the toroidal model. Wider residue-characteristic range is a gap. |
| ComplexComparisonPartII | §§C3.2d.1–C3.2d.4, README:1952,2006: actual Picard stack/sheaf/Brauer sequence; boundary topology extension explicitly contracted. |
| ModularCurvesPartII | §§2.1–2.3,2.11, README:550,611,771: polygon actions and polygon-count stack. At m=1 inertia is constant C₂, including characteristic 2. |
| ModularCurves | Main §§1C–1D,2D,4A–4C,9D–9E; see B-F01 audit for current locators. |
| DeformationAndDerivedPatchingAlgebra | §3.3, README:609–616: finite module over the local Noetherian target, arbitrary flat coefficient target in the fibre injection criterion. |
| AlgebraicCurves | Main Layers 0–12: curve/divisor/Riemann–Roch/function-field interfaces. The package does not rebuild the dictionary. |

Object searches used `roadmaps grep` across main and open heads, plus board-package searches, for section ideals, relative stable reflexivity, complete resolutions, Deligne pairings/determinants, boundary normalization, stable compactification, fine curve levels and Hodge comparisons. Hits for generic absolute complete resolutions belong to StablePeriodicCurved/the pin; characteristic-zero fine levels belong to AbelianSchemesAndArithmeticModuliPartII; determinant foundations belong to the cited owners. The specific relative universal-coefficient pointed-node construction is this package's extension. Searches for the new full Lean names found no competing declarations in the available sibling files. No duplicate fully qualified name was found. No ownership claim is made about unprovided private/unindexed work.

There are exactly 28 gap entries in `design/plan.json`, and exactly the same 28 slugs under README's supplier contracts. No supplier is `none`; every contract names its section. The Deligne-pairing sentence differs only by Markdown code delimiters. These are conditional inputs, not assertions that the suppliers have implemented them. Sample scope tests: N=3 permits characteristic 2 although Sp₂(𝔽₃) has order 24; integer grades 0 and 2 have the same parity; Deligne symmetry on P¹ is −1 for O(1) and +1 for O(2); a collision with m=2 and three weights 2 has discrepancy −4 and pushforward I_p⁴. The latter comparison is a positivity contract, not equality of pushforwards.

No vague/unowned gap or undisclosed supplier extension was established in this pass. Several contracts package compatibility laws with a single construction; those laws specify the needed interface rather than unrelated tasks. The gap list is an acceptance condition, not 28 new defects.

Mechanical dependency output (read-only invocation specified in the brief):

```text
depcheck: 186 roadmaps, 1227 edges, 0 problem(s)
```

There was no UPWARD or CYCLE line. This checks inter-roadmap direction; it does not detect the implicit internal construction-order defect S03. The read-only diff against origin/main contains changes only under `packages/StableReductionPartII/`.

## Source locator audit

The manifest has 53 works: 51 cached legal texts and two settled uncertified books. Existing keys were reused; no missing-source request or new source key was created. The following 60 locator checks give the independently readable supporting passage and the scope actually checked. A locator check verifies that passage against its use; it is not an endorsement of every argument in the paper.

| No. | Locator and cached source witness | Scope/result |
|---|---|---|
| 1 | dm, Theorem 1.2; dm line 105 | Tricanonical very ampleness and vanishing, g≥2. |
| 2 | dm, Lemma 1.3; dm line 187 | Ext² obstruction vanishing for the stated one-dimensional generically smooth lci object. |
| 3 | dm, Proposition 1.5; dm line 272 | Independent node deformations/formal smoothness. |
| 4 | dm, Theorem 1.11; dm line 368 | Finite unramified Isom; proof first handles universal source-dense situation. |
| 5 | dm, Proposition 5.1; dm line 1144 | Algebraic stable stack via projective frames; projective, not vector, frames. |
| 6 | dm, Theorem 5.2; dm line 1148 | Proper smooth stack, relative normal-crossings boundary. |
| 7 | dm, Theorem 5.13; dm line 1260 | Component count for the stated tame normalization; no invertibility of the entire symplectic deck order inferred. |
| 8 | knudsen2012, §3 Key Example; knudsen2012 line 390 | Matrix factorization and monic division; arbitrary-ring extension in the package is a deduction, not removal of a source hypothesis. |
| 9 | knudsen2012, Proposition 3.1; knudsen2012 line 501 | Actual ideal/dual/residue, with the colon typo recorded below. |
| 10 | knudsen2012, Corollary 3.2; knudsen2012 line 509 | Completed ideal/dual/residue result; the package separately states the relative two-base transfer. |
| 11 | ile, Definition 3.1; ile line 268 | Biduality plus both Ext vanishings. |
| 12 | ile, Definition 3.4; ile line 286 | Relative flatness and fibrewise condition. |
| 13 | ile, Proposition 3.5; ile lines 292–339 | Arbitrary coefficient base change and the canonical maps. |
| 14 | ile, Remark 3.6; ile lines 340–365 | Converse universal-coefficient criterion with finite Noetherian input. |
| 15 | knudsen2, Appendix Definition 1; knudsen2 lines 970–1000 | Relative reflexivity, retaining its flatness conditions. |
| 16 | knudsen2, Appendix Theorem 2; knudsen2 line 977 | Complete hull, correct cokernel degree. |
| 17 | knudsen2, Appendix Propositions 4–7; knudsen2 lines 1054–1075 | Base change and two-base completion, rather than unrestricted tensor/limit interchange. |
| 18 | knudsen2, Theorem 2.7; knudsen2 line 596 | Full stable pointed range and integral relative normal crossings. |
| 19 | knudsen2, Corollary 3.9; knudsen2 line 937 | Finite unramified clutching; closed-immersion assertion has the defect below. |
| 20 | knudsen3, §4 definitions; knudsen3 lines 30–70 | Actual line descent/cocycle and cotangent lines. |
| 21 | knudsen3, Theorem 4.2; knudsen3 line 116 | Normalization exact sequence and Hodge clutching, not an identification of coarse spaces. |
| 22 | milne, Theorem 12.1; milne line 1713 | Torelli includes both signs and the hyperelliptic distinction. |
| 23 | clm, Proposition 6.3; clm lines 900–989 | Positivity route; blowdown canonical equality in its proof is incorrect as printed. |
| 24 | clm, Corollary 6.6; clm line 1004 | Source's R¹ vanishing is too broad; package uses the generically nonzero evaluation image. |
| 25 | clm, Proposition 6.7; clm lines 1010–1045 | Weighted collision comparison needs discrepancies; explicit gap in package retains them. |
| 26 | yuan-author-http, §3.1.1–3.1.2; yuan-author-http lines 1365–1440 | Hodge determinant versus vector bundle; Noether boundary correction and thickness. |
| 27 | yuan-author-http, Lemma 3.4; yuan-author-http lines 1440–1480 | Lie–R¹O and Hodge line, with the integral stable-family scope. |
| 28 | yuan-author-http, §3.1.4; yuan-author-http lines 1493–1539 | Finite projective cover; graph closure is needed instead of the source's image closure. |
| 29 | mc4-ehkv, Theorem 2.7; mc4-ehkv line 191 | Finite scheme cover for finite-type stack with quasi-finite diagonal over Noetherian base. |
| 30 | mc4-serre, Appendix; mc4-serre lines 564–619 | Congruence acts on the kernel scheme, not just geometric points; n≥3 retained. |
| 31 | mc4-chen-zhang, Theorem 1.3; mc4-chen-zhang line 56 | Positive-characteristic surface Kodaira subadditivity. |
| 32 | mc4-chen-zhang, Proposition 4.7; mc4-chen-zhang line 521 | Both genera≥2 give general type. |
| 33 | mc3-edidin-fulghesu, Proposition 3.7; mc3-edidin-fulghesu line 337 | Integral graph stratum smoothness; coefficient ring distinguishes char 0 and char p. |
| 34 | mc3-edidin-fulghesu, Theorem 4.7; mc3-edidin-fulghesu line 534 | Quotient by graph automorphisms gives normalization. |
| 35 | hacking-boundary-review, Lemma 4.2; hacking-boundary-review line 412 | Conormal is the product of cotangent lines. Its characteristic-zero setting is not silently promoted to an integral theorem. |
| 36 | mc5-erikssonfreixas2024, Proposition 4.14; mc5-erikssonfreixas2024 line 1778 | Proper flat finite-presentation perfect pushforward, arbitrary base change. |
| 37 | mc5-erikssonfreixas2024, Proposition 4.15; mc5-erikssonfreixas2024 line 1788 | Uniform Tor-amplitude control for the stated curve-type morphisms. |
| 38 | mc5-erikssonfreixas2024, (6.3); mc5-erikssonfreixas2024 line 2874 | Four determinant factors and alternating exponents. |
| 39 | mc5-erikssonfreixas2024, Proposition 6.1; mc5-erikssonfreixas2024 line 2888 | Symmetry (−1)^deg, scalar law, norm and divisor restriction. |
| 40 | mc5-erikssonfreixas2024, Remark 6.2; mc5-erikssonfreixas2024 line 2917 | Relative divisor need not surject onto all components; extend by the trivial line off its support. |
| 41 | mc5-luo1998, presentation theorem; mc5-luo1998 line 75 | Generation by Dehn twists suffices for the torsion-character argument. |
| 42 | mc5-hall2011, Theorem 1; mc5-hall2011 line 22 | Proper source and locally finite-type DM target with separated quasi-compact diagonal. |
| 43 | mc5-hall2011, Theorem A.1/Corollary A.2; mc5-hall2011 line 775 | Coherent GAGA and algebraization of proper finite analytic covers. |
| 44 | mc5-fredianineumann2004, Theorem 1.5; mc5-fredianineumann2004 line 350 | Profinite analytic/étale comparison over the specified characteristic-zero base. |
| 45 | mc5-fredianineumann2004, Proposition 2.14; mc5-fredianineumann2004 line 764 | Realization of the Teichmüller quotient groupoid; proper-boundary comparison remains a gap. |
| 46 | stacks-hom-flat, 087Q/087R; stacks-hom-flat lines 7817,7837 | Finite presentation plus flat extension; no Hom/inverse-limit assertion. |
| 47 | stacks-completion, 00MC; stacks-completion line 10716 | Maximal-ideal completion faithfully flat. |
| 48 | stacks-completion, 00MK; stacks-completion line 10986 | Local Tor criterion with finite module over Noetherian target. |
| 49 | stacks-completion, 0523; stacks-completion line 11107 | Flatness from all thickenings near the closed fibre, not a claim at unrelated points. |
| 50 | mc0-stacks-curves, 0C59/0GKA/0CBY; mc0-stacks-curves lines 2165,2322,2346 | Nodal criterion, arbitrary-base H⁰/H¹, and étale-local node equation. |
| 51 | mc0-stacks-perfect, 0B91/0E0L; mc0-stacks-perfect lines 3421,3679 | Proper flat perfect pushforward and universal functions. |
| 52 | mc0-stacks-duality, 0E30; mc0-stacks-duality line 3547 | Transitivity with the flat finite-presentation hypotheses. |
| 53 | mc1-etale, 0CBR; mc1-etale line 1235 | Normalization of a normal-crossings divisor and its branch conormal. |
| 54 | mc2-stacks-unramified-diagonal, 02GE; mc2-stacks-unramified-diagonal line 3438 | Diagonal open for an unramified morphism. |
| 55 | stacks-moduli-stacks, 0DME; stacks-moduli-stacks line 578 | Picard gerbe over the relative Picard sheaf under universal-functions hypothesis. |
| 56 | stacks-spaces-cohomology, 0GFB; stacks-spaces-cohomology line 1804 | Finite-surjective detection of ampleness on proper algebraic spaces. |
| 57 | stacks-projective-bundles-review, 27.21.1; stacks-projective-bundles-review line 2137 | Quotient-projective convention; line quotients, not line subspaces. |
| 58 | stacks-projective-picard-review, 31.29.5; stacks-projective-picard-review line 3204 | Picard of positive-dimensional projective space; missing n≥1 in the source recorded below. |
| 59 | dgh, §6.1; dgh line 1137 | Characteristic-zero fine level, Cartesian Jacobian family and finite-to-one Torelli, not injectivity. |
| 60 | ll-moduli-consumer-LwkQQl, Notation 1.10.1–3; ll-moduli-consumer-LwkQQl line 432 | Dominant étale versality, marked stable range, and analytic stack fundamental group. |

Additional source checks include mc0-stacks-moduli lines 65,125,418,692,865 (dimension≤1 carrier versus actual curve conditions); mc0-stacks-descent line 974 (fpqc relative ampleness); mc1-perf lines 2745,2805,2937–3014 (relative perfection and rank loci); mc1-def lines 1189,1228,1244,1265 (local-global deformation); mc1-stackdim lines 452,473,508,534 (atlas dimensions); mc1-stackval lines 1328–1410 (source-dense valuative hypotheses); mc3-stacks-norm lines 4602–4661 (normalization is integral, with finiteness supplied separately); mc6-stacksregular lines 414,427,514 (finiteness of components and regular⇒normal); mc4-stacks lines 2058,2744,2788 (Noetherian Serre vanishing/ampleness); mc5-edidingraham1999 line 512 (equivariant GRR); mc3-polishchuk lines 88–115 (formal boundary constructions and characteristic-zero restriction of Theorem 1.2); chen-moduli-consumer-LwkQQl line 84 (smooth marked stack versus coarse space). These are not included in the conservative 60-row count.

The source-error controls are concrete: for Corollary 3.9(b), attach two elliptic tails to a rational component carrying one mark; cutting either node gives the same separating type (g₁,g₂,H,K)=(1,1,∅,{1}), so the fibre over this fixed marked genus-two curve has two points. For the blowup calculation, K_{S′/B}=b*K_{S/B}+E and E²=−1. On a rational tail, ω^m(−D) has degree −m−1 when D meets that tail, giving nonzero H¹. For the image-closure claim, a constant family over a positive-dimensional base maps to a single moduli point; its image closure cannot compactify the base. For mc1-perf 75.25.4(2), take the ground S=Spec k, Y=Spec k[ε]/ε² and X=Spec k: O_X is S-flat, but its pushforward k has infinite projective dimension over k[ε]/ε². For projective dimension zero, Pic(P⁰_k)=0, whereas ℤ≠0.

## Verified sound

- Read all 7,627 README lines and all 162 Lean lines: **375 numbered targets, 12 Lean declarations, 573 Check bullets**. The shortened report retains 26 sampled target rows and all 12 Lean declaration rows. At least 72 distinct README Check instances were independently recalculated; repeated applications of the same fixture are recorded by target, rather than represented as 573 different proofs.
- **21 earlier finding IDs** audited: 18 repaired, three partly repaired. B-F07's eight subcases are individually recorded. Settled disputes were examined and not re-raised.
- **60 source-locator groups** verified in the numbered source table, with additional source checks separately identified. **21 supplier contract subsections** checked against current texts, including the repaired open-head K3 and fine-level citations. **28/28 gap slugs** match the plan and README, with named suppliers and sections.
- Computations retain zero rings, nilpotents, repeated roots, nonflat coefficients, n=0 quotient, p=2/3 signs, rank 0/1/2, small pointed genera, multiple nodes of one type, nontrivial base-line twists, and finite versus arbitrary coefficient modules. In particular, R̂⊗ℚ₂≠0 while every finite quotient tensored with ℚ₂ is 0; the roadmap correctly restricts the relevant limit comparison.
- Native type/signature comparison found **zero lost binders** in the supplied elaboration. Four substantial admitted theorems, eight real definitions, one import, zero admitted data, zero `set_option`, zero Lean padding findings. S06 is an omitted headline, not a request for an API catalogue.
- The inter-roadmap dependency check has **zero problems**. No change outside the package was shown by the PR diff. No builds, git writes, network posts or source-file edits were performed during this review; only the report and scratch notes were written.

## Not verifiable

- `blr-relative-picard-LwkQQl` remains settled **uncertified**: §8.1, §8.4 Theorem 1 and §§9.3–9.4 are cited by their locators, without access to the book's text. No renewed request was made.
- `mc6-fc1990` remains settled **uncertified**: IV.5 and V.2/V.6 compactification locators cannot be certified from a readable supplied text. The package's explicit wider-characteristic supplier gap remains conditional.
- Several mathematical formulas in the scans of `mc4-ekedahl`, `mumford1977`, `knudsen3`, and `mc5-deligne1987` are incompletely extracted. I did not treat broken OCR as a source error. In particular the sign missing from Deligne §6.2's extraction is independently verified in mc5-erikssonfreixas2024 Proposition 6.1; Ekedahl's exact exceptional-case formula is not newly certified from this extraction.
- The source table records the independent locator verification performed here; the manifest's other cached locator entries are not all independently certified by that table. The 51 “certified” manifest statuses mean legal source retrieval, not a claim that this reviewer re-proved every source theorem. No finding relies on an unseen source passage.
- Elaboration was not rerun: the brief forbids it and supplies all twelve elaborated signatures. The type audit uses those signatures plus the pinned definitions, and makes no new build claim.
- The 28 announced supplier extensions remain contracts, not completed library results. Their implementation and the ultimate formal proofs of the roadmap's universal theorems cannot be certified by this package review.

## Source issues

- **Misprint** in knudsen2012 at Proposition 3.1, printed p.12, knudsen2012 line 503: the source says the inverse fractional ideal is written with J and R reversed; it should be (R:J), the elements multiplying J into R; affects a stated result.
- **Error** in knudsen2 at Corollary 3.9(b), printed p.190, knudsen2 line 939: the source says separating clutching is a closed immersion when genera differ or markings exist; it should retain the chosen node and use finite unramified clutching, since one curve can have two qualifying nodes; affects a stated result.
- **Error** in clm at Proposition 6.3 proof, printed p.25, clm line 986: the source says the relative canonical bundle pulls back unchanged under a point blowup; it should include the positive exceptional divisor, then use its pushforward comparison; affects the proof.
- **Error** in clm at Corollary 6.6 proof, printed p.25, clm line 1004: the source says the negatively section-twisted pluricanonical sheaf has vanishing R¹ for the general nodal fibration; it should use generic evaluation and its invertible image, since unstable rational tails give nonzero H¹; affects the proof.
- **Gap** in clm at Proposition 6.7 proof, printed pp.25–26, clm lines 1016–1018: the source says resolving section intersections preserves the earlier pushforward comparison; it should track discrepancy m−Σa_i and negative-discrepancy ideal powers before transferring nefness; affects the proof.
- **Error** in yuan-author-http at §3.1.4, printed p.45, yuan-author-http line 1538: the source says take the closure of the covering base inside the finite moduli cover; it should take the graph closure in a compactification of that base times the moduli cover; affects the proof.
- **Error** in stacks-projective-picard-review at Lemma 31.29.5, printed pp.70–71, stacks-projective-picard-review line 3204: the source says Pic(Pⁿ_R)=ℤ for a UFD without a dimension restriction; it should assume n≥1, since P⁰_R=Spec R has Picard group zero; affects nothing.
- **Misprint** in mc1-perf at Lemma 75.25.4(2), printed p.62, mc1-perf line 2811: the source says G is flat over the ground scheme S; it should require flatness over the target Y; affects nothing.
- **Misprint** in ll-moduli-consumer-LwkQQl at Notation 1.10.2, printed p.11, ll-moduli-consumer-LwkQQl line 457: the source says the induced adjoint representation is ρ∘Ad; it should be Ad∘ρ with the usual composition convention; affects nothing.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "295c94fea94d6b6d4fa9ad030cdac1c466952a09", "job": "RT-StableReductionPartII~2a", "model": "gpt-6-astra", "worker": "chris-3"} -->
