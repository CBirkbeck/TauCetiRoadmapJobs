# Port report: ReductiveGroupsPartIII

Branch: `roadmap/reductive-groups-part-iii`.
Head: `a4abdea9b2cb40a50344735ed8774071871a72d3`.
Base: `b54415b`; the initial worktree was clean. Only
`TauCetiRoadmap/ReductiveGroupsPartIII/{README.md,Suggested.lean,metadata.toml}` is committed.

## Validation

Build command: `lake build TauCetiRoadmap.ReductiveGroupsPartIII.Suggested`.
Exact outcome: `Build completed successfully (18692 jobs).`
Warning count: **4**, all `declaration uses 'sorry'`; no other warnings.
The final file contains one real definition and four headline theorems.

Exact gate summary:

```text
gate ReductiveGroupsPartIII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
```

Dependency check output, using the supplied merge order and content checkout:

```text
depcheck: 223 roadmaps, 2041 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line occurred. The push gate requires a clean worktree: its
precommit run reported only the three staged additions as dirty; the final run was made after
committing those files. No tooling, merge order, manifests or repository-wide lists were edited.

## Draft pull request body

Build the arithmetic theory of semisimple conjugacy quotients and maximal tori over number fields: group Chevalley restriction and character separation, finite faithful quotient maps, rational descent, approximation and cocharacter adjustment of global tori, and density of neat Weil points. These supply rational tori for common realizations and the reductive-group arguments producing common Frobenius quotient classes, real elliptic representatives and rational representatives away from one auxiliary prime. The geometric Shimura-variety independence theorem enters as an explicit hypothesis, while existing quotient, realization and cohomology constructions are consumed from their owners.

AI assistance: Codex (GPT-6); the mathematics, edits and verdicts were checked by this agent without helper agents.

## Suppliers still in open roadmap pull requests

These are new roadmap folders, read at their indexed heads; citations use their names and sections.

- ArithmeticGaloisRepresentations, §1.11.
- IntegralHeckeAndGaloisDeterminants, §0.7.
- SchemeKTheoryOperations, §6.3.1.
- DeligneWeightsAndPurity, §§0.1–0.2.
- AdelicAlgebraicGroups, §§3.4, 4.1 and 4.3.
- EndoscopicTransferAndUnitaryTraceComparison, §§1.1–1.15 and §3.3 for the scope boundary.
- ShimuraData, §§1.2–1.4 and 4.2–4.3.
- ShimuraVarieties, §§P.5, 5.8, 7.0i and 7.0i.1.
- AutomorphicBundles, §1.1.
- MotivesAndAlgebraicCycles, §6.8.
- AbelianSchemesAndArithmeticModuli, §§A1.3a, A3.7, A3.9, A4.1, A5.1, A5.7, A6.11 and A6.21.
- NeronModelsAndSemistableAbelianVarieties, §§5.0a–5.0b.
- PELModuli, §M3.2.

ReductiveGroups and ReductiveGroupsPartII are consumed as they stand in this worktree's main
checkout, including ReductiveGroups Layer 9D's inner/outer interface. Their revisions are not
suppliers. Chebotarev and GlobalNumberFields are also on main, under `Completed/`.
GroupSchemesOverABase §7.2 and LanglandsParameterStacks §4.26 occur only in Scope and ownership
as distinct integral constructions, not as inputs to the build.

Only an open revision defines: **none**. The overlap check reported no competing change to this
folder and no dropped supplier id requiring a revision dependency. The README maps the former
RG3 build labels used by a downstream package to the actual sections and the supplied quotient.

## Lean retention and declaration audit

No theory, admitted data, API padding or computing examples were moved from Lean to the README:
the accepted file had none. The README retains the substantive targets, APIs and Checks.
Two duplicate headline declarations were deleted from Lean because
ArithmeticGaloisRepresentations §1.11 explicitly supplies their mathematics:
`isConj_iff_classFunctions` and `exists_isSemisimplePoint_classFunctions`.
The deleted quotient/classification sections and separate realization comparison/factorization
sections are replaced by exact supplier contracts; their distinguishing worked examples remain
in the README. No replacement admitted predicates or carrier encodings were introduced.

The four retained headlines are `isConj_iff_trace_eq`, `finite_classFunctions_map`,
`finrank_eq_one_of_embeddings_padic` and `exists_isMaximalTorus_conjugate`, with real-bodied
`classFunctions`. Every declaration has a README occurrence and the same explicit hypotheses.
A single scratch file containing `#check @name` for **all five** declarations was elaborated once,
exit 0. I compared every printed type with the README. No needed binder had disappeared:
reductivity, both semisimplicity assumptions, algebraic closedness, the surjective Hopf map and
its restriction equation, NumberField, primality, finite exceptional set, both sets of places
and each prescribed torus's maximality all remain. No binder repair was needed.

The import `TauCeti.Algebra.AlgebraicGroup.Representation.SemisimplePoint` does not exist at the
pin; its declaration is now in `...Representation.SemisimplePoint.Basic`, which is imported.
Lean's module-system warning required `module`, `public import Mathlib`, public imports of the
individual used Tau Ceti modules, and `public section`, matching main's module form. A first
module attempt with private imports correctly failed to expose imported types in public
signatures; public imports repaired it. The gate accepts this module-system spelling. There are
no Mathlib submodule imports, roadmap imports, root Tau Ceti imports or options.

Pins checked with Git: Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e`;
Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`.

Native definitions and near-matches were opened at those pins, not inferred from search hits:

| Object | Pinned source and comparison |
|---|---|
| Equalizer | `Mathlib/Algebra/Algebra/Subalgebra/Basic.lean:1030`: carrier is `{a | ϕ a = ψ a}`; no reductivity, finiteness or smoothness is implicit. |
| Left conjugation | `TauCeti/Algebra/AlgebraicGroup/Hopf/Conjugation.lean:66`, evaluation theorem at line 107, naturality at line 118: first factor conjugates the second. It supplies the coordinate map, not a class-function algebra or Chevalley restriction. |
| Reductivity | `TauCeti/Algebra/AlgebraicGroup/Reductive/Basic.lean:71`, expanded at line 80: smooth, geometrically connected, with no nontrivial connected normal smooth geometric unipotent subgroup. |
| Semisimple point | `TauCeti/Algebra/AlgebraicGroup/Representation/SemisimplePoint/Basic.lean:81`: semisimple action on every finite comodule; it does not assert equality or conjugacy of two points. |
| Point action | `TauCeti/Algebra/Coalgebra/Comodule/PointsAction.lean:134`: action on the scalar extension, as the elaborated trace signatures show. |
| Maximal torus | `TauCeti/Algebra/AlgebraicGroup/Torus/Maximal.lean:50`: minimal Hopf ideal among those whose quotient is a torus; no global approximation theorem is included. Existence is `Torus/Existence.lean:99`; rational conjugation is `Torus/Conjugation.lean:49`. |
| Conjugation and base change of ideals | `TauCeti/Algebra/AlgebraicGroup/HopfIdeal/Conjugation.lean:75`, `HopfIdeal/BaseChange.lean:116`: the conjugator is a rational point of the relevant base change. |
| Finite-type carrier | `TauCeti/Algebra/AlgebraicGroup/FiniteType/CommHopfAlgCat.lean:52`, instances at lines 75–90: the types and Hopf/finite-type instances used by all retained group headlines. |
| Chevalley line stabilizer | `TauCeti/Algebra/AlgebraicGroup/Representation/ExteriorStabilizer/Character.lean:101`: retained only as an attributed supplier, not restated. |
| Chebotarev and approximation | `TauCeti/NumberTheory/Chebotarev/Density/Chebotarev.lean:51`, lines 74 and 83; `TauCeti/NumberTheory/NumberField/Global/Approximation/Weak.lean:208`: declarations present with number-field/Galois and finite-place hypotheses. |
| Abstract conjugacy hits | Mathlib `IsConj`, `ConjClasses.mk_surjective`, `ConjClasses.map_surjective` concern an abstract quotient of all conjugacy classes; they give neither algebraic class functions nor character separation for semisimple points. |
| Trace hits | `Mathlib/LinearAlgebra/Trace.lean:75` and `LinearMap.trace_conj'` give traces and their conjugation invariance, not the converse using all algebraic comodules. FDRep character-isomorphism/orthogonality hits concern different representation carriers and hypotheses. |
| Finite morphism hits | `Mathlib/AlgebraicGeometry/Morphisms/Finite.lean` supplies finiteness of a closed immersion itself. The induced map of conjugacy quotients need not be an immersion: the inverse-pair torus map has a fibre of size 2. |
| Rank hits | `CommSemiring.finrank_self`, `Module.finrank_subsingleton` do not concern almost-every-prime local embeddings of a number field. |

Missing-carrier statements in the module docstring were checked by object searches of the pinned
sources: the normalizer character-action modules concern a split diagonalizable subgroup
(`TauCeti/Algebra/AlgebraicGroup/DiagonalizableGroup/Normalizer/WeylGroup.lean:19`), not the
coordinate action of the Weyl group of a general maximal torus; the available toric point topology
is `TauCeti/Geometry/Toric/Analytic/Torus/Topology.lean`, not local points of every affine group.
The abelian variety carrier in `TauCeti/AlgebraicGeometry/AbelianVariety/Basic.lean:87` is a proper
geometrically integral group object and has no Mumford–Tate or H¹-étale realization field.
Searches found no general reductive inner-twist/nonabelian H¹ carrier. No missing object was
simulated by an arbitrary Prop. The public Zulip/Mathlib searches returned no usable proposed
API for the arithmetic conjugacy or torus constructions.

## Supplier replacements, ownership and duplication

The sweep searched mathematical objects in all main roadmaps, all board packages and every
indexed open roadmap README/Lean head with `roadmaps grep`, and read the relevant owners and the
five closest scopes from the overlap leads. Main models read included
`TauCetiRoadmap/FlagVarieties/README.md` and `Completed/UniversalCovers/README.md`; the broader local supplier was read at its relevant
sections. Ownership against open pull requests **was checked**, including the indexed heads of
the supplied sibling checkouts. No helper supplied a mathematical judgment.

- ArithmeticGaloisRepresentations §1.11 owns the quotient's universal property, flat base
  change, finite generation and full geometric semisimple-class classification. Separate §§0.2
  and 0.4 and the two admitted Lean restatements were deleted. Group restriction to a possibly
  nonsplit maximal torus remains here: that explicit isomorphism is not its generic quotient target.
- ShimuraVarieties §7.0i.1 owns simultaneous factorization, the common finite extension and
  transport under changing complex embedding. MotivesAndAlgebraicCycles §6.8 owns the
  tensor-isomorphism torsor and associated inner twist. Separate §§5.2–5.3 were deleted;
  §5.1 retains conventions and computed witnesses for those supplied realizations.
- IntegralHeckeAndGaloisDeterminants §0.7 owns all arities of invariant coordinate algebras.
  Only the simple equalizer presentation needed for the finite-map headline is kept here.
- SchemeKTheoryOperations §6.3.1 owns the integral character-ring comparison, with no
  semisimplicity assumption in positive characteristic. It is cited, not reconstructed.
- AutomorphicBundles §B1.1 is now §1.1. GroupSchemesOverABase §GS8.2 is now §7.2 and
  LanglandsParameterStacks §LP3.25 is now §4.26; the latter two are scope comparisons only.
  ReductiveGroups' inner/outer interface is Layer 9D on main, not Layer 8.
- The names `Neat.IsNeatAut` and `TauCeti.Shimura.abelian_absolute_hodge` occur as roadmap
  targets in their cited sections; they are explicitly labelled as such, not claimed as pinned
  library declarations. The repaired citation resolver found none of the original three leads
  unresolved. Its library-name phase was unavailable on that host; the pin checks above were
  performed directly in the Lake worktree.
- The four conditional gaps in the accepted review do not occur as the claimed theorem in the
  supplier heads. They are concrete targets here: localization exactness (§2.0), local
  centralizer openness (§2.1a), Galois-stable marked torus embeddings (§4.3), and the relative
  inner-form obstruction with its local replacement law (§5.7a). The same applies to the later
  accepted pointwise same-derived building intersection (§5.3a). These use the existing
  foundation, specify the missing extension and retain generality; no work is demanded from
  another roadmap.
- BunGAndNewtonStrata owns twisted conjugacy and local Newton objects, not this global torus
  approximation. EndoscopicTransferAndUnitaryTraceComparison's Lie quotient and
  ReductiveGroups Layer 11C are Lie-algebra constructions. PELModuli §M3.2 supplies the
  centre-to-group Sha bijection, while the odd totally-real-degree vanishing remains here.
  Finite-group class functions, compact-group character separation and the special SU₂ trace
  theorem at the pin are different objects or strictly special cases.

All duplication removals are recorded in Scope and ownership in the README; no removed-target
stubs remain. No declaration uses another roadmap's fully qualified name.

## Mathematical corrections and source checks

The accepted review's F01 and F02 corrections were already in the package and were retained:
(2,17,34) gives the everywhere-local sextic counterexample, and Steinberg Corollary 6.4 plus
integrality supplies quotient surjectivity, whereas Theorem 6.11(d) gives uniqueness in a fibre.
After removing that duplicate target, its distinction is preserved in the supplier contract and
worked examples. F03 was applied: the torus-fixing automorphism deduction is an explicit API
assertion in §4.1 using ReductiveGroups Layers 7 and 9D, rather than being attributed to Layer 8.

Additional upstream-review fixes:

1. In §2.5 the GL₂ cocharacter Check used positive powers, inconsistent with the global H¹
   convention. It now uses inverse powers: at 2 the two values are diag(1/2,1) and diag(1,1/2).
2. In §1.5 the fibre-product proof asserted an extension by G_m even for ν=1. It now treats
   nontrivial ν and trivial ν separately; for ν=1 the group is Res G itself. The disconnected
   squaring example and all original theorem generality remain.
3. In §5.8 local representatives are explicitly semisimple. Identity at one place and a
   nontrivial unipotent at another have the same quotient but cannot be conjugate to a single
   rational element; the negative-control Check records ranks 0 and 1 for γ−1.
4. In §1.2 the ramified-prime Check now distinguishes residue degree one from an actual local
   embedding: at 2 a cube root of 2 would have valuation 1/3. The proof already restricted the
   equivalence to unramified primes.
5. In §5.4 the integral inertia-module splitting is explained using primitivity of ν_* and an
   induced section, rather than an unspecified fixed diagonal cocharacter.
6. In §4.6 the full CM-field character lattice is explicit, and the real d=3 norm-sign
   calculation gives 4 local H¹ classes despite zero all-place global kernel. It does not
   impose an imaginary quadratic subfield or conflate Sha with H¹.
7. The added localization target's printed-page locator is p.377, verified at Kottwitz86 line
   491, not p.374. Local openness is described as a differential derivation supplying the
   Harder argument's input; Borovoi's proof only cites Harder, and is not misrepresented as
   containing that differential proof. A local rational-point comparison at good reduction is
   explicitly imported from NeronModelsAndSemistableAbelianVarieties §§5.0a–5.0b before applying
   the finite-field Frobenius semisimplicity theorem.

The final README was read in full as an upstream mathematical review. Newly exposed interfaces
have exact hypotheses, routes, locators and discriminating Checks. Literature corrections about
finite places in prime-units, reduced/separated rigidity, connected reductive centralizers rather
than Levi subgroups, semisimple real lifts and restoration of the scalar are preserved.

Sources were read in the legal cached text matched by the SHA-256 values in
`packages/ReductiveGroupsPartIII/sources.toml`, including the proof passages rather than just
cited theorem titles. These are the accepted source line numbers, which also appear in the README:

| Source | Locators opened and use |
|---|---|
| Steinberg65 | line 599 (restriction injectivity), line 602 (character basis route), line 623 (surjectivity of restriction), line 628 (semisimple class/character equivalences). |
| KMPS22 | line 596 (real torus lift), line 625 (Harder), line 648 (cocharacter adjustment), line 1079 (outer quotient), line 1107 (Weil definitions), line 1125 (Serre condition), line 1129 (unit criterion), line 1301 (density), line 1323 (rigidity), line 1332 (common-source setup), line 1367 (torus-fixing step), line 1372 (rational embeddings), line 1647 (general CM odd-degree Hasse assertion). |
| KZ25 | line 2091 (quotient), line 2104 (geometric hypothesis), line 2367 (finite quotient/algebraicity), line 2433 (rational descent), line 2445 (realization conventions), line 2559 (auxiliary groups), line 2570 (intersection in the source's setting), line 2593 (quotient injections), line 2619 (common class), line 2664 (transfer definition), line 2673 (real lifting proof), line 2694 (rational representative), line 2716 (positive-density exceptional primes). |
| Kottwitz86 | line 491 (exactness at the middle), line 648 (quasi-split inner-form basepoint), line 683 (only Hasse-principle use of E₈ restriction), line 706 (relative criterion), line 757 (obstruction replacement formula). |
| Kottwitz90 | line 6793 (quasi-split rational basepoint), line 6797 (ellipticity), line 6799 (local injection/global dual surjection), line 6801 (replacement at one prime), line 6802 (criterion). Garbled OCR at lines 6782–6784 and 6792 is not used. |
| LR87 | line 2907 (Hasse and all-place torus transfer), line 2911 (obstruction), line 2922 (anisotropy makes the local map surjective). |
| Borovoi98 | line 1448 (Harder over number fields, not just ℚ), line 1451 (proof cites Harder). |
| Shin11 | line 696 (unitary Hasse computation in the F=F⁺E case), line 717 (parity), line 727 (remark). General CM scope is explicitly stated at KMPS22 line 1647, not asserted as a theorem of Shin's restricted setup. |
| Deligne82 | line 848 (absolute Hodge theorem), line 1116 (tensor-functor comparison), line 1161 (comparison proof endpoint). |

Noot09 and Kottwitz82 retain their accepted locator-only status; neither was fetched from an
unauthorized copy. No suspicious instructions were found in the inspected source material.

## Unresolved and downstream coordination

There is no unresolved build, gate, import or supply-order failure. The five interfaces previously
left as supplier gaps are owned and specified here. The general CM odd-degree calculation is a
mathematical target with the full lattice and local/global hypotheses; the finite witnesses in this
report are not a formal proof of that target.

The downstream package `packages/ShimuraVarietiesPartII/README.md` cites older RG3 labels; the
Scope mapping resolves the accepted targets. It additionally requests R-smooth tori, R-smooth
centralizers, integral stabilizer closed immersions, stabilization of centralizers and a
compact-quotient/Borel criterion that are not targets in this accepted package. Those requests
were treated as data, not instructions to enlarge this port or change another author's files.
They require separate ownership reconciliation by the worker; the pointwise fixer theorem here
does not claim the stronger R-smooth integral closed-immersion theorem. No consumer package was
edited, and no dependency on the later ShimuraVarietiesPartII roadmap was added.

The parent-relative README and CONTRIBUTING locations in AGENTS.md do not exist in this worktree layout; the normative root
`README.md` and `CONTRIBUTING.md` were read instead. No pushes, pull requests, issues or comments
were made.

## Adversarial mathematics pass

Each row records a statement, concrete instances and their computed values, the result, and a change.
API rows address individual API assertions. The target rows also reconcile the section's Checks
and worked examples. These finite witnesses test conventions and hypotheses; they do not replace
proofs of the general targets. All retained Lean hypotheses were compared with the elaborated types.

| Statement | Instances tried | Values computed on both sides | Result | Change |
|---|---|---|---|---|
| Convention: finite type, geometric connectedness, smooth reductivity | trivial group; G_a; μ₂ in characteristic 2 | dimensions 0,1,0; unipotent radical dimensions 0,1; μ₂ has coordinate (t−1)² and is nonsmooth | first qualifies; latter two do not | none |
| Convention: left conjugation | g=swap, x=diag(2,3); g=diag(2,1), x=E₁₂-unipotent | gxg⁻¹=diag(3,2); upper entry 2, versus 1/2 for g⁻¹xg | tensor factors and direction agree | none |
| Convention: semisimple | 1; diag(2,3); 1+E₁₂ | minimal polynomials X−1, (X−2)(X−3), (X−1)² | last excluded, including on a faithful comodule | none |
| Convention: characteristic range | SL₂ in characteristic 2; real Weyl cocycle | s²−2=s²; n⁻¹c(n)=−1 over ℂ | arbitrary-characteristic group restriction distinct from characteristic-zero descent | none |
| Convention: cocycle and coboundary | SL₂ compact torus, n=diag(i,−i) | a=−1, a c(a)=1; for t=z, t⁻¹c(t)=1/abs(z)²>0 | nontrivial class; orientation fixed | none |
| Convention: Tate–Nakayama sum sign | norm-one quadratic and cubic local tori | 1+1=0 in ℤ/2; 1+2=0 but 1+1=2 in ℤ/3 | cancelling class is negative invariant | explicit cubic witness |
| Convention: positive abelian dimension | g=1 and g=0, scalar 2 | ν(2 id)=4; for g=0, ν(1)=1≠4 | positive dimension needed | preserved |
| Convention: H¹ versus H₁ | elliptic h(2); h(i) | H¹ scalar 1/2, multiplier 1/4; eigenvalues at i are −i,i; H₁ scalar 2 | cohomological sign | corrected §2.5 Check |
| Convention: scalar versus Hodge weight | z=2 | w_s(2)=2 id and ν=4; Hodge weight 1/2 id and ν=1/4 | inverse cocharacters | none |
| Convention: geometric Frobenius | elliptic q=5, trace 2 | polynomial X²−2X+5, roots 1±2i, modulus √5, multiplier 5; inverse has multiplier 1/5 | arithmetic inverse excluded | none |
| Convention: ellipticity | GL₂, complex torus; diagonal torus; G_m | quotient real split ranks 0,1,0 respectively | centre-relative definition | none |
| Convention: orthogonal outer subgroup | GL₃, SO₈, Spin₈, SO₆ | orders 1,2,1,1, versus triality order 6 | actual SO factors and rank bound necessary | none |
| §0.1 equalizer definition | H=k, H=k[t,t⁻¹], GL₂; zero base ring | equalizer k, full Laurent ring; entry values 3≠2 under swap; over zero ring both maps 0 | real body determines object | import repaired |
| §0.1 API: all coefficient algebras | G_m over ℚ[ε]/ε²; GL₂ diagonal | conjugation sends 1+ε to 1+ε; GL₂ entry 2→3 | nonreduced tests included | none |
| §0.1 API: subalgebra | GL₂ trace and determinant at diag(2,3), swap | trace 5=5, determinant 6=6, product 30=30, scalar 7=7 | sums/products/scalars invariant | none |
| §0.1 API: pullback and composition | G_m→GL₂, t=2; compose identity | tr pulls back to t+t⁻¹=5/2, det to 1; identity leaves 5/2 | contravariant algebra map correct | none |
| §0.1 API: cocommutativity | trivial group; G_m; G_a | equalizers k, k[t,t⁻¹], k[t] | commutative groups give whole algebra | none |
| §0.1 API: flat base change | ℚ→ℚ(i), G_m; ℤ→ℤ/2 not flat | ℚ(i)⊗ℚ[t,t⁻¹]=ℚ(i)[t,t⁻¹] on both sides; sign-action invariants ℤ[x²] reduce to 𝔽₂[x²]⊊𝔽₂[x] | flatness not replaceable by arbitrary reduction | none |
| Supplied geometric quotient and classification | GL₂ identity/unipotent; SL₁(D); G_a | quotient (2,1)=(2,1), matrix ranks of x−1 are 0,1; reduced trace 5/2 has roots 2,1/2 and no lift in D; G_a class 1≠0 | semisimple classes and rational lifts distinguished | import ArithmeticGaloisRepresentations §1.11; delete duplicate Lean targets |
| §0.3 group restriction | G_m; GL₂; SL₂→PGL₂; anisotropic torus | Laurent ring; k[s,d,d⁻¹]; (a+a⁻¹)²−2=a²+a⁻², ±5/2↦17/4; char 2 gives s²; torus W=1 | all characteristics, full character lattice | retain stronger nonsplit variant |
| §0.3 character spanning route | SL₂ in characteristic 2, highest weight 2 | simple character t²+t⁻²; Weyl character t²+1+t⁻²; difference 1 | simple and Weyl characters distinct, both triangular | supplier wording clarified |
| §0.5 trace separation | G_m points 2,1/2; weight-one line; zero comodule; SL₂ | faithful diag representation gives traces 5/2=5/2; weight-one gives 2≠1/2; zero traces 0=0; SL₂ traces 3=3 on swapped diagonal | all comodules required; iff both directions | no signature change |
| §0.6 finite quotient map | G_m→GL₂; SL₂⊂GL₂; identity; trivial→GL₀ | t satisfies t²−st+1=0; fibres {2,1/2}; s↦(s,1); identity degree 1; point→point | finite, may be degree 2 | no signature change |
| §0.6 arbitrary affine target | T⊂upper Borel B⊂GL₂ | C(B)=O(T), restricted quotient map identity; matrix coefficients still give t²−st+1 for inverse-pair representation | H need not be reductive | retained generality |
| §0.7 definitions of Out′, Conj′, Aut′ | SO₈ generic t; repeated eigenvalue 1; identity | improper reflection changes one signed Weyl orbit, paired by order-2 action; eigenvalue-1 eigenspace admits determinant −1 centralizer, so orbit already equal; identity fixed | finite quotient and automorphism inverse image determined | none |
| §0.7 API: selected factor count | SO₈×SO₁₀; GL₃ | 2×2=4 and 1 | independent factors, Galois permutes them | none |
| §0.7 API: inner action trivial | GL₂, diag(2,3), swap | (tr,det)=(5,6) on both | action factors through outer group | none |
| §0.7 API: finite categorical quotient | regular SO₈ torus point and its reflection | orbit sizes 2, quotient fibre 1; invariant values agree on the pair | categorical orbit quotient | none |
| §0.7 API: field extension | SO₈ over ℚ→ℂ; Spin₈ | outer subgroup orders 2→2 and 1→1 | no enlargement to triality | none |
| §0.7 API: Aut′ membership | SO₈ improper reflection; GL₃ transpose-inverse | outer images 1 in selected C₂, versus nontrivial image outside selected 1 | reflection included, transpose-inverse excluded | none |
| §1.1 Jordan covering | S₃/C₂, Q₈/⟨i⟩, C₃; GL₂(ℂ)/B | S₃ fixed cosets 3,1,0 by cycle type, average (3+3)/6=1; Q₈ class {±j} missed; C₃ singletons; dim B=3<4 although every matrix triangularizable | finite hypothesis necessary | none |
| §1.2(a) number-field descent | ℚ; ℚ(i); ℚ(∛2); ℓ=0,1 | finranks 1,2,3; x²+1 has no root mod 3; cubes mod 7 are 0,1,6 so no root 2; 0,1 nonprime | only ℚ meets almost-every-prime hypothesis | no lost binder |
| §1.2(b) fixed point descent | sextic (2,17,34) at 2,3,5,7,17; old (2,3,6) | 17≡1 mod8; 34≡1 mod3; 34≡4 mod5; 2≡3² mod7; 2≡6² mod17; old polynomial has no Q₂ or Q₃ root | local nonemptiness is weaker than rationality of one point | accepted repair preserved |
| §1.3 finite-fibre algebraicity | fibre over (5/2,1); s=0; Spec ℚ→Spec ℚ; empty fibre | points 2,1/2, count 2≤2; roots ±i; one ℚ-point even though ℚ̄ cannot embed in ℚ; 0≤0 empty | only residue field embeds in Ω | none |
| §1.4 inner quotient identification | GL₂ and D×; U(1) versus G_m; composite inner twists | (reduced trace,norm)=(s,d) on each; unit groups ℚ× versus ℚ×·t^ℤ; Int(a)Int(b)=Int(ab) acts identically on quotient | inner, not arbitrary forms | none |
| §1.5 diagonal injection | F=ℚ; quadratic F, ν=id,t²,1 | identity; diagonal G_m; G_m×μ₂ has 2 components; ν=1 gives Res SL₂ with quotient traces (s₁,s₂), diagonal image s₁=s₂ | trivial multiplier not extension by G_m | proof corrected |
| §1.5 conjugator direction | h=diag(2,1), x=1+E₁₂ | h⁻¹xh=1+(1/2)E₁₂ versus hxh⁻¹=1+2E₁₂ | projected orientation consistent | accepted convention preserved |
| §1.6 central product | SL₂×G_m/μ₂; SL₂→PGL₂; centre 1 | [A,t]↦tA, trace inclusion s↦(s,1); ±5/2 collide at 17/4 in PGL₂; centre 1 gives (x,1); equality second coordinate z⁻¹=1 forces z=1 | antidiagonal and extra torus essential | none |
| §2.0 localization map | split torus, imaginary norm-one torus, cubic local norm-one torus | zero→zero→zero; (1∞,1₃) sums 0, singleton 1∞ sums 1; cubic 1+2=0 | exactness at middle, no surjectivity claim | owned here |
| §2.0 API: finite support and zero sum | norm-one ℚ(i), rational class of −1 | real sign 1; at 2 norm obstruction 1; sum 1+1=0, other components 0 | finite-support global localization | added |
| §2.0 API: lifts differ by kernel | T=G_m | unique zero tuple, lifts group 0, difference 0 | no claimed injectivity for general torus | added |
| §2.0 API: functoriality | square on norm-one quadratic torus | local invariant 1↦2=0 in ℤ/2, global sum also doubles to 0 | maps of lattices commute | added |
| §2.1 real class lift | G_m; norm-one ℚ(i); split real T | 0 lifts to 0; nontrivial real class plus inert-prime class 1+1=0; split real H¹=0 | avoid any finite set by Chebotarev | replaced missing supplier |
| §2.1a centralizer openness | GL₂ diagonal 1,2; scalar 1; real polynomial X²+1; trivial torus | differential E₁₂↦E₁₂, E₂₁↦−E₂₁; scalar factors 0; discriminants 1 versus −4; torus differential id on dimension 0 | root values nonzero exactly where argument applies | owned local input |
| §2.2 Harder | S=S′=∅; torus; GL₂, p=5 | unique maximal torus for a torus; trivial group torus rank 0; ℚ(i) is imaginary and −1≡2² mod5, giving elliptic real and split 5-adic torus | all finite and infinite places, rational local conjugators | no signature change |
| §2.3 elliptic global torus | GL₂, G_m, Res ℚ(i) SL₂ | quotient split ranks 0,0,1 respectively | existence of real elliptic torus needed | none |
| §2.4 real Weyl cocycle | w=1; SO₂ in SL₂; GL₃ torus type ℂ××ℝ× | a=1; diag(i,−i) gives a=−I, a c(a)=I; (13) conjugates by c=(12) to (23), so torus condition fails without anisotropy | hypotheses and direction agree | none |
| §2.4 API: lies in torus | compact SL₂ normalizer | a=−I, torus coordinate −1 | Weyl images w⁻¹c(w)=1 | none |
| §2.4 API: change n→nt | t complex coordinate 2 | cocycle changes −1→−1/4; ratio 1/4=t⁻¹c(t) | same H¹ class | none |
| §2.4 API: identity Weyl element | n=1 | a=1, class 0 | normalized | none |
| §2.4 API: image in H¹(G_sc) | n=diag(i,−i) | a=n⁻¹c(n)=−I; same expression is an explicit coboundary in SL₂ | image 0 | none |
| §2.4 API: cocharacter action | compact GL₂ torus split over ℂ; Weyl swap | (−1,0)↦(0,−1); at 2, (1/2,1)↦(1,1/2) | cohomological transport | corrected witness |
| §2.5 global adjustment | w=1; compact GL₂ case; local trivialization | g=1, T′=T; c(gt⁻¹n⁻¹)=gt⁻¹n⁻¹; Int(g)μ=Int(u)wμ; σ(gt_p⁻¹)=gt_p⁻¹ | maps have required rational/real domains | cocharacter Check corrected |
| §3.1 Serre definition | G_m, norm-one imaginary/real quadratic, CM degree 2d | fixed dimensions (1,1),(0,0),(1,0),(d,1) for c and Γ | first two qualify, latter two fail when d>1 | none |
| §3.1 API: fixed-space equality | norm-one ℚ(√3) | c-fixed dimension 1 versus Γ-fixed 0, ranks 1≠0 | iff reflects inclusion of fixed spaces | none |
| §3.1 API: compact subtorus descent | G_m×U(1) | c eigenvalues 1,−1; T_c=U(1), quotient G_m | descended compact part and split quotient | none |
| §3.1 API: products | split rank 1 × real norm-one | fixed dimensions c:2, Γ:1 | product fails iff a factor fails | none |
| §3.1 API: isogeny invariance | square isogeny of U(1) | lattice 2ℤ⊂ℤ, both rationalized c=−1 | no change of Serre condition | none |
| §3.1 API: χ+cχ | G_m×U(1), χ=(a,b) | cχ=(a,−b); sum=(2a,0) | rational, trivial on compact part | none |
| §3.2 prime-unit definition | G_m over ℚ, l=5; q=3; upper unipotent entry 1/3 | ±5^n; 3^{-n} unbounded at 3; unipotent powers entry n/3 with 3-adic norm≤3 | finite places and two-sided cyclic subgroup | none |
| §3.2 API: character criterion | split 2-torus point (5,1/5) | at every q≠5, valuations (0,0); at 5, (1,−1) permitted | all geometric characters have zero valuations away from l | none |
| §3.2 API: morphisms and closed reflection | t↦diag(t,t⁻¹), t=3 | eigenvalue valuations at 3:1,−1, so both source and image fail 5-unit condition | closed immersion reflects compactness | none |
| §3.2 API: powers and identity | γ=5, exponents 0,−1,2 | values 1,1/5,25; away-5 valuations 0,0,0 | closure under all integer powers | none |
| §3.2 API: conjugation | upper unipotent a with swap | aⁿ upper entry n/3; conjugate lower entry n/3 | identical compactness bounds | none |
| §3.2 API: commuting products only | diagonal 5 and 1/5; a=1+E₁₂/3, b=1+E₂₁/3 | diagonal product 1; tr(ab)=19/9 has v₃=−2 | noncommuting product fails | none |
| §3.3 prime-Weil definition and field independence | 5,1/5,(2+i)/(2−i),2+√3; ramified extensions | weights 2,−2,0; last moduli 2±√3 unequal; v_w=e v_v preserves zero | nonintegral at l allowed; field independent | none |
| §3.3 API: unique weight | l≥2, value 1; junk q=1, α=0 | l^{w/2}=1 forces w=0; 1^{w/2}=1 for every w; 0 has modulus 0 | prime and nonzero hypotheses exclude junk | none |
| §3.3 API: Galois conjugation | (3+4i)/5 | conjugate (3−4i)/5, both modulus 1 and product 1 | weight 0 unchanged | none |
| §3.3 API: products and inverses | l·l⁻¹; l² | 1 of weight 0=2+(−2); l² weight 4; inverse weight −2 | weights add | none |
| §3.3 API: roots of unity | −1 and i | modulus 1, all finite valuations 0 | weight 0 for every prime | none |
| §3.4 Weil-point definition | diag(5,1); 1+E₁₂; 1; scalar 3 with l=5 | weights (2,0); (0,0) but nonsemisimple; all zero; v₃(3)=1 | semisimplicity independent | none |
| §3.4 API: representation independence | G_m, t=5, weights 1,−1,2 | eigenvalues 5,1/5,25, weights 2,−2,4 | tensor/dual/subquotient values agree | none |
| §3.4 API: morphisms and reflection | G_m→GL₂ inverse pair, t=3 or5 | at l=5: 3,1/3 fail; 5,1/5 have weights ±2 | source and faithful image agree | none |
| §3.4 API: powers | diag(5,1), exponents −1,0,2 | weights (−2,0),(0,0),(4,0) | multiply weights by exponent | none |
| §3.4 API: conjugation | diag(5,1), swap | spectra {5,1} on both sides | unchanged | none |
| §3.4 API: torus characters | U(1), x=(3+4i)/5 | χ_n(x)=x^n, modulus1, weights0; character −1 inverse | equivalence with all characters | none |
| §3.5 cyclic-closure comparison | 1,−1,diag(2,4), nontrivial unipotent, norm-one ℚ(i) | closures 1,μ₂,diag(t,t²),G_a,U(1); geometric characters 0,ℤ/2,ℤ; anisotropic lattice c=−1 | semisimple and geometric diagonalizability essential | none |
| §3.5 uniform power and restriction of scalars | L=ℚ(i), m=4; √2 over ℚ(√2) | x^4 torsion-free for x∈L×; eigenvalues ±√2 under restriction have ratio −1 of order2 | one exponent kills torsion; neatness differs after restriction | none |
| §3.6 Serre-unit criterion | ±5^n; x=(3+4i)/5; 2+√3 | weights 2n; x weight0 and 5-unit; last all finite valuations0 but moduli unequal | iff and required Serre condition | none |
| §3.7 density of neat Weil points | G_m; U(1), l=3 inert versus l=5 split | {5^{4n}} infinite; norm1 at inert place gives2v=0 and only roots ±1,±i; x=(3+4i)/5 infinite order since not among those4 | split hypothesis excludes finite subgroup | none |
| §3.8 finite-automorphism rigidity | dual numbers over ℚ; doubled line; G_m inversion | ε↦2ε differs on ε but point value0=0; two origins swapped despite same punctured points; at2 inversion gives1/2≠2 | reduced and separated necessary, finite type unnecessary | preserved source correction |
| §4.1 common-source conjugacy | GL_n; SO₈; Sp₄ centralizer of diag(−1,1,−1,1) | Out′ order1 versus2; centralizer root type A₁×A₁, dimension6, not a C₂ Levi | Aut′ sharp; reductive centralizer suffices | source route preserved |
| §4.1 torus-fixing automorphism deduction | SL₂ conjugation diag(2,1/2); torus J=U | fixes diagonal values, root parameter x↦4x; torus fixing itself pointwise gives id | deduction uses pinning scalars, not a supplied theorem | F03 applied; own API |
| §4.2 local Galois invariance | trivial orbit; quadratic orbit; cubic mod5 and7 | orbit sizes1,2,3; quadratic split density1/2; mod5 factor (X−3)(X²+3X+4), discriminant3 nonsquare; mod7 no root2 | almost all places essential | none |
| §4.3 stable embedding theorem and application | Res E G_m→GL₂; split G_m²→D× | regular representation rational; second impossible since ℚ×ℚ has nontrivial idempotent and D has none | quasi-splitness necessary; marking retained | missing supplier target owned here |
| §4.4 torus transfer | D ramified {p,∞}, split versus imaginary E inert at p; identity twist | split local algebra ℚ_v² cannot embed at ramified places; E_v fields there do embed; norm lattice has anisotropic real rank0; identity transfer T*=T | every completion required | none |
| §4.5 common realization tori | I=T regular δ; SL₂(ℝ) with compact Cartan | centralizer is T, dimension rankG; SO₂ compact but SL₂ real split rank1 | compactness modulo ambient centre stronger than compact Cartan | none |
| §4.6 odd unitary Hasse | d=1, odd n; d=3 at real place; d even in F=F⁺E; norm scalar | T₁≅Res E G_m gives Sha0; real signs {±1}³ modulo the diagonal have 8/2=4 classes; even-degree parity group order2 versus odd/odd order1; a²=N(a) | Sha vanishing distinct from H¹ vanishing; full CM action retained | explicit character-lattice route and real witness |
| §5.1 realization conventions and supplied factorization | CM/non-CM elliptic; g=0; z=2 | MT=Res K G_m/GL₂; common extension K/E; h(2)=1/2 id, ν=1/4; scalar ν=4; g0 ν=1 | all primes including polarization divisors use rational inverse pairing | supplied construction, retained normalization |
| Supplied comparison torsor | same fibre; p→pg; three fibres | p=id gives trivial torsor; group map changes by Int(g), quotient unchanged; (p₃₂p₂₁)g(p₃₂p₂₁)⁻¹ equals composition | no rational point in general | delete separate target; use Motives §6.8 and ShimuraVarieties §7.0i.1 |
| §5.3a same-derived building/fixer | id; diagonal G_m→G_m²; SL₂→GL₂; ramified norm-one torus | r↦(r,r); unit intersection O×; SL₂(K)∩GL₂(O)=SL₂(O); uniformizer translation (−1,−1); torus full/connected index2 | pointwise intersection not arbitrary connected-model intersection | missing interface owned here |
| §5.4 auxiliary construction | F=ℚ; GL₂ with quadratic F, also ramified local F; residue extension | H=G; dimensions H′=8,H=7,derived=6; multiplier lattice (a,b), a=b so ℤ coinvariants; q→q^m changes Frobenius power | preserve q and distinguish H,H′ | integral splitting route made explicit |
| §5.5 unique rational class | injective j=id on torus; inverse-pair G_m→GL₂; dual-number fibre | unique δ; noninjective map fibre{2,1/2}; Spec ℚ[ε]/ε² has one geometric point and reduction Specℚ | only reduction asserted rational; no field-size substitute | supplied class classification used |
| §5.6 real lifting | G_m ν=t²; unipotent; elliptic versus split GL₂ torus | x²=r² and abs(x)=r give x=±r; (1+E₁₂)^n upper entry n; diag(i,−i) has no real diagonal lift but rotation matrix is real | choose semisimple lift, restore scalar exactly | none |
| §5.6 character identity | χ of scalar degree m on elliptic torus | (χ+cχ)(w_s(z))=z^{2m}=(mν)(w_s(z)); on normalized t₀, conjugate(1/χ(t₀))=χ(t₀) | anisotropic quotient excludes extra invariant character | none |
| §5.7 real elliptic Frobenius | elliptic q=5,a=2; q=4,a=±4; CM case | eigenvalues1±2i; repeated root±2 gives scalar±2, ν=4; CM π∈K×; all ν=q>0 | central repeated-root case still elliptic | none |
| §5.7a relative obstruction | GL_n; elliptic SL₂; PGL₂ involution | local characters1; two signs(−1)(−1)=1 versus single−1; PGL₂ involution has 2 centralizer components | simply connected derived hypothesis used | relative target owned here |
| §5.7a API: independence of choices | same local tuple, conjugator changed by centralizer | invariant ratio0, obstruction ratio1 | dual centre inner identification fixes target | added |
| §5.7a API: vanishing criterion | rational tuple γ_v=γ* | obstruction1, rational representative γ* | true in identity-twist witness | added |
| §5.7a API: local replacement formula | SL₂ local nontrivial invariant, twice | obstruction factor−1; two replacements factor1 | positive/inverse conventions paired consistently | added |
| §5.8 one-prime rational realization | GL_n; SL₂ elliptic; identity and unipotent at distinct places | GL_n obstruction1; SL₂ signs cancel only in pairs; ranks(γ−1) are0,1 | arbitrary quotient lifts cannot be patched | explicit semisimplicity + negative Check |
| §5.9 rational Frobenius | q=5,a=2; q=4,a=4 | companion [[0,−5],[1,2]], det5,tr2, discriminant−16; scalar2I has minimal polynomial X−2, companion of(X−2)² has minimal polynomial(X−2)² | choose semisimple rational matrix; GL₂ needs no exceptional prime | none |
| Worked examples and Layer 0 rank zero | GL₀; G_m inverse pair; SL₁(D) | GL₀ polynomial1, quotient point; inverse-pair polynomial X²−(5/2)X+1 at2,1/2; trace5/2 no D lift | no natural subtraction at n=0 used | rank-zero convention retained |
| Good-reduction specialization supplier | elliptic curve at good p=5, ℓ=3; p-primary supersingular fibre | 3^r-torsion has 3^{2r} points generically and specially; supersingular E[5](𝔽̄₅) has 1 point, not 25 | comparison used only for ℓ≠p | explicit NeronModels supplier |
| §1.2 ramified negative control | ℚ(∛2) at 2 | residue degree1, but 3v₂(α)=1 would force v₂(α)=1/3 outside ℤ | residue degree1 alone not a local embedding at ramified primes | explicit Check |
| §3.8 empty cases | W=∅; S empty | dense Γ in nonempty irreducible S is nonempty, but no w exists; empty S has no IrreducibleSpace instance | antecedent impossible | none |
| §5.3a API: injectivity and equivariance | diagonal G_m, unit versus uniformizer | r↦(r,r); shift by −1 goes to (−1,−1), unit shift0 goes to(0,0) | injective action comparison | explicit API |
| §5.3a API: reduced map and special points | SL₂→GL₂, standard vertices | common reduced tree, vertex distance0 maps to0; enlarged GL₂ adds one central real line | reduced identification and specialness | explicit API |
| §5.3a API: fixedness and translation choice | G_m→G_m², central translate(2,3) | unit fixes(2,3); uniformizer sends it to(1,2), different | fixedness unaffected by central choice | explicit API |


Pull request: #2131 (roadmap/reductive-groups-part-iii at a4abdea)
