# ArithmeticKTheory repair findings

The first fourteen finding sections refer to RT-ArithmeticKTheory_r2a; the following four refer to RT-ArithmeticKTheory_r2b. Repeated identifiers retain each review's numbering. Overlapping findings share one repair and have separate verdicts below.

## F01 (P3) — applied differently

Numerical definitions, routine API theorems and all fifteen Lean examples → README mathematics and Checks only. Deleted their own Lean identifiers throughout the README. The acceptance file retains three definitions/structures and five target theorems. Supplier-owned regularity statements are also deleted under F10; nothing is replaced by a proof in place.

## F02 (P3) — applied

Unspecified representative signatures → explicit headline acceptance test and missing-carrier inventory. Pinned Mathlib/Tau Ceti provide exact K₀, native cyclotomic class numbers and module presentations, but no higher Quillen K-spectrum or required GW/L-spectrum carrier. The docstring names the unavailable arithmetic headlines individually; numerical ranks and Bott slots no longer substitute for them.

## F03 (P2) — applied differently

Reconstructed cycle complexes/norm residue → KTheoryFiniteLocalFields §3.0a, `motivicCycles`/`motivicToK`. Updated Scope, contracts, §5.2 and its consumers. A separate arithmeticMotivicDescent target extends cycles, localization and the K-tower to S-integer bases; §6.12 explicitly consumes it. Added the explicit sign adapter β_n=(−1)^(n−1)∂_n, preserving both suppliers' residue conventions.

## F04 (P2) — applied

Euler-characteristic gap → IntegralIwasawaTheory §§10.4–10.5 and 12.3's actual exports. Deleted the gap from README and plan. Section 7.5 also consumes §6.0's `totallyRealHeckeValue_rational`. Since the supplier's dyadic theorem covers every totally real base, the existing order-ratio target now has that same generality. The ℚ weight-two valuation Check gives 1−3=−2.

## F05 (P2) — applied

New KO/ko and Bott constructions → GeneralizedCohomology G5.4. Retained the algebraic-to-real comparison and real-place descent in §5.4. Updated Scope, exact contracts and Layer 5 dependencies. Complexification still has coefficients 1 and 2 in degrees zero and four; the mod-two degree-two extension still has order four.

## F06 (P2) — applied

General norm/determinant theorem → arithmetic specialization of KTheoryLowDegrees §5.5, `dedekindTransferCoordinates`, using `ClassGroup.relNorm`. Section 1.3 retains the coordinate formulas and S-enlargement compatibility. Added virtual rank −1 to its Checks: transfer is (−d,c_B⁻¹), and the identity extension gives (−1,1).

## F07 (P1) — not actionable in this package: missing general supplier exports require their owners

Corrected every stale H/K/S/Z/U/T/HK/L allocation throughout Scope, contracts and Layers 1–8. Coefficient localization is now §2.1's explicit smash-product adapter. The general C₂ orbit sequence remains `gap:connective-c2-homotopy-orbit-spectral-sequence`. The same sweep found no number-ring signature theorem in GeometryOfNumbersAndQuadraticArithmetic §6, so `gap:number-ring-witt-signature` records that prerequisite. Both gaps match plan entries; this package cannot supply their owners' exports.

## F08 (P2) — applied

Locally constructed decomposition after the criterion → CyclotomicClassGroupsAndStickelberger §§0.2–0.3 before §7.2's use of the criterion. Section 7.3 only constructs the equivariant localized-Picard adapter. Its dependencies no longer feed a prerequisite backwards into §7.2. At p=3, (1+c)/2+(1−c)/2=1 independently of the empty Bernoulli interval.

## F09 (P3) — applied differently

Backticked prospective declarations → ordinary README-only names throughout all eight layers. Kept code formatting for resolved supplier/pinned declarations and retained acceptance declarations. Removed deleted numerical Lean names and stale claims about proved Lean Checks. The Tits building retains its three-line 𝔽₂² test without an invented Lean carrier. The citation resolver now reports no missing own Lean names.

## F10 (P2) — applied

Three cyclotomic gaps and duplicated regularity/projectors/criterion/tower → CyclotomicClassGroupsAndStickelberger §§0.1–0.4, 3.1, 3.3, 4.5, 5.1 and 5.4. Deleted all three gaps and local Lean declarations. The retained corollary is `regularPrime_dividedBernoulli_num`, with its native class-number hypothesis explicit. Section 7.3 now owns only the principal-prime localization adapter; all later K-group applications use those supplied interfaces.

## F11 (P2) — applied

Bordification ownership in §3.2 → ArithmeticLocallySymmetricSpaces ALS.2.2–ALS.2.4 and AdelicAlgebraicGroups §3.6, retaining neat-level and triangulability hypotheses. This package keeps boundary/Steinberg identification, orientation twist, projective-lattice duality and finite-index descent. Added the real-quadratic rank-one circle Check; GL₂/GL₃ orientation signs remain −1/+1. Updated Scope, contracts and the subsection's Needs.

## F12 (P3) — applied

Journal pages in the manuscript locator → manuscript Main Theorem p.1, Proposition 1.2 pp.5–6, Propositions 5.1–5.2 pp.16–18, §6 pp.19–21. Publication pagination remains only in version metadata. Evidence: rognes-k4 line 695 starts p.19; lines 704–724 contain the low-rank calculation, and lines 747–772 the Bökstedt argument.

## F13 (P2) — applied

General ramification dévissage target → SchemeKTheoryOperations §§3.6–3.7, `dvrBoundary_flat_ramification`. Section 2.3 retains arithmetic reindexing, finite support, tower and S-enlargement laws. Deleted the duplicate general theorem name. The warning about K(B/w^e) and both e=2/e=1 controls remain. Needs and the earlier boundary normalization now point to the actual support-pullback theorem.

## F14 (P2) — applied differently

Unrestricted middle group E → short exact sequence of abelian groups, with r≥1 and positive even w. The D₈ witness is valid: a² is the kernel diagonal, but (as)²=1 splits the quotient. Added it as a README negative control only. Abelian lift changes satisfy w(x+v)=wx; the K-group applications already meet this hypothesis.

## F01 (P1) — applied differently

RT-ArithmeticKTheory_r2b. The nonexistent K.n citations and missing coefficient ownership are repaired together with r2a F07. StableHomotopyKTheory §§7.1–7.7 and 7.28 actually supply Moore triangles, reductions, Bocksteins and safe products. Section 2.1 constructs their localization and boundary-product adapter from GeneralAlgebraicKTheory §§4.14 and 8.13; an additional GeneralAlgebraicKTheory gap would duplicate this owned arithmetic assembly.

## F02 (P3) — applied

RT-ArithmeticKTheory_r2b. Corollary 1.3.9 p.31 → p.30, leaving the other locators intact. Evidence: hermitian line 1355 is the p.30 marker, line 1380 states Corollary 1.3.9, and line 1401 begins p.31. The missing abelian hypothesis is independent of this pagination correction.

## F03 (P3) — applied

RT-ArithmeticKTheory_r2b. Preprint-only pagination claim → explicit distinction between marked journal pages of the certified text and the waived preprint's printed pages. The theorem numbering is shared. This agrees with §§8.6–8.7 and the single `groenewegen` manifest entry; no second source key or new source request was introduced.

## F04 (P3) — applied

RT-ArithmeticKTheory_r2b. Deleted the `rfl` equivalence together with its duplicate local predicate under r2a F01/F10. Its elementary definitional content remains in the supplier contract and the class-number hypothesis of §7.2. No replacement acceptance declaration was added.

## Verification outcomes

- `lake env lean` on `packages/ArithmeticKTheory/Suggested.lean`, from the pinned content Lake environment: exit 0; exactly five `declaration uses 'sorry'` warnings, at lines 42, 48, 67, 106 and 114; no errors or other diagnostics. The only import is `Mathlib`; no Tau Ceti object needed building. No Lean process remains running.
- A standalone scratch copy appended `#check @name` for all eight retained top-level declarations and all twelve `OrderCertificate` fields. Elaboration: exit 0, the same five warnings. Compared every elaborated type with README §§1.1, 6.6, 6.14 and 7.2. Dedekind/fraction-field hypotheses, explicit S/F, `[Finite T]`, class-number nondivisibility, primality, oddness and k≥1 all remain. No binder repair was necessary. The sole changed theorem signature replaces the duplicate regularity predicate with native nondivisibility and has a new name.
- Dependency check, final outcome:

```text
moved: ArithmeticKTheory moved in the merge order from #65 to #87, right after its last supplier ClassicalArithmeticCompletion; checked as moved (the worker moves it there when it submits)
depcheck: 15 roadmaps, 118 edges, 0 problem(s)
```

No UPWARD or CYCLE line. The merge-order file was not edited.

- Citation resolution against main and the indexed open heads: no unresolved cross-roadmap citation and no unresolved own Lean name. The resolver does not check pinned libraries in this board checkout; those were inspected in the supplied pinned content checkout instead.
- `git diff --check`: exit 0. TOML and JSON parse successfully; 23 source keys are unique; both gaps match their README contracts. Static import/name checks pass: one import, five target theorems, zero examples, no missing retained README name, no sorry data or set_option, and no machine paths. Git status contains only the four allowed package edits and this requested report. No separate gate failures were listed in the brief; the initial eleven citation leads are resolved by the supplier corrections and removal of prospective code formatting.

## Evidence and ownership boundaries

Main templates read before editing: TauCetiRoadmap/EtaleCohomologyFoundations, GeneralizedCohomology and Chebotarev. Supplier sections were read using the roadmap service and the provided main checkout, not inferred from letter aliases. Searches by object covered main, board packages and all thirteen supplied sibling checkouts, as well as the service's indexed open heads. No helper agent was used.

The imports identified in F03/F05/F06/F10/F11/F13 have earlier owners with the exact interfaces described above. The retained divided-Bernoulli consequence, arithmetic residue-sum assembly, localized Picard adapter, arithmetic descent, boundary orientation comparison and matched-order soundness specialize those interfaces here. No retained Lean declaration has another readable roadmap's fully qualified name. No new foundational carrier was introduced.

The missing signature input is an additional instance of F07's stale-allocation pattern: GeometryOfNumbersAndQuadraticArithmetic §§6.4 and 6.10a supply exact-category Witt objects and integral ℤ calculations, and §6.11 supplies comparisons, but none states the claimed general number-ring signature theorem. Its own signature tests over ℤ do not imply the number-field theorem. The mathematical statement is supported by hermitian lines 2217–2238, especially lines 2224–2226. Its existing carrier owner is named in both copies of the gap. Filling either this gap or the C₂ gap requires a supplier edit outside this package, so that part is left explicitly for the maintainer.

The stale SpecialValuesBirchTate B.3/B.8 allocations could not be resolved on main or at an indexed head. Their numerical applications remain as general downstream applications, with no invented section references. K3BlochGroups is named only as a later consumer; it supplies no input. No change to either later roadmap is required by these repairs.

At the pins (Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a; Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039), Mathlib/RingTheory/DedekindDomain/SInteger.lean:65 defines the ring through valuations outside S. Its lines 88–100 give the empty/full-set comparisons; this does not assert denominator localization. Mathlib/Algebra/Module/Presentation/Basic.lean:170 constructs the quotient map, and lines 266–272 identify its surjectivity with span. TauCeti/CategoryTheory/GrothendieckGroup/Exact.lean:163 defines exact K₀; line 339 gives its additive universal property. Searches of the pinned declaration inventory found no higher Quillen K-group/spectrum or GW/L-spectrum carrier. Neither the K₀ universal property nor a ring-theoretic spectrum is such a carrier.

The residue adapter respects the supplier rather than identifying inverse maps: β₂{5,2}=2 and β₂{2,5}=3 at 5, while the last-slot Milnor residue reverses those values. This is the same convention used in SchemeKTheoryOperations §3.6, GeneralAlgebraicKTheory §8.13, K2SymbolsBrauer's boundary dictionary, KTheoryFiniteLocalFields §3.0a and this roadmap §§2.2, 5.2 and 8.3. The rank-one/real orientation is supported by putman-studenmund lines 165–169; the new elementary extension proof is the explicit abelian presentation argument, not an extra claimed theorem in the source.

All sources used for these repairs were already certified or human-waived in `sources.toml`. No settled source was re-requested and no source extraction was copied into the package. Pagination evidence uses hermitian lines 1355–1401 and rognes-k4 lines 695–772. Divided congruences use sharifi lines 4224–4267; the direct-Artin convention is imported with CyclotomicClassGroupsAndStickelberger's §§0.1–0.3 and 4.5. No suspicious instruction in review/source data was followed.

## Adversarial mathematics ledger

These are mathematical computations, not claims that admitted Lean proofs are implemented. C_m denotes the cyclic group of order m, so C₁=0 has cardinality one. Every row compares the displayed statement with explicit values or a specified counterexample. Hypotheses are those in its numbered README subsection; arithmetic finite-generation statements retain finite S. Formatting-only API conversions do not change their mathematical statements.

| Statement | Instances tried | Computed left side | Computed right side | Result and change |
| --- | --- | --- | --- | --- |
| Conventions: finite S-unit rank | ℚ, S=∅ or {2}; ℚ(i), S=∅ | 0,1,0 | 1+0+0−1, 1+0+1−1, 0+1−1 | Equal; infinite S remains excluded from finiteness. |
| Conventions: β versus last-slot residue | {5,2}, {2,5} at 5 | β values 2,3 | inverses of last-slot values 3,2 | Equal; explicit adapter added in §5.2. |
| Conventions: Tate twist versus tensor | Weight 2 over ℚ | fixed twist order 24 | ordinary (ℚ/ℤ)⊗(ℚ/ℤ)=0, order 1 | Wrong tensor model excluded. |
| Conventions: div | A=C₄, ℚ | ⋂_(m≥1)mA=0,ℚ | roots: m=4 kills C₄; x/m works in ℚ | Equal; ambient roots retained. |
| sUnitSubmonoid, §1.1 | R=ℤ, S=∅,{2},all primes | ±1; ±2^n; all nonzero integers | 1 unit; 0 nonunit; 3 fails at S={2} | Equal; native unit preimage retained. |
| integer_isLocalization_iff, forward/backward | S={2}; M=⟨2⟩ or {1} | true,false | (true∧true),(true∧false) | Both directions distinguished. |
| Denominator criterion, degenerate rings | R a field, S=∅; 0∈M | localization at R× true; localization at M false | no prime condition; M≤R× false for 0∈M | Equal; fraction field excludes zero ring. |
| Torsion-class localization | ℤ[√−5], P=(2,1+√−5) | P²=(2), 2∈P | [P]²=1, 2 invertible off P | Criterion holds without P principal. |
| §1.2 enlargement | S=∅→{2}→{2,3} in ℚ | ℤ→ℤ[1/2]→ℤ[1/6] | composite inclusion into ℚ | Equal; identity/tower maps retained. |
| §1.2 integral closure/projectivity | ℚ⊂ℚ(i), S={2} | ℤ[i,1/2]=ℤ[1/2]⊕iℤ[1/2] | rank [ℚ(i):ℚ]=2 | Equal; upper primes exactly over S. |
| §1.2 extra upper prime | ℤ⊂ℤ[i,1/(2+i)] | inverse has nonintegral norm 1/5 | finite integral extension would have integral norm | Negative control excludes extra inversion. |
| §1.3 transfer coordinates | Virtual (−1,1); identity extension | (−d,c_B⁻¹); (−1,1) | supplied normalized formula with n=−1 | Equal; imported general theorem. |
| §1.3 transfer composite | Free quadratic B; u=−1 | tr₀(1,1)=(2,1); tr₁res₁(−1)=1 | [B]=(2,1); (−1)²=1 | Equal; nonfree B keeps c_B. |
| §2.1 indexing | Field; DVR; ℤ→ℤ[1/2] | residue-family sizes 0,1,1 | ∅; closed point; relative prime {2} | Equal; height-one indexing retained. |
| §2.1 finite support | Residues at 3 and 5 | support size 2 | element of C₂⊕C₄ | Allowed; infinitely many nonzero entries excluded. |
| finiteCoefficientLocalization | Identity localization, m=3 | 0→K/3→K/3 | zero support and identity map | Equal; smash adapter replaces fictional export. |
| Coefficient boundary/product | ℤ_(5), m=16 | β([5][2])=[2], order 4 | β[5]·[2]=1·[2] | Equal; reverse order gives [3]. |
| Moore reduction/Bockstein | p=2, r=1 | quotient 1 mod 4↦1 mod 2 | torsion multiplier 2 | Distinct maps retained; no unsafe product. |
| §2.2 divisor sign | Nonprincipal P | [R/P]=[R]−[P] | rank 0, Picard class [P]⁻¹ | Equal; inverse class retained. |
| §2.2 relative units | ℚ, S={5} | v₅(5)=1, v₅(−1)=0 | ℤ generator, torsion in kernel | Equal. |
| §2.3 restriction/transfer multiplicities | Totally ramified/unramified quadratic | restriction 2/1; transfer 1/2 | e=2/1; f=1/2 | Equal; general support theorem imported. |
| §2.3 residue units/tower | e=2, u=2 in 𝔽₅; tower e=2,3 | 2²=4; weight 6 | res(u)^e; e_total=2·3 | Equal; finite fibres preserve support. |
| §2.4 even injectivity | n=4, k=𝔽₂ | K₄(k)=0 | preceding localization image 0 | Injective; n=2 uses supplied theorem. |
| §3.1 Q-rank zero/stages | Zero module; rank-one projective | rank 0; endomorphisms preserve rank | Q₀ point; no rank-decreasing epimorphism without rank condition | Compatible filtration. |
| §3.1 LayerPoset | V=0, 𝔽₂, 𝔽₂² | 0,2,11 objects | empty; two endpoints; 2+3·3 | Equal; excluded (0,V) would contract nerve. |
| §3.2 building | 𝔽₂²; rank one | three points, H̃₀=ℤ²; empty H̃_(−1)=ℤ | St₂=ℤ²; St₁=ℤ | Equal; remains README construction. |
| §3.2 bordification rank one | Real quadratic F, torsion-free units | ℝ/ℤ circle: H₀=H₁=ℤ | unit rank 2−1=1; boundary empty | Imported geometry retains this case. |
| §3.2 orientation twist | diag(−1,1), diag(−1,1,1) over ℚ | (−1)^1=−1; (−1)^2=1 | sign(N det)^(m−1) | Equal; twist comparison owned here. |
| §3.2 relative homology | m=1,i=1; i<m | ⊕_Pic ℤ; 0 | H₀(Aut(P);St₁); negative homology 0 | Equal; integer subtraction required. |
| §3.2 stability/finite type | i=0,m=0; Pic infinite | H₀ map ℤ→ℤ identity | surjective/isomorphic stable H₀; infinitely many rank-one summands | Finiteness retains finite Pic hypothesis. |
| §3.3 rational localization | ℤ→ℤ[1/2], n=2,3 | finite groups tensor ℚ give 0 | residue K₁(𝔽₂)=0, K₂(𝔽₂)=0 | Equal actual rationalized maps. |
| §3.4 order/central-simple ranks | ℚ, ℚ(i), degrees 3,5 | (0,1), (1,1) | r₂, r₁+r₂ | Equal; matrix size contributes no rank factor. |
| §3.4 numerical ρ | Signature (1,0), n=0,1,2,3,5 | 0,1,0,0,1 | residue function; K₀ actual rank 1 | Numerical boundary distinguished; Lean padding deleted. |
| §3.4 even ring/field groups | K₂(ℤ), K₂(ℚ) | order 2; infinitely many nonzero residue summands | finite ring group; infinite torsion field group | No field finite-generation inference. |
| §3.5 quadratic Witt injection | R=ℤ; strict Lagrangian L | 2q\|L=0 forces q\|L=0 | torsion-free R kills no nonzero q-value by 2 | Correct; characteristic 2 excluded. |
| Signature supplier input | ℤ lines ⟨1⟩,⟨−1⟩,H | 1,−1,0 | real signatures 1,−1,0 | Normalization fixed; supplier gap retained. |
| Signature rank input | Golden units 1,ε | vectors (1,1),(1,−1), determinant −2 | two independent real coordinates | Rank 2; supplier statement does not claim surjectivity. |
| §3.5 symmetric L-table | R=ℤ, residues 0,1,2,3 | ℤ,C₂,0,0 | supplied integral computation | Equal; Dedekind extension remains local target. |
| §3.5 quadratic L-table | R=ℤ, residues 0,1,2,3 | ℤ,0,C₂,0 | supplied integral computation | Equal; no conflation with symmetric table. |
| §3.5 genuine comparison ranges | m=0,1 | (n≤−2,n≥−1); (n≤0,n≥1) | union in each case all integers | Covers every integer; classical n=0 uses §8.1. |
| C₂ orbit spectral sequence | E=Hℤ, trivial/sign action | π₀,π₁,π₂=(ℤ,C₂,0)/(C₂,0,C₂) | periodic resolution has maps (0,2)/(−2,0) | Equal; nontrivial action cannot use constant AHSS. |
| C₂ connectivity/finite diagonals | E=0, ΣHℤ | (0,0,0); (0,ℤ,C₂) | zero rows; one q=1 row | Equal; natural strongly convergent sequence remains a gap. |
| §4.1 W and restriction | 𝔽₃, weights 1,2; quadratic E/F | orders 2,8; cor res=2 | 3^i−1; degree 2 | Equal; weight zero group infinite. |
| §4.1 negative twist | ℚ, i=±2 | fixed-group orders 24,24 | image-unit conditions u²=1 and u⁻²=1 equivalent | Equal under chosen underlying identification. |
| §4.2 odd-primary formula | F=ℚ, ℓ=3, i=1,2,6 | 1,3,9 | r=2,a=1,b=0,0,1 | Equal; ℓ=2 not an instance. |
| §4.3 exceptionality | ℚ, ℚ(i), ℚ(√−7), ℚ(√−2) | exceptional,true/false/true/false | images full; 1 mod4; full; {1,3 mod8} cyclic | Equivalent criteria checked. |
| §4.3 general-field boundary | ℝ | dyadic extension group C₂ cyclic | not eventually noncyclic | Number-field real-place criterion not extended. |
| §4.3 dyadic orders | ℚ, i=1,2; ℚ(i), i=2 | 2,8;8 | a=2,b=0,1; first/even cases | Equal; i=0 excluded. |
| §4.4 rational w | i=2,4,6,10 | 24,240,504,264 | 8·3,16·3·5,8·9·7,8·3·11 | Equal; finite prime product. |
| §5.1 Soulé | ℚ, n=3; n=1 | C₄₈→C₄₈ identity; ±1→ℚ× not onto | iso for n≥3; 2 absent in degree-one image | Range necessary. |
| §5.1 even boundary | k=𝔽₂, i=1 | K₁(k)=0, order1 | 2¹−1=1 | Correct trivial residue; support still direct sum. |
| §5.2 norm residue | k=𝔽₅, a=0,1, m=2 | C₂ and k×/(k×)²=C₂ | H⁰=C₂; H¹=C₂, nonsquare 2 | Shared supplier map; no new Milnor carrier. |
| §5.2 invertibility boundary | k=𝔽₂(t), ℓ=2 | coefficient not invertible | ℓ=char k | Outside stated étale interface. |
| §5.2 arithmetic motivic localization | R=ℤ[1/5], weight1 | H¹={±5^n},H²=0; boundary v₃(3)=1 | R×,Pic=0; residue H⁰(𝔽₃,ℤ(0))=ℤ | Explicit mixed-characteristic extension added. |
| §5.2 arithmetic motivic coefficients | R=ℤ[1/2], weight1, m=2 | unit-square classes1,−1,2,−2 | H¹ order4; weight-zero H⁰ order2 | Weight conventions differ as required. |
| §5.2 residue coefficient Bockstein | 𝔽₅, weight1, m=2 | μ₂=C₂, nontrivial element−1 | C₄[2]={1,−1}, same nonzero class | Integral/coefficient boundary retained. |
| §5.2 Suslin torsion action | i=1,2, m=5, automorphism exponent2 | action multipliers2,4 | 2^i mod5 | Correct twist, not constant action. |
| §5.2 e/Bockstein edge | ℚ, i=2 | source C₄₈, target C₂₄, kernel C₂ | e surjective, coefficient β degree −1 | Equal; real case not injective. |
| §5.2 edge Chern limitation | ℚ, n=5 | torsion source0; W₃=C₂ | cokernel C₂ | Correct; free rank does not fix torsion. |
| §5.3 imaginary integral groups | ℚ(i), n=3 | ℤ⊕C₂₄ | r₂=1, w₂=24 | Equal; exceptionality not a new exclusion. |
| §5.4 KO coefficients | n=0,…,7 | ℤ,C₂,C₂,0,ℤ,0,0,0 | supplied KO table | Equal; models imported. |
| §5.4 KO mod2 | n=0,…,7 | orders 2,2,4,2,2,1,1,1 | Bockstein extension plus π₂=C₄ | Equal; middle group not C₂². |
| §5.4 complexification | n=0,4 | multipliers1,2 | ranks complexified line/quaternionic class | Equal, preserves supplier normalization. |
| §5.4 abelian extension normal form | (r,w)=(1,24),(2,2),(1,8),(2,8) | C₄₈; C₄⊕C₂; C₁₆; C₁₆⊕C₂ | orders 48,8,16,32; wx=diagonal | Correct with added abelian hypothesis. |
| §5.4 D₈ negative control | a=(1,0),s=(0,1) | a²=(2,0); (as)²=(0,0); as=(1,1) | sa=(3,1), unequal; kernel diagonal (2,0) | Refutes old nonabelian version. |
| §5.4 changing a lift | Abelian kernel exponent2, w even | w(x+v)=wx+wv=wx | wv=0 | Nonsplitting follows; r=0 excluded. |
| §5.4 odd table/e-map | ℚ, n=3,5 | C₄₈; ℤ, torsion0 | w₂·2=48; w₃/2=1 | Kernel/cokernel (C₂,0)/(0,C₂). |
| §5.5 wreath detection | q=7,ℓ=3,r=2 | \|GL₂\|=2016, wreath order18,index112 | v₃ both2 | Prime-to-3 index holds. |
| §5.5 full roots necessary | q=19,ℓ=3,r=1 | μ₃ index6; μ₉ index2 | v₃(q−1)=2 | Full root group retained. |
| §5.5 dyadic residue condition | q=3,ℓ=2,r=2 | v₂\|GL₂(𝔽₃)\|=4 | r·v₂(q−1)+v₂(2!)=3 | Excluded by q≡1 mod4 hypothesis. |
| §5.5 dyadic norm | action3 on C₈ | N=4, image {0,4} | invariants {0,4} | Onto; action7 gives N=0 and fails. |
| §6.1 even ℓ-rank | s=1,t=0; C_(ℓ²),C_ℓ | 0; both quotients have dimension1 | t+s−1=0; exponents differ | Rank not order. |
| §6.1 excluded real comparison | ℚ, i=3,ℓ=2 | K₆(ℤ){2}=0 | H²(ℤ[1/2],ℤ₂(4)) has order2 | Negative control retained. |
| §6.2 Selmer signature defect | ℚ; ℚ(√7), before/after inverting7 | j=0; j=1→0 | signs of −1 diagonal; √7 gives (+,−) | S-dependent defect retained. |
| §6.2 units-only wrong model | ℚ(√34), x=5+√34 | N(x)=25−34=−9, signs (+,−) | even prime valuations; unit signs diagonal | Correct Selmer definition gives j=0. |
| §6.3 hidden degree-four kernel | ℚ(√7) | K₄{2}=C₂, H²=0 | ρ=1, kernel order2 | Hidden subgroup retained. |
| §6.3 degree boundaries | ℚ, r₁=1 | j=ρ=0; n=0,1 outside range | 0≤ρ≤r₁−1=0 | No periodic ordinary K₀/K₁ claim. |
| §6.4 mod-two orders | ℚ, S={2}, residues1,…,8 | 2,4,4,4,2,2,1,2 | exponents1,2,2,2,1,1,0,1 | Equal. |
| §6.4 even two-ranks | (r,s,t,j)=(1,1,0,0)/(2,1,0,1) | at2,4,6,8: (1,0,0,0)/(2,1,1,0) | branch formulas | Equal; numerical Lean stand-in deleted. |
| §6.4 enlargement | ℚ(√7), degree4 | before 1+1−1=1; after0+2−1=1 | s rises, j drops | No unconditional arithmetic +1 rule. |
| §6.4 truncated subtraction | r=t=j=0,n=0,s=0→1 | 0→0 | not 0→1 | s≥1 retained in fixed-parameter identity. |
| §6.5 order ratios | ℚ, i=2,4 | 2·2/48=1/12; 2·1/240=1/120 | cohomology ratios2/24,2/240 | Correct dyadic factor2. |
| divisibleSubgroup root membership | C₄, x=2; ℚ,x=1 | roots at2 but none at4; root1/m | false; true | All positive multipliers, no m=0. |
| §6.6 div direct sum/functoriality | ℚ⊕C₄; empty sum | ℚ⊕0;0 | coordinate roots on finite support | Equal; API moved to prose. |
| §6.6 div need not divisible | 2x=0,2^n y_n=x | div=⟨x⟩=C₂ | every ambient root exists; 2·C₂=0 | Internal divisibility would be false. |
| inter_mul_eventually_eq_divisibleSubgroup | A=C₄,T={0,2} | T∩2A=T; T∩4A=0 | div A=0; m₀=4 works | T exponent2 alone fails. |
| Stabilization degenerate case | T=0, div A=0 | m₀=1; intersections0 for all positive m | div A=0 | Positive quantifier retained. |
| §6.6 arithmetic coefficient control | Caputo sextic, 3-primary part | T=C₃, T∩3A=C₃, div A=0 | annihilator3; stabilization stricter | Distinguishes exponent and eventual bound. |
| §6.7 positiveEvenK | ℚ, i=1 | real sign on K₂(ℤ) is onto C₂; positive kernel0 | remove factor2 | Equal; sign quotient only in selected residue. |
| §6.7 local symbol quotient | ℚ₂, i=1 | target roots C₂ | order w₁=2, not w₂=24 | Correct twist/order distinction. |
| §6.8 Moore order sequence | F=ℚ,i=1,ℓ=2 | \|WK\|=1, local target2 | \|K₂⁺(ℤ)\|·\|D₁(ℚ)\|=1·2 | Products both2. |
| §6.9 continuous real terms | i odd/even | H²(ℝ,ℤ₂(i+1))=C₂/0 | trivial/sign twist under C₂ | Equal; finite-level terms not substituted. |
| §6.9 hidden kernel exact sequence | ℚ(√7),i=2 | C has order2 | 2^ρ=2 | Correction retained instead of isomorphism. |
| §6.10 special/very special | ℚ,ℚ(i),ℚ(√−17),ℚ(√−14) | special false,false,true,true; last very-special false | dyadic completions ℚ₂(i),ℚ₂(√2) | Alternatives distinguished. |
| §6.10 finite twisted norm | m=4,u=3; m=8,u=3 | N=0/image0; N=4/image{0,4} | invariants{0,2};{0,4} | Zero versus isomorphism as stated. |
| §6.10 nonunit Frobenius | m=4,q=2 | multiplication2 has kernel{0,2} | not an automorphism | Coprimality required. |
| §6.11 norm criterion | ℝ,m=2, inputs(−1,−1),(−1,1) | symbols−1,+1 | −1 not a ℂ-norm; 1=norm1 | Direction retained from actual supplier. |
| §6.11 coinvariant exactness | C₂ sign-action on C₄ | coinvariants C₂; H₁=C₂ | resolution ker(−2)/im0=C₂ | Homology obstruction prevents left exactness. |
| §6.11 compatible prime prescriptions | F=ℚ(i) | split odd prime norms1 mod4 | prescription3 mod4 not in cyclotomic image | Fibre-product constraint retained. |
| §6.11 Picard-image defect | special odd i; very-special even i | dual defect orders2→2 kernel0;2→1 kernel2 | full-field homology0;C₂ | Twist field essential in even case. |
| §6.12 wild/div quotient | ℚ,i=1; ℚ(√−14),i odd | quotient0;C₂ | nonspecial/special alternatives | Equal; no splitting inferred. |
| §6.12 raw versus symbol | i=1, torsion global class | image in uniquely divisible local kernel=0 | torsion∩uniquely divisible=0 | Degree-two equality only. |
| §6.13 Keune twist | p=5, C₄ with χ=2, χ⁻¹ action3 | diagonal2·3=1 | untwisted3/reverse twist3·3=4 | Correct χ⁻¹ component; p=2 excluded. |
| OrderCertificate soundness | P=A=B=C₂; P=0 | orders2≥2≥2;1≥1≥1 | first-map fibre orders1;1 | Presentations forced, no conclusion in hypothesis. |
| OrderCertificate wrong model | P=C₄,A=C₂,B order4 | upper4≥2 true; lower4≤2 false | card_match would require4=4 with impossible surjection | Rejects mere upper bound. |
| §6.14 cohomology certificate | real degree4,ρ=1,H²=0 | lower order2 | 2^ρ·\|H²\|=2·1 | Hidden factor retained. |
| §6.15 Bott slot identity | j=0,−1,1; positive/negative | (0,0)/(2,1);(2,0)/(0,−1);(2,2)/(0,1) | total degrees0,−2,2 | Both signs correct; numerical declarations deleted. |
| §6.15 dualization parity | j=−1→1 positive | twists0→2, cohomological index2→2 | signs+1→+1 | Period-two twist rule correct. |
| §6.15 odd-modulus splitting | C₂ as abelian group, identity involution | positive=negative=all | 2 noninvertible | Odd prime powers retained. |
| §6.16 ordinary/Bott boundary | ℤ, degree1; ℤ[1/p], degree1 | mod odd q group0; valuation C_q | localization supplies extra class | Degree-one ranges distinct. |
| §7.1 positive Bernoulli convention | k=0,1,2,5,6 | −1,1/6,1/30,5/66,691/2730 | (−1)^(k+1)B_(2k) | Equal; positivity only k≥1. |
| §7.1 denominator formula | k=1,2,3,5 | den(B_(2k)/(4k))=24,240,504,264 | w₂,w₄,w₆,w₁₀ | Equal. |
| regularPrime_dividedBernoulli_num | p=5,k=5; p=3,k=1 | B₁₀/5=1/66; B₂=1/6; numerators1,1 | neither5 nor3 divides1 | Correct cancellation and exceptional branch. |
| §7.2 divided congruence | p=5,n=2,6 | 1/12≡3;1/252≡3 | same residue modulo5 | Imported congruence, no division by k mod p. |
| §7.2 k=0 negative control | any odd p | B₀/0=0, numerator0 | p∣0 | k≥1 necessary. |
| §7.2 finite criterion | p=3,37 | empty index set; num B₃₂=−37·208360028141 | regular3; irregular37 | Criterion imported, no local copy. |
| §7.2 projector decomposition | p=3 | (1+c)/2+(1−c)/2=1 | identity endomorphism | Supplies vanished-component implication before criterion. |
| §7.3 localization adapter | prime(1−ζ_ℓ); ℓ=3 | ideal class0; A/3=P=0 | quotient by principal class changes nothing | Equivariant adapter only. |
| §7.3 character orientation | ℓ=37,k=16 | 1−32≡5 mod36 | ratio1/χ³¹=χ⁵ | Direct Artin convention retained. |
| §7.4 cyclotomic even vanishing | ℓ=3, regular base, one prime | ℓ-rank t+s−1=0+1−1=0 | finite ℓ-primary group zero | Field still has residue summands. |
| §7.4 regular coefficient ranks | ℓ=3 or5 | generator residues {0,3,1}/{0,7,1,5} | patterns1,1,0,1 /1,1,0,0,0,1,0,1 | Periodic coefficient table retained. |
| §7.5 stable building connectivity | m=4 | generic bound3; required bound4 | Proposition5.2 supplies4 | Extra connectivity remains explicit. |
| §7.5 low spectrum homology | ℤ through degree4 | ℤ,0,0,C₂,0 | table differentials remove degree4 | Nonzero H₃ retained. |
| §7.5 Bökstedt comparison/K₄ | JK₃{2},JK₄{2} | C₁₆,0; η-image0 | d₂ must kill total-degree4 class | Integral K₄=0; localized K₄ differs. |
| §7.5 Euler quotient | ℚ,k=1 | v₂\|H²\|−v₂\|H¹\|=1−3=−2 | v₂\|ζ(−1)\|=v₂(1/12)=−2 | Existing general supplier theorem used. |
| §7.5 K-order ratio | ℚ,k=1,2 | 2·2/48=1/12;2·1/240=1/120 | \|ζ(−1)\|,\|ζ(−3)\| | Equal; rationality is separate named input. |
| §7.5 integer even orders | a=0; degree22 | orders2,1;691 | 2c₁,c₂;c₆ from B₁₂ | Correct 8a+6 index2a+2. |
| §7.5 Vandiver table boundary | a=0,1 in 8a+1 row | n=1:K₁=C₂; n=9 free rank1 | row requires n≥2 | Conditional higher table excludes K₁. |
| §8.1 certified arithmetic data | Golden field | degree2; unit rank1; w₂=120 | 2+0=2;2−1=1 | Fake degree3 rejected. |
| §8.2 one-prime localization | p=2,3, n=2 | C₂;C₂⊕C₂ | orders2(p−1)=2,4 | Splitting at degree2 only. |
| §8.2 K₄ localization | p=2 | C_(2²−1)=C₃ | K₄(ℤ)=0, quotientK₃(𝔽₂)=C₃ | Equal, not integral vanishing. |
| §8.2 rational field | prime residues2,3,5 | orders1,2,4 | p−1 | Infinite direct sum, finite support retained. |
| §8.3 Tate filtration | Gaussian π=1+i | 1+(1+i)i=i | i∈U₁ and U=⟨i⟩ | Trivial first graded group. |
| §8.3 Tate triangle sign | {2,5} at5 | Tate residue2 | β inverse3 | Same two-term adapter as §§2.2/5.2. |
| §8.4 small norm | ℚ, a=2,b=7,v=5 | \|a−b\|=5<25 | (a−b)/5=−1 old unit | Kernel criterion holds; a=b gives0 directly. |
| §8.4 equality boundary | a=1,b=26,v=5 | \|a−b\|=25=q² | two v-factors possible | Strict inequality required. |
| §8.5 Gaussian bounds | q=5 | 1+1/√2≈1.707;√2≈1.414 | √5≈2.236 | Both strict; q=2 separate. |
| §8.5 Gaussian symbol | x={i,i} | 3x=0 and4x=0 | x=4x−3x=0 | Empty tame-kernel presentation sound. |
| §8.6 congruence lattice | ℚ,s=2,3,v=5 | indices5,25; (2,1) has residue relation0 | q^(s−1)=5,25; (1,1) relation−1 | Correct index and non-example. |
| §8.6 norm/covolume | Golden s=2,3 | 5q,5√5q² | \|Δ\|^(s/2)q^(s−1), Δ=5 | Equal; length generality retained. |
| §8.6 golden multiplication | ε², ε·conj ε | [1,1],−1 | ε+1,[0,1][1,−1]=[−1,0] | Product and norm formulas agree. |
| §8.6 ball volume | n=2,Δ=5 | vol B_t=2πt | 4√5t/(2√5/π)=2πt | Correct normalization. |
| §8.6 strict old-unit bound | q=4,t=4, tuple(2,2) | zero residues, nonzero tuple | t=q, excluded by t<q | Boundary witness retained. |
| §8.7 fraction comparison | 2/1 and1/3 mod5 | residues2,2; cross-difference5 | 2·2·3=12<25 | Same quotient class; self-difference0 harmless. |
| §8.7 golden cutoff | d=2√5/π | bounds≈32.423,9.324,2.885,12.318 | all<33 | q>33 suffices, equality steps retained. |
| §8.7 inverse-generator estimate | golden earlier q′, Δ=5 | residual ideal norm≤√5≈2.236 | least nontrivial ideal norm4 | Ideal must be O; π′ is inverse generator. |
| §8.8 complete prime list | norms≤33 | 4,5,9,11,11,19,19,29,29,31,31 | eleven listed prime generators | Full list, including tied norms. |
| §8.9 sign bounds | g={−1,−1},h={−1,ε} | vectors(−1,−1),(1,−1) | independent F₂ vectors, determinant1 | Upper/lower orders both4. |
| §8.9 special-value test | Golden | 4/120=1/30 | ζ_F(−1)=1/30 | Comparison follows certificate, not a bound premise. |
| §8.10 K₃ examples | ℚ(i),ℚ | ℤ⊕C₂₄;C₄₈ | r₂=1/0, shared w₂=24, real factor2 | Correct carrier-specific headlines remain README-only. |

The following rows give each finite relation and ordered determinant its own computed value; the coordinates are the README's [a,b] basis. Residue/index rows also recompute the generated multiplicative subgroup rather than assuming residue surjectivity.

| Statement | Instances tried | Computed left side | Computed right side | Result and change |
| --- | --- | --- | --- | --- |
| §8.8, π=(2,0), relation 1 | Exact rational powers, including negative exponents | (-10,6) | (-10,6) | Equal; wording only. |
| §8.8, π=(2,0), relation 2 | Exact rational powers, including negative exponents | (-4,-6) | (-4,-6) | Equal; wording only. |
| §8.8, π=(2,0), relation 3 | Exact rational powers, including negative exponents | (-6,-10) | (-6,-10) | Equal; wording only. |
| §8.8, π=(2,0), relation 4 | Exact rational powers, including negative exponents | (-2,2) | (-2,2) | Equal; wording only. |
| §8.8, π=(-1,2), relation 1 | Exact rational powers, including negative exponents | (-32,-16) | (-32,-16) | Equal; wording only. |
| §8.8, π=(-1,2), relation 2 | Exact rational powers, including negative exponents | (-4,-12) | (-4,-12) | Equal; wording only. |
| §8.8, π=(-1,2), relation 3 | Exact rational powers, including negative exponents | (-8,6) | (-8,6) | Equal; wording only. |
| §8.8, π=(3,0), relation 1 | Exact rational powers, including negative exponents | (-30,15) | (-30,15) | Equal; wording only. |
| §8.8, π=(3,0), relation 2 | Exact rational powers, including negative exponents | (-12,-6) | (-12,-6) | Equal; wording only. |
| §8.8, π=(3,0), relation 3 | Exact rational powers, including negative exponents | (-15,-15) | (-15,-15) | Equal; wording only. |
| §8.8, π=(3,0), relation 4 | Exact rational powers, including negative exponents | (0,-6) | (0,-6) | Equal; wording only. |
| §8.8, π=(3,1), relation 1 | Exact rational powers, including negative exponents | (-6,-24) | (-6,-24) | Equal; wording only. |
| §8.8, π=(3,1), relation 2 | Exact rational powers, including negative exponents | (-10,-18) | (-10,-18) | Equal; wording only. |
| §8.8, π=(3,1), relation 3 | Exact rational powers, including negative exponents | (-4,6) | (-4,6) | Equal; wording only. |
| §8.8, π=(3,1), relation 4 | Exact rational powers, including negative exponents | (-12,18) | (-12,18) | Equal; wording only. |
| §8.8, π=(3,1), relation 5 | Exact rational powers, including negative exponents | (-7,5) | (-7,5) | Equal; wording only. |
| §8.8, π=(3,1), relation 6 | Exact rational powers, including negative exponents | (-15,6) | (-15,6) | Equal; wording only. |
| §8.8, π=(3,1), relation 7 | Exact rational powers, including negative exponents | (-27,-9) | (-27,-9) | Equal; wording only. |
| §8.8, π=(3,1), relation 8 | Exact rational powers, including negative exponents | (-3,21) | (-3,21) | Equal; wording only. |
| §8.8, π=(3,1), relation 9 | Exact rational powers, including negative exponents | (-2,14) | (-2,14) | Equal; wording only. |
| §8.8, π=(3,1), relation 10 | Exact rational powers, including negative exponents | (-20,-25) | (-20,-25) | Equal; wording only. |
| §8.8, π=(3,1), relation 11 | Exact rational powers, including negative exponents | (-9,-3) | (-9,-3) | Equal; wording only. |
| §8.8, π=(3,1), relation 12 | Exact rational powers, including negative exponents | (-9,8) | (-9,8) | Equal; wording only. |
| §8.8, π=(3,1), relation 13 | Exact rational powers, including negative exponents | (-6,-13) | (-6,-13) | Equal; wording only. |
| §8.8, π=(3,1), relation 14 | Exact rational powers, including negative exponents | (-5,2) | (-5,2) | Equal; wording only. |
| §8.8, π=(3,1), relation 15 | Exact rational powers, including negative exponents | (-4,28) | (-4,28) | Equal; wording only. |
| §8.8, π=(4,-1), relation 1 | Exact rational powers, including negative exponents | (-11,0) | (-11,0) | Equal; wording only. |
| §8.8, π=(4,-1), relation 2 | Exact rational powers, including negative exponents | (-15,12) | (-15,12) | Equal; wording only. |
| §8.8, π=(4,-1), relation 3 | Exact rational powers, including negative exponents | (-5,-7) | (-5,-7) | Equal; wording only. |
| §8.8, π=(4,-1), relation 4 | Exact rational powers, including negative exponents | (-22,22) | (-22,22) | Equal; wording only. |
| §8.8, π=(4,-1), relation 5 | Exact rational powers, including negative exponents | (-16,-18) | (-16,-18) | Equal; wording only. |
| §8.8, π=(4,-1), relation 6 | Exact rational powers, including negative exponents | (-4,-10) | (-4,-10) | Equal; wording only. |
| §8.8, π=(4,-1), relation 7 | Exact rational powers, including negative exponents | (-2,-5) | (-2,-5) | Equal; wording only. |
| §8.8, π=(4,-1), relation 8 | Exact rational powers, including negative exponents | (-10,8) | (-10,8) | Equal; wording only. |
| §8.8, π=(4,-1), relation 9 | Exact rational powers, including negative exponents | (-9,-6) | (-9,-6) | Equal; wording only. |
| §8.8, π=(4,-1), relation 10 | Exact rational powers, including negative exponents | (-10,8) | (-10,8) | Equal; wording only. |
| §8.8, π=(4,-1), relation 11 | Exact rational powers, including negative exponents | (-8,-20) | (-8,-20) | Equal; wording only. |
| §8.8, π=(4,-1), relation 12 | Exact rational powers, including negative exponents | (-15,-21) | (-15,-21) | Equal; wording only. |
| §8.8, π=(4,1), relation 1 | Exact rational powers, including negative exponents | (-24,-6) | (-24,-6) | Equal; wording only. |
| §8.8, π=(4,1), relation 2 | Exact rational powers, including negative exponents | (-3,4) | (-3,4) | Equal; wording only. |
| §8.8, π=(4,1), relation 3 | Exact rational powers, including negative exponents | (-17,10) | (-17,10) | Equal; wording only. |
| §8.8, π=(4,1), relation 4 | Exact rational powers, including negative exponents | (-9,-7) | (-9,-7) | Equal; wording only. |
| §8.8, π=(4,1), relation 5 | Exact rational powers, including negative exponents | (-20,14) | (-20,14) | Equal; wording only. |
| §8.8, π=(4,1), relation 6 | Exact rational powers, including negative exponents | (-13,-8) | (-13,-8) | Equal; wording only. |
| §8.8, π=(4,1), relation 7 | Exact rational powers, including negative exponents | (-13,-8) | (-13,-8) | Equal; wording only. |
| §8.8, π=(4,1), relation 8 | Exact rational powers, including negative exponents | (-16,15) | (-16,15) | Equal; wording only. |
| §8.8, π=(4,1), relation 9 | Exact rational powers, including negative exponents | (-16,-4) | (-16,-4) | Equal; wording only. |
| §8.8, π=(4,1), relation 10 | Exact rational powers, including negative exponents | (-17,10) | (-17,10) | Equal; wording only. |
| §8.8, π=(4,1), relation 11 | Exact rational powers, including negative exponents | (-5,13) | (-5,13) | Equal; wording only. |
| §8.8, π=(4,1), relation 12 | Exact rational powers, including negative exponents | (-11,2) | (-11,2) | Equal; wording only. |
| §8.8, π=(4,1), relation 13 | Exact rational powers, including negative exponents | (-9,12) | (-9,12) | Equal; wording only. |
| §8.8, π=(4,1), relation 14 | Exact rational powers, including negative exponents | (-6,8) | (-6,8) | Equal; wording only. |
| §8.8, π=(5,-1), relation 1 | Exact rational powers, including negative exponents | (-32,14) | (-32,14) | Equal; wording only. |
| §8.8, π=(5,-1), relation 2 | Exact rational powers, including negative exponents | (-12,10) | (-12,10) | Equal; wording only. |
| §8.8, π=(5,-1), relation 3 | Exact rational powers, including negative exponents | (-21,8) | (-21,8) | Equal; wording only. |
| §8.8, π=(5,-1), relation 4 | Exact rational powers, including negative exponents | (-24,20) | (-24,20) | Equal; wording only. |
| §8.8, π=(5,-1), relation 5 | Exact rational powers, including negative exponents | (-1,-15) | (-1,-15) | Equal; wording only. |
| §8.8, π=(5,-1), relation 6 | Exact rational powers, including negative exponents | (-13,-5) | (-13,-5) | Equal; wording only. |
| §8.8, π=(5,-1), relation 7 | Exact rational powers, including negative exponents | (-18,15) | (-18,15) | Equal; wording only. |
| §8.8, π=(5,-1), relation 8 | Exact rational powers, including negative exponents | (-4,16) | (-4,16) | Equal; wording only. |
| §8.8, π=(5,-1), relation 9 | Exact rational powers, including negative exponents | (-16,7) | (-16,7) | Equal; wording only. |
| §8.8, π=(5,-1), relation 10 | Exact rational powers, including negative exponents | (-6,24) | (-6,24) | Equal; wording only. |
| §8.8, π=(5,-1), relation 11 | Exact rational powers, including negative exponents | (-14,-1) | (-14,-1) | Equal; wording only. |
| §8.8, π=(5,-1), relation 12 | Exact rational powers, including negative exponents | (-12,10) | (-12,10) | Equal; wording only. |
| §8.8, π=(5,-1), relation 13 | Exact rational powers, including negative exponents | (-19,19) | (-19,19) | Equal; wording only. |
| §8.8, π=(5,-1), relation 14 | Exact rational powers, including negative exponents | (-5,20) | (-5,20) | Equal; wording only. |
| §8.8, π=(5,-1), relation 15 | Exact rational powers, including negative exponents | (-19,19) | (-19,19) | Equal; wording only. |
| §8.8, π=(5,-1), relation 16 | Exact rational powers, including negative exponents | (-4,16) | (-4,16) | Equal; wording only. |
| §8.8, π=(5,1), relation 1 | Exact rational powers, including negative exponents | (-11,21) | (-11,21) | Equal; wording only. |
| §8.8, π=(5,1), relation 2 | Exact rational powers, including negative exponents | (-20,25) | (-20,25) | Equal; wording only. |
| §8.8, π=(5,1), relation 3 | Exact rational powers, including negative exponents | (-14,3) | (-14,3) | Equal; wording only. |
| §8.8, π=(5,1), relation 4 | Exact rational powers, including negative exponents | (-26,18) | (-26,18) | Equal; wording only. |
| §8.8, π=(5,1), relation 5 | Exact rational powers, including negative exponents | (-4,5) | (-4,5) | Equal; wording only. |
| §8.8, π=(5,1), relation 6 | Exact rational powers, including negative exponents | (-4,5) | (-4,5) | Equal; wording only. |
| §8.8, π=(5,1), relation 7 | Exact rational powers, including negative exponents | (-1,-6) | (-1,-6) | Equal; wording only. |
| §8.8, π=(5,1), relation 8 | Exact rational powers, including negative exponents | (-6,-7) | (-6,-7) | Equal; wording only. |
| §8.8, π=(5,1), relation 9 | Exact rational powers, including negative exponents | (-1,-6) | (-1,-6) | Equal; wording only. |
| §8.8, π=(5,1), relation 10 | Exact rational powers, including negative exponents | (-18,-21) | (-18,-21) | Equal; wording only. |
| §8.8, π=(5,1), relation 11 | Exact rational powers, including negative exponents | (-13,9) | (-13,9) | Equal; wording only. |
| §8.8, π=(5,1), relation 12 | Exact rational powers, including negative exponents | (-16,20) | (-16,20) | Equal; wording only. |
| §8.8, π=(5,1), relation 13 | Exact rational powers, including negative exponents | (-6,-7) | (-6,-7) | Equal; wording only. |
| §8.8, π=(5,1), relation 14 | Exact rational powers, including negative exponents | (-16,-9) | (-16,-9) | Equal; wording only. |
| §8.8, π=(5,1), relation 15 | Exact rational powers, including negative exponents | (-7,16) | (-7,16) | Equal; wording only. |
| §8.8, π=(5,1), relation 16 | Exact rational powers, including negative exponents | (-2,-12) | (-2,-12) | Equal; wording only. |
| §8.8, π=(5,1), relation 17 | Exact rational powers, including negative exponents | (-1,-6) | (-1,-6) | Equal; wording only. |
| §8.8, π=(5,1), relation 18 | Exact rational powers, including negative exponents | (-3,11) | (-3,11) | Equal; wording only. |
| §8.8, π=(5,1), relation 19 | Exact rational powers, including negative exponents | (-16,-9) | (-16,-9) | Equal; wording only. |
| §8.8, π=(5,1), relation 20 | Exact rational powers, including negative exponents | (-15,-3) | (-15,-3) | Equal; wording only. |
| §8.8, π=(5,1), relation 21 | Exact rational powers, including negative exponents | (-14,3) | (-14,3) | Equal; wording only. |
| §8.8, π=(5,1), relation 22 | Exact rational powers, including negative exponents | (-1,23) | (-1,23) | Equal; wording only. |
| §8.8, π=(5,1), relation 23 | Exact rational powers, including negative exponents | (-20,-4) | (-20,-4) | Equal; wording only. |
| §8.8, π=(5,1), relation 24 | Exact rational powers, including negative exponents | (-8,10) | (-8,10) | Equal; wording only. |
| §8.8, π=(5,1), relation 25 | Exact rational powers, including negative exponents | (-24,1) | (-24,1) | Equal; wording only. |
| §8.8, π=(5,1), relation 26 | Exact rational powers, including negative exponents | (-13,9) | (-13,9) | Equal; wording only. |
| §8.8, π=(5,1), relation 27 | Exact rational powers, including negative exponents | (-11,-8) | (-11,-8) | Equal; wording only. |
| §8.8, π=(6,-1), relation 1 | Exact rational powers, including negative exponents | (-10,-8) | (-10,-8) | Equal; wording only. |
| §8.8, π=(6,-1), relation 2 | Exact rational powers, including negative exponents | (-9,-13) | (-9,-13) | Equal; wording only. |
| §8.8, π=(6,-1), relation 3 | Exact rational powers, including negative exponents | (-14,-17) | (-14,-17) | Equal; wording only. |
| §8.8, π=(6,-1), relation 4 | Exact rational powers, including negative exponents | (-5,-4) | (-5,-4) | Equal; wording only. |
| §8.8, π=(6,-1), relation 5 | Exact rational powers, including negative exponents | (-8,11) | (-8,11) | Equal; wording only. |
| §8.8, π=(6,-1), relation 6 | Exact rational powers, including negative exponents | (-2,10) | (-2,10) | Equal; wording only. |
| §8.8, π=(6,-1), relation 7 | Exact rational powers, including negative exponents | (-6,1) | (-6,1) | Equal; wording only. |
| §8.8, π=(6,-1), relation 8 | Exact rational powers, including negative exponents | (-11,-3) | (-11,-3) | Equal; wording only. |
| §8.8, π=(6,-1), relation 9 | Exact rational powers, including negative exponents | (-8,-18) | (-8,-18) | Equal; wording only. |
| §8.8, π=(6,-1), relation 10 | Exact rational powers, including negative exponents | (-10,-8) | (-10,-8) | Equal; wording only. |
| §8.8, π=(6,-1), relation 11 | Exact rational powers, including negative exponents | (-3,15) | (-3,15) | Equal; wording only. |
| §8.8, π=(6,-1), relation 12 | Exact rational powers, including negative exponents | (-31,10) | (-31,10) | Equal; wording only. |
| §8.8, π=(6,-1), relation 13 | Exact rational powers, including negative exponents | (-3,15) | (-3,15) | Equal; wording only. |
| §8.8, π=(6,-1), relation 14 | Exact rational powers, including negative exponents | (-4,20) | (-4,20) | Equal; wording only. |
| §8.8, π=(6,-1), relation 15 | Exact rational powers, including negative exponents | (-10,21) | (-10,21) | Equal; wording only. |
| §8.8, π=(6,-1), relation 16 | Exact rational powers, including negative exponents | (-9,16) | (-9,16) | Equal; wording only. |
| §8.8, π=(6,-1), relation 17 | Exact rational powers, including negative exponents | (-30,5) | (-30,5) | Equal; wording only. |
| §8.8, π=(6,-1), relation 18 | Exact rational powers, including negative exponents | (-15,17) | (-15,17) | Equal; wording only. |
| §8.8, π=(6,-1), relation 19 | Exact rational powers, including negative exponents | (-5,25) | (-5,25) | Equal; wording only. |
| §8.8, π=(6,-1), relation 20 | Exact rational powers, including negative exponents | (-19,8) | (-19,8) | Equal; wording only. |
| §8.8, π=(5,2), relation 1 | Exact rational powers, including negative exponents | (-26,2) | (-26,2) | Equal; wording only. |
| §8.8, π=(5,2), relation 2 | Exact rational powers, including negative exponents | (-3,5) | (-3,5) | Equal; wording only. |
| §8.8, π=(5,2), relation 3 | Exact rational powers, including negative exponents | (-1,12) | (-1,12) | Equal; wording only. |
| §8.8, π=(5,2), relation 4 | Exact rational powers, including negative exponents | (-19,-20) | (-19,-20) | Equal; wording only. |
| §8.8, π=(5,2), relation 5 | Exact rational powers, including negative exponents | (-3,5) | (-3,5) | Equal; wording only. |
| §8.8, π=(5,2), relation 6 | Exact rational powers, including negative exponents | (-12,-11) | (-12,-11) | Equal; wording only. |
| §8.8, π=(5,2), relation 7 | Exact rational powers, including negative exponents | (-3,5) | (-3,5) | Equal; wording only. |
| §8.8, π=(5,2), relation 8 | Exact rational powers, including negative exponents | (-16,6) | (-16,6) | Equal; wording only. |
| §8.8, π=(5,2), relation 9 | Exact rational powers, including negative exponents | (-7,-9) | (-7,-9) | Equal; wording only. |
| §8.8, π=(5,2), relation 10 | Exact rational powers, including negative exponents | (-18,-1) | (-18,-1) | Equal; wording only. |
| §8.8, π=(5,2), relation 11 | Exact rational powers, including negative exponents | (-2,24) | (-2,24) | Equal; wording only. |
| §8.8, π=(5,2), relation 12 | Exact rational powers, including negative exponents | (-5,-2) | (-5,-2) | Equal; wording only. |
| §8.8, π=(5,2), relation 13 | Exact rational powers, including negative exponents | (-9,-16) | (-9,-16) | Equal; wording only. |
| §8.8, π=(5,2), relation 14 | Exact rational powers, including negative exponents | (-24,-22) | (-24,-22) | Equal; wording only. |
| §8.8, π=(5,2), relation 15 | Exact rational powers, including negative exponents | (-6,10) | (-6,10) | Equal; wording only. |
| §8.8, π=(5,2), relation 16 | Exact rational powers, including negative exponents | (-21,4) | (-21,4) | Equal; wording only. |
| §8.8, π=(5,2), relation 17 | Exact rational powers, including negative exponents | (-4,17) | (-4,17) | Equal; wording only. |
| §8.8, π=(5,2), relation 18 | Exact rational powers, including negative exponents | (-17,-13) | (-17,-13) | Equal; wording only. |
| §8.8, π=(5,2), relation 19 | Exact rational powers, including negative exponents | (-4,-14) | (-4,-14) | Equal; wording only. |
| §8.8, π=(5,2), relation 20 | Exact rational powers, including negative exponents | (-2,24) | (-2,24) | Equal; wording only. |
| §8.8, π=(5,2), relation 21 | Exact rational powers, including negative exponents | (-17,18) | (-17,18) | Equal; wording only. |
| §8.8, π=(5,2), relation 22 | Exact rational powers, including negative exponents | (-4,17) | (-4,17) | Equal; wording only. |
| §8.8, π=(7,-2), relation 1 | Exact rational powers, including negative exponents | (-23,-20) | (-23,-20) | Equal; wording only. |
| §8.8, π=(7,-2), relation 2 | Exact rational powers, including negative exponents | (-14,-27) | (-14,-27) | Equal; wording only. |
| §8.8, π=(7,-2), relation 3 | Exact rational powers, including negative exponents | (-13,17) | (-13,17) | Equal; wording only. |
| §8.8, π=(7,-2), relation 4 | Exact rational powers, including negative exponents | (-21,6) | (-21,6) | Equal; wording only. |
| §8.8, π=(7,-2), relation 5 | Exact rational powers, including negative exponents | (-8,20) | (-8,20) | Equal; wording only. |
| §8.8, π=(7,-2), relation 6 | Exact rational powers, including negative exponents | (-7,2) | (-7,2) | Equal; wording only. |
| §8.8, π=(7,-2), relation 7 | Exact rational powers, including negative exponents | (-4,10) | (-4,10) | Equal; wording only. |
| §8.8, π=(7,-2), relation 8 | Exact rational powers, including negative exponents | (-5,-3) | (-5,-3) | Equal; wording only. |
| §8.8, π=(7,-2), relation 9 | Exact rational powers, including negative exponents | (-7,2) | (-7,2) | Equal; wording only. |
| §8.8, π=(7,-2), relation 10 | Exact rational powers, including negative exponents | (-2,5) | (-2,5) | Equal; wording only. |
| §8.8, π=(7,-2), relation 11 | Exact rational powers, including negative exponents | (-13,17) | (-13,17) | Equal; wording only. |
| §8.8, π=(7,-2), relation 12 | Exact rational powers, including negative exponents | (-6,15) | (-6,15) | Equal; wording only. |
| §8.8, π=(7,-2), relation 13 | Exact rational powers, including negative exponents | (-1,18) | (-1,18) | Equal; wording only. |
| §8.8, π=(7,-2), relation 14 | Exact rational powers, including negative exponents | (-21,6) | (-21,6) | Equal; wording only. |
| §8.8, π=(7,-2), relation 15 | Exact rational powers, including negative exponents | (-15,-9) | (-15,-9) | Equal; wording only. |
| §8.8, π=(7,-2), relation 16 | Exact rational powers, including negative exponents | (-10,25) | (-10,25) | Equal; wording only. |
| §8.8, π=(7,-2), relation 17 | Exact rational powers, including negative exponents | (-13,-14) | (-13,-14) | Equal; wording only. |
| §8.8, π=(7,-2), relation 18 | Exact rational powers, including negative exponents | (-4,-21) | (-4,-21) | Equal; wording only. |
| §8.8, π=(7,-2), relation 19 | Exact rational powers, including negative exponents | (-30,13) | (-30,13) | Equal; wording only. |
| §8.8, π=(7,-2), relation 20 | Exact rational powers, including negative exponents | (-23,11) | (-23,11) | Equal; wording only. |
| §8.8, π=(7,-2), relation 21 | Exact rational powers, including negative exponents | (-17,27) | (-17,27) | Equal; wording only. |
| §8.8, π=(7,-2), relation 22 | Exact rational powers, including negative exponents | (-21,6) | (-21,6) | Equal; wording only. |
| §8.8, π=(7,-2), relation 23 | Exact rational powers, including negative exponents | (-10,25) | (-10,25) | Equal; wording only. |
| §8.8, π=(7,-2), relation 24 | Exact rational powers, including negative exponents | (-18,14) | (-18,14) | Equal; wording only. |
| §8.8, π=(7,-2), relation 25 | Exact rational powers, including negative exponents | (-12,-1) | (-12,-1) | Equal; wording only. |
| §8.8, π=(7,-2), relation 26 | Exact rational powers, including negative exponents | (-11,12) | (-11,12) | Equal; wording only. |
| §8.8, π=(7,-2), relation 27 | Exact rational powers, including negative exponents | (-11,12) | (-11,12) | Equal; wording only. |
| §8.8, π=(7,-2), relation 28 | Exact rational powers, including negative exponents | (-7,-29) | (-7,-29) | Equal; wording only. |
| §8.8, π=(7,-2), relation 29 | Exact rational powers, including negative exponents | (-1,18) | (-1,18) | Equal; wording only. |
| §8.8, π=(7,-2), relation 30 | Exact rational powers, including negative exponents | (-31,0) | (-31,0) | Equal; wording only. |
| §8.8, π=(7,-2), relation 31 | Exact rational powers, including negative exponents | (-11,12) | (-11,12) | Equal; wording only. |
| §8.8, π=(7,-2), relation 32 | Exact rational powers, including negative exponents | (-8,20) | (-8,20) | Equal; wording only. |
| §8.8, π=(7,-2), relation 33 | Exact rational powers, including negative exponents | (-3,23) | (-3,23) | Equal; wording only. |
| §8.8, π=(7,-2), relation 34 | Exact rational powers, including negative exponents | (-31,0) | (-31,0) | Equal; wording only. |
| §8.8, π=(7,-2), relation 35 | Exact rational powers, including negative exponents | (-26,3) | (-26,3) | Equal; wording only. |
| §8.8, π=(7,-2), relation 36 | Exact rational powers, including negative exponents | (-17,27) | (-17,27) | Equal; wording only. |
| §8.8, π=(2,0), minor (1, 3) | Ordered relation columns | 6 | 6 | Equal; determinant sign retained. |
| §8.8, π=(2,0), minor (4, 2) | Ordered relation columns | -3 | -3 | Equal; determinant sign retained. |
| §8.8, π=(-1,2), minor (1, 2, 3) | Ordered relation columns | 4 | 4 | Equal; determinant sign retained. |
| §8.8, π=(3,0), minor (2, 1, 3, 4) | Ordered relation columns | 8 | 8 | Equal; determinant sign retained. |
| §8.8, π=(3,1), minor (5, 7, 2, 10, 6) | Ordered relation columns | 60 | 60 | Equal; determinant sign retained. |
| §8.8, π=(3,1), minor (12, 8, 11, 9, 13) | Ordered relation columns | -30 | -30 | Equal; determinant sign retained. |
| §8.8, π=(3,1), minor (3, 1, 4, 15, 14) | Ordered relation columns | -10 | -10 | Equal; determinant sign retained. |
| §8.8, π=(4,-1), minor (4, 7, 1, 12, 5, 9) | Ordered relation columns | 70 | 70 | Equal; determinant sign retained. |
| §8.8, π=(4,-1), minor (11, 3, 10, 2, 6, 8) | Ordered relation columns | -20 | -20 | Equal; determinant sign retained. |
| §8.8, π=(4,1), minor (9, 10, 3, 1, 11, 14, 8) | Ordered relation columns | -54 | -54 | Equal; determinant sign retained. |
| §8.8, π=(4,1), minor (12, 5, 13, 2, 7, 6, 4) | Ordered relation columns | -36 | -36 | Equal; determinant sign retained. |
| §8.8, π=(5,-1), minor (15, 11, 10, 7, 16, 5, 13, 4) | Ordered relation columns | 216 | 216 | Equal; determinant sign retained. |
| §8.8, π=(5,-1), minor (3, 6, 2, 14, 12, 9, 1, 8) | Ordered relation columns | -18 | -18 | Equal; determinant sign retained. |
| §8.8, π=(5,1), minor (23, 22, 8, 16, 25, 26, 14, 4, 2) | Ordered relation columns | -168 | -168 | Equal; determinant sign retained. |
| §8.8, π=(5,1), minor (12, 11, 5, 7, 18, 17, 21, 15, 20) | Ordered relation columns | -224 | -224 | Equal; determinant sign retained. |
| §8.8, π=(5,1), minor (24, 9, 6, 19, 10, 1, 13, 3, 27) | Ordered relation columns | 420 | 420 | Equal; determinant sign retained. |
| §8.8, π=(6,-1), minor (19, 6, 9, 10, 4, 12, 20, 1, 13, 17) | Ordered relation columns | 56 | 56 | Equal; determinant sign retained. |
| §8.8, π=(6,-1), minor (16, 5, 3, 15, 7, 14, 18, 2, 11, 8) | Ordered relation columns | 28 | 28 | Equal; determinant sign retained. |
| §8.8, π=(5,2), minor (15, 9, 14, 17, 19, 22, 4, 13, 5, 1, 10) | Ordered relation columns | 90 | 90 | Equal; determinant sign retained. |
| §8.8, π=(5,2), minor (20, 2, 21, 8, 7, 16, 6, 12, 11, 3, 18) | Ordered relation columns | 60 | 60 | Equal; determinant sign retained. |
| §8.8, π=(7,-2), minor (20, 30, 9, 29, 28, 11, 33, 24, 12, 15, 32, 25) | Ordered relation columns | -180 | -180 | Equal; determinant sign retained. |
| §8.8, π=(7,-2), minor (31, 1, 23, 4, 34, 36, 13, 22, 10, 3, 6, 2) | Ordered relation columns | -240 | -240 | Equal; determinant sign retained. |
| §8.8, π=(7,-2), minor (5, 35, 19, 21, 16, 7, 18, 8, 27, 26, 17, 14) | Ordered relation columns | -90 | -90 | Equal; determinant sign retained. |
| §8.8, π=(2,0), residue/index certificate | Residue images [(1, 0), (0, 1)]; selected minor gcd | 3; generated subgroup order 3 | q−1=3 | Equal; all 4 relations verified. |
| §8.8, π=(-1,2), residue/index certificate | Residue images [4, 3, 2]; selected minor gcd | 4; generated subgroup order 4 | q−1=4 | Equal; all 3 relations verified. |
| §8.8, π=(3,0), residue/index certificate | Residue images [(2, 0), (0, 1), (2, 0), (2, 2)]; selected minor gcd | 8; generated subgroup order 8 | q−1=8 | Equal; all 4 relations verified. |
| §8.8, π=(3,1), residue/index certificate | Residue images [10, 8, 2, 4, 3]; selected minor gcd | 10; generated subgroup order 10 | q−1=10 | Equal; all 15 relations verified. |
| §8.8, π=(4,-1), residue/index certificate | Residue images [10, 4, 2, 7, 3, 7]; selected minor gcd | 10; generated subgroup order 10 | q−1=10 | Equal; all 12 relations verified. |
| §8.8, π=(4,1), residue/index certificate | Residue images [18, 15, 2, 10, 3, 18, 8]; selected minor gcd | 18; generated subgroup order 18 | q−1=18 | Equal; all 14 relations verified. |
| §8.8, π=(5,-1), residue/index certificate | Residue images [18, 5, 2, 9, 3, 8, 18, 9]; selected minor gcd | 18; generated subgroup order 18 | q−1=18 | Equal; all 16 relations verified. |
| §8.8, π=(5,1), residue/index certificate | Residue images [28, 24, 2, 18, 3, 27, 9, 28, 10]; selected minor gcd | 28; generated subgroup order 28 | q−1=28 | Equal; all 27 relations verified. |
| §8.8, π=(6,-1), residue/index certificate | Residue images [28, 6, 2, 11, 3, 9, 27, 10, 28, 11]; selected minor gcd | 28; generated subgroup order 28 | q−1=28 | Equal; all 20 relations verified. |
| §8.8, π=(5,2), residue/index certificate | Residue images [30, 13, 2, 25, 3, 16, 22, 17, 23, 18, 24]; selected minor gcd | 30; generated subgroup order 30 | q−1=30 | Equal; all 22 relations verified. |
| §8.8, π=(7,-2), residue/index certificate | Residue images [30, 19, 2, 6, 3, 22, 16, 23, 17, 24, 18, 12]; selected minor gcd | 30; generated subgroup order 30 | q−1=30 | Equal; all 36 relations verified. |

## Maintainer consequences

The only renamed retained theorem is `IsRegularPrime.dividedBernoulli_num` → `regularPrime_dividedBernoulli_num`; its hypothesis is native cyclotomic class-number nondivisibility. Local `IsRegularPrime`, `kummer_criterion`, `IsRegularPrime.iwasawa`, their finite examples, all four numerical definitions and their auxiliary theorems are deleted from Suggested.lean. Cyclotomic consumers use CyclotomicClassGroupsAndStickelberger's own definitions and results. Ordinary README-only API names have no promised acceptance declaration.

The supplier gaps are `connective-c2-homotopy-orbit-spectral-sequence` (StableHomotopyKTheory Layer 7) and `number-ring-witt-signature` (GeometryOfNumbersAndQuadraticArithmetic §6.11). Their README contracts and plan entries agree. The four superseded gaps are deleted because their actual exports exist. No supplier file, merge order, tooling, pull-request text or library pin was changed. The worker performs the indicated placement after ClassicalArithmeticCompletion. This report makes no independent acceptance claim; fresh review remains necessary.

Final local data checks: PASS. The plan differs only in its top-level gaps list; all 18 finding verdicts are present; both gap slugs have matching README contracts and consumers; all 23 source keys are unique; all eight retained declarations occur in the README. No forbidden file change, machine path, sorry data, Lean example or option override was introduced.
