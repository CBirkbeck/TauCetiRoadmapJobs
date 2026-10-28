# Review of ConstructibleEtale (pull request #196 at 4bd7237)
Folder: `TauCetiRoadmap/CohomologicalPointCounting/ConstructibleEtale/`

**Verdict:** rejected

🤖 Independent AI review. Four blocking findings and six P3 findings. The rejection is for re-planning an existing roadmap, not for the unavailable texts. No pull-request file was changed.

## R01 (P1) — The proposed scope is already owned on main

**Location:** `TauCetiRoadmap/CohomologicalPointCounting/ConstructibleEtale/README.md:110`, “What is missing: build here”; Layers 0–10 and the Summit at line 392.

**Claim:** These layers constitute a new coefficient-theory library owned by this folder. In fact, their core constructions and end results already belong to `EtaleCohomologyFoundations` on main. This is a re-plan, not an extension. The finite-cover theorem here is also narrower than its existing owner's theorem.

**Witness:** `TauCetiRoadmap/EtaleCohomologyFoundations/README.md:175` (§F.0.1), line 200 (§F.0.2), line 231 (§F.0.3), line 439 (§0.7), and line 457 (§F.1) explicitly own these objects, operations, and cohomology actions.

**Repair:** Withdraw this duplicate scope and make the family consume those named sections. Kummer itself belongs to `SchemeAndStackFoundations` §2.11. Any genuinely additional theorem needs a separately scoped Part II explaining where its parent stops. Do not move or reimplement the existing work. The ownership table below checks this repair against each proposed layer, including the point, nontrivial monodromy, and nonperfect coefficient examples. This ownership change is why local edits to this folder cannot make its present scope acceptable.

## R02 (P1) — Finite-projective stalks do not give the claimed internal-Hom closure

**Location:** `TauCetiRoadmap/CohomologicalPointCounting/ConstructibleEtale/README.md:319`, “derived internal Hom when the source is bounded with constructible cohomology of finite-projective stalks.”

**Claim:** Derived internal Hom then preserves bounded constructible objects. This is false, including over a Noetherian scheme with finite field coefficients. The standing convention at line 57 does not impose invertibility on this categorical closure claim.

**Witness:** Take algebraically closed k of characteristic p, X=Spec k[[t]], j:Spec k((t))→X, Λ=𝔽_p. For K=j!Λ and L=Λ, H¹(Rℋom(K,L)) has infinite closed stalk k((t))/(aᵖ−a), containing independent t⁻ᵐ for p∤m.

**Repair:** Use a locally perfect source in the sheaf-theoretic sense: étale locally a bounded complex of finite free constant Λ-sheaves. Specify the tensor–Hom comparison Rℋom(K,L)≅K∨⊗ᴸL. State any more general constructible-source theorem separately with its actual geometric and coefficient hypotheses and named supplier. Keep the example as a negative control: j!Λ has stalks Λ and 0, both projective, but is not locally perfect near the closed point. With source Λ instead, Rℋom(Λ,Λ)=Λ and the offending H¹ stalk is zero. Stacks §59.63 supplies the Artin–Schreier calculation (`stacks-etale line 4438`); the pole-order argument is recorded below.

## R03 (P1) — The pinned prerequisite list names nonexistent supplies

**Location:** `TauCetiRoadmap/CohomologicalPointCounting/ConstructibleEtale/README.md:100`, “geometric points and enough points from `Mathlib/AlgebraicGeometry/Sites/EtalePoint`”; line 103 includes “derived tensor products already in Mathlib.”

**Claim:** Those required interfaces are supplied by the pinned library. At Mathlib `9caeba1000ef8f302920981f4a08651d325abc81`, the cited point module does not exist; the available geometric-point construction is for the big étale site. Generic derived tensor/internal Hom for the module-sheaf category is also not a supplied Mathlib construction at this pin.

**Witness:** `Mathlib/AlgebraicGeometry/Sites/Etale.lean:64` defines big-site `Scheme.geometricFiber`; `Sites/EtalePoint.lean` is absent. `TauCetiRoadmap/EnhancedDerivedSheaves/README.md:455` owns `ClassicalDerived.tensorHom` and its replacements, rather than Mathlib supplying that sheaf-derived tensor.

**Repair:** Replace these claims with exact contracts: consume the small-site geometric-stalk package from `EtaleCohomologyFoundations` §F.0.1 and the generic enhancement/replacement/tensor–Hom package from `EnhancedDerivedSheaves` §§0.1–0.4. Cite the actual pinned generic point functor and its hypotheses where used. The affine-site Grothendieck-abelian instances already exist and should be imported, not proved again in Layer 1. The distinction matters on the point: 𝔽₂⊗ᴸ_(ℤ/4)𝔽₂ has nonzero cohomology in every nonpositive degree, whereas underived tensor gives only 𝔽₂ in degree zero.

## R04 (P2) — A statable headline is absent from the acceptance file

**Location:** `TauCetiRoadmap/CohomologicalPointCounting/ConstructibleEtale/Suggested.lean:11`, “finite-étale Galois category … do not yet have settled declaration types”; compare README lines 195–197 and 444.

**Claim:** The missing carriers justify declaring no headline theorem. The finite-étale Galois-category headline can already be stated on native carriers with one simple full-subcategory abbreviation.

**Witness:** A scratch file with `ObjectProperty.FullSubcategory (fun Y : Over X => IsFinite Y.hom ∧ Etale Y.hom)` and the connected, locally Noetherian `GaloisCategory` theorem elaborated at the pin, with only the expected `sorry` warning.

**Repair:** Remove the blanket future-prototyping rationale. Resolve R01 by citing the existing owner for this duplicated headline; any retained, genuinely new statable headline must be stated in the acceptance file. If this theorem's ownership is explicitly reassigned, the tested native signature below supplies its acceptance statement. For genuinely unstatable results, name each theorem and its missing carrier individually. The probe preserves both standing hypotheses; `infer_instance` does not prove the theorem. This is not a request to pad the file with elementary API facts.

## R05 (P3) — The sampled Summit has no exact source locator

**Location:** `TauCetiRoadmap/CohomologicalPointCounting/ConstructibleEtale/README.md:392`, “Summit: … a usable functorial coefficient category”; references at lines 34–51.

**Claim:** A list of broad sections supports the entire composite Summit and its layers. There is no theorem number or page attached to the sampled statement, and most individual API claims have no locator at all.

**Witness:** The Summit has zero source locators. Stacks §59.77 defines locally finite Tor dimension, whereas the README uses bounded objects; its comparison with boundedness explicitly requires quasi-compactness (`stacks-etale line 6356`).

**Repair:** Split the Summit into exact mathematical assertions and attach precise locators and hypotheses to each retained assertion. For example: Stacks 59.74.1, tag 09BH, pp.127–128; 59.76.1/3/6, tags 095W/095Y/0961, pp.135–136; 59.77.1/3/6, tags 03TQ/03TT/0963, pp.136–138; SGA 1 V, Theorem 4.1 and §7, with the edition specified. Record cited works in `sources.toml`. On a point 𝔽₂ over ℤ/4 is bounded constructible but not ctf, so a locator about constructible complexes alone cannot certify the ctf assertion. No manifest was edited by this review.

## R06 (P3) — Definitions lack discriminating Checks and convention witnesses

**Location:** `TauCetiRoadmap/CohomologicalPointCounting/ConstructibleEtale/README.md:394`, “Worked examples and acceptance criteria”; definition blocks in Layers 0–10.

**Claim:** Nine general acceptance sentences suffice to test all the new definitions. There are no per-definition `Checks` lists, and the examples largely restate desired properties without computing values or excluding wrong models.

**Witness:** Layer 8 has no test separating finite Tor dimension from finite stalks: Torᵢ_(ℤ/4)(𝔽₂,𝔽₂)=𝔽₂ for every i≥0. Line 307 has no numerical test distinguishing arithmetic Frobenius from its inverse.

**Repair:** Give each retained definition at least three discriminating Checks. Include zero/empty objects, the preceding Tor counterexample, a nonconstant local system, and explicit convention tests. On μ₅ over 𝔽₂ arithmetic Frobenius is multiplication by 2 and geometric Frobenius by 3; on two degree-one factors over 𝔽₃ the tensor symmetry multiplies by −1=2. Pin the inverse in the left action induced by contravariant pullback using S₃, not only cyclic groups. The computed controls below can be used as README Checks, not added to `Suggested.lean`.

## R07 (P3) — The build has no exact dependency contracts or per-target needs

**Location:** `TauCetiRoadmap/CohomologicalPointCounting/ConstructibleEtale/README.md:93` and line 128, “What Mathlib already has: consume” and “The build, in layers”.

**Claim:** The broad library list and order of eleven layers specify all inputs. There are zero `*Needs:*` lines and no `Exact supplier contracts` section. Layers have neither their required ending `Examples`/`Dependencies` subsections nor the prescribed topic subsections. The introduction lacks the `Summary` paragraph marker, and ownership is dispersed across several sections.

**Witness:** Layer 7 uses finite Tor dimension before Layer 8 defines it; the generic tensor prerequisite is not named. The dependency check reports zero problems, but there are no explicit target-level edges to validate.

**Repair:** After resolving ownership, organize the retained specification in the required shape, with named supplier sections and individual needs for statements and proof routes. Introduce the Tor predicate before the tensor-closure theorem that uses it, or import the owner's predicate. Keep statements about downstream owners as scope boundaries, not supplier edges. Test the resulting order on the ℤ/4 example: the finite-Tor hypothesis must be available before bounded tensor closure can be asserted.

## R08 (P3) — LaTeX delimiters fail the gate

**Location:** `TauCetiRoadmap/CohomologicalPointCounting/ConstructibleEtale/README.md:7` and throughout.

**Claim:** The prose uses display and inline LaTeX delimiters, contrary to the roadmap format.

**Witness:** The head's gate reports `latex=114`; line 7 opens a LaTeX display and line 57 uses inline delimiters repeatedly.

**Repair:** Replace every offending delimiter with Unicode prose or permitted code spans/indented formulas. Preserve the mathematical hypotheses. Rerun the gate; the required value is `latex=0`.

## R09 (P3) — TeX syntax outside code fails the gate

**Location:** `TauCetiRoadmap/CohomologicalPointCounting/ConstructibleEtale/README.md:14` and throughout.

**Claim:** TeX commands and brace-index syntax are used outside code spans/blocks.

**Witness:** The head's gate reports `tex=31`; line 14 contains the TeX expression for the ctf category outside a code span or block.

**Repair:** Convert those expressions to Unicode, or permitted code notation, and update any affected heading links. Rerun the gate; the required value is `tex=0`.

## R10 (P3) — Required metadata is absent

**Location:** `TauCetiRoadmap/CohomologicalPointCounting/ConstructibleEtale/metadata.toml` (missing).

**Claim:** The folder satisfies the package metadata rule.

**Witness:** The head's gate reports `metadata=1` and names this missing file.

**Repair:** Supply valid roadmap metadata for any replacement folder whose scope is accepted, following the repository schema. Rerun the gate; the required value is `metadata=0`. This does not repair the rejected ownership scope by itself.

## Verified sound

The following records checks and their limits, including failed adversarial cases; it does not certify the rejected Summit. There was no previous AI review to reconcile. The target README and Lean file, family index, relevant sibling passages, three main-branch roadmap specimens, cited owner sections, and the supplied PR description were read. The description's assertion that the scopes are disjoint is contradicted by R01.

**Build and policy evidence.** Head verified as `4bd72379658126cbe9be935656396f0c9dac4de0`; local Mathlib verified at manifest pin `9caeba1000ef8f302920981f4a08651d325abc81`. This manifest contains no Tau Ceti package/pin, so no Tau Ceti declaration is claimed verified at a pin. The requested direct `lake env lean` invocation on `Suggested.lean` exited 0 with no diagnostics. The worker's targeted build also passed. The file has one `import Mathlib`, zero declarations, zero admitted examples, zero sorry'd data, and zero `set_option`s. Thus there are zero original declarations for `#check @name` or padding probes; no hidden binders can occur in that empty set. The requested outside-folder diff is empty, and the worktree remained clean.

The supplied gate fails exactly three rule families: `latex=114`, `tex=31`, `metadata=1`. All other recorded counters, including build, stray files, outside-folder, imports and sorry-data, are zero. R08–R10 account for every failing rule. No acceptance is asserted while that gate fails.

The requested mechanical dependency check was run and returned exactly:

```text
depcheck: 163 roadmaps, 1163 edges, 0 problem(s)
```

There was no `UPWARD`, `CYCLE`, or `moved:` line. There are no declared gaps. All five named sibling references in this README are scope/consumer references, not demonstrated upward supplies. In particular, exact scheme pullback can be applied termwise from Layer 1, so merely mentioning the later topos packaging does not establish a cycle. Missing explicit needs are R07, not an invented mechanical cycle.

**Resolved ownership and interfaces (main unless expressly identified).**

| Object here | Existing owner and exact location | Resolution |
| --- | --- | --- |
| Layers 0–2, 4–5: invertibility, module stalks, lisse objects, stratifications, constructibility | `TauCetiRoadmap/EtaleCohomologyFoundations/README.md:175`, §F.0.1, especially lines 181–189 | Same objects and closure APIs; import that section. |
| Layer 3: finite étale category, paths, π₁ and monodromy | Same README:200, §F.0.2, lines 203–218 | Owner covers every connected nonempty scheme, not just locally Noetherian schemes. |
| Layer 6: μₙ and Kummer | `TauCetiRoadmap/SchemeAndStackFoundations/README.md:3582`, §2.9; line 3656, §2.11, especially 3661–3669 | Explicit single ownership of μₙ and Kummer; finite twists are downstream. |
| Layer 6: all integer finite Tate twists | `TauCetiRoadmap/EtaleCohomologyFoundations/README.md:231`, §F.0.3 | Same definition and reductions; arithmetic q/geometric q⁻¹ agree at line 246. |
| Layer 5: abelian extension by zero | Same README:439, §0.7, line 441 | Exact adjoint with stalks, full faithfulness, composition and base change already planned. |
| Layers 7–8: Dᵇ_c, Dᵇ_ctf, Tor bounds, monoidal structure | Same README:457, §F.1, lines 459–472 | Existing owner distinguishes global bounds and local constructibility; import it. |
| Layers 9–10: module cohomology, cup products, Čech comparison, coherent group actions | Same README:480, §F.1, lines 480–492 | Same outputs and proof inputs. |
| Generic replacements and derived tensor/internal Hom | `TauCetiRoadmap/EnhancedDerivedSheaves/README.md:429`, §§0.1–0.4, especially 441 and 455 | Earlier supplier, absent from this folder's contracts. |
| Generic module-derived tensor used in point comparisons | `TauCetiRoadmap/DerivedModuleAlgebra/README.md`, §0.2, resolved through the preceding supplier's §0.2 contract | Owned module foundation, not a replacement for sheaf-derived tensor. |
| Scope reference to EtaleBaseChange | `TauCetiRoadmap/CohomologicalPointCounting/EtaleBaseChange/README.md:74`, variance; line 119, input | Agrees that scheme inverse image is exact and consumes this coefficient category. |
| Scope reference to CompactSupport | `TauCetiRoadmap/CohomologicalPointCounting/CompactSupport/README.md:180`, Layer 3 | It also says to construct abelian j!, despite this folder assigning itself j! at line 265. Both should import the earlier owner. |
| Scope reference to EllAdicRealization | `TauCetiRoadmap/CohomologicalPointCounting/EllAdicRealization/README.md:333` | Geometric action q⁻¹ on ℚℓ(1) agrees with the finite-level convention. |
| Scope reference to ComplexComparison | `TauCetiRoadmap/CohomologicalPointCounting/ComplexComparison/README.md:97`, line 366, Layer 10 | Finite-level coefficient input and comparison ownership are present. |
| Scope reference to TraceFormula | `TauCetiRoadmap/CohomologicalPointCounting/TraceFormula/README.md:131`, line 288, line 380 | Consumes ctf stalks, derives their perfectness, and owns its stated trace endpoint. |
| Open-work comparison | `TauCetiRoadmap/ClassicalAdicEtaleCohomologyPartII/README.md:144`, “From EtaleCohomologyFoundations”, at the supplied open head | Imports the scheme coefficient and monodromy package; its new scope concerns rigid analytic geometry. It does not free this folder to re-own scheme coefficients. |

Ownership searches used `roadmaps grep` by objects (constructible sheaves, finite Tor dimension, Kummer, finite étale Galois categories), `roadmaps show` for main and open-head resolution, and a local search of board packages. The decisive owner is on main; no revision PR was substituted for main. Searches covered the available open-roadmap index and the supplied relevant heads, not an independent search for unavailable open PRs. No named declaration exists here to collide as a fully qualified Lean name. No novel remainder justifying this folder's ownership was identified.

**Pinned library audit.** These native declarations/files were opened, not inferred from names on a newer revision. Paths below are Mathlib-repository relative at the pin above.

| File and line | Declaration or instance inspected | What it supplies, and limit |
| --- | --- | --- |
| `Mathlib/AlgebraicGeometry/Sites/Etale.lean:50` | `AlgebraicGeometry.Scheme.smallEtaleTopology` | Small site on étale X-schemes; does not impose Noetherianity or finiteness. |
| Same file:64 | `AlgebraicGeometry.Scheme.geometricFiber` | A point of the big étale topology for a separably closed field; not a small-site enough-points theorem. |
| `Mathlib/AlgebraicGeometry/Sites/AffineEtale.lean:44` | `Scheme.AffineEtale` | Native affine-site category. |
| Same file:84 | Essential smallness instance | Supplies the universe reduction needed here. |
| Same file:133 | `Scheme.AffineEtale.sheafEquiv` | Equivalence for coefficient categories satisfying the explicit concrete-category, limits and filtered-colimit assumptions at lines 91–96. |
| Same file:124, 137, 142, 147 | Abelian/Grothendieck-abelian instances and ModuleCat specialization | Already handles module-valued small-site sheaves; Layer 1 should consume it. |
| `Mathlib/CategoryTheory/Sites/Point/Basic.lean:96`, 277, 289, 354 | `Point.presheafFiber`, `Point.sheafFiber`, finite-limit preservation, `Point.sheafFiberCompIso` | Generic fibres with coefficients, under their size/exact-colimit assumptions; no geometric conservativity asserted by these definitions. |
| `Mathlib/CategoryTheory/Sites/Point/Conservative.lean:51`, 263 | `ObjectProperty.IsConservativeFamilyOfPoints`, `GrothendieckTopology.HasEnoughPoints` | Generic properties, not a proof that small étale geometric points satisfy them. |
| `Mathlib/CategoryTheory/Sites/SheafCohomology/Basic.lean:59`, 105, 114 | `CategoryTheory.Sheaf.H`, `H.equiv₀`, `H.map` | Abelian sheaf cohomology as Ext and its degree-zero/functorial comparisons; does not by itself construct the promised Λ-linear derived coefficient theory. |
| `Mathlib/CategoryTheory/Galois/Basic.lean:66`, 83, 420 | `PreGaloisCategory`, `PreGaloisCategory.FiberFunctor`, `GaloisCategory` | Finite limits/coproducts/quotients, direct-summand condition and existence of an appropriate fibre functor. The qualified fibre-functor name matters. |
| `Mathlib/CategoryTheory/Galois/Topology.lean:77`, 110, 115 | Automorphism topology, compactness and total disconnectedness | Correct generic profinite topology, conditional on the Galois hypotheses. |
| `Mathlib/CategoryTheory/Galois/Equivalence.lean:40`, 88 | `PreGaloisCategory.functorToContAction` and its equivalence instance | Generic classification already supplied, not a theorem yet establishing the scheme category's axioms. |
| `Mathlib/AlgebraicGeometry/Morphisms/Finite.lean:39`; `Mathlib/AlgebraicGeometry/Noetherian.lean:57` | `IsFinite`; `IsLocallyNoetherian` | Native predicates used by the successful headline probe. |

The requested file `Mathlib/AlgebraicGeometry/Sites/EtalePoint.lean` is absent at this verified pin. Searches through the pinned site files and the whole Mathlib tree found only the big-site geometric-fibre definition and generic conservative-family machinery, not the asserted specialized enough-points supply. Object searches through derived-category and tensor files found no sheaf-derived tensor/internal-Hom construction fulfilling line 103. The manifest supplies no Tau Ceti fallback.

**Headline inventory and Lean evidence.** README lines 392 and 443–451 promise: finite-cover Galois classification with paths and lisse monodromy; constructible abelian/Serre closure; Kummer exactness and integer twists; triangulated, symmetric monoidal Dᵇ_ctf with geometric stalks; and Λ-linear cohomology with cup products, coefficient changes and coherent finite-group actions. The Lean file names some missing carriers, but states none of these theorems and does not individually account for all of them.

The Galois headline is statable. This scratch probe elaborated with precisely one `sorry` warning:

```lean
import Mathlib
open CategoryTheory AlgebraicGeometry
universe u
namespace ReviewProbe
abbrev FiniteEtale (X : Scheme.{u}) :=
  ObjectProperty.FullSubcategory
    (fun Y : Over X => IsFinite Y.hom ∧ Etale Y.hom)
theorem finiteEtale_galois (X : Scheme.{u})
    [ConnectedSpace X] [IsLocallyNoetherian X] :
    GaloisCategory (FiniteEtale X) := by
  sorry
#check @FiniteEtale
#check @finiteEtale_galois
end ReviewProbe
```

The printed type retains `X`, `ConnectedSpace X` (including nonemptiness) and `IsLocallyNoetherian X`. A separate one-tactic copy replacing `sorry` by `infer_instance` fails to synthesize `GaloisCategory (FiniteEtale X)`. The other headlines require actual sheaf/coefficient constructions not provided by this empty file; no claim is made that a long private encoding is required or permitted. No padding was found among the zero submitted theorems. These scratch probes are not proposed duplicate declarations for the rejected scope.

**Seeded source sample.** The sample is the Summit at README line 392. It is a composite specification without a theorem/page locator, so its theorem number and page cannot be verified as written. Three of the five cited works were readable through the sources service. Exact component checks:

| Source locator and extraction | Hypotheses/content checked | Outcome for Summit |
| --- | --- | --- |
| `stacks-etale line 1410`, Lemma 59.28.1, 03PL, p.31 | n invertible; small and big étale Kummer sequence | Supports Layer 6 exactness, including its invertibility requirement. |
| `stacks-etale line 5924`, Proposition 59.74.1, 09BH, pp.127–128 | Noetherian X, Noetherian Λ; strong Serre property | Supports Layer 5 for finite Λ. Does not justify dropping Noetherian X. |
| `stacks-etale line 6292`, Definition 59.76.1, 095W, p.135; line 6305, Lemma 59.76.3, 095Y, p.135 | Constructible cohomology; scheme pullback is exact | Supports the derived full subcategory and pullback clause. |
| `stacks-etale line 6340`, Lemma 59.76.6, 0961, p.136 | Bounded-above constructible tensor closure | With a finite-Tor factor yields the bounded tensor statement; does not assert R02's internal-Hom closure. |
| `stacks-etale line 6348`, Definition 59.77.1, 03TQ, pp.136–137; line 6365, Lemma 59.77.3, 03TT, p.137 | Locally finite Tor dimension; on qcqs X represented by a finite complex of flat constructible sheaves | Explains the Noetherian/quasi-compact bounded ctf interface. |
| `stacks-etale line 6409`, Lemma 59.77.6, 0963, p.138 | Scheme pullback preserves ctf | Supports the pullback component. |
| `sga1 line 4270`, Exposé V, Theorem 4.1, re-edition printed p.104 | G1–G6 imply equivalence with finite continuous actions | Supports the abstract step, already Mathlib's theorem. |
| `sga1 line 4694`, Exposé V §7, re-edition pp.115–116; line 4780, Proposition 8.1, p.117 | Connected locally Noetherian scheme, geometric point; fibre equivalence, paths, basepoint group, field case | Supports Layer 3 on its stated domain. This is the arXiv math/0206203v2 re-edition; specify this edition when using these pages. |
| `sga4half line 1309`, Arcata IV §3, Definitions 3.1–3.2 and following paragraph, printed p.43 | Noetherian scheme, finite locally constant and constructible abelian sheaves, abelian closure | Supports the finite constructible component, not all the derived-module Summit. |

These citations use the legal [Stacks chapter](https://stacks.math.columbia.edu/download/etale-cohomology.pdf), [SGA 1 re-edition](https://arxiv.org/abs/math/0206203), and [Deligne's IAS copy](https://publications.ias.edu/node/378). No source passage was copied into the report. Source statements were paraphrased. The README flags no additional locator as unverified; there is no recorded source manifest to certify.

**Adversarial computation table.** Each row records a concrete value or object on both sides of a proposed identification, or positive/negative membership for a predicate. Passing these instances is not a proof of a universal claim. References are to the reviewed README unless another file is named. For compactness, P denotes a separably closed point; Λ is specified in each example; C denotes the two-term complex `[ℤ/4 —2→ ℤ/4]` in degrees 0 and 1. “Keep” means no counterexample in that row, subject to importing the existing owner (R01). All operations below use their standard constructions, not arbitrary uninterpreted maps.

| ID / statement | Instances tried | Values on the two sides / discrimination | Result; change |
| --- | --- | --- | --- |
| A01 Coefficient convention, line 57 | Λ=0,N=1; Λ=𝔽₂,N=2 over 𝔽₂; Λ=ℤ/4,N=4 over ℚ | NΛ=0 in all three; invertibility is true, false, true respectively | Keep distinct annihilation/invertibility. |
| A02 Standard tower, lines 61–65 | ℓ=2,m=0,1,2 | ℤ/1=0, ℤ/2, ℤ/4; successive reductions have target cardinalities 1,2 | Keep; pin indexing in Checks. |
| A03 Invertibility in stalks/affines, lines 132–135 | X=Spec ℤ, n=1,2,0 | 1 unit everywhere; 2 nonunit at (2); 0 nonunit at every point | Equivalences agree; keep. |
| A04 Residue-characteristic criterion, line 136 | Spec ℚ,n=0,2; Spec 𝔽₃,n=2,3 | Images 0,2 and 2,0; respective unit tests false,true,true,false | Specify nonzero image, including n=0. |
| A05 Localization factorization, line 137 | Spec 𝔽₃,n=2,3; empty X,n=0 | Maps from ℤ[1/2] exist; from ℤ[1/3] to 𝔽₃ do not; empty scheme factors through empty Spec ℤ[1/0] | Matches unit criterion, including empty scheme. |
| A06 Base change/restriction/composition, line 139 | ℤ[1/6]→𝔽₅→𝔽₂₅; n=6 | 6 maps to 1 then 1, both units | Keep forward stability, not a converse. |
| A07 Divisors/products, line 139 | n=6 over 𝔽₅; 2 and 3 over 𝔽₃ | 2,3,6 all units over 𝔽₅; 2 unit but 3 and product 6 nonunits over 𝔽₃ | Product requires both factors; keep. |
| A08 Torsion predicate, line 141 | Λ=𝔽₂ over Spec 𝔽₂ versus Spec ℚ | No positive annihilator is invertible in the first; N=2 works in the second | Keep; zero ring uses N=1. |
| A09 Affine-site transport, line 151 | P,Λ=𝔽₃; empty scheme | Both site models give 𝔽₃-module coefficient category at P; empty site has only zero sheaf | Pinned equivalence fits, no independent theory. |
| A10 Abelian structures/exactness, lines 153–154 | At P, multiplication 2 on ℤ/4 | Kernel={0,2}≅𝔽₂; cokernel=𝔽₂; image={0,2}; coimage=𝔽₂ | Keep; import existing instances. |
| A11 Limits/colimits, line 154 | At P, two copies of 𝔽₂ | Product and coproduct are 𝔽₂², cardinality 4; zero diagram yields 0 | Keep. |
| A12 Constant module sheaves, line 155 | At P, M=0,𝔽₂, direct sum of countably many 𝔽₂ | Stalks equal those modules; first two finite, third infinite | Constant does not imply finite lisse. |
| A13 Coefficient restriction/extension, line 156 | ℤ/4→𝔽₂, M=ℤ/4 | Extension=𝔽₂; restricting 𝔽₂ yields a two-element ℤ/4-module, not ℤ/4 | Specify variance and ring; keep. |
| A14 Tensor/internal Hom, line 157 | At P over 𝔽₃, M=Λ²,N=Λ | M⊗N=Λ²; Hom(M,N)=Λ²; dimensions 2 and 2 | Keep underived operations distinct. |
| A15 Scheme pullback identity/composition, line 158 | P→P identity; pullback of a constant rank-two sheaf | id*Λ²=Λ²; successive and composite pullbacks both rank 2 | Keep exact pullback, no higher left-derived correction. |
| A16 Geometric stalk definition, line 160 | Λ=𝔽₃ sign sheaf on Spec ℝ versus constant Λ | Both geometric stalks=𝔽₃; conjugation acts by 2 versus 1 | Stalk module alone does not define the sheaf. |
| A17 Stalk exactness, line 168 | 0→𝔽₂→ℤ/4→𝔽₂→0 at P | Inclusion 1↦2; kernel of reduction={0,2}=image | Keep. |
| A18 Stalk finite limits/colimits, line 169 | At P, previous exact sequence and Λ² | Kernel stalk has 2 elements; sum stalk has 4 for Λ=𝔽₂, equal to module calculations | Keep generic hypotheses and universes. |
| A19 Tensor and coefficient comparison, line 170 | At P, Λ=ℤ/4→𝔽₂, M=Λ² | Both stalk-then-extend and extend-then-stalk give 𝔽₂² | Keep. |
| A20 Conservativity/isomorphism criterion, lines 171–172 | On two points, zero map 0→(0,𝔽₂) | First stalk 0→0 is iso; second 0→𝔽₂ is not; global map not iso | All geometric points needed; R03 for supply. |
| A21 Mono/epi/exact/vanishing criteria, line 172 | At P, 2:ℤ/4→ℤ/4; zero sheaf | Kernel and cokernel each 𝔽₂, so map neither mono nor epi; zero sheaf has only zero stalks | Keep. |
| A22 Local constancy/finite lisse, line 178 | Spec ℝ sign 𝔽₃ sheaf; at P infinite direct sum | Sign sheaf trivializes over ℂ, fibre cardinality 3; infinite sum fibre cardinality infinite | Positive and negative models separated. |
| A23 Trivializations/refinement, line 182 | Sign sheaf, ℂ→ℝ twice | Pullbacks trivial rank 1; fibre product ℂ×ℝℂ=ℂ⊔ℂ, each rank 1 | Keep. |
| A24 Isomorphism invariance, line 183 | Λ=𝔽₃, basis change multiply by 2 | 2·2=1; rank remains 1, monodromy −1 remains −1 | Keep. |
| A25 Lisse pullback, line 184 | Sign sheaf from Spec ℝ to Spec ℂ | Monodromy −1 restricts to 1; fibre remains 𝔽₃ | Keep. |
| A26 Lisse kernels/cokernels/finite limits/colimits, line 185 | Multiplication 2 on constant ℤ/4 | Kernel/cokernel both constant 𝔽₂; finite products/sums preserve finite fibres | Keep. |
| A27 Lisse extensions, line 185 | Representation of C₂ on 𝔽₂² by [[1,1],[0,1]] | Matrix square=id; submodule and quotient trivial of rank 1; middle nontrivial rank 2 | Must allow nonsplit extensions; keep. |
| A28 Lisse tensor, line 185 | Sign 𝔽₃ sheaf tensor itself | (−1)²=1; tensor is constant rank 1 | Keep. |
| A29 Lisse dual/internal Hom, line 185 | μ₅ over 𝔽₂ with Λ=𝔽₅ | Arithmetic action 2 on source; 3 on dual; product 2·3=1 | Finite projective/lisse hypothesis sufficient; keep. |
| A30 Constant finite lisse, line 186 and Check 1 | At P, 0,𝔽₂,𝔽₂² | Stalk cardinalities 1,2,4; all locally constant and constructible | Keep, but not three discriminating Checks by itself. |
| A31 Stalk cardinality/type, line 187 | Connected Spec ℝ sign sheaf; disconnected two-point scheme with ranks 1,2 | First cardinality 3; second cardinalities 3,9 on its two components | Constancy is per component; keep. |
| A32 Étale descent, line 188 | ℂ→ℝ with nontrivial C₂ descent datum on 𝔽₃ | Descent produces sign sheaf, not constant; stalk 𝔽₃ in both | Keep descent datum, not just trivialized carrier. |
| A33 Finite étale module-scheme equivalence, line 189 | P,Λ=𝔽₂,M=Λ²; Spec k[ε]/ε²→Spec k | Module scheme has 4 reduced points; square-zero cover length 2 has one geometric point and is not étale | Operations and étaleness both necessary. |
| A34 FiniteEtale carrier/pullback, line 195 | Identity, empty cover, square-zero cover of P | First two objects have fibres of sizes 1 and 0; square-zero cover excluded | Native predicate probe works; R04. |
| A35 Coproducts/components/deck transformations, line 195 | Three-point split cover of P | Three connected components; deck group S₃ has 6 elements; sum of 1- and 2-point covers has 3 points | Keep. |
| A36 Galois-category headline, line 197 | P and Spec 𝔽₂; empty base | Finite covers of P=finite sets; π₁(𝔽₂)=Ẑ; empty base admits no conservative fibre functor preserving distinct initial/terminal finite sets | Connected nonempty hypothesis retained; R01/R04. |
| A37 Terminal/pullbacks, line 199 | Two-point and three-point covers of P | Terminal fibre size 1; product fibre size 2·3=6 | Keep. |
| A38 Finite coproduct decomposition, line 200 | Split 3-point cover versus Spec 𝔽₄ over 𝔽₂ | First has 3 components, second 1; geometric fibres have sizes 3,2 | Do not identify geometric fibre points with connected components. |
| A39 Finite-group quotients, line 201 | C₂ swaps two points; S₃ acts on 3 points | Quotient has 1 point in both; trivial C₂ action on 2 points gives 2 | Keep stabilizers; no freeness assumed. |
| A40 Direct-summand monos, line 202 | Inclusion of a point in 3-point cover | Complement size 2; 1+2=3 | Keep. |
| A41 Effective descent, line 203 | ℂ→ℝ with trivial versus swapping descent on two points | Descents are ℝ⊔ℝ and Spec ℂ, respectively; both pull back to 2 points | Descent datum distinguishes wrong model. |
| A42 Geometric fibre/FiberFunctor, lines 205–211 | Spec 𝔽₈→Spec 𝔽₂; empty cover | Lifts of geometric point number 3 and 0; Frobenius cycles the 3 lifts | Keep. |
| A43 Profinite π₁ definition, lines 213–219 | P,Spec ℝ,Spec 𝔽₂ | Aut(fibre)=1,C₂,Ẑ respectively; constant trivial-group model fails last two | Keep generic topology and scheme proof separate. |
| A44 Path definition/nonemptiness, lines 221–227 | Same geometric point on Spec ℝ; points on different components | End-path set=C₂ (2 elements); cross-component path set empty | A path is not a uniquely selected isomorphism. |
| A45 Path unit/inverse/composition and torsors, line 227 | C₂: nontrivial path c | c²=1; inverse=c; action on path set free/transitive with 2 elements | Keep. |
| A46 Finite continuous-set classification, line 231 | Spec 𝔽₂, degree d=1,2,3 covers | Fibre actions are cycles of lengths 1,2,3; associated cover degrees 1,2,3 | Keep; generic equivalence already Mathlib. |
| A47 Connected iff transitive, line 232 | Split 2-point cover versus 𝔽₄/𝔽₂ | Orbit counts 2 versus 1, component counts 2 versus 1 | Both directions pass. |
| A48 Module monodromy classification, line 233 | Spec ℝ over 𝔽₃, trivial/sign characters | Matrices 1 and 2; invariants dimensions 1 and 0 | Cannot classify using fibre module alone. |
| A49 Path tensor/dual transport, line 234 | Scalar 2 on Λ=𝔽₅ | Dual transport 3; evaluation after tensor transport multiplies by 2·3=1 | Keep inverse dual convention. |
| A50 Basepoint conjugation, line 235 | S₃, a=(12), b=(23) | b a b⁻¹=(13)≠(12); in C₂ conjugation gives a | Nonabelian test needed; keep with R06. |
| A51 Disconnected groupoid, line 237 | Spec ℂ ⊔ Spec ℝ | End groups 1 and C₂, cross Hom empty; a single chosen π₁ misses a component | Keep groupoid. |
| A52 Finite stratification definition, lines 241–247 | A¹ split into Gₘ and {0}; overlapping two copies of A¹ | First cover/disjointness true; second cover true/disjointness false | Wrong overlapping family excluded. |
| A53 Stratification restriction, line 251 | Restrict preceding stratification to Gₘ and {0} | Strata become (Gₘ,∅) and (∅,{0}) | Keep, allow/remove empty strata coherently. |
| A54 Stratification pullback, line 252 | t↦t² and base change to Spec k[ε]/ε² at t=0 | Images remain open complement and closed origin; thickened fibre still has 1 underlying point | Retain subscheme data, not just point partition. |
| A55 Common/intersection refinement, lines 253–254 | A¹ split at 0 and split at 1 | Nonempty intersections: {0},{1},A¹\{0,1}; total 3 | Both original partitions recovered by unions. |
| A56 Open–closed gluing, line 255 | Gₘ plus closed origin in A¹ | Two disjoint images cover all A¹ | Keep. |
| A57 Stratum induction, line 256 | Empty scheme, point, preceding A¹ partition | Stratum counts 0,1,2; removing a stratum lowers count by 1 | Keep boundary cases in README. |
| A58 Dense-open/Noetherian induction, line 257 | A¹ stratified at origin | Dense open Gₘ, proper closed complement {0}; zero sheaf already uses whole A¹ | Keep Noetherian hypothesis explicit. |
| A59 Constructible predicate/equivalent formulations, line 263 | j!𝔽₂ on A¹ with j:Gₘ→A¹; infinite constant module at P | Two finite lisse strata versus one infinite stalk; memberships true/false | Consistent with Stacks; use global/affine-local distinction. |
| A60 Independence of stratification, line 265 | Refine Gₘ further at 1 | Stalk ranks remain 1 on Gₘ and 0 at origin under either 2- or 3-stratum witness | Keep. |
| A61 Abelian j! adjunction/exactness/stalks, line 265 | j:Gₘ→A¹,Λ=𝔽₃; zero input | Stalks (Λ,0); Hom(j!Λ,Λ_X)=Λ=Hom(Λ,Λ_U); zero maps to 0 | Keep, single owner §0.7. |
| A62 Constructible pullback/locality, lines 267–268 | Pull back j!Λ to Gₘ and origin | Restrictions Λ and 0, both constructible; gluing recovers boundary jump | Keep. |
| A63 Constructible kernels/cokernels/images/coimages, lines 269–270 | Multiply by 2 on j!(ℤ/4) | Each kernel/cokernel/image/coimage is j!𝔽₂; stalks sizes 2 on U,1 on boundary | Keep. |
| A64 Constructible extensions/sums/tensors, line 269 | Constant 0→𝔽₂→ℤ/4→𝔽₂→0; Λ_U extension by zero | Middle finite stalk size 4; sum doubles rank; j!Λ⊗j!Λ=j!Λ with ranks (1,0) | Keep. |
| A65 Ordinary dual closure, line 269 | i:origin→A¹, F=i_*𝔽₃ versus constant Λ | Hom(F,Λ_X)=0; Hom(Λ_X,Λ_X)=Λ_X | Both constructible; ordinary dual is not necessarily biduality on constructible sheaves. |
| A66 Support, line 271 | j!Λ, i_*Λ, zero sheaf | Nonzero-stalk sets U, {0}, ∅ | All constructible; distinguish support from its closure. |
| A67 Restrictions/gluing/extension by zero, lines 272–274; Check 7 | F=j!Λ on A¹ | F|U=Λ, F|{0}=0; j!F|U→F is identity and closed quotient 0 | Keep; gluing also needs the attaching data in general. |
| A68 Finite stalks/types on qc X, line 275 | Disjoint two-point X, ranks 1 and 2 over 𝔽₂ | Stalk cardinalities 2,4; set of module types size 2 | Keep quasi-compactness in finite-type-set assertion. |
| A69 Scalar change, line 276 | j!(ℤ/4) reduced to 𝔽₂ | Both restriction/extension construction and stalk construction give (𝔽₂,0) | Keep. |
| A70 Strong Serre closure, line 278 | Subobject j!𝔽₂⊂constant 𝔽₂ on A¹ | Subobject stalk ranks (1,0), quotient ranks (0,1); both constructible | Supports strong Serre claim on Noetherian X; source 09BH. |
| A71 μₙ definition/finite lissity, lines 282–288 | P char≠2,n=1,2; char p,n=p | Kernel sizes 1,2; in char p geometric p-th roots have size 1, not p | Invertibility excludes the last misuse. |
| A72 Kummer exactness, lines 288–297; Check 5 | k separably closed, n prime to char; k=𝔽_p(t),n=p | First power map on units surjective; t has no p-th root in any separable extension in second | Keep invertibility; negative control. |
| A73 Λ(1), line 299 | Λ=ℤ/3,N=3 or 6, over ℂ | Tensor of μ₃ or μ₆ with Λ gives cyclic order 3 in either construction | Keep canonical coefficient maps when varying N. |
| A74 Positive/negative/zero twists, line 299 | Λ=𝔽₅ over 𝔽₂ | Arithmetic eigenvalues for twists 0,1,−1,2 are 1,2,3,4 | Negative uses dual, not another positive power. |
| A75 Twist addition, line 301; Check 6 | a=1,b=−1 and a=b=1 in preceding case | 2·3=1; 2·2=4, matching twist 0 and 2 | Keep. |
| A76 Twist pullback/tensor/duals, line 302 | Base extension 𝔽₂→𝔽₄ for μ₅ | Arithmetic generator acts by 2²=4; dual action 3²=4; product=1 mod5 | Keep all variance comparisons. |
| A77 Tower transition, line 303 | Over ℂ, μ₉→μ₃, ζ₉↦ζ₉³ | Exponent e mod9 reduces to e mod3; primitive ζ₉ maps to primitive ζ₃ | Keep power-map normalization. |
| A78 Root choice, line 304 | ζ₅ replaced by ζ₅² | Forward parametrization ×2; fixed ζ₅ has new coordinate 3 since 2·3=1 mod5 | Specify forward versus inverse coordinates. |
| A79 Twist finite lissity/constructibility, line 305 | At P,Λ=𝔽₅; Λ=0 | Rank 1, cardinality 5 in first; zero module cardinality 1 in second | Keep zero coefficient ring. |
| A80 Frobenius convention, line 307 | q=2,ℓ=5,m=1; q=1 | Arithmetic=2, geometric=3; q=1 is not a finite-field cardinality | Correct inverse convention; numerical Check missing. |
| A81 Constructible cohomology/Db_c, lines 311,321–327 | C; infinite-dimensional 𝔽₂[0] at P | H⁰(C)=H¹(C)=𝔽₂, Db_c=true; infinite module gives Db_c=false | Keep. |
| A82 Shift closure, line 313 | C[1] | Nonzero cohomology moves from degrees 0,1 to −1,0, both 𝔽₂ | Specify cohomological sign, keep. |
| A83 Cone/triangle closure, line 314 | Cone(id_Λ), cone(2:ℤ/4→ℤ/4) | First acyclic; second has 𝔽₂ in degrees −1 and 0 | Keep. |
| A84 Truncations, line 315 | C and τ≤0 C | Latter=𝔽₂[0], still Db_c; its Tor is unbounded over ℤ/4 | Db_c closure true, ctf truncation closure must not be inferred. |
| A85 Finite sums, line 316 | Λ[0]⊕Λ[−1] | Rank-one cohomology in degrees 0 and 1, zero elsewhere | Keep. |
| A86 Derived scheme pullback, line 317 | Identity; pullback of C to P | Complex and cohomology unchanged; two 𝔽₂ groups | Exact scheme inverse image suffices. |
| A87 Derived tensor bound, line 318 | Λ=ℤ/4, M=𝔽₂; Λ⊗ᴸM versus M⊗ᴸM | First=M[0]; second H⁻ⁱ=M for all i≥0 | Finite-Tor factor is essential; keep. |
| A88 Derived internal-Hom closure, line 319 | R02's X,j,K,L | Source stalk ranks (1,0); closed H¹ of Rℋom is infinite-dimensional, whereas constructibility requires finite stalks | False; R02. |
| A89 Representative independence, line 327 | Zero complex and [Λ —id→ Λ] | Both have every cohomology group 0; same derived object | Keep. |
| A90 Tor interval definition/stalk criterion, lines 331,335 | C at P versus M=𝔽₂[0] over ℤ/4 | C⊗ᴸM=[M —0→ M], degrees 0,1; M⊗ᴸM nonzero in every nonpositive degree | C has [0,1]; M has no finite interval. |
| A91 Tor quasi-isomorphism invariance, line 336 | Acyclic identity complex versus 0 | Tensor cohomology all zero on both | Keep. |
| A92 Tor pullback/shift/triangle, line 337 | Λ,Λ[1], cone(2:Λ→Λ) | Amplitudes [0,0], [−1,−1], [−1,0] | Keep explicit interval formulas. |
| A93 Tor tensor, line 337 | Λ[1]⊗ᴸΛ[−1] | Λ[0], interval sum [−1,−1]+[1,1]=[0,0] | Keep. |
| A94 Tor duality “where applicable”, line 337 | Λ[1] over point; R02's nonlisse source | Dual of Λ[1]=Λ[−1], amplitude [1,1]; finite-projective stalks of j!Λ do not prevent infinite sheaf Ext | State locally perfect duality domain; R02. |
| A95 Local nature, line 338 | Two-point X, objects Λ[0] and Λ[−2] | Local intervals [0,0],[2,2]; common global interval [0,2] | Keep finite-cover/global-bound distinction. |
| A96 Free sheaf Tor, line 339 | Λ^r,r=0,1,2 and arbitrary degree-zero M | Tensors M^r in degree zero; r=0 gives 0 | Keep [0,0], including zero. |
| A97 Bounded projective lisse complexes, line 340 | C over point | Tor amplitude [0,1] despite nonprojective H⁰,H¹ | Finite Tor belongs to complex, not every cohomology module. |
| A98 Db_ctf predicate, lines 342–348 | C; 𝔽₂[0] over ℤ/4 | C membership true; 𝔽₂[0] membership false; both Db_c | Separating Check required; R06. |
| A99 Triangulated ctf, line 348; Check 8 | Λ→Λ via 2 and its cone | Three objects perfect; cone amplitude [−1,0] | Keep; truncations excluded without bounds. |
| A100 Symmetric monoidal ctf, line 348 | Two degree-one factors over 𝔽₃ and 𝔽₂; zero object | Symmetry scalar −1=2 versus 1; zero tensor=0 | Pin Koszul sign and unit; R06. |
| A101 RΓ and module cohomology, lines 352–364 | P,Λ=𝔽₃,K=Λ[0]; empty X | For Λ[0], RΓ=Λ[0], H⁰=Λ,Hⁱ=0 for i≠0; empty gives 0 in every degree | Native abelian cohomology needs Λ-linear comparison. |
| A102 Coefficient functoriality, line 368 | Multiply 2 on Λ=𝔽₃ at P | H⁰ map=×2; composite square=×1 | Keep module structure. |
| A103 Contravariant scheme functoriality, line 369 | Two-point scheme→P, constant Λ | Pullback on H⁰ sends a↦(a,a), not addition (a,b)↦a+b | Correct direction, make maps explicit. |
| A104 Long exact sequence, line 370 | 0→𝔽₂→ℤ/4→𝔽₂→0 at P | H⁰ exact with 1↦2 then reduction; all H¹=0 | Keep. |
| A105 Cup product, line 371 | P,Λ=𝔽₅; classes 2,3 in H⁰ | Cup=2·3=1 mod5; unit=1 | Keep unit/product normalization. |
| A106 Coefficient change, line 372 | P,Λ=ℤ/4,M=𝔽₂, extension to 𝔽₂ | Derived change H⁻ⁱ=𝔽₂ for all i≥0; ordinary change only degree zero | State ordinary versus derived change and boundedness hypotheses. |
| A107 Automorphism/equivariant cohomology actions, line 373 | S₃ permuting 3-point scheme, a=(12),b=(23), section δ₁ | (a*b*δ₁)(2)=1, ((ab)*δ₁)(2)=0 for raw pullbacks; using (g⁻¹)* restores a left action | Pin inverse/coherence; R06. |
| A108 Čech comparison, line 374 | Two-copy trivial finite étale cover of P,Λ=𝔽₃ | C⁰=Λ², C¹=Λ⁴; kernel of difference has diagonal dimension 1; higher Čech H=0 | Matches H⁰(P)=Λ,Hⁱ>0=0 under acyclicity. |
| A109 Point/separably closed cohomology, line 375; Check 4 | P versus Spec ℝ,Λ=𝔽₂ | P has H⁰=𝔽₂,Hⁱ>0=0; ℝ has Hⁱ=𝔽₂ for all i≥0 | Do not replace separably closed by arbitrary field. |
| A110 Kummer low degrees, line 376 | ℝ,n=2 versus ℂ,n=2 | H¹(μ₂)=ℝ×/(ℝ×)²=C₂ versus 0; Pic(fields)=0 | Keep exact identification and hypotheses. |
| A111 Equivariant-object definition, line 382 | Point with G=C₂ or S₃; representation 𝔽₃-sign | Identity acts by 1; transposition by 2; 3-cycle by 1; arbitrary map sending identity to 0 violates coherence | Include unit and cocycle laws. |
| A112 Equivariant pullback/tensor, line 384 | Two sign representations over 𝔽₃, trivial map of points | Tensor character is 1; pullback retains each sign character | Keep. |
| A113 Induced RΓ/H actions, line 385; Check 9 | Point with sign coefficients; trivial group | H⁰=𝔽₃ with action 2; trivial group action=1; higher H=0 | Equivariant coefficients, not action on X alone, determine action. |
| A114 Equivariant isomorphism invariance, line 386 | Change basis by 2 on sign 𝔽₃ module | 2·(−1)·2⁻¹=−1; cohomology character unchanged | Keep. |
| A115 Restriction along group maps, line 387 | C₂⊂S₃ and C₃⊂S₃, sign representation | Restrictions have characters −1 and 1 respectively | Keep source/target groups explicit. |
| A116 Stalk/stabilizer actions, line 388 | S₃ acting on 3 points with constant coefficients | Stabilizer size 2 at each point; action on its constant stalk is 1 | Full group moves stalks; stabilizer acts on a fixed stalk. |
| A117 Finite-cover/permutation example, Check 2 | Spec 𝔽₄→Spec 𝔽₂; split degree-two cover | Permutation matrices [[0,1],[1,0]] and identity; trace 0 and 2 over 𝔽₃ | Distinguishes split and nonsplit. |
| A118 Path example, Check 3 | Two successive sign transports over Spec ℝ | (−1)·(−1)=1; a single path has transport −1 | Composition passes; paths must remain chosen data. |
| A119 Summit, line 392; completion lines 443–451 | P with Λ=ℤ/4; μ₅ over 𝔽₂; R02 trait | ctf includes C but excludes 𝔽₂[0]; twist eigenvalues 2/3; claimed Hom closure has infinite stalk | Valid components do not repair false closure or duplicate ownership. |
| A120 Library-supply claim, lines 100–103 | Verified Mathlib pin | Cited EtalePoint file count=0; geometricFiber declaration count=1 in big-site file; sheaf-derived tensor supplier contract count here=0 | R03. |
| A121 Acceptance-file coverage | Submitted file versus native probe | Submitted headline count=0; successful Galois headline signatures=1; probe's standing hypotheses retained=2 | R04. |
| A122 Format/dependency coverage | Head gate and README | latex=114, tex=31, metadata failures=1; explicit Needs lines=0; per-definition Checks lists=0 | R05–R10. |

For A88, the computation is particularly short. The open-immersion adjunction gives Rℋom_X(j!Λ,Λ_X)=Rj*Λ_U. Since k[[t]] is strictly henselian, the closed geometric stalk of R¹j*Λ is H¹(k((t)),𝔽_p). Artin–Schreier identifies this with k((t))/(aᵖ−a). A nonzero finite 𝔽_p-linear combination of t⁻ᵐ with distinct positive m prime to p has pole order prime to p. If a has a pole, aᵖ−a has pole order divisible by p; if a has none, neither does aᵖ−a. Thus those classes are independent. This works already at p=2 (m=1,3,5,…) and p=3 (m=1,2,4,…). It refutes constructibility, regardless of whether one also proves boundedness of that derived Hom.

For A87/A90, the infinite free resolution of 𝔽₂ over ℤ/4 has every differential multiplication by 2. Tensoring with 𝔽₂ makes every differential zero, hence Torᵢ=𝔽₂ for every i≥0. Conversely, C itself is a bounded complex of free modules and tensors to the displayed two-term complex. These values distinguish finite Tor dimension, bounded cohomology and finite stalks without assuming any unproved finiteness theorem.

## Not verifiable

- **The Summit as one sourced theorem:** no theorem number/page is supplied. The readable component results above do not certify its entire wording, particularly R02. This is a missing locator, not an inability to read Stacks.
- **SGA 4, Exposés IX, XI, XIV, XVII:** the sources service obtained the legal [SLMath scan](https://library.slmath.org/nonmsri/sga/sga/pdf/sga4-3.pdf), but its extraction reports glyph names rather than usable words. OCR is unavailable. No theorem or hypothesis from this scan is certified here. The bibliography search and this scan are recorded under `sga4` in the scratch missing-reference record.
- **Milne, Étale Cohomology, Chapters II and V:** the sources service tried DOI `10.1515/9781400883981` and its publisher landing page. The [author bibliography](https://jmilne.org/math/Books/index.html) does not offer the whole book; the available corrected chapter is Chapter I, which is not either cited chapter. No access control was bypassed. The record is under `milne-etale`.
- **Tau Ceti at a pinned commit:** the reviewed `lake-manifest.json` does not pin Tau Ceti. No claim about a Tau Ceti declaration's availability was inferred from other roadmaps' different pins.

All cited works were attempted in this run. SGA 4½ was obtained successfully after the initial bibliographic lookup failed and was removed from the missing-reference record. The review is complete with these verification limits; it is not parked for additional texts, and none of these unavailable texts is needed to establish R01, R02 or R04.

## Source issues

- **Misprint** in stacks-etale at §59.76, tag 095V, printed p.135 (`stacks-etale line 6291`): the source says D⁺ and D⁻ correspond respectively to bounded above and bounded below; it should be bounded below and bounded above, respectively; affects nothing.
