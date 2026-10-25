<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/986#issuecomment-6397185234 -->
Review (codex) of f29de2d

Verdict: accepted
Conditional on the announced gaps: `p-local-finite-duality`, `spectral-ringed-sites`, `stable-james-splitting`

No findings. Acceptance is conditional on the declared supplier contracts `p-local-finite-duality`, `spectral-ringed-sites` and `stable-james-splitting`. The six previous findings are repaired. The two source issues below are not defects in the package: its statements avoid both.

Reviewed package head `f29de2d`, against content main `8888d45eea61a0573e32d9b39a00c833f844fc44`, Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The authored README, Lean file, metadata and source manifest were not changed.

## Verified sound

### Previous findings, checked before the new pass

The identifiers below are those of the repair report. Each repaired passage was checked against the previous finding, the source and the counterexample; the repair report was not treated as evidence of truth.

| Previous finding | Repaired passage and location | Independent witness and disposition |
| --- | --- | --- |
| F01: height-zero periodicity on arbitrary endpoints | `packages/ChromaticHomotopyTheory/README.md:263`: “For a 2-connective map f:X→Y with arbitrary endpoints” and the condition on πₖ(f)⊗ℤ[1/p], k≥2; applied at lines 593 and 613. | **Repaired.** For id on BS₃, π₁=S₃ remains untensored; every tested higher map is 0→0. For projection with fiber K(ℤ/q,2), the fiber's localized π₂ is 0 when q=p and ℤ/q otherwise. Flat exact tensoring of the abelian fiber sequence gives both implications, including k=2 because π₁F=0. The new domain works without an abelian fundamental group. |
| F02: associative restriction on the acyclicity comparison | `packages/ChromaticHomotopyTheory/README.md:311`: “Associativity and commutativity are not required; associative unital ring spectra are an application.” | **Repaired.** lmmt line 317 gives this generality. The rational unital algebra in the Check has (a²)a=0 and a(a²)=1; both positive-height detector smashes are zero. In the proof route, η⊗r=0 implies η=0 after any fixed parenthesized multiplication; the unit identity then gives id=0. Associativity is unnecessary. A zero product on a nonzero object fails the unit identities. |
| F03: E∞ restriction instead of Dₚ and homotopy-E hypotheses | `packages/ChromaticHomotopyTheory/README.md:919`: “it does not add an E∞ structure or a separate relative unit square.” Lines 901, 947 and 991 give the absolute, upward-acyclicity and Tate statements. | **Repaired, including the different repair.** hahn line 22 specifies the absolute unit square; hahn line 187 specifies weaker relative data. For R=E at p=2, twisting the relative factorization by 1+z preserves its restriction at z=0 but gives P(1)=1+z. Modulo (2,u₁) at height two, z²+z≠0 in 𝔽₄[z]/(z⁴), so multiplicativity also fails. The package correctly restricts those laws to the coherent E∞ specialization while retaining general relative zero-detection and the weaker intermediate Tate theorem. |
| F04: full level restricted to three | `packages/ChromaticHomotopyTheory/README.md:1085`: “For every integer N≥1”; small levels retain their stacks. | **Repaired.** mm line 1757 starts with arbitrary positive N; scheme representability only starts at N=3 at mm line 1774. Theorem 7.6 at mm line 1801 has the full range. Group orders at N=1,2,3,5 are 1,6,48,480. Level-two inertia explains why replacing its stack by a fine scheme would fail. |
| F05: nullification not specified or distinguished | `packages/ChromaticHomotopyTheory/README.md:575`: “Construct its nullification N_V on spaces with natural unit η_X:X→N_VX.” | **Repaired.** API at lines 579–583 and Checks at lines 587–591 distinguish outputs on V, K(ℚ,2), V∨K(ℚ,2): respectively *, K(ℚ,2), K(ℚ,2). Identity and constant functors each fail one of these. The p-local, simply connected and connectivity conditions in bhm lines 210–225 are retained. The source's rational comparison is not extended to arbitrary-input p-inversion. |
| F06: missing BHM locator | `packages/ChromaticHomotopyTheory/sources.toml:172` includes “Lemma 3.5, p.6”; the reference at `packages/ChromaticHomotopyTheory/README.md:1338` agrees. | **Repaired.** bhm lines 258–265 give the fiber-sequence homology comparison used at README line 531. Lemma 3.2 at bhm line 233 is a different assertion. The existing source key and retrieval record are retained. |

No previous finding was marked not actionable. I searched the rest of the package for each repaired pattern: arbitrary-endpoint height zero, associative-only comparison, E∞-only Hahn hypotheses, level-three-only Galois scope, implicit nullification and the old BHM locator. The scope, supplier contracts, proof routes, Needs lines, examples and Lean docstring agree with the repairs.

### Seeded source sample

All 15 sampled targets were checked in the legally cached text, including theorem numbering, printed/manuscript page conventions, hypotheses and the steps used from proofs. The manifest identifies the versions being cited; in particular Hahn is arXiv v2. There are 19 distinct manifest keys: 18 certified texts and the settled uncertified `abs` entry. No additional source fetch or manifest change was necessary. The uncertified item is recorded below rather than guessed.

| Sampled target and README line | Locator checked in the source | Support and scope checked |
| --- | --- | --- |
| 3.2 Telescope acyclicity criteria, 295 | lmmt Lemma 2.2, pp.6–7; lmmt lines 257–295 | All six assertions: connective covers, orthogonality including heights 0 and ∞, the S/p and completion tests, and periodic-group detection. The completion comparison is positive-height; arbitrary spectra are allowed. |
| 4.2 Finite localization kernels, 377 | lmmt Lemma 2.6, p.8; lmmt lines 323–338 | The all-spectra kernel is generated by finite p-primary spectra of type greater than n. The compactly generated quotient and smashing assertion use the actual finite kernel, not rational acyclicity on every spectrum. |
| 4.3 Comparison on p-local spectra, 393 | lmmt consequence (i) following Lemma 2.8, p.9; lmmt lines 356–358 | The two finite-localization conventions agree on p-local input. They are not identified on arbitrary spectra. |
| 5.1 Finite telescopic functors, 449 | kuhn-guide Lemma 3.1, pp.9–11, lines 373–430; Theorem 5.2 and Lemmas 5.4–5.5, pp.15–18, lines 655–758 | Actual unstable self-map input, powers and finite-source functoriality; the rigidification and locality inputs are named. No arbitrary stable map is silently treated as an unstable map. |
| 5.2 Bousfield–Kuhn functor, 477 | kuhn-guide Theorem 1.1, pp.3–4, lines 113–121; Theorem 5.2, line 655 | T(n)-local values and the finite-source comparison are both retained in the uniqueness statement. The Ω∞ comparison is only at positive height. |
| 6.2 Fiberwise homology comparison, 559 | lmmt proof of Proposition 2.11, p.10; lmmt lines 398–402 | The proof uses reduced acyclicity of every fiber. The generalized coefficient extension follows from the supplied pointwise Kan-extension formula and colimit composition; it does not impose an unjustified boundedness condition on E. |
| 6.3 Connective periodic vanishing, 575–607 | lmmt Proposition 2.11 and Remark 2.12, pp.9–10, lines 382–415; bhm Theorem 3.1, p.5, and Lemmas 3.2–3.3, p.6, lines 210–249; csy Theorem 5.4.4 and Remark 5.4.5, pp.83–84, lines 4036–4066 | Nullification, its periodic comparison, the sharp n+1 bound and arbitrary-endpoint map reduction are supported. The Eilenberg–Mac Lane step retains its finite p-group, degree and nonzero p-local weak-ring hypotheses; the zero coefficient case is immediate. |
| 6.4 Connective preservation by suspension and loops, 611 | lmmt proof of Proposition 2.11 and Remark 2.12, p.10; lmmt lines 403–415 | The connectivity bound and height range are explicit. The relative height-zero condition uses abelian groups in degrees at least two, plus the connectivity control of components and π₁. |
| 7.1 Morava E-theory, 645 | goerss Theorem 3.6, pp.238–239, lines 670–695; behrens §1.6, p.28, lines 1018–1043, and Theorem 1.7.6, p.34, lines 1252–1275 | Finite height over perfect residue fields, marked deformation and coherent realization, with |u|=−2. The general theorem uses Goerss; the complete-local/formally-étale setting in Behrens is not silently broadened. Heights one and two retain EllipticCohomology ownership. |
| 9.1 Localized norms and Tate spectra, 807 | cm-tate Definition 2.2 and Proposition 2.3, pp.2–3; cm-tate lines 69–81 | A homological localization and a coherent finite-group action are required. The conclusion uses the localized Tate cofiber; it does not claim raw vanishing. |
| 10.4 Tate height converse, 991 | hahn Corollary 4.6.1 and Proposition 4.7, pp.9–10, lines 432–450; cmnn Theorem 4.6 and Lemma 4.7, pp.19–20, lines 827–851 | Absolute Dₚ input for the conclusion about R; the intermediate local homotopy-E-algebra result is weaker. Trivial action is retained. The conclusion starts at i+1 and the rational i=0 argument avoids negative-index parameters. |
| 12.1 Affineness of elliptic spectral geometry, 1053 | mm Theorem 7.2, pp.36–37, lines 1729–1753; lmmt Corollary 4.21 proof, p.22, lines 914–918 | Both smooth and compactified elliptic spectral stacks occur. The projection formula for arbitrary coefficient spectra follows from the module equivalence; it is not general affineness for every spectral stack. |
| 12.2 Chromatic bounds for modular forms, 1069 | lmmt Corollary 4.21 and proof, p.22; lmmt lines 904–923 | Formal height at most two, nodal height one, connective-cover invariance and the height-two discriminant comparison are all used with their distinct ranges. The argument includes p=2 and p=3. |
| 12.3 Full-level Galois extensions, 1085 | mm Definitions 7.3–7.4 and Theorem 7.6, pp.37–38; mm lines 1757–1803 | Every positive N with N inverted; full GL₂ rather than a determinant-one subgroup; small levels remain stacks. Faithfulness is additional to the two Galois equivalences. |
| 13.5 Acyclicity under the James splitting, 1275 | lmmt Corollary 4.14 proof, p.20; lmmt lines 823–830 | Connected pointed W and reduced suspension spectra. The wedge starts at r=1. Smashing the splitting proves the arbitrary-E assertion; the splitting itself belongs to the declared HomotopySpheres contract. |

The changed claims also have direct primary-source support beyond this sample: lmmt lines 304–317 for the unital magma comparison; hahn lines 22–36, 187–202 and 422–450 for absolute/relative Dₚ data and acyclicity; hahn lines 43 and 87 for the height-zero Dₚ argument; bhm lines 258–265 for F06. I read the source's proof steps where the README uses them, rather than inferring their generality from a theorem title.

### Computed adversarial pass

The previous independent review contains 139 computed rows. I reused those only for unchanged assertions, after comparing the repaired text with that version. I reread every changed or added passage and all 40 numbered subsections, and checked the 66 Check blocks and six worked examples for consistency. The table below records the new computations and the retained headline/sample witnesses; it is deliberately shorter than a per-target ledger. “Pass” means agreement on the displayed instances together with the source and dependency audit, not a formal proof obtained from a `sorry` build. No package change is needed in these rows.

| Statement | Instances tried | Values computed on both sides or against the wrong model | Result | Change |
| --- | --- | --- | --- | --- |
| Universes, suspension, cofibers and symmetry | Point, countable wedge; ΣS; identity and zero-source maps; degrees (1,1),(0,1) | Cardinalities 1, ℵ₀ fit the fixed universes. π₁ΣS=π₀S=ℤ. Cofibers are 0 and S. Symmetry signs are −1 and +1. | Pass | None |
| P-local finiteness and duality | S_(p), S/p; infinite wedge; non-p-local target Hℤ | Duals S_(p), Σ⁻¹S/p. The infinite-wedge identity cannot factor through a finite subwedge. For V=S_(p), integral mapping π₀=0 but tensor π₀=ℤ_(p). | Pass; target locality essential | None |
| Bottom localization convention | p=2, S/3; S_(2); detectors 0 and S | S[1/2]∧S/3=S/3, Hℚ∧S/3=0. Both bottoms send S_(2) to Hℚ. Localization at the zero detector sends X to 0; L_S X=X. | Pass | None |
| Connected covers | K(A,2), r=2,3 | Cover index 2 retains π₂=A; cover index 3 is *. τ≤₂K(A,2)=K(A,2). | Pass | None |
| Formal-group normalization and domain | Multiplicative and additive laws at p=2,3; square-zero thickening | Multiplicative [2]=2z+z², [3]=3z+3z²+z³; reductions z²,z³, heights 1. Additive p-series 0 gives height ∞. In 𝔽₂[ε]/ε², ε≠0 and ε²=0; height is tested at residue field points. | Pass | None |
| Coefficients, nilpotence and type | p=3 BP/MU; sphere, Moore, zero; H𝔽_p unit | π₂BP=0 versus π₂MU_(3)=ℤ_(3). Types 0,1,∞; smash uses max. Finite-height detectors kill H𝔽_p, but 1ʳ=1≠0, so the ∞ endpoint is needed. | Pass | None |
| 3.1 periodic groups and powers | *, Hℤ; v and v²; identity/zero maps | Positive-height colimits are 0 on the first two inputs. The even subsequence has the same colimit. Induced maps are id and 0; shifting k by d shifts one term. | Pass | None |
| 3.1 relative height zero, both implications | id on BS₃; BS₃×K(ℤ/q,2)→BS₃ | π₁=S₃ is never tensored. Higher identity maps are 0→0. Fiber π₂ after p-inversion is 0 for q=p, ℤ/q for q≠p; the latter map to zero is not injective. | Pass | F01 repaired |
| Relative degree-two endpoint | Any 2-connective f; the preceding projections | π₁F=0. The localized exact sequence therefore has zero right endpoint; vanishing fiber groups give both injectivity and surjectivity of π₂f[1/p]. | Pass | F01 repaired |
| 3.2(a,b) covers | Hℤ, Σ⁻¹Hℚ, positive height | Before and after connective covering, all periodic groups are 0. A degree-zero rationale cannot detect the negative rational class. | Pass | None |
| 3.2(c) orthogonality | K(n), K(i) for i≠n, Hℚ, H𝔽_p | T(n)-smashes are respectively nonzero, 0, 0, 0. This includes the i=∞ endpoint. | Pass | None |
| 3.2(d,e) Moore/completion tests | Hℚ; S→S_p^∧ | Positive-height localized maps are equivalences; for Hℚ both objects are 0. At height zero π₀ gives ℤ[1/p]→ℚ_p, not onto. | Pass; positive height necessary | None |
| 3.2(f) acyclicity iff | Hℤ; a type-n finite source V | Periodic-group/telescope pairs are (0,0) and (nonzero,nonzero); the periodic identity of V maps to vʳ≠0. | Pass both directions | None |
| 3.3 homotopy-unital magma | Zero; nonzero zero-product object; rational basis 1,a,b | Zero satisfies id₀=0; a nonzero zero product gives 0≠id. With a²=b, ab=1, ba=b²=0, (a²)a=0 while a(a²)=1. Both positive-height smashes of this rational magma are 0. | Pass without associativity | F02 repaired |
| 3.3 detector comparison and proof route | R=0,K(n); nilpotent unit; H𝔽_q with q≠p at height zero | Detector pairs (0,0),(nonzero,nonzero). Multiplying η⊗r=0 gives η=0 and then id=0. At height zero T(0)∧H𝔽_q=H𝔽_q but K(0)∧H𝔽_q=0. | Pass; n≥1 essential | F02 repaired |
| 4.1 finite tower units and smashing | n=0; X=0,Hℚ,S/q, q≠p | Bottom units are ℤ→ℚ and ℤ→ℤ[1/p]. On Hℚ all units/transitions are id and Hℚ⊗Hℚ=Hℚ. On S/q the two bottoms give 0 and S/q. | Pass | None |
| 4.2 kernel and compact preservation | n=0; S/p,S/q,S_(p) | All-spectra p-finite localization gives 0,S/q,Hℚ. The localized sphere is the local unit, whose maps detect π₀ and commute with filtered colimits. | Pass | None |
| 4.3 comparison | S_(p); S/q for q≠p | The two outputs are (Hℚ,Hℚ) on the permitted input and (S/q,0) on the excluded input. | Pass; p-locality necessary | None |
| 4.4 fracture and 4.5 bottom comparison | (E,F)=(0,S),(S,0); X=0,S/q | Fracture vertices are (X,X,0,0) and (X,0,X,0), both with pullback X. The bottom comparison outputs 0 and S/q on the respective inputs. | Pass | None |
| 5.1 finite telescopic construction | Point, finite Postnikov input; v²; id_V and zero finite map | Outputs 0,0; cofinal subsequence gives the same colimit; induced maps id and 0 run contravariantly in the finite source. | Pass | None |
| 5.2 existence/characterization | X=0,T(n); wrong candidate Φ_n⊕Hℚ | Φ_nΩ∞ outputs 0 and L_T(n)T(n)≠0. Positive-type finite V has F(V,Hℚ)=0, but the wrong candidate takes *=Hℚ, which is not T(n)-local. Locality excludes it. | Pass | None |
| 5.2–5.3 height and implication direction | Σ⁻¹Hℚ; Hℤ→0; discrete S⁰ | Ω∞Σ⁻¹Hℚ=* although its p-inversion is nonzero. T(n)Hℤ=0 while Σ∞ℤ has a sphere retract. Φ_n(S⁰)=0 but L_T(n)Σ∞S⁰=L_T(n)S≠0. | Pass | None |
| 6.1 filtration and differential | Point base, empty total space; r=2,(s,t)=(2,0) | One column E_t(F_+) or all zero columns. Differential targets (0,1), reducing total degree 2 to 1. | Pass | None |
| 6.1 transport | Circle mapping torus with reflection versus identity | Reflection gives 1−(−1)=2, kernel 0, cokernel ℤ/2: H₂=0,H₁=ℤ⊕ℤ/2. Identity gives differential 0: H₂=ℤ,H₁=ℤ². | Pass; constant coefficients fail | None |
| 6.1 unbounded coefficient spectrum | KU and the CW filtration of ℂP∞ | E²=ℤ for nonnegative even s and even t, zero otherwise; every d_r=0. The union of finite-stage filtrations is KU_*(ℂP∞). | Pass | None |
| 6.2 fiber augmentation | id, ∅→*, two-point fiber; constant point fibers over arbitrary Y | Maps E→E, 0→E and fold E⊕E→E; last fiber is E. Constant point fibers give colim_Y E=E⊗Σ∞_+Y on both sides. | Pass | None |
| 6.3 nullification property and API | V, K(ℚ,2), V∨K(ℚ,2) | Outputs *,K(ℚ,2),K(ℚ,2). Reduced rational cohomology of V is zero, so all based mapping-space homotopy groups into K(ℚ,2) vanish. Reapplying N_V leaves these outputs fixed. | Pass; both wrong functors excluded | F05 repaired |
| 6.3 sharp bound and periodic comparison | n=1; K(ℤ/p,n); finite p-group A with r>i versus r=i | n+1=2. The boundary example has π_n=ℤ/p and nonzero K(n)-homology. Reduced T(i)-homology of K(A,r) is 0 in the stated high-degree range; K(i)_*K(ℤ/p,i) is nonzero. | Pass | None |
| 6.3 arbitrary-endpoint theorem | Identity BS₃; product projections above | Identity fibers are *, with all localized groups 0. A K(ℤ/q,2) fiber with q≠p retains ℤ/q, so the hypothesis excludes it before any conclusion is drawn. | Pass | F01 repaired |
| 6.4 suspension and loop preservation | Identity; excluded nonconnected fiber Hℤ→0 | Identity comparison cofiber is 0 before and after suspension/loops. Ω∞Hℤ has π₀=ℤ, violating the connectivity bound. | Pass | F01 terminology consistent |
| 7.1 realization, marking and grading | Heights 1,2,3; perfect field 𝔽_p; additive law | Numbers of deformation parameters 0,1,2; W(𝔽_p)=ℤ_p. Additive height ∞ is excluded. u and u⁻¹ have degrees −2,+2; u_i u^(1−p^i) has degree 2(p^i−1). | Pass | None |
| 7.2 action | Height one a=−1 and p=3,a=2; residue actions at h=2,3 | u↦−u↦u. Multipliers on π₂ and π₋₂ are 2 and 1/2. Frobenius orders on 𝔽_(p²),𝔽_(p³) are 2,3. | Pass | None |
| 8.1 uniform height locality | Multiplicative law; additive law over nonzero field; zero ring; free module R∨ΣR | Ideals (p,v₁) are the unit ideal, proper zero ideal, and 0=(1), respectively. Over the zero ring only the zero module exists. For R=KU_(p), locality preserves both free summands. | Pass | None |
| 8.2 telescope comparison on local objects | L_(n−1)S,K(n); KU_(p),n=1 | On the lower-local sphere both detector smashes are 0. Both reflectors fix K(n). The K(1)-local KU coefficient changes ℤ_(p) to ℤ_p. | Pass | None |
| 8.3 equality/separation | Height one; supplied separating witness X at every n≥2 | At n=1 the two localization classes agree. At n≥2 the witness satisfies L_T(n)X=X and L_K(n)X≠X. The witness is not the zero object. | Pass with BHLS range | None |
| 8.4 BP support and inversion | n=0; n=1,i=2; rational degree −(2p−2) | T(i)Hℤ_(p)=0. T(2)BP⟨1⟩=T(2)E(1)=0. Rational groups before/after v₁-inversion are 0 and ℚ, but the T(1)-localized cofiber is 0. | Pass | None |
| 9.1 localized norm | G=1; Hℚ with C₂; H𝔽₂ with C₂ | Norms are id, ×2, and 0 in degree zero. Cofibers are 0,0, and a spectrum with π₀=𝔽₂. | Pass; raw/localized distinction essential | None |
| 9.2 transfer criterion | Rational C₂,C₃,S₃; integral C₂ | Degree maps 2,3,6 have sections 1/2,1/3,1/6 rationally. Integral degree 2 has no section, whereas the augmentation has a basepoint section. The two maps cannot be exchanged. | Pass | None |
| 9.3 telescopic vanishing | KU_p^∧ with trivial C_p; induced objects for C₂,S₃ | Raw KU Tate has π₀=ℚ_p(ζ_p)≠0, while its T(1)-localization is 0. For induced objects, orbits=fixed points and norm=id, so raw Tate is 0. | Pass for coherent arbitrary actions | None |
| 9.4 raw finite-local blueshift | n=1; X=0; X=S[1/p] | The KU Tate field is rational, hence height-zero-local. Zero stays zero. Averaging by 1/p gives Tate 0 on the p-inverted input; the theorem does not promise exactly one height of loss. | Pass | None |
| 9.5 Euler inversion | p=2,3 | At 2, 2+z=0 and inversion gives ℚ₂. At 3, z²+3z+3=0, z=ζ₃−1 and z²=−3ζ₃; inversion gives ℚ₃(ζ₃). | Pass | None |
| 9.5 completion qualifier | H𝔽_p; KU_(2),KU_(3) | H𝔽_p is derived complete and nonzero but K(1)-localization kills it. KU localizes from E(1) at 2 and E(1)∨Σ²E(1) at 3; completed π₀=ℤ_p. | Pass; completeness alone insufficient | None |
| 10.1 absolute Dₚ data | H𝔽_p; zero θ on a nonzero ring | Correct operation has P(0)=0,P(1)=1. Zero θ gives P(1)=0≠1 and fails the unit square. K(0)∧H𝔽_p=K(1)∧H𝔽_p=0. | Pass | F03 repaired |
| 10.1 relative Dₚ-E data | R=0; R=E at p=2, factorization multiplied by a=1+z | For R=0 both groups and P are 0. For E, restriction at z=0 remains 1 but P(1)=a≠1; in 𝔽₄[z]/(z⁴), a²−a=z²+z≠0. Relative data alone give neither unit preservation nor multiplicativity. | Pass; wrong stronger model excluded | F03 repaired |
| 10.1 coherent specialization | E∞ E-algebra; x=0,1 and x=y=1 | P(0)=0,P(1)=1 and P(xy)=P(x)P(y). Additive discrepancy is a transfer, becoming 0 only in its quotient. | Pass | F03 repaired |
| 10.1 divisibility and index range | p=2,h=2,k=1; h=1,0 | Before reduction, u₁z² prevents division by z⁴. Modulo (2,u₁), g₂ has leading coefficient u₂. At h=1 the range 1≤k<h is empty; h=0 uses no negative-index u. | Pass | None |
| 10.2 upward acyclicity | H𝔽_p; bare K(r),r≥1; H𝔽_q,q≠p | H𝔽_p has consecutive detector values (0,0). Bare K(r) has (K(r−1),K(r)) values (0,nonzero), excluding Dₚ structure. H𝔽_q has rational smash 0 but T(0)-smash H𝔽_q≠0, so only the stated bottom implication is used. | Pass | F03 repaired |
| 10.3 height and monotonicity | 0,H𝔽_p,Hℚ,H𝔽_q,Hℤ_(p),KU_p^∧; R→0 | Heights −1,−1,0,0,0,1. Hℤ_(p)→H𝔽_p decreases 0→−1; R→0 decreases to −1. Empty vanishing set gives ∞, all heights vanishing gives −1. | Pass both directions of threshold iff | None |
| 10.4 Dₚ Tate converse | Hℚ; KU_p^∧ at i=1; H𝔽_p | Rational Tate is 0. For KU, T(1) of raw Tate is 0 but T(1)KU≠0 and T(2)KU=0. H𝔽_p and its Tate object have all finite Morava smashes 0. | Pass; j starts at i+1 | F03 repaired |
| 10.4 weaker intermediate theorem | M=0,E_(i+1), including i=0 | For zero, both K(i)-smashes are 0. For E_(i+1), K(i)∧M and K(i)∧M^tC_p are both nonzero; at i=0 the Euler-inverted rational coefficient is nonzero. | Pass without Dₚ on M | F03 repaired |
| 11.1 real Bott comparison | ko→KO; A=ko,0; rational degree −8 | Positive-height localized cofiber 0; rational groups 0→ℚ show the height-zero exclusion. Relative tensors are KO and 0. Complexifying α²=4β gives (2b²)²=4b⁴. | Pass | None |
| 12.1 affineness and projection formula | Spec A; modules 0,A,A∨ΣA; spectra 0,S,S∨ΣS | Γ and its inverse give the same three modules. Projection-formula sides give 0,ΓM,ΓM∨ΣΓM. | Pass | None |
| 12.2 chromatic modular bounds | n≥3; n=2; nodal, ordinary, supersingular charts | Higher T(n)-smashes of tmf,Tmf are 0; at n=2 discriminant inversion has localized cofiber 0. Chart heights are 1,1,2. No good-prime exclusion occurs. | Pass | None |
| 12.2 grading and connective distinction | Δ⁸,Δ³,Δ²⁴; rational degree −21 | Degrees are 192,72,576. π₋₂₁tmf⊗ℚ=0, whereas compactified Tmf has a nonzero negative rational class. | Pass | None |
| 12.3 Galois definition and faithfulness | Trivial C₂,S₃ torsors; B=0 over Hℤ; zero base | B⊗_AB=A⁴,A³⁶, matching ∏_G B; fixed points recover A. Tensor with B=0 kills Hℤ, so it is not faithful. Zero base has only the zero module. | Pass | None |
| 12.3 full-level theorem and small levels | N=1,2,3,5 | GL₂ orders 1,6,48,480. At N=2, −1 fixes all two-torsion while remaining elliptic inertia; stack descent is required. At N=1 the extension is the identity. | Pass | F04 repaired |
| 12.3 action order and determinant | Row basis (P,Q), elementary upper g and lower h at N=3 | (P,Q)gh=(2P+Q,P+Q), but (P,Q)hg=(P+Q,P+2Q). A determinant −1 matrix sends the pairing ζ to ζ⁻¹. Pullback converts the right action to the stated left action. | Pass | F04 repaired |
| 12.4 supersingular comparison | p=2,3 | Geometric group orders multiplied by the residue Galois order give 24·2=48 and 12·2=24. Omitting the Galois factor gives the wrong groups. | Pass | None |
| 13.1 units and Thom construction | H𝔽₂,H𝔽₃,zero; trivial line over point/two points; R→R′ | Unit-component counts 1,2,1 versus additive counts 2,3,1. Thom objects R,R⊕R; base change R′⊗_R R=R′. The zero coefficient gives 0. | Pass | None |
| 13.2 Hopkins–Mahowald completion | p=2,3; completed versus uncompleted S³ fiber | Units 1−p=−1,−2. Thom π₀ values 𝔽_p and ℤ_p. Completed fiber kernel/cokernel of ℤ_p→ℤ_p are 0; the uncompleted comparison has cokernel ℤ_p/ℤ in π₂. | Pass | None |
| 13.3 James-filtered Thom objects | m=0; p=2,m=1; z→y and colimits | p⁰−1=0, y(0)=S_p^∧. J₁S²=S², π₀y(1)=𝔽₂, π₀z(1)=ℤ₂. The degree-zero map is reduction ℤ₂→𝔽₂; completed colimits have those same π₀ values. | Pass | None |
| 13.4 acyclicity and slopes | m=1,2; (p,m)=(2,1),(3,1) | y low-height ranges {0},{0,1}; z ranges ∅,{1}, with rational π₀z=ℚ₂≠0. Slope denominators 2p^m−2 are 2,4; v₀ has degree 0 and is treated separately. | Pass | None |
| 13.5 arbitrary-E acyclicity | E=Hℚ,W=K(ℤ/p,1); W=*,S¹,S² | Reduced rational homology is 0 on W and on the reduced tensor algebra. Splittings give 0, ⋁_(r≥1)S^r, ⋁_(r≥1)S^(2r); an r=0 term would wrongly add S. | Pass | None |
| 13.5 connectivity and chromatic specialization | Disconnected S⁰; finite p-primary type m>n, n=1 | π₀J∞S⁰=ℕ but π₀ΩS¹=ℤ, so connectivity is necessary. For type >1 both T(1) and S[1/p] smashes are 0. | Pass | None |

The repaired Dₚ distinctions exclude the most plausible wrong operation, rather than merely testing the zero object. The nullification universal property distinguishes both identity and constant wrong models. Unit maps, normalization of the norm, row/column conventions, Morava periodicity, the real Bott factor four, reduced James indexing and completion were checked against their suppliers. No 0/0, negative-index coefficient, unjustified ordinary quotient of a derived module or hidden small-prime exception was found.

### Pinned declarations and headline statability

I opened the following declarations at the pins, not a newer online library. The first column is a repository-relative library path.

| Pinned declaration and location | What the actual declaration provides, and what it does not |
| --- | --- |
| `Mathlib/RingTheory/FormalGroup/Basic.lean:56`, `FormalGroup`; line 74, `FormalGroup.IsComm` | A two-variable power series, zero constant coefficient, two linear coefficients equal to one and associativity. Commutativity is separate. This is not a spectrum, topological group, or complete topological point functor. |
| Same file, line 126, `FormalGroup.Point`; lines 145,161,184, `FormalGroup.𝔾ₐ`, `FormalGroup.𝔾ₘ`, `FormalGroup.map` | Points are multivariable power series satisfying `PowerSeries.HasSubst`; the additive and multiplicative laws and coefficient map are native. There is no arbitrary-topological-algebra point carrier hidden in this definition. |
| `Mathlib/CategoryTheory/Localization/Bousfield.lean:55`, `CategoryTheory.ObjectProperty.isLocal` | The definition is bijectivity of precomposition into every object with the given property. It supplies no spectral reflector or mapping-space equivalence. |
| `Mathlib/RingTheory/Flat/Localization.lean:37`, `IsLocalization.flat` | Flatness of a commutative-semiring localization; the ℤ[1/p] specialization is valid. |
| `Mathlib/RingTheory/Flat/Basic.lean:323`, `Module.Flat.lTensor_exact` | Exactness is preserved by left tensoring with a flat module over a commutative ring. It applies to the abelian homotopy-group segments used in F01. |
| `TauCeti/AlgebraicGeometry/EllipticCurve/FormalGroup/Basic.lean:58`, `WeierstrassCurve.formalGroup` | Native `FormalGroup R` from a Weierstrass equation over a commutative ring, with the two-variable reindexing. No spectral elliptic realization or nonsingularity hypothesis is part of that declaration. |
| `Mathlib/AlgebraicTopology/EilenbergSteenrod.lean:36`, `TopPair.HomologyPretheory`; homotopy invariance separately at line 144 | Functors, boundary maps and the sequence shape. Excision and invariance under all weak equivalences are not fields of this pretheory. It cannot replace generalized spectral homology in §6.2. |
| `TauCeti/AlgebraicTopology/EilenbergSteenrod.lean:65`, `HasPairSequence`; lines 85 and 94, `IsAdditive`, `Dimension` | Additional ordinary axioms on the pretheory, not native spectra, spectrum-valued local systems or space homotopy fibers. |
| `Mathlib/Algebra/Homology/HomotopyFiber.lean:55` | A construction for `HomologicalComplex C c`, not the homotopy fiber of a map of spaces. The name alone is not a carrier for the missing headlines. |

Object searches covered spectra, ring/module spectra, spectral localization, Morava theories, homotopy fibers, formal groups, coherent actions, Tate constructions, Thom spectra and spectral ringed sites. The spectral carriers needed here do not occur at the pins. I elaborated a separate signature audit with `#check` on the consumed native declarations; it succeeded. There are **zero package declarations**, so the requested `#check @name` comparison has zero own signatures and no silently dropped section hypothesis. There are likewise **zero sorried theorems to subject to the one-tactic probe**. An algebraic formal-group identity would be padding, not a replacement headline.

The 25 headline groups from the README are all individually named, with the missing carrier, in `packages/ChromaticHomotopyTheory/Suggested.lean:11` through line 35:

| README headline | Missing native carrier named in the module docstring |
| --- | --- |
| §3.3 homotopy-unital T(n)/K(n) acyclicity | Spectra, homotopy multiplications, Morava theories and telescopes |
| §§4.1–4.3 all-spectra finite localization, kernel and smashing | Spectra and homological reflectors |
| §4.4 homological fracture | Spectral units and homotopy pullbacks |
| §§5.1–5.2 Bousfield–Kuhn existence and uniqueness | Derived pointed spaces, mapping spectra and localization |
| §5.3 suspension–loop detection | Derived spectral suspension–loop adjunction |
| §6.1 generalized Serre filtration | Spectrum-valued local systems and filtered homotopy colimits |
| §6.2 fiberwise homology comparison | Spectra, their suspension tensor and space homotopy fibers |
| §§6.3–6.4 finite nullification, sharp vanishing and preservation | Nullification, periodic groups, fibers and finite-local tower |
| §§7.1–7.2 Morava realization and actions | E∞ spectra and marked coherent realization |
| §8.1 uniform height locality | Oriented ring spectra and their modules |
| §8.2 local telescope comparison | Chromatic spectral reflectors |
| §8.3 height-one equality and higher separation | Spectral local categories and spectral algebraic K-theory |
| §8.4 BP support and inversion | BP-module spectra and localization |
| §§9.1–9.3 transfer criterion and telescopic Tate vanishing | Coherent finite-group spectra, norms and Tate cofibers |
| §9.4 raw finite-local blueshift | Raw Tate construction and finite-local reflectors |
| §9.5 nonzero KU Tate calculation | KU spectrum, derived completion and Tate construction |
| §§10.1–10.3 Dₚ operations, Hahn and ring height | Extended powers, Dₚ/E∞ spectral algebras and detectors |
| §10.4 Tate height converse | Homotopy spectral algebras, Morava modules and Tate comparison |
| §11.1 positive-height real Bott inversion | ko-algebra spectra and relative spectral tensor |
| §12.1 elliptic affineness | Spectral ringed stacks and quasicoherent spectral modules |
| §12.2 tmf/Tmf/TMF comparisons | The three spectra and their localization units |
| §§12.3–12.4 full-level Galois and supersingular comparisons | Spectral level stacks, spectral algebras and coherent fixed points |
| §§13.1–13.2 Hopkins–Mahowald Thom equivalences | Completed spectra, spectral units and E₂ Thom rings |
| §§13.3–13.4 James-filtered Thom colimits and acyclicity | Completed E₁ Thom spectra, colimits and Morava homology |
| §13.5 James-splitting acyclicity | Reduced suspension spectra and stable James splitting |

None of these headlines is statable with a few simple definitions on existing pinned carriers. None is forced through an arbitrary predicate, free variable stand-in or sorry'd data. The file has the single `import Mathlib`, the required namespace and one explanatory module docstring; no `set_option`, `lemma`, API catalogue, admitted example or padding.

The prescribed `lake env lean` invocation, from the content checkout and with the package file's absolute argument, exited **0 with no output and no warnings**. The signature-audit elaboration also exited 0. No Tau Ceti module build was needed, and no Lean process remains running.

### Ownership and exact supplier resolution

I used `roadmaps list`, object-based `roadmaps grep`, `roadmaps show` and the citation resolver, supplemented by direct searches of the pinned libraries, content main and board packages. I read the board package index before deciding where each package lives. Its 20 heads were inspected: five have package READMEs and fifteen have design READMEs at their heads. Searches of those texts found no competing owner for the new chromatic constructions. Open-head ownership was checked through the supplied roadmap service, not inferred from branch names. No declaration-name collision is possible in the empty package Lean namespace.

| Supplier / version | Resolved current passages | Ownership conclusion |
| --- | --- | --- |
| GeneralizedCohomology on main | `TauCetiRoadmap/GeneralizedCohomology/README.md:211` G2 spectral models; line 464 algebra localization; lines 718,800,878 G3 colimits, Postnikov and integer localization; line 1246 G4.5 orientations; G5.1 finite duality and G5.4 coefficient spectra | The generic spectral, Bott and duality constructions remain imports. G5.7 at line 2397 concerns continuous torus Borel Thom comparisons for the specified geometric bundles and MU/Hℤ coefficients; it is not the arbitrary R-line Eₙ Thom construction in §13.1. The additional p-local compact/duality interface is an explicit gap. |
| BordismFormalGroups on main | `TauCetiRoadmap/BordismFormalGroups/README.md:284` F3; line 466 F5; line 555 F6.1; line 586 F6.2; line 760 F6.3; line 1171 telescope class independence; line 1248 F6.4; line 1526 F6.5 | Formal heights, BP/K(n)/E(n), nilpotence, periodicity, p-local finite localization and generic Borel norms/Tate are imported, not rebuilt. The package's all-spectra bottom convention, homotopy-unital comparison and telescopic theorems are distinct extensions. |
| BordismFormalGroups F6.5, detailed route inputs | Same README line 2104 pointwise Kan extensions; lines 2415–2440 Tate unit/Euler criteria; line 2510 lower-height L_n-sphere Tate; line 2536 K(n)-localization by the Moore tower; line 2556 Landweber locality | The fiberwise colimit proof and Layer 8 routes have owners. The existing lower-height theorem for L_n is not the package's raw finite-local L_n^f theorem. The package does not take the telescope conjecture as an input. |
| EnhancedDerivedSheaves on main | `TauCetiRoadmap/EnhancedDerivedSheaves/README.md:211` E0.4; line 242 E0.5; line 1512 E5:abstract.4; line 1597 E5:presentability.1 | Stable categories, space-indexed colimits, monoidal derived categories and compact/Ind machinery are supplied. Ordinary derived modules over a commutative ringed site do not already supply spectral ringed-stack modules; the additional contract is meaningful. |
| StableHomotopyKTheory, head `00bfbf7` | `TauCetiRoadmap/StableHomotopyKTheory/README.md:1155` §3.18; line 1190 §3.21; §§7.21–7.27, especially line 2541 §7.24 | Compatible space Postnikov towers and twisted obstruction theory exist. The exhaustive, bounded-below homological filtration theorem is explicit; §7.26's cohomological tower conditions are not imposed on the wrong spectral sequence. |
| AlgebraicTopology on main | `TauCetiRoadmap/AlgebraicTopology/README.md:499` Stage 4; line 849 Stage 5; line 916 Serre theory; line 1602 Stage 8 | CW geometry, ordinary local coefficients and homotopy exact sequences are supplied. The generalized spectrum-valued Serre construction is a new target here. |
| HomotopySpheres, head `fb7c47e` | `TauCetiRoadmap/HomotopySpheres/README.md:370` §3A; line 387 §3B; line 466 §4B | Convenient spaces, Freudenthal, the connected James equivalence and real Bott are imports. §3B supplies word filtration and smash-power quotients; its splitting test is not the natural stable splitting construction and filtration compatibility required by the gap. |
| TopologicalKTheory, head `7575afa` | `TauCetiRoadmap/TopologicalKTheory/README.md:1147` T7, especially lines 1219–1249 | Clifford normalization and complexification agree: α²=4β, α↦2b², β↦b⁴. Their degrees match the homological translation in the package. |
| EllipticCohomology, head `f0df48d` | `TauCetiRoadmap/EllipticCohomology/README.md:55` E1; lines 215–236 E2; line 336 E3; line 722 E4; lines 814–839 E6 | Elliptic stacks, height-one/two realizations and obstruction machinery, Otop and tmf/Tmf/TMF, the actual Δ²⁴ lift, and level sheaves/descent remain supplied. Arbitrary finite-height realization above two, affineness and faithful spectral Galois extensions are the distinct new results here. |
| ModularCurves on main | `TauCetiRoadmap/ModularCurves/README.md:1043` §3D; line 1077 §4B; line 1100 §4C; line 1313 §5B; lines 1510 and 1551 §§7E–7F; convention at lines 161–175 | Full ordered bases carry the right row-vector action and determinant pairing law. Scheme representability starts at N=3; small-level stacks come from EllipticCohomology. Supersingular formal height and Serre–Tate deformation are supplied. |
| RefinedTraceMethods, head `9dd2691` | `TauCetiRoadmap/RefinedTraceMethods/README.md:552` §2.3; line 637 §2.6; §§2.9–2.10, line 869; line 1815 §4.9; line 1938 §4.11; line 2819 §6.8 | Segal comparison, THH/TC, categorical K-theory, trace and K(1)=completed KU localization exist. The separating chromatic witness and KU raw Tate application are additional targets, not a redevelopment of those constructions. |

The nearby open EllipticKTheory roadmap at head `7d208ea` concerns algebraic K-theory of elliptic curves and does not own the spectral elliptic realization, affineness or Tate statements. Object searches also distinguished bundle Thom constructions from the arbitrary spectral-line Thom construction. GeneralAlgebraicKTheoryPartII and StableHomotopyKTheoryPartII use the chromatic interfaces as consumers; the package does not use their resulting purity or counterexample applications to prove those interfaces. No ownership move was required.

I read every one of the **40 Needs lines**, all 14 layer dependency endings and every supplier citation. The resolver reported no unresolved roadmap citation or own Lean name. Its external-library limitation was covered by the direct pinned checks above. There is no upward supplier, local proof cycle or prerequisite presented as supplied at a nonexistent section.

The prescribed dependency check returned:

```text
depcheck: 51 roadmaps, 583 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. This output is a mechanical check in addition to, not a substitute for, the resolved citations.

### Declared gaps and package shape

The following three slugs agree between `packages/ChromaticHomotopyTheory/design/plan.json` and the README's exact supplier contracts. Each names a supplier and one precise mathematical interface. None requests an existing pinned result, duplicates another owner, or has supplier `none`.

| Gap | Contract location and minimality | Concrete consistency check |
| --- | --- | --- |
| `p-local-finite-duality` | README line 59; GeneralizedCohomology G3.9/G5.1. Extends integral finite duality to compact p-local objects and their generation, with p-local targets explicitly required. | D(S_(p))=S_(p), D(S/p)=Σ⁻¹S/p; finite subwedges colimit to the countable wedge. Integral Hℤ as target gives the 0 versus ℤ_(p) counterexample above. |
| `spectral-ringed-sites` | README line 71; EnhancedDerivedSheaves E5. Spectral quasicoherent modules with chart base change/descent and the global-sections adjunction are additional to ordinary derived ringed-site modules. | On Spec A, Γ0=0, ΓO=A and tensor unit=A. These are one module/descent interface, not unrelated prerequisites bundled together. |
| `stable-james-splitting` | README line 85; HomotopySpheres §3B. Requires the natural reduced stable splitting and its compatibility with the existing word filtration. | For W=*,S¹,S² the reduced splittings are 0, ⋁S^r, ⋁S^(2r), r≥1. Disconnected S⁰ fails the existing James equivalence by ℕ versus ℤ components. |

I compared the shape with GeneralizedCohomology, BordismFormalGroups and ModularCurves on main. The package has the required summary, ownership, conventions, supplier contracts, build explanation, 14 ordered layers, Examples and Dependencies for every layer, downstream consumers and references. The 40 mathematical subsections have hypotheses and locators; constructions retain prose APIs and at least three discriminating Checks. The six worked examples agree with the statements and conventions. Imported material is represented by its owner and comparison examples, not competing target declarations. The new scope develops a general library at every prime, rather than a route-specific shortcut or a replacement of an existing roadmap. No computational algorithm, copied source passage, unowned foundational construction, sorry'd data or forbidden option was found.

`metadata.toml` parses with topic `math.AT`; `sources.toml` parses as the required v1 manifest with unique lifetime keys and version records. Source locators and mathematical content, rather than the metadata status alone, were used to certify the sample.

## Not verifiable

- `abs`, Atiyah–Bott–Shapiro, *Clifford modules*: the source is settled as uncertified and was not legally available for text inspection. Its recorded locator is retained; it was not requested again or added to a missing-reference list. The package's coefficient normalization was independently checked against TopologicalKTheory T7, GeneralizedCohomology G5.4 and the computed complexification identity (2b²)²=4b⁴. This does not certify the inaccessible ABS passage itself.

No sampled locator was unreadable. Formal truth is not certified by the successful Lean command: the missing spectral carriers are correctly documented, and the review's mathematical evidence is the source, supplier and computed-instance audit above.

## Source issues

- **Misprint** in mm at Example 7.5, p.37 (mm line 1780): the source says the second displayed Legendre two-torsion point has coordinates (0,1); it should be (1,0), since (0,1) gives 1≠0 in the equation while (1,0) gives 0=0; affects nothing.
- **Error** in hahn at §1, p.2 (hahn line 54): the source says the power operation of a general local Dₚ-E-algebra is multiplicative; it should be restricted to suitably multiplicative extended-power data, such as the coherent E∞ specialization; affects a stated result.

For the second issue, the explicit relative-factorization twist and computation a²−a=z²+z≠0 are recorded above. Definition 3.1 permits that twist. The package does not import the overstrong introductory assertion; it uses Theorem 3.3's zero-detection statement at the weaker hypotheses. No claim of a published correction is made.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "f29de2de3c59a1daef558204776e0c177c7c36f1", "job": "REV-PKG-ChromaticHomotopyTheory~3", "model": "gpt-6-astra", "worker": "chris-12"} -->
