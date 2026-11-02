# Review of EnhancedDerivedSheaves (pull request #1630 at 2da24f0)

**Verdict:** needs changes

## R01 (P2) — State the intrinsic Tor bound in the acceptance test

Location: `TauCetiRoadmap/EnhancedDerivedSheaves/Suggested.lean:19` and `TauCetiRoadmap/EnhancedDerivedSheaves/README.md:833`. Quote: “the intrinsic perfect-ring Tor bound and its almost-etale proof need the supplied almost-module and complete-local normalization interfaces.”

Claim: the module docstring classifies this headline as not statable at the pins. Those interfaces are needed to prove the theorem, but none occurs in its statement. The README's intrinsic bound is different from its retained bound in terms of the dimension of a regular presentation.

Witness: `Mathlib/CategoryTheory/Monoidal/Tor.lean:44`, `Mathlib/FieldTheory/PerfectClosure.lean:68` and `Mathlib/RingTheory/KrullDimension/Basic.lean:26` provide the carriers. The following scratch signature elaborated successfully, with only its `sorry` warning.

Repair: state the intrinsic bound as a headline, and remove it from the list of unavailable statements. Keep its almost-étale proof route and its prerequisites in the README. For example, the following uses precisely the regular-presentation hypotheses already used by `perfect_projectiveDimension_le`, and an upper bound on the intrinsic dimension:

```lean
theorem perfect_torDimension_le_two_mul_dim
    (P₀ R : Type u) [CommRing P₀] [CommRing R]
    (p : ℕ) [Fact p.Prime] [CharP P₀ p] [CharP R p]
    [PerfectRing R p] [IsRegularRing P₀]
    (d₀ d : ℕ) (hP : ringKrullDim P₀ ≤ d₀)
    [Algebra (PerfectClosure P₀ p) R]
    (hsurj : Function.Surjective (algebraMap (PerfectClosure P₀ p) R))
    (hR : ringKrullDim R ≤ d) (M N : ModuleCat.{u} R) (i : ℕ) :
    IsZero (((CategoryTheory.Tor (ModuleCat.{u} R)
      (2 * d + i + 1)).obj M).obj N) := by
  sorry
```

The scratch probe included `#check @intrinsicTorBound`; both dimension bounds, characteristic assumptions and the surjection survive elaboration. A perfect quotient of this perfection is the perfection of the quotient by the contracted radical ideal, so this is the finite-dimensional presentation domain of E1.6. The source is `bs17` line 2254, Remark 11.33, p. 49.

Test of the repair: for a perfect field, d=0 and every positive Tor is zero. For `R=(k[x,y]/(xy))_perf`, d=1; the class of y in `Ann(x)/y Ann(x)` gives nonzero `Tor₂(R/(x),R/(y))`, while the flat root ideal `Ann(x)` gives vanishing in degrees ≥3. The signature tests precisely those higher degrees and does not impose the false bound d. Changing the regular presentation's dimension does not change 2d.

## Verified sound

The review covered the entire 3,036-line README and the 253-line Lean file at the specified head. There is one blocking finding. It is an omitted acceptance statement, not a counterexample to the README's intrinsic Tor bound.

**Previous findings, checked before the full pass.** All eight findings at `7b99c5e` have been repaired in their identified locations; R01 above is a separate omission exposed by the new docstring.

| Previous finding | Passage at this head | Disposition and verification |
| --- | --- | --- |
| R01: duplicated regular-local algebra | README:19: “owns the cyclic-module test for global dimension, the regular-local global-dimension bound and the residue-field criterion” | Repaired. PurityOfBranchLocus §0.3 is cited in scope, contracts and E1.6. Its local criterion is absent from this Lean file; the additional global-ring bound remains. |
| R02: missing saturated-lattice headline | Suggested.lean:161: `theorem valuationSaturated_finite_free` | Repaired. The statement retains spherical completeness, the full positive-real value group, the norm-unit-ball identification, boundedness, saturation and rank ≤r. |
| R03: forbidden roadmap import | Suggested.lean:1: `import Mathlib` | Repaired. This is the only import. Repleteness specification targets are mathematical suppliers, not Lean imports. Gate and direct elaboration pass. |
| R04: padding | Suggested.lean:84: `theorem frobeniusRootIdeal_radical` | Repaired. Root-membership, flat-single and counterexample declarations, with their auxiliary example definitions, have been deleted. The remaining root results are radical equality and flatness/idempotence. |
| R05: composition mislabeled two-out-of-three | README:1454: “The predicates have the following API (composition is `proIso_comp`)” | Repaired. Cancellation is requested separately in prose; the Lean signature promises composition only. |
| R06: planar-operad tensor locator | README:473: “Proposition 4.1.7.4 and Example 4.1.7.6, pp. 486–487” | Repaired. These are the symmetric-monoidal localization result and its example; read at `lurie-ha` lines 18583 and 18605. |
| R07: signature catalogue/docstring | Suggested.lean:6: “It states the roadmap's headline theorems against the pinned Mathlib and Tau Ceti APIs” | Repaired as to form. The catalogue of undeclared API names is gone. The new availability classification has the separate defect R01. |
| R08: definition APIs and Layer 0 ending | README:526: “their units and counits obey the triangle identities”; README:539: `### Examples`; README:543: `### Dependencies` | Repaired in the cited layer. §§0.1–0.4 have explicit API bullets, Checks and an Examples/Dependencies ending. |

No supplied repair report marked a finding “not actionable in this package”; no settled finding is re-raised.

**Gate, elaboration and signatures.** The supplied gate is for the exact head and reports every counter zero, ending `build=0 OK`. The outside-folder diff is empty and the worktree was clean. I independently ran the requested dependency check:

```text
depcheck: 205 roadmaps, 1521 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. Direct `lake env lean` elaboration of Suggested.lean also exits successfully, with 14 `sorry` warnings and no other warning. All 20 elaborated signatures (six definitions and 14 theorems) were compared with the README; none loses a required section binder. No override, sorry-valued data, admitted example, computational algorithm or prohibited import was found.

A scratch copy used `first | simp | rfl | infer_instance` at each of the 14 theorem holes. All 14 remained unproved; the two projective-dimension instance searches hit the default typeclass limit. No option was increased. Searches by object and reading the pinned declarations found no one-lemma proof of these remaining headlines. This is a padding screen, not proof of mathematical difficulty. No padding finding remains from the previous report.

**Seeded source certification.** All four requested sections were read against legally fetched text, including the hypotheses, locator numbers and page conventions. No locator is marked unverified in the README. All 18 non-Stacks works and 12 Stacks chapter texts were fetched through the source service; fetching the remaining texts is not certification of all their locators.

| Sample | Text and exact locator read | What the text supports and the boundary checked |
| --- | --- | --- |
| 0.1 Enhanced derived sheaf categories | `lurie-ha` lines 4739–4765, Definition 1.3.5.8 and Proposition 1.3.5.9, pp. 125–126; lines 4874–4886, Proposition 1.3.5.21, p. 129 | Grothendieck abelian coefficients, the K-injective dg model, stability and presentability. The native sheaf-of-modules Grothendieck instance supplies that hypothesis. Presentability does not assert left completeness or compact generation by every unit. |
| 0.2 Replacements on ringed sites | `stacks-injectives` lines 883–903, Theorem 19.12.6/079P, chapter p. 19; `stacks-sites-cohomology-ch` lines 1342–1358, Lemmas 21.17.11–12/06YS–06YT, p. 31; `lurie-ha` §1.3.5 model discussion | Functorial K-injective replacement for Grothendieck categories; flat-term K-flat resolutions of arbitrary complexes and invariance under quasi-isomorphism. The bounded-above flat sufficient condition is not extended to arbitrary unbounded flat complexes. |
| 0.3 Tensor and internal Hom | `stacks-sites-cohomology-ch` lines 1373–1386, 06YU/08FF, p. 31; lines 3670–3703, 08J8/08J9/08JB, p. 82; `lurie-ha` lines 18583–18610, Proposition 4.1.7.4 and Example 4.1.7.6, pp. 486–487 | Commutative coefficient rings for tensor, K-flat tensor models, K-injective internal Hom with arbitrary first argument, tensor–Hom adjunction and monoidal localization. These do not make K-injectives tensor-closed. |
| 0.3 Derived limits | `stacks-derived` lines 5253–5290, §13.34/08TB–08TC and 07KC, pp. 105–106; `stacks-more-algebra` lines 10638–10658, 07KW, pp. 231–232; lines 10814–10822, 07KY, p. 235; line 10946, 091D, p. 238 | Fibre of 1−shift, sequential amplitude, Milnor and module comparison. Derived products are retained for sheaves; a diagram in a homotopy category alone is not substituted for a coherent diagram. |
| 0.3 Completion | `stacks-more-algebra` line 12163, 091V, p. 264; lines 12293–12299, 0920, p. 267; lines 12364–12370, 0G1U, p. 268; lines 12520–12525, 0923, p. 271; `bs-proet` §§3.4–3.5, lines 963–1223 | The reflector and Koszul tower for finite ideals; ordinary quotient towers under the additional torsion/regularity hypotheses. Over ℤ and (ℓ), the stated quotient model and reduction recovery apply. Perfectness is retained for tensor–limit interchange. |
| 0.4 Coherent derived functors | `stacks-sites-cohomology-ch` lines 1447–1453, §21.18; lines 1636–1664, Lemmas 21.19.1–3/07A6, 0D6E, 07A7, pp. 37–38; `lurie-ha` lines 4382–4498, §1.3.4, pp. 116–119 | Derived adjunction and composition; exchange has direction g*Rf*→Rf′*g′*. The roadmap constructs coherent lifts using its earlier enhancement; it does not claim arbitrary exchange maps are equivalences. The analytic proper-support application is conditional on its listed geometric inputs. |

**Headline coverage.** The retained Lean headlines are the global regular-ring projective-dimension bound; the two directions of Kunz; radical, flatness and idempotence of root ideals; Tor independence; the perfect-presentation Tor bound; the perfect-ring projective-dimension bound; saturated-lattice finite freeness; cofinal invariance of pro-zero towers; composition of pro-isomorphisms; and the telescope, classical/separated-completeness and kernel/cokernel comparisons. The intrinsic Tor bound is statable and absent (R01).

The other README headline families are: dg-nerve stability and comparisons; enhanced ringed-site tensor–Hom and functors; presentability and coherent adjoints; algebraic-space perfect pushforward with proper support; multiplicative limits; replete Postnikov convergence and hypercover descent; monoidal/Ind/dualizable category comparisons, Barr–Beck–Lurie and descendability; spectra/module comparison; animation, Frobenius and Witt vectors; perfect-scheme h-descent; complete coefficient-system reconstruction; animated cotangent and exterior-power comparisons. The docstring names these families and their missing coherent/enhanced carriers. Ordinary triangulated carriers at the pins do not by themselves express these higher comparisons.

**Pinned objects and ownership.** I opened the declaration bodies, rather than inferring content from names. In the following inventory, library paths are relative to the named pinned library. The Mathlib pin is `6b7abb3c7686292736be2955bd3eb9ebf63b456a`, the Tau Ceti pin `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`; the main roadmap snapshot is `fa41b37`.

| Objects examined | Pinned file and line; implication for ownership |
| --- | --- |
| Quasicategory, inner fibration, bicategory | `Mathlib/AlgebraicTopology/Quasicategory/Basic.lean:41`, `InnerFibration.lean:72`, `StrictBicategory.lean:66`. Native inner-horn and bicategorical structures exist; they do not supply the full enhanced sheaf construction. |
| Simplicial nerve | `Mathlib/AlgebraicTopology/SimplicialNerve.lean:190`. It is an enriched-functor simplicial set, not the ordinary nerve; the dg comparison remains a target. |
| Derived category and K-injectivity | `Mathlib/Algebra/Homology/DerivedCategory/Basic.lean:87`, :95, :283; `Mathlib/Algebra/Homology/HomotopyCategory/KInjective.lean:42`. Localization and the acyclic-map/null-homotopy predicate exist. The predicate does not choose a functorial sheaf replacement. |
| Tor and projective dimension | `Mathlib/CategoryTheory/Monoidal/Tor.lean:44`; `Mathlib/CategoryTheory/Abelian/Projective/Dimension.lean:45`, :52. Tor derives tensor in its second argument; the dimension predicate quantifies over all higher Ext. These make R01 statable. |
| Perfect rings and perfection | `Mathlib/FieldTheory/Perfect.lean:44`, :121; `Mathlib/FieldTheory/PerfectClosure.lean:64`, :68. The first class only asserts bijectivity of p-th power, so the explicit prime/characteristic binders are necessary. PerfectClosure is the Frobenius-colimit quotient used here. |
| Regularity and completeness | `Mathlib/RingTheory/RegularLocalRing/Defs.lean:51`, :92; `Mathlib/RingTheory/Regular/RegularSequence.lean:146`; `Mathlib/RingTheory/AdicCompletion/Basic.lean:46`, :50, :56. Regular rings include Noetherianity. A regular sequence includes a nonzero quotient. Classical adic completeness includes separatedness. |
| Free presheaves and module sheaves | `Mathlib/Algebra/Category/ModuleCat/Presheaf/Generator.lean:57`, :75, :85; `Mathlib/CategoryTheory/Abelian/GrothendieckAxioms/SheafOfModules.lean:25`; `Mathlib/Algebra/Category/ModuleCat/Sheaf/Quasicoherent.lean:253`. The presheaf representing evaluation exists; sheafification and the enhancement are the additional constructions. Quasicoherence does not imply finite presentation. |
| Projectivity | `Mathlib/CategoryTheory/Preadditive/Projective/Basic.lean:48`, :89, :93, :115. It is lifting through all epimorphisms, without a compactness assumption; every set is projective by choice. Topos weak contractibility correctly reuses it. |
| DG carriers and H⁰ | `TauCeti/CategoryTheory/DG/Basic.lean:71`, :77; `DG/HomotopyCategory.lean:542`; `DG/Functor.lean:244`. These are imported mathematically, not duplicated as new DG/H⁰ carriers. |
| Enrichment signs | `TauCeti/Algebra/Homology/LinearHomComplex/Enrichment.lean:66`, :70, :126. Composition uses the Koszul braiding before cochain composition. The two degree-one factors acquire −1. |
| Ordinary sheaf tensor and Hom | `TauCeti/Algebra/Category/ModuleCat/Sheaf/TensorProduct/Monoidal.lean:104`, :112; `Closed.lean:73`. Tensor is sheafified sectionwise tensor; the closed structure exists. The roadmap derives it. |
| Extension by zero | `TauCeti/CategoryTheory/Sites/ExtensionByZero.lean:121`, :254, :315. Its preorder/lower-interval domain does not cover arbitrary site objects; E1.1's slice-free extension is not a duplicate. |

Object searches used the roadmap grep/show tools as well as the pinned trees and board packages. The 17 unresolved-name leads in the worker's citation report were resolved as named supplier targets, not mistaken for absent pinned declarations. In particular the almost-algebra names occur in PerfectoidSpaces P0.14, the DerivedDeRham names in DerivedModuleAlgebra, and the repleteness/cohomology names in SchemeAndStackFoundations. No new ownership collision or duplicate fully qualified Lean name was established.

| Supplier citation resolved on main | File and line read, and retained boundary |
| --- | --- |
| PurityOfBranchLocus §0.3 | `TauCetiRoadmap/PurityOfBranchLocus/README.md:168`, :183, :194. Cyclic/local dimension and residue-field regularity are supplied; the global all-module bound remains here. |
| DGAInfinity Layers 0–1 | `TauCetiRoadmap/DGAInfinity/README.md:263`, :277, :293. Cochain signs, Koszul braiding, enrichment, DG and H⁰ are supplied; the dg nerve is additional. |
| BordismFormalGroups F6.5 | `TauCetiRoadmap/BordismFormalGroups/README.md:1526`, :1823, :1944, :2005, :2119, :2190, :2225, :2248. Categorical/marked models, straightening, generic coherent diagrams, operadic carriers, stable quotients, Ind and relative adjunctions precede the sheaf/presentability extensions. |
| GeneralizedCohomology G2 and G3.8–G3.9 | `TauCetiRoadmap/GeneralizedCohomology/README.md:213`, :240, :260, :271, :302, :396, :405, :785, :878. Concrete spectra, models, HA and towers are supplied; comparison with abstract stabilization is here. |
| DerivedModuleAlgebra | `TauCetiRoadmap/DerivedModuleAlgebra/README.md:516`, :555, :626, :815, :888, :949, :973, :1018, :1060, :1093, :1113, :1132, :1151, :1171, :1208, :1237, :1268, :1403, :1573, :1666, :1693, :1733, :1788, :1808. Ordinary module constructions and cotangent/power laws are supplied; coherent sheaf and animated comparisons are the variants here. |
| SchemeAndStackFoundations | `TauCetiRoadmap/SchemeAndStackFoundations/README.md:602`, :848, :1138, :1565, :1604, :3265, :3309, :3388, :3437, :3924, :3965, :5613, :5643. Repleteness, ordinary DQCoh, perfection, sites, approximation and scheme cohomology exist as specifications; EDS adds enhancement and space pushforward. |
| AdicSpacesPartII R0.19.10 | `TauCetiRoadmap/AdicSpacesPartII/README.md:8005`, :8099. Object qcqs and algebraic-topos conditions are supplied; compactness of the terminal object is not included. |
| PerfectoidSpaces P0 and P7.16a | `TauCetiRoadmap/PerfectoidSpaces/README.md:879`, :965, :1187, :1262, :1366, :1714, :2034, :2095, :17433. Basic/root setups, almost modules, almost projectivity/étaleness and power-series regularity are supplied; the complete-local normalization and intrinsic Tor argument are targets here. |
| JacobianChallenge C and StableReduction 2 | `TauCetiRoadmap/JacobianChallenge/README.md:143`, :145, :165; `TauCetiRoadmap/StableReduction/README.md:405`. Proper scheme coherence requires no flatness; arbitrary-base-change applications carry their additional flatness assumptions. Algebraic-space proper-support extensions are not supplied there. |
| ProfiniteCohomology 0 and 10 | `TauCetiRoadmap/ProfiniteCohomology/README.md:583`, :1549, :1570. Discrete coefficients and all-degree finite-quotient cohomology are supplied; coherent categorical fixed points are additional here. |

The supplied open-head ownership searches included AnalyticStacks (its affine-derived discussion imports EDS), SheafTheoreticSmithTheory, ArcTopologyAndDescent and ClassicalAdicEtaleCohomologyPartII (their enhanced-category uses are consumers). The board's CrystallineCohomologyPartII derived-affine base-change discussion is a coefficient/application specialization, not an owner of general animated ringed spaces. This roadmap retains ownership of that general comparison. Only the supplied open checkouts were used for ownership conclusions; unrelated open roadmaps were not reviewed. No ownership move or declared supplier gap is required by this review.

**Adversarial computations.** The following 183 rows record concrete values for the target blocks, their defining laws, conventions and negative controls. A semicolon separates independent instances. “Pass” means these instances agree with the stated hypotheses and conclusion, not that an admitted general theorem has been proved. R01 changes only Lean coverage. Symbols k and A denote a field and a commutative ring, p a prime; cohomological shifts follow Hⁱ(K[1])=Hⁱ⁺¹(K). Unless R01 is indicated, no mathematical change is requested by that row.

| Statement or definition (README line) | Instances and computed values on the two sides | Result / change |
| --- | --- | --- |
| Grading and enrichment (43) | A[1] has H⁻¹=A and H⁰=0; mapping π₁ is H⁻¹. Two degree-one factors braid by (−1)¹=−1, and by +1 in characteristic 2. | Pass; same sign as DGAInfinity and pinned enrichment. |
| Full subcategory (204) | P=true gives every simplex of C; P=false gives ∅; selecting one endpoint of [1] gives Δ⁰ with endomorphism space *. | Pass; a discrete-on-vertices replacement would lose Hom(0,1). |
| Weak contractibility/finality (220) | {1}→[1] has comma nerves * at both vertices; {0}→[1] has ∅ over 1. Bℤ→* has π₁=ℤ and fails despite connectedness. | Pass; ordinary connected-comma finality is weaker. |
| Stable fibre/cofibre (235) | cofib(id_A)=0; cofib(A→0)=A[1]; fib(0→A[1])=A. In Ab the same suspension is 0, so its nerve is not stable. | Pass. |
| Local smallness (251) | A large indiscrete groupoid has each mapping homotopy type *, with small model Δ⁰; a large discrete mapping set has the same large π₀ and no such model. | Pass; raw simplex cardinality is not the condition. |
| DG nerve (268) | For a triangle, dη=gf−h; f=g=id gives h=id,η=0. For the square-zero degree −1 generator, π₁ of the endomorphism space is ℤ, versus 0 for ℤ alone. | Pass. |
| Inner horns (287) | The inner 2-horn fills with h=gf,η=0. An outer horn with f=0,h=id cannot solve gf=id on a nonzero degree-zero module. | Pass; no Kan claim for arbitrary DG nerves. |
| H⁰ comparison (305) | A boundary degree-zero map has class 0 on both sides; the complex [ℤ→id ℤ] has zero endomorphism class of its identity. | Pass; closed maps alone would retain that identity as a nonzero chain map. |
| Dold–Kan mapping comparison (317) | Hom=k[1] gives π₀=0,π₁=k on both sides; acyclic [k→id k] gives all πᵢ=0. | Pass; good truncation essential. |
| DG simplicial enrichment (329) | Hom=k[0] gives constant simplicial k; Hom=0 gives a point. Multiplying degree-zero elements gives the same ab on both enrichments. | Pass. |
| Coherent nerve comparison (341) | Discrete Hom gives the ordinary nerve with triangles h=gf; square-zero degree −1 Hom retains π₁=k on both sides, lost by the ordinary H⁰ nerve. | Pass. |
| Shift/cone and triangle signs (353) | Cone(id_A) is acyclic; Cone(0→A)=A; rotating A→0→A[1] gives last map −id_A[1], not +id over ℤ. | Pass. |
| CoCartesian sections (369) | Constant diagram on C over [1] has coCartesian sections equivalent to C; over BG its limit is Fun(BG,C). For E=B→B, the section category is terminal, not the centre of B. | Pass. |
| κ-filteredness (383) | The empty test in K=∅ has 0 extensions; K=* has 1. Two distinct vertices in a discrete two-point K have 0 common cocones. | Pass. |
| Accessibility/presentability (395) | A point is ω-compact; the identity of ℕ does not factor through a finite subset in the filtered union ℕ=colim Fin(n). An infinite free module similarly fails compactness. | Pass; presentable is not synonymous with compact. |
| Presheaf presentability (408) | C=* gives P(C)=Spaces and Map(y*,F)=F(*); C=∅ gives the terminal category. Both match Yoneda/localization formulas. | Pass. |
| 0.1 enhancement (436) | At a point, k[0] has H⁰=k; k[1] has H⁻¹=k; [k→id k] maps to 0. Over ℤ, Ext¹(ℤ/p,ℤ/p)=ℤ/p survives as π₀ Map(ℤ/p,ℤ/p[1]). | Pass; the enhancement is not a discrete H⁰ model. |
| 0.2 replacements (454) | [ℤ→p ℤ] resolves ℤ/p. The unbounded acyclic ℤ/4 complex with every differential 2 becomes a zero-differential ℤ/2 complex after tensor, with Hⁱ=ℤ/2 for every i. | Pass; termwise flat does not imply unbounded K-flat. |
| 0.3 tensor–Hom (473) | (ℤ/p)⊗ᴸℤ(ℤ/p) has H⁻¹=H⁰=ℤ/p; RHomℤ(ℤ/p,ℤ) has H⁰=0,H¹=ℤ/p. These agree with the two-term resolution and adjunction. | Pass; ordinary tensor/Hom would lose these groups. |
| 0.3 inverse limits (485) | Constant identity A tower: ker(1−s)=A,coker=0. Zero-transition tower: 1−s=id, both 0. Multiplication-p ℤ tower: lim=0,lim¹=ℤ_p/ℤ. | Pass; no arbitrary cofiltered exactness. |
| 0.3 completion (500) | ℤ completes to ℤ_p, with unit the inclusion; ℤ/p is complete with reduction H⁻¹=H⁰=ℤ/p; ℤ[1/p] completes to 0 although nonzero. | Pass; derived reductions and completeness retained. |
| 0.4 functors/mates (522) | Identity morphism has unit=counit=id and exchange=id. Two identity squares compose to id. For a module free of rank r, coefficient adjunction gives Hom_B(Bʳ,N)=Nʳ=Hom_A(Aʳ,N). | Pass; no automatic exchange equivalence asserted. |
| Slice-free sheaves (553) | On two discrete points, O_U=(k,0) represents evaluation at the first point: Hom((k,0),(M,N))=M, whereas Hom(O,(M,N))=M×N. | Pass; global free sheaf is the wrong model. |
| DG sheaf complexes (565) | At a point, differential on a degree-zero cochain f is d_Yf−fd_X; for the identity two-term complex, its identity is a boundary and H⁰ End=0. | Pass. |
| Replacement DG comparison (579) | Over a field every acyclic complex splits and is contractible; [k→id k] has contractible mapping spaces into a K-injective target. Replacement of k[0] leaves H⁰=k. | Pass. |
| Enhanced derived category (594) | For K=L=ℤ/p and target L[1], mapping π₀=Ext¹=ℤ/p and π₁=Hom=ℤ/p. Homotopy-category maps recover π₀ only. | Pass. |
| Presentability comparison (608) | In D(k[C_p]), Extⁿ(k,k)=k for all n≥0 in characteristic p, so k is not a perfect/compact module; exact products still give left completeness. | Pass; no unit-compactness deduction from presentability. |
| Derived sheaf tensor (623) | At a point k⊗ᴸkM=M; 0⊗ᴸM=0; ℤ/p self-tensor has two nonzero cohomology groups. | Pass. |
| Internal Hom (638) | RHom(0,L)=0; RHom(k,L)=L; RHomℤ(ℤ/p,ℤ)=ℤ/p[−1]. The last has positive cohomology despite ordinary Hom=0. | Pass. |
| Pullback/pushforward (652) | Identity gives id⊣id. Extension along ℤ→ℤ/p sends ℤ to ℤ/p and ℤ/p to ℤ/p⊕ℤ/p[1]; underived pullback would omit H⁻¹. | Pass. |
| Finite-cell coefficient action (664) | For C₂ over ℚ, invariants of the sign representation are 0; invariants of the unit are ℚ. Thus F(1⊗sign)=0 differs from F(1)⊗sign=sign although F is exact. | Pass; internal coefficients must lie in the stated unit-generated class. |
| Point-site Hom (680) | RHomℤ(ℤ[1/p],ℤ) has H⁰=0,H¹=ℤ_p/ℤ; the point-site construction has the same two values. | Pass; first argument need not be perfect. |
| Koszul comparison (720) | Empty sequence gives A[0]; (p) over ℤ gives H⁰=ℤ/p,H⁻¹=0; (0) gives A in degrees 0 and −1. | Pass; cochain reindexing matches supplier. |
| Global regular dimension (734; Lean:56) | Field: dim=pd=0; ℤ: dim=1,pd(ℤ/p)=1; zero ring: only module 0 and all Ext=0. Dual numbers have pd(k)=∞ and fail regularity. | Pass. |
| Kunz forward (747; Lean:62) | Frobenius on 𝔽_p[t] is free of rank p with basis 1,…,t^(p−1). On 𝔽_p[ε]/ε² it kills ε and is not flat (p=2 or 3). | Pass. |
| Root ideal definition/radical (759; Lean:79,84) | f=0 gives 0, f=1 gives R. In 𝔽_p[t^(1/p∞)], the ideal contains t^(1/p), unlike (t); its radical is exactly all positive t-root multiples. | Pass. |
| Root flatness/idempotence (759; Lean:91) | For f=t, t^(1/pⁿ)=(t^(1/pⁿ⁺¹))^p lies in I²; thus I²=I. f=0 gives 0²=0, f=1 gives R²=R. In k×k with f=(1,0), I=I²=k×0, a flat direct summand. | Pass. |
| Tor independence (777; Lean:100) | Perfect A=B=C=k gives positive Tor=0. Perfect reduced quotient pairs at the node have Tor₁=0; the ordinary quotients R/(x),R/(y) used below are not perfect. | Pass; the latter are not counterexamples to this theorem. |
| Perfect-presentation bound (789; Lean:111) | m=0 gives flat perfected polynomial algebra, positive Tor=0; relation 1 gives zero algebra; relation t gives bound 1. With J=(t^(1/p∞)), Tor₁(R/J,R/(t))=(t)/tJ≠0. | Pass; degree m+1 vanishing does not mean flatness. |
| Projective bound after perfection (801; Lean:126) | A field presentation of dimension 0 yields upper bound 1 although actual pd=0; presenting that field as a quotient of k[t]_perf yields upper bound 2, still valid. | Pass; presentation-dependent bound is distinct from R01. |
| Cohen presentation/completion (813) | k[ε]/ε²=k[[x]]/(x²); k needs zero variables. 𝔽_p[t]_(t) completes to 𝔽_p[[t]], with Frobenius rank p before and after. | Pass; presentation existence does not imply regularity. |
| Almost normalization/diagonal (823) | P=R,f=1: R⊗_P R=R, diagonal idempotent=1 and retraction=id. For R=P×P, the diagonal idempotent is (1,0,0,1) in P⁴. | Pass; root flatness alone does not supply a diagonal idempotent. |
| Intrinsic Tor bound (833) | Field d=0: Torᵢ=0 for i>0. Perfect node d=1: class [y]≠0 in Tor₂ of the ordinary branch quotients; flat Ann(x) implies Torᵢ=0 for i≥3. | Mathematically consistent; add the missing Lean headline (R01). |
| Kunz converse (845; Lean:68) | Field: flat Frobenius, regular. Dual numbers: ε↦0 and nonflat Frobenius, nonregular. The Noetherian hypothesis is explicit in the signature. | Pass. |
| Valuation saturation (859; Lean:140,153) | Dense full-real value group: Hom_V(m,V)=V and multiplication is bijective; Hom_V(m,m)=V, so m→Hom(m,m) misses id. For a DVR m=πV, V→Hom(m,V) is multiplication by π and not onto. | Pass; saturation is not torsion-freeness. |
| Saturated finite freeness (877; Lean:161) | M=0 gives n=0; M=aV⊂K, a≠0, gives n=1; open unit ball m fails saturation. Without full-real value group, a nonprincipal radius cut can be bounded/saturated but not finite free. | Pass; all three geometric norm hypotheses retained. |
| Dqc and perfect objects (891) | On Spec k, unit corresponds to k; an infinite direct sum of k is quasicoherent but not perfect. Zero corresponds to zero on both sides. | Pass. |
| Perfect-scheme base change (903) | Perfect-field square gives k⊗ᴸkk=k. Ordinary ℤ→ℤ/p self-base-change gives extra Tor₁=ℤ/p, explaining why ordinary fibre-product exchange needs Tor independence. | Pass. |
| Cohomology base-change map (915) | For K=ℤ/p[−1], H⁰(K)⊗ℤ/p=0 while H⁰(K⊗ᴸℤ/p)=ℤ/p. The comparison exists but is not always an isomorphism. | Pass. |
| Splitting obstruction (927) | Extension 0→ℤ→pℤ→ℤ/p→0 has nonzero class in Ext¹(ℤ/p,ℤ)=ℤ/p; tensoring with ℚ sends it to 0. | Pass; exact nonfaithful functors can kill the obstruction. |
| Affine tensor adapter (939) | On Spec ℤ, self-tensor of the sheaf ℤ/p has H⁻¹=H⁰=ℤ/p, exactly the module tensor. The ℤ/4 acyclic example again rejects unbounded termwise-flat substitution. | Pass. |
| Proper-support coherence (976) | RΓ(ℙ¹_k,O)=k in degree 0; for A¹_k, H⁰(O)=k[t], not a finite k-module. A closed point supported on A¹ pushes to k. | Pass; support properness is substantive. |
| Noetherian perfect pushforward (1025) | Closed point over k[t] has perfect pushforward [k[t]→t k[t]] of amplitude [−1,0]. The residue field over dual numbers has infinite projective dimension. | Pass; relative perfectness is required. |
| Approximation with data (1066) | A coefficient involving t³⁷ descends once t does; in the system A→A[1/t], the nonflat A/(t) becomes 0 at that stage. Ordinary derived pullback at the first stage would retain a Tor term. | Pass; eventual flatness and coefficient data cannot be omitted. |
| Arbitrary-base proper-support theorem (1106) | For A=k[t], B=A[ε]/(tε,ε²), G=A, and base k, ordinary pullback of G gives k. Derived B-pullback has Tor₂^B(A,B/t)=k; substituting it changes the asserted object. | Pass; the roadmap's ordinary pullback of target-flat G is deliberate. |
| Relative Kan extension (1172) | Full inclusion {0}⊂[1] and chosen value x: left Kan extension is x→id x; its extension space is contractible. Empty inclusion gives the initial diagram when initial objects exist. | Pass. |
| Terminal fibre finality (1188) | Over [1] with terminal fibre, each overcategory contracts to its specified terminal lift; in the one-object identity case its nerve is *. | Pass; merely nonempty fibres would not suffice. |
| Representability (1204) | On Spaces, Map(*,−)=id is represented by *; constant terminal functor is represented by ∅, since Map(∅,X)=*. Variance is covariant in X. | Pass. |
| Adjoint theorem (1216) | −×S on Spaces is left adjoint to (−)^S; at S=∅ these are constant ∅ and constant *, and both sides of the adjunction mapping formula are *. | Pass. |
| Localization/coreflection (1228) | Empty localization set gives id; localizing a stable category by killing a generating unit gives zero. The localizing inclusion and reflector have the stated opposite adjoint directions. | Pass. |
| Restricted left-adjoint limits (1240) | Identity pullback diagram C→C←C has limit C with identity projections; terminal diagram gives the terminal category. | Pass within the specified shape hypotheses. |
| Exactness and coproducts (1254) | Zero and identity stable functors preserve both. In D(k), inclusion of finite-dimensional objects cannot preserve an infinite coproduct: ⊕ℕk is infinite-dimensional. | Pass; finite sums alone are insufficient. |
| Compact generation/right adjoints (1266) | Tensor with finite kʳ has right adjoint Hom(kʳ,−), commuting with sums; Hom(⊕ℕk,−) gives products and fails the same compactness test. | Pass. |
| Ringed diagram category (1280) | Constant ring over [1] gives the arrow category of D(R), not D(R)×D(R); an arrow 0→R and R→0 have different source/target evaluations. | Pass; transport is part of the object. |
| Coefficient-tower comparison (1294) | Constant coefficient ring yields ordinary coherent towers. For ℤ/pⁿ, reduction of ℤ/p has additional Tor in negative degrees, so a constant family of degree-zero ℤ/p's is not the required Cartesian family. | Pass. |
| Mates (1306) | Identity squares give identity mates. The unit/counit recipe has direction g*Rf*→Rf′*g′*; a reversed free/forgetful square would require a nonexistent map from * to ∅ in the test slice. | Pass; direction fixed. |
| Cardinal cutoffs (1318) | For the same small x,y, both cutoffs give Map(x,Ry)=Map(Fx,y); for the identity functor both yield y, with comparison id. | Pass; comparison keeps the original input fixed. |
| Product–difference tower (1345) | Identity A tower gives fibre with H⁰=A,H¹=0; zero transitions give fibre 0; p on ℤ gives H⁰=0,H¹=ℤ_p/ℤ. | Pass. |
| Products of lim¹ (1363) | In a sequential module tower, product of two degree-one limit-filtration classes lies in filtration 2=0. The opposite-category tail example produces V=(∏ℚ)/(⊕ℚ)≠0 and a nonzero bilinear product without the tensor/colimit hypothesis. | Pass; the hypothesis excludes that example. |
| Finite-dimensional limit filtration (1380) | For terminal index, d=0 and F¹=0; for sequential modules d=1 and F²=0. Multiplication adds filtration indices 1+1=2. | Pass; no assertion that tensor commutes with all limits. |
| Pro-zero definition (1452; Lean:182) | Zero-transition A tower is killed after one step. Identity nonzero A tower is never killed. p-multiplication on ℤ has limit 0 but every transition pᵏ≠0. | Pass. |
| Pro-isomorphism/composition (1452; Lean:187,200) | 0→a zero-transition A tower has pro-zero kernel/cokernel; composite with another such map again has zero eventual maps. For identity towers, the condition reduces to an ordinary isomorphism. | Pass; cancellation is not falsely attributed to the Lean composition theorem. |
| Cofinal pro-zero invariance (1452; Lean:193) | Subsequence n↦2n keeps zero transitions zero; identity A stays non-pro-zero. Noncofinal constant n↦0 can lose eventual killing, and is excluded. | Pass. |
| Stable pro-zero (1473) | Zero transitions are null after one step. In D(ℚ[t]), degree(t)=−2, shifted powers of t kill every fixed cohomology degree eventually but remain nonzero module maps. | Pass; cohomological and stable pro-zero differ. |
| Operadic monoidal category (1499) | Over Comm, fibre at ⟨n⟩ is Cⁿ; n=0 gives *, n=1 gives C, n=2 gives C×C. | Pass; Segal fibres exclude an arbitrary fibration. |
| Operadic algebras (1513) | Unit algebra R has multiplication ab and unit 1; the zero binary multiplication on nonzero R fails the unit identity 1·a=a. | Pass. |
| Modules/scalar extension (1525) | Extension along id_R returns M; extension R→0 returns 0; (ℤ/p)⊗ᴸℤ(ℤ/p) retains two terms. | Pass. |
| Monoidal envelope (1537) | The Comm envelope has finite-set objects: tensor adds cardinalities, 1⊗1 has cardinality 2 and the unit has cardinality 0. | Pass; collapsing colours to one object is wrong. |
| Derived families (1553) | Constant identity family over [1] localizes to the same arrow transport; localizing an acyclic fibre sends [k→id k] to 0 and retains its coherences. | Pass; objectwise H⁰ does not determine the family. |
| Symmetric derived tensor (1569) | Unit R⊗ᴸM=M; two degree-one classes interchange with −1; over 𝔽₂ the same sign evaluates to +1. | Pass. |
| Stable monoidal comparison (1579) | Tensor of Cone(id_R)=0 with M is 0= Cone(id_M); tensor of R[1] is M[1]. | Pass. |
| Exact monoidal functors (1589) | Scalar extension sends [ℤ→pℤ] to [𝔽_p→0𝔽_p]; its cofiber remains 𝔽_p⊕𝔽_p[1], with the rotated negative sign. | Pass. |
| Idempotent completion (1599) | On k², e=diag(1,0) satisfies e²=e and splits with image k; e=0 splits with image 0. A category omitting that image is enlarged. | Pass. |
| Stable/thick/localizing closure (1611) | Perfect k-complexes are closed under finite cofibres and retracts; ⊕ℕk lies in their localizing closure but not their thick closure. | Pass. |
| Barr–Beck–Lurie (1627) | Free/forgetful modules over k have monad k⊗−; its algebras recover k-modules. A zero functor from nonzero D(k) is not conservative: id_k maps to id_0. | Pass; hypotheses rule out the wrong reconstruction. |
| Compact objects (1654) | Hom(k,⊕ᵢMᵢ)=⊕ᵢMᵢ; identity of ⊕ℕk cannot factor through a finite partial sum. | Pass. |
| Ind comparison (1668) | Ind(Perf(k))=D(k); the compact objects are retracts of finite-cell complexes. Adding all infinite sums as compact would wrongly include ⊕ℕk. | Pass. |
| PrL/PrR (1681) | The pair −×S ⊣ (−)^S reverses arrows; for S=* both directions are id. It is the adjoint, not the same underlying functor, that reverses. | Pass. |
| Limits in PrL (1693) | C×D is the discrete two-object limit with left-adjoint projections; the empty limit is the zero presentable category. | Pass. |
| Limits in PrR (1703) | For a constant identity tower C, the limit is C and evaluation is id; for the discrete pair, projections from C×D are right adjoints too. | Pass. |
| Spectra (1715) | Ω∞Hk has π₀=k,πᵢ=0 for i>0; suspension Hk[1] has π₁=k. Zero spectrum has every πᵢ=0. | Pass; stabilization retains negative as well as positive shifts. |
| Presentable tensor (1729) | Spaces⊗C=C; in the stable setting Sp⊗C=C; Mod_R⊗Mod_S gives Mod_(R⊗ᴸS) in the stated relative setting. For R=S=ℤ/p over ℤ, Tor₁=ℤ/p remains. | Pass. |
| Formal inversion (1741) | Inverting the tensor unit changes nothing; inverting 0 forces 1=0 and the stable category becomes zero. | Pass; mere restriction to existing invertibles is wrong. |
| Ind quotient (1755) | Quotient by 0 returns C; quotient by a generating unit is 0; the kernel contains retracts, so e=diag(1,0) is killed when k² is. | Pass. |
| Accessible compactness (1765) | Identity preserves κ-compact objects at each cutoff; Hom(kʳ,−) preserves filtered colimits, while the infinite-rank Hom fails at ω. | Pass; cutoff matters. |
| Group actions/fixed points (1775) | Trivial group gives C. For C_p and trivial 𝔽_p, Hⁿ(C_p,𝔽_p)=𝔽_p in all n≥0; for S₃ on its rational regular representation, invariants have dimension 1. | Pass; derived fixed points are not ordinary invariants. |
| Compact morphisms/exhaustions (1789) | A finite-rank map k^(ℕ)→k^(ℕ) factors through kʳ; the identity has infinite rank and no such finite factorization. The union of finite partial sums is k^(ℕ). | Pass. |
| Dualizable/compactly assembled categories (1801) | D(k) is Ind(Perf(k)) and is dualizable; its zero retract is 0. Evaluation on finite free modules pairs a basis with its dual to give the usual scalar pairing. | Pass. |
| Filtered colimits of dualizable categories (1813) | Constant identity diagram D(k) has colimit D(k), with the same evaluation/coevaluation; zero diagram has colimit 0 and both maps zero. | Pass within the stated morphism class. |
| Trace-class/rigidity (1825) | Identity on kʳ has trace r; a rank-one projector has trace 1; identity on an infinite direct sum does not factor through a dualizable finite-rank object. | Pass; arbitrary maps are not trace-class. |
| Descendability/index (1850) | R→R has fibre 0 and index ≤1; 0→0 admits index 0. For ℤ_p→𝔽_p, the nth fibre-power map is multiplication by pⁿ≠0 for every finite n. | Pass; recovery by totalization alone is weaker. |
| Module descent/permanence (1864) | Split cover R→R×R recovers R-modules as compatible pairs; identity cover has constant Amitsur diagram and totalization M. | Pass. |
| Uniform index and examples (1876) | A square-zero ideal has I²=0, giving finite index ≤2; locally nilpotent ideals with unbounded nilpotence exponents give no uniform index. A fixed m gives the stated 2m uniform estimate. | Pass; uniformity is necessary. |
| Eilenberg–Mac Lane/modules (1901) | HR has π₀=R and other homotopy zero; ℤ/p derived self-tensor gives π₀=π₁=ℤ/p on both the spectral and cochain sides. | Pass. |
| Concrete/abstract spectra (1919) | The sphere has π₀=ℤ on both models; Hk has only π₀=k. Positive cofibrancy does not include the sphere, unlike the ordinary stable projective model. | Pass; model hypotheses distinguished. |
| Concrete towers (1931) | holim H(ℤ/pⁿ)=Hℤ_p; the maps on the two terms of derived 𝔽_p reduction are id in degree 0 and multiplication by p=0 in degree −1. | Pass; the Tor term dies in the limit. |
| Siftedness (1957) | Empty index has empty colimit of terminal objects, not terminal; two discrete points give 2 elements but its square gives 4. For the walking reflexive pair, the diagonal comma has 13 objects, 40 nonidentity arrows and 106 normalized 2-simplices; rational boundary ranks 12 and 26 give H₁ rank 40−12−26=2. | Pass; independently computed from its finite category. |
| Nonabelian derived category (1970) | PΣ(FinSet)=Spaces; its discrete objects give sets, but K(ℤ,1) has π₁=ℤ and is also present. Ordinary Ind(FinSet)=Set would omit it. | Pass. |
| Animation universal property (1982) | A functor on finite free objects extended to their constant presentations returns its original values; polynomial algebra A[t] retains its one free generator. The empty free set returns the unit algebra A. | Pass. |
| Animated rings (1992) | 𝔽_p⊗ᴸ_(𝔽_p[t])𝔽_p has π₀=π₁=𝔽_p and higher π=0. Its ordinary pushout has only π₀ and is not the animated pushout. | Pass. |
| Frobenius/perfection (2006) | On the preceding π₁ class, Frobenius is 0; its Frobenius-colimit kills π₁. Over imperfect 𝔽_p(t), the difference of two pth roots in the tensor of perfections has pth power 0 but is nonzero. | Pass; base perfection hypothesis matters. |
| Simplicial Witt vectors (2018) | For discrete 𝔽_p, π₀W=ℤ_p and πᵢW=0 for i>0; for higher simplicial input the underlying πᵢ-set is the countable product of πᵢ of the input. Reduction π₀W/p=𝔽_p. | Pass; the Witt addition is not coordinatewise addition. |
| Bounded totalization (2035) | A normalized cosimplicial term k[2] only in degree 2 gives Tot₁=0 but Tot=k[0]. The bound r≥b−j+1 with b=2,j=0 gives r≥3, which retains this term. | Pass; premature truncation would lose k. |
| Animated versus E∞ algebras (2051) | Over ℚ, symmetric-group higher homology is 0; over 𝔽₂, Hₙ(BC₂,𝔽₂)=𝔽₂ for all n≥0 in the quadratic free E∞ term. | Pass; comparison is not an integral equivalence. |
| Animated modules (2065) | For discrete B=k, End(unit) has only π₀=k and the category is D(k); for the animated pushout above, End(unit) has π₁=k as well. | Pass; replacing B by π₀B loses information. |
| Replete slices (2092) | In Set/U, an epimorphic tower has surjective fibres over each u, so its limit projection is surjective fibrewise; for U=∅ the slice is terminal. | Pass. |
| Repleteness on covers (2102) | Covering a two-point set by its two points reduces surjectivity to two independent fibre tests; an empty family covers only the empty object. | Pass. |
| Relative inverse-limit epimorphisms (2114) | Constant surjections B→C give limit map B→C, surjective. The relative matching condition becomes B→B×_CC=id_B in the identity-transition case. | Pass; levelwise surjectivity alone is not the stated condition. |
| Countable products (2126) | A product of surjections of sets/modules is surjective by choice; product of zero modules is 0. In a replete topos this is the countable exact-product consequence, not all cofiltered limits. | Pass. |
| Sequential amplitude (2142) | Tower ℤ←pℤ←p… gives H⁰=0,H¹=ℤ_p/ℤ and Hⁱ=0 for i≠0,1; identity tower A gives H⁰=A only. | Pass; amplitude [0,1] is sharp. |
| Milnor (2152) | For degree-zero multiplication-p tower and j=1, sequence is 0→ℤ_p/ℤ→ℤ_p/ℤ→0→0; identity tower at j=0 gives 0→0→A→A→0. | Pass. |
| Pro-zero errors (2168) | Zero-transition A tower has lim=lim¹=0, so a cone of this form changes no derived limit. Multiplication-p tower has lim¹≠0 and is excluded. | Pass. |
| Postnikov completion (2182) | K=A[1]: τ≥0K=0 and τ≥−nK=A[1] for n≥1; its inverse limit is A[1]. Constant degree-zero A stays A at every stage. | Pass; truncations have the correct direction. |
| Ψ adjunction (2194) | For F=Ψℤ[1],G=constant ℤ, Map(F₁,G₀)=*=Map(F₀,G₀), whereas full RHom is ℤ[−1] versus 0. | Pass; roadmap uses mapping spaces, avoiding the source's proof error. |
| Compatible truncation reconstruction (2206) | The A[1] tower above reconstructs A[1], whose τ≥0=0 and τ≥−1=A[1], exactly its prescribed stages. | Pass. |
| Left completeness (2218) | For A[3], degree −3 stabilizes at n=3, and all other groups are 0. Testing only nonnegative cohomology would see the zero object instead. | Pass; all integer degrees are covered. |
| Exact-sections comparison (2228) | On Set, Γ is identity: RΓ(A[1])=A[1] and its Postnikov limit is A[1]. For C_p invariants in characteristic p, higher groups are nonzero and exactness fails. | Pass. |
| Local injectivity (2244) | On a point an eventually-zero Hᵐ tower has lim=0; the product-difference kernel injects into the product and is 0 for zero transitions. | Pass in the stated local vanishing range. |
| Uniform stabilization (2254) | With b=0, m=0 the given cutoff N=1 suffices; with m=−3 it gives N=4. A[3] actually stabilizes from n=3, so the stated bound is safely larger. | Pass; negative degrees included. |
| Diagonal bounds (2272) | For identity sections, H^q(U,A)=0 for q>0, so the diagonal tail is zero and A[3] converges. Shifting the complex changes the cutoff, not the limit. | Pass. |
| Local dimension bounds (2284) | A point has dimension/cohomological bound 0 and gives the previous values; the allowed q<0 case yields no spurious nonnegative cohomology assertion. | Pass. |
| Finite-cohomological-dimension criterion (2296) | Set has bound 0 and D(Ab) is left complete; B C_p with 𝔽_p coefficients has Hⁿ=𝔽_p unbounded and cannot use a finite bound. | Pass; sufficient criterion is not asserted necessary. |
| Exact sections/projectivity (2310) | Every set is projective. In C_p-sets, C_p→1 has no equivariant section; invariants of ℤ[C_p]→ℤ have image pℤ, not ℤ. | Pass; terminal object need not be projective. |
| Locally weakly contractible topoi (2322) | Set is covered by singleton projectives. For infinitely many parallel arrows, a fibre product of representables has infinitely many discrete components and is not quasicompact. | Pass; coherent covering hypotheses exclude that presheaf example. |
| Compact generators (2335) | At a point, ℤ[n] detects H⁻ⁿ and generates D(Ab); infinite direct sums are not compact. In B C_p the free orbit's free module is compact, the trivial 𝔽_p module is not. | Pass. |
| Hypercovers (2350) | Čech nerve of {0,1}→* has U₀ of size 2 and U₁ of size 4; the constant simplicial two-point object has U₁ size 2 and misses off-diagonal matching pairs. | Pass; a cover alone does not define a hypercover. |
| Cartesian systems (2362) | For that cover, pullback sends k to (k,k) at level 0. Raw global sections k→k² are not an isomorphism although the sheaf pullback is the Cartesian comparison. | Pass. |
| Bounded hypercover descent (2374) | For the split two-point cover, augmented Čech complex k→k²→k⁴→… contracts; H⁰=k and Hⁱ=0 for i>0. | Pass. |
| Unbounded full faithfulness (2386) | The same split contraction works degreewise for ⊕ₙk[n]; both mapping spaces after descent equal the original mapping space, not just π₀. | Pass. |
| Left-adjoint counit (2398) | For the identity hypercover f!=id, f*=id and counit=id_K. Split Čech descent recovers k from the compatible constant datum. | Pass; adjoint direction retained. |
| Unbounded hypercover equivalence (2408) | On Set, the split two-point hypercover's compatible system (k^{2^(n+1)}) reconstructs k; 0 reconstructs 0. | Pass under repleteness. |
| Refinement (2420) | Refining a split cover by its identity leaves the descent object k; two identity refinements compose to id, as does the comparison. | Pass. |
| Space sheaves/Postnikov (2432) | On a point, τ≤nK(ℤ,2) is * for n<2 and K(ℤ,2) thereafter; limit is K(ℤ,2). | Pass; neither hypercompleteness nor Postnikov completeness is defined as the other. |
| Locally weakly contractible space convergence (2444) | Evaluation at a singleton gives the same tower and limit K(ℤ,2); covering Set by points detects the equivalence. | Pass. |
| Perfect h-topology (2458) | Identity and a finite disjoint-union surjection cover; ∅→Spec k does not. Perfection sends nilpotent ε to 0, so a purely nilpotent thickening has the same perfect scheme. | Pass. |
| Inductive level (2470) | Identity has level 0; a blowup along its centre is an allowed level ≤1 step. Blowing up the unit ideal gives the identity, so minimal level remains 0. | Pass. |
| Geometric descendability (2482) | Split finite faithfully flat cover R→R×R has a module retraction; dual-number quotient has square-zero kernel, so its fibre-power map vanishes at power 2. | Pass. |
| Enhanced proper coherence (2494) | Closed point over k[[t]] pushes O to k, coherent but not flat, with higher cohomology 0. ℙ¹ with O/(t) also gives H⁰=k,H¹=0. | Pass; no hidden flatness assumption. |
| Noetherian h-cover descendability (2525) | Nilpotent ideal I with Iᵃ=0 gives the needed finite vanishing; a locally nilpotent ideal with arbitrarily large exponents does not give such a uniform a. | Pass; Noetherian reduction supplies finite control. |
| Derived schemes/base change (2538) | Self-intersection of Spec k in Spec k[t] has π₀=k,π₁=k; its ordinary intersection has only k. The derived base-change square retains both groups. | Pass; no ordinary-fibre-product substitution. |
| Quantitative perfect h-descendability (2550) | Identity cover permits m=1 and the stated 2m=2 estimate; square-zero/Frobenius error is killed after a finite stage, while an unbounded sequence of exponents has no fixed stage. | Pass; uniformity is explicit. |
| Boundedness detection (2562) | A surjective identity cover detects the interval of k[1] as [−1,−1]; pullback to ∅ sends it to 0 and would falsely detect every interval. | Pass; surjectivity retained. |
| h-descent Dqc/Perf (2574) | Split two-point perfect cover reconstructs k and finite free kʳ from compatible pairs. Infinite-rank k^(ℕ) descends in Dqc but does not become perfect. | Pass. |
| Tensor and bounded totalization (2586) | Over k, tensor by kʳ commutes with Tot and yields r copies on both sides; a degree-zero cosimplicial module with finite cohomological bound has no terms beyond that bound. | Pass within finite regular-dimension hypotheses. |
| Unbounded h-hyperdescent (2598) | Perfect field base has regular-presentation dimension 0; split Čech hypercover gives Tot RΓ=k, including all shifts. A general perfect ring has no automatic finite presentation-dimension bound. | Pass. |
| Complete sheaf definition (2626; Lean:215) | I=0: telescope δ=id and every module is complete. I=R: for f=1, constant sequences lie in ker δ, so only zero can be complete. For ℤ_p and f=p, δ⁻¹(y)_n=Σⱼpʲy_(n+j). | Pass; local-section quantification retained. |
| Generator criterion (2639; Lean:222) | (p) and (p,p²) give the same complete modules; ℤ_p passes and ℤ[1/p] fails. The shifted-localization Hom test gives 0 for ℤ_p in every degree. | Pass; signature matches telescope comparison. |
| Limits of complete objects (2651) | ∏ℕℤ_p is complete, with coordinatewise telescope solution. ⊕ℕℤ_p is not: the solution to y_n=e_n has infinitely many nonzero coordinates at n=0. | Pass; inclusion does not preserve coproducts. |
| Reflector (2661) | L_(p)(ℤ)=ℤ_p; L_(p)(ℤ[1/p])=0; L_0(K)=K. Applying L twice gives the same three values. | Pass. |
| Completed colimits (2676) | colim(ℤ_p→pℤ_p→p…)=ℚ_p in modules, whose derived p-completion is 0; the colimit inside the complete category is therefore 0. | Pass. |
| Koszul completion (2688) | Empty sequence gives constant K; (0) adds K[1] with zero transition, whose limit is 0; (p) over ℤ gives ℤ_p. | Pass; quotient and Koszul towers are not conflated generally. |
| Regular quotient model (2706) | A=k[x,y], I=(x,y): A/I² has resolution ranks 1,3,2 and amplitude [−2,0], although I² has three minimal generators. r=0 gives A. | Pass; powers need not be regular-sequence ideals. |
| Weak Serre property (2721; Lean:243) | Multiplication p on ℤ_p has kernel 0 and cokernel 𝔽_p, both complete. The submodule ℤ⊂ℤ_p is not complete, so this is not arbitrary submodule closure. | Pass. |
| Completeness on cohomology (2733) | ℤ_p[1] is complete with only H⁻¹=ℤ_p; ℚ_p[1] is not, with H⁻¹=ℚ_p. Zero has every cohomology module 0 and passes. | Pass. |
| Classical/separated comparison (2745; Lean:235) | ℤ_p is derived complete and separated, and lim ℤ_p/pⁿ=ℤ_p. For the displayed c₀-cokernel, [e₀]=pⁿ[eₙ]≠0 for all n, so derived completeness holds but separatedness and classical completeness fail. | Pass; separatedness is essential. |
| Complete Hom (2760) | RHom(ℤ,ℤ_p)=ℤ_p; RHom(ℤ[1/p],ℤ_p)=0. The first argument in the second example is not complete. | Pass; only the target needs completeness. |
| Completed tensor (2772) | 𝔽_p⊗̂ℤ𝔽_p has H⁻¹=H⁰=𝔽_p; ℤ_p is the completed unit. Completing ordinary 𝔽_p⊗ℤ𝔽_p would leave H⁻¹=0. | Pass. |
| Completed adjunction (2784) | Taking K=completed unit ℤ_p leaves Map(K′,L) on both sides; taking K=0 makes both mapping spaces contractible. | Pass; coherent tensor–Hom is the assertion. |
| Coefficient systems (2796) | Red(ℤ_p)_n=ℤ/pⁿ. A constant degree-zero 𝔽_p family fails: 𝔽_p⊗ᴸ_(ℤ/p²)𝔽_p has nonzero Tor₁. | Pass; transition equivalences are derived. |
| Reduction (2809) | Red(𝔽_p)_n over ℤ has H⁻¹=H⁰=𝔽_p; transition on H⁻¹ is 0 and on H⁰ is id. Red(0)=0. | Pass. |
| Reconstruction (2821) | Rlim ℤ/pⁿ=ℤ_p; Rlim Red(𝔽_p)=𝔽_p, because the extra negative term is pro-zero. | Pass. |
| Pro-Tor comparison (2833) | For the principal regular ideal (p), excess Tor is 𝔽_p with transition 0; its limit and lim¹ are 0. For r=2,n=2, I³⊂(x²,y²)⊂I². | Pass; uniform amplitude permits the unbounded use. |
| Reconstruction counit (2843) | ℤ_p⊗ᴸℤℤ/pᵏ=ℤ/pᵏ for every k≥1; for k=2 the same comparison gives ℤ/p², not just mod p. | Pass. |
| Reconstruction unit (2855) | ℤ_p→Rlim ℤ/pⁿ is iso; ℤ[1/p]→0 is not and its source is not complete. | Pass. |
| Completed coefficient sheaf (2865) | On profinite ℤ_p, the identity map to ℤ_p is continuous but not locally constant; it defines a section of lim constant ℤ/pⁿ sheaves, not of the constant discrete ℤ_p sheaf. | Pass; completion need not be constant. |
| Coefficient equivalence (2875) | For R=(∏ℕ𝔽_p)[[t]], t is regular and R is non-Noetherian; lim R/tⁿ=R and Red/Rec recover the unit. I=0 gives a constant identity system. | Pass; no unnecessary Noetherian restriction. |
| Perfect external coefficients (2887) | P=Rʳ gives F(K⊗P)=F(K)ʳ; P=[R→pR] gives the same cofiber of p on each side. The internal sign-representation counterexample above is outside this external action. | Pass. |
| Derived Nakayama (2899) | Complete K=0 has zero reduction; ℚ_p has zero mod-p reduction but is nonzero and not derived complete. Cone of a map between complete objects gives the iff test. | Pass. |
| Square-zero/derivations (2926) | In B⊕M, (0,m)(0,n)=0 and δ(t²)=2tδ(t); at p=2 that derivative is 0. For B=A[t], derivations into M are determined by δ(t). | Pass; unit and Leibniz exclude arbitrary maps. |
| Cotangent comparison (2938) | B=k[ε]/ε² over k: [B→2εB] has H⁻¹=εB,H⁰=k when char≠2; in char2 differential=0 and both groups are B. | Pass. |
| Cotangent universal property (2948) | A→A gives L=0 and contractible derivations; A[t] gives L=B[0]. With M=B[1], both mapping and derivation spaces have π₁=B and π₀=0. | Pass; degree-zero derivations alone are insufficient. |
| Animated exterior powers (2962) | Λ²(k)=0 even in characteristic2; LΛ²(k[1])=Γ²(k)[2]=k[2]. Weight0 gives k, weight1 returns the input. | Pass; integral divided powers retained. |
| Final compatibility (2985) | Unit R[0] corresponds to HR with only π₀=R; L_(R[t]/R)=R[t][0]; for regular p, L_(ℤ/p/ℤ)=𝔽_p[1]. Every route retains the same Tor₁ and negative rotation sign. | Pass. |

The definition/API review also compared positive and negative examples with the surrounding theorem scopes: nonflat base change, nonperfect coefficients, noncofinal subsequences, non-surjective covers, nonregular ideals, absent separation and absent uniform bounds are not silently admitted by the corresponding claims. Source proof errors described below are not reproduced by the roadmap's mapping-space/all-integer formulations.

## Not verifiable

- No sampled text was inaccessible. All cited works requested through the sources service have legal text available; no unresolved reference request or waiver is needed.
- This is a full mathematical and ownership review, with source certification of the seeded §§0.1–0.4 sample and the additional cited passages above. It is not independent certification of every non-seeded locator in the README.
- The admitted Lean file verifies signatures only. The computed rows test statements and conventions; they are not proofs of the general higher-category, descent or completion theorems. Ownership searches cover supplied snapshots, not unprovided open-head contents.

## Source issues

- **Error** in bs-proet at Lemma 3.3.2 proof, printed p. 18 (`bs-proet` line 843): the source says adjacent Postnikov-stage full derived Hom complexes agree by truncation adjunction; it should compare mapping spaces, rather than unrestricted derived Hom complexes; affects the proof.
- **Error** in bs-proet at Proposition 3.3.3 proof, printed p. 19 (`bs-proet` line 874): the source says cohomology products equal their tails and tests only nonnegative degrees; it should retain prefixes or pass cofinally, and test every integer degree with stabilization n≥max(0,−i); affects the proof.
