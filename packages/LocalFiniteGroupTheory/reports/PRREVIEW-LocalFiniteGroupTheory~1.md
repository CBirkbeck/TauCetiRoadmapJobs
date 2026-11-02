# Review of LocalFiniteGroupTheory (pull request #1634 at 0c409c9)

**Verdict:** needs changes

🤖 Independent AI review. Three blocking findings: the general p-stability definition, omitted statable headline theorems, and unresolved duplicate ownership. The supplied gate also fails. No pull-request files were changed.

## R01 (P2) — Extend p-stability beyond the nontrivial-core case

**Location:** `TauCetiRoadmap/LocalFiniteGroupTheory/README.md:246`; `TauCetiRoadmap/LocalFiniteGroupTheory/Suggested.lean:250`. Claim: “For odd p, IsPStable p G” is defined by testing P with O_{p′}(G)P normal in G.

**Witness:** In SL₃(3), O₃=O_{3′}=1 makes this predicate true. Its maximal parabolic M has O₃(M)=C₃² and a quadratic element outside O₃(M/C_M(O₃(M))). The source's general definition therefore says false.

Glauberman's Definition 2.1, printed p.1104, restricts this local condition to groups with nontrivial Oₚ. Definition 2.3 extends it to arbitrary groups by testing the subgroups maximal with nontrivial Oₚ; the roadmap omits that extension (`glauberman-zj line 146` and `glauberman-zj line 154`, [primary paper](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/17D9FCB2D77EFCCC2FD81573FEE681A6/S0008414X00052457a.pdf/a-characteristic-subgroup-of-ap-stable-group.pdf)). This matters for the promised general library even though the self-centralizing-core hypothesis in the ZJ theorem largely confines that theorem to the local case.

**Exact repair:** Keep the existing condition as an explicitly named local predicate, with its nontrivial-core scope. Define general p-stability using Definition 2.3, for odd primes, and prove its agreement with the local predicate when Oₚ(G)≠1. Include the trivial group and SL₃(3) as positive/negative Checks. State ZJ on the resulting general notion, retaining its self-centralizing-core hypothesis.

**Repair test:** For G=SL₃(3), take P={I+aE₁₂+bE₁₃}. Direct matrix enumeration gives |G|=5616, |P|=9, |N_G(P)|=432, C_G(P)=P and O₃(N_G(P))=P. The normalizer has index 13 and is maximal. For x=I+E₂₃, x³=I, x∉P, |[P,x]|=3 and [P,x,x]=1. Thus the quotient's 3-core is 1 and x violates the local condition in M=N_G(P). The enumeration also finds eleven nonidentity conjugacy classes, each with normal closure G, proving the simplicity used to compute both cores of G. The repaired definition rejects G and accepts 1 and the 3-group H₂₇.

## R02 (P2) — State the missing headline theorems at their promised strength

**Location:** `TauCetiRoadmap/LocalFiniteGroupTheory/README.md:234`, `:251`, `:257`; `TauCetiRoadmap/LocalFiniteGroupTheory/Suggested.lean:257` and `:285`. The README promises Glauberman replacement, characteristic ZJ, and Thompson's normal p-complement theorem; the file omits the first and third and states only normality for ZJ.

**Witness:** Four additional signatures elaborated at the same pins using existing carriers and the file's real definitions: Hall containment, odd-prime Glauberman replacement, Thompson's normal complement criterion, and characteristic ZJ. None requires a new carrier or a stand-in.

**Exact repair:** Add those signatures with their full hypotheses and `sorry`. For replacement, require P a finite p-group, p odd, B≤P normal in P, [[B,B],B]=1, and B′≤Z(J(P)); state the promised alternative, or the stronger source theorem with its explicit improvement conclusion. State Thompson's criterion using N_G(J(S)) and C_G(Z(S)). Strengthen ZJ to `Characteristic`. Add Hall containment to complete the three-part Hall milestone. Audit the other headline promises, especially extraspecial classification and general Glauberman's lemma, and either state them on native carriers or identify precisely the missing carrier in the module docstring; the present docstring does neither.

**Repair test:** The four signature probes elaborate with only `sorry` warnings. In H₂₇ with B=P, the replacement alternative is witnessed by an order-9 normal abelian subgroup and ZJ is its characteristic order-3 center. For C₆ at p=3, both subgroups in Thompson's criterion have normal complement C₂. In S₃ the Hall {2} subgroup containing a chosen C₂ is that C₂ itself. The source states the stronger characteristic conclusion in Theorem A, printed p.1105 (`glauberman-zj line 183`).

## R03 (P2) — Resolve the shared ownership with FiniteGroupInvariants

**Location:** `TauCetiRoadmap/LocalFiniteGroupTheory/README.md:132`–`:183`, especially the assertion that this roadmap supplies the core/Fitting/component library.

**Witness:** At the supplied open head, `TauCetiRoadmap/FiniteGroupInvariants/README.md:374`, `:439`, `:483`, and `:503` independently plan the Fitting subgroup, quasisimple groups, components/Bender, and Hall's theorem, with the same mathematical definitions.

**Exact repair:** Assign these shared objects and results one owner and record the boundary by roadmap and section. The coherent choice is LocalFiniteGroupTheory L1–L2 for the general structural theory, with FiniteGroupInvariants consuming it for its invariants; record that ownership transfer and have the overlapping plan cite it. Do not add a reciprocal supplier edge. If the agreed owner is instead FiniteGroupInvariants, remove the duplicate targets here and cite its exact sections, with an acyclic order. A change of namespace or an ambient-subgroup wrapper does not make Fitting's or Bender's theorem a different target.

**Repair test:** On G=S₃, both proposed Fitting definitions give C₃; on G=A₅, both generalized Fitting definitions give G; their quasisimple predicates agree on SL₂(5), and both Hall developments produce the same three Hall {2} subgroups of S₃. An adapter for relative subgroups suffices. No duplicate fully qualified Lean name was found; the collision is ownership by object. Neither new roadmap is listed in the candidate order, which is not itself a defect.

## R04 (P3) — Supply claim-level locators and the source manifest

**Location:** `TauCetiRoadmap/LocalFiniteGroupTheory/README.md:130`–`:291`, `:303`–`:319`. The layers state results without attaching theorem/section/page locators; the references give whole books and whole papers. There is no `sources.toml`.

**Witness:** Baer–Suzuki at line 150 supplies no Alperin–Lyons theorem/page; ZJ at line 251 supplies no locator even though Theorem A is on printed p.1105. The worker's heading sampler found no targets to sample.

**Exact repair:** Attach a precise legal source and locator to each theorem and API assertion, in the author's words, and record the works once each in `sources.toml`. For the checked material use Glauberman Definition 2.1/2.3, p.1104; Theorem 3.1(a), p.1106; Theorem 4.1, p.1111; Corollary 4.1, p.1113; Theorems A and D, p.1105. Record inaccessible texts honestly rather than treating a bibliography or repository landing page as verification. The source inventory and inaccessible items are below.

**Repair test:** Those locators lead directly to the relevant statements in the publisher's text. The 15 replacement sample targets are individually identified below; only the ZJ target in that sample could be matched to a read primary statement during this review.

## R05 (P3) — Give the definitions usable APIs and discriminating Checks

**Location:** `TauCetiRoadmap/LocalFiniteGroupTheory/README.md:86`–`:291`. Twenty-one definitions/classes/structures occur in the Lean file, but the README has no `**Checks.**` lists. Some basic APIs are only names or “the same API”; fixedBy and commutatorAct lack their own basic theory.

**Witness:** Q₈ has J(Q₈)=Q₈ using maximal-order abelian subgroups, but the elementary-abelian alternative gives C₂. No Check records this discriminating value. The source and Mathlib element commutators also differ on r=(123), s=(12).

**Exact repair:** Give every retained definition its explicit API and at least three prose Checks, including a satisfying instance, a failing or distinguishing instance, and a boundary case. For J use Q₈, a cyclic group, and 1; for the π-core use S₃ with π={2}, {3}, and ∅. For actions include invariance, containment, conjugation/transport and quotient compatibility with their hypotheses. Add the computed commutator convention witness: Mathlib [r,s]=r⁻¹, the paper's [r,s]=r, and the generated subgroup is C₃ in both conventions. Keep Checks in the README.

**Repair test:** These examples separate order from rank, normal core from arbitrary Sylow subgroup, and element formulas from subgroup identities. The adversarial table supplies concrete starting cases for all 21 definitions, without pretending that a few examples prove their theory.

## R06 (P3) — Replace the coarse starting-points list with exact supply contracts

**Location:** `TauCetiRoadmap/LocalFiniteGroupTheory/README.md:58`–`:84`, `:116`–`:128`. There are zero `*Needs:*` lines, no Exact supplier contracts section, and no per-layer Dependencies sections.

**Witness:** The L3 Frattini argument is attributed to a file, although its actual input is `IsPGroup.isPGroup_ker_mapQuotient_frattini` at `TauCeti/GroupTheory/Frattini.lean:128`. L2, L4 and L7 have no target-level dependency lists.

**Exact repair:** Name each pinned declaration or supplier section, with its actual hypotheses, in exact contracts; list each statement's and proof route's needs separately. For example, the L3 Frattini step consumes the finite-p-group kernel theorem and coprime-order reasoning. Frobenius-kernel nilpotency consumes the set's conjugation invariance, complement/cardinality and fixed-point-freeness lemmas named below plus Thompson's theorem; it need not import character theory. Cite CharacterTheory §8.1 as the separate owner of kernel existence, rather than saying that its current Layer 8 still plans the already pinned existence theorem.

**Repair test:** The mechanical dependency output is already clean. These changes should preserve that direction while exposing the actual inputs; on C₄, inversion fixes the Frattini quotient but is not coprime, which is why the kernel theorem's p-group hypothesis matters. The resolver's `MulEquiv.map_pCore` warning is a proposed API name, not evidence of a missing pinned supplier.

## R07 (P3) — Use the required Mathlib import

**Location:** `TauCetiRoadmap/LocalFiniteGroupTheory/Suggested.lean:1`–`:11`.

**Witness:** The supplied gate reports `imports=1 mathlib-subimports=9 no-import-mathlib=1`: nine Mathlib submodule imports and no `import Mathlib`. The two Tau Ceti modules exist and build at the pin.

**Exact repair:** Replace lines 1–9 with the single `import Mathlib`; retain only the individual Tau Ceti modules actually used. This one repair addresses all three failed import checks, including all nine subimport occurrences. Re-run the targeted build and gate.

**Repair test:** A scratch copy replacing all nine Mathlib subimports by `import Mathlib` elaborated successfully with exactly 27 `sorry` warnings. No bad theorem signature or missing pinned module is implicated by this gate failure.

## R08 (P3) — Turn undeclared API names into mathematical prose

**Location:** `TauCetiRoadmap/LocalFiniteGroupTheory/README.md:132`–`:137`.

**Witness:** The gate's five missing names are pCore_eq_bot_iff, pCore_eq_iInf_sylow, pCore_eq_iSup, pCore_eq_self_iff and pCore_le. The file declares none of them; they are presented as an API catalogue.

**Exact repair:** State the intended API facts in prose with full hypotheses and locators, without backticked declaration names absent from Suggested.lean. Apply the same rule to the other proposed core API names. Do not expand Suggested.lean with padding to satisfy the scanner. Specify whether homomorphism statements concern an image subgroup or a normal/surjective image: an unrestricted ambient-core monotonicity claim would be false.

**Repair test:** For C₂→S₃, the image of O₂(C₂) is C₂, while O₂(S₃)=1. Image-relative functoriality gives C₂ on both sides; blindly comparing with the whole codomain does not. For S₃ itself, the core/supremum/Sylow-intersection checks in the table give the intended finite-prime API values.

## R09 (P3) — Remove the unused rank definition from the acceptance test

**Location:** `TauCetiRoadmap/LocalFiniteGroupTheory/Suggested.lean:203`–`:206`.

**Witness:** pRank occurs in no theorem signature or other definition after its declaration. The signalizer theorem uses p³≤Nat.card A instead. It therefore makes no headline statable.

**Exact repair:** Delete pRank from Suggested.lean and keep its definition, finite-prime theory and Checks in the README. If a retained headline is subsequently stated using it, reassess its necessity and explicitly restrict its largest-rank interpretation to finite groups and prime p.

**Repair test:** A scratch copy deleting this declaration and applying R07 elaborated successfully with all 27 theorem signatures unchanged and only `sorry` warnings. The finite values m₂(Q₈)=1 and m₂(D₈)=2 stay in the README; on an infinite direct sum of Cₚ the Nat.sSup formula returns 0 for an unbounded set and is not a largest rank. No existing sorried theorem was found to be one-tactic padding.

## R10 (P3) — Complete the README and module form

**Location:** `TauCetiRoadmap/LocalFiniteGroupTheory/README.md:1`, `:32`, `:130`; `TauCetiRoadmap/LocalFiniteGroupTheory/Suggested.lean:13`–`:23`, `:53`.

**Witness:** The README has no Summary paragraph, How to read the build, per-layer Examples, or Downstream consumers. Twelve theorem declarations lack docstrings. The module calls itself “suggested interfaces” and describes an eventual replacement process.

**Exact repair:** Use the requested section shape, including Layer k and numbered prose subsections, and the standard “target signatures” module docstring explaining its headline role and any genuinely unstatable headline. Add mathematical docstrings to the twelve undocumented theorems (lines 53,56,91,94,97,117,120,150,156,171,176,213). Put library ownership in Scope and ownership and the exact contracts, and express prior-art relationships without transient pull-request-number/process narrative in mathematical prose or docstrings.

**Repair test:** This changes no mathematics. The documented generality must continue matching the 48 elaborated signatures; the four successful additional headline probes show that their omission cannot be explained by missing carriers.

## Verified sound

The review read the full 341-line README and 306-line Lean file at the requested head. The repository-root README and CONTRIBUTING were used because the literal parent-directory paths do not exist in this checkout. CharacterTheory and CFSGBasicProperties on main were read as shape/ownership examples. The worktree remained clean, and the requested diff outside this roadmap folder is empty. No algorithms, sorry-valued data, set_option, admitted examples, extra folder files, or foreign roadmap imports occur. The finite-group scope is general, not a restriction to convenient primes. The Mathlib prior-art policy develops the needed theory locally rather than waiting for upstream work.

**Gate and dependency evidence.** The supplied gate is FAIL solely for imports, Mathlib subimports, absent import Mathlib, and five missing README identifiers; R07 and R08 account for every reported failure. Its targeted build is passing. The requested dependency command was run against the candidate order and returned exactly:

```text
depcheck: 205 roadmaps, 1498 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. This is evidence about the declared graph, not certification of the absent per-target Needs lists. Neither LocalFiniteGroupTheory nor FiniteGroupInvariants occurs in that order; absence is not treated as a finding.

**Lean evidence.** Built only `TauCeti.GroupTheory.FrobeniusKernel` (success, 1297 jobs), then ran the requested direct Lean elaboration on the original file: success, exactly 27 sorry warnings. A scratch copy with `#check @name` for all 48 declarations was elaborated successfully and every type compared with the prose. All theorem finiteness, prime, normality, action and coprimality hypotheses survive; the action theorems retain independent carrier universes. The replacement signature genuinely allows arbitrary finite P, not just p-groups; reading the counting proof of Glauberman Theorem 3.1(a), printed pp.1106–1107, shows that this part does not use the p-group hypothesis (`glauberman-zj line 249`–264). Definitions themselves generally have unrestricted carriers; their order/rank interpretations are being used only in the finite-prime setting, with the unused rank issue recorded in R09. No repository signature was changed.

A second scratch copy tried each of the 27 admissions with closing `simp`, `rfl` and `infer_instance` branches, falling back to sorry only if none closed. It elaborated with all 27 sorry warnings remaining. Object searches at both pins found no identical theorem allowing a one-lemma exact proof; no sorried-theorem padding finding is asserted. Four further headline signature probes also elaborated, as detailed in R02. A copy with the R07 import repair and R09 rank deletion elaborated successfully with 27 sorry warnings.

**Pinned declarations opened.** Mathlib revision `6b7abb3c7686292736be2955bd3eb9ebf63b456a`; Tau Ceti revision `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. In the following paths, Mathlib/ and TauCeti/ refer to those libraries' repository roots.

| Pinned file and line | Declaration and actual content checked |
|---|---|
| `Mathlib/GroupTheory/PGroup.lean:41` | IsPGroup uses elementwise p-power annihilation; it does not itself require p prime or a finite carrier. |
| `Mathlib/GroupTheory/Sylow.lean:196` | IsPGroup.exists_le_sylow embeds a p-subgroup in a Sylow subgroup. |
| `Mathlib/GroupTheory/Sylow.lean:820` | Sylow.card_coprime_index has finite ambient group and prime p. |
| `Mathlib/GroupTheory/SchurZassenhaus.lean:39` | Subgroup.QuotientDiff uses an abelian subgroup and finite index. |
| `Mathlib/GroupTheory/SchurZassenhaus.lean:103` | Subgroup.exists_smul_eq uses abelian, normal H and coprime order/index; it is not general complement conjugacy. |
| `Mathlib/GroupTheory/SchurZassenhaus.lean:277` | Subgroup.exists_right_complement'_of_coprime is the existing existence theorem. |
| `Mathlib/GroupTheory/Transfer.lean:146` | MonoidHom.transfer is the finite-index transfer map. |
| `Mathlib/GroupTheory/Transfer.lean:246` | MonoidHom.transferSylow requires N_G(P)≤C_G(P). |
| `Mathlib/GroupTheory/Transfer.lean:279` | MonoidHom.ker_transferSylow_isComplement' proves the normal-complement conclusion with that hypothesis; cyclic Sylow alone does not imply it. |
| `Mathlib/GroupTheory/Focal.lean:56` and `:209` | Subgroup.focalSubgroup and commutator_inf_eq_focalSubgroup supply the focal theorem for finite G and Sylow P. |
| `Mathlib/GroupTheory/Nilpotent.lean:1310` | Group.isNilpotent_of_finite_tfae includes the normal-Sylow and Sylow-direct-product characterizations in the finite setting. |
| `Mathlib/GroupTheory/Frattini.lean:24` and `:58` | frattini is the maximal-subgroup intersection; frattini_nilpotent assumes Finite G. |
| `Mathlib/GroupTheory/IsSubnormal.lean:64` | Subgroup.IsSubnormal uses a finite normal chain, not arbitrary subgroup inclusion. |
| `Mathlib/GroupTheory/IsPerfect.lean:41` | Group.IsPerfect asserts equality with the derived subgroup; it does not assert nontriviality. |
| `Mathlib/GroupTheory/FixedPointFree.lean:29` | MonoidHom.FixedPointFree means every fixed element is 1, allowing the trivial carrier. |
| `Mathlib/GroupTheory/FixedPointFree.lean:68` and `:86` | The involutive fixed-point-free lemmas give commutativity and odd cardinality for finite G. |
| `Mathlib/GroupTheory/GroupAction/Defs.lean:203` | FixedPoints.subgroup is the subgroup fixed by every operator; it neither assumes faithful action nor coprimality. |
| `Mathlib/Algebra/Group/Commutator.lean:28` | Mathlib's element convention is x y x⁻¹ y⁻¹. |
| `TauCeti/GroupTheory/TrivialIntersection.lean:115` | IsTISubgroup is malnormality, tested for conjugators outside H; it is stronger than merely disjoint distinct conjugate subgroups without self-normalization. |
| `TauCeti/GroupTheory/FrobeniusKernel.lean:145` | frobeniusKernel is a set, not a subgroup or a nilpotency assertion. |
| `TauCeti/GroupTheory/FrobeniusKernel.lean:199`, `:288`, `:312` | Conjugation invariance, kernel cardinality and complement when its carrier is a subgroup are already supplied. |
| `TauCeti/GroupTheory/FrobeniusKernel.lean:358` | IsTISubgroup.conj_ne_self_of_mem_frobeniusKernel supplies freeness for nonidentity complement/kernel elements. |
| `TauCeti/GroupTheory/Frattini.lean:99`, `:118`, `:128` | The cardinal divisibility bound, its p-group consequence, and IsPGroup.isPGroup_ker_mapQuotient_frattini provide the advertised action input. |
| `TauCeti/GroupTheory/Commutator.lean:101`, `:259`, `:318` | Class-two power calculus, normalization of generated commutators, and quotient commutator criteria exist; no new owner is needed for these inputs. |

Object searches covered cores, Fitting/layer/quasisimple/Thompson/elementary-abelian/extraspecial/signalizer notions and the action operations. The pinned `TauCeti/GroupTheory/Elementary.lean:131` notion IsPElementary is a cyclic-p′ times p-group notion, not elementary abelian; it is not a duplicate of IsElementaryAbelian here. The fixedBy helper bundles one-operator fixed points as a subgroup for a headline; it is not evidence that Mathlib lacks fixed-point sets. No pinned p-core/Fitting/component/signalizer theory was located. This is a search result at these pins, not a claim about later libraries.

**Cross-roadmap and ownership audit.** The roadmap grep service was used by object, and the supplied FiniteGroupInvariants head was also read through roadmaps show. Searches covered main, the board's packages, and the supplied open-head material. The only substantive overlap found in the supplied open group-theory roadmap was R03. Other open results surfaced by the service outside the supplied checkout list were not used as review evidence or pursued. No other declaration in the supplied searchable heads uses this roadmap's fully qualified namespace.

| Citation resolved | What the present source actually supplies |
|---|---|
| `TauCetiRoadmap/RepresentationTheory/CharacterTheory/README.md:117`, `:1215` | Nilpotency of Frobenius kernels is explicitly outside its scope; §8.1 consumes the pinned kernel-existence and normal-complement API. L6 can own nilpotency here. |
| `TauCetiRoadmap/RepresentationTheory/README.md:111` | Excludes Brauer characters, decomposition matrices and blocks, while separately allowing modular Grothendieck-group induction. The present exclusion is consistent. |
| `TauCetiRoadmap/CFSGStatement/README.md:66` | Owns the classification index and carriers, not local structural theory for arbitrary finite groups. |
| `TauCetiRoadmap/CFSGBasicProperties/README.md:3`, `:36` | Owns finiteness/simplicity for the listed groups and the family comparisons. Its extraspecial groups in sporadic constructions do not replace general extraspecial theory. |
| `TauCetiRoadmap/ReductiveGroups/README.md:968` | Layer 7g treats Steinberg endomorphisms and Lang–Steinberg; the exclusion is resolved on main, not against a revision PR. |
| `TauCetiRoadmap/FiniteGroupInvariants/README.md:374`, `:439`, `:483`, `:495` | Shared Fitting, quasisimple, component and Hall ownership remains unresolved, R03. |

No supplier gap is declared. No entire existing roadmap is re-planned, so the repairable issues warrant needs changes, not rejection. LocalFiniteGroupTheory is the natural owner of general cores/local structure and nilpotency; characteristic and numerical invariants can consume those results.

**Headline inventory.** The README lists Hall's theorem; Schur–Zassenhaus conjugacy; Baer–Suzuki; Bender; Glauberman's coprime-action lemma, invariant Sylows and action identities; Thompson A×B; extraspecial structure/classification; Thompson and Glauberman replacement; Frobenius, Thompson and Glauberman–Thompson normal-complement theorems; characteristic ZJ; Thompson's fixed-point-free theorem and Frobenius-kernel nilpotency; and the solvable signalizer theorem. Most have direct signatures. The precise omissions/weakening are R02: in particular the file offers only the extraspecial cardinal formula, not the promised classification; general Glauberman's lemma is represented only by Sylow applications. No missing-carrier explanation is supplied for either. The replacement and normal-complement signatures tested in R02 need only existing subgroup operations.

**Source sample.** The supplied heading sampler provided no target identities. To make the 15-target sample reproducible, I sampled 15 of the 27 sorried theorem names in source order with Python Random seeded by the full head hash. They are starred in the table. None has an attached theorem/page locator in the README; all 15 mathematical signatures received adversarial checks. Of these 15, characteristic/normal ZJ was matched to a read primary statement, while the other fourteen were not source-certified. Independently, the read Glauberman paper supports the maximal-order J convention, the base replacement theorem and its counting argument, its stronger odd-prime replacement theorem, and the Glauberman–Thompson criterion, with the limitations concerning general p-stability in R01. These are reconstructed locators, not locators supplied by the PR.

**Adversarial pass.** There are 118 rows below: all 48 Lean declarations and 70 further prose assertions/conventions. The rows include the 15 sampled targets, every headline, and every mathematical finding witness. Most are hand computations on explicit small groups; the SL₃(3) witness was additionally enumerated. These do not replace proofs or the unread source checks.


The computations below test statements, not their proofs. “Pass” means these instances agree; it does not certify an unread source. Write D₈ for the dihedral group of order 8, Eₚʳ for Cₚʳ, and H₂₇ for the upper-unitriangular 3×3 matrices over 𝔽₃. In S₃ write r=(123), s=(12). A star marks one of the 15 independently seeded targets. README-only assertions follow the 48 Lean declarations in source order.

| Statement (README layer; Suggested.lean line where applicable) | Instances and computed values on both sides | Result; change |
|---|---|---|
| pCore, L1, 38 | S₃: intersection of the three Sylow 2-subgroups is 1; unique Sylow 3-subgroup is C₃. C₆: cores have orders 2 and 3. Trivial group: order 1. | Pass at prime parameters. |
| IsPiSubgroup, L1, 42 | C₆ has prime support {2,3}: π={2} gives false, π={2,3} gives true; group 1 has empty support and satisfies π=∅. | Pass. |
| piCore, L1, 46 | S₃: O_{∅}=1, O_{ {2} }=1, O_{ {3} }=C₃, O_{ {2,3} }=S₃. Normal π-subgroups generate exactly those groups. | Pass. |
| pPrimeCore, L1, 50 | S₃: O_{2′}=C₃, O_{3′}=1; C₆: O_{2′}=C₃, O_{3′}=C₂. | Pass. |
| ★ isPiSubgroup_piCore, L1, 53 | S₃, π={2}: support of core 1 is ∅⊆{2}; π={3}: support of core C₃ is {3}⊆{3}. | Pass. |
| ★ piCore_singleton, L1, 56 | S₃, p=2: both sides 1; p=3: both sides C₃; group 1: both sides 1. | Pass. |
| IsHallSubgroup, L1, 60 | S₃: C₂ has order 2, index 3 and is Hall {2}; C₃ has order 3, index 2 and is Hall {3}; C₂ is not Hall {3}. π=∅ selects 1; all primes select G. | Pass both conditions. |
| exists_isHallSubgroup, L1, 64 | S₃ supplies 1,C₂,C₃,S₃ for ∅,{2},{3},{2,3}. In A₅ a Hall {2,5} would have order 20 and index 3; none exists, and solvability is false. | Pass; hypothesis discriminates. |
| exists_conj_eq_of_isHallSubgroup, L1, 68 | S₃: conjugation by r sends ⟨(12)⟩ to ⟨(23)⟩; both orders 2, index 3. Hall {3} is uniquely C₃. | Pass. |
| ★ exists_conj_eq_of_isComplement', L1, 73 | N=C₃ in S₃: gcd(3,2)=1; three complements C₂, conjugate under C₃. N=G: unique complement 1; N=1: unique complement G. | Pass. |
| ★ mem_pCore_of_forall_isPGroup_closure, L1, 79 | x=r,p=3: every generated pair lies in C₃ and r∈O₃. x=s,p=2: choosing a distinct conjugate generates S₃ of order 6, so premise false and s∉O₂=1. x=1: generated orders 1, membership true. | Pass, including reverse direction in prose. |
| fitting, L2, 88 | F(S₃)=C₃, F(D₈)=D₈, F(A₅)=1. The joins of normal nilpotent subgroups have these orders 3,8,1. | Pass. |
| isNilpotent_fitting, L2, 91 | Nilpotency classes of those three Fitting subgroups are 1,2,0, respectively. | Pass. |
| fitting_eq_iSup_pCore, L2, 94 | S₃: O₂∨O₃=1∨C₃=C₃=F; C₆: C₂∨C₃=C₆=F; D₈: O₂=D₈=F. | Pass. |
| ★ centralizer_fitting_le, L2, 97 | S₃: C_G(C₃)=C₃, orders 3≤3. D₈: C_G(D₈)=C₂, orders 2≤8. A₅ without solvability: C_G(1)=A₅ has order 60>1. | Pass with solvability. |
| IsQuasisimple, L2, 101 | A₅: perfect, central quotient A₅ simple ⇒ true. SL₂(5): perfect, quotient A₅ ⇒ true. C₃: quotient by center is 1 ⇒ false. Group 1: perfect but quotient not simple ⇒ false. | Pass; perfect alone does not suffice. |
| IsComponentOf, L2, 106 | In A₅×A₅ each factor is normal and quasisimple, hence a component. The diagonal A₅ is quasisimple but not subnormal, hence not a component. 1 is never quasisimple. | Pass. |
| layer, L2, 110 | E(S₃)=1, E(A₅)=A₅, E(A₅×A₅)=A₅×A₅, orders 1,60,3600. | Pass. |
| generalizedFitting, L2, 114 | S₃: C₃∨1=C₃. A₅: 1∨A₅=A₅. SL₂(5): C₂∨SL₂(5)=SL₂(5). | Pass. |
| ★ commutator_eq_bot_of_isComponentOf, L2, 117 | Two factors of A₅×A₅: commutator order 1. Taking K=L=A₅ gives commutator order 60; excluded by K≠L. | Pass. |
| commutator_fitting_layer, L2, 120 | SL₂(5): [C₂,SL₂(5)]=1; A₅×C₃: [C₃,A₅]=1. | Pass. |
| centralizer_generalizedFitting_le, L2, 124 | S₃: orders 3≤3; A₅: 1≤60; SL₂(5): 2≤120; group 1: 1≤1. | Pass. |
| fixedBy, L3, 134 | C₂ inversion on C₃: identity operator fixes 3 elements; nonidentity operator fixes only 1. Trivial action fixes all 3. | Pass. |
| commutatorAct, L3, 145 | Inversion on C₃: r⁻¹·r⁻¹=r, so generated group C₃. Trivial action gives generators 1 and subgroup 1. K=1 gives 1. | Pass. |
| ★ exists_sylow_smul_eq, L3, 150 | C₃ cycles i,j,k on Q₈: gcd(3,8)=1; unique Sylow 2-subgroup Q₈ invariant. Trivial C₅ action on S₃: all three Sylow 2-subgroups invariant. | Pass. |
| ★ exists_mem_fixedPoints_conj_eq, L3, 156 | Trivial C₅ action on S₃: C_G(A)=S₃ and r conjugates ⟨(12)⟩ to ⟨(23)⟩. On Q₈ there is only one Sylow 2-subgroup; c=1 works. | Pass. |
| exists_mem_fixedPoints_mul_of_forall_mem, L3, 164 | C₃ acting on Q₈, N=Z(Q₈): quotient C₂² has exactly one fixed coset; its two lifts ±1 are fixed. Inversion on C₃, N=G: any g=1·g. N=1: fixed coset already fixed element. | Pass. |
| ★ fixedPoints_sup_commutatorAct, L3, 171 | Inversion on C₃: 1∨C₃=C₃. Order-3 action on Q₈: fixed subgroup C₂, commutator subgroup Q₈, join Q₈. Trivial action: G∨1=G. | Pass. |
| commutatorAct_commutatorAct, L3, 176 | Inversion on C₃: [C₃,C₂]=C₃ on both sides; order-3 action on Q₈: Q₈ on both sides; trivial action: 1=1. | Pass. |
| ★ iSup_fixedBy_eq_top, L3, 183 | A=C₂² acts by independent coordinate signs on C₃². Three nonidentity operators have fixed subgroup orders 3,3,1; the first two axes generate order 9=|G|. Cyclic inversion has only order-1 fixed subgroup and fails noncyclicity. | Pass. |
| ★ eq_of_fixedPoints_le_of_isPGroup, L3, 189 | P=𝔽₃², B=C₃ acts by T=[[1,1],[0,1]], A=C₂ acts trivially: C_P(B) has order 3, A fixes all 9. Replacing A by −I preserves commutation but moves the two nonzero fixed vectors, so htriv fails. | Pass. |
| IsElementaryAbelian, L4, 200 | C₃²: exponent 3, commutative ⇒ true. C₉: generator cubed ≠1 ⇒ false. Q₈: noncommutative ⇒ false. Group 1: true. Junk p=1 admits only 1; p=0 admits every abelian group. | Pass on intended primes; do not use junk parameters in finite-p-group claims. |
| pRank, L4, 205 | m₂(Q₈)=1; m₂(D₈)=2; m₃(C₉)=1; mₚ(1)=0. At p=1 and G=1 the set of k is unbounded and Nat.sSup gives 0, not a largest exponent. | Finite-prime meaning sound; unused definition R09. |
| IsExtraspecial, L4, 210 | D₈ and Q₈: center, derived and Frattini subgroups all C₂, so true. C₈: center has order 8≠2, false. H₂₇: all three distinguished subgroups C₃, true. Group 1 fails center order p. | Pass. |
| exists_card_eq_of_isExtraspecial, L4, 213 | D₈,Q₈: 8=2³ with n=1. H₂₇: 27=3³ with n=1. n=0 would give p and an abelian group, whose derived subgroup has order 1≠p. | Pass. |
| maxOrderAbelianSubgroups, L4, 217 | D₈: maximum order 4, achieved by C₄ and two V₄ subgroups; Q₈: three cyclic order-4 subgroups; group 1: maximum 1. | Pass; maximal-by-inclusion is not the defining condition. |
| thompsonSubgroup, L4, 222 | J(D₈)=D₈, J(Q₈)=Q₈, J(C₉)=C₉, J(1)=1. In Q₈ the subgroup generated by elementary abelian subgroups would instead be C₂. | Pass; order/rank distinction discriminated. |
| sup_mem_maxOrderAbelianSubgroups, L4, 226 | P=D₈,A=⟨r⟩,x=s: M=⟨r²⟩ has order 2, C_A(M)=A has order 4, replacement=A has maximal order 4. P=S₃,A=C₃,x=s: M=C₃, replacement=C₃ has order 3. x=1: M=1, replacement=A. | Pass, including a non-p-group instance. |
| HasNormalPComplement, L5, 237 | S₃: p=2 has normal complement C₃, p=3 has none; C₆: complements C₃ and C₂; p=5 in S₃: Sylow=1, complement=G; group 1: complement=1. | Pass. |
| ★ hasNormalPComplement_of_forall_isPGroup, L5, 241 | S₃,p=2: each nontrivial 2-subgroup has normalizer C₂ and complement 1; G has complement C₃. p=3: Q=C₃ has normalizer S₃ without normal 3-complement, matching false conclusion. p=5: no nontrivial Q, and G itself is complement. | Pass; empty premise is legitimate here. |
| IsPStable, L5, 250 | G=SL₃(3): O₃(G)=O_{3′}(G)=1, so the roadmap condition tests only P=1 and is true. Source test in its maximal parabolic M: |P|=9, |M|=432, |C_M(P)|=9; a unipotent x has [P,x,x]=1 but nontrivial image outside O₃(M/C_M(P))=1. | FAIL as the general named notion; R01. |
| ★ normal_center_thompsonSubgroup, L5, 258 | H₂₇: O₃=G, C_G(O₃)=Z of order 3≤27; J=G, ZJ=Z is characteristic. S₄,p=2: O₂=V₄ self-centralizing, ZJ of a Sylow D₈ has order 2 and three conjugates; oddness excludes it. | Pass on tested hypotheses; stronger characteristic headline missing, R02. |
| hasNormalPComplement_of_normalizer_center_thompsonSubgroup, L5, 265 | C₆,p=3: J=C₃, N_G(ZJ)=C₆, both normal complements C₂. S₃,p=3: N_G(ZJ)=S₃, both assertions false. | Pass. |
| ★ isNilpotent_of_fixedPointFree, L6, 276 | C₃ inversion: automorphism order 2, fixed subgroup order 1, nilpotency class 1. Q₈ order-3 automorphism fixes ±1, so fixed-point-free fails. On group 1 the only automorphism has order 1, so prime-order premise fails. | Pass. |
| ★ isNilpotent_of_coe_eq_frobeniusKernel, L6, 281 | S₃,H=C₂: kernel={1,r,r²}=C₃, class 1. A₄,H=C₃: kernel=V₄, class 1. H=1 in S₃: kernel=G nonnilpotent, excluded by hbot. | Pass. |
| IsSignalizerFunctor, L7, 288 | G=C₂³×C₃, A=C₂³, θ(a)=C₃ for a≠1: orders coprime, centralizer inclusion, normalization and balance all hold. Setting θ(a)=C₃, θ(b)=1 for distinct nonidentity a,b violates balance: 3≰1. | Pass; the zero family also satisfies the definition. |
| signalizerCompletion, L7, 295 | Same family: join=C₃ of order 3. Zero family: join=1. A=1: empty indexed join=1, regardless of θ(1). | Pass; identity value is ignored. |
| signalizerCompletion_complete, L7, 299 | Same family: 2³=8≤8, gcd(2,3)=1, C₃ solvable, each centralizer intersection=C₃=θ(a). Zero family gives gcd(2,1)=1 and all intersections=1. Rank 2 gives 4<8 and is excluded. | Pass on examples; full source unread. |
| Relative p-core/subtype convention, README 88–92 | H=C₃≤S₃: image of O₃(H)=H equals relative pCore 3 H; O₂(H)=1 maps to relative core 1. | Pass. |
| Relative π-core/subtype convention, README 88–94 | H=C₃≤S₃, π={3}: both constructions H; π={2}: both 1. | Pass. |
| Relative p′-core convention, README 88–94 | H=C₃≤S₃: p=2 yields H on both sides; p=3 yields 1 on both sides. | Pass. |
| Relative Fitting convention, README 88–92 | H=C₂≤S₃: F(H)=C₂ maps to relative fitting H=C₂, whereas F(S₃)∩H=1. | Pass; normality is needed for the separate intersection theorem. |
| Relative layer convention, README 88–92 | H=A₅×1≤A₅×A₅: intrinsic and ambient relative layer both H; H=C₃ gives 1 on both sides. | Pass. |
| Relative generalized Fitting convention, README 88–92 | H=C₂≤S₃: both F*(H) images equal C₂, although F*(S₃)∩H=1. | Pass. |
| Relative core containment API, README 132–135 | H=C₃≤S₃,p=3: core order 3≤|H|=3; p=2: 1≤3. H=1: 1≤1. | Pass for intended containment; API names need prose, R08. |
| Relative core normality/characteristic API, README 133 | C₆: unique order-2 and order-3 subgroups are fixed by both automorphisms. S₃: O₂=1 and O₃=C₃ are normal and characteristic. | Pass. |
| Relative core universal property, README 134 | S₃: its normal 3-subgroups are 1,C₃, both ≤O₃=C₃; only normal 2-subgroup is 1=O₂. | Pass. |
| Core supremum versus Sylow intersection, README 134 | S₃,p=2: join of normal 2-subgroups=1=intersection of three Sylows. p=3: both C₃. | Pass. |
| Core homomorphism API, README 136–137 | Projection C₆→C₃ at p=3 sends O₃ isomorphically to C₃. Inclusion C₂→S₃ sends O₂(C₂) to C₂, which is NOT ≤O₂(S₃)=1. | Image-relative or normal-image hypotheses must be explicit; names alone cannot certify the map statement, R08. |
| π-core radical quotient, README 141 | S₃,π={3}: quotient C₂ has O₃=1. π={2}: quotient remains S₃ and O₂=1. π=all: quotient=1. | Pass. |
| π-core intersection with normal subgroup, README 141 | N=C₃⊴S₃: π={3} gives C₃=C₃∩C₃; π={2} gives 1=1∩C₃. Non-normal C₂ instead gives C₂≠O₂(S₃)∩C₂=1. | Pass with normality. |
| Hall containment, README 143–144 | S₃,π={2}: each C₂ is its own containing Hall subgroup. π={2,3}: G contains all subgroups; π=∅: only 1 occurs. | Pass; statable missing target R02. |
| Fitting characteristic/universal property, README 159–160 | S₃: normal nilpotent subgroups 1,C₃ lie in characteristic C₃. D₈: every subgroup lies in F=G. | Pass. |
| Fitting Sylow direct product, README 161–162 | C₆: orders 2·3=6 and C₂∩C₃=1. S₃: F=C₃ has just the nontrivial Sylow 3-factor. | Pass. |
| Fitting intersection, README 162 | N=V₄⊴A₄: F(N)=V₄=F(A₄)∩N. N=C₂≤S₃ non-normal: F(N)=C₂≠1=F(S₃)∩N. | Pass with normality. |
| Frattini below Fitting, README 163 | Q₈: Φ=C₂≤F=Q₈. S₃: Φ=1≤C₃. | Pass. |
| Fitting modulo Frattini, README 163 | Q₈/Φ=V₄: F quotient=V₄=image Q₈. S₃/1=S₃: both sides C₃. | Pass. |
| Quasisimple proper normal subgroups central, README 168–169 | SL₂(5): proper normal subgroups 1,C₂, both central; A₅: only proper normal subgroup 1. | Pass. |
| Quasisimple quotient by proper normal subgroup, README 168 | SL₂(5)/C₂=A₅, still quasisimple; quotient by whole group is 1, not quasisimple, and excluded. | Pass. |
| Components through subnormal chains, README 170 | In (A₅×A₅)×C₂, K=first A₅ factor is normal in N=A₅×A₅, N normal in G, and K is a component in both. Orders K=60,N=3600,G=7200. | Pass. |
| Components inherited by normal subgroups containing them, README 170–171 | Same K,N: K≤N and both component predicates true; N=C₂ fails containment and has no component. | Pass. |
| Component lies in or centralizes subnormal N, README 173 | G=A₅×A₅,K=first factor: N=K gives containment; N=second factor gives [K,N]=1 with neither containment. | Pass both alternatives. |
| Conjugation permutes components, README 174 | G=(A₅×A₅)⋊C₂ with swapping action: nonidentity C₂ interchanges the two components of order 60. | Pass. |
| Components normalize subnormal subgroups, README 174–175 | G=A₅×A₅: each component normalizes itself and centralizes the other; both normalizers are G. | Pass. |
| Layer perfect, README 177–178 | E(S₃)=1 with derived group 1; E(A₅×A₅)=G with derived group G. | Pass. |
| Layer modulo center as product, README 178 | SL₂(5): |E/Z(E)|=120/2=60=|A₅|. Two A₅ factors: quotient order 3600=60·60. | Pass. |
| Solvable F*=F, README 182 | S₃: both C₃; D₈: both D₈. A₅: F*=A₅≠1=F, outside solvability. | Pass. |
| Quasisimple F*=G, README 182 | A₅: both order 60; SL₂(5): both order 120. | Pass. |
| C_G(F*)=Z(F), README 183 | S₃: both C₃; A₅: both 1; SL₂(5): both C₂. | Pass. |
| General Glauberman fixed-point lemma, README 192–193 | G=C₃ acts regularly on Ω=C₃, A=C₂ acts by inversion: Ωᴬ={1}, C_G(A)=1, one orbit. Trivial A action: Ωᴬ=Ω has 3 points and C_G(A)=G acts transitively. | Pass with nonempty transitive Ω; compatibility and nonemptiness should be explicit. |
| Fixed-point quotient image identity, README 194–196 | C₃ acts on Q₈, N=Z: C_{G/N}(A)=1=image(C₂). Trivial action on S₃,N=C₃: C_{G/N}(A)=C₂=image(S₃). | Pass. |
| Product, rather than merely join, in G=C_G(A)[G,A], README 197 | Q₈,C₃-action: product has size 2·8/2=8. C₃,C₂-inversion: product size 1·3=3. | Pass. |
| Abelian coprime direct product, README 199 | C₂ inverts first coordinate of C₃² and fixes second: fixed axis and commutator axis each order 3, intersection 1, product order 9. | Pass. |
| Trivial action on Frattini quotient implies trivial action, README 203–204 | C₄: inversion fixes C₄/Φ=C₂ but has order 2, not coprime to p=2. For coprime C₃ action on C₄ the action is trivial, fixing all 4 points. | Pass; coprimality necessary. |
| Frattini quotient elementary abelian, README 214 | Q₈/Φ=V₄ has exponent 2, C₉/Φ=C₃ has exponent 3, group 1 quotient=1. | Pass. |
| Elementary abelian vector-space identification, README 215 | C₃² corresponds to dimension 2 over 𝔽₃, order 3²=9. C₉ has order 9 but exponent 9, so no such dimension-2 additive identification. | Pass. |
| Index-p subgroups are hyperplanes, README 216 | C₃² has four order-3/index-3 lines, matching (3²−1)/(3−1)=4. Rank 0 has no index-p subgroup and no codimension-1 subspace. | Pass. |
| p-rank monotonicity, README 216–217 | C₂≤Q₈: 1≤1; C₂≤D₈: 1≤2; 1≤D₈: 0≤2. | Pass. |
| p-rank on Sylow subgroup, README 217 | m₂(S₃)=1=m₂(C₂); m₃(S₃)=1=m₃(C₃); m₂(A₄)=2=m₂(V₄). | Pass. |
| Rank-one p-group classification, README 217–218 | C₉ rank 1 and cyclic; Q₈ rank 1 and generalized quaternion; D₈ rank 2; C₃² rank 2. Group 1 rank 0. | Pass. |
| Extraspecial commutator form, README 221–222 | H₂₇/Z≈𝔽₃²: basis commutator is z, alternating matrix [[0,1],[−1,0]], determinant 1. D₈/Z over 𝔽₂ gives [[0,1],[1,0]], determinant 1. Zero form has determinant 0 and fails. | Pass. |
| Extraspecial central product decomposition, README 222–223 | D₈*D₈ has order 8·8/2=32=2⁵; H₂₇*H₂₇ has order 27·27/3=243=3⁵. Each has n=2. | Pass on models. |
| Exactly two extraspecial isomorphism classes, README 223–226 | p=2,n=1: D₈ has 5 involutions, Q₈ has 1. p=3,n=1: H₂₇ exponent 3, the nonabelian modular order-27 group exponent 9. n=0 gives no extraspecial group. | Pass on first case; full classification source unread and headline absent. |
| Extraspecial 2-group parity, README 224–225 | D₈*D₈ and Q₈*Q₈ have 19 nonidentity involutions; D₈*Q₈ has 11. Even/odd quaternion-factor parity distinguishes the two types. | Pass. |
| Extraspecial odd-p exponent distinction, README 225–226 | At p=3,n=1: exponents 3 and 9, so the two types cannot be isomorphic. | Pass; not a classification proof. |
| J(P) characteristic, README 228 | Automorphisms permute the three maximal abelian subgroups of Q₈, whose join is Q₈. For C₉ the sole maximal-order abelian subgroup is C₉. | Pass. |
| J(P)≤Q≤P implies J(Q)=J(P), README 229 | P=C₉: J(P)=P forces Q=P, both C₉. P=D₈: same implication forces Q=D₈. | Pass boundary instances; source Lemma 3.5(b) supplies general assertion. |
| Every maximal-order abelian A contains Z(P), README 229 | Q₈: every C₄ contains {±1}; D₈: all three order-4 abelian subgroups contain {1,r²}. | Pass. |
| Z(P)≤Z(J(P)), README 230 | Q₈ and D₈: both sides their order-2 centers. C₉: both sides C₉. | Pass. |
| Odd-prime Glauberman replacement, README 234–236 | P=H₂₇,B=P: class 2, B′=Z(J)=C₃; each maximal abelian A has order 9<27 and index 3, hence N_P(A)=P. P=C₉,B=C₃: every A is P and contains B. | Pass both alternatives; omitted headline R02. |
| Normal complements inherited by subgroups, README 240 | S₃,p=2,N=C₃: intersections with C₂ and C₃ are 1 and C₃, the respective normal complements. | Pass. |
| Normal complements inherited by quotients, README 240 | S₃/C₃=C₂,p=2: image of N is 1, the normal complement. C₆/C₂=C₃,p=2: image of N=C₃ is whole quotient. | Pass. |
| Complement equals O_{p′} and is unique, README 240 | S₃,p=2: only normal complement C₃=O_{2′}; C₆,p=3: C₂=O_{3′}. | Pass. |
| Burnside comparison, README 241 | S₃,p=2: N(C₂)=C(C₂)=C₂, complement C₃. S₃,p=3: N(C₃)=S₃ but C(C₃)=C₃, and no normal 3-complement. | Pass with normalizer-centralizer condition; cyclicity alone is insufficient. |
| Frobenius converse via normalizers, README 242–244 | S₃,p=2: both assertions true (normalizers C₂); p=3: both false (normalizer S₃). | Pass in both directions. |
| Frobenius automizer criterion, README 243–244 | S₃,p=2: N(C₂)/C(C₂)=1 is a 2-group. p=3: N(C₃)/C(C₃)=C₂ is not a 3-group. Q=1 gives quotient 1. | Pass in both directions. |
| Quotient-free p-stability clause, README 247–250 | H₂₇: N(P)/C(P) is always a 3-group; take K=N(P). For parabolic M of SL₃(3), P=C₃²: quadratic x projects to order 3 in GL₂(3), but its normal closure there is SL₂(3), order 24, not a 3-group. | Quotient and normal-closure formulations agree; failure is the omitted general extension, R01. |
| Characteristic ZJ, README 251–253 | H₂₇: ZJ=Z=P′=Φ has order 3 and is characteristic. C₉: ZJ=C₉. | Pass on instances and source Theorem A; missing stronger signature R02. |
| Thompson normal p-complement theorem, README 257–258 | C₆,p=3: N(J(S))=C₆ and C_G(Z(S))=C₆ have complements C₂, as does G. S₃,p=3: N(J(S))=S₃ fails the premise; conclusion also false. | Pass; omitted headline R02. |
| Fixed-point-free automorphism groups, README 268–270 | A=C₂ inverts C₃: only nonidentity operator fixes 1 point, G class 1. Trivial action of C₂ fixes 3 points and fails hypothesis. G=1 is nilpotent directly, whether or not the action is faithful. | Pass. |
| Prime-order conjugation on Frobenius kernel, README 274 | S₃,H=C₂,N=C₃: conjugation sends r→r⁻¹, order 2, only fixed point 1. A₄,H=C₃,N=V₄: order-3 cycle on three nonidentity elements, again only fixed point 1. | Pass; pinned freeness lemma available. |
| Completion normalized by A, README 284–285 | C₂³×C₃ with constant nonidentity value C₃: completion C₃, normalizer=G, so A≤normalizer. Zero family gives completion 1, again normalizer=G. | Pass. |
| Completion maximality for noncyclic A, README 285–287 | C₂² acts diagonally on C₃²; θ(a) are the fixed axes/1, completion C₃². Y either axis has fixed-point intersections included in θ and lies in the order-9 completion. Replacing θ by zero fails the order-3 fixed-axis inclusion. | Pass. |
| Signalizer rank convention, README 288–291 | For A=C₂³, m₂(A)=3 and 2³≤8; for C₂², m₂=2 and 8≤4 is false; for A=1 both conditions are false. | Pass: cardinal bound equals rank condition for elementary abelian A. |
| Commutator convention, README 106–107 | With r=(123),s=(12), Mathlib r s r⁻¹ s⁻¹=r⁻¹; source r⁻¹ s⁻¹ r s=r. Both generate C₃. In Q₈, [i,j]=−1 in both conventions. | Subgroup identities agree; add explicit convention Check, R05. |
| External action commutator convention, README 96–101 | C₂ inversion on C₃: r⁻¹(s•r)=r, whereas [r,s]=r⁻¹ in S₃. Generated subgroups both C₃; individual generators differ. | Pass; distinguish element formula from subgroup identity. |
| Finite/group/rank boundary conventions, README 56, 93, 102, 113 | Group 1 has order 1, gcd(1,n)=1, trivial cores and empty component family. No empty group exists. E₃⁰,E₃¹,E₃² have orders 1,3,9 and ranks 0,1,2. Infinite direct sum of Cₚ has all finite ranks and Nat.sSup=0. | Finite hypotheses retained by theorems; pRank's unrestricted signature is not a largest-rank assertion. |
| Universes, README 113–114 | All 48 elaborated signatures use universe parameters; G:Type u and A:Type v survive in action theorems, with no equation u=v imposed. | Pass; no universe restriction silently introduced. |


## Not verifiable

The review is complete with the following explicit source limits; it is not parked for missing text. All eight bibliography works and six linked code/prior-art sources were attempted through the sources service. No source manifest existed to supply earlier waivers, verified locators, or a worker-seeded target list. The five still-missing mathematical works are recorded once each in the scratch reference request. No source text was copied into the repository or this report.

| Source key / item | Where checked and result |
|---|---|
| aschbacher — Finite Group Theory, 2nd ed. (2000) | Source service reached the Cambridge book landing page, DOI 10.1017/CBO9781139175319; no readable legal full text obtained. README has no theorem/page locators. |
| gorenstein — Finite Groups (1968/1980) | Source service bibliographic lookup found no legal full text. No local text was listed in the brief. Textbook assertions throughout L1–L6 remain unverified against it. |
| isaacs — Finite Group Theory (2008) | AMS landing page, DOI 10.1090/gsm/092; no readable text obtained. An initial title-based lookup conflated this with Aschbacher; the explicit DOI was used to keep the works separate. |
| kurzweil-stellmacher — The Theory of Finite Groups (2004) | Source service reported the Springer work uncertified/paywalled. Not added to the missing-text request. No statement-level locator supplied by the README. |
| alperin-lyons — On conjugacy classes of p-elements (1971), pp.536–537 | Source service reported the Elsevier work uncertified/paywalled. The actual counting argument was not read; Baer–Suzuki's hypotheses were checked mathematically, not certified from this paper. Not added to the missing-text request. |
| glauberman-zj — A characteristic subgroup of a p-stable group (1968) | Publisher open PDF read. Reconstructed locators and source lines are recorded in R01/R04 and below. The README's weaker replacement alternative was not located verbatim; the paper states the stronger replacement theorem with explicit intersection improvement. |
| glauberman-signalizer — On solvable signalizer functors in finite groups (1976) | Verified bibliographic identity against [the publisher](https://londmathsoc.onlinelibrary.wiley.com/doi/10.1112/plms/s3-33.1.1) and the author's institutional bibliography. Explicit DOI fetch returned HTTP 403. Initial title lookup instead resolved an Elsevier work, which was rejected as the wrong text. No full theorem/proof verification. |
| thompson — Finite groups with fixed-point-free automorphisms of prime order (1959), pp.578–581 | PNAS DOI request returned HTTP 403. PMC returned a download interstitial rather than the paper (`thompson line 5`); Europe PMC also returned HTTP 403. A service “fetched” status was not counted as reading the theorem. |
| axiom-cfsg — AxiomMath/CFSG at the cited commit | Repository page fetched legally. Its proof-status claim appears at `axiom-cfsg line 322`, but the named milestone proof files and their transitive dependencies were not checked; machine-checked provenance is not certified here. |
| qiuzhen-cfsg — Qiuzhen-CFSG/CFSG | Author repository page fetched; Apache-2.0 label at `qiuzhen-cfsg line 185`. The cited replacement/p-stability/fixed-point-free proof files were not obtained and checked individually. |
| mathlib-pcore-39771 | Author-hosted proposal page read, `mathlib-pcore-39771 line 215`–219. It now describes a supremum-based core and a Sylow-comparison theorem, not an intersection as its defining body. The roadmap's finite-prime formula agrees mathematically; the claimed exact prior-art shape needs updating. This is not a pinned declaration. |
| mathlib-pcore-40036 | Proposal page read, `mathlib-pcore-40036 line 215`–217: group-level largest normal p-subgroup and comparison with Sylows. No imported declaration at the pin is inferred from the proposal. |
| mathlib-frattini-35603 | Proposal page read, `mathlib-frattini-35603 line 219`–225: finite p-group Frattini quotient and elementary-abelian statements. The proposed proofs were not audited. |
| lean-eval-baer-suzuki | Problem page read, `lean-eval-baer-suzuki line 205`–207: Baer–Suzuki as a target using a supremum core. A problem statement is not proof or source certification of the theorem. |

For the read primary source, these are the exact reconstructed matches: maximal-order J at `glauberman-zj line 134`–143 (p.1104); local and general p-stability at lines 146–160 (p.1104); characteristic ZJ and normal-complement criterion at lines 183–196 (p.1105); Thompson replacement at lines 242–264 (pp.1106–1107); the strengthened replacement at lines 426–429 (p.1111); the double-commutator corollary at lines 502–505 (p.1113). The source's element-commutator convention at lines 78–84 (p.1102) was compared with Mathlib using the S₃ witness. No unread textbook result, inaccessible paper, or external formalization is marked source-verified.

## Source issues

- none
