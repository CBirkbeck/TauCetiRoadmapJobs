# Review of ToposTheoreticBridges (pull request #2337 at 1c43589)

**Verdict:** needs changes

## R01 (P3) — Update the pull-request description

**Location:** Pull-request description: “This description is written for the head `f1fdd745`”; “GrothendieckTopoi 4.1, 4.2 (Layer 3)”.
**Claim:** Previous R06 remains: the description omits the §6.5 supplier, the Boolean/De Morgan acceptance statements, native Ore predicate, and the characterizations of site and quotient transport.
**Witness:** `TauCetiRoadmap/ToposTheoreticBridges/README.md:115` imports §6.5; `TauCetiRoadmap/ToposTheoreticBridges/Suggested.lean:54`, 74, 79, 89 state both presheaf criteria, native Ore invariance, and transport determined by the chosen equivalence; README:411 defines semantic quotient classes.
**Repair:** Delete the obsolete head sentence. Replace the supplier paragraph with: “Suppliers: Mathlib, GrothendieckTopoi §§4.1–4.2, 6.5 and ClassifyingTopoi §§1.1, 1.3–1.4, 2.1, 2.4–2.6. Lean states the Karoubi criterion, both presheaf criteria and their Morita invariance using Mathlib's Ore predicate, and characterizes finer-topology transport for a chosen equivalence. Layer 4 transports semantic equivalence classes of quotients; its carriers are unavailable at the pins.”

## Previous findings

- R01 — repaired: README:353–360 imports GrothendieckTopoi §4.2's correspondence and retains only the order characterization and transport as targets.
- R02 — repaired: README:87 names `CategoryTheory.IsIdempotentComplete`, in `Mathlib.CategoryTheory.Idempotents.Basic`.
- R03 — repaired: README:310 and 346 explicitly record §2.2's use of §2.1's subobject order isomorphisms.
- R04 — repaired: README:149–151 cites Lindner 1974, §0, p. 377, applied to opposite categories; the reference appears at 517.
- R05 — repaired: README:153–159, 249–253 and 298–299 give the definition APIs as explicit bullet lists.
- R06 — not repaired: the description still names head `f1fdd745` and restricts GrothendieckTopoi's listed supply to §§4.1–4.2; carried as R01 above.

## Verified sound

| Statement | Instances tried | Left-side value | Right-side value | Result / change |
|---|---|---|---|---|
| §1.1 definition | One versus two discrete points | Terminal type has no decomposition into two nonempty summands | Terminal pair is `(1,0) ⊔ (0,1)` | Morita equivalence false |
| §1.1 reflexivity | Empty category | Presheaf category has one isomorphism class and one arrow between any two objects | Identity fixes that class and arrow | True |
| §1.1 symmetry | Point and duplicated point | Both presheaf categories equivalent to types | Inverse equivalence recovers the same type | True in both directions |
| §1.1 transitivity | One, two and three mutually isomorphic points | Successive equivalences send a type `X` to constant diagrams on `X` | Composite again sends `X` to that constant diagram | True |
| §1.1 equivalence implies Morita | Arrow category, identity equivalence | Presheaf is a map `X₁ → X₀` | Opposite equivalence and precomposition retain `X₁ → X₀` | Variance matches |
| §1.2 idempotent-completeness input | Constant map `p:{a,b}→{a,b}`, value `a` | `p²=p`; fixed-point set `{a}` | Retraction/inclusion give `id_{ {a} }` and `p` | Correct pinned class |
| §2.1 subobject transport API | Swap `a,b` | `∅⊆{a}⊆{a,b}` | `∅⊆{b}⊆{a,b}` | Order and inverse preserved |
| §2.1 Boolean transport API | Swap `a,b` | Complement pair `{a},{b}`; meet `∅`, join `{a,b}` | Pair `{b},{a}`; same meet and join | Complements preserved |
| §2.1 criterion and Morita invariance | Monoid `{1,e}` and its split completion | Groupoid false; constant-idempotent action has no complement of `{a}` | Completion still has a noninvertible arrow; corresponding action still has no complement | Boolean false on both |
| §2.2 De Morgan transport API | Swap `a,b`, `A={a}` | `¬A={b}`, `¬¬A={a}`, join `{a,b}` | Images `{a},{b}`, join `{a,b}` | §2.1 supplies the order transport |
| §2.2 criterion and Ore invariance | Walking cospan and its Karoubi envelope | No common predecessor; Ore false | `¬{inl}={inr}`, double negation `{inl}`; union omits identity in both categories | De Morgan false on both |
| §3.1 imported correspondence | One-point site, `J=⊥` | Finer topologies `⊥,⊤` | Subtopoi: all types, singleton types | Two objects on each side; supplier owns correspondence |
| §3.1 order characterization | One-point site, `J₁=⊥,J₂=⊤` | `⊥≤⊤` true; converse false | Singletons are types; two-element type is not singleton | Both directions discriminate |
| §3.1 subtopos transport | Two discrete points, coordinate swap | Subtopos `X₀≃1` | Subtopos `X₁≃1`; inverse swap restores `X₀≃1` | Inclusion preserved |
| §3.1 characterized topology transport | Two discrete points, identity and swap | Four topologies; `J₀` forces `X₀≃1` | Identity sends `J₀→J₀`; swap sends `J₀→J₁` | Chosen equivalence determines transport |
| §3.1 endpoint transport | Empty site and one-point maximal site | Finer-topology interval has one element | Finer-topology interval has one element | Unique order isomorphism |
| §4.1 semantic classes and order | Exactly-one-element theory; tautological and contradictory quotients | Base and tautological quotient have same models; contradictory quotient has no model in sets | First two map to `⊥`; contradictory class maps to `⊤` | Two classes, two topologies |
| §4.1 chosen-equivalence transport | Exchange nullary `P,Q`; model `P=true,Q=false` | Added `P` holds; added `Q` fails | Swapped model satisfies `Q` and fails `P`; `ψ[P]=[Q]` | Described quotient transport depends on equivalence |

The remaining adversarial rows stand as in the previous review of `1a80045`.

- Sources: five relevant external locators checked in three works: Lindner1974 line 38; Caramello2009DeMorgan lines 204 and 223; Caramello2017Lattices lines 483 and 1273.
- Pinned API: seven declarations opened at `Mathlib/CategoryTheory/Idempotents/Basic.lean:54`, 64; `Mathlib/CategoryTheory/Equivalence.lean:405`; `Mathlib/CategoryTheory/Opposites.lean:777`; `Mathlib/CategoryTheory/Sites/SheafOfTypes.lean:84`; `Mathlib/CategoryTheory/Sites/Closed.lean:172`, 244.
- Citations: 16 numbered supplier/ownership sections and GrothendieckTopoi Convention 6 resolved; the three scanner leads are ClassifyingTopoi declarations.
- Gate: worker and independent scanners pass; targeted build succeeds; direct elaboration has only six `sorry` warnings. Build also emits Mathlib's module-system advisory.
- Dependency output: `depcheck: 245 roadmaps, 2206 edges, 0 problem(s)`.
- Signatures: nine `#check @name` types compared with README; no lost hypotheses or changed declarations. Previous six one-tactic padding probes stand. Zero changes outside the folder; review worktree clean.
- Overlap check: read ClassifyingTopoi, GrothendieckTopoi, TotallyDistributiveTopoi, HomotopyTheoryOfCategories, LocallyPresentableCategories; GrothendieckTopoi owns subtopoi/site correspondence and retract representation; ClassifyingTopoi owns geometric models/classifiers; no duplicated ownership in the changed passages.
- Source independence: changed passages only; six changed prose blocks compared with three sources (Lindner1974, pinned Mathlib and GrothendieckTopoi), with no borrowed expression or reused material. Largest external locator share: Caramello2017Lattices, 4 of 11. No layer added, removed or reordered; the previous independent-arrangement check stands.

## Not verifiable

- none

## Source issues

- **Misprint** in Mathlib at `CategoryTheory/Sites/Closed.lean:241`, docstring of `le_topology_of_closedSieves_isSheaf` (unpaginated): the source says J₁-closed sieves being J₂-sheaves imply J₁ ≤ J₂; it should be J₂-closed sieves being J₁-sheaves, as the declaration states; affects nothing.

## For the human reviewers

- none
