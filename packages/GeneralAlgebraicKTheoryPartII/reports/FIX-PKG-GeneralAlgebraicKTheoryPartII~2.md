# Repair report: GeneralAlgebraicKTheoryPartII

## F01 (P1) — applied

ΩM → ΣM in the optimality Check and proof route, now §6.6. The stabilization is written explicitly and imports RefinedTraceMethods §4.15. For M=HA, its degree-one group is A and its degree-zero group is zero. Evidence: lmmt line 745–747 has the shift misprint; the supplier states the suspended THH derivative.

## F02 (P2) — applied

Integral Hℤ equivalence → Hℤ_(2) after 2-localization in §4.31 and its route. The unlocalized π₀=ℤ Check remains, explicitly distinguished from the equivalence. Added the odd-prime sphere-retract control; §4.32 and §7.8 retain Hℤ_(2). Evidence: akq line 199–203; thom line 816 and line 847.

## F03 (P2) — applied differently

Unspecified E₂ → the supersingular formal group over 𝔽₄ or 𝔽₉, with its specified action. At 2 use the localized level-three Galois extension. At 3 use the semilinear curve/field action: TMF(3) inverts 3 and cannot model E₂ there. Added this negative control. Evidence: lmmt line 1006–1010 and line 1037–1044.

## F04 (P2) — applied

The proof-dependent restriction i≤n → vanishing for every discrete associative ℤ/pʳ-algebra and every i≥1. Updated §4.42’s hypotheses, route and Checks; the K(ℤ/pʳ)-module argument uses RefinedTraceMethods §4.10. For 𝔽₃[ε]/ε², height 2 vanishes without an auxiliary n. Evidence: lmmt line 586–589 and bgt-mult line 1022–1031.

## F05 (P2) — applied

The p-local kernel/smashing theorem and BP-inversion/E(n) identity → explicit BordismFormalGroups F6.3 imports. Sections 4.6 and 4.17 retain the global p-primary kernel and truncated-theory class identities. Their Needs and supplier contracts agree. Evidence: TauCetiRoadmap/BordismFormalGroups/README.md, F6.3, class identity and finite-localization paragraphs; ravenel line 401.

## F06 (P2) — applied

The general construction and API for P → StableHomotopyKTheoryPartII PO.4 imports, restricted from BΣ_p to BC_p. Section 4.26 retains the Morava transfer generator, quotient and zero detection. Updated scope, supplier contract and Needs. Evidence: packages/StableHomotopyKTheoryPartII/design/README.md, PO.4, Degree-zero power operation and The transfer ideal for a prime power operation.

## F07 (P2) — applied

Unowned use of May’s general theorem → Hahn at every prime, followed by BordismFormalGroups F6.3’s nilpotence including height ∞. Section 4.27 now states the H∞ generality supported by its D_p proof, preserving §4.34’s generality. Updated §8.2’s route and the Lean documentation. Evidence: hahn line 22–36; hopkins-smith line 89–96.

## F08 (P2) — applied differently

Eight compound gaps → 27 single-result contracts, leaving six other gaps unchanged: 33 total. README, consumers and plan gaps agree. Derived-blowup descent is requested for localizing invariants, rather than categorical descent for arbitrary abstract blowups; spectral descent/detection use Yuan’s exact quantifiers. Evidence: lt line 1481–1489, line 1534–1545; yuan line 310–327.

## F09 (P3) — applied

Six RefinedTraceMethods interface blocks → that supplier’s heading; AInfCohomology retains its circle-Tate contract. Fixed malformed titles and capitalization, deleted the two specified redundant Checks, and supplied the products/module/projection-formula API with three Checks. Evidence: RefinedTraceMethods §§4.9–4.10 and 4.18; AInfCohomology §AI.7.2; bgt-mult line 1022–1031.

## F10 (P3) — applied

Misnamed labels → verified section names throughout §§4.13, 4.22, 4.36, 6.3, 6.5, 8.2, 8.5, 8.9 and 9.5 and layer dependency paragraphs. Replaced fictitious Layer-4 supplier/field-map labels by actual targets or supplier sections; KH uses its split contract. Every internal Layer-6 reference follows the renumbering in F11.

## F11 (P3) — applied

Chromatic field maps moved from §6.7 to §6.2. Former §§6.2–6.6 become §§6.3–6.7. Redshift now follows its field-map input. Updated internal Needs and source-manifest cited_for sections; foreign roadmap sections retain their original numbers. No layer was reorganized beyond this subsection move.

## F12 (P3) — applied

Three unused source entries → explicit citations and References: Hopkins–Smith in §4.4, Mathew–Meier in §4.30, Goerss in §8.8. Their manifest cited_for entries name those consumers. Evidence: hopkins-smith line 89, line 129, line 166; mm line 1729–1732; goerss line 688–695. No source entry was deleted.

## F13 (P3) — applied

Height-one and classical-localization references now explicitly identify their secondary attribution to Mahowald–Miller, Blumberg–Mandell and Barwick–Lawson. Added published pages throughout the affected Layer-4 LMMT citations, including §4.8 p.1018 and Theorem A pp.1012–1013; aligned the manifest. Evidence: lmmt line 71, line 101, line 362, line 987 and line 1045.

## F14 (P3) — applied

Unqualified finite type-m examples → finite p-local reduced suspension spectra in §§4.33 and 7.7, with the mod-3 Moore negative control. Section 8.9 now states the two integral connective fiber sequences and identifies all arrows; no unspecified coefficient localization remains. Evidence: lmmt line 987–990 and line 1045–1048.

## F15 (P3) — not actionable in this package: other packages must change their ownership and dependencies

Recorded this package’s ownership in scope and the required CH.3–CH.6, CH.8–CH.10, CH.12–CH.13 imports downstream. Repointing ChromaticHomotopyTheory’s design and StableHomotopyKTheoryPartII’s CH dependencies requires edits outside this package. Both designs confirm the conflict. No supplier gap is appropriate: this package requires no input from the later ChromaticHomotopyTheory.

## F16 (P3) — applied

Added §4.22’s localized-norm/cofiber/module API. The Tau Ceti contract now cites SplitK0, AbelianK0, TriangulatedK0 and SplitK0.finrankEquiv, including categorical and universe hypotheses. Evidence: TauCeti/CategoryTheory/GrothendieckGroup/Split.lean:114, Abelian.lean:79, Triangulated.lean:139 and FiniteDimensionalVectorSpace.lean:148. All remain supplier facts; no degree-zero stand-in was added to Suggested.lean.

## Verification outcomes

- Elaboration of packages/GeneralAlgebraicKTheoryPartII/Suggested.lean from the pinned content checkout: exit 0, no output. Its only import is Mathlib; no Tau Ceti object build was needed.
- Mechanical declaration/binder audit: zero declarations, zero definitions, zero instances. The required list of `#check @name` commands is empty; there are no elaborated binders to compare or change. The documentation still identifies all 31 headline groups and missing carriers; the H∞ and unit-detection descriptions now match the README.
- Dependency check, with the requested name, order and movable mode: exit 0. Exact output:

```text
depcheck: 49 roadmaps, 565 edges, 0 problem(s)
```

- There was no UPWARD, CYCLE or moved line for this package.
- Citation resolution: exit 0; no cross-roadmap citation or Lean name found nowhere, against main 4aeb1cc and the 353 indexed open heads. Its tool-side library check was unavailable; the declarations were separately inspected at the supplied local pins.
- The pins read from lake-manifest.json are Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. Inspected the quasicategory, Karoubi, TStructure/bounded, exact-structure and Grothendieck-group definitions at those pins. The ordinary Bousfield category-localization files provide no spectral reflector; ordinary K₀ provides no K-spectrum.
- All 33 gap definitions match their plan entries in slug, supplier, section and needs; every gap reference resolves. Parsed plan equality outside its top-level gaps is exact. All 30 source entries remain certified and are cited in References. No additional text was needed or fetched; no missing-reference request was added.
- Git whitespace check passed. Only the four permitted content files and this report changed; metadata.toml is unchanged. No gate failures were supplied in the brief. The external ownership conflict is reported above and is not declared resolved by this package.

## Ownership and citation audit

Read TauCetiRoadmap/OptimalTransport/README.md and TauCetiRoadmap/ComplexTori/README.md for upstream shape. Used roadmaps grep on the chromatic localization, power-operation and nilpotence objects, together with board-package searches. Read the relevant source passages myself; no helpers were used.

Resolved supplier snapshots by roadmaps show for GeneralAlgebraicKTheory, StableHomotopyKTheory, EnhancedDerivedSheaves, RefinedTraceMethods, AInfCohomology, BordismFormalGroups, GeneralizedCohomology, TopologicalKTheory, HomotopySpheres, EllipticCohomology, QWittVectors, KTheoryLowDegrees, KTheoryFiniteLocalFields, SchemeKTheoryOperations, MotivicEtaleKTheory and ModularCurves. Inspected the cited sections and the board copy of RefinedTraceMethods. StableHomotopyKTheoryPartII was absent from main/open-head show results; its supplied board design contains the exact PO.4 contracts and is earlier in merge order. Its construction is imported, not invented here. Ownership against indexed open roadmap heads was checked; no additional open work was sought outside the supplied index.

BordismFormalGroups remains owner of p-local finite localization and BP-inversion classes. StableHomotopyKTheoryPartII remains owner of general degree-zero powers. EllipticCohomology, HomotopySpheres, RefinedTraceMethods, SchemeKTheoryOperations and KTheoryFiniteLocalFields receive the explicit missing supplier contracts rather than duplicate constructions. This package retains the global and truncated variants and the H∞ Hahn consequence needed for its existing unit-detection target. ChromaticHomotopyTheory’s later design must import those targets. Its CH.9/CH.13 uses from StableHomotopyKTheoryPartII require a human ownership/dependency decision outside these edits.

## Adversarial mathematics pass

Values below use the README’s actual grading, localization and universe conventions. A zero denotes the zero spectrum/group as appropriate. These computations test statements and their APIs; source proofs, rather than the boundary computations, justify the general theorems. Section numbers are the final numbers.

| Statement | Instances tried | Values computed on the two sides | Result | Change |
|---|---|---|---|---|
| Restriction and transfer convention | identity; finite free rank 2 | [R²] maps to 2[R]; [B] maps to 2[R] | agrees | none |
| Homological shifts and connectivity | k→0→Σk; S¹→* | 0=1+(−1) in K₀; fiber S¹ has π₀=0 | agrees | none |
| Connective mapping convention | X=ΣHk,Y=Hk | π₋₁Hom=k; π₋₁hom=0 | distinguishes | none |
| Bottom detector and height | p=2, HF₃; zero ring | S[1/2]⊗HF₃=HF₃, Hℚ⊗HF₃=0; ht(0)=−1 | distinguishes | none |
| Witt series convention | χ(0),χ(1); 1−rt and ν²=0 | 1,1−t; action 1−rνx, evaluation at zero 1 | agrees | none |
| Cobar/transfer normalization | trivial degree-two torsor | transfer(a,b)=a+b; transfer(1/2,1/2)=1 | agrees | none |
| 0.1 Compact localization | q=id; q:D→0 | fibers 0 and K(D^ω), respectively | agrees | none |
| 1.1 Plus comparison | Hℤ; Hk⊕ΣHk | π₀GL₁(Hℤ)={±1}; π₁GL₁ of latter=k | agrees | none |
| 1.2 Additive K | vector spaces over k; zero category | dimension gives π₀=ℤ; zero gives 0 | agrees | cited native K₀ |
| 1.3 Morita | X=A; X⊕X | Hom(A,A²)=A² as right A-module; End(A)=A | agrees | none |
| 1.4 A-theory | X=*; X=S¹ | loop rings S and S[ℤ]; unit/augmentation composite=id | agrees | none |
| 2.1 Restricted truncation | M⊗R=0; zero invariant | M⊗N=(M⊗R)⊗_RN=0; F=0 gives 0→0 | agrees | none |
| 2.2 Excision/nilinvariance | identity-side square; k[ε]/ε²→k | correction=A′; ε²=0, invariant fiber=0 in the stated acyclic domain | agrees | none |
| 2.3 Coefficient truncation | identity; Λ=ℤ/p on ℤ[1/p]-algebras | coefficient fibers 0; both coefficient inputs 0 | agrees | none |
| 2.4 Nonpositive comparison | Hℤ; Hk⊕ΣHk | K₀=ℤ and K₋₁=0 on each side | agrees | none |
| 3.1 Bounded t-structure | Hk,ΣHk in Perf(k) | amplitudes [0,0] and [1,1]; heart classes 1 and −1 | agrees | none |
| 3.2 Stable envelope | Projω(Hk); stable Perf(k) as additive | first envelope Perf(k); additive π₀ of second ⊕_(j∈ℤ)ℤ, stable π₀=ℤ | distinguishes | none |
| 3.3 Heart theorem | Perf(k), heart finite-dimensional k-spaces | K₀=ℤ on both sides; K₋₁=0 | agrees | capitalization |
| 3.4 Regular devissage | Hk[u], degree(u)=2, invert u | cofiber of u is Hk; its K₀ class 1−1=0 | agrees | none |
| 3.5 Finite-limit envelope | zero category; k→0→Σk | zero envelope; relation 1+(−1)=0 | agrees | none |
| 3.6 Bounded-heart fiber | Perf(k); zero category | e_j maps to (−1)^j; e₀+e₁ maps to 0; zero fiber 0 | agrees | none |
| 4.1 Telescopes | nilpotent v; v and v²; p=2, HF₃ | Tel(v)=0 if v nilpotent; v² has same cofinal colimit; HF₃[1/2]=HF₃ | agrees | pages |
| 4.2 Periodic groups | point; Σ^rHF_p; HF_q with q≠p at height zero | 0; positive periodic groups 0; π₀ after p-inversion=𝔽_q | agrees | pages |
| 4.3 Detection and completion | Hℚ; Hℤ at positive height | positive periodic groups 0; Hℚ_p^∧=0 but Hℚ[1/p]=Hℚ | distinguishes bottom | pages |
| 4.4 Ring acyclicity | HF_p; HF_q with q≠p | T(n) and K(n) give 0 for n≥1; bottom gives HF_q versus 0 | agrees in range | source attribution |
| 4.5 Finite towers | n=0; S/q,q≠p | L₀^fS=Hℚ; L₀^(p,f)S=S[1/p]; S/q maps to 0 versus S/q | distinguishes | pages |
| 4.6 Global kernel | n=0, S/p and S/q | global p-finite localization gives 0 and S/q | agrees | p-local part imported |
| 4.7 p-local comparison | S_(p); HF_q,q≠p | first bottom values both Hℚ; second values HF_q and 0 | agrees only with hypothesis | pages |
| 4.8 Fracture | m=0,n=1, X=HF_q,q≠p | left column HF_q, right column 0; pullback=HF_q | agrees | p.1018 |
| 4.9 Bottom comparison | Hℚ; HF₃,p=2 | comparison targets Hℚ and HF₃ after p-inversion | agrees | pages |
| 4.10 Finite periodic functor | finite Postnikov object; v versus v² | periodic colimit 0; reindexing doubles degree with identical colimit | agrees | none |
| 4.11 Bousfield–Kuhn | Hℤ; T(n),n≥1 | first localized value 0; second L_T(n)T(n)≠0 | distinguishes | none |
| 4.12 Suspension-loop detection | Hℤ; Σ⁻¹Hℚ | T(n)Hℤ=0 but Σ∞Ω∞Hℤ has sphere summands; Ω∞Σ⁻¹Hℚ=* | excludes stronger variants | pages |
| 4.13 Covers | S³→K(ℤ,3); replace ℤ by ℤ_p | fiber π₂=0 versus ℤ_p/ℤ | distinguishes | supplier label/pages |
| 4.14 Fiberwise homology | identity; ∅→* | E→E; 0→E, latter fails unless E=0 | agrees | pages |
| 4.15 Connective periodic bound | n=1,2 | sharp connectivity bounds n+1=2,3 | agrees | capitalization/pages |
| 4.16 Preservation | identity connective map; Hℤ→0 | fiber 0 meets every bound; Hℤ fiber has π₀=ℤ, fails bound 2 | agrees | pages |
| 4.17 Truncated classes | n=0,1; smash HF_p | BP⟨0⟩=Hℤ_(p); BP⟨1⟩⊗HF_p≠0 while E(1)⊗HF_p=0 | retains HF_p summand | inverted class imported |
| 4.18 Uniform height locality | multiplicative/additive formal groups | heights 1 and ∞; [p] on additive characteristic-p group=0 | excludes missing bound | pages |
| 4.19 Localized comparisons | Hℚ at n=1; L₁S at n=2 | upper T(1), respectively T(2), smash values 0 on both sides | agrees | pages |
| 4.20 Height-one equality | p=2,3, Hℤ and KU_p^∧ | both detectors kill Hℤ; both detect KU_p^∧≠0 | agrees | secondary attribution |
| 4.21 BP support | p=2, BP⟨1⟩→E(1) | rational π₋₂ is 0→ℚ; positive T(1) comparison holds | excludes rational equivalence | none |
| 4.22 Local norm | G=1; rational X, trivial C₂-action | norm=id with cofiber 0; π₀ norm=×2, inverse ×1/2 | agrees | API and supplier label |
| 4.23 Transfer section | rational localization, C₂,C₃ | composites 2·(1/2)=1 and 3·(1/3)=1 | agrees | none |
| 4.24 Telescopic Tate | KU_p^∧, trivial C_p | raw π₀=ℚ_p(ζ_p)≠0; its T(1)-localization=0 | distinguishes raw/local | none |
| 4.25 Blueshift | n=1; X rational or zero | raw Tate=0; target bottom reflector is p-inversion | permits extra drop | pages |
| 4.26 Morava power quotient | p=2,3,x=2; height 3, k=1 at 2 | restriction 4,8 versus 2; differences 2,6; g₂(0)=u₂ modulo (2,u₁) | agrees | general operation imported |
| 4.27 Hahn and H∞ variant | HF_p; Hℚ; height-one x=0,m=0 | all finite K(i) of HF_p=0; K(0)Hℚ≠0,K(1)Hℚ=0; 1·x=0 and x¹=0 | agrees | H∞ form and route |
| 4.28 Height | 0, HF_p, Hℚ, HF_q(q≠p) | heights −1,−1,0,0 | distinguishes p-inversion | page |
| 4.29 Tate converse | rational R, i=0; E₁,i=1 | rational Tate=0 and all positive T(j)R=0; T(1)-local Tate of E₁=0 and T(2)E₁=0 | agrees | none |
| 4.30 Modular bounds | tmf→Tmf; Δ²⁴ | connective-cover fiber has positive T(n) value 0; degree(Δ²⁴)=24·24=576 | agrees | mm attribution |
| 4.31 Thom comparison | p=2; sign twist at 3; connected covers | 1−2=−1; π₀ values ℤ₂,ℤ,ℤ_(2); odd-local Thom has π₃ containing ℤ/3, Hℤ_(3) has 0 | excludes integral equivalence | 2-local statement and Check |
| 4.32 Filtered Thom rings | m=0,1 at 2 | π₀y(0)=ℤ₂; π₀y(1)=𝔽₂; π₀z(1)=ℤ_(2); colimit z has same π₀ | agrees | split gap references |
| 4.33 James acyclicity | W=*; W=S²; mod-3 Moore summand at p=2 | reduced sum 0; S² gives rational classes in degrees 2r; Moore summand after 2-inversion=ΣS/3≠0 | negative control excludes wedge | p-local finite hypothesis |
| 4.34 Unit detection | Hℚ; HF₂; zero | Hℚ detects itself; HF₂ has K(n) value 0 for finite n but π₀(HF₂⊗HF₂)=𝔽₂; zero detected as 0 everywhere | height ∞ necessary | Hahn/nilpotence route |
| 4.35 Nonpositive nilinvariance | ℤ/9→𝔽₃ | K₀:ℤ→ℤ identity; K₋₁:0→0 | agrees | none |
| 4.36 Witt action | ν²=0, 1−rt; series 1 modulo t² | action [1−rνx]; higher terms evaluate to 1 because (νx)²=0 | agrees | owner label/capitalization |
| 4.37 Nil localization | ℤ[1/2][ε]/ε²; 𝔽₂[ε]/ε²; ℤ/9 | ×2 invertible in first; (1+εx)²=1 in second; relative units {1,4,7} have order 3 | agrees | precise KV/KH contracts |
| 4.38 Connective invariance | identity; n=1,m=2 | relative fiber 0; numerical bound N=m−1=1 | agrees | none |
| 4.39 Replacement connectivity | identity side; m=n=0 | correction fiber 0; general bound m+n+2=2 | agrees | capitalization |
| 4.40 Finite Postnikov stage | HA; k=0,1 | τ≤0HA=τ≤1HA=HA; both comparisons=id | agrees | none |
| 4.41 Restricted truncation | HF₂,p=2; HF₃,p=3 | L_n^(p,f)HF_p=0; positive T(i)K(HF_p)=0 | agrees | none |
| 4.42 p-power algebra vanishing | ℤ/4,ℤ/9; 𝔽₃[ε]/ε²,i=2; A=0 | K₀=ℤ in first two; all indicated positive telescopic K values 0, including i>1 | agrees without auxiliary n | statement/route/Checks |
| 4.43 Acyclic categories | zero category; Perf(HF_p) | all endomorphism detectors 0; corresponding positive K detectors 0 | agrees | none |
| 4.44 Compact kernel | A=S,n=0 | S/p localizes to 0; S/q,q≠p, localizes to S/q | agrees | none |
| 4.45 Mitchell | i=2 and i=1 | L_T(2)K(ℤ)=0; L_T(1)K(ℤ)≠0 | separates range | none |
| 4.46 Theorem A | A=0; A already local | maps 0→0 and K(A)→K(A) identity | agrees | theorem pages |
| 5.1 Connective cover | A=KU,n=2 | τ≥0KU=ku; T(2)-local relative K fiber=0 | agrees | none |
| 5.2 High trace | zero ring; periodic KU | all zero for first; connective trace input ku in second | agrees | none |
| 5.3 Genuine transfer | trivial group; C_p | first transfer=id; restriction after induction is multiplication by p on K₀ | agrees | none |
| 5.4 CMNN base | n=2 | L₀^(p,f)S=S[1/p]; L_T(2)K(S[1/p])=0 | agrees | none |
| 5.5 Purity | A=HF_p,n=1 | both adjacent detectors kill A; localized ring 0; L_T(1)K(HF_p)=0 | agrees | none |
| 5.6 Nilpotent K/TC | ℤ/4→𝔽₂ | kernel square=0; relative K₁ has order 2; positive telescopic relative values 0 | agrees | capitalization |
| 6.1 Upper bound | HF_p; Hℚ; E₁ | input heights −1,0,1; K height bounded by 0,1,2 | agrees | none |
| 6.2 Field maps | E₁(L); Hℚ; HF_q,q≠p | identity; unital map to HL[u±1]; last rationalization=0, so no characteristic-zero unital field map | agrees | moved before consumers |
| 6.3 Yuan lower bound | E₁,E₂ at 2 and 3 | positive detector K values at T(2),T(3) respectively are nonzero | agrees | exact spectral gaps |
| 6.4 Height-zero lower bound | algebraically closed L, degree(u)=2 | torsion quotient class 1−1=0; output π₀=ℤ_p,π₁=ℤ_p | fixes cofiber suspension | exact Suslin gap |
| 6.5 Redshift | Hℚ; E₁; (HF₂)^tC₂ at odd p | heights 0→1,1→2; last input height 0 but rationalization 0 and K height ≤0 | excluded example remains excluded | references/order |
| 6.6 Optimality | M=HA; separated type-n M | π₁ΣHA=A,π₀ΣHA=0; π₋₁ΩHA=A; T(n)ΣM≠0 when T(n)M≠0 | fixes shift | derivative import/Check |
| 6.7 Graded redshift | E₁,n=1,2; Hℚ,n=0 p-local | nonzero pieces at (1,2); zero pieces at (2,3); rational piece nonzero matches K piece 1 | agrees | renumbered |
| 7.1 Nice maps | id_Hℤ; id_HF_p | first π₀ map=id_ℤ; second π₀=𝔽_p, not ℤ | discriminates predicate | none |
| 7.2 Iteration | id_Hℤ | π₀K(ℤ)=ℤ; negative groups 0; induced map=id | agrees | none |
| 7.3 Finite rings | ℤ/4,ℤ/9 | rational K=Hℚ; K₀ rank map=id_ℤ; all positive telescope values vanish | agrees | none |
| 7.4 Morava K coefficients | m=1 | allowed height set {0,1,2}; rational π₀ and π₁ of split output both ℚ | agrees | none |
| 7.5 Truncated sphere | r=0,1;i=2 | r=0 gives Hℤ; both T(2)-localized K values 0 | agrees | none |
| 7.6 BP localization | n=0, i=1 | coefficient map Hℤ_(p)→Hℚ; K(𝔽_p) fiber has T(1) value 0 | agrees | none |
| 7.7 A-theory | W=*; p-primary type m>n; mixed-prime Moore wedge | first map=id; every positive James summand detector=0 in second; third contains ΣS/3 after 2-inversion | distinguishes hypotheses | example qualification |
| 7.8 Thom K applications | m=1,2 at 2 | 0<i<m empty for m=1, equals {1} for m=2; π₀z=ℤ_(2), not 𝔽₂ | agrees | Hℤ_(2) model retained |
| 8.1 ε-enlargement | empty prime set; degree-2 denominator | F=0 allowed, giving original thick category; cleared denominator prime set {2} | agrees | none |
| 8.2 Rational generation | A=R=M=unit; degree-2 transfer | unit lift 1; cobar error 0; 2·(1/2)=1 rationally | agrees | unit-detection route/gaps |
| 8.3 Galois descent | trivial group; split torsor A→A×A | comparisons=id; transfer(1,0)=1 | agrees | motive contracts |
| 8.4 Even free complex | H=1; free twisted module rank d | X=S gives rank 1; k-dimension dord(H), a positive integer | agrees | none |
| 8.5 Morava transfer | H=1; supersingular groups at 2,3 | identity; group orders 48,24; nonzero Euler integer invertible in ℚ | agrees | corrected labels |
| 8.6 ko purity | A=ko; A=0; i=2,3 | Bott localization KO; height-2 comparison fiber 0; height-3 K value 0 | agrees | none |
| 8.7 tmf purity | A=tmf;i=2,3,4 | targets Tmf at 2, TMF at 3; height-4 K value 0 | agrees | none |
| 8.8 Supersingular action | p=2,3 | ord(GL₂(𝔽₃))=8·6=48; ord(G₂₄)=12·2=24; at 3 L_K(2)TMF(3)=0≠E₂ | excludes wrong level model | E₂/action/gaps/Check |
| 8.9 Integral localization | ko→KO; tmf→Tmf | both connective fibers Kconn(ℤ); their T(2)-localized value 0 by Mitchell | agrees | exact coefficients/arrows |
| 9.1 Height-one truncation | HF₂ at 2; HF₃ at 3 | 𝔽_p[1/p]=0; L_K(1)K(𝔽_p)=0; π₀ truncation identity | agrees | none |
| 9.2 cdh and excision | dual-number thickening; empty scheme; identity blowup | nilpotent square ε²=0; localized relative value 0; empty value 0; identity square pullback | agrees | geometric gap split |
| 9.3 Affine lines | A=S; A=0 | free commutative degree-2 summand Σ∞_+BΣ₂ differs from S; zero coefficients give 0 in both models | distinguishes | none |
| 9.4 Homotopy invariance | 𝔽_p[ε]/ε² | [1+εx] has evaluation 1, is nonconstant; localized Nil fiber 0 | agrees | none |
| 9.5 KH | regular field k; dual numbers | K(k)=KH(k); singular integral NK₁ contains [1+εx], localized value 0 | agrees | owner/correct gaps |
| 9.6 TC obstruction | p=2,3 | L_K(1)TC(ℤ)≠0; TC(ℤ[1/p])^∧p=0 | agrees | separate value gaps |
| 9.7 Category colimits | stages r=1,2; p-torsion union | stage L_K(1)TC values 0,0; union value nonzero | distinguishes rings/categories | separate continuity gap |
| 10.1 Additive/stable K | Perf(k); zero category | e₀+e₁ maps to 1−1=0; zero gives 0→0; T(2) comparison fiber 0 | agrees | none |
| 10.2 Sifted colimits | constant filtered/simplicial A | both colimits A; local subcategory colimit=L_T(n−1)(ambient colimit) | agrees | exact TC gap |
| 10.3 Orbit/assembly definition | 1,C₂,ℤ,S₃,Q₈ | terminal orbit present for first three, absent for last two; finite cyclic subgroups of ℤ only {1} | discriminates family | none |
| 10.4 TC assembly | cyclic groups; R=0 | terminal assembly=id; zero-ring assembly 0→0 even for nonabelian G | agrees | distinct assembly/colimit gaps |
| 10.5 Farrell–Jones | G=ℤ,R=KU; G=S₃,Q₈ | cyclic assembly=id; τ≥0KU=ku; noncyclic T(n)-localized assembly fibers 0 for n≥2 | agrees | none |

The split contracts are supplier obligations, not claims that the suppliers already state them. Their boundary tests are recorded separately so the extra precision introduced by the split is also tested.

| Statement / contract | Instances tried | Values computed on the two sides | Result | Change |
|---|---|---|---|---|
| Supplied exact-sequence API | C→C→0; split C→C⊕D→D | quotient 0; F(C⊕D)=F(C)⊕F(D) | agrees | moved to RefinedTraceMethods |
| Supplied perfect-module API | A=0; A=Hk, module A² | Perf(0)=0; module rank 2; K₀ class 2 | agrees | supplier heading |
| Supplied S-construction API | zero category; X→X⊕Y→Y | S₀=0; three faces Y,X⊕Y,X, giving [X⊕Y]=[X]+[Y] | agrees | duplicate Check deleted |
| Supplied suspension/nonconnective API | flasque category; Perf(k) | swindle gives [id]=0 and K=0; K₀Perf(k)=ℤ,K₋₁=0 | agrees | supplier heading |
| Supplied replacement API | identity square | A′⊗_A B=A; correction map=id_A; invariant square pullback | agrees | title/heading |
| Supplied external pairing | k²,k³; zero module | rank tensor 2·3=6; tensor with zero rank 0 | agrees | API added |
| Supplied coefficient action | A=R; A=0 | unit of K(R) acts by identity; zero K-spectrum has zero action | agrees | API added |
| Supplied projection formula | R→R; free rank 2 extension | id(N⊗M)=N⊗M; res(B⊗R²) has R-rank 4=2·2 | agrees | API added |
| Native SplitK0 | k⁰,k,k² | dimensions 0,1,2; biproduct relation 2=1+1 | agrees | pin cited |
| Native AbelianK0 | split short exact k→k²→k | relation 2=1+1, zero object class 0 | agrees | pin cited |
| Native TriangulatedK0 | k→0→Σk | relation 0=1+(−1) | agrees | pin cited |
| Native finrankEquiv | k²; virtual −[k] | images 2 and −1 in ℤ; inverse sends 1 to [k] | agrees | Small binder retained |
| Imported P_p and transfer ideal | ℤ,p=2,3; mod-p coefficient field | powers of 2 are 4,8; additive defects 2,6; transfer ideals (2),(3), and zero in 𝔽_p | agrees | imported PO.4 |
| gap:witt-characteristic-series | zero/unit; one Witt coordinate a | χ values 1,1−t; −tχ′/χ=Σ_(r≥1)a^r t^r for χ=1−at | agrees | unchanged |
| gap:multiplicative-postnikov | HA; Hk⊕ΣHk | τ≤0HA=HA; latter π₀=k,π₁=k and its τ≤0=Hk | agrees | unchanged |
| gap:nilpotent-kzero | ℤ/4→𝔽₂; ℤ/9→𝔽₃ | K₀ maps ℤ→ℤ are identity, despite relative unit groups ℤ/2 and ℤ/3 | agrees | unchanged |
| gap:stable-james-splitting | W=*; W=S²; W=S⁰ | reduced wedge 0; S² gives spheres S^(2r),r≥1; S⁰ gives ℕ versus ℤ on components | excludes disconnected input | unchanged |
| gap:all-height-morava-realization | height 1 multiplicative group; height 2 supersingular group | deformation parameter counts h−1=0,1; coefficient rings W(k),W(k)[[u₁]] | agrees | unchanged |
| gap:elliptic-spectral-affineness | Otop and its suspension | global modules Tmf,ΣTmf or TMF,ΣTMF; Γ(0)=0 | compatible with tensor/zero | unchanged |
| gap:tc-z-k1-nonzero | primes 2,3 | L_K(1)TC(ℤ) is nonzero in both cases; target is not 0 | retains prime 2 | split |
| gap:tc-z-inverse-p-vanishing | p=2,3,ℤ[1/p] | TC(ℤ[1/p])^∧p=0 in each case | agrees | split |
| gap:k1-tc-filtered-colimits | constant discrete 𝔽_p diagram | colimit=𝔽_p; L_K(1)TC(𝔽_p)=0 on both sides | applies to rings | split |
| gap:tc-mod-p-cyclotomic-colimits | empty diagram; constant THH(𝔽_p) diagram | empty colimit 0 and TC(0)/p=0; constant colimit unchanged | agrees | split |
| gap:tc-mod-p-ring-sifted-colimits | constant simplicial zero ring and 𝔽_p | realizations 0 and 𝔽_p; TC/p values equal to the constant values | agrees | split |
| gap:thh-all-cyclic-assembly | G=1,C₂,ℤ; R=0 | terminal orbit gives identity for all three groups; THH(0)=0 for arbitrary G | excludes finite-only family | split |
| gap:linear-weak-additive-motives | zero category; split C⊕D | U_A(0)=0; U_A(C⊕D)=U_A(C)⊕U_A(D) | weak additivity retained | split |
| gap:linear-motive-tensor-unit | C=Perf(A); zero category | unit⊗U_A(C)=U_A(C); unit⊗0=0 | unit fixed by actual category | split |
| gap:linear-motive-kzero-unit | A=k; classes [k] and [k²] | images identity and twice identity; zero class maps to 0 | excludes zero comparison | split |
| gap:linear-motive-projection-formula | A=B=k; B=k×k | identity formula; res(B⊗k k²) dimension 4=2·2 | preserves restriction direction | split |
| gap:spectral-etale-descent | identity cover of R; empty scheme | descent limit=value on R; empty value=0 | agrees | exact Yuan quantifiers |
| gap:spectral-strict-henselian-detection | R=E₁ over algebraically closed k; R=0 | π₀E₁=W(k), strict henselization at (p) unchanged, L_T(2)K(E₁)≠0; zero input has no prime and fails nonzero premise | nonzero premise necessary | exact Yuan quantifiers |
| gap:suslin-algebraically-closed-comparison | L algebraically closed, degree 0,1,2 | π₀=ℤ_p, π₁=0, π₂=ℤ_p on K(L)^∧p and ku^∧p | agrees | split |
| gap:localizing-nisnevich-descent | identity cover; empty scheme | value unchanged by identity Čech nerve; E(Perf(∅))=E(0)=0 | agrees | invariant-valued statement |
| gap:localizing-derived-blowup | regular sequence (x) in k[x] | Cartier blowup=id; square has equal horizontal values and pullback value E(k[x]) | agrees | derived-square qualification |
| gap:abstract-blowup-noetherian-approximation | blowup of A²_k at origin for noetherian k | approximating square can be itself; base-change map=id at all four vertices | agrees | split |
| gap:abstract-blowup-platification-domination | identity modification; a blowup itself | identity dominated by blowup of unit ideal; blowup dominated by itself with center unchanged | preserves support condition | split |
| gap:kh-simplicial-model | simplex degrees 0 and 1; A=0 | A[Δ⁰]=A; A[Δ¹]=A[t]; zero ring gives zero spectrum | agrees | split |
| gap:kh-regular-comparison | field k; ℤ | NK_i=0 for regular inputs; degree-zero comparison ℤ→ℤ identity | agrees | split |
| gap:kv-relative-comparison | identity ring map; nilpotent dual-number quotient | identity relative E¹ and abutment 0; nilpotent relative K_i=0 for i≤0 gives lower bound 1 | convergence hypothesis stated | split |
| gap:kh-nilpotent-invariance | k[ε]/ε²→k | KH relative=0 in every degree; integral relative K₁ contains 1+εk≅(k,+) | distinguishes K from KH | split |
| gap:elliptic-level-three-galois | p=2; deck group | 3 is invertible in ℤ_(2); group order (9−1)(9−3)=48 | correct level domain | split |
| gap:elliptic-supersingular-at-two | supersingular curve over 𝔽₄ | height 2 and one deformation parameter; action order 48; π₀E₂=W(𝔽₄)[[u₁]] | fixes field/action | split |
| gap:elliptic-supersingular-at-three | supersingular curve over 𝔽₉ | geometric order 12, field involution order 2, semilinear order 24; L_K(2)TMF(3)=0 | excludes wrong level | split |
| gap:spectral-units-and-lines | R=Hℤ; R=0 | unit components {−1,1} and singleton; trivial line is R in both cases | units rather than all elements | split |
| gap:relative-thom-colimit | constant line on *; constant line on S¹ | Thom modules R and R⊕ΣR; the zero ring gives zero | excludes forgetting source | split |
| gap:multiplicative-thom-refinement | trivial twist on *; on a loop group | first Thom algebra=R; multiplication on second induced by group multiplication, unit the identity component | product determined by actual loop map | split |
| Worked characteristic-zero field | HL[u], degree(u)=2 | [HL]=1−1=0; cofiber after completion has π₀=π₁=ℤ_p | agrees | none |
| Worked finite p-power rings | p=2,r=2; p=3,r=2 | K₀ ranks 1 and 1; finite-field K₁ orders 1 and 2, prime-to-p; completion positive groups 0 | agrees | all-height module consequence |
| Worked global height-zero boundary | odd p, R=(HF₂)^tC₂ | 2·id_K(R)=0; R[1/p]=R≠0; rationalization 0; positive p-telescope K values 0 | excludes unrestricted redshift | none |
| Worked cyclic assembly | G=ℤ; G=S₃ | ℤ has terminal cyclic orbit and assembly=id; S₃ has cyclic subgroups of orders 1,2,3 and no terminal orbit | distinguishes indexing families | none |

## Maintainer consequences

No Lean declaration was added, deleted or renamed. Internal README section numbers changed as follows: old §6.7 → §6.2; old §§6.2–6.6 → §§6.3–6.7. Downstream citations to those sections need the corresponding adjustment. The source manifest follows the new numbering.

The eight old compound gap slugs are replaced; their 27 successors are listed under Exact supplier contracts and in the plan. Consumers in §§4.31–4.32, 4.37, 6.3–6.4, 8.2–8.3, 8.8, 9.2, 9.5–9.7, 10.2 and 10.4 name the relevant successors. Six other slugs are unchanged. Supplier authors must satisfy the missing contracts; their texts were not modified here.

The ChromaticHomotopyTheory and StableHomotopyKTheoryPartII design conflict needs the external decision described in F15. This package neither consumes ChromaticHomotopyTheory nor edits the merge order. No commit, push, pull-request edit or external message was made.
