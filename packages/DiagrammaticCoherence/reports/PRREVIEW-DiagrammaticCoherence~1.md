# Review of DiagrammaticCoherence (pull request #1710 at 1266f21)

**Verdict:** needs changes

AI review of the two requested files at the specified head. There are 12 findings, including three blocking findings. The three import findings record the gate's three failing rules separately; they have one shared repair.

## R01 (P1) — Supply the Drinfeld comparison used by C0

**Location:** `TauCetiRoadmap/DiagrammaticCoherence/README.md:183–187`: “Consume the object-level `pivotalBalancedEquiv` and the functor-level Drinfeld/dual comparison `map_drinfeldIso_hom_comp_mapRightDualIso_hom`”.

**Claim:** C0 consumes an existing functor-level comparison, and C6 uses the resulting equivalence of functor groupoids.

**Witness:** Neither named declaration occurs at either library pin. PivotalSpherical Layer 10 supplies the object-level equivalence, but its Layer 1 pivotal-functor target does not state the consumed Drinfeld comparison.

The relevant supplier text is `TauCetiRoadmap/PivotalSpherical/README.md:307–316,609–613` on main. Searches by both the exact names and the Drinfeld/chosen-dual objects found no supplying target for this comparison. The inventory's newer upstream revision is outside the allowed pins. This is not a finding against the pivotal or balanced structures themselves: their mathematical ownership is explicit on main.

**Repair:** Cite PivotalSpherical Layer 10's central equivalence by that target. Replace the purported consumed Drinfeld declaration with a C0 target constructing the needed comparison and proving its compatibility with strong braided functors and their canonical chosen-dual isomorphisms. State its source, target, and equation. Alternatively declare a precise supplier gap through the prescribed mechanism. Do not silently require the newer library revision.

**Repair check:** For the identity strong braided functor on finite-dimensional vector spaces, every dual comparison is the identity and both paths are the canonical bidual comparison; on the unit both are the scalar 1. This tests the direction without asserting an unavailable declaration.

## R02 (P2) — Monotone height does not give the claimed openness

**Location:** `TauCetiRoadmap/DiagrammaticCoherence/README.md:118,244–248`: “Progressive means every wire is monotone in height” and “show that their allowed families are open”.

**Claim:** The progressiveness constraint is preserved by sufficiently small smooth perturbations.

**Witness:** The embedded arc γ(s)=(s,s³), near s=0, has strictly increasing height. Perturb its height to s³−εs: the height derivative changes from 0 to −ε at 0, for arbitrarily small ε>0.

Use a fixed smooth cutoff equal to 1 near 0 and zero near the endpoints, so the perturbation fixes the collars and tends to zero in C¹ (indeed every fixed finite Cᵏ norm). The first coordinate remains s, so these are still embeddings. Even *strict* monotonicity is insufficient for the openness assertion.

**Repair:** Specify the smooth progressive normal form by positive height derivative in the directed edge parameter. On compact edges/families require or derive a uniform positive lower bound. Retain the general monotone model, if wanted, through a separate comparison/regularization target; apply the openness theorem only to the derivative-positive model. Add the cubic arc as a negative-control Check.

**Repair check:** For γ(s)=(0,s), the derivative is 1; a perturbation with height-derivative error below 1/2 keeps it above 1/2. The cubic arc has minimum derivative 0 and is excluded from this openness theorem.

## R03 (P2) — Replace the syntax prototype with the headline acceptance test

**Location:** `TauCetiRoadmap/DiagrammaticCoherence/Suggested.lean:13–16,29–120`; README's endpoints at lines 6–19 and 497–533.

**Claim:** The suggested signatures serve as the roadmap's acceptance test.

**Witness:** The two admitted conclusions are raw monoidal-relation soundness and cancellation of list operations. Neither mentions a geometric diagram or isotopy. All six geometric coherence endpoints can be omitted without affecting either theorem.

The monoidal presentation machinery also belongs to TemperleyLieb Layer 2 (`TauCetiRoadmap/TemperleyLieb/README.md:368–383` on main), as this README acknowledges. A separate inductive syntax and fourteen-constructor congruence are not a few simple definitions making one of the six geometric endpoints statable. Soundness is meaningful, but it is not the promised geometric soundness-and-completeness theorem.

**Repair:** Remove this substitute acceptance development. Name C1–C6 individually in the module docstring, with the unavailable free-category and independently defined geometric-isotopy carriers each needs. Also identify the missing carriers for C7's general Reshetikhin–Turaev and normalization endpoints. Keep shared presentation work as a supplier citation in the README. State any actual headline that can be expressed at the pins with only a few simple definitions; do not rebuild the missing geometric library in the signature file.

**Repair check:** A scratch file with `import Mathlib`, the required namespace, and an explicit per-endpoint missing-carrier explanation elaborates without warnings. The pin audit below found no native coupon-diagram quotient that would permit the six endpoints through a small wrapper. No claim is made that a longer new formalization is impossible.

## R04 (P3) — Delete the winding-word padding

**Location:** `TauCetiRoadmap/DiagrammaticCoherence/Suggested.lean:132–134`: `leftDualWord (rightDualWord w) = w`.

**Claim:** This is an admitted acceptance theorem.

**Witness:** On a scratch copy the following single tactic closes it for every type and word:
`simp [leftDualWord, rightDualWord, List.map_reverse, List.map_map, Function.comp_def]`.

**Repair:** Delete it from `Suggested.lean`; keep mixed-dual cancellation in the README. Remove definitions retained only to state this padding.

**Repair check:** The probe elaborates with only the other theorem's expected sorry warning. On [(a,0),(b,2)], right dual gives [(b,3),(a,1)] and left dual returns [(a,0),(b,2)].

## R05 (P3) — Gate failure: imports

**Location:** `TauCetiRoadmap/DiagrammaticCoherence/Suggested.lean:7`.

**Claim:** The import header meets the allowed-import rule.

**Witness:** The gate reports `imports=1` for `public import Mathlib.CategoryTheory.Monoidal.Free.Coherence`.

**Repair:** Use the single `import Mathlib` line and only actually used, pinned individual Tau Ceti imports. For this file's existing module syntax, also remove `module` and `@[expose] public section` when adopting that ordinary import form.

**Repair check:** That combined header repair, on a copy of the original file, elaborates with only its two sorry warnings. Replacing the import alone leaves private-import visibility errors, so that incomplete repair is insufficient.

## R06 (P3) — Gate failure: mathlib-subimports

**Location:** `TauCetiRoadmap/DiagrammaticCoherence/Suggested.lean:7`.

**Claim:** No Mathlib submodule is imported directly.

**Witness:** The gate reports `mathlib-subimports=1`; the import names `Mathlib.CategoryTheory.Monoidal.Free.Coherence`.

**Repair:** Delete the submodule import and apply R05's tested header repair.

**Repair check:** The repaired scratch header has zero Mathlib submodule imports and elaborates.

## R07 (P3) — Gate failure: no-import-mathlib

**Location:** `TauCetiRoadmap/DiagrammaticCoherence/Suggested.lean:1–7`.

**Claim:** The required root import is present.

**Witness:** The gate reports `no-import-mathlib=1`; the exact line `import Mathlib` is absent.

**Repair:** Add `import Mathlib` as part of R05's tested header repair.

**Repair check:** The repaired scratch header has exactly one such line and elaborates.

## R08 (P3) — Supply per-definition APIs, discriminating Checks, and dependencies

**Location:** `TauCetiRoadmap/DiagrammaticCoherence/README.md:147–318`, also C1–C7.

**Claim:** The construction paragraphs specify a usable build and its checks.

**Witness:** There are zero `*Needs:*` lines and zero `**Checks.**` blocks. G0.1 introduces incidence, realization and gluing objects without three discriminating Checks for each; the nine construction sections have no Examples/Dependencies endings.

**Repair:** Reshape C0, G0 and C1–C7 into the required numbered layers, retaining all mathematics. Add the Summary, Exact supplier contracts, How to read the build, and Downstream consumers sections. Give each definition its prose API and at least three explicit computed Checks, and each target its own dependencies. Specify the left/right trace assignment and crossing/framing dictionaries by values, rather than asking the eventual implementer to choose them.

**Repair check:** For incidence/realization, use the empty diagram (0 edges), a nullary coupon (0 ports but one labelled cell, evaluation 2 rather than 1), and a vertex-free circle (one component, zero vertices). For dual words, the empty, two-letter mixed-dual, and same-handed double-dual computations below distinguish the intended operations.

## R09 (P3) — Attach exact source locators to the sampled geometric claims

**Location:** `TauCetiRoadmap/DiagrammaticCoherence/README.md:197–318,578–615`.

**Claim:** The sources locate the asserted geometric constructions and comparison results.

**Witness:** G0.1–G0.5 contain no theorem/page citations at their claims. The bibliography gives broad sources; no locator identifies the boundary/coupon-relative smooth–PL comparison or coupon-flattening theorem.

**Repair:** Attach precise input locators and named supplier targets to each sampled construction. Distinguish the existing theorem from the new extension being requested. For example, Roseman Proposition 8.1 is on printed p.309 and concerns closed 1-manifolds; RT Lemmas 5.2–5.3 are on printed p.13, with Figure 8 on pp.14–15. Neither is the full G0.2 comparison. Give an explicit route and owned intermediate targets for that extension, with locators for the route's inputs.

**Repair check:** The closed circle satisfies Roseman's hypotheses; an interval with ports and a coupon does not. The revised attribution must give the latter to G0's additional targets. The source audit below does not certify those extra cases merely from the bibliography.

## R10 (P3) — Record the cited works in a source manifest

**Location:** `TauCetiRoadmap/DiagrammaticCoherence/README.md:576–615`.

**Claim:** The cited works have the required auditable source records.

**Witness:** The folder contains README.md, Suggested.lean and metadata.toml only. There is no sources.toml for the ten cited works.

**Repair:** Add one source-manifest entry per work, preserving the distinction between the two Joyal–Street manuscripts and the published tensor-calculus paper. Record legal fetch provenance, precise locators, and uncertified status for inaccessible texts. The review itself has not changed a manifest.

**Repair check:** Ten distinct works are enumerated below; successful alternate URLs refer to the same work/key, not additional entries.

## R11 (P3) — Replace process references with stable roadmap contracts

**Location:** `TauCetiRoadmap/DiagrammaticCoherence/README.md:47–55,160–164`.

**Claim:** Ownership and ordering are expressed as timeless roadmap contracts.

**Witness:** The table names “proposal #957”, “proposal #58” and “proposal #1705”; C0 says “Merge proposal #58 before this roadmap”.

**Repair:** Cite TemperleyLieb Layer 2 on main. Identify other related roadmaps by their roadmap names and sections, distinguishing consumers from suppliers. Replace the newer-upstream/older-pin narrative with the exact available pin declarations and the named roadmap targets supplying what is absent.

**Repair check:** TemperleyLieb's main Layer 2 resolves the required presentation contract, and the mechanical order check remains free of upward edges. No merge instruction is needed to identify that owner.

## R12 (P3) — Align the Lean namespace, documentation, and README names

**Location:** `TauCetiRoadmap/DiagrammaticCoherence/Suggested.lean:9–21,35,56–59,125–128`.

**Claim:** The signature file follows the required form and agrees by name with the README.

**Witness:** Its namespace is `DiagrammaticCoherence`, not `TauCetiRoadmap.DiagrammaticCoherence`. Five declarations lack docstrings: Object, Interpretation.evalObj, Interpretation.eval, rightDualWord and leftDualWord. The README does not list the twelve declared names.

**Repair:** Apply the required namespace and module-docstring form. For declarations genuinely retained after R03–R04, add mathematical docstrings and matching README names, keeping APIs and Checks as prose. If none are retained, do not add a catalogue of obsolete names.

**Repair check:** The minimal headline-status scratch file uses the required namespace and elaborates without declarations or warnings.

## Verified sound

The following are concrete checks, not a proof of all the proposed coherence theorems. Full generality of the new geometric extensions remains work requested by this roadmap.

**Head, scope, gate, and elaboration.** HEAD is `1266f21e3fbb131c1b00644d66ac420afe940557`. The outside-folder diff is empty; the worktree remained unchanged. No sorry'd data, set_option, admitted examples, executable algorithm, or route-specific restriction was found. The worker's gate has build=0 and fails only the three import rules recorded above. The original file independently elaborated using `lake env lean <absolute path of Suggested.lean>`, with exactly the two expected sorry warnings.

The requested dependency command produced:

```text
depcheck: 205 roadmaps, 1501 edges, 0 problem(s)
```

There was no UPWARD, CYCLE, or moved line. All supplier-table entries and the ordering paragraph were read; there are no target-level Needs lines to inspect. The mechanical pass does not validate the missing declaration in R01. No supplier gaps are declared.

**Signatures and padding.** One scratch elaboration printed `#check @name` for all twelve declarations. TensorSignature, Object, Raw, Interpretation, both evaluators, MonoidalRel, its soundness theorem, WindingWord, the two word duals, and their cancellation theorem retain the types displayed in the worker's signature record. In particular, both evaluators retain Category and MonoidalCategory through Interpretation: the two binder-loss alerts are false positives. The raw soundness theorem explicitly retains all category instances and the generated-relation hypothesis. Its one-tactic `simp [Interpretation.eval]` probe fails with “simp made no progress”; no one-step library proof was identified. The winding theorem's one-simp probe succeeds (R04).

**Pinned declarations opened.** Pins are Mathlib `f6090c7095e1e56b3464c1daba5f24631f1290d2` and Tau Ceti `358314d4ab97483df4fc4cb8adcc02e74a8d9f5a`. Paths below are relative to those library repositories.

| Library object | File and line at the pin | What was verified |
| --- | --- | --- |
| FreeMonoidalCategory.projectObj | `Mathlib/CategoryTheory/Monoidal/Free/Basic.lean:283` | Recursion on object generators, unit and tensor; no coupon generators. |
| FreeMonoidalCategory.projectMapAux / project | Same file, lines 295 and 361 | Structural-map evaluation and actual monoidal projection; the monoidal instance starts at 367. |
| FreeMonoidalCategory.subsingleton_hom | `Mathlib/CategoryTheory/Monoidal/Free/Coherence.lean:313` | Thinness concerns the object-generated structural category. |
| Functor.Monoidal | `Mathlib/CategoryTheory/Monoidal/Functor.lean:389` | Lax and oplax structure with inverse compatibility; targets need not be strict. |
| NatTrans.IsMonoidal | `Mathlib/CategoryTheory/Monoidal/NaturalTransformation.lean:46` | The monoidal transformation condition already exists. |
| BraidedCategory | `Mathlib/CategoryTheory/Monoidal/Braided/Basic.lean:49` | Native braiding structure, not a symmetry assumption. |
| ExactPairing | `Mathlib/CategoryTheory/Monoidal/Rigid/Basic.lean:77` | Coevaluation into X⊗Y, evaluation from Y⊗X, and both triangle laws. |
| rightAdjointMate / leftAdjointMate | Same file, lines 295 and 299 | Actual contravariant mate maps on chosen duals. |
| leftDualFunctor / rightDualFunctor | `Mathlib/CategoryTheory/Monoidal/Rigid/Functor.lean:43,57` | Target is the monoidal opposite of the opposite category. |
| BraidGroup / sigma | `TauCeti/GroupTheory/SpecificGroups/Braid/Basic.lean:97,104` | Artin type A on n−1 generators; n=0,1 have no generators. |
| sigma_braid / exponentSum_sigma / not_commute_sigma | Same file, lines 123,151,429 | Artin relation, exponent 1, and adjacent noncommutation. |
| BraidWord.toBraid / toBraid_append | `TauCeti/GroupTheory/SpecificGroups/Braid/Word.lean:57,72` | Concatenation maps to multiplication in the stated order. |
| SmoothLinkEmbedding | `TauCeti/KnotTheory/SmoothLink/Basic.lean:61` | Fin n-indexed smooth circles with pairwise disjoint ranges. No framing, coupons or relative boundary collars are fields. |
| SmoothEmbedding.SmoothAmbientIsotopic | `TauCeti/Geometry/Manifold/SmoothEmbedding/SmoothAmbientIsotopy/Basic.lean:72,84` | An ambient diffeotopy taking one embedding pointwise to the other. It does not impose this roadmap's coupon/collar/framing constraints. |
| Oriented Reidemeister relation | `TauCeti/KnotTheory/PDCode/Oriented/Reidemeister/Equivalence.lean:53` | The documented scope explicitly separates the unproved geometric comparison. |

These are 15 library-object groups. The absent pivotal/balanced APIs were searched at these pins, not inferred from a newer version.

**Ownership and resolved suppliers.** Main is `fa41b37`. The seven relevant roadmap owners were read through the roadmap service and checked against main, rather than using revisions of existing roadmaps as new dependencies:

| Citation in this roadmap | Resolved owner and locator on main | Audit result |
| --- | --- | --- |
| PivotalSpherical Layers 0–2,7,10 | `TauCetiRoadmap/PivotalSpherical/README.md:257,283,318,477,562` | Double duals, pivotal structures/functors, traces, FDRep rigidity, and the braided-pivotal/balanced equivalence are owned there. R01 separates the missing named functor comparison. |
| GeometricTopology Layers 1–4 | `TauCetiRoadmap/GeometricTopology/README.md:177,289,357,409` | General collars, embeddings, isotopies and native knot presentations. G0 owns its additional relative coupon adapters. |
| KhovanovHomology G | `TauCetiRoadmap/KhovanovHomology/README.md:388,410,430` | Finite-jet perturbations, ambient extension, and finite-labelled relative closed-link comparison are explicit. Hypotheses include compact families, fixed germs, support/confinement and sufficient regularity. |
| DifferentialGeometry Layers 3,10.2 | `TauCetiRoadmap/DifferentialGeometry/README.md:371,884` | Flows/time-dependent flows and Sard; no claim that they alone prove the new coupon theorem. |
| MorseTheory M1,M3 | `TauCetiRoadmap/MorseTheory/README.md:90,430` | Usable normal forms and relative Morse approximation. |
| TemperleyLieb Layer 2 | `TauCetiRoadmap/TemperleyLieb/README.md:368` | General tensor-word generators, congruence and strong-monoidal universal property, not just TL matchings. |
| QuantumGroups Q8 (consumer/examples) | `TauCetiRoadmap/QuantumGroups/README.md:593`, Q8 | Its representation examples are downstream illustrations, not prerequisites for coherence. |

The service's object searches covered free pivotal/ribbon/autonomous/braided categories, tensor signatures, monoidal presentations, multijets, and relative general position. Main and the available board package texts were searched as well. Existing owners are the ones above; no second owner of the six general geometric coherence endpoints was found among the supplied open-roadmap material. No duplicate fully qualified name from this Suggested.lean was found. This supports a new DiagrammaticCoherence roadmap, rather than rejection as a re-planned roadmap; shared C0 machinery must nevertheless stay with its existing owner.

The fileless HeegaardFloer and ribbon-representation proposal references were not independently checked at their open heads. No supplier conclusion is based on them. Searches can identify leads beyond the supplied checkouts; those are not certification of their ownership. For shape comparison, the completed OrthogonalL2Bases roadmap and main's ClassifyingSpaces roadmap were also read.

**Source sample.** All five seeded targets were examined. The README has no explicit “unverified” locator flags. Ten cited works were submitted to the sources service; five were legally readable, four were classified uncertified, and one returned an access failure. The source keys here are review evidence identifiers, not additions to the roadmap's nonexistent manifest. Legal texts read: [planarDiags](http://science.mq.edu.au/~street/PlanarDiags.pdf), [gtcII](http://science.mq.edu.au/~street/GTCII.pdf), [selinger](https://arxiv.org/pdf/0908.3347v1), [reshetikhinTuraev](https://people.math.harvard.edu/~opie/Reshetikhin_Turaev.pdf), and [roseman](https://www.impan.pl/shop/en/publication/transaction/download/product/89060).

| Seeded target | Text, exact locator, and extent actually verified |
| --- | --- |
| G0.1 finite diagrams | `planarDiags line 250` and `line 324`: graph and planar-diagram definitions, printed pp.1.7–1.10; `gtcII line 103`: embedded progressive diagrams and deformation, pp.3–4. These support the graph/isotopy starting point, not the full marked embedded-coupon shrinking/flattening family theorem. |
| G0.2 smooth/PL comparison | `planarDiags line 1277`, printed p.2.10, imposes piecewise linearity; `selinger line 834`, p.20, records that restriction. No read source at a cited locator proves the full smooth/PL family-and-coupon equivalence. Roseman's nearby-embedding argument requires the correction discussed below. |
| G0.3 jets/generic families | Golubitsky–Guillemin II.4, Theorem 4.13 could not be read legally through the service. `roseman line 258`, Prop.4.4, pp.297–298, and `line 395`, Prop.5.4, p.301, describe replacing an isotopy by a generic one and arranging events. They do not supply all relative coupon/progressive/framing adapters. |
| G0.4 typed templates | `reshetikhinTuraev line 506` and `line 516`, Lemmas 5.2–5.3, printed p.13; Figure 8, pp.14–15; coupon argument `line 540`, p.15. This is a ribbon Hopf-algebra-coloured graph setting. The universal arbitrary-signature extension is a target here, not certified by that special case. |
| G0.5 Morse words | `roseman line 733`, Prop.8.1, printed p.309: closed smooth 1-manifolds with endpoints in general position, three Reidemeister-event types. `gtcII line 90`, p.3, explains elementary layering for progressive diagrams. Neither source alone proves the full relative, framed, multiport-coupon assertion. |

Further source checks: the handwritten `planarDiags` Theorem 7 in Chapter 2 is indeed the cited Theorem 2.7, printed pp.2.33–2.34 (`planarDiags line 1981`). The theorem and proof were inspected as images because the OCR is poor. It gives the free autonomous category on an autonomous tensor scheme, under the earlier PL conventions. The cached GTCII draft was read separately; it is not that numbered theorem. Selinger's six theorem locators occur at lines 419,667,823,1003,1185,1248 (pp.11,16,19,24,28,30), and its category-generated limitations occur at lines 1007,1189,1252. Thus README lines 565–574 correctly treat arbitrary-arity pivotal/braided-pivotal/ribbon completeness as additional work. This is evidence about the survey's caveats, not independent certification of the inaccessible Freyd–Yetter and Shum proofs.

**Headlines and statability.**

| Headline from README | Pin assessment |
| --- | --- |
| C1 arbitrary-signature planar monoidal freeness/coherence | Native structural FreeMonoidalCategory is insufficient; the independent diagram quotient and coupon-generated free category are missing. |
| C2 progressive braided coherence and braid-category comparison | Native BraidGroup exists, but the coloured coupon diagram category and comparison functor are missing. |
| C3 autonomous coherence, winding normalization and one-sided comparison | Native chosen duals exist; winding-labelled diagram/free-category carriers are missing. |
| C4 pivotal planar coherence | Pivotal structures are supplied by a roadmap, not these pins; the pivotal diagram carrier is also missing. |
| C5 braided-pivotal regular coherence | Missing pivotal and regular-diagram carriers. |
| C6 free ribbon theorem, Shum specialization and presentation comparison | Missing ribbon structures and framed coupon-tangle quotient. |
| C7 general RT evaluation, closure/mirror compatibility and scalar normalization | Missing the ribbon/tangle objects and their evaluation; raw scalars would be a substitute. |

No additional statable geometric headline was found omitted after allowing a few simple definitions. R03 concerns the substitute development and missing per-headline status explanation, not a demand for invented carriers.

**Adversarial values.** “Pass” below means the displayed test agrees, not that a genericity or coherence proof has been supplied. For computations, S is the one-object strict monoidal category with endomorphism monoid (ℕ,+), identity 0 and tensor +. V is finite-dimensional rational vector spaces with ordinary tensor and dual. Q is the ribbon category of finite-dimensional ℤ-graded rational vector spaces with braiding on degrees m,n equal to 2^(mn) times the swap and twist on degree n equal to 2^(n²); simple graded lines have dimension 1. These models test actual structures, not free predicates.

| Statement / locator | Instances tried | Computed sides or positive/negative values | Result / change |
| --- | --- | --- | --- |
| TensorSignature, Lean 29; C0 ports | Empty generators; g:unit→unit; h:A⊗B→C | Empty has 0 coupons; g has arity (0,0); h has (2,1), not (1,1) | Pass; retain discrimination in README. |
| Object, Lean 35 | Unit, A, A⊗unit | Flattened words [],[A],[A]; syntax A≠A⊗unit but structural iso exists | Pass; not equality of arbitrary target objects. |
| Raw.structural, Lean 39 | Identity and associator in Cartesian tensor | Identity sends (1,2) to (1,2); associator sends ((1,2),3) to (1,(2,3)) | Pass. |
| Raw.coupon, Lean 40 | Two unit coupons interpreted in V by 2 and 3 | Evaluations 2 and 3 are unequal | Pass; no indiscriminate thinness. |
| Raw.comp, Lean 41 | F=[[1,1],[0,1]], G=[[1,0],[1,1]] | eval(F≫G)=GF=[[1,1],[1,2]]; reverse order FG=[[2,1],[1,1]] | Pass; fixes composition direction. |
| Raw.tensor, Lean 42 | Scalars 2 and 3; zero map | 2⊗3=6; 0⊗3=0 | Pass. |
| Interpretation, Lean 46 | Unit coupon in V; zero-dimensional object | I.map(g)=2:ℚ→ℚ; zero object identity is its unique zero linear map | Pass; no nonzero-dimension assumption. |
| evalObj, Lean 56 | Unit and A⊗B | evalObj(unit)=unit; evalObj(A⊗B)=I(A)⊗I(B) on both sides | Pass; category instances retained. |
| eval, Lean 59 | Coupon 2 then 3; structural identity | 3·2=6 versus 6; identity value 1 versus 1 | Pass; category instances retained. |
| MonoidalRel.refl, Lean 73 | f=2 in S | 2=2 | Pass. |
| MonoidalRel.symm, Lean 74 | id≫2 versus 2 in S | 0+2=2; reversed equality 2=0+2 | Pass. |
| MonoidalRel.trans, Lean 75 | (id≫2)≫id, 2≫id, 2 | (0+2)+0=2+0=2 | Pass. |
| MonoidalRel.comp, Lean 77 | Equivalent f-values 2, g-values 3 in S | 2+3=5 on both sides | Pass. |
| MonoidalRel.tensor, Lean 80 | Equivalent f-values 2, g-values 3 in S | 2+3=5 on both sides | Pass. |
| MonoidalRel.id_comp, Lean 83 | f=2 in S | 0+2=2 | Pass. |
| MonoidalRel.comp_id, Lean 85 | f=2 in S | 2+0=2 | Pass. |
| MonoidalRel.assoc, Lean 87 | f=2,g=3,h=5 in S | (2+3)+5=10=2+(3+5) | Pass. |
| MonoidalRel.structural_comp, Lean 89 | Two structural identities | 0+0=0 in S; 1·1=1 in V | Pass. |
| MonoidalRel.structural_tensor, Lean 91 | Two structural identities | 0+0=0 in S; 1⊗1=1 in V | Pass. |
| MonoidalRel.tensor_comp, Lean 93 | Values 2,3,5,7 in S | (2+3)+(5+7)=17=(2+5)+(3+7) | Pass. |
| Associator naturality, Lean 98 | Scalar maps 2,3,5 in V | Both paths multiply a pure tensor by 30, with identical final bracketing | Pass. |
| Left unitor naturality, Lean 103 | f=2 in V | (1⊗2) then unitor =2; unitor then 2 =2 | Pass. |
| Right unitor naturality, Lean 108 | f=3 in V | (3⊗1) then unitor =3; unitor then 3 =3 | Pass. |
| eval_eq_of_monoidalRel, Lean 116 | Generated interchange; two unrelated coupons | Related example gives 17=17 in S; coupon values 2≠3 in V do not satisfy the generated relation | Soundness tests pass; R03 acceptance-role defect. |
| WindingWord, Lean 123 | [],[(a,0)],[(a,0),(b,2)] | Lengths 0,1,2; exponents retained as 0 and 2, not both parity 0 | Pass; unnecessary standalone acceptance definition. |
| rightDualWord, Lean 125 | Empty; two-letter word | []→[]; [(a,0),(b,2)]→[(b,3),(a,1)] | Pass. |
| leftDualWord, Lean 128 | Empty; two-letter word | []→[]; [(a,0),(b,2)]→[(b,1),(a,−1)] | Pass. |
| Mixed cancellation, Lean 132 | Empty; two-letter word | L(R([]))=[]; L(R([(a,0),(b,2)]))=[(a,0),(b,2)] | Pass; R04 delete padding. |
| C0 substitution associativity/unit | f(x)=x+1, g(x)=2x, h(x)=x−3 at x=4 | h(g(f(4)))=7 in both associations; substituting id leaves 5 | Pass. |
| C0 additional-relation quotient | Identify two unit coupons g,h | Before quotient interpretations 2,3 differ; after imposed g=h allowable interpretations require equal values, e.g. 2=2 | Pass; relations must constrain interpretations. |
| C0 chosen-dual functor comparison | Identity F on V | δ_V=id on V*, δ for unit=1; composition of two identity comparisons=1 | Pass for available construction; R01 missing general supplied target. |
| C0 twist/pivotal functor equivalence | Identity on standard V; identity between two different C₃ pivotal choices | Standard: j=θ=1 preserved on both sides; standard→modified: 1≠ω for both j and θ | Correct test of equivalence, not proof of R01's missing input. |
| C0 freeness groupoids | One object generator, no coupons; scalar relabelling isomorphism 2 on ℚ | Restriction/extension object stays ℚ; automorphism 2 and inverse 1/2 compose to 1 | Pass; groupoid formulation retains automorphisms. |
| G0.1 incidence | Empty, one nullary coupon, one circle | (vertices,edges,circles) can be (0,0,0), (1,0,0), (0,0,1) | Pass; carrier must distinguish all three. |
| G0.1 realizations/disjointness | Parallel arcs x=−1,1; crossing planar arcs | Disjoint parallel images have distance 2; crossing images have distance 0 and violate embedding/disjointness | Pass. |
| G0.1 gluing associativity | Three identity slabs, unit diagram | Boundary count 1 in either association; concatenated identity evaluates 1·1·1=1; empty tensor factor adds 0 strands | Pass up to rescaling, not literal representative equality. |
| G0.1 geometric interchange | Two disjoint scalar coupons valued 2,3 | Two slab orders evaluate 6 and 6 | Pass. |
| G0.1 flattening/front-facing | Flat coupon; affine rotation about y by angle a | Projected determinant cos(a): 1 at 0, 0 at π/2, −1 at π | C2/C5 reject rank-drop/back-view; C6 must handle them. General flattening remains unverified. |
| G0.2 subdivision | Straight segment split at 1/2 | Original and subdivided images both [0,1]×{0}; lengths 1 and 1/2+1/2=1 | Pass. |
| G0.2 openness for disjoint objects/framing | Two compact pieces distance 2; normal field of norm 1 | Displacement <1/2 each leaves gap >1; normal error <1/2 leaves norm >1/2 | Pass under the stated compact smooth hypotheses. |
| G0.2 family versus trace | F(x,t)=(e(x),t); G(x,t)=(e(x),t+εt(1−t)) | Last coordinate at t=1/2: 1/2 versus 1/2+ε/4; derivative 1+ε(1−2t)>0 for ε<1 | G is close and embedded but not level preserving in the original parameter; README correctly requires a family argument. |
| G0.3 same-parameter multijets | dim P=1,d=1,s=0,1,2,3 | Dimensions 1,2,3,4; erroneous independent-parameter dimensions for s=2,3 would be 4,6 | Pass. |
| G0.3 mixed strata | Parameter dimension 1, one edge point and one coupon point | 1+1+2=4; using two edge dimensions would give 3 | Pass. |
| G0.3 progressiveness openness | γ(s)=(s,s³), perturb −εs near zero | Height derivatives at zero: 0 and −ε; repaired γ(s)=(0,s) gives 1 and >1/2 | Fail as written; R02. |
| G0.3 projected cusp | γ_t(s)=(s²,s³−ts,s) | At s=t=0 projected derivative=(0,0), full derivative=(0,0,1); double points for t>0 at ±√t, none for t<0 | Pass; C2/C5 exclude the cusp. |
| G0.3 double tangency | y=0 and y=x²−t | Intersections for t<0,=0,>0: 0,1 tangent,2 transverse | Pass. |
| G0.3 triple event | Lines x=0,y=0,y=x+t | At t=0 one triple point; at t≠0 three distinct double points | Pass. |
| G0.3 bad-stratum dimensions | One-parameter curves; cusp, tangency, triple, quadruple | Domain/codimension: 2/2,3/3,4/4,5/6; expected dimensions 0,0,0,−1 | Pass dimension tests; does not replace diagonal/local-finiteness proofs. |
| G0.3 height birth/death | y_t(s)=s³−ts | Critical-point counts 0,1 degenerate,2 for t<0,=0,>0; second derivatives at ±√(t/3) are ±6√(t/3) | Pass. |
| G0.3 feature-height exchange | Heights t and −t | Difference 2t; exactly one collision at 0, order reverses | Pass. |
| G0.3 compactness/local finiteness | Event set {1/n}; locally finite closed discrete event set in a compact interval | {1/n} has infinitely many events accumulating at 0; local finiteness at 0 fails | Pass: text explicitly requires local finiteness before compactness. |
| G0.4 positive crossing coordinates | t=0,1/2,1 | First strand: (−1,0,0),(0,1/2,1),(1,1,0); second has opposite x,z. Over/under depth difference at crossing=2 | Pass: left input goes over. |
| G0.4 crossing sign witness | Projected tangent order (over,under) at 1/2 | det((π,1),(−π,1))=2π>0; depth reversal gives −2π | Coordinate sign computed; dictionary to native sign still a target. |
| G0.4 crossing inverse | Q, degrees 1 and 2 | c=4 swap; its inverse=1/4 swap, composite=1; reverse braiding=4 swap gives composite=16 | Pass; excludes accidental symmetry. |
| G0.4 independent features | V scalars f=2,g=3 | (2⊗1)(1⊗3)=6=(1⊗3)(2⊗1) | Pass. |
| G0.4 rebracketing/unit | Cartesian tensor and empty boundary | ((1,2),3)→(1,(2,3)); (*,1)→1; zero ports contribute the unit, not a generator | Pass. |
| G0.4 Yang–Baxter | Q degrees 1,1,1; permutation image in S₃ | Scalar 2³=8 both sides; both permutations reverse the first and third positions | Pass. |
| G0.4 hexagons/unit crossings | Q degrees 1,1,2 and degree 0 | Cable factor 2^(1·3)=8=2·4; unit crossing 2^0=1 | Pass. |
| G0.4 naturality | Q lines of degrees 1,2 with f=2,g=3 | (2·3)·4=24=4·(3·2) | Pass; nullary identity case gives 1. |
| G0.4 snake identities | V=ℚ²; also V=0 | Both snake maps send e₁,e₂ to themselves; on V=0 both sides are the unique zero map | Pass; zero object is permitted. |
| G0.4 mate slide | f:ℚ→ℚ², f(1)=(2,3), φ=(5,7) | φ(f(1))=31=(f*φ)(1) | Pass; the zero map gives 0 on both sides. |
| G0.4 full-turn naturality | Standard V, f=2; modified C₃ character with j=ω | Standard 2·1=1·2=2; modified 2ω=ω·2 | Pass; C3 lacks this pivotal identification. |
| G0.4 twist balance | Q, degrees 1 and 2 | θ₃=2^9=512; θ₁θ₂c₁₂c₂₁=2·16·4·4=512 | Pass. |
| G0.4 unit twist | Q degree 0 | θ₀=2^0=1 | Pass. |
| G0.4 spatial coupon turn | Q, degree-1 scalar coupon f=3 | θf=2·3=6=fθ; multiport balance has value 512 above | Pass algebraically; geometric completeness remains a target. |
| G0.4 ribbon compatibility | Q degree ±1; non-ribbon C₃ pivotal example | Q: θ₋₁=2=(θ₁)*. C₃: ω⁻¹=ω²≠ω=(θχ)* | Pass; extra relation discriminates. |
| G0.5 elementary slabs | Coupon 2 below coupon 3; two independent features | Composite value 6 before/after introducing a cut; disjoint-order exchange also 6 | Pass on test; no general completeness inferred. |
| G0.5 closed specialization | One circle versus one interval with a coupon | Circle has boundary size 0; interval boundary size 2 plus coupon ports | Only first lies under Roseman Prop.8.1 as stated; R09 attribution. |
| C1 planar coherence headline | Empty diagram; two distinct unit coupons | Empty evaluates 1; coupons 2 and 3 remain unequal; independent compositions evaluate 6=6 | Pass discriminating examples; endpoint absent from Lean. |
| C1 object-only specialization | Object word A⊗unit and A | One structural arrow between these isomorphic objects; any two such arrows agree by native thinness | Pass; cite native theorem. |
| C1 strict word normalization | (A⊗B)⊗C and A⊗(B⊗C) | Both word normalizations [A,B,C]; Cartesian realization compares ((1,2),3) with (1,(2,3)) | Pass; comparison is an iso, not equality in the target. |
| C2 braided coherence headline | No coupons, n=0,1,2 | B₀ and B₁ trivial; B₂ generator has exponent 1; σ² has exponent 2 versus identity 0 | Pass; no permutation-only quotient. |
| C2 nonabelian check | n=3; σ₁σ₂ and σ₂σ₁ | Permutations (123) and (132), with the usual right-to-left action | Unequal; claimed general theory retains noncommutation. |
| C2 pure braids | n=2, σ² and identity | Both permutations identity; exponents 2 versus 0 | Pass. |
| C2 stacking convention | Words [σ],[σ⁻¹] | toBraid append=σσ⁻¹=1; exponent sums 1+(−1)=0 | Pass; native append law opened. |
| C2 empty cable | Q degree-0 cable beside degree 1 | Crossing factor 2^(0·1)=1, source/target contain zero extra ports | Pass. |
| C3 rigid coherence headline | [(a,0)]; mixed and right double dual | L(R(w))=[(a,0)]; R(R(w))=[(a,2)]≠w | Pass; pivotality not imposed. |
| C3 dual tensor/composite laws | w=[(a,0),(b,2)]; f,g matrices | R(w)=[(b,3),(a,1)]; (GF)ᵀ=FᵀGᵀ=[[1,1],[1,2]] | Pass contravariance and order reversal. |
| C3 circle admissibility | One oriented closed strand with a single formal rigid label | Turning changes dual level by ±2, not 0 | Bare unlabelled circle cannot automatically define a rigid trace; pass. |
| C3 one-sided comparison | Finite levels −2 and 1 | Add an even shift 2: levels 0 and 3; parity unchanged | Pass finite-term test; does not identify all integer levels. |
| C3 change of pairing | A one-dimensional dual with coevaluation scaled by 2, evaluation by 1/2 | Snake scalar 2·1/2=1; forgetting inverse scaling gives 2≠1 | Pass. |
| C4 pivotal coherence headline | One letter at levels 0,2 | Parities both 0; comparison uses j, e.g. scalar ω rather than literal identity | Pass. |
| C4 half/full coupon rotations | Scalar f=2 on V; C₃ modified pivotal structure | f*=2; f**=2; full-turn conjugation ω⁻¹·2·ω=2 | Pass; markings still required. |
| C4 category-generated case | Unary coupons g=2,h=3 and their prescribed composite | Composite label 6; a (2,1)-port generator has 3 ports, unlike every unary generator's 2 | Pass; arbitrary arity is an additional target. |
| C4 nonspherical trace check | χ(z)=ω, jχ=ω | Right trace of id=ω; left trace=ω⁻¹=ω²; difference i√3≠0 | Pass, using supplier's left/right formulas. |
| C5 regular coherence headline | Same symmetric C₃ category | c²=1, yet θχ=ω and θχ*=ω² differ from (θχ)*=ω | Pass; symmetry alone does not force this chosen pivotal structure ribbon. |
| C5 R1 exclusion | An oriented projected circle and a circle with one extra curl | Tangent turning numbers 1 and 2 | A regular homotopy cannot erase the extra turn; pass. |
| C5 oriented variants | f:ℚ→ℚ² above and its dual | Matrix shapes 2×1 and 1×2; pairing values 31=31 | Pass typing test; full orientation list still needs specification. |
| C6 ribbon coherence headline | Framed unknot with framing 0,+1,−1 in Q colour 1 | Evaluations 1,2,1/2 | Pass; framings cannot be silently forgotten. |
| C6 normal-field/ribbon model | Normal framing of a circle, degrees 0 and 1 | Degrees 0≠1; multiplying normal length by any positive width leaves degree unchanged | Pass; width is auxiliary, winding is not. |
| C6 blackboard framing correction | Positive curl: writhe +1, recorded correction −1 | Total framing 1+(−1)=0, matching straight strand 0; forgetting correction leaves 1≠0 | Pass. |
| C6 ribbon quotient of C5 | C₃ non-ribbon model | New relation would require ω²=ω, which is false | Pass: the quotient genuinely adds a relation. |
| C6 Shum specialization | Empty, one positive point, positive/negative pair | Boundary words [],[+],[+,−]; empty endomorphisms include closed components, not just identity | Pass boundary-type test; missing geometric proof cannot be tested by raw soundness. |
| C6 category-generated vs full signature | Unary coupon versus unit→A⊗B | Port counts (1,1) versus (0,2) | Source's unary case does not itself establish arbitrary-arity case; text acknowledges extension. |
| C7 RT functor/evaluation | Q straight strand, twist and inverse | Values 1,2,1/2; twist followed by inverse gives 1 | Pass. |
| C7 cutting/reclosing, closures | Q simple line; standard V=ℚ² | Closed values 1 and trace(idℚ²)=2; either allowed cut returns those same values | Pass under ribbon structure. |
| C7 colour orientation reversal | C₃ character and dual | Character values ω and ω⁻¹; dual of scalar ω is still ω | Pass; dualization is not complex conjugation on scalar morphisms. |
| C7 mirror comparison | Q degree 1 | c=2, θ=2; mirror c=1/2, θ=1/2; double mirror restores 2,2 | Pass. |
| C7 scalar normalization | δ=1,τ=2; unknot with writhe 0 and +1 | δ⁻¹τ⁰·1=1; δ⁻¹τ⁻¹·2=1 | Pass; positive-curl convention fixes the exponent. |
| C7 nonunit-dimension control | V=ℚ² with coefficient ring changed to ℤ; dimension 2 | 2 is a unit over ℚ, not over ℤ; 1/2 absent in ℤ | Normalization must retain invertibility; README does. |
| C7 zero object / zero ring | Zero object dimension 0 in a nonzero field; trivial ring | 0 is not a unit in the field, so excluded; in the zero ring 0=1 and normalized invariant is the unique scalar | No unguarded division claim found. |
| C7 Hopf link | Q colours of degrees 1,1 | Double braiding trace=2·2·1=4; two unlinked circles give 1 | Pass; linking detected. |
| All six evaluations: identity/substitution | Identity signature map; coupon values 2,3 | Identity sends 2 to 2; substitution composite evaluates 6 on both routes | Pass on actual generators. |
| R01 supplier availability | Required Drinfeld declaration at pins and on cited main target | Exact named declarations found: 0; explicitly supplied functor-comparison targets found: 0 | Blocking missing input; local target/gap required. |
| R03 headline coverage | Six geometric endpoints versus two admitted statements | Geometric endpoints stated: 0/6; admitted syntax/list statements: 2 | Replace substitute acceptance file. |
| R05–R07 header | Original versus tested ordinary-import header | Failing import checks 3 versus 0 by text inspection; both versions elaborate only with suitable module visibility | Apply tested combined repair. |
| R08 API/check shape | Required versus actual Checks per new definition | Required ≥3; explicit local Checks blocks 0 | Add computed checks and per-target dependencies. |
| R09–R10 source traceability | Five sampled targets, ten works | Inline locators in five G0 targets: 0; manifest entries: 0/10 | Attach locators and records. |
| R11 stable naming | Supplier TemperleyLieb on main versus proposal instruction | Main owner resolves once; no additional mathematical object is supplied by a PR number | Replace process text. |
| R12 Lean form | Required namespace/docs versus present | Namespace prefix absent; five declaration docstrings missing; twelve declared names absent from README | Fix only retained declarations. |

The 111 computed rows cover all twelve Lean declarations, all fourteen relation constructors, the five sampled G0 targets and their mathematical clauses, the six coherence endpoints, C7's consequences, and each finding. It includes empty/nullary cases, non-strict targets, zero objects, nonunit normalization, nonabelian braids, same-handed versus mixed duals, and non-ribbon pivotal examples. Arithmetic-only test classes such as ramified primes or inseparable field extensions have no role in these statements.

## Not verifiable

- **G0.1–G0.5 in full generality:** the concrete tests and located source cases do not prove the new collar/coupon/progressive/framing adapters, relative smoothing/flattening, or their completeness. These are substantial new targets. G0.2 has no exact supporting locator in the README; R09 requests a traceable route.
- **joyalStreetI:** DOI 10.1016/0001-8708(91)90003-P was classified uncertified by the sources service. The author's publication page was also sought but timed out. The precise published theorem text and pages were not verified; Selinger's references are secondary evidence only.
- **freydYetter:** DOI 10.1016/0022-4049(92)90018-B was classified uncertified. Theorems 3.8 and 4.4 were not independently read in the primary paper.
- **shum:** DOI 10.1016/0022-4049(92)00039-T and the publisher PDF endpoint were both classified uncertified. Theorem 6.1's category-generated scope is reported by the legally read Selinger text; the primary proof was not certified.
- **golubitskyGuillemin:** DOI 10.1007/978-1-4615-7904-5 was classified uncertified. Theorem II.4.13's exact hypotheses and printed page were not certified. No assertion is made that this theorem itself includes the requested relative same-parameter extensions.
- **yetter:** DOI 10.1142/4542 led to the publisher's HTTP 403 response. Chapters 7–9, Theorem 9.1 and Lemma 9.12 were not read; the missing-reference record preserves that attempt.
- **Newer upstream inventory:** the review checks the permitted pins and roadmap contracts. It does not certify the README's inventory at a different Tau Ceti revision as an available supplier.
- **Fileless proposal ownership:** the particular open-head HeegaardFloer and ribbon-representation citations were not checked; they were not used to satisfy a prerequisite.

## Source issues

The Roseman items below were checked against the rendered publisher PDF where OCR could be ambiguous. They do not refute the roadmap's endpoints: G0.2 already warns against confusing an embedded trace with a level-preserving family.

- **Misprint** in roseman at §2, printed p.295: the source says the low-dimensional results are Corollaries 8.1 and 8.2; it should be Propositions 8.1 and 8.2; affects nothing.
- **Error** in roseman at Proposition 4.5, printed p.298: the source says a sufficiently C¹-close proper embedding of an isotopy trace is itself an isotopy; it should be made level preserving by a stated source reparameterization, or restricted to parameter-preserving perturbations; affects a stated result.
- **Misprint** in roseman at proof of Proposition 4.5, printed p.298: the source says to take fibres of G composed with the time projection; it should be fibres of the time projection composed with G; affects the proof.
- **Misprint** in roseman at sentence before Proposition 7.1, printed p.306: the source says q=0 recovers the Morse lemma; it should be q=m for the displayed quadratic normal form; affects nothing.
- **Misprint** in roseman at Proposition 7.1, printed p.306: the source says the same tangential restriction has a critical point and is nonsingular; it should be the complementary restriction that is nonsingular when normal directions are present; affects a stated result.
- **Misprint** in roseman at Proposition 7.1, printed p.306: the source says the normal-form expression is phi composed with f; it should be f composed with the coordinate embedding phi; affects a stated result.
