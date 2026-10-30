# Review of TopologicalSheafCohomology (pull request #973 at 5789680)
**Verdict:** needs changes

:robot: Independent AI review (Claude). Full re-review of the repaired head: the previous review's nine findings are checked one by one below, then the whole folder. One blocking finding remains, the unresolved half of the earlier ownership finding against ImplicitAtlases. The gate passes, the direct elaboration passes, the sampled locators all verify. No change was made to the pull request.

## Status of the previous review's findings

| Finding at 6e3d3a9 | Passage at 5789680 | Status |
|---|---|---|
| R01 (P1) reciprocal supply with CharacteristicClasses | `README.md:11`: "Neither that comparison nor the support/cap comparison is an input or a target of this roadmap." No `*Needs:*` line cites CharacteristicClasses; the only edge is CharacteristicClasses → this roadmap (`TauCetiRoadmap/CharacteristicClasses/README.md:449` on main). | Repaired. |
| R02 (P2) Godement re-planned | `README.md:9` and `README.md:43–45`: SchemeAndStackFoundations §2.5 owns the resolution; §0.1 transports it. Confirmed against main `TauCetiRoadmap/SchemeAndStackFoundations/README.md:3388–3396` (`godementResolution`, flasque, exact, restrict, `sheafH_iso_godement`, `flasque_cech_vanishing`). | Repaired. |
| R03 (P2) ownership against ImplicitAtlases | `README.md:10` cedes parity, K-sheaves, compact-cover cohomology, purity, supports, extension by zero, quotients, orientation sheaves, duality and interval totals to ImplicitAtlases §§0.5–0.11. The Čech colimit on compact Hausdorff spaces, its refinement independence, its finite-cover cofinality and the bounded-below hypercohomology spectral sequence are still built in §§1.2 and 1.4 while ImplicitAtlases §0.7 builds them too. | Partly repaired; the remainder is R01 below. |
| R04 (P2) headline theorems absent | `Suggested.lean:32` states the module/abelian derived comparison, `Suggested.lean:62` the proper finite-fiber stalk isomorphism; the docstring (`Suggested.lean:8–16`) names the Čech/derived comparison and the hypercohomology spectral sequences as not statable and says which carrier is missing. | Repaired. |
| R05 (P3) padding | Three declarations remain; the one-tactic probe closes neither theorem (below). | Repaired. |
| R06 (P3) locators | Every target carries tag and printed-page locators; all sampled ones verify (table below). No `sources.toml`, but none of the 125 roadmap folders on main carries one, so it is not a folder requirement. | Repaired. |
| R07 (P3) Checks | `**Checks.**` blocks with 4+3, 3, 7, 4, 4, 4, 5 bullets for §§0.1, 0.2, 1.1, 1.2, 1.3, 1.4, 2.1; each computed and discriminating (values recomputed below). | Repaired. |
| R08 (P3) shape | Summary, Scope and ownership, Conventions, Exact supplier contracts, How to read the build, three layers with `*Needs:*`, Examples and Dependencies, Downstream consumers, References. Pull-request-number prose removed (gate `prnum=0`). | Repaired. |
| R09 (P3) names | `moduleCohomologyForgetComparison` (`README.md:68`), `fiberStalkMap` (`README.md:190`), `properFiniteFiberStalk` (`README.md:194`) are the only backticked names of the roadmap's own and all three are declared with docstrings; layer comments present. | Repaired. |

## R01 (P2) — Čech cohomology on compact Hausdorff spaces has two owners (ImplicitAtlases §0.7 and §§1.2, 1.4)

**Location:** `TauCetiRoadmap/TopologicalSheafCohomology/README.md:10`, "The arbitrary-space cover system in §1.2 extends the compact-space setting of ImplicitAtlases §0.7"; `README.md:128`, "Define Čech cohomology as the filtered colimit … on the preorder ordered by existence of refinement"; `README.md:130`, "The finite covers on a compact space and the point-neighborhood system give the same cohomology"; `README.md:163–167` (hypercohomology colimit and its first spectral sequence).

**Claim:** This roadmap owns the cover-colimit Čech cohomology, its refinement independence, its finite-cover cofinality on compact spaces and the bounded-below hypercohomology spectral sequence, and has no supply relation with ImplicitAtlases.

**Witness:** ImplicitAtlases at its open head (`TauCetiRoadmap/ImplicitAtlases/README.md:9`) owns "Čech cohomology with sheaf coefficients on compact Hausdorff spaces"; its §0.7 (`README.md:191`) defines Ȟ for a sheaf of R-modules as the colimit over open covers with refinements as transition maps (Pardon A.4.3), `:193` refinement independence (Pardon A.4.1), `:194` finite covers suffice on compact X (Pardon A.4.4), `:195` the convergent bounded-below hypercohomology spectral sequence (Pardon A.4.13), `:204` the empty space. `README.md:202` there is the same two-arc S¹ Check as `README.md:139` here (ℤ²→ℤ², (a,b)↦(b−a,b−a), H¹=ℤ, one-set cover gives 0). ImplicitAtlases is at position 200 of the merge order, this roadmap at 283. On a compact Hausdorff X both roadmaps therefore build the same object from the same source with the same tests, and neither cites the other as supplier.

**Repair:** One owner for the compact-Hausdorff statements. Within this pull request: keep §1.1 and the arbitrary-space colimit of §1.2 (main's CharacteristicClasses already consumes them from here, `TauCetiRoadmap/CharacteristicClasses/README.md:449`), but state the compact-space specialization as an identification, not a reproof: "on compact Hausdorff X the colimit of §1.2 is identified with Ȟ of ImplicitAtlases §0.7, whose finite-cover cofinality (Pardon A.4.4) and empty-cover normalization are imported", add ImplicitAtlases §0.7 to the `*Needs:*` lines of §1.2 and §1.4 (a downward edge, allowed by the order), drop the duplicated finite-cover bullet and the S¹ and ∅ Checks that test the imported object, and in §1.4 state the first spectral sequence as the open-cover form of ImplicitAtlases §0.7's A.4.13 statement, owning only the pagewise refinement colimits and the two derived comparisons. The alternative, ImplicitAtlases §0.7 citing §§1.1–1.2 here (as CharacteristicClasses does) with ImplicitAtlases moved after this roadmap in the merge order, is the cleaner library outcome but is not a change this pull request can make; it needs a human decision across the two pull requests, and the report records it for that purpose. On the instance that exhibits the overlap (S¹, two arcs): after the repair there is one computation of H¹=ℤ, in ImplicitAtlases §0.7, and this roadmap's §1.3 then adds the new identification H¹=R¹Γ(S¹;ℤ)=ℤ. This is the unrepaired part of the previous review's R03.

## R02 (P3) — §0.1's route uses an unnamed input: an acyclic resolution computes `rightDerived`

**Location:** `TauCetiRoadmap/TopologicalSheafCohomology/README.md:68`, "use the transported flasque resolution, observe that its underlying abelian terms are flasque, and apply the abelian acyclicity theorem to the same sections complex".

**Claim:** Flasque acyclicity (Stacks 20.12.2–20.12.3) and Tau Ceti's abelian acyclicity suffice to identify V RⁿΓ_R with Hⁿ U.

**Witness:** Mathlib's `Functor.rightDerived` at the pin is defined through `injectiveResolutions` only (`Mathlib/CategoryTheory/Abelian/RightDerived.lean:64`, `:108`); no declaration in `RightDerived.lean` or `Mathlib/Algebra/Homology` computes it from an F-acyclic resolution. Stacks 20.12.3 (`stacks-cohomology line 812`) gives acyclicity of flasque modules, not the comparison of `rightDerived` with the sections of a flasque resolution; SchemeAndStackFoundations §2.5's `sheafH_iso_godement` gives it for the abelian `Sheaf.H` only.

**Repair:** Add one bullet to §0.1: "a bounded-below Γ_R-acyclic resolution computes `rightDerived` of Γ_R, naturally and compatibly with connecting maps", with its own locator, and list it in the `*Needs:*` line. On the point with F=ℤ/4 the bullet says H⁰ of the Godement sections equals R⁰Γ_R(F)=ℤ/4 and all Hⁿ, n>0, equal 0, which is the Check already at `README.md:72`.

## R03 (P3) — §1.1's ordered presentation needs a chosen total order on the index type

**Location:** `TauCetiRoadmap/TopologicalSheafCohomology/README.md:106`, "Construct its ordered-subset presentation with orientation signs; the comparison is a homotopy equivalence … (Stacks, Definitions 20.23.1–20.23.2 and Lemmas 20.23.3–20.23.6 …)".

**Claim:** The ordered presentation is defined for a u-small indexed family as such.

**Witness:** Stacks' ordered complex requires a total ordering of the index set (`stacks-cohomology line 1827–1829`, `line 1840–1843`), and the comparison map depends on it up to the sign of Remark 20.23.5 (`line 1874–1879`); Pardon's order-free variant tensors with orientation lines instead (`pardon line 5262–5264`). The README names neither device, and its Check at `README.md:120` ("Reversing the two indices multiplies the ordered degree-one coordinate by −1") only makes sense once an order is chosen.

**Repair:** Say in §1.1 which presentation is built: "choose a well-ordering of the index type (every u-small type has one) and form Stacks' ordered complex; a change of order acts by the permutation sign of Remark 20.23.5", or "tensor each term with the orientation line of its index set (Pardon, footnote 42)". With two indices and either order the degree-one term is F(U₀∩U₁) and the two orders differ by −1, as the Check computes.

## R04 (P3) — Layer 2 carries hypotheses the theorem does not use

**Location:** `TauCetiRoadmap/TopologicalSheafCohomology/README.md:17`, "Layer 2 assumes locally compact Hausdorff X and Y"; `Suggested.lean:63`, `[T2Space X] [T2Space Y] [LocallyCompactSpace X] [LocallyCompactSpace Y]`.

**Claim:** Local compactness of X and Y and Hausdorffness of Y are hypotheses of the stalk isomorphism.

**Witness:** The proof sketched at `README.md:194` uses only: the fiber is finite, its points are separated by disjoint opens (Hausdorff X), and f is closed (Mathlib's `IsProperMap` is a closed map with compact fibers, `Mathlib/Topology/Maps/Proper/Basic.lean:77`). Instance: X=Y=ℚ with the subspace topology (Hausdorff, not locally compact), f=id, F any sheaf, y=0: (id_*F)_0=F_0 and the product over the one-point fiber is F_0, and `fiberStalkMap` is the identity, so the statement holds without local compactness. Pardon states it under the standing convention "space means locally compact Hausdorff" (`pardon line 4931`).

**Repair:** Either drop `LocallyCompactSpace X`, `LocallyCompactSpace Y` and `T2Space Y` from `properFiniteFiberStalk` and `README.md:17`, or keep them and say in Conventions that they are the source's standing convention and are not used by the proof. Neither choice changes the Checks at `README.md:198–202`.

## R05 (P3) — Record that Stacks §20.15 displays the homotopy with the opposite sign

**Location:** `TauCetiRoadmap/TopologicalSheafCohomology/README.md:109`, "Fix its sign by T_b−T_a=δh+hδ … (Stacks, §20.15, tag 09UY, p.24; §20.25, equation (20.25.0.2) and its computation, pp.46–47)".

**Claim:** The cited passages support the displayed sign.

**Witness:** Stacks §20.15 prints γ−γ′=d∘h+h∘d with γ for the first index function c and h listing c before c′ (`stacks-cohomology line 1072–1077`); on the two-index point cover with c=0, c′=1 this gives (hd)(a,b)=b−a=γ′−γ, so the printed sign is reversed. Stacks' own §20.25 computation ends with T_{t′}−T_t (`line 2184–2185`), which agrees with the README's T_b−T_a and with its Check at `README.md:115`.

**Repair:** Cite §20.25's computation as the authority for the sign and add a clause that §20.15's displayed equation has γ and γ′ interchanged, so that an implementer does not "correct" the README to match it. The two-index Check already pins the convention: h=id on degree 1, hδ(a,b)=b−a=T₁−T₀.

## Verified sound

### Gate, build and dependency check

The worker's gate at 5789680 passes every check (`gate.md`: set_option, blob, latex, tex, prnum, sorry-data, sorry-examples, residue, private-paths, imports, mathlib-subimports, lean-lines, forbidden, dropped, readme-ids-missing, empty-sections, round-labels, long-fences, layer-ids, target-ids, depcheck, metadata, stray-files, dirty, outside-folder, source-material, build all 0). The folder contains `README.md`, `Suggested.lean` and `metadata.toml` (`topic = "math.AT"`) only; `git diff --stat origin/main...HEAD` outside the folder is empty.

`lake env lean` on `TauCetiRoadmap/TopologicalSheafCohomology/Suggested.lean` from the worktree: exit 0, exactly two warnings, `declaration uses 'sorry'` at lines 32 and 62. The file has `import Mathlib` only, one module docstring, `namespace TauCetiRoadmap.TopologicalSheafCohomology`, two layer comments, no `set_option`, no `lemma`, no sorried data (the one `def`, `fiberStalkMap`, has a real body: `Pi.lift` of `eqToHom ≫ stalkPushforward`).

The prescribed dependency check printed exactly:

```text
depcheck: 208 roadmaps, 1452 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line. The README's cross-roadmap citations resolve: SchemeAndStackFoundations §2.5 (main `README.md:3388`, heading text identical to `README.md:9` here); CharacteristicClasses C1.2b (main `README.md:445–474`, which consumes this roadmap's TS1.1–TS1.2 at `:449` and owns `cechSingularCWTypeComparison` at `:462`); ComplexKahlerGeometry K2 (main `README.md:193`, Čech/derived colimit on paracompact Hausdorff manifolds at `:272–279`); ImplicitAtlases §§0.5–0.11 (open head, `README.md:156–273`). Supply direction: this roadmap → CharacteristicClasses (main) → HilbertModules (open head `README.md:90, 101`) and → ImplicitAtlases (`README.md:73`); this roadmap cites none of them. SchemeAndStackFoundations §2.2 explicitly leaves Čech refinement diagrams and their colimits outside its scope (main `README.md:3349`), so the arbitrary-space colimit of §1.2 has no owner on main other than this roadmap. The depcheck does not see the ImplicitAtlases overlap of R01 because neither roadmap cites the other; R01 is a manual finding.

### Pinned declarations opened

Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`, Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, as in `lake-manifest.json`.

| File and line at the pin | Declaration | Checked |
|---|---|---|
| `Mathlib/CategoryTheory/Sites/GlobalSections.lean:64` | `Sheaf.Γ` | right adjoint of the constant sheaf; needs `HasGlobalSectionsFunctor`, supplied by `:74` (terminal object) |
| `Mathlib/CategoryTheory/Sites/SheafCohomology/Basic.lean:56`, `:84`, `:152` | `Sheaf.H`, `Sheaf.H'`, `Sheaf.functorH` | `H F n = Ext (constantSheaf ℤ) F n` with `HasSheafify`, `HasExt`; so `functorH n` is Ext from the constant sheaf, which equals RⁿΓ on abelian sheaves; the README's comparison is a theorem, not a definition |
| `Mathlib/CategoryTheory/Abelian/RightDerived.lean:64`, `:108` | `Functor.rightDerived` | through `injectiveResolutions` only (R02) |
| `Mathlib/Algebra/Category/ModuleCat/Sheaf.lean:97` | `SheafOfModules.forgetToSheafModuleCat` | restricts to the global-section ring, as `README.md:31` says |
| `Mathlib/CategoryTheory/Sites/SheafCohomology/Cech.lean:65` | `cechComplexFunctor` | all tuples, no covering hypothesis |
| `Mathlib/CategoryTheory/Limits/FormalCoproducts/Basic.lean:47` | `FormalCoproduct` | exists |
| `Mathlib/Algebra/Homology/DerivedCategory/RightDerivedFunctorPlus.lean` | file | exists |
| `Mathlib/Topology/Sheaves/Functors.lean:60` | `TopCat.Sheaf.pushforward` | `X.Sheaf C ⥤ Y.Sheaf C` for `f : X ⟶ Y` |
| `Mathlib/Topology/Sheaves/Stalks.lean:172`, `:180` | `stalkPushforward`, `stalkPushforward_germ` | `(f _* F).stalk (f x) ⟶ F.stalk x`; germ of a section over U at f x maps to its germ at x, the formula `README.md:190` states |
| `Mathlib/Topology/Maps/Proper/Basic.lean:77` | `IsProperMap` | continuity plus cluster-point lifting; no finiteness or separation |
| `Mathlib/CategoryTheory/Sites/Whiskering.lean:51` | `sheafCompose` | exists |
| `Mathlib/Algebra/Homology/DerivedCategory/Ext/Basic.lean:92`, `Sites/Sheafification.lean:50–69` | `HasExt.standard`, `HasSheafify` instances | the theorem's class hypotheses are satisfiable, so it is not vacuous |
| `TauCeti/Topology/Sheaves/Flasque.lean:75`, `:149`, `:156` | `isFlasque_of_injective`, `subsingleton_H'_succ_of_isFlasque`, `subsingleton_H_succ_of_isFlasque` | abelian sheaves on an arbitrary `TopCat`, as `README.md:38` says |
| `TauCeti/CategoryTheory/Sites/SheafCohomology/FreeYoneda.lean:84`, `:145` | `freeYonedaSheafSectionsEquiv`, `mono_freeYonedaSheafFunctor_map` | under `HasSheafify` |
| `TauCeti/CategoryTheory/Sites/SheafCohomology/Cech.lean:198`, `:309` | `cechAugmentation`, `quasiIso_cechAugmentation_iff` | terminal object T, sheaf condition plus positive exactness; no acyclicity of a general cover asserted |
| `TauCeti/CategoryTheory/Sites/SheafCohomology/Terminal.lean:101` | `Sheaf.cohomologyPresheafEvaluationIsoFunctorH` | namespace `CategoryTheory.Sheaf`, as cited |

### Signatures

`#check @name` for the three declarations on a scratch copy elaborated; the types equal those in the worker's `signatures.md` and match the README: `moduleCohomologyForgetComparison` quantifies over `R : Type u`, `X : TopCat.{u}`, the five class hypotheses listed at `README.md:23`, and `n : ℕ`, and concludes `Nonempty` of a natural isomorphism `rightDerived n ⋙ forget₂ ≅ sheafCompose forget₂ ⋙ functorH n` (the README's "naturally isomorphic"); `properFiniteFiberStalk` carries `T2Space`, `LocallyCompactSpace` for both spaces, `IsProperMap f`, finite fibers, and concludes `IsIso (fiberStalkMap R f F y)` for every F and y. No section binder is lost: `fiberStalkMap` correctly omits the topological hypotheses its type does not mention.

### Padding probe

A scratch copy replaced each `sorry` by `first | infer_instance | exact ⟨Iso.refl _⟩ | simp | rfl` (line 32) and `first | infer_instance | simp [fiberStalkMap] | rfl` (line 62). Both failed (unsolved goals), so neither theorem is padding; `fiberStalkMap` is the one definition the second headline needs.

### Headline inventory

From the Summary and layers: (1) the module-derived/underlying-abelian comparison V RⁿΓ_R ≅ Hⁿ U (§0.1): stated. (2) The compact Hausdorff Čech/derived comparison (§1.3): not statable at the pins because the refinement diagram on the cover preorder has no carrier; a pointwise-ordered point-neighborhood system with identity index functions would make the transition maps canonical, but it still needs the functoriality laws of §1.1 proved before the diagram exists, so the docstring's judgement stands. (3) Bounded-below hypercohomology and its two spectral sequences (§1.4): not statable for the same reason, as the docstring says. (4) The proper finite-fiber stalk isomorphism (§2.1): stated. No free-variable substitute is present.

### Sources and the seeded sample

Both cited works were read through the sources service (Stacks, Cohomology of Sheaves chapter PDF, cache id `stacks-cohomology`; Pardon arXiv 1309.2370v6, cache id `pardon`). Every locator of the seeded sample (§§0.1, 0.2, 1.1, 1.2, 1.3, 1.4, 2.1) was checked at its tag or lemma and printed page.

| Target | Locator in the README | Source line and page | Supports the statement as written? |
|---|---|---|---|
| 0.1 | Stacks 20.30.1–20.30.2, 0FKS–0FKT, pp.65–66 | `stacks-cohomology line 3083` (p.65), `line 3110` (p.66) | Yes: flasque functorial Godement resolution for O_X-modules; the constant-ring equivalence is correctly marked as the roadmap's own specialization |
| 0.1 | Stacks 20.12.2–20.12.3, 09SX–09SY, pp.18–19; §20.3, p.3 | `line 809`, `line 812` (p.18, proof on p.19), `line 100–133` (p.3) | Yes: injective ⇒ flasque; flasque ⇒ RΓ-acyclic on ringed spaces; RF via resolution functors |
| 0.2 | Stacks §20.3 (20.3.0.1)–(20.3.0.3), p.3; 20.30.2, 0FKT, p.66 | `line 114–126`, `line 3110–3130` | Yes: bounded-below Godement totalization, finite direct sums of flasque terms |
| 1.1 | Stacks 20.23.1–20.23.6, 01FH–01FM, pp.40–43 | `line 1821`–`1960` (pp.40–43) | Yes, with a total order on the index set (R03); c∘π homotopic to identity without division |
| 1.1 | Stacks §20.15, 09UY, p.24; §20.25 (20.25.0.2), pp.46–47 | `line 1066–1087` (p.24), `line 2140–2185` (pp.46–47) | Yes for the maps, laws and colimit; the §20.15 display has the sign reversed (R05), the §20.25 computation gives T_{t′}−T_t |
| 1.2 | Stacks §20.15, pp.24–25; Pardon A.4.1, p.119; A.4.4, p.120 | `line 1085–1087`; `pardon line 5231` (p.119), `line 5267` (p.120) | Yes: colimit over coverings preordered by refinement; finite covers cofinal on compact X. The point-neighborhood small system is correctly marked as an adapter |
| 1.2 | Pardon A.4.2 and A.4.3, p.119; Stacks 20.9.2, 01EG, pp.9–10 | `pardon line 5237`, `line 5240`; `stacks-cohomology line 407` (p.10) | Yes: Ȟ(∅)=0; degree zero is sections for a sheaf |
| 1.3 | Stacks 20.16.2, 09V2, pp.26–28 | `line 1169–1262` | Yes: Hausdorff and quasi-compact, all n, universal δ-functor route with shrinking; the README's P(∅)=0 extension is marked as its own |
| 1.3 | Stacks 20.11.6, 01ET, p.15 | `line 678–683` | Yes: acyclic intersections ⇒ Čech computes cohomology, for O_X-modules |
| 1.4 | Stacks §20.25 (20.25.0.1)–(20.25.0.2), pp.46–47; 20.25.1–20.25.2, 08BN, 0FLH, pp.47–48 | `line 2134`, `line 2140`, `line 2196` (p.47), `line 2229` (p.48) | Yes: fixed-cover map Tot→RΓ, E₂=H^p(Tot Č(U,H^q)), acyclic-intersection isomorphism; total differential convention δ+(−1)^p d agrees with `line 2126–2129` |
| 1.4 | Pardon A.4.13, p.122 | `pardon line 5386` | Yes: E₁^{p,q}=Ȟ^q(X;F^p) for bounded-below complexes; the README's open-cover form and pagewise colimits are marked as extensions |
| 2.1 | Pardon A.3.2, p.118; proof of A.4.8, p.121 | `pardon line 5202`, `line 5321–5329`; standing convention `line 4931` | Yes: f⁻¹(U) cofinal among neighbourhoods of f⁻¹(K) for proper f; finite fibers and partitions of pulled-back covers. The stalk-map identification is correctly marked as the roadmap's own |

### Duplication audit by object

Searched by object with `roadmaps grep` over the open heads and main ("existence of refinement", "point-neighbo", "finite fibers", "constant ring sheaf", "rightDerived") and by reading the four cited roadmaps. Results: the arbitrary-space cover colimit is claimed only here, and main's CharacteristicClasses C1.2b (`README.md:449–458`) and HilbertModules at its open head (`README.md:101`) consume it downstream; the compact-Hausdorff specialization is also built by ImplicitAtlases §0.7 (R01); ComplexKahlerGeometry K2 on main builds the Čech-colimit/derived comparison for abelian sheaves on paracompact Hausdorff manifolds (`README.md:274–279`), which overlaps §1.3 only on compact manifolds and with a different coefficient category, as `README.md:12` states; no roadmap states the module-derived/abelian comparison or the native product-of-stalks map (ImplicitAtlases §0.9, `README.md:229`, states the cohomological f^* isomorphism of Pardon A.4.8, a different statement, as `README.md:7` says). No two `Suggested.lean` files declare the same fully qualified name. Ownership against open pull requests whose files the brief does not list was checked only through `roadmaps grep`.

A note for the humans rather than a finding: §1.3 is stated at exactly the generality of its source (Stacks 20.16.2, compact Hausdorff). The library-wide theorem holds on paracompact Hausdorff spaces and would make one owner of both the ImplicitAtlases compact case and the ComplexKahlerGeometry manifold case; that would need a source beyond the two cited and a scope decision.

### Adversarial computations

R=ℤ unless stated. Each row records the values computed on both sides.

| Statement or convention | Instances and values | Result |
|---|---|---|
| §0.1 equivalence Sh(X;R-Mod) ≃ Mod(R_X) | Two discrete points: Γ(R_X)=ℤ², constant map r↦(r,r); (2,3)·(a,b)=(2a,3b); restricting along R→Γ(R_X) returns the R-action 2·(a,b)=(2a,2b). Stalks of R_X at each point: ℤ | Correct; Check at `:64` discriminates Γ(R_X) from R |
| §0.1 extension of scalars | ℤ→ℚ: ℤ↦ℚ, ℤ/2↦0, 0→ℤ→ℤ→ℤ/2→0 ↦ 0→ℚ→ℚ→0 exact. ℤ→𝔽₂: ×2 ↦ 0:𝔽₂→𝔽₂, kernel 𝔽₂ | Flatness hypothesis necessary and stated |
| §0.1 zero ring | R=0: all modules 0, both sides 0 | No nonzero-ring hypothesis needed |
| §0.1 V RⁿΓ_R ≅ Hⁿ U | Point, R=ℤ/4, F=ℤ/4: H⁰=ℤ/4 both sides, 2·1=2 both sides, Hⁿ=0 for n>0. Field ℤ/2: ℤ/2 injective as module, not divisible as group (no x with 2x=1), still H¹=0 at a point on both sides. X=∅: Γ(∅)=0, all groups 0 | Correct; `Nonempty` of a natural iso is what the README claims; not vacuous (instances exist at the pin) |
| §0.1 flasque terms after U | Flasqueness is surjectivity of restrictions, unchanged by forgetting the R-action: Godement term ∏_x i_{x*}F_x on {a,b} restricts F_a×F_b → F_a, surjective | Route step correct; missing lemma named in R02 |
| §0.2 point complex ℤ→ℤ, ×2 | H⁰=ker 2=0, H¹=ℤ/(2)=ℤ/2; identity complex: H=0; zero differential: ℤ,ℤ | Checks correct |
| §0.2 shift sign | F[1]^q=F^{q+1}: ℤ[1] lives in degree −1; two-term ×2 becomes −2 under (−1)^k d with k=1 | Matches Mathlib's shift convention |
| §0.2 finite diagonal | b=−2, m=0: q∈{−2,−1,0}, p=2,1,0, three terms; no bound: (k,−k) for all k | Bounded-below hypothesis is used |
| §1.1 tuple vs ordered, one open | Tuple C^p=P(U) all p, d=Σ_{j=0}^{p+1}(−1)^j: 0,id,0,id,…; H=(P(U),0,0,…). Ordered: C⁰=P(U) only | Check at `:116` correct; equivalence without factorials |
| §1.1 repeated two-index point cover | Ordered C⁰=ℤ², C¹=ℤ, d(a,b)=b−a (Stacks (9.0.1): s₁−s₀); H⁰ diagonal ℤ, H¹=0; sum instead of difference leaves the diagonal | Check at `:114` correct |
| §1.1 refinement homotopy sign | c=0, c′=1: T₀(a,b)=a, T₁(a,b)=b, h(α)=α₀₁, (hδ)(a,b)=b−a=T₁−T₀; degree 1 general check gives dh+hd=T_{t′}−T_t | README's T_b−T_a=δh+hδ correct; Stacks §20.15 display reversed (R05) |
| §1.1 bounds and empty family | Two ordered indices: C²=0; tuple C² has 8 coordinates; empty family: every term a product over the empty tuple set, 0; identity of 0 is 0 | Checks `:116`, `:118` correct |
| §1.1 composition of refinements | Indices {0,1,2}, select 2: (2,3,5)↦5; then the unique map to the one-point cover: 5; composite index function also selects 2 | Check `:117` correct |
| §1.1 coefficients and order reversal | (2,3)↦1 both ways mod 2; swapping indices: −1 on degree 1, equal to +1 over 𝔽₂ | Checks `:119`, `:120` correct given a chosen order (R03) |
| §1.2 smallness | Covers X→Opens X with X : Type u form a Type u; finite covers Σ n, ULift (Fin n)→Opens X likewise | Universe claims correct |
| §1.2 directedness and cofinality | U,V point-neighborhood: W_x=U_x∩V_x∋x refines both via the identity; any cover is refined by a point-neighborhood cover by choosing a member per point; on compact X a point-neighborhood cover has a finite subfamily indexed by Fin n | Both systems cofinal; same colimit |
| §1.2 raw category not filtered | Constant index functions 0,1 from the one-point cover to the repeated cover; for any nonempty J′→{∗}, 0∘f≠1∘f | Check `:136` correct; README asserts filteredness only of the preorder |
| §1.2 two discrete points | Singleton cover: C⁰=A×B, ordered C¹=F(∅)=0; restriction to {a} is the projection A×B→A | Check `:137` correct |
| §1.2 empty space | Only cover: empty family; complex 0 regardless of P(∅) | Check `:138` correct |
| §1.2 S¹ two arcs | C⁰=ℤ², C¹=ℤ² (two components), d(a,b)=(b−a,b−a); H⁰=ℤ, H¹=ℤ²/Δ=ℤ; one-set cover H¹=0 | Correct; identical to ImplicitAtlases `:202` (R01) |
| §1.3 compact Hausdorff comparison | S¹: Čech¹=ℤ=H¹(S¹;ℤ); point: F(pt) in degree 0, 0 above, both sides; ∅: 0=0; R=0: 0=0 | Checks `:154`, `:157` correct; route is Stacks 16.2 verbatim for Mod(R_X) |
| §1.3 zero sheafification needs P(∅)=0 | {a,b}, P(∅)=ℤ, P(nonempty)=0: tuple C⁰=0, C¹=ℤ² (coordinates ab, ba), cocycle condition s_ab+s_ba=0 from the (a,b,a) tuple, so H¹=ℤ; ordered: C¹=P(∅)=ℤ, C²=0, H¹=ℤ; this cover is finest, so the colimit is ℤ; P^#=0 gives 0 | Check `:155` correct; hypothesis necessary |
| §1.3 local annihilation | P({a,b})=ℤ, else 0: P(∅)=0; stalks are colimits over the terminal neighbourhood {a}, {b}: 0; one-set cover H⁰=ℤ, singleton cover H⁰=0, colimit 0 | Check `:156` correct |
| §1.3 acyclic cover | S¹ one-set cover: H¹(S¹;ℤ)=ℤ≠0 violates the hypothesis and the cover gives Čech¹=0; two contractible arcs with disconnected intersection also violate it (H⁰ fine, but intersections are acyclic, so Stacks 11.6 applies and gives H¹=ℤ, matching) | Hypothesis stated correctly |
| §1.4 total convention | D=δ+(−1)^p d; from (0,0): δ then d contributes (−1)^1=−1, d then δ contributes +1, sum 0 when δd=dδ; unsigned total 2 | Check `:172` correct; agrees with Stacks `line 2126–2129` |
| §1.4 conjugation | ε=(−1)^{pq}: δ-component acquires (−1)^q, d-component acquires (−1)^p, giving d+(−1)^q δ; at (1,1): −1, at (0,1): +1 | Conventions `:21` correct |
| §1.4 two spectral sequences | Point, F=(ℤ→ℤ, ×2) in degrees 0,1: first: E₁ row ℤ→ℤ, E₂=(0,ℤ/2); second: ℋ⁰=0, ℋ¹=ℤ/2 at (0,1); hypercohomology H⁰=0, H¹=ℤ/2 | Check `:171` correct; E₁ form matches Pardon A.4.13, E₂ form matches Stacks 25.1 |
| §1.4 convergence bound | b=−1, m=1: (0,1),(1,0),(2,−1), length 3=m−b+1; m=−2<b: empty; no bound: (k,−k) infinitely many in degree 0 | Check `:173` and bound `:167` correct |
| §1.4 which page descends | Repeated point cover, F in degree 0: Čech-degree filtration E₁=cochains ℤ², maps (0,1)↦0 or 1; E₂=diagonal ℤ, both maps identity | Check `:174` correct; "from E₂" for that filtration, "from E₁" for the internal filtration |
| §1.4 cohomology presheaf at ∅ | F^q(∅)=0 for sheaves, so ℋ^q(∅)=0 and §1.3's presheaf comparison applies | Bullet `:165` correct |
| §2.1 `fiberStalkMap` direction | `eqToHom : stalk (f_*F) y ⟶ stalk (f_*F) (f x)` from y=f x, then `stalkPushforward : (f_*F).stalk (f x) ⟶ F.stalk x`; coordinate x of the product | Source and target as the README says |
| §2.1 two points to a point | Stalks ℤ, ℤ/2: (f_*F)_pt=F({a})×F({b})=ℤ×ℤ/2, product ℤ×ℤ/2, map identity, (3,1)↦(3,1); swapping coordinates violates the germ formula | Check `:198` correct |
| §2.1 empty source, identity | f:∅→Y: (f_*F)(V)=F(∅)=0, product over ∅ is 0; id on a point: id_M, M=0 included | Check `:199` correct |
| §2.1 properness needed | (0,1)→ℝ, F=ℤ: (j_*ℤ)_0=colim ℤ((0,ε))=ℤ, empty fiber product 0, ℤ→0 not iso | Check `:200` correct |
| §2.1 composition | {a,b,c}→{u,v}→pt: direct (2,3,5)↦(2,3,5); iterated ((2,3),5); reindexing identifies them | Check `:201` correct |
| §2.1 no averaging | 𝔽₂: identity on 𝔽₂²; S₃-type invariants do not enter | Check `:202` correct; distinct from ImplicitAtlases §0.9 quotient descent |
| §2.1 hypotheses | ℚ, f=id, y=0: F_0→F_0 identity; iso without local compactness; Hausdorff X used to separate fiber points; closedness from `IsProperMap` | R04 |
| Conventions `:17` universes | `R : Type u`, `X : TopCat.{u}`, `ModuleCat.{u} R`, `HasExt.{u}`: Lean agrees with the README | Correct |
| Downstream `:216` | CharacteristicClasses C1.2b consumes TS1.1–TS1.2: matches main `:449`; "invariant cohomology comparisons have their separate hypotheses in their owner's scope": ImplicitAtlases §0.9 with |Γ| invertible | Correct |

No false identity, sign or vacuous statement was found in the retained targets. The computations support the stated hypotheses (P(∅)=0, compactness for the all-cover comparison, properness for the stalk map, flatness for extension of scalars).

## Not verifiable

- Nothing cited was unreadable: both sources were fetched from open repositories (Stacks chapter PDF, arXiv v6).
- Ownership against open pull requests not provided as checkouts was checked only through `roadmaps grep`, not by reading their files.
- The proofs themselves (the R-linear transport of Stacks 20.16.2, the pagewise colimit construction of §1.4) are implementation work; their passing finite instances above do not establish them.

## Source issues

- **Misprint** in stacks-cohomology at Section 20.15 (tag 09UY), printed p.24: the source says the difference of the two refinement maps, first minus second, equals dh+hd; it should be second minus first, as the source's own computation in Section 20.25 (p.47) shows; affects nothing.
- **Misprint** in pardon at Lemma A.3.2, printed p.118: the source says the compact set K whose preimage neighbourhoods are considered lies in X; it should be a compact subset of Y; affects a stated result.
- **Misprint** in pardon at Remark A.4.1, printed p.119: the source indexes the containing member of the coarser cover by f applied to an index of the coarser cover; it should apply f to the index of the refining cover; affects a stated result.
