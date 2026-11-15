# Review of DeformationAndDerivedPatchingAlgebraPartII (pull request #872 at 51b4ae2)

**Verdict:** needs changes

## R01 (P2) — Import parameter regularity from pinned Tau Ceti

**Location:** `TauCetiRoadmap/DeformationAndDerivedPatchingAlgebraPartII/README.md:710`: “The CM API is built after this bound”; the first bullet plans regularity of parameters on Cohen–Macaulay modules.
**Claim:** K0.5 owns and proves the regularity theorem using Schenzel's bound.
**Witness:** `TauCeti/RingTheory/CohenMacaulay/RegularSequence.lean:111`, `Module.IsCohenMacaulay.isSMulRegular_of_supportDim_quotSMulTop_lt`, already proves it under weaker hypotheses. For `k⟦x⟧`, the dimension drop is `0 < 1` and multiplication by `x` is injective.
**Repair:** Delete the regularity bullet as a target. Cite that declaration in Scope and ownership and Exact supplier contracts; replace its uses by the pinned theorem. Keep Schenzel's bound and the new CM-secancy corollary. The DVR example follows directly from the imported result.

## R02 (P2) — Use the existing flat dimension formula

**Location:** `TauCetiRoadmap/DeformationAndDerivedPatchingAlgebraPartII/README.md:1785`: “prove the flat local dimension formula”; line 1791 says it is built within this target.
**Claim:** The finite-type height inequality requires this roadmap to construct the flat local dimension formula.
**Witness:** `Mathlib/RingTheory/Ideal/KrullsHeightTheorem.lean:484`, `Ideal.height_eq_height_add_of_liesOver_of_hasGoingDown`, supplies Stacks 00ON; `Mathlib/RingTheory/Ideal/GoingDown.lean:154` supplies going-down from flatness. For `k[x] ⊂ k[x,t]`, the heights are `2 = 1 + 1`.
**Repair:** Replace that part of the route by “Apply `Ideal.height_eq_height_add_of_liesOver_of_hasGoingDown`, using `Algebra.HasGoingDown.of_flat`, to the localized polynomial extension.” Add both declarations to the supplier contract and remove the promise to rebuild this formula. Keep the finite-type height inequality; its displayed polynomial example is unchanged.

## R03 (P2) — Retain the generality of the blow-up comparisons

**Location:** `TauCetiRoadmap/DeformationAndDerivedPatchingAlgebraPartII/README.md:1683`: “For `R` Noetherian, `I` an ideal and `M` finite”; lines 1702 and 1724 require finitely generated ideals.
**Claim:** The strict-transform comparison and the product-of-ideals comparisons are restricted to these finite settings.
**Witness:** cesnavicius line 543 and line 561 state these constructions for arbitrary quasi-coherent modules and ideals; stacks line 3819 (Divisors, tag 080A) imposes no finite-generation hypothesis.
**Repair:** Begin K3.4's comparison “For a commutative ring `R`, an ideal `I` and any `R`-module `M`”; begin both K3.5 statements “Let `I,J` be ideals of `R`.” Retain finiteness for coherence and dimension results only. Add the Checks below: an infinite module over a non-Noetherian polynomial ring still has strict transform zero, and the product charts for an infinitely generated ideal still agree.

## R04 (P3) — Move the repeated injectivity result into the supplier contract

**Location:** `TauCetiRoadmap/DeformationAndDerivedPatchingAlgebraPartII/README.md:342`: “Supplier lemma: injective ideal-power torsion.”
**Claim:** K0.1 retains a separately stated result and three Checks for a supplied theorem, outside Scope and ownership and Exact supplier contracts.
**Witness:** `TauCeti/Algebra/Module/Injective/Noetherian.lean:61`, `Ideal.injective_primaryComponent`, supplies precisely this injectivity. The README itself identifies that owner at line 346.
**Repair:** Remove this standalone block and its Checks from K0.1. Keep the native carrier, declaration and acyclicity consequence in the supplier contract, and cite them in the composite-support target's Needs. For a DVR injective hull, the imported instance still gives `Γ_(x)(E)=E` injective.

## R05 (P3) — Add the required downstream-consumers section

**Location:** `TauCetiRoadmap/DeformationAndDerivedPatchingAlgebraPartII/README.md:2208`: “## Worked examples”; the document has no “## Downstream consumers” section.
**Claim:** The required roadmap structure is incomplete, although consumer information is available in the introduction.
**Witness:** `TauCetiRoadmap/DeformationAndDerivedPatchingAlgebraPartII/README.md:45` already identifies DeformationAndDerivedPatchingAlgebra as consuming K0.1, K0.4–K0.7 and K3.1.
**Repair:** Insert `## Downstream consumers` before Worked examples, with: “DeformationAndDerivedPatchingAlgebra consumes K0.1 and K0.4–K0.7 for local cohomology and K3.1 for Rees modules. Macaulayfication is outside this roadmap's scope.” This preserves the verified direction of supply.

## R06 (P3) — Document the five structural instances

**Location:** `TauCetiRoadmap/DeformationAndDerivedPatchingAlgebraPartII/Suggested.lean:186`, also lines 189, 270, 278 and 281: the five instances have no declaration docstrings.
**Claim:** These declarations do not meet the required docstring-on-every-declaration form.
**Witness:** `TauCetiRoadmap/DeformationAndDerivedPatchingAlgebraPartII/Suggested.lean:270` starts `instance huckabaOrigin.isMaximal` immediately after the preceding definition, without a docstring; the other four instances likewise lack one.
**Repair:** Add separate mathematical docstrings describing the inherited chart commutative ring, its base-ring algebra structure, maximality via the constant-coefficient quotient `k`, the localized commutative ring, and its local-ring structure. The constant-coefficient map has quotient `k`, so that maximality description matches the existing proof.

## Verified sound

Previous R01 — **repaired**: the description now names “SchemeAndStackFoundations, StableReduction, AdicSpacesPartII, AdicSpacesPartIII, DerivedModuleAlgebra, DGFloer and GroebnerGeometry”; all seven are the main-branch suppliers in the head.

In the table, `k` is any field, `E=k((x))/k⟦x⟧`, `N=k⟦x,y⟧/(x²,xy)`, and `D=dim Supp`. A semicolon separates instances. Source locators use the README's cited versions. “Agrees” records the displayed computation, not a proof of the general theorem.

| Statement | Instances tried | Left/construction value | Right/comparison value | Result | Change |
| --- | --- | --- | --- | --- | --- |
| K0.1 injective ideal-power torsion | DVR, injective hull `E`; ideals `0,R,(x)` | `Γ₀(E)=E; Γ_R(E)=0; Γ_(x)(E)=E` | All three injective; higher cohomology zero | Supplied | R04 |
| K0.1 Čech computation | DVR, list `[x]`; empty list; `[1]` | Complexes `R→K`; `R[0]`; `R→R` | `(H⁰,H¹)=(0,E); (R,0); (0,0)` | Agrees | — |
| K0.1 composite supports | DVR, `I=J=(x)`; `I=R` | `H⁰_I(H¹_J(R))=E`; all groups zero for `I=R` | `H¹_(I+J)(R)=E`; zero for unit support | Agrees | — |
| K0.1 change of rings | `k[x]→k[x,x⁻¹]`, support `(x)` | `H^j_(x)(k[x,x⁻¹])=0` | Extended ideal is unit; all groups zero | Agrees | — |
| K0.1 filtered colimits | DVR, direct system `R/xⁿ`, maps multiplication by `x` | Colimit `E`, each module entirely torsion | `H⁰_(x)(E)=E`, higher groups zero | Agrees | — |
| K0.1 principal cohomology | `N`, support `(y)` | Kernel `kx`; cokernel `k((y))/k⟦y⟧` | `H⁰_(y)(N)=kx`; `H¹_(y)(N)=k((y))/k⟦y⟧` | Agrees | — |
| K0.1 two-generator sign and sequence | `R=k⟦x,y⟧`, support `(x,y)` | `d₀(m)=(m,m)`; `d₁(u,v)=v−u`; composite zero | `H⁰=H¹=0`; `H²=R[1/xy]/(R[1/x]+R[1/y])` | Agrees | — |
| K0.1 zero and unit supports | Any module `M`; `J=0,R` | `H⁰₀(M)=M`; `H⁰_R(M)=0` | Higher groups zero in both cases | Agrees | — |
| K0.2 local-cohomology annihilator product; cesnavicius line 377 | `M=k⊕k⟦x⟧` over `k⟦x,y⟧`, cutoff `2` | Annihilators `(x,y)` and `(y)`; product `(xy,y²)` | Intersection `(y)`, strictly larger | Product distinguished | — |
| K0.2 cutoff and nonradical ideals | DVR, `M=R/x²`, cutoffs `0,1,2` | Products `R,(x²),(x²)` | `Ann H⁰=(x²)`; higher annihilators `R` | Agrees | — |
| K0.2 zero module and dimension-zero cutoff | `M=0`; `M=k`, cutoff `0` | Empty product `R` in both cases | Zero module has dimension `⊥`; nonzero `k` has dimension `0` | Cutoff convention distinguished | — |
| K0.3 prefix quotients | `R=M=ℤ`, lists `[],[2],[2,3]` | `ℤ,ℤ/2,0` | Quotient by product for `[2,3]` would be `ℤ/6` | Sum ideal distinguished | — |
| K0.3 secancy | `N,[y]`; `k,[0]`; zero module | Dimensions `1→0`; `0→0`; `⊥→⊥` | True; false; only empty list allowed | Agrees | — |
| K0.3 powers, permutations, truncation | `k⟦x,y⟧`, `[x²,y³]`, reversed list | Both dimension chains `2→1→0` | Prefix dimension equals `2−length` | Agrees | — |
| K0.3 existence and completion | `k⟦x,y⟧`, prefix `[x]` | Append `[y]`; terminal module `k` | Terminal dimension `0`, total length `2` | Agrees | — |
| K0.4 CM through local cohomology; cesnavicius line 149; stacks line 809 | DVR; `N`; zero module | Lower groups vanish; `H⁰(N)=kx≠0`; all groups zero | CM true; false; true via zero disjunct | Agrees | — |
| K0.4 CM-secant; cesnavicius line 377 | `N,[y]`; `N,[]`; `k,[]` | `y∈a(N)=𝔪`, terminal `k[x]/x²` CM | True; false; true | Terminal condition nonvacuous | — |
| K0.4 successive annihilator products | `k⟦x,y⟧`, `[x,y]` | Dimensions `2,1,0`; prefix products `a=R,R` | Both entries satisfy membership; terminal `k` CM | Agrees | — |
| K0.5 Schenzel bound, Lean line 88; kawasaki1996 line 88 | `N,[y]`, every exponent `n>0` | `ker(yⁿ)=kx` | `a(N)·kx=𝔪·kx=0`; `R·kx≠0` | Nontrivial bound | — |
| K0.5 Čech–Koszul filtration | `N`, parameter `[y]` | `H₁(K(y;N))=kx` | `Ann H⁰_𝔪(N)=𝔪` kills `kx` | Agrees | — |
| K0.5 regularity on CM modules | DVR, parameter `x` | Quotient dimension `0`, original dimension `1` | `ker(x:R→R)=0` | Already pinned | R01 |
| K0.5 CM-secancy of secant lists | `k⟦x,y⟧`, `[x²,y³]` | Intermediate quotients CM, annihilator products `R` | Terminal dimension `0`; list CM-secant | Agrees | — |
| K0.6 extension, Lean line 97 | `k⟦x,y⟧`, CM-secant `[x]`; terminal-dimension-zero case | Append `[y]`; append `[]`, respectively | Final dimensions `0,0`; original lists retained | Agrees | — |
| K0.6 reversal and p-standard systems | `k⟦x,y⟧`, `[x,y]`, reversed `[y,x]` | Tail quotients CM; annihilator products `R` | Every required parameter belongs to `R` | Agrees | — |
| K0.7 normalized local duality; stacks line 1566 | DVR, `ω=R[1]`, `M=R`, `j=0,1` | `H⁰=0`, `H¹=E` | `Ext⁰=0`, `Ext⁻¹=R`; duals `0,E` | Shift agrees | — |
| K0.7 residue module and noncomplete base | DVR, `M=k,j=0`; `R=k[x]_(x),M=R,j=1` | `H⁰(k)=k`; `H¹(R)=k(x)/R` | `Hom_R(k,E)=k`; `Hom_R(R,E)=E` | Agrees | — |
| K0.7 completion-linear dual | Noncomplete DVR, `R̂=k⟦x⟧` | `Hom_R̂(R̂,E)=E` | Restriction `Hom_R(R̂,E)→E` has nonzero kernel | Completion scalar ring necessary | — |
| K0.7 Matlis annihilator lemma | DVR, `M=R/x²`; zero module | `Ann M=(x²)`; `Ann 0=R` | Duals `E[x²]`, `0`; annihilators `(x²),R` | Agrees | — |
| K0.7 local-duality annihilator identity; cesnavicius line 436 | DVR, `M=R/x²,j=0`; `M=R,j=1` | Local-cohomology annihilators `(x²),0` | Ext annihilators `(x²),0` | Agrees | — |
| K0.7 catenarity and normalization | `k⟦x,y⟧`, primes `0⊂(x)⊂𝔪` | Chain length `2`; dimension function `2,1,0` | Adjacent specialization decreases value by `1` | Agrees | — |
| K0.7 equidimensional non-CM locus; cesnavicius line 436 | `N`; DVR | `V(a(N))={𝔪}`; `V(a(R))=∅` | Non-CM loci `{𝔪}`, `∅` | Agrees | — |
| K0.7 arbitrary-support defect set | `R=k⟦x,y,z⟧/(xy,xz)`, `p=(y,z)` | `depth R_p=0`, `dim R/p=1`, sum `1<2` | `R_p` is a field, hence CM despite defect | Equidimensionality essential | — |
| K1.1 d-sequence definition | `ℤ`, lists `[2,0]`, `[0,2]`, `[1]` | Injectivity on generated prefix modules: true, false, true | Torsion-colon criterion: true, false, true | Order and nonproperness distinguished | — |
| K1.1 later-element torsion | `R=k⟦t,u⟧`, `M=R/(u)⊕R`, list `[t,u]` | `ker(tu)=ker(u)=R/(u)⊕0` | `ker(t)=0` | Earlier-element variant false | — |
| K1.1 empty and zero modules | Any ring, `M=0`; empty list | All relevant submodules zero; empty quantifier | Every list d-sequence on zero; empty list always | Agrees | — |
| K1.2 colon identity; cesnavicius line 490 | `k⟦x,y⟧`, list `[x,y]`, `i=2,n=2` | `((x):y)∩(x,y)²=(x²,xy)` | `(x)∩(x,y)²=(x²,xy)` | Agrees | — |
| K1.2 Goto–Yamagishi intersection, Lean line 122 | Same instance; `n=1` | `(x)∩(x,y)²=(x²,xy)`; `(x)∩(x,y)=(x)` | `(x)(x,y)=(x²,xy)`; `(x)R=(x)` | Agrees | — |
| K1.2 positive exponent requirement | Field, one-element list `[0]`, colon identity at `n=0` | `(0:0)∩k=k` | `0∩k=0` | Excluded exponent fails | — |
| K2.1 prefix products; cesnavicius line 505 | `ℤ`, `[2,3]`, `s=0,1,2,3` | `R,(2),(2),(2)` | Whole-prefix square at `s=2` would be `R` | Product and out-of-range behavior agree | — |
| K2.1 zero and empty lists | `[0,b]`, `s=1,2`; `[]`, `s=0,1` | `0,0`; `R,0` | Empty product is unit; nonempty zero factor kills product | Agrees | — |
| K2.2 Kawasaki conditions | `k⟦x,y,z⟧`, list `[x,y]`, auxiliary `[z]` | Reverse regular; last-element torsion zero; `z` remains regular | Three clauses true for every positive exponent | Nonempty auxiliary clause exercised | — |
| K2.3 auxiliary-parameter colon identity | `k⟦x,y⟧`, `M=R`, auxiliary parameter `y` after quotient by `x` | `(0:xy)=0` | `(0:y)=0` | Agrees | — |
| K2.3 reversed prefixes | `k⟦x,y,z⟧/(x²,xy)`, CM-secant `[y,z]` | `[z,y]` is d-sequence | `[y,z]` fails: `xz` lies in generated module and is killed by `y` | Reversal necessary | — |
| K2.3 estimate A | `k⟦x,y⟧`, parameters `[x,y]`, `i=j=k=l=1,n₁=2` | `(0:x)∩(x,y)²=0` | Empty intermediate ideal times `(x,y)=0` | Agrees | — |
| K2.3 estimate A, nonempty intermediate ideal | Same ring; `k=1,l=2`, using tail indexing `[x,y]` | `((x):y)∩(x,y)²=(x²,xy)` | `(x)(x,y)=(x²,xy)` | Agrees | — |
| K2.3 estimate B | `k⟦x,y,z⟧`, parameters `[x,y,z]`, `i=j=k=l=3`, auxiliary `[x,y]`, `n₃=1` | `((x,z²):y)=(x,z²)` | `(z)((x,z):y)+(x):y=(x,z²)` | Agrees | — |
| K2.3 estimate C | Same data, `n₃=2` | `((x,z²):y)=(x,z²)` | `(x):y+(z)=(x,z)` | Inclusion holds | — |
| K2.3 estimate D | Same data, `n₃=2` | `((x,z²):y)∩(z)=(xz,z²)` | `z((x,z):y)+(x)=(x,z²)` | Inclusion holds | — |
| K2.3 estimate E | `k⟦x,y,z⟧`, `i=j=k=3`, auxiliary `[x,y]`, `v=u=2,n₃=1` | `((x,z):y²)=(x,z)` | `((x,z):y)=(x,z)` | Agrees | — |
| K2.3 torsion identity | `M=k⊕k⟦x,y⟧`, list `[x,y]`, `n=m=1` | `y`-torsion of `M/xM` is the summand `k` | `(x,y)`-torsion is the same `k` | Nonzero torsion tested | — |
| K2.3 auxiliary regularity | `k⟦x,y,z⟧`, list `[x,y]`, auxiliary `[z]` | `z` injective on `R/(x,y)` | Injective on `R` and `R/(x(x,y))ⁿ`, all `n>0` | Agrees | — |
| K2.3 Kawasaki proposition, Lean line 170 | Regular parameters `[x,y,z]`, prefixes of lengths `0,1,2,3` | Every prefix satisfies the three clauses | Empty, one-element and full prefixes included | Agrees | — |
| K2.4 robustness | `k⟦x,y,z⟧`, list `[x,y]`, quotient by auxiliary `z` | Quotient is `k⟦x,y⟧`, list remains regular | Reversed d-sequence; torsion and regularity clauses persist | Agrees | — |
| K3.1 Rees module; cesnavicius line 543 | `R=ℤ,I=(2),M=ℤ/2` | Degree zero `ℤ/2`; every positive degree zero | Tensor construction has `ℤ/2` in every degree | Image construction necessary | — |
| K3.1 multiplication and degenerate ideals | Any `M`, `I=0,R` | Graded modules `M[0]`, `M[t]` | Degree `(n,m)` action sends `Iⁿ×IᵐM` into `Iⁿ⁺ᵐM` | Agrees | — |
| K3.2 chart modules; cesnavicius line 549 | `ℤ,(2),ℤ/2`; `a=0`; `I=R,a=1` | Chart modules `0,0,M` | Tensor chart in first case is `ℤ/2`, not `0` | Agrees | — |
| K3.2 zero-divisor chart and tensor kernel | `R=k⟦x,y⟧/(xy)`, `I=(x)`, `M=R` | Chart ring and module `k⟦x⟧` | Kernel of pullback map `(y)`, exactly `x`-power torsion | Agrees | — |
| K3.2 finiteness and regularity of denominator | Same chart | One generator as chart module; multiplication by `x` injective | `x` was a zero divisor on the original ring | Agrees | — |
| K3.3 homogeneous localization and shift | `S=k[X₀,X₁]`, `N=S(-1)` | Degree-zero bases `1/X₀`, `1/X₁` | Transition `1/X₀=(X₁/X₀)(1/X₁)` | Shift sign pinned | — |
| K3.3 nonstandard grading | `S=k[t]`, degree of `t` is `2`, `N=S(1)` | Degree-zero localization is `0` | Odd-degree components cannot become degree zero using powers of `t` | No standard-grading assumption smuggled in | — |
| K3.3 exactness and truncation | `S=k[t]`, `0→S(-1)→S→k→0` | After sheafification: isomorphism then zero | Sheaf of `tS` equals sheaf of `S`; degree-zero tail disappears | Agrees | — |
| K3.3 module blowing-up | `I=0`; `I=R`; `M=0` | Empty Proj; original module sheaf; zero sheaf | Charts give respectively no nonzero rings, `M`, zero modules | Agrees | — |
| K3.3 chartwise CM; cesnavicius line 566 | `N,I=R`; `N,I=(y)`; `M=0` | First fails at closed point; second chart `k⟦y⟧`; all stalks zero in third | CM false, true, true | Predicate distinguishes bad chart | — |
| K3.3 checking closed points | Finite chart module on `k[x]`; stalks at `(x)` and `0` | Depth/dimension `1/1` and `0/0` | CM localizes from maximal to generic prime | Agrees | — |
| K3.4 strict transform | `ℤ,(2),ℤ/2`; unit ideal | Pullback `ℤ/2`, exceptional torsion entire module | Strict transform zero; unit case unchanged | Agrees | — |
| K3.4 comparison beyond finite hypotheses | `R=k[x₁,x₂,…]`, `I=(x₁)`, `M=⊕_{n≥0}R/(x₁)` | Every positive Rees-module degree zero; associated sheaf zero | Pullback entirely exceptional torsion; strict transform zero | General comparison holds | R03 |
| K3.5 product of ideals, schemes | `R=k⟦x,y⟧/(xy)`, `I=(x),J=(y)` | `IJ=0`, product blow-up empty | First blow-up `Spec k⟦x⟧`; next center zero, hence empty | Agrees | — |
| K3.5 product charts | `R=k⟦x,y⟧`, `I=(x),J=(x,y)` | Product's `x²`-chart is `R[y/x]` | Iterated chart also `R[y/x]` | Agrees | — |
| K3.5 infinitely generated ideal | `R=k[y,x₁,x₂,…]`, `I=(x₁,x₂,…),J=(y)` | Product's `yx₁`-chart is `R[x₂/x₁,x₃/x₁,…]` | Iterated `x₁,y`-chart is the same ring | General comparison holds | R03 |
| K3.5 product modules | Previous ring, `M=R/(y)` | Product chart at `yx₁` is zero | First chart nonzero; subsequent inversion of `y` kills it | General comparison holds | R03 |
| K3.5 ring versus module regularity | `R=k⟦x,y⟧/(xy)`, `M=R/(y)`, center `(x)` | Scheme `Spec k⟦x⟧`; transformed module `k⟦x⟧` | Pushforward equals `M`, though scheme differs from `Spec R` | Agrees | — |
| K3.6 support description | `R=k⟦x,y⟧`, `M=R/(y)`, `I=(x,y)`, chart `x` | Chart support `V(y/x)` | Kernel of chart map to `k((x))` is `(y/x)` | Agrees | — |
| K3.6 finite-type height inequality | `k[x]⊂k[x,t]`, `q=(x,t)`; `k⊂k[t],q=0` | `2+0`; `0+1` | `1+1`; `0+1` | Both equalities | — |
| K3.6 flat dimension formula | Same polynomial extension, `p=(x),q=(x,t)` | `ht(q)=2` | `ht(p)+ht(q/pB)=1+1` | Already pinned | R02 |
| K3.6 Rees dimension bound | DVR, `I=(x)`; `I=0`; zero ring | Rees dimensions `2,1,⊥` | Base dimension plus one `2,2,⊥` | Inequality, not universal equality | — |
| K3.6 Proj dimension drop | `S=k[t]`; DVR Rees algebra; ideal zero | `dim Proj+1=1,2`; empty Proj | `dim S=1,2`; empty case excluded | Agrees | — |
| K3.6 support dimension, Lean line 208 | `N,I=(y)`; `R=ℤ,M=ℤ/2,I=(2)` | Chart support dimensions `1,⊥` | Original dimensions `1,0` | Both inequalities hold | — |
| K4.1 regular-element reduction | `R=k⟦x,y⟧`, list `[x]`, auxiliary `y` | Rees modules modulo `y` give Rees modules over `k⟦x⟧` | On each principal chart, quotient gives `k⟦x⟧` | Agrees | — |
| K4.1 regularity hypothesis negative control | Same ring, auxiliary `x` | Degree-one quotient `(x)/(x²)` is nonzero | Image ideal after quotient by `x` is zero | Reduction fails without hypothesis | — |
| K4.2 first two stages; cesnavicius line 591 | `N`, list `[y]`, `s=0,1` | Unit stage is `N`; principal stage is `N/(x)=k⟦y⟧` | Depths `0,1`, matching bounds `0,1` | Agrees | — |
| K4.2 two-generator chart; cesnavicius line 613 | `R=k⟦x,y⟧`, denominator `y` | `T=x/y`, relation `yT−x=0` | `xT−y` is generally nonzero | Chart direction fixed | — |
| K4.3 annihilation | `R=k⟦x,y⟧`, module `M=(x,y)` | `H¹_(x,y)(M)=k≠0` | Both `x` and `y` act as zero | Nonvacuous annihilation | — |
| K4.3 vanishing; cesnavicius line 697 | Three parameters; closed intermediate chart with parameters `x,T=y/x,z` | `H¹_(x,z)=0`; `H⁰_𝔪(H²_(x,z))=0` | `s−3=0` bound includes only this latter degree | Agrees | — |
| K4.3 sharp vanishing endpoint | Same three-dimensional chart | `H¹_𝔪(H²_(x,z))=H³_𝔪(R')≠0` | Degree `1` lies above claimed bound `0` | Stronger bound excluded | — |
| K4.3 relation kills H¹ | `M=(x,y)` over `k⟦x,y⟧` | `H¹(M)[T]=k[T]`; `(yT−x)` acts as zero | Polynomial extension of annihilated cohomology | Agrees | — |
| K4.3 relation without annihilation | `N=k⟦x,y⟧/(xy)`, `a=x,b=y` | On `y⁻²`, relation acts by `y⁻¹T≠0` | Required annihilation of H¹ fails | Hypothesis necessary | — |
| K4.4 depth induction, Lean line 231; cesnavicius line 591 | Empty list; `N,[y]`; regular two-parameter blow-up | Closed-chart depths `0,1,2` in these examples | Required lower bounds `0,1,2` | Agrees | — |
| K4.4 zero stalks and closed-fiber condition | Zero module on any available chart | Depth `∞` | Finite sequence length `s≤∞`; hovering condition unchanged | No spurious nonzero assumption | — |
| K4.5 weaker Kawasaki theorem, Lean line 245; cesnavicius line 578 | Empty list on `N`; `[y]` on `N` | Empty case fails terminal-CM hypothesis; principal chart has depth/dimension `1/1` | Theorem excludes first case and yields CM in second | Terminal condition necessary | — |
| K4.5 CM-secant theorem, Lean line 255; cesnavicius line 566 | `N,[y]`; zero module with empty list; field with empty list | Transforms `k⟦y⟧`, zero sheaf, `k` | CM true in all three cases | Degeneracies agree | — |
| K4.6 Huckaba algebra and origin | All fields, including `𝔽₂,𝔽₃`; generators `u,v,w,z` | `v³=wz`, `w⁷=u³⁵z²`; constant-term quotient `k` | Basis `vⁱwʲ`, `0≤i<3,0≤j<7`, has `21` elements over `k[u,z]` | Domain, dimension `2`, depth `2` | — |
| K4.6 bad blow-up, Lean line 287; hjls line 453 | Chart exponents `a=(3,0),b=(5,3),c=(14,2),d=(4,7)` | `dc²=ab³c=(32,11)` | `c²/a=(25,4)` absent from semigroup; `c²` nonzero modulo `a` | Chart depth `1<2` | — |
| K4.6 characteristic independence | Same semigroup over `𝔽₂` and `𝔽₃` | Monomial exponent obstruction unchanged | No division by `2`, `3` or `7` enters either computation | Same counterexample | — |
| Structural instances, Lean lines 186, 189, 270, 278, 281 | `I=R,a=1`; Huckaba algebra over `𝔽₂` | Chart ring `R`, scalar map identity; origin quotient `𝔽₂` | Inherited ring/algebra laws; maximal origin and local localization | Bodies agree; documentation missing | R06 |
| Source correction: CM off support | Zero stalk | Depth `∞` | Support dimension `⊥`, not `∞` | README support qualification necessary | — |
| Source correction: p-standard type bound | `R=k⟦x,y⟧`, `M=R⊕R/(x)`, attempted type `s=0` | `a(M)=(x)`, `dim R/a(M)=1`; cannot choose two parameters inside `(x)` | Published 2000 bound requires `s≥1` | 1996 inequality reversed | — |

- Source sample: 15/15 requested targets checked at their locators in cesnavicius, kawasaki1996 and stacks; additional colon estimates checked in kawasaki2000, Theorem 3.1, pp. 2522–2523, and kawasaki2002, Theorem 3.6, pp. 127–128. Exact 1999 pagination remains unverified.
- Headline coverage: 9 admitted theorems—Schenzel, parameter extension, Goto–Yamagishi intersection, Kawasaki conditions, chart support dimension, closed-point depth, weaker Kawasaki, CM-secant Kawasaki, Huckaba—are present; the docstring explicitly lists the normalized-dualizing-complex and module-sheaf results lacking pinned carriers.
- Signature and padding probes: 24 named declarations checked with `#check @name`; 0 lost required binders, 0 README/signature mismatches found. All 9 admissions resisted `simp`, `rfl` and `infer_instance`; opened library near-matches supplied no one-lemma proof of these headlines.
- Pinned ownership anchors opened: `TauCeti/RingTheory/CohenMacaulay/RegularSequence.lean:111,158`, `TauCeti/Algebra/Module/Injective/Noetherian.lean:61`, `Mathlib/RingTheory/Ideal/KrullsHeightTheorem.lean:484`, `Mathlib/RingTheory/Ideal/GoingDown.lean:154`; these expose R01, R02 and R04.
- Supplier resolution: 19 section contracts across 8 suppliers resolved at main or the supplied open head; all 5 resolver leads resolved. Main SchemeAndStackFoundations §§0.3, 0.16–0.18, 2.7, 2.18, 2.21, 4.11; ArithmeticGaloisDuality D7.1 at #858, `TauCetiRoadmap/ArithmeticGaloisDuality/README.md:4829`, owns complete-ring local duality.
- Gate: every worker check at `51b4ae2` passed, including the targeted build. Independent dependency output: `depcheck: 245 roadmaps, 2212 edges, 0 problem(s)`; 0 UPWARD/CYCLE lines. Independent `lake env lean` exited 0 with exactly 9 `sorry` warnings.
- Scope and PR text: 3 added folder files, 2566 inserted lines, 24 named Lean declarations; 0 removed base declarations and 0 changes outside the folder. The title, prose and roadmap-summary block match the head; previous R01 is repaired.

Overlap check: read DeformationAndDerivedPatchingAlgebra (#1034), DirectSummandsAndBigCohenMacaulay (#1735), SchemeAndStackFoundations (main and #1808), PurityForFlatCohomology (#1840), LocalPurity and PurityOfBranchLocus (main). This roadmap owns annihilator products, secant/CM-secant sequences, Kawasaki conditions and Rees modules; the first two consume these. SchemeAndStackFoundations supplies local cohomology, dualizing complexes, sheaf CM, relative Proj and modification strict transforms; K3 extends strict transforms to arbitrary blow-ups. Shared depth/CM algebra belongs to Mathlib/Tau Ceti, including R01–R02. No second copy, dropped cited id, conflicting folder head or additional co-owned object was found.

Source independence: 25 passages compared with 6 readable works (cesnavicius, stacks, kawasaki1996, kawasaki2000, kawasaki2002, hjls), including the 15 sampled targets and additional definitions, proof sketches and Lean docstrings; no copied nonformula expression found. Česnavičius has the largest share: 53 of 116 source-name occurrences before References, including 51 locator-bearing occurrences. Its contents were read: §§2–5 cover S₂-ification, CM blow-ups, local Macaulayfication and global Macaulayfication; the roadmap's five layers subdivide the blow-up mathematics, not that chapter sequence. K0→K2 is forced by Schenzel's bound, K1→K2 by Goto–Yamagishi, and K2/K3→K4 by torsion identities and chart modules.

## Not verifiable

- kawasaki1999, Propositions 3.2–3.5, p. 5, and Theorem 3.6, pp. 6–13: the sources service could not decode the author's compressed DVI; the corresponding published 2002 statements were read, but the preprint's numbering and wording were not certified.
- schenzel1982, §2.4.2: the sources service found no readable legal text; K0.5's bound was checked independently in kawasaki1996, Lemma 2.4, p. 42, and cesnavicius, Remark 3.3, p. 10.
- huneke1982 and hio: the sources service returned uncertified publisher records; the historical attributions were not text-checked. The d-sequence definition and identities were checked in cesnavicius, §§3.8–3.10, p. 12.

## Source issues

- **Error** in cesnavicius at §1.14, p. 4: the source says CM means depth equals support dimension at every stalk; it should restrict that equality to nonzero stalks, since zero has depth infinity and empty support; affects a stated result.
- **Misprint** in cesnavicius at Remark 3.9, p. 12: the source says the earlier element has the same torsion as the product; it should use the later element; affects a stated result.
- **Misprint** in cesnavicius at Proposition 3.11(iii), p. 13: the source says regularity of an unprimed original parameter is the antecedent; it should use the last primed auxiliary parameter; affects a stated result.
- **Misprint** in cesnavicius at proof of Theorem 3.14, p. 15: the source says every factor of the prefix product is the final prefix ideal; it should make factor i the prefix of length i; affects the proof.
- **Misprint** in cesnavicius at (3.14.10), p. 16: the source says the annihilating polynomial has the two parameter indices reversed from the exact-sequence map; it should use the same polynomial as (3.14.7); affects nothing.
- **Misprint** in kawasaki2000 at proof of Proposition 2.8, p. 2521: the source says the exponent list ends with a parameter symbol; it should end with the corresponding exponent; affects nothing.
- **Gap** in kawasaki2000 at Theorem 3.1(E), before (3.1.5), p. 2523: the source says the last auxiliary parameter must lie in the quotient module's annihilator product; it should also allow membership in the original module's annihilator product, needed by Step 6; affects the proof; corrected in print at kawasaki2002, Theorem 3.6(E), p. 128.
- **Gap** in kawasaki2000 at proof of Theorem 3.1, Step 3, p. 2524: the source says only quotient-annihilator membership supplies the final torsion equality; it should carry both alternative annihilator memberships in the strengthened induction; affects the proof.
- **Misprint** in kawasaki2000 at (3.1.6), p. 2524: the source says the second intersected submodule omits the last auxiliary parameter; it should include all auxiliary parameters; affects the proof.
- **Misprint** in kawasaki2000 at Corollary 3.3, p. 2531: the source says the tail index has no upper bound; it should bound that index by the parameter-system length; affects a stated result.
- **Error** in kawasaki1996 at text after Definition 2.5, p. 42: the source says existence follows when the type is at most the annihilator-locus dimension; it should require type at least that dimension, below the module dimension; affects a stated result; corrected in print at kawasaki2000, Theorem 2.7, p. 2521.
- **Error** in stacks at §47.19, tag 0DW3, p. 35: the source says algebraic dualizing of the completion preserves the original-ring Hom into the injective hull; it should use Hom over the completed ring for completed modules and Matlis biduality; affects the proof.

## For the human reviewers

- The exact 1999 author-preprint citation remains unreadable through the sources service; the published 2002 version supports the colon statements, but does not certify the cited preprint's pagination. See `TauCetiRoadmap/DeformationAndDerivedPatchingAlgebraPartII/README.md:1281`.
