# Review of PerfectoidTowers (pull request #816 at 8dfcc4b)

**Verdict:** needs changes

## R01 (P2) — Retain the general finite-quotient targets

**Location:** `TauCetiRoadmap/PerfectoidTowers/README.md:1321` and `:1364`: “The orbit condition is added beyond [HJ] Theorem 5.3” and “condition `horbit` is added beyond [HJ] Theorem 5.8.”

**Claim:** The end theorems still impose a restriction needed by one proof route. They do not retain the source-general quotient targets required by the general-library contract.

**Witness:** HJ lines 1237–1246 and 1345–1351 state both theorems without orbit injectivity. For an equivariant collapse of a two-point orbit, the stabilizer grows from the identity subgroup to the whole two-element group.

**Repair:** Keep the orbit-injective argument as an intermediate result; state the general end theorems and own the remaining separation argument or an alternative quotient construction. Preserve the negative control: a clean neighbourhood downstairs need not pull back cleanly when the stabilizer grows. With equal stabilizers the intermediate argument works; simply removing its hypothesis does not repair its proof. This is previous R01, still unresolved, not a counterexample to the general geometric theorem.

## R02 (P2) — Add the finite-character-line headline on native carriers

**Location:** `TauCetiRoadmap/PerfectoidTowers/README.md:2923`: “The latter gives finite projectivity and rank one at every prime.”

**Claim:** `finite_character_line` remains absent from `Suggested.lean`, although this affine headline is statable at the pins.

**Witness:** A fresh Mathlib-only probe elaborates finite projectivity and stalk rank one for `twistedInvariants c`, using finite faithful flatness and the canonical torsor tensor isomorphism. The split swap torsor over 𝔽₂ gives the diagonal line.

**Repair:** Add the headline with the actual twisted submodule, a finite group, finite faithfully flat algebra over its invariant ring, a unit cocycle, and the torsor equivalence whose pure-tensor formula is `b ⊗ b' ↦ (g ↦ b * (g • b'))`. Conclude `Module.Finite`, `Module.Projective`, and `Module.rankAtStalk = 1` at every prime. For `B = 𝔽₂ × 𝔽₂` and the trivial cocycle this is the diagonal 𝔽₂, of rank one; averaging is unavailable. Do not replace the torsor condition by mere faithfulness of the action. Previous R02 remains unresolved.

## R03 (P2) — Import the existing continuous-lift result

**Location:** `TauCetiRoadmap/PerfectoidTowers/README.md:1859`: “Lifting continuous cochains along finite surjections.”

**Claim:** P9.0 still assigns a separate proof target to a theorem already present at the Tau Ceti pin.

**Witness:** `TauCeti/RepresentationTheory/Homological/ContCohomology/ShortExact.lean:164`, `TauCeti.ContCohomology.exists_continuous_lift`, allows arbitrary source space and any surjection onto a discrete target. Its domain need not be discrete.

**Repair:** Delete the duplicate local proof target; cite this declaration in Scope and ownership and Exact supplier contracts, and use it with `X = Gⁱ`. Under `ℤ/4 → ℤ/2`, the section taking residues 0 and 1 to 0 and 1 gives the required lift, exactly as the pinned proof does. The newly readable Rubin reference supports the mathematics but does not change ownership. Previous R04 remains unresolved.

## R04 (P2) — Use the supplier's ring-level seminormality predicate

**Location:** `TauCetiRoadmap/PerfectoidTowers/README.md:3254`: “The affine criterion `IsSeminormalRing` requires a reduced ring and a common root”.

**Claim:** The roadmap still proposes a second predicate on arbitrary commutative rings, justifying it by the geometric carrier of the supplier. The supplier already provides the ring predicate.

**Witness:** `TauCetiRoadmap/DiamondsAndVStacks/Suggested.lean:382` at its open head defines `IsSeminormalRing (A : Type u) [CommRing A]`. Its README D6.9 affine inputs give reducedness and unique square–cube lifting.

**Repair:** Consume `TauCetiRoadmap.DiamondsAndVStacks.IsSeminormalRing` on each chart ring, removing the duplicate predicate and proposed definitional-agreement API. Swapping the two variable names matches the conventions; reducedness gives uniqueness. A field and a product of two fields satisfy the criterion; dual numbers over ℚ fail reducedness in both formulations. Previous R05 remains unresolved.

## R05 (P3) — Remove the forbidden roadmap import

**Location:** `TauCetiRoadmap/PerfectoidTowers/Suggested.lean:5`: `import TauCetiRoadmap.PerfectoidSpaces.Suggested`.

**Claim:** The acceptance test imports another roadmap's proposed carriers instead of using only the pinned libraries. Both gate runs reject this.

**Witness:** Gate `imports=1`. Pin searches find none of `IsPerfectoidTateRing`, `IsIntegralPerfectoid`, `Perfd`, or `isAffinoidPerfectoid`; the elaborated signatures explicitly obtain these from `TauCetiRoadmap.PerfectoidSpaces`.

**Repair:** Delete the import and its dependent signatures for invariant perfectoidness, perfectoid quotients, and both perfectoidization theorems. Name these headlines and their missing carriers in the module docstring; retain their full README targets. Keep the native invariant-pair, pre-adic quotient, clean-neighbourhood and affine descent statements. The fresh Mathlib-only probe in R02 confirms the character-line headline survives this repair. Previous R07 remains unresolved.

## R06 (P3) — Remove the three outside-folder changes

**Location:** PR diff: `TauCetiRoadmap/DiamondsAndVStacks/README.md`, `Suggested.lean`, and `metadata.toml`.

**Claim:** These files remain outside the roadmap authorized as this pull request's own. The incremental diff has no new outside-folder changes, but the complete PR diff still contains all three.

**Witness:** `git diff --stat origin/main...HEAD` outside PerfectoidTowers reports three files and 11,098 insertions. Gate `outside-folder=3` names the same files.

**Repair:** Restack or rebase so these files are supplied by their own roadmap change and disappear from this PR's diff. Continue citing DiamondsAndVStacks by roadmap and section. The repair is verified when the outside-folder diff is empty and this gate count is zero. Previous R08 remains unresolved.

## R07 (P3) — Delete admitted boundary Checks from Suggested.lean

**Location:** `TauCetiRoadmap/PerfectoidTowers/Suggested.lean:199`, `:211`, and `:344`: `isTateAffinoid_zero`, `isTateAffinoid_not_padic_integers`, and `cech_operators_without_joint_continuity`.

**Claim:** These are admitted boundary Checks, not headline theorems.

**Witness:** Their values are `Spa(0)=∅), a nonanalytic closed point in `Spa(ℤ_p,ℤ_p)`, and zero fibre `{0}` for `h ↦ e_h-e_0` in the discrete regular module. The README already contains these Checks.

**Repair:** Delete them from `Suggested.lean`; retain the computations as README Checks, including the corrected zero-target explanation. Fresh individual `simp`, `rfl`, and `infer_instance` attempts did not close these admissions; their exclusion follows from the boundary-Check rule, not a claim that those tactics prove them. Previous R09 remains unresolved.

## R08 (P3) — Remove the exception for nonexistent local Lean names

**Location:** `TauCetiRoadmap/PerfectoidTowers/README.md:130`: “their backticked names fix what the formalisation is to be called.”

**Claim:** The README still treats undeclared local APIs and Checks as named Lean declarations. The new prose at line 2704 continues to use `TwistedCharacterSheaf.congr_cocycle`, absent from the acceptance test.

**Witness:** `PerfectoidSpace.IsZariskiOpen` and `TwistedCharacterSheaf.congr_cocycle` are README-only names. Neither is declared in this roadmap's unchanged `Suggested.lean`.

**Repair:** Use mathematical prose and descriptive target labels for README-only APIs and Checks. Reserve local backticked declaration names for actual acceptance-test declarations, retaining exact names for real suppliers. Do not fill Lean with these APIs. Multiplication by `F=(1,2)` still sends `(a,a)` to `(a,2a)` when expressed in prose. Previous R10 remains unresolved.

## R09 (P3) — Correct the Hansen theorem-part locators

**Location:** `TauCetiRoadmap/PerfectoidTowers/Suggested.lean:72` and `:80`: “Hansen Theorem 3.1(i)” and “Hansen Theorem 3.1(iii)”.

**Claim:** The theorem has no numbered parts, and its conclusion is the orbit-space homeomorphism, not these two preliminary ring statements.

**Witness:** Hansen lines 152–158, printed p. 4, state the unpartitioned Theorem 3.1 and introduce four proof steps. Neither cited theorem part exists.

**Repair:** Cite §2 and the relevant preliminary argument or proof step in §3.1, distinguishing those arguments from Theorem 3.1 itself. If proving a preliminary assertion locally, name its inputs. The intended norm construction remains `N(ϖ)=ϖ` for the trivial group and `N(ϖ)=ϖ²` for a trivial two-element action. Previous R11 remains unresolved.

## Previous findings

- R01 — not repaired: README P8.16–P8.17 still add orbit injectivity beyond HJ's hypotheses; retained as this report's R01.
- R02 — not repaired: README line 2923 promises finite projectivity and stalk rank one, but the unchanged Lean file omits the headline; retained as R02.
- R03 — repaired: the dependency is now to ProfiniteCohomology on main, whose Layer 3 supplies the cited comparison. The current order and checker report no upward edge; no textual repair was needed.
- R04 — not repaired: README P9.0 still plans the continuous-lift theorem already proved at the pin; retained as R03.
- R05 — not repaired: README P9.12 still assigns a new affine predicate despite the supplier's ring-level definition; retained as R04.
- R06 — repaired: README lines 1422–1426 allow the unique zero-target map and exclude only nonzero targets, where the image of ϖ is zero and cannot be a unit.
- R07 — not repaired: Suggested.lean line 5 still imports the PerfectoidSpaces roadmap; retained as R05.
- R08 — not repaired: the full PR diff still includes all three DiamondsAndVStacks files, despite no new outside-folder change since b251000; retained as R06.
- R09 — not repaired: the three admitted boundary Checks remain at Lean lines 199, 211 and 344; retained as R07.
- R10 — not repaired: README line 130 still authorizes undeclared backticked API names, and the new cocycle-change prose uses one; retained as R08.
- R11 — not repaired: Lean lines 72 and 80 still cite nonexistent parts of Hansen Theorem 3.1; retained as R09.

## Verified sound

:robot: Independent AI review. This is an incremental re-review of 29 changed lines since b251000, not a repeat of the full review. Nine findings remain: four P2 and five P3. The changed zero-ring statement, algebraic cocycle-change formula, continuity condition, infinite-coefficient negative control, and Rubin edition locator were examined in full. No new mathematical defect was found in those changes.

The root README's standing checklist and CONTRIBUTING were read; the parent-relative paths in the supplied AGENTS text do not exist in this checkout. Main-roadmap shape and relevant contracts were read in PadicFunctionalAnalysis, ProfiniteCohomology, PerfectoidSpaces and AdicSpacesPartIV. The two target files and pins are unchanged except for the supplied README diff. No tracked file was edited.

**Gate and Lean evidence.** The supplied gate has `imports=1`, `outside-folder=3`, `build=0`, with all other counters zero. The fresh gate repeats those two failures and zeroes elsewhere. A separate targeted `lake build TauCetiRoadmap.PerfectoidTowers.Suggested` succeeds, followed by direct `lake env lean` on the target: exit 0, exactly 15 `sorry` warnings, no errors. The targeted build supplies the previously missing imported object files.

A scratch copy mechanically printed all 24 declaration/instance signatures: 22 named declarations plus two anonymous instances given names only in the copy. No needed binder disappeared: perfectoidness, completeness, finite-group conditions, the Hausdorff clean-neighbourhood hypothesis, faithful scalars and scalar towers remain present. The target's Lean file did not change. All 15 admissions were tried with the separate one-tactic alternatives `simp`, `rfl`, and `infer_instance`; none closed, so the copy still emits 15 admission warnings. Pin reading distinguishes actual supplier results from the retained headlines. R07 applies independently of tactic success.

A separate fresh file using only `import Mathlib`, the existing real-bodied twisted-submodule definition and native algebraic carriers elaborated the missing finite-character-line signature. It uses finite faithful flatness, the canonical torsor tensor formula and a unit cocycle, with finite-projective/stalk-rank-one conclusion. There are no option overrides, dummy predicates or admitted data in that probe.

The dependency command's complete output is:

```text
depcheck: 186 roadmaps, 1134 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. ProfiniteCohomology is on main; the current open merge order lists DiamondsAndVStacks immediately before PerfectoidTowers. This resolves previous R03 and avoids carrying forward the obsolete RepresentationTheory path false positive. The full PR outside-folder diff, not just the 29-line incremental diff, was checked separately.

**Sources and seeded sample.** Three works were freshly obtained legally through the sources service: Rubin's AWS manuscript, HJ v2, and Hansen's author manuscript. No manifest or repository source file was edited. Unchanged sampled statements and their previously checked locators are carried forward from `PRREVIEW-PerfectoidTowers~3.md`; fresh source inspection is limited to the changed Rubin reference and retained source-dependent findings.

| Passage examined this round | Locator and evidence | Result |
|---|---|---|
| Lifting continuous cochains along finite surjections | Rubin Appendix B §2, Remark 2.2, printed p. 152; Rubin lines 6584–6589 | Discrete targets have continuous sections. This supports lifting, but the result is already pinned: R03. |
| Continuous cochains into an inverse limit | Rubin Definition 2.1, printed p. 151; Rubin lines 6568–6578 | Defines continuous cochains and the continuous-section argument. The README's product-topology proof supplies the inverse-limit identification; this is not an unconditional claim that cohomology commutes with limits. |
| Compact-coefficient canonical comparison | Same definition, plus Rubin lines 6550–6553 on compact-open function spaces | Rubin supplies the mathematical cochain carrier, not Mathlib's iterated carrier. The explicit currying argument and its local-compactness/joint-continuity assumptions remain necessary. |
| Corrected reference edition | Rubin lines 6579–6581 show printed pp. 151–152, distinct from PDF page indices | The cited AWS URL is readable and matches the numbered locators. The published-book pagination is not used to locate any target here. |
| General finite quotients | HJ Theorems 5.3 and 5.8, pp. 28–31; HJ lines 1237–1264 and 1345–1365 | The general source statements omit orbit injectivity. The pullback-of-clean-neighbourhood proof still needs the extra justification recorded in R01. |
| Invariant Huber pair locators | Hansen §3.1, Theorem 3.1, p. 4; Hansen lines 150–158 | The theorem is unpartitioned: R09. Its orbit-space conclusion agrees with the retained headline. |

Of the seeded targets, the two cochain targets are directly affected by the changed bibliography and were rechecked above. The invariant-pair locator was also reopened for previous R11. Zariski-closed embeddings and opens, Good towers, Further Checks, finite quotients of good towers, closed-locus tilde limits, completed structure sheaves, smooth pushforward, Galois towers, Čech data, both function-descent targets, and affinoid reconstruction retain the previous review's source evidence and computed rows below. No changed passage introduces an unverified-source marker.

**Pinned and supplier evidence reopened this round.** Library paths below are relative to their respective pinned repositories. Pins are Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.

| Object | Exact declaration/contract read | What it supplies and does not supply |
|---|---|---|
| Zero-pair convention | `TauCeti/RingTheory/Huber/Basic.lean:165`, `IsPseudoUniformizer` | Unit and topological nilpotence; no nontriviality axiom. Hence zero qualifies in the zero ring only. |
| Continuous lift | `TauCeti/RepresentationTheory/Homological/ContCohomology/ShortExact.lean:164`, `exists_continuous_lift` | Arbitrary source, discrete target, surjection; stronger than the local target. |
| Fixed scalar condition | `Mathlib/RingTheory/Invariant/Defs.lean:31`, `Algebra.IsInvariant` | Fixed elements lie in the scalar image; does not assert faithful scalars. |
| Galois predicate | `Mathlib/RingTheory/IsGaloisGroup/Defs.lean:50`, `IsGaloisGroup` | Faithful action, scalar compatibility and invariant image; no finite-étale or tensor-torsor condition. |
| Stalk rank | `Mathlib/RingTheory/Spectrum/Prime/FreeLocus.lean:180`, `Module.rankAtStalk` | Finrank of the localized module over the localized ring, used by the fresh headline probe. |
| Inversion near units | `Mathlib/Analysis/Normed/Ring/Units.lean:183`, `NormedRing.inverse_continuousAt`; `:200`, `Units.isOpenEmbedding_val` | Continuous inversion and agreement of the units topology with the ambient topology in the Banach setting; supports the new continuity clause. |
| Profinite product sections | `TauCetiRoadmap/PerfectoidSpaces/README.md:14460`, P6.8 | `O⁺(X×G)=C(G,O⁺(X))`, finite stages and the pro-étale product; used by the new example. |
| Mixed tensor and Banach norm | `TauCetiRoadmap/AdicSpacesPartIV/README.md:1967`, `:2089`, R5.6 | Small coefficients and the bounded-family/supremum-norm formula. For ℤ_p[[Z]], the integral tensor is the power-series coefficient product. |
| Coefficient sheaf | `TauCetiRoadmap/AdicSpacesPartIV/README.md:2165`, R5.7 | Coefficient sheaf and qcqs finite-cover formulas. The new algebraic cocycle map uses restriction-compatible units. |
| Discrete canonical comparison | `TauCetiRoadmap/ProfiniteCohomology/README.md:777`, Layer 3, on main | Low-degree comparison with explicit noncommuting increment order and local compactness. This is now a permitted supplier. |
| Finite torsor module descent | `TauCetiRoadmap/AdicEtaleGeometry/README.md:9376`, A4.2a | Effective descent preserving finite projectivity and rank; permits characteristic dividing group order. |
| Affine seminormality | `TauCetiRoadmap/DiamondsAndVStacks/Suggested.lean:382`, open supplier head; README D6.9 affine inputs | General ring predicate, not just the fixed-field geometric carrier: R04. |

The citation service was rerun against main and the indexed open heads: it reports no cross-roadmap citation found nowhere. Unresolved local-name leads were not treated as missing suppliers. The changed passage's contracts and the suppliers relevant to previous findings were read at main or the supplied open head, not inferred from that scanner. Object searches used the roadmap service, board package READMEs, and both pins for the continuous-lift, seminormality, mixed-coefficient and orbit-continuity objects. The product and mixed tensor remain owned by PerfectoidSpaces and AdicSpacesPartIV; the new cocycle discontinuity example is their application here, not a second foundational construction. No new declaration or fully qualified name was added to Lean.

**Headline inventory.** Carried from the previous report and compared with the unchanged acceptance test: invariant Tate pairs and orbit spectra (P8.1–P8.2); invariant perfectoidness and localization (P8.4–P8.5); finite categorical, rigid and perfectoid quotients and diamond/torsor comparisons (P8.6–P8.12, P8.16–P8.17); clean neighbourhoods (P8.13); separation and closed loci (P8.14–P8.15, P8.21); perfectoidization (P8.18); good towers and their quotients (P8.19–P8.20); continuous Čech/cochain comparisons and completed-function descent (P9.0–P9.7); finite-projective descent (P9.8); character comparison, finite-character lines and reconstruction (P9.9–P9.10); smoothoid and seminormal descent (P9.11–P9.12); integral matrix-frame effectivity (P9.13). The docstring names the missing geometric carrier families. R02 is the statable affine omission; R05 is the impermissible source of four perfectoid headline signatures.

**Adversarial table.** The unchanged rows below retain their computed values from the previous report, with an explicit citation in every row. This is carried evidence, not a claim to have rerun a full mathematical audit. Fresh rows replace the zero-target and Rubin-comparison rows and cover every changed mathematical assertion, its conventions and the new negative control. As before, K denotes a nonzero perfectoid field when needed; passing examples do not prove the general theorems.

| Statement / location | Instances tried | Values on the two sides | Result / change |
|---|---|---|---|
| Finite-action convention and norm, P8.1 | Trivial group; trivial `C₂`; permutation `S₃` on `K³` | Norm of `π`: `π`, `π²`; `S₃` fixed triples exactly `(a,a,a)` | Pass; no commutativity of the acting group used; carried from `PRREVIEW-PerfectoidTowers~3.md` |
| Invariant pair and plus ring, P8.1 | Swap on `K²`; zero ring | Fixed ring `diag K`, fixed plus `diag O_K`; zero pair `(0,0)` | Pass; carried from `PRREVIEW-PerfectoidTowers~3.md` |
| Tate topology, P8.1 | Trivial `C_p` in characteristic `p=2,3` | Product norm `π^p` is a unit tending to zero; additive trace of `1` is `0` | Pass; averaging would fail; carried from `PRREVIEW-PerfectoidTowers~3.md` |
| Closedness/completeness of invariants | Swap on complete `K²` | Kernel of `(a,b)↦a-b` is the closed diagonal; a Cauchy diagonal pair limits to `(a,a)` | Pass; completeness retained; carried from `PRREVIEW-PerfectoidTowers~3.md` |
| Orbit spectrum, P8.2 | Swap two points; trivial action; empty spectrum | Orbit cardinalities `2→1`, `n→n`, `0→0`; invariant spectra have the same cardinalities | Pass; carried from `PRREVIEW-PerfectoidTowers~3.md` |
| Rational inverse images, P8.2/P8.5 | Diagonal `f,g` in `K²` | Both components impose the identical inequality `\|f\|≤\|g\|`; inverse image is both components or neither | Pass; carried from `PRREVIEW-PerfectoidTowers~3.md` |
| Quotient v-sheaf presentation, P8.3 | Split torsor `Y×G`; trivial nontrivial action | Split fiber pair `(g,h)` has unique increment `g⁻¹h`; trivial action has `\|G\|` arrows over the same diagonal pair | Pass; presentation does not assert free action; carried from `PRREVIEW-PerfectoidTowers~3.md` |
| Perfectoid invariants, P8.4 | Swap on a characteristic-`p` perfectoid product, `p=2,3` | Fixed ring `K`; Frobenius root of `(a,a)` is `(a^(1/p),a^(1/p))` | Pass; carried from `PRREVIEW-PerfectoidTowers~3.md` |
| Finiteness hypothesis, P8.4 | Completed root tower with infinite `ℤ_p` action | Fixed algebra is ordinary `K⟨T⟩`; `T` has no Frobenius root modulo a small pseudouniformizer | Correct negative control; no infinite-group generalization; carried from `PRREVIEW-PerfectoidTowers~3.md` |
| Invariant rational localization, P8.5 | Empty rational domain; whole domain; swap | Both localized invariant rings are respectively `0`, `A^G`, `diag K` | Pass; carried from `PRREVIEW-PerfectoidTowers~3.md` |
| Categorical quotient definition, P8.6 | Identity; split finite orbit; empty space | Invariant maps factor uniquely through `X`, a point, and `∅`, respectively | Pass; uniqueness is part of the definition; carried from `PRREVIEW-PerfectoidTowers~3.md` |
| Plus/rational quotient distinction, P8.6/P8.9 | Swap on `ℚ₂²` | Averaging `(1,0)` gives `(1/2,1/2)` in the rational ring, outside `ℤ₂²` | Pass; no integral averaging conclusion; carried from `PRREVIEW-PerfectoidTowers~3.md` |
| Affinoid perfectoid quotient, P8.7 | Swap and trivial action | Section equalizer is `diag K` and `A`, respectively; quotient is the corresponding affinoid | Pass; carried from `PRREVIEW-PerfectoidTowers~3.md` |
| Scalar-extension comparison, P8.7 | One coefficient coordinate; two coordinates | Fixed scalar extension has coordinates `(a)` or `(a,b)` with each coordinate invariant on both sides | Pass; coefficient model matters; carried from `PRREVIEW-PerfectoidTowers~3.md` |
| Invariant-cover gluing, P8.8 | Two-point orbit; trivial cover; empty cover of empty space | Local quotients glue to one point, `X`, and `∅`; restrictions on overlaps agree | Pass; carried from `PRREVIEW-PerfectoidTowers~3.md` |
| Analytic affinoid boundary, P8.9 | Zero ring; `ℤ_p`; `ℚ_p` | `Spa(0)=∅`; `ℤ_p` has the nonanalytic closed point; `ℚ_p` has topologically nilpotent unit `p` | Pass as README Checks; previous R09 deletes admissions; carried from `PRREVIEW-PerfectoidTowers~3.md` |
| Rigid quotient without invertible order, P8.10 | `C_p` translation `T↦T+1` in characteristic `p` | Invariant `T^p-T` is unchanged; extension degree `p`; trace of `1=0` | Pass; wild case retained; carried from `PRREVIEW-PerfectoidTowers~3.md` |
| Diamond quotient, P8.11 | Trivial action; purely inseparable characteristic-`p` field extension | Trivial quotient map is identity; perfection identifies inseparable test data although original field inclusion need not be an isomorphism | Pass; no ordinary-space inference from the latter; carried from `PRREVIEW-PerfectoidTowers~3.md` |
| Free quotient criterion, P8.12 | Split torsor; nontrivial trivial action | Relation map has one preimage per pair for split torsor, `\|G\|` preimages over each diagonal pair for trivial action | Pass; trivial-action quotient can be étale without being a `G`-torsor; carried from `PRREVIEW-PerfectoidTowers~3.md` |
| Clean-neighbourhood definition, P8.13 | Reflection at `x=1` in `ℝ`; at `x=0` | `(1/2,3/2)` and its reflection disjoint; stabilizer at `0` is all of `C₂` | Pass; carried from `PRREVIEW-PerfectoidTowers~3.md` |
| Existence of clean neighbourhoods, P8.13 | `S₃` on three discrete points | Singleton has stabilizer of order `2`; distinct translates intersect in `∅` | Pass for nonabelian group; carried from `PRREVIEW-PerfectoidTowers~3.md` |
| Hausdorff necessity for clean sets | Doubled origin with swapping involution | Two origins are distinct, but every pair of their neighbourhoods intersects | Correct negative control; carried from `PRREVIEW-PerfectoidTowers~3.md` |
| Closed-embedding definition, P8.14 | Ideals `0`, `1`, `(T)` in perfected disc | Universal loci are `X`, `∅`, `Spa(K)`; raw quotient by `(T)` has nonzero `T^(1/p)` with p-th power `0` | Pass; wrong quotient excluded; carried from `PRREVIEW-PerfectoidTowers~3.md` |
| Affinoid strong-closure comparison | Perfectoid origin map | Ring and plus maps are `T^(1/pⁿ)↦0`, with images `K` and `O_K`; both surjective | Pass; carried from `PRREVIEW-PerfectoidTowers~3.md` |
| Topological closure is insufficient | Gauss point in perfected disc | Vanishing ideal at Gauss point is `0`, whose locus is the whole disc, not its proper specialization closure | Pass; carried from `PRREVIEW-PerfectoidTowers~3.md` |
| Zariski-open empty Check | `U=∅` | Complement `X` is image of identity closed embedding | Pass; carried from `PRREVIEW-PerfectoidTowers~3.md` |
| Zariski-open whole Check | `U=X` | Complement `∅` is image of zero-ring closed subspace | Pass; carried from `PRREVIEW-PerfectoidTowers~3.md` |
| Zariski-open punctured-disc Check | `T≠0` | Complement is the perfectoid origin with ring `K`, not the nilpotent quotient | Pass; carried from `PRREVIEW-PerfectoidTowers~3.md` |
| Analytic separation/self-product, P8.15 | Affinoid; identity diagonal | Multiplication `A⊗̂_K A→A` sends `a⊗1` to `a`; diagonal equations vanish | Pass; carried from `PRREVIEW-PerfectoidTowers~3.md` |
| Analytic-separation negative control | Doubled disc along punctured disc | Two distinct origins give a missing off-diagonal limit pair; diagonal is not closed | Pass; ordinary gluing does not confer separation; carried from `PRREVIEW-PerfectoidTowers~3.md` |
| General rigid quotient, P8.16 | Hausdorff two-point orbit; collapsed orbit under an equivariant quotient | Stabilizers are equal in first case; second changes stabilizer from `{1}` to `C₂` | previous R01: intermediate argument does not discharge general target; carried from `PRREVIEW-PerfectoidTowers~3.md` |
| General perfectoid quotient, P8.17 | Disjoint pair of perfectoid points; empty space | Quotients are one perfectoid point and `∅`; `horbit` holds automatically here | Pass on these instances; previous R01 retains general theorem; carried from `PRREVIEW-PerfectoidTowers~3.md` |
| Weakly affinoid quotient map | Swap two affinoid components | Preimage of quotient rational domain is two copies of that affinoid rational domain | Pass; carried from `PRREVIEW-PerfectoidTowers~3.md` |
| Integral perfectoidization, P8.18 | Perfect characteristic-`p` ring; square-zero integral extension | Identity on perfect ring; `ε^(p)=0` makes `ε=0` after perfection | Pass; carried from `PRREVIEW-PerfectoidTowers~3.md` |
| Necessary completion in characteristic `p` | Integral algebraic field extension not complete | Uncompleted perfect closure remains noncomplete; completion adds limits of Cauchy sequences | Pass; localization alone is insufficient; carried from `PRREVIEW-PerfectoidTowers~3.md` |
| Integral-model plus ring | `O_K[ε]/ε²` inside `K[ε]/ε²` | `(ε/π)²=0` but `ε/π` is not in the original plus model | Pass; take image and integral closure; carried from `PRREVIEW-PerfectoidTowers~3.md` |
| Good-tower definition, P8.19 | Constant perfectoid point; empty tower | Diamond limits are that point and `∅`; level maps are identities | Pass; carried from `PRREVIEW-PerfectoidTowers~3.md` |
| Good tower versus tilde-limit | Constant `ℙ¹` in characteristic `p` | Perfected limit charts contain `T^(1/p)`; the constant chart algebra does not densely contain it | Pass; representability alone is not tilde-limit density; carried from `PRREVIEW-PerfectoidTowers~3.md` |
| Mixed-characteristic bad constant tower | Constant ordinary `ℙ¹` | Chart `K⟨T⟩` has no perfectoid Frobenius-root property | Correctly excluded; carried from `PRREVIEW-PerfectoidTowers~3.md` |
| Projective-level hypothesis | Constant affine line | Affine line is not projective; it cannot be inserted as a good tower merely because transition maps are identities | Correctly excluded; carried from `PRREVIEW-PerfectoidTowers~3.md` |
| Finite quotient of good tower, P8.20 | Trivial group; swap two projective points | Quotient levels are original levels and one point; limit quotient gives the same results | Pass; carried from `PRREVIEW-PerfectoidTowers~3.md` |
| Closed loci in towers, P8.21 | Zero/unit ideals; perfected coordinate origin | Both comparison sides are `X∞`, `∅`, and `Spa(K)` | Pass; carried from `PRREVIEW-PerfectoidTowers~3.md` |
| Analytification map convention | Affine map `T↦T²`, points `2,1,0` | Images `4,1,0` on both algebraic and analytic sides | Pass; covariant point map fixes direction; carried from `PRREVIEW-PerfectoidTowers~3.md` |
| Continuous lifting, P9.0 | `ℤ/4→ℤ/2`; identity; connected source | Section sends `0,1` to `0,1`; identity lift is itself; connected-source map is constant | True but already pinned: previous R04; carried from `PRREVIEW-PerfectoidTowers~3.md` |
| Lifting without discreteness | `ℝ→ℝ/ℤ`, identity of circle | A continuous lift would split the universal cover; induced map on π₁ would be both identity and zero | Correct negative control; carried from `PRREVIEW-PerfectoidTowers~3.md` |
| Cochains and inverse limit | `ℤ_p=lim ℤ/pⁿ`; zero transitions | Compatible residue cochain maps to the same p-adic value; zero transitions force every limit coordinate `0` | Pass; carried from `PRREVIEW-PerfectoidTowers~3.md` |
| Homogeneous/inhomogeneous inverse convention | `S₃`, increments `g,h` | Homogeneous triple `(1,g,gh)` maps to `(g,h)`; reconstructing returns `(1,g,gh)` | Pass; noncommuting order retained; carried from `PRREVIEW-PerfectoidTowers~3.md` |
| Completed structure sheaves, P9.2 | Perfectoid point; characteristic-`p` input to p-adic rational construction | Point gives `O_K`, then `K`; if `p=0`, subsequent inversion of `p` gives `0` | Pass; characteristic range not silently extended; carried from `PRREVIEW-PerfectoidTowers~3.md` |
| Completion precedes finite-stage sections | Toric tower | `Σ pⁿT^(1/pⁿ)` converges in completed limit; exponents are not bounded at any finite level | Pass; carried from `PRREVIEW-PerfectoidTowers~3.md` |
| Smooth pushforward, P9.3 | Point; smooth disc | Point has degree-zero `K` and positive differential forms `0`; disc has `Ω¹=O·dT` | Pass; cannot assert all higher direct images vanish; carried from `PRREVIEW-PerfectoidTowers~3.md` |
| Cyclotomic coefficient convention | Multiplication by `1+p` | Modulo `p`: `1`; modulo `p²`: `1+p`, not `1` | Pass; twist not trivialized integrally; carried from `PRREVIEW-PerfectoidTowers~3.md` |
| Pro-étale tower, P9.4 | Identity; finite split torsor; toric root tower | Fibers respectively singleton, `G`, and compatible root choices; inverse fiber product described by group increments | Pass; carried from `PRREVIEW-PerfectoidTowers~3.md` |
| Nonreduced finite-stage Check | `K[ε]/ε²`, plus `O_K+Kε` | Modulo `pⁿ`, the nilpotent part is `Kε/pⁿKε=0`; completed plus ring is `O_K` | Pass; no contradiction from finite-stage nilpotents; carried from `PRREVIEW-PerfectoidTowers~3.md` |
| Sequential tower scope | `G=∏_{i∈I} C₂`, uncountable `I` | A countable open-normal family misses a coordinate; its intersection contains its nonidentity element | Excluded by sequence hypothesis; the separate product-section formula remains valid; carried from `PRREVIEW-PerfectoidTowers~3.md` |
| Profinite product sections | Finite `G`; infinite `ℤ_p`; empty `X` | Finite product `K^G`; continuous functions `C(ℤ_p,K)`; zero ring; translation-fixed functions are constants | Pass; not arbitrary discontinuous functions; carried from `PRREVIEW-PerfectoidTowers~3.md` |
| Čech differential, P9.5 | Swap on `K²`, `a=(a₀,a₁)` | `d⁰a(σ)=(a₁-a₀,a₀-a₁)`; `σd⁰a(σ)+d⁰a(σ)=0` | Pass; carried from `PRREVIEW-PerfectoidTowers~3.md` |
| Higher differential sign | Group elements `g,h` | `g(h a-a)-(gh a-a)+(g a-a)=0` | Pass for nonabelian groups too; carried from `PRREVIEW-PerfectoidTowers~3.md` |
| Joint-continuity negative control | Discrete regular module over additive `ℤ_p` | `d⁰e₀(h)=e_h-e₀`; zero fiber `{0}` is not open | True Check; previous R09; carried from `PRREVIEW-PerfectoidTowers~3.md` |
| Function descent, P9.6 | Toric root tower; trivial torsor | Invariants are integral-exponent functions; for product torsor they are constant functions on group coordinate | Pass; carried from `PRREVIEW-PerfectoidTowers~3.md` |
| Integral function descent | Same examples | Fixed functions of norm at most `1` give precisely base plus ring | Pass; boundedness reflected; carried from `PRREVIEW-PerfectoidTowers~3.md` |
| Product weight comparison, P9.7 | Countable coefficient model; one coordinate | Coordinatewise fixed sequences on both sides; singleton coefficient recovers original invariant ring | Pass; carried from `PRREVIEW-PerfectoidTowers~3.md` |
| Non-product rational region | Bidisc diagonal Gauss point | `\|T-S\|=0` at diagonal; independent pair of Gauss coordinates has `\|T-S\|=1>\|π\|` | Pass; product opens are not a basis; carried from `PRREVIEW-PerfectoidTowers~3.md` |
| Norm versus bounded equivalence | Rescaled one-dimensional norm | Unit vector norm is scale `c`, not necessarily `1`; rescaling map and inverse still have finite bounds | Pass; no false isometry; carried from `PRREVIEW-PerfectoidTowers~3.md` |
| Uniform-completion warning | Idempotents in weighted finite models | Original model can assign norm `pⁿ`, while uniform spectral norm of a nonzero idempotent is `1` | Pass; completions cannot be identified without the stated comparison; carried from `PRREVIEW-PerfectoidTowers~3.md` |
| Affine projective descent, P9.8 | `A=𝔽₂`, `B=A²`, swap; ranks `0,1,2` | Fixed submodules are `0`, `diag A`, `diag A²`; `m↦1⊗m` bijective onto each | Pass, including order zero in coefficients; carried from `PRREVIEW-PerfectoidTowers~3.md` |
| Faithfulness necessity | `A=𝔽₂²→B=𝔽₂`, first projection | `(0,1)≠0` maps to `0` in `B⊗_A A` | Hypothesis retained; carried from `PRREVIEW-PerfectoidTowers~3.md` |
| Integral local freeness versus coherent ideal | Ideal `(p,T)` at closed point of `ℤ_p⟨T⟩` | Generic rank `1`; fiber needs two generators | Pass; no claim every integral coherent module is locally free; carried from `PRREVIEW-PerfectoidTowers~3.md` |
| Twisted-invariant definition, P9.9 | Swap, `c(σ)=(1/2,2)` | `σ(a,2a)=(2a,a)=c(σ)⁻¹(a,2a)`; direct-cocycle convention instead gives line `(2a,a)` | Pass; inverse convention discriminates; carried from `PRREVIEW-PerfectoidTowers~3.md` |
| Cocycle necessity | Trivial group with assigned `c(1)=-1`, characteristic zero | Fixed equation forces `f=-f`, hence `f=0`; valid trivial cocycle gives full ring | Pass; arbitrary function is only a submodule, not a descent line; carried from `PRREVIEW-PerfectoidTowers~3.md` |
| Non-qc denominators | Disjoint union of points, section values `p^-n` | Each value has a denominator; no single power of `p` clears all | Pass; qc restriction matters; carried from `PRREVIEW-PerfectoidTowers~3.md` |
| Finite-character comparison, P9.10 | Swap, `u=(1,2)`, `c(σ)=(2,1/2)`, finite cocycle `1` | `(a,a/2)u=(a,a)`; inverse divides by the same unit | Pass; Lean uses this multiplication direction; carried from `PRREVIEW-PerfectoidTowers~3.md` |
| Finite-character projectivity/rank | Split `C₂` torsor over `𝔽₂`, trivial cocycle | Invariants `diag 𝔽₂`; dimension/rank `1` on the unique prime; `1/2` does not exist | previous R02: statable headline missing; carried from `PRREVIEW-PerfectoidTowers~3.md` |
| Affinoid reconstruction | Trivial line on affinoid; nontrivial torsion line on proper elliptic curve | Affinoid global module rank `1`; elliptic nontrivial degree-zero line has `H⁰=0` while fiber rank is `1` | Pass; latter is not an affinoid counterexample; carried from `PRREVIEW-PerfectoidTowers~3.md` |
| Infinite-pseudobasis density | `u=x/p`, target coefficient family `(uⁿ)` | Target sup norm `1`; for bounded source norm `C`, degree-n coefficient ≤`C p^-n`; distance is `1`, not `0` | Source error; README avoids the invalid inference; carried from `PRREVIEW-PerfectoidTowers~3.md` |
| Derived coefficient change | Complex `ℤ --2→ ℤ` in degrees `0,1`, tensor `𝔽₂` | Before: `(H⁰,H¹)=(0,𝔽₂)`; after derived tensor `(𝔽₂,𝔽₂)` | Pass; Tor contribution uses `H^(q+1)`, not `H^(q-1)`; carried from `PRREVIEW-PerfectoidTowers~3.md` |
| Mittag-Leffler finite coefficients | Fixed finite module with nested images | Image cardinalities decrease finitely often then stabilize; no infinitely decreasing chain of images | Pass with stated finiteness; carried from `PRREVIEW-PerfectoidTowers~3.md` |
| Smoothoid definition, P9.11 | Point; ordinary disc; empty space | Identity smooth chart; one-dimensional smooth chart; empty cover | Pass; ordinary disc is admitted although not perfectoid; carried from `PRREVIEW-PerfectoidTowers~3.md` |
| Degree-zero smoothoid comparisons | Point and annulus | Point rings `K⁺,K`; annulus functions `T,π/T` restrict to the same functions on the v-site | Pass; carried from `PRREVIEW-PerfectoidTowers~3.md` |
| All-open sheaf equalizers | Trivial torsor on non-product rational region; split finite torsor | Identity equalizer is `O(U)`; split equalizer is diagonal inside `O(U)^G`, also for plus sections | Pass; includes the non-product region; carried from `PRREVIEW-PerfectoidTowers~3.md` |
| Seminormal ring definition, P9.12 | Field; product; dual numbers | Common root for nonzero `a` is `b/a`; coordinatewise for products; dual numbers fail reducedness | True but duplicate owner: previous R05; carried from `PRREVIEW-PerfectoidTowers~3.md` |
| Seminormality necessity for functions | Cusp `K⟨t²,t³⟩` | `t²,t³` have common root `t` after seminormalization, while `t` is absent from original ring | Pass; comparison cannot be claimed for every reduced base; carried from `PRREVIEW-PerfectoidTowers~3.md` |
| Integral matrix frame, P9.13 | Rank `0`; trivial frame rank `1` | Unique empty vector/frame; rank-one fixed vectors exactly invariant scalars | Pass; no lost rank-zero case; carried from `PRREVIEW-PerfectoidTowers~3.md` |
| Integral frame orientation | Swap coefficients; `P₁=diag(1,2)`, `P₂=diag(2,1)` | `C₁=diag(1/2,2)`, `C₂=diag(2,1/2)` satisfy `C₁P₂=P₁`, `C₂P₁=P₂` | Pass; inverse matrix order fixed; carried from `PRREVIEW-PerfectoidTowers~3.md` |
| Integral-unit hypothesis | Ramified quadratic extension with `α²=p`, sign action | Anti-invariants `αℤ_p`; tensor counit has image `αO_L`, a proper ideal | Pass; a rational frame alone cannot give integral effectivity; carried from `PRREVIEW-PerfectoidTowers~3.md` |
| Lattice saturation/completion | Fixed lattice `F⊂E`, invariant nonzerodivisor `π` | If `πⁿx` is fixed, `πⁿ(gx-x)=0` forces `gx=x`; `F∩πⁿE=πⁿF` | Pass; this is the needed strictness, not a DVR assumption; carried from `PRREVIEW-PerfectoidTowers~3.md` |
| Universal zero perfectoidization, README 1422–1426 | S⁺=R⁺/(ϖ); zero target | ϖ maps to 0=1; all positive powers are 0; 0 has inverse 0; localization at ϖ is 0; unique map to (0,0) | Pass; previous R06 repaired |
| No-map negative control, README 1424–1426 | Any nonzero target | Image of ϖ is 0; if 0 were a unit, multiplying its inverse would give 0=1; thus no such map | Pass; excludes precisely the nonzero targets |
| Compact-coefficient cochains and Rubin locator | G=1, any module M; S₃ with increments g,h | Trivial-group terms M, differentials 0,id,0; triple (1,g,gh) dehomogenizes to (g,h) and reconstructs to (1,g,gh) | Pass; fresh locator Rubin lines 6571–6588; carrier comparison still uses the stated continuity assumptions |
| Algebraic cocycle-change isomorphism, README 2702–2706 | Swap on ℚ²; c=1, F=(1,2) | c′(σ)=(1/2,2); (a,a) maps to (a,2a); σ(a,2a)=(2a,a)=c′(σ)⁻¹(a,2a); inverse divides by F | Pass; multiplication direction and inverse cocycle agree |
| Continuous subclass, README 2707–2709 | Constant F=2; a frame factoring through a finite quotient | Constant frame gives F/g(F)=1 and c′=c; a finite-quotient frame has a finite, locally constant orbit, so both c′ and its inverse are continuous | Pass; finite-level orbit continuity suffices; arbitrary frames covered by next rows |
| Mixed tensor in the new Check, README 2744–2746 | A=ℤ_p[[Z]], X=Spa(ℂ_p), G=ℤ_p | Integral elements are sequences (a_n) with a_n in C(G,O_C); rational elements have one common denominator bound; norm is sup_n sup_g abs(a_n(g)) | Pass; R5.6 gives exactly this coefficient model |
| Unit and inverse, README 2747 | p=2 or 3; H=Σ e_n Z^n, F=1+pH | Inverse coefficients b₀=1, b₁=−p e₁, b₂=p²e₁−p e₂; all positive coefficients have norm ≤1/p; both F and F⁻¹ have norm 1 | Pass; multiplication by either unit is an isometry, since both operator norms are ≤1 |
| Noncontinuous orbit and changed cocycle, README 2748–2751 | p=2,3; m=0,1; n=m+1; g_m=p^m | e_n(0)=1, e_n(p^m)=0; coefficient difference has norm 1/p; all differences ≤1/p; both norms ‖g_mF−F‖ and ‖F/g_mF−1‖ equal 1/2 or 1/3 for every m | Pass; neither tends to 0 although g_m tends to 0 |
| Cocycle identity and algebraic line in the new Check | Same infinite-coefficient F; g,h arbitrary | (F/gF)g(F/hF)=F/(ghF); a fixed section a maps to Fa, and g(Fa)=(gF/F)Fa; division by F recovers a | Pass; discontinuity does not obstruct the algebraic invariant-sheaf isomorphism |
| Sheaf-level cocycle changes, README 2808–2812 | F=(1,2), inverse frame; empty open | Successive maps (a,a)↦(a,2a)↦(a,a); cocycle changes multiply to 1; empty-open section group is 0 and map is its identity | Pass; restrictions commute with multiplication; no topology is asserted for the abstract datum |

There are **95 rows: 85 carried and 10 freshly computed**. The former report's finding numbers in carried rows refer to that report; the reconciliation above gives their status here.

## Not verifiable

- The full general quotient proof without orbit injectivity is not supplied by the cited Hausdorff-quotient argument. R01 requires owning that missing work; no falsehood of the general quotient theorem is asserted.
- The newly linked Rubin AWS text is now verified. The aside about the published book's Appendix B beginning on p. 195 was not independently checked against that edition; none of the mathematical locators in this review relies on it.
- Source checks and adversarial rows for unchanged passages are explicitly carried from `PRREVIEW-PerfectoidTowers~3.md`, as required for this incremental review. They were not re-certified by fetching all nineteen previously read works. No source needed for the changed mathematical passages remains unreadable.
- Lean elaboration checks types, not the truth of the fifteen admitted theorems. No complete proof of those headlines is claimed.

## Source issues

The following source issues are carried from `PRREVIEW-PerfectoidTowers~3.md`; the HJ quotient-proof gap and theorem-notation misprint were also reread this round. No new source error was found in the changed Rubin citation.

- **Misprint** in ECD at the discussion after Theorem 5.8, printed p. 25, line 1010: the source says the plus-ring almost-surjection goes from the quotient back to the ambient ring; it should be the map from ambient plus ring to quotient plus ring; affects nothing.
- **Gap** in HJ at the proofs of Theorems 5.3 and 5.8, printed pp. 28–31, lines 1250–1264 and 1358–1361: the source says a clean neighbourhood pulls back cleanly through the maximal Hausdorff quotient; it should be justified by equality of the stabilizers or by another neighbourhood argument; affects the proof.
- **Misprint** in HJ at Theorem 5.8, printed p. 30, line 1350: the source says the quotient-point neighbourhood is a subset of the source space; it should be a subset of the quotient space; affects nothing.
- **Gap** in HJ at Lemma 5.10, printed p. 32, lines 1421–1425: the source says localizing integral perfectoidization directly produces the required perfectoid Tate ring; it should be completed for the chosen pseudouniformizer before localization when that completion is not automatic; affects the proof.
- **Misprint** in BHW at the proof of Lemma 3.7, printed p. 10, line 465: the source says sections on the base open are evaluated on the source and conversely; it should be source sections on the inverse-image open and base sections on the base open; affects nothing.
- **Gap** in BHW at the proof of Lemma 3.7, printed p. 10, lines 463–474: the source says product-open calculations suffice for the sheaf comparison on the product; it should be extended to a genuine basis or proved by descent on the v-site; affects the proof.
- **Misprint** in CHJ at the weighted projector before Theorem 2.28, printed p. 22, lines 1007–1010: the source says to average the inverse character although its immediately preceding twisted action uses the character; it should be the average of that preceding action with the same character convention; affects the proof.
- **Error** in CHJ at Lemma 6.19(2), printed p. 53, lines 2357–2365: the source says bounded-family restriction is Banach-dense because each coordinate restriction is dense; it should be restricted to finite pseudobases, since the displayed infinite family has distance one; affects a stated result.
- **Misprint** in Heuer at Lemma 2.13, printed p. 10, lines 445–449: the source says the relative degree-one differential term has twist indexed by an unspecified n; it should be the degree-one twist, namely minus one; affects nothing.
