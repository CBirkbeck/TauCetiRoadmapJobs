# Review of ToposTheoreticBridges (pull request #2337 at 1a80045)

**Verdict:** needs changes

## R01 (P2) — §3.1 assigns a supplier's correspondence a second target

**Location:** `TauCetiRoadmap/ToposTheoreticBridges/README.md:335`, “Prove, as its reading on a site and its invariance”, followed by the first bullet at line 338.
**Claim:** That bullet targets the correspondence between subtopoi and finer topologies already assigned to GrothendieckTopoi §4.2 by the scope and supplier contracts.
**Witness:** Pull request #1520, `TauCetiRoadmap/GrothendieckTopoi/README.md:685`, targets the same correspondence. For the one-object trivial site both statements identify its two topologies with all types and singleton types.
**Repair:** Delete the first proof target from §3.1; use the correspondence imported in the supplier contract. Retain the order characterization and equivalence transport. Replace references to the “first item”, “second item” and “first two items” with “supplied correspondence”, “order characterization” and their conjunction, respectively.

## R02 (P3) — Correct the fully qualified idempotent-completeness name

**Location:** `TauCetiRoadmap/ToposTheoreticBridges/README.md:87`, “`CategoryTheory.Idempotents.IsIdempotentComplete C`”.
**Claim:** This fully qualified identifier does not exist at the pin; the class belongs directly to `CategoryTheory`.
**Witness:** `#check @CategoryTheory.Idempotents.IsIdempotentComplete` reports an unknown identifier; `#check @CategoryTheory.IsIdempotentComplete` succeeds. The class is declared in `Mathlib/CategoryTheory/Idempotents/Basic.lean:54`.
**Repair:** Replace it with `CategoryTheory.IsIdempotentComplete C`, and cite `Mathlib/CategoryTheory/Idempotents/Basic.lean:54`.

## R03 (P3) — Record the dependency that §2.2 takes from §2.1

**Location:** `TauCetiRoadmap/ToposTheoreticBridges/README.md:329`, “Within the layer, 2.1 and 2.2 are independent.”
**Claim:** The stated De Morgan invariance route explicitly consumes §2.1's subobject order isomorphisms, but §2.2's Needs line omits §2.1.
**Witness:** `TauCetiRoadmap/ToposTheoreticBridges/README.md:282`: “by the order isomorphisms of subobjects of 2.1”. Under a bijection exchanging two elements, complements and double complements are transported by precisely those order isomorphisms.
**Repair:** Add “2.1, subobject order isomorphisms” to §2.2's Needs. Replace line 329 with “The presheaf criteria are independent; the equivalence-invariance API of 2.2 uses the subobject order isomorphisms of 2.1.”

## R04 (P3) — Supply the missing locator for §1.1

**Location:** `TauCetiRoadmap/ToposTheoreticBridges/README.md:147`, “Define `MoritaEquivalentCat C D`”.
**Claim:** This sampled target has no source locator for the definition; the paragraph ends with an unlocated API sentence.
**Witness:** Lines 147–151 contain no source citation. Lindner1974 line 38, §0, printed p. 377, treats the nonadditive Morita problem as equivalence of set-valued functor categories on small categories.
**Repair:** Append “(Lindner 1974, §0, p. 377, applied to `Cᵒᵖ` and `Dᵒᵖ`)” to the definition and add the reference: H. Lindner, “Morita equivalences of enriched categories”, *Cahiers Topologie Géom. Différentielle* 15 (1974), 377–397.

## R05 (P3) — Give the definitions their required API lists

**Location:** `TauCetiRoadmap/ToposTheoreticBridges/README.md:149`, “Prove that it is reflexive, symmetric and transitive”; also the API paragraphs at lines 237 and 282.
**Claim:** The definition APIs in §§1.1, 2.1 and 2.2 are prose paragraphs rather than the required explicit bullet lists.
**Witness:** §1.1 contains four API claims in one sentence; §§2.1 and 2.2 contain their equivalence-invariance API only in paragraphs. Their Checks are already separate lists.
**Repair:** List reflexivity, symmetry, transitivity and implication from categorical equivalence as four prose API bullets in §1.1; put each invariant's equivalence-transport claim in an API bullet in §§2.1–2.2. Keep the existing Checks and Lean declarations.

## R06 (P3) — Update the description for the repaired head

**Location:** Pull-request description, “This description is written for the head `f1fdd745`”; supplier paragraph, “GrothendieckTopoi 4.1, 4.2 (Layer 3)”.
**Claim:** The description omits the new §6.5 supplier dependency, the replacement Ore declaration, the new Boolean/De Morgan acceptance statements, and the strengthened site and quotient transports.
**Witness:** `TauCetiRoadmap/ToposTheoreticBridges/README.md:184` adds GrothendieckTopoi §6.5; `Suggested.lean:48`, `:66`, `:79`, `:89` add invariants, use native Ore, and characterize transport by the chosen equivalence.
**Repair:** Replace the obsolete head sentence and scope/supplier summary with: “This new roadmap uses GrothendieckTopoi §§4.1–4.2, 6.5 and ClassifyingTopoi §§1.1, 1.3–1.4, 2.1, 2.4–2.6. Lean states both presheaf criteria, uses Mathlib's Ore predicate, and characterizes finer-topology transport for a chosen equivalence; quotient transport is on semantic equivalence classes.”

## Verified sound

| Previous finding | Head passage | Disposition |
|---|---|---|
| R01 | README 93: “`GrothendieckTopology.RightOreCondition C`” | Repaired; duplicate predicate deleted. |
| R02 | README 182: “these form `Karoubi C` (GrothendieckTopoi 6.5)” | Repaired; supplier and Needs added. |
| R03 | README 226, 271: “Prove `isBooleanTopos_presheaf_iff_isGroupoid`”; “`isDeMorganTopos_presheaf_iff_rightOreCondition`” | Repaired; both readings are targets. |
| R04 | README 352: “`Presheaf.IsSheaf J' F.obj ↔ …`”; 423: “This property determines `ψ`” | Repaired; chosen equivalences determine transport. |
| R05 | README 395: “same models in every topos”; 405: “an order isomorphism” | Repaired; quotient classes, uniqueness and order targeted. |
| R06 | README 341: “`J₁ ≤ J₂` if and only if”; 344: “induces an order isomorphism” | Repaired; missing mathematical inputs targeted. |
| R07 | README 175: “`Type u` is idempotent complete”; 177: “`(Karoubi C)ᵒᵖ ≌ Karoubi Cᵒᵖ`” | Repaired; both inputs explicit. |
| R08 | README 447: “functors from finite sets to sets” | Repaired; variance matches supplier. |
| R09 | README 172: “p. 134, proof p. 135, and Proposition 2, p. 135” | Repaired; printed pages verified. |
| R10 | README 428: “if `MoritaEquivalent T T'`”; Lean 19: “Not stated” | Repaired; undeclared name deleted. |
| R11 | README 33: “No other roadmap owns”; 470: “None.” | Repaired; dated process wording deleted. |
| R12 | README 476: “§6, pp. 16–17”; 477: “§8, p. 29” | Repaired; both locators verified; implementation claim deleted. |
| R13 | README 63, 158, 192: “`Discrete (ULift.{u} (Fin 2))`” | Repaired; universe lift present. |

| Statement | Instances tried | Left-side value | Right-side value | Result / change |
|---|---|---|---|---|
| §1.1 definition; size convention | One-point versus two-point discrete categories | Terminal singleton has no decomposition into two nonzero summands | Terminal pair decomposes as `(1,0) ⊔ (0,1)` | Not Morita equivalent; R04–R05 |
| §1.1 equivalence-relation API | Empty category; duplicated point | Presheaves: terminal category; types | Identity, inverse and composite equivalences exist; duplicated point also gives types | Reflexive, symmetric, transitive; categorical equivalence implies Morita |
| §1.1 retract Check | Monoid `{1,e}`; its freely split idempotent | One object; presheaves are idempotent maps | Two isomorphism classes; presheaves give the same maps with their images | Morita true; categorical equivalence false |
| §1.2 Karoubi criterion | Empty category; `{1,e}` versus its Karoubi envelope | Presheaf equivalence true in both cases | Empty completions; two-object completions with Hom cardinalities `2,1,1,1` | Both iff directions agree |
| §1.2 negative control | One-point versus two-point discrete categories | Presheaf equivalence false | Completions unchanged, with one versus two isomorphism classes | Both sides false |
| §1.2 idempotent completeness API | `p : {a,b} → {a,b}` constant at `a` | `p²=p`; equalizer of identity and `p` is `{a}` | Inclusion and constant retraction compose to identity and `p` | Splitting exists; R02 concerns the name |
| §1.2 opposite API | `{1,e}`; arrow category | Opposite completion: Hom cardinalities transpose | Completing the opposite gives the same transposed matrix; `(p²).op=p.op` | Objects and idempotents both reversed |
| Layer 1 group example | `S₃`, `C₆`, trivial group | Presheaf equivalence for `S₃,C₆`: false; trivial self-pair: true | Karoubi envelopes unchanged; automorphism groups nonisomorphic, respectively identical | Criterion detects nonabelian structure |
| §2.1 Boolean definition and criterion | Empty category; point; `{1,e}` | Boolean: true, true, false | Groupoid: true, true, false | In the last case `{a}` has no stable complement |
| §2.1 converse proof | Arrow `0→1`; representable at `1` | Generated sieve is `{0→1}`; complementary singleton identity is not stable | Arrow has no inverse | Non-Boolean matches non-groupoid |
| §2.1 equivalence API | Swap of `{a,b}` | Complement of `{a}` is `{b}` | Images are `{b}`, `{a}`, still complementary | Order transport preserves complements; R05 |
| §2.1 groupoid invariance headline | `C₃` and duplicated-object groupoid; `{1,e}` and its completion | Groupoid values: true; false | Groupoid values: true; false | Morita-invariance agrees |
| §2.2 De Morgan definition | Constant idempotent on `X={a,b}`, `A={a}` | `¬A=∅`, `¬¬A=X` | `¬A∪¬¬A=X`; `A∪¬A={a}` | De Morgan true, Boolean false |
| §2.2 presheaf/Ore headline | Walking cospan, representable at apex | `¬{inl}={inr}`; double negation `{inl}`; union omits identity | No object maps to both feet | Both sides false |
| Ore direction conventions | Walking span; walking cospan | Common predecessors: present; absent | De Morgan presheaves: true; false | Reversing the Ore square exchanges answers |
| §2.2 poset Check | `a,b<c`; add a least element `0` | Common lower bound for `a,b`: absent; `0` | Ore: false; true | Terminal object alone does not suffice |
| §2.2 monoid/group Checks | `ℕ`; free monoid; `S₃` | `2+3=3+2=5`; differently ending words unequal; `h≫f=(12)` | Ore true; false; `k≫g=(12)` for `h=1,k=f≫g⁻¹` | Includes noncommutative control |
| §2.2 equivalence API | Swap of two elements, `A={a}` | `¬A={b}`, `¬¬A={a}`, join `X` | Transport gives `{a},{b},X` | Preserved by §2.1's order isomorphism; R03, R05 |
| §2.2 Ore-invariance headline | `{1,e}`; walking cospan; respective completions | Ore true; false | Ore true; false | Completion preserves/reflects the required squares |
| Layer 2 Sierpiński example | Ordered `Fin 2` | Common lower bound is minimum; nonidentity arrow noninvertible | De Morgan true; Boolean false | Both readings agree |
| §3.1 supplied subtopos correspondence | One-point site, `J=⊥` | Finer topologies: `⊥,⊤` | Subtopoi: all types, singleton types | Two on each side; R01 |
| §3.1 order characterization | One-point site, `J₁=⊥,J₂=⊤` | `⊥≤⊤`: true; reverse: false | Singletons are types; `Bool` is not singleton | Order reverses sheaf inclusion |
| §3.1 subtopos transport | Two discrete points; coordinate swap | Subtopos `X₀≃1` | Image subtopos `X₁≃1` | Inclusion preserved; inverse swap restores it |
| §3.1 finer-topology headline | Two discrete points; identity and swap | Four topologies; `J₀` forces `X₀≃1` | Identity fixes `J₀`; swap sends it to `J₁` | Characterization distinguishes the equivalences |
| §3.1 degenerate endpoints | Empty site versus one-point site with `⊤` | Finer-topology interval has one element | Finer-topology interval has one element | Unique transport; both sheaf topoi terminal |
| Layer 3 completion example | `{1,e}` versus its completion | Three topologies: trivial, nonempty-sieve, maximal | Same three topologies transported through presheaves | Lattices agree |
| Layer 3 basis example | Discrete two-point space; singleton basis | Opens: four objects, sheaves determined by `(X₀,X₁)` | Basis: two objects, same pairs; finer topologies: four | Comparison produces matching lattices |
| §4.1 quotient classes/order | Empty theory; add `⊤⊢⊤`; add contradiction | First two have all models; contradiction only in degenerate topoi | First two map to `J`; contradiction maps to `⊤` | Classes remove preorder ambiguity |
| §4.1(a) quotient/topology headline | Theory of exactly one element | Two semantic quotient classes: consistent, contradictory | Classifier `Type u` has two subtopoi/topologies | Bijective and order-preserving |
| §4.1(a) generic-model proof | `T₁=T`; contradictory `T₂` | Identity factors through identity; nondegenerate identity cannot factor through degenerate reflector | `J≤J` true; `⊤≤J` false for nondegenerate `J` | Factorization detects inclusion in the right direction |
| §4.1(b) chosen-equivalence headline | Swap nullary `P,Q`; model `P=true,Q=false` | Model satisfies added `P`, fails added `Q` | Swapped model fails `P`, satisfies `Q`; `ψ[P]=[Q]` | Transport depends on the equivalence |
| §4.1(b) identity Check | Object theory; add an always-true nullary symbol | Subsingleton quotient models: empty or singleton objects | Same carriers with true symbol; identical subsingletons | Identity transport matches the quotients |
| §4.1(c) Morita quotient headline | Object theory versus subsingleton theory | Points indexed by all sets up to isomorphism | Two point classes: empty and singleton | Not Morita equivalent; implication does not apply |
| Layer 4 ring example | `ℤ/4`; zero ring | Local-ring axioms: true; false | Zariski interpretation: local point; empty cover excludes zero-ring point | Matches ClassifyingTopoi §4.3 |
| Lean headline coverage/padding | Six admitted headline theorems | Six statements elaborated; all nine declaration binders retained | Zero closed by `simp`, `rfl`, `infer_instance`, or `exact?` | No padding or lost binder; unavailable carriers named in docstring |

- Sources: all six seeded sections examined; 10 external locator occurrences checked across four cited works; §1.1 lacks its locator (R04), supplied by the additionally checked Lindner1974 §0.
- Pinned declarations opened: `IsIdempotentComplete` and its equalizer criterion (`Mathlib/CategoryTheory/Idempotents/Basic.lean:54`, 64), `Karoubi` (`Idempotents/Karoubi.lean:43`), `karoubiUniversal` (`Idempotents/FunctorExtension.lean:224`), `Equivalence.congrLeft` (`Equivalence.lean:405`), `RightOreCondition` (`Sites/Grothendieck.lean:394`), `Subobject` lattice instances (`Subobject/Lattice.lean:557`, 562), `Sieve.functor` (`Sites/Sieves/Presheaf.lean:48`), `isSheaf_of_le` (`Sites/SheafOfTypes.lean:84`), `classifier_isSheaf` and `le_topology_of_closedSieves_isSheaf` (`Sites/Closed.lean:172`, 244); no existing headline theorem found.
- Supplier citations: 16 numbered sections plus GrothendieckTopoi Convention 6 resolved at the supplied open heads; three unresolved-name scanner leads are declarations of ClassifyingTopoi, not missing prerequisites.
- Gate: every worker check passed; independent elaboration produced six `sorry` warnings only; dependency output: `depcheck: 244 roadmaps, 2197 edges, 0 problem(s)`.
- Lean checks: nine `#check @name` signatures compared with README, no binders lost; six one-tactic probes retained `sorry`; no edits outside the folder in the PR, and review left the worktree clean.
- Overlap check: read ClassifyingTopoi, GrothendieckTopoi, TotallyDistributiveTopoi, HomotopyTheoryOfCategories, LocallyPresentableCategories; subtopoi/site correspondence and retract representation belong to GrothendieckTopoi §§4.1–4.2, 6.5; geometric models/classifiers belong to ClassifyingTopoi; the other three share no owned target. R01 duplicates the correspondence.
- Source independence: 15 passages compared with five sources, no borrowed expression found; largest share Caramello2017Lattices, 4 of 10 external locator occurrences; its contents compared: independent. Layer 4 needs Layer 3; no source chapter sequence supplies the four layers.

## Not verifiable

- none

## Source issues

- **Misprint** in Caramello2017Lattices at §5.2, item (iii), printed p. 37 (line 1300): the source says the meet consists of sequents provable in both T and T′; it should be sequents provable in both T′ and T″; affects nothing.
- **Misprint** in Caramello2017Lattices at §5.2, item (v), printed p. 37 (line 1306): the source says implication tests sequents common to S and T for provability in T′; it should be common to S and T′ for provability in T″; affects nothing.
- **Misprint** in Mathlib at `CategoryTheory/Sites/Grothendieck.lean:389`, docstring of `RightOreCondition` (unpaginated): the source says spans are completed to squares; it should be cospans, as the declaration states; affects nothing.
- **Misprint** in Mathlib at `CategoryTheory/Sites/Closed.lean:241`, docstring of `le_topology_of_closedSieves_isSheaf` (unpaginated): the source says J₁-closed sieves being J₂-sheaves imply J₁ ≤ J₂; it should be J₂-closed sieves being J₁-sheaves, as the declaration states; affects nothing.

## For the human reviewers

- none
