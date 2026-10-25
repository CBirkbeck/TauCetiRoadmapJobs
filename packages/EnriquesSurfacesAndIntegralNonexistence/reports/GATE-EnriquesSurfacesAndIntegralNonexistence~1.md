## H01 (CBirkbeck) — applied

In `TauCetiRoadmap/EnriquesSurfacesAndIntegralNonexistence/README.md:1755`, changed the auxiliary construction from an I₂* fibre with two III half-fibres to a double I₂* fibre and two III fibres, exactly one double; the primitive divisor D now has its explicit coefficients, D·C₆=1, and full fibre 2D, with three multiplicity Checks at line 1759. SCH23 line 1998 establishes the double I₂*, and SCH23 lines 2014–2022 support the incidence argument, which now identifies R+R′ as the simple III fibre before reaching the contradiction.

## H02 (CBirkbeck) — applied differently

In `TauCetiRoadmap/EnriquesSurfacesAndIntegralNonexistence/README.md:69` and line 1845, replaced SchemeAndStackFoundations §4.10 as the scheme-construction input with AdicSpacesPartIII F0.3/F0.8, including compatible ample lines and flatness/smoothness comparisons; scope, §8.3a Checks and Layer 8 dependencies agree, and §8.4 retains its independent characteristic-zero input. SchemeAndStackFoundations on main explicitly excludes this construction at `TauCetiRoadmap/SchemeAndStackFoundations/README.md:5506`, whereas `TauCetiRoadmap/AdicSpacesPartIII/README.md:3616` already supplies it; the job excludes dependencies on revisions of existing roadmaps, so the proposed §4.10A revision is replaced by this earlier supplier on main.

## H03 (CBirkbeck) — applied

In `TauCetiRoadmap/EnriquesSurfacesAndIntegralNonexistence/README.md:1153`, added geometric integrality of J and a dense-open isomorphism over P¹_k̄ between J_k̄ and the regular Jacobian Jᵍ constructed from the geometric pencil, respecting generic Pic⁰ and zero-sections, following SCH23 lines 830–838. Line 1189 now proves rationality on Jᵍ and transfers it birationally to J_k̄, with inseparable nonreduced and blow-up Checks at lines 1177 and 1179.

## Evidence, ownership and signature audit

Commit: `e030a1b` (README only); no push. The three numbered requests are the distinct findings; the review's introductory assessment and positive checks contain no additional requested repair or question.

Main was verified at `ae2562cd6d39ddeac99ac18bdf78e6e46a068586`. AdicSpacesPartIII F0.3's comparison is at `TauCetiRoadmap/AdicSpacesPartIII/README.md:1964`, F0.7's closed-fibre neighbourhood statement at line 3275, F0.8's construction and ample-line conclusion at lines 3616 and 3654, R2.9's smoothness comparisons at line 7830, and R2.10's local flatness criterion at line 8656. The construction is consumed on a complete Noetherian DVR with Cartesian smooth proper reductions and compatible invertible sheaves, ample on the closed fibre; coherent existence on an already given scheme is kept separate.

K3SurfacesAndSymplecticBoundedness was read at supplied head `8bc88634194bd04a2b8b1963f8cb55df8d20c01d`: its §6.0b begins at `TauCetiRoadmap/K3SurfacesAndSymplecticBoundedness/README.md:733`, supplies field change of the original smooth surface fibration, and restricts the subsequent geometric Jacobian/Euler package to algebraically closed fields. The new §4.1 supplies the Enriques comparison between the two Jacobian constructions; it adds neither a general regular-model constructor nor a claim of smooth base change for every regular model.

Ownership was searched by object in main, board packages, the open-roadmap index and every supplied sibling roadmap folder. AdicSpacesPartIII owns the general polarized algebraization; K3SurfacesAndSymplecticBoundedness §6.0b and NeronModelsAndSemistableAbelianVarietiesPartII §4.17 own the shared fibration and regular-model constructions; this roadmap owns the Enriques geometric-integrality/birational adapter and the III* exclusion. Open pull requests without supplied sibling checkouts were not independently audited for ownership; none is introduced as a dependency. Citation resolution found no unresolved cross-roadmap citations or Lean names; its external-library lookup was unavailable, so the relevant native carriers and declarations were inspected directly at the pins instead.

Mathlib and Tau Ceti checkouts match the manifest pins `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The native lattice has fields carrier, form, spanning/finiteness, symmetry and integrality, with no nondegeneracy field (`TauCeti/LinearAlgebra/IntegralLattice/Basic.lean:63`); the Gram constructor is at line 261 and its basis-pairing theorem at line 295. The discriminant quadratic map and representative formula at `TauCeti/LinearAlgebra/IntegralLattice/Discriminant/Quadratic.lean:122` and line 129 use half the norm modulo integers. Native geometric integrality is available (`Mathlib/AlgebraicGeometry/Geometrically/Integral.lean:40`), but the Enriques predicate, surface Jacobian construction and polarized formal algebraization carriers needed for these geometric headline statements are absent at the pins. Their absence is already recorded in the unchanged Suggested.lean module docstring; no stand-in was added.

I compared all twelve elaborated `#check @name` signatures supplied for the single scratch module with their README statements; its declaration text was mechanically confirmed identical to unchanged `TauCetiRoadmap/EnriquesSurfacesAndIntegralNonexistence/Suggested.lean`. Every binder and quantifier agrees, including the three positive-cone hypotheses, x≠0, and existential evenness witnesses; no binder repair or Lean change was required. The following rows record the comparison and computed witnesses individually.

| Declaration | README and elaborated signature | Instances and computed values | Result; change |
| --- | --- | --- | --- |
| enriquesNumericalLattice | §1.26, native lattice on Q²×Q⁸ | e²=f²=0, e·f=1, (e+f)²=2; a root in the negated E₈ block has square −2; e/2 has nonintegral coordinate 1/2 | Agrees; unchanged |
| positive_cone_decomposition | §1.26, h²>0, d²>0, d·h>0, both nonzero summands in the native carrier | h=d=e+f: squares 2,2, pairing 2; split e,f: squares 0,0, pairings 1,1. For d=2e+f+r with r²=−2: d²=2, d·h=3; split e,e+f+r: squares 0,0, pairings 1,2. For d=−h the pairing is −2, outside the premise | Agrees; unchanged |
| dyadicRepresentative | §3.6, three Fin 2 exponents, rational output | Lexicographic triples give 1,5,2,10,−1,−5,−2,−10; none is zero | Agrees; unchanged |
| dyadic_square_classes | §3.6, x in Q₂ with x≠0 and unique triple | Valuation parity is 0 or 1; odd residues are 1,5,7,3 for each parity, giving eight distinct pairs. At x=0 all eight quotients equal square zero, so uniqueness fails | Agrees, nonzero binder retained; unchanged |
| firstGram | §6.1, integer 10×10 matrix | Entries (8,3)=1, (8,9)=1, (9,9)=0; determinant −4, rank modulo two 8 | Agrees; unchanged |
| secondGram | §6.1, integer 10×10 matrix | Entries (8,3)=0, (8,9)=1, (8,8)=0; determinant −4, rank modulo two 8 | Agrees; unchanged |
| firstLattice | §6.1, native Gram lattice on Q¹⁰ | Basis pair (8,3)=1; e₁²=−2, e₁/2 has norm −1/2 and is outside the integer carrier; last basis square 0 | Agrees; unchanged |
| secondLattice | §6.1, native Gram lattice on Q¹⁰ | Basis pair (8,3)=0; e₁²=−2, e₁/2 has norm −1/2 and is outside the integer carrier; last basis square 0 | Agrees; unchanged |
| firstLattice_discriminant_group | §6.2, Nonempty additive equivalence with (ZMod 2)² | Rational inverse modulo integer coordinates generates four classes; every class has twice itself zero. Determinant magnitude 4 and mod-two rank 8 give Smith factors 1⁸,2,2 | Agrees; unchanged |
| firstLattice_isotropic_card | §6.2, existential native IsEven witness and cardinality 3 | All diagonal entries even; four discriminant half-norms are 0,0,0,1/2; exactly three vanish, including zero | Agrees; unchanged |
| secondLattice_discriminant_group | §6.3, Nonempty additive equivalence with (ZMod 2)² | Rational inverse modulo integer coordinates generates four classes, all killed by two; Smith factors 1⁸,2,2 | Agrees; unchanged |
| secondLattice_isotropic_card | §6.3, existential native IsEven witness and cardinality 3 | Even diagonal; four discriminant half-norms 0,0,0,1/2; three vanish | Agrees; unchanged |

## Adversarial pass on the repairs

These are computations on the revised statements and their hypotheses, not proofs of their admitted geometric endpoints. The matrix and incidence values were recomputed exactly over rational numbers; geometric examples below specify their coordinate rings, degrees or cohomology values.

| Statement | Instances tried | Values computed on each side | Result | Change |
| --- | --- | --- | --- | --- |
| §7.1 primitive I₂* divisor D | Displayed seven-component divisor, affine E₇ edges plus C₀′–C₁ | D²=−32+32=0; D·C is zero on each of its seven components; gcd of coefficients 1,2,1,2,2,1,1 is 1 | Canonical-type primitive coefficients consistent | Display coefficients explicitly |
| §7.1 full fibre 2D | C₆, adjacent only to C₅ in D | D·C₆=1; (2D)·C₆=2; a simple full fibre would require 1=2n for integer n | Simple-fibre interpretation excluded | State I₂* is double |
| §7.1 number of III half-fibres | Classical pencil, exactly two double fibres | One double I₂* plus one double III gives 1+1=2; making both III double gives 1+2=3≠2 | Exactly one III double | Replace two III half-fibres |
| §7.1 incidence and remaining multiplicity | III pair R,R′, nonnegative incidences a,b; degree-one incidences excluded | Solve m(a+b)=2, m∈{1,2}, a,b≠1: only (m,a,b)=(1,0,2),(1,2,0). A doubled (0,2) pair gives 4≠2 | R+R′ is simple, regardless of ordering | Separate primitive and full fibres |
| §7.1 final half-fibre contradiction | E and E′ are the two primitive III* vectors, differing by C₀′−C₀ | E·E′=2 from E·C₀′=2; partner half-fibres require intersection 1 | 1≠2 | Keep endpoint with corrected inputs |
| Multiplicity pattern elsewhere, §7.4 | I₂* simple after its separate multiple-fibre exclusion | Zero double I₂* plus two double III gives 0+2=2 | The two III half-fibres in this different case remain valid | No indiscriminate replacement |
| F0.3 tower and coherent-module comparison | V/(π), V/(π²), ideal (π), compatible structure sheaves | First-order ideal (π)/(π²) has residue dimension 1; both structure sheaves have rank 1; identity transition sends 1 to 1 | Finite first-order ideal and genuine compatible line retained | Name tower comparison |
| F0.8 algebraization with ample line | P¹ over V/(π^(n+1)), O(1), n=0,1 | Degrees of restriction and preceding line are 1=1; algebraized O(1) also has fibre degree 1 | Applicable at p=2 and p=3, ramified or unramified V | Use existing general producer |
| F0.8 compatibility requirement | O(1) at n=0, O(2) at n=1 | Restricted degree 2≠1; h⁰(O(2))=3≠2=h⁰(O(1)) | These lines cannot form a compatible tower | Add negative-control Check |
| F0.8 ampleness and invertibility | O on P¹; zero sheaf | deg O=0 and h⁰(O)=1, whereas O(1) has degree 1 and two sections; zero sheaf has rank 0≠1 | Neither properness alone nor an arbitrary coherent module supplies the hypothesis | Keep compatible ample invertible line explicit |
| Algebraization flatness/smoothness | Polynomial chart B=V[t] of P¹_V | B has π-torsion 0 and differential module B dt of rank 1; every reduction is V_n[t] and has the same differential rank | Local flatness and smoothness agree with all levels | Specify R2.10/R2.9 and Noetherian DVR domain |
| Flatness needs all levels | B=V[t]/(π²) | Special reduction is k[t], smooth; at level V/(π³), its constant-coefficient direct summand has length 2, not a multiple of 3, so is not flat | Smooth closed fibre alone does not justify the step | Retain smoothness of every level |
| F0.7 proper closed-fibre neighbourhood | P¹_V versus nonproper Spec Frac(V) | Proper smooth algebraization has empty nonsmooth locus; Spec Frac(V) has empty closed fibre, so its empty open contains that fibre but omits its nonempty source | Properness is essential in extending the smooth locus | Name properness and F0.7 |
| §8.3a ramified lift versus W₂-lift | V=W(k)[π]/(π²−p), p=2,3 | In Z/4, squares reducing to zero are 0≠2; in Z/9 they are 0≠3. In W₂(k), any element in pW₂(k) likewise squares to zero | No such base map to W₂(k); finite ramified lifting does not contradict nonlifting | Preserve independent lifting route |
| §8.4 use of characteristic-zero branch | W[[t₁,…,t₁₀]]; contrasting W[[t₁,…,t₁₂]]/(2) | First ring has dimension 1+10=11 and no 2-torsion; second has dimension 12 but 2·1=0 and no characteristic-zero point | Regularity alone cannot give Witt-flatness | Correct §8.3a's supplier, keeping its independent role |
| §4.1 geometric-integrality requirement | k=F₂(s), k[u,v,w]/(u²−s); extend to k(√s) | Before extension it is a polynomial ring in v,w over a degree-two field; afterwards ε=u−√s≠0 but ε²=0 | Regularity alone admits a nonreduced geometric base change | Add inseparable negative control |
| §4.1 dense-open comparison and generic marking | Identity field extension on a Jacobian; original pencil has smooth local sections after strict henselization | Comparison induces t↦t over k̄(t) and identity↦identity on generic Pic⁰; a constant base map would send transcendental t to a scalar | Source, target and generic marking fixed; no arbitrary unrelated surface | State V-isomorphism and generic comparisons |
| §4.1 comparison only on a dense open | P²_k̄ and its blow-up at one point | Picard ranks 1 and 2 differ; both function fields are k̄(x,y) and both rational | Birational comparison suffices; it does not itself imply whole-model isomorphism | Add blow-up Check |
| §4.2 Euler/Hodge-line comparison | χ=1 geometric Enriques Jacobian; elliptic product; Jacobian K3 | For χ=1, deg R¹j_*O=−1 and deg canonical base line=−2−(−1)=−1; product gives 0 and −2; K3 gives −2 and 0 | Formula conventions agree with supplier §6.0b | Apply formulas to Jᵍ |
| §4.2 rationality criterion | Same three geometric models | Enriques Jacobian: h¹=0+h⁰(O(−1))=0, h⁰(ω²)=h⁰(O(−2))=0; product: h¹=1; K3: h⁰(ω²)=1 | Only the required geometric Jacobian satisfies both vanishing tests | Transfer rationality to J_k̄ via §4.1 |

All changed assertions retain the original arbitrary-field, elliptic/quasielliptic or characteristic-two domains as appropriate. No conclusion was made a hypothesis, no new free predicate or data definition was introduced, and no supplier was moved upward. The numerical computation does not claim geometric realizability. The algebraization repair introduces no new cited work; the settled CDL2021 waiver and other settled source statuses remain unchanged.

## Validation

`lake build TauCetiRoadmap.EnriquesSurfacesAndIntegralNonexistence.Suggested`: exit 0; six expected warnings for admitted headline theorems, no errors.

```text
Build completed successfully (9021 jobs).
```

Dependency-direction check, exit 0; complete output, with no UPWARD, CYCLE or moved line:

```text
depcheck: 42 roadmaps, 428 edges, 0 problem(s)
```

The initial full gate found only the uncommitted README change; after the required commit, the exact full gate exited 0 with the clean worktree summary:

```text
gate EnriquesSurfacesAndIntegralNonexistence: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK
```
