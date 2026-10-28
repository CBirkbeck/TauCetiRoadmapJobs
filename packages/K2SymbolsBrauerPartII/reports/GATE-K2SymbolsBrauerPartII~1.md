# Human-review response: K2SymbolsBrauerPartII

## H01 (CBirkbeck) — applied

The four asserted KTheoryFiniteLocalFields imports became owned targets in `TauCetiRoadmap/K2SymbolsBrauerPartII/README.md:645` (§§5.0a–5.0d): the adic symbol with its full coefficient diagram, conditional torsion quotient, global torsion comparison, and Picard sequence with its actual injection and localization maps. Their proof plans retain all fields/global fields and import the function-field finiteness ingredients from K2SymbolsBrauer §10.32c; the source statements are tate line 256, tate line 294, tate line 354, tate line 542 and tate line 575.

## H02 (CBirkbeck) — applied differently

The unspecified upstream residue contract became an owned construction and comparison in `TauCetiRoadmap/K2SymbolsBrauerPartII/README.md:234`: construct the Galois residue independently through henselization and tame inertia, then prove ∂=−Pδ for the actual support boundary and fundamental-class purity map, retaining every DVR and the separate residue-field invertibility hypothesis. Absolute purity is imported from its actual owner LefschetzPencilsAndVanishingCycles §0.10; brauer-grothendieck line 1306 and brauer-grothendieck line 2140 verify the independent Galois construction and the Gysin sign, with the cubic Check distinguishing 2κ₃(3) from κ₃(3).

## H03 (CBirkbeck) — applied

The suppressed expression h_F(loc x) became h_F((θ₂♮)⁻¹(loc_Q x)), with the corresponding mod-ℓ^r identity, in `TauCetiRoadmap/K2SymbolsBrauerPartII/README.md:802`; §§5.0d and 5.3 carry det B_Q θ₂♮=(∂ᴹ)⁻¹ through the residue and Picard connecting maps. The cubic Check at line 829 gives tame values 3 and 5, and invariants 1/3 and −1/3, for the product-normalized and raw inverse adapters respectively, as required by K2SymbolsBrauer §§8.1–8.3 and 11.8.

## H04 (CBirkbeck) — applied

The all-exponent ring quotient comparison is now derived in `TauCetiRoadmap/K2SymbolsBrauerPartII/README.md:722` (§5.0e) from the coefficient triangle, H³_cont(O,Z_ℓ(2))=0, and finiteness of K₂(O), with equality to the supplied arithmetic edge on integral reduction. The real dyadic argument uses H³(C₂,Z₂(2))=0 and the zero transition on finite H³ generators, rather than finite 2-cohomological dimension; SelmerIwasawaCohomology §3.15 supplies the actual arithmetic-site comparison, and weibel line 31623 supplies the real coefficient calculation.

## H05 (CBirkbeck) — applied differently

`TauCetiRoadmap/K2SymbolsBrauerPartII/README.md:9` now preserves AlgebraicKTheory A1–A3/A5's shared-carrier ownership explicitly; the prerequisite paths are AlgebraicKTheory → K2SymbolsBrauer → Part II and AlgebraicKTheory A5 → KTheoryFiniteLocalFields §3.1 → Part II. The open index confirms AlgebraicKTheory #1142 is a new roadmap by kim-em at e5df75b and absent from main, so the worker's PR dependency/merge narrative must list it before those consumers and remove the claim of no other-author open dependency; PR text and the merge-order file were left untouched as required by the edit scope.

## Ownership, citations and pinned interfaces

The comparison used main eafdde4 and the supplied open-head index dated 2026-10-24, rather than treating the older review's main snapshot as authoritative. Ownership searches covered the main/Completed roadmaps, board packages, and open-head roadmaps by object, including the readable FunctionFieldArithmetic and MotivicEtaleKTheory proposals: neither supplies these adic torsion/Picard targets, while KTheoryFiniteLocalFields retains its all-field finite norm-residue theorem and explicitly excludes the global package. Part II owns the missing constructions because they supply its existing Tate dictionaries; generic purity, function-field finiteness, arithmetic-site comparison and classical carriers retain their existing owners.

| Supplier | Sections/contracts verified |
| --- | --- |
| AlgebraicKTheory | A1–A3 and A5 shared classical carriers, consumed transitively through the existing adapters |
| K2SymbolsBrauer | §0.4; §§5.1–5.2, 5.13–5.15, 7.1–7.3, 8.1–8.3; Layer 9 residues; §§10.7–10.9, 10.32a–10.32c; §§11.1–11.3, 11.7–11.8, 12.2–12.5 |
| KTheoryFiniteLocalFields | §§1.1, 1.8, 3.0a, 3.1–3.4, 7.3; its global-scope exclusions |
| EtaleCohomologyFoundations | §§0.7, F.0.3, F.3a, F.4.1–F.4.2; smooth purity in §0.10 distinguished from arbitrary-DVR purity |
| LefschetzPencilsAndVanishingCycles | §0.10 regular-noetherian absolute purity, fundamental class and localization consequences |
| SchemeAndStackFoundations | §§0.12–0.14, 2.11, 2.15, 3.4; §2.15's field comparison is not asserted to be an arithmetic-ring comparison |
| ArithmeticGaloisDuality | §§R02.1.2–R02.1.3 compact coefficients; §R02.3.2 function-field Brauer exactness; §R02.4.4 finite cohomology and high-degree real restriction |
| SelmerIwasawaCohomology | §3.15 finite and lattice arithmetic étale/Galois comparisons, including real places and coefficient triangles |
| ArithmeticKTheory | §§5.2, 6.1, 6.3 ordinary descent/adic comparisons and finiteness; no assertion that its displayed mod-ℓ result already states every exponent |
| GeneralAlgebraicKTheory | §§1.7–1.8, Layer 5, §§7.4–7.5 cofibers, K-spectrum and ordered products |
| ClassFieldTheory | Layers 5–6, 10 and 14, including its number-field scope |
| QuadraticFormInvariants | §§6C, 6E, 7B native quadratic and Brauer comparisons |
| ClassicalArithmeticCompletion | §§1.14, 1.24–1.25, 1.44, 1.52 scalar normalization and all-place law |

The final citation resolution found no missing cross-roadmap citations or Lean names. Its external-library-name limitation was covered by direct searches of Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039, verified against the manifest and both package checkouts. In particular:

| Native input | Pin-relative file and locator | Scope used |
| --- | --- | --- |
| Primitive-root additive coordinates | `Mathlib/RingTheory/RootsOfUnity/PrimitiveRoots.lean:461`, `:516` | Positive degree; domain hypotheses retained |
| Kummer coefficient | `TauCeti/FieldTheory/GaloisCohomology/Coefficients.lean:125` | The carrier is Additive (rootsOfUnity n (SeparableClosure K)); the Galois action belongs to its supplied representation structure |
| Kummer connecting class | `TauCeti/FieldTheory/GaloisCohomology/Kummer.lean:249`, `:277` | IsUnit (n : K); cocycle gα/α |
| Ordered continuous cup and negative flip | `TauCeti/RepresentationTheory/Homological/ContCohomology/Cup/Product.lean:595`, `:790` | Joint continuity, biadditivity and equivariance retained |
| Root-valued cup pairing | `TauCeti/NumberTheory/ClassFieldTheory/Local/Symbol.lean:165` | Primitive root, existing coefficient representation |
| Normalized local coordinate | `TauCeti/NumberTheory/ClassFieldTheory/Brauer/RootsOfUnity.lean:89` | Invertibility in the local field; residue invertibility is a separate condition |
| Field Brauer inclusion | `TauCeti/NumberTheory/ClassFieldTheory/Brauer/Torsion.lean:58` | Field Kummer comparison, not a claim about arbitrary schemes |
| Crossed-product comparison | `TauCeti/Algebra/CrossedProduct/Comparison.lean:267`, `:295` | Existing algebraic/cohomological Brauer carrier and actual cocycle |
| Norm-equation Hilbert sign | `TauCeti/NumberTheory/HilbertSymbol/Basic.lean:46`, `:56` | Field and unit inputs; no generic bilinearity hypothesis is silently added |

The new adic/global statements require the missing classical/Milnor K₂ and K-spectrum carriers; the residue and coefficient-reduction statements require the missing coherent finite/adic étale-twist and support-purity interfaces. `TauCetiRoadmap/K2SymbolsBrauerPartII/Suggested.lean:11` records those omissions without introducing stand-ins, data axioms or duplicate declarations.

## Source verification

All four works already recorded by the roadmap were available legally in the supplied cache. The added proof-plan locators were read directly: tate line 168 (compact-coefficient no-divisibility), tate line 197 (Milnor sequence), tate line 256 (adic construction), tate line 294 (coefficient diagram), tate line 354 (conditional torsion), tate line 542 (global localization and finiteness), tate line 575 (Picard sequence); weibel line 30600 (function-field finite kernel), weibel line 31322 (ordinary arithmetic comparison range), and weibel line 31623 (real integral coefficients). The Artin-order convention was checked at milne line 4957 and milne line 5140. The existing Chern/ring distinction was cross-checked at soule line 1693 and soule line 1709, including its root-containment restriction.

For H02, the additional audit source brauer-grothendieck is Colliot-Thélène–Skorobogatov, *The Brauer–Grothendieck group*, author manuscript of 31 October 2019, obtained from the authors' Paris-Saclay page through the source service. Its Proposition 1.4.5 is at brauer-grothendieck line 1306 and Lemma 2.3.3 at brauer-grothendieck line 2140; the manuscript date and numbering agree with the review's citation. This is corroborating audit evidence, not an added README reference; the roadmap's four existing source keys are unchanged, and no source text was copied into any deliverable. No unresolved source request remains.

## Elaborated signatures

A single scratch file contained `#check @name` for all three declarations and was elaborated through the prescribed target build; the checks were then removed from the acceptance module and its final form rebuilt. Comparison with README §§3.3–3.4 found no lost binder and required no signature change:

| Declaration | Elaborated arguments | Agreement |
| --- | --- | --- |
| conicSymbol | (F : Type u) → [Field F] → F → F → Zˣ | Arbitrary field elements, including zero |
| conicSymbol_real_eq_neg_one_iff | ∀ r s : R, conicSymbol R r s = −1 ↔ r≤0 ∧ s≤0 | Nonpositive total criterion |
| conicSymbol_eq_hilbertSymbol | ∀ {F : Type u} [Field F], (2:F)≠0 → ∀ r s : Fˣ, conicSymbol F r s = TauCeti.hilbertSymbol r s | Characteristic-not-2 hypothesis and both unit inputs survive |

Only the module docstring changed in the Lean file; the definition and both headline theorem signatures remain intact.

## Adversarial mathematics pass

Each row records a statement and concrete values, including negative controls. Finite-field powers, matrix products, all 729 basis associativity triples, coefficient reductions and rational norm witnesses were computed explicitly; cohomology values use the displayed two-periodic C₂ resolution and the cited comparison theorems.

| Statement | Instances tried | Values on the two sides | Result | Change |
| --- | --- | --- | --- | --- |
| Standing field/coefficient domain | F₂, m=1,2,3 | m=1 gives zero modules; m=2 maps to 0 in F₂ and is not a unit; m=3 maps to 1 | Matches stated domain | Retain full prime-to-characteristic scope |
| §1.1 native Kummer normalization | R, m=2, a=−1, α=i | conjugation gives (−i)/i=−1 on both models | Equal | Own comparison of actual connecting classes |
| §1.1 ordered cup | R, m=2, a=b=−1 | both Brauer images have invariant 1/2; a slot 1 gives 0 | Equal, nonzero control excludes zero map | Own cup bridge |
| §1.1 coefficient maps | R, m=4→2, class {−1,−1} | nonzero C₂ class reduces to nonzero C₂ class | Equal | Retain actual triangles |
| §1.1 restriction and inseparable transfer | F₂(t)⊂F₂(s), s²=t, m=3 | res κ(t)=2κ(s); cor κ(s)=κ(t); cor res=2 | Degree-free transfer would give 1 | Add inseparable Check |
| §1.6 degree-one residue | Q₇, m=3, π=7 | ∂κ(7)=1 in Z/3; κ(3) has residue 0 | Normalization separates ramified and unramified classes | Construct independently through inertia |
| §1.6 uniformizer independence | π=7→3·7 | residues 1→0+1=1 | Equal | State invariance explicitly |
| §1.6 support/purity comparison | Q₇, m=3 | uniformizer: Galois 1, fundamental-class Gysin −1=2; ordered cup: Galois 2κ(3), Gysin κ(3) | ∂=−Pδ in both degrees | Add actual signed comparison |
| §1.6 ordered unit/uniformizer identity | Q₇, {3,7}, m=3 | tame=3; −κ(3)=2κ(3); cubes in F₇ˣ are {1,6} | Nonzero; sign is detected | Retain minus sign |
| §1.6 reversed symbol | Q₇, {7,3}, m=3 | tame=3⁻¹=5; −κ(5)=κ(3) | Equal to reversed cup residue | State both orders |
| §1.6 two units | Q₇, {3,2}, m=3 | tame=1; Kummer of 1=0; cup residue=0 | Equal | Retain unramified-unit law |
| §1.6 two ramified factors | F₃(t), {t,t}, m=2 | tame=−1=2; cup residue=κ₂(2)=−κ₂(2)≠0 | Missing tame sign would give 0 | Add negative control |
| §1.6 coefficient naturality | Q₇, m=3→1 | 2κ₃(3) maps to 0; residue at m=1 is 0 | Equal | Add coefficient square |
| §1.6 restriction multiplier | t=s², m=3 | unit/uniformizer residue −κ(u) restricts with multiplier 2 to −2κ(u) | Equal | State ramification e explicitly |
| §1.6 transfer | unramified quadratic Q₇ extension, u=3 | N(3)=9≡2; −κ₃(2)=−2κ₃(3), on either route | No extra ramification multiplier | Add computed Check |
| §1.6 wild exclusion | Q₂, m=2, {−1,−1} | tame=1; Hilbert sign=−1 | Invertibility in fraction field does not authorize tame square | Retain residue-field hypothesis |
| §5.0a adic Steinberg descent | R, {−1,2}; any field, {1,b} | κ₂(2)=0, and κ(1)=0; both finite/adic cups are 0 | Compatible with descent | Explicit construction and proof route |
| §5.0a nonzero adic normalization | R, ℓ=2 | h{−1,−1}=1 in C₂; reduction at r=1,2 is 1 | Equal | Retain real place |
| §5.0a finite reduction | Q₇, ℓ=3, {3,7} | contracted invariant=1/3; residue=−κ₃(3); negated map gives −1/3 and +κ₃(3) | Detects rescaling | Require all-exponent coefficient square |
| §5.0a left coefficient square | R, ζ=a=−1, ℓ=2 | γ(ζ⊗a)={−1,−1}; hγ=1; coefficient connecting map C₂→C₂ sends 1→1 | Equal | Include left square, not only finite reduction |
| §5.0a restriction/transfer | F₂(t)⊂F₂(s), ℓ=3 | cor res=2 on Kummer products and h | Equal | Retain inseparable multiplier |
| §5.0a continuous residue compatibility | Q₇, ℓ=3 | finite reductions of residue of {3,7} are −κ₃(3) at r=1; a slot 1 gives 0 at every r | Equal | Use §1.6 and actual coefficient triangles |
| §5.0b torsion quotient | R, ℓ=2 | D=0; primary quotient C₂/0=C₂; h sends generator to 1 | Equal | Own conditional torsion theorem |
| §5.0b divisible quotient negative control | C_(3^∞)⊕C₃→C₃ | kernel=C_(3^∞); quotient=C₃; element (1/3,0) has image 0 | Whole-source injectivity fails | Keep maximal divisible quotient |
| §5.0b kernel/cokernel formulation | model Z₃⊕C_(3^∞)→Z₃ | kernel=C_(3^∞), cokernel=0; 0[3]=0 | Separates divisible kernel from primary target | Retain injectivity hypothesis and supplied no-divisibility input |
| §5.0b zero target | separably closed field | finite H²=0, continuous H²=0, primary quotient by D=0 | Does not assert K₂=0 | Add zero-target control |
| §5.0c finite-kernel argument | finite group C₂ and residue coordinate C₆ | any divisible subgroup maps to 0 in C₆, then to 0 in C₂ | Divisible subgroup is 0 | Own global deduction from named finiteness inputs |
| §5.0c characteristic-prime kernel argument | p=3, finite generated p-divisible kernel | free Z summand has Z/3≠0, so is excluded; finite C₂ has 3C₂=C₂ | Finite kernel has order prime to 3 | Use K2SymbolsBrauer §10.32c |
| §5.0c function-field global torsion | F₃(t), O=F₃[t] | kernel=0; degree-one residue F₃ˣ=C₂; every residue order 3^d−1 is prime to 3 | Torsion, no divisible subgroup | Keep function-field case |
| §5.0c torsion versus finiteness | Q, odd prime residues | F_pˣ/(F_pˣ)²=C₂ for each odd p; infinitely many nonzero coordinates | Global mod-2 group is infinite | Keep infinite-group control |
| §5.0c torsion alone negative control | C_(3^∞) | all elements have finite 3-power order, yet 3D=D and D≠0 | Torsion does not suffice | Include finite-coordinate proof |
| §5.0d Picard sequence | Q, S={2,∞}, ℓ=2 | Pic=0; target {(0,0),(1,1)}; generator maps to (1,1) | Exact C₂→C₂ | Construct actual injection and local map |
| §5.0d function-field one-place case | F₃(t), S={∞}, ℓ=2 | Pic=0; K₂(F₃[t])=0; sum-zero subgroup of C₂ is 0 | 0→0→0→0 | Retain full global-field statement |
| §5.0d function-field two-place case | F₃(t), S={0,∞}, ℓ=2 | K₂(F₃[t,t⁻¹])/2=C₂; {−1,t} has coordinates (1,1), sum 0 | Nonzero control | Add second function-field Check |
| §5.0d Picard tensor source | Pic=C₉, ℓ=3 | ζ⊗g=1 in C₃; ζ⊗3g=0, although 3g has order 3 | Order-ℓ element need not survive tensoring | Add distinguishing Check |
| §5.0d Picard injection sign | odd ℓ=3 connecting-map coordinate | tame connecting generator=1; Quillen-boundary connecting generator=−1=2 | Negative transport is detectable | State connecting-map sign |
| §5.0d local coordinate normalization | Q₇, ℓ=3, {3,7}, ζ=2 | positive-cup coordinate=2; Artin-first value=4; 4⁻¹=2 | Inverse scalar specified | State actual coordinate map |
| §5.0d root independence | ζ→ζ², ℓ=3, e=1 | new exponent=2, and (ζ²)²=ζ⁴=ζ | Equal | Fix root-independent local map |
| §5.0d S-enlargement | Q, {2,∞}⊂{2,3,∞} | {−1,−1}: (1,1)→(1,1,0); new tame value=1 | Zero insertion commutes | State naturality and composition |
| §5.0e coefficient-triangle cokernel | weight 2, real C₂ | H³(C₂,Z₂)=ker(2)=0; H²=Z₂/2=C₂ | Cokernel H³[2^r]=0 | Own reduction lemma |
| §5.0e finite H³ versus limit | C₂, levels 4→2,8→4,16→8 | H³ generators 2,4,8 reduce respectively to 0,0,0 | Nonzero finite groups have inverse limit 0 | Do not assume finite 2-cohomological dimension |
| §5.0e Milnor term | real H² tower C₂←C₂←C₂ | transition maps 1→1; finite tower is ML; lim¹=0 | Continuous H³=0 | Retain derived-limit proof |
| §5.0e all-exponent ring reduction | Z[1/2], r=1,2,3 | (C₂⊗Z₂)/2^r=C₂; finite H²=C₂; generator maps 1→1 | Equal at every r | Define finite arithmetic map by reduction |
| §5.0e odd coefficient control | Z[1/3], ℓ=3 | K₂(O){3}=0; finite H²=0 for r=1,2; real 3-primary term=0 | Equal | Retain all-prime scope |
| §5.0e wrong-weight control | real Z₂(1), r=1 | H²_cont=0; finite H²=C₂; H³_cont[2]=C₂ | Weight-one analogue fails | Add negative control |
| §5.0e naturality under S-enlargement | Z[1/2]→Z[1/6]→Z[1/30] | {−1,−1} remains nonzero; new residues 0 at 3 and 5 by either composite | Equal | State coefficient/localization squares |
| §5.3 adic and finite adapters | O=Z[1/21], x=[3]·[7], completion Q₇ | (θ₂♮)⁻¹x={3,7}, invariant 1/3; θ₂⁻¹x=−{3,7}, invariant −1/3 | Raw comparison fails intended normalization | Add both explicit restriction identities |
| §5.3 Quillen/residue square | same cubic product | det B_Q=5; κ₃(5)=2κ₃(3)=−κ₃(3); ∂h=2κ₃(3) | Positive Kummer against Quillen boundary | Carry adapter through residue and Picard diagrams |
| §5.3 generic Picard kernel | Pic/3=C₃ | Picard injection has three elements, each generic image 0 | Integral injectivity does not give quotient injectivity | Retain actual Picard map |
| §5.5 reused Chern normalization | cubic class and m=6 coordinate 1 | cubic: cup 1/3, Chern −1/3; mod 6: −1=5, reductions 1 mod 2 and 2 mod 3 | Compatible with new adapter | No change to intrinsic −h formula |
| Lean conic definition | R, (0,0),(1,0) | 0=1 has no solution, sign −1; (1,0) witness (1,0) gives 1, sign +1 | Total definition excludes zero-model ambiguity | Definition unchanged |
| Lean real criterion, both directions | (−1,0),(0,1),(−1,−1),(1,−1) | signs −1,+1,−1,+1; both-nonpositive predicate true,false,true,false | Iff agrees including zero | Signature unchanged |
| Lean conic/Hilbert comparison, split case | Q, r=1,s=2 | conic point (1,0) gives 1; norm (3/2)²−(1/2)²=2 | Both signs +1 | Unit binders retained |
| Lean conic/Hilbert exceptional-coordinate cases | r=1,s=−1 over Q | conic (1,0), norm (0,1) gives −1 | No division by zero needed | Characteristic-not-2 hypothesis retained |
| Lean characteristic control | F₂(t), r=1,s=t | conic point (1,0) gives 1; (x+y)² cannot equal t, norm sign −1 | Comparison fails without h2 | Explicit h2 survives elaboration |

The retained layers also received concrete consistency controls:

| Statement | Instances tried | Values on the two sides | Result | Change |
| --- | --- | --- | --- | --- |
| §1.2 weight basis and evaluation | m=5, ζ→ζ², j=1,2,−1,0 | factors 2,4,3,1; 2·3=1 mod 5 | Correct tensor/dual weights | None |
| §1.3 tensor contraction | m=5, i=2,j=3 | tensor value ζ⁶=ζ; ordinary multiplication ζ⁵=1 | Distinct | None |
| §1.4 Brauer symbol | R,m=2; m=1 | Hamilton invariant 1/2; degree-one coefficient target 0 | Nonzero and degenerate cases agree | None |
| §1.5 root-change and naturality | m=5,u=2; identity field map | contraction scalar 3, inverse weight-two scalar 4; identity restricts β to itself | Distinct factors; identity preserved | None |
| §2.1 carry algebra associativity | F₇,m=3,ζ=2,a=3,b=4 | 729 basis triples; every associativity difference 0 | All basis triples agree | None |
| §2.1 commutation | same basis, X,Y | YX coefficient 2; XY coefficient 1 | Relation YX=ζXY | None |
| §2.2 splitting matrices | F₇,m=3,α=1,b=3 | X diagonal (1,4,2), X³=I, Y³=3I, YX−2XY=0 | Equal | None |
| §2.2 splitting without root of b | F₅,m=4,α=1,b=2 | X diagonal (1,3,4,2), X⁴=I, Y⁴=2I; nonzero fourth powers all 1 | b has no fourth root yet representation splits | None |
| §2.3 proper-degree matrix corner | m=4,d=2,s=2 | ambient dimension 16; corner dimension 4; matrix dimension 2²·4=16 | Equal | None |
| §2.3 endpoint and unit checks | d=1,d=m; nontrivial two-by-two corner | dimensions m²=m²·1 and m²=1²·m²; diag(1,0)≠diag(1,1) | Endpoint dimensions agree; corner inclusion is not unital | None |
| §2.4 algebra/cup order | Q₇,ζ=2,{3,7}; F₇((t)),{2,t} | invariants 1/3 and 2/3; opposites −1/3 and −2/3 | Cubic values detect order | None |
| §3.1 full-root exponent versus projection | w=6,m=3 | exponent map ζ→ζ²; primary projection ζ→ζ⁴ | Distinct maps | None |
| §3.2 full-root section | primitive ζ, i=0,1,2 | N(s(1))=1, N(s(ζ))=ζ, N(s(ζ²))=ζ² | Identity on generators | None |
| §3.3 generic bilinearity negative control | Q, (3,−1),(7,−1),(21,−1) | all signs −1; product of first two signs +1 | Generic bilinearity fails | None |
| §§3.4–3.5 Artin versus invariant sign | Q₇,ζ=2,{3,7} | inv=1/3; Artin-first=4=ζ⁻¹; transpose=2=ζ | Two orders distinguished | None |
| §§4.1–4.2 all-place support and reciprocity | Q, {−1,−1}, m=2 | local signs −1 at 2 and ∞, +1 elsewhere; product +1; invariant sum 1/2+1/2=0 in Q/Z | Equal | None |
| §5.1 local finite comparison | R, ℓ=2,3; C | targets C₂,0,0; nonzero real 2-class remains 1 | Correct archimedean cases | Replace obsolete contract reference |
| §5.2 global completion and infinity | Q mod 2; F₃(t) mod 2 | infinitely many C₂ residue quotients in both rational residue families | Neither global target is asserted finite | Use owned adic theorem |
| §5.4 finite spectrum coefficients | F₅,m=6; m=1 | K₂(F₅)=0; K₂(F₅;Z/6)=μ₆(F₅)=C₂, boundary −1; m=1 gives 0 | Whole coefficient group differs from K₂/m | None |

## Build, gate and commit

Commit: f819b811521772b18f1e4f29738b62b1405b56b7 — K2SymbolsBrauerPartII: review repairs (own Tate and residue bridges, expose comparison signs). Only the two permitted roadmap files were committed; the worktree is clean and nothing was pushed.

Final `lake build TauCetiRoadmap.K2SymbolsBrauerPartII.Suggested`: exit 0, with the two expected admitted-theorem warnings:

```text
⚠ [8983/8983] Built TauCetiRoadmap.K2SymbolsBrauerPartII.Suggested (2.3s)
warning: TauCetiRoadmap/K2SymbolsBrauerPartII/Suggested.lean:39:8: declaration uses `sorry`
warning: TauCetiRoadmap/K2SymbolsBrauerPartII/Suggested.lean:46:8: declaration uses `sorry`
Build completed successfully (8983 jobs).
```

Final gate: exit 0. Exact summary:

```text
gate K2SymbolsBrauerPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK
```

Final dependency check with the prescribed merge order and movable mode: exit 0. Complete output:

```text
depcheck: 33 roadmaps, 306 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line and no merge-order movement is requested by this check. The independent open AlgebraicKTheory prerequisite for the worker's PR narrative is recorded in H05.
