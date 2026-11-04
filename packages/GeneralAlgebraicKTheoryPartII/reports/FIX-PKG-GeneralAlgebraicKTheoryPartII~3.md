# GeneralAlgebraicKTheoryPartII repair report

## F01 (P1) — applied

Global T(0) in the two spectral étale contracts → D₀=Hℚ, D_n=T(n) for n≥1, in README and the matching top-level plan gaps. Added finite-field descent and strict-henselian Checks. Evidence: yuan line 310 and yuan line 326; its rational bottom convention is also visible at yuan line 405. §6.3 uses only positive height.

## F02 (P1) — applied

Unowned twisted Thom acyclicity → explicit §4.32 targets, including the odd-prime Adams vanishing line, convergence, periodic-action argument and prime-two Margolis comparison. §7.8 now consumes §4.32 directly. Added range/slope Checks and updated the Lean missing-carrier description. Evidence: lmmt line 948, lmmt line 954, lmmt line 973 and akq line 632. No upward supplier was added.

## F03 (P2) — applied

Ambient E∞ endomorphism algebra → B=Hom_(C/J)(1,R), with multiplication induced by R, in §§4.34 and 8.2. Its vanishing nullifies the unit, and the unital law nullifies id_R. Added the ℚ×ℚ matrix comparison in both sections. Evidence: cmnn20 line 807. The rational-transfer theorem's hypotheses and conclusion are unchanged.

## F04 (P3) — applied

Both fixpoint citations §2.4 → §2.3; the exact supplier contract, §5.4 Needs and Layer 5 Dependencies now explicitly include RefinedTraceMethods §4.19. Added the p−1 assembly-cofiber summand test, retaining connective input and p-completed coefficients. The supplied head places the fixpoint lemma in §2.3 and “The TC assembly map for C_p” in §4.19.

## F05 (P1) — applied

Square-zero Witt evaluation 1+a₁νx → 1−a₁νx in the supplier example. Added a characteristic-three unit-action Check in §4.36. Conventions, the characteristic-series contract, §4.36's API and Layer 4 Examples use the same negative-product convention. Evidence: weibel line 49 and weibel line 221. The prime-two inverse-series Check remains valid.

## F06 (P3) — applied

§6.7's Lemma 2.3 locator p.1016 → p.1017. The other occurrence in §4.4 already has p.1017; no positive-height hypothesis changed. Evidence: lmmt line 299 marks the printed page and lmmt line 316 states the lemma. The H𝔽_q height-zero separator remains in §§4.1, 4.4 and the conventions.

## F07 (P3) — applied

Preparation-history clause → edition and mathematical locator only, in both the README reference and the cdh manifest version note. The legal arXiv v3 reference and §4.4 comparison remain. Evidence: cdh line 4319 through cdh line 4346. A full-file search found no other occurrence of that replacement-history wording in the editable authored files.

## F08 (P3) — applied

Both fictitious multiplication-by-two input-map Checks → the unital projection Hℤ⊕ΣHℤ→Hℤ, whose π₀ map is identity but rational π₁ map is ℚ→0. The identity of Hℤ and excluded H𝔽_p carrier remain separate controls. This follows directly from the square-zero construction and the unital condition in Conventions; no source-dependent theorem is needed.

## Verification outcomes

- Required elaboration of `packages/GeneralAlgebraicKTheoryPartII/Suggested.lean`, invoked by its absolute tool argument from the content checkout: exit 0, empty output, no warnings. Its only import is Mathlib; no Tau Ceti object-file build was required.
- Declaration/signature audit: enumerated every declaration in Suggested.lean. There are zero definitions, instances, structures, theorems or examples, hence zero names for `#check @name`. Elaborated the corresponding scratch import-only audit once successfully: exit 0, empty output. There are no dropped binders, changed Lean names or padding declarations. The module documentation now includes the Thom-acyclicity/Adams carriers; the headline remains unstatable at these pins.
- Required dependency command, with this package name, supplied order and `--movable`: exit 0. Exact output:

    depcheck: 51 roadmaps, 591 edges, 0 problem(s)

  There is no UPWARD, CYCLE or moved line.
- Citation resolver: exit 0; no cross-roadmap citations or Lean names found nowhere. Its index uses main 35c9f96 and the supplied 362 open-head index; its warning that it does not check pinned Lake packages was addressed by direct pinned-source inspection. Read-only content checkout HEAD is c57bdc02fc2a4b1643df71b4a3a14b20fdad247f.
- Confirmed actual library revisions against the content manifest: Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a; Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. Inspected Mathlib's quasicategory definition at `Mathlib/AlgebraicTopology/Quasicategory/Basic.lean:41`, Karoubi at `Mathlib/CategoryTheory/Idempotents/Karoubi.lean:43`, and bounded t-structure predicate at `Mathlib/CategoryTheory/Triangulated/TStructure/Basic.lean:262`. Their fields give inner-horn filling, an ordinary idempotent, and object-dependent bounds, respectively; none supplies spectral K.
- Inspected Tau Ceti's exact-structure assumptions at `TauCeti/CategoryTheory/Exact/ExactStructure.lean:241`, finite-projective structures/comparison at `TauCeti/Algebra/Category/ModuleCat/CartanMap/Basic.lean:222` and line 231, and the Small-dependent rank equivalence at `TauCeti/CategoryTheory/GrothendieckGroup/FiniteDimensionalVectorSpace.lean:148`. Searched both pins by carrier and operation for ring spectra, enhanced stable categories, Thom spectra, telescopes and spectral K/NK. No carrier capable of stating the repaired spectral headlines was found; ordinary algebraic spectra are unrelated.
- Parsed sources.toml successfully: 30 distinct, certified source entries, no new source key or access request. Read the cached legal texts needed by all eight findings. Yuan's locator now includes Theorem 4.3 and its supplier-contract use; AKQ's locator includes the proof of Proposition 2.22. No missing text remains for these repairs.
- JSON comparison with the initial plan: only the `needs` strings of `spectral-etale-descent` and `spectral-strict-henselian-detection` changed. Every other top-level value and every other gap is identical. All 33 gap slugs, supplier names and needs match their README sentences.
- Pattern searches covered both endomorphism-algebra occurrences, both erroneous fixpoint citations, the supplier/Needs/layer assembly references, all Witt sign examples, both Lemma 2.3 page occurrences, both history clauses, both nice-map repetitions and the §7.8 dependency. `git diff --check` passed. No gate failures were supplied in the brief.

## Ownership and citation audit

Read the main ComplexTori and OptimalTransport roadmaps before editing. Retained this package's existing layers and section numbers. Main suppliers were read from the content checkout: EnhancedDerivedSheaves E0.4/E0.7/E3.1 and E5:abstract/presentability, BordismFormalGroups F1–F3/F6, GeneralizedCohomology G2–G5, ModularCurves §7E, and AlgebraicTopology Stages 4 and 8. Open-head suppliers were read with the roadmap service: GeneralAlgebraicKTheory, StableHomotopyKTheory, RefinedTraceMethods, AInfCohomology, TopologicalKTheory, HomotopySpheres, EllipticCohomology, QWittVectors, KTheoryLowDegrees, KTheoryFiniteLocalFields and SchemeKTheoryOperations. Checked the section ranges named in the exact contracts against their headings and contents. StableHomotopyKTheoryPartII's PO.4 degree-zero operation and transfer ideal were read in `packages/StableHomotopyKTheoryPartII/design/README.md` because that earlier supplier exists as a board design rather than a main/open roadmap folder.

Object-based roadmap-service searches for Thom acyclicity, Margolis homology and Adams vanishing lines covered the indexed main and open heads, including the supplied sibling roadmaps; the same search covered local board packages. The matching specialized Thom-acyclicity target is in downstream `packages/ChromaticHomotopyTheory/design/README.md`, CH.13/thom-acyclicity. GeneralAlgebraicKTheoryPartII therefore owns the prerequisite it needs in §4.32; the generic periodicity, Margolis and Adams toolkit remains BordismFormalGroups F6.3's input. No generic Thom construction, power operation, Witt carrier or K foundation was replanned. Ownership against open heads was checked through the supplied service index; no unsupplied pull-request head was sought independently.

RefinedTraceMethods §2.3 and §4.19 were read at its indexed head, including bounded-above input for the fixpoint lemma, connective E₁ input and completed coefficients for assembly. QWittVectors §1.4a uses the inverse-product comparison γ; the requested non-inverted characteristic series here is χ=γ⁻¹ as an ordinary series. This accounts for its opposite linear coefficient without changing Witt coordinates. KTheoryFiniteLocalFields §6.5a states field descent rather than the requested spectral/rational variants: both existing gap slugs remain explicit obligations, with corrected detectors. They are requests, not assertions that the supplier has already proved these extensions.

## Adversarial mathematics pass

Each row records actual boundary values, not a proof of the general theorem. Section rows include their API laws and worked examples on the listed inputs. Separate rows distinguish the new §4.32 acyclicity and vanishing-line targets from its existing construction. “Retain” means that these computations did not require a further edit. All changed statements have their own rows below; none was accepted merely because Lean elaborates.

| Statement | Instances tried | Computed values on the compared sides | Result | Change |
|---|---|---|---|---|
| Conventions: transfer direction | Identity; free rank-two extension | [R²]↦2[R]; [B]↦2[R] | Pass | Retain |
| Conventions: homological shift | Hk→0→ΣHk | 0=1+(−1); π₁ΣHk=k, π₋₁ΩHk=k | Pass | Retain |
| Conventions: full/connective Hom | X=ΣHk,Y=Hk | π₋₁Hom=k; π₋₁hom=0 | Pass | Retain |
| Conventions: bottom detectors | p=2; H𝔽₃,Hℚ | S[1/2]H𝔽₃=H𝔽₃, HℚH𝔽₃=0; both fix Hℚ | Pass | Retain |
| Conventions: Witt sign and denominator | ν²=0; ν=0 | χ(a)(νx)=1−a₁νx; at x=0 or ν=0 value 1; χ(a)(0)=1 is invertible | Pass | F05 |
| Conventions: universes/compactness | κ=ω; zero category | A finite object need not contain a countable sum; K(0)=0 | Pass | Retain |
| Supplied exact sequences | C→C→0; C=0 | F(C)→F(C)→0; all terms 0 for C=0 | Pass | Retain |
| Supplied modules and Morita | Perf(0); HR² | K(0)=0; rank(HR²)=2 | Pass | Retain |
| Supplied S-construction | r=0,2; split X→X⊕Y→Y | S₀=0; middle rank for k,k is 2=1+1 | Pass | Retain |
| Supplied suspension/nonconnective K | Flasque category; Perf(k) | K(flasque)=0; K₋₁(k)=0 | Pass | Retain |
| Supplied connective/idempotent comparison | Bounded free (k×k)-complexes | K₀ before completion ℤ; afterwards ℤ²; 1↦(1,1) | Pass | Retain |
| Supplied multiplicative K | Ranks 2,3; zero algebra | Tensor rank 6=2·3; scalar action on K(0)=0 | Pass | Retain |
| Supplied Tate fixpoint | Trivial Hℚ; C₂,C₃ | Norms ×2,×3 invertible; all indicated Tate cofibers 0 | Pass | F04 locators |
| Supplied TC C_p assembly | p=2,3; connective Q=τ≥0L_m^(p,f)S,m≥1 | p−1=1,2 copies; T(m+1) of every cyclic-bar term and cofiber is 0 | Pass | F04 contract and Checks |
| §0.1 compact localization | q=id; q:D→0 | Fib(KD→KD)=0; Fib(KD→0)=KD | Pass | Retain |
| §1.1 GL/plus | Hℤ,r=1; Hk⊕ΣHk | π₀GL₁(Hℤ)={±1}; π₁GL₁(square-zero)=k; positive K-space π₀=0 | Pass | Retain |
| §1.2 additive K | Finite k-spaces; C=0 | Group completion of ℕ is ℤ, [k]=1; Kadd(0)=0 | Pass | Retain |
| §1.3 additive/stable Morita | Generator A; A⊕A; zero | End_A(A)=A; Hom(A,A²)=A²; End(0)=0 | Pass | Retain |
| §1.4 A-theory | X=*; S¹ | S[Ω*]=S; S[ΩS¹]=S[ℤ]; augmentation∘unit=id | Pass | Retain |
| §2.1 restricted truncation | F=0; R=HA; k=0 | 0→0; HA→HA=id; τ≤₀R=Hπ₀R | Pass | Retain |
| §2.2 restricted excision | Identity leg; k[ε]/ε²→k; F=0 | Correction comparison=id; ε²=0; F-values 0=0 | Pass | Retain |
| §2.3 coefficient connectivity | Identity; ℤ/2,ℤ/3; p-inverted sphere | Identity fiber 0 in every degree; mod-p truncation fiber 0 | Pass | Retain |
| §2.4 nonpositive comparison | Hk⊕ΣHk→Hk; j=0,−1 | K₀=ℤ→ℤ=id; K₋₁=0→0 | Pass | Retain |
| §3.1 bounded t-structure | Hk,ΣHk,ΣʳHk | Amplitudes [0,0],[1,1],[r,r]; Σ adds 1 to each bound | Pass | Retain |
| §3.2 stable envelope | Proj(Hk); zero; additive Perf(k) | Envelope Perf(k),K₀=ℤ; envelope 0; ⊕_jℤ versus stable ℤ | Pass | Retain |
| §3.3 heart comparison | Perf(k), noetherian heart | K₀=ℤ on both sides; [Σk]=−1; negative K=0 | Pass | Retain |
| §3.4 regular dévissage | Hk[u],degree(u)=2; invert u | Cofib(Σ²R→R)=Hk; π₀=k, other πᵢ=0; inversion kills Hk | Pass | Retain |
| §3.5 finite limits | C=0; relation k→0→Σk | Kernel 0 at C=0; Euler relation 1−1=0 | Pass | Retain |
| §3.6 bounded-heart fiber | C=0; Perf(k) | K(D)=0 at zero; e_j↦(−1)^j, e₀+e₁↦0 | Pass | Retain |
| §4.1 telescope | Tel(0); v²; H𝔽₃,p=2 | Tel(0)=0; Tel(v²)=Tel(v); T(0)H𝔽₃=H𝔽₃ | Pass | Retain |
| §4.2 periodic groups | *; ΣʳH𝔽_p; H𝔽_q,q≠p | Positive periodic groups 0,0; π₀(H𝔽_q)[1/p]=𝔽_q | Pass | Retain |
| §4.3 completion criteria | Hℚ; Hℤ; n=1 | Hℚ^∧p=0 while T(0)Hℚ=Hℚ; T(1)Hℤ=0 | Pass | Retain |
| §4.4 ring acyclicity iff | H𝔽_p; K(n); H𝔽_q,q≠p | Both positive detectors give 0 on H𝔽_p and nonzero on K(n); bottom gives H𝔽_q versus 0 | Pass, both directions | F06 locator already correct here |
| §4.5 finite towers | n=0; H𝔽₃,p=2 | L₀^fS=Hℚ; L₀^(p,f)S=S[1/p]; H𝔽₃ values 0 versus H𝔽₃ | Pass | Retain |
| §4.6 finite kernels | S/p; S/q,q≠p;n=0 | Global finite localization gives 0,S/q; ordinary finite localization gives 0,0 | Pass | Retain |
| §4.7 p-local comparison | S_(p); Hℚ; H𝔽_q,q≠p | Bottom values Hℚ=Hℚ on first two; H𝔽_q≠0 versus 0 on excluded input | Pass | Retain |
| §4.8 fracture | X=0; H𝔽_q,q≠p;m=0,n=1 | Zero square all 0; other square has left column H𝔽_q and right column 0, pullback H𝔽_q | Pass | Retain |
| §4.9 bottom comparison | H𝔽₃,p=2; Hℚ | L₁^(p,f)H𝔽₃=H𝔽₃=H𝔽₃[1/2]; Hℚ=Hℚ | Pass | Retain |
| §4.10 finite telescopic functor | Finite Postnikov X; v,v² | Φ_v(X)=0; even subsequence colimit equals full colimit | Pass | Retain |
| §4.11 Bousfield–Kuhn | Hℤ; T(n); Σ⁻¹Hℚ | Values 0,nonzero; Ω∞Σ⁻¹Hℚ=* whereas bottom localization is Σ⁻¹Hℚ | Pass | Retain |
| §4.12 detection direction | Hℤ→0; Σ⁻¹Hℚ→0 | Positive T(n)Hℤ=0 but Σ∞ℤ has sphere summands; Ω∞ negative rational spectrum=* | Pass | Retain |
| §4.13 covers/Postnikov | S⁰,r=1; K(ℤ,1),r=2 | τ≤₀S⁰=S⁰; base component=*; K(ℤ,1)⟨2⟩=* | Pass | Retain |
| §4.14 fiber homology | Identity map; empty source→point,E=Hℚ | Reduced fiber homology 0 for identity; empty-fiber augmentation is 0→Hℚ and fails | Pass | Retain |
| §4.15 periodic connectivity | n=1,2; X=* | Sharp bounds m=2,3; reduced suspension spectrum and periodic groups 0 | Pass | Retain |
| §4.16 suspension-loop preservation | Identity; Hℤ→0,n=1 | Identity fiber 0; negative control fiber π₀=ℤ fails m=2 | Pass | Retain |
| §4.17 Bousfield classes | BP⟨0⟩; BP⟨1⟩; HF_p | Inverted bottom class Hℚ; HF_p smash is nonzero before inversion and 0 for E(1) | Pass | Retain |
| §4.18 finite-height locality | Multiplicative/additive laws | Heights 1,∞; additive [p]=0 makes (p,v₁,…,v_n)=0≠(1) over 𝔽_p | Pass | Retain |
| §4.19 lower-local telescopes | Hℚ,n=1; L₁S,n=2 | T(1)Hℚ=0; T(2)L₁S=0; both comparison values 0 | Pass | Retain |
| §4.20 height-one comparison | p=2,3; Hℤ; KU_p^∧ | Both detectors kill Hℤ and detect KU_p^∧ | Pass | Retain |
| §4.21 BP truncations | n=0,1;p=2 | Hℤ_(2) has positive support 0; rational π₋₂ BP⟨1⟩=0 versus E(1)=ℚ | Pass | Retain |
| §4.22 localized norm | G=1; trivial C₂ on Hℚ | Norm id; norm ×2; cofibers 0,0 | Pass | Retain |
| §4.23 transfer section | C₂,C₃ over ℚ; zero localization | (1/2)·2=1; (1/3)·3=1; zero category only map 0→0 | Pass | Retain |
| §4.24 telescopic Tate | G=1; KU_p^∧,C_p | Raw Tate 0 for 1; raw p-inverted part may be nonzero but T(1)-value 0 | Pass | Retain |
| §4.25 blueshift | n=1; zero/rational input | Output bottom reflector p-inversion; both Tate values 0, so exact one-step height loss fails | Pass | Retain |
| §4.26 power operations | Scalars 1,2;p=2,3 | P(1)=1; res P(2)=4,8 versus 2; transfer discrepancies 2,6 | Pass | Retain |
| §4.27 Hahn implication | H𝔽_p; Hℚ | Every finite K(i)H𝔽_p=0; K(0)Hℚ≠0,K(1)Hℚ=0 | Pass, implication not converse | Retain |
| §4.28 height threshold | 0,H𝔽_p,Hℚ,H𝔽_q,q≠p | Heights −1,−1,0,0; last p-localization 0 but p-inversion nonzero | Pass, threshold iff | Retain |
| §4.29 Tate converse | R=0,Hℚ;i=0 | Raw Tate 0; every positive T(j)R=0 | Pass | Retain |
| §4.30 modular input bounds | p=2,3;n=2,3 | T(3)tmf=T(3)Tmf=0; Δ²⁴ degree 24·24=576 | Pass | Retain |
| §4.31 Thom comparisons | p=2,3; connected covers | 1−2=−1; π₀=𝔽₂,ℤ₂,ℤ_(2) in specified models; π₃S_(3)=ℤ/3≠0=π₃Hℤ_(3) | Pass | Retain |
| §4.32 Thom construction/connectivity | m=0,1;p=2 | y(0)=S₂^∧,π₀=ℤ₂; π₀y(1)=𝔽₂; π₀z(1)=ℤ_(2); negative πᵢ=0 | Pass | Connectivity explicit |
| §4.32 twisted acyclicity | m=1,2;p=2 | Positive ranges ∅,{1}; T(1)y(2)=T(1)z(2)=0; T(0)y=0 but π₀T(0)z=ℚ | Pass | F02 owned target |
| §4.32 odd-prime line/action | p=3,m=2,i=1,2 | Slopes 1/16 versus 1/4, difference 3/16>0; at i=2 difference 0; p=5 slopes 1/48,1/8 differ by 5/48; p=3,m=1 range empty | Pass | F02 owned input; equality excluded |
| §4.33 untwisted James | W=*; S²; integral wrong-prime Moore summand | Reduced sum for *=0; S² gives ⊕_(r≥1)ℚ[2r]; S/3 survives inversion of 2 | Pass | Retain |
| §4.34 ordinary detection | 0,Hℚ,H𝔽₂; coefficient primes 2,3 | All homologies of 0=0; Hℚ detects itself; H𝔽₂ has mod-2 π₀=𝔽₂ but rational/mod-3 value 0 | Pass | Retain finite-height restriction |
| §4.34 unit mapping algebra | R=ℚ×ℚ; R=0 | Hom(1,R) product (ac,bd); E₁₂E₂₁=E₁₁≠E₂₂=E₂₁E₁₂; null η gives id_R=0 | Pass | F03 |
| §4.35 nonpositive nilinvariance | ℤ/4→𝔽₂; ℤ/9→𝔽₃; I=0 | K₀=ℤ→ℤ=id; K₋₁=0→0; quotient by 0=id | Pass | Retain |
| §4.36 continuous Witt action | 𝔽₃[ε]/ε²; a=1; a=0 | 1−εx fixed; zero series 1 gives zero NK class; inverse-sign value differs by 2εx≠0 | Pass | F05 |
| §4.36 continuity/contraction | ν²=0; χ≡1 mod t²; regular k,j=−1 | χ(νx)=1; annihilator contains restriction kernel at length 1; NK₋₁(k)=0 | Pass | Retain |
| §4.37 NK localization | ℤ[1/2][ε]/ε²; 𝔽₂[ε]/ε²; ℤ/9→𝔽₃ | ×2 inverse ×1/2; ×2 on square-zero units=0 in char 2; relative K₁ order 3 | Pass | Retain |
| §4.38 connective invariance | Identity at n=1 | Underlying fiber 0 in every degree; localized K fiber 0 | Pass | Retain |
| §4.39 replacement connectivity | m=n=0; identity side | Bound 0+0+2=2; actual correction fiber 0 in all degrees | Pass | Retain |
| §4.40 finite Postnikov stage | k=0,1; R=HA | τ≤₀R=Hπ₀R; τ≤₁HA=HA; one step at k=1 | Pass | Retain |
| §4.41 restricted truncation | H𝔽₂,p=2; H𝔽₃,p=3 | L_n^(p,f)R=0; K(R)^∧p=Hℤ_p; positive local K=0 | Pass | Retain |
| §4.42 p-power coefficients | r=1,2;p=2,3; A=𝔽₃[ε]/ε² | K₀=ℤ; K(𝔽_p)^∧p=Hℤ_p; T(i)K(A)=0 for i≥1 | Pass | Retain |
| §4.43 acyclic categories | C=0; Perf(H𝔽_p) | End(0)=0; H𝔽_p finite-local value 0; positive localized additive/stable K=0 | Pass | Retain |
| §4.44 compact kernel | A=S,n=0; A=0 | S/p↦0; S/q↦S/q for q≠p; zero algebra has zero kernel | Pass | Retain |
| §4.45 Mitchell | i=2; ℤ,S[1/p]; i=1 | T(2)K-values 0,0; height-one K(ℤ) nonzero | Pass | Retain |
| §4.46 Theorem A | A=0; already finite-local A;n=1,2 | K(0)→K(0)=0→0; localization comparison=id; bottom-removal index starts 2 | Pass | Retain |
| §5.1 connective cover | Hk; KU;n=2 | τ≥₀Hk=Hk; τ≥₀KU=ku; T(2)-comparison fiber 0 | Pass | Retain |
| §5.2 high trace | A=0,KU;n=2 | K(0)=TC(0)=0; middle coefficient ku; localized zigzag fibers 0 | Pass | Retain |
| §5.3 genuine transfer | G=1; free C_p orbit | Norm=id for 1; res∘ind=p on K₀; assembly source K(R)⊗Σ∞_+BC_p | Pass | Retain |
| §5.4 CMNN induction | n=2,3;m=n−2 | m=0,1; T(2)K(S[1/p])=0; trace index at m=0 is 1 and excluded | Pass | F04 assembly input |
| §5.5 purity | A=0; already adjacent-local A;n=1 | 0→0; comparison=id; bottom adjacent detector S[1/p]∨T(1) | Pass | Retain |
| §5.6 nilpotent comparisons | Identity; ℤ/4→𝔽₂; ℤ/9→𝔽₃ | Kernels 0,(2),(3), all squares 0; prescribed telescopic K/TC fibers 0 | Pass | Retain |
| §6.1 upper bound | H𝔽_p,Hℚ,E_n,0 | Heights −1,0,n,−1; K bounds 0,1,n+1,0; actual ht K(0)=−1 | Pass | Retain |
| §6.2 field maps | E₁(L); Hℚ; H𝔽_q,q≠p | Identity in height 1; nonzero rational field map; last rationalization 0, cannot map unit to characteristic 0 | Pass | Retain |
| §6.3 Lubin–Tate lower bound | E₁,E₂;p=2,3 | Heights 1,2; T(2)K(E₁)≠0,T(3)K(E₂)≠0; D_(n+1)=T(n+1) | Pass | F01 detector compatibility |
| §6.4 periodic height-zero field | Algebraically closed char-0 L | π₀(ku_p^∧⊕Σku_p^∧)=ℤ_p; π₁=ℤ_p; nonzero T(1) | Pass | Retain |
| §6.5 redshift | Hℚ; E₁; char-2 Tate ring at odd p | Heights 0→1,1→2; last has ht 0 but rational part 0 and positive odd K support 0 | Pass | Retain exclusion |
| §6.6 two-height necessity | n=1; square-zero HA | T(1)E₀=0 but T(1)K(E₀)≠0; π₁ΣHA=A versus π₋₁ΩHA=A | Pass | Retain |
| §6.7 graded vanishing iff | Hℚ,n=0 p-local; E₁,n=1,2 | M₀Hℚ≠0,M₁K(Hℚ)≠0; E₁ support at 1 nonzero/2 zero, K support at 2 nonzero/3 zero | Pass, both directions | F06 page |
| §7.1 nice-map predicate | id Hℤ; square-zero projection; id H𝔽_p | π₀ identity for first two; rational π₁ 0→0 versus ℚ→0; last π₀=𝔽_p≠ℤ | Pass | F08 |
| §7.2 K preserves nice | id Hℤ; rank K(𝔽_p)→Hℤ | Output π₀=ℤ→ℤ=id; negative K=0; iterated π₀ remains identity | Pass | Retain |
| §7.3 iteration | p=2,3;r=1,2;j=1,2 | K₀=ℤ; targets Hℤ,K(ℤ); coefficient-ring map impossible since pʳ·1 is 0 versus pʳ | Pass | Retain |
| §7.4 Morava K coefficients | m=1;p=2,3;i=3 | Possible heights {0,1,2}; T(3)K(K(1))=0; rational splitting ranks (1,0)+(0,1)=(1,1) | Pass | Retain |
| §7.5 truncated sphere | r=0,1;i=2 | τ≤₀S=Hℤ; T(2)K(τ≤₀S)=T(2)K(τ≤₁S)=0 | Pass | Retain |
| §7.6 BP K localization | n=0,1,2 | Comparison starts at heights 1,2,3; vanishing at 2,3,4; three-term sequence starts n=1 | Pass | Retain |
| §7.7 suspension A-theory | W=*; wrong-prime Moore addition | A(*)→A(*)=id; added S/3 survives p-inversion at p=2, so fails acyclicity | Pass | Retain |
| §7.8 Thom K comparison | m=1,2;p=2,3 | Positive ranges ∅,{1}; T(1)K(y(2))=0; z comparison with K(ℤ_(2)); bottom π₀z[1/2]=ℚ | Pass | F02 dependencies/Checks |
| §8.1 ε towers | Zero diagram; identity augmentation | Cofiber/error tower 0; zero object stays in every thick enlargement | Pass | Retain |
| §8.2 rational transfer | Unit case; degree-two transfer | Unit lifts to 1; zero cobar error; transfer(1/2)=1; null η implies id_R=0 | Pass | F03 mapping algebra |
| §8.3 Galois descent | G=1; A→A×A | Identity comparison for 1; transfer(a,b)=a+b, (1,0)↦1 | Pass | Retain |
| §8.4 semilinear free complex | H=1; twisted free rank d | X=S,rank 1; k-dimension d·#H; d≥1 gives positive dimension | Pass | Retain |
| §8.5 Lubin–Tate transfer | H=1; supersingular groups | Transfer=id; d·48 and d·24 positive and invertible in ℚ | Pass | Retain |
| §8.6 ko purity | A=ko,0;i=2,3 | ko[β⁻¹]=KO; T(2) comparison fiber 0; T(3)K=0; zero input all 0 | Pass | Retain |
| §8.7 tmf purity | A=tmf,0;i=2,3,4 | Height-2 comparison uses Tmf; height-3 uses TMF; T(4)K=0; zero input all 0 | Pass | Retain |
| §8.8 supersingular descent | p=2,3; full/geometric groups | (9−1)(9−3)=48; 12·2=24; L_K(2)TMF(3)=0 at p=3 | Pass | Retain |
| §8.9 regular examples | ko→KO; tmf→Tmf | Coefficient fibers K(ℤ); T(2)K(ℤ)=0 | Pass | Retain |
| §9.1 height-one truncation | Hℤ; H𝔽_p | Discrete π₀ comparisons=id; H𝔽_p[1/p]=0; L_K(1)K(𝔽_p)=0 | Pass | Retain |
| §9.2 nil/cdh | k[ε]/ε²→k; empty scheme; identity blowup | ε²=0; local fiber 0; K(∅)=0; identity-square discrepancy 0 | Pass | Retain |
| §9.3 affine lines | A=Hk,0; sphere degrees 0,1,2 | Both π₀=k[x]; zero input 0; smooth terms S,S,Σ∞_+BC₂ versus flat S,S,S | Pass | Retain |
| §9.4 homotopy invariance | A=𝔽_p[ε]/ε²; A=0 | (1+εx)(0)=1 but 1+εx≠1; K(1)-local fiber 0; zero input all 0 | Pass | Retain |
| §9.5 KH comparison | Regular field; square-zero ring | K(k)=KH(k); singular NK₁ symbol nonzero, its K(1)-local value 0 | Pass | Retain |
| §9.6 TC obstruction | p=2,3; ℤ→ℤ[1/p] | K(1)-local TC source nonzero; p-completed target 0 | Pass | Retain |
| §9.7 category colimits | Stages r=1,2; p-torsion union | Stage local TC 0,0; union local TC nonzero from ℤ localization fiber | Pass | Retain |
| §10.1 additive comparison | C=0; Perf(k),i=2 | Zero map 0→0; e_j↦(−1)^j on K₀; T(2) comparison fiber 0 | Pass | Retain |
| §10.2 sifted colimits | Constant filtered/simplicial diagram | Colimit A and realization A; localized colimit L_T(n−1)(ambient colimit) | Pass | Retain |
| §10.3 orbit diagram | 1,C₂,ℤ,S₃,Q₈ | Terminal orbit for first three; none for S₃,Q₈; finite-cyclic family for ℤ omits ℤ/ℤ | Pass | Retain |
| §10.4 TC assembly | G=1,ℤ,S₃; R=0 | First two assembly=id; completed fiber 0 for S₃; TC(0)=0 | Pass | Retain |
| §10.5 K assembly | G=1,ℤ,S₃,Q₈; R=KU,n=2 | Cyclic assembly=id; nonabelian T(2) fibers 0; τ≥₀KU=ku | Pass | Retain |
| Worked periodic field | HL[u],degree(u)=2 | Torsion quotient class 1−(−1)²=0; completed cofiber ranks π₀=π₁=ℤ_p | Pass | Retain |
| Worked finite field | p=2,3;j=1,2 | Odd positive group orders pʲ−1=1,3 or 2,8, prime to p; completed positive groups 0 | Pass | Retain |
| Worked bottom boundary | R=(H𝔽₂)^tC₂,p odd | Suspension acts +1 and −1, hence 2·K(R)=0; R[1/p]=R but R_ℚ=0 | Pass | Retain |

The supplier-gap tests below audit their interfaces without claiming that this package proves the supplier obligation.

| Statement (gap slug) | Instances tried | Computed values on the compared sides | Result | Change |
|---|---|---|---|---|
| multiplicative-postnikov | R=HA;k=0,1 | τ≤₀HA=τ≤₁HA=HA | Pass | Retain |
| stable-james-splitting | W=*;S² | Wedge 0 for *; sphere degrees 2,4,6,… for S² | Pass | Retain |
| spectral-units-and-lines | R=Hℤ;0 | π₀GL₁Hℤ={±1}; GL₁(0) has its unique unit component | Pass | Retain |
| relative-thom-colimit | X=*; trivial line | Colimit R; for R=0 value 0 | Pass | Retain |
| multiplicative-thom-refinement | X=*; trivial loop map | Thom algebra R with original multiplication; unit 1_R | Pass | Retain |
| elliptic-level-three-galois | p=2,3 | Deck order 48; at p=3 the 3-inverted level theory has K(2) value 0 | Pass | Retain |
| elliptic-supersingular-at-two | p=2; level-three action | card(GL₂(𝔽₃))=48; residue field order 4 | Pass | Retain |
| elliptic-supersingular-at-three | p=3; geometric/semilinear action | Orders 12 and 24; residue field order 9 | Pass | Retain |
| elliptic-spectral-affineness | Tensor by S; zero spectrum | Γ(Otop⊗S)=Γ(Otop); Γ(Otop⊗0)=0 | Pass | Retain |
| all-height-morava-realization | h=1; marked identity | Formal-group identity and induced spectral identity; coefficient π₀=W(k) | Pass | Retain |
| witt-characteristic-series | a=0,1; ν²=0;p=3 | χ(0)=1,χ(1)=1−t; χ(a)(νx)=1−a₁νx; γ₁(a)=1+a₁t | Pass | F05 sign |
| nilpotent-kzero | ℤ/4→𝔽₂; I=0 | K₀ ℤ→ℤ=id; quotient by 0=id | Pass | Retain |
| tc-z-k1-nonzero | p=2,3 | L_K(1)TC(ℤ) nonzero in both cases | Pass | Retain |
| tc-z-inverse-p-vanishing | p=2,3 | TC(ℤ[1/p])^∧p=0 | Pass | Retain |
| k1-tc-filtered-colimits | Constant filtered ℤ diagram | Colimit source=ℤ; both local TC-values equal | Pass | Retain |
| tc-mod-p-cyclotomic-colimits | Empty diagram; constant diagram | Empty colimit 0,TC(0)/p=0; constant value unchanged | Pass | Retain |
| tc-mod-p-ring-sifted-colimits | Constant simplicial Hℤ | Realization Hℤ; comparison identity on TC(Hℤ)/p | Pass | Retain |
| thh-all-cyclic-assembly | G=1,ℤ | Terminal orbit in both; THH assembly identity | Pass | Retain |
| linear-weak-additive-motives | Zero category; split pair | U(0)=0; U(C⊕D)=U(C)⊕U(D) | Pass | Retain |
| linear-motive-tensor-unit | Perf(A);A=0 | Unit motive tensor itself=unit; zero base category motive 0 | Pass | Retain |
| linear-motive-kzero-unit | Rank-one and rank-two free A | [A]↦1; [A²]↦2·1 | Pass | Retain |
| linear-motive-projection-formula | Identity base change; ranks 2,3 | Both products rank 6=2·3; identity extension/restriction | Pass | Retain |
| spectral-etale-descent | p=3; 𝔽₄/𝔽₂ | Rejected p-inversion gives π₋₂ 0 versus ℤ/2; rational comparison gives 0=0 | Pass after repair | F01 |
| spectral-strict-henselian-detection | R=H𝔽₂;0;n=0 | Rational K₀ of 𝔽₂ and 𝔽̄₂ is ℚ; zero ring gives 0 and fails hypothesis | Pass | F01 |
| suslin-algebraically-closed-comparison | Char-0 algebraically closed field | Completed K₀=ℤ_p=π₀ku_p^∧; K₁^∧p=0=π₁ku_p^∧ | Pass | Retain |
| localizing-nisnevich-descent | Empty scheme; identity cover | E(∅)=0; identity Čech diagram totalizes to E(X) | Pass | Retain |
| localizing-derived-blowup | Unit ideal/identity modification | Blowup X; exceptional empty; discrepancy fiber 0 | Pass | Retain |
| abstract-blowup-noetherian-approximation | X=Spec ℤ; identity modification | Already noetherian model; base change identity | Pass | Retain |
| abstract-blowup-platification-domination | Identity modification | Unit ideal blowup=id; support of center empty | Pass | Retain |
| kh-simplicial-model | r=0,1 | A[x₀]/(x₀−1)=A; A[x₀,x₁]/(x₀+x₁−1)=A[x₁] | Pass | Retain |
| kh-regular-comparison | Regular field k | K₀(k)=KH₀(k)=ℤ | Pass | Retain |
| kv-relative-comparison | Relative identity map | Relative spectrum 0; every spectral-sequence term 0 | Pass | Retain |
| kh-nilpotent-invariance | k[ε]/ε²→k | ε²=0; KH comparison fiber 0; integral NK₁ symbol 1+εx≠1 | Pass | Retain |

## Maintainer consequences

No Lean declaration was introduced, renamed or deleted. All existing headline theorems remain unstatable for the documented pinned-carrier reasons. There are no new gaps and no requested edits outside this package. KTheoryFiniteLocalFields must consume the corrected D_n wording for the same two gap slugs. RefinedTraceMethods retains ownership of both corrected citations. ChromaticHomotopyTheory CH.13 consumes the specialized §4.32 acyclicity; this repair does not edit or settle that downstream design's text. All other plan fields, metadata and section numbering are unchanged. No commit or remote write was made.
