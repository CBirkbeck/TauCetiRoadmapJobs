<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13006#issuecomment-6781459222 -->
Review (codex) of 6d3102e

Verdict: needs_changes

1. **F01** (P1) Global dimension is still substituted for a varying rank

   **Location:** `packages/VirtualFundamentalClasses/README.md:2513`: “rk E = χ(C_t, F_t^*T_X) = δ + dim X · (1 − g)”. The setting at lines 2378–2379 allows a smooth quasi-projective scheme X, without pure dimension. The formula also occurs in the summary and line 2518.

   **Claim:** Fixing g and δ makes the displayed expression with global dim X the rank and virtual dimension of every such map space.

   **Witness:** Take X=Spec k ⊔ ℙ¹, C=ℙ¹, base=Spec k, and M=Spec k mapping constantly into X's point component. Then E=0, g=δ=0, so χ=0, while δ+dim X·(1−g)=1.

   **Repair:** Keep arbitrary smooth targets. Decompose by the open-and-closed loci X_d on which T_X has rank d, and the corresponding map-space loci (the curve fibres are geometrically connected). On the locus with target rank d, state rk E=δ+d(1−g) and vd=b+δ+d(1−g); use d in the stable-curve formula too. In the pure-dimensional specialization d=dim X, retain the familiar formula. Update the summary and add the witness as a negative-control Check. The corrected result on the point component is 0+0·1=0; on the constant-map ℙ¹ component it is 0+1·1=1, as RΓ(ℙ¹,O) has rank 1.

   The same audit reaches `README.md:1965–1969`: the canonical lci theory has only locally constant rank in Layer 9, so “M has pure dimension vd” must be stated on its constant-rank loci. For M=Spec k ⊔ ℙ¹ with its canonical smooth theory, local dimensions and ranks are (0,1); M is not pure-dimensional. Componentwise dimensions m+r give precisely (0,1). This is the same defect, not a separate finding.

   The supplier already requires the correct rank parameter: `TauCetiRoadmap/SchemeAndStackFoundations/README.md:4919` states curve degree/Riemann–Roch for a finite locally free sheaf of rank r. behrend1997 lines 129 and 157–161 work with a smooth projective variety; they do not justify replacing a component rank by the maximum dimension of a disconnected scheme.

2. **F02** (P2) The obstruction criterion needs its specified comparison map

   **Location:** `packages/VirtualFundamentalClasses/README.md:1987–1989`: “extensions form a torsor under” and “Ext(g, T̄) is isomorphic to the sheaf”. Neither condition specifies that the comparison is the one induced by φ.

   **Claim:** The existence of these torsor structures or abstract sheaf isomorphisms characterizes the given morphism φ as an obstruction theory.

   **Witness:** On M=𝔸¹_k, take E=Ω_M[0] and φ=0. All affine square-zero lifts exist; both sheaves in (4) are isomorphic to J. Yet h⁰(φ)=0:O→O is not an isomorphism.

   **Repair:** Define the comparison from the extension sheaf to the sheaf of null-isomorphisms by the canonical correspondence of §9.1 followed by φ^∨. Condition (4) must say that **this map** is an isomorphism. In (3), specify the comparison on differences induced by precomposition with Lg^*φ: Hom(g^*Ω,J)→Ext⁰(Lg^*E,J), and require that it identify the deformation torsors; an unrelated torsor structure is insufficient. Carry these specified maps through the local comparison proof and the headline description. Add φ=0 on the smooth affine line as a negative Check alongside φ=id.

   To verify the witness for every affine test, write g as a coordinate a∈A. Surjectivity Ā→A gives a lift ā, and all lifts are ā+J. Ext¹(g^*E,J)=H¹(T,J)=0. The zero composite to B𝔾_a has automorphism sheaf Hom(O,J)=J. Thus the existential wording of (3) and (4) admits the wrong morphism. On T=Spec k with J=k the **specified** comparison on differences is the zero map k→k, sending 0 and 1 to 0, so the repair excludes it. For φ=id the comparison is id_k and the repaired criterion holds.

   This is the comparison used in the source proof: behrend-fantechi1997 lines 1110–1114 constructs the canonical map, and lines 1175–1181 use the induced Hom comparison to recover h⁰(φ). The roadmap should expose that requirement rather than leave “is isomorphic” existential.

3. **F03** (P3) The scheme-comparison locator is a localisation lemma

   **Location:** `packages/VirtualFundamentalClasses/README.md:760–761`: “stacks-chow Lemma 19.3, tag 02RX, line 1395”. Also `packages/VirtualFundamentalClasses/sources.toml`, the stacks-chow entry.

   **Claim:** This locator supplies the cycle/rational-equivalence/Chow definitions being compared with the scheme carriers in §2.4.

   **Witness:** stacks-chow line 1395, Lemma 19.3, p.31, gives the localisation exact sequence. The relevant definitions are 8.1 (02QR), p.17, line 752, and 19.1 (02RW), p.30, line 1356.

   **Repair:** Cite Definitions 8.1 and 19.1 for §2.4, together with the existing Tau Ceti definitions. Add these locators and the comparison use under the existing stacks-chow manifest key and in References. Keep Lemma 19.3 for §3.4, where it is correct. For Spec k, Definition 8.1 gives Z₀=ℤ, Definition 19.1 gives R₀=0 and CH₀=ℤ, exactly matching the pinned quotient. No statement of Lemma 19.3 itself needs correction.

Three findings: one P1, one P2 and one P3; two blocking. The ten preceding findings have been repaired in their original locations. A further disconnected-dimension defect, an unspecified comparison in the obstruction criterion, and a sampled locator still require fixes. The prescribed Lean elaboration succeeds without diagnostics, and the dependency check reports zero problems. Neither is a proof of the README's mathematics. The four author files were not changed.

## Previous findings and their repairs

This audit preceded the new adversarial pass. Locations and quotations in this table are from `packages/VirtualFundamentalClasses/README.md` unless stated otherwise.

| Round-2 finding | Status; repaired passage | Verification |
|---|---|---|
| R01, smooth contraction | **Repaired**, §7.1: “is … isomorphic … to a vector bundle with its scalar multiplication”. §7.2 now requires an “E-cone … and an … isomorphism [C/E]”. | The new affine graded argument is valid: after choosing degree-one lifts, reduction modulo S′₊ makes the presentation an isomorphism; flatness gives K/S′₊K=0; induction in nonnegative degrees gives K=0. Weight-two affine space and the weight-two classifying stack fail the new hypotheses. |
| R02, resolving lower sheaves | **Repaired**, §7.3: “Route: truncate first.” | The finite free resolution is now of the bounded coherent truncation. Both O[2] and (j_!O)[2], with j_! denoting extension by zero, truncate to 0. The latter still has a non-quasi-coherent lower sheaf, which is no longer resolved. |
| R03, derived dual | **Repaired**, §9.3: “τ_[0,1]((J[1])^∨) = H⁰(J^∨)[−1]”. | For J=k[t]/t the discarded H² is O/t; the new local cokernel computes Ext¹ because F⁰ is free on the affine chart. This fixes the previous erroneous identification. New R02 concerns which comparison is required to be an isomorphism, not that identification. |
| R04, nonexistent names | **Repaired**, contracts: “Chow.ChowGroup.equivIntOfUnique”, “Chow.ChowGroup.pushforward”, “Scheme.CartierDivisor”. | Opened the pinned namespaces and bodies. The three old supplier Check names have become prose references; their examples remain at SchemeAndStackFoundations §§1.22, 5.5, 5.6. The additional AlgebraicGeometry qualification is correct. |
| R05, obstruction rank | **Repaired**, §10.4: “Σ_d c_{s_d}(Ob\|_{M_d}) ∩ [M_d]”. | On pt ⊔ ℙ¹ the result is (1,−1), with obstruction ranks (0,1). Suggested.lean item 7 now describes this componentwise formula. The same varying-dimension pattern elsewhere gives new R01. |
| R06, global resolutions | **Repaired**, Layer 10: “every statement … about the virtual class … assumes … a global resolution”; §10.6: “a global resolution F^• of E pulls back”. | For v=id a supplied F returns F; no resolution is manufactured. The standing assumption covers §§10.4 and 10.8 and the docstring agrees. |
| R07, homotopy locator | **Repaired**, §5.1: “Lemma 36.3, tag 02TY, p. 72”. | stacks-chow line 3445 assumes a finite locally free sheaf of rank r and supplies the shift by r. The manifest records the corrected locator. At r=2, 1 maps to [𝔸²]. |
| R08, pullbacks | **Repaired**, Convention 7: “Lu^* is the derived pullback … u^* the pullback of sheaves”. | The dual-numbers sequence has terms k→0→k→k→0→0→0, with the middle nonzero map the identity. It no longer inserts the complex having k in every negative cohomological degree. The distinction is carried into §§9–11. |
| R09, source attribution | **Repaired**, §8.3: “uses the transitivity triangle of the full cotangent complexes”. | behrend-fantechi1997 lines 899–901 and 1045–1047 use the full object. The three-axes example still detects the invalid replacement by truncations. No source error is attributed to that full triangle. |
| R10, elliptic site ownership | **Repaired**, Scope: “on these two stacks is E1's site with the same module categories”. | The supplier contract and §7.3 name EllipticCohomology Layer 1 E1. Its main-branch README lines 207–216 owns exactly this specialization. Identity and inversion remain distinct arrows on the j=1728 chart. |

The earlier ownership finding concerning the two open virtual-class cores remains settled as not actionable in this package: choosing their scopes requires the human ownership decision already recorded. Its reason is still applicable. It is not re-raised or included in the count.

## Verified sound

All four package files, all 53 numbered targets in 11 layers, the preceding review and repair report, the board-package index, and the citation/overlap leads were read. The 15 seeded source targets were checked against the cached texts. Each changed construction and its later use was reconsidered; the computed table below includes new controls and the sampled/headline statements. Prior computed rows were used only for unchanged instances, not as certification of an entire section. In particular, the old successful rank checks did not cover the disconnected target of R01.

The README has the required Summary, Scope, Conventions, supplier contracts, build guide, layers, Examples, Dependencies, consumers and references. Definition-bearing targets retain prose APIs and at least three Check bullets; theorem-only §11.5 has two, which is not a missing definition Check. The shape was compared with main-branch SchemeAndStackFoundations, AlgebraicVectorBundles and DerivedModuleAlgebra. No new own Lean identifiers are promised in backticks. Mathematical expressions in code spans are not declaration claims.

No good-prime restriction, computational algorithm, sorry'd data, set_option, forbidden supplier, copied source passage, process residue, or source-order instruction was found. The layer dependencies force the main mathematical order: cycle theory, Gysin and bundle operations, cone stacks, intrinsic geometry, obstruction theories, virtual classes and curve maps. §4.4 distinguishes construction from its later Gysin consequence, so its return edge does not require the consequence to construct itself. No author/source-manifest entry was rewritten. Metadata remains topic math.AG; no supplier gaps are declared.

### Computed adversarial table

Unless specified otherwise, k=ℚ. Values describe the actual computations, not proofs of all future targets. “Retain” means no change on these instances. The failed models are included to show discrimination.

| Statement | Instances and values on both sides | Result / change |
|---|---|---|
| Conventions; §1.1 proper covers | B(S₃): diagonal fibre has 6 points and pt→B(S₃) has degree 6. Bℤ has infinitely many. Base change of id_pt along B(C₂) has automorphism group C₂, versus trivial group for a scheme. | Retain finite/quasi-separated and representable-by-schemes distinctions. |
| §1.2 integral substacks | [V(x²)/μ₂] has generic length 2, its reduction Bμ₂ length 1. The ideals (x) and (x−1) transform to (x) and (x+1). Empty support contributes 0. | Retain scheme-theoretic descent and reduction. |
| §§1.3–1.4 dimension and stabilisers | dim B(S₃)=0, e=6; dim B𝔾_m=−1. For the sign affine line, k(𝓜)=k(x²), e_generic=1 and e_origin=2. For [Spec ℂ/C₄] over ℝ, invariants=ℝ and e=2, not 4. | Retain dimensions, invariant field and kernel stabiliser. |
| §1.5 degrees | pt→B(S₃)→pt gives 6·(1/6)=1; 𝔸¹→pt gives degree 0. In characteristic p the fixed divisor of y↦y+x gives inseparable degree p and inertia p: p/p=1. At p=2 and 3 the result is still 1. | Retain stabiliser quotient and inseparable factor. |
| §2.1 cycles | Z₀(BG)=ℤ; [V(x²)/μ₂]=2[Bμ₂]; Z_i(∅)=0. Atlas pullback of [BG] has coefficient 1, not the covering degree. | Retain multiplicity and descent. |
| §2.2 orders | ord₀(x²)=2, whereas ord₀(y)=1 on the coarse line. On BG, W₋₁=k×, Z₋₁=0 and ∂(2)=0 although 2≠1. div(t) on ℙ¹ has degree 1−1=0. | Retain; no zero-function or wrong-coheight junk value is used. |
| §§2.3–2.4 Chow/comparison | Sign affine line: Z₀/R₀ has stacky generator modulo 2, hence ℤ/2 and rationalization 0. pt gives ℤ/0=ℤ; 𝔸¹ has A₀=0, A₁=ℤ. Doubled origin has relation [0₁]+[0₂]=0 and A₀=ℤ. | Mathematics retained; locator R03. |
| §§3.1–3.2 pull/push | For pt→BG, flat pullback coefficient 1, proper representable pushforward coefficient card(G); for G=S₃ composite=6. Coarse sign fibre has length 2, so pullback [0]=2[Bμ₂]. | Retain degree/multiplicity distinction. |
| §§3.3–3.4 rational push/push–pull | BG→pt gives 1/card(G); 2[Bμ₂] pushes to [0]. Self-base-change of pt→BG is G, with push–pull value card(G) on each side. Localisation ℤ→ℤ/2→0 is surjective but has kernel 2ℤ. | Retain rational domain and noninjective localisation. |
| §3.5 exterior products | Quadratic separable K: K⊗K=K×K and degree 4=2+2. Purely inseparable degree p: tensor length p and degree p²=p·p. Point unit gives coefficient 1; empty factor gives 0. | Retain. |
| §§4.1–4.2 cones/normal bundles | C(0)=base, C(k)=𝔸¹. C(O(1))=Tot(O(−1)), zero-section degree −1. For (x,y)²⊂k[x,y], normal cone dimension 2 but the normal-sheaf fibre is 𝔸³. Diagonal of BG has rank-zero normal bundle. | Retain dual convention and regularity distinction. |
| §4.3 refined Gysin | Pulling origin→𝔸¹ against z↦z² gives length 2 and 2[pt]. For pt→BG tested against pt, the fibre G gives card(G) points, not one. Rank-zero identity gives coefficient 1. | Retain. |
| §4.4 canonical equivalence | X=Y or Y′=Y: boundary [C]−[C]=0 and construction β=0. Y=𝔸², X=0, Y′=(y=0): boundary [ν=0]−[η=0], so β=cν/η; x-translation fixes it, y-translation gives cν/(η+b)≠cν/η. Nonreduced ambient thickening gives multiplicity 2 versus normalization's 1. | Retain reducedness and restricted tangent invariance. |
| §4.5 bivariant action | Cover pt→BG has degree card(G), so normalization is 1/card(G). Orientation of pt→BG takes [BG] to [pt], coefficient 1; zero-section Gysin takes [E] to [M]. | Retain nonzero denominator and specified action. |
| §§5.1–5.2 bundle operations | Rank 0: identity. Rank 2 over pt: A₀(pt)=ℤ→A₂(𝔸²)=ℤ sends 1 to [𝔸²]. c₀(0)=1, c(Oⁿ)=1; L⊕L∨ gives c₁=a−a=0 and c₂=−a² (degree −1 for L=O(1) on ℙ²). | Retain corrected locator and signs. |
| §5.3 products | On sign ℙ¹, [Bμ₂]² lies in A₋₁=0; multiplying by [𝓜] returns [Bμ₂], degree 1/2. On ℙ¹, [pt]²=0 and [ℙ¹] is unit. | Retain dimension shift. |
| §6.1 coarse comparison headline | B(C₂), B(S₃), B(Q₈): forward coefficients 1/2,1/6,1/8; inverse 2,6,8; composites 1. Sign affine line has 0→0 rational comparison but ℤ/2 versus 0 integrally. | Retain rational coefficients; no tame-characteristic restriction. |
| §6.2 equivariant comparison headline | G=1 gives shift 0. Gₘ on 𝔸²−0 gives A₂^G=ℤ=A₁(ℙ¹), while A₂(ℙ¹)=0. For μ_n, ℤ[t]/(nt)⊗ℚ=ℚ; negative-degree torsion disappears. | Retain i−dim G, including the positive-dimensional group case. |
| §6.3 degree headline | Nonneutral [Spec ℂ/C₄] gives 1/2=2/4, not 1/4. Sign ℙ¹ relation has degree 2·(1/2)−1=0. A purely inseparable degree-p point has degree p. | Retain residue degree and geometric stabiliser. |
| §7.1 repaired recognition | Weight-two affine line: S₁=0, S₂=k, so linear-fibre hypothesis fails. For S′=A[w]/w² and S=S′[u] (u,w of degree 1), fibre=A[u], K=0, and C=D×𝔸¹, even for A=k[ε]/ε². With E=0 the kernel induction gives S=S′. | New recognition passes these nonreduced and rank-zero controls. |
| §7.2 repaired cone stacks | Weight-two B𝔾_a has vertex automorphism action λ², versus λ in [C/E]; an intertwiner a needs aλ²=aλ and hence a=0. Translation quotient [𝔸¹/𝔾_a]=pt; trivial action quotient=𝔸¹×B𝔾_a with automorphisms k. | Strengthened presentation excludes the wrong action. |
| §7.3 truncation/site | O[2] and j_!O[2] both give τ≥−1=0. For the latter, lower stalks are 0 at the origin and nonzero at the generic point. k[0] over k[ε]/ε² has an infinite free resolution; truncation is represented by [k --ε→ A], with H⁻¹=0,H⁰=k. Elliptic chart has two arrows id,[−1], coarse j-point one. | Truncate-first route and elliptic comparison retained. |
| §7.4 correspondence | End(k[2])=k but its τ_[0,1]=0. For k[−1], linear endomorphisms are k on both sides. [k --id→k] gives pt; [k --0→k] gives 𝔸¹×B𝔾_a. | Retain restricted faithfulness. |
| §7.5 representability/closedness | E=0→F=k[0] gives h⁰ map 0→k and B𝔾_a→pt, not representable. E=k[1]→0 gives 0→0 on h⁰ and pt→𝔸¹, representable. Projection [k→k]₀→k[0] gives the closed zero section; its reverse is not closed. | Both directions discriminate. |
| §§8.1–8.2 local cotangent models | BG local embedding has K=0; its self-product is G→pt, also K=0. Dual numbers give (length H⁻¹,length H⁰)=(1,1), or (2,2) in characteristic 2. For (x,y)², lengths are 7−3=4 and 6−3=3 in characteristic ≠2. | Retain negative degree and characteristic dependence. |
| §8.3 derived versus sheaf pullback | For A=k[ε]/ε² and k=A/(ε), Tor_n^A(k,k)=k for every n≥0, whereas ordinary pullback=k. The sheaf sequence k→0→k --id→k→0→0→0 is exact. | Round-2 R08 repaired. |
| §8.3 truncation/transitivity | For I=(xy,xz,yz), xyz mod I²≠0 (degree 3<4), dc=tc=0 for t=x+y+z. H⁻² of derived pullback contains kc; the truncated target has H⁻²=0. Smooth product with 𝔸¹ adds O in degree 0. | Retain additional truncation and smooth triangle only. |
| §8.4 intrinsic normal sheaf | pt→Spec k[ε]/ε² gives τL=k[1], N=𝔸¹, C=Spec k[t]/t². For (x,y)², I/I² has length 7 versus 9 for a free rank-3 module; N's fibre dimension is 3−2=1. | Retain perfect-truncation versus lci distinction. |
| §8.5 intrinsic-cone headline | Smooth n-fold: dim BT=n−n=0. pt→B𝔾_m: dim B𝔾_a=−1=m. I=x(x,y) is of linear type, hence C=N, but local depth 0<dimension 1. | Retain stronger vector-bundle criterion, not C=N alone. |
| §9.1 obstruction class | Point of dual numbers lifts to x=aε, all a∈k; lifts form k. Identity k[x]/x²→k[x]/x³ would require (x+ax²)²=0 but gives x²≠0, in every characteristic. Étale case has one lift and zero tangent group. | Retain obstruction/torsor computation. |
| §9.2 dimension | Canonical smooth theory on pt ⊔ ℙ¹ has ranks (0,1), dimensions (0,1), not one pure dimension. On pt→dual numbers rk=−1 while dim pt=0. | Componentwise purity repair included in R01. |
| §9.3 headline; missing comparison | On 𝔸¹ with E=Ω and φ=0, Ext¹=0, lifts=ā+J and abstract null-isomorphism sheaf=J; h⁰φ=0. On T=pt,J=k the required map is 0:k→k; for φ=id it is id_k. | R02: require the specified comparison. |
| §9.3 repaired dual/local comparison | J=k[t]/t gives H²(J∨[−1])=O/t, but H² after truncation=0; for J=O both are 0. Locally K=[F⁻¹→F⁰], F⁰ free: Ext¹(F⁰,J)=0, Ext¹(K,J)=coker(Hom(F⁰,J)→Hom(F⁻¹,J)). | Old R03 repaired; no local-freeness condition imposed on J. |
| §9.3 obstruction detection | In characteristic 2, φ=(0,id) on dual-number L kills the obstruction, yet (x+ax²)²=x²≠0. h⁻¹φ=0 is not onto A. | Existing negative control remains correct but does not detect R02. |
| §9.4 zero loci | Section x² on 𝔸¹: E=[A --2x→A], vd=0, length=2. Zero section of O on 𝔸¹: E=[O --0→Ω], rank 0 and Ob=O. | Retain zero-locus theory without regularity of the section. |
| §§10.1–10.3 resolution/class headline | Adding [G --id→G] of rank g raises both ranks by g, leaving r fixed; cone gains G∨ and zero-section Gysin returns the same class. On ℙ¹ with E=[O(1)→Ω], degree=−1 in both resolutions. For E=[O(−4)→Ω], Ext¹(Ω,O(−4))=k but chain-homotopy group H⁰(O(−2))=0. | Retain fibre-product comparison, including non-chain-map identifications. |
| §10.4 repaired componentwise formula | pt ⊔ ℙ¹ with r=0: obstruction ranks (0,1), class degrees (1,−1); fixed c₁ would give (0,−1). At a point with obstruction ranks 0,1,2, classes are 1,0,0. On ℙ¹ with O(a), degree=−a. | Round-2 R05 repaired. |
| §10.5 product headline | Two degree −1 ℙ¹ theories give degree (−1)(−1)=1 and vd=0+0=0. Product with pt,E=0 leaves the class fixed. | Retain. |
| §10.6 pullback headline | Origin→𝔸¹ with M=𝔸¹×Y: Gysin [M]=[Y]=fibre virtual class. Identity sends supplied F to F. Flat identity over dual numbers preserves length 2. | Resolution hypothesis explicit; retain. |
| §10.7 functoriality headline | v(s,t)=st: L_v=[O --(t,s)→O²], graph z=st has codimension 1; Γ![𝔸³]=[𝔸²], matching the smooth canonical class. Relative tangent rank on nodal base×𝔸¹ is 1, versus absolute tangent-fibre dimension 3 at the node. | Retain relative tangent route and specified compatibility. |
| §10.8 count headline | M=B,E=0 gives total [B], each fibre count 1. ℙ¹×B with smooth theory has fibre dimension 1, outside A₀. Rank-zero ℙ¹ theory gives −1; BG gives 1/card(G); regular O(2) section on ℙ¹ gives 2. | Retain virtual-dimension-zero and dual-sign controls. |
| §11.1 map-space condition | An isolated pt carrying id:ℙ¹→ℙ¹ has H⁰(E) dimension 3 versus H⁰(L_pt) dimension 0. Constant maps into the point component of pt ⊔ ℙ¹ have both groups 0 and satisfy the moduli condition. | First excluded; second allowed and detects R01. |
| §§11.2–11.4 map-space headline | On ℙ¹, RΓO=k and RΓω[1]=k; O(−1) gives 0 on both sides. Constant maps to 𝔸¹ have E=O, φ=id, Ext⁰=k=k and Ext¹=0=0. For elliptic translates, tangent and obstruction dimensions are both 1, rank 0. | Retain duality domain, direction and shift. |
| §11.5 global resolution | On ℙ¹, V=O,L=O(1),N=1: G=O(−1)²,H=O(−2), so [R¹H→R¹G]=[k→0], χ=1. Embedded-point thickening has H⁰(L^−N)=k for every N>0; plane double line has 0. | Retain construction and discriminating nonreduced control. |
| §11.6 dimension headline | ℙ² lines: 3+(2−3)=2; Calabi–Yau 3-fold: 0+(3−3)(1−g)+n=n. For X=pt ⊔ ℙ¹ and maps into pt: actual rank=0, displayed formula=1. | R01; use rank d of T_X on the image component. |

### Seeded source verification

Locators are to the recorded versions, not silently transferred to published pagination. Vistoli and Deligne–Mumford are published scans; BF, Behrend and Edidin–Graham are the arXiv versions recorded in the manifest. The Stacks pages refer to the cached chapter PDFs. There are 22 manifest entries: 20 readable certified entries and the two settled uncertified works below. No further source was needed or fetched.

| Seeded target | Text opened; hypotheses and outcome |
|---|---|
| 1.1 Proper covers | deligne-mumford1969 Theorem 4.12, printed p.101, line 1012: separated finite type over Noetherian base, proper surjective generically finite cover open in a projective scheme. vistoli1989 Lemma 1.10, p.619, line 299 supplies an integral dominating substack when the target is irreducible. Base-change qualification is retained. |
| 2.2 Orders/divisors | stacks-chow-spaces Lemma 13.2 (0EQ2), p.15, line 667; vistoli1989 Lemma 3.3 and étale sheaf descent, p.634, lines 940–959. These support atlas independence and the boundary. The source distinguishes W from its image, as the package now does. |
| 2.4 Scheme/space comparison | stacks-chow-spaces Definitions 3.1 and 15.1, pp.3–4 and 18, lines 126 and 797 match the space construction. stacks-chow line 1395 is localisation, not the claimed comparison: R03. Its Definitions 8.1 and 19.1 and the pinned Tau Ceti quotient give the correct comparison. |
| 4.4 Canonical rational equivalence | vistoli1989 Lemmas 3.16 and 4.6, pp.641 and 648, lines 1172 and 1458; reduced equidimensional hypothesis at line 1451. BF Propositions 3.3–3.4, pp.25–26, lines 834 and 884 supply smooth compatibility. The β sign agrees with [ν=0]−[η=0]. The stronger tangent invariance is correctly not used. |
| 4.5 Bivariant/Gysin classes | vistoli1989 §5, pp.650–654, lines 1550–1672: rational coefficients, representable morphisms, scheme tests and extension via proper covers. BF pp.48–49, lines 1617–1643 supplies the algebraic-stack extension. Denominator is the positive generically finite degree of the chosen cover. |
| 6.2 Quotient comparison | edidin-graham1998 Propositions 10–11, arXiv pp.22–23, lines 770 and 790 assume a quasi-projective moduli scheme. The package explicitly removes that auxiliary assumption using its §5.1 homotopy theorem and §3.4 localisation, precisely the route discussed at source lines 765–768; it does not attribute the stronger form to Proposition 10 alone. The dimension shift is i−g. |
| 7.2 Cone stacks | BF Definitions 1.5, 1.8–1.12 and Propositions 1.7, 1.10, 1.13, pp.10–15, lines 349, 442–522. The package expressly strengthens the local-presentation definition because the inference at source lines 459–461 fails for weight-two B𝔾_a. The corrected quotient definition is usable by the later two-term constructions. |
| 8.2 Truncated cotangent | BF pp.28 and 49, lines 940–962 and 1649–1655; stacks-cotangent Lemma 22.4 (08V2), p.38, line 1724. They identify the two-term local model with the truncation. Olsson Theorem 8.1, author text p.28, line 1130 is the full lisse-étale object; the roadmap does not claim to construct that full object. |
| 8.4 Intrinsic normal sheaf | BF Definition 3.6, p.27, line 902; local quotient at p.28, lines 943–951; Proposition 2.4, p.20, line 674. The converse for a vector-bundle stack is given its own smooth-cone argument, and does not claim lci from perfectness of the truncation. |
| 9.1 Square-zero obstruction | BF pp.32–34, lines 1067–1137; the canonical extension/null-isomorphism map is constructed at lines 1110–1120. Ext¹ and Hom degrees and the pseudo-torsor are correct. The specified map needs to remain specified in §9.3 (R02). |
| 9.3 Characterisations | BF Theorem 4.5, pp.35–36, lines 1162–1201; relative use at line 1657. The local Ext computation repairs the old derived-dual problem. Source line 1180 uses the comparison induced by φ, which must be explicit in the target, R02. |
| 10.4 No/locally free obstructions | BF Propositions 5.5–5.6, p.40, lines 1353–1363, and Proposition 7.3, pp.50–51, lines 1702–1712. Global resolution is now standing. The componentwise top-Chern extension is correct; it is not a claim that obstruction rank is globally constant. |
| 10.8 Counts | Defined from §6.3 and §10.2; deformation invariance is explicitly derived from §10.6 and proper/Gysin compatibility rather than attributed to a nonexistent source theorem. BF Proposition 7.2, p.50, lines 1682–1699 supplies the smooth-base case. The stated reduced-base extension uses the separately proved relative invariance, and m+r=0 gives A₀ on fibres. |
| 11.1 Setting | behrend1997 pp.4–5, lines 129–153; BF Proposition 6.2, p.48, line 1602. The sources treat actual map spaces; the roadmap states the necessary infinitesimal moduli property instead of assuming an arbitrary family is universal. No representability theorem for arbitrary Hom stacks is claimed here. |
| 11.5 Global resolutions | behrend1997 Proposition 5 and proof, p.6, lines 165–186. The proof's inputs are the fibrewise ample line, quasi-compact finite-type base, reduced proper curve fibres and cohomology/base change. Its two-term order is [R¹H→R¹G], as stated. These inputs remain valid for the roadmap's family, not only for stable-map notation. |

No author-flagged unverified readable locator remains outside this check. The two explicitly uncertified works remain uncertified; their text was neither guessed nor requested again.

### Pinned APIs and headline completeness

The content checkout is main commit 5fc1aa8. Its manifest pins Mathlib at 1b1ccf4b088b32fa3f23f2de1127433254a81e1e and Tau Ceti at 2fd255d997f47c0b5d834ee416c7015d55444ce5. The following declarations and their bodies/signatures were opened at those pins; paths below are relative to the respective library repository.

| Pinned file and lines | Resolved input and scope |
|---|---|
| `Mathlib/AlgebraicGeometry/AlgebraicCycle/Basic.lean:44,69`; `OrderOfVanishing.lean:52` | AlgebraicGeometry.AlgebraicCycle is locally finitely supported functions on a scheme; map takes dimension weights and uses residue degrees. Scheme.ord is 0 at the excluded coheights or zero function. |
| `Mathlib/RingTheory/Extension/Cotangent/Basic.lean:61,319,324,546` | Extension.cotangentComplex, toKaehler, exact_cotangentComplex_toKaehler, Algebra.H1Cotangent. A presentation-level linear map and its homology, not the derived cotangent complex of a stack. |
| `Mathlib/RingTheory/Kaehler/JacobiZariski.lean:537,544,552`; `Kaehler/Basic.lean:781` | H1Cotangent.δ, exact_map_δ, exact_δ_mapBaseChange and KaehlerDifferential.exact_mapBaseChange_map; ordinary tensor in the sheaf-valued terms, scalar towers retained. |
| `Mathlib/RingTheory/Smooth/Basic.lean:70,290,370`; `Derivation/ToSquareZero.lean:116` | FormallySmooth requires projective differentials and vanishing H1; split-injection and lifting equivalences. derivationToSquareZeroEquivLift is for a specified existing lift/tower, giving the affine difference identification. |
| `Mathlib/Algebra/Category/ModuleCat/Sheaf/Abelian.lean:40`; `Algebra/Homology/DerivedCategory/Basic.lean:74,87` | Abelian module-sheaf category under sheafification hypotheses, HasDerivedCategory and DerivedCategory. These give the ambient categories, not stack geometry. |
| `Mathlib/AlgebraicGeometry/Sites/Etale.lean:50`; `CategoryTheory/Limits/Shapes/Pullback/Categorical/Basic.lean:81`; `CategoryTheory/Sites/Descent/IsStack.lean:49` | Scheme.smallEtaleTopology, CategoricalPullback with a specified isomorphism, and Pseudofunctor.IsStack. The last is descent for a Cat-valued pseudofunctor, with no algebraic/DM atlas condition. |
| `TauCeti/AlgebraicGeometry/Chow/Basic.lean:86,257,295,304,324,369`; `Chow/ClosedImmersion.lean:206,211` | cyclesOfDimension, RatEquiv, ChowGroup, cycleClass, the nested ChowGroup.equivIntOfUnique and ChowGroup.pushforward. Locally Noetherian scheme hypotheses and the closed-immersion restriction are retained. |
| `TauCeti/AlgebraicGeometry/AlgebraicCycle/Principal.lean:32,34,71`; `LineBundle/Class.lean:50`; `CartierDivisor/Basic.lean:127` | Principal cycles on integral locally Noetherian schemes; LineBundleClass and Scheme.CartierDivisor. Scheme objects, not stack carriers. |
| `TauCeti/AlgebraicGeometry/RelativeSpec/Graded.lean:93`; `RelativeSpec/BaseChange.lean:272`; `RelativeSpec/UniversalProperty.lean:349,455` | gradedRelativeSpec, relativeSpecBaseChangeIso, CommMon.relativeSpecHomEquiv and relativeSpecHomIso; functor-of-points permits arbitrary test morphisms. |
| `TauCeti/AlgebraicGeometry/VectorBundle/LinearScheme.lean:175`; `LinearScheme/BaseChange.lean:52,99`; `Geometric.lean:221`; `TotalSpace.lean:130,229` | linearSpec and QuasicoherentLinearScheme.pullback/linearSpecPullbackIso; totalSpace and totalSpaceHomEquiv/totalSpaceSchemeBaseChangeIso. C(F)=Spec Sym F is contravariant, totalSpace E uses E∨. |
| `TauCeti/AlgebraicGeometry/VectorBundle/FiniteLocallyFree.lean:80`; `Rank.lean:125`; `FixedRank.lean:52` | Scheme.Modules.isFiniteLocallyFree, FiniteLocallyFreeSheaf.rank (locally constant) and isConstantRank (extra equality at every point). This distinguishes the ranks relevant to R01. |
| `TauCeti/AlgebraicGeometry/Sites/Big/StructureSheaf.lean:84`; `Curves/Prestable.lean:45,55`; `AlgebraicSpace/Basic.lean:195`; `Stack/Basic.lean:37` | Big fpqc structure sheaf, prestable proper nodal geometrically connected scheme families, algebraic-space sheaves, SchPseudofunctor. IsAlgebraicSpace has no separatedness/quasi-separatedness field; the roadmap supplies its standing restriction. |

Object searches for intrinsic cones, perfect obstruction theories, virtual classes, cone stacks and DM structure in both libraries found no carrier making a headline statable. Stack descent and scheme Chow/linear-spectrum constructions were distinguished from those missing carriers. The README imports the existing scheme objects rather than declaring duplicates.

The headline inventory agrees with the eight items of the module docstring:

1. §6.1 coarse-space comparison: missing DM stacks, stack Chow groups and proper stack pushforward.
2. §6.2 equivariant comparison: additionally missing quotient stacks and equivariant Chow carriers.
3. §6.3 degree formula: missing stack integral substacks and their rational pushforward.
4. §8.5 intrinsic normal cone and dimension/lci criterion: missing cone stacks and stack cotangent/dimension carriers.
5. §9.3 obstruction-theory equivalences: missing the same geometric carriers and h¹/h⁰; wording repair R02 remains necessary.
6. §§10.2–10.3 virtual-class construction and independence: missing stack cone/Gysin carriers.
7. §§10.4–10.8 properties and counts: additionally missing stack Chern/bivariant operations. Componentwise obstruction rank is now in the docstring.
8. §§11.4–11.6 curve-map theory, global resolution and rank: missing stack map-space and relative derived pushforward/duality carriers; R01 concerns the README's expansion of the correctly stated Euler characteristic.

The few simple definitions allowed by the acceptance-test rule cannot supply these heavy carriers. The file therefore correctly declares **zero definitions, zero theorems and zero examples**, with a single import Mathlib and an empty TauCetiRoadmap.VirtualFundamentalClasses namespace. The one-tactic probe was audited against **every sorried theorem: zero**. There is nothing to try or delete as padding. Likewise the required #check @name binder inventory contains **zero declarations**, so there is no binder discrepancy or changed signature. No TauCeti object-file build was required.

The prescribed `lake env lean` invocation on the package's Suggested.lean, from the content checkout, returned exit 0 with no output: no errors and no warnings, including no sorry warnings. No stand-in headline was inserted. This certifies file form and imports, not the README's theorem truth.

### Cross-roadmap resolution, ownership and supply order

Every supplier contract and Needs line was compared with main or the permitted open head. The eight supplied unresolved-name leads all resolve to **roadmap** names, not missing pinned declarations: Stack.stackification and the two IsDeligneMumford suffixes are in SchemeAndStackFoundations §§1.18–1.19; four Chow names are in §§5.4–5.6; Algebra.CotangentComplex.homologyOneIso is explicitly mapped to §0.7 by DerivedModuleAlgebra. They should not be imported as if already compiled library APIs, and this file does not do so.

| Owner on main | Citations resolved now |
|---|---|
| SchemeAndStackFoundations | `TauCetiRoadmap/SchemeAndStackFoundations/README.md:923` (§0.7, including former-name map at 937); `:2145` (§1.1); `:2422` (§1.10); `:2849,2923,2949,3055,3092,3124` (§§1.18–1.23); `:3554,3719,3772,4104,4265,4452` (§§2.6,2.9,2.10,2.18,2.19,2.20); `:4917,5305,5529,6037` (§§3.3,4.1,4.5,4.15); `:6902,7000,7065,7109,7253` (§§5.1,5.2,5.4,5.5,5.6). Site, descent, bounded QCoh duality, curve and scheme-intersection contracts are present. |
| AlgebraicVectorBundles | `TauCetiRoadmap/AlgebraicVectorBundles/README.md:145` supplies the fixed-rank alias; `:345–374` maps L0B/L1A/L2A/L2B to the present sections/pins. The linear-spectrum and total-space conventions agree. |
| DerivedModuleAlgebra | `TauCetiRoadmap/DerivedModuleAlgebra/README.md:43–63` maps cited former names; `:1398,1463,1533,1588,1761` resolves §§0.7,0.8,0.10,0.13,0.25. Full cotangent statements remain affine/ring inputs. |
| EnhancedDerivedSheaves | `TauCetiRoadmap/EnhancedDerivedSheaves/README.md:441,534,580` resolves §0.2, E1.2, E1.4. Ringed-site K-flat/K-injective and pull/push/Hom inputs are present. |
| StableReduction | `TauCetiRoadmap/StableReduction/README.md:405–465,467–500` resolves Layers 2–3: proper curve cohomology/base change, nodal duality, ampleness, prestable families. |
| EquivariantIntersectionTheory | `TauCetiRoadmap/EquivariantIntersectionTheory/README.md:371–435` resolves §§2.1–2.2 and the standing smooth-affine-group/quasi-projective-linearized setup. Degree shift agrees. |
| EllipticCohomology | `TauCetiRoadmap/EllipticCohomology/README.md:207–216` resolves Layer 1 E1. The general site here explicitly agrees on the existing elliptic stacks. |

The board-package index was read before ownership searches. Object searches were run through `roadmaps grep` (open heads and main), the pinned libraries, and the board packages; the indicated relevant heads were opened with `roadmaps show`. The singular-name VirtualFundamentalClass at PR #1996 still owns the overlapping core (`TauCetiRoadmap/VirtualFundamentalClass/README.md:199–205`, and its later cone/obstruction/virtual-class layers). GromovWittenTheory at PR #1998 still owns the stable-map specialization (`TauCetiRoadmap/GromovWittenTheory/README.md:256–269`). These are the previously settled human ownership question, not a newly discovered owner or a reason to add a reciprocal dependency.

The four nearby SchemeAndStackFoundations revisions were opened: PR #1808 `TauCetiRoadmap/SchemeAndStackFoundations/README.md:47,7040`; #1807 `:48,6556`; #1854 `:46,6841`; #1656 `:46,8069`. Their scheme Chow/normal-cone scope does not take ownership of the DM-stack virtual class here. They do not replace main as suppliers. The supplied overlap report has no competing head changing this roadmap, no dropped cited id, and no citation that exists only in an open revision; inspection produced no additional overlap finding. Unprovided open-PR files were not independently sought. There can be no fully qualified Lean declaration collision with this package's empty acceptance file.

Prescribed dependency-check output:

```text
depcheck: 236 roadmaps, 2135 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line. The merge-order file was not changed. No missing supplier contract or gap was inferred from a merely unimplemented main-roadmap target.

## Not verifiable

- gillet1984 §4 is settled uncertified. Its text was not read; Vistoli's readable cycle/rational-equivalence restatement was checked. No repeat request was made.
- fulton1998 §1.10, Corollary 6.3, Proposition 8.1.1 and Appendix B.6.6 are settled uncertified. Their precise book wording was not read. Readable sources, named scheme suppliers and the displayed computations provide partial independent evidence, not certification of these book locators.
- There are no formal stack headline signatures to test at the pins. The successful empty Lean-file elaboration cannot validate the three findings or establish proofs of the other roadmap targets.

## Source issues

These concern the versions actually read. The full cotangent transitivity triangle is not an error.

- **Misprint** in behrend-fantechi1997 at remark after Definition 1.2, arXiv v1 p.8 (lines 272–276): the source says the sheaf sequence yields a cone sequence with F and F′ interchanged; it should be C(E)→C(F)→C(F′); affects a stated result.
- **Misprint** in behrend-fantechi1997 at proof of Lemma 1.3, arXiv v1 p.8 (lines 286–288): the source says the degree-one map and exact sequence run from S₁ to S′₁; it should use 0→S′₁→S₁→E→0; affects the proof.
- **Error** in behrend-fantechi1997 at Proposition 1.4, arXiv v1 p.10 (line 323): the source says smooth equivariant contractions recognize degree-one cones; it should require additional linear fibre structure, excluding the weight-two affine line; affects a stated result.
- **Error** in behrend-fantechi1997 at consequence after Definition 1.8, arXiv v1 p.13 (lines 459–461): the source says every stated presentation yields a vector-bundle quotient presentation; it should require linear fibre action, which weight-two B𝔾_a lacks; affects a stated result.
- **Error** in behrend-fantechi1997 at Lemma 2.2, arXiv v1 p.19 (line 635): the source says h¹/h⁰ detects arbitrary derived morphisms; it should restrict faithfulness to the two-term module-compatible correspondence; affects a stated result.
- **Gap** in behrend-fantechi1997 at proof of Proposition 2.4, arXiv v1 p.20 (line 679): the source assumes a local free resolution from coherence only in degrees zero and minus one; it should truncate first and resolve the bounded coherent truncation; affects the proof.
- **Error** in behrend-fantechi1997 at Proposition 3.5, arXiv v1 pp.26–27 (line 889): the source says the rational equivalence is invariant under all ambient tangent directions; it should use the relevant smooth-substack or relative tangent directions; affects a stated result.
- **Error** in behrend-fantechi1997 at Proposition 3.12, arXiv v1 p.30 (line 1010): the source says equality of intrinsic cone and normal sheaf implies local complete intersection; it should require the cone to be a vector bundle stack; affects a stated result.
- **Misprint** in kresch1999b at Theorem 3.1, arXiv v2 pp.10–11 (lines 331–343): the source names the arbitrary substack's tangent bundle as acting; it should name the smooth substack's tangent bundle, as in its proof; affects a stated result.
- **Misprint** in behrend-fantechi1997 at proof of Proposition 6.2, arXiv v1 p.48 (line 1609): the source places the base Ext group over O_C; it should place it over O_T with unchanged Ext degree; affects the proof.
- **Error** in edidin-graham1998 at Proposition 9, arXiv v3 p.22 (lines 745–753): the source identifies dimension-indexed equivariant Chow groups at equal indices for different quotient presentations; it should shift the second index by −dim G+dim H; affects a stated result.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "6d3102e0dd556b5facc34aeaf86152e0ba808ce2", "job": "REV-PKG-VirtualFundamentalClasses~3", "model": "gpt-6-astra", "worker": "chris-9"} -->
