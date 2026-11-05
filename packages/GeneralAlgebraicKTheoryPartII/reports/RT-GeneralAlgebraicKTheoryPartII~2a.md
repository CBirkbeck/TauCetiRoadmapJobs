<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1197#issuecomment-6444218391 -->
Red team round 2 pass a (codex) of c410d39

Verdict: needs_changes

1. **F01** (P3) The new cover Check assumes a compact localized unit

   **Location:** `packages/GeneralAlgebraicKTheoryPartII/README.md:1667`: “the identity of the compact module R becomes null after base change”.

   **Claim:** In the localized module category used to define nilpotence detection, R itself is compact.

   **Witness:** Take R=KU_p^∧ in K(1)-local modules. The local colimit of R→ᵖR→ᵖ⋯ is 0, but colim π₀Map_R(R,R)=ℚ_p≠0=π₀Map_R(R,0). Thus R is not compact.

   **Exact repair text:** Replace the first Check by: “If R→E(A) detects nilpotence and A=0, then every compact R-module C has tensor-nilpotent identity. Since C is dualizable, C is a retract of C⊗C⊗C∨; hence a tensor-nilpotent identity forces C=0. Compact generation then forces R=0. Thus R≠0 implies A≠0; R=0 permits A=0.” Cite bsy line 2059, Lemma 4.32, for the equivalent nil-conservativity argument. Specify that nilpotence of maps means tensor nilpotence in the localized module category.

   **Retest:** For KU_p^∧ the unit remains noncompact, but the compact generator R/p is nonzero and its tensor powers are nonzero. The map R→0 therefore fails nilpotence detection without assuming compactness of R. The conclusion A≠0 survives.

2. **F02** (P3) Regular coefficient localization cites only secondary accounts

   **Location:** `packages/GeneralAlgebraicKTheoryPartII/README.md:2093`: “secondary citation of Blumberg–Mandell for ko/KO”; “secondary citation of Barwick–Lawson for tmf/Tmf”.

   **Claim:** The cited passages provide the coefficient-specific regularity proofs needed to apply §3.4.

   **Witness:** agh line 1541 merely attributes both regularity assertions to Barwick–Lawson. Their primary proof is barwick-lawson lines 207–222 and 253–316: Propositions 3.1, 4.1 and Corollaries 3.2, 4.2.

   **Exact repair text:** Replace the locator paragraph by: “Barwick–Lawson, Regularity of structured ring spectra and localization in K-theory, arXiv:1402.6038v2, Proposition 3.1 and Corollary 3.2, p.5 (barwick-lawson lines 207–222); Proposition 4.1 and Corollary 4.2, pp.6–7 (barwick-lawson lines 253–316). For the nonconnective extension use agh line 1515, Proposition 4.4, p.34.” Add this primary work to References and sources.toml under `barwick-lawson`, with the legal arXiv URL and these locators; retain LMMT only as background. Make the coefficient proof route explicit: Wood's cofiber gives perfectness of Hℤ over ko; for tmf prove finite Tor amplitude away from 6 and separately modulo 2 and 3, then identify the compactified localization using c₄ and a surviving positive power of Δ.

   **Retest:** Wood's sequence yields ku from two ko cells, then cofib(Σ²ku→ku)=Hℤ. At 2 the tmf residue Tor algebra has basis ξ₁^aξ₂^bξ₃^c with 0≤a<8, 0≤b<4, 0≤c<2, hence dimension 64; the prime-three calculation is separately required by the primary proof. The repair retains both bad primes.

## Round-one findings verified at this head

The identifiers below distinguish the two earlier reviews. Quoted repairs are from `packages/GeneralAlgebraicKTheoryPartII/README.md`. All twelve dispositions were checked against the repaired text; the two Witt findings concern the same change. None was dismissed as not actionable.

| Earlier finding | Status | Repaired passage and location | Recomputed witness |
|---|---|---|---|
| r1a F01, connected-cover indices | Repaired | :1200 “S³⟨4⟩”; :1218 “J_rS²⟨3⟩” | With :889's convention, S³⟨3⟩=S³ has π₃=ℤ; S³⟨4⟩ has π₃=0 and π₄=ℤ/2. J₁S²⟨3⟩≃S³ has π₂=0, π₃=ℤ. |
| r1a F02, rational circle Tate | Repaired | :206 “the raw circle Tate spectrum is not” zero; “π₀=ℚ” | Finite C_p norm on ℚ is ×p, invertible; circle Tate has π₂ⱼ=ℚ and odd groups zero. Its derived p-completion is zero, matching the completed comparison. |
| r1a F03, redundant Witt gap | Repaired | :248 “χ(a)=γ_∞(a)⁻¹, the inverse in R[[t]]” | QWittVectors §1.4a supplies γ. χ(0)=1, χ(1)=1−t; χ(2,−1)=1−2t+t² mod t³=(1−t)². Deleted gap is absent from both plan and README. |
| r1a F04, unowned chromatic field detection | Partly repaired | :1655 “Lubin–Tate theories of perfect algebras and Lubin–Tate covers”; :1679 “Apply the Lubin–Tate cover theorem of §6.1a” | The construction, tilt adjunction, small-object theorem and three test maps now have an owner and locators. For E(L), tilt=L; for zero ring, tilt=0. Its new nonzero Check uses a noncompact unit: S01. |
| r1a F05, stable-envelope locators | Repaired | :558 “lmmt line 753”; :619 “lmmt line 771”; :636 and :2259 “lmmt line 765” | Those passages supply Stab(C), the bounded-heart fiber and its K comparison; line 644 contains only a cross-reference. Perf(k): additive K₀=⊕ⱼℤ, stable K₀=ℤ, eⱼ↦(−1)ʲ. |
| r1a F06, height-one primary sources | Repaired | :1005 “mah81 line 46, Theorem 1.1”; “mil81 line 272, Theorem 4.11 and Corollary 4.12” | Mahowald's 2-primary localization and Miller's odd-primary v₁ calculation occur there (also mah81 line 633). Hℤ has both localizations zero; KU_p^∧ has both nonzero. |
| r1a F07, nondiscriminating Checks | Repaired | :841 “contains the nonzero localization class”; :1177 “π₀=ℚ₂≠0” | For E=v⁻¹Σ∞V, [V,E] contains loc≠0 and periodicity gives nonzero negative groups. For KU₂, raw Tate π₀=ℤ₂((x))/(x−2)=ℚ₂; T(1) of this Tate spectrum is zero. |
| r1b F01, redundant Witt gap | Repaired | :248 “Consume §1.4a's big Witt power-series comparison” | Same repair as r1a F03. For a=(0,1), −tχ′/χ=2t²+2t⁴+⋯; ghosts w₂=w₄=2, w₁=w₃=0. |
| r1b F02, oversized Suslin gap | Repaired | :266 “the coefficient groups … already follow from §6.5a's separably closed case d=0 and §1.6's completion” | For L=ℚ̄ and p=2, existing groups are π₀=ℤ₂, π₁=0, π₂=ℤ₂. A Bott-preserving homotopy-ring-spectrum map to ku₂ remains additional information. README and plan ask for that map. |
| r1b F03, oversized Postnikov gap | Repaired | :53 “The split and derivation-pullback square-zero algebras themselves are RefinedTraceMethods §4.14” | For R=HA⊕ΣHA, τ≤₀R=HA and the degree-two derivation pullback recovers R. GeneralizedCohomology G3 item 8 supplies absolute truncation/connectivity, not multiplicative truncation or relative tensor connectivity. Both consuming Needs lines now include the gap. |
| r1b F04, coarse trace citations | Repaired | :1547 “RefinedTraceMethods §4.17, The Dundas–Goodwillie–McCarthy theorem” | Current §4.17 contains integral DGM; §2.9 supplies the TC equalizer; §4.14 supplies stable-K linearization. The former blanket §§2.1–2.17, 4.9–4.18, 6.1 citation is gone. Relevant hypotheses are connective source, nilpotent π₀-kernel, and finite-action/coefficient bounds as appropriate. |
| r1b F05, Bott names | Repaired | :214 “a (degree 4), b (degree 8) and u”; :2037 “b∈π₈ko” | a²=4b; c(a²)=(2u²)²=4u⁴=c(4b); ko[b⁻¹]=KO. This agrees with GeneralizedCohomology G5.4 and TopologicalKTheory T7. |

## Statement and context ledger

The README has 104 numbered targets, plus the two separately asserted theorems inside §4.32. The following 106 rows cover them. Here k is a field, p a prime, H denotes Eilenberg–Mac Lane, and “unchanged” means that the displayed tests did not refute the statement; it is not a proof of the theorem. The homological suspension and global T(0)=S[1/p] conventions are used throughout. Cases outside a statement's domain are negative controls, not claimed counterexamples.

| Statement / context | Instances tried | Values computed on the two sides | Result / change |
|---|---|---|---|
| 0.1 compact-kernel localization; compactly generated stable categories | identity localization; localization to zero | kernels 0 and D; K-fibers fib(id)=0 and fib(KD→0)=KD | unchanged; completion remains Idem(D/C) |
| 1.1 GL/plus; connective E₁ R | ranks 0,1; Hℤ; Hk⊕ΣHk | GL₀=*; GL₁(Hℤ)={±1}; positive π₁ of square-zero ring=k, while π₀K(Hk)=ℤ is outside the connected plus space | unchanged |
| 1.2 additive mapping spectra and K | finite-dimensional k-spaces; X=ΣHk,Y=Hk | component monoid ℕ has group completion ℤ; π₋₁Hom(X,Y)=k, π₋₁hom(X,Y)=0 | unchanged; connective/full distinction necessary |
| 1.3 additive Morita; chosen generator | right free module A; A=0 | End_A(A)=A by left multiplication; zero generator has End=0 and projective category 0 | unchanged; left-module convention would give opposite |
| 1.4 A-theory comparison; connected based X | X=*; S¹ | S[Ω*]=S; S[ΩS¹]=S[ℤ]; finite free rank monoid ℕ gives ℤ, while retract closure allows all projective K₀ classes | unchanged |
| 2.1 truncating invariant restricted to acyclic rings | F=0; R=HA; zero Postnikov stage | F(R)=F(Hπ₀R)=0; HA→HA=id; τ≤₀R=Hπ₀R | unchanged; global truncation not inferred |
| 2.2 restricted excision/nilinvariance | identity Milnor square; k[ε]/ε² | correction C=B′, comparison fiber 0; I²=0; for zero invariant F(A)=F(k)=0 | unchanged; auxiliary-domain condition retained |
| 2.3 coefficient connectivity; π₀-isomorphism, n≥1 | identity; S[1/p]→Hℤ[1/p], p=2,3 | coefficient fibers of identity=0; mod-p fibers of p-inverted rings=0; completed relative K=0 | unchanged; m=1 excluded |
| 2.4 nonpositive connective K | Hℤ; Hk⊕ΣHk; j=0,−1 | K₀ on both sides ℤ; K₋₁ on both sides 0 | unchanged |
| 3.1 bounded t-structures; objectwise bounds | finite complexes k[−r]; finite spectra | each complex has amplitude [r,r], with no uniform r; τ≤₀S=Hℤ is not a finite spectrum | unchanged; no bounded t-structure inferred on finite spectra |
| 3.2 stable envelope and connective comparison | projective k-spaces; underlying additive Perf(k) | Stab(Proj k)=Perf(k); K₀add Perf(k)=⊕ⱼℤ versus K₀ Perf(k)=ℤ | unchanged; distinguishes two K constructions |
| 3.3 theorem of heart; bounded, noetherian for nonconnective part | bounded k-complexes; k→0→Σk | heart K₀=ℤ=stable K₀; negative groups zero; [Σk]=−1 | unchanged |
| 3.4 regular spectral localization | R=Hk[u], degree u=2 | cofib(Σ²R→R)=Hk; after u-inversion this cofiber=0; Euler class 1−1=0 | unchanged; regular/noetherian hypotheses retained |
| 3.5 bounded-heart fiber | zero category; Perf(k) | zero envelope/fiber=0; k→0→Σk has Euler sum 1+(−1)=0 | unchanged |
| 3.6 additive-to-stable fiber | Perf(k), shifts 0,1,2 | e₀↦1,e₁↦−1,e₂↦1; e₀+e₁ lies in kernel, e₀ does not | unchanged |
| 4.1 global finite localization | H𝔽₃ at p=2; Hℚ; zero detector | H𝔽₃[1/2]=H𝔽₃ but Hℚ⊗H𝔽₃=0; both functors fix Hℚ; L_zero X=0 | unchanged |
| 4.2 periodic groups | contractible X; finite Postnikov X | mapping groups eventually 0, so telescopic colimit 0; zero self-map also has telescope 0, identity has original group | unchanged |
| 4.3 telescope acyclicity criteria; n≥1 | Hℤ,Hℚ; Σ⁻¹Hℚ | all positive periodic groups zero; Hℚ has p-completion 0 but T(0)Hℚ=Hℚ; τ≥₀Σ⁻¹Hℚ=0 has the same positive-height value 0 | unchanged; bottom exception retained |
| 4.4 ring-spectrum acyclicity comparison; n≥1 | H𝔽_p; K(n); H𝔽_q(q≠p) | both positive detectors kill H𝔽_p and detect K(n); T(0)H𝔽_q=H𝔽_q≠0=K(0)H𝔽_q | unchanged; ring hypothesis and height bound retained |
| 4.5 finite chromatic localization definitions | n=0; Hℚ; H𝔽₃ at p=2 | L₀^fS=Hℚ, L₀^(p,f)S=S[1/p]; both fix Hℚ; on H𝔽₃ their values are 0 and H𝔽₃ | unchanged |
| 4.6 finite localization kernels | n=0; S/p,S/q(q≠p) | p-inversion kills S/p, fixes S/q; rationalization kills both | unchanged; global kernel uses p-primary generators |
| 4.7 comparison on p-local spectra | S_(p),Hℚ; H𝔽_q(q≠p) | at n=0 both towers give Hℚ on first two; on last their values H𝔽_q and 0 differ | unchanged; p-locality necessary |
| 4.8 chromatic fracture square; preservation of acyclics | m=0,n=1; X=H𝔽_q(q≠p),0 | first square has left column H𝔽_q,H𝔽_q and right column 0,0, whose pullback is H𝔽_q; second square all 0 | unchanged |
| 4.9 bottom finite-local comparison; T(1)-acyclic X | Hℚ; H𝔽₃ at p=2 | L₁^(p,f)Hℚ=Hℚ=Hℚ[1/p]; L₁^(2,f)H𝔽₃=H𝔽₃=H𝔽₃[1/2] | unchanged |
| 4.10 Bousfield–Kuhn interface; n≥1 | E=v⁻¹Σ∞V, X=Ω∞E | π₀Φ_vX=[V,E] contains nonzero loc; π₋kd repeats it; v² gives same colimit | unchanged; repaired Checks exclude zero/connective substitutes |
| 4.11 spectrum comparison | Hℤ; periodic E; Σ⁻¹Hℚ at height zero | positive localization of Hℤ=0; E is recovered T(n)-locally; Ω∞Σ⁻¹Hℚ=* while Σ⁻¹Hℚ≠0 | unchanged; height zero excluded |
| 4.12 detection by Ω∞ | Σ⁻¹Hℚ; positive telescope | Σ∞Ω∞Σ⁻¹Hℚ=0 versus rationalization nonzero; positive T(n) ignores Postnikov tails | unchanged; no height-zero detection |
| 4.13 connected covers | S³, r=3,4; S²,r=3 | π₃S³⟨3⟩=ℤ, π₃S³⟨4⟩=0, π₄S³⟨4⟩=ℤ/2; S²⟨3⟩≃S³ | unchanged after r1 repair |
| 4.14 generalized-homology fiber argument | identity map; zero coefficients; empty base | fiber of identity=* gives reduced homology 0; zero coefficients give 0 in every bidegree; empty total/base homology both 0 | unchanged; convergence/boundedness hypotheses retained |
| 4.15 unstable finite detection | n=1,2; disconnected S⁰ | thresholds at least 2,3; reduced Σ∞S⁰=S≠0, so dropping connectivity fails | unchanged |
| 4.16 connective map detection | Hℤ→0; identity | π₀ fiber of Hℤ→0 is ℤ, so required positive connectivity fails; identity fiber=0 | unchanged |
| 4.17 BP truncation Bousfield class | n=0,1; mod-p smash | BP⟨0⟩=Hℤ_(p) has class Hℚ∨H𝔽_p; BP⟨1⟩ retains HF_p summand, E(1) does not | unchanged |
| 4.18 bounded-height orientations | multiplicative, additive formal group; elliptic | heights 1,∞; elliptic heights ≤2, hence no height-3 locus | unchanged; finite-height assumption excludes additive group |
| 4.19 telescopes on Lₙ-local spectra | Hℚ; L₁S | positive T(n) of Hℚ=0; T(2)L₁S=K(2)L₁S=0 | unchanged; does not assert general telescope conjecture |
| 4.20 height-one Bousfield equality | p=2,3; Hℤ; KU_p^∧ | T(1)Hℤ=K(1)Hℤ=0; T(1)KU_p and K(1)KU_p nonzero | unchanged; primary proofs checked |
| 4.21 coefficient comparison | p=2, BP⟨1⟩ versus E(1) | rational π₋₂ BP⟨1⟩=0, rational π₋₂E(1)=ℚ; positive-height comparison unaffected | unchanged; no rational equivalence |
| 4.22 finite norms and Tate | trivial group; C_p on Hℚ | trivial norm=id and Tate=0; norm ℚ→ℚ is ×p, so Tate=0 | unchanged |
| 4.23 localized transfer splitting | p=2,3; rational component | transfer on H₀ is ×2 or ×3, section ×1/2 or ×1/3; zero/augmentation is not that section | unchanged; source's BΣ_p aside is erroneous, below |
| 4.24 telescopic Tate vanishing | KU₂, trivial C₂ | raw Tate π₀=ℚ₂≠0, but T(1)-local Tate=0 | unchanged; raw vanishing would be false |
| 4.25 finite blueshift | height-one KU₂; zero | raw Tate rational nonzero, height 0 versus input height 1; zero remains zero | unchanged; no equality-of-heights assertion |
| 4.26 power-operation descent | p=2, h=2, k=1; constants 1,2 | [2](z) mod (2,u₁)=u₂z⁴+z⁸+⋯, g₂ constant=u₂; res P₂(2)=4≠2=res(P₂1+P₂1) before transfer quotient | unchanged |
| 4.27 Hahn acyclicity | H𝔽_p; Hℚ | finite Morava support of H𝔽_p empty; Hℚ has K(0) nonzero and all positive heights zero | unchanged; direction is upward vanishing |
| 4.28 chromatic height | 0,H𝔽_p,Hℚ,H𝔽_q(q≠p) | heights −1,−1,0,0 under global T(0); rationalization of last is 0 | unchanged; global/p-local distinction retained |
| 4.29 Tate-height converse | KU₂, i=0,1 | Tate π₀=ℚ₂, so i=0 vanishing hypothesis fails; positive Tate localization zero and T(j)KU₂=0 for j≥2 | unchanged after r1 repair |
| 4.30 elliptic locality | tmf,Tmf,TMF; p=2,3 | T(3) of each coefficient ring=0; Δ²⁴ has degree 24·24=576, its inversion gives TMF | unchanged; no naked Δ inversion at bad primes |
| 4.31 Hopkins–Mahowald Thom spectra | p=2,3; sign map at 3 | π₀ mod-p Thom=𝔽_p; covered completed Thom π₀=ℤ_p; 3-local sign twist is null and retains sphere π₃=ℤ/3≠π₃Hℤ_(3) | unchanged; cover and local conventions repaired |
| 4.32 James-filtered Thom definition | m=0,1; p=2,3 | y(0)=S_p^∧ has π₀ℤ_p; y(1) has π₀𝔽_p; z(1) at 2 has π₀ℤ_(2); J₁S²⟨3⟩≃S³ | unchanged |
| 4.32 lower-height acyclicity theorem | m=1,2; z(m) rationalization | 0<i<1 is empty; for m=2 the range is i=1; z(m) has rational π₀ℚ≠0 | unchanged; bottom excluded for z |
| 4.32 odd-prime Adams slope theorem | (p,m,i)=(3,2,1),(5,2,1) | slopes 1/16<1/4 and 1/48<1/8; gaps 3/16 and 5/48; i=m removes strict inequality | unchanged |
| 4.33 stable James splitting application | W=*; S²; odd Moore space at p=2 | reduced spectrum of *=0; ΩΣS² splits as spheres S²ʳ,r≥1, rationally nonzero; S/3 survives [1/2] | unchanged; connected and global acyclicity needed |
| 4.34 ordinary-homology unit detection | Hℚ,H𝔽₂; R=ℚ² | homology detects each nonzero unit at its own coefficient; Map_R(R,R)=ℚ², whereas End_ℚ(ℚ²)=M₂(ℚ), noncommutative | unchanged; mapping object out of tensor unit essential |
| 4.35 nonpositive nilinvariance | ℤ/4→𝔽₂; ℤ/9→𝔽₃ | K₀=ℤ both sides; negative groups zero; relative K₁ in second example C₃≠0 | unchanged; only j≤0 here |
| 4.36 Witt action, central variable | χ(1); a=(0,1); ε²=0 over 𝔽₃ | χ(1)=1−t; −tχ′/χ=2t²+2t⁴+⋯; χ evaluated on εx gives 1−a₁εx with value 1 at x=0 | unchanged; inverse-series sign excluded |
| 4.37 NK/relative localization | ℤ[1/2][ε]; 𝔽₂[ε]; (ℤ/9,(3)) | ×2 invertible in first NK action; 1+εx has order 2 in second; relative K₁ last=C₃, killed after inverting 3 | unchanged |
| 4.38 uniform connective K estimate | identity A→A; chosen n | same N(n) works for every identity; input and output fibers both 0 in all degrees | unchanged; quantifier N precedes rings |
| 4.39 square-zero pullback connectivity | m=n=0; one ideal zero | bound m+n+2=2; error involving I⊗J is 0 when either ideal=0 | unchanged; relative tensor gap recorded |
| 4.40 Postnikov acyclic truncation | R=HA; HA⊕ΣHA | stage 0 is HA; degree-one extension encoded by derivation into Σ²HA, recovering R | unchanged; k≥1 for extension step |
| 4.41 restricted telescopic truncation; finite-local acyclic R | 𝔽₂,𝔽₃ | completed K=Hℤ₂,Hℤ₃ respectively; all positive T(i) values zero | unchanged |
| 4.42 prime-power ring K | ℤ/4,ℤ/9 | K₀=ℤ and rationalized K=Hℚ; every positive T(i) vanishes | unchanged; bottom is not zero |
| 4.43 acyclic categorical K | Perf(𝔽_p); zero category | endomorphisms are H𝔽_p-linear, finite-local acyclic; positive T(i)K=0; zero category K=0 | unchanged |
| 4.44 localized perfect kernel | S/p versus S/q at n=0 | first generator localizes to 0, second to S/q≠0 | unchanged; wrong-prime generators excluded |
| 4.45 Mitchell | K(ℤ); p=2,3 | T(i)Kℤ=0 for i≥2; K(1)-local Kℤ≠0 | unchanged; no height-one extension |
| 4.46 Theorem A, two forms | zero ring; already localized ring; n=1,2 | first cases compare 0→0 and id; n=1 retains S[1/p], n=2 allows removing bottom | unchanged |
| 5.1 high-height connective cover | KU and ku; zero | τ≥₀KU=ku, π₋₂KU=ℤ versus 0 for ku; T(2)-local K comparison still an equivalence; zero gives 0 | unchanged; n≥2 retained |
| 5.2 high-height trace | R=KU; R=0 | middle ring is ku, not KU; zero K and TC are 0; T(n)K(Hℤ)=T(n)TC(Hℤ)=0 for n≥2 | unchanged |
| 5.3 genuine finite-action comparison | trivial group; C_p | trivial action diagram reduces to identity; induction then restriction has rank p=2 or 3 | unchanged |
| 5.4 CMNN induction | n=2; n=3; p=2,3 | base uses K(S[1/p]) and T(2) value 0; next uses height-2 trace; assembly cofiber has p−1=1 or 2 summands | unchanged; induction does not invoke purity |
| 5.5 two-height purity | H𝔽_p; zero | adjacent localization of H𝔽_p is 0 including n=1; T(n)K(H𝔽_p)=0; zero maps to zero | unchanged |
| 5.6 nilpotent π₀ comparison | ℤ/4→𝔽₂; ℤ/9→𝔽₃ | kernels square to zero; positive localized K and TC comparison fibers zero | unchanged; surjective/nilpotent hypotheses retained |
| 6.1 upper redshift | H𝔽_p,Hℚ,E_n,0 | heights −1,0,n,−1; upper bounds 0,1,n+1,0; K(0) height −1 satisfies bound | unchanged |
| 6.1a Lubin–Tate cover/tilt; localized modules | n=1,A=𝔽_p; A=0; rational ℚ[x] | π_*E(𝔽_p)=ℤ_p[u±], tilt 𝔽_p; E(0)=0; ℚ(x) kills R/x though its identity is not tensor-nilpotent | S01 corrects compactness Check; theorem retained |
| 6.2 chromatic field maps | E_n(L); Hℚ; H𝔽_q(q≠p) | identity to E_n(L); ℚ→L[u±] exists; rationalization of H𝔽_q=0 and no characteristic-zero unital map | unchanged |
| 6.3 Lubin–Tate lower bound | E₁,E₂ at p=2,3 | target nonzero at heights 2,3 respectively; coefficient heights 1,2 | unchanged; all primes retained |
| 6.4 height-zero lower bound | E₀(L)=HL[u±], characteristic zero | K after p-completion=ku_p⊕Σku_p; π₀=ℤ_p, π₁=ℤ_p; Euler map 1−(−1)²=0 | unchanged |
| 6.5 corrected redshift | Hℚ,E₁; (H𝔽₂)^tC₂ at odd p | first heights 0→1,1→2; last has global height 0 but rationalization 0, and K[1/2]=0 | unchanged; explicit rational-bottom condition excludes counterexample |
| 6.6 optimality of two heights | E_(n−1); M=τ≥₀K(n) | T(n)E_(n−1)=0 but T(n)K(E_(n−1))≠0; T(n−1)M=0,T(n)M≠0; linearized relative K=ΣM | unchanged; derivative shift is +1 |
| 6.7 chromatic graded pieces | n=0,1; E_n | M₀(Hℚ)=Hℚ≠0; height-one graded piece of K(Hℚ)≠0; E_n has no grades above n | unchanged |
| 7.1 nice maps; connective, π₀≅ℤ | id Hℤ; id H𝔽_p; Hℤ⊕ΣHℤ→Hℤ | first nice; second π₀=𝔽_p≠ℤ; third rational π₁ ℚ→0, so not nice | unchanged |
| 7.2 preservation of niceness | K(Hℤ) and its iteration | negative K of ℤ zero; π₀Kℤ=ℤ, hence π₀K(Kℤ)=ℤ | unchanged |
| 7.3 prime-power iteration | r=1,2, p=2,3; j=1,2 | K₀ℤ/pʳ=ℤ→ℤ rank=id; comparison targets Hℤ at j=1 and Kℤ at j=2 | unchanged; j−1 used only j≥1 |
| 7.4 K of Morava coefficients | m=1,p=2,3 | v₁ degrees 2,4; allowed K-heights 0,1,2; rational splitting gives π₀=ℚ, π₁=ℚ | unchanged |
| 7.5 truncated sphere | r=0,1 | τ≤₀S=Hℤ; τ≤₁S has π₁=ℤ/2, but both positive coefficient heights vanish; K heights ≥2 vanish | unchanged |
| 7.6 BP/E(n) application | n=0,1,2 | comparison thresholds i≥1,2,3; vanishing thresholds i≥2,3,4; n=0 uses p-inversion of Hℤ_(p) | unchanged |
| 7.7 A-theory | W=*; type m>n | reduced sphere of *=0 and maps A(*)⇄A(*) are id; every positive smash power of type-m input is adjacent-height acyclic | unchanged |
| 7.8 filtered Thom K | m=1,2 at p=2 | m=1 range empty; m=2 gives T(1)K(y₂)=0, T(1)K(z₂)=T(1)Kℤ_(2)≠0 | unchanged |
| 8.1 ε-enlargement and towers | empty prime set; constant nonzero tower; Hℚ/ℤ | zero finite spectrum allowed for empty set, so enlargement=T; constant tower has identity transitions, not nilpotent; Hℚ/ℤ invisible to finite heights but not ε-zero | unchanged |
| 8.2 rational transfer cobar descent | degree-two finite free algebra; tensor unit over ℚ² | transfer rank 2 becomes 1 after multiplying by 1/2; unit mapping ring ℚ² differs from M₂ℚ | unchanged; unit criterion uses correct mapping ring |
| 8.3 finite Galois descent | trivial group; split C₂-torsor A×A | fixed point comparison=id for trivial group; transfer (x,y)↦x+y sends (1,0) to 1 | unchanged |
| 8.4 even equivariant free complex | H=1; free k[H]-module rank d | X=S has rank1 for H=1; underlying k-dimension=d·#H, positive when d≥1 | unchanged |
| 8.5 Lubin–Tate transfer | positive free rank M; groups of orders48,24 | transfer class has nonzero integer rank M; multiplying by 1/M gives rational unit | unchanged; no prime-to-group-order restriction |
| 8.6 ko-algebra purity | A=ko, i=2,3 | ko[b⁻¹]=KO; T(2)-localized K agrees; T(3)Kko=T(3)KKO=0 | unchanged after Bott rename |
| 8.7 tmf-algebra purity | A=tmf, i=2,3,4 | height2 comparison uses Tmf; height3 permits TMF; height4 K vanishes | unchanged; three thresholds distinct |
| 8.8 supersingular descent | p=2,3 | #GL₂(𝔽₃)=(9−1)(9−3)=48; #G₂₄=24; TMF(3) at p=3 inverts 3 and is not the height2 coefficient | unchanged; semilinear actions retained |
| 8.9 regular ko/tmf localization | Wood cofiber; tmf at2 | cofib(η:Σko→ko)=ku, cofib(β:Σ²ku→ku)=Hℤ; residue Tor at2 has 8·4·2=64 basis elements | S02 adds primary regularity source |
| 9.1 height-one truncation | Hℤ; H𝔽₂ at2, H𝔽₃ at3 | π₀ comparison=id; 𝔽_p[1/p]=0 and L_K(1)K𝔽_p=0 | unchanged; connective requirement for π₀ retained |
| 9.2 nil/cdh descent; qcqs, finitely presented square | dual numbers; empty scheme; identity modification | I²=0, localized relative K=0; K(∅)=0; identity-square total fiber=0 | unchanged in stated discrete/scheme domain |
| 9.3 flat versus smooth polynomial | symmetric degrees0,1,2; A=Hk | first two summands S,S; degree2 smooth summand Σ∞_+BC₂ versus flat S; both π₀=k[x] after Hk | unchanged; no spectrum-level identification |
| 9.4 polynomial invariance | k[ε]/ε²; zero ring | 1+εx≠1 in NK₁, but localized NK spectrum=0; polynomial ring over zero is zero | unchanged; integral assertion would fail |
| 9.5 KH comparison | regular field k; dual numbers | KH(k)=K(k); KH(k[ε])=KH(k), while integral NK₁ contains 1+εx | unchanged; localized comparison keeps singular rings |
| 9.6 height-one TC obstruction | ℤ→ℤ[1/p], p=2,3 | L_K(1)TCℤ≠0, TC(ℤ[1/p])^∧p=0 | unchanged; supplied as explicit gaps |
| 9.7 category-colimit obstruction | finite stages and filtered union | localized TC of each stage=0; union has nonzero L_K(1)TCℤ; 0≠nonzero | unchanged; ring and category colimits distinguished |
| 10.1 chromatic additive comparison | additive Perf(k)⊂Perf(k) | K₀ map ⊕ⱼℤ→ℤ sends eⱼ↦(−1)ʲ, not iso; T(2) of comparison fiber=0 | unchanged; localized theorem not integral |
| 10.2 sifted continuity | constant diagram; zero ring | colim constant A=A, comparison=id; all terms for zero are 0; target colimit is localized colimit | unchanged |
| 10.3 all-cyclic orbit diagram | G=1,C₂,ℤ,S₃,Q₈ | G/G terminal in cyclic orbit category for first three; absent for S₃,Q₈; number of nonidentity Cp components p−1 | unchanged; infinite cyclic retained |
| 10.4 TC assembly | G cyclic; R=0 | terminal orbit makes source=TC(RG)=target; TC(0)=0 at every orbit | unchanged; p-completed conclusion |
| 10.5 high-height K assembly | R=KU; G cyclic/nonabelian | connective replacement ku; cyclic assembly=id; nonabelian comparison T(n)-fiber=0 for n≥2; zero R gives 0→0 | unchanged; no height-one claim |

### Conventions and supplied interfaces: computed controls

These rows cover the six interface blocks before Layer 0, the supplier Checks and the additional sign, universe and coefficient conventions.

| Statement / context | Instances | Values and comparison | Result |
|---|---|---|---|
| Suspension and t-grading | k→0→Σk; ΣHℤ→0; S¹→* | stable fiber ΣHℤ has first group π₁=ℤ; space fiber S¹ is connected but not simply connected; [Σk]=−[k] | conventions consistent |
| Compact quotients | identity; free complexes over k×k | Idem(D/D)=0; free rank class n maps to (n,n) in ℤ² after completion, not onto (1,0) | idempotent completion cannot be deleted |
| Perfect modules | A=0,S,Hk; rank two | Perf(0)=0; Perf(S)=finite spectra; Hk² has class 2 and End=M₂(k) | distinguishes projective module from arbitrary module |
| S-construction | r=0,1,2; split triangle | S₀=0; S₁=C; S₂ selects Z,Y,X; split sequence gives [X⊕Y]=[X]+[Y] | zero index treated separately |
| Nonconnective K/swindle | zero; field; countable sum functor | K(0)=0; K₀(k)=ℤ, K₋₁(k)=0; id⊕T=T implies id_K=0 | κ must admit countable sums; κ=ω insufficient |
| Land–Tamme correction | identity square; Tor-unital square | A′⊗_A B=B′, correction comparison=id, total invariant error fiber=0 | actual bimodule tensor required |
| Multiplicative K/projection formula | ranks 2,3; degree-two transfer; zero | tensor rank=6; restriction after extension multiplies rank by2; K(0)=0 | positive integer ranks and zero algebra distinguished |
| Circle/finite Tate | trivial Hℚ; p=2,3 | finite norm ×2,×3 invertible, Tate=0; raw circle π₀=ℚ; completed circle=0 | repaired, no raw-circle vanishing |
| Real Bott normalization | a,b,u | c(a²)=4u⁴=c(4b); a has degree4, b degree8, u degree2 | factors and grading agree across suppliers |
| James connectedness | W=S²,S⁰,* | J_rS² cells in degrees0,2,…,2r; J∞S⁰ has π₀ℕ versus ΩS¹ π₀ℤ; J₀*=* | connected assumption necessary |
| Witt characteristic series | a=0,1,(2,−1); ν²=0 | χ(0)=1,χ(1)=1−t,χ(2,−1)=(1−t)² mod t³; evaluation χ(νx) at x=0 is1 | ordinary power-series inverse, not Witt multiplicative inverse |
| Finite-field normalization | q=2,3; r=1 | K₁(𝔽₂)=ℤ/(2−1)=0; K₁(𝔽₃)=ℤ/2; K₀=ℤ in both; q=1 not a field | r=0 excluded from odd positive formula |
| Bottom étale contract | 𝔽₄/𝔽₂ at chromatic p=3 | completed 2-primary K=Hℤ₂; H²(C₂,ℤ₂)=ℤ/2 versus π₋₂ source0; rationally ℚ/2ℚ=0 | D₀ must be Hℚ, not S[1/3] |
| Universe/ordinary pinned groups | finite-dimensional k; shifts k[r] | rank classes 0,1,2 map to integers 0,1,2; each k[r] bounded with different r; no common amplitude | Small/EssentiallySmall conditions retained |

### Suggested.lean and headline coverage

| File / section | Declarations | Variables and instances | Computed audit | Change |
|---|---|---|---|---|
| `packages/GeneralAlgebraicKTheoryPartII/Suggested.lean:1–52` | 0 definitions, 0 instances, 0 theorems, 0 examples | No variable/include blocks; namespace only | 1 import (`Mathlib`), 1 module docstring, 31 headline groups, 0 sorry bodies, 0 set_option commands; elaborated signature set is empty | none |

The headline inventory, grouped exactly by the mathematical acceptance obligations, is: compact-kernel localization (§0.1); plus/projective/Morita/A-theory comparisons (§§1.1–1.4); truncating excision and quantitative/nonpositive comparisons (§§2.2–2.4); stable envelopes, bounded-heart fiber, theorem of the heart and regular devissage (§§3.2–3.6); Bousfield–Kuhn, Tate vanishing/blueshift, Hahn, ordinary-homology unit detection, Witt/NK localization, acyclic categorical K, Mitchell and Theorem A (§§4.10–4.46); connective-cover/trace comparison, CMNN vanishing, purity and nilpotent comparisons (§§5.1–5.6); covers, field maps, upper/lower redshift, optimality and graded pieces (§§6.1–6.7); iteration and coefficient applications (§§7.2–7.8); rational-transfer/Galois descent, even free complexes, Lubin–Tate transfer and ko/tmf applications (§§8.2–8.9); height-one excision, cdh, polynomial/KH invariance and TC obstruction (§§9.1–9.7); additive comparison, continuity and cyclic assembly (§§10.1–10.5). The Thom and elliptic comparison inputs in §§4.30–4.33 also appear explicitly in the docstring. Every group needs spectra, spectral K/TC or an enhanced stable category; the all-integer NK theorem cannot be stated using only the existing ordinary K₀ groups. No elementary special case should be inserted in their place.

Pinned declarations were read, not inferred from names: `SSet.Quasicategory` is the inner-horn property (`Mathlib/AlgebraicTopology/Quasicategory/Basic.lean:41`); `Karoubi` has X,p and p≫p=p (`Mathlib/CategoryTheory/Idempotents/Karoubi.lean:43`); `TStructure.bounded` is the intersection of objectwise existential upper/lower bounds (`Mathlib/CategoryTheory/Triangulated/TStructure/Basic.lean:255–262`). None defines spectral K or stable ∞-categories. `TauCeti.ExactStructure` explicitly requires preadditivity, a zero object and binary biproducts (`TauCeti/CategoryTheory/Exact/ExactStructure.lean:241`). The finite-projective exact/split comparison exists at `TauCeti/Algebra/Category/ModuleCat/CartanMap/Basic.lean:222–235`. The SplitK0, AbelianK0 and TriangulatedK0 binders at their files' lines 108, 74 and 130 match the README's stated smallness and category structures. `SplitK0.finrankEquiv` at `TauCeti/CategoryTheory/GrothendieckGroup/FiniteDimensionalVectorSpace.lean:148` retains `[Small.{v} k]`. `WittVector` at `Mathlib/RingTheory/WittVector/Defs.lean:52` is the p-typical coefficient sequence carrier, not the big Witt or spectral E(A) construction.

The pin search found ordinary algebraic/functional spectra and cyclotomic fields, but no homotopy-spectrum, Morava, cyclotomic-spectrum, enhanced K/TC or all-degree NK carrier. The one-tactic/padding audit therefore has zero declarations to reject. The requested `#check @name` list is empty; no elaboration was run, in accordance with the read-only/no-Lean instruction.

### Supplier contracts, ownership and dependency direction

The 17 exact-supplier subsections consist of Mathlib, Tau Ceti and 15 roadmap suppliers. The locator-existence audit was rerun using `roadmaps resolve`, with no unresolved roadmap citation or Lean name. Its warning that it did not search libraries was handled by the direct pin reads above. The roadmap copies used were main at 93233955, the supplied open heads (not revised versions of an existing main roadmap as dependencies), and the explicitly available board designs. The two pins are Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039.

| Supplier citation group | Resolved contract and discriminating comparison |
|---|---|
| GeneralAlgebraicKTheory §§3.12–3.14, 6.9, 6.19, 7.1–7.7, 9.8–9.17, 10.1–10.13, 11.15–11.16, 13.6, 13.8a–c | Plus/Q, left/right normalization, exact-model spectra, all-degree Bass contraction, regular negative vanishing and finite-field calculation exist. Nil_n≅NK_(n+1) for n≥0 agrees with the all-degree extension here. |
| StableHomotopyKTheory Layers3–7, especially §§3.18–3.21, 5.18–5.19, 6.1–6.3, 7.1–7.27 | Supplies coherent models, plus/group completion, Moore rather than Hℤ/m coefficients, derived completion and filtered/tower convergence. π₂(S/2)=ℤ/4 is retained by its coefficient sequence; assuming exponent2 would fail. |
| StableHomotopyKTheoryPartII PO.4 | Degree-zero powers and the Young-subgroup transfer ideal exist in `packages/StableHomotopyKTheoryPartII/design/README.md:739,783`. At p=2 their basepoint values are4 versus2. No later PO.5 input is consumed. |
| EnhancedDerivedSheaves E0.4,E0.7,E3.1,E5:abstract.1–4,E5:presentability.1–3 | Stable enhancement, straightening, relative Kan extension, algebra/module objects, Ind/compact quotients and coherent actions. Absolute spectral Postnikov covers are separate from the multiplicative gap. |
| RefinedTraceMethods §§2.1–2.17,4.6,4.9–4.19 as individually selected | Norm/Tate, THH/TC, localizing invariants, multiplicative trace, stable-K derivative, integral DGM and correction algebra are explicit targets. §4.14's derivation target uses ΣI; §4.19's C_p cofiber has p−1 summands and p-completed coefficients. Global truncating excision is supplied; §2.2 here adds a restricted domain. |
| AInfCohomology AI.7.2 | Bounded-below Tate-orbit/circle comparison and residual action; it does not say that the raw rational circle Tate spectrum is zero. |
| BordismFormalGroups F1–F3,F6.1–F6.5 | Formal groups, nilpotence, finite types, reflector, smashing and enhanced quotient inputs. Its p-local finite localization and K(n)-local Tate statements differ from the global bottom convention and telescopic theorem here. |
| GeneralizedCohomology G2,G3 item8,G4.5,G5.1–G5.4; TopologicalKTheory T4,T7.1 | Spectral models, absolute connectivity, orientations and coefficient models. G5.4/TopK T7 give a²=4b and c(a)=2u²,c(b)=u⁴; multiplicative Postnikov/relative connectivity remain a gap. |
| HomotopySpheres §§3B,4B,4C | James filtration/connected loop comparison, real Bott and spectral comparison inputs. Stable James splitting remains the specified extra contract. |
| EllipticCohomology E1–E6 | Height1/2 realization, modular sheaves, Δ²⁴ and level data. All-height realization, spectral affineness, full level-three/supersingular action comparisons and Thom refinements are declared separately. |
| QWittVectors §§1.1–1.6,1.4a | γ_∞ uses inverse characteristic factors; χ here is its ordinary-series inverse. The old gap would duplicate an actual target; it is removed. |
| KTheoryLowDegrees §§1.1–1.3,13.1 | Ordinary projective K₀ and Euler/transfer normalizations exist; arbitrary nilpotent lifting is still the stated gap. |
| KTheoryFiniteLocalFields §§1.1–1.6,6.5a | Finite-field coefficients, derived completion and discrete étale field descent exist. Coefficient groups alone do not give the new Suslin ring-spectrum comparison or spectral étale site. |
| SchemeKTheoryOperations §§1.1–2.7,3.1–3.5,4.1–4.3,4.12,5.2–5.9 | Perf/scheme K, localization, regular homotopy invariance, Bass Nil and regular blowups exist. They do not silently imply the arbitrary-localizing-invariant or nonregular KH contracts. |
| Ancillary citations: AlgebraicTopology Stages4,8; ModularCurves §7E | Homotopy/obstruction inputs and formal heights are named at existing supplier sections; none is a backwards supply edge. |

The 32 gap slugs agree exactly between `design/plan.json` and the README. No supplier is `none`; no consumed slug is absent; the old Witt-series slug is absent from both. The following grouping records what is additional to the current owner, rather than treating lack of implementation as a defect.

| Gap slugs | Supplier / minimal additional content |
|---|---|
| multiplicative-postnikov | EnhancedDerivedSheaves: multiplicative truncations, their k-invariant and relative tensor connectivity; existing absolute covers and square-zero algebras excluded. |
| nilpotent-kzero | KTheoryLowDegrees: arbitrary two-sided nilpotent lifting of idempotents/stable isomorphisms; negative Bass induction stays here. |
| tc-mod-p-cyclotomic-colimits; tc-mod-p-ring-sifted-colimits | RefinedTraceMethods: two distinct domain categories and colimit classes; neither is inferred from the other without the THH input. |
| thh-all-cyclic-assembly | RefinedTraceMethods: all cyclic subgroups, including infinite cyclic, for every discrete group and connective E₁ coefficient. |
| tc-z-k1-nonzero; tc-z-inverse-p-vanishing; k1-tc-filtered-colimits | RefinedTraceMethods: the two specific height-one values and continuity on discrete rings into the localized target, not on all stable categories. |
| linear-weak-additive-motives; linear-motive-tensor-unit; linear-motive-kzero-unit; linear-motive-projection-formula | RefinedTraceMethods: A-linear κ-bounded motives, tensor unit, the particular K₀ map and perfect-base-change projection formula; four separate contracts. |
| spectral-etale-descent; spectral-strict-henselian-detection | KTheoryFiniteLocalFields: spectral site and nonzero stalk detection, D₀=Hℚ; no duplicated ordinary-field descent. |
| suslin-algebraically-closed-comparison | KTheoryFiniteLocalFields: Bott-preserving homotopy ring spectrum comparison; coefficient computation explicitly excluded. |
| localizing-nisnevich-descent; localizing-derived-blowup | SchemeKTheoryOperations: arbitrary localizing invariant, with empty value0, and derived finite-sequence blowup. |
| abstract-blowup-noetherian-approximation; abstract-blowup-platification-domination | SchemeKTheoryOperations: finite-presentation approximation and dense-open domination; precise separate geometric hypotheses. |
| kh-simplicial-model; kh-regular-comparison; kv-relative-comparison; kh-nilpotent-invariance | SchemeKTheoryOperations: central polynomial simplicial resolution, regular comparison, uniformly bounded relative convergence and all-degree nilinvariance. |
| stable-james-splitting | HomotopySpheres: reduced stable splitting with word filtration; ordinary James comparison already supplied. |
| all-height-morava-realization | EllipticCohomology: heights beyond1/2 and all perfect fields, preserving markings/actions. |
| elliptic-spectral-affineness | EllipticCohomology: module-category equivalence and global-section colimits/tensor comparison, beyond a sheaf of coefficient rings. |
| elliptic-level-three-galois; elliptic-supersingular-at-two; elliptic-supersingular-at-three | EllipticCohomology: precise extensions/actions at2 and3; the bad-prime coefficient models are distinct. |
| spectral-units-and-lines; relative-thom-colimit; multiplicative-thom-refinement | EllipticCohomology: unit-component classifier, actual module colimit and E_n multiplication as separate additions. |

Ownership searches used the roadmap service and object searches of main, Completed, the supplied open checkouts and board packages. The ordinary projective K₀, big Witt carrier, spectral K/TC foundations and Galois coefficient inputs remain with their named suppliers. No second fully qualified Lean declaration exists here because the declaration set is empty. The “Lubin–Tate cover” occurrence in VectorBundlesAndIsocrystals concerns a geometric untilt cover, not BSY's nilpotence-detecting cover. The stable-envelope and BSY extension belong here. `packages/ChromaticHomotopyTheory/design/README.md` overlaps the Bousfield–Kuhn/Tate targets but is later: ownership must remain with this earlier roadmap and that consumer must import it. This is the already settled downstream ownership disposition, not a demand to add an upward dependency.

Mechanical dependency output at this head:

```text
depcheck: 149 roadmaps, 1019 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. At target level, Theorem A precedes high-height trace; trace precedes the positive CMNN induction steps; purity follows CMNN; Yuan's lower bound follows purity. The n=2 CMNN base uses Mitchell rather than its own conclusion. S01 concerns the correctness of a new Check, not a dependency cycle.

## Verified sound

Read all 2,434 README lines and all 52 Lean lines. Audited 104 numbered targets plus two internal §4.32 theorems, with 106 computed target rows; additionally recorded 14 convention/supplier control rows. Read all 330 Check bullets in 112 blocks and tested their concrete instances against the section formulas and the target ledger; S01 is the failed new Check. The source audit inspected 125 distinct explicitly source-prefixed line anchors in 32 cached works, expanding surrounding statements/proofs and the shorthand locators for the new BSY target; S02 records the primary-source deficiency. The fetched Barwick–Lawson primary text provides the proposed correction. All 17 exact-supplier subsections and the two ancillary roadmap citation groups were checked; 32 declared gap contracts have matching slugs and named suppliers.

The acceptance audit found 0 declarations, 0 missing statable spectral headlines and 0 padding declarations. Native ordinary algebra and category carriers are not replacements for the absent spectral carriers. The file has exactly `import Mathlib`, the required namespace/docstring, no overrides, no sorry'd data and no admitted examples.

The read-only diff check showed nine changed files, all within `packages/GeneralAlgebraicKTheoryPartII/`. README and Lean contain no PR numbers, computational algorithm targets or Lean `lemma` declarations. No untrusted-text instruction was followed. The package's unrestricted ring-spectral purity, all-prime claims, nonconnective inputs, p=2,3 cases, infinite cyclic subgroups and singular-ring applications remain in scope.

## Not verifiable

- No Lean build or elaboration was run. The requested per-declaration signature comparison is empty, because the file has no declarations; this is not a claim of an independently reproduced build.
- Declared supplier contracts are conditional future inputs, not pinned implementations. In particular the spectral/∞-categorical headlines cannot currently be proved or even stated on native pinned spectral carriers.
- This is a mathematical statement/proof-route review, not a line-by-line reproof of all cited papers. Counts of inspected source anchors certify locator/support checks, not independent proofs of the referenced deep theorems.
- Some displayed formulas in the Weibel extraction lose subscripts or symbols. The surrounding statements and the explicitly legible sign formula (weibel lines 221–224) support the comparisons checked here; damaged typography was not used to invent an additional claim or a source error.
- Ownership was checked against the supplied open heads and the available main/board index. Unprovided or subsequently changed open work is outside this snapshot. No absent source request is pending; the extra primary work was obtainable legally.

## Source issues

- **Misprint** in lmmt at Remark 3.11, printed p.1026 (lmmt line 747): the source says the stabilized relative K-spectrum of sphere square-zero extensions is ΩM; it should be ΣM, with the suspension in the K-to-THH derivative; affects the proof.
- **Error** in lmmt at the introductory field-map assertion and Redshift Theorem, printed p.1014 (lmmt lines 172–176): the source says nonzero global p-inversion suffices for characteristic-zero field detection and height-zero redshift; it should be nonzero rationalization at height zero; affects a stated result.
- **Error** in cm-tate at the explanation after Theorem 2.5, printed p.3 (cm-tate line 113): the source says inverting p makes the suspension spectrum of BΣ_p the sphere; it should be BC_p there; BΣ₃ retains nonzero mod-2 first homology after inverting3; affects the proof.
- **Misprint** in hahn at the proof of Proposition 4.3, printed p.8 (hahn lines 358–359): the source says the Eisenstein coefficient parameter is u_n; it should be u_h, matching the preceding proposition and constant coefficient; affects nothing.
- **Misprint** in cmnn24 at Lemma 4.7, printed p.19 (cmnn24 lines 831–834): the source says quotienting by the displayed list beginning with p then inverting v_i works also at i=0; it should be W(k)[1/p] at i=0, without first quotienting by p; affects the proof.
- **Error** in akq at §2.1, printed p.5 (akq lines 199–203): the source says the integral connected-cover sign Thom spectrum is Hℤ; it should be Hℤ_(2) after 2-localization; at3 the null sign twist retains a sphere retract with π₃=ℤ/3; affects a stated result.
- **Misprint** in akq at the proof of Proposition 2.22, printed p.15 (akq line 648): the source says the raw integral z(n) has π₀=ℤ₂; it should be ℤ before localization, ℤ_(2) after localization, and ℤ₂ only after completion; affects the proof.
- **Misprint** in cdh at §4.4 before Lemma 4.4.11, printed p.89 (cdh lines 4320–4326): the source says perfect parametrized spectra are all suspension spectra of finitely dominated retractive spaces; it should be their Spanier–Whitehead stabilization, including desuspensions, as the next sentence specifies; affects nothing.
- **Misprint** in barwick-lawson at Corollary 4.2 proof, manuscript p.7 (barwick-lawson lines 303–306): the source says Δ itself generates a multiplicative subset of π_*tmf; it should be a surviving power such as Δ²⁴; Δ supports nonzero differentials at2 and3; affects the proof.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "c410d3995c7b456e73d569fd2520ef469b8cfb6d", "job": "RT-GeneralAlgebraicKTheoryPartII~2a", "model": "gpt-6-astra", "worker": "chris-4"} -->
