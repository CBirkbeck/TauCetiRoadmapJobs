# Review of ClassicalAdicEtaleCohomology (pull request #875 at dfcb6b7)

**Verdict:** needs changes

## R01 (P1) — Clear the failing dependency gate without reversing supply

**Location:** `TauCetiRoadmap/ClassicalAdicEtaleCohomology/README.md:40`: “tropical geometry, which consumes them”; also lines 3652, 3680, 3751 and 4070. **Claim:** the submitted dependency input passes the supplier-order gate. It does not: the worker reports two upward edges and one cycle. This finding records the mandatory gate failure; the apparent tropical cycle is not a mathematical cycle.

**Witness:** `depcheck=3`, with `CYCLE among: ClassicalAdicEtaleCohomology, TropicalAndBerkovichArithmetic`. The latter roadmap's README lines 130–133 explicitly imports this roadmap's §§3.1 and 3.7.

The tropical edge is reversed by the scanner: line 40 identifies a consumer. The AlgebraicCurves diagnostic also requires qualification: `TauCetiRoadmap/AlgebraicCurves/README.md:1085` exists on main, so it is an eligible supplier under this review's main-branch exception; its open revision is not the dependency. Its Layer 12 supplies field-level curve theory, not the relative formal compactification theorem itself.

**Repair:** keep the tropical consumer citation in “Downstream consumers” and remove the redundant named citation from line 40. Have the worker resolve the four AlgebraicCurves citations to Layer 12 on main, rather than treating its open revision's position as a new prerequisite, and rerun the gate. Do not move this roadmap after either consumer or re-plan the supplied theory. On a scratch copy, the first change removes the tropical UPWARD and CYCLE diagnostics; only the AlgebraicCurves diagnostic remains. Recognition of that eligible main supplier requires correction of the gate's input/resolution by the worker; no change to tooling or merge order was made in this review. Acceptance remains unavailable while the gate reports failure.

## R02 (P2) — Specify the empty bounded-lattice join

**Location:** `TauCetiRoadmap/ClassicalAdicEtaleCohomology/README.md:1337`, “the sum of finitely many bounded lattices”; the same assertion appears at line 1343.

**Claim:** finite ambient lattice sums define an operation valued in L_m(T), without a nonemptiness hypothesis.

**Witness:** at a geometric point, take T=ℤ_p and m=0. Then L₀(T)={ℤ_p}, whereas the sum of the empty family is 0 and ℤ_p⊄0. Thus the stated operation leaves its claimed moduli space.

**Repair:** either restrict ambient sums to nonempty finite families, or define the finite join as pᵐT + ΣᵢLᵢ, explicitly saying that the empty join in the bounded interval is pᵐT. Add this negative-control Check. The repaired join is ℤ_p for the refuting m=0 empty family; for m=1 it is pℤ_p on the empty family and p⁻¹ℤ_p on {pℤ_p,p⁻¹ℤ_p}. Rank zero gives 0 in both conventions. KedlayaLiu lines 868–875 give the bounded-poset universal property; that property selects its bottom on an empty family, not the ambient zero submodule. No source error is inferred from that universal property.

## R03 (P2) — Include the statable finite-condition transfer theorem

**Location:** `TauCetiRoadmap/ClassicalAdicEtaleCohomology/README.md:4098`, “State this finite existential fragment on Mathlib's polynomial and valuation carriers”; `TauCetiRoadmap/ClassicalAdicEtaleCohomology/Suggested.lean:10` lists only three statable deep inputs.

**Claim:** the acceptance test contains the deep results that can be stated at the pins. The quantifier-elimination input used to prove section lifting is missing, although its native carriers are available.

**Witness:** a scratch theorem using `MvPolynomial (Fin n) K`, `Valuation K Γ₀`, `Valuation.IsNontrivial`, two algebraically closed fields and a valuation-preserving field embedding elaborated successfully, with only `sorry`.

**Repair:** add `aic_valuation_finite_conditions_transfer` in the Layer 9 section, using finite families of equations, weak inequalities and strict inequalities. For an embedding ι:K→L require, for all a,b, w(ιa)≤w(ιb) iff v(a)≤v(b), and nontriviality of both valuations. State the equivalence between existence of a tuple x over K satisfying those three finite families and existence of a tuple y over L satisfying their images under ι. This is a short statement on native carriers, without a new site, opaque construction or free condition field. The scratch signature also retains every field, valuation and compatibility binder under `#check`.

The repaired signature admits the identity embedding, where x=0 solves x=0 on both sides, and rejects 1=0 on both sides. It excludes the invalid trivial-to-nontrivial extension: ∃x, 0<v(x)<1 is false in the trivial valuation and true in a nontrivial valued extension. Keep the field-valued section-lifting case separately, as the README already does.

## R04 (P3) — Replace undeclared API-name catalogues with prose

**Location:** `TauCetiRoadmap/ClassicalAdicEtaleCohomology/README.md:87`, “Other Lean names in this document specify mathematical targets”; examples at lines 196–208 and 1341–1345. `Suggested.lean:48` begins the namespace without the required layer sections.

**Claim:** backticked names of this roadmap denote declarations in its acceptance test. The README instead contains 206 `Provide` paragraphs with semicolon-separated declaration catalogues, while the Lean file has one definition and three theorems. For example, `PreadicSpace.BoundedLattice.sup` is not declared there. The quoted exception contradicts the required README/Lean naming contract. The supplier table at lines 21–38 also has code-quoted pipe delimiters and does not render as a Markdown table.

**Witness:** the complete declaration inventory is `ValuationSpectrum.zariskiRiemannLocus`, `ValuationSpectrum.zariskiRiemann_cohomology_eq_zero`, `aic_valuation_section_lift`, and `field_cohomological_dimension_transcendence`.

**Repair:** turn the auxiliary API catalogues into prose bullets, preserving their hypotheses and mathematical content; reserve own backticked names for actual kept declarations. Delete the line-87 exception, repair the table delimiters, and add Layer 2, 9 and 11 section comments to the Lean file. Do not add hundreds of API or Check declarations to Suggested.lean. Applied to the witness, the prose can say “Nonempty finite sums commute with pullback,” with R02's convention, without claiming a Lean declaration exists. This leaves the acceptance-test inventory small and reviewable.

## Verified sound

The checkout head is the requested commit. The outside-folder diff is empty, and the worktree was left unchanged. No source material, probe, manifest update or report was placed in the pull-request folder. There is no previous AI review to reconcile.

**Gate and elaboration.** The worker's text, import, stray-file, outside-folder and targeted-build checks pass; its dependency check fails. Both individual Tau Ceti imports were built before directly elaborating Suggested.lean. Direct elaboration succeeds with only the three `sorry` warnings. A scratch copy containing `#check @name` for all four declarations also succeeds: separable closedness, torsion, positivity, valuation-domain assumptions, algebraic closedness of the fraction field, finite type, flatness, primality and the coefficient-universe parameter all remain in their intended signatures. Nothing was changed in the submitted file.

Each of the three sorried theorems was tried separately in full-file scratch copies with `simp`, `rfl` and `infer_instance`: none closed. Object searches and inspection at the pins did not identify a single library theorem supplying any of these three results. Thus this review found no padding among the existing three admissions. There are no sorry-valued data definitions, arbitrary condition fields, `set_option`, admitted examples or extra imports.

The required dependency command, with `--movable`, returned the following output on the final run. The graph count can change as the board index changes; the three diagnostics agree with the worker's gate:

```text
not movable: ClassicalAdicEtaleCohomology consumes TropicalAndBerkovichArithmetic (#266) and is consumed by AnalyticToricGeometryPartII (#157), which comes first: moving ClassicalAdicEtaleCohomology after TropicalAndBerkovichArithmetic would put a supplier after a consumer, a cycle through ClassicalAdicEtaleCohomology
UPWARD: ClassicalAdicEtaleCohomology (#59) -> AlgebraicCurves (#262) at README lines [3652, 3680, 3751, 4070]
UPWARD: ClassicalAdicEtaleCohomology (#59) -> TropicalAndBerkovichArithmetic (#266) at README lines [40]
CYCLE among: ClassicalAdicEtaleCohomology, TropicalAndBerkovichArithmetic
depcheck: 159 roadmaps, 1124 edges, 3 problem(s)
```

**Seeded source audit.** All 15 requested sections were examined. The source service was used for all 48 referenced non-Stacks works, six additional body-only works, two errata sheets and 46 Stacks tags. Fetching is not certification. The table distinguishes text verified at a locator from a primary text that remained inaccessible; an alternative proof or a matching example does not certify an unread Huber theorem. No additional README locator was marked “unverified.” Source IDs below are the service IDs; line numbers are those in its extractions. Stacks tags, rather than changing chapter numbering, identify the statements.

| Target | Text inspected and hypotheses | Outcome |
|---|---|---|
| 1.1 | Stacks 03F3, 072W, 072Z, 0730: restriction, sheafified higher direct image and flatness for ringed-topos pullback; Stacks03F3 lines 290–299; Stacks072W lines 343–356; Stacks072Z lines 941–953; Stacks0730 lines 957–960. | Fixed coefficients and the flatness qualification are retained. These generic statements do not by themselves construct the analytic site. |
| 1.2 | ScholzeECD lines 4471–4479, Remark 19.3, pp.108–109. | Supports the role of pseudo-adic closed complements, not the complete support-site equivalence. Huber §§2.3 and 1.7 remain uncertified. |
| 2.6 | Cesnavicius lines 346–410, Theorem 4.10 and its proof/footnotes, pp.9–11. | The p-torsion-free perfectoid domain, normalized Noetherian models, henselized generic rings and finite commutative p-primary coefficients match. The argument does not apply Noetherian comparison directly to R. |
| 3.2 | ZavyalovPoincare lines 4133–4172, Theorem A.15, Definition A.17 and Lemmas A.18–A.19, pp.87–88. | Taut rigid domain, overconvergence, essential image and partially proper support comparison match; arbitrary adic sheaves are not identified with Berkovich sheaves. |
| 3.4 | KedlayaLiu lines 848–875 and 6558–6609, Remark 1.4.7, Lemmas 8.4.1–8.4.2, Definition 8.4.3, Proposition 8.4.6 and Corollary 8.4.7, pp.21–22,167–168. | Encircling localizations, preadic descent and local rather than global lattices match. The empty-sum wording needs R02. |
| 4.1 | Stacks 039R, Theorem 41.15.2, nilpotent étale invariance. | Supports lifting across successive nilpotent thickenings. The full type-(S) formal assertion also cites BerkovichVanishing1994 p.542 and Huber p.201, which could not be read here. |
| 4.3 | Huber Theorems 3.5.7–3.5.9 and related henselian inputs, pp.203–207; inspected the roadmap's strict-local system and supported stalk formulas. | Primary text unavailable. The full strict-local comparison is not source-certified; the disc/tube distinction is tested below. |
| 6.2 | HirokiKato lines 579–605 and 689–709, Definitions 3.3–3.4 and Construction 4.2, pp.14,17; Stacks 09XP/0A45. | Closed constructible support and ordinary supported RΓ are retained. Compact support needs the separately stated boundary localization. The rank-two intermediate-point counterexample computes Λ→0. |
| 6.4 | Huber Corollaries 4.2.8–4.2.9, pp.245–246. | Uncertified primary text. Finite presentation versus finite boundary/rank and finite generation versus finite cardinality are distinguished correctly in the tested cases. |
| 7.2 | ScholzePerfectoid lines 1786–1817, Lemma 6.13, p.37, and lines 2120–2147, Definition 7.14/Corollary 7.18, p.44; ScholzeECD lines 3790–3826, Lemma 16.3, pp.92–93. | The source's characteristic-p and K°-algebra restrictions are explicitly distinguished from the roadmap's proposed higher-rank approximation. The latter is a target with additional supplier inputs, not a verbatim application of Lemma 6.13. |
| 8.1 | ZavyalovFoundations Theorem 9.4 and proof, pp.28–29, lines 1180 onward. | Its comparison domain is separated, taut, locally +weakly finite type. The roadmap limits arbitrary base-change stability of compactifiability to qc maps. Huber's full definitions remain uncertified. |
| 8.2 | ZavyalovFoundations Lemma 9.1, pp.23–25; LiReineckeZavyalov lines 1630–1715, Lemma 4.1.5, Proposition 4.1.6 and Lemma 4.1.7, pp.30–32. | Proper compactification amplitude input and the stated O_C curve algebraization/semistable steps have matching scopes. Historical DVR approximation and reduced-fibre proofs in the scanned sources remain unverified. |
| 8.4 | ZavyalovFoundations lines 966–1240, Lemmas 9.1–9.2 and Proposition 9.3, pp.23–28. | All-torsion proper amplitude and proper–étale exchange are distinct from arbitrary base change requiring plus-ring invertibility. The projection route does not assume all coefficient complexes have finite Tor amplitude. |
| 10.4 | Berkovich1993 Theorem 6.4.1, p.125, lines 4474–4495; Remark 6.4.2, p.127, lines 4557–4567; Theorem 6.3.5, p.121, lines 4335–4345; Remark 6.2.10, p.118, lines 4225–4230. | Prime-to-residue ordinary disc/annulus assertions and the p-primary counterexamples match. Closed-disc Huber proper supports must be deduced using the roadmap's analytic duality; Berkovich compact supports of the compact disc do not give that statement directly. |
| 11.3 | ScholzeECD lines 6584–6690, Theorem 25.1, Remark 25.2 and proof, pp.158–160; the curve compactification input above. | Rank-one base, finite frontier contributions, global cone vanishing and the higher-rank warning match. No stalkwise isomorphism at frontier points is claimed. |

**Pinned objects and duplication.** Mathlib is pinned at `6b7abb3c7686292736be2955bd3eb9ebf63b456a`; Tau Ceti at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The following definitions were opened, rather than inferred from names:

| Declaration | File at the pin | Scope checked |
|---|---|---|
| `TauCeti.ValuationSpectrum` | `TauCeti/AlgebraicGeometry/AdicSpace/ValuationSpectrum/Basic.lean:73` | A valuative relation; no rank-one restriction. |
| `basicOpen`, `instTopologicalSpace` | same file, lines 108,148 | v(f)≤v(s) with nonzero denominator; topology generated by those opens. |
| `ValuativeRel.vlt` | `Mathlib/RingTheory/Valuation/ValuativeRel/Basic.lean:110` | Negation of the reverse weak comparison, with totality in the underlying structure. |
| `constantSheaf` | `Mathlib/CategoryTheory/Sites/ConstantSheaf.lean:64` | Sheafification, not the unmodified constant presheaf. |
| `CategoryTheory.Sheaf.H` | `Mathlib/CategoryTheory/Sites/SheafCohomology/Basic.lean:56` | Ext from the constant integer sheaf. |
| `ValuationRing` | `Mathlib/RingTheory/Valuation/ValuationRing.lean:64` | Domain and total divisibility; neither discreteness nor finite rank. |
| `Valuation.IsNontrivial` | `Mathlib/RingTheory/Valuation/Basic.lean:591` | Some value differs from both 0 and 1. |
| `Field.absoluteGaloisGroup` | `Mathlib/FieldTheory/AbsoluteGaloisGroup.lean:42` | Automorphisms of the algebraic closure with Krull topology. |
| `Algebra.trdeg` | `Mathlib/RingTheory/AlgebraicIndependent/Basic.lean:45` | Cardinal-valued transcendence degree. |
| `Cardinal.toENat` | `Mathlib/SetTheory/Cardinal/ENat.lean:192` | Infinite cardinals map to ∞, not 0. |
| `TauCeti.CohomologicalDimensionLE`, `cohomologicalDimensionAt` | `TauCeti/RepresentationTheory/Homological/ContCohomology/CohomologicalDimension/Basic.lean:130`, line 146 | All continuous discrete primary-torsion coefficient modules in the specified universe; least extended-natural bound. |

Object searches covered the pinned libraries, main roadmaps, board packages and the indexed open heads using `roadmaps grep`/`show`, including strict analytic gluing, support sites, formal strict localization, Noetherian perfectoid models, universal compactification, smooth trace and frontier duality. No duplicate fully qualified declaration was identified for the four submitted declarations. Generic sheaf, valuation and cohomological-dimension carriers are imported, while the analytic results require additional constructions.

The supplier inventory contains 676 backticked mentions across 21 recognized roadmap names and the README has 403 `*Needs:*` lines. Fresh `roadmaps resolve` against main `4d14cbd` and the supplied open-head index reports no cross-roadmap citation found nowhere; its library-name portion explicitly lacks pinned packages and was not treated as a library verification. Representative semantic resolutions, also fixing the ownership boundary, are:

| Owner and resolved location | Contract consumed |
|---|---|
| `TauCetiRoadmap/AdicEtaleGeometry/README.md:3261`, 3388, 3708, 3769, 3847 | A1.6 site/basis, all-rank geometric points, conservativity and strict localizations. The roadmap adds coefficient and cohomology statements. |
| same, lines 4019, 6718, 7401, 7676, 7804 | Finite étale Galois category, relative polydiscs, dimension, analytification and formal generic fibres. Finite local-system module adapters use these rather than creating a second fundamental group. |
| `TauCetiRoadmap/AdicSpacesPartII/README.md:7464`, 7793, 8005, 8136, 8186 | R0.19 topology/Pro/topoi and R0.20 ordinary tilde-limits; §1.5 here specializes to supported cohomology. |
| `TauCetiRoadmap/EnhancedDerivedSheaves/README.md:429`, 441, 455, 492 | §§0.1–0.4 enhanced categories, replacements, tensor/Hom and coherence; no analytic exchange theorem is supplied by enhancement alone. |
| `TauCetiRoadmap/EtaleCohomologyFoundations/README.md:57`, 405, 439, 504, 540, 565, 1120 | G.1–G.3 scheme compactifications; finite-presentation descent, algebraic support, proper base change, ULA and traces. These are distinct from analytic compactifications/supports. |
| `TauCetiRoadmap/AlgebraicCurves/README.md:1085`, 1159, 1169, on main | Layer 12's field-level dictionary/comparison; it excludes relative Picard theory. It is not an open-revision dependency. |
| `TauCetiRoadmap/JacobianChallenge/README.md:135`, 143 | Field coherent cohomology/Riemann–Roch/duality and relative proper coherent cohomology; existing algebraic inputs. |
| `TauCetiRoadmap/TropicalAndBerkovichArithmetic/README.md:130`, 851, 2325, supplied open head | Imports this roadmap's strict analytic gluing and algebraically closed Tate quotient; its own comparison and general-field extension are later. |
| `TauCetiRoadmap/ClassicalAdicEtaleCohomologyPartII/README.md:7`, 134, supplied open head | Imports the parent; adds integral/p-primary and Zariski-constructible extensions. It does not own this parent's classical prime-to-residue support theory. |

No undeclared supplier gap was confirmed. The source-dependent relative compactification routes are not certified beyond the read portions. No algorithmic implementation, route-specific restriction to good primes, wholesale re-planning of an existing roadmap, or copied source passage was identified. The claim about source copying is limited to the texts actually readable here.

**Headline inventory.** The deep targets are: strict-local fibres and continuity (§1); henselian and perfectoid scheme–adic comparison and Zariski–Riemann vanishing (§2); local lattices, analytic coverings and rational monodromy (§3); formal completion, inertia-equivariant nearby cycles, coefficient/perverse compatibility and semistable symbols (§4); valuation nearby-cycle exchange, constructibility, ULA and invariance (§§5–6); geometric-field extension invariance (§7); universal compactification, proper-support composition, base change, amplitude and projection (§8); finite-condition transfer, valuation section lifting, normalized traces, arbitrary-rank relative duality and smooth-proper/integral pairings (§9); tame annuli, radial cohomology and smooth-family constructibility (§10); purity, field and analytic cohomological dimension, nonproper algebraic comparison, finite balls/exhaustions and frontier duality (§11).

The module docstring identifies the missing analytic, formal, enhanced-support, Tate-twist and nearby-cycle carriers for the omitted families. The three retained statements use native carriers and agree with their README generality. R03 is the additional deep statement demonstrably statable without those missing carriers. The mathematical probes below are not proofs of the general results, and source-unavailable rows do not certify their locators.

**Adversarial computations (230 rows).** In the table, Λ denotes a nonzero finite coefficient field of characteristic ℓ prime to the indicated residue characteristic unless a different ring is specified. A tuple lists dimensions in successive cohomological degrees starting at zero. “Retain” means the computed instance agrees; it does not infer a theorem from its examples. Empty cases are paired with nonempty or wrong-model controls where relevant.

| Statement | Instances tried | Computed values on the two sides | Result / change |
|---|---|---|---|
| Shift convention | Λ[2], Λ[−2] | H⁻²(Λ[2])=Λ; H²(Λ[−2])=Λ; the opposite degrees give 0. | Retain. |
| Plus-ring invertibility | C=ℂ_p, n=p | p∈C×; p∉O_C×. Field-unit and plus-unit tests give true/false. | Retain separate scopes. |
| Variation composition | U=[[1,1],[0,1]], V=[[1,0],[1,1]] | UV−I=[[1,1],[1,0]]; VU−I=[[0,1],[1,1]]. | Product order retained. |
| 1.1 module sheaves | Geometric point; two disjoint points | Sections M and M²; zero coefficients give 0 in both. | Retain. |
| 1.1 stalk exactness | 0→ℤ→ℤ→ℤ/2→0, first map ×2 | Stalk sequence is the same exact sequence; zero stalk map is not ×2. | Retain. |
| 1.1 restriction/acyclicity | Identity site map, injective I | Restriction I=I; Rⁿid(I)=0 for n>0 on both sides. | Retain. |
| 1.1 fixed-ring pullback | ×2 on ℤ; extension to ℤ/2 | Fixed-ring pullback preserves ×2; tensoring gives ×2=0. | Flatness distinction needed and present. |
| 1.1 direct image | Two-point finite étale map | f* sends M to M²; Rⁿf*=0 for n>0; stalk sum has two factors. | Retain. |
| 1.1 derived sections | Geometric point, M[−1] | H¹=M and other degrees 0, agreeing with derived sections. | Retain. |
| 1.1 Leray | Composition of identity maps | E₂⁰⁰=M; all other entries 0; abutment M. | Retain. |
| 1.2 support topology | S=X, S=∅ | Sh(X,S)=Sh(X), respectively terminal topos; module sections M, respectively 0. | Retain. |
| 1.2 open support | Two-point X, one-point U | Restriction (M,N)↦M; extension by zero M↦(M,0). | Retain. |
| 1.2 all-rank fibre | Two-point specialization chain η→s | Γ(F)=F_s; for j!Λ, stalks (Λ,0), hence Γ=0; Γ(η,Λ)=Λ. | Retain full support. |
| 1.2 extension by zero | Same chain, constant Λ | j!Λ→Λ→i*Λ has stalk sequences Λ→Λ→0 and 0→Λ→Λ. | Retain. |
| 1.2 support localization | Same chain, E=Λ | RΓ_Z(E)=0, RΓ(E)=Λ, RΓ(U,E)=Λ; latter arrow=id. | Retain. |
| 1.2 derived enhancement | Point, K=Λ, shift n=0,1 | π₀Map(Λ,Λ)=Λ; Ext¹(Λ,Λ)=0, as ordinary H⁰,H¹. | Retain. |
| 1.3 composition of Rf* | Two split finite covers of degrees 2 and 3 | Direct image Λ⁶=(Λ³)²; higher images 0. | Retain. |
| 1.3 Čech descent | Identity cover with two copies | Degree-0 kernel of (a,b)↦b−a is diagonal Λ; H¹=0. | Retain sign. |
| 1.3 profinite-site cohomology | Trivial group; C₂ with trivial F₂ | H⁰=Λ for trivial group; H¹(C₂,F₂)=F₂. | Does not force all groups acyclic. |
| 1.3 pro-étale continuity | Constant point tower | colim H⁰=Λ=H⁰(limit); Hⁿ=0 for n>0. | Retain. |
| 1.3 Hochschild–Serre | Split regular S₃ cover over a geometric point | Fibre Λ[S₃] has 6 basis elements; invariants Λ; higher group cohomology 0. | Nonabelian action retained. |
| 1.3 ν comparison | Point and constant Λ | Rν*ν*Λ=Λ, unit=id; not a zero endomorphism of Λ. | Retain. |
| 1.3 affine coherent acyclicity | Closed disc, M=A | H⁰=A, H¹=0 on rational and étale computations. | Retain. |
| 1.4 local constancy | Connected disc, j!Λ from a smaller closed disc | Stalks Λ and 0; constant Λ has Λ at both. | Nonexample works. |
| 1.4 finite étale/local systems | Split r-sheeted cover; r=0,1,2 | Fibres have 0,1,2 elements; modules are 0,Λ,Λ². | Retain. |
| 1.4 G-torsors | Algebraically closed point, G=S₃ or C₂ | One torsor class; regular fibres have 6 or 2 elements. | Set-valued H¹ distinguished from fibre size. |
| 1.4 constructibility | j!Λ on rational U with nonempty complement | Two constructible strata, ranks 1 and 0; one constant stratum fails. | Retain. |
| 1.4 abelian closure | ×ℓ on constant ℤ/ℓ² | Kernel and cokernel both ℤ/ℓ, locally constant finite type. | Retain. |
| 1.4 filtered colimits | Point, colim ℤ/ℓⁿ=ℚ_ℓ/ℤ_ℓ | H⁰ on both sides is ℚ_ℓ/ℤ_ℓ; no common exponent. | Retain torsion meaning. |
| 1.4 Kummer exactness | Algebraically closed C, n unit; char p, n=p control | C×/(C×)ⁿ=0; char-p μ_p is not an étale rank-one Z/p system. | Invertibility retained. |
| 1.4 twists | n=1; n=2 and chosen primitive root | Z/1=0=μ₁ as modules; ζ identifies Z/2 with μ₂. | No n=0 twist admitted. |
| 1.5 supported tilde-limit | Constant system (X,S), S=∅ or X | Limit support ∅ or X; function density is equality A=A. | Retain both clauses. |
| 1.5 completion criterion | Q_p²→Q_p projection | Kernel contains (0,1); closure of zero=0; spectrum image has 1 of 2 points. | Rejected by stated hypothesis. |
| 1.5 bounded-target test | Q_p→Q_p[ε]/ε², unbounded plus ring | Both mod-pⁿ plus reductions Z/pⁿ; missing open coset ε+pA₀. | Boundedness excludes false density. |
| 1.5 evaluation cone | Q_p⟨T⟩→Q_p, T↦0 | Kernel contains T≠0; reductions F_p[T]→F_p not injective. | Completion hypothesis excludes it. |
| 1.5 strict-local fibres | Split degree-r finite étale map | H⁰ of geometric fibre=Λʳ; Hⁿ=0 for n>0. | Retain. |
| 1.5 topological-only limit | K[ε]/ε²→K | Spectra both one point; ring map kills ε≠0. | Topology alone insufficient. |
| 2.1 henselian pair | I=0 and I=R in nonzero R | (R,0) passes; (R,R) fails the Jacobson condition. | Degenerate ideals distinguished. |
| 2.1 henselian test | Z_(3), T²−T+3 | Root mod 3 is 1; discriminant −11 is not a rational square. | Nonhenselian control works. |
| 2.1 common ideal | ℤ+pZ_p⟨T⟩⊂Z_p⟨T⟩ | Common ideal pZ_p⟨T⟩; both henselian-pair tests are true. | Retain. |
| 2.1 universal-homeomorphism transfer | k[ε]/ε²→k, I=(ε) | Spectrum one point→one point; both pairs henselian. | No injectivity assumption added. |
| 2.1 complete definition ring | A=Z_p, I=(p) | lim Z/pⁿ=Z_p; for Z_(p) the limit is Z_p≠Z_(p). | Completeness retained. |
| 2.1 general f-adic henselianity | Discrete k; nonuniform Q_p⟨T⟩[ε]/ε² | Nilradical 0 in k; εQ_p⟨T⟩ in A° is unbounded but nilpotent. | Neither Tate nor uniformity silently assumed. |
| 2.1 unit detection | Q_p and element 0 or p | 0 lies in the valuation support and is not a unit; p is a unit and not in support. | Retain both directions. |
| 2.1 henselization | Complete Q_p; Q with p-adic topology | First stays Q_p; second is Q_p∩Q̄, countable, completion uncountable Q_p. | Henselization not completion. |
| 2.1 rational henselization | U=X; disc radius p | First gives Aʰ; second completes to Q_p⟨T/p⟩. | Correct domain and completion. |
| 2.2 special subset | D=∅, E={1}, t=1; E=∅,t=1 | First locus ∅ since 1<1 fails; second X. | Strict inequality matters. |
| 2.2 special nonopen support | Z_p[T], condition v(T)<1 | Closed complement of rational v(1)≤v(T); contains reduction T=0 and excludes T=1. | Not a rational open. |
| 2.2 pro-special continuity | Constant support system | colim A(U)=A(U); empty support gives zero ring. | Retain. |
| 2.2 supported henselization | U=X complete; U defined by p,T | First A; second henselization along (p,T), not power-series completion. | Retain. |
| 2.3 fibre product | Z=Y; affine line over Q_p | Identity gives S; Gauss point lies over generic scheme point, unlike a classical point. | Not a set-theoretic fibre product. |
| 2.3 comparison morphism | Complete A; incomplete Q | Spec A used in first; Spec(Q_p∩Q̄), not Spec Q, in second. | Correct intermediate ring. |
| 2.3 stalk formula | Geometric point, split finite fibre of size 2 | Colimit sections Λ²=fibre H⁰; higher terms 0. | Retain. |
| 2.3 henselian base change | Z_(3)[√7]→Z_(3) | Nontrivial double cover becomes split mod 3; H¹ class maps nonzero→0. | Henselian hypothesis necessary. |
| 2.3 separably closed pushforward | A=K separably closed, J=0 or 1 | Higher Hⁿ=0 on point and empty space. | Retain. |
| 2.4 model limit | A=K; A=Z,K=Q | First one valuation ring K; second Z_(p) and Q, as points of Spec Z. | Retain. |
| 2.4 normal-model étale site | AIC valuation ring V, Y=Spec(V/πV) | Finite étale covers split into r sheets; nilpotents in V/πV do not add covers. | Retain normal-model scope. |
| 2.4 ZR locus definition | K=F̄_p, E=F=∅; F={1} | Only trivial valuation in first, so one point; second is ∅. | Unit cannot be strictly below 1. |
| 2.4 ZR vanishing headline | Same point/empty cases, n>0; G=0 | Hⁿ=0 on both loci; with G=0 also H⁰=0. | Signature passes these controls. |
| 2.4 weak bounds | E={a,a⁻¹}, a≠0 | v(a)≤1 and v(a⁻¹)≤1 force v(a)=1. | Wrong strict convention excluded. |
| 2.5 constant comparison | Geometric affinoid field | H⁰=G, higher Hⁿ=0 on scheme and adic sides. | Retain. |
| 2.5 relative comparison | Identity proper morphism | γ*=id on H⁰=G; positive cohomology 0 at geometric point. | Properness route consistent. |
| 2.5 affinoid disc, μ_ℓ | Algebraically closed C, ℓ≠p | Units modulo ℓth powers=0 and Pic=0; both H¹=0. | Retain. |
| 2.5 Fujiwara trait case | A=F̄_p[[t]], ℓ≠p | K=F̄_p((t)) on both sides: H⁰=Λ,H¹=Λ(−1), higher 0. | Noetherian trait, generic locus. |
| 2.6 Noetherian models | R=completed Z_p[p^(1/p∞)] | Stage Z_p[p^(1/pᵏ)] is Noetherian; value group of limit Z[1/p] has no least positive value. | Limit not Noetherian. |
| 2.6 model colimit | A prescribed finite tuple in R | Tuple occurs at one stage; both maps to R send each chosen element to itself. | Finite-data assertion retained. |
| 2.6 generic comparison | R=O_C, finite constant G | Both H⁰=G, Hⁿ=0 for n>0; coefficient 0 gives all zero. | Retain. |
| 2.6 tilt compatibility | C and C♭ algebraically closed | Both constant finite G cohomology equal G[0]. | No all-degree vanishing claim. |
| 3.1 tautness | Affinoid disc; affine line; doubled disc | First qc/taut; line non-qc/taut; doubled disc overlap punctured disc non-qc. | Tautness not compactness. |
| 3.1 strict realization | Spa(C,O_C); rank-two specialization of Gauss point | First maps to one point; Gauss and specialization have same maximal image. | Quotient not injective. |
| 3.1 strict étale site | Empty cover; two component inclusions | Empty covers ∅ only; one component misses the other; both cover. | Retain. |
| 3.1 θ pullback | Constant Λ; small-disc j!Λ | Constant pulls back to Λ; j!Λ has stalks Λ and 0 along one specialization. | Essential image is smaller. |
| 3.2 overconvergence | Constant Λ; j!Λ across rational boundary | Specialization Λ→Λ=id, versus 0→Λ. | Definition discriminates. |
| 3.2 maximal stalk test | Overconvergent Λ, endomorphisms 0 and id | Maximal stalk maps 0 and 1 differ; all-rank maps likewise. | Detects equality of actual morphisms. |
| 3.2 cohomology comparison | Point with algebraically closed field | Both RΓ=Λ[0]; closed disc proper-support H⁰ is 0 versus Berkovich compact H⁰=Λ. | Ordinary/support distinction retained. |
| 3.3 integral systems | Trivial rank r, r=0,1 | Levels 0 or Z/pⁿ; reduction of level n+1 equals level n. | Constant Z/p is not rank-one lattice system. |
| 3.3 isogeny category | Rank-one multiplication by p | Integral map not invertible; rational inverse p⁻¹ gives product 1. | Rationalization required. |
| 3.3 rational descent | Tate-curve character generator↦p | Rational rank 1; pZ_p≠Z_p; no stable lattice. | Stackification not global rationalization. |
| 3.4 faithful factor | Identity étale algebra; omitted component | B itself is faithful; zero fibre outside an open image supplies no faithful factor. | Surjectivity retained. |
| 3.4 local lattice | Constant Q_p | Identity neighborhood carries Z_p⊗Q_p=Q_p. | Local existence compatible with noncompact global example. |
| 3.4 bounded lattice moduli | Rank one, m=0,1,2; rank zero | Counts 1,3,5; zero-rank count 1. | Two-sided bounds retained. |
| 3.4 finite lattice sum | Empty family, T=Z_p,m=0 | Ambient sum 0; required lower bound Z_p⊄0. | R02: specify empty join. |
| 3.4 repaired bounded join | m=1, empty or {pZ_p,p⁻¹Z_p} | pZ_p+0=pZ_p; pZ_p+p⁻¹Z_p=p⁻¹Z_p. | Both lie in L₁. |
| 3.4 bound composition | L=pᵃZ_p, L′=pᵇZ_p | Bounds give distance ≤m+n; a=−1,b=1 gives distance 2=1+1. | Retain. |
| 3.4 integral affine comparison | Geometric field, trivial rank 2 | Both categories contain Z_p² with same endomorphism ring M₂(Z_p). | No full-topos claim. |
| 3.5 covering definition | Identity, empty, proper nonempty open in connected X | Fibres 1,0, then 1 on U/0 outside; last violates local covering condition. | Retain. |
| 3.5 base change/descent | Split two-sheeted cover | Pullback has 2 sheets; identity descent returns the same 2 sheets. | Retain. |
| 3.5 component quotient | Regular S₃ cover modulo subgroup C₂ | 6/2=3 fibre elements; equivalence relation has three blocks of size 2. | Nonabelian quotient tested. |
| 3.6 fibre functor | Identity, empty, degree-d separable field extension | Cardinalities 1,0,d; fibre equals Hom_k(L,K). | Retain. |
| 3.6 fundamental group | M(C); Tate elliptic curve | Group 1 at algebraically closed point; topological quotient Z on Tate curve. | Profinite replacement fails. |
| 3.6 orbit/cover correspondence | S₃ acting on S₃/C₂ | One orbit of size 3, stabilizer C₂, connected degree-3 cover. | Left cosets preserved. |
| 3.6 algebraic completion | Nodal cycle example, analytic quotient Z | Image Z is dense in Ẑ but not onto; finite quotients Z/n agree. | Surjectivity not overclaimed. |
| 3.7 Tate quotient | q and qᵐ, m=2 | Skeleton R/log(abs(q))Z; subgroup index 2 for q². | q=0 excluded. |
| 3.7 degree-one criterion | Split covers of degrees 1 and 2 | Rank 1 gives unit algebra isomorphism; rank 2 gives two-point fibre. | Differential alone insufficient. |
| 3.7 lattice cover | Rank zero; trivial rank one | First one sheet; second sheets pᵃZ_p indexed by a∈Z. | Finite windows do not imply finite cover. |
| 3.7 lattice orbit | Multiplication by p | Orbit of Z_p is all pᵃZ_p, infinite; stabilizer in Z is 0. | Finite-index hypothesis not inserted. |
| 3.7 compact-monodromy iff | Image {1}; image p^Z | Stable Z_p in first; no stable rank-one lattice in second. | Both directions tested. |
| 3.7 integral versus normal | A=C⟨t²,t³⟩ | t integral since t²∈A, but t∉A; A integral, not normal. | README correctly adds normality. |
| 4.1 formal étaleness | Spf F_p→Spf Z_p | Mod p=id; mod p² has Tor₁(F_p,F_p)=F_p≠0. | All-level test needed and present. |
| 4.1 ramification | Z_p[√p], p odd | Special fibre F_p[x]/x²; Ω has nonzero dx at x=0. | Not étale. |
| 4.1 adicness | Z_p[[T]] with (p,T)-topology over Z_p | (p) contains no power of (p,T), since Tⁿ∉(p). | Excluded. |
| 4.1 formal site reduction | Unramified Witt extension of degree r | Each reduction étale of degree r; special fibre has r geometric points. | Retain. |
| 4.1 specialization map | Formal disc, classical T=0 and T=1 | Reductions are 0 and 1; identity pullback keeps each label. | Retain. |
| 4.2 supported pair | Special-fibre point T=0 | Full inverse image includes valuations infinitesimally below radius 1; open tube omits those endpoints. | Supports not conflated. |
| 4.2 empty/full pairs | L=∅ and entire special fibre | Analytic supports ∅ and entire generic fibre; coefficients 0 and original F. | Retain. |
| 4.2 supported pullback | Constant sheaf at reduction point | Analytic stalk Λ equals special-fibre stalk Λ, with identity transition. | Retain. |
| 4.3 strict localization | Smooth formal point, constant Λ | Geometric tube H⁰=Λ, Hⁿ=0 for n>0; zero coefficients give 0. | Instance agrees; source limitation recorded. |
| 4.3 full tube versus interior | Rank-two infinitesimal boundary point | Membership in λ⁻¹(0)=true; membership in open tube=false. | Wrong support detected. |
| 4.4 completion comparison | Complete formal trait | Completion=id; nearby-cycle comparison Λ→Λ=id. | Retain. |
| 4.4 completion along empty support | Ideal (1) | Completion zero ring, formal support empty, RΓ=0 on both sides. | Retain. |
| 4.5 nearby versus vanishing | Smooth trait family, constant Λ | Nearby Λ[0]; specialization=id; vanishing cone 0. | No identification of nearby with vanishing. |
| 4.5 semistable node | xy=π | Nearby stalk H⁰=Λ,H¹=Λ(−1); vanishing H⁰=0,H¹=Λ(−1). | Twist and shift retained. |
| 4.5a coefficient compatibility | Constant finite Λ on smooth trait | Specialization id; inertia id; variation 0 before and after comparison. | Equivariance control. |
| 4.5a integral perversities | Point, Z_ℓ torsion-free versus Z/ℓ | Dual of Z_ℓ in degree 0; RHom(Z/ℓ,Z_ℓ) has Ext¹=Z/ℓ. | Integral t-structures not identified. |
| 4.6 Kummer symbols | Unit 1 and parameter T, ℓ invertible | δ(1)=0; δ(T) is generator on annulus. | Zero-symbol wrong model excluded. |
| 4.7 semistable filtration cutoff | p=2,e=2; p=3,e=1,2 | ceil(pe/(p−1))=4,2,3 respectively. | No integer-division truncation. |
| 4.7 degree-zero symbols | q=0 | Tensor power degree 0 is Λ; logarithmic differential degree 0 is O, not an empty object. | Retain separate q=0 convention. |
| 4.7 shifted filtration | q=1, m=0 | V⁰=U¹, not U⁰; constant unit class distinguished from principal units. | Index shift retained. |
| 5.1 strict valuation triples | Rank-two valuation spectrum | Chain (0)⊂p⊂m has 3 points; rank-one spectrum has 2. | No DVR replacement. |
| 5.1 algebraically closed valuation base | V with algebraically closed fraction field | Finite étale local covers split; residue field separably closed. | Field V has rank 0, not microbial. |
| 5.2 nearby cycles | X=S, E=Λ on AIC valuation base | Generic stalk Λ and special nearby stalk Λ; map=id. | Retain. |
| 5.2 nonconstant nearby object | Ramified quadratic degeneration | Nearby geometric fibre Λ²; specialization diagonal Λ→Λ². | Cannot declare unit an isomorphism universally. |
| 5.3 pro-p vanishing | C_p acting trivially on F_ℓ, ℓ≠p | Averaging divides by p; positive cohomology 0. For ℓ=p, H¹=F_p. | Coefficient restriction essential. |
| 5.3 tame value-group contribution | Γ=Z and Γ=Z² | Prime-to-p tame quotient has one or two independent pro-ℓ generators; cdℓ=1 or 2. | Rank preserved. |
| 5.3 divisible-away-from-p control | Γ=Z_(p), ℓ≠p | Γ/ℓΓ=0; corresponding ℓ-tame contribution 0. | Not every valuation contributes a Z_ℓ. |
| 5.3 Gauss extension | v(p+T), v(pT²+p²), radius 1 | Values 1 and abs(p); equal to maximum coefficient values. | Cancellation not invented. |
| 5.4 constructibility | Geometric point, finite free B-module B² | H⁰=B², higher groups 0; two generators, regardless of cardinality of B. | Retain. |
| 5.5 inertia variation | Trivial action; scalar action σ=−1 | Variation 0; respectively −2. Mod 2 latter becomes 0. | Small-prime normalization retained. |
| 5.6 ULA | Constant smooth family; special-point skyscraper | Constant specialization Λ→Λ; skyscraper Λ→0. | Skyscraper fails local acyclicity. |
| 5.6 perfect coefficients | B=Z/4, M=Z/2 | Torᵢ_B(M,M)=Z/2 for every i≥0. | M excluded from perfect coefficient domain. |
| 6.1 surjective valuation map | V→Frac(V); identity V→V | First spectrum image {(0)} omits closed point; identity hits all primes. | Algebra injection alone insufficient. |
| 6.1 higher-rank field pair | C⁺⊂O_C, rank C⁺=2 | Spec O_C has 2 primes versus 3 in Spec C⁺; Spa map misses closed rank-two point. | Surjectivity not implicit. |
| 6.1 residue quotient | V→V/m | Spectrum image {m}, missing generic point. | Not admitted as surjective on spectra. |
| 6.2 localization | Rank-one AIC V, X=S,E=Λ | Triangle 0→Λ→Λ with identity map. | Retain. |
| 6.2 intermediate-point control | Rank-two V, S₀={m}, sheaf at p | Supported restriction term Λ; generic nearby term 0. | c_U not always invertible. |
| 6.2 microbial complement | Rank-two V, S₀=V(p) | Complement {(0)}; both functors use the same generic immersion. | c_U=id after identification. |
| 6.2 algebraized support | Closed constructible L=∅ or whole special fibre | RΓ_L=0 or RΓ; corresponding analytic supported RΓ has same values. | Compact support not inferred. |
| 6.3 base-change invariance | Identity extension, constant Λ | Canonical map Λ→Λ=id; zero map on the same groups would fail. | Retain named map. |
| 6.3 nonproper p-primary control | A¹ over algebraically closed characteristic p | Artin–Schreier class x gives nonzero H¹; point has H¹=0. | No unrestricted p-primary invariance. |
| 6.3 proper p-primary control | P¹ over algebraically closed characteristic p | H⁰(Z/p)=Z/p; H¹=H²=0. | Proper and prime-to-p formulas distinguished. |
| 6.4 finite-rank descent | Finite-rank A itself | A₀=A, Cartesian model identity, same sheaf and same support. | No rank-one narrowing. |
| 6.4 finite boundary | Z=∅; Z=S | Rj*j*F=F or 0; local support 0 or F respectively. | Both endpoint cases agree. |
| 6.4 finite generation | X=point, B=F_ℓ[t], F=B | H⁰=B generated by 1, but infinite cardinality. | Module.Finite, not Finite. |
| 6.4 projective-line cohomology | P¹ over AIC valuation base, invertible coefficients | H⁰=B,H¹=0,H²=B(−1). | Ordinary cohomology/twist retained. |
| 7.1 field-extension invariance | Identity geometric field pair; U=∅ | Pullback on H⁰=id; with j! from ∅ both RΓ=0. | Surjective-pair scope retained. |
| 7.2 finite-type approximation | Perfectoid disc, I={T} | S_I=C⟨T⟩, T lacks a pth root there; limit contains T^(1/p). | Stages need not be perfectoid. |
| 7.2 constant-field system | X=Spa(C,C⁺), I finite | S_I=C,S_I⁺=C⁺; all maps=id. | Arbitrary-rank plus ring retained. |
| 7.2 rational descent | Perfectoid disc, abs(T)≤abs(π) | Preimage of the same inequality at stage {T} is exactly that rational subset. | Both topology and functions checked. |
| 7.2 perfection | Characteristic p, T↦Tᵖ | Étale site unchanged; T has a pth root after perfection, not before. | Purely inseparable direction correct. |
| 7.2 base change | X=S, S′→S | X′=S′ and every Y_I′=S′; completed tensor C⊗̂_C C′=C′. | Retain. |
| 7.3 connectedness | Split two-point space versus one point | H⁰(−,Z/2) has 4 versus 2 elements; base extension preserves them. | Detects components. |
| 8.1 compactifiable maps | Closed disc, open disc, doubled disc | qc=true,false,true; compactifiable=true,true,false. | Separatedness/tautness retained. |
| 8.2 universal compactification | Closed disc; proper P¹; open disc | Added boundary has 1,0,0 points respectively; open disc remains nonproper. | Universal compactification not P¹. |
| 8.2 completed dimension | Identity, disc projection, empty source | dim.tr=0,1,−∞; disc compactification remains dimension 1. | Empty supremum not 0. |
| 8.2 curve algebraization | Smooth formal projective line | Identity model; special H²(O)=0, the obstruction group used for curves. | Not an arbitrary-dimensional assertion. |
| 8.2 formal compactifiability | Affine formal line; formal affine plane | Fibres dimensions 1 and 2; only first belongs to stated curve class. | Dimension condition discriminates. |
| 8.2 prescribed boundary normalization | P¹, prescribed ∞ | Map id has inverse image of ∞ exactly {∞}; finite degree 1. | Prescribed closed points need not be nodes. |
| 8.2 finite valuation boundary | Closed disc; closed annulus | Boundaries have 1 and 2 rank-two points; proper curve has 0. | Finite boundary retained. |
| 8.3 proper supports | Two split finite points→point | f!Λ=Λ²=f*Λ; higher images 0. | Proper forget-supports map=id. |
| 8.3 nonproper supports | Closed disc over geometric rank-one point | H⁰_c=0 while H⁰=Λ. | f! and f* not identified. |
| 8.3 infinite étale coproduct | Countably many points→point | f!Λ=direct sum; f*Λ=product; constant sequence lies only in product. | Support condition discriminates. |
| 8.3 composition | Split degrees 2 then 3 | Six summands on both sides; composite trace sums all six once. | Retain. |
| 8.3 closed-fibre restriction | Two-point base chain, sheaf zero at closed point | Global RΓ=0 despite possibly nonzero generic stalk. | Correct all-rank argument. |
| 8.4 amplitude | Geometric point d=0; proper P¹ d=1 | Nonzero degrees 0; respectively 0 and 2, within 2d. | Bound tested at endpoint. |
| 8.4 proper base change | Identity base change on P¹ | H⁰=Λ,H²=Λ(−1) on both sides; exchange=id. | Does not test forbidden coefficients. |
| 8.4 projection | Identity, B=Z/4,M=Z/2 | Derived tensor has Z/2 in all nonpositive degrees; ordinary tensor only degree 0. | Derived/unbounded formulation required. |
| 8.4 proper–étale exchange | Split two-sheeted étale map and identity proper map | Both composites return Λ² with identity exchange. | Retain. |
| 8.5 localization | Disc with origin removed | 0→Λ→H¹_c(D×)=Λ→0; connecting arrow is an isomorphism. | Not zero. |
| 8.5 coefficient composition | n=1 | Z/1=0; all derived functors and transformations zero. | No division by n used. |
| 8.6 finite-flat trace | Double nonreduced fibre over geometric point | Fundamental cycle multiplicity 2; trace of a=2a, not a. | Point counting alone fails. |
| 8.6 split finite étale trace | Two sheets, Λ=F₂ | Trace(a,b)=a+b; trace(1,1)=0, trace(1,0)=1. | Trace need not invert degree. |
| 9.1 Chern normalization | O(1), O on P¹ | Trace(c₁)=1 and 0; O(−1) gives −1. | Sign fixed. |
| 9.2 finite-condition transfer | Identity valued embedding; equation 1=0 | Both existential predicates true for x=0, false for 1=0. | R03 adds native statement. |
| 9.2 transfer wrong model | Trivial valuation→nontrivial extension | ∃x,0<v(x)<1 has values false/true. | Both nontrivial hypotheses retained. |
| 9.2 valuation section lift headline | V algebraically closed field, B=V[T], s(T)=a | t=s and residue=id; both images of T are a. | Field case admitted. |
| 9.2 nonflat lifting control | Nonfield V, B=V/m | Residue section exists; V-algebra lift impossible since m≠0 is killed in B. | Flatness excludes it. |
| 9.2 rational supported section | Rank-two C⁺, generic open only | Open is nonempty but closed fibre empty; no S-section. | Closed-fibre hypothesis retained. |
| 9.2 curve purity | Rational point on smooth curve | Local class in degree 2, twist 1; trace 1. | Wrong unshifted map excluded. |
| 9.2 p-primary disc control | Mixed-characteristic open disc | p-primary H²_c trace has nonzero kernel; prime-to-p trace is an isomorphism. | Broad trace not broad duality. |
| 9.3 localized cycle class | Codimension 0 and 2 regular immersions | Classes in degrees 0 and 4, twists 0 and 2; even-degree interchange sign +1. | Retain. |
| 9.3 boundary degree | Exterior of coordinate disc | Secondary boundary degree of T is −1; constants have degree 0. | Opposite projection excluded. |
| 9.3 norm compatibility | T=S² on annuli | N(S)=−T; v_T(N(S))=1, not 2. | Residue/inertia convention retained. |
| 9.3 principal boundary cancellation | Coordinate annulus with two ends | Boundary degrees of T are −1 and +1; sum 0. | Orientation tested. |
| 9.3 point normalization | Rational point a | Boundary of (T−a)⁻¹ has trace +1. | Agrees with c₁(O(1)). |
| 9.3 semistable trace comparison | Proper smooth P¹ model | Algebraic and analytic point traces both 1. | Canonical map, not abstract scalar multiple. |
| 9.4 smooth trace | Identity d=0; affine line d=1 | Λ→Λ=id; Rf!Λ(1)[2] has top contribution Λ in degree 0. | Shift/twist agree. |
| 9.4 gluing trace | Two components | Trace(a,b)=a+b; overlap differential (a,b)↦b−a. | Descent signs retained. |
| 9.4 composition of traces | Two affine-line projections | Total shift 4, twist 2; product point class traces to 1·1=1. | Dimensions add. |
| 9.5 arbitrary-rank relative trace | Higher-rank base, identity morphism | Relative trace Λ_S→Λ_S=id on every stalk. | No rank-one replacement. |
| 9.6 curve duality | P¹, Λ field | Dimensions (1,0,1); degree-0 and degree-2 generators pair to 1. | Retain. |
| 9.6 higher-rank numerical control | P¹ over two-point base, generic j!Λ | RΓ(base,j!Λ)=0; generic fibre ordinary H⁰=Λ. | Relative derived duality required. |
| 9.6 finite étale pairing | Split ℓ-sheet cover, F_ℓ coefficients | Pairing matrix I_ℓ, determinant 1; trace(unit)=ℓ=0. | Perfect pairing does not require degree invertible. |
| 9.6 compact open pairing | U=X; U=∅ | Identity pairing; respectively both sides 0. | Correct endpoints. |
| 9.7 smooth-proper pairing | P¹, i=0,2 | H⁰ and H²(1) each Λ; cup/trace 1. | All-degree formulation retained. |
| 9.7 integral trace | Relative dimension 0, identity formal scheme | Trace Z_p→Z_p=id; reduction mod pⁿ also id. | Coefficient transition compatible. |
| 10.1 weak disc | Coordinate 0; radius 0 | Zero coordinate lies in every weak disc; radius 0 gives zero locus. | Total-function endpoints distinguished. |
| 10.1 punctured disc | Coordinate 0 | Punctured locus empty; unpunctured weak disc whole ambient space. | Nonvanishing condition essential. |
| 10.1 closed annulus | Equal nonzero radii; coordinate 0 | Equal radii give a circle; coordinate 0 gives ∅. | No natural-subtraction shortcut. |
| 10.2 strict annulus | Equal radii | Simultaneous strict inequalities impossible, hence ∅, versus nonempty weak circle. | Retain. |
| 10.2 analytic open disc | Rank-two infinitesimal endpoint | Strict valuative inequality can hold while membership in union of smaller real-radius discs fails. | Interior construction retained. |
| 10.2 cofinal exhaustion | π topologically nilpotent; π=1 control | abs(π)^−n→∞ in first; constant radius 1 in second. | π=1 excluded. |
| 10.3 tame annulus covers | T=Sᵉ, e prime to p | Fibre degree e and ramification e; p-power inseparable map in char p is not étale. | Tameness/étaleness separated. |
| 10.3 Kummer generator | T=S², coefficients μ₃ | Pullback δ(T)=2δ(S); coefficient 2 invertible mod 3. | Map, not just dimensions, checked. |
| 10.4 ordinary disc | Closed and open geometric discs | Dimensions (1,0,0) on both; restriction sends 1↦1. | Retain. |
| 10.4 supported disc | Closed and open discs | Huber dimensions (0,0,1) on both; Berkovich compact closed disc gives (1,0,0). | Support theory distinguished. |
| 10.4 ordinary annulus | Closed/open annulus and weak circle | Dimensions (1,1,0); δ(T) generates H¹(μ_n) in each. | Equal-radius case retained. |
| 10.4 supported annulus | Closed/open annulus | Dimensions (0,1,1); H² twist −1. | Dual degrees agree. |
| 10.4 concentric restriction | Circle inside same-coordinate annulus | δ(T)↦δ(T), degree 1; dual j! isomorphism. | Retain. |
| 10.4 nonconcentric control | C=ℂ₃, T=1+S, abs(S)≤abs(3), μ₂ | 1+S is a square; δ₂(T)↦0, so dual H¹_c map=0. | Concentric hypothesis necessary. |
| 10.4 punctured disc | D×=D−{0} | Ordinary (1,1,0), supported (0,1,1); adding 0 kills degree 1. | Retain. |
| 10.4 puncture boundary | Λ=F₂ | Λ→H¹_c(D×)=Λ is iso; 1 maps to its nonzero generator. | Zero-map model excluded. |
| 10.4 higher-rank ordinary cohomology | Annulus and its rank-one generic fibre | Both (1,1,0); point sets differ. | Not a proper-support comparison. |
| 10.4 root tower | ℓth-root versus pth-root transitions | H¹ maps ×ℓ=0 versus ×p≠0 in F_ℓ; colimits 0 versus F_ℓ. | Prime-to-p tower cannot be replaced by perfection. |
| 10.5 constructibility | Smooth projection of relative point/disc | Point coefficient stays rank 1; disc R²f!Λ=Λ(−1), other degrees 0. | Finite ranks, not arbitrary stalk functions. |
| 10.5 perfectoid-base transfer | Constant system with X=base | Exchange is Λ→Λ=id; empty U gives 0→0. | Needs relative-support comparison, not just topology. |
| 11.1 purity | Smooth divisor; codimension-2 intersection | Supported degrees 2 and 4, twists −1 and −2 in i!Λ. | Codimension controls shift. |
| 11.1 normal crossings | 0,1,2 local branches | Exterior-algebra ranks (1), (1,1), (1,2,1). | Missing branch changes H¹. |
| 11.1 nonproper comparison | A¹ over algclosed field, ℓ≠p | Both H⁰=Λ, Hⁿ=0 for n>0; p-primary Artin–Schreier class is a negative control. | Coefficient restriction retained. |
| 11.2 field cd headline | K finite, L=K; K algclosed,L=K(t), ℓ≠char K | Bounds 1≤1+0 and 1≤0+1. | Rank-zero and positive-trdeg cases. |
| 11.2 cd degeneracies | Algebraic extension of algclosed K; infinitely many transcendental variables | 0≤0; right-hand bound ∞ in infinite-trdeg case. | toENat does not collapse ∞. |
| 11.2 analytic cd bound | Point and geometric smooth curve | Bounds cdℓ≤0 and ≤2; P¹ has H²≠0, attaining latter. | Factor 2 retained. |
| 11.2 finite balls | m=0; one-variable radii abs(π)^−n | Point stays point; radii increase strictly and union is affine line. | π topologically nilpotent required. |
| 11.2 ball comparison | Constant Λ, m=1,2 | Ordinary Λ[0]; compact contribution Λ(−m)[−2m]. | m=2 tests shift 4, twist 2. |
| 11.2 transition maps | Nested geometric balls | H⁰ restriction 1↦1; normalized H²ᵐ_c extension 1↦1. | Zero transitions on isomorphic groups fail. |
| 11.2 exhaustion | Constant inverse system Λ with identity maps | lim Λ=Λ, lim¹Λ=0; zero-transition system has lim=0. | Actual maps matter. |
| 11.3 frontier | Closed disc in P¹; strictly interior closed annulus; U=X | Frontier contributions 1,2,0 endpoints respectively. | Finite boundary, including circle endpoints. |
| 11.3 frontier cone | Closed disc U inside P¹, M=Λ(1)[2] | RΓ(j!M)=Λ=RHom(RΓ(U,Λ),Λ); normalized map 1↦1, global cone 0. | Computes global comparison. |
| 11.3 compactification duality | P¹, U=P¹; U=∅ | Ordinary Poincaré pairing with trace 1; respectively zero pairing of zero objects. | Endpoint compatibility retained. |
| R01 dependency direction | Tropical supplier contract vs line-40 wording | Actual edge parent→consumer; scanner adds consumer→parent; deleting duplicate mention removes 2 diagnostics. | Gate input needs repair. |
| R04 Lean-name contract | BoundedLattice.sup; actual declaration inventory | README claims a name; file contains 0 such declarations and exactly 4 total. | Convert auxiliary names to prose. |

## Not verifiable

The following primary locators were not certified from readable source text. No unread theorem is treated as false merely because access failed, and none is represented as verified by the table's elementary probes.

- **Huber1996:** the source service found the paywalled Springer edition, DOI `10.1007/978-3-663-09991-8`; the configured local-source directory and existing cache had no held text. This affects the sampled §§1.1–1.2, 4.1/4.3, 6.2/6.4, 8.1/8.2/8.4 and their precise Huber theorem/page claims. In particular Corollaries 4.2.8–4.2.9, pp.245–246, and the proof of Lemma 7.2.3, pp.370–371, remain uncertified. The cited correction to the p.246 diagram was not independently checked and is not entered as a source error.
- **HuberHenselian1993:** legal GDZ scan, pp.703–708, including Theorem 0.2 on p.703. Image-only extraction; no working OCR. The complete Zariski–Riemann vanishing locator therefore remains uncertified even though its signature and elementary instances were checked.
- **HuberValuations1993:** legal GDZ scan, pp.455–477, including Proposition 1 on p.457. Same image-only/OCR limitation.
- **HuberGeneralization1994:** legal GDZ scan, pp.513–551, including Proposition 1.3 on p.517. Same limitation.
- **BerkovichVanishing1994:** legal GDZ scan, pp.539–571, particularly the formal étale definition before Lemma 2.1, p.542. Same limitation; the readable Stacks nilpotent theorem does not certify all formal hypotheses.
- **BoschLutkebohmertRaynaud1995:** legal GDZ scan, pp.361–398, especially Theorems 2.1/2.1′ and Propositions 2.2–2.3, pp.367–370. Same limitation for the reduced-fibre proof route.
- **Lutkebohmert1995:** legal GDZ scan, pp.167–219, especially Proposition 5.4/Lemma 5.5, pp.197–198, Definition 5.6, p.200, and Proposition 7.5/Lemmas 7.6–7.7, pp.213–216. Same limitation for infinitesimal compactification and approximation.
- **Hyodo1988:** legal GDZ scan, pp.543–557. Same limitation for the Hyodo portion of the semistable filtration; readable Bloch–Kato text does not substitute for it.
- **deJongVanderPut1996:** legal EMS article, pp.1–56. Same image-only/OCR limitation.
- **Berkovich1990:** the body-only citation in §3.7 was also sent to the source service by title and DOI `10.1090/surv/033`. The DOI resolved to the AMS publisher page `https://pubs.ams.org/ebooks/surv/033`; the service found no downloadable legal text. Proposition 3.1.7, p.51, and Corollary 3.3.8, p.60, were not certified from text during this review.

The readable citations establish only the portions described in the seeded-source table. In particular the general higher-rank approximation in §7.2 extends the printed characteristic-p, K°-algebra construction and needs its stated additional inputs; the source alone is not a proof of that extension. No claim of complete source certification is made for the long relative compactification proof routes. The image-only items were retained together in the scratch missing-reference record. No source manifest was edited.

## Source issues

- **Misprint** in KedlayaLiu at Lemma 8.4.1, printed p.167 (line 6567): the source says the Jacobian is invertible over an undefined coefficient ring S; it should be over the just-constructed localization B; affects the proof.
- **Error** in KedlayaLiu at Remark 8.4.8, printed p.169 (lines 6615–6616): the source says an integral affinoid algebra is normal; it should assume normality, since C⟨t²,t³⟩ is an integral nonnormal affinoid algebra; affects the proof.
- **Misprint** in LiReineckeZavyalov at Lemma 4.1.7, printed p.32 (line 1699): the source says the prescribed points are nodes; it should say the prescribed closed points, which need not be nodes; affects the proof.
- **Error** in HirokiKato at §3.2 before Definition 3.4, printed p.14 (line 599): the source says every finite-dimensional valuation ring is microbial; it should require positive dimension, since a field has no height-one prime; affects a stated result.
- **Misprint** in ZavyalovFoundations at proof of Lemma 9.1, Step 3, printed p.24 (lines 1053–1056): the source says bounded above when passing to D⁺; it should say bounded below; affects the proof.
- **Misprint** in ZavyalovFoundations at proof of Proposition 9.3(1), printed p.26 (line 1141): the source says the global exchange arrow points opposite to its constructed transformation; it should point from extension-by-zero direct image to proper direct image; affects the proof.
- **Misprint** in ZavyalovFoundations at proof of Proposition 9.3(2), printed p.27 (line 1154): the source says the projection morphism points from the tensor inside pushforward to the tensor outside; it should have the direction of formula (2), line 1120; affects the proof.
