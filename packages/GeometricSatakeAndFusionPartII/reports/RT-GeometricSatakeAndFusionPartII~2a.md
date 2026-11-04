<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1177#issuecomment-6485195645 -->
Red team round 2 pass a (codex) of f37fdb5

Verdict: needs_changes

1. **F01** (P1) Depth zero does not mean action through the reductive quotient

   Location: packages/GeometricSatakeAndFusionPartII/README.md:614, “the positive loop group acts through its reductive quotient”.

   Claim: the minuscule admissible locus carries an action factoring through the maximal reductive quotient of the parahoric special fibre.

   Witness: GL₂ Iwahori, μ=(1,0). On the component F₁=[0:1], the element 1+aE₁₂ sends F₀=[0:1] to [a:1]. This unipotent is killed by the reductive torus quotient. AGLR line 1358 uses the entire special fibre.

   Exact repair text: “The depth-zero action factors through the perfection of the special-fibre group scheme 𝒢_k, which need not be reductive, via reduction modulo the uniformizer. Retain the identification 𝒢_k≅𝒢′_k with the companion parahoric.” Add the Iwahori calculation above as a Check. The corrected group retains the nontrivial translation [0:1]↦[a:1], while the first congruence subgroup still acts trivially. This is a new error in the repair of pass-a F01.

2. **F02** (P2) The new Eisenstein Check asserts regularity after ramified reflex base change

   Location: packages/GeometricSatakeAndFusionPartII/README.md:1026, “the corresponding chart of M_r over O_Ĕ is xy=π, flat, regular”.

   Claim: the general rank-function model at n=2 has a regular nodal chart over its reflex DVR.

   Witness: F=Q₃(∛3), n=2, r=(1,2,0) on the three embeddings. E=F(ζ₃) has e(E/F)=2. The comparison in SW line 7820 gives xy=π_F=unit·ϖ_E²: dimension 2, embedding dimension 3.

   Exact repair text: “For n=2 and the distinguished Drinfeld rank function r° (so E=F), after completed unramified base change the node has chart xy=π_F and is regular. For general r, after the comparison theorem the chart is xy=π_F over O_Ĕ; its thickness is e(E/F), so regularity is asserted only when e(E/F)=1.” Retain the reduced special fibre and normality statements. For r=(1,2,0), the repaired Check gives thickness 2 and no regularity claim; for r° it gives thickness 1. The local ring at the special node means the localization at (X₁,X₂), not the entire affine coordinate ring. This error was introduced by the repair of a-F10.

3. **F03** (P2) The new rank-condition definition omits its splitting base change

   Location: packages/GeometricSatakeAndFusionPartII/README.md:1015, “after the decomposition of L by the embeddings ψ̃”.

   Claim: these graded pieces are available for an arbitrary O_E-scheme S.

   Witness: F=E=Q_p, n=2, S=Spec F_p. The unramified quadratic order reduces to F_(p²), with two geometric embeddings but no two nonzero orthogonal idempotents over F_p. RZ17 lines 426–429 explicitly descend the condition.

   Exact repair text: “Define (R_r) after an étale faithfully flat base change splitting the unramified degree-n extension of F^t in D: require rank L_ψ̃=n|A_ψ|+ε_ψ for every ψ̃. Prove independence of the splitting and descend this open-and-closed condition to O_E (RZ17 Definition 3.3 and Remark 3.4).” For S=Spec F_p the check is made over F_(p²), where the two graded ranks are (1,1); no nonexistent decomposition over F_p is used.

4. **F04** (P3) Three semisimple-trace declaration citations have drifted

   Location: packages/GeometricSatakeAndFusionPartII/README.md:161, “supplies `VanishingCycles.semisimpleTrace`, `VanishingCycles.semisimpleTrace_refinement` and `VanishingCycles.semisimpleTrace_additive`”; also :1184 and :1220.

   Claim: these named declarations are supplied by the current cited roadmap.

   Witness: TauCetiRoadmap/LefschetzPencilsAndVanishingCycles/README.md §1.10 states the trace, refinement independence and additivity in prose. Its current README and Suggested.lean contain none of the three names; the resolver also finds none at either library pin.

   Exact repair text: “Section 1.10, ‘The semisimple trace of Frobenius’, supplies admissible inertia filtrations, the filtration-independent semisimple trace and its distinguished-triangle additivity.” Replace the three backticked names in both dependency lists with that section title. The q=9 block still has semisimple trace 10/9 and invariant trace 1/9. This is a stale-name correction, not a missing mathematical supplier contract.

5. **F05** (P3) The stated library pins are no longer the acceptance pins

   Location: packages/GeometricSatakeAndFusionPartII/README.md:39 and :43, “Use the pin 6b7abb3c…” and “Use the pin a91d3aaf…”.

   Claim: the acceptance APIs are checked against those two revisions.

   Witness: lake-manifest.json records Mathlib f6090c7095e1e56b3464c1daba5f24631f1290d2 and Tau Ceti 358314d4ab97483df4fc4cb8adcc02e74a8d9f5a; both read-only checkouts report those exact HEADs. All eight cited declarations still resolve there.

   Exact repair text: Replace the Mathlib hash with “f6090c7095e1e56b3464c1daba5f24631f1290d2” and the Tau Ceti hash with “358314d4ab97483df4fc4cb8adcc02e74a8d9f5a”. Preserve the verified file-and-line citations. The quotient Grassmannian still has quotient rank h−d=2 when h=3,d=1; the trace theorem still requires finite dimension and separability.

6. **F06** (P3) Two remaining tangent Checks do not discriminate the construction

   Location: packages/GeometricSatakeAndFusionPartII/README.md:754, “If k_α=0 the root contributes no directions”; :812, “Replacing X_α by −X_α preserves the resulting Cartan subspace.”

   Claim: these provide a third discriminating Check for the root interval and Cartan-space definitions.

   Witness: :754 restates the interval 1≤j≤k_α. At :812 even the wrong zero subspace is invariant under sign changes; moreover C^cur is defined using H_α, not X_α. Each definition has only two remaining explicit instance Checks.

   Exact repair text: Replace :754 by “For SL₂, λ=μ=α∨, k_α=2 and k_(−α)=0: the positive root supplies exponents 1 and 0, whereas the negative root supplies none.” Replace :812 by “For SL₂, λ=α∨ and μ=2α∨, k_α=3 and k_(−α)=1; the Cartan space is exactly k·t⁻¹H_α. Using k_α in its definition would wrongly add t⁻²H_α and t⁻³H_α.” Indeed abs(1−j)≤1 gives j=0,1,2, while abs(1+j)≤1 gives only j=0; with bound 2 these maxima are 3 and 1. No change to the theorem or characteristic range is needed.

7. **F07** (P2) The acceptable lattice criterion still consumes a narrower companion comparison

   Location: packages/GeometricSatakeAndFusionPartII/README.md:1133, “through the minuscule comparison of §3.4”; also :1137.

   Claim: §3.4 supplies the point comparison for the acceptable KZ datum of §7.8.

   Witness: §3.4 assumes a quasi-tame prime-to-p polynomial model; §7.8 assumes an acceptable datum and an existing good embedding. KZ lines 952–955 instead use the general Witt admissible-special-fibre identification, without a polynomial companion.

   Exact repair text: “Use §7.6 and GeometricSatakeAndFusion GS0, ‘Bounded admissible affine flag loci’, to identify the perfected geometric special fibre with the Witt μ-admissible locus. Functoriality identifies the lattice-point map with the given good embedding. Equality of the full and connected fixers identifies its double cosets.” Remove §3.4 from this proof and its Needs line. For GL₂ in the inverse convention, g=diag(π⁻¹,1) gives πgΛ/πΛ=k·e₁ and the admissible translation; g=diag(π⁻²,1) violates πgΛ⊂Λ and fails both membership tests. The repair preserves the acceptable generality and needs no new supplier gap.

## Earlier findings: repair verification

All references below are to packages/GeometricSatakeAndFusionPartII/README.md unless specified. Prior pass identifiers are preserved to distinguish the two F01s. Quotations are from the repaired package, not from source texts.

| Earlier finding | Status | Repaired passage and witness |
|---|---|---|
| a-F01 | Partly repaired | :614 “For a minuscule bound”; :623 excludes (2,0), since e₂+pe₁ is outside p²We₁+We₂. The new reductive-quotient assertion is false (S01). |
| a-F02 | Repaired | :117 coherence and :119 “gap:algebraic-admissible-cohen-macaulay” are separate contracts; :1085 uses the latter. The node has depth=dimension=1 independently of Hilbert-function equality. |
| a-F03 | Repaired | :484 “2.5 Standard GL and GSp chain incidence models” precedes :527 “2.6 The tame symplectic lattice-chain embedding”; :543 now states “good if and only if its period-total embedding is good”. The closed map P¹×P¹→Gr(2,4) supplies the cancellation argument. |
| a-F04 | Repaired | :73 “extends as group-scheme homomorphisms”; :450 computes (1−T²)/3∉Z₃[T,T⁻¹]. Point-stability on Z₃ units is no longer the hypothesis. |
| a-F05 | Repaired | :65 “Section 10B, ‘Induction, Weyl modules and simple heads’”; :764 uses Δ(ν)=∇(−w₀ν)* and :783 names the owner. SL₂ Δ(ω)=k², while Δ(pω) and ∇(pω) remain distinct. |
| a-F06 | Repaired | :379 “using geometric normality of the generic Schubert bound”; :121 declares the new gap. GL₂ (2,0) now uses a surface of dimension 2, not a flag of dimension 1. |
| a-F07 | Repaired | :650 “has an open subscheme ... smooth over O_E”; :1113 uses §3.7 for R₀. The quadratic ramified trait has special ring k[t]/t² and no such smooth open. AGLR lines 2405–2423 support the new target. |
| a-F08 | Repaired | :731 gives tests 1 and −1 in C₂; :732 gives (0,−1,1) and (0,1,−1) in D₄. These distinguish the wrong detecting sets. |
| a-F09 | Repaired | :193 “no E-rational representative ... and no E-rational parabolic is assumed”; :208 has ℱ(F)=∅ for quaternion division D, and ℱ over a splitting field is P¹. |
| a-F10 | Partly repaired | :1015 “Flat Drinfeld and Eisenstein models” supplies the previously absent geometry, with the rank and Eisenstein equations. The new definition and regular-chart Check require S03 and S02 respectively; flatness/normality themselves are supported by RZ17 lines 1080–1114. |
| a-F11 | Repaired | :594 “let M be a normal flat projective O_E-scheme”; the theorem is conditional on this supplied representative, independent of standard type. The triality example has Gr(24,24)=point and identity normalization. |
| a-F12 | Repaired | :301 “x²=π_E yz” has special double line, and :995 computes charpoly=(T−a₀)² for the A¹-family of quotients. These now discriminate reducedness and flat closure. |
| b-F01 | Repaired | :51 “Serre S₂ condition, its étale-local stability and connectedness after removing codimension ≥2”; :1081 uses exactly these, not depth deformation. |

## Computed statement ledger

The context column records the actual scope, including exclusions. “Survives” means the displayed tests do not refute the statement, not that these examples prove it. Numerical ranks are geometric ranks. Unless a row says otherwise, DVRs are mixed characteristic with finite residue field, μ is dominant, and geometric tangent tests use an algebraically closed residue field. Characteristic-zero and inseparable controls are used only where the statement permits them or to test its explicit exclusion. Empty test sets do not manufacture values of minima.

### Suggested.lean declaration ledger

| File and section | Declarations | Variables and instances | Instances and values | Result/change |
|---|---:|---|---|---|
| packages/GeometricSatakeAndFusionPartII/Suggested.lean:1–52, module and namespace | 0 | No section variables, instances, definitions or theorem signatures | Empty declaration set has cardinality 0; import count=1 (`Mathlib`); theorem/definition/sorry counts=0/0/0 | No binder-loss, stand-in or padding declaration. No signature elaboration was run: the requested read-only/no-Lean restriction takes precedence, and there are no signatures to elaborate. |

### README targets and definitions

All numbered targets, including the two constructions in §2.5 and the new bold target in §6.5, are represented below. Locations are in packages/GeometricSatakeAndFusionPartII/README.md.

| Statement/context | Instances tried | Values on the two sides / negative control | Result/change |
|---|---|---|---|
| Conventions: integral dominance and apartment sign (:25) | PGL₂ cocharacters 0,1,2; GL₂ diag(t,t⁻¹) | 2−0=1·coroot, 1−0=½·coroot; dominance true/false respectively. Cocharacter=(1,−1), displacement=(−1,1) | Survives; rational-cone order would fail |
| Conventions: ranks and trace normalization (:27–31) | h=3,d=1; q=9,d=0,1; multiplicity 0 | Subrank=1, quotient rank=2, SW kernel rank=2; (φ,τ)=(1,1),(1,−1/3); empty sum rank=0, kernel=G | Survives; q=1 is outside finite-residue-field context |
| §0.1 local datum/morphism (:191), minuscule vs general bounds | GL₂ μ=(1,0),(2,0),0; quaternion division conic | Flag dimensions 1,1,0; Schubert dimensions 1,2,0. Conic F-points=∅, split conic=P¹ | Survives; no rational parabolic is presupposed |
| §0.2 Hodge/abelian type (:215), faithful representation | GL₃ d=1; GL₂ weights (2,0); m=0,2 | Kernel rank=2; weights (2,0) fail {0,1}; m=0 kernel=GL₂; m=2 transforms (h,d)=(3,1) to (6,2) | Survives; positive multiplicity matters |
| §0.3 quasi-tame/NE (:239) | Wild K/F with split GL_n over K; PGL₂(D), index D=p; split GL_n | H splits over extension degree 1; index=p gives p∣index; split division index=1 | Quasi-tame does not mean K/F tame; NE accepts split and rejects index p |
| §0.4 imported v-model (:262) | μ=0; GL₂ line; SL₂→PGL₂ | Closure Spd O_E; generic P¹ diamond; cocharacter map n↦2n, equation 2n=1 has no integer solution | Survives; central comparison requires a lift |
| §0.5 normal representative specification (:283) | P¹; blow-up at special point; x²=πyz | Special components=1 vs 2; exceptional P¹ maps to one point, so diamond map not mono. Conic generic dimension=1, special equation x²=0 not reduced | Survives; normality alone does not replace comparison or reducedness |
| §0.6 good embedding (:307) | Identity; two-period GL₂; cusp normalization | Identity closed; total ranks=(2,4); k[t²,t³]→k[t] omits t despite bijective geometric points | Survives; finite normalization need not be closed |
| §1.1 polynomial modification input (:339) | GL₁ degree m=0,1; P=1; additive group | Modifications t⁰,t¹; P=1 gives singleton; additive quotient t⁻¹k[t⁻¹] contains A¹ | Survives; ind-projectivity limited to specified polynomial parahorics |
| §1.2 schematic closure (:351) | GL₂ line, zero, (2,0); ramified quadratic central EL class | P¹, Spec O_E, dimension-2 Schubert closure; central source dimension=0 vs naive special A¹ dimension=1 | Survives; naive locus and closure distinguished |
| §1.3 normality/admissible fibre (:375), prime-to-p range | GL₂ Iwahori line, hyperspecial (2,0) | Special node k[x,y]/xy: depth=dimension=1, branches normal, whole local ring not domain; generic (2,0) dimension=2 | Survives with separate generic-normality and CM supplier contracts |
| §1.4 adjoint/isogeny comparison (:387) | GL₂→PGL₂ at p=3; SL₂→PGL₂ class 1; p=2 | Derived fundamental order of PGL₂=2, invertible at 3, not at 2; SL₂ lift equation 2n=1 unsolvable | Survives stated lift/prime restrictions |
| §1.5 auxiliary Hodge cover (:399) | Split GL₂ line at odd p; central μ | Derived π₁(SL₂) order=1; E=F; adjoint central μ=0 | Identity cover works; trivial adjoint factor does not force an exceptional-type obstruction |
| §1.6 one-lattice GL (:409) | h=3,d=1; d=0,h; h=0 | Lines=P², quotient rank=2; endpoints and rank zero each give one point | Survives; module Grassmannian has quotient-rank indexing |
| §2.1 split-form embedding (:429) | GL₂ at vertex; irrational alcove point over Q₃; indices 3,2 | Vertex comparison=id; e(√2−1) never integral; replacement 1/4 maps to 1 at e=4. At p=3, index 3 rejected, 2 permitted | Survives; moves point without changing fixer |
| §2.2 Weyl lattice embedding (:444), group-scheme stability | Z₃-torus lattice with weights 0,2 and denominator 3; repeated highest weight twice | (1−T²)/3∉Z₃[T,T⁻¹] though units give divisible values; multiplicity centralizer is GL₂ | Survives revised group-scheme condition; point-stability insufficient |
| §2.3 restriction of structure (:454), arbitrary finite K/F | Unramified quadratic torus, μ=(2,0),(1,0); constant rank d | Source point in both; target dimensions 2 and 1; total ranks ed and e(n−d), at d=0 quotient=en | Survives; minuscule for a torus need not map to minuscule GL bound |
| §2.4 representation power (:474), p>2, prescribed product type | GL₂ line repeated twice; m=0 excluded | Source dimension=1; target Gr(2,4) dimension=4; m=0 has full kernel | Survives; changed full fixer is retained |
| §2.5 GL chains (:484), finite nonempty period | Two lattices; endpoints d=0,h; partial ambient refinement; dual numbers | Equation πad−bc=0; special bc=0 has 2 components. Endpoint model=point. Ambient one-step refinement fibre=P¹, whereas model forgetful fibres=P¹ or point. [1:0]≠[1:ε] over k[ε]/ε² | Survives; smooth ambient refinement is not the nonsmooth model forgetful map |
| §2.5 GSp chains (:509), alternating perfect pairing | Rank 2 at p=2; rank 4; plane ⟨e₁,f₁⟩ | GSp₂=GL₂; LG(2,4) dimension=3 vs Gr(2,4) dimension=4; pairing(e₁,f₁)=1 even in F₂ | Survives; self-annihilator equation discriminates |
| §2.6 symplectic embedding (:527), tame factorization hypotheses | Rank-2 identity; centralizer multiplicity 2 | GL₂ line equation unchanged; two rank-2 summands have dimension 4, deleting multiplicity gives 2 | Survives; multiplicities/translations retained in gap |
| §2.7 period-total (:537), r≥1 | r=2,h=2,d=1 | P¹×P¹→Gr(2,4); block ranks=(1,1). Rank-(2,0) direct-summand point is outside image | Survives; projections and ranks cut out closed image; r=0 excluded |
| §2.8 trace symplectic form (:549), finite separable K_i/F and common multiplier | K=F; zero module; purely inseparable degree p; two multipliers 1,2 | Trace pairing is original; zero dual=0 so nondegenerate. Inseparable trace=0 on nonzero space. Over Q₂, common multiplier cannot be both 1 and 2 | Survives; separability and common multiplier are used |
| §3.1 canonical standard model (:569) | Add μ=0 factor; quasi-tame prime-to-p case; PU₃ at p=3 | Dimension remains 1; canonical=polynomial in allowed range; PU₃ fundamental order=3, raw special fibre nonreduced while canonical fibre reduced | Survives; no use of raw bad-prime model as canonical |
| §3.2 normalization of image (:592), supplied normal representative M | Cusp; trialitarian scalar-twist h=d=24 | Missing t prevents closedness; Gr(24,24)=point, normalization=id despite nonstandard derived factor | Survives conditional formulation |
| §3.3 descent endomorphisms (:602) | Unramified quadratic K/F, Frobenius σ on K | σ commutes with Γ=C₂, but σm_a=m_(σa)σ≠m_aσ for a∉F | Survives; Γ equations alone fail, O_K multiplication equations exclude σ |
| §3.4 special-fibre comparison (:612), minuscule depth zero | Hyperspecial (1,0),(2,0),0; Iwahori line | First congruence fixes P¹; (1+pE₁₂)e₂=e₂+pe₁ outside p²We₁+We₂; zero=point. Iwahori reductive quotient kills u but u[0:1]=[a:1] | S01; retain full special-fibre group |
| §3.5 kimberlite (:628), every bound | μ=0; GL₂ (2,0) | Generic/reduction dimensions 0/0 and 2/2; zero specialization point→point surjective | Survives; generic need not be a minuscule flag |
| §3.6 weak normal model (:638), minuscule all p | μ=0 at p=2,3; finite cusp modification | Model Spec O_E, normalization=id; cusp k[t²,t³] has proper finite birational universal-homeomorphism normalization | Survives; arbitrary reduced model is not weakly normal |
| §3.7 smooth maximal-orbit open (:648) | GL₂ hyperspecial and Iwahori; ramified quadratic trait | Open=P¹ or model minus node; node tangent fibre dimension 2 vs fibre dimension 1. Trait special k[t]/t² tangent dimension 1 vs dimension 0 | Survives; excludes falsely inferring smoothness from perfection |
| §4.1 formal-curve span (:672), pointed k-schemes | A¹; dual numbers; node xy=0; x(x+yz)=0 | (tangent,span) dimensions=(1,1),(1,0),(2,2),(3,2); node derivative (1,1) impossible | Survives; linear span differs from derivative set |
| §4.2 tangent-cone obstruction (:696) | Reduced surface x(x+yz)=0 | f=0 or f=−gh, so f′(0)=0; y,z axes give span dimension 2; tangent dimension 3, reduced cone plane dimension 2 | Survives; surface is nonnormal, not claimed normal |
| §4.3 big cell (:706) | SL₂ λ=α∨; identity translation | Root coordinates t^(2−1)E=tE and t^(−2−1)F=t⁻³F; Cartan t⁻¹H; λ=0 shifts both roots by 0 | Survives; evaluation is at t⁻¹=0 |
| §4.4 minuscule tests (:716), integral coroot coset | C₂; D₄ two endpoints; B₃ spin | C₂ tests 1,−1 vs wrong weight 0; D₄ tests (0,−1,1)/(0,1,−1); B₃ spin test 0 but odd-sum difference in second example violates coroot congruence | Survives corrected tests |
| §4.5 root interval (:739) | SL₂ λ=0,μ=α∨; λ=μ=α∨ | First k_α=1, j=1 exponent−1, j=2 bound 2>1. Second k_α=2,k_(−α)=0, exponents 1,0 vs ∅ | S06 replaces restatement Check |
| §4.6 FM bound (:762), all dominant Weyl tests, fixed component | SL₂ λ=μ=α∨, standard module; μ=0; degree-p Weyl vs induced | tL=diag(t²,1)O²⊂O²⊂t⁻¹L=diag(1,t⁻²)O²; at μ=0 both bounds force L=O². Weyl/induced have equal dimension p+1 but different head/socle | Survives; retain both inclusions |
| §4.7 root equality (:785), prime-to-p classical range | SL₂ λ=0,μ=α∨, p=2,3 | Root-string coefficient ±1 remains nonzero; FM bound j=1 equals k_α=1 | Survives; no division by 2 in root part |
| §4.8 Cartan curve span (:795) | SL₂ λ=0,μ=α∨; zero; λ=α∨,μ=2α∨ | First space kt⁻¹H; zero space=0; last k_α=3,k_(−α)=1, space kt⁻¹H rather than 3-dimensional span | S06 replaces sign-invariance Check |
| §4.9 Cartan upper bound (:818), nonzero H, Dᴴ endpoint/odd p | SL₂ λ=0 or μ; H=0; H↦2H in F₃; Dᴴ m=1 | Candidate minima min{1,1}=1 and min{0,2}=0. H=0 set=∅, no minimum. Derivatives (1,−1)→(2,1). −2 mod3=1 but mod2=0 | Survives; endpoint and nonempty restrictions explicit |
| §4.10 curve spanning (:841), classical mod-p abelian range | SL₂ S_(α∨) at neutral point; μ=0 | Tangent E,F,H dimensions 1+1+1=3, curve span=3; zero-bound tangent/span=0/0 | Survives; reducible surface counterexample is outside hypotheses |
| §4.11 Weil-restriction tangent (:851), reductive level | Two ramified embeddings of GL₂ with line weights; μ=0 | Summed companion cocharacter (2,0), dimension 2 rather than flag dimension 1; zero case tangent=span=0 | Survives; summed bound need not be minuscule |
| §5.1 invariant orbit step (:871) | D₄ triality, θ=(1,2,1,1); rank 0 | Arbitrary orbit sum=(1,3,1,1)>θ at central coordinate; existential fixed θ uses exactly available coefficients. Rank 0 has no λ<μ | Survives existential formulation |
| §5.2 rank-one curves (:881), unitary p≠2 | SL₂ a=0,1; SU₃ split quadratic formula over F₃; F₂ | a=0 identity, a=1 nontrivial orbit; c=1,d=−1/2=1 gives d+d+c²=0 in F₃; 1/2 undefined in F₂ | Survives excluded dyadic construction |
| §5.3 rank-one closed comparison (:904), prime-to-p central cover | μ₃ over F₃[ε]/ε² | (1+εt⁻¹)³=1, but 1+εt⁻¹ is not a positive loop; order 3 is not invertible | Survives; pointwise kernel computation alone would miss infinitesimal loops |
| §5.4 rational positive-loop lift (:914), rational Laurent translation and connected jets | Lang on G_m/F₃ | x↦x² surjective over algebraic closure, image on F₃×={1}; geometric lifting plus descent needed | Survives; translation need not be positive |
| §5.5 same-residue-field curve (:924) | Rank-one rational point over F₃; μ=0 | Curve A¹_F₃ has c=0 of residue degree 1 and points a≠0 in higher stratum; no higher stratum for μ=0 | Survives quantified non-open-stratum hypothesis |
| §6.1 EL/PEL chain (:944), specified periods and module type | Rank h one period; b=π; quaternion quotient over F_(p²) | Period basis map matrix=I, inclusion composite=πI→0 modπ; quotient factors ranks (1,1), wrong (2,0) has same total 2 | Survives; polarization line not replaced by a chosen trivialization |
| §6.2 stabilizer torsors (:968) | Trivial standard chain; rescale polarization trivialization by unit u | Isomorphism torsor=𝒢; multiplier coordinate rescales by u, underlying line-valued pairing unchanged | Survives; type and descent conditions needed |
| §6.3 naive determinant model (:978) | Single GL₃ quotient rank1; ramified quadratic central EL class | Kernel rank2; A²→A via u+cv has charpoly(T−a₀)² for every c, special dimension≥1 vs generic dimension0 | Survives explicit nonflat control |
| §6.4 de Rham kernel (:1001) | Quotient rank1 in rank3; ξ↦uξ | Kernel=ξBe₁⊕Be₂⊕Be₃, determinant ideal=(ξ); (uξ)=(ξ), independent of generator | Survives; integral divisor-ring convention is necessary at characteristic-p untilts |
| §6.5 EL Drinfeld comparison (:1011), invariant 1/n, n≥2 | n=2 distinguished function; general three-embedding function | Distinguished model relative dimension1, special 2 components; general r has same geometric flag dimension1 after base change | Comparison survives; regularity control below requires S02 |
| §6.5 bold flat Drinfeld/Eisenstein target (:1015) | S=Spec F_p, unramified quadratic order; F=Q₃(∛3),r=(1,2,0) | F_(p²) has no pair of idempotents over F_p, split graded ranks=(1,1); e(E/F)=2 yields xy=unit·ϖ_E² with dimension2, embedding dimension3 | S03 for definition, S02 for Check; flatness/normality themselves survive |
| §6.6 unitary Drinfeld (:1032), ramified p≠2, unramified p=2 allowed | Distinguished signature (1,1); ramified reflex base change | Actual GL₂ weights=(1,0), flag dimension1; central (1,1) flag dimension0. xy=ϖ² dimension2, embedding dimension3 | Survives; trace uses inverse different and only normality after base change |
| §7.1 tube/lowest stalk (:1057), ℓ≠p, general μ | Zero bound; semistable GL₂ node | Tube components=1, lowest stalk dimension=1; node annulus connected, H⁰=F_ℓ | Survives; comparison uses declared algebraicity/cohomology inputs |
| §7.2 at most two translations (:1067) | GL₂ Iwahori line; rank zero | Node belongs to exactly 2 maximal components; smooth point to 1; rank zero has 0 codimension-one strata | Survives |
| §7.3 S₂ (:1077), weak normality/unibranch components and finite S₂-ification | Node; two affine planes meeting only at origin | Node local dimension=depth=1 and component graph has 2 vertices,1 edge. Double-plane union dimension2,depth1; graph has 2 vertices,0 edges in codimension1 | Survives; coherence alone would not supply S₂ |
| §7.4 Wakimoto stalk bound (:1087), extremal filtration and S₂ | Dense maximal orbit; GL₂ node | Dense lowest stalk rank1; at node extremal standard contributions have lowest ranks 0 and 1, total bound1 | Survives conditional on explicit modular-coefficient contracts |
| §7.5 connected tubes (:1099), every G,μ,p | μ=0 at p=2; GL₂ node at p=3 | Point tube components1; annulus components1; H⁰ dimensions1/1 | Survives; no good-prime restriction introduced |
| §7.6 normal minuscule models (:1109) | μ=0; node xy=ϖ²; ramified trait as excluded reducedness shortcut | Spec O_E normal; xy=ϖ² normal with special xy=0 reduced; trait k[t]/t² not reduced and no smooth maximal-orbit open | Survives using §3.7 and algebraically closed residue descent |
| §7.7 acceptable good embeddings (:1119), p>2 and stated π₁/R-smoothness | Identity GL₂; finite map with cokernel C; cusp | Identity C=0; finite C with C/πC=0 gives C=0 by Nakayama; cusp missing t gives C≠0 | Survives; closedness does not follow from universal homeomorphism alone |
| §7.8 lattice criterion (:1129), acceptable good datum and full=connected fixer | GL₂ inverse g=diag(π⁻¹,1), diag(π⁻²,1) | First πgΛ/πΛ=ke₁ gives admissible point; second πgΛ not contained in Λ, so membership false without taking an undefined quotient | Statement survives; proof input needs S07 |
| §8.1 nearby cycles/monodromy (:1149), general IC; tame splitting-field inertia | μ=0; smooth GL₂ at q=9; N≠0,N²=0 | IC rank1 degree0; normalized smooth trace−1/3; unipotent block not identity | Survives; not all reflex inertia is asserted trivial |
| §8.2 semisimple trace (:1165), finite residue field, chosen square root | q=9,d=1; unipotent rank2 block; μ=0 | φ=1,τ=−1/3; graded trace=1+1/9=10/9 vs raw invariants1/9; zero bound unit=1_P | Mathematics survives; S04 for names |
| §8.3 centrality (:1186), fixed lift before averaging | Same smooth support; μ=0 | κ=1/3=(−1)τ, φ=1; zero yields κ=τ=φ=1_P, convolution identity | Survives ordinary/semisimple distinction |
| §8.4 Satake characterization (:1200), all inner forms and dominant μ | Unramified GL₂, q=9; μ=0 at Iwahori | Spherical image z=1/3, q^(d/2)z=1=φ; trivial representation trace1, z=1_P | Survives negative half-Tate exponent and normalized level change |

### Bold worked examples and global claims

| Statement | Instances and computed values | Result/change |
|---|---|---|
| Summary and scope (:3–15) | μ=(2,0) gives dimension2 Schubert generic fibre; μ=(1,0) gives dimension1 flag; p=2 zero model Spec O_E | General tube/IC claims are separated from minuscule scheme claims; S07 is the remaining proof-scope leak |
| Two-lattice line model (:1228) | Chain determinant πad−bc; a=d=1 gives bc=π; modπ tangent dimension2 vs component dimension1; total ranks(2,4) | Survives |
| Curve-span obstruction (:1230) | f(f+gh)=0 implies ord(f)≥2 or f=0; derivatives span ⟨∂y,∂z⟩ dimension2, full tangent dimension3 | Survives corrected nonnormal description |
| Orbit sums (:1232) | Three orbit summands give (1,3,1,1); budget θ=(1,2,1,1); fixed θ yields λ+θ=μ | Survives existential rather than arbitrary orbit step |
| Trace example (:1234) | Degree−1 sign−1, twist eigenvalue1/3, trace−1/3; wrong positive exponent gives−3; 3z=1 | Survives |

The identity/nonidentity, zero/nonzero, small-rank, p=2/3, split/nonsplit, ramified/unramified, nonreduced-test-ring and normalization tests above are applicable instances. A zero ring cannot be a local field or DVR in these targets; n=0,1 are outside §6.5's n≥2; inseparable extensions are outside §2.8; empty determining periods and zero faithful multiplicity are excluded. S₃ and Q₈ are not connected reductive algebraic-group test objects for these statements. No arbitrary topology, unbounded index, natural-number truncated subtraction or division-by-zero operation is used in a Lean declaration.
## Verified sound

Coverage: all 1,259 README lines and all 52 Suggested.lean lines read; 0 Lean declarations; 61 numbered sections, with 63 separately audited constructions when GL/GSp and the added Drinfeld geometry are separated; 4 bold worked examples; 103 explicit Check bullets in 30 blocks evaluated against their defining statements. S02 identifies a false Check, and S06 identifies two nondiscriminating Checks. The ledger records the discriminating calculations and boundaries rather than treating a `sorry` build as evidence of truth.

Thirteen earlier findings were revisited: eleven repaired and two partly repaired. The latter are a-F01 (S01, plus the remaining scope leak S07) and a-F10 (S02–S03). No finding marked not actionable in the repair report is being re-raised.

The 166 distinct explicit source-line anchors were located and read in the 21 supplied legal source extractions. The substantive source comparisons include LEV's arbitrary-bound normality, the minuscule restriction in AGLR's depth-zero comparison, KPZ's root/Cartan characteristic ranges, GL's S₂ and tube argument, RZ17's rank-condition descent and special-fibre calculation, and AGLR's arbitrary-group test-function theorem. These are locator/scope checks, not an independent reconstruction of all source proofs. The new errors in S01–S03 are not licensed by those sources.

Eight pinned API citations were resolved by reading their definitions or statements:

| Native declaration | Pinned relative file/line | Scope checked |
|---|---|---|
| `Submodule.span` | Mathlib/LinearAlgebra/Span/Defs.lean:46 | Span, not merely a union of derivative images |
| `Algebra.trace` | Mathlib/RingTheory/Trace/Defs.lean:70 | Algebra trace; nondegeneracy is a separate theorem |
| `Module.Grassmannian` | Mathlib/RingTheory/Grassmannian.lean:66 | Quotient is finite projective of stalk rank n; over the zero ring Spec=∅, n=0 and n=1 both admit the unique zero submodule. This is not a represented Grassmannian scheme |
| `traceForm_nondegenerate` | Mathlib/RingTheory/Trace/Basic.lean:501 | Finite-dimensional separable field algebra; not an inseparable extension |
| `AlgebraicGeometry.Scheme` | Mathlib/AlgebraicGeometry/Scheme.lean:40 | General scheme carrier; no implicit normality or flatness |
| `AlgebraicGeometry.IsClosedImmersion.iff_isProper_and_mono` | Mathlib/AlgebraicGeometry/ZariskisMainTheorem.lean:392 | Proper monomorphism criterion; not finite pointwise-bijective maps |
| `TauCeti.AlgebraicGeometry.ZariskiTangentSpace` | TauCeti/AlgebraicGeometry/TangentSpace/Basic.lean:65 | Residue-field dual of cotangent space; singular schemes allowed |
| `Derivation.adjointWeightSpace` | TauCeti/Algebra/AlgebraicGroup/Tangent/RootSpace.lean:100 | Hopf-algebra/torus-map context with finite projective cotangent hypotheses; not an affine Schubert scheme |

The hashes, rather than these declarations, are stale (S05). No roadmap-local declaration duplicates a pinned declaration because Suggested.lean declares none.

### Headline acceptance coverage

| README headline group | Suggested.lean docstring coverage | Missing native statement carriers at the pins |
|---|---|---|
| Polynomial normality and adjoint/isogeny comparisons (§§1.2–1.4) | First bullet | Polynomial BD Grassmannians, Schubert closures and their comparison maps |
| Auxiliary Hodge covers (§1.5) | Second bullet | Local reductive/cocharacter datum, reflex field and level |
| Chain flatness, polynomial Hodge/symplectic and total embeddings (§§2.1–2.7) | Third bullet | Represented lattice-chain Grassmannians and polynomial local models |
| Standard canonical models and normalization (§§3.1–3.3) | Fourth bullet | Integral v-local models and comparison morphisms |
| General weak normal models (§3.6) | Fifth bullet | Integral v-models, kimberlites and specialization triples |
| Root/Cartan tangent equality (§§4.7–4.9) | Sixth bullet | Algebraic affine Schubert schemes and FM bound subschemes |
| Formal-curve spanning (§§4.10–4.11) | Seventh bullet | Those schemes and pointed formal-curve tangent map |
| Rational Schubert curves (§5.5) | Eighth bullet | Companion flags and valued-root orbit strata |
| EL/PEL chain torsors and kernel map (§§6.2–6.4) | Ninth bullet | Integral polarized-chain moduli and modification v-sheaves |
| EL Drinfeld comparison (§6.5) | Tenth bullet | Represented determinant/Eisenstein models and diamond map |
| Unitary Drinfeld comparison (§6.6) | Eleventh bullet | The corresponding signature/Hermitian-level models |
| Connected tubes (§7.5) | Twelfth bullet | Local-model kimberlites, tubes and nearby-cycle categories |
| Normal models at all primes (§7.6) | Thirteenth bullet | Local-model v-sheaf and weak normal representative |
| Acceptable good embeddings and lattice criterion (§§7.7–7.8) | Fourteenth bullet | Integral Hodge model, represented Grassmannian map and admissible stratum |
| Monodromy and general test-function/Satake theorem (§§8.1–8.4) | Fifteenth bullet | Local-model nearby cycles, central sheaves and parahoric Satake functions |

A module Grassmannian or a Zariski tangent vector space does not supply these missing geometric constructions. No statable headline was found forced through arbitrary predicates or replaced by an algebraic stand-in. The elementary separable trace-pairing observation in §2.8 is useful background, not a substitute headline; adding a one-library-lemma acceptance declaration for it would be padding.

### Ownership, supplier contracts and direction

Twelve roadmap supplier families were checked against their current main copy, available open-head text or board design, as applicable. The resolver's two missing-roadmap leads resolve to board designs, not missing mathematical owners. The three unresolved Lean names are S04.

| Supplier | Sections/objects checked | Outcome |
|---|---|---|
| SchemeAndStackFoundations | §§0.8, 0.17–0.21, 0.23–0.30, 1.1, 4.6–4.14; depth, descent, normality, normalization, tangent carrier and algebraization | Generic foundations remain there; pointed derivatives, trait criterion, finite weak normalization, S₂-ification and fpqc normality are separately declared gaps |
| ModularCurves | §0G, README:427–441, represented relative Grassmannian | Native module Grassmannian is not mistaken for the scheme; §0G explicitly constructs charts, gluing and universal property |
| ReductiveGroups | §10B, README:1759, induced/Weyl modules and integral lattices | Repaired ownership citation exists on main |
| ReductiveGroupsPartII | RG2.0a–RG2.5: Weil restriction, roots, buildings, group quotients, tame realization, Lang/pro-limits, admissibility, L-groups | Integral representation/polynomial/R-smooth extensions are gaps, not falsely attributed to the existing sections |
| RootSystemsPartII | Board design §RS2.4 and MB.1–MB.3 continuation brief | Existential invariant orbit step exists; modular coefficient calculations are declared extensions |
| GeometricSatakeAndFusion | GS0 named generic, equal-characteristic, integral-parahoric, admissible and flag-correspondence targets; GS2, GS4 | Owns underlying carriers and v-special-fibre theorem; algebraic/deperfection and early-central enhancements remain explicit gaps |
| DiamondsAndVStacksPartII | Board design D10.8–D10.15, D11.5, D11.11–D11.20 | D11.20 requires algebraically closed residue field, retained here. D10.15 takes the one-lattice GL identification as a hypothesis; §1.6 establishes it without consuming D10.15, so there is no circular proof |
| PELModuli | M0 rational EL/PEL structures | Ramified integral data are outside its good-reduction range and correctly declared as an extension |
| EtaleDualityAndPerverseSheaves | §§2.1–2.3, 2.6–2.10 | Modular perverse/IC inputs distinguished from rational weight/decomposition results |
| LefschetzPencilsAndVanishingCycles | LPV.0, LPV.1 §1.10, LPV.6 §§6.1–6.2 | Mathematical trace operation is present; three obsolete names require S04 |
| ClassicalAdicEtaleCohomology | §4.5a | Formal/adic nearby-cycle comparison exists; D11 supplies the separate v-sheaf comparison |
| SmoothRepresentationsOfLocalGroups | SR.1, SR.3.2, SR.4.1 | General parahoric-centre, inner-form, level-change and companion enhancements are explicitly requested rather than assumed from the narrower base targets |

All 44 gap slugs occur both in design/plan.json and in the README's exact supplier contracts, with identical needs sentences and a named supplier. The added admissible-CM and generic-Schubert-normality contracts are distinct from the coherence equality: dimension of global sections does not give depth. No undeclared gap, supplier `none`, duplicate requested native API, or new upward dependency was found among them. Their eventual implementation is a condition of the roadmap; their current absence is not a finding.

Object searches used the roadmap search service, the board packages and the supplied main/open files, looking for local-model closures, formal-curve spans, Eisenstein conditions, lattice-chain embeddings, tube normality and Wakimoto inputs. The generic Grassmannian, tangent carrier, Weyl module, root orbit, kimberlite and central-sheaf objects are cited to their existing owners. The present package owns the integral local-model applications and comparisons, rather than a second copy of those generic objects. No duplicate fully qualified Lean name can arise from the empty namespace. No claim is made about unlisted private or unavailable work.

Mechanical dependency check, with the requested movable setting and current merge order:

```text
depcheck: 186 roadmaps, 1221 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. Internally, the repaired chain geometry precedes its symplectic use; the new smooth-open target precedes reducedness; the early central contracts do not depend on tube connectedness. S07 is a scope mismatch in a proof input, not a cycle.

The read-only git diff-stat check against origin/main showed package-folder changes only. README/Suggested.lean have no pull-request identifiers, `set_option`, sorry'd data, admitted examples, computational algorithms or forbidden imports. The report is the only package file written in this pass.

## Not verifiable

- No Lean elaboration or build was run, as explicitly prohibited. The supplied signature extraction failed before producing a signature; Suggested.lean has zero declarations, so there is no unverified theorem binder hidden by that failure.
- The 44 declared extensions are contracts, not proofs supplied at the pins. The review is conditional on their implementation at their stated hypotheses, especially the modular-coefficient Wakimoto inputs and the integral representation/deperfection comparisons.
- The source review verifies the supplied legal versions and locators. It does not certify all proofs in the 21 works or all changes between preprints and subsequently revised editions. Printed page and theorem locators in the errata below refer to the versions actually supplied.
- Ownership checking used the available roadmap index, supplied checkouts, main content, and board package/design files. It does not establish absence of unpublished work outside those inputs.

## Source issues

- **Misprint** in KP at §2.3.4, printed p. 157 (KP line 1524): the source says z=s(y); it should be y=s(z), since s maps the symplectic building to the linear building; affects the proof.
- **Error** in LEV at proof of Theorem 4.2.7, printed p. 25 (LEV line 1030): the source says the whole special fibre must be reduced and normal; it should be reduced with normal irreducible components; affects the proof.
- **Error** in KPZ at Remark 4.1.5(2), printed p. 31 (KPZ line 1354): the source says the surface x(x+yz)=0 is normal; it should be reduced and nonnormal at the origin; affects a stated result.
- **Misprint** in KPZ at Remark 4.1.5(2), printed p. 31 (KPZ line 1354): the source says the polynomial variables are x,y,x while the equation contains z; it should be x,y,z; affects nothing.
- **Misprint** in KPZ at §4.1.7, printed p. 32 (KPZ line 1378): the source says negative polynomial loops are evaluated at t=0; it should be evaluation at t⁻¹=0; affects a stated result.
- **Error** in KPZ at Remark 4.2.8(3), printed p. 34 (KPZ line 1497): the source says the Weyl representation of opposite highest weight is the dual representation; it should distinguish the induced dual in characteristic p and retain both lattice inclusions; affects the proof.
- **Misprint** in KPZ at §4.2.15, type B_n, printed p. 37 (KPZ line 1614): the source says both weight and coweight lattices are Zⁿ; it should include the half-integral spin coset in the weight lattice; affects the proof.
- **Error** in SW at Remark 21.4.2, printed p. 195 (SW line 7494): the source says flatness and reduced special fibre alone imply normality; it should also require normal generic fibre in the noetherian trait setting; affects a stated result.
- **Misprint** in SW at §21.8, printed p. 206 (SW line 7901): the source says the GL₂ cocharacters are (1,1) and (0,0)/(2,2); it should give (1,0) and (0,0)/(1,1), respectively; affects a stated result.
- **Gap** in KZ at proof of Proposition 5.2.3, printed pp. 49–50 (KZ line 2197): the source says individual orbit-step inequalities allow their sum; it should select an invariant integral step existentially, since triality gives central coefficient 3 against budget 2; affects the proof.
- **Misprint** in KZ at Lemma 5.2.5, printed p. 52 (KZ line 2317): the source says the chosen translation is a positive-loop element; it should require a rational Laurent-loop translation with its stated stabilizer; affects a stated result.
- **Misprint** in PZ at §9.d.3(a), printed p. 76 (PZ line 3127): the source says the smooth minuscule trace has positive half-dimension exponent of q; it should have negative exponent with geometric Frobenius and the preceding IC normalization; affects a stated result.
- **Misprint** in RZ17 at proof preceding (5.4), printed p. 20 (RZ17 line 1073): the source says the smaller image is divided by the larger, and uses Π rather than Πⁿ downstairs; it should use Im(Π^(an))/Im(Π^((a+1)n)) and W₀/ΠⁿW₀; affects the proof.
- **Error** in RZ17 at Remark 5.7, printed p. 20 (RZ17 line 1115): the source says the conjectural Drinfeld comparison would imply regularity of every M_r; it should retain ramified reflex base change, where xy=π_F has thickness e(E/F) and can be nonregular; affects a stated result.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "f37fdb5158959af01ba1196e45200d2653016fe9", "job": "RT-GeometricSatakeAndFusionPartII~2a", "model": "gpt-6-astra", "worker": "chris-30"} -->
