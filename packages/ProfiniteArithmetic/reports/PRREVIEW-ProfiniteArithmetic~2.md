# Review of ProfiniteArithmetic (pull request #775 at a0a63ba)

**Verdict:** rejected

## R01 (P1) — The active folder duplicates the completed roadmap

**Location:** `TauCetiRoadmap/ProfiniteArithmetic/README.md:36`, “The roadmap owns”, and `TauCetiRoadmap/ProfiniteArithmetic/Suggested.lean:76`, `namespace TauCetiRoadmap.ProfiniteArithmetic`.

**Claim:** This active folder owns the four layers and the compatible-family extension in §2.4.

**Witness:** Main has `Completed/ProfiniteArithmetic/README.md:547–566`, including the same cofinal index and compatible-family comparison. `TauCetiRoadmap/PeripheralActions/Suggested.lean:2` imports the completed certificate. The two certificates share 95 fully qualified declaration names, including `TauCetiRoadmap.ProfiniteArithmetic.padicPow`.

The supplied main checkout is `f52d972aae46c91bb4facc83b3e2d99cd80afff4`. Its active ProfiniteArithmetic folder is absent; the archived folder is present. This is the unresolved previous R01. Removing the three admitted auxiliary targets does not resolve ownership. The archive already requires reconstruction over characteristic open normal subgroups below the Frattini subgroup, without pretending that arbitrary elements of full finite kernels descend.

**Exact repair:** Do not submit a second active ProfiniteArithmetic folder. Carry any actual correction into the existing completed roadmap, preserving its single namespace owner and existing consumers. Put genuinely new scope in a Part II that imports the completed roadmap by section. Tested against the witness: the archived §2.4 already contains the proposed comparison, and the existing consumer already selects that archive. This cannot be repaired within the two active-folder files under review, hence rejection rather than a request to re-plan them.

## R02 (P2) — Two retained headline conclusions are missing from the acceptance test

**Location:** `TauCetiRoadmap/ProfiniteArithmetic/README.md:516`, “The compatible-family description of `H`”, and `:546`, “The free case”; `TauCetiRoadmap/ProfiniteArithmetic/Suggested.lean:44–54,696–713`.

**Claim:** The README requires the exact image description of the Frattini kernel and surjectivity from automorphisms of a finite-rank free pro-p group onto automorphisms of its Frattini quotient. The module docstring presents its list as the statable headline theorems.

**Witness:** `isProP_ker_toFrattiniQuotient` concludes only pro-p-ness and openness. Neither the compatible-family equality nor the free-group surjectivity is a Lean conclusion. Both complete statements elaborate in a scratch copy, with only their two `sorry` warnings.

The compatibility assertion needs no missing carrier: use the subtype of `OpenNormalSubgroup G` with characteristicity and containment in `TauCeti.proPFrattini p G`, its dependent product of `MulAut` groups, the finite kernels, and `TauCeti.QuotientGroup.mapOfLE`. The surjectivity result is additionally already proved by `TauCeti.freeProP.mapQuotient_proPFrattini_surjective`, `TauCeti/Topology/Algebra/Group/Profinite/Free/Automorphism.lean:213` at the pin. A docstring on a different theorem does not state either conclusion.

**Exact repair:** In any acceptance test retained after R01 is resolved, state the actual compatible-family image equality on these carriers. For free-group surjectivity, either retain its headline signature or remove the implementation target and cite the pinned theorem in the ownership/supplier section. Do not restore the deleted cofinality and quotient-Frattini auxiliary targets as substitutes. The scratch signatures cover rank zero; for `G = ℤ₂`, multiplication by 3 gives compatible coordinates, while multiplication by 3 modulo 8 paired with identity modulo 4 fails the required square (`3 ≠ 1` modulo 4).

## R03 (P3) — The Lean file remains an API catalogue

**Location:** `TauCetiRoadmap/ProfiniteArithmetic/Suggested.lean:103–1004`, especially `:302`, `:449`, `:739`, and `:965`; “The pin on the generator” at `:294`.

**Claim:** The 1,008-line file is a headline acceptance test.

**Witness:** It contains 104 proved theorems, 27 abbreviations, one definition and one instance. `zpowHat_zero` is a single pinned theorem; `ContinuousAut.mul_apply` is `rfl`. The longer series-recursion and Heisenberg-detection proofs also close with one pinned theorem each.

The tested replacements are `exact TauCeti.closedLowerCentralSeries_succ G n` and `exact TauCeti.freeProP.exists_heisenberg_detect hij`. Numerous further computation rules and API wrappers already display their one-term proofs. There are no admitted theorems to probe in this head. Replacing the previous two duplicate conjugacy proofs by calls to Tau Ceti fixes their proofs, but leaves the duplicate declarations. The seven headline results named in the docstring are distinguished from this padding; the issue is not that those deep mathematical results have acquired library proofs.

**Exact repair:** Delete the API wrappers, boundary cases, computation rules and unnecessary aliases from `Suggested.lean`; keep the README mathematics and cite the actual library declarations. Keep only the headline statements and definitions genuinely needed to state them, in the acceptance-test form prescribed by the brief. In particular, delete `zpowHat_zero`, `ContinuousAut.mul_apply`, the duplicate recursion statement and `exists_heisenberg_detect` from `Suggested.lean`; do not “repair” padding by proving it in place. Both nontrivial-looking examples were tested successfully with a single library theorem.

## R04 (P3) — Definitions lack the required discriminating Checks and layer structure

**Location:** `TauCetiRoadmap/ProfiniteArithmetic/README.md:274`, “Idempotents”, `:420`, “Topologically characteristic subgroups”, and `:607`, “The graded Lie ring”.

**Claim:** The definitions are specified with sufficient API and test examples to distinguish their intended objects and conventions.

**Witness:** There are no `**Checks.**` lists, and no layer-ending `### Examples` or `### Dependencies` sections. Only the ring and powering sections have full API checklists. Five global worked-example bullets do not supply three discriminating Checks for each definition.

**Exact repair:** If prose survives R01, give every retained definition its API and at least three computed, discriminating Checks; collect each layer's examples and dependencies under the required headings, and add the opening Summary and downstream-consumer section. For the idempotent, usable checks are `ω₂ mod 4 = 1`, `ω₂ mod 3 = 0`, and `ω₂ mod 6 = 3`. They distinguish it from 0, 1 and the 3-idempotent. For the bracket, use the Heisenberg values `[A,B] = (0,0,1)`, `[B,A] = (0,0,−1)`, and `[A,A] = 0`, retaining the negative sign over ℤ₂. These values were recomputed below.

## R05 (P3) — References do not supply exact claim-level locators

**Location:** `TauCetiRoadmap/ProfiniteArithmetic/README.md:696–700,784–802`; the Labute reference ends at “Invent. Math. 4 (1967)”, and Lazard is identified only by work and year.

**Claim:** These references support the graded Lie construction, spanning results and free pro-p degree computations at verifiable locators.

**Witness:** No theorem or page is given for Labute; no section, theorem or page is given for Lazard. Lazard's actual graded-Lie statement is Chapter I §2, Theorem (2.1), printed p.110 (`lazard1954 line 387`).

**Exact repair:** Attach a precise locator to each retained theorem, or cite the exact pinned declaration implementing it. For the N-series graded Lie ring, cite Lazard I §2, Theorem (2.1), pp.109–110, and explain `H_i = γ_(i−1)`; its abstract construction does not itself establish profinite continuity, ℤ_p-linearity or the finite-sum spanning theorem. Use the pinned `TauCeti.exists_sum_gradedBracket_eq_of_range` for the latter. Add theorem/page locators for the remaining book and paper citations and record their access status in the source manifest when maintaining the owning roadmap. Do not invent a page for a text that could not be read. The reindexing was tested on `[gr₀,gr₀] ⊆ gr₁` and the Heisenberg commutator.

## Verified sound

This is an independent AI review of the two named files. The findings concern ownership, omitted acceptance statements and specification form; the computed mathematical instances below did not refute the retained identities. No pull-request file was changed, no network write was made, and no dependency pin was changed.

**Previous findings, checked first against this head:**

| Previous finding | Status | Passage/evidence at this head |
|---|---|---|
| R01 archive conflict | Not repaired | README:36 still says “The roadmap owns”; Suggested:76 retains the same namespace. Main's archive and its consumer still exist; current R01. |
| R02 forbidden options | Repaired | Suggested:86 uses `Additive (TauCeti.zHat : Type)`; the affected statements use `omit [IsTopologicalGroup G] in`. Zero `set_option` commands; direct elaboration succeeds. |
| R03 four-step reconstruction re-planning | Repaired as requested locally; archive overlap remains | README:510 labels “The pro-`p` theorem (Tau Ceti)”; :516 gives one image-comparison target; :526 says “Proof sketch.” The three admitted auxiliaries are gone. Current R02 asks for the actual retained comparison, not those auxiliary declarations. |
| R04 false description of existing APIs / reflexive lift comparison | Partly repaired | README:309 says the roadmap “uses both as they are”; `lift_eq_tauCeti` and the old changes subsection are gone. README:16 still says it “extends its lifting property”, and :720 still calls this a “generalization”. The pin already has the arbitrary-universe lift. Ownership prose must be reconciled under R01. |
| R05 API catalogue / duplicate conjugacy proofs | Partly repaired | Suggested:572 and :580 now call `TauCeti.isClosed_isConj_pair` and `TauCeti.ContinuousAut.isClosed_isConj`. The aliases and API wrappers remain; current R03. |
| R06 unqualified supplier names | Repaired | README:146 gives `TauCeti.ProfiniteCompletion.continuousMonoidHomEquiv_symm_apply_etaFn`; :529 gives `TauCeti.ContinuousAut.exists_mapQuotient_eq`; :664 gives `TauCeti.isProP_multiplicative_padicInt`. Gate `readme-ids-missing=0`. |
| R07 vocabulary, mandatory route, unused auxiliary hypotheses | Repaired for the cited passages | “Native” terminology and the four mandatory construction steps are gone. README:526 calls the route a proof sketch. Deleting the auxiliary declarations also removes their unused hypotheses. |

No repair report marking a finding “not actionable in this package” was present among the supplied previous-review files or this package's reports. None of these assessments relies on the PR description's validation claims.

**Gate, build and dependency direction.** The worker's gate at the exact head reports every scanner and the targeted module build passing: `set_option=0`, `sorry-data=0`, `readme-ids-missing=0`, `stray-files=0`, `outside-folder=0`, `depcheck=0`, `build=0`, overall `OK`. The independently run dependency check returned exactly:

```text
depcheck: 159 roadmaps, 1105 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. Every `*Needs:*` line was read. Cross-roadmap mentions of BelyiMaps, PeripheralActions and LocalFieldsRamification describe consumers, not suppliers. Foundations are consumed from the pinned Tau Ceti implementation of ProfiniteProPGroups. No declared gap was supplied. The diff against the merge base outside this roadmap folder is empty; the worktree remained clean. The passing gate does not detect the archived-owner conflict.

`lake env lean` on the original absolute filename, run from the PR worktree, exited 0 with no diagnostics. No missing-import build was needed. The signature probe printed all **133** declarations with `#check @name` and exited 0. Its initially generated spurious check of the word `makes` (parsed from a comment) was removed in scratch only. The resulting types retain primality and the profinite stack on powers, finite generation on automorphism compactness/evaluation, compactness on the finite spanning theorem, and `hG` on pro-p statements. The quotient and characteristicity aliases legitimately do not require the section's `IsTopologicalGroup` binder; `closedZpowers` needs topology, not ambient compactness. No harmful dropped binder was found, and no PR signature was changed. The two missing-headline signatures elaborate with only two `sorry` warnings. The one-tactic padding probe elaborates after passing the explicit `G` argument required by the pinned recursion theorem.

**Headline inventory.** Seven named mathematical headlines are stated: topological-ring product decomposition; profiniteness of the continuous automorphism group; the finite Frattini-kernel theorem; the open pro-p Frattini-kernel theorem; finite-sum spanning; and the free pro-p degree-zero and degree-one bases. Each uses the intended carriers and hypotheses. The README additionally retains exact compatible-family reconstruction and free Frattini-quotient surjectivity as deep §2.4 conclusions; these are missing (R02). The direct-sum Lie ring/Lie algebra, unit-group product comparison, topological abelianization, separation of the closed series and exterior-square interpretation are also README deliverables. Several are expressed through native structures or equivalent basis statements; none is a reason to substitute an arbitrary predicate or sorry'd object. This head has no sorry'd data, no `set_option`, no algorithmic milestone, and no route restricted to selected primes.

**Pinned ownership and API audit.** Pins checked by repository HEAD as well as the manifest: Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`; Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Paths in the following inventory are relative to the corresponding library repository. These are declarations opened at these pins, not claims about newer library versions.

| Object | Pinned declarations and locations opened | Consequence |
|---|---|---|
| Ring carrier and product | `TauCeti.zHat.instCommRing`, `TauCeti/Topology/Algebra/Group/Profinite/ZHat/Ring.lean:69`; `toMul_mul`, :97 | The ring product is the lift, and already exists. The multiplicative group operation before `Additive` is addition, not this product. |
| Completion and arbitrary universes | `TauCeti.ProfiniteCompletion.continuousMonoidHomEquiv`, `TauCeti/Topology/Algebra/Group/Profinite/Completion.lean:179`; `TauCeti.zHat.lift`, `lift_ofInt`, `lift_gen`, `lift_unique`, `TauCeti/Topology/Algebra/Group/Profinite/ZHat/Basic.lean:140,147,154,158` | Source and target universes are independent. No new lift is needed. |
| Product and idempotents | `ringEquivPiPadicInt`, `ringEquivPiPadicInt_apply`, continuity and inverse continuity, `idem`, `component_idem`, `idem_mul_idem`, `not_isDomain`, `tendsto_sum_idem`, `TauCeti/Topology/Algebra/Group/Profinite/ZHat/Decomposition.lean:162,170,182,187,199,221,236,310,320` | Product, idempotents, non-domain witness and finite-subset convergence already have their owner. |
| Meaning of pro-p | `TauCeti.IsProP`, `isProP_iff`, `TauCeti/Topology/Algebra/Group/Profinite/ProP/Basic.lean:68,76` | The predicate quantifies over open normal quotients; it does not itself assert compactness or separation. The roadmap's standing profinite assumptions are essential. |
| Frattini carrier and comparison | `TauCeti.proPFrattini`, `TauCeti/Topology/Algebra/Group/Profinite/ProP/Frattini/Basic.lean:102`; `map_proPFrattini_eq_of_surjective`, :407; `IsPGroup.proPFrattini_eq_frattini`, `TauCeti/Topology/Algebra/Group/Profinite/ProP/MaximalSubgroup.lean:145` | Intersection of index-p open normal subgroups; image equality uses continuous surjectivity and compactness; finite comparison needs the discrete topology. |
| Cofinality and openness | `TauCeti.IsTopologicallyFinitelyGenerated.exists_isTopCharacteristic_le`, `TauCeti/Topology/Algebra/Group/ContinuousAut/Characteristic.lean:203`; `isOpen_proPFrattini`, `TauCeti/Topology/Algebra/Group/Profinite/ProP/FiniteGeneration.lean:44` | Applying cofinality below `U ∩ Φ` gives the required restricted index. |
| Automorphism reconstruction | `exists_mapQuotient_eq`, `range_pi_mapQuotient`, `isClosed_range_pi_mapQuotient`, `isClosedEmbedding_pi_mapQuotient`, `compactSpace`, `TauCeti/Topology/Algebra/Group/ContinuousAut/Profinite.lean:104,156,172,197,209` | The proof reconstructs both an endomorphism and its inverse and checks both compositions. Its stated index is all characteristic open quotients; restriction to a cofinal index is a comparison, not the literal same theorem. |
| Finite and pro-p kernels | `IsPGroup.isPGroup_ker_mapQuotient_frattini`, `TauCeti/GroupTheory/Frattini.lean:128`; `TauCeti.ContinuousAut.isOpen_ker_mapQuotient_proPFrattini`, `TauCeti.IsProP.isProP_ker_mapQuotient_proPFrattini`, `TauCeti/Topology/Algebra/Group/ContinuousAut/ProP.lean:64,84` | The finite theorem and both global-kernel properties are proved. Openness uses finite generation; the pinned pro-p theorem itself is stronger and does not need it. |
| Free Frattini lifting | `TauCeti.freeProP.mapQuotient_proPFrattini_surjective`, `TauCeti/Topology/Algebra/Group/Profinite/Free/Automorphism.lean:213` | Exactly the omitted free-case conclusion, for any finite generator type and prime p. |
| Closed conjugacy | `TauCeti.isClosed_isConj_pair`, `TauCeti/Topology/Algebra/Group/Conjugacy.lean:27` | Compact Hausdorff suffices. Total disconnectedness supplies separation in this roadmap but is stronger than this theorem requires. |
| Finite spanning | `TauCeti.exists_sum_gradedBracket_eq_of_range`, `TauCeti/Topology/Algebra/Group/LowerCentralSeries/Graded/ClosedSpan.lean:113` | Compactness is required of the source graded piece; ambient compactness is sufficient. The ordered-list presentation in Suggested is the same finite sum. |
| Heisenberg detection and free bases | `TauCeti.freeProP.exists_heisenberg_detect`, `TauCeti.lcsGradedPiece_zero_freeProP_bijective`, `TauCeti.lcsGradedPiece_one_freeProP_bijective`, `TauCeti/Topology/Algebra/Group/Profinite/Free/LowerCentralSeries.lean:78,128,260` | Detection and both basis theorems are already implemented; the source handles arbitrary finite generator types. |
| Finite Frattini subgroup | Mathlib `frattini`, `frattini_nongenerating`, `Mathlib/GroupTheory/Frattini.lean:24,53` | Intersection of maximal subgroups; nongeneration needs `IsCoatomic`, available for finite groups. No missing finite-group assumption in the retained theorem. |
| p-adic inverse limit | `PadicInt.lift`, `lift_spec`, `lift_unique`, `ext_of_toZModPow`, `Mathlib/NumberTheory/Padics/RingHoms.lean:658,684,693,713` | Compatibility is along powers of a prime, with ring homomorphisms; this is not a theorem about an arbitrary DVR. |
| Open normal quotient and sign | `OpenNormalSubgroup`, `Mathlib/Topology/Algebra/OpenSubgroup.lean:465`; `commutatorElement_def`, `Mathlib/Algebra/Group/Commutator.lean:46` | Openness and normality are bundled; compactness/finiteness are not. Commutator convention is `xyx⁻¹y⁻¹`. |

The inventory has 15 object rows and over 40 exact declarations. Searches were by object as well as name in Mathlib, Tau Ceti, main, the board packages, and the supplied open-roadmap heads, using `roadmaps grep` and `roadmaps show` as well as local `rg`. The board's cohomology and metaplectic Heisenberg developments concern different structures/applications; they do not supply a second owner for this closed-series development. The decisive overlapping owner is the completed ProfiniteArithmetic roadmap, not a new competing roadmap. No ownership claim is based on an unprovided PR checkout.

**Cross-roadmap resolutions (five roadmap names).** ProfiniteProPGroups' opening ownership paragraph was read on main (`Completed/ProfiniteProPGroups/README.md:25–36`) and at its supplied open head (`TauCetiRoadmap/ProfiniteProPGroups/README.md:19–30`): it assigns the generic ring, power and automorphism objects to ProfiniteArithmetic, and its Layers 3, 4 and 8 supply the foundations now implemented in Tau Ceti. BelyiMaps' supplied head has the scope table at :86 and the actual §§12.7 and 13.1; §12.7 begins at :4548 and consumes the outer-automorphism maps. Its arithmetic successor is named `BelyiArithmeticActions`, so these are downstream contracts, not upward prerequisites. Main's `TauCetiRoadmap/PeripheralActions/README.md:376–398` uses the binary closed conjugacy relation exactly as claimed, and its Suggested file imports the completed certificate. LocalFieldsRamification's supplied head has the generic-owner boundary at :1334 and the tame Tate twist at :1436; its main version also retains that boundary. ProfiniteCohomology's scope describes continuous cohomology, excluded here. No reversed conjugation or degree convention was found in these consumers. Two main-branch model roadmaps were read: completed ProfiniteProPGroups and active PeripheralActions, in addition to the completed ProfiniteArithmetic owner. The resolver reported no unresolved cross-roadmap citations; its explicit warning that it did not inspect pinned packages was supplemented by the local pin checks above.

**Source sample.** All 15 seeded subsections were inspected, together with the bibliography and every explicit source pointer. No passage was marked “unverified” in the README. The source service was used for all ten cited works, including Labute (cited in §3.4 though omitted from the final bibliography). Only two yielded relevant readable texts: Lazard and the FLT project's blueprint. Lack of access is not asserted to be a mathematical defect; R05 concerns the missing locators themselves.

| Sampled target | Source and locator outcome |
|---|---|
| 0.1 Ring | FLT Definition 5.1/Lemma 5.2, `flt-zhat line 289` and `line 309`, supports the compatible-residue ring, not the lift-based construction. That construction is checked at `TauCeti.zHat.instCommRing`. |
| 0.2 Projections and limit | FLT Definition 5.1 explicitly indexes positive levels and specifies divisibility compatibility, `flt-zhat line 289`. Universal-property details checked in the pinned definitions; README gives no precise literary theorem/page. |
| 0.3 Components, product, idempotents | Ribes–Zalesskii §4.3 is inaccessible. Exact component/product results checked at the pin; no literary page certified. |
| 0.4 Units and characters | No claim-level literary locator. Pinned unit criterion and character-assembly applications elaborate; bibliographic coverage not certified. |
| 1.1 Profinite powers | Ribes–Zalesskii §4.1 inaccessible; pinned lift and power applications checked. |
| 1.2 Procyclic subgroups and prime parts | Same Ribes–Zalesskii source inaccessible; finite and p-adic instances computed below. |
| 1.3 p-adic powers | Tau Ceti's existing calculus is explicitly consumed; no exact literary page given. The comparison and unit inverse laws were checked against the pinned signatures. |
| 2.1 Automorphism groups | Definitions compared to native carriers and finite nonabelian examples; no exact literary locator given. |
| 2.2 Congruence topology | Ribes–Zalesskii §4.4 inaccessible; actual pinned reconstruction proof opened, including inverses, separation and compactness. |
| 2.3 Actions and functoriality | Definitions and quotient computation rules checked; no exact literary locator given. |
| 2.4 Pro-p automorphisms | Gorenstein Ch.5 §1, Huppert III §3, Ribes–Zalesskii §§4.4–4.5 and DDMS Ch.5 unreadable; native finite and pro-p proofs opened. |
| 3.1 Closed series | Defined by the pinned p-series at parameter 0; abstract N-series support in Lazard I §2, pp.109–110. Closure and pro-p separation are additional topological assertions, checked independently. |
| 3.2 Graded bracket | Lazard I §2, Theorem (2.1), printed p.110, `lazard1954 line 351`, `line 368`, `line 387`: N-series, quotient bracket and Lie ring. Reindexing gives degree `j+k+1`. This does not certify the ℤ_p/topological additions. |
| 3.3 Generation | No exact literary theorem/page. Pinned finite-sum theorem opened; compact and noncompact controls computed below. |
| 3.4 Free pro-p group | MKS §5.7 and Serre I Ch.IV unreadable; Labute paywalled with no theorem/page supplied. Pinned basis/detection proofs and explicit degree-zero/one checks supply independent evidence, not certification of those locators. |

**Adversarial table.** `C_m` means the discrete multiplicative presentation of `ZMod m`, with generator `x`; exponents are computed modulo m. In Heisenberg groups, `A=(1,0,0)`, `B=(0,1,0)`, `Z=(0,0,1)`, and `H_p` has coefficients ℤ_p. In S₃, `a=(12)`, `b=(23)`, `c=(13)`; products act rightmost first. “Valid” means the displayed instance agrees on both sides, not that finitely many examples prove the general theorem. Native proofs and hypotheses were checked separately above. Declaration names omit `TauCetiRoadmap.ProfiniteArithmetic`. R03 applies to retained API padding; R04 asks to place discriminating tests in the owning README. Arithmetic values below were computed during this review, with the finite cyclic, S₃ and Heisenberg operations additionally recomputed in scratch.

| Statement | Instances tried | Computed values on each side | Result | Change |
|---|---|---|---|---|
| 0.1 ring product/casts | integers 0,1,2,3 | lift(2)(3)=6=2·3; lift(1)(2)=2; group identity becomes ring 0 | Valid | R04 Checks |
| 0.1 ring axioms | a=2,b=3,c=4 | 2(3+4)=14=6+8; (2·3)4=24=2(3·4); 2·3=6=3·2 | Valid | none |
| 0.1 joint ring continuity | residue level 6 | product sends (2,4) to 2; preimage of 2 is a union of open residue rectangles | Valid | none |
| 0.1 alternating components | components at primes 2,3 are 1,0 | a²=a; if a=k∈ℤ, k²=k gives k=0 or 1; neither has components (1,0) | Valid non-integer test | R04 |
| `zHat.toZMod` | n=1,6; a=7 | outputs 0,1; wrong zero map at n=6 gives 0≠1 | Valid | none |
| `zHat.continuous_toZMod` | n=6, residue 1 | preimage is 1+6ẑ, an open coset; residue 0 gives 6ẑ | Valid | R03 |
| `zHat.castHom_toZMod` | m=6,n=2,a=5 | 5 mod6 mod2=1=5 mod2 | Valid direction | R03 |
| `zHat.ext_iff_toZMod` | a=b=5; a=0,b=1 | equal pair: true↔true; unequal pair: false↔false, distinguished mod2 | Valid both directions | R03 |
| `zHat.ringLift` | integer reduction maps | lift(7)=7; mod6=1. Zero ring admits no unital map to ZMod2, so no spurious family | Valid | none |
| `zHat.toZMod_ringLift` | R=ℤ,n=6,r=7 | projection(lift(7))=1=f₆(7) | Valid | R03 |
| `zHat.denseRange_intCast` | ω₂ at levels 4,3 | integer 9 gives (1,0), the specified two residues | Valid finite-level density | R03 |
| `zHat.intCast_injective` | integers 0,1 | residues mod2 are 0,1, hence images differ | Valid | R03 |
| `zHat.component` | a=6,ℓ=2,3 | components 6∈ℤ₂,6∈ℤ₃; mod4=2 and mod9=6; zero map fails at 1 | Valid | none |
| `zHat.continuous_component` | ℓ=2, ball 1+4ℤ₂ | inverse image is residue-1 coset mod4, open | Valid | R03 |
| `zHat.toZModPow_component` | ℓ=2,k=0,2,a=6 | at k=0 both 0 in ZMod1; at k=2 both 2 in ZMod4 | Valid boundary | R03 |
| `zHat.maximalProPQuotientEquivPadicInt_mk_eq_component` | ℓ=3,a=1,6 | both maps give ofAdd(1),ofAdd(6); generator normalization excludes multiplication by 2 | Valid | none |
| `zHat.nonempty_ringEquiv_pi` | a=ω₂ and b=1−ω₂ | e(a)=(1,0,0,…), e(b)=(0,1,1,…); product 0 on both sides, inverse recovers a,b | Valid headline | none |
| `zHat.idem` | ℓ=2 at mod4,3,6 | values 1,0,3; 0 fails first, 1 fails second, ω₃ fails both | Valid discriminants | R04 |
| `zHat.component_idem` | ℓ=2,ℓ′=2,3 | 1=if true then 1 else 0; 0=if false then 1 else 0 | Valid | R03 |
| `zHat.idem_mul_idem` | ω₂ mod6 | 3² mod6=3=ω₂ mod6 | Valid | R03 |
| 0.3 orthogonality | ω₂,ω₃ mod6 | 3·4=0 mod6; every global component product is 0 | Valid | none |
| 0.3 supported-factor iff | a=ω₂; a=1 | ω₂a=a true, other components 0; ω₂·1≠1, component3(1)=1≠0 | Valid both directions | none |
| 0.3 reductions of idempotents | ℓ=2,k=0,2,n=3 | mod1:1=0; mod4:1; mod3:0 | Valid | R04 |
| `zHat.not_isDomain` | ω₂,1−ω₂ | both nonzero (components2 and3); product has all components0 | Valid zero divisors | R03 |
| `zHat.isUnit_iff` | a=−1,2,0 | −1 unit at every level; 2,0 fail mod2; at n=1 every residue is a unit | Valid both directions | R03 |
| `zHat.isUnit_iff_component` | a=−1,2,ω₂ | true↔all true; 2 fails at2; ω₂ fails at3 (component0) | Valid both directions | R03 |
| 0.4 units product topology | sign unit −1; nonunit2 | units map to (−1)_ℓ and invert to themselves; 2 excluded by ℤ₂ component | Valid | none |
| `zHat.unitsLift` | sign characters C₂→(ZMod n)ˣ | nonidentity maps to −1; mod3=2, mod4=3; trivial character gives1 | Valid; distinguishes characters | none |
| `zHat.map_toZMod_unitsLift` | sign at n=3 | reduction of −1 is2=χ₃(nonidentity) | Valid | R03 |
| `ProfiniteCompletion.continuousMonoidHomEquiv` | ℤ→C₆,1↦x; trivial target | completion extension sends n to xⁿ; trivial target has exactly one map on each side | Valid universes-independent construction | none |
| `ProfiniteCompletion.continuousMonoidHomEquiv_apply` | preceding map, n=7 | extension(η7)=x⁷=x=original(7) | Valid | R03 |
| `zHat.lift` | target C₆,a=x | lift(x)(gen)=x, lift(x)(2)=x²; trivial lift fails generator value | Valid | none |
| `zHat.lift_ofInt` | n=−1,0,2 in C₆ | values x⁵,1,x² on each side | Valid | R03 |
| `zHat.lift_gen` | C₆ generator | x=x; constant1 gives1≠x | Valid pin | R03 |
| `zHat.lift_unique` | maps to C₆ with gen↦x versus x² | first equals lift; second sends gen to x²≠x, fails premise | Valid | R03 |
| `zpowHat` | x generator C₆,a=ω₂ | residue3 gives x³; wrong projection to 3-part gives x⁴≠x³ | Valid | none |
| `zpowHat_one` | C₆; trivial group | x¹=x; 1¹=1 | Valid | R03 |
| `zpowHat_intCast` | C₆,n=−1,0,2 | x⁵=x⁻¹; 1=x⁰; x²=x² | Valid | R03 |
| `zpowHat_zero` | C₆ generator | x⁰=1 | Valid boundary | R03 delete |
| `one_zpowHat` | C₆,a=ω₂ | 1³=1 | Valid boundary | R03 |
| `zpowHat_add` | C₆,a=2,b=3 | x⁵=x²x³ | Valid | R03 |
| `zpowHat_neg` | C₆,a=2 | x⁴=(x²)⁻¹ | Valid | R03 |
| `zpowHat_zpowHat` | C₆,a=2,b=3 | (x²)³=1=x⁶ | Valid ring multiplication | none |
| `map_zpowHat` | C₆→C₃,a=ω₂ | f(x³)=1; f(x)³=1 | Valid naturality | R03 |
| `zpowHat_conj` | S₃,g=a,x=b, exponent1 | a b a⁻¹=c on both sides | Valid convention | R03 |
| `inv_zpowHat` | C₆,exponent2 | (x⁻¹)²=x⁴=(x²)⁻¹ | Valid | R03 |
| `zpowHat_comm` | C₆,exponents2,3 | x²x³=x⁵=x³x² | Valid | R03 |
| 1.1 product power requires commutation | S₃,a,b,exponent2 | (ab)²=(132), a²b²=1; for C₆ both product-square sides agree | Negative control valid | R04 |
| `continuous_zpowHat` | x∈C₆ | preimage of x is residue1 mod6; preimage of1 is residue0 | Valid open fibers | R03 |
| `continuous_zpowHat_prod` | G=C₆ | value at (x,2)=x²; fiber is union of singleton×residue cosets | Valid joint continuity | R03 |
| `closedZpowers` | x∈C₆; a∈S₃; identity | subgroups C₆, {1,a}, {1}; S₃ is not generated by a | Valid positive/negative models | none |
| `range_zpowHat` | a∈S₃ | range={1,a}=closed cyclic subgroup, not all S₃ | Valid | R03 |
| `isProP_closedZpowers_zpowHat_idem` | x∈C₆,ℓ=2,3 | x³ has subgroup order2; x⁴ has subgroup order3 | Valid | R03 |
| `zpowHat_idem_of_isProP` | C₄,ℓ=2; C₆ control | x^ω₂=x in C₄; x^ω₂=x³≠x in C₆ | Valid hypothesis test | R03 |
| `zpowHat_idem_mul_of_isProP` | C₄,ℓ=2,a=3 | ω₂·3 mod4=3, so both x³ | Valid | R03 |
| 1.2 product of prime parts | C₆,S={2},{3},{2,3} | x³,x⁴,x⁷=x; further primes contribute1 | Valid finite-subset limit | none |
| `padicPow` | C₉,p=3,u=2,0 | x²,1; fake constant map fails at u=1 | Valid | none |
| `zpowHat_eq_padicPow_component` | C₉,a=ω₂,ω₃ | values1,x; 3-adic components0,1 give the same values | Valid | none |
| `padicPow_one` | C₉ | x¹=x | Valid | R03 |
| `padicPow_intCast` | C₉,n=−1 | x⁸=x⁻¹ | Valid | R03 |
| `padicPow_add` | C₉,u=2,v=3 | x⁵=x²x³ | Valid | R03 |
| `padicPow_padicPow` | C₉,u=2,v=3 | (x²)³=x⁶=x^(2·3) | Valid | R03 |
| `map_padicPow` | C₉→C₃,u=2 | image of x² is y²=power of image | Valid | R03 |
| `padicPow_conj` | Q₈,g=i,x=j,u=3 | conj_i(j)=−j; (−j)³=j=conj_i(j³) | Valid nonabelian p=2 | R03 |
| `inv_padicPow` | C₉,u=2 | (x⁻¹)²=x⁷=(x²)⁻¹ | Valid | R03 |
| `continuous_padicPow` | C₉, exponent modulo9 | at (x,2) value x²; fibers union of singleton×open mod9 cosets | Valid | R03 |
| `padicPow_units_inv` | C₉,u=2 | inverse exponent is5 mod9; (x²)⁵=x¹⁰=x | Valid | R03 |
| `closedZpowers_padicPow_units` | C₉,u=2; u=3 control | ⟨x²⟩=C₉=⟨x⟩; ⟨x³⟩ has order3, so fails for nonunit | Valid | R03 |
| `padicPow_units_injective` | C₉,u=2; C₃,u=3 | 2i=2j mod9 implies i=j; nonunit sends x and1 both to1 | Valid both prime controls | R03 |
| 1.3 unit homeomorphism | C₉,u=2 | permutation i↦2i has inverse i↦5i; each map continuous on discrete finite group | Valid | none |
| 1.3 quotient/module law | ℤ₃→C₉,u=2,x=4 | reduction of 8=8; scalar product2·4=8 | Valid | none |
| `ContinuousAut` | C₄ and S₃ | Aut(C₄)={±1}, cardinal2; Aut(S₃)=Inn(S₃), cardinal6; trivial group gives1 | Valid carrier | none |
| `ContinuousAut.mul_apply` | φ=conj_a,ψ=conj_c,x=b | φ(ψ b)=a=conj_(ac)(b); rfl expresses the same order | Valid | R03 delete |
| `ContinuousAut.one_apply` | S₃,x=b | id(b)=b | Valid | R03 |
| `ContinuousAut.toMulAut` | C₄, inversion | permutation 0↦0,1↦3,2↦2,3↦1 unchanged | Valid forgetful map | none |
| `ContinuousAut.toMulAut_injective` | C₄,id versus inversion | images differ at1:1 versus3; equal images give equal maps | Valid | R03 |
| `ContinuousAut.conj` | S₃,a,b | conj_a(b)=c; center1 gives kernel{1}; C₄ gives constant identity | Valid distinguishing centers | none |
| `ContinuousAut.conj_apply` | S₃,a,b | aba⁻¹=c on both sides | Valid | R03 |
| `ContinuousAut.toMulAut_conj` | S₃,g=a,x=b | both abstract permutations send b to c | Valid | R03 |
| `ContinuousAut.conj_range_normal` | S₃; C₄ | range is whole Aut(S₃); range is{1} in Aut(C₄); conjugation preserves each | Valid | R03 |
| `ContinuousOut` | S₃; C₄ | Out(S₃)=1; Out(C₄)=Aut(C₄)=C₂ | Valid quotient | none |
| `ContinuousOut.mk` | S₃ inner a; C₄ inversion | outputs identity class; nonidentity class respectively | Valid | none |
| `ContinuousAut.eq_conj_of_toMulAut_eq_conj` | S₃,φ=conj_a; C₄ inversion | first equality true; C₄ inversion cannot equal any inner map since3≠1 at1 | Valid | R03 |
| `IsTopCharacteristic` | C₄ subgroup{0,2}; S₃ subgroup{1,a} | inversion preserves first; conj_c sends a to b, so second fails | Valid discriminator | none |
| `isTopCharacteristic_proPFrattini` | C₄,p=2 | Φ={0,2}; both automorphisms preserve it | Valid | R03 |
| `isTopCharacteristic_proPKernel` | C₆,p=2,3 | kernels={0,2,4} and{0,3}; multiplication by±1 preserves both | Valid | R03 |
| `ContinuousAut.mapQuotient` | C₈→C₄,φ=×3 | induced map sends class1 to3; id gives1, distinguishing maps | Valid | none |
| `ContinuousAut.mapQuotient_mk` | same, x=5 | φ5 mod4=15 mod4=3; φ̄(1)=3 | Valid | R03 |
| `ContinuousAut.continuous_mapQuotient` | C₈→C₄ | fiber over id={×1,×5}; open in discrete Aut(C₈) | Valid target topology | R03 |
| `ContinuousAut.continuous_conj` | S₃ | preimage of conj_a is{a}, open; trivial group gives whole singleton | Valid | R03 |
| `ContinuousAut.compactSpace` | C₄; G=1 | finite automorphism spaces of cardinal2 and1, hence compact | Valid headline | none |
| 2.2 compactness negative control | discrete ℤ² | characteristic subgroup0 makes Aut=GL₂(ℤ) discrete infinite; singleton cover has no finite subcover | Correct failure without compact G | R04 |
| 2.2 separation negative control | multiplicative ℝ with additive group law | only characteristic open quotient is1; all automorphisms have same coordinate, induced topology indiscrete | Correct failure of profinite stack | R04 |
| `ContinuousAut.t2Space` | C₄ | id and inversion separated by disjoint singleton opens | Valid | R03 |
| `ContinuousAut.totallyDisconnectedSpace` | C₄ | connected components are {id},{inversion} | Valid | R03 |
| `ContinuousAut.continuous_eval` | C₄, output3 | preimage={(id,3),(inversion,1)}, open in finite discrete product | Valid | R03 |
| `isClosed_isConj_pair` | S₃ | relation has 1²+3²+2²=14 pairs, closed; (a,b) included, (a,ab) excluded | Valid binary relation | R03 |
| `ContinuousAut.isClosed_isConj` | S₃,x=a,y=b or ab | first set all6 automorphisms; second empty; both closed | Valid | R03 |
| `ContinuousOut.mk_smul_mk` | S₃,inner conj_a,x=b | both give transposition conjugacy class; inner class acts as identity | Valid | R03 |
| `ContinuousAut.mapClosedQuotient` | C₈,N={0,4},φ=×3 | induced C₄ automorphism ×3; noncharacteristic S₃ transposition subgroup excluded | Valid domain | none |
| `ContinuousAut.mapClosedQuotient_mk` | preceding x=5 | both quotient values3 | Valid | R03 |
| `ContinuousAut.mapClosedQuotient_conj` | Q₈→Q₈/{±1} | every inner automorphism becomes id on C₂²; conjugation by quotient class is id | Valid | R03 |
| `ContinuousAut.continuous_mapClosedQuotient` | C₈→C₄ | preimage of inversion is{×3,×7}, open | Valid | R03 |
| `ContinuousOut.mapClosedQuotient` | C₈→C₄, both abelian | outer maps equal automorphism reduction; ×3 maps to×3, ×5 maps to id | Valid | none |
| `ContinuousOut.mapClosedQuotient_mk` | same,φ=×3 | both sides the inversion class on C₄ | Valid | R03 |
| `ContinuousOut.continuous_mapClosedQuotient` | same | inversion-class preimage={×3,×7}, open | Valid | R03 |
| `ContinuousAut.smul_closedSubgroup_toSubgroup` | S₃,H={1,a},φ=conj_c | image={1,b} on both sides | Valid image direction | R03 |
| `ClosedSubgroupConjClasses` | S₃ | four classes: 1,C₂,C₃,S₃; three distinct C₂ subgroups share one class | Valid quotient, excludes raw subgroups | none |
| `ContinuousOut.mk_smul_closedSubgroupConjClass` | S₃,H={1,a},φ=conj_c | identity outer class fixes [C₂]; image subgroup{1,b} has same class | Valid | R03 |
| `outerAction` | E=S₃,N=A₃ | E/N=C₂ acts on N=C₃ by inversion; identity extension N=1 gives unique trivial map | Valid; nontrivial action detected | none |
| `outerAction_mk` | E=S₃,N=A₃,e=a | one φ sends (123) to(132) and (132) to(123); simultaneously φ1=1 | Valid ∃φ before ∀n | R03 |
| 2.3 outer action continuity | S₃ extension A₃ | two cosets map to id/inversion in discrete Aut(C₃); fibers A₃ and aA₃ are open | Valid | none |
| `frattiniKernel` | C₄,C₂²,Q₈ | kernels have orders2,1,4; Φ has orders2,1,2; an order3 axis permutation of Q₈ is excluded | Valid discriminating models | none |
| `isPGroup_frattiniKernel` | p=2:C₄,Q₈; p=3:C₉; trivial | orders2,4,3,1 respectively, all p-powers; tuple lift counts2,4,3,1 | Valid headline including rank0 | none |
| `isProP_ker_toFrattiniQuotient` | G=ℤ₂,ℤ₃,1 | kernels1+2ℤ₂,1+3ℤ₃,{1}; finite reductions have orders2^(k−1),3^(k−1),1 | Valid open pro-p headline | none |
| 2.4 cofinal restricted index | ℤ_p,U=p^kℤ_p | N=p^max(k,1)ℤ_p≤U∩Φ; G=1 gives one index with N=Φ=1 | Valid rank0 and p=2,3 | none |
| 2.4 quotient-Frattini comparison | ℤ_p/N, N=p²ℤ_p | image(pℤ_p)=pℤ/p²ℤ=Φ(C_(p²)), order p | Valid p=2,3 | none |
| 2.4 compatible-family image equality | ℤ₂,α_k=×3 mod2^k | squares both send1 to3 mod2^j; global φ=×3 lies in kernel; all-id family comes from id | Valid intended headline | R02 missing |
| 2.4 incompatible-family exclusion | α₃=×3 on C₈,α₂=id on C₄ | each finite coordinate Frattini-trivial; square at1 gives3 versus1 mod4 | Valid negative control | R02,R04 |
| 2.4 inverses and topology of families | preceding compatible ×3 family | inverse mod4=3,mod8=3,mod16=11; products reduce to1; coordinate constraints are clopen | Valid reconstruction route | none |
| 2.4 free Frattini surjectivity | ranks0,1; rank2,p=2 | rank0 1→1; rank1 units reduce onto 𝔽_pˣ; swapping two free generators lifts matrix [[0,1],[1,0]] | Valid intended headline | R02 missing |
| `closedLowerCentralSeries` | Q₈; C₄; S₃ | Q₈:γ₀=Q₈,γ₁={±1},γ₂=1; C₄:γ₁=1; S₃:γ₁=γ₂=A₃ | Valid; distinguishes p-series | none |
| `closedLowerCentralSeries_zero` | Q₈ and1 | γ₀ is whole group in each, cardinal8 and1 | Valid boundary | R03 |
| `closedLowerCentralSeries_succ` | Q₈,n=0,1 | closure[Q₈,Q₈]={±1}; closure[{±1},Q₈]=1 | Valid | R03 delete |
| `closedLowerCentralSeries_normal` | Q₈,n=1 | conjugation preserves {±1}; for n=0,2 preserves Q₈,1 | Valid | R03 |
| `isClosed_closedLowerCentralSeries` | Q₈,n=1 | {±1} finite closed; complement6 elements open | Valid | R03 |
| `closedLowerCentralSeries_antitone` | Q₈ | 1⊆{±1}⊆Q₈, sizes1≤2≤8 | Valid | R03 |
| `isTopCharacteristic_closedLowerCentralSeries` | Q₈,n=1 | all automorphisms fix1 and−1, so image{±1}={±1} | Valid | R03 |
| `closedLowerCentralSeries_eq_topologicalClosure` | discrete Q₈,n=1 | abstract commutator subgroup={±1}; closure unchanged; closed γ₁={±1} | Valid | R03 |
| `commutator_mem_closedLowerCentralSeries` | Q₈,j=k=0,x=i,y=j | [i,j]=−1∈γ₁; [−1,i]=1∈γ₂ | Valid shifted degree | R03 |
| `map_closedLowerCentralSeries_le` | Q₈→C₂² | γ₁ image={1}=γ₁(C₂²); identity map gives equality at every level | Valid | R03 |
| `closedLowerCentralSeries_le_pLowerCentralSeries` | C₄,p=2,n=1 | γ₁=1⊆λ₁={0,2}; parameter p=0 gives equality | Valid strict/equal cases | R03 |
| `iInf_closedLowerCentralSeries_eq_bot` | Q₈,C₉; S₃ control | intersections1,1; S₃ intersection A₃≠1, so pro-p hypothesis matters | Valid | none |
| 3.1 non-openness | free pro-p rank2 | quotient byγ₁=ℤ_p² infinite; γ₁ not open; abelian ℤ_p has γ₁=0 also not open | Valid negative control | R04 |
| `lcsGradedPiece` | Q₈ | gr₀=C₂²,gr₁=C₂,gr₂=0; using λ instead changes the general object | Valid | none |
| `lcsGradedMk` | Q₈,n=1 | class(−1)=nonzero in C₂; class1=0 | Valid positive/negative class | none |
| `lcsGradedMk_conj` | Q₈,n=0,g=i,x=j | iji⁻¹=−j has same coset as j modulo{±1} | Valid | R03 |
| `closedLowerCentralSeries_one` | Q₈ | both sides{±1}; C₄ both1 | Valid | R03 |
| `lcsGradedPieceZeroEquiv` | Q₈; C₄ | quotients C₂² and C₄ on both sides; maps class i to class i | Valid, no unmarked sign choice | none |
| `lcsGradedPieceZeroEquiv_mk` | Q₈,g=i | both the nonzero i-coordinate in C₂² | Valid | R03 |
| `padicPow_mem_closedLowerCentralSeries` | Q₈,p=2,n=1,x=−1,u=2 | (−1)²=1∈{±1}; u=3 gives−1∈{±1} | Valid | R03 |
| `lcsBracket` | H₂,j=k=0 | [A,B]=Z has class1 in gr₁≅ℤ₂; [A,A]=0 | Valid nonzero/zero models | none |
| `lcsBracket_mk` | H₂,A,B | bracket classes=class(0,0,1)=commutator class | Valid | R03 |
| `lcsBracket_add_left` | H₂, A+A,B | left2; right1+1=2 inℤ₂ (not0) | Valid dyadic bilinearity | R03 |
| `lcsBracket_add_right` | H₃,A,B+B | left2; right1+1=2 inℤ₃ | Valid | R03 |
| `lcsBracket_natural` | H₂→Heisenberg(ZMod4) | image of Z has z=1; bracket of images also z=1 | Valid | R03 |
| `lcsBracket_padicPow_left` | H₂,A,B,u=2 | [A²,B] has z=2; Z² has z=2 | Valid | R03 |
| `lcsBracket_padicPow_right` | H₃,A,B,u=−1 | [A,B⁻¹] has z=−1; Z⁻¹ has z=−1 | Valid | R03 |
| 3.2 alternation and sign | H₂,A,B | [A,A]=0; [B,A]=−1, not+1 inℤ₂; mod4 values3 versus1 | Valid, no division by2 | R04 |
| 3.2 Jacobi / direct-sum Lie ring | H_p,three degree0 classes | each nested bracket lands in gr₂=0; sum0+0+0=0; bracket degree0+0+1=1 | Valid shifted grading | none |
| 3.2 ℤ_p-module and Lie algebra | H₂, scalar2 and bracket1 | [2A,B]=2=2[A,B]; ℤ₂ central coordinate torsion-free | Valid, distinguishes 𝔽₂ model | none |
| 3.2 comparison graded map | C₄,p=2,n=0,1 | gr₀=C₄ maps by reduction to λ₀/λ₁=C₂; gr₁=0 maps to λ₁/λ₂=C₂ by0 | Valid, not an isomorphism | none |
| 3.3 closed-span theorem | H_p,S={A,B},n=0 | [A,zB]=zZ gives every z∈ℤ_p; for C₄ target gr₁=0=span0 | Valid | none |
| `lcsGradedPiece_eq_sum_bracket` | H₂,z=3Z; G=1,empty S | choose y_A=3B,y_B=0: sum3Z+0=3Z; empty sum0 equals sole target | Valid headline, empty case | none |
| 3.3 compactness negative control | ℤ×ℤ²×ℝ example, central z=1/2 | bracket sums lie in ℤ+√2ℤ; 1/2 is outside; closure isℝ, so 1/2 is in gr₁ | Valid counterexample | R04 |
| 3.3 finite module generation | H_p; free rank2 degrees0,1 | ranks(2,1,0,…) for H_p; ranks2,1 for free group; trivial group all0 | Valid | none |
| `HeisenbergZp` | A,B,identity | AB=(1,1,1), BA=(1,1,0); A⁻¹=(−1,0,0); zero/trivial model fails AB≠BA | Valid nonabelian carrier | none |
| `HeisenbergZp.isProP` | p=2,3, mod p^n | quotient cardinal p^(3n); n=0 gives1,n=1 gives8,27 respectively | Valid | R03 |
| 3.4 congruence levels | p=2,n=1; p=3,n=2 | indices8,729; conjugate(p^n a,p^n b,p^n c) has central correction p^n(xb−ay), still divisible | Valid normality and basis | none |
| `lcsGradedPiece_zero_freeProP_bijective` | r=0,1,2 | maps0→0; a↦a onℤ_p; (a,b)↦a x̄₀+b x̄₁ with detector outputs(a,b) | Valid headline | none |
| `exists_heisenberg_detect` | r=2,i=0,j=1; r=1 control | images A,B; bracket mapsZ; r=1 has no pair i≠j | Valid | R03 delete |
| `lcsGradedPiece_one_freeProP_bijective` | r=0,1,2,3 | source/target ranks0,0,1,3; for r=2 coefficientc detected as central c | Valid headline incl p=2 | none |
| `lcsBracket_freeProP_ne_zero` | r=2,i=0,j=1;p=2,3 | detector image1∈ℤ_p≠0; i=j gives0 but violates premise | Valid | R03 |
| 3.4 exterior-square/rank interpretation | r=0,1,2,3 | ranks r(r−1)/2=0,0,1,3; wedge e₀∧e₁ maps bracket with detector1 | Valid including natural subtraction | none |
| Worked ℤ₃ power | x=ofAdd1,a=2,ω₂ | values ofAdd2,ofAdd0 on both power/component sides | Valid | R04 |
| Worked Aut(ℤ_p) | p=2,3, multipliers−1 and p | −1 invertible, square1; p not surjective (1 not in pℤ_p) | Valid unit criterion | R04 |
| 2.1 discontinuous abstract automorphism | V=∏ℕ𝔽₂; linear f vanishes on finite-support vectors, f(1,1,…)=1 | T(v)=v+f(v)e₀ has T²=id; truncations v_n→1 have T(v_n)=v_n→1≠T(1)=1+e₀ | Valid noncontinuous control | R04 |
| Consumer conjugation convention | S₃,d=(123),x=(12) | d x d⁻¹=(23); d⁻¹ x d=(13)=conj_(d⁻¹)(x) | Directions agree after inversion | R04 |
| Standing pro-p stack | additive ℝ and prime2 | only open quotient is1, so native IsProP holds; ℝ is neither compact nor totally disconnected | Stack excludes misleading model | none |
| 3.3 compact non-Hausdorff control | indiscrete C₂ | closure{1}=G; every γ_n=G, every gr_n=0; finite-sum conclusion0=0 | Valid larger topological scope | none |
| Prime/level exclusions | p=0,1; n=0 | Fact Prime0 and Prime1 impossible; ZMod0=ℤ infinite, excluded by ℕ+; series parameter0 still yields x⁰=1 | No coefficient junk instance | none |
| Ownership witness R01 | active and completed namespaces | 95 common fully qualified names; proposed §2.4 index=N≤Φ in both | Conflict, not a new theorem | R01 |

The 172-row table includes every declaration in Suggested (133), additional README-only formulas and conventions, all 15 sample subsections, all seven stated headlines and both omitted §2.4 conclusions. These instances include rank 0/1/2, levels 0/1/2, p=2/3, cyclic and nonabelian groups, empty generating sets, the zero ring as an impossible unital-family source, compact/noncompact topology, identity maps and failure of nonunit injectivity. General-DVR, ramification, inseparability and scheme-thickening tests are inapplicable: no assertion here quantifies over those objects. Prime assumptions exclude p=0/1 as coefficients; p=0 is deliberately permitted only as the lower-series parameter. Positive finite levels exclude the `ZMod 0=ℤ` trap. All coefficients and maps used in the stated Lean theorems are native objects or reducible aliases with real bodies.

## Not verifiable

- **Ribes–Zalesskii, Profinite Groups, 2nd ed.** The service classified DOI `10.1007/978-3-642-01642-4` as paywalled/uncertified. §§4.1,4.3,4.4,4.5 and Props.2.5.2,2.8.7 were not read. No page or hypothesis in that book is certified here.
- **Dixon–du Sautoy–Mann–Segal, Analytic pro-p groups, 2nd ed.** The service reached the Cambridge DOI landing page for `10.1017/CBO9780511470882`, but obtained no legal readable text. An author-publications search supplied bibliographic information, not Chapter 5. Listed in the scratch missing-reference record.
- **Gorenstein, Finite Groups; Huppert, Endliche Gruppen I; Magnus–Karrass–Solitar, Combinatorial Group Theory; Serre, Lie Algebras and Lie Groups.** Title/author queries through the service yielded no legal text. For MKS, its resolver found a JSTOR book review rather than the book, so that response does not certify §5.7. All four works remain in the missing-reference record under their own keys.
- **Labute, Algèbres de Lie et pro-p-groupes définis par une seule relation (1967).** DOI `10.1007/BF01425754` was classified paywalled/uncertified. The README gives no theorem/page; neither the intended locator nor the scope of its free-pro-p claim is certified.
- **Neukirch–Schmidt–Wingberg, Cohomology of Number Fields.** The [authors' legal page](https://www.mathi.uni-heidelberg.de/~schmidt/NSW2e/) advertises electronic version 2.3. Both source-service requests for the PDF returned that landing page, not the book. `nsw line 25` only establishes availability; I §1 and III §9 were not read. Listed in the missing-reference record, without guessing their contents.
- **FLT implementation details.** The initial guessed raw-file path returned 404. The [project's own blueprint](https://imperialcollegelondon.github.io/FLT/blueprint/sect0002.html), fetched through the service, verifies Definition 5.1/Lemma 5.2 (`flt-zhat line 289`, `line 309`), including the positive-level convention. This is not a check of that external project's current Lean implementation or pin. It is not a dependency of this module.
- **Post-pin implementation claims.** The completed roadmap's certificate records later implementations of the restricted finite-kernel comparison, Heisenberg levels and exterior-square equivalence at `Completed/ProfiniteArithmetic/Suggested.lean:127–148`. That inventory was read as data. Those later declarations were not present at the supplied Tau Ceti pin, and no proof of them on a later library revision was assumed. The archived README itself is sufficient to establish ownership.

No source manifest was edited. Missing readable texts did not park this review: the reports record the access limits and complete the independently checkable work. There is no claimed verification against open work whose files were not supplied; searches of the broader index were used only to locate relevant supplied/main owners.

## Source issues

- none
