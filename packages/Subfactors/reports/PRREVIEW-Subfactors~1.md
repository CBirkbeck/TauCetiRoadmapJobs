# Review of Subfactors (pull request #874 at 6e29691)

**Verdict:** needs changes

AI-assisted independent review of the two roadmap files at the specified head. No pull-request files were changed. The supplied push gate passes, and direct Lean elaboration passes. The blocking findings concern supply direction, generality and the acceptance-test contract; a successful `sorry` build does not resolve them.

## R01 (P1) — Break the operator-algebra supplier cycle

**Location:** `TauCetiRoadmap/Subfactors/README.md:49`: “TemperleyLiebOperatorAlgebras A1–A5 … supplies … the independent Hermitian trace-positivity theorem.”

**Claim:** Subfactors can consume this roadmap while CategoricalOperatorAlgebras remains downstream.

**Witness:** `TemperleyLiebOperatorAlgebras/README.md:92` consumes CategoricalOperatorAlgebras CA1a/CA2a; `CategoricalOperatorAlgebras/README.md:60` consumes Subfactors S1–S2/S5–S9. Thus Subfactors → TemperleyLiebOperatorAlgebras → CategoricalOperatorAlgebras → Subfactors is a directed supplier cycle.

Paths in the witness are under `TauCetiRoadmap/`; both companion files were read at their supplied open heads. Their separation into independent sections does not give the required single direction between roadmap folders. The merge order places the three folders at 248, 259 and 258 respectively. The mechanical check missed these prose edges: its exact output is recorded below.

**Repair:** Move the elementary C*-category and unitary-duality interfaces currently owned by CategoricalOperatorAlgebras CA1a/CA2a to an earlier foundations owner, and make both analytic TL A6 and CategoricalOperatorAlgebras consume that owner. Delete the duplicate ownership from CA1a/CA2a. The resulting direction is foundations → analytic TL → Subfactors → CategoricalOperatorAlgebras, and the latter can still consume TL A3–A6. Check the other suppliers when assigning the new owner's position. This breaks the displayed cycle without weakening positivity or assuming the index theorem in its proof. Merely splitting TL after A5 would not suffice: CategoricalOperatorAlgebras also consumes A6.

## R02 (P2) — Resolve the upward Hilbert-module supplier

**Location:** `TauCetiRoadmap/Subfactors/README.md:56`: “HilbertModules H1–H3 … supplies the C*-module tensor products and compact-operator comparisons”.

**Claim:** H1–H3 are available below S1 and S8.

**Witness:** The supplied merge order puts Subfactors at 248 and HilbertModules at 261. HilbertModules is absent from the supplied main tree; H3 at its open head, `TauCetiRoadmap/HilbertModules/README.md:228`, owns the consumed interior tensor product.

**Repair:** After breaking R01, arrange the supply order so HilbertModules precedes Subfactors, with the dependency explicitly recorded in the supplier contracts. A correct `moved:` result placing Subfactors after its suppliers resolves this edge. If the existing Subfactors position must be retained, move H1–H3's ownership to an earlier supplier instead; do not duplicate their theory in S1. In the test E=A, tensoring with L²(A) must still give L²(A), retaining H3's completion and opposite-action contract. The supplied command produced no `moved:` line, so it has not accounted for this prose edge.

## R03 (P2) — Remove the blanket separable-predual restriction from the basic theory

**Location:** `TauCetiRoadmap/Subfactors/README.md:14`: “Unless a milestone explicitly states otherwise, N⊆M are unital inclusions of II₁ factors with separable predual”.

**Claim:** This is the general scope of the index, finite-basis, tower and TL restriction library.

**Witness:** Let A be the tracial infinite tensor product of M₂ over an uncountable set. A⊂A⊗M₂ has index 4 and a four-element basis √2·Eᵢⱼ, but the standing assumption excludes it.

The supplier already provides unrestricted index and restriction of scalars: `TauCetiRoadmap/VonNeumannAlgebras/README.md:1177`–1207, V7.Index. The finite tower and TL relations do not require separable predual. By contrast, the classification and countable approximation arguments really do use separability. The sampled Anantharaman–Popa chapter explicitly restricts its exposition to separable modules (`ap` lines 5597–5603); that chapter alone is not evidence for the wider theorem, so the unrestricted supplier contract must be used.

**Repair:** State the basic finite-index inclusion/tower theory for arbitrary II₁ factors and normal representations. Retain explicit separability assumptions on the hyperfinite completeness and countable construction targets that need them, and name any extra general-form proof inputs. Add the displayed uncountable amplification as a Check: index 4, basis sum 4·1, Jones-projection trace 1/4. Do not turn it into a new Lean boundary-case theorem.

## R04 (P2) — Replace prototype substitutes with a headline acceptance test

**Location:** `TauCetiRoadmap/Subfactors/Suggested.lean:8`: “These are suggested forms”; also lines 24–130 and 137–196.

**Claim:** The file tests the roadmap's delivered mathematics.

**Witness:** All-zero projections satisfy `JonesProjectionFamily d n` for every d, including d=1/2. With τ=0, `relativeEntropyCandidate` is 0 for every positive E. Neither object establishes a subfactor index or inclusion entropy theorem.

These are not allegations that the admitted algebraic identities are false. They show that the file's four admissions are scaling/star compatibility for arbitrary supplied relations, while none asserts index restriction, realization, reconstruction, entropy/index comparison, completeness or rotation existence. `shadedBox`, `GradedCarrier` and `RigidWeight` support no headline theorem at all. The second prototype's own comment correctly admits that τ and E carry no trace/expectation laws, but this does not make it an acceptance test.

**Repair:** Audit the headline list below against the pins. State each genuinely statable headline on its actual carriers, with only the simple native-carrier definitions it needs. Remove the unrelated prototype catalogue. For every remaining headline, list its missing carrier in the module docstring; an otherwise empty `import Mathlib` file is acceptable if none can be stated. In particular, do not replace the missing Jones index/tower or planar operad with freely supplied projections, an arbitrary tower sequence or raw entropy maps. On d=1/2 the resulting test must not purport to describe an actual II₁ inclusion merely because the zero family satisfies the TL relations.

## R05 (P3) — Delete the confirmed padding declarations

**Location:** `TauCetiRoadmap/Subfactors/Suggested.lean:36`, 47, 62, 132, 170, 175 and 185.

**Claim:** These declarations belong among the headline targets.

**Witness:** Scratch elaboration closes `scaledGenerator_self` and `scaledGenerator_distant` with one `simp` each. `jonesAction_generator` is already one application of native `lift_e`; the remaining cited declarations are identity, supremum-membership or infinity-membership checks.

The successful probes were:

```lean
by simp [scaledGenerator, (P.isProjection i).isIdempotentElem.eq]
```

and

```lean
by simp only [scaledGenerator, smul_mul_assoc, mul_smul_comm, P.distant i j h]
```

The first also works without `hd`; it is simply the projection identity, even at d<0 where `Real.sqrt d=0`. The two other admitted declarations were tried with `simp`, which did not close them; no one-tactic success is claimed for those.

**Repair:** Delete these seven declarations from `Suggested.lean`; keep useful mathematics as README API facts or Checks. Do not prove them in place. The d=4 projection calculation 4p=4p and the identity entropy calculation 0=0 remain valid README checks after deletion.

## R06 (P3) — Keep the mathematical jellyfish theory, remove the algorithm deliverable

**Location:** `TauCetiRoadmap/Subfactors/README.md:652`: “trace evaluation algorithms … prove terminating reductions evaluate closed diagrams”.

**Claim:** An evaluation algorithm and its termination are roadmap outputs.

**Witness:** Lines 652–656 explicitly request an algorithm and terminating reductions, beyond the spanning, closure, positivity and uniqueness statements needed for the planar-algebra theory.

**Repair:** Retain train-spanning theorems, the exact jellyfish identities and a theorem that specified relations and a faithful positive trace determine evaluations/isomorphism classes. Delete the executable/termination deliverable. A closed TL circle still evaluates to δ and two disjoint circles to δ²; these test the retained mathematical evaluation identities without specifying an algorithm.

## R07 (P3) — Supply per-definition Checks and per-target dependencies/locators

**Location:** `TauCetiRoadmap/Subfactors/README.md:84`–110 and the S2–S10 sections; the opening at lines 1–12.

**Claim:** The prose gives a complete build specification in the required roadmap form.

**Witness:** S1 introduces correspondences, bounded vectors and fusion but supplies no `**Checks.**` block. There are zero `*Needs:*` lines in the entire README. General chapter lists at lines 966–1018 do not locate individual targets.

**Repair:** Reshape into the required Summary, Scope and ownership, Conventions, Exact supplier contracts and numbered layers. Preserve the substantive API requirements. Give each definition at least three discriminating computations/nonexamples and every theorem its hypotheses, precise locator and individual needs; finish each layer with Examples and Dependencies. In S1, for example, use the scalar inner product −i versus +i, fusion with the zero module, and the nontracial right-action comparison—not three restatements of the definition. Restore the required downstream/reference sections. Replace the pull-request citations at lines 52–53 with roadmap names and sections. The witness table below supplies concrete cases to retain, but it does not itself repair missing README Checks.

## R08 (P3) — Record the sources and correct the Burns locators

**Location:** `TauCetiRoadmap/Subfactors/README.md:488`, 993–998; directory contents.

**Claim:** The references identify reproducible versions and exact locations.

**Witness:** The folder has no `sources.toml`. In the fetched Burns version, 2.2.10 is Remarks following Definition 2.2.9 (`burns` lines 1524–1542), and 2.2.43 is a Lemma, not a Theorem (`burns` line 2804).

**Repair:** Add one source-manifest entry for each of the 16 cited works, keeping published/preprint versions under one key. Record the fetched versions and inaccessible texts honestly. Cite the annular tangle in Definition 2.2.9 and its properties in Remarks 2.2.10, printed pages 33–34; cite Lemma 2.2.43 for the weighted tower comparison. Attach page/theorem locators to the targets, not only a bibliography. Retain the correct reciprocal repair to Theorem 2.2.40: at a=5/4 and δ_sph=2 the rigid modulus is 5/2, not 8/5.

## R09 (P3) — Align the Lean file's form and names with the README

**Location:** `TauCetiRoadmap/Subfactors/Suggested.lean:17`, 32–51, 105–130 and 137–198.

**Claim:** The file follows the namespace, documentation and README-agreement rules.

**Witness:** It uses `namespace Subfactors` and `namespace SubfactorsEntropyPrototype`, two module-style documentation blocks, and undocumented declarations. None of its 22 declared names occurs as such in the README.

**Repair:** After R04/R05, use `namespace TauCetiRoadmap.Subfactors`, one “Subfactors: target signatures” module docstring with the headline exclusions, and documentation for each retained declaration. Use layer comments in README order where applicable; mention every retained name in the README. This is a file-shape repair, not a request to add names for every API bullet. No duplicate fully qualified declaration was found in the other readable roadmap files.

## Verified sound

The checks below establish particular computations, source matches and interface facts; they are not proofs of the entire future library. No previous AI review or settled repair finding was supplied.

**Gate and compilation.** The supplied gate at this exact head reports all checks passing, including build, metadata, imports, sorry-data, set_option, stray-files and outside-folder. `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/Subfactors'` is empty. The imported module was built with `lake build TauCeti.Algebra.TemperleyLieb.MarkovTrace` (success, 1612 jobs), followed by the requested direct `lake env lean` elaboration of `Suggested.lean` (exit 0, exactly four `sorry` warnings). No bare build or pin update was used.

The prescribed dependency command returned exactly:

```text
depcheck: 157 roadmaps, 1084 edges, 0 problem(s)
```

It printed no UPWARD, CYCLE or moved line. R01/R02 are manual counter-witnesses to the completeness of this output for the prose citations in this README; the tooling and merge order were not edited.

**Signature and padding audit.** A single scratch copy appended `#check @name` for all 22 declarations (including structures, the shading inductive and the abbreviation) and elaborated successfully. The four star-related binders and the entropy order/positivity binders survive. No silently dropped standing hypothesis was detected. The defect is that the elaborated types do not contain inclusion, index, trace-normalization or tower data, as expressly acknowledged in the file. No type or source file was changed. All four admissions received a one-tactic trial; two succeeded, and a second copy retaining the other two admissions confirmed those successes with exit 0. Five already proved declarations are also padding, as specified in R05.

**Headline inventory.** The README promises: general Connes fusion and coherence (S1); basic construction, finite bases, Pimsner–Popa optimality, dual/minimal index and statistical dimension (S2); inclusion entropy, its atomic/diffuse formula and extremality/equality criteria (S2a); Jones restriction and trace-radical kernel (S3); commuting-square compactness and realization of every extended index (S4); standard invariants, graph bounds and finite-depth extremality (S5); spherical/rigid planar construction and sphericalization (S6); finite-depth/module embeddings and graph stability (S7); orthogonal reconstruction, GJS/Fock comparisons, arbitrary-depth graph embedding and weighted reconstruction (S8); finite-depth hyperfinite completeness and the full ADE invariant list below 4 (S9); cone calculus, qualified Burns rotations and the type-III relative-commutant example (S10). None is a theorem in this Lean file. The pin has neither the roadmap's II₁ inclusion/index/dimension package, nor normal correspondences/fusion, planar operads, standard invariants or weighted towers. This supports documenting those missing carriers, not claiming that the present prototype theorems test them. Generic CFC expressions and native TL relations do exist.

**Pinned library inspection.** Mathlib is `6b7abb3c7686292736be2955bd3eb9ebf63b456a`; Tau Ceti is `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The following definitions/signatures and their surrounding hypotheses were opened:

| Pin-relative file | Declaration and inspected location | What it supplies / does not supply |
| --- | --- | --- |
| `Mathlib/Analysis/VonNeumannAlgebra/Basic.lean:45` | `WStarAlgebra` | Existence of a Banach predual; no factor, trace or separability field. |
| `Mathlib/Analysis/VonNeumannAlgebra/Basic.lean:67` | `VonNeumannAlgebra` | A star-subalgebra of bounded Hilbert operators equal to its double commutant, with CompleteSpace; no II₁/index API. |
| `Mathlib/Algebra/Star/Subalgebra.lean:312` | `StarSubalgebra.centralizer`, `mem_centralizer_iff` at 321 | Centralizes both s and star(s); on an actual star-subalgebra this is its usual commutant. |
| `Mathlib/Algebra/Star/StarProjection.lean:26` | `IsStarProjection` | Idempotence and self-adjointness; exactly the input used in the padding probe. |
| `Mathlib/Analysis/LocallyConvex/WeakOperatorTopology.lean:57` | `ContinuousLinearMapWOT` | Existing topology wrapper; it is not a normal-representation or II₁-factor structure. |
| `Mathlib/Analysis/SpecialFunctions/Log/NegMulLog.lean:164` | `Real.negMulLog` | Actual −x log x definition, including the total value 0 at x=0. |
| `TauCeti/Algebra/TemperleyLieb/Basic.lean:196` | `TauCeti.TemperleyLieb.lift` | Universal map from the three relations on `Fin (n-1)`; no positivity or faithfulness. |
| `TauCeti/Algebra/TemperleyLieb/Basic.lean:209` | `lift_e`, `hom_ext` at 215 | Generator evaluation and extensionality already implemented. |
| `TauCeti/Algebra/TemperleyLieb/Basic.lean:233` | `strandIncl`, `strandIncl_e` at 239 | Last-strand inclusion, preserving zero-based generator labels. |
| `TauCeti/Algebra/TemperleyLieb/MarkovTrace.lean:452` | `markovTrace`; `markovTrace_one` 462; `markovTrace_mul_comm` 468 | Signed spin parameter δ=−(q+q⁻¹), with q a unit; closure value δⁿ. |
| `TauCeti/Algebra/TemperleyLieb/MarkovTrace.lean:486` | `markovTrace_strandIncl`, `markovTrace_strandIncl_mul_e_last` 494 | Closure strand and Markov identities; no analytic positivity theorem. |

Whole-pin searches by objects as well as names found no existing subfactor, Jones-index, normal-fusion or planar-algebra package. The generic native carriers were not treated as having any of those additional laws.

**Ownership and supplier resolution.** The main-tree FreeProbability and PivotalSpherical READMEs were read as shape/context examples. `roadmaps grep` searched open heads and main for correspondences/fusion, index, expectation bases, relative entropy, planar algebras and standard invariants, and separately for the Lean names; board-package READMEs were searched too. The substantive cross-roadmap resolutions were:

| Citation | Resolved content |
| --- | --- |
| VonNeumannAlgebras V0–V7 | Supplied open head: V6 at line 884, V7 at 992, unrestricted V7.Index at 1177; dimension/index and initial expectation foundations are present. S2's new tower comparisons may consume these, but should not independently re-own their general proofs. |
| VonNeumannAlgebras V8 | Line 1230 and following: normal discrete group/crossed-product models. |
| VonNeumannAlgebras V10–V11 | V10 line 1386; V11 line 1809, general standard form at 1864, extended cones 1888, spatial derivatives 1892 and expectation theorem 2052. The nonsigma-finite S1 input is explicitly present. |
| VonNeumannAlgebras V13 | V13b lines 2532–2560: hyperfinite models, corner permanence, L² matrix perturbation and injectivity/hypertrace inputs. |
| TemperleyLiebOperatorAlgebras A1–A5 | Lines 117,162,217,256,306: analytic star, path/block quotients, independent all-level positivity and C*-completion. Parameters and trace normalization agree; R01 concerns folder supply direction. |
| CStarAlgebras C1–C5 | Supplied open head, C5 lines 547–605: tensors and inductive limits. Concrete finite-factor matrix theory is also in VonNeumannAlgebras V3. |
| HilbertModules H1–H3 | Supplied open head, lines 101,149,228: module completions, adjointable/compact maps, interior tensors; opposite-action conventions agree. R02 concerns order. |
| FreeProbability F3–F4 | Main specification: scalar Fock and tracial amalgamated products; it excludes subfactor/planar classification. It does not own S8's graded planar products. |
| OperatorAlgebraDynamics D8 | Main, line 555 onward: antilinear CAR generators, Fock completion and quasi-free states. The added star in S10's one-particle map correctly turns this into a linear map. |
| TemperleyLieb / PivotalSpherical | Algebraic TL open head and pivotal main specification: underlying diagrams/categories; TL explicitly excludes positivity/subfactors at lines 831–835. Replace PR-number citations with sections. |
| CategoricalOperatorAlgebras / FactorRigidity | Supplied open heads explicitly consume Subfactors' normal correspondences/standard invariants. This supports Subfactors ownership, subject to the cycle correction. CA2b exists and is a downstream comparison, not an S7 prerequisite. |
| GeometricTopology | Main specification, lines 28–32 and Layer 4 at 409, owns link/knot applications; the target does not try to re-own them. |

No existing Subfactors folder was found on the supplied main tree. This is repairable new work, not a rejected re-planning of an existing roadmap. The native TL universal property is already used rather than redefined. Other open folders' fully qualified Lean names do not collide with the 22 names here. No declared gap contract was supplied.

**Source sample and coverage.** The brief reports “15 targets (none found by heading)” but supplies no target identities or seed. I did not claim to recover that unavailable worker sample. A reproducible replacement used `random.Random(int("6e29691",16)).sample(pool,15)` on 40 explicitly listed citation targets, saved in scratch. All 16 referenced works were requested through the sources service, without editing a source manifest. Eleven sampled targets could be checked at their textual locators, one is partially checkable because its defining diagram could not be rendered, and three remain uncertified/unavailable. Additional checks cover the Burns erratum, weighted example, graph/module embeddings, and rotation converse.

The ordered sampling pool was: `pp §3`; `pp 4.4`; `pp 4.5`; `pp 4.6`; `js 2.3.8`; `js 5.3.4`; `js 5.7`; `ap Ch8`; `ap Ch9`; `ap Ch13`; `jones 4.2.1`; `jones 4.3.1`; `jsw 3.3`; `jsw 4.9`; `jsw 4.20`; `jsw 4.21`; `popa 4.1.2`; `popa 4.5.1`; `popa 5.1.2`; `kosaki 3.7`; `gjs Def7`; `gjs Th8`; `burns 2.2.14`; `burns 2.2.18`; `burns 2.2.36`; `burns 2.2.40`; `burns 2.2.42`; `burns 3.4.7`; `burns 3.4.8`; `penneys-notes §1.5`; `jp §4`; `chps 3.12`; `chps 5.2`; `chen 7.9`; `bp 1.2`; `bp 1.3`; `ek 11.22–24`; `penneys 3.18`; `penneys 4.20`; `penneys 4.28`.

| Sampled target | Source/version and locator | Verification |
| --- | --- | --- |
| S6 sphericalization | `burns` lines 2588–2654, Theorem 2.2.36, printed 53–54, arXiv v1 | Positive finite-box rigid data; insertion exponent and δ_sph=λδ agree. |
| S6 shifted RN products | `burns` lines 1570–1614, Lemma 2.2.14, printed 35–36 | Both shadings, inverse under the annular anti-isomorphism and ordered product z_k agree. |
| S8 concatenation | `gjs`, Definition 7, printed 8, arXiv v2 | Text states degree m+n−k and a distinct graded dagger. Text inspected via [arXiv](https://arxiv.org/pdf/0712.2904); the diagram itself remains uncertified. |
| S2a qualified converse | `pp` lines 1158–1174, Corollary 4.6, printed 85–86 | Both strict bounds 4<d<8 and excluded squared cosine values are retained. |
| S10 rotation existence | `penneys` lines 1501–1519, Theorem 4.20, printed 31–32, arXiv v1 | Approximate extremality gives strong convergence; extremality gives unitarity. No symmetry hypothesis is needed here. |
| S10 type III summand | `burns` lines 6389–6409, Lemma 3.4.8/Theorem 3.4.9, printed 121 | The one-particle corner and its central support give the type III summand. CAR convention is adjusted to the actual supplier. |
| S4 compactness | `js`, §5.7 | Book text unavailable; not certified. |
| S10 cone calculus | `penneys` lines 967–985, Theorem 3.18, printed 20–21 | The carrier is the extended positive cones of Q_n, not central Hilbert vectors. Theorem 3.28 separately makes central vectors act as weights (lines 1144–1151). |
| S2 expectation/basic construction | `ap` lines 6391–6418, Theorem 9.1.2, printed 139–140; 6722–6755, Proposition 9.4.2, printed 146–147 | Faithful normalized tracial setting, expectation uniqueness and e_B x e_B / JB′J identities agree. |
| S2a atomic/diffuse entropy | `pp` lines 1000–1008 and 1124–1130, Theorem 4.4, printed 81–85 | No finite-index assumption; diffuse part and infinite corner yield ∞; atomic weights are minimal-projection traces. |
| S7 one-graph stability | `bp` lines 145–147, Theorem 1.3, printed 4, arXiv v1 | Two successive stable depths, δ>2 and A-tail exclusion are retained. |
| S9 Skau step | `popa`, Lemma 4.5.1 | Service returned uncertified/paywalled; exact proof step not certified. |
| S9 finite-depth strong amenability | `popa`, §5.1.2 | Same access limitation; not certified. |
| S2a entropy definition | `pp` lines 715–753, §3, printed 74 | Finite positive partitions, chosen trace, natural logarithm and conditional-expectation order agree. |
| S1/S2 dimension foundation | `ap` lines 5568–5603 and 5707–5729, Chapter 8, printed 121–124 | Normal modules and amplification model; the source's standing separability restriction was checked, not silently omitted. |

Further source checks: `pp` lines 1132–1156 (Corollary 4.5); `kosaki` lines 1534–1549 (Theorem 3.7, p.35); `jones` lines 2747–2758 and 3415–3427 (Theorems 4.2.1/4.3.1, pp.92/115–116); `burns` lines 1617–1650 (Definition 2.2.15/Corollary 2.2.18, pp.37–38), 2693–2708 (Theorem 2.2.40, p.56), 2727–2738 (Theorem 2.2.42, p.57), 6287–6388 (S10 construction); `chps` lines 363–382, 655–673, 1933–1938 and 2012–2020 (Definition 2.8, Lemma 3.12, Theorem 5.1/Corollary 5.2, pp.9,15–16,35–37); `chen` lines 4310–4317, 4435–4468 (published Theorem 7.9, pp.336–338); `bp` lines 135–147 (Theorems 1.2–1.3); `penneys` lines 1523–1524 and 1569–1585 (the symmetry assumption preceding Theorem 4.28). The Jones–Penneys and Penneys lecture-note sources were also opened for the graph/embedding definitions.

JSW's extracted text is glyph names. The readable text of [arXiv v1](https://arxiv.org/pdf/0807.4146) confirms Theorem 3.3 (p.3), Theorem 4.9 (p.6), Theorems 4.20–4.21 (p.9) and the §5 comparison: bounded multiplication, δ>1, tower reconstruction and the diagrammatic change of basis match S8. Diagram-level verification is limited as stated below.

**Adversarial computations.** The 159-row table records values, including deliberately invalid models, rather than treating elaboration as evidence of truth. I is R⊂R. A is R⊗1⊂R⊗M₂. D is the diagonal-corner inclusion with t=1/3. These give (index,δ)=(1,1),(4,2),(9/2,3/√2). “Pass” means the displayed instance agrees; it does not certify an unexamined proof or inaccessible source. Rows separated by semicolons in the statement cell name the compatible API laws tested by the same calculation.

| Statement / location | Instances tried | Values computed on each side | Result; required change |
| --- | --- | --- | --- |
| Standing index and trace convention, 14–20 | I; A; zero algebra | dim_R L²(R)=1; dim_R L²(R⊗M₂)=4; τ(1)=1 in both. Zero algebra has τ(1)=0 and is excluded. | Pass; broaden basic scope per R03. |
| Tower indexing, 18–20 | First two stages of A | e₁∈M₁ implements M₀→M₋₁; e₂∈M₂ implements M₁→M₀. Both traces are 1/4. | Pass. |
| Complex inner-product convention, 21 | Scalars ξ=i, ξ′=1 | ⟨i,1⟩=−i; reversed linearity gives +i. | Pass; add explicit Check. |
| Generator scaling, 23–27 | A, δ=2 | U²=(2e)²=4e=δU; adjacent U₁U₂U₁=8(e₁/4)=2e₁. | Pass. |
| Closure normalization, 28 | A at n=1,2 | T₁(1)=2,T₂(1)=4; δ⁻ⁿT_n(1)=1 at both levels. | Pass. |
| Shaded box convention, 31–38 | I; A at n=0,1 | I has both P₀ and P₁ equal C; A has P₀,±=C, P₁,+=M₂ and P₁,−=M₂. | Pass; zero boxes are stipulated, not arbitrary commutants. |
| S1 commuting normal actions, 86–90 | Standard M₂ bimodule; wrong same-sided action | L_E12 R_E21(1)=E₁₁=R_E21 L_E12(1); L_E12 L_E21(1)=E₁₁≠E₂₂=L_E21 L_E12(1). | Pass; opposite action is essential. |
| S1 invariant subspaces/direct sums/intertwiners | Two standard copies | Projection onto first copy has matrix diag(1,0); adjoint equals itself; inclusion followed by projection is 1, reverse is diag(1,0). | Pass. |
| S1 conjugate and double conjugate, 88–93 | Scalar intertwiner i | Conjugate map is −i; double conjugate is i. Zero map stays 0. | Pass. |
| S1 standard identity correspondence, 91 | M₂; identity factor | Left and right multiplication on 1 give x=x; unit-vector norm²=τ(1)=1. | Pass on finite tracial instance; general input resolved in V11. |
| S1 opposite-weight bounded-vector domain, 95–101 | ψ(x)=Tr(hx), h=diag(1,4), y=E₁₂ | ψ(yy*)=1, ψ(y*y)=4; the opposite-weight domain norm is 1 versus 2 for the naive Λψ(y). JΛψ(y*) has norm 1. | Pass; discriminates the nontracial convention. |
| S1 fusion pairing, 102–105 | N=C; ξ=i, ξ′=1, η=η′=1 | Rξ*Rξ′=−i; both displayed pairings are −i. | Pass. |
| S1 positivity and null quotient | (1⊗1)+(−1⊗1) | Four pairing terms 1−1−1+1=0; omitting cross terms incorrectly gives 2. | Pass. |
| S1 fusion units/associator/coherence | Scalar tensors 2⊗3⊗5; four factors 2,3,5,7 | Both associator paths multiply to 30; every pentagon path gives 210; unit paths give 2. | Pass on test tensors; general coherence remains a target. |
| S1 weight independence | Scalar weights ψ=1, χ=4 | GNS norms of 1 are 1 and 2; comparison multiplies coordinates by 1/2, preserving norm 1. | Pass; prevents an unnormalized identity comparison. |
| S1 fusion of bounded intertwiners | Scalar maps 2 and 3 | Tensor map norm 6=2·3; adjoint is 6 on either side. Zero factor gives 0. | Pass. |
| S1 C*-module comparison | E=C, K=C | Completed interior product and Hilbert fusion both send 2⊗3 to 6, norm 6. | Pass; supplied H3 is upward, R02. |
| S2 Jones compression, 115–118 | A; x=1⊗E₁₂ and x=1 | e_N x e_N=0=E_N(x)e_N; e_N1e_N=e_N. | Pass. |
| S2 commutant/basic-construction identification | A on L²(R)⊗L²(M₂) | Right-R endomorphisms are R⊗B(C⁴); ⟨R⊗M₂,e_N⟩ gives the same algebra. Matrix component dimension 16 on both descriptions. | Pass. |
| S2 canonical trace, 120–122 | I; A | Tr(e_N)=1 in both; Tr(1)=1 or 4. Normalized τ_M1(e_N)=1 or 1/4. | Pass; distinguishes canonical and normalized traces. |
| S2 finite basis, 126–129 | A, bᵢⱼ=√2 Eᵢⱼ; x=E₁₂ | Only coefficient (i,j)=(1,2) contributes: b₁₂/√2=E₁₂; Σbᵢⱼbᵢⱼ*=4I. | Pass. |
| S2 basis change/Gram projection | Unitary change of four-element basis | Gram matrix is I₄ and transforms to U*I₄U=I₄; module dimension remains 4. | Pass. |
| S2 optimal Pimsner–Popa coefficient | A; Bell rank-one projection in M₂⊂R tensored with M₂ | E_N(p)=I/4; on p's eigenvector inequality is 1/4≥c. c=1/4 attains equality. | Pass; coefficient 1/2 would fail. |
| S2 infinite-index coefficient | R⊗1⊂R⊗R, using Bell projections in M_k⊗M_k | E_N(p_k)=I/k²; c≤1/k² for every k, hence optimal c=0. | Pass. |
| S2 multiplicativity | R⊂R⊗M₂⊂R⊗M₂⊗M₃ | Indices 4,9,36; 36=4·9. | Pass; consume V7 and prove tower compatibility. |
| S2 index-one/equality | I; A | 1=1 and equal algebras for I; 4>1 and proper inclusion for A. | Pass. |
| S2 relative-commutant finite dimension | I; A | Complex dimensions 1 and 4, versus indices 1 and 4. | Pass; no numerical bound beyond one explicitly formulated is certified. |
| S2 local index, 136–143 | A, minimal p; D, first corner | A: 1=(1/2)(1/2)4. D: 1=(2/3)(1/3)(9/2). Replacing commutant trace by τ in D gives 1/2, false. | Pass; essential two-trace distinction. |
| S2 arbitrary finite module corner formula | A, H=L²(M)⊕L²(M), minimal p | dim_M H=2; dim_pMp pH=4=2/(1/2); dim_N H=8 and dim_N pH=4=(1/2)8. | Pass. |
| S2 tower index/expectation, 145–149 | A | All consecutive indices 4; τ(e_j)=1/4; E(e_j)=I/4. | Pass. |
| S2 distant/adjacent projection relations | I; A | I: 1·1·1=1; A: e₁e₂e₁=e₁/4; disjoint tensor projections commute with product p⊗q. | Pass. |
| S2 dense spans and basis/tensor powers | A | First algebraic basic-construction matrix factor has dimension 16; M₂⊗_C M₂ has vector-space dimension 16. | Pass on amplification. |
| S2 intermediate projections/lattice comparison | Outer S₃-action, intermediate subgroup C₂ | Fixed-factor indices [R:R^C₂]=2 and [R^C₂:R^S₃]=3, total 6; subgroup containment reverses fixed-algebra containment. | Pass; includes nonabelian case. |
| S2 finite-group examples, 154–156 | Outer actions of {1}, C₂, S₃ | Fixed-point and crossed-product indices 1,2,6 respectively; first relative commutants are C. | Pass; outerness is retained. |
| S2 one-sided/statistical dimensions, 158–168 | A's distinguished X | Left/right dimensions 4 and 1; statistical dimension 2, neither 4 nor 1. | Pass. |
| S2 conjugate solutions/additivity | X is two copies of a Morita-equivalence sector | Each sector has statistical dimension 1; X has 1+1=2; standard evaluation/coevaluation norm²=2. | Pass. |
| S2 fusion dimension and Hom spaces | Two multiplicity-2 standard correspondences | Fusion has multiplicity 4; 4=2·2. End(C²⊗L²R)=M₂ has dimension 4. | Pass. |
| S2 chosen expectation index, 170–182 | A, h=diag(2/5,8/5) | tr₂(h)=1; tr₂(h⁻¹)=25/16; Ind(E_h)=4·25/16=25/4. | Pass. |
| S2 expectation parameterization/faithfulness | A, h=I and h=diag(2,0) | Both have trace 1; second sends E₂₂ to 0 and is nonfaithful; first is faithful. | Pass; invertibility separates them. |
| S2 minimal density, 183–194 | D, r=(1/3,2/3), s=(2/3,1/3) | c=2√2/3; h₀=(3/2,3/4); τ(h₀)=1; d c²=4; d(X)=2. | Pass. |
| S2 strict minimality witness | D, trace density h=1 versus h₀ | Ind(E_N)=9/2; Ind(E₀)=4; 4<9/2. | Pass. |
| S2 distortion/conjugation, 195–200 | A sector; its conjugate | Dimensions (2,1/2) give ratio 4; conjugate gives 1/4; product 1. | Pass. |
| S2 constituent criterion for extremality | D's two odd sectors | Dimensions (3,1/3) and (3/2,2/3) give ratios 9 and 9/4, unequal. A's two sectors both have ratio 4. | Pass. |
| S2 finite generated ratios, 201–205 | Ratio 1; ratio 2 | Powers {1} versus {1,2,4,8,…}; only first is finite. | Pass; supports finite-depth argument, not a substitute for its fusion law. |
| S2a η and endpoint, 217 | t=0,1,1/2 | η(0)=η(1)=0; η(1/2)=(log2)/2. | Pass. |
| S2a partition entropy, 219–225 | C⊂M₂, p₁=E₁₁,p₂=E₂₂ | E(p_i)=I/2; sum of trace-η differences is log2−0=log2. | Pass; finite nonfactor N permitted. |
| S2a noncommutative Jensen | Same inclusion, rotated rank-one p | τ(η(Ep))=(log2)/2; τ(η(p))=0. Unitary rotation leaves both values unchanged. | Pass. |
| S2a identity/nonnegative/supremum | I; partition (1); A | I gives every partition value 0 and supremum 0; (1) gives 0 for A while its entropy is log4. | Pass; nontrivial partition dependence retained. |
| S2a conditioning monotonicity | C⊂diagonal C²⊂M₂ | H(M₂\|C²)=log2 and H(M₂\|C)=log2; H(M₂\|M₂)=0≤log2. | Pass on equality and strict endpoint. |
| S2a index bound, 230 | I; A; D | 0=log1; log4=log4; 2log3−(4/3)log2≈1.27303<log(9/2)≈1.50408. | Pass. |
| S2a diffuse relative commutant | R⊗1⊂R⊗R | n equal-trace orthogonal partition projections give log n; supremum is ∞, matching diffuse case. | Pass. |
| S2a atomic corner formula, 235–241 | A; D | A: 2·(1/2)log(1/(1/2)²)=log4. D: (1/3)log9+(2/3)log(9/4)=1.27303. | Pass. |
| S2a infinite atomic corner | Irreducible infinite-index inclusion, f=1 | τ(f)=1 and corner index ∞; summand 1·log∞=∞. | Pass as extended-value formula; not an independent construction. |
| S2a equality criteria, 243–258 | A; D | A: corner ratios 4,4 and trace weights 1/2,1/2 agree. D: ratios 9,9/4 and weights r≠s; entropy inequality is strict. | Pass in both directions on these controls. |
| S2a complex anti-isomorphism convention | x=i·1 | JxJ=−i·1, conjugated trace −i; Jx*J=i·1, trace i. | Pass; distinguishes linear from conjugate-linear comparison. |
| S2a downward projection criterion | I | e=1; E_N(e)=1=d⁻¹ and E_N′∩M(e)=1=d⁻¹. | Pass endpoint; general projection comparison source-checked. |
| S2a irreducibility converse restriction | Outer C₂ example; A at d=4 | First: entropy log2 and commutant C. A: entropy log4 but commutant M₂; d=4 is excluded from the converse. | Pass; global converse would fail. |
| S3 action and generator indices | n=0,1,2; A | Native generator counts 0,0,1; index 0 corresponds to e₁; at n=2 U₁ maps to 2e₁. | Pass. |
| S3 trace pullback, 272–275 | A, n=2 | τ(ρ(U₁))=2·(1/4)=1/2; δ⁻²T₂(U₁)=(1/4)·2=1/2. | Pass. |
| S3 Jones value restriction | m=3,4,6; d=∞ | Values 1,2,3; ∞ lies in extended interval. d=0 is absent. | Pass. |
| S3 trace radical/kernel | δ=1 at TL₂; δ=2 | At δ=1, T₂(1−U₁)=0 and action kills 1−U₁. At δ=2 the positive closure form has zero radical. | Pass; quotient required at root parameter. |
| S3 index<4 irreducibility | Outer C₂ example; A | d=2, first commutant dimension 1; d=4, dimension 4. Strict threshold excludes the counterexample. | Pass. |
| S4 Markov/Perron–Frobenius inclusion | C⊂M₂, inclusion matrix [2] | Matrix norm 2; squared norm 4; canonical trace of basic-construction unit 4. | Pass. |
| S4 commuting-square equivalences | Independent tensor legs in M₂⊗M₂ | For x=a⊗b, E_A1 E_B0 x=tr(a)tr(b)I=E_C x; reversed order is identical; intersection C. | Pass. |
| S4 symmetry | Same square | Products (a⊗1)(1⊗b)=a⊗b span dimension 16=dim M₄. | Pass. |
| S4 false commuting-square control | Three-leg example; x=E₁₂⊗1⊗1 | E_A1 E_B0 x=x≠0=E_A0 x; intersection dimension 4 versus dim A₀=1; product span dimension 64. | Pass as negative control. |
| S4 unequal horizontal parameters in control | Three-leg example | C⊂M₄ gives 1/16; M₂⊂M₈ gives 1/4. | Pass; symmetry alone does not equate parameters. |
| S4 propagation/equal parameters | Independent two-leg commuting square | Both horizontal indices 4 and both vertical indices 4; all corresponding parameters 1/4. | Pass on tensor grid. |
| S4 row limits/growth | Repeated C⊂M₂ tower; identity graph | Matrix sizes 1,2,4,8,… grow; norm-one identity tower sizes 1,1,1,… do not. Tensoring the latter with R gives R. | Pass. |
| S4 compactness and column indices | Tensor grid with R₀=R,R₁=R⊗M₂ | R₀′∩R₁=M₂=A₁′∩B₀; dimensions 4=4. r=2 gives M₄, dimension 16 on both sides. | Instance passes; general source unavailable. |
| S4 nonsymmetric square | A₀=A₁=B₀=C⊂B₁=M₂ | Expectation product is E_C, but product span dimension 1<4. | Pass as negative symmetry control; does not certify a II₁ limit. |
| S4 TL shift/stabilization | m=4, graph A₃, n₀=3 | Allowed odd vertex already reached at length 3; both even vertices reached at length 2; δ²=2. m=3 gives index 1. | Pass small root and identity cases. |
| S4 real index realization | t=1/2,1/3 | t⁻¹+(1−t)⁻¹=4,9/2; N's unit p+θ(p)=p+(1−p)=1. | Pass. |
| S4 diagonal commutant/entropy | D; t=1/2 | D has C² commutant, two corner indices 1; H=1.27303<1.50408. At t=1/2 corner formula gives log4. | Pass; no C² commutant claim at equal corners is needed. |
| S4 infinite realization | R⊗1⊂R⊗R | Left module is an infinite sum of standard copies: Σ_n1=∞; both algebras remain II₁. | Pass. |
| S5 invariant/functoriality | I; inner conjugacy in A | I's grid entries C and maps identity; unitary conjugacy sends x↦uxu*, preserving tr and xy. For E₁₂,E₂₁ products become uE₁₁u*. | Pass. |
| S5 relative commutants/intertwiners | A | End of two copies of the basic odd sector is M₂, dimension 4=N′∩M dimension. | Pass. |
| S5 extremality/minimality/entropy | A; D | A: r=s, min index=4=d, H=log4. D: r≠s, min index4<9/2, H<log(9/2). | Pass in both directions on the controls. |
| S5 finite-depth definitions | Index-2 A₃ invariant | New vertices at depths 0,1,2; no new vertex at 3. Tower block dimensions 1,1,2,4; old ideal fills level 3. | Pass. |
| S5 finite depth forces extremality | A; D ratios | A even family has ratio 1; D generates powers of 4 from odd-sector ratio quotient 9/(9/4)=4, so cannot be finite depth. | Pass. |
| S5 principal graph norm bounds | Index-2 example; A; D | A₃ norm √2=δ; A's two-edge graph norm 2=δ; D's two equivalence sectors give statistical dimension 2<3/√2. | Pass; nonextremal upper inequality can be strict. |
| S5 path counts/root | A₃ rooted at endpoint | Paths at levels 0,1,2,3 have endpoint multiplicities (1),(1),(1,1),(2); sum of squares 1,1,2,4. Root dimension 1. | Pass. |
| S6 ordinary tangle operations | TL at δ=2 | Identity annulus acts as 1; one/two circles evaluate to 2/4; reflection of i·1 is −i·1. | Pass; discriminates normalization/star. |
| S6 kernels/quotients/subalgebras | TL₂ at δ=1 | Ideal generated by 1−U₁ has trace zero; quotient dimension 1, unit trace 1. | Pass; positive quotient differs from raw algebra. |
| S6 direct sums/tensors | Two trivial planar algebras | Direct-sum zero box C² has dimension 2 (not connected); tensor zero box C has dimension 1. | Pass; connected subfactor class is not closed under direct sums. |
| S6 operad composition/presentation | Two scalar multiplication tangles | (2·3)·5=30=2·(3·5); cup followed by cap gives loop value δ=2. | Pass local examples; completeness of presentation is not established by them. |
| S6 rigid closures/normalization | Weighted A example | δ_rig=5/2; φ₁(1)=φ′₁(1)=1; unnormalized closures both 5/2. | Pass. |
| S6 RN weight and centralizer | h=(2/5,8/5), h′=(8/5,2/5) | h⁻¹h′=diag(4,1/4)=w; h and w commute; [w,E₁₂]=(15/4)E₁₂≠0. | Pass; centralizer is not center. |
| S6 shifted weights/product z₂ | Hilbert–Schmidt matrix units | z₁ has eigenvalues 4,1/4; z₂=L_wR_w⁻¹ has eigenvalues 1,16,1/16,1. | Pass. |
| S6 modular formula and center iff | x=E₁₂; w=1 control | w⁻¹/² x w¹/²=x/4; Δx=x/4≠x. At w=1, Δx=x and z central. | Pass. |
| S6 angular correction | θ=2π, x=E₁₂ | Δ⁻¹x=4x; θ=0 gives x. Exponent sign reversal would give x/4. | Pass for modular formula; full tangle geometry not certified. |
| S6 sphericalization modulus | Weighted A | λ=φ₁(w¹/²)=4/5; λδ_rig=(4/5)(5/2)=2. | Pass. |
| S6 balancing arbitrary weights | w=4·1; balanced w=diag(4,1/4) | Scalar rescaling 1/4 makes first w equal 1. Second gives tr√w=tr w⁻¹/²=5/4. | Pass; balances uniquely. |
| S6 Cauchy–Schwarz/equality | Balanced w above; w=1 | Product of traces 25/16≥1; equality for w=1 gives 1. | Pass. |
| S6 inverse circle modulus | a=5/4, δ_sph=2 | aδ_sph=5/2; wrong λδ_sph=8/5. | Pass; confirmed Burns misprint. |
| S6 reconstruction density and index | h=a⁻¹w⁻¹/² | h=diag(2/5,8/5); τ(h)=1; a²δ_sph²=25/4=Ind(E_h). | Pass. |
| S6 chosen expectation versus inclusion entropy | Same weighted A | Chosen index25/4; Jones index4; H(M\|N)=log4 independently of h. | Pass; excludes log(25/4) as inclusion entropy. |
| S7 graph local extremum weights | D₄ rooted at leaf, μ=(leaf 1, center √3) | Forward weight 3¹/⁴, reverse 3⁻¹/⁴; product 1; leaf circle sum √3 and center sum 3/√3=√3. | Pass. |
| S7 weight rescaling | μ→7μ | Ratios (7√3)/7=√3; all extremum coefficients unchanged. | Pass. |
| S7 graph zero boxes | A₃, plus at endpoints | P₀,+=C², dimension2; connected subalgebra scalars has dimension1. | Pass. |
| S7 module closures and type k | Regular index-2 module | δ=√2; Tr₁(1)=√2, Tr₂(1)=2; normalized values δ⁻¹Tr₁(1)=δ⁻²Tr₂(1)=1. | Pass; retain positivity/faithfulness as module requirements. |
| S7 Markov tower relations | Index-2 module | e_n²=e_n; adjacent coefficient1/2; E_(n+1)(e_n)=1/2; tr(xe_n)=tr(x)/2. | Pass. |
| S7 new ideals/depth | A₃ regular module | Y₀,Y₁,Y₂ each contribute a new vertex; Y₃=0; depth2≤depth(P)=2. | Pass; Lemma 3.12 verified. |
| S7 module vertex dimensions | A₃ weights 1,√2,1 | At each endpoint δ·1=√2; at center δ√2=2=1+1. | Pass. |
| S7 embedding/strong Markov basis | A's two-edge graph, shifted C⊂M₂ | Sum bᵢⱼbᵢⱼ*=4I=δ²I; canonical trace normalized by1/4; embedded scalar box unit remains1. | Pass instance; full tangle intertwining is a target. |
| S7 jellyfish closure/evaluation | δ=2 TL | Empty diagram1; circle2; two circles4. | Values pass; remove algorithm specification, R06. |
| S7 paired graph stability | A∞ tail at δ=2; finite A₃ tail | First has norm2 but fails δ>2; second δ=√2 also fails δ>2. Neither is incorrectly forced by the theorem. | Pass boundary controls; source hypotheses verified. |
| S7 single-graph stability | Infinite simple ray, truncation at n+1 | Truncation is exactly A_(n+2), so exclusion is false even though all tail edges are simple. | Pass; exclusion blocks false finiteness conclusion. |
| S8 orthogonal graded product degrees | r=s=1; r=0,s=2 | Contractions i=0,1,2 give degrees2,1,0; unit case only i=0, degree2. No negative degree occurs. | Pass. |
| S8 trace/inner product | Degree-zero unit; positive degree vector a | τ_k(1)=δ⁻ᵏδᵏ=1; τ_k(a)=0 for positive degree; ⟨1,a⟩=0. | Pass; only one normalization factor. |
| S8 bounded multiplication | Degree r=0 unit; r=1 | Unit multiplication norm1; at r=1 at most3 contractions (2r+1=3), independent of input degree. | Pass counts; general norm estimate source matched. |
| S8 cup Jacobi endpoint | δ=2, unilateral shift on basis ε₀,ε₁ | Degree-zero part sends ε₀→√2ε₁; coarse part sends ε₀→√2ε₁+ε₀; endpoint diagonal 0 versus1. | Pass against JSW Theorem4.9; endpoint correction matters. |
| S8 tower/reconstruction subscripts | Index-2 invariant | N=W₀,M=W₁,M₀=W₁,M₁=W₂; N′∩M₀=P₁=C and N′∩M₁=P₂=C². | Pass; index δ²=2. |
| S8 δ=1 separate case | Trivial invariant | All box dimensions1, circle1; R=R has index1. | Pass; not falsely using δ>1 factoriality proof. |
| S8 concatenation versus orthogonal product | k=1,m=2,n=3; scalar degree-zero unit | Concatenation index4=m+n−k; both products with unit preserve index and value. | Pass textual degree test; diagram/dagger comparison not certified. |
| S8 triangular X,Y | Empty degree-zero diagram | There is one empty summand with coefficient1; X(1)=Y(1)=1, hence XY(1)=1. | Endpoint only; positive-degree coefficients/diagrams remain uncertified. |
| S8 regular tensor action/reciprocity | A₃ edge 1→√2 | Unrescaled reverse-map squared norm√2; multiplier2⁻¹/⁴ gives normalized squared norm1; cup coefficient2¹/⁴. | Pass. |
| S8 graph-degree bound | δ=√3, D₄ center | Degree3=δ²; neighbor ratio1/√3 is at its lower bound1/δ. | Pass. |
| S8 infinite graph box carrier | Infinite ray, diagonal identities in all blocks | Supremum norm1; support infinite, so identity belongs to product and not algebraic direct sum. | Pass; wrong carrier loses the unit. |
| S8 root state/Fock comparison | Vacuum and unit-norm one-particle vector ξ | Vacuum state(1)=1; creation gives ℓ(ξ)Ω=ξ, squared norm1; annihilation gives ℓ(ξ)*Ω=0, squared norm0. | Pass Fock orientation test; weighted diagram comparison remains uncertified. |
| S8 weighted realization | w=1; weighted A | First a=1, h=1, index δ²; second a=5/4, h=(2/5,8/5), index25/4. | Pass; chosen expectation, not inclusion uniqueness. |
| S9 tunnel/tower anti-isomorphism | A, i=−1,k=0 | N′∩M=M₂; M₀′∩M₁=M₂ with opposite product. For x=E₁₂,y=E₂₁, transpose(xy)=E₁₁=transpose(y)transpose(x). | Pass on orientation; ordinary product reversal would fail. |
| S9 model functoriality | Identity invariant map; inner matrix conjugacy | Both extend to identity/conjugacy; τ(uE₁₁u*)=τ(E₁₁)=1/2. | Pass finite-stage test; general proof source not certified. |
| S9 reducible block retention | A; D | A first relative commutant M₂ has dimension4; D has two trace weights1/3,2/3. Replacing either by C loses data. | Pass negative control. |
| S9 finite PF chain | A₃ even vertices | Two-step matrix has every entry1/2; stationary distribution(1/2,1/2), eigenvalues1,0. | Pass ergodicity example. |
| S9 Skau assumptions | Identity inclusion | Tail algebras and B are C; e=1, d⁻¹=1; B′∩M∞=M. | Endpoint passes; general lemma inaccessible. |
| S9 local quantization/irreducible hyperfinite subfactor | B=M=R, y matrix unit E₁₂ | E_B′∩M(y)=0. Rank-one matrix projection q=E₁₁ gives qyq=0, error0<ε‖q‖₂. | Pass elementary test; general approximation proof not certified. |
| S9 tunnel generation/completeness | Identity inclusion R=R | Its constant tunnel has relative commutants C; both generated algebras are C, not R. The separately constructed identity model R=R has index1. | The explicit identity exception at line818 is essential; it must apply to generation as well. General completeness is not source-certified. |
| S9 graph norm<2 | A₂,A₃,D₄; infinite ray | Norms1,√2,√3 are <2; infinite ray norm2 is excluded. | Pass finite/infinite boundary. |
| S9 ADE indices | A₂,A₃,D₄,E₆,E₈ | Indices1,2,3,2+√3≈3.73205,4cos²(π/30)≈3.95630. | Pass numerical formulas. |
| S9 graph versus full invariant | E₆ and E₈ chirality pairs | E₆: −1/2±i√3/2 are distinct; E₈: cos(2π/5)±i sin(2π/5) are distinct despite identical graph norms. | Pass distinction; exhaustive connection counts not source-certified. |
| S10 central vectors versus commutants | H=L²(A); H=L²(A)⊕L²(A) | First P₁=C,Q₁=C; second P₁=C²,Q₁=M₂ (dimensions2 versus4). | Pass; carriers are different. |
| S10 bounded bases/trace and cone | Two standard copies | Two basis projections sum I₂; canonical trace(I₂)=2; cone contains λI₂ with trace2λ and the extended value∞. | Pass. |
| S10 approximate/extreme definitions | Identity module; scaling Morita module | Identity traces both1; scaling module traces2 and1/2 are comparable by4 but unequal. | Pass; approximate does not mean extreme. |
| S10 rotation existence/unitarity | H=L²(A)², n=2 | Rotation flips basis vectors e₁₂↔e₂₁ and fixes e₁₁,e₂₂; ρ²=I and norm1. | Pass; Theorem4.20 hypotheses met. |
| S10 zero module | H=0,n≥1 | P_n=0,Q_n=0; traces0=0; unique rotation equals zero-space identity, hence unitary there. | Pass boundary; no positive dimension conclusion inferred. |
| S10 symmetry in converse | Scaling R–R Morita module with dimensions2,1/2 | H² has scaling4, so P₂=0; its zero-space rotation is unitary, but traces on Q₁ differ2≠1/2. H is not symmetric. | Pass negative control: omitted symmetry would give a false converse. |
| S10 tensor-power conclusion | H=L²(A)², n=2 | H² has multiplicity4; its left/right traces of1 are4=4; P₄ dimension16. | Pass; conclusion concerns H². |
| S10 repeated-word map | γ₀=a₁ and fresh a_n | a_na₁a_n⁻¹ has reduced length3; distinct n give distinct words; all images equal w(a₁). In an abelian group all conjugates coincide. | Pass; free-group hypothesis matters. |
| S10 amplification/HS dichotomy | u=1; u=−1 on a nonzero subspace tensored with ℓ² | HS norm²0 in first case; second contains Σ_n4=∞. | Pass. |
| S10 Bogoliubov implementation | One CAR mode; infinitely amplified −1 | One-mode u−1 has finite HS norm and parity is inner; infinite amplification has infinite HS norm and outer action under the cited criterion. | Pass. |
| S10 CAR one-particle map | Unit ξ; iξ | ‖√2·a(ξ)*Ω‖²=2·1/2=1; antilinearity of a gives iota(iξ)=i·iota(ξ). | Pass against Dynamics convention. |
| S10 crossed product factor/first basic construction | γ in kernel; γ outside kernel | Central coefficient equation makes kernel coefficients scalar and outer coefficients0; ICC leaves only identity scalar. e₁⊗1 projects to CΩ⊗ℓ²(F∞). | Pass algebraic coefficient control. |
| S10 Fourier vanishing | Nonzero coefficient c=x_γ₀ξ; infinitely many conjugates | Each displayed coefficient vector has norm‖c‖; partial squared norm≥n‖c‖²→∞. | Pass; forces c=0. |
| S10 type III corner/central support | One-particle projection p, central support q | pQ′≅S; qQ′ has same factor type, hence qQ type III. Finite trace on its nonzero unit is impossible. | Pass source/structural check; no numerical trace value claimed. |
| Lean JonesProjectionFamily/scaledGenerator | All projections0; d=1/2; n=0,1 | Every relation is0=0; generator index type empty at n=0,1; scaled generators0. | Consistent definition, fails as headline substitute; R04. |
| Lean scaledGenerator_self | p=I, d=4 and d=−1 | d=4:4I=4I; d=−1:0=0 since sqrt(−1)=0. | Padding; R05. |
| Lean scaledGenerator_adjacent | Two rank-one projections with overlap1/2,d=4 | pqp=p/4; (2p)(2q)(2p)=2p. | Pass; positivity d>0 is sufficient. |
| Lean scaledGenerator_distant | Commuting diagonal projections, d=4 | Products both4pq; at pq=0 both0. | Padding; R05. |
| Lean jonesAction/generator/strand compatibility | Zero family; generator-preserving identity map | U_i↦0 at both levels; strand composites both send U_i to0, unit to1. | Native universal property; not trace compatibility. |
| Lean jonesAction_map_star/jonesStarAction | x=i·1; self-adjoint generators | Both sides −i·1; coefficient-fixing reflection would give +i·1 and fail StarModule ℂ. | Pass binders retained. |
| Lean shadedBox | B=M₂,N=M=C,T_n=B | Degree0=C; degree1 both M₂; no tower axiom ties T to N or M. | Consistent formula, no reconstructed invariant; R04. |
| Lean GradedCarrier | P_n=C, k=0,1 | Each is finitely supported scalar sequences; a degree-r basis vector lies at box index r+k. | Correct direct sum, no product/headline supplied; R04. |
| Lean RigidWeight | τ=0,root=2·1 | positivity via √2·1; balance0=0 although normalized trace would require2=1/2. | Raw data, insufficient rigid normalization; R04. |
| Lean JonesIndexValues | 0,1,2,4,∞ | Membership false,true,true,true,true; m=0,1,2 are excluded by 3≤m. | Correct set; infinity theorem is padding. |
| Lean PositivePartition | Nonzero A,n=0,1; zero algebra,n=0 | Empty sum gives0≠1 in nonzero A; n=1 forces term1; zero algebra has0=1 and an empty partition. | Pass carrier boundary. |
| Lean partitionValue/raw positive E | A=C,τ=id,E=2id,partition(1) | η(2)−η(1)=−2log2<0; positivity of E alone does not give entropy positivity. | File acknowledges this; not a headline, R04. |
| Lean relativeEntropyCandidate | τ=0,arbitrary positive E; E=id | All values0, supremum0; identity also gives every difference0. | Pass raw definition; identity results are padding. |
| Lean partitionValue bound | Identity E and any partition | ofReal(0)=0≤sup{0}=0. | Direct `le_sSup` instance; delete per R05. |

## Not verifiable

- **The worker's exact seeded target list:** no 15 target identifiers were supplied. The replacement sample is disclosed above; it is not represented as that original sample.
- **Jones–Sunder (`js`):** the sources service resolved DOI 10.1017/CBO9780511566219 to Cambridge's book landing page but did not obtain the text. The publisher's accessible material is frontmatter/access information, not §§5.3–5.7. In particular the full commuting-square propagation and compactness hypotheses/column indexing were not source-certified. Concrete square tests are recorded above.
- **Evans–Kawahigashi (`ek`):** the service resolved DOI 10.1093/oso/9780198511755.001.0001; the publisher returned HTTP 403. Theorems 11.22–11.24, printed p.578, including exhaustive rooted flat-connection counts and the E₈ flatness proof, were not read. Trigonometric index and chirality checks do not certify that classification.
- **Popa (`popa`):** the service classified DOI 10.1007/BF02392646 as uncertified/paywalled. It was not bypassed and is not a new missing-text request. The exact Skau lemma, the proof steps inside §5.1.2, the local quantization/general approximation passage and Appendix A were not source-certified. This report does not call those inaccessible proofs sound.
- **JSW/GJS diagram details:** both PDFs were fetched legally through the service; their local extractions contain glyph names. The web reader recovered the theorem/definition text cited above. PDF screenshots failed and no local PDF renderer was available. The actual contraction, cup, dagger and X/Y diagrams, and thus complete marked-interval/sign comparisons, remain uncertified. No OCR or downloaded code was installed.
- **Full diagrammatic/coherence/classification proofs:** scalar and small-graph instances test conventions but do not prove operad presentation completeness, every tangle comparison or the classification. All README prose was read, but the table is a collection of adversarial instances, not a claim to have formally proved those broad specifications.

The single scratch missing-reference list retains the two unavailable books and records the limited unreadable-diagram requests. It removes the initially unresolved Anantharaman–Popa and Chen entries after successful author-page/open-publisher retrieval. No source text was copied into the repository or this report, and no manifest was changed.

## Source issues

- **Misprint** in burns at Theorem 2.2.40, printed p.56: the source says the rigid modulus is λ times the spherical modulus; it should be λ⁻¹ times the spherical modulus, as its circle calculation shows; affects a stated result.
