# AlgebraicTopologyPartII repair report

## F01 (P2) — applied

Eight admitted theorems → four headline theorems. Deleted rationalSphereRanks, the three Fermat theorems, and their two private carriers from `packages/AlgebraicTopologyPartII/Suggested.lean`. Sections 4.4 and 5.3–5.4 retain the mathematical targets, APIs and Checks in prose. Scope’s acceptance-carrier description agrees. Evidence: BS lines 2359–2396; PHAM lines 204–221; the N=1 exponent computation below.

## F02 (P2) — applied

Unqualified affine Morse route → AffineMorseLefschetz A2–A3 for smooth U/ℝ, with singular attachment estimates and arbitrary-real-closed finite-model transfer explicitly owned in §11.1. Added singular and square-zero Checks, exact supplier contracts, and Layer 11 dependencies. Evidence: AffineMorseLefschetz A2–A3; BW lines 978–986; GM lines 5428–5457 and 5587–5597. The restriction theorem retains its full generality.

## F03 (P1) — applied differently

The nonexistent Part II attribution → AffineMorseLefschetz A4.1’s real-closed triangulation/dimension gap and RealAnalyticGeometry R2.1’s bounded theorem. Chart gluing is consumed directly from MotivesAndAlgebraicCycles §7.6a; its free quotient construction has a separate single-object gap. Updated Scope, contracts and every affected dependency in Layers 4, 8 and 11. Evidence: those sections and BW lines 322–325, 378.

## F04 (P2) — applied

SchemeAndStackFoundations §2.23 Borel gap and local re-proof → one MotivesAndAlgebraicCycles §7.6b contract, consumed in §8.5 and in equivariant purity. Defined S^s, V_s, Z_s, descended coefficients, s≥1 and the strict range i<s. Retained both Checks and corrected Layer 8 dependencies. Evidence: BW lines 456–478, which put approximation before purity.

## F05 (P2) — applied

Deleted the finite-free-tensor-adjoints gap. Scope, contracts and §16.4 now use SchemeAndStackFoundations §2.23’s forget_injective/coind_injective through the semialgebraic specialization, and the exact involutive sign twist. Added the diagonal regular-tensor Check. Evidence: §2.19 concerns DQCoh; §2.23 supplies these injectivity facts; B19 lines 773–777 use only ℤ, ℤ[G] and ℤ(1).

## F06 (P2) — applied differently

Unassigned Wu proof → TangentialBordism B4 item 3, with CharacteristicClasses C2.3/C3.2 in Scope, contracts and Layer 12 dependencies. Section 12.3 owns γ_X=w(TX(ℝ)); surface identities apply the suppliers. C2.3 states oriented Euler evaluation, so the nonorientable evaluation is justified through the supplied Wu/Poincaré pairing. Evidence: MILNOR-STASHEFF lines 3155–3159, 3204–3214; BW lines 699–700.

## F07 (P3) — applied

Both BS line 2199 locators → BS line 2211. Section 9.5 owns Remark 1.9’s proof (BW line 798); §12.4 cites the embedded-loop assertion inside Proposition 7.4’s proof (B19 lines 1640–1643), owning the finite-family extension. Added the missing Layer 2 Frobenius dependency. Corrected the native predicate to independent CommRing/LinearOrder hypotheses, and Q → ℚ.

## Check outcomes

- Elaboration: `lake env lean` on `packages/AlgebraicTopologyPartII/Suggested.lean`, from the pinned content checkout, exited **0**. Exactly four warnings: declaration uses `sorry`, at lines 63, 127, 136 and 159, respectively configurationTraceFormula, tameFibreBouquet, rationalBouquetRanks and doubleLoopBetti. No missing object file occurred; no build was needed.
- Elaborated signatures: a single scratch module containing the acceptance file and `#check @name` for **all 15** remaining declarations exited **0**, with the same four warnings. Every type was compared with its README statement. No binder was lost; no retained signature needed changing. There is no section-variable block.
- Acceptance-file policy: **169 lines**, four headline theorems, eleven definitions/abbreviations with real bodies, one `import Mathlib` and three individually used Tau Ceti imports. No sorry'd data, set_option, admitted example, library-trivial theorem or boundary-case declaration. All fifteen names occur in the README; all six deleted names are absent from both files.
- Dependency command: the prescribed `gate --depcheck` with `--name AlgebraicTopologyPartII`, the supplied order and `--movable` exited **0**, with exactly:

    depcheck: 51 roadmaps, 586 edges, 0 problem(s)

  No UPWARD, CYCLE or moved line occurred.
- Supplier-record comparison: **12/12** gap slugs, suppliers and needs sentences match the README byte for byte. The top-level `gaps` list is the only changed part of `packages/AlgebraicTopologyPartII/design/plan.json`; comparison with the original confirms every other key is unchanged.
- Citation resolution: `roadmaps resolve` exited **0** against main 8888d45 and the indexed 363 open heads. It reported no unresolved cross-roadmap citations and no unresolved roadmap Lean names. Its external-library check was unavailable; the relevant declarations were checked directly in the pinned files instead.
- Manifest validation: **17 unique source entries**, each with all required bibliographic and locator fields. GM is the only new cited work. The author-hosted scan was fetched through the sources service and read at the locators below. Preliminary Hamm lookups returned catalogue pages, not the paper; they are not used as evidence or recorded as a certified paper. GM supplies the needed alternative. No missing-reference request remains.
- `git diff --check`: exited **0**, no output. No gate failures were supplied in the brief. No commit or GitHub write was made.

The pins are Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039, as recorded in the content manifest. The main checkout used here is 8888d45, rather than the earlier main revision mentioned in the review.

## Signature comparison

| Declaration | Elaborated inputs and output compared with README | Outcome |
| --- | --- | --- |
| orderedConfiguration | m:ℕ; injective Fin m→ℂ subtype | matches §2.4 |
| configurationPermutation | m and σ; continuous self-map of that subtype | matches §2.4 and the inverse-coordinate convention |
| configurationTraceFormula | F:Type, Field F, Fintype F, m, χ; all-degree finite dimensionality and ordinary trace equality | all finite fields retained; matches §2.4 |
| eulerExponent | n,N,r:ℕ → ℤ, actual Möbius quotient | matches §§3.1–3.2, including total value at r=0 |
| unitSphere | s:ℕ; norm-one sphere in real dimension s+1 | matches §4.4 |
| sphereBouquet | s,N and x:unitSphere s | matches §§4.2–4.5; empty wedge convention retained |
| IsTame | n implicit, f native multivariate polynomial | compact critical neighbourhood and exterior positive gradient bound retained |
| jacobianAlgebra | n implicit, f; quotient by all partial derivatives | matches §4.2 |
| milnorNumber | n implicit, f; complex finrank of the quotient | finite dimensionality remains a theorem conclusion, not a hidden instance |
| fiberMilnorNumber | n implicit, f,a; maximal generalized eigenspace finrank | nilpotents retained; matches §4.2 |
| polynomialFiber | n implicit, f,a; evaluation-level subtype | matches §4.2 |
| tameFibreBouquet | n≥2, IsTame f, arbitrary a and model point x | finite-dimensional Jacobian algebra and μ−μᵃ bouquet; matches §4.2 |
| rationalBouquetRanks | s,N,k, arbitrary Y with topology, y and actual bouquet equivalence | sphere dimension s+2, homotopy degree k+2, divisibility progression and finite dimensionality; matches §4.5 |
| doubleLoopFactor | n,N,r, explicit n≥4 and r>0 | both proof binders remain in the definition; matches §5.1 |
| doubleLoopBetti | s,N,j, arbitrary Y,y and actual bouquet equivalence | n=s+4, sphere dimension s+3, generalized double loops, finite dimensionality and first-j-factor coefficient; matches §5.1 |

## Adversarial mathematics pass

Values in the following table were recomputed by direct small calculations. The Möbius, rank and formal-product coefficient arrays, the S₃ orbit sizes and the surface matrices were also recomputed in scratch. Each row records a defining statement, theorem or convention; API laws and worked examples for the same object were tested with these same values. Passing instances are not asserted to prove the theorem.

| Statement | Instances tried | Values computed on the relevant sides | Result | Change |
| --- | --- | --- | --- | --- |
| Left configuration action | σ=(123), τ=(12), x=(a,b,c) | σ·(τ·x)=(c,b,a)=(στ)·x | inverse-coordinate law holds | none |
| Universe and empty-index convention | Fin 0, empty tuple | one empty function, permutation group order 1, 0!=1 | no empty-carrier exception | none |
| Parity convention | n=0,1,2 | ε=1,0,1 and s=−1,+1,−1 | no truncated n−1 parity | locator corrected |
| Geometric Frobenius | 𝔾_m over 𝔽₂ | ordinary eigenvalues 1,2; compact alternating trace −1+2=1=2−1 | twist and direction agree | none |
| Pair versus support convention | X=Spec R; X=Spec C over R | fixed point: pair 0, supported H²=ℤ/2; free orbit: pair H⁰=ℤ, real part 0 | objects distinguished | none |
| Orientation and Gysin shift | conjugation on ℂ and ℂ²; pt→ℙ¹ | determinants −1,+1; real shift 1, complex shift 2, source twist −1 | all occurrences agree | none |
| Cyclic boundary comparison | q=0,1,2,3 | comparison scalars 1,−1,−1,1; at q=0, (−1)(σ−1)=1−σ | chain convention agrees | none |
| Native semialgebraic predicate | usual and reversed orders on ℤ; polynomial x | positivity gives x>0 and x<0 respectively; x=0 remains {0} | no order/ring compatibility assumed by native definition | contract corrected |
| Ordered configuration subtype | m=0,1,2 | point, ℂ, (0,1) in and (0,0) out | real body determines object | none |
| Configuration permutation map | m=0; a transposition at m=2 | identity of point; (a,b)→(b,a)→(a,b) | inverse maps and continuity have native carriers | none |
| Algebraic configuration carrier | (0,2) over ℤ; (0,1) over 𝔽₂; zero ring | difference 2 nonunit; difference 1 unit; unique zero-ring coefficient tuple | distinctness does not replace units | none |
| Configuration covering | m=0,1; m=2 in characteristic 2 | 1,1,2 sheets; T²+T has two distinct roots | no inversion of m! | none |
| Plane/open-disc comparison | z=0, |z|=1; boundary | images 0, modulus 1/2; inverse denominator at |w|=1 is 0 | open disc is essential | none |
| Split arrangement purity | empty arrangement in A¹; PConf₂ | H⁰ rank 1; PConf₂ ordinary ranks (1,1), compact ranks in degrees (3,4) both 1 | support and ordinary weights differ | none |
| Full root cycle type | T²+T, T²+T+1 over 𝔽₂; constant 1; repeated T² | partitions (1,1), (2), empty; repeated root gives only one geometric point | squarefree hypothesis essential | dependency list corrected |
| Signed permutation-tensor character | σ=(12)(3), N=2; m=N=0 | 2²=4, signed −4 for even n; tensor unit 0⁰=1 | full cycles and parity correct | none |
| Character multiplicativity/averaging | regular C₂ module; tensor square | character (2,0), invariant rank (2+0)/2=1; tensor character (4,0), rank 2 | supplied operations suffice | none |
| configurationTraceFormula | trivial χ, q=2, m=0,1,2,3 | squarefree counts 1,2,2,4 equal 1,q,q²−q,q³−q² | headline survives degeneracies | none |
| Same formula, nonabelian class test | S₃, q=3, types 111,12,3 | counts 1,9,8; sum 18=27−9 | each class has the predicted contribution | none |
| Same formula, sign character | m=2, any q | split minus irreducible count (q²−q)/2−(q²−q)/2=0; cohomological sign inner products 0 | inverse-action choice harmless on cycle type | none |
| eulerExponent / integral factorization | N=0; N=1 both parities; N=2, even n | all 0; (−1,0,0,…) or (1,−1,0,…); first five −2,−1,−2,−3,−6 | integral recursion and quotient agree | locator corrected |
| Möbius inversion and total index | r=1,2,3; r=0 | even-N=2 numerators −2,−2,−6 divided by 1,2,3; r=0 gives 0/0=0 only as total definition | positive-index theorem excludes junk division | none |
| Weighted squarefree product | q=2,c=−2, degrees 0–3; c=0 | coefficients 1,−4,2,4 on both products; c=0 gives 1,0,0,0 | factor exponents retained | none |
| Twisted multiplicities | m=1; m=0 | compact H² rank N; s_nN times s_n=N; m=0 gives 1 only at i=0 | signs and degree reindexing agree | none |
| Stable diagonal | (n,N,j,d)=(4,1,1,1),(5,1,2,1),(4,1,0,0) | diagonal and product coefficients 1,1,1 | truncation includes its boundary | none |
| IsTame | ∑z_i³−1; z₁; x²y−x; constant in n≥2 | gradient norm grows; norm 1; along (t,1/(2t)) norm |t|²→0; constant has noncompact critical locus | first two in, last two out | none |
| IsTame at zero variables | any constant f in zero variables | ambient space singleton; K=whole space, exterior condition empty | total predicate permits it, theorem n≥2 excludes it | none |
| Jacobian algebra | n=2,k=3 Fermat; f=z₁ | bases 1,x,y,xy give dimension 4; derivative 1 gives zero quotient | μ=4 and μ=0 | none |
| Total Milnor finrank | constant f in n≥2 versus tame f=z₁ | native finrank 0 for infinite-dimensional algebra; native finrank 0 for zero algebra | finite-dimensionality conclusion distinguishes them | none |
| Fibre Milnor number | Fermat; ℂ[t]/(t³), multiplication by t² | Fermat eigenvalue −1, μ⁰=0, μ⁻¹=μ; generalized zero-space dimension 3, kernel/quotient dimension 2 | nilpotents cannot be discarded | none |
| Polynomial fibre | f=z₁, level a; f−a at level 0 | same equation z₁=a; both spaces ℂⁿ⁻¹ | translation and subtype membership agree | none |
| tameFibreBouquet | x³−3x+y² at a=0,±2 | μ=2, fibre contributions 0,1; bouquet counts 2,1 | singular fibres included with subtraction | none |
| Same theorem, Fermat/linear | n=2,k=3 at a=0,−1; f=z₁ | 4−0=4 circles; 4−4=0 spheres; 0−0=0 spheres | regular/singular/zero-bouquet cases agree | none |
| unitSphere | s=0,1,2 | S⁰={−1,1}; (1,0) norm 1, zero norm 0; S² has π₂⊗ℚ=π₃⊗ℚ=ℚ | ambient dimension is s+1 | none |
| sphereBouquet | N=0,1,2 | point, one sphere, H² rank 2 for two S² summands | extra wedge point causes no spurious component | none |
| Hilton decomposition | N=0,1,2; weight r=1,2 | word counts 0; one word at r=1 only for N=1; for N=2, counts 2,1 | basic-product input is the general theorem | none |
| Rational sphere ranks | S², S³, S⁴ | nonzero degrees (2,3), (3), (4,7), each rank 1 | N=1 specialization, not a separate acceptance endpoint | Lean special case deleted |
| rationalBouquetRanks | two S² summands; N=0 | degrees 2–9: 2,3,2,3,6,11,18,30; N=0 all 0 | signed formula gives nonnegative ranks | none |
| Sphere/general-rank agreement | N=1, s=0…11, k=0…79 | 960 formula comparisons equal; r≥3 exponents vanish | removal does not lose generality | Lean special case deleted |
| Rational commutative H-space specialization | Ω²pt, Ω²S³, Ω²S⁴; Ω²S² | series 1,1+t,(1+t⁵)/(1−t²); π₀Ω²S²=ℤ | connectedness hypothesis essential | none |
| doubleLoopFactor | (n,N)=(4,1),(5,1); n=4,r=2 | first factors 1+t; (1−t²)⁻¹ and 1+t⁵; next possible degree 3 | sign/substitution and positivity agree | none |
| doubleLoopBetti | (n,N)=(4,0),(4,1),(5,1), degrees 0–8 | arrays (1,0,0,0,0,0,0,0,0), (1,1,0,0,0,0,0,0,0), (1,0,1,0,1,1,1,1,1) | product agrees with point/exterior/polynomial models | none |
| Same theorem, two summands | (n,N)=(4,2), degrees 0–8 | coefficients 1,2,1,1,2,3,4,5,8; low ranks give two exterior degree-1 classes and one degree-3 class | beyond N=1 also tested | none |
| Finite-product cutoff | j=0; n=4,j=2,r=2 | empty product coefficient 1; factor r=2 starts at degree 3>2 | first j factors suffice | none |
| Finite-join bouquet | two/three two-point sets; singleton factor | S¹/S²; bouquet counts 1/1; singleton count 0 | connectivity and product formula agree | none |
| Fermat fibre/skeleton | n=k=2: (1,0),(0,0),(√2,i); n=0; n=2,k=0 | power sums 1,0,1; powers at last point 2,−1; empty-index sum 0; zero-power sum 2 | first in skeleton, second outside fibre, third outside skeleton | carriers retained only as README definitions |
| Strong Fermat retraction and join | zero barycentric coordinate; n=2,k=2; n=2,k=3 | all kth-root phases at weight 0 identify; skeleton circle; (3−1)²=4 circles | phase convention and bouquet consequence agree | Lean route/corollary deleted |
| Positive-value scaling | sum z_i^k=t>0; t=1 | scaled sum t⁻¹t=1; t=1 gives identity | denominator and positive real root nonzero | none |
| Fermat double-loop connectivity | n=5,k=2; n=4,k=2 | π₂S⁴=π₃S⁴=0; π₁Ω²S³=π₃S³=ℤ | n≥5 separates the false boundary | Lean corollary deleted |
| Triangulation/dimension contract | point in R², line, closed/open interval, marked midpoint | dimensions 0,1; closed interval V=2,E=1, χ=1; open edge excludes endpoints; midpoint gives V=3,E=2 | compactness and compatibility retained | owner and Checks corrected |
| Real-closed extension convention | interval over ℝ and a non-Archimedean R | semialgebraic H⁰=ℤ, χ=1 in each | finite semialgebraic covers used, not arbitrary topological covers | owner corrected |
| Chart gluing | affine real line covered by two overlapping semialgebraic charts | each chart’s x coordinate gives the same overlap x; conjugation fixes y=0 in R² | existing locus construction sufficient | consumed directly |
| Free quotient geometry | C₂ free orbit; antipodal S¹; trivial action on point | quotients point and circle with covering degree 2; fixed point has orbit size 1 | free condition excludes wrong covering model | separate gap |
| Equivariant cohomology/Ext stalks | point with trivial/sign/regular lattice | H¹=0,ℤ/2,0; H²=ℤ/2,0,0 | free abelian does not mean regular | none |
| Free descent and support dimension | free orbit; V=R,Z={0}; empty support | H⁰=ℤ,Hⁱ>⁰=0; H¹_Z=ℤ,H²_Z=0; empty-support groups 0 | stated dimension and support windows agree | quotient ownership corrected |
| Twists and regular exact sequences | point, j=1,2; coefficient 𝔽₂ | actions −1,+1; both 𝔽₂ twists act +1; diagonal (1,1) has sign-cokernel class [(1,0)] | coefficient sequences retain signs | none |
| Fundamental ω class | fixed point/sign lattice; free orbit | ω generates ℤ/2 with 2ω=0; free-orbit H¹=0 | zero-model and universal-nonzero-model both excluded | none |
| C₂ periodic cohomology | trivial/sign lattice, degrees 0,1,2 | (ℤ,0,ℤ/2) and (0,ℤ/2,0) | parity and degree zero agree | none |
| Fixed mod-two coordinates | point/circle in positive degree | dimensions 1/2; ω raises equivariant degree preserving ordinary p | convolution and coordinate convention agree | none |
| Rank-one integral coordinates | Y=pt, (i,j)=(0,0),(1,1) | ℤ at q=0; ℤ/2 in odd-sign degree 1 | integral degree-zero term retained | none |
| Twisted Bockstein | trivial/nontrivial rank-one L on S¹ | β_L(1)=0/nonzero generator; at pt β(ω^k) mod2=kω^(k+1) | monodromy and cyclic terms distinguished | none |
| Orientation sheaf and relative orientation | ℝ→pt; conjugation on ℂ; RP² | dualizing shift [1], H_c¹=ℤ; sign −1; nonconstant integral orientation but constant mod2 | coefficient and dimension conventions agree | none |
| Exceptional image adjunction | identity; open inclusion; closed point in ℝ | id!=id; open !=restriction; point !ℤ_ℝ=ℤ[−1], not ℤ[0] | ordinary restriction is wrong for closed embedding | none |
| Finite duality | point with ℤ/4; infinite ⊕𝔽₂ | (1,1)↦1/4 modℤ, perfect; dual of ⊕ is ∏ and double dual is larger | finite stalk condition retained | none |
| Gysin/trace | pt→S¹ and S¹→pt; identity | shifts +1,−1,0; normalized generators map to 1,1,themselves | relative orientation and counit agree | none |
| Finite Borel approximation | V=pt,s=1 and s=2; trivial/sign coefficients | below s: H⁰=ℤ/0; at s=1: H¹(RP¹,ℤ)=ℤ versus H¹(C₂,ℤ)=0; at s=2 sign H¹=ℤ/2 on both sides | strict stable range, descended sign retained | single supplier owner |
| Supported Borel comparison | Z=∅; Z=V=pt | both sides 0 for empty support; point computation as previous row | supports included in comparison | gap made precise |
| Steenrod operations | unit, RP² class a, S¹ class b | Sq⁰1=1; positive Sq(1)=0; Sq¹a=a², Sq²a=0; Sq¹b=b²=0 | instability and normalization distinguish operations | none |
| Real norm/pushforward coordinates | fixed point; pt→RP¹ | norm 2=0 mod2; forgetful H⁰ identity; Gysin sends 1 to a in degree 1 | real shift not doubled | none |
| Self-intersection γ and inverse | real point; empty locus; RP² | 1; unique zero-ring element; γ=1+a+a², inverse 1+a, product 1 modulo a³ | zero-ring and nilpotent inversion agree | none |
| Mod-two support splitting/component classes | point; two fixed points | support retraction identity; indicators (1,0),(0,1) | canonical kernel and component separation agree | none |
| Integral support splitting | X=A¹, i=j=1; permitted parity j=0 | wrong parity: ℤ→ℤ/2 cannot inject; odd sign after purity in permitted parity has positive groups ℤ/2 or 0 | parity restriction essential | none |
| Low-coordinate surjectivity | i≤d; d=2,i=4,j=1 | empty target; only p=1 survives and p=2 excluded | strict cutoff retained | unproved-source formula explicitly owned |
| Barred-γ formula | RP², γ̄=1+a²; x=1 and x=a | β_or(1)=a, β_or(a)=0, β_or(a²)=0; γ̄+β_orγ̄=1+a+a²; formula sends 1→(1+a²)+a²=1 and a→a | correction agrees on parity objects | proof assigned here |
| Relative/complement duality | real-empty conic, M=𝔽₂, quotient RP² | complementary ranks 1,1,1 and top pairing 1×a²↦1 | finite coefficient pairing fits quotient orientation | none |
| Profinite integral duality | point quotient with M=ℤ | completion ℤ̂; dual of ℚ/ℤ is ℤ̂ | completion is not ℤ | none |
| Corrected localization maps/windows | d=1; d=i=2 on RP²; empty real locus | left/right H^(i−1),H^i; H⁰⊕H¹ and H¹⊕H²; empty windows 0 and v iso | distinct windows and γ factors retained | none |
| Boundary trace | ℙ¹, z=1,a; ℙ²,z=a | traces 0,1; deg(a(1+a))=1 while deg a=0 | γ inverse matters | none |
| Self-duality pairing | RP²,x=1,y=a | corrected degree deg(a+a²)=1, uncorrected deg a=0; γγ⁻¹=1 | wrong uncorrected pairing excluded | none |
| Affine ordinary dimension / restriction | 𝔾_m,d=1; real-empty Spec C,d=0 | H¹(ℂ*,ℤ)=ℤ,H²=0; degree-zero restriction ℤ→0, positive degrees 0→0 | strict bound, smooth supplier sufficient only in its range | singular/field extension owned here |
| Singular affine attachment estimates | node xy=0, stratum dimensions a=1,0 | tangent bound 1 or 0; normal bound 0 or 1; total ≤1; whole node contracts, H¹=H²=0 | singular route includes normal data | route repaired |
| Nilpotent affine presentation | Spec R[x,ε]/ε² | dimension 1; complex locus ℂ, real locus R; H⁰=M,Hⁱ>⁰=0 | scheme smoothness not required | new Check |
| Real-empty Lefschetz | real-empty conic d=1 | quotient RP² has no cohomology above 2; boundary degree 2 permits surjection | source boundary not promoted to isomorphism | none |
| Real-locus Lefschetz image criterion | ℙ¹ with real-point/real-empty divisor | real H⁰→H¹ sends 1→1 / 0→𝔽₂ | positive-coordinate hypothesis distinguishes cases | none |
| Injective Lefschetz criterion | relevant real groups all 0; i=d+1 boundary | parity maps 0→0 both injective/surjective; adjacent affine degree d need not vanish | i>d+1 retained | none |
| Affine relative torsion bound | A¹; 𝔾_m with 𝔽₂ | pair contracts for A¹; restriction matrix [[1,0],[1,1]], determinant 1, cokernel 0, relative H²=0 | boundary requires its own argument | none |
| Steenrod-conjugated Gysin | identity; pt→ℙ¹ | Sq id Sq⁻¹=id; real Gysin 1→a, Sq a=a | complex degree 2 has ordinary coordinate degree 1 | none |
| γ versus tangent w | ℙ²/ℝ; ℙ¹/ℝ; empty real locus | both totals 1+a+a²; both 1; both unique zero class | tangent/normal normalization agrees | ownership corrected |
| Surface Wu identity and Euler parity | RP², torus, Klein bottle, empty surface, disk | characteristic forms (1), [[0,1],[1,0]], diag(1,1) give squares 1,0,0; χ=1,0,0; empty 0=0; disk 0≠1 but has boundary | all hypotheses needed at displayed boundary | suppliers and nonorientable route explicit |
| Transverse surface loops | torus class (1,1); zero class; two components | one diagonal embedded circle; empty union; two componentwise circles | no connected-representative claim | corrected locator and finite-family ownership |
| Free-complement admissibility | d=2 and d=3 | low allowed p set empty / {0}; support H_G⁰(−,or(1))=0 in d=2 | parity windows agree | none |
| Near-top cup-ω | ℙ² | ordinary H³=0 has order 1; degree-one parity coordinate maps 𝔽₂→𝔽₂ by identity | zero group meets odd-order hypothesis | none |
| Real-empty quartic rank | ∑x_i⁴=0 | b₃=(3⁵−3)/4=60; even traces 1−1+1−1=0; middle trace 0, invariant rank 30 | rank only, no torsion-freeness inferred | none |
| Semialgebraic fixed-point trace | antipodal S² | traces H⁰=1,H²=−1; Lefschetz sum 0 | fixed-point-free test agrees over real closed fields | none |
| Double-cover sign system | split/connected circle cover; sheet swap at point | monodromy +1/−1; [(1,0)]→−[(1,0)], sign twist cancels stabilizer | ordinary monodromy distinct from stabilizer | none |
| Double-cover twisted Bockstein | split/connected circle cover, x=1 | β_L1=0/e; β_ℤ1=0 so β_L1=β_ℤ1+e | extension normalization correct | none |
| Ramified trace triangle | z²=t; empty branch | branch trace ℤ→ℤ is ×2; cone has ℤ/2; punctured sign H⁰=0,H¹=ℤ/2; empty-branch trace (a,b)↦a+b | derived stalk and trace agree | none |
| Ext-stalk specialization | trivial/sign/regular point stalk | positive groups respectively nonzero in even/odd/no degrees | local Ext not global Ext | none |
| Trace quotient | n=1,2,3; add diagonal b | Q=0; swap acts −1; sum changes by nb and φ unchanged mod n | quotient, not unmarked augmentation kernel | none |
| Trace-zero ψ | n=1,2,3,4 | 0; (−1,1); (−2,1,1); (−3,1,1,1); all trace 0 and mod-n entries all 1 | opposite sign fails at n=3 | none |
| Trace-quotient lifting | a=0; n=1 | η=ζ=0 works; ℤ/1 coefficient is zero, η=ζ=0 works | zero obstruction gives a genuine lift | none |
| Corrected integral lift | n=4,η=0,ζ=[(1,0,0,0)] | a=3; −ψζ=(3,−1,−1,−1) reduces to (3,3,3,3); +ψ reduces to all 1; both traces 0 | minus sign forced beyond trace | none |
| Adjacent sign-degree reduction | n=2,4,6 | H¹ reduction 1,1,1; H² reduction 1,0,1 | degree-two normalization not blind reduction | none |
| Circle obstruction extension | n=2 one regular stalk; n=4; constant ℤ/4 | stalk ℤ/4; stalk 𝔽₂²; quotient unit lifts to 1, boundary 0 but no additive splitting | section lift distinct from sheaf splitting | none |
| Equivariant Ehresmann | product (b,z)↦(−b,τz) | radial transport identity, fibre action τ; at b=0 maps commute with τ | fixed-base hypothesis used | none |
| Stratified pair transport | constant pair; xy=t node | product transport preserves strata; node-stratum derivative has rank 0 versus base dimension 1 | changing crossing fails submersivity | none |
| Finite-index lattice image | point, trivial-action S²; 2ℤ⊂ℤ | index 1,1; last inclusion index 2 and rational rank 1=1 | rational isomorphism not integral surjectivity | none |
| Tensor preservation of injectives | C₂ and S₃ regular tensors; sign square | C₂ basis pairs have two orbits of size 2, giving ℤ[C₂]²; S₃ has six orbits of size 6; sign square (−1)²=1 | coinduction and equivalence suffice | redundant gap retired |
| Double-cover common-lift chase | split fixed-sheet cover; γ=δ=ζ=0 | g=0, norm into sign term 0, ζ=0, η₀=0; both sides 0 in degree 4; 2+1+1=4 | coefficients and degree agree | injectivity route corrected |

## Ownership, citations and maintainer consequences

Read the shape and relevant sections of the main AlgebraicTopology, AffineMorseLefschetz, RealAlgebraicGeometry and RealAnalyticGeometry roadmaps. Object searches used `roadmaps grep` across indexed open heads and main, plus direct searches of board packages and the pinned libraries. Directly read the applicable supplier sections; an owner’s section was not inferred from the review text.

Main citations checked: AlgebraicTopology Stages 2–8 and Stage 5 item 5; SchemeAndStackFoundations §§0.1, 0.2, 0.7, 2.7, 2.19, 2.23; RealAlgebraicGeometry Layers 3 and 6; DifferentialGeometry Layers 2, 3 and 10; GeometricTopology Layer 1; MorseNovikov N6; AffineMorseLefschetz A2–A4.1; RealAnalyticGeometry R2.1. The new singular-affine dimension extension is owned here because A2–A3 explicitly concerns smooth affine manifolds; the singular normal-data and real-closed transfer statements are not supplied there. Compatible triangulation remains with A4.1, and generic semialgebraic loci and cohomology remain with MotivesAndAlgebraicCycles.

New-folder open heads checked: StableHomotopyKTheory §§3.36–3.37 (00bfbf7); MotivesAndAlgebraicCycles §§7.6a–7.6b (79b02f6); EtaleDualityAndPerverseSheaves §§3.5–3.8, 4.7, 6.5 (34e0692); ComplexComparisonPartII C−1.1 (2d50a88); InverseGaloisAndArithmeticFundamentalGroups IG.5.1 (740b9cc); QWittVectors 1.4a (2a7475f); SmoothBundlesConnections B1 item 5 (e3abb0d); CharacteristicClasses C2/C3 (d077cb4); TangentialBordism B4 (bf9da30). Existing-roadmap revisions were not used in place of main. The indexed open contents were available through the supplied roadmap service; no additional pull requests were sought. No roadmap declaration’s fully qualified name is reused by the acceptance file.

Pinned declaration evidence includes `TauCeti/Geometry/RealAlgebraic/Semialgebraic/Basic.lean` lines 63–72 for the independent ring/order assumptions; `TauCeti/FieldTheory/GaloisGroups/FrobeniusOrbits.lean` line 106 for the squarefree root-cycle theorem; `TauCeti/GroupTheory/Perm/Partition.lean` line 96 for full cycles; `TauCeti/Topology/WedgeSum.lean` line 72 for the added wedge point; and `TauCeti/AlgebraicTopology/Cohomology/Basic.lean` lines 94–101 for the native groups and maps. Mathlib evidence: `Mathlib/Topology/Homotopy/HomotopyGroup.lean` line 97, `Mathlib/RepresentationTheory/Character.lean` lines 68 and 113, `Mathlib/Algebra/Algebra/Bilinear.lean` line 143, `Mathlib/LinearAlgebra/Eigenspace/Basic.lean` line 556, `Mathlib/RingTheory/Artinian/Module.lean` line 616, `Mathlib/RingTheory/Artinian/Ring.lean` line 63, `Mathlib/RingTheory/PowerSeries/Binomial.lean` line 47, and `Mathlib/RepresentationTheory/Homological/GroupCohomology/FiniteCyclic.lean` lines 58, 80 and 113. The native loop definition contains its boundary condition and no Hausdorff/CW assumption. No generic supported semialgebraic cohomology or rational H-space carrier was substituted with a scalar stand-in.

The four retained headline names and their signatures are unchanged. Consumers should use the general bouquet, rank and Betti statements; the six deleted names have no Lean contract. The geometry gap keeps its slug but changes supplier to AffineMorseLefschetz A4.1. The Borel gap keeps its slug but changes supplier to MotivesAndAlgebraicCycles §7.6b. A separate semialgebraic-free-quotient-geometry gap requests quotient construction in §7.6a; affine-chart gluing is already explicitly owned there. The tensor-adjoint gap is retired. These are package-side contracts, not assertions that the suppliers have already implemented or added their requested extensions. No supplier files, merge-order file or non-gap design fields were changed.

HILTON, DIMCA, BRUMFIEL and SCHEIDERER remain settled uncertified locators, and KRASNOV remains waived; none was reopened. The source corrections and sign conventions already recorded in the roadmap were retained. This repair report records verification, not independent acceptance; the subsequent independent review remains necessary.
