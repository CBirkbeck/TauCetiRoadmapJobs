# Review of FourManifolds (pull request #936 at cf9b2be)

**Verdict:** needs changes

## R01 (P2) — Import the existing connected-sum invariants

**Location:** `TauCetiRoadmap/FourManifolds/README.md:403`: “Consume GT's connected-sum operation and prove the homology, fundamental group, orientation, Euler characteristic and signature comparisons.”
**Claim:** The fundamental-group and Euler-characteristic targets repeat GeometricTopology §1.4 on its smooth connected-sum carrier. No distinct TOP extension is identified.
**Witness:** Main `TauCetiRoadmap/GeometricTopology/README.md:958` already states both formulas; PR #1797 retains them in §1.4. For CP²#(−CP²), both give π₁=1 and χ=3+3−2=4.
**Repair:** Replace the opening by “Consume GeometricTopology §1.4's connected sum, fundamental-group formula and Euler-characteristic formula. Construct the marked H₂ splitting and its intersection-form and signature comparisons.” If a TOP extension is intended, state its different carrier and hypotheses separately.

## R02 (P2) — Cite the owner of the Alexander presentation

**Location:** `TauCetiRoadmap/FourManifolds/README.md:1613`, also 184, 1623 and 1642: “MorseNovikov N6's presentation of its Alexander module”.
**Claim:** MorseNovikov consumes this presentation from GeometricTopology; its own construction is the based equivariant chain complex and surgery-torsion comparison. The supplier contract attributes the knot-module theorem to the wrong owner.
**Witness:** Main `TauCetiRoadmap/MorseNovikov/README.md:1249` assigns the presentation to GeometricTopology §4.4; `TauCetiRoadmap/GeometricTopology/README.md:2745` supplies tV−Vᵀ and line 2768 supplies the perfect-commutator criterion.
**Repair:** Replace all four MorseNovikov attributions by “GeometricTopology §4.4's Seifert presentation and perfect-commutator criterion”; remove the MorseNovikov supplier row. Import that criterion in the slice argument. For the unknot this gives the zero module, Δ=1 and trivial commutator subgroup.

## R03 (P3) — Correct the four pinned Fredholm names

**Location:** `TauCetiRoadmap/FourManifolds/README.md:170`, also 173–175, 2426–2430 and 2453: “`TauCeti.parameterProj`”.
**Claim:** The four named declarations exist under `ContinuousLinearMap`, not `TauCeti`. These exact-name supplier citations do not resolve at the pin.
**Witness:** `TauCeti/Analysis/Fredholm/Parametric.lean:144`, 403, 430 and 519 declare `parameterProj`, `parameterProj_surjective_iff`, `index_parameterProj` and `isFredholm_parameterProj` inside `namespace ContinuousLinearMap`; there are no corresponding TauCeti aliases.
**Repair:** Replace the `TauCeti.` prefix by `ContinuousLinearMap.` on these four names everywhere. Keep the module path `TauCeti.Analysis.Fredholm.Parametric`. The existing surjective-total-map and Banach hypotheses match those declarations.

## R04 (P3) — Repair the Bastl locator and its claimed direction

**Location:** `TauCetiRoadmap/FourManifolds/README.md:510`, also 485: “Definition 3.3 and Remark 3.4(2), p. 4”.
**Claim:** In the expressly cited v2 these are on page 6. They define a link's matrix and identify its handlebody form; they do not state that every symmetric matrix is realized by a link.
**Witness:** `bastl2024` lines 257–285 put Definition 3.3 and Remark 3.4(2) on printed page 6 and start with a framed link, not an arbitrary matrix.
**Repair:** Use “Bastl et al., arXiv:2411.08775v2, Definition 3.3 and Remark 3.4(2), p. 6” for the link-to-form comparison. Correct §1.5's page likewise. Give the converse signed-clasp realization its own exact supporting locator.

## R05 (P3) — Finish the missing target locators

**Location:** `TauCetiRoadmap/FourManifolds/README.md:2627`: “Construct the homogeneous derivative resultant for degree-d hypersurfaces, d≥2, with its scalar law and vanishing exactly at a projective critical point.”
**Claim:** The discriminant block has no source locator. The same omission remains for §1.2's bundle comparison, §2.3's coloured-link comparison and §5.2–§5.3's metric-transversality, Uhlenbeck and Donaldson targets. Bibliography titles and supplier names alone do not locate these claims.
**Witness:** The complete discriminant block, `TauCetiRoadmap/FourManifolds/README.md:2621` through its Needs paragraph, contains zero theorem, section or page locators; the preceding Gompf–Stipsicz §2.2 citation concerns blowups.
**Repair:** Attach exact theorem/section/page locators to those targets, distinguishing source results from the additional comparisons proved here. In particular, locate the resultant vanishing theorem and the generic-node/distinct-critical-value claims separately; retain the x²+y², x² and zero-equation controls.

## Deferred findings

- D01 — stands
- D02 — stands

## Verified sound

Previous review, PRREVIEW-FourManifolds~13 (locations below are at this head):

| Previous finding | Head passage | Disposition |
| --- | --- | --- |
| R01 | TauCetiRoadmap/FourManifolds/README.md:2157: “the second variation is 4‖d_A⁺a‖²” | Repaired; torus variation gives the same factor 4. |
| R02 | TauCetiRoadmap/FourManifolds/README.md:469: “Vᵀ−V” | Repaired; the ordered trefoil intersection matrix is [[0,−1],[1,0]]. |
| R04 | TauCetiRoadmap/FourManifolds/README.md:25: “§4.3.1 supplies finite quadratic Arf algebra” and TauCetiRoadmap/FourManifolds/README.md:1591's imported knot Arf theory | Repaired; the membrane/filling comparisons remain distinct targets. |
| R05 | TauCetiRoadmap/FourManifolds/README.md:183 names “§2.2 generalized Schoenflies”, “§4.3”, “§4.4”, “§4.3.1” and “§11.2” | Repaired for the six obsolete requests; the Alexander presentation's separate attribution is R02 above. |
| R06 | TauCetiRoadmap/FourManifolds/README.md:2739: “Consume GeometricTopology §1.7.2's torus mapping-class” | Repaired. |
| R07 | TauCetiRoadmap/FourManifolds/README.md:348: “compare their fundamental classes with ComplexKahlerGeometry K7.2 (§7.3)” | Repaired; main §7.3 owns the cup ring and transported generators. |
| R09 | TauCetiRoadmap/FourManifolds/README.md:1550: “good group π=π₁(X)” and the h/s alternatives | Repaired; π=1 and ℤ are applications. |
| R10 | TauCetiRoadmap/FourManifolds/Suggested.lean:145: “theorem presentation_realization”; line 152 includes “TauCeti.Manifold.Orientation” | Repaired; the elaborated type retains n≥4 and the orientation. |
| R11 | TauCetiRoadmap/FourManifolds/README.md:1247: “concordance classes of smoothings” | Repaired; this does not identify exotic and standard ℝ⁴ up to diffeomorphism. |
| R12 | TauCetiRoadmap/FourManifolds/README.md:3016: “Consume the pinned definite-lattice finiteness theorems” | Repaired; only the trace bound remains local. |
| R13 | TauCetiRoadmap/FourManifolds/README.md:1782: “§10.1, Classification Theorem, uniqueness, printed p. 172” | Repaired; `freedmanquinn` line 5935 is the simply connected theorem. |
| R14 | TauCetiRoadmap/FourManifolds/README.md:2818 cites Hamilton; TauCetiRoadmap/FourManifolds/README.md:2822 cites Salepci; TauCetiRoadmap/FourManifolds/README.md:2920 cites Dolgachev | Partly repaired; R04–R05 record the remaining locator defects. |
| R15 | TauCetiRoadmap/FourManifolds/Suggested.lean:29: “the homological fundamental class itself is supplied at the pin” | Repaired; the missing manifold intersection pairing is distinguished from the class. |
| R16 | TauCetiRoadmap/FourManifolds/README.md:2797: “η³=12ν … by TangentialBordism B3.3” | Repaired; Kirby–Melvin is used for the filling comparison. |
| R17 | TauCetiRoadmap/FourManifolds/README.md:3158: “Simpler algorithmically unrecognizable 4-manifolds” | Repaired; title matches `tancer` line 5. |
| R18 | TauCetiRoadmap/FourManifolds/README.md:3159: “Stefan Bastl et al.” and “Algorithms in 4-manifold topology” | Repaired; matches the cited v2. |
| R19 | Description, roadmap-summary: “The geometric E₈ plumbing is specified locally” | Repaired as a description of the head; D02 is separately deferred. |
| R20 | TauCetiRoadmap/FourManifolds/README.md:1241: “Consume the earlier unstable smoothing comparison” | Repaired. |

- R03 — not repaired: deferred (D01)
- R08 — not repaired: deferred (D02)

The following are instance tests, not claims that a `sorry` proves a theorem. “Uncertified” refers to the source-access list below.

| Statement | Instances tried | Computed left side | Computed right side | Result / change |
| --- | --- | --- | --- | --- |
| Conventions: intersection lattice | S⁴; S²×S²; −CP² | ranks 0,2,1; signatures 0,0,−1 | empty form; H; [−1] | Signed integer subtraction agrees. |
| Conventions: torsion quotient | Enriques order-two class t | 2t=0; integral pairings with t vanish | free rank 10; w₂ retains ρ₂t≠0 | Torsion is not discarded before Wu theory. |
| §1.1 Projective/product generators — sample | CP²; S²×S² | h²[CP²]=1; a²=b²=0, ab=1 | [1]; [[0,1],[1,0]] | Torres and imported cup convention agree. |
| §1.2 Sphere bundle | section S and fibre F | S²=−1; F²=0; SF=1 | (S+F)²=1; (S+F)S=0 | diag(1,−1); locator R05. |
| §1.3 Connected sums — sample | CP²#−CP²; CP²#CP² | χ=4,4; σ=0,2; π₁=1,1 | [1]⊕[−1]; [1]⊕[1] | Mathematics agrees; ownership R01. |
| §1.3 Unit summand | M#S⁴ | ΔH₂=0; Δχ=2−2=0 | H₂(M); χ(M) | Marked inclusions retained. |
| §1.4 Linking/intersection matrix | framings 1,2; linking 1 | Q=[[1,1],[1,2]]; det=1 | cores have squares 1,2 and product 1 | Agreement. |
| §1.4 Handle slides | Q=diag(0,1); P=[[1,0],[1,1]] | PᵀQP=[[1,1],[1,1]] | det=0 before and after | A slide changes the marked matrix. |
| §1.4 Seifert sign | V=[[1,0],[−1,1]] | Vᵀ−V=[[0,−1],[1,0]] | det(tV−Vᵀ)=t²−t+1 | Supplier convention retained. |
| §1.4 Blowup versus slide | adjoining a +1 unknot | rank increases by 1; signature increases by 1 | Q⊕[1], not PᵀQP in the old rank | Distinct operations. |
| §1.5 Boundary homology | Q=[0],[2],[1] | ker=ℤ,0,0; coker=ℤ,ℤ/2,0 | boundary H₂ and H₁ respectively | No finite-order claim for det=0; R04 locator. |
| §1.6 Matrix realization — sample | empty; [[1,1],[1,2]] | det=1,1; component counts 0,2 | empty link; framings 1,2 and linking 1 | Values agree; source direction R04. |
| §1.6 E₈ plumbing — sample | pinned negative tree; reversal | leading minors −2,3,−4,5,−6,7,−8,1 | det=1; σ=−8,+8 | Orientation and core signs agree. |
| §1.6 Wrong edge signs | −2I+A versus −2I−A | entry (2,7)=1 versus −1 | both det=1, σ=−8 | Entry Check distinguishes congruent wrong marking. |
| §2.1 Mapping cone | rank 0; rank 1 | point plus 4-cell; S² plus Hopf 4-cell | S⁴; CP² | Source proof locator uncertified. |
| §2.2 Wedge π₃ — sample | r=0,1,2 | Hopf generators 0,1,2; mixed generators 0,0,1 | total ranks 0,1,3 | Hatcher Example 4.52 agrees. |
| §2.2 Hopf/Whitehead normalization | η; [ι₂,ι₂] | Hopf invariants 1,2 | η; 2η | Factor two retained. |
| §2.2 Attaching coordinates | Q=[[1,1],[1,2]] | Q⁻¹=[[2,−1],[−1,1]]; QQ⁻¹=I | 2η₁+η₂−[ι₁,ι₂] | Cup basis differs from core basis. |
| §2.3 Coloured PT — sample | no colours; +1 unknot; positive Hopf link | coordinates (), (1), (0,0,1) | constant map; η; mixed Whitehead class | Framing/linking tests agree; R05 locator. |
| §2.4 Isotropic splitting — sample | H; diag(1,−1); diag(1,−2) | v=(1,0),(1,1); last equation x²=2y² has only zero | primitive isotropic class in first two only | Unimodularity needed. |
| §2.4 Odd rank-two splitting | v²=0, vw=1, w²=1 | (w−v)²=−1; (w−v)w=0 | diag(−1,1) | Integral companion convention agrees. |
| §2.4 Homotopy classification — headline/sample | H versus diag(1,−1); CP² versus −CP² | same rank/signature, different parity; signs +1,−1 | no equivalence in first pair; no oriented equivalence in second | Both directions distinguished; source uncertified. |
| §3.1 Local TOP consequences — sample | standard ball; concentric spheres | annular region has radii [1,2]; ball boundary S³ | S³×[0,1]; D⁴ | Round local model agrees. |
| §3.2 Wall self-intersection — sample | one positive double point, e=0 | μ=1; μ+μ̄+e=2 | λ=2 | Not λ=1. |
| §3.2 Orientation involution | orientation-reversing generator g | ḡ=−g⁻¹; overline(ḡ)=g | ω(g)=1 gives two cancelling signs | Twisted convention retained. |
| §3.2 Good groups | 1; ℤ; finite group S₃ | growth 1; linear; bounded by 6 | all subexponential, hence good | Nonabelian finite case included. |
| §3.2 Disk embedding — headline/sample | standard dual disk/sphere pair | λ(f,g)=1; μ(g)=0; λ(g,g)=0 | one embedded disk with geometric dual | Theorem A includes retained dual homotopy classes. |
| §3.2 Regular-homotopy variant | double-point-free framed disk | μ(f)=0; e(f)=0 | embedded framed disk with same boundary | Extra regular-homotopy condition retained. |
| §3.2 Tower/decomposition construction | identity decomposition of D²×D² | every nondegenerate fibre absent; quotient map identity | quotient D²×D² | Tests carrier, not a replacement for shrinkability. |
| §3.3 Controlled disk extension — headline | boundary degree-one S¹→S¹; map to a point | extension obstruction 1 versus 0 | no D² extension versus constant extension | Relative connectivity hypothesis discriminates. |
| §3.3 Control bounds | image diameter 1/4 | 1/4<1/2; 1/4>1/8 | 1/2-small; not 1/8-small | Scale parameter is meaningful. |
| §3.4 Radial isotopy | r=1/64 in displayed estimate | 3/64=3840/81920 | (63/64)²/20=3969/81920 | Strict inequality holds. |
| §3.4 PL controlled product — headline/sample | product W=M×I, identity control | relative chain complex contractible; q₁=0 | product structure already present | FQ 7.5/7.6 hypotheses retained. |
| §3.4 Whitehead coefficients | local groups 1 and ℤ | Wh=0; K̃₀=0; negative K=0 | obstruction coefficient groups vanish | K-theory supplier sections resolve. |
| §3.4 Proper product | standard ℝ⁴×I | π₁ at infinity=0; proper torsion=0 | proper product | Ordinary contractibility alone is not substituted. |
| §3.5 Noncompact smoothing | standard/exotic ℝ⁴ | H³(ℝ⁴;F₂)=0 | one concordance class; different diffeomorphism types allowed | Repaired equivalence relation. |
| §3.5 Marked ball | D⁴ with standard S³ marking | π₁=0; reduced homology=0 | TOP marked ball | No smooth Poincaré conclusion. |
| §3.5 Stable pseudo-isotopy | identity pseudo-isotopy | stabilization count 0 suffices | identity rel bottom and sides | General theorem retains finite stabilization. |
| §3.5 Normal bundle | standard R²⊂R⁴ | normal fibre R²; Euler number 0 | trivial rank-two normal bundle | Rank and category distinguished. |
| §3.5 TOP transversality | 4-dimensional domain, codimension 5 | expected dimension 4−5=−1 | empty preimage | No natural-number truncation. |
| §3.5 Preimage-four branch | M⁴×ℝ→ℝ, Y={0} | preimage M×{0}, dimension 4 | codimension-one product collar | Separate branch is needed. |
| §3.6 Normal invariants — sample | point; S²; S⁴ | [−,G/TOP]=0; F₂; ℤ | low-stage cohomology gives same sets | Degree-four generator has signature defect 8. |
| §3.6 KS normal defect | (a,b)=(0,0); generator on S⁴ | ⟨a²+ρ₂b,[M]⟩=0,1 | KS differences 0,1 | σ/8 normalization, not σ/16. |
| §3.6 Normal maps | identity on compact oriented M | degree 1; stable normal map identity | zero normal invariant and zero surgery kernel | Data are tied to M. |
| §3.6 Pinch correction | α line in CP²; sphere factor in S²×S² | 1+w₂(α)=0,1 in F₂ | correction 0, PD(α) respectively | Odd and Spin branches distinguished. |
| §3.6 General surgery — headline/sample | identity on S¹×RP³ | π=ℤ×ℤ/2; degree 1; kernel 0 | obstruction 0; identity homotopy equivalence | Scope exceeds 1 and ℤ. |
| §3.6 Nonorientable coefficients | orientation character on a reversing loop | ḡ=−g⁻¹ | same involution in Lʰ/Lˢ groups | Orientation character not silently trivialized. |
| §3.6 Spin filling | Ω₃^Spin(S¹) | Ω₃^Spin⊕Ω₂^Spin=0⊕F₂ | F₂; invariant Arf(F̂) | Unmarked Spin filling alone is insufficient. |
| §3.6 Alexander criterion | unknot; trefoil V | modules 0; Λ/(t²−t+1) | Δ=1; t−1+t⁻¹ | Criterion agrees; supplier attribution R02. |
| §3.6 Slice theorem — Lean headline | unknot | group ℤ; commutator 1; Δ=1 | standard locally flat D²⊂D⁴ | Native hypothesis is nonvacuous. |
| §3.6 Annulus theorem — Lean headline | radii 1 and 2; equal radii | radial width 1; width 0 | annulus in first case; nesting fails in second | Native predicate retains local flatness and strict nesting. |
| §3.6 Contractible caps | homology-sphere boundary of E₈ plumbing | H₁=0; determinant 1 | TOP cap permitted; smooth cap not inferred | Category distinction retained. |
| §3.7 Realization — headline/sample | 0; H; E₈; [1] | σ=0,0,8,1 | allowed KS={0},{0},{1},{0,1} | Even/odd alternatives agree with FQ §10.1. |
| §3.8 Homeomorphism classification — headline | odd form [1] with KS 0 and 1 | forms equal; KS unequal | homotopy types equal; TOP homeomorphism excluded | KS is necessary. |
| §3.9 Definite/rank-zero | E₈; 2E₈; rank 0 | (σ,KS)=(8,1),(16,0),(0,0) | nonsmooth first two; TOP S⁴ last | KS=0 is not a smoothability assertion. |
| §4.1 Spinᶜ existence/torsor — headline | CP²; S²×S²; Enriques | βw₂=0 in each; determinants 3h,0,t | lifts exist in each case | Salamon's even-rank result supports the starting case. |
| §4.1 Determinant action | CP² twist h; Enriques twist t | 3h+2h=5h; t+2t=t | distinct lifts; determinant unchanged in torsion case | Determinants do not classify lifts. |
| §4.2 Wu criterion | S²×S²; Enriques | free forms even in both; w₂=0,nonzero | Spin true,false | No-2-torsion qualification matters. |
| §4.2 Characteristic-surface formula | CP¹⊂CP²; empty surface in E₈ | (1−1)/8+0=0; 8/8=1 | KS=0,1 | Both normalization tests agree. |
| §4.2 Quadratic refinement | symplectic a,b with q(a)=q(b)=1 or 0 | q(a+b)=1 in both cases | Arf=1 or 0 | Polarization alone does not fix Arf. |
| §4.2 TOP Spin generalization | S¹×S³; 2E₈ | σ=0,16; σ/8 mod 2=0,0 | KS=0,0 | Loop surgery and smooth obstruction remain separate. |
| §4.2 Smooth Rokhlin comparison | K3; CP² | −16 divisible by 16; 1 not divisible | K3 Spin; CP² non-Spin | Imported theorem's hypothesis is essential. |
| §4.3 Pontryagin square — headline/sample | CP²; a+b on S²×S² | P(h)=1; P(a+b)=2ab | ρ₄(h²)=1; P(a)+P(b)+2ab=2ab | Cross term has coefficient 2. |
| §4.3 Cochain closure | dc=2b | δ(c²+c∪₁dc)=4(c∪b−b∪₁b) | zero mod 4 | Signed cup-one convention agrees. |
| §4.3 Half-spin convention | TS⁴ with c₂S⁺=−u,c₂S⁻=u | −2(−u+u)=0; u−(−u)=2u | p₁=0; e=2u | Swapping factors gives the wrong Euler sign. |
| §4.3 Rank-three lift action | S⁴, a=u | Δp₁=−4u | adjoint SU(2) generator has p₁=−4u | Factor four distinguished from stable factor two. |
| §4.3 Rank-four lift action | (a,b)=(u,0),(0,u) | Δp₁=−2u in both; Δe=−u,+u | two independent half-spin directions | Euler class separates them. |
| §4.3 Torsion action | RP⁴, w=0, x generator | β(x)² generates H⁴=ℤ/2 | σ₀(x)≠0; rank-three lifts identified | Fixed-map torsor is not absolute classification. |
| §4.3 Stable branch | 4L over RP⁴ | w₂=0, p₁=0, w₄=a⁴≠0 | stable difference d≠0 with 2d=0 | p₁ alone misses torsion. |
| §4.3 Rank-three cancellation control | RP²×RP², c₂=ab | c₂≠0; p₁=−4ab=0 | nontrivial rank-three bundle; stable difference 2ab=0 | Stable and unstable classifications differ. |
| §4.3 All ranks — headline | oriented ranks 0,1,2 over a point/S² | rank-zero e=±1; rank-one trivial; rank-two e=c₁=k | orientation sign; one class; integer classification | Low ranks retained; Dold–Whitney uncertified. |
| §5 Variational energy | ASD A; k=1 BPST bubble | E(A)=8π²; E−8π²k=0 | 2‖F⁺‖²=0 | Energy convention agrees. |
| §5 ASD Hessian | d_A⁺a with norm squared c | E(A+ta)=E(A)+2ct²+O(t³) | second derivative 4c | Repaired factor two. |
| §5.1 Flat deformation | trivial connection on S²×S² | (h⁰,h¹,h²_ASD)=(3,0,3) | index=0−3−3=−6 | Full H²=6 is not ASD H². |
| §5.1 Nonabelian flat stratum | Q₈ representation on Σ₂×Σ₂ | h⁰=0; h¹=6; full h²=24; ASD h²=12 | 6−12=−6=−3(1−8+9) | Irreducible flat obstruction is nonzero. |
| §5.2 Fredholm parameter map | D₁=id; D₂=0 on ℝ | ker total={0}×ℝ; projection=id | index=0; surjectivity true | Pinned result agrees; namespace R03. |
| §5.2 Surjectivity equivalence | D₁=0:ℝ→ℝ, D₂=id | total onto; projection from ℝ×{0} is zero | both D₁ and projection not onto | Total-map hypothesis correctly distinguished. |
| §5.2 Metric transversality | charge 0 Q₈ versus charge 1 branch | k=0 with h²=12; k=1 has positive energy | flat example excluded by k>0 | No false all-flat regularity claim; locator R05. |
| §5.3 Compactification/gluing — headline | one BPST bubble over flat base | charge 0+1=1; energy 8π² | base charge plus bubble charge | Obstruction is retained at nonregular bases. |
| §5.3 Reducible cone | c²=−1, regular charge-one reducible | complex normal dimension 3; circle weight 2 | cone link CP², real dimension 4 | Extra reducible-regularity target retained. |
| §5.3 Donaldson — headline | −I_r; −E₈; −2E₈ | unit pairs r,0,0; ranks r,8,16 | required pair count equals rank only for −I_r | Smooth obstruction discriminates; locator R05. |
| §6 Real blowup | origin; nonzero x∈ℝ² | fibre RP¹; fibre one point | exceptional circle; diffeomorphism off origin | Möbius normal line retained. |
| §6.1 Complex blowup | CP² blown up once | χ=4; σ=0; E²=−1 | Q=[1]⊕[−1] | Complex, not real, blowup formula. |
| §6.1 Discriminant | x²+y²; x²; zero equation | gradients (2x,2y),(2x,0),(0,0) | no projective critical point; [0:1]; excluded coefficient | Values agree; R05 locator. |
| §6.2 Node self-intersection | positive and negative double point, e=−2 | −2+2=0; −2−2=−4 | nodal fibre square 0 only for positive node | Orientation sign discriminates. |
| §6.2 Marked monodromy | positive vanishing cycle A | A=[[1,1],[0,1]]; A(0,1)=(1,1) | right-handed twist adds first cycle | Inverse would give (−1,1). |
| §6.3 Torus factorization | A=[[1,1],[0,1]], B=[[1,0],[−1,1]] | (AB)³=−I; (AB)⁶=I | six twists not identity; twelve twists identity | Column convention retained. |
| §7.1 Quartic index — sample | K3; reversed K3 | σ=−16,+16 | complex indices 2,−2; quaternionic 1,−1 | Imported index normalization agrees. |
| §7.1 Filling/framing — sample | Lie Spin T³; E(1) complement | −8 mod 16=8; 12ν has order 2 in ℤ/24 | boundary ρ=8; η³=12ν | Spin structure and framing distinguished. |
| §7.2 E(n) — headline/sample | n=1,2,3 | (χ,σ,b₂)=(12,−8,10),(24,−16,22),(36,−24,34) | c₁=F,0,−F; parity odd,even,odd | Hamilton formulas agree. |
| §7.2 E(n) forms | n=1,2,3 | I₁,₉; 2(−E₈)⊕3H; I₅,₂₉ | ranks 10,22,34; signatures −8,−16,−24 | Rank and parity agree. |
| §7.2 Elliptic classification — headline | 12 and 24 positive nodal factors | χ=12,24; n=1,2 | E(1),E(2) | Salepci Theorem 1.5; genericity remains a separate target. |
| Quartic polynomial/map — Lean definitions | e₀; e₂; (1,1,1,1); 0 | F=0,0,4,0 | evaluation of four displayed monomials | Native polynomial/evaluation bodies agree. |
| Quartic regularity — Lean headline | e₀; e₂; all ones; 0 | derivatives dz₂, dz₁, 4Σdzᵢ, 0 | ranks 1,1,1,0 | v≠0 excludes the singular affine vertex. |
| Quartic regularity — general critical-point test | all four coordinates nonzero | product of derivative equations gives 81∏zᵢ³=∏zᵢ³ | 80∏zᵢ³≠0 in ℂ | No nonzero critical point; zero coordinate propagates to all zero. |
| §7.2 Two-line quartic/K3 comparison — headline | L₀={z₀=z₁=0}; L₁={z₂=z₃=0} | both F restrictions zero; lines disjoint | fibre H−L₀ has square 0; L₁ meets it once | Section and elliptic class agree. |
| Enriques quadrics — Lean definition | squared coordinates (−1,3,−3,1,0,0) | weighted sums 0,0,0 | common zero set contains a nonzero vector | Nonvacuous complex solution. |
| Enriques Jacobian — Lean headline/sample §7.3 | v=(i,√3,i√3,1,0,0) | first-three-column minor −48 | rank 3 | Surjectivity at an explicit solution. |
| Enriques Jacobian — general support test | nonzero common zero | ≤3 nonzero squares would solve invertible Vandermonde system | support≥4; any three supported columns independent | General rank-three argument. |
| Enriques linear/projective involution — Lean definitions | e₀,e₃; v above | signs −,+; applying twice returns v | two eigenspaces; j²=id projectively | Native injective-map functor used. |
| Enriques zero set — Lean definition | v above; e₀; 0 in represented line | all quadrics 0; Q₀(e₀)=1; Qⱼ(0)=0 | [v] included; [e₀] excluded | Quantifying over the entire line is not vacuous. |
| Enriques freeness — Lean headline | two fixed projective planes | Vandermonde determinants 2 and 2 | only zero squared-coordinate vector on either plane | No fixed point belongs to the zero set. |
| §7.3 Enriques quotient — headline/sample | free degree-two K3 cover | χ=24/2=12; σ=−16/2=−8 | b₂=10; free form H⊕(−E₈); π₁=ℤ/2 | Canonical order-two class remains nonzero. |
| §8.1 Presentation realization — Lean headline | empty presentation; ⟨a∣a²⟩; S₃ presentation | groups 1,ℤ/2,S₃ | n≥4; marked π₁ isomorphism for each | No abelianity or torsion-free hypothesis; source uncertified. |
| §8.1 Dimension restriction | n=2 versus n=4, group S₃ | closed oriented surfaces give 1 or infinite groups | n=2 excluded; n=4 admitted | Lower bound is substantive. |
| §8.1 Nonrecognition — headline | Tancer deficiency k=9 | trivial branch rank 18, σ=0, even, KS=0 | #9(S²×S²); nontrivial π₁ excludes it | Source supplies fixed positive k; no S⁴ assertion. |
| §8.2 Trace bound | Q=Q′=[2]; empty matrix | column norm²=1; trace inverse=1/2 | 2·1/2=1; rank-zero bound vacuous | Nonunimodular and empty cases work. |
| §8.2 Definite isometries | [1]; [2] | isometries ±1 in each | finite cardinal 2 | Pinned theorem includes both cases. |
| §8.2 KS link comparison | characteristic unknot with framing 1 | σ=1; characteristic square 1; Arf=0 | (1−1)/8+0=0 | Framing normalization agrees. |
| §8.3 Exotic four-space — Lean headline | standard ℝ⁴ as negative control | identity is a diffeomorphism | IsEmpty(Diffeomorph)=false | Homeomorphism condition alone cannot satisfy headline. |
| §8.3 Exotic construction obstruction | K3 with 3H removed in the stated comparison | 2(−E₈) has rank 16, σ=−16, no norm −1 vectors | smooth definite form would require 16 unit pairs | Donaldson obstruction is nonzero; Gompf source uncertified. |

- Sources: 15 seeded targets assessed against available text; 14 cached works opened, with more than 25 distinct locators compared; unavailable portions are listed below.
- Pins: 16 declarations inspected at their definitions, including `TauCeti/AlgebraicTopology/Singular/LocalHomology/FundamentalClass.lean:204`, `TauCeti/Analysis/Fredholm/Parametric.lean:144`, `Mathlib/Analysis/Calculus/FDeriv/Defs.lean:162`, and `Mathlib/LinearAlgebra/Projectivization/Basic.lean:105`.
- Suppliers: all 12 supplier-table rows and every Needs paragraph read; the two open new suppliers resolve at #851 and #1212; main and open-head ownership searches expose R01–R02.
- Gate: every worker check passed, including targeted build; independent dependency output: `depcheck: 244 roadmaps, 2210 edges, 0 problem(s)`.
- Lean: direct elaboration passed with seven `sorry` warnings only; `#check @name` inspected all 13 actual declarations, with no lost hypotheses or changes required.
- Padding: all seven admitted theorems resisted the one-tactic `rfl`, `simp` and `infer_instance` probe; inspected library near-matches do not supply any complete headline by one `exact`.
- PR text: one new folder, three files, 3381 insertions, zero outside-folder changes; eight layers, seven theorems and six definitions match the prose and summary block.
- Headline coverage: seven statable headlines appear; remaining carrier-dependent headlines are named in the module docstring, including intersection-form classification, Donaldson, bundle theory, disk/control/surgery, ASD gluing, elliptic geometry and nonrecognition.

Overlap check: read GeometricTopology (main, #1797, #1791), HomotopySpheres (main, #284), InstantonFloerTheory (#1083), CharacteristicClasses (main, #1807), and TangentialBordism (main); GeometricTopology owns connected-sum π₁/χ and Alexander/Arf theory; TangentialBordism owns K3/E(1), Spin bordism and ordinary operations; CharacteristicClasses owns ordinary characteristic classes, FourManifolds the Z/4 refinement; FourManifolds owns compact SU(2) ASD analysis, InstantonFloerTheory the cylindrical/Floer extension; HomotopySpheres overlap remains D02. No second copy, conflicting FourManifolds head or dropped cited ID was found.

Source independence: 31 passages compared with 14 readable sources, with no copied nonstandard expression or reused table detected; largest share freedmanquinn, 41 of 125 explicit author-name source references before the bibliography (repeated references counted, Kirby–Siebenmann invariant mentions excluded). Its contents were compared: independent overall arrangement; §3.2–§3.6's Needs force disk/control before smoothing/surgery, while realization uses FQ Chapter 10 after Chapter 11's surgery. Unreadable works are excluded from the wording comparison.

## Not verifiable

- §1.6's converse realization and the targets in R05: no supporting locator to check for the specified claim.
- `gompfstipsicz`: Theorems 1.2.25 and 1.2.33; §§2.2, 3.1, 5.1, 8.2 — source service reached AMS; no readable copy, arXiv lookup rate-limited.
- `doldwhitney`: Theorems 1–2 and corollary, pp. 671–674 — source service reached JSTOR; no readable copy, arXiv lookup rate-limited.
- `bass1968`: negative K-theory background — source service found no legal text.
- `brown1960`: generalized Schoenflies theorem — source service reached AMS; no readable copy, arXiv lookup rate-limited.
- `cerf1968`: Γ₄=0 — source service encountered network failures and arXiv rate limiting.
- `donaldson1983`: definite-form theorem and gauge proof — Project Euclid landing page supplied no readable PDF through the source service.
- `edwardskirby`: deformation and isotopy extension — source service reached JSTOR; no readable copy, arXiv lookup rate-limited.
- `farrellTaylorWagoner`: proper Whitehead theorem — source service encountered network failures and arXiv rate limiting.
- `freedman1982`: classification and contractible caps — Project Euclid landing page supplied no readable PDF; the FQ restatement was read separately.
- `freedmankirby`: characteristic surfaces and Spin filling — source service reached AMS; no readable copy, arXiv lookup rate-limited.
- `gompf1983`: Theorem 1.2, exotic ℝ⁴ — Project Euclid landing page supplied no readable PDF through the source service.
- `hirschmazur`: PL smoothing comparison — source service encountered network failures and arXiv rate limiting.
- `kirby1969`: torus trick and annulus input — source service reached JSTOR; no readable copy, arXiv lookup rate-limited.
- `kirbysiebenmann`: Essays I, III–V — source service found no readable legal copy.
- `kister1964`: microbundle-to-bundle comparison — source service found no readable legal copy.
- `lashof1971`: immersion/smoothing comparison — source service reached AMS; no readable copy.
- `lees1969`: TOP immersion theorem — source service found no readable legal copy.
- `madsenmilgram`: G/PL low Postnikov stage — source service encountered network failures and arXiv rate limiting.
- `marin1977`: Definition 1.6, stable transversality — source service reached JSTOR; no readable copy, arXiv lookup rate-limited.
- `milnor1959`: Theorem 1 and Corollary 1 — source service reached JSTOR; no readable copy, arXiv lookup rate-limited.
- `munkres1960`: low-dimensional smoothing — source service reached JSTOR; no readable copy, arXiv lookup rate-limited.
- `quinn1979`: controlled obstruction spectrum — source service reached JSTOR; no readable copy, arXiv lookup rate-limited.
- `quinn1982`: Ends of maps III, pp. 503–521 — source service resolved the title to Project Euclid, DOI 10.4310/jdg/1214437139; no readable PDF.
- `quinn1988`: dimension-four transversality — source service reached AMS; no readable copy, arXiv lookup rate-limited.
- `rabin1958`: undecidability theorem — source service reached JSTOR; no readable copy.
- `ranicki1992`: §1, p. 25, quadratic surgery groups — source service encountered network failures and arXiv rate limiting.
- `robertello`: knot-cobordism invariant — source service reached Wiley; HTTP 403.
- `rolfsen`: knot/surgery background — source service found no legal text.
- `serreTrees`: group-theoretic background — source service found no legal text.
- `shaneson1969`: Laurent L-group splitting — source service reached JSTOR; no readable copy.
- `whitehead1961`: transverse-field/smoothing input — source service reached JSTOR; no readable copy, arXiv timed out.
- `hanner1951`: local-to-global ANR theorem — settled uncertified; not requested again.
- `normalbundles`: pp. 310–324, codimension-two normal bundles — settled uncertified; not requested again.
- `bassHellerSwan`: Theorem 2, p. 63 — settled uncertified; not requested again.
- `lickorish`: knot-theoretic source locators — settled uncertified; not requested again.
- `moise`: three-dimensional smoothing — settled uncertified; not requested again.
- `browder1972`: Chapter V §2, especially V.2.6 — settled uncertified; not requested again.
- `kirby1989`: Chapter XI, Spin/Arf filling comparison — settled uncertified; not requested again.

## Source issues

- **Gap** in freedmanquinn at original Theorem 5.1A, proof pp. 86–87, documented at powellrayteichner line 124: the source claims geometric dual spheres after the tower upgrade without controlling their intersections with the added caps; it should preserve geometric duals during that upgrade; affects the proof.
- **Error** in gompfnotes2018 at §1.1, p. 2, line 79: the source treats arbitrary representatives of the projective-line homology class as complex lines; it should choose two distinct complex-line representatives to compute the pairing; affects the proof.
- **Gap** in gompfnotes2018 at Proposition 1.3, p. 3, footnote a, line 94: the source proposes diagonalizing an arbitrary invertible complex matrix; it should use triangularization or the real determinant identity directly; affects the proof.
- **Misprint** in bastl2024 at Definition 3.5(1), p. 6, line 292: the source calls the preceding handlebody statement Proposition 3.4; it should call it Remark 3.4(2); affects nothing.
- **Misprint** in bastl2024 at proof of Lemma 6.5, p. 13, line 639: the source labels the proof Proposition 6.5; it should label it Lemma 6.5; affects nothing.
- **Misprint** in tancer at §1, group presentations, p. 2, line 52: the source indexes the relator alphabet by the number m of relations; it should index it by the number n of generators; affects nothing.

## For the human reviewers

- **Not tested:** the 38 unavailable or settled-uncertified works above could not be compared for wording or reuse. The most-cited source, freedmanquinn, including its contents, was readable.
