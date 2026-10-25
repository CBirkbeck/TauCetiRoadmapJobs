<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1197#issuecomment-6399088581 -->
Review (codex) of f0cf796

Verdict: accepted
Conditional on the announced gaps: `witt-characteristic-series`, `multiplicative-postnikov`, `nilpotent-kzero`, `tc-mod-p-cyclotomic-colimits`, `tc-mod-p-ring-sifted-colimits`, `thh-all-cyclic-assembly`, `tc-z-k1-nonzero`, `tc-z-inverse-p-vanishing`, `k1-tc-filtered-colimits`, `linear-weak-additive-motives`, `linear-motive-tensor-unit`, `linear-motive-kzero-unit`, `linear-motive-projection-formula`, `spectral-etale-descent`, `spectral-strict-henselian-detection`, `suslin-algebraically-closed-comparison`, `localizing-nisnevich-descent`, `localizing-derived-blowup`, `abstract-blowup-noetherian-approximation`, `abstract-blowup-platification-domination`, `kh-simplicial-model`, `kh-regular-comparison`, `kv-relative-comparison`, `kh-nilpotent-invariance`, `stable-james-splitting`, `all-height-morava-realization`, `elliptic-spectral-affineness`, `elliptic-level-three-galois`, `elliptic-supersingular-at-two`, `elliptic-supersingular-at-three`, `spectral-units-and-lines`, `relative-thom-colimit`, `multiplicative-thom-refinement`

No new findings. All eight findings from round 2 are repaired. Acceptance is conditional on the 33 declared supplier contracts, whose slugs and needs agree between the README and the plan. This accepts a roadmap, not implementations of those contracts or proofs of its future theorems.

The four authored files were not changed. No source-manifest entry was added or altered. The review compared the repaired version with its preceding version, read the changed passages, checked every seeded target, and retained earlier adversarial evidence only where the preceding review supplied computed values. A helper located supplier text; the mathematical assessments and verdict are mine.

## Verified sound

### Previous findings, checked first

Locations in this table are in `packages/GeneralAlgebraicKTheoryPartII/README.md` unless otherwise specified. Each quotation is from the repaired package, not from a source.

| Prior finding | Repaired passage | Status and independent retest |
|---|---|---|
| F01: bottom étale detector | Lines 260–264: “use D₀=Hℚ and D_n=T(n) for n≥1” | Repaired in both contracts and their plan entries. For p=3 and 𝔽₄/𝔽₂, the rejected p-inversion comparison gives completed π₋₂ values 0 and ℤ/2; rationalization gives 0 and 0. Both rational K₀ groups are ℚ. Zero input fails the strict-henselian detection hypothesis. |
| F02: missing twisted Thom acyclicity | Line 1239: “For every m≥1 prove T(i)⊗y(m)=0 for 0≤i<m.” | Repaired. The same paragraph gives the strictly positive range for z at 2. Lines 1241–1243 own the odd-prime vanishing-line/convergence argument and the prime-two Margolis comparison; §7.8 now consumes §4.32. For m=2 the positive range is exactly {1}; y has zero bottom value, while π₀z[1/2]=ℚ. At p=3 the two slopes are 1/16 and 1/4, with difference 3/16. |
| F03: ambient endomorphisms | Line 1273: “B=Hom_(C/J)(1,R), the spectrum of maps from the tensor unit to the image of R” | Repaired here and at line 1958. With R=ℚ×ℚ, this algebra has coordinatewise multiplication. Ambient End(R)=M₂(ℚ) instead has E₁₂E₂₁=E₁₁ and E₂₁E₁₂=E₂₂. Vanishing of the corrected B nullifies the unit and hence id_R. |
| F04: trace supplier locators | Line 206: “RefinedTraceMethods §2.3 supplies the bounded-above Tate fixpoint lemma”; line 1592 includes “RefinedTraceMethods §4.19” | Repaired in scope, contracts, individual Needs and layer dependencies. The current supplier has the fixpoint statement at line 567 and the assembly statement at line 2309. Its cofiber has p−1 summands, hence 1 at p=2 and 2 at p=3. Connective input and p-completed coefficients remain explicit. |
| F05: Witt-coordinate sign | Line 250: “a(νx)=1−a₁νx” | Repaired. The conventions, supplier bridge, §4.36 and Layer 4 example agree. At a=1 and ν=ε in 𝔽₃[ε]/ε², χ(a)(εx)=1−εx, fixing the NK symbol. The former positive-sign value differs by 2εx≠0. |
| F06: Lemma 2.3 page | Line 1745: “Lemma 2.3, p.1017” | Repaired. The source's page header is lmmt line 300 and its lemma starts at lmmt line 316. The other local citation at line 724 agrees. |
| F07: preparation history | Line 2372: “arXiv:2009.07223v3, §4.4; compact parametrized/retractive comparison at lines 4319–4346” | Repaired, including the manifest version note. The replacement-history clause is gone. The cited stabilization/retract comparison is still at cdh line 4319 through line 4346. |
| F08: nonexistent unital input | Line 1788: “The unital square-zero projection Hℤ⊕ΣHℤ→Hℤ” | Repaired. Its π₀ map is identity but its rational π₁ map is ℚ→0, so it fails 0-niceness within the declared carrier. Identity on Hℤ remains a positive example; H𝔽_p fails the π₀ carrier condition. |

The changed Lean text only adds Thom acyclicity and Adams/Margolis carriers to the list of unavailable headline signatures. Pattern searches covered the whole package for the old endomorphism-algebra identification, both Witt signs, fixpoint/assembly citations, both page citations, the former nice-map example, preparation history and the Thom dependencies. No recurrence of those defects was found. The older settled finding concerning edits to downstream ChromaticHomotopyTheory remains outside this package's editable scope; it is not re-raised.

### Principles, shape and acceptance file

The continuation explicitly names where GeneralAlgebraicKTheory stops. Enhanced spectral K, spectra, formal groups, general power operations, Witt carriers and scheme K are imported from their named owners. The retained targets add spectral/additive comparisons, restricted acyclic-domain results, global finite localization, telescopic purity and its consequences. Arbitrary associative inputs and all primes are preserved where the theorems assert them. The positive-height ring-acyclicity theorem is not promoted to the telescope conjecture for arbitrary spectra. Height-zero exceptions are expressed as hypotheses and separate detector conventions.

There are 103 numbered targets, 103 individual Needs lines, 111 Checks blocks and 11 layers, each ending with Examples and Dependencies. The 21 numbered definition/interface sections have API lists and at least three Check bullets; the supplied interface blocks also retain their APIs and tests. The sampled definitions have computed positive and negative controls below. The shape was compared with main's `TauCetiRoadmap/OptimalTransport/README.md` and `TauCetiRoadmap/ComplexTori/README.md`. No copied source passage, computational algorithm, process narrative requiring repair, sorry'd data, free predicate substitute or `set_option` was found.

The prescribed elaboration, `lake env lean` with the absolute tool argument for `packages/GeneralAlgebraicKTheoryPartII/Suggested.lean`, was run from the supplied content checkout. It exited 0, with empty output and no warnings. Its sole import is `Mathlib`; no Tau Ceti object build was necessary. The file has zero named declarations, definitions, instances, structures or examples. Thus the per-declaration `#check @name` audit and the one-tactic padding probe both have empty input sets: no lost binder, assumed carrier or padding theorem was found. Successful elaboration is not used as evidence that a README theorem is true.

### Seeded source verification

All 30 manifest entries are distinct certified works with readable cached extractions. No author-marked unverified locator was found. The editions below are those in the manifest; printed pagination is distinguished from manuscript pagination. All 15 requested targets were read, including proof passages used for their routes.

| Target | Source passages read and scope verified | Result |
|---|---|---|
| 1.1 General linear groups of connective ring spectra | bgt line 3111 through line 3137, Lemma 9.39/Proposition 9.40, printed pp.819–820; lt line 689 through line 727, Lemma 2.4, manuscript pp.16–17; lmmt line 491 through line 521, pp.1021–1022. Connective E₁ rings, matrix units, stabilization and the connected positive K-space. | Supported; K₀ is kept separate. |
| 1.3 Additive and stable Schwede–Shipley comparison | lmmt line 614 through line 621, Proposition 3.6 proof, p.1023; line 1155 through line 1161, Corollary 4.31 proof, p.1035; bgt line 1352 through line 1386, Theorems 4.22–4.23, pp.770–771. Finite sums/retracts versus thick generation are distinguished. | Supported; right action is precomposition. |
| 2.3 Rational and p-adic truncation | lt line 689 through line 727, Lemma 2.4 and proof, manuscript pp.16–17; lmmt line 659 through line 679, Theorem 3.8 proof, p.1025. π₀-isomorphism, n≥1, localizations of ℤ and Moore coefficients are retained. | Supported; no Hℤ/m-algebra stand-in. |
| 4.3 Telescope acyclicity criteria | lmmt line 267 through line 310, Lemma 2.2 and proof, pp.1016–1017. Positive height, connective covers, S/p and completion comparisons. | Supported, without extending completion invariance to height zero. |
| 4.4 Ring-spectrum acyclicity comparison | lmmt line 316 through line 334, Lemma 2.3/Remark 2.4, p.1017. Ring/unit input and n≥1 are essential to the displayed proof. | Both directions supported. |
| 4.21 Chromatic support of BP truncations | ravenel line 401 through line 450, Theorem 2.1(d)–(f) and proof, pp.361–363; lmmt line 903 through line 914, Corollary 4.12/Remark 4.13, p.1030. | Supports the Bousfield classes and high-height inversion, not rational equivalence. |
| 4.28 Chromatic height of a commutative ring | lmmt line 155 through line 176, p.1014; hahn line 19 through line 36, Theorems 1.1/1.3, p.1. | The threshold and its monotonicity agree with the explicit global bottom convention. The package separately corrects the source's height-zero redshift overclaim. |
| 4.34 Ordinary-homology detection of the H∞ unit | may-nilpotence line 47 through line 49, Theorem B, p.2; cmnn20 line 798 through line 817, Theorem 4.2 proof, manuscript p.19; hahn line 19 through line 36. | Supported, with every coefficient prime and the corrected Hom(1,R). |
| 4.41 Telescopic K is truncating on finite-acyclic rings | lmmt line 584 through line 589, Proposition 3.4, p.1023, with the preceding finite-stage argument. | Supports connective L_n^(p,f)-acyclic inputs, n≥1. |
| 4.46 Theorem A in both forms | lmmt line 101 through line 109, pp.1012–1013, and line 659 through line 679, Theorem 3.8, pp.1024–1025. | Supports all E₁ rings, all 1≤i≤n in the first form, and n≥2 in the second. |
| 6.7 Redshift in chromatic graded pieces | lmmt line 175 through line 186, p.1014, and line 316 through line 334, p.1017. | Supported after the package's explicit positive-height restriction and p-local n=0 extension. It compares vanishing, not the towers themselves. |
| 7.6 Truncated Brown–Peterson localization | lmmt line 903 through line 914, Corollary 4.12/Remark 4.13, p.1030. | Supports comparison at i≥n+1, vanishing at i≥n+2 and the localized sequence. The unlocalized failure for n≥2 is retained. |
| 8.8 Supersingular fixed-point description | lmmt line 1002 through line 1044, Corollary 4.21(iv) and proof, pp.1032–1033; goerss line 688 through line 695, Theorem 3.6, p.239, with its preceding deformation setup on p.238. | Supported for the specified residue fields and full semilinear actions. |
| 8.9 Classical regular localization checks | lmmt line 987 through line 991 and line 1045 through line 1052, Remarks 4.20/4.22, pp.1032–1033; agh line 1520 through line 1544, Proposition 4.4 route and Example 4.6(4)–(5), manuscript pp.34–35. | Supports the integral coefficient sequences. LMMT's two citations are explicitly labelled secondary; AGH supplies the regular localization theorem used by the owned coefficient verification. No arbitrary-algebra fiber sequence is claimed. |
| 9.5 Comparison with homotopy K-theory | lmmt line 1089 through line 1096, Remark 4.27, p.1034. | Supports every discrete associative ring with central polynomial variables, conditional on the named KH interface. |

Additional changed passages were checked at yuan line 310 and line 326 (Theorem 4.3/Lemma 4.5, manuscript pp.8–9); lmmt line 948 through line 975 (Thom acyclicity and its proof, p.1031); akq line 632 through line 661 (Proposition 2.22 and localized Adams comparison, manuscript p.15); weibel line 38 through line 58 and line 211 through line 224 (the negative characteristic-series convention and its NK action, pp.467–468,474–475); and cdh line 4319 through line 4346 (the retract/stabilization comparison). These support the actual repaired ranges and models, not just their theorem titles.

### Computed adversarial evidence

These rows cover the sampled targets, headline groups and every repaired mathematical passage. They record values on both sides or an explicit value separating a wrong model. They are boundary and convention tests, not proofs of general theorems. For the unchanged targets outside this displayed set, the round-2 review's computed target rows 0.1–10.5, convention rows C1–C10 and supplier-interface rows S1–S7 were read and retained; its 33 computed contract rows were also reviewed. Its failed rows are superseded by the fresh repaired rows here. The repair diff does not alter other target statements. No uncomputed “sound” summary was used as a substitute for that evidence.

| Statement | Instances tried | Values computed on the compared sides | Result / change |
|---|---|---|---|
| Transfer, shifts and Hom conventions | Rank 2; k→0→Σk; X=ΣHk,Y=Hk in Hk-modules | Transfer [R²]=2[R]; 0=1+(−1); π₋₁Hom=k versus π₋₁hom=0 | Pass; conventions distinguish the opposite shift and connective truncation. |
| Global/rational bottom | p=2, H𝔽₃; Hℚ; zero ring | T(0)H𝔽₃=H𝔽₃ versus HℚH𝔽₃=0; both fix Hℚ; K(0)=0 | Pass. |
| Repaired spectral étale contracts | p=3, 𝔽₄/𝔽₂; n=0; zero ring | Rejected completed π₋₂: 0 versus H²(C₂,ℤ₂)=ℤ/2. Rational version: H²(C₂,ℚ)=ℚ/2ℚ=0, hence 0=0. Rational K₀ of 𝔽₂ and 𝔽̄₂ is ℚ; zero input has K₀=0. | Pass; F01 repaired. |
| 0.1 compact-kernel localization | q=id; q:D→0 | Fib(KD→KD)=0; Fib(KD→0)=KD | Pass; both extreme kernels agree. |
| 1.1 GL/plus | r=0,1,2; Hℤ; Hk⊕ΣHk | GL₀=*; π₀GL₁Hℤ={±1}; GL₂Hℤ=GL₂ℤ; π₁GL₁(Hk⊕ΣHk)=k; connected K-space has π₀=0 versus K₀(k)=ℤ | Pass. |
| 1.2–1.3 additive/projective and stable Morita | Vect_k; X=A right modules; X=A²; zero | Group completion ℕ→ℤ sends 1↦1; End_A(A)=A by left multiplication; Hom(A,A²)=A²; End(0)=0. For A=M₂(ℚ), left compositions E₁₂E₂₁=E₁₁ fix the ring order. | Pass; opposite action excluded. |
| 1.4 A-theory | X=* and S¹ | S[Ω*]=S; S[ΩS¹]=S[ℤ]; augmentation after unit=id | Pass; retract-completed model retains K₀. |
| 2.1–2.2 restricted truncation/excision | F=0; R=HA; nilpotent k[ε]/ε²→k; identity leg | F-values 0→0; HA→Hπ₀HA=id; ε²=0; identity correction map=id, square error=0 | Pass; auxiliary acyclicity remains a hypothesis. |
| 2.3 coefficient connectivity | Identity; p=2,3; S[1/p]→Hℤ[1/p] | Identity fiber=0 in every degree; mod-p coefficient fiber of the latter map=0; relative K mod p=0 | Pass. |
| 2.4 nonpositive K | Hk⊕ΣHk→Hk; j=0,−1 | K₀=ℤ→ℤ=id; K₋₁=0→0 | Pass. |
| 3.1–3.3 stable envelope and heart | Hk,ΣHk; Proj(Hk); Perf(k); zero | Amplitudes [0,0],[1,1]; stable envelope Perf(k); K₀(heart)=K₀stable=ℤ; additive K₀(Perf k)=⊕_(j∈ℤ)ℤ; zero envelope=0 | Pass; no uniform amplitude or additive/stable identification. |
| 3.4 regular spectral dévissage | R=Hk[u], degree(u)=2; invert u | Cofib(Σ²R→R)=Hk; inverting u sends Hk to 0; its class maps by 1−(−1)²=0 | Pass; the even-degree sign is fixed. |
| 3.5–3.6 finite-limit/envelope fiber | C=0; Perf(k) | Zero presheaf/kernel=0; e_j↦(−1)^j; e₀+e₁↦1−1=0 | Pass. |
| 4.3 periodic detection/completion | Hℤ,Hℚ; n=1 | Positive periodic groups of both=0; Hℚ^∧p=0 but T(0)Hℚ=Hℚ | Pass; bottom extension rejected. |
| 4.4 ring acyclicity iff | H𝔽_p; K(n),n≥1; H𝔽_q,q≠p | Both positive detectors kill H𝔽_p and detect K(n); T(0)H𝔽_q=H𝔽_q whereas K(0)H𝔽_q=0 | Pass in both directions and in the excluded bottom case. |
| 4.10–4.12 Bousfield–Kuhn/detection | Finite Postnikov X; v,v²; Σ⁻¹Hℚ | Φ_n(X)=0; even subsequence and full telescope have the same colimit; Ω∞Σ⁻¹Hℚ=* but its bottom-local spectrum is Σ⁻¹Hℚ≠0 | Pass; positive-height hypothesis necessary. |
| 4.18–4.21 oriented locality and BP support | Additive law over 𝔽_p; BP⟨0⟩; p=2,BP⟨1⟩→E(1) | [p]=0 gives (p,v₁,…,v_n)=0≠(1); Hℤ_(p) has zero positive support; rational π₋₂ of BP⟨1⟩ and E(1) is 0 and ℚ | Pass; rational equivalence excluded. |
| 4.22–4.25 norms and telescopic Tate | G=1; trivial C₂,C₃ on Hℚ; zero | Norm id, ×2, ×3 respectively; inverses id, ×1/2, ×1/3; Tate cofibers 0. Zero input has Tate 0, so height drop need not be exactly one. | Pass. |
| 4.26 power normalization | Scalars 1,2; p=2,3 | P(1)=1; res P(2)=4,8 versus res(P(1)+P(1))=2; discrepancies 2,6 | Pass; additivity only modulo transfers. |
| 4.27–4.29 Hahn, height, Tate converse | 0,H𝔽_p,Hℚ,H𝔽_q; rational Tate | Global heights −1,−1,0,0; H𝔽_p has every finite Morava value 0 but nonzero mod-p homology; rational Tate=0 and all positive T(j)Hℚ=0 | Pass; threshold iff and one-way Hahn implication have the stated meaning. |
| 4.30 modular locality | p=2,3; Δ²⁴ | T(3)tmf=T(3)Tmf=0; degree Δ²⁴=24·24=576; tmf→Tmf has bounded-above fiber, invisible at positive heights | Pass. |
| 4.31 Thom conventions | p=2 unit; connected cover at 3 | 1−2=−1; completed π₀=ℤ₂, 2-local π₀=ℤ_(2); unlocalized sign-cover model at 3 has sphere retract with π₃=ℤ/3 versus π₃Hℤ_(3)=0 | Pass; incorrect integral Hℤ model excluded. |
| 4.32 repaired twisted acyclicity | m=1,2; p=2; odd p=3,5 | Positive ranges ∅,{1}; T(1)y(2)=T(1)z(2)=0; T(0)y(2)=0 but π₀T(0)z(2)=ℚ. At (p,m,i)=(3,2,1), slopes 1/16,1/4 differ by 3/16; at (5,2,1), 1/48,1/8 differ by 5/48; at i=m difference=0. | Pass; F02 repaired; equality case not asserted. |
| 4.33 James control | W=*; W=S²,E=Hℚ; p=2 and mod-3 Moore summand | Reduced splitting of *=0; S² gives ℚ in degrees 2r,r≥1; ΣS/3 survives p-inversion | Pass; connected/p-local hypotheses retained. |
| 4.34 ordinary unit detection and quotient algebra | B=0,Hℚ,H𝔽₂; R=ℚ² | All homologies of 0=0; Hℚ detects itself; π₀(H𝔽₂⊗H𝔽₂)=𝔽₂, rational/mod-3 values=0. Hom(1,ℚ²) has product (ac,bd); ambient matrices give E₁₁≠E₂₂. | Pass; all primes needed; F03 repaired. |
| 4.35–4.37 nilpotence and Witt action | ℤ/9→𝔽₃; ν²=0; χ=1,1−t; characteristic 3 | K₀:ℤ→ℤ; K₋₁:0→0; χ(0)(νx)=1, χ(1)(νx)=1−νx; opposite sign differs by 2εx; −t(1−at)′/(1−at)=Σ_(r≥1)aʳtʳ. χ≡1 mod t² gives χ(νx)=1. | Pass; F05 repaired. |
| 4.37 coefficient localization | ℤ[1/2][ε]/ε²; 𝔽₂[ε]/ε² | ×2 on square-zero units has inverse ×1/2 in the first; (1+εx)²=1 in the second; K₁(ℤ/9,(3))={1,4,7}, order 3 | Pass; invertible and nilpotent p are separate cases. |
| 4.41–4.43 acyclic truncation/categories | H𝔽₂,p=2; H𝔽₃,p=3; zero category | L_n^(p,f)H𝔽_p=0; K(𝔽_p)^∧p=Hℤ_p; positive local K=0 on both sides; K(0)=0 | Pass. |
| 4.45–4.46 Mitchell and Theorem A | A=0; already-local A; n=1,2 | Comparisons 0→0 and id; T(2)K(ℤ)=0 but T(1)K(ℤ)≠0; bottom removal starts at n=2 | Pass. |
| 5.1–5.2 connective-cover/high trace | KU; zero; n=2 | τ≥₀KU=ku; localized comparison fiber=0; K(0)=TC(0)=0 | Pass; no height-one trace extension. |
| 5.3–5.4 transfer and CMNN induction | G=1,C_p; n=2,3; p=2,3 | Norm for 1=id; res∘ind=p on K₀; m=n−2=0,1; base T(2)K(S[1/p])=0. Assembly cofiber has 1,2 copies; after T(m+1), each cyclic-bar term and each cofiber copy=0 for m≥1. | Pass; F04 repaired and base case separate. |
| 5.5–5.6 purity and nilpotent comparisons | H𝔽_p,p=2,3,n=1; identity; ℤ/4→𝔽₂ | Adjacent localization of H𝔽_p=0; localized K on both sides=0; identity fiber=0; ideal (2) has square 0 and relative K₁ has order 2 | Pass; no restriction to good primes. |
| 6.1–6.2 upper bound/field maps | Hℚ,H𝔽_p,E₁,0; H𝔽_q at q≠p | Input heights 0,−1,1,−1; K bounds 1,0,2,0. E₁ maps to itself; H𝔽_q cannot map unital to a characteristic-zero field since q·1 would be both 0 and nonzero. | Pass; rational-part condition separates bottom field maps. |
| 6.3–6.5 lower bounds/redshift | E₁,E₂ at 2,3; characteristic-zero periodic field | T(2)K(E₁) and T(3)K(E₂) are nonzero; periodic field comparison has completed π₀=π₁=ℤ_p; heights 1→2,2→3 and 0→1 | Pass; the last statement requires nonzero rationalization. |
| 6.5 global bottom negative control | R=(H𝔽₂)^tC₂; chromatic p odd | R[1/p]=R≠0, R⊗Hℚ=0; one-periodicity gives 1=−1 on K, so 2K(R)=0 and positive odd-primary local K=0 | Pass; excluded from the height-zero equality. |
| 6.6 necessity of both heights | M=HA; type-n connective M | π₁ΣHA=A versus π₋₁ΩHA=A; T(n−1)M=0 while T(n)ΣM≠0 | Pass; stabilization uses ΣTHH, preserving the obstruction. |
| 6.7 graded-piece iff | R=Hℚ,n=0 p-local; E₁,n=1,2 | M₀Hℚ≠0 and M₁K(Hℚ)≠0; M₁E₁,M₂K(E₁) nonzero; M₂E₁=M₃K(E₁)=0 | Pass in both vanishing directions; F06 locator repaired. |
| 7.1–7.3 nice maps and iteration | id Hℤ; Hℤ⊕ΣHℤ→Hℤ; id H𝔽_p; K(𝔽_p)→Hℤ | π₀ id=ℤ→ℤ; rational π₁ of projection=ℚ→0; π₀H𝔽_p=𝔽_p excludes it. K₀(𝔽_p)=ℤ and rational positive groups=0; both positive telescopic values=0. | Pass; F08 repaired; iteration begins from the K map. |
| 7.4–7.6 coefficient applications | m=1; truncated sphere r=0,1; BP n=0,1,2 | T(3)K(K(1))=0; τ≤₀S=Hℤ with T(2)K=0; BP comparisons start at 1,2,3 and vanish at 2,3,4. At n=0 the fiber K(𝔽_p) is positive-telescopically zero. | Pass; three-term BP sequence begins n=1. |
| 7.7–7.8 suspension and Thom K | W=*; m=1,2; p=2,3 for y | A(*) comparison=id; positive m=1 range empty; T(1)K(y(2))=T(1)K(𝔽₂)=0; z comparison has target T(1)K(ℤ_(2)); π₀z[1/2]=ℚ | Pass; owned twisted input used. |
| 8.1–8.2 ε-descent and mapping algebra | Unit algebra; degree-two rational transfer; R=ℚ² | Cobar error tower=0; transfer(1/2)=1; corrected Hom algebra is commutative ℚ²; if unit η=0, id_R=μ(η⊗id_R)=0 | Pass; F03 repaired in its second use. |
| 8.3–8.5 Galois/Morava transfer | G=1; A→A×A; rank d free semilinear module | Identity descent; transfer(a,b)=a+b and (1,0)↦1; residue dimension d·card(H); for d≥1 and card(H)=48,24 this is positive and rationally invertible | Pass; actions and perfect restriction retained. |
| 8.6–8.9 ko, tmf and supersingular examples | A=ko,tmf,0; p=2,3 | ko[β⁻¹]=KO; T(3)K(ko)=0; tmf comparisons use Tmf at height 2 and TMF at 3, and T(4)K(tmf)=0. Group orders (9−1)(9−3)=48 and 12·2=24; L_K(2)TMF(3)=0 at p=3. Integral coefficient fibers K(ℤ) have T(2) value 0. | Pass; p=3 level-three substitution excluded. |
| 9.1–9.2 truncation/cdh | H𝔽_p; k[ε]/ε²→k; empty scheme; identity blowup | H𝔽_p[1/p]=0 and L_K(1)K(𝔽_p)=0; ε²=0; local nil fiber=0; K(∅)=0; identity blowup discrepancy=0 | Pass, conditional on the explicit general localizing-invariant contracts. |
| 9.3–9.5 polynomial/KH | A=𝔽_p[ε]/ε²; regular k; r=0,1 | 1+εx≠1 but evaluates to 1; local NK fiber=0. A[Δ⁰]=A, A[Δ¹]=A[t]; K(k)=KH(k), K₀(k)=KH₀(k)=ℤ | Pass; singular integral K≃KH is not asserted. |
| 9.6–9.7 TC and category colimits | p=2,3; ℤ→ℤ[1/p]; p-power torsion stages | L_K(1)TC(ℤ)≠0, TC(ℤ[1/p])^∧p=0; finite torsion stages have local TC=0 while the indicated union has the nonzero localization fiber | Pass conditional on the three precise TC contracts. |
| 10.1–10.2 additive comparison/colimits | Perf(k); zero; constant filtered/simplicial diagram | ⊕_jℤ→ℤ sends e_j↦(−1)^j; positive comparison fiber at i≥2 has value 0; zero input 0; constant colimit/realization=A | Pass; colimits use the specified local target. |
| 10.3–10.5 cyclic assembly | G=1,C₂,ℤ,S₃,Q₈; R=KU,n=2; R=0 | First three have terminal orbit G/G, assembly=id. S₃ has cyclic subgroups 1, three C₂, one C₃; Q₈ has 1, central C₂, three C₄; neither full group is cyclic. τ≥₀KU=ku; zero input TC/K=0. | Pass; all cyclic subgroups, including ℤ, retained. |

### Headline inventory and statability at the pins

The following is the README headline inventory, grouped only to keep the report readable. Every group is named in the module docstring of `packages/GeneralAlgebraicKTheoryPartII/Suggested.lean`. None is statable using a few simple definitions on the pinned carriers; the missing objects are the objects of the statements, not missing proof lemmas. Ordinary K₀ consequences and boundary computations are not substitute headlines.

| README headline theorems | Missing pinned objects named in the docstring |
|---|---|
| §0.1 compact-kernel localization | Enhanced stable categories, compact quotient and K spectrum. |
| §1.1 connective plus comparison | Connective ring spectra, spectral GL, plus comparison and spectral K. |
| §§1.2–1.3 additive Morita/projective K comparison | Additive ∞-categories and spectral projective/perfect modules. |
| §1.4 A-theory comparison | Loop-group ring spectra and retractive-space K. |
| §§2.1–2.3 restricted excision and quantitative truncation | Ring spectra, localizing invariants and K. |
| §2.4 nonpositive comparison | Spectral rings and integer-graded K. |
| §§3.2,3.5–3.6 stable-envelope and bounded-heart fiber | Additive spectral presheaves, enhanced stable envelope and K. |
| §§3.3–3.4 heart and regular spectral localization | Enhanced hearts, perfect spectral modules and K spectra. |
| §§4.10–4.12 Bousfield–Kuhn/detection | Telescopes, spectral localization and periodic functors. |
| §§4.24–4.25 telescopic Tate vanishing/blueshift | Coherent Tate spectra and chromatic localization. |
| §§4.27–4.29 Hahn acyclicity and Tate-height converse | H∞/E∞ ring spectra, Morava theory and chromatic height. |
| §§4.35–4.37 continuous Witt/NK action and localization | Integer-graded NK with its K-theoretic action. |
| §§4.43,4.45 acyclic categorical K and Mitchell | Enhanced spectral K and telescopic localization. |
| §4.46 Theorem A, both forms | Ring-spectral K and finite chromatic localization. |
| §§5.1–5.2 high-height connective-cover/trace comparison | K, TC and T(n) localization. |
| §5.4 CMNN finite-sphere vanishing | Finite-local sphere and its K spectrum. |
| §§5.5–5.6,6.6 two-height purity, nilpotent comparisons and optimality | Telescopic K/TC of E₁ rings and its stabilized relative theory. |
| §§6.1,6.3–6.5 Theorem B, Lubin–Tate lower bound and corrected redshift | Spectral rings, chromatic fields and K. |
| §6.7 graded-piece redshift | Chromatic towers of ring spectra and their K. |
| §§7.2–7.3 preservation of nice maps and iterated finite-p comparison | Multiplicative spectral K iteration and localization. |
| §§7.4–7.8 Morava/BP/truncated-sphere/A-theory applications | The coefficient spectra and A/K spectra. |
| §§8.2–8.3,8.5 rational-transfer, cobar and Galois descent | Linear motives, coherent spectral towers and transfer. |
| §§8.6–8.9 ko/tmf purity, supersingular descent and regular localization | ko/tmf and periodic variants, spectral K and coherent fixed points. |
| §§9.1–9.5 height-one truncation/excision/cdh/polynomial/KH | K(1)-local K, enhanced scheme K and KH. |
| §§9.6–9.7 TC obstruction and category-colimit counterexample | TC of rings and enhanced categories. |
| §10.1 chromatic additive-to-stable comparison | Additive/stable spectral K and chromatic localization. |
| §§10.2–10.5 sifted colimits and cyclic TC/K assembly | Ring-spectral K/TC and coherent orbit diagrams. |
| §§4.31–4.33 Hopkins–Mahowald/James Thom comparisons and acyclicity | Spectral units, multiplicative Thom colimits, Adams/Margolis comparisons. |
| §§4.18–4.21,4.30 uniform height locality and elliptic comparison | Oriented ring spectra, chromatic localizations and elliptic spectral sheaves. |
| §§6.2,4.34 chromatic field maps and ordinary unit detection | Chromatic E∞ fields, H∞ rings and spectral ordinary homology. |
| §8.4 even equivariant Morava free-complex construction | Morava spectra, semilinear modules and spectral coinduction. |

### Pin inspection and duplication by object

The content manifest and actual checkouts agree: Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`, Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The content checkout used for main-roadmap text has HEAD `794d0fcddfd32a8c6bb445faa33347cc578f43b0`. Object searches covered both pins for spectral rings, stable ∞-categories, Morava/Thom spectra, spectral K/NK/TC and telescopic constructions. Matches for algebraic prime spectra and tactic telescopes do not furnish those objects. The native declarations actually opened are:

| Pinned file and line | Declaration and observed scope |
|---|---|
| `Mathlib/AlgebraicTopology/Quasicategory/Basic.lean:41` | `SSet.Quasicategory`: inner-horn fillers; no stability, spectral enrichment or K. |
| `Mathlib/CategoryTheory/Idempotents/Karoubi.lean:43` | `CategoryTheory.Idempotents.Karoubi`: X, p:X→X, p≫p=p; ordinary categorical completion. |
| `Mathlib/CategoryTheory/Triangulated/TStructure/Basic.lean:54` and line 262 | `TStructure` and `bounded`; the latter is the intersection of objectwise existential upper/lower bounds, not one common amplitude. |
| `TauCeti/CategoryTheory/Exact/ExactStructure.lean:241` | `TauCeti.ExactStructure`: category, preadditivity, zero object and binary biproducts occur in its signature. |
| `TauCeti/Algebra/Category/ModuleCat/CartanMap/Basic.lean:222` and line 231 | `finiteProjectiveModulesExactStructure` and `_eq_split`: existing finite-projective exact structure and its split comparison. |
| `TauCeti/CategoryTheory/GrothendieckGroup/Split.lean:108` | `SplitK0` at line 114: binary biproducts, zero morphisms and essential smallness; relation [X⊞Y]=[X]+[Y]. |
| `TauCeti/CategoryTheory/GrothendieckGroup/Abelian.lean:74` | `AbelianK0` at line 79: abelian category and essential smallness; exact K₀. |
| `TauCeti/CategoryTheory/GrothendieckGroup/Triangulated.lean:130` | `TriangulatedK0` at line 139: preadditive, zero object, additive integer shifts, pretriangulated and essentially small. |
| `TauCeti/CategoryTheory/GrothendieckGroup/FiniteDimensionalVectorSpace.lean:148` | `TauCeti.SplitK0.finrankEquiv`, with `[Small k]`, identifies the existing split K₀ of `FGModuleCat k` with ℤ; its object formula follows at line 160. |

These are cited as supplied APIs, not redeclared. They do not give spectra whose integer homotopy groups are higher algebraic K, nor a coherent spectral-ring carrier. There are no local Lean names to collide with another roadmap's fully qualified declarations.

Ownership searches used the prescribed roadmap service over indexed main/open heads and object searches in the board packages, after reading the supplied board-package index. The relevant boundaries are: GeneralAlgebraicKTheory owns classical K/Nil/Bass; RefinedTraceMethods owns stable categorical K, trace and correction algebras; BordismFormalGroups owns p-local chromatic foundations; StableHomotopyKTheoryPartII PO.4 owns the general power operation; QWittVectors owns big Witt carriers; SchemeKTheoryOperations owns scheme K and its existing descent geometry. The retained variants are the spectral/additive comparisons, restricted acyclic invariants, non-inverted Witt/NK action, global p-inversion tower, and resulting purity/redshift results. EDS's D(R)≃Mod_HR comparison is not the general single-generator additive/stable theorem of §1.3.

The search also finds the downstream chromatic overlap at `packages/ChromaticHomotopyTheory/design/README.md:1225` and line 1701. This package explicitly owns the consumed chromatic groundwork and the specialized Thom acyclicity before its K applications; it introduces no upward citation. The earlier settled requirement to edit that separate design is not re-raised. Its eventual reconciliation is not claimed complete here.

### Supplier citations and direction

All 103 Needs lines were read. The following current section locations resolve the cross-roadmap citations; line numbers are those of the underlying roadmap README, without a service-output header. Main suppliers were checked against the supplied content checkout. The service versions of the five main files below were also compared byte-for-byte with that checkout and agree, despite the resolver's newer index-main identifier.

| Supplier | Resolved locations and consumed object |
|---|---|
| GeneralAlgebraicKTheory, head e0552fe | `TauCetiRoadmap/GeneralAlgebraicKTheory/README.md:627` (§§3.12–3.14); 1417/1549 (§§6.9/6.19); 1576 (products/transfers); 2117 (Nil); 2292 (Bass/nonconnective); 2849 (localization); 3188 (enhancement); 3236 (§§13.8a–c finite fields). |
| StableHomotopyKTheory, head 00bfbf7 | `TauCetiRoadmap/StableHomotopyKTheory/README.md:937` (acyclic plus), 1835 (spectral comparisons), 2098 (deloopings), 2134 (Waldhausen spectra), 2213 (Moore coefficients, completion and convergence). Space Postnikov §§3.18–3.21 belong to its plus-space layer. |
| StableHomotopyKTheoryPartII | `packages/StableHomotopyKTheoryPartII/design/README.md:739` and line 783: PO.4 degree-zero power operation and transfer ideal. Restriction gives x^p, not x; Young-subgroup transfers restrict to trivial-subgroup transfers for C_p. |
| EnhancedDerivedSheaves, main | `TauCetiRoadmap/EnhancedDerivedSheaves/README.md:211` (E0.4), 360 (E0.7), 1121 (E3.1), 1440–1569 (E5:abstract.1–4), 1597–1731 (E5:presentability.1–3). Coherent stability, modules, Ind, quotient/retract and action interfaces; multiplicative Postnikov classification is a declared extension. |
| RefinedTraceMethods, head 9dd2691 | `TauCetiRoadmap/RefinedTraceMethods/README.md:484` (§§2.1–2.17 action/THH/TC), 567 (fixpoint), 1721 (§4.6 motives), 1816 (§4.9 K), 1898 (§4.10 products), 1939–2256 (§§4.11–4.17 trace/DGM), 2257 (§4.18 correction/excision), 2309 (§4.19 C_p assembly), 2478 (§6.1 spectral étale lifts). |
| AInfCohomology, head b47987b | `TauCetiRoadmap/AInfCohomology/README.md:3815`, AI.7.2: shifted circle norm, bounded-below Tate-orbit and completed residual-circle comparison. The unreduced rational circle Tate is not zero; the completed value used in the contract is zero. |
| BordismFormalGroups, main | `TauCetiRoadmap/BordismFormalGroups/README.md:46` (F1–F3 formal groups/orientations/coefficient spectra), 555 (F6.1 localization), 586 (F6.2 nilpotence), 760 (F6.3 types/periodicity and Adams/Margolis inputs), 1248 (F6.4 smashing), 1526 (F6.5 coherent quotient/action interfaces). |
| GeneralizedCohomology, main | `TauCetiRoadmap/GeneralizedCohomology/README.md:211` (G2 spectra), 663 (G3 integer/Postnikov comparisons), 1246 (G4.5 orientations), 1512–1686 (G5 duality, Thom diagrams, KU/KO). |
| TopologicalKTheory, head 7575afa | `TauCetiRoadmap/TopologicalKTheory/README.md:816` (T4 Bott) and 1220 (T7.1 real comparisons). α²=4β, c(α)=2b² and c(β)=b⁴ retain their factors at 2. |
| HomotopySpheres, heads fb7c47e and 0b90c9b | `TauCetiRoadmap/HomotopySpheres/README.md:387`, 466, 509 at the former; 425, 602, 643 at the latter: §3B James filtration, §4B real Bott and §4C stable J. Both indexed entries are new-roadmap heads, not revisions of a main roadmap. The explicit reduced stable splitting remains a declared contract. |
| EllipticCohomology, head f0df48d | `TauCetiRoadmap/EllipticCohomology/README.md:55` (E1 moduli), 175 (E2 realization), 336 (E3 Otop/global spectra), 358 (E4 coefficients/discriminant), 742 (E5 units/orientation), 814 (E6 levels/actions). All-height realization, spectral affineness, precise Galois/supersingular and relative Thom refinements are declared gaps. |
| QWittVectors, head 2a7475f | `TauCetiRoadmap/QWittVectors/README.md:112–266`, §§1.1–1.6, including §1.4a at 203. The supplied comparison is γ=∏(1−a_dt^d)⁻¹; the requested χ is its ordinary-series inverse. Coordinate signs therefore differ by inversion; the non-inverted multiplication/ghost normalization is the residual interface requested here. |
| KTheoryLowDegrees, head d7c04da | `TauCetiRoadmap/KTheoryLowDegrees/README.md:159–208` and 1194: projective K₀, stable equality, change of ring and §13.1 Euler normalization. General nilpotent-ideal lifting remains a contract. |
| KTheoryFiniteLocalFields, head afe02e8 | `TauCetiRoadmap/KTheoryFiniteLocalFields/README.md:197–285` and 1344: coefficient/Brauer/completion refinements and §6.5a ordinary field étale K. Spectral-affine descent/detection and the spectrum-level algebraically closed comparison are the declared extensions. |
| SchemeKTheoryOperations, head 88dbd5a | `TauCetiRoadmap/SchemeKTheoryOperations/README.md:99–636`, 663–819, 1053–1142, 1401, 1445–1598: perfect models, support/localization, Nisnevich criterion, regular homotopy/Bass/blowups. The general localizing-invariant, abstract-blowup and KH/KV extensions are gaps. |
| AlgebraicTopology, main | `TauCetiRoadmap/AlgebraicTopology/README.md:499` and 1602: Stages 4 and 8, CW/cofibration and relative homotopy/Hurewicz/Whitehead inputs. |
| ModularCurves, main | `TauCetiRoadmap/ModularCurves/README.md:1510`, §7E: p-divisible groups and formal heights. |
| Ownership-only references | `TauCetiRoadmap/MotivicEtaleKTheory/README.md:673`, §7.2, is the Deligne-regulator comparison as the package says. `TauCetiRoadmap/HabiroRings/README.md:96` imports QWittVectors; it is not the Witt supplier. |

The prescribed dependency command returned exactly:

```text
depcheck: 52 roadmaps, 593 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. Internally Theorem A precedes the high trace comparison, which precedes the positive CMNN induction; its m=0 case uses Mitchell. Purity follows that induction, and the redshift lower-bound use of purity is later. The new twisted Thom target precedes its §7.8 consumer. The citation resolver reported no cross-roadmap citation or Lean name found nowhere; its unavailable pinned-library lookup was replaced by the manual pin inspection above.

### Declared supplier gaps

All 33 slugs have named suppliers and exactly matching needs sentences in `packages/GeneralAlgebraicKTheoryPartII/design/plan.json` and the README's Exact supplier contracts. None names `none`. They are coherent single constructions/theorems with the structure needed to use them, rather than unrelated bundled obligations. Existing carrier results are imported; the residual extensions below are not silently treated as implemented. The controls also check that their hypotheses admit the intended objects.

| Slug(s) | Supplier and residual obligation; computed control |
|---|---|
| witt-characteristic-series | QWittVectors §1.3: non-inverted χ with its transported multiplication/ghost normalization; χ(0)=1, χ(1)=1−t and −tχ′/χ for τ(a) has coefficient aⁿ. The existing §1.4a inverse-series comparison is compatible. |
| multiplicative-postnikov | EnhancedDerivedSheaves E5:abstract.2: coherent E₁ Postnikov pullbacks and classification; for Hk⊕ΣHk, stages 0 and 1 are Hk and the original ring, with fiber ΣHk. |
| nilpotent-kzero | KTheoryLowDegrees §1.2: arbitrary two-sided nilpotent lifting, beyond stable equality; ℤ/9→𝔽₃ has K₀ map ℤ→ℤ, 1↦1, and (3)²=0. |
| tc-mod-p-cyclotomic-colimits | RefinedTraceMethods §2.10: small colimits on connective underlying cyclotomic spectra; empty diagram gives 0 and TC(0)/p=0. |
| tc-mod-p-ring-sifted-colimits | RefinedTraceMethods §2.10: the connective-ring consequence; constant simplicial A realizes to A on both sides. |
| thh-all-cyclic-assembly | RefinedTraceMethods §2.10: cyclotomic assembly for every discrete group; for G=ℤ the full family contains terminal G/G and gives identity, unlike the finite-cyclic family. |
| tc-z-k1-nonzero; tc-z-inverse-p-vanishing; k1-tc-filtered-colimits | RefinedTraceMethods §§4.17/2.10: three separate value/continuity statements; at p=2,3 the stipulated source is nonzero and p-completed inverted target is 0; constant filtered ℤ gives identical local TC values. |
| linear-weak-additive-motives; linear-motive-tensor-unit; linear-motive-kzero-unit; linear-motive-projection-formula | RefinedTraceMethods §§4.6/4.10: accessible weakly additive A-linear motives and the three specified structures. U(0)=0; U(C⊕D)=U(C)⊕U(D); unit tensor U(C)=U(C); [A²]↦2; rank-2 extension and rank-3 tensor give 6 on both projection-formula sides. |
| spectral-etale-descent; spectral-strict-henselian-detection | KTheoryFiniteLocalFields §6.5a: spectral refinements with D₀=Hℚ; the 𝔽₄/𝔽₂ and zero-ring computations above verify the corrected bottom convention and nonvanishing hypothesis. |
| suslin-algebraically-closed-comparison | KTheoryFiniteLocalFields §6.5a: the spectrum comparison with ku^∧p; for algebraically closed characteristic-zero L, completed π₀=ℤ_p and π₁=0, agreeing with ku^∧p. |
| localizing-nisnevich-descent; localizing-derived-blowup | SchemeKTheoryOperations §§4.12/5.7: arbitrary localizing invariants of Perf, beyond the existing geometric criterion/regular blowups; E(∅)=0, identity cover totalizes to E(X), unit-ideal blowup is X with empty exceptional locus. |
| abstract-blowup-noetherian-approximation; abstract-blowup-platification-domination | SchemeKTheoryOperations §5.7: finite-presentation approximation and dense-open domination; a noetherian identity square descends to itself, and the unit ideal gives the identity dominating blowup. |
| kh-simplicial-model; kh-regular-comparison; kv-relative-comparison; kh-nilpotent-invariance | SchemeKTheoryOperations §§5.2/5.6: KH realization, regular comparison, uniformly bounded relative spectral sequence and arbitrary nilpotent-ideal invariance. A[Δ⁰]=A, A[Δ¹]=A[t]; K₀(k)=KH₀(k)=ℤ; identity relative spectrum and every term are 0; ε²=0 and KH(k[ε]/ε²)=KH(k) while the integral NK₁ symbol is nonzero. |
| stable-james-splitting | HomotopySpheres §3B: reduced stable splitting compatible with word filtration; *=0 and S² gives summands in degrees 2,4,6,…; disconnected S⁰ would give ℕ versus ℤ. |
| all-height-morava-realization | EllipticCohomology E2: every finite height with marking and coherent action; height 1 has zero deformation parameters, height 3 has two. |
| elliptic-spectral-affineness | EllipticCohomology E3: symmetric monoidal QCoh/Mod equivalence and colimits; tensors by S and 0 give ΓOtop and 0 on both sides. |
| elliptic-level-three-galois; elliptic-supersingular-at-two; elliptic-supersingular-at-three | EllipticCohomology E6/E2: the particular Galois/equivariant identifications; group orders 48 and 24, residue orders 4 and 9. The 3-inverted level object has K(2) value 0 at 3, so the two prime contracts cannot be interchanged. |
| spectral-units-and-lines; relative-thom-colimit; multiplicative-thom-refinement | EllipticCohomology E5: relative units/lines/colimit and E_n refinement; π₀GL₁Hℤ={±1}, excluding 2; a point with its trivial line gives R, empty source gives 0, constant line on X gives R⊗Σ∞₊X; the unit loop map gives the original algebra R. |

No gap is counted as a defect merely because its implementation is absent. The JSON records all 33 conditions explicitly.

## Not verifiable

- No required text was unreadable, and no new reference request is needed. Source verification is of the specified locators, hypotheses and proof inputs; it does not claim to re-prove entire papers. The unchanged computed rows retained from the preceding review are identified above.
- The roadmap service's declaration resolver could not inspect pinned Lake packages. The direct pinned-file inspection and successful Lean elaboration supplied that part of the review instead.
- Supplier-gap implementations do not exist as an assembled library at these pins. Acceptance is conditional on their precise contracts, not on an assumption that their implementations were tested.
- Ownership against the supplied indexed open heads was checked. The unresolved reconciliation of downstream ChromaticHomotopyTheory's design is external to this package and remains the previously settled limitation.

## Source issues

- **Error** in lmmt at Redshift Theorem and Nullstellensatz application, introduction, printed p.1014 (lmmt line 172 through line 186): the source says every globally nonnegative-height commutative ring redshifts; it should require nonzero rationalization at height zero under T(0)=S[1/p]; affects a stated result.
- **Misprint** in lmmt at Remark 3.11, printed p.1026 (lmmt line 747): the source says stabilized relative K has value ΩM; it should give ΣM, equivalently ΣTHH(S;M); affects nothing.
- **Gap** in lmmt at proof of Proposition 3.6, printed p.1023 (lmmt line 621 through line 623): the source invokes discrete torsion-coefficient vanishing while mentioning only height one; it should supply the K(ℤ/pʳ)-module argument at every required positive height; affects the proof.
- **Error** in akq at §2.1, manuscript p.5 (akq line 199 through line 203): the source identifies the integral connected-cover sign Thom spectrum with Hℤ; it should identify its 2-localization with Hℤ_(2); affects a stated result.

These are the inherited source issues rechecked where used here. The package accounts for them. The witnesses are respectively the one-periodic characteristic-two Tate ring at odd p, the degree-one class of ΣHA, the all-height module action, and the odd-prime sphere retract. No published correction was established in this review.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "f0cf796419574218f8ebb11ecd8a00a717b118d2", "job": "REV-PKG-GeneralAlgebraicKTheoryPartII~3", "model": "gpt-6-astra", "worker": "chris-12"} -->
