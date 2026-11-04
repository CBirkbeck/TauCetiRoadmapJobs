# Review of PerfectoidTowers (pull request #816 at b251000)

**Verdict:** needs changes

## R01 (P2) — Keep the general quotient theorems as targets

**Location:** `TauCetiRoadmap/PerfectoidTowers/README.md:1321` and `:1364`: “The orbit condition is added beyond [HJ] Theorem 5.3” and “this orbit condition `horbit` is added beyond [HJ] Theorem 5.8.”

**Claim:** P8.16–P8.17 restrict the end theorems to make one Hausdorff-quotient proof work. The standing contract requires the general library, including the work needed to remove a proof-route restriction.

**Witness:** HJ lines 1237–1246 and 1345–1351 state the two quotient theorems without orbit injectivity. HJ lines 1358–1361 do not establish equality of the two stabilizers; the extra condition repairs that step only.

**Repair:** Retain the source-general quotient theorems as the end targets. Make the orbit-injective argument an intermediate theorem and own the remaining separation argument or an alternative quotient construction. Record the source proof gap explicitly. Do not remove `horbit` from the existing argument without replacing its use. For a Hausdorff orbit, both stabilizers coincide and the intermediate argument remains valid; if an equivariant Hausdorff quotient identifies two orbit points, its stabilizer grows and that argument cannot be applied. This distinction must remain a negative-control Check, rather than narrowing the end theorem.

## R02 (P2) — State the finite-character line headline

**Location:** `TauCetiRoadmap/PerfectoidTowers/README.md:2903`: “The affine comparisons are `finite_character_comparison_linear` and `finite_character_line`.”

**Claim:** The latter promises finite projectivity and rank one at every prime, but `Suggested.lean` states only the former. This affine headline is statable at the pins; the module docstring's geometric exclusions do not explain its absence.

**Witness:** A scratch file with only `import Mathlib`, the existing real `twistedInvariants` definition, a finite faithfully flat algebra, the finite torsor tensor isomorphism, and a unit cocycle elaborated a finite-projective, rank-one conclusion.

**Repair:** Add that headline on the actual twisted submodule. Use the finite torsor condition, not merely a faithful group action or the predicate `IsGaloisGroup`. The scratch signature used `B ⊗[B^G] B ≃ₗ[B^G] (G → B)` with the defining equation `b ⊗ b' ↦ (g ↦ b * (g • b'))`, finite faithful flatness, and the cocycle equation. Its conclusion is `Module.Finite`, `Module.Projective`, and `Module.rankAtStalk = 1` at every prime. The split torsor `B = 𝔽₂ × 𝔽₂`, with the swap action and trivial cocycle, gives the diagonal copy of `𝔽₂`, rank one, even though the group order is zero in the coefficients. This tests the required generality without averaging.

## R03 (P2) — Remove the upward ProfiniteCohomology dependency

**Location:** `TauCetiRoadmap/PerfectoidTowers/README.md:1912` and `:3389`: “ProfiniteCohomology Layer 3”.

**Claim:** This is an explicit supplier edge to a later roadmap. The dependency check cannot move this roadmap after that supplier without crossing an existing consumer.

**Witness:** The checker reports `PerfectoidTowers (#15) -> ProfiniteCohomology (#376)` and identifies `AnalyticToricGeometryPartII (#139)` as the intervening consumer. The relevant discrete comparisons already exist in pinned Tau Ceti.

**Repair:** Replace these edges with the pinned `TauCeti.ContCohomology.cochainEquiv0`, `cochainEquiv1`, `cochainEquiv2` and differential comparisons, already identified in the supplier table. Keep ownership here of the all-degree, nondiscrete extension and its currying proof. For the trivial group, both complexes have terms `M`, with differentials `0, id, 0, id, …`; this comparison needs no later roadmap. Rerun the dependency check after repointing the edges.

## R04 (P2) — Import the existing continuous-lift theorem

**Location:** `TauCetiRoadmap/PerfectoidTowers/README.md:1857`: “Lifting continuous cochains along finite surjections.”

**Claim:** P9.0 replans a result already proved at the pin, even giving the same section-of-a-surjection proof.

**Witness:** `TauCeti/RepresentationTheory/Homological/ContCohomology/ShortExact.lean:164`, `TauCeti.ContCohomology.exists_continuous_lift`, proves the result for arbitrary `X`, any surjection, and discrete target; it does not even require the source of the surjection to be discrete.

**Repair:** Delete this local proof target and cite the pinned declaration in Scope and ownership and Exact supplier contracts. State that its application to `X = Gⁱ` supplies the needed surjectivity. For `ℤ/4 → ℤ/2` and a continuous map with values `0,1`, the section choosing `0,1` gives exactly the proposed lift. No new construction is needed.

## R05 (P2) — Reuse the supplier's affine seminormality predicate

**Location:** `TauCetiRoadmap/PerfectoidTowers/README.md:3235`: “The affine criterion `IsSeminormalRing` requires a reduced ring and a common root”.

**Claim:** The justification for a new ring predicate says the supplier only has a fixed-field geometric predicate. Its open head also has the general ring predicate itself.

**Witness:** `TauCetiRoadmap/DiamondsAndVStacks/Suggested.lean:380` defines `IsSeminormalRing (A : Type u) [CommRing A]`; its README at line 436 supplies the affine square–cube criterion. The definition is not restricted to a rigid-space carrier.

**Repair:** Import the supplier's ring predicate by name and apply it to each chart ring; delete the second owner and its proposed definitional-agreement API. The supplier orders the square and cube variables oppositely, which is just a renaming. Its uniqueness clause follows from reducedness: equal squares and cubes force equality in every residue domain. Fields and their two-factor products satisfy both versions; `ℚ[ε]/(ε²)` fails both at reducedness. No geometric carrier conversion is required.

## R06 (P2) — Exclude the zero target from the no-map Check

**Location:** `TauCetiRoadmap/PerfectoidTowers/README.md:1422`: “no map `S⁺ → A⁺` sends `ϖ` to a pseudouniformizer”.

**Claim:** This fails under the roadmap's explicit zero-ring convention.

**Witness:** Take `S⁺ = R⁺/(ϖ)` and `(A,A⁺) = (0,0)`. The unique map sends `ϖ` to `0 = 1`, a topologically nilpotent unit. `IsPseudoUniformizer` at `TauCeti/RingTheory/Huber/Basic.lean:165` does not require nontriviality.

**Repair:** Say “no map into a nonzero perfectoid Tate pair”. Retain the unique map to the zero pair, which is exactly what the proposed universal object `T = 0` represents. In a nonzero target the image of `ϖ` is zero and is not a unit, so the corrected negative control holds; in the zero target the unique map remains allowed.

## R07 (P3) — Remove the roadmap import from the acceptance test

**Location:** `TauCetiRoadmap/PerfectoidTowers/Suggested.lean:5`: `import TauCetiRoadmap.PerfectoidSpaces.Suggested`.

**Claim:** The gate rejects this import. The file is supposed to state headlines against pinned libraries, not borrow another roadmap's proposed carriers.

**Witness:** Gate `imports=1`. Searches of both pins find no `IsPerfectoidTateRing`, `IsIntegralPerfectoid`, `Perfd`, or `isAffinoidPerfectoid`; these are supplied by the imported roadmap file instead.

**Repair:** Remove the import and the dependent signatures for perfectoid invariants, perfectoid quotients, and the two perfectoidization statements; name those headlines and their missing carriers in the module docstring. Retain their full targets in the README. Keep the native invariant-pair, pre-adic quotient, clean-neighbourhood and affine descent headlines. The Mathlib-only finite-character-line probe in R02 confirms that removing this import need not remove the affine character headline.

## R08 (P3) — Remove changes outside the reviewed roadmap

**Location:** PR diff, `TauCetiRoadmap/DiamondsAndVStacks/README.md`, `Suggested.lean`, and `metadata.toml`.

**Claim:** These are outside the folder authorized as this pull request's own in the review brief.

**Witness:** The outside-folder diff contains all three files; gate `outside-folder=3`. This review does not assess their content as changes belonging to PerfectoidTowers.

**Repair:** Remove those files from this pull request's diff, preserving the supplier work in its own roadmap change. Rebase or restack as needed so the outside-folder diff is empty. The supplier may still be cited by its roadmap and section; copying its files into this diff is unnecessary.

## R09 (P3) — Delete the admitted boundary Checks from Suggested.lean

**Location:** `TauCetiRoadmap/PerfectoidTowers/Suggested.lean:199`, `:211`, and `:344`: `isTateAffinoid_zero`, `isTateAffinoid_not_padic_integers`, and `cech_operators_without_joint_continuity`.

**Claim:** These are boundary/negative-control Checks, expressly described as such in the module docstring, rather than the roadmap's headline theorems.

**Witness:** Their conclusions concern the zero affinoid, the nonanalytic `ℤ_p` affinoid, and one discontinuous regular-action cochain. All three are README Checks; the acceptance-test rules exclude admitted Checks regardless of proof length.

**Repair:** Delete them from `Suggested.lean`; retain the mathematical Checks in the README. The computations remain useful: `Spa(0)=∅`; the closed point of `Spa(ℤ_p,ℤ_p)` obstructs analyticity; for the discrete regular module the inverse image of zero under `h ↦ e_h-e_0` is the nonopen singleton `{0}`. The scratch `simp`/`rfl`/`infer_instance` probes did not close these statements; their exclusion is the boundary-Check rule, not a claim that those probes proved them.

## R10 (P3) — Remove the exception for nonexistent Lean API names

**Location:** `TauCetiRoadmap/PerfectoidTowers/README.md:127`: “their backticked names fix what the formalisation is to be called.”

**Claim:** This convention contradicts the required README/Lean agreement. Many local API and Check names have no declaration in the acceptance test.

**Witness:** For example, the proposed `PerfectoidSpace.IsZariskiOpen` at line 1180 and `WeightExtension.smoothoidRationalComparison` at line 3143 have no declaration in this roadmap's `Suggested.lean`.

**Repair:** Express README-only APIs and Checks as mathematical prose and descriptive target labels. Reserve backticked local declaration names for the few definitions and headline theorems actually stated in `Suggested.lean`; retain backticked names for real supplier declarations. Do not bulk-add the missing API to Lean. The empty/whole/punctured-disc Checks still specify the same complements without invented declaration names.

## R11 (P3) — Correct the Hansen subpart locators

**Location:** `TauCetiRoadmap/PerfectoidTowers/Suggested.lean:72` and `:80`: “Hansen Theorem 3.1(i)” and “Hansen Theorem 3.1(iii)”.

**Claim:** The fetched theorem has no such numbered parts. The first statement concerns invariant Tate-ring structure and the second the plus ring; Theorem 3.1 states the orbit-space homeomorphism.

**Witness:** Hansen lines 152–158, printed p. 4, give the unpartitioned Theorem 3.1 and begin its four-step proof. The Huber-pair definitions precede it; “(i)” and “(iii)” are not theorem locators.

**Repair:** Cite Hansen §2 and §3.1, with the precise paragraph/proof step actually used, and distinguish the invariant-ring preliminary argument from Theorem 3.1 itself. If that preliminary argument is supplied locally, say so and give its proof inputs. The checks `N(ϖ)=ϖ` for the trivial group and `N(ϖ)=ϖ²` for a trivial two-element action still identify the intended Tate-ring argument.

## Verified sound

The head was checked against `b25100094d839d88eca5f2e7bf327acedd2fcfcb`. Both target files were read. Root `README.md` and `CONTRIBUTING.md` were read, as were main-roadmap examples in PerfectoidSpaces, PadicFunctionalAnalysis and ProfiniteCohomology. No tracked file was changed. There was no previous AI review to reconcile.

**Gate and elaboration.** The supplied gate fails: `imports=1`, `depcheck=2`, `outside-folder=3`; all its other counters, including `build`, are zero. The named Tau Ceti imports were built successfully, then `lake env lean` on the target succeeded with exactly 15 `sorry` warnings and no errors. A scratch copy checked the elaborated types of all 24 named declarations/instances (the two anonymous instances were given scratch-only names). No required binder was found to have disappeared; in particular the perfectoid hypothesis of `invariants_perfectoid`, faithfulness in projective-section descent, and the scalar towers in the character comparison remain present. This successful elaboration uses the forbidden roadmap import, so it does not cure R07.

Every one of the 15 admissions was probed on a copy with the individual alternatives `simp`, `rfl`, and `infer_instance`; none closed. Library reading was also used to distinguish actual inputs from newly proposed claims. The three admitted boundary Checks are R09. Independently, the missing affine character headline was elaborated in a file importing only Mathlib, with no option overrides, dummy predicates or admitted data.

The required dependency command returned the following output (the location of the README is shortened to its repository-relative name):

```text
not movable: PerfectoidTowers consumes ProfiniteCohomology (#376) and is consumed by AnalyticToricGeometryPartII (#139), which comes first: moving PerfectoidTowers after ProfiniteCohomology would put a supplier after a consumer, a cycle through PerfectoidTowers
UPWARD: PerfectoidTowers (#15) -> ProfiniteCohomology (#376) at README lines [1911, 3389]
UPWARD: PerfectoidTowers (#15) -> RepresentationTheory (#180) at README lines [307, 308, 309, 311, 312]
depcheck: 163 roadmaps, 1177 edges, 2 problem(s)
```

The second `UPWARD` line is a **false positive**: lines 307–312 name `Mathlib/RepresentationTheory/...` and `TauCeti/RepresentationTheory/...`, not the RepresentationTheory roadmap. There is no author finding for that edge. The ProfiniteCohomology edge is real. No declared supplier gaps were supplied. No `set_option`, admitted data, admitted examples, computational algorithm, or copied source passage was found in the target files. The roadmap import and out-of-folder changes remain gate failures.

**Seeded source sample: 15 of 15 targets examined.** All source locators explicitly marked unverified were searched for; the README contains no such marker. Nineteen of its twenty reference works were obtained legally through the sources service. Rubin was the only unreadable work. The following records distinguish source statements from locally justified extensions; a source theorem is not treated as a supplier implementation.

| Sampled target | Source, locator and text evidence | Hypothesis/statement comparison |
|---|---|---|
| Invariant Huber pair | Hansen §2 and §3.1, pp. 3–6; lines 95–155, 224–245 | Finite continuous ring action and invariant plus ring give the intended pair; no averaging or invertibility assumption. The two Lean subpart numbers are R11. |
| Finite invariants are perfectoid | KL16 v3 Thm. 3.3.26, p. 68, lines 2678–2698; Hansen Thm. 3.6, p. 9, lines 513–514 | General perfectoid Tate ring, finite group, including residue characteristic dividing the order. The older numbering cited inside Hansen is not the v3 number. |
| Perfectoid quotient under invariant affinoid cover | CGJ Thm. 2.1.2 and Prop. 2.1.3, p. 5, lines 199–218 | Cover invariant under the whole finite group; no freeness or invertible-order requirement. Source supports the stated conclusion. |
| Zariski-closed embeddings and Zariski opens | ECD Defs. 5.6–5.7 and Thm. 5.8, pp. 24–25, lines 986–1016; HJ Def. 5.4, p. 29, lines 1300–1310 | The all-affinoid quantifier is retained. Strong closure is stronger than just topological closedness; the source's caution about checking one cover is respected. |
| Zariski-open Checks | Same locators; perfectoid universal closed locus in PerfectoidSpaces P4.14–P4.15 | Empty, whole and punctured disc have complements represented by `X`, `∅` and the perfectoid origin. The nonreduced quotient by `(T)` is not substituted. |
| Analytic separation | HJ Def. 5.4(3), Lemma 5.5, pp. 29–30, lines 1307–1318 | Zariski-closed diagonal, not ordinary separatedness alone; intersection of affinoid opens is affinoid. |
| Finite quotients of good towers | HJ Def. 5.12 and Prop. 5.13, pp. 32–34, lines 1442–1492 | Projective finite-type levels, finite transitions and perfectoid diamond limit; finite group equivariance retained. The nonprojective and nonperfectoid examples are excluded. |
| Canonical cochains for compact coefficients | Rubin Appendix B §2, pp. 151–152 unavailable; native cochains read at pins | Source locator uncertified. The local currying/dehomogenisation argument was checked with compact Hausdorff `G` and jointly continuous action, not just `TopRep`'s separate operator continuity. |
| Pro-étale Galois towers | CHJ §4.1 and Lemma 4.1, p. 28, lines 1280–1325; Sch13 Example 4.4 and Lemma 4.10, pp. 23, 26–27 | Finite Galois levels, cofinal normal subgroup sequence, pro-object versus its completion, and the perfectoid affine basis are distinguished. |
| Čech descent datum | CHJ Lemma 4.1, p. 28, lines 1301–1325; source argument combined with locally profinite products | Successive increments give `d⁰a(g)=g(a)-a`; arbitrary degree uses a new comparison, not an assertion that the pinned low-degree comparison already covers it. |
| Function descent after smooth weight product | BHW Lemma 3.7, p. 10, lines 459–485; Heuer Lemma 2.6 and Prop. 2.9 | The source's product-open argument does not suffice on all opens. P9.7 restricts that argument to product charts and P9.11 supplies the v-sheaf proof. |
| Affine projective descent | CHJ Thm. 2.28 proof, p. 22, lines 1025–1029; local direct-summand proof in P9.8 | For untwisted pullback modules, faithful scalars and `B^G=A` suffice for finite projective `M`; no unjustified flatness or order-invertibility assumption is used. General semilinear effectivity uses the torsor supplier. |
| Affinoid reconstruction | CHJ Thms. 2.28 and 6.20, pp. 22, 53, lines 1014–1029, 2374–2379; AdicSpacesPartIV R5 | README explicitly keeps finite coefficient and global-presentation branches, and ordinary Kiehl on an affinoid product. It does not infer global generation for every infinite pseudobasis from the defective density argument. |
| Smoothoid charts and degree-zero comparisons | Heuer Def. 2.2, Lemmas 2.5–2.6, Prop. 2.9(2), pp. 8–10, lines 344–398, 423–432 | Mixed-characteristic perfectoid base, smooth local presentation, étale-site comparison, and degree zero retained. In degree zero the twist disappears and the pullback of relative degree-zero forms is `O_X`. |
| Sheaf equalizers after coefficient base change | Heuer Lemma 2.6(2)–(3), p. 9; Prop. 2.9(2), p. 10; BHW Lemma 3.7, p. 10 | v-cover descent plus the degree-zero comparison gives equalizers on every open. Surjectivity reflects boundedness for `O⁺`; product opens are not asserted to form a basis. |

**Ownership and supplier evidence.** Object searches used the roadmap service over main and the indexed open heads, the supplied sibling checkouts, board packages, and both pinned libraries. The supplied citation scan reports no unresolved cross-roadmap citation; its 226 unresolved-name leads are not 226 mathematical findings. Many are genuine roadmap-only supplier declarations, while the local-name policy is R10. There is no claim here that an API is absent merely because that scan could not find it in a pinned library.

| Input/object opened | Exact evidence | Boundary checked |
|---|---|---|
| Pseudouniformizer and Tate ring | `TauCeti/RingTheory/Huber/Basic.lean:165`, `:192` | Unit plus topological nilpotence; no nonzero-ring hypothesis. R06 follows. |
| Fixed-ring condition | `Mathlib/RingTheory/Invariant/Defs.lean:26` | `Algebra.IsInvariant` says fixed elements lie in the scalar image. Faithfulness/injectivity is separate and is present in the affine theorem. |
| Galois-group predicate | `Mathlib/RingTheory/IsGaloisGroup/Defs.lean:30` | Faithful action and invariant scalars do not themselves assert finite étaleness or a torsor tensor isomorphism. |
| Continuous homogeneous cochains | `Mathlib/RepresentationTheory/Homological/ContCohomology/Basic.lean:60`, `:113` | Differential and iterated continuous-map carrier opened; joint continuity required for the new inverse comparison is not inferred from separate operators. |
| Continuous lifts | `TauCeti/RepresentationTheory/Homological/ContCohomology/ShortExact.lean:142`, `:164` | Already covers arbitrary degree; R04. |
| Field descent | `TauCeti/RepresentationTheory/GaloisDescent/Span.lean:32`, `:38` | Requires `[Field L]`; it is not the proof of descent for disconnected finite étale rings. README's separate arbitrary-ring supplier is necessary. |
| Local rank | `Mathlib/RingTheory/Spectrum/Prime/FreeLocus.lean:180` | Actual localization/finrank definition, sufficient for R02's native signature. |
| Closed fixed sets | `Mathlib/Dynamics/FixedPoints/Topology.lean:42` | Individual fixed-set closedness supports the intersection argument; it does not supply invariant perfectoidness. |
| Perfectoid closed loci | `TauCetiRoadmap/PerfectoidSpaces/README.md:10844`, `:10883` (P4.13–P4.15) | Strong affine closure, universal perfectoid closed locus and nonreduced raw-quotient distinction. The global all-chart predicate in P8.14 has a distinct stated role. |
| Products with profinite sets | `TauCetiRoadmap/PerfectoidSpaces/README.md:14489` (P6) | Sections are continuous functions, not arbitrary functions on an infinite set; empty and noncompact cases distinguished. |
| Perfectoid completed sections | `TauCetiRoadmap/PerfectoidSpaces/README.md:17370` (P7.16) | Completion of integral sections precedes inversion of `p`; nonreduced finite-stage rings do not survive unchanged. |
| Étale towers and descent | `TauCetiRoadmap/AdicEtaleGeometry/README.md:4752`, `:4919`, `:9376` (A1.12, A4.2a) | Finite torsors/pro-objects; arbitrary-ring effective module descent, finite projectivity and rank reflection. These are imported, not assigned to the field-only lemma. |
| Coefficient norm models | `TauCetiRoadmap/PadicFunctionalAnalysis/README.md:400` (F1.2–F1.4) | Basis/model choices and bounded linear equivalence are distinguished from isometric orthonormality. |
| Coefficient Kiehl and density | `TauCetiRoadmap/AdicSpacesPartIV/README.md:2388`, `:2428`, `:2524` (R5) | Finite-pseudobasis Kiehl, projectivity with a global presentation, and affinoid weight coefficients. The infinite-pseudobasis density counterexample was recomputed. |
| Seminormality owner | `TauCetiRoadmap/DiamondsAndVStacks/README.md:436`; `Suggested.lean:380` at its open head | General affine predicate already exists; R05. Service output's extra title line was excluded from the file locator. |
| Diamonds and sheaves | DiamondsAndVStacks D2.9, D6.5, D6.9; README at `:4362`, `:9008` and the cited seminormal-comparison subsection | Vector-bundle descent, analytic/diamond étale-site equivalence, and the seminormal structure-sheaf comparison are supplier inputs, not new foundational ownership here. |
| Discrete cohomology roadmap | `TauCetiRoadmap/ProfiniteCohomology/README.md:777`–its Layer 3 | The discrete low-degree comparison is existing work; the pin supplies it without the upward edge. |

The finite quotient, good-tower and smoothoid application targets were searched by object, not only by proposed declaration name. No competing earlier owner of those application targets was located. OverconvergentAutomorphicForms consumes these tower interfaces rather than replacing their owner. The local lifting and seminormality duplications are the exceptions reported above. No duplicate fully qualified name of a kept declaration was found against the searched roadmaps.

**Headline inventory.** The README's main results are invariant Tate pairs and orbit spectra (P8.1–P8.2); invariant perfectoidness and rational localization (P8.4–P8.5); categorical, affinoid, rigid and perfectoid finite quotients and their diamonds/torsors (P8.6–P8.12, P8.16–P8.17); clean neighbourhoods (P8.13); analytic separation and closed loci (P8.14–P8.15, P8.21); integral perfectoidization (P8.18); good towers and their finite quotients (P8.19–P8.20); continuous Čech/cochain comparisons, completed structure sheaves and function descent (P9.0–P9.7); finite projective descent (P9.8); character-sheaf comparison, finite-character lines and reconstruction (P9.9–P9.10); smoothoid sheaf equalizers and seminormal descent (P9.11–P9.12); integral frame effectivity (P9.13). The docstring names the geometric missing-carrier families. R02 is an affine omission; R07 concerns the four headline signatures made possible only by an impermissible carrier import.

**Computed adversarial pass: 88 rows.** Here `K` is a nonzero perfectoid field where a perfectoid field is needed, `O_K` its valuation ring, and `π` a pseudouniformizer. “Pass” means the displayed instance satisfies the stated conclusion, not that a finite list of instances proves a theorem. Equalities were checked in both directions on the displayed models. Rows separate theorem, definition, convention and important API claims, including every seeded target, each headline family, and each mathematical finding.

| Statement / location | Instances tried | Values on the two sides | Result / change |
|---|---|---|---|
| Finite-action convention and norm, P8.1 | Trivial group; trivial `C₂`; permutation `S₃` on `K³` | Norm of `π`: `π`, `π²`; `S₃` fixed triples exactly `(a,a,a)` | Pass; no commutativity of the acting group used |
| Invariant pair and plus ring, P8.1 | Swap on `K²`; zero ring | Fixed ring `diag K`, fixed plus `diag O_K`; zero pair `(0,0)` | Pass |
| Tate topology, P8.1 | Trivial `C_p` in characteristic `p=2,3` | Product norm `π^p` is a unit tending to zero; additive trace of `1` is `0` | Pass; averaging would fail |
| Closedness/completeness of invariants | Swap on complete `K²` | Kernel of `(a,b)↦a-b` is the closed diagonal; a Cauchy diagonal pair limits to `(a,a)` | Pass; completeness retained |
| Orbit spectrum, P8.2 | Swap two points; trivial action; empty spectrum | Orbit cardinalities `2→1`, `n→n`, `0→0`; invariant spectra have the same cardinalities | Pass |
| Rational inverse images, P8.2/P8.5 | Diagonal `f,g` in `K²` | Both components impose the identical inequality `|f|≤|g|`; inverse image is both components or neither | Pass |
| Quotient v-sheaf presentation, P8.3 | Split torsor `Y×G`; trivial nontrivial action | Split fiber pair `(g,h)` has unique increment `g⁻¹h`; trivial action has `|G|` arrows over the same diagonal pair | Pass; presentation does not assert free action |
| Perfectoid invariants, P8.4 | Swap on a characteristic-`p` perfectoid product, `p=2,3` | Fixed ring `K`; Frobenius root of `(a,a)` is `(a^(1/p),a^(1/p))` | Pass |
| Finiteness hypothesis, P8.4 | Completed root tower with infinite `ℤ_p` action | Fixed algebra is ordinary `K⟨T⟩`; `T` has no Frobenius root modulo a small pseudouniformizer | Correct negative control; no infinite-group generalization |
| Invariant rational localization, P8.5 | Empty rational domain; whole domain; swap | Both localized invariant rings are respectively `0`, `A^G`, `diag K` | Pass |
| Categorical quotient definition, P8.6 | Identity; split finite orbit; empty space | Invariant maps factor uniquely through `X`, a point, and `∅`, respectively | Pass; uniqueness is part of the definition |
| Plus/rational quotient distinction, P8.6/P8.9 | Swap on `ℚ₂²` | Averaging `(1,0)` gives `(1/2,1/2)` in the rational ring, outside `ℤ₂²` | Pass; no integral averaging conclusion |
| Affinoid perfectoid quotient, P8.7 | Swap and trivial action | Section equalizer is `diag K` and `A`, respectively; quotient is the corresponding affinoid | Pass |
| Scalar-extension comparison, P8.7 | One coefficient coordinate; two coordinates | Fixed scalar extension has coordinates `(a)` or `(a,b)` with each coordinate invariant on both sides | Pass; coefficient model matters |
| Invariant-cover gluing, P8.8 | Two-point orbit; trivial cover; empty cover of empty space | Local quotients glue to one point, `X`, and `∅`; restrictions on overlaps agree | Pass |
| Analytic affinoid boundary, P8.9 | Zero ring; `ℤ_p`; `ℚ_p` | `Spa(0)=∅`; `ℤ_p` has the nonanalytic closed point; `ℚ_p` has topologically nilpotent unit `p` | Pass as README Checks; R09 deletes admissions |
| Rigid quotient without invertible order, P8.10 | `C_p` translation `T↦T+1` in characteristic `p` | Invariant `T^p-T` is unchanged; extension degree `p`; trace of `1=0` | Pass; wild case retained |
| Diamond quotient, P8.11 | Trivial action; purely inseparable characteristic-`p` field extension | Trivial quotient map is identity; perfection identifies inseparable test data although original field inclusion need not be an isomorphism | Pass; no ordinary-space inference from the latter |
| Free quotient criterion, P8.12 | Split torsor; nontrivial trivial action | Relation map has one preimage per pair for split torsor, `|G|` preimages over each diagonal pair for trivial action | Pass; trivial-action quotient can be étale without being a `G`-torsor |
| Clean-neighbourhood definition, P8.13 | Reflection at `x=1` in `ℝ`; at `x=0` | `(1/2,3/2)` and its reflection disjoint; stabilizer at `0` is all of `C₂` | Pass |
| Existence of clean neighbourhoods, P8.13 | `S₃` on three discrete points | Singleton has stabilizer of order `2`; distinct translates intersect in `∅` | Pass for nonabelian group |
| Hausdorff necessity for clean sets | Doubled origin with swapping involution | Two origins are distinct, but every pair of their neighbourhoods intersects | Correct negative control |
| Closed-embedding definition, P8.14 | Ideals `0`, `1`, `(T)` in perfected disc | Universal loci are `X`, `∅`, `Spa(K)`; raw quotient by `(T)` has nonzero `T^(1/p)` with p-th power `0` | Pass; wrong quotient excluded |
| Affinoid strong-closure comparison | Perfectoid origin map | Ring and plus maps are `T^(1/pⁿ)↦0`, with images `K` and `O_K`; both surjective | Pass |
| Topological closure is insufficient | Gauss point in perfected disc | Vanishing ideal at Gauss point is `0`, whose locus is the whole disc, not its proper specialization closure | Pass |
| Zariski-open empty Check | `U=∅` | Complement `X` is image of identity closed embedding | Pass |
| Zariski-open whole Check | `U=X` | Complement `∅` is image of zero-ring closed subspace | Pass |
| Zariski-open punctured-disc Check | `T≠0` | Complement is the perfectoid origin with ring `K`, not the nilpotent quotient | Pass |
| Analytic separation/self-product, P8.15 | Affinoid; identity diagonal | Multiplication `A⊗̂_K A→A` sends `a⊗1` to `a`; diagonal equations vanish | Pass |
| Analytic-separation negative control | Doubled disc along punctured disc | Two distinct origins give a missing off-diagonal limit pair; diagonal is not closed | Pass; ordinary gluing does not confer separation |
| General rigid quotient, P8.16 | Hausdorff two-point orbit; collapsed orbit under an equivariant quotient | Stabilizers are equal in first case; second changes stabilizer from `{1}` to `C₂` | R01: intermediate argument does not discharge general target |
| General perfectoid quotient, P8.17 | Disjoint pair of perfectoid points; empty space | Quotients are one perfectoid point and `∅`; `horbit` holds automatically here | Pass on these instances; R01 retains general theorem |
| Weakly affinoid quotient map | Swap two affinoid components | Preimage of quotient rational domain is two copies of that affinoid rational domain | Pass |
| Integral perfectoidization, P8.18 | Perfect characteristic-`p` ring; square-zero integral extension | Identity on perfect ring; `ε^(p)=0` makes `ε=0` after perfection | Pass |
| Necessary completion in characteristic `p` | Integral algebraic field extension not complete | Uncompleted perfect closure remains noncomplete; completion adds limits of Cauchy sequences | Pass; localization alone is insufficient |
| Integral-model plus ring | `O_K[ε]/ε²` inside `K[ε]/ε²` | `(ε/π)²=0` but `ε/π` is not in the original plus model | Pass; take image and integral closure |
| Universal zero perfectoidization | `S⁺=R⁺/(π)`; zero target | Localization after killing `π` is `0`; unique map to `(0,0)` exists and sends `π` to the pseudouniformizer `0=1` | R06 |
| Same no-map Check with repaired hypothesis | Nonzero target | Image of `π` is `0`; `0` is not a unit | Corrected Check holds |
| Good-tower definition, P8.19 | Constant perfectoid point; empty tower | Diamond limits are that point and `∅`; level maps are identities | Pass |
| Good tower versus tilde-limit | Constant `ℙ¹` in characteristic `p` | Perfected limit charts contain `T^(1/p)`; the constant chart algebra does not densely contain it | Pass; representability alone is not tilde-limit density |
| Mixed-characteristic bad constant tower | Constant ordinary `ℙ¹` | Chart `K⟨T⟩` has no perfectoid Frobenius-root property | Correctly excluded |
| Projective-level hypothesis | Constant affine line | Affine line is not projective; it cannot be inserted as a good tower merely because transition maps are identities | Correctly excluded |
| Finite quotient of good tower, P8.20 | Trivial group; swap two projective points | Quotient levels are original levels and one point; limit quotient gives the same results | Pass |
| Closed loci in towers, P8.21 | Zero/unit ideals; perfected coordinate origin | Both comparison sides are `X∞`, `∅`, and `Spa(K)` | Pass |
| Analytification map convention | Affine map `T↦T²`, points `2,1,0` | Images `4,1,0` on both algebraic and analytic sides | Pass; covariant point map fixes direction |
| Continuous lifting, P9.0 | `ℤ/4→ℤ/2`; identity; connected source | Section sends `0,1` to `0,1`; identity lift is itself; connected-source map is constant | True but already pinned: R04 |
| Lifting without discreteness | `ℝ→ℝ/ℤ`, identity of circle | A continuous lift would split the universal cover; induced map on π₁ would be both identity and zero | Correct negative control |
| Cochains and inverse limit | `ℤ_p=lim ℤ/pⁿ`; zero transitions | Compatible residue cochain maps to the same p-adic value; zero transitions force every limit coordinate `0` | Pass |
| Compact-coefficient canonical comparison | Trivial group and any `M` | Terms on both sides `M`; `d⁰=0`, `d¹=id`, `d²=0`; `H⁰=M`, positive `Hⁱ=0` | Pass; Rubin locator not verified |
| Homogeneous/inhomogeneous inverse convention | `S₃`, increments `g,h` | Homogeneous triple `(1,g,gh)` maps to `(g,h)`; reconstructing returns `(1,g,gh)` | Pass; noncommuting order retained |
| Completed structure sheaves, P9.2 | Perfectoid point; characteristic-`p` input to p-adic rational construction | Point gives `O_K`, then `K`; if `p=0`, subsequent inversion of `p` gives `0` | Pass; characteristic range not silently extended |
| Completion precedes finite-stage sections | Toric tower | `Σ pⁿT^(1/pⁿ)` converges in completed limit; exponents are not bounded at any finite level | Pass |
| Smooth pushforward, P9.3 | Point; smooth disc | Point has degree-zero `K` and positive differential forms `0`; disc has `Ω¹=O·dT` | Pass; cannot assert all higher direct images vanish |
| Cyclotomic coefficient convention | Multiplication by `1+p` | Modulo `p`: `1`; modulo `p²`: `1+p`, not `1` | Pass; twist not trivialized integrally |
| Pro-étale tower, P9.4 | Identity; finite split torsor; toric root tower | Fibers respectively singleton, `G`, and compatible root choices; inverse fiber product described by group increments | Pass |
| Nonreduced finite-stage Check | `K[ε]/ε²`, plus `O_K+Kε` | Modulo `pⁿ`, the nilpotent part is `Kε/pⁿKε=0`; completed plus ring is `O_K` | Pass; no contradiction from finite-stage nilpotents |
| Sequential tower scope | `G=∏_{i∈I} C₂`, uncountable `I` | A countable open-normal family misses a coordinate; its intersection contains its nonidentity element | Excluded by sequence hypothesis; the separate product-section formula remains valid |
| Profinite product sections | Finite `G`; infinite `ℤ_p`; empty `X` | Finite product `K^G`; continuous functions `C(ℤ_p,K)`; zero ring; translation-fixed functions are constants | Pass; not arbitrary discontinuous functions |
| Čech differential, P9.5 | Swap on `K²`, `a=(a₀,a₁)` | `d⁰a(σ)=(a₁-a₀,a₀-a₁)`; `σd⁰a(σ)+d⁰a(σ)=0` | Pass |
| Higher differential sign | Group elements `g,h` | `g(h a-a)-(gh a-a)+(g a-a)=0` | Pass for nonabelian groups too |
| Joint-continuity negative control | Discrete regular module over additive `ℤ_p` | `d⁰e₀(h)=e_h-e₀`; zero fiber `{0}` is not open | True Check; R09 |
| Function descent, P9.6 | Toric root tower; trivial torsor | Invariants are integral-exponent functions; for product torsor they are constant functions on group coordinate | Pass |
| Integral function descent | Same examples | Fixed functions of norm at most `1` give precisely base plus ring | Pass; boundedness reflected |
| Product weight comparison, P9.7 | Countable coefficient model; one coordinate | Coordinatewise fixed sequences on both sides; singleton coefficient recovers original invariant ring | Pass |
| Non-product rational region | Bidisc diagonal Gauss point | `|T-S|=0` at diagonal; independent pair of Gauss coordinates has `|T-S|=1>|π|` | Pass; product opens are not a basis |
| Norm versus bounded equivalence | Rescaled one-dimensional norm | Unit vector norm is scale `c`, not necessarily `1`; rescaling map and inverse still have finite bounds | Pass; no false isometry |
| Uniform-completion warning | Idempotents in weighted finite models | Original model can assign norm `pⁿ`, while uniform spectral norm of a nonzero idempotent is `1` | Pass; completions cannot be identified without the stated comparison |
| Affine projective descent, P9.8 | `A=𝔽₂`, `B=A²`, swap; ranks `0,1,2` | Fixed submodules are `0`, `diag A`, `diag A²`; `m↦1⊗m` bijective onto each | Pass, including order zero in coefficients |
| Faithfulness necessity | `A=𝔽₂²→B=𝔽₂`, first projection | `(0,1)≠0` maps to `0` in `B⊗_A A` | Hypothesis retained |
| Integral local freeness versus coherent ideal | Ideal `(p,T)` at closed point of `ℤ_p⟨T⟩` | Generic rank `1`; fiber needs two generators | Pass; no claim every integral coherent module is locally free |
| Twisted-invariant definition, P9.9 | Swap, `c(σ)=(1/2,2)` | `σ(a,2a)=(2a,a)=c(σ)⁻¹(a,2a)`; direct-cocycle convention instead gives line `(2a,a)` | Pass; inverse convention discriminates |
| Cocycle necessity | Trivial group with assigned `c(1)=-1`, characteristic zero | Fixed equation forces `f=-f`, hence `f=0`; valid trivial cocycle gives full ring | Pass; arbitrary function is only a submodule, not a descent line |
| Non-qc denominators | Disjoint union of points, section values `p^-n` | Each value has a denominator; no single power of `p` clears all | Pass; qc restriction matters |
| Finite-character comparison, P9.10 | Swap, `u=(1,2)`, `c(σ)=(2,1/2)`, finite cocycle `1` | `(a,a/2)u=(a,a)`; inverse divides by the same unit | Pass; Lean uses this multiplication direction |
| Finite-character projectivity/rank | Split `C₂` torsor over `𝔽₂`, trivial cocycle | Invariants `diag 𝔽₂`; dimension/rank `1` on the unique prime; `1/2` does not exist | R02: statable headline missing |
| Affinoid reconstruction | Trivial line on affinoid; nontrivial torsion line on proper elliptic curve | Affinoid global module rank `1`; elliptic nontrivial degree-zero line has `H⁰=0` while fiber rank is `1` | Pass; latter is not an affinoid counterexample |
| Infinite-pseudobasis density | `u=x/p`, target coefficient family `(uⁿ)` | Target sup norm `1`; for bounded source norm `C`, degree-n coefficient ≤`C p^-n`; distance is `1`, not `0` | Source error; README avoids the invalid inference |
| Derived coefficient change | Complex `ℤ --2→ ℤ` in degrees `0,1`, tensor `𝔽₂` | Before: `(H⁰,H¹)=(0,𝔽₂)`; after derived tensor `(𝔽₂,𝔽₂)` | Pass; Tor contribution uses `H^(q+1)`, not `H^(q-1)` |
| Mittag-Leffler finite coefficients | Fixed finite module with nested images | Image cardinalities decrease finitely often then stabilize; no infinitely decreasing chain of images | Pass with stated finiteness |
| Smoothoid definition, P9.11 | Point; ordinary disc; empty space | Identity smooth chart; one-dimensional smooth chart; empty cover | Pass; ordinary disc is admitted although not perfectoid |
| Degree-zero smoothoid comparisons | Point and annulus | Point rings `K⁺,K`; annulus functions `T,π/T` restrict to the same functions on the v-site | Pass |
| All-open sheaf equalizers | Trivial torsor on non-product rational region; split finite torsor | Identity equalizer is `O(U)`; split equalizer is diagonal inside `O(U)^G`, also for plus sections | Pass; includes the non-product region |
| Seminormal ring definition, P9.12 | Field; product; dual numbers | Common root for nonzero `a` is `b/a`; coordinatewise for products; dual numbers fail reducedness | True but duplicate owner: R05 |
| Seminormality necessity for functions | Cusp `K⟨t²,t³⟩` | `t²,t³` have common root `t` after seminormalization, while `t` is absent from original ring | Pass; comparison cannot be claimed for every reduced base |
| Integral matrix frame, P9.13 | Rank `0`; trivial frame rank `1` | Unique empty vector/frame; rank-one fixed vectors exactly invariant scalars | Pass; no lost rank-zero case |
| Integral frame orientation | Swap coefficients; `P₁=diag(1,2)`, `P₂=diag(2,1)` | `C₁=diag(1/2,2)`, `C₂=diag(2,1/2)` satisfy `C₁P₂=P₁`, `C₂P₁=P₂` | Pass; inverse matrix order fixed |
| Integral-unit hypothesis | Ramified quadratic extension with `α²=p`, sign action | Anti-invariants `αℤ_p`; tensor counit has image `αO_L`, a proper ideal | Pass; a rational frame alone cannot give integral effectivity |
| Lattice saturation/completion | Fixed lattice `F⊂E`, invariant nonzerodivisor `π` | If `πⁿx` is fixed, `πⁿ(gx-x)=0` forces `gx=x`; `F∩πⁿE=πⁿF` | Pass; this is the needed strictness, not a DVR assumption |

## Not verifiable

- **Rubin**, *Euler Systems*, Appendix B §2, Definition 2.1 and Remark 2.2, printed pp. 151–152: the sources service could not obtain readable legal text from the publisher DOI; the attempted UCI author page returned HTTP 502. No pirate mirror or paywall bypass was used. The missing reference was retained in the scratch request file. The continuous-lifting statement was instead verified against pinned Tau Ceti, and the compact-coefficient comparison was checked by its explicit maps; the precise Rubin attribution remains uncertified.
- The full general quotient proof without the added orbit hypothesis is not supplied by the cited Hausdorff-quotient argument alone. R01 concerns the required scope and missing proof work; it is not a claimed counterexample to the general quotient theorem.
- Sources obtained by the service were checked at the locators recorded above. Readability of the other reference works is not a claim to have independently verified every theorem in those works. The adversarial computations are checks, not formal proofs of the proposed `sorry` statements.

## Source issues

- **Misprint** in ECD at the discussion after Theorem 5.8, printed p. 25, line 1010: the source says the plus-ring almost-surjection goes from the quotient back to the ambient ring; it should be the map from ambient plus ring to quotient plus ring; affects nothing.
- **Gap** in HJ at the proofs of Theorems 5.3 and 5.8, printed pp. 28–31, lines 1250–1264 and 1358–1361: the source says a clean neighbourhood pulls back cleanly through the maximal Hausdorff quotient; it should be justified by equality of the stabilizers or by another neighbourhood argument; affects the proof.
- **Misprint** in HJ at Theorem 5.8, printed p. 30, line 1350: the source says the quotient-point neighbourhood is a subset of the source space; it should be a subset of the quotient space; affects nothing.
- **Gap** in HJ at Lemma 5.10, printed p. 32, lines 1421–1425: the source says localizing integral perfectoidization directly produces the required perfectoid Tate ring; it should be completed for the chosen pseudouniformizer before localization when that completion is not automatic; affects the proof.
- **Misprint** in BHW at the proof of Lemma 3.7, printed p. 10, line 465: the source says sections on the base open are evaluated on the source and conversely; it should be source sections on the inverse-image open and base sections on the base open; affects nothing.
- **Gap** in BHW at the proof of Lemma 3.7, printed p. 10, lines 463–474: the source says product-open calculations suffice for the sheaf comparison on the product; it should be extended to a genuine basis or proved by descent on the v-site; affects the proof.
- **Misprint** in CHJ at the weighted projector before Theorem 2.28, printed p. 22, lines 1007–1010: the source says to average the inverse character although its immediately preceding twisted action uses the character; it should be the average of that preceding action with the same character convention; affects the proof.
- **Error** in CHJ at Lemma 6.19(2), printed p. 53, lines 2357–2365: the source says bounded-family restriction is Banach-dense because each coordinate restriction is dense; it should be restricted to finite pseudobases, since the displayed infinite family has distance one; affects a stated result.
- **Misprint** in Heuer at Lemma 2.13, printed p. 10, lines 445–449: the source says the relative degree-one differential term has twist indexed by an unspecified n; it should be the degree-one twist, namely minus one; affects nothing.
