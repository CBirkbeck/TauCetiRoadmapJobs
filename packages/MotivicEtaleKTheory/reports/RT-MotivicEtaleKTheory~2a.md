<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1047#issuecomment-6380435178 -->
Red team round 2 pass a (codex) of ee4085a

Verdict: needs_changes

1. **F01** (P2) The logarithmic sheafification does not specify its site

   **Location:** packages/MotivicEtaleKTheory/README.md:406: “define D_log(X,p) by applying 3.3 to the sheafified filtered colimit of the logarithmic algebras of all smooth proper SNC compactifications.”

   **Claim:** This specifies the compactification-independent Deligne complex, with every fixed compactification mapping quasi-isomorphically to it.

   **Witness:** On 𝔸¹, analytic sheafification admits Re z: −2∂∂̄Re z=0, with no incoming boundary. This adds a nonconstant H¹ class; logarithmic H¹ is ℝ. BKK line 4255 and line 4267 require Zariski sheafification.

   **Exact repair text:** “On the small Zariski site of X, form the presheaf U↦colim_(W_U,D_U) Γ(W_U^an,E_(W_U)(log D_U)), over smooth proper SNC compactifications of each Zariski open U. Let E_log be its degreewise Zariski sheafification and set D_log(X,p)=D(Γ(X_Zar,E_log),p). Analytic topology is used for the logarithmic form sheaves on each compactification; the colimit presheaf is sheafified in the Zariski topology.”

   Add the Check: “For X=𝔸¹ and p=1, H¹D_log(X,1)=ℝ consists of constants. The pluriharmonic function Re z has values 0 and 1 at 0 and 1, but is excluded by logarithmic growth at infinity on every nonempty Zariski open. Analytic sheafification would admit it and yield an extra H¹ class.”

   **Repair test:** With W=ℙ¹ and D={∞}, the filtered logarithmic comparison gives H¹_D(𝔸¹,ℝ(1))=ℂ/(2πiℝ)=ℝ. The repaired Zariski construction retains this group; locally smooth Re z cannot enter by removing finitely many algebraic points.

## Earlier findings: repair verification

| Earlier finding | Status at this head | Repaired passage and witness |
| --- | --- | --- |
| r1a F01, integral spectral Adams operations | Repaired | README:200: “Every integral Adams identity here concerns these pointed spaces and their nonnegative homotopy groups.” README:216 computes ψ²[−1]=0 while η·ψ²1=[−1]≠0 over ℚ. Pairings remain spectral at :210; compatibility is explicitly pointed. Suggested.lean:11–14 agrees. |
| r1a F02, nonzero leading class | Repaired | README:314: “chⱼ(O_V)=0 for j<c and ch_c(O_V)=[V]; this class may also vanish.” README:321 computes [O₀]=1−1=0 and [{0}]=div(t)=0 on 𝔸¹; on ℙ¹ both leading classes are h≠0. |
| r1b F01, inverse construction cycle | Repaired | README:249: “This construction is on cycle homology and K-groups.” README:268 first proves cyc invertible, then defines ch. README:272 distinguishes its independent universal space model. cyc₁,₁(2)=[2], and its inverse has valuation 1. |
| r1b F02, finite-field Chern route | Repaired | README:230: “Over a perfect field, including every finite field, instead represent the same universal classes in the functorial Tate complexes”. It also requires agreement over infinite perfect fields. Over 𝔽₂ the missing specialization open has 0 rational points; MVW line 1204 identifies H¹,¹(𝔾_m,ℤ)=𝔽₂[t,t⁻¹]×=t^ℤ, so the new route gives [t] with valuation 1. MotivesAndAlgebraicCycles §§4.4,4.17 supply precisely the functorial complexes and perfect-field comparison (README:602,858). |
| r1b F03, DerivedCategory qualification | Repaired | README:33 now cites “DerivedCategory”. Mathlib/Algebra/Homology/DerivedCategory/Basic.lean:67 opens CategoryTheory, :87 defines DerivedCategory at the root, and :90 starts its own namespace. |
| r1b F04, nondiscriminating Checks | Repaired | README:280 specifies x=([k²],[k]); :304 specifies x=([k²],[O_ℙ¹]), both giving (2,1), versus (1,1) for O_X. README:419 says “Logarithmic pullback sends log|x| to log|e|”; at (2,3) it gives log 2, versus log 3 for the wrong swap. |
| r1b F05, narrative and consumer crosswalk | Partly repaired; external remainder settled | README:713 now says “The motivic character and number-field Deligne normalization used by ZagierConjecturePolylogarithms M.8”; the obsolete-label table is deleted. The repair report classifies consumer edits as not actionable here; TauCetiRoadmap/Polylogarithms/README.md:37,121,826,843,1044 still uses obsolete labels, and packages/ZagierConjecturePolylogarithms/design/plan.json:2968 retains M.8. These are consumer edits; no supplier edge is introduced here. |

All README locations in this table refer to packages/MotivicEtaleKTheory/README.md; the acceptance file is packages/MotivicEtaleKTheory/Suggested.lean.

## Verified sound

Read all 732 lines of packages/MotivicEtaleKTheory/README.md and all 53 lines of packages/MotivicEtaleKTheory/Suggested.lean. The acceptance file has **0 declarations**, hence no section variables, instances, universes or retained binders to elaborate. No Lean command was run. The README contains **27 numbered primary targets, 50 API bullets, 96 computed inventory rows and 119 Check bullets**, including six Checks for the two declared supplier gaps. The computed inventory below treats the numbered targets as the target inventory: the README has no bold mathematical target labels apart from its summary; other bold labels identify Checks, consumers and references.

The pins are Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039, matching lake-manifest.json. The supplied main checkout is edbb842cc069de4a6e319d2d458f4ab047b1b2cd. The read-only diff against origin/main lists eight changed files, all under packages/MotivicEtaleKTheory. Suggested.lean has one Mathlib import, one module docstring and the prescribed namespace, with no declarations, padding, placeholders, admitted data, options or computational code. The README contains no pull-request numbers or process narrative. No suspicious instruction was encountered in the material used as evidence. Only this report and scratch notes were written; the final working-tree status shows only this new report.

### Acceptance-file context and headlines

| File | Declaration and context inventory | One-tactic/padding result |
| --- | --- | --- |
| packages/MotivicEtaleKTheory/Suggested.lean:1–53 | 0 def, abbrev, instance, opaque, axiom, theorem or example; 0 variable/include blocks; no declaration has an implicit context | No candidate exists. A scratch `#check @name` inventory is empty, so elaboration cannot supply additional evidence. |

| README headline | Why it is not statable using a few simple definitions at the pins | Module docstring |
| --- | --- | --- |
| §§1.3–1.4 integral cycle comparison and operations | No admissible higher-cycle complexes or higher Chow groups | Suggested.lean:9 |
| §2.0a supported ordered relativity and Adams-compatible pairings | No scheme perfect K-spectra, supported face diagrams or pointed Adams operations | :11 |
| §2.0b universal motivic Chern classes | No higher scheme K-groups, universal classifying-sheaf cycle model | :15 |
| §§2.1–2.4 regular supported comparison, smooth universal identification and products | No supported higher K/higher Chow carriers or comparison maps | :17 |
| §3.2 geometric bifiltered logarithmic comparison | Linear Hodge data exists; geometric logarithmic sheaves and residue realization do not | :22 |
| §3.3 small Deligne model and deformation retract | No real Dolbeault complex/model construction; proving its differential square-zero is substantive | :25 |
| §3.4 compactification-independent realization | No SNC compactification diagram/logarithmic Deligne functor | :28 |
| §§4.1–4.2 Deligne product and associativity homotopy | No Dolbeault algebra/Deligne carrier with the specified operations | :30 |
| §5.2 singular-support semipurity and current criterion | No supported geometric Deligne groups or current comparison | :33 |
| §5.4 supported cycle resolution and affine contraction | No incidence-support diagrams or auxiliary total complexes | :35 |
| §§6.1–6.3 universal regulator and coherent naturality | Neither its geometric source nor target is present | :37 |
| §§7.1–7.2 independent Beilinson character and equality | No actual scheme higher K-groups/universal Deligne Chern classes | :40 |
| §7.3 integral-source multiplicativity | Higher Chow, Deligne and regulator carriers are absent | :43 |

Object searches at both pins found linear Hodge structures, graded complexes and ordinary scheme cycles, but no missing headline carrier above. Native `ContMDiffMap.weakWhitneyJet` is a family of derivatives of an existing smooth map, not extension of prescribed jets on a closed set. No statable omitted headline was established; scalar flat-function estimates and §7.4's small evaluations are supporting results, not acceptance-file substitutes.

### Computed statement inventory

All line numbers in the next two tables refer to packages/MotivicEtaleKTheory/README.md. “Retain” records the result on the displayed instances, not a proof from finitely many examples. Abstract hypotheses not applicable to a carrier (nonabelian group laws for a cycle group, ramification for complex forms, and so forth) were not silently added. Countermodels for omitted regularity, flatness, incidence and topology are included explicitly.

| Statement and location | Instances tried | Values on the two sides / distinguishing value | Result; change |
| --- | --- | --- | --- |
| Component/universe convention :17 | point ⊔ ℙ¹; ∅ | CH⁰=ℤ², CH¹=0⊕ℤ; empty groups 0; finite-type compactification choices have a small skeleton | Retain |
| Integer motivic grading :19 | (p,a)=(0,1),(1,1),(1,2) | 2p−a=−1,1,0; groups 0,CH¹(X,1),CH¹(X,0) | Retain; no natural subtraction |
| Derived coefficients :19 | ℤ/2⊗ᴸℤ/2; R=0 | H⁻¹=ℤ/2=H⁰, versus ordinary tensor only H⁰; zero ring gives 0 | Retain |
| Cube and simplex boundary :21 | graph t; degree-one simplex | ∂□Γ_t=[0]; δΓ_t=−[0]; ∂Δ=[1]−[0] | Retain |
| J orientation :21 | degrees 0,1,2; two 1-cubes | J=(1,−1,1); J₂=J₁J₁=1 | Retain |
| Mixed totalization :21 | bidegree (1,1) | cross coefficients −1,+1 sum to 0; wrong unsigned sum gives 2 | Retain over integral coefficients also in char 2 |
| Shift/cone convention :23 | f=0:0→ℝ[0] | fib has ℝ in degree +1; transported differential (da,f(a)−db) | Retain |
| Boundary dictionary :23 | graph t; {2,t} | raw t↦−[0], B[t]=+[O₀]; native B{2,t}=−[2], last-slot adapter +[2] | Retain |
| Tate/critical convention :25 | p=−1,0,1; x=z z̄ | Tate factors (2πi)⁻¹,1,2πi≠0; −2∂∂̄x=−2dz∧dz̄ | Retain |
| Orientation/product convention :27 | positive circle; two residues; log 2,log∣t∣ | periods 2πi and 2πi log 2; ordered residue +1, swapped −1; totalization sign at n=s=1 is −1 | Retain |
| Whitney extension contract :83 | jet at 0; parameter y | Taylor coefficients 1,1,2 give derivatives 1,1,4; (2!)²sin(π/2)=4 | Declared owned gap; retain |
| Flat-ideal contract :91 | A=∅,B=U; A=B=U; coordinate axes | C∞=C∞+0; 0=0+0; φ(x)+φ(y) at (0,1)=e⁻¹, excludes intersection | Declared owned gap; retain |
| §1.1 normalized cycles :119 | point,p=0; graph t; fat point | groups ℤ,0,0; ∂Γ_t=[0]; reduced generator 1, length-two cycle 2 | Retain |
| §1.1 normalization API :125 | point,p=0 | normalized inclusion/quotient sends 1↦1 in degree 0, 0↦0 in degree 1; raw degree 1 is ℤ | Retain |
| §1.1 push/flat API :126 | ℙ¹→point; degree-two field extension | dimension-drop push=0; extension then transfer sends 1↦2, not 1 | Retain |
| §1.1 J API :127 | Γ_t; concatenation | δJ₁Γ_t=+[0]=J₀∂Γ_t; J₂=1=(−1)² | Retain |
| §1.1 native coefficients API :128 | double point | coefficient 1≠2; degree-zero generator agrees with native cycle | Retain |
| §1.2 mixed definition :142 | total degrees 0,2 | 1 and 3 summands; (1,1) cross coefficients −1,+1 | Retain |
| §1.2 axes API :148 | degree-zero [V] | both coefficient maps 1↦1 | Retain |
| §1.2 total universal property :149 | (1,1) differential components | d² cross coefficient −1+1=0; each output component is its specified sum | Retain |
| §1.2 J API :150 | (1,0),(0,1),(1,1) | multipliers −1,+1,−1; simplex axis multiplier 1 | Retain |
| §1.3 integral comparison :162 | point,p=0; empty/full support; ℤ/2 coefficients | H₀=ℤ↔ℤ, Hₙ>₀=0↔0; fibers 0/C; derived torsion groups in −1,0 on both sides | Retain |
| §1.4 operations :176 | inseparable degree 2; thickening; odd products | push-pull 2↔2; reduced generators unchanged; exchange sign −1 on both sides | Retain; smoothness retained for general pullback |
| §2.0a K-cube carrier :200 | n=0,∅/full support; n=1 | 0 or K₀(X); π₀ full cube=K₁(X) | Retain |
| §2.0a Adams/weights :200–202 | ℚ and η; ℙ²,h=1−O(−1) | ψ²1=1, ψ²[−1]=0≠η·1; ψ²h=2h−h², ψ²h²=4h² | Earlier repair holds |
| §2.0a relative cycles :204 | □, faces 0/1; W on one face | z+(1−z)=1; W has ambient codim 1 but face codim 0 | Improper W excluded |
| §2.0a support-local isomorphism :204 | V=Spec L,D=∅,c=0; V=□_L,point s | ℚ→ℚ sends 1↦1; relative class of s has valuation +1 | Retain |
| §2.0a split/moving theorem :204 | empty D; split one-cube | empty cube needs no retraction; one-face open retracts constantly, with rank map 1↦1 | Retain the explicit splitting hypotheses |
| §2.0a support-local API :208 | point s, identity/support enlargement | valuation 1 stays 1; homotopy relations map to 0 | Retain |
| §2.0a empty/full API :209 | n=0,empty/full support | K^∅=0; K^X(X)=K(X); enlargement sends 0↦0 | Retain |
| §2.0a pairing/pullback API :210 | units over ℤ_(2),ℤ_(3); ℤ[i] external self-product | ψ²([u][v])=4[u][v]=(2[u])(2[v]); singular product has dimension 1, cotangent dimension 2 | Regular common-base pairing retained; singular external base excluded |
| §2.0a relativity API :211 | n=1 face ranks; n=2 ordered symbols | differences 1,−1,0 for (1,0),(0,1),(1,1); transposing loops gives −1; ψ² unit=2, symbol=4 | Retain |
| §2.0b Chern construction :230 | zero K-class; 𝔾_m/𝔽₂ | c₀,₀(0)=1, positive c(0)=0, ch(0)=0; c₁,₁[t]=[t], valuation 1 | Finite-field repair holds |
| §2.0b stabilization/Whitney API :234 | O(1)⊕O(−1) on ℙ² | c total=(1+h)(1−h)=1−h²; adding a trivial line multiplies c by 1 | Retain |
| §2.0b diagonal API :235 | Milnor degrees 1,2,3 | factors 1,−1,2; character factors restore 1,1,1 | Retain |
| §2.0b Newton/space API :236 | p=1,2,3; O(1) on ℙ² | coefficients 1,−1,1/2; ch₂=h²/2 whereas c₂=0; πₙ of truncation is H²ᵖ⁻ⁿ | Retain; factorials nonzero in ℚ |
| §2.1 geometric map :249 | point rank2; divisor on ℙ¹; unit2 | cyc(2)=2; cyc(h)=1−O(−1), Euler characteristic 1; v₂cyc(2)=1 | Earlier repair holds |
| §2.1 naturality API :255 | identity; point→ℙ¹ | identity preserves h; divisor class pulls to 0 and K-rank of 1−O(−1) pulls to 0 | Retain derived pullback |
| §2.2 comparison :268–272 | point,ℙ²,unit2,{2,t} | weights 0,1,2 have ψ²=1,2,4; character h²/2; valuations 1,1 on unit/residue | Retain; inverse follows isomorphism |
| §2.2 universal agreement API :276 | O_point; unit2; ordered symbol {2,t} | both h; both [2]; both last-slot residue [2], v₂=1 | Retain; no degree-zero-only proof |
| §2.3 supports :291–295 | ∅/full; purely inseparable L; (𝔸¹_L,{0}) | 0↔0; ℚ↔ℚ,1↦1; supported divisor +1, raw connecting −1 | Retain regular nonsmooth scope |
| §2.3 flat/pair API :299 | degree-two extension; support {0}⊂{0,1} | transfer after pullback multiplies by 2; support inclusion 1↦(1,0) | Retain |
| §2.3 boundary API :300 | t; degree-two ordered symbol | ch_ZB[t]=+1=−δ_raw[t]; native B{2,t}=−[2], left adapter +[2] | Retain |
| §2.4 products :314 | ranks2,3; ξ on ℙ¹; affine origin | ch₀=6=2·3; ch(ξ²)=0=h²; leading affine class 0=0 | Earlier nonvanishing repair holds |
| §3.1 logarithmic algebra :340 | punctured disk; D=∅; ∣z∣⁻² | dlog∣z∣²=dz/z+dz̄/z̄; ordinary smooth algebra for empty boundary; quadratic pole excluded | Retain |
| §3.1 differential API :346 | log∣z∣² | ∂∂̄=0 off divisor; d splits into the two logarithmic 1-forms | Retain |
| §3.1 pullback API :347 | z=e u, with u a holomorphic unit | log∣z∣²=log∣e∣²+log∣u∣²; dlog z=dlog e+dlog u | Retain |
| §3.1 inclusion/unit API :348 | 1; empty W; boundary-free W | restriction of 1 is 1 and d1=0; empty forms 0 | Retain |
| §3.2 filtered comparison :361 | 𝔾_m; point; torus boundary blowup | dlog has W-index1 plus H-degree1 = weight2; point weight0; torus Betti dimensions 1,2,1 on both sides | Retain; no unshifted W invariance |
| §3.2 division API :367 | f=e^(−1/∣z∣²), denominator z²; f=1 | zero jets; value e⁻¹ at1; 1/z not extendible | Retain flatness |
| §3.2 logarithmic API :368 | f=e^(−1/∣zw∣²), denominator z w̄ | zero jets on axes; at (−2,1) value −e^(−1/4)log4/2 | Retain |
| §3.3 Deligne small model :383–385 | point p=−1,0,1; ∣z∣² | H⁰=ℝ(−1),ℝ,0; H¹=0,0,ℝ; critical differential −2dz∧dz̄ | Retain |
| §3.3 contraction/shift API :389 | point weight1, ω=log2+iθ | projection=inclusion inverse on ℝ; other composite drops iθ; shifted comparison retains homotopy, no 1D odd Dolbeault structure | Retain |
| §3.3 exactness API :390 | 0→ℝ→ℝ²→ℝ→0, pure type0 | D in weight1 gives 0→ℝ→ℝ²→ℝ→0; ranks 1,2,1, kernel=image | Retain type-compatible exactness |
| §3.3 critical-degree API :391 | p=1,x=∣z∣² | ordinary degrees 0→2, Deligne degrees1→2; value −2dz∧dz̄ | Retain |
| §3.4 realization :406 | affine line; analytic versus Zariski sheafification | analytic Re z gives extra H¹ class with values0,1; logarithmic H¹=ℝ constants | S01: specify Zariski site and global sections |
| §3.4 refinement API :412 | blowup chart x=e,y=eu | log∣x∣ pulls to log∣e∣; value log2 at (2,3) along either comparison | Retain after S01 |
| §3.4 pullback API :413 | torus monomial x↦x² | log∣x²∣=2log∣x∣; circle period doubles to4πi | Retain after S01 |
| §3.4 descent API :414 | ∅; ℙ¹ covered by two affine lines | empty object0; MV has H¹(𝔾_m)=ℂ feeding H²(ℙ¹)=ℂ, not a vanished boundary | Retain after S01 |
| §3.4 sheaf/skeleton API :415 | duplicate compactification object; rank-one constants | comparison preserves 1↦1; relabeling the skeleton cannot replace it by2 | Retain after S01 |
| §4.1 product :437 | log2,log∣t∣; weight-zero polynomial t | product i log2 darg t, exchanged negative; polynomial product t² | Retain |
| §4.1 Leibniz/symmetry API :443 | x=∣z∣²,y=1 in weight1 | d_D(x•1)=−2dz∧dz̄=d_Dx•1; odd exchange gives negative | Retain |
| §4.1 unit/naturality API :444 | ℝ[t] and tℝ[t] | 1•t=t in first; coefficient of t in et is0 in second, versus1 in t | Retain specified identity hypothesis |
| §4.1 critical formula API :445 | x=∣z∣²,y=1 | four terms give −z̄dz+z dz̄ even though d_Dx≠0 | Retain |
| §4.2 associator :458 | Re z,2,3; t,t,t; torus | both bracketings6Re z, h_a=0 in critical even degrees; t³ on both sides; period (2πi)² | Retain nonclosed and nonunital scope |
| §5.1 support fiber :482 | zero arrow; arbitrary pair cocycle | fib(0→ℝ[0]) degree1; d² second coordinate res dω−dresω=0 | Retain |
| §5.1 enlargement API :488 | {0}⊂{0,1} | 1↦(1,0); identity keeps1 | Retain |
| §5.1 LES/excision API :489 | t on punctured affine line | raw connecting class (0,log∣t∣) has coefficient−1 | Retain |
| §5.1 products API :490 | axes; disjoint parallel lines | product support origin with coefficient1; disjoint support gives0 | Retain |
| §5.1 cocycle/extensionality API :491 | pair (0,−log∣t∣) on complement; (0,∣z∣²) | first d=(0,0); second d=(0,+2dz∧dz̄)≠0 | Retain both directions |
| §5.2 semipurity/current iff :504–506 | node/cusp; origin; omit codim on point | H² supported ℝ²/ℝ; origin H²(p1)=0,H⁴(p2)=ℝ; omitted codim admits H¹=ℝ | Retain codimension |
| §5.2 Betti API :510 | normal disks p=1,2 | first nonzero relative Betti group degree2/4 isℝ, lower groups0 | Retain |
| §5.2 coefficient detection API :511 | node coefficients (1,1),(1,−1),(0,0) | nonzero,nonzero,zero respectively; restricting to first generic branch gives1,1,0 | Retain both iff directions |
| §5.2 divisor API :512 | f=tᵃ, a=−1,0,1 | (0,−a log∣t∣) has coefficients−1,0,1; positive log reverses them | Retain |
| §5.3 support index/H definition :526 | point,p=0; finite union of two points | H₀=ℝ,Hₙ>₀=0; union class coordinates(1,1) | Retain |
| §5.3 Aₚ total definition :526 | (r,n)=(2p,1),(2p−1,1) | total degrees2p−1,2p−2; cube signs+1,−1 | Retain |
| §5.3 Aₚ,S definition :526 | ω=Re z₁ dz₂∧dz̄₂,p=1 | dω(∂x₁,∂x₂,∂y₂)=−2i; good top truncation excludesω | Retain |
| §5.3 class API :532 | origin and its double | 1↦1,2↦2 in supported degree2p | Retain |
| §5.3 top projection API :533 | n=1,top r=2p | both source and H[-2p] have degree2p−1; top class coefficient1 | Retain shift |
| §5.3 forget/constant API :534 | point,p=0,n=0 | constant-cube inclusion sends1↦1; empty support sends0↦0 | Retain |
| §5.3 colimit API :535 | supports {0},{1},common union | representatives(1,0),(0,1) stay unequal; sums both become(1,1) | Retain |
| §5.4 resolution/contraction :548 | point→𝔸¹,p=0,1; n=s=1 | H⁰(p0)=ℝ↔ℝ; H¹(p1)=ℝ↔ℝ; positive normalized columns0; product sign−1 | Retain after S01 |
| §6.1 roof :572 | point rankm; shifted cube1 | regulator m↦m; degree2p−1 on both models; even shift sign+1 | Retain |
| §6.1 representative API :578 | divisor origin; zero lift | top support coefficient1 survives; zero lift maps0 | Retain |
| §6.1 integral-source API :579 | torsion units −1,i; unit2 | real images0,0,log2; ℤ-source retained before scalar extension | Retain |
| §6.1 n=0 API :580 | O(1),O(−1) | normalized Chern periods+1,−1 | Retain |
| §6.2 coherence/fibers :592–594 | ∅/full; nonzero homotopy square | maps0/absolute; (1,0)↦(1,1), target differential0 | Retain |
| §6.2 pair-map API :598 | A=A′=ℤ[0], B=0, B′=(ℤ→ℤ),r=f′=h=1 | +h yields D′(1,1)=(0,0); −h yields(0,2) | Retain |
| §6.3 naturality :610 | point→ℙ¹; compatible embeddings of ℚ | both c₁ pullbacks0; both unit2 imageslog2 | Retain |
| §7.1 independent character :634 | unit2eⁱθ; O(a) | log coset real partlog2; ordinary character1+a h_D | Retain |
| §7.1 additive/product API :640 | units2,3; ranks2,3 | logarithms sumlog6; degree-zero product6=2·3 | Retain |
| §7.1 normalization API :641 | logarithm branch+2πi; O(1) | real projection unchanged; normalized Chern integral1 | Retain |
| §7.2 equality :657 | rank2; O_point; unit2,−1 | both2; bothh_D with degree1; bothlog2,0; supported raw boundary−1 | Retain |
| §7.3 integral multiplicativity :671 | units2,t; two ruling divisors; point units | period2πi log2 on both sides; intersection degree1; point degree-two product0 | Retain |
| §7.4 normalization witnesses :685 | units2,3,1/2,i; O(a),a=−1,0,1 | log6=log2+log3; −log2;0; normalized degrees−1,0,1 | Retain |

### Computed README Checks

Every existing Check bullet is represented once below. The §3.4 rows use the intended Zariski construction; S01 records the missing choice that makes those values the intended ones. Boundary Checks supplement the nonzero and negative controls; they are not substituted for the headline theorems.

| Check line | Instance and computed values | Result/change |
| --- | --- | --- |
| 87 | Coefficients 1,1,2 give derivatives 1,1,4; coefficients n! give (n!)² and convergence radius 0 | Retain |
| 88 | At m=2,y=π/2, (m!)² sin y=4; normal derivatives vary smoothly with y | Retain |
| 89 | Empty A imposes 0 conditions; A=U gives f itself. At A={0}, 0 and exp(−1/x²) have zero jets but values 0,e⁻¹ at 1 | Retain |
| 95 | φ is flat at 0 with φ(1)=e⁻¹; an analytic flat germ is 0 | Retain |
| 96 | A=∅,B=U gives C∞=C∞+0; A=B=U gives 0=0+0 | Retain |
| 97 | φ(x)+φ(y) has zero jet at (0,0), value e⁻¹ at (0,1), so is outside the intersection of the ideals | Retain |
| 132 | Γ_t has faces [0],0; the two boundary conventions give +[0],−[0] | Retain |
| 133 | Point, p=0: normalized degrees 0,1,2 give ℤ,0,0; raw groups give ℤ,ℤ,ℤ | Retain |
| 134 | Reduced double-point generator has coefficient 1; the length cycle has coefficient 2 | Retain |
| 135 | J₀,J₁,J₂=1,−1,1; square vertex coefficients sum +1−1=0, also over a characteristic-two base | Retain |
| 136 | Point, codimension −1: group 0; ℙ¹→point pushes its fundamental cycle to 0 since 1>0 | Retain |
| 154 | Mixed degree (1,1): cross terms −∂□∂Δ+∂Δ∂□=0 | Retain |
| 155 | Both axes send [V] to [V]; total degrees 0,2 have 1,3 summands | Retain |
| 156 | J at (1,0),(0,1),(1,1) gives −1,+1,−1; sign by n+m wrongly gives −1 at (0,1) | Retain |
| 168 | Point, p=0: both H₀=ℤ and Hₙ=0 for n>0; the H₀ map sends 1 to 1 | Retain |
| 169 | Empty support gives fib(id)≃0; full support gives fib(C→0)≃C | Retain |
| 170 | Derived ℤ/2 tensor gives ℤ/2 in degrees −1,0; zero coefficients give 0 in every degree | Retain |
| 182 | Purely inseparable degree-two push-pull on CH⁰ sends 1 to 2 in both models | Retain |
| 183 | Point ⊔ ℙ¹: CH¹=0⊕ℤ, CH⁰=ℤ²; component maps preserve (1,0),(0,1) | Retain |
| 184 | Square-zero point retains generator 1; identity coefficient +1; exchange signs in degrees (1,1),(0,1) are −1,+1 | Retain |
| 215 | n=0: full point K₀=ℤ, [k²]=2; empty support is 0; a leading coefficient 1 can multiply a zero cycle class | Retain |
| 216 | Over ℚ: η1=[−1]≠0, ψ²[−1]=0, ηψ²1=[−1]; rationalization kills [−1] | Earlier repair verified |
| 217 | Face differences are 1,−1,0; relative unit 2 gives [2], ψ²[2]=2[2], ψ¹[2]=[2] | Retain |
| 218 | Two ordered face pairs give Ω²K; consecutive last-slot residues of {u,v} give 1; loop exchange gives −1; ψ² multiplies by 4 | Retain |
| 219 | For every p, relative K₀=K₁(ℤ_p)=ℤ_p×, with face differences ±1. Over ℤ₃, 2≠1 is a unit, so deleting t=2 meets neither face | Retain, including p=2,3 |
| 220 | ψ²h=2h−h², ψ²h²=4h², ψ²(2h+h²)=2(2h+h²); lattice determinant 2; h=(2h+h²)/2−h²/2 | Retain |
| 221 | In ℤ[i,s]/(s²+1), v(v+2i)∈m² gives dimension 1 and cotangent dimension 2 over 𝔽₂; same-base cube is regular; both Adams product sides give 4{u,v} | Retain regular-product restriction |
| 222 | L=𝔽_ℓ(s) over k=𝔽_ℓ(s^ℓ), ℓ=2,3: CH⁰(L)_ℚ=ℚ=K₀(L)^(0), with 1 mapping to 1 | Retain nonsmooth example |
| 223 | The cube point class has s-adic valuation 1; inverse and zero models give −1,0 | Retain |
| 224 | z=t/(t−1) sends 0,∞,1 to 0,1,∞; z+(1−z)=1; W={z=0} has ambient codimension 1 but face codimension 0 | Retain incidence exclusion |
| 240 | v₂(c₁,₁[2])=1; for the zero class c₀=1, positive c=0 and ch=0 | Retain |
| 241 | (𝔸¹∖{0,1})(𝔽₂)=∅; 𝔽₂[t,t⁻¹]×=t^ℤ; c₁,₁[t] has valuation 1 | Finite-field repair verified |
| 242 | On ℙ², a line has c₂=0, ch₂=h²/2; the opposite pair has c₂=−h², ch₂=h² | Retain |
| 243 | Diagonal factors 1,−1,2 times character factors 1,−1,1/2 give 1,1,1 | Retain |
| 259 | On a point cyc₀,₀(2)=2; CHᵖ(point,0)=0 for p>0 | Retain |
| 260 | cyc(h)=1−O(−1), with Euler characteristic 1−0=1; the negative convention gives −1 | Retain |
| 261 | Empty source and target are 0; cycle (2,1) maps to ranks (2,1), while the fundamental cycle maps to (1,1) | Retain |
| 262 | cyc₁,₁(point 2)=[2], with valuation 1 | Retain |
| 280 | Spec k rank 2 maps to 2; specified x on two components gives (2,1), versus O_X giving (1,1). On ℙ¹, (1+h)+(1−h)=2 | Earlier Check repair verified |
| 281 | ψ² eigenvalues are 1,2,4; their differences −1,−3,−2 are nonzero | Retain |
| 282 | ψᵃ[u]=[uᵃ]=a[u]; rank eigenvalue a⁰=1, including a=1 | Retain |
| 283 | ch₂O(1)=h²/2, with h²≠0 in CH²(ℙ²)_ℚ | Retain |
| 284 | Both maps send O_point to h and unit 2 to [2]; Euler characteristic and v₂ both give 1 | Retain |
| 285 | {2,t} has last-slot residue [2] and valuation 1; swapping gives −[2], valuation −1; native B gives −[2], regulator period +2πi log 2 | Retain |
| 304 | Empty support gives 0 on both sides; full support gives absolute groups. Specified mixed-dimensional x has rank (2,1), and CH¹_ℚ=0⊕ℚ | Earlier Check repair verified |
| 305 | d(Γ_t,0)=([0],t); raw [(0,t)]=−[([0],0)], while native B[t]=+[O₀] | Retain |
| 306 | Node support has leading coordinates (1,1); supported perfect K agrees with coherent support G, without identifying it with perfect K(Z) | Retain |
| 307 | Purely inseparable L has dimension and embedding dimension 0, Ω¹=L ds≠0, and L⊗ₖL=L[ε]/ε^ℓ; degree-zero comparison sends 1 to 1 | Retain |
| 308 | (𝔸¹_L,{u=0}): CH¹_support,ℚ=ℚ=K₀^(1); B(u)=+1, raw boundary −1; enlargement sends 1 to (1,0) | Retain |
| 320 | On ℙ¹, ch(O_point)=1−(1−h)=h | Retain |
| 321 | On 𝔸¹, [O₀]=1−1=0 and [{0}]=div(t)=0; all character components are 0 | Earlier repair verified |
| 322 | Positive-degree character/Chern factors for p=1,2,3 are 1,−1,1/2 | Retain |
| 323 | Rank 2 tensor rank 3 has rank 6=2·3; rank 1 multiplies each component by 1 | Retain |
| 324 | On ℙ¹, ξ²=0, h²=0 and ch ξ=h, so both product sides are 0 | Retain |
| 352 | d log∣z∣²=dz/z+dz̄/z̄; the positive-circle dlog period is 2πi | Retain |
| 353 | Empty boundary gives smooth forms; empty variety gives 0 in every degree | Retain |
| 354 | log∣z∣² belongs; ∣z∣⁻² grows faster than any finite smooth-coefficient polynomial in logarithms | Retain |
| 355 | Ordered residue of dlog z∧dlog w is 1; reversing order gives −1 | Retain |
| 372 | Connection residues (0,0) are allowed; H¹=ℂ dlog z, period 2πi; W-index 1 plus degree 1 gives weight 2 | Retain |
| 373 | Torus and boundary blowup have Betti dimensions 1,2,1 and the same dlog classes; residue E₁ gains a boundary component | Retain; no W-filtered invariance |
| 374 | Point has H⁰,⁰=ℂ and weight 0; empty object gives 0 | Retain |
| 375 | For f=exp(−1/∣z∣²), f/z² and f log∣z∣² have zero jets; the first has value e⁻¹ at 1 | Retain |
| 376 | f=1 gives the pole 1/z and divergent log∣z∣²; zero exponents recover f | Retain flatness |
| 377 | f=exp(−1/∣zw∣²) has zero jets on the axes; f log∣z∣²/(z w̄) at (−2,1) equals −e^(−1/4) log 4/2 | Retain |
| 395 | Point p=0: H⁰=ℝ,H¹=0; p=1: H⁰=0,H¹=ℂ/iℝ≃ℝ | Retain |
| 396 | For p=1,2,3, πₚ₋₁(3+4i)=3,4i,3; negating gives −3,−4i,−3; quotient transport restores the originals | Retain |
| 397 | Point p=−1: F⁻¹ℂ=ℂ; kernel ℝ(−1), cokernel 0 | Retain |
| 398 | ∂∂̄∣z∣²=dz∧dz̄; d_D=−2dz∧dz̄ | Retain |
| 399 | Point A[1] sits in degree −1; a conjugation-stable one-dimensional Dolbeault summand would require 2r=−1, impossible for integer r | Retain |
| 400 | A=0 gives 0 throughout. At point p=1, ψϕ(r)=r, while ϕψ(log 2+iθ)=log 2 differs if θ≠0 | Retain |
| 419 | Blowup x=e,y=eu sends log∣x∣ to log∣e∣; at (2,3), the value is log 2 versus log 3 for the wrong coordinate | Earlier Check repair verified |
| 420 | Torus dlog periods are (2πi,0),(0,2πi); product period (2πi)² is unchanged by boundary blowup | Retain after S01 |
| 421 | Point ⊔ ℙ¹ has H⁰_D(−,ℝ(0))=ℝ²; restriction to the empty set has target 0 | Retain after S01 |
| 449 | log 2•log∣t∣=(log 2)/2(dt/t−dt̄/t̄)=i log 2 darg t; reversing factors gives its negative | Retain |
| 450 | A point has no one-forms, so log 2•log 3=0; weight-zero unit 1•log 2=log 2 | Retain |
| 451 | In tℝ[t], the t coefficient of et is 0, versus 1 in t; in ℝ[t], 1t=t | Retain nonunital scope |
| 452 | ∣z∣²•1=−z̄dz+z dz̄; −F¹,¹d gives −2dz∧dz̄=d_D∣z∣²•1 | Retain |
| 464 | At weight zero, Re z,2,3 give 6 Re z in both bracketings, value 6 at z=1; h_a=0 but d_D Re z=d Re z≠0 | Retain without closedness |
| 465 | Point constants 2,3,5 give 30 both ways; odd point triple gives 0; nonunital triple (t,t,t) gives t³ both ways | Retain |
| 466 | Ordered torus period is (2πi)²; exchanging circles gives −(2πi)², before and after blowup | Retain |
| 495 | Empty support fib(id) is contractible; full support fib(D→0)=D | Retain |
| 496 | fib(0→ℝ[0]) lies in degree 1; second coordinate of d² is res dω−d res ω+d²g=0 | Retain |
| 497 | Supported degree-two enlargement sends r to (r,0); its direction is not projection ℝ²→ℝ | Retain |
| 498 | V(x)∩V(x−1)=∅; product has target H(0)=0 | Retain |
| 516 | Codimension-one node: ℝ² with class (1,1); cusp: ℝ with class 1; lower groups are 0 | Retain |
| 517 | Origin in 𝔸²: at p=1, H²=0; at p=2, H⁴=ℝ. A doubled divisor has coefficient 2 versus 1 | Retain |
| 518 | Full support p=0 gives H⁰=ℝ per component and negative groups 0; point p=1 instead has H¹=ℝ and violates the codimension hypothesis | Retain codimension |
| 519 | Axes intersect with length 1, giving product +1; doubling one axis gives length and product 2 | Retain |
| 520 | d=p=1: form factor (2πi)⁻¹, point factor 1; d_D[−log∣t∣]=−δ₀, giving supported coefficient +1 | Retain |
| 539 | J₀,J₁,J₂=1,−1,1; J₀∂=δJ₁=∂, while J₁d_D=d_DJ₁ | Retain |
| 540 | At (2p,1), total degree is 2p−1 and sign +1; at (2p−1,1), sign is −1 | Retain |
| 541 | Point p=0: normalized support groups give ℝ in degree 0 and 0 in positive cube degree | Retain |
| 542 | dω=(dz₁+dz̄₁)∧dz₂∧dz̄₂/2 evaluates to −2i; good top truncation excludes ω | Retain |
| 554 | Origin class coefficient is 1; its double has coefficient 2 | Retain |
| 555 | Point and 𝔸¹ both have H¹_D(−,ℝ(1))=ℝ and H⁰_D(−,ℝ(0))=ℝ; positive normalized cohomology is 0 | Retain after S01 |
| 556 | (−1)^{ns} is −1 for n=s=1, and +1 for n=0 or s=2 | Retain |
| 584 | Spec ℂ, p=n=0: m maps to m; for p=0,n>0 the source is 0 | Retain |
| 585 | Empty or zero cycle maps to 0; torsion units −1,i have log absolute value 0 | Retain |
| 586 | O(1) has normalized period 1 and raw period 2πi; O(−1) gives −1,−2πi | Retain |
| 602 | Empty fiber regulator is 0; full fiber is the absolute regulator; identity square has homotopy 0 | Retain |
| 603 | +h sends (1,0) to (1,1) with D′=0; −h gives (1,−1) with D′=(0,2); square defect f′r−r′f−dh−hd=0 | Retain |
| 604 | t maps to log∣t∣; raw boundary coefficient is −1, while Green representative −log∣t∣ gives +1 | Retain |
| 616 | Point pullback of c₁O(1) is 0 in CH¹ and H²_D=0; a raw cycle through that point fails proper intersection | Retain derived pullback |
| 617 | ℚ→ℝ→ℂ and ℚ→ℂ both send 2 to 2, hence both give log 2 | Retain |
| 618 | Both degree-zero axes give generator 1; BF transport gives −1 in degree 1 and +1 in degree 2 | Retain |
| 645 | Re log(2eⁱθ)=log 2; adding 2πi changes the real part by 0; log∣i∣=0 | Retain |
| 646 | O(a) gives 1+a h_D; normalized integral of h_D is 1 | Retain |
| 647 | Zero or empty K-class maps to 0; trivial line maps to 1 | Retain |
| 649 | Quotient projections of 3+4i at p=1,2,3 give 3,4i,3; added ℝ(p) projects to 0, unlike opposite parity | Retain |
| 651 | Constant simplicial ℤ gives π₀=H₀=ℤ and higher groups 0; constant simplicial S₃ has nonabelian π₀=S₃ | Retain abelian hypothesis |
| 663 | Both maps send rank 2 to 2 and O_point to h_D of normalized degree 1 | Retain |
| 664 | Both maps send unit 2 to log 2 and −1 to 0; p=2 Newton factor is −1 | Retain |
| 665 | Full support gives the absolute comparison; empty support gives 0; raw Deligne boundary of log∣t∣ has coefficient −1 | Retain |
| 677 | Ordered units 2,t give i log 2 darg t; swapping negates it; periods are ±2πi log 2 | Retain |
| 678 | Weight-zero unit 1 preserves the regulator; zero/empty gives 0; point units have product in H²_D(point,ℝ(2))=0 | Retain |
| 679 | Ruling divisors meet in a point of normalized degree 1; doubling one factor gives 2 | Retain |
| 691 | log 6=log 2+log 3; log∣1∣=log∣i∣=0; log∣1/2∣=−log 2 | Retain |
| 692 | f=2,g=t gives i log 2 darg t with period 2πi log 2; dropping i puts it on the wrong real Tate axis | Retain |
| 693 | O(a), a=−1,0,1 gives degrees −1,0,1; Green −a log∣t∣ has multiplicity a, while the unit regulator is +a log∣t∣ | Retain |

### Supplier and ownership audit

Checked the **12 named roadmap supplier contract groups**, the completed linear-Hodge owner, the indirect complex-orientation owner, and **five downstream relationships**. Paths in this table are relative to the cited roadmap repository; open suppliers were read at their current heads with the roadmap service, and existing main roadmaps were read on main. Section numbers below were resolved against those copies, rather than inherited from the earlier reports.

| Supplier / relative file | Sections and witness locations | Scope and convention result |
| --- | --- | --- |
| TauCetiRoadmap/GeneralAlgebraicKTheory/README.md | §§3.12,4.6,4.8,4.14,6.3,7.4–7.7,8.12–8.13; :627,795,827,925,1333,1623,1651,1669,1687,1938,1950 | Q/plus/Waldhausen models, exact-category hypotheses, tensor and transfers exist. Right-linear B sends a uniformizer to +1; degree-two last-slot adapter multiplies B by −1. |
| TauCetiRoadmap/SchemeKTheoryOperations/README.md | §§2.1–2.6,3.1–3.6,4.3,6.1,6.7–6.9,7.1–7.3; :373,443,499,547,577,596,663,713,739,770,784,820,1102,1627,1979,2031,2078,2225,2254,2280 | qcqs perfect K, Noetherian coherent K, proper-perfect transfers and Tor-independent base change retain their restrictions. Adams operations use the regular finite-dimensional ample-family scope. §6.9 distinguishes pointed operations from integral spectral operations. §7.2's leading class is not claimed nonzero. |
| TauCetiRoadmap/KTheoryFiniteLocalFields/README.md | §3.0a motivicCycles/motivicToK :478–502; §6.10 diagonalChernMilnor :1472 | Shared cycles cover arbitrary fields, finite extensions including inseparable ones, derived coefficients and nilpotents. Simplex boundary is 1−0. Diagonal Chern factors at n=1,2,3 are 1,−1,2, matching §2.0b. |
| TauCetiRoadmap/MotivesAndAlgebraicCycles/README.md | §§4.4,4.7,4.8,4.8a,4.14,4.17,4.18; :602,675,690,710,813,858,872 | Tate complexes and weight-one units are integral. Smooth perfect-field higher-Chow comparison at :860 has no resolution premise; resolution enters separate singular-motive claims at :862 and :874. Thus the finite-field repair does not import resolution. |
| TauCetiRoadmap/SchemeAndStackFoundations/README.md | §§2.1–2.2 :3265,3309; §§4.12,4.17 :5613,6075; §§5.1–5.8 :6567,6653,6701,6721,6768,6921,6987,7107 | Sheaf cohomology, Chow domination, SNC predicate, ordinary intersection, Chern classes and normal cones are present. None supplies the new higher-cycle comparison. |
| TauCetiRoadmap/ResolutionOfSingularitiesCharacteristicZero/README.md | §§5.1–5.6 :672,682,692,708,718,728; §§6.1–6.4 :758,770,786,802 | Characteristic zero; resolution preserves the prescribed smooth open. Projective SNC compactification has quasi-projective input. The package uses Nagata plus proper resolution for its wider separated scope, so does not infer projectivity from properness. |
| TauCetiRoadmap/EtaleCohomologyFoundations/README.md | §§G.1–G.3 :57,105,139 | Dense compactification objects, Nagata existence, proper refinements and finite common refinements are explicit. The package consumes this geometric prefix, without étale coefficient theory. |
| TauCetiRoadmap/ComplexComparisonPartII/README.md | §§C−1.1,C−1.4 :699,856; §§C5.1,C5.3–C5.6,C6.0 :2337,2895,3018,3401,3743,3990; properPureHodge :2974, relativeHodgeBundles :2994, regularSingularDeRhamComparison :3850 | Arbitrary smooth-proper algebraic Hodge input, LF current calculus and complex orientation are present. The regular-singular comparison allows residue 0, hence the trivial lattice O_W; it does not by itself supply mixed weights. Smooth finite-type analytifications meet the manifold separation/countability assumptions. |
| TauCetiRoadmap/EnhancedDerivedSheaves/README.md | §§0.1–0.4 :429,441,455,492; E0.6 :259, E1.4 :580, E2.6 :2293 | Enhanced point-site module/sheaf models, replacement, derived tensor, coherent diagrams and descent are actual targets. Ordinary DerivedCategory alone is not substituted for coherent diagrams. |
| TauCetiRoadmap/DifferentialGeometry/README.md | Layers 0–1 :268,311; Layers 5–9 :503,782,806,816,862 | Forms and fixed-coefficient calculus, compact-support Stokes, de Rham theorem and duality retain their finite-dimensional Hausdorff/countability hypotheses. Smooth complex varieties meet them. Whitney extension and flat-ideal decomposition are additional declared gaps, not falsely attributed to these layers. |
| TauCetiRoadmap/ComplexKahlerGeometry/README.md; TauCetiRoadmap/ComplexManifolds/README.md | K1 :96, K2 :193; complex-manifold Milestones 1–2 :172,197 | Type decomposition, conjugation, ∂/∂̄ and orientation transport are supplied. The exterior order dz∧dz̄ gives ∂∂̄∣z∣²=dz∧dz̄, matching the package's critical −2 factor. |
| TauCetiRoadmap/AlgebraicTopology/README.md | Stages 2–3, Stage 6 items 1–4; Stage 8 item 2 :1667 | Relative (co)homology, excision/products and manifold local duality are supplied. Moore homology identification is used for simplicial abelian groups: constant ℤ gives π₀=ℤ, whereas constant S₃ gives π₀=S₃. |
| Completed/HodgeStructures | Pure/mixed linear objects; pinned definitions listed below | Existing linear Hodge data is imported. This package owns geometric logarithmic realizations, not another linear Hodge carrier. |

The two slugs in packages/MotivicEtaleKTheory/design/plan.json are exactly those at README:83 and :91, with the same named DifferentialGeometry Part II supplier and needs sentences. The first specifies Whitney compatibility, finite-dimensional coefficients and smooth parameters; the second restricts the flat-ideal equality to relatively closed real-analytic pairs. Neither asks for the local division/log-power estimates that §3.2 owns. Object searches found no existing extension of prescribed infinite jets or this flat-ideal equality at the pins or earlier roadmap targets. The relative Borel clause is a specialization of the one extension contract, not an unrelated compound request. Acceptance is conditional on these declared contracts; their absence today is not a finding.

Ownership searches used the roadmap service and direct object searches across main, Completed, board packages, and README/Suggested.lean at **all 28 provided sibling heads**. Searched objects included higher Chow/cycle complexes, universal Chern classes, supported multi-relative K, Dolbeault/logarithmic forms, Deligne complexes, supported semipurity, the auxiliary Aₚ/Aₚ,S/Hₚ complexes, regulator comparisons, Whitney jets and flat ideals. The meaningful open overlaps remain those already disposed of in packages/MotivicEtaleKTheory/reports/FIX-PKG-MotivicEtaleKTheory~2.md:7–15; no new competing owner was found. The acceptance file has no fully qualified declaration that could collide.

| Consumer evidence | Present division of ownership / settled remainder |
| --- | --- |
| TauCetiRoadmap/Polylogarithms/README.md:800–843,1044 | Shared auxiliaries and abstract supported regulator overlap; current §5.2 also owns its concrete current adapters. Its old MotivicEtaleKTheory section links remain external repair work, as recorded in the previous disposition. J₁=−1 and J₂=+1 transport both source and target, preserving the sign dictionary. |
| TauCetiRoadmap/ColemanIntegration/README.md:2434 | L3.Fa.2 still describes multi-relative cubes; the settled move gives the general construction to this package's §2.0a and leaves special-unit localizations/symbols with ColemanIntegration. Ordered face difference is 0−∞, matching +1 for the first-face rank. |
| TauCetiRoadmap/BorelRegulators/README.md:721–745 | §6.0a still describes general Deligne/Chern infrastructure; the settled move makes this package its supplier. Its opposite cone arrow is corrected by negating the homotopy coordinate, preserving the quotient normalization. Arithmetic calibration remains there. |
| packages/ZagierConjecturePolylogarithms/design/plan.json:2951,2968–2970 | Consumer still uses historical MotivicEtaleKTheory M.8 keys. The requested higher coefficient is ch₄=−c₄/6, agreeing with (−1)³/3! here. This is a consumer reference, not a supplier dependency. |
| packages/MixedHodgeModulesAndIrregularHodgeTheory/design/plan.json:3584–3620 | N/logarithmic-filtration has f=0, P=0 as its ordinary case: d+df∧=d and the pole twist is 0. The package supplies only that logarithmic comparison; irregular constructions remain downstream. |

KatoEulerSystems has no readable README among the supplied package files. No current external locator for it is certified; this preserves the earlier settled disposition. No unspecified open pull request was searched for as a substitute for a missing supplied checkout.

The merge order places SchemeKTheoryOperations at 40, KTheoryFiniteLocalFields at 83, MotivesAndAlgebraicCycles at 86 and this roadmap at 87. Its named consumers are later: Zagier at 116, ColemanIntegration at 155, BorelRegulators at 167, MixedHodgeModulesAndIrregularHodgeTheory at 181 and Polylogarithms at 225. Main suppliers are available independently of this ordering. The read-only dependency command returned exit status 0:

```text
depcheck: 29 roadmaps, 262 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. The current citation resolver found no missing roadmap citation or Lean name; its library pass was unavailable, so all pinned names were checked directly below. Internal proof order was also read: §2.1 constructs cyc before §2.2 inverts it; §2.3 treats regular supported schemes; §3.2 supplies filtered geometry before §3.4; §§5.2–5.4 precede the regulator roof; §7.1 defines the independent character before §7.2 compares it. No additional internal forward dependency was found.

### Pinned declaration audit

All **19 explicitly named library declarations** exist at the supplied pins. Reading their bodies/types matters here: ordinary cycles have no face condition, a bare Scheme has no finiteness condition, and linear Hodge structures have no geometric realization.

| Pinned file and line | Declaration(s) and actual scope |
| --- | --- |
| Mathlib/AlgebraicGeometry/AlgebraicCycle/Basic.lean:44,69 | AlgebraicGeometry.AlgebraicCycle is a locally finitely supported coefficient function, with no dimension/admissibility predicate; map uses the quasi-compact map and its dimension/residue-degree weight, defined at :55. |
| Mathlib/AlgebraicGeometry/Scheme.lean:40 | AlgebraicGeometry.Scheme extends the locally ringed-space carrier; Noetherian, separated, finite-type and nonempty conditions are not structure fields. |
| Mathlib/Algebra/Category/ModuleCat/Basic.lean:56 | ModuleCat bundles modules over the specified ring, with explicit carrier universes. |
| Mathlib/Algebra/Homology/HomologicalComplex.lean:59,72 | HomologicalComplex has the shape-indexed differential; d_comp_d supplies its square-zero law. |
| Mathlib/Algebra/Homology/DerivedCategory/Basic.lean:87 | Root DerivedCategory is localization of integer cochain complexes, using the appropriate localization existence setup. It is not a homotopy-coherent diagram carrier. |
| Mathlib/Algebra/Homology/HomotopyCategory/MappingCone.lean:57,261,269 | CochainComplex.mappingCone, inl_v_d and inr_f_d give source-shift-first differential (−d_Aa, f(a)+d_Bb). Shift by −1 and negate b to obtain (d_Aa,f(a)−d_Bb). |
| Mathlib/AlgebraicTopology/DoldKan/Equivalence.lean:167 | CategoryTheory.Abelian.DoldKan.equivalence applies to an abelian category and natural-number chain complexes. The homotopy interpretation is a separate supplier target. |
| TauCeti/Algebra/Homology/GradedCochainComplex.lean:59 | TauCeti.gradedCochainComplex needs actual submodules, a degree-one operator and its square-zero proof; it does not provide the Deligne model's differential theorem. |
| TauCeti/Geometry/Hodge/Structure.lean:62; Morphism.lean:69 | HodgeStructureOn and HodgeStructureOn.IsMorphism specify linear filtered/conjugate data and filtration/conjugation-preserving maps. |
| TauCeti/Geometry/Hodge/Tate/Basic.lean:91,100,111 | tate, tate_F and tate_piece have the unique type (−p,−p). The auxiliary lattice map at :44 is Algebra.linearMap ℤ ℂ, not multiplication by (2πi)ᵖ. The package correctly marks the geometric factor separately. |
| TauCeti/Geometry/Hodge/Mixed/Basic.lean:72; Mixed/Strictness.lean:110 | MixedHodgeStructure uses specified rational and complex models; Hom.range_inf_F_eq_map_F states strictness for a morphism of actual such objects. It cannot manufacture the missing geometric mixed-Hodge object. |

### Source locator audit

Verified **95 distinct explicit source-line start locators in the README**, across nine legally cached works; continuation lines and the additional reference-list anchors were also read where needed. “Verified” means that the named item is there and its hypotheses/convention were compared, not that every proof in the cited work has been formalized. The table groups locators by mathematical use; every explicit start anchor is listed. The source defects below are distinguished from package defects.

| Source | Locators read | Result and scope |
| --- | --- | --- |
| Levine94 | line 407,539,625,655,695,711,719,739,777,1006,1015,1101,1197,1210,1223,1399,1405,1424,1595,1767,1794,2226 | Cycle models, relative splitting/moving, support-local K and rational comparison occur at these locators. Theorem 2.7 is infinite-field; smooth and regular hypotheses vary between intermediate statements. The package explicitly adds regular supported construction and finite-field descent, rather than importing a smooth infinite-field proof unchanged. Two proof-scope gaps are recorded below. |
| BF | line 319,381,506,508,517,530,550,610,661,705,720,741,746,753,766,827,862,877,905,919,934,948,961,974,998,1033,1440,1539,1619 | Dolbeault model, products, semipurity, cubical normalization, auxiliary diagrams and universal regulator comparison are present. Theorem 3.5's proof starts with smooth quasi-projective schemes. Critical operator −2∂∂̄, shifted roof and the product's totalization sign were recomputed. Source defects listed below are not copied into the target claims. |
| BFT | line 63,180,266,277,296,943,948,961 | Cone/cubical conventions, mixed comparison and regulator comparisons are present. Jₙ=(−1)ⁿ reconciles δ=−∂□; the projective current-comparison hypotheses are not used to narrow BF's general construction. |
| Burgos94 | line 102,155,181,316,337,345,358,379; continuation line 190 | Local logarithmic image algebra, filtered comparison, Whitney/Borel extension, regular analytic flat-ideal decomposition and flat-coordinate estimates are present. The two external closed-jet inputs are exactly the declared gaps. Some scanned displays have incomplete extraction, as recorded below. |
| BKK | line 3965,3999,4035,4056,4060,4121,4129,4142,4176,4217,4239,4263,4297,4315,4395,4450,4795,4841; surrounding line 4255,4267 | General real Dolbeault complexes, cone retract, product/homotopy, geometric logarithmic realization, normalized currents and the support criterion match the cited preprint numbering. The source explicitly chooses Zariski sheafification; this is S01's missing specification. |
| DeligneHodgeII | line 852,1044,1142,1147,1242; continuation line 866,988,1223 | Filtered-complex conventions, geometric comparison and refinement are present. H¹(𝔾_m) has weight 2 from residue index 1 plus cohomological degree 1. This does not identify unshifted residue complexes under blowup. |
| KLM | line 553 | Degree-one regulator uses log∣u∣; u=2 gives log 2, torsion units give 0. No integral moving theorem is inferred from this explicit-current source. |
| MVW | line 1054,1204,5827, with the sheaf-comparison continuation | Effective Tate construction, ℤ(1)≃𝔾_m[−1], and smooth perfect-field higher-Chow comparison occur in the published numbering. Theorem 19.1 has no resolution hypothesis; the finite-field repair uses it in precisely that scope. |
| WeibelKBook | line 15979 | Exercise IV.1.12(a) identifies η with [−1]. At ℚ, ψ²[−1]=0 while ηψ²1=[−1]≠0, proving the obstruction used by the repaired §2.0a. |

The manifest has one key per work: nine certified entries, Bloch86 and Beilinson85 uncertified, and Levine98 waived. All twelve referenced works are represented. No duplicate key, illegal source fetch or new missing-reference request was introduced.

## Not verifiable

- **Bloch86 §7** is settled as uncertified. Its original arbitrary-field universal Chern construction and identification with the inverse cycle map could not be checked against the paywalled text. The available BF complex-field construction, Levine cycle comparison and MVW perfect-field carrier repair were checked; they do not certify an unread Bloch proof.
- **Beilinson85 §§1–2, pp.2036–2070** is settled as uncertified; its historical attribution is cited by locator. BF supplies the read comparison argument.
- **Levine98 Part I, Chapter II §§2–3, Chapter III §1 and Chapter V §2** is settled as waived chapter-level background. No finer theorem is certified.
- **Scanned displays in Burgos94 and DeligneHodgeII:** the provided extraction omits or damages some formulas. The theorem labels, surrounding hypotheses and visible formulas were checked, supplemented by the explicit BKK/BF formulations. A claim that every glyph in the printed scans was independently certified would exceed the evidence.
- **KatoEulerSystems:** no current readable package README was available. No absent external target is asserted repaired, and no unspecified open checkout was sought.
- **Future implementation:** this is a statement/proof-plan audit. No Lean build was permitted or run. There are zero declarations to elaborate, so no retained-binder comparison is missing; future geometric carriers and proofs are not thereby certified.

## Source issues

- **Misprint** in BF at Proposition 1.26, printed p.10, line 508: the source says the associator homotopy lands in degree r+s+t; it should be degree r+s+t−1; affects nothing.
- **Misprint** in BF at §2.1, printed p.13, line 618: the source says an intersection of r cubical faces has dimension r; it should be codimension r and dimension n−r; affects nothing.
- **Error** in BF at §2.1, equation (2.3), printed pp.13–14, line 656: the source says the cubical connection maps are smooth, hence flat; it should be flat, with smoothness omitted since the local multiplication model has a critical nodal fiber; affects the proof.
- **Error** in BF at Proposition 2.7, printed p.15, line 701: the source says the internal higher-Chow product applies to arbitrary quasi-projective schemes; it should be restricted to smooth inputs for the diagonal pullback used in this argument; affects a stated result.
- **Error** in BF at Theorem 3.5, printed p.20, line 905: the source says rational K-theory equals higher Chow theory for equidimensional complex schemes; it should be smooth quasi-projective schemes as in its proof, since nilpotent K₁ survives rationally whereas cycle groups are nilpotent-invariant; affects a stated result.
- **Misprint** in BF at proof of Theorem 3.5, printed pp.22–23, line 1006 and line 1045: the source says Gr(N,k) parametrizes k-planes in an N-dimensional space while its tautological bundle has rank N and k increases; it should be N-planes in a k-dimensional space, with k≥N; affects the proof.
- **Misprint** in BFT at §1.1, printed p.2, line 75: the source says the pair complex Aⁿ⊕Bⁿ⁻¹ is the cone shifted by +1; it should be shifted by −1 under the stated cochain convention; affects nothing.
- **Misprint** in BFT at §3.2, printed p.5, line 188: the source says an intersection of r cube faces is r-dimensional; it should be codimension r and dimension n−r; affects nothing.
- **Gap** in Levine94 at Theorem 3.4, printed pp.283–284, line 1405: the source says the regular arbitrary-field result follows from intermediate smooth and infinite-field inputs; it should be supplemented by regular supported construction and finite-field descent with compatible transfer; affects the proof.
- **Gap** in Levine94 at Corollary 4.8, printed p.297, line 1783: the source says the regular-scheme conclusion follows by citing the preceding smooth comparison; it should be supplied with the regular version of the cited comparison argument; affects the proof.
- **Misprint** in BKK at Notation 5.8 and Definition 5.10, printed pp.111–112, line 4020 and line 4035: the source says the two-index type projection is defined only for nonnegative indices but later uses negative indices; it should be defined for all integer indices by the same type-component sum; affects nothing.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "ee4085a9a9698c6dfa27c372102d2d1df32c44af", "job": "RT-MotivicEtaleKTheory~2a", "model": "gpt-6-astra", "worker": "chris-6"} -->
