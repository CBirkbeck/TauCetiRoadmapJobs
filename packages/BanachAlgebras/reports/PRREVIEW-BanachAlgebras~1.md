# Review of BanachAlgebras (pull request #1648 at c30826e)

**Verdict:** needs changes

AI review of all five specified files. Findings include inherited defects because this is a full-folder review. No pull-request file was changed. The additions preserve the previous roadmap rather than replace its development, so rejection for re-planning is not warranted. There are 12 findings, five blocking (two P1 and three P2). The gate fails despite successful Lean elaboration.

## R01 (P1) — Replace admitted calculus data with honest theorem statements

**Location:** `TauCetiRoadmap/BanachAlgebras/Suggested.lean:126` and `:134`: “noncomputable def acContinuousFunction” and “noncomputable def acOperatorCalculus”. Both bodies are `sorry`.

**Claim:** These declarations supply the continuous realization and operator calculus used by three subsequent theorems. Their types alone specify arbitrary bounded linear maps, not the displayed constructions. This violates the explicit prohibition on admitted data; the gate reports both `sorry-data` failures.

**Witness:** At `(c,g)=(1,0)`, the specified continuous function is 1 and the operator calculus is the identity. Zero maps have both declared data types but give 0 instead.

**Repair:** Remove both admitted definitions and every statement depending on them. State existence of bounded linear maps with the a.e. formula, norm bound and evaluation identity in a single headline theorem on the existing `ACData`/`Lp` carriers; alternatively name the missing construction in the module docstring. Do not replace the data with unconstrained parameters. The existential formulation excludes zero maps on `(1,0)` and gives `Ψ((0,1))(1)=2x`, as required.

## R02 (P1) — The cited B1 supplier does not supply the functional on main

**Location:** `TauCetiRoadmap/BanachAlgebras/README.md:826`: “consume ... BanachSpaceTheory B1's norm-one functional φ annihilating c₀ with φ(1)=1”.

**Claim:** This prerequisite is presented as already assigned to an admissible supplier.

**Witness:** On content main `fa41b374`, `TauCetiRoadmap/BanachSpaceTheory/README.md:41–72` contains no such target. It appears only in that existing roadmap's revision, at lines 108–109 of the supplied open head.

**Repair:** Cite B1's actual quotient/annihilator results and add the short missing Hahn–Banach construction here, or declare a precise supplier gap in both required locations. Do not depend on unmerged additions to an existing roadmap. Verification: `dist(1,c₀)=1`, so Hahn–Banach on `ℓ∞/c₀` gives a norm-one functional with the required values. Then `T1=e₀` while every `Te_j=0`. This retains the intended example with an owned prerequisite.

## R03 (P2) — Reconcile ownership with the earlier von Neumann roadmap

**Location:** `TauCetiRoadmap/BanachAlgebras/README.md:551`, `:1155`, `:1242–1267`.

**Claim:** A3 owns the nonunital C*-character/unitization comparison; A7 owns the faithful regular L² representation and Fourier uniqueness preceding V11.

**Witness:** The supplied broad VonNeumannAlgebras head `dee80881` explicitly owns these in `TauCetiRoadmap/VonNeumannAlgebras/README.md:1967` (V8.RegularL2), `:3185` (V11.UnitizationCharacters), and `:3203` (V11.FourierUniqueness).

**Repair:** Import those exact targets from the earlier owner and remove the repeated construction plans. Retain genuinely additional Banach-algebra and finite complex-measure comparisons, stating their difference. Update the claims that V11 consumes this roadmap's versions: its supplied head expressly builds these independently. The narrower supplied V0–V4 proposal has no V11 and cannot serve as its locator. On the trivial group the regular operator remains multiplication by the scalar; on `C₀(ℕ)` augmentation still adds one point; on C₂ uniqueness still recovers `(a,b)` from `(a+b,a−b)`. Thus ownership transfer preserves the advertised results and establishes one direction of supply.

## R04 (P2) — Delete construction targets already implemented at the pins

**Location:** `TauCetiRoadmap/BanachAlgebras/README.md:107–108`, `:1135–1143`.

**Claim:** The roadmap asks to prove radical-quotient semisimplicity and construct the forward integrated representation, its norm bound and nondegeneracy without identifying the existing implementations.

**Witness:** Mathlib `Ring.jacobson_quotient_jacobson`, `Mathlib/RingTheory/Jacobson/Radical.lean:175`; Tau Ceti `ContRepresentation.integratedOperatorL1`, `norm_integratedOperatorL1_le`, `mem_closure_range_integratedOperatorL1_apply`, `TauCeti/RepresentationTheory/Continuous/Integrated/Basic.lean:141`, `:188`, `:416`.

**Repair:** Move these declarations and their hypotheses to exact supplier contracts. Keep the nonunital radical comparison, inverse representation correspondence, and genuinely missing nonabelian/localized convolution bridges as separate targets. The integrated carrier and bound already allow noncommutative groups through the additive wrapper and require inner regularity on finite-measure sets, not global sigma-finiteness. Do not claim the pinned convolution theorem covers everything: its separate statement at line 291 has `SFinite` and right-invariance assumptions. Test: for the trivial group with Haar mass 2, the native formula is `ρ(f)=2f(e)I`, its bound is `2|f(e)|`, and the identity density is `1/2`; radical quotient of the dual numbers is ℂ with radical zero.

## R05 (P2) — State the missing native headline theorems

**Location:** `TauCetiRoadmap/BanachAlgebras/README.md:184–208`, `:403–409`, `:413–435`, and `TauCetiRoadmap/BanachAlgebras/Suggested.lean:20–25`.

**Claim:** The acceptance file is supposed to state the deep results that can be expressed at the pins and name each genuinely unavailable headline and missing carrier. It does neither for these milestones.

**Witness:** Scratch signatures for automatic continuity of an algebraic square-positive `A →ₗ[ℂ] ℂ`, and normality of T from an isometric `C(spectrum ℂ T,ℂ) →ₐ[ℂ] (H →L[ℂ] H)`, both elaborate using only `import Mathlib`.

**Repair:** Add these general statements, the finite-spectrum calculus criterion on finite-dimensional native endomorphisms, and an explicit headline inventory. Preserve the nonunital automatic-continuity versions promised at README line 963; the three existing signatures cover unital inputs only. Name holomorphic germ calculus, GNS representation, completed balanced tensors, diagonal characterizations and Johnson's theorem individually if their required carriers cannot be supplied by a few simple real definitions. A generic sentence about tensor and bimodule APIs is insufficient. Tests: scaled ℂ has `‖φ‖=φ(1)/2`, zero Hilbert space is allowed in normality, and `diag(0,i)` has a calculus while `J₂(0)` does not. None requires restricting to normalized units or real spectra.

## R06 (P3) — Normalize imports in both affected files

**Location:** `TauCetiRoadmap/BanachAlgebras/Suggested.lean:5–18`; `TauCetiRoadmap/BanachAlgebras/SwappedStarTargets.lean:1–3`.

**Claim:** All listed Lean files must begin with the single `import Mathlib`, followed only by genuinely used individual Tau Ceti modules.

**Witness:** Suggested has 14 Mathlib submodule imports and no `import Mathlib`; SwappedStarTargets has three submodule imports. The gate reports `imports=1`, `mathlib-subimports=14`, `no-import-mathlib=1` for Suggested.

**Repair:** Replace those headers with `import Mathlib`. The two other companion files already use it. Scratch combined companion statements elaborate under this header, so no submodule-specific restriction is needed. This resolves all three gate rule classes, not just the missing root import.

## R07 (P3) — Remove commit-pinned roadmap links

**Location:** `TauCetiRoadmap/BanachAlgebras/README.md:44`, `:51`, `:53`, `:55`, `:826`, `:1242`.

**Claim:** Supplier references must resolve to the applicable main roadmap or admissible new roadmap head, not preserve stale commit snapshots.

**Witness:** All six URLs contain `TauCetiRoadmap/blob/<commit>`; the gate reports `blob=6`. The stale B1 reference conceals the concrete supplier defect in R02.

**Repair:** Use repository-relative links and exact section/target names, after resolving ownership as in R02–R03. AlgebraicTopology Stage 2 item 7 still supplies the finite-span Brouwer target; changing that link leaves the singleton fixed-point test `f(0)=0` unchanged.

## R08 (P3) — Remove pull-request and temporal process references

**Location:** `TauCetiRoadmap/BanachAlgebras/README.md:1483–1489`.

**Claim:** These lines contain two numbered Mathlib pull-request references and “Mathlib's current Derivation”.

**Witness:** The gate reports `prnum=2` at lines 1483 and 1485; the policy requires timeless mathematical descriptions and source/API names.

**Repair:** Describe the spectrum-continuity and closed-ideal API designs by mathematical title and declaration, retaining useful design links without numbered PR labels. Replace “current” with the actual pinned hypotheses of `Derivation`. This is a presentation repair; the asymmetric bimodule Leibniz law still needs separate left and right actions.

## R09 (P3) — Supply retrievable references and claim-level locators

**Location:** `TauCetiRoadmap/BanachAlgebras/README.md:149`, `:1092–1095`, `:1115–1212`, `:1449–1499`.

**Claim:** The references are sufficient to verify the targets at exact legal locators.

**Witness:** All four Rieffel transcript links resolve into an absent `sources/` tree. “Short Assignment4” has no author or retrievable citation. Conway VII.9 pp.223–224 gives examples, not the arbitrary-product iff; sampled A7 targets lack exact theorem/page locators.

**Repair:** Give the exact notes edition and legal source, and place theorem/section/page locators at each target. Record source metadata in `sources.toml`; no such manifest exists here. For Conway use the concrete locators in the source audit below, distinguishing the general product criterion and nonabelian extensions from the cited abelian examples. Keep unavailable texts explicitly uncertified rather than claiming that an unrelated edition verifies their pages. The empty-factor test shows why the general product theorem needs its own stated hypotheses.

## R10 (P3) — Supply the required layer, API and Check structure

**Location:** `TauCetiRoadmap/BanachAlgebras/README.md:1–75`, `:833–924`, and the corresponding omissions throughout A1–A8.

**Claim:** A prose catalogue suffices as the requested roadmap form.

**Witness:** There are zero `*Needs:*` lines, zero `**Checks.**` blocks and no layer-ending Examples/Dependencies sections. For instance, the Arens products and balanced tensor definitions have neither three discriminating Checks nor local supplier lists.

**Repair:** Preserve the mathematics while supplying the requested Summary, Scope and ownership, Conventions, Exact supplier contracts, How to read the build, numbered layers and References. Give each definition its API and at least three discriminating computed Checks, and each target its actual dependencies. Use the values below: for Arens products include an embedded matrix product, zero multiplication, and a double-limit example giving 1 versus 0. In A7 include a nonunimodular example with `c(2,0)=2`, not only abelian tests. Do not narrow the scope to simplify these checks.

## R11 (P3) — Remove API and worked-example padding from acceptance files

**Location:** `TauCetiRoadmap/BanachAlgebras/Suggested.lean:41–49`; `ClosestScalarTargets.lean:39–48`; `ProductDomainTargets.lean:24–32`; `SwappedStarTargets.lean:17–32`.

**Claim:** These are acceptance-test headlines rather than API properties and worked examples.

**Witness:** `isClosed_separatingSpace` merely takes a preimage of a closed graph closure. The closest-scalar witnesses are fixed ℂ³ calculations; the swapped-star signatures are the README's single ℂ² example; the Cantor signature transports an existing homeomorphism.

**Repair:** For `isClosed_separatingSpace` and the sequence-membership API, delete it from `Suggested.lean`; keep the specification in the README. Delete the worked-example target declarations from the companion acceptance files rather than move them into Suggested, together with definitions needed only by those examples. Retain examples and their computations in the README. The general product theorem can remain a mathematical target, but its specializations are Checks. One-tactic probes (`rfl`, `simp`, `infer_instance`, separately attempted) closed none of the 22 admitted theorems; that does not turn fixed worked examples or API declarations into headlines. This finding does not ask for their proofs in place.

## R12 (P3) — Align declaration names, docstrings and layer order

**Location:** `TauCetiRoadmap/BanachAlgebras/Suggested.lean:20–30`, `:46`, `:51`, `:67`, `:117–144`; companion module docstrings and undocumented definitions.

**Claim:** The Lean files follow the prescribed acceptance-file form and agree with the README's named interfaces.

**Witness:** Suggested uses `namespace BanachAlgebras`, not `TauCetiRoadmap.BanachAlgebras`; starts with A5 before A4/A2/A3; omits several declaration docstrings; and its own names, including `cohen_hewitt`, never appear in the README.

**Repair:** Use the prescribed namespace, module note, named unavailable-headline list, README-order layer comments and mathematical docstrings. Name each kept headline in the README; delete unused helper names rather than create an API catalogue. No additional `sorry`, instance override or `set_option` is needed. The 21 independently elaborated types retain the necessary completeness/scalar-action hypotheses; this is not a dropped-binder finding.

## Verified sound

The following records actual checks, not an assertion that finite examples prove the general theorems. All five files were read; all 21 Suggested declarations were independently inspected with `#check @name` in one scratch file. Their elaborated binders agree with the supplied signature extraction: **zero lost standing hypotheses**. The substantive generality mismatch is the missing nonunital headline coverage in R05. A second signature probe inspects all 15 companion declarations (nine theorems) under `import Mathlib`; their hypotheses also survive. Thus 36 declaration types were inspected. No `set_option`, computational algorithm, source passage copied into the additions, outside-folder edit or new route-specific restriction was found. The small grid, finite-matrix and closest-scalar calculations serve mathematical constructions or examples.

The main predecessor at `fa41b374` was read alongside the diff: four files changed, 372 insertions, confined to this folder. Existing core mathematics is retained. BanachSpaceTheory and AmenableGroups on main were read as shape/supplier references; AlgebraicTopology Stage 2 and the completed contour roadmap were also consulted. The stricter form specified for this review is not satisfied merely because the old main files use a looser form.

**Build and gate.** The worker's targeted build has `build=0`; an independent `lake env lean` run on Suggested exits 0 with 15 intentional-admission warnings (13 theorems, two prohibited data definitions) and no other warnings. Scratch signature, missing-headline and companion probes also exit 0. No broader build, dependency update or cache command was run. All Lean processes completed.

The supplied gate output is:

```text
gate BanachAlgebras: set_option=0 blob=6 latex=0 tex=0 prnum=2 sorry-data=2 sorry-examples=0 residue=0 private-paths=0 imports=1 mathlib-subimports=14 no-import-mathlib=1 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 build=0 FAIL
```

All nonzero failure classes are addressed in R01 and R06–R08. The independent dependency command specified in the brief returned exactly:

```text
depcheck: 205 roadmaps, 1507 edges, 0 problem(s)
```

No UPWARD or CYCLE line was emitted. There are no `*Needs:*` lines to audit mechanically; the prose dependencies were followed separately. The clean dependency output does not settle supplier drift or duplicate ownership. No declared gap is present. No merge-order file was changed.

**Headline inventory.** A1: radical/simple-module theory, positive-functional continuity and Banach-input GNS. A2: holomorphic calculus with uniqueness, spectral mapping and composition; finite-spectrum/jet calculus; isometric-calculus normality; Tadmor–Ritt bound. A3: character and ideal identifications, Wiener inversion, AC calculus and its obstruction to continuous extension. A4: automatic boundedness and extension of multipliers, Cohen–Hewitt, balanced tensors and Arens characterizations. A5: separating-space criterion, homomorphism/derivation continuity and Singer–Wermer. A6: extension classification, diagonal/dual-cohomology characterization and amenability permanence. A7: product criterion, representation correspondence, Wendel, characters/standard duals and Johnson's theorem. A8: compact Riesz theory, Schauder and Lomonosov. Suggested covers Cohen–Hewitt, Ritt, the unital A5 continuity results, Schauder and Lomonosov; its AC assertions use prohibited data. Native positive continuity and the normality converse were positively tested for statability. The current docstring does not enumerate the other absent headlines or explain missing carriers individually.

**Source sample (10/10 targets examined; inaccessible texts are not certified).** The source identifiers below are the service keys, reused across retries. Source text was fetched only through the sources service; no source text was copied into the repository or this report.

| Sample target | Locator/text actually inspected | Outcome |
|---|---|---|
| A1.PositiveFunctionals | Rieffel physical pp.26–30; cited transcript paths absent; bibliographic service lookup and Berkeley author/course pages checked | Exact source unavailable. Scaled-unit and polynomial/Gaussian computations below checked independently. |
| A1.SwappedStarExample | Rieffel physical p.27 | Exact source unavailable; all three conclusions independently checked on the explicit coordinate axes and h. |
| A4.DoubleCentralizers | Rieffel physical pp.49–50,109–111; native multiplier definition at the pin | Notes unavailable; native carrier and general Banach assumptions verified, including the fact that module identities are not fields of the carrier. |
| A7.ProductDomains | `conway` line 8727, VII.9, printed pp.223–224; lines 8741–8750 | ℝⁿ, circle products, ℝ^ℕ and binary Cantor examples supported. Arbitrary nonempty-factor iff is a separate valid argument, not a theorem at that locator. Source finite-set overclaim recorded below. |
| A7.ChosenApproximateIdentity | `conway` lines 8803–8826, VII.9.3–9.5, printed pp.225–226 | Abelian approximation and character norm-one argument supported. Source's all-neighborhood normalization needs finite measure; the README's C_c choice repairs it. This does not certify the nonabelian extension from that source. |
| A7.IntegratedRepresentations | Native `ContRepresentation` definitions, bounds, convergence and nondegeneracy; Runde Appendix A requested | Forward construction already supplied. Reverse correspondence at full generality has no precise readable source locator here. |
| A7.RegularL2 | VonNeumannAlgebras V8.RegularL2; Conway VII.9.2 for translations only | Formula and faithfulness route checked, but ownership is duplicated. No claim that Conway proves the whole nonabelian representation theorem. |
| A7.MeasureMultipliers | Rieffel physical pp.126–128; Runde Appendix A requested | Exact Rieffel text unavailable; Wendel is not given an exact theorem/page in README. Essentiality and norm tests below agree. |
| A7.CharactersAndUniqueness | `conway` lines 8836–8875, VII.9.6, pp.226–227; lines 8899–8936, VII.9.10/proof of 9.9, pp.228–229; native finite-measure uniqueness and V11 | Character correspondence and compact-uniform topology supported, after inverse-character conversion. Source explicitly uses a modified local L∞ at lines 8827–8835; README correctly avoids silently identifying it with global Lp. Finite complex-measure uniqueness is a separate comparison. |
| A7.StandardDuals | `conway` lines 8945–8969, VII.9.11, pp.229–230; 8975–8988, VII.9.13, p.230; 8992–9008, VII.9.15, pp.230–231; 9010–9014, VII.9.16–17, p.231 | Real, circle and integer formulas and topology agree; positive versus inverse-character sign and 2π normalization tested below. |

Additional readable sources: `schwenninger` lines 38–66, §1.1, printed pp.1–2 of arXiv:1507.00049v1, distinguishes `|z−1|` and `|z|−1` exactly as A2 does. The README cites this distinction, not the paper as a proof of its particular constant 3. `lomonosov` lines 15–19, 30–67 and 74–78, Russian original pp.55–56, support the compact-ball/Schauder route and complex nonscalar compact-commutation conclusion; the English citation is pp.213–214. The proof, rather than just the named theorem, was inspected for the extracted transitive-algebra lemma. The real argument in the README stops at a finite-dimensional invariant space and does not incorrectly use complex eigenvalue existence over ℝ. No locator is explicitly marked “unverified” elsewhere in the README.

**Pinned library and supplier audit.** Paths beginning `Mathlib/` and `TauCeti/` below refer to the library pins in the reviewed manifest, not their online tips. These are 24 groups of declarations/interfaces opened, with relevant limitations:

| Pin or supplier | Opened location and actual contract |
|---|---|
| Character carrier | `Mathlib/Topology/Algebra/Module/Spaces/CharacterSpace.lean:43`: weak-dual member, nonzero and multiplicative; already nonunital. Continuity comes from the weak-dual carrier, not from positivity. |
| Character compactness/bound | `Mathlib/Analysis/Normed/Algebra/Basic.lean:53`, `:57`: bound by `‖1‖` and unital compactness; no normalized-unit equality assumed. |
| Character spectrum | `Mathlib/Analysis/CStarAlgebra/GelfandDuality.lean:106`, `:116`, `:122`: spectrum/character formula, spectral preservation, nonempty character space with nontriviality in commutative Banach scope. |
| GNS comparison | `Mathlib/Analysis/CStarAlgebra/GelfandNaimarkSegal.lean:57`, `:81`, `:158`, `:196`, `:246`: native pre-GNS/inner product/representation. The construction of bounded left multiplication is C*-input; it does not subsume the general Banach *-algebra target. |
| Multiplier carrier | `Mathlib/Analysis/CStarAlgebra/Multiplier.lean:67`: two bounded linear maps and centrality only; zero annihilators are additional hypotheses when recovering the module identities. |
| Multiplier algebra/star | Same file `:271`, `:275`, `:400`, `:404`, `:449`, `:453`: first-component order, reversed second-component order, star and canonical multiplication maps match A4. |
| Multiplier norm/completeness | Same file `:498`, `:521`, `:531`: max norm and Banach completeness are general; the existing component-norm equality uses CStarRing. A4's contractive-approximate-identity extension has wider input. |
| Jacobson quotient | `Mathlib/RingTheory/Jacobson/Radical.lean:131`, `:134`, `:175`: maximal-left-ideal intersection, two-sidedness and radical-quotient theorem; R04. |
| Unitization | `Mathlib/Analysis/Normed/Algebra/UnitizationL1.lean:63`, `:74`, `:80`: sum norm and isometric inr. The type is `WithLp 1 (Unitization 𝕜 A)`. |
| Resolvent derivative | `Mathlib/Analysis/Normed/Algebra/GelfandFormula.lean:53`: derivative in z is `−resolvent²`, not `+resolvent²`; A2's integration by parts uses the correct sign. |
| Product local compactness | `Mathlib/Topology/Compactness/LocallyCompact.lean:97–128`: finite products and the finite-exception compact-tail interface. It does not supply the converse criterion. |
| Cantor comparison | `Mathlib/Topology/Instances/CantorSet.lean:322`, `:344`: explicit ternary digits 0/2 and homeomorphism to Bool sequences. |
| Integrated representation | `TauCeti/RepresentationTheory/Continuous/Integrated/Basic.lean:105–145`, `:172`, `:188`, `:198`: carriers, formula, bound and translation identity; general noncommutative AddGroup wrapper. |
| Integrated multiplication | Same file `:285–296`: SFinite and right invariance are in scope; arbitrary nonunimodular Haar multiplicativity is not supplied by that signature. |
| Approximation/nondegeneracy | Same file `:391–429`: localized positive-measure hypotheses, shrinking-support weights and closure of the integrated orbit. |
| Real characters | `TauCeti/Geometry/Lie/Exponential/Units/Complex.lean:39`: continuous ℝ→ℂˣ is `exp(t*s)` uniquely; no differentiability input. |
| Integer dual | `TauCeti/Topology/Algebra/PontryaginDual.lean:47`, `:61`, `:67`: topological group isomorphism, evaluation `z^n`, inverse evaluation at 1. |
| Circle dual | `TauCeti/Analysis/Fourier/AddCircle.lean:246`, `:273`: group equivalence at positive period; topological upgrade/transport remains separate. |
| Positive measure uniqueness | `TauCeti/Analysis/Fourier/Pontryagin/Uniqueness.lean:253–270`: finite positive InnerRegular measures on the dual, arbitrary locally compact abelian G; not directly finite complex measures on G. |
| Contour integration | `TauCeti/Analysis/Contour/Cycle/Basic.lean:303` is Banach-valued; `Cycle/HomologyCauchy.lean:234` is scalar. The proposed Banach-valued homology extension is a genuine distinction. |
| Compact Fredholm | `Mathlib/Analysis/Normed/Operator/Compact/FredholmAlternative.lean:164`, `:221`: nonzero spectral parameter required. |
| Compact finite dimensions | `TauCeti/Analysis/Normed/Operator/Compact/RieszTheory.lean:161`, `:173`, `:194`, and `Compact/Eigenspace.lean:132`: kernel/range/cokernel and finite-stage generalized eigenspaces; full stabilized Riesz decomposition is additional. |
| Banach suppliers on main | `TauCetiRoadmap/BanachSpaceTheory/README.md:41`, `:74`, `:167`, `:255`: duality/weak compactness, projective tensors and compact-space regular scalar measures. B5 is not already a C₀ theorem. R02 identifies the unsupplied extra functional. |
| Haar and Brouwer suppliers on main | `TauCetiRoadmap/AmenableGroups/README.md:98`, `:415–482`: means, localized convolution/modular bridges and kernels; `TauCetiRoadmap/AlgebraicTopology/README.md:437`: finite-span Brouwer, expressly leaving Schauder/Lomonosov here. |

Other resolved cross-roadmap references: `TauCetiRoadmap/CStarAlgebras/README.md:85`, `:263`, `:637` at the supplied new-roadmap head locate C1 multipliers, C2 primitive ideals and C6 nuclearity/amenability. They are ownership/consumer statements here, not upward suppliers. `TauCetiRoadmap/RepresentationTheory/SmoothBanachRepresentations/README.md:74`, `:118`, `:134` at its supplied head gives Layers 0–1 and local integrated operators; its lines 66–68 consume BanachAlgebras A7. “SB0–SB1” should be updated to those layer names, not treated as a reverse dependency. On main, `TauCetiRoadmap/OperatorTheory/ToeplitzOperators/README.md:124`, `:220` locate T3/T5; `OperatorTheory/SelfAdjointSpectralTheory/README.md:1001` locates SA-C86 and consumes Banach compact theory. The broad OperatorTheory and OneParameterSemigroups links are exclusions, not hidden prerequisites. The completed contour reference resolves to `Completed/ContourIntegration/README.md`, Layer 3. V11's closed evaluation embedding exists at the supplied broad head, lines 3159–3183; it precedes inversion, and the proposed character sign agrees.

Ownership searches used `roadmaps grep` by object (positive functionals, double centralizers, locally compact products, integrated/regular representations, weak holomorphy, Stieltjes integration, factorization and Wendel), the given main and open-head files, and package READMEs. No distinct earlier owner was found for the general Banach-star positivity extension, zero-annihilator multiplier boundedness or general product converse. Exact-name searches found the old and reviewed BanachAlgebras declarations, but no collision with a different roadmap namespace. The duplicate regular/character/uniqueness ownership is R03; the library duplicates are R04. Search hits in unrelated arithmetic Cohen–Macaulay or algebraic double-centralizer developments were not treated as ownership of these analytic objects.

**Adversarial computations (96 selected rows from 198).** The retained rows cover the seeded sample, headline theorems and targets addressed by findings; the detailed per-target ledger is omitted. Each row records computed values; “pass” means the instance agrees, not a universal proof. R-numbers identify findings. Locators refer to `TauCetiRoadmap/BanachAlgebras/README.md` unless a Lean filename is stated.

| Statement / locator | Instances tried | Computed values on the two sides | Result / change |
|---|---|---|---|
| Unit norm convention, 12–23 | ℂ with norm 2 times modulus | `‖1‖=2`; `‖zw‖=2\|zw\|≤4\|z\|\|w\|` | Pass; retain unnormalized units. |
| Nonunital unitization, 25–29 | Zero-product ℂ, a=ε | `(0,ε)²=0`; unitized spectrum `{0}`; norm `(λ,a)=\|λ\|+\|a\|` | Pass. |
| Bimodule action order, 31–37 | M₂, a=E₁₂,b=E₂₁,x=I | `R(ab)x=E₁₁=R(b)(R(a)x)`; reversed composition gives E₂₂ | Pass; add Check R10. |
| Radical versus module semisimplicity, 103–108 | C([0,1]) | Jacobson radical0; non-Artinian ring, so not semisimple-module ring | Pass distinction. |
| Radical quotient, 107–108 | Dual numbers | rad=(ε); quotient ℂ; quotient radical0 | Pass mathematics, import R04. |
| Simple modules/Rickart, 114–121 | M₂ on ℂ²; algebra ℂ | Commutant of Eᵢⱼ is ℂI; prescribed basis images determine a matrix | Pass finite discriminant. |
| Primitive hull/kernel, 122–127 | ℂ² | Primitive kernels are coordinate axes; hull(0)=both points; intersection=0 | Pass. |
| Closest scalar witnesses, 139–146 | a,b,a+b | Centers 0,(1+i)/2,1+i; residuals 2,√2,2√2 | Pass; README Check, R11. |
| Attempted norm triangle, 143 | Same a,b | q(a)+q(b)=2+3√2/2≈4.1213; q(a+b)=3√2≈4.2426 | Correct failure; R11. |
| Positive-functional bound, 184–194 | Scaled ℂ, φ(z)=tz,t≥0 | `‖φ‖=t/2`; t/2≤t/2≤t; φ(a*a)=t\|a\|²≤4t\|a\|² | Pass; no NormOneClass. |
| Positive Hermitian/Cauchy–Schwarz, 187 | ℂ, φ=id, a=1,b=i | φ(a*b)=i, conjugate reversed= i; \|i\|²=1=φ(a*a)φ(b*b) | Pass. |
| Strict square-root route, 191–194 | h=1/4 in ℂ | `(√3/2)²=3/4=1−h`; h=1 lies outside strict-series hypothesis | Pass. |
| GNS null ideal/bound, 196–201 | φ(z,w)=z on ℂ² with usual star | N={0}×ℂ; H=ℂ; π(z,w) acts by z, norm \|z\|≤max(\|z\|,\|w\|) | Pass. |
| GNS cyclic pairing/zero, 201–205 | φ=id on ℂ; φ=0 | ⟨1,a·1⟩=a; zero functional gives H=0 and vector0 | Pass. |
| Incomplete positivity control, 213–220 | ℂ[X], X^(2n), n=0,1,2 | Sup norm1; moments √π,√π/2,3√π/4; general ratio n+1/2 unbounded | Pass; completeness necessary. |
| Swapped involution, 225–236 | e₁,e₂,h=(1,−1) | e₁*=e₂; e₂e₁=0; h*h=−1; star²h=h | Pass. |
| Swapped positive functionals, 237–240 | φ positive; h and1 | φ(1)≥0 and −φ(1)≥0, hence φ(1)=0 and C–S forces φ=0 | Pass; state norm0≠1. |
| Swapped *-hom, 242–245 | π(e₁),π(e₂) | π(e₁)*π(e₁)=π(0)=0, hence π(e₁)=0; similarly e₂ | Pass. |
| Swapped C*-seminorm, 246–250 | (z,0),(0,w) | q(z,0)²=q(0)=0; q(0,w)=0; q(z,w)≤0+0 | Pass; zero envelope. |
| Holomorphic germ object, 318–326 | Functions agreeing near {0,1} but differing elsewhere | Same germ and same diagonal calculus; changing outside U leaves derivatives on U unchanged | Pass; values (f(0),f(1)) unchanged. |
| Contour calculus/uniqueness, 313–340 | Scalar a=0, f=1,z,z² | Values1,0,0; coordinate sent to0, constants to scalars | Pass. |
| Spectral mapping/composition, 342–345 | T=diag(0,i), f=z²,g=z+1 | σ(f(T))={0,−1}; g(f(T))=diag(1,0)=(g∘f)(T) | Pass. |
| Nonunital calculus, 346–347 | ε²=0; f=z and f=1 | f(ε)=ε in A; constant1 belongs only to unitization | Pass; retain f(0)=0. |
| Isometric calculus normality, 403–409 | diag(0,i); oblique P | Normal diagonal has sup-norm isometry; characteristic projection for oblique P has norm√2 instead of1 | Pass; missing headline R05. |
| Finite spectrum equivalence, 413–424 | diag(0,i), J₂(0), dimension0 | Two evaluation projections; J₂ cannot be image of coordinate0 on {0}; zero case empty sum=I=0 | Pass; missing headline R05. |
| Lagrange projections, 425–435 | T=diag(0,i) | P₀=(T−iI)/(−i)=diag(1,0); Pᵢ=T/i=diag(0,1) | Pass; denominators nonzero. |
| Generalized eigenspace jets, 437–452 | J₂(1)⊕[2] | r₁=2,r₂=1; f(T)=f(1)I₂+f′(1)N ⊕ f(2) | Pass. |
| Ritt bound, 506–516 | a=1,C=1; a=0,C=2 | Powers1≤3; for a=0 norms1 at n=0 and0 thereafter≤12 | Pass. |
| Ritt integration constant, 508–515 | n=0,R=2; n=1,R=3/2 | Radius factor4/3 and27/20, each<3; integral atR=2 is2π/3 | Pass. |
| Kreiss negative control, 521–523 | Unilateral shift, z=−r,r>1 | Ritt ratio `(r+1)/(r−1)→∞` as r↓1; Kreiss ratio bounded | Pass distinction. |
| Gelfand norm/radical, 536–549 | ℂ scaled; dual numbers | Transform norm1/2 for ℂ; ε transforms to0 and spectral radius0 | Pass. |
| Character nonemptiness, 547–549 | ℂ,0,M₂ | Character spaces singleton,empty,empty respectively | Pass; commutativity and nonzero qualifications needed. |
| Unitized character topology, 551–568 | c₀(ℕ); ℂ;0 | Spaces ℕ∪{∞}, two isolated points, singleton respectively | Pass; duplicated owner R03. |
| Closed ideals of C(K), 606–610 | K={0,1}, vanish at0 | Ideal{(0,b)}; hull{0}; evaluation kernels give the two points | Pass; native compact case deferred. |
| Wiener inversion, 646–648 | f=δ₀−(1/2)δ₁ onℤ | Transform1−z/2 never0; inverse coefficients2^(−n), n≥0, ℓ¹ norm2 | Pass. |
| AC carrier/FTC, 722–733 | (c,g)=(1,0),(0,1) | f=1,x; ∫g=0,1 equals f(1)−f(0) | Pass; admitted maps must be removed R01. |
| AC product/norm, 742–749 | f=g=x | Product x²; derivative2x; initial-value norms1,1,1, so1≤1·1 | Pass. |
| AC operator formula, 782–790 | f=x,h=1 | Ψ(f)h=2x; T²1=3x²; Ψ(x²)1=3x² | Pass order/sign; R01 zero-map control. |
| AC calculus norm, 786–787 | f=x,h=1 | L¹ norm2x=1=‖f‖AC,0; column bound t+(1−t)=1 | Pass. |
| AC spectrum, 791–796 | f=x and f=1+x | Spectra[0,1] and[1,2]; inverse at−1 is reciprocal1/(x+1) calculus | Pass. |
| No C([0,1]) extension, 797–799 | f_n=exp(2πinx),h=1 | Ψ(f_n)1=e^(2πinx)(1+2πinx); norm≥∫2πnx=πn, while sup norm1 | Pass; stronger than πn−1. |
| ℓ∞ matrix insufficiency, 826–831 | φ annihilates c₀, φ(1)=1 | Te_j=0 for all j, but T1=e₀≠0 | Mathematics passes; missing supplier R02. |
| Double-centralizer identities, 852–869 | ℂ, S=T=m_z; zero multiplication | Centrality a·zb=za·b; for zero multiplication any S,T satisfy it | Pass; annihilator hypotheses necessary. |
| Automatic boundedness, 859–864 | Graph sequence a_n→0,S(a_n)→y | b y=lim T(b)a_n=0 for all b; zero left annihilator gives y=0 | Pass exact graph-limit computation. |
| Multiplier product order, 867 | M₂ with m_a,m_b | First component L_aL_b=L_ab; second R_bR_a=R_ab | Pass. |
| Multiplier norm/C bound, 871–876 | ℂ with norm2\|z\|, BAI=1,C=2 | Both component norms \|z\|; embedding norm \|z\|=‖z‖/2, not ‖z‖ | Pass negative isometry control. |
| Multiplier star, 877–880 | Scalar m_i | Star components m_(−i); canonical image of i* matches | Pass. |
| Representation extension, 882–893 | ℂ, π=id onℂ; E=0 | π̃(m_z)=m_z, norm \|z\|≤1·1·\|z\|; zero space all maps0 | Pass. |
| Cohen–Hewitt, 895–901 | ℂ regular, x arbitrary,C=1; zero action,x=0 | a=1,y=x: ay=x, ‖a‖1, distance0<ε; zero case a=y=0 | Pass; Lean contains NeBot and bounded action. |
| Balanced tensor, 903–908 | ℂ⊗̂_ℂℂ | z⊗w↦zw; (za)w−z(aw)=0; elementary norm \|z\|\|w\| | Pass. |
| Arens extension/order, 910–917 | Embedded E₁₂,E₂₁ in M₂** | Both products J(E₁₁); reversed factors J(E₂₂) | Pass. |
| Arens regularity distinction, 918–924 | ℓ¹ of free group with distinct s_n t_m; f(s_n t_m)=1_(n≤m) | lim_n lim_m=1; lim_m lim_n=0; corresponding bidual products differ | Pass negative control; add Checks R10. |
| Bidual mixed identity, 922–924 | Unital ℂ, constant BAI1 | Both weak-star limits1; 1□z=z and z◇1=z | Pass; not proof of omitted sides in nonunital case. |
| Separating-space definition, 928–930 | T=id or0 onℂ | Graph vertical fibre{0}; sequences x_n→0 have Tx_n→0 | Pass; API padding R11. |
| Discontinuous separating space, 930–932 | Unbounded algebraic functional on infinite-dimensional Banach E | Choose x_n→0,T x_n=1; S(T)=ℂ; quotient F/S=0 | Pass continuity iff; quotient map0 continuous. |
| Semisimple hom continuity, 962–971 | First projection ℂ²→ℂ; identity M₂ | Operator norms1,1; radicals targets0; maps continuous | Pass stated scope; nonunital omission R05. |
| Derivation continuity/Singer–Wermer, 968–978 | D=[E₁₁,−] onM₂; D=0 onℂ | D(E₁₂)=E₁₂; finite-dimensional boundedness; scalar range0=radℂ | Pass; commutativity essential for radical-range conclusion. |
| Square-zero extension, 1004–1013 | A=E=ℂ,c(a,b)=tab | Cocycle differential0; (0,1)²=(t,1); section a↦(−ta,a) multiplicative | Pass; class is coboundary. |
| Amenability/diagonals, 1015–1026 | ℂ and zero algebra | m=1⊗1: am−ma=0, aΔm=a; zero algebra m=0, both sides0 | Pass. |
| Virtual diagonal construction, 1028–1040 | ℂ, BAI1 | E₀=1⊗1, derivation0,N=0,M=E₀ | Pass; general tensor carrier absent from Lean. |
| Amenability permanence, 1042–1048 | ℂ² quotient toℂ, coordinate ideal | Ideal and quotient ℂ; diagonal of product is sum of coordinate diagonals | Pass. |
| Product criterion, 1056–1074 | Empty I; two real factors; ℝ^ℕ; circle^I | Product point/local/local-false/compact; noncompact-index sizes0,2,∞,0 | Pass both directions. |
| Empty-factor negative control, 1063–1064 | One empty factor, infinitely many ℝ | Product∅ is locally compact; infinitely many noncompact factors | Pass necessity of nonempty factors. |
| Product homeomorphism/reindexing, 1073–1080 | ℝ×Circle^ℕ; permute coordinates | Bad-factor set singleton before/after; local compactness true in both | Pass. |
| Binary Cantor transport, 1082–1095 | Digits 000…,100…,111… | Real points0,2/3,1; XOR of100… with itself0, ambient sum4/3 | Pass. |
| Modular convention, 1097–1113 | Affine group, g=(2,0), left Haar da db/a² | Right translation integral factor2; c(g)=2, c(g⁻¹)=1/2; f*(2,0)=2conj f(1/2,0) | Pass; inverse factor would be wrong. |
| Convolution orientation, 1105 | S₃ point masses | δ_g*δ_h=δ_gh, δ_h*δ_g=δ_hg, unequal for transpositions | Pass. |
| Chosen kernels, 1115–1125 | ℝ, triangular u_ε=(1−\|x\|/ε)₊/ε | Integral1, L¹ norm1, L² norm²2/(3ε); support shrinks | Pass C_c construction. |
| Right-kernel modular factor, 1122–1125 | Affine group; u supported where \|c−1\|<ε | `\|∫cu−1\|≤ε∫u=ε`; limit1, not exact equality for arbitrary u | Pass. |
| Character norm1, 1128–1133 | One-point group with Haar mass2 | χ(f)=2f(e), L¹ norm2\|f(e)\|, operator norm1; χ(identity density)=1 | Pass normalization. |
| Integrated correspondence, 1135–1148 | C₂, π(s)=−I, counting Haar | ρ(aδ_e+bδ_s)=(a−b)I; bound \|a−b\|≤\|a\|+\|b\|; recovered π(s)=−I | Pass; forward API duplicate R04. |
| Local measurability scope, 1140–1142 | Uncountable discrete G, f=δ_e | Support singleton; orbit integral fπ is one term; no global σ-finite measure needed | Pass. |
| Regular representation, 1155–1168 | C₂, λ_s swap matrix | λ_s²=I, λ_s*=λ_s; δ_e−δ_s maps to I−swap≠0 | Pass; owner R03. |
| Common L¹/L² representative, 1159–1167 | Finite group, f=δ_g,h=δ_e | Both convolutions δ_g; L¹ and L² norms1 | Pass; quotient types still distinct. |
| Regular norm strictness | ℤ, f=δ_(−1)+iδ₀+δ₁ | Transform2cosθ+i; max modulus√5<3=L¹ norm | Pass negative isometry control. |
| Discrete unit criterion, 1169–1172 | Finite group Haar weightα; ℝ | Density α⁻¹δ_e gives unit; Lebesgue point density0 cannot give identity | Pass. |
| Measure algebra/product, 1174–1187 | ν=δ_g,η=δ_h; zero measure | ν*η=δ_gh, norm1; zero products0 | Pass; regular-product bridge explicitly owned. |
| Measure involution, 1186–1187 | ν=iδ_g | ν*=−iδ_(g⁻¹); applying twice returns iδ_g | Pass. |
| Measure essentiality, 1189–1195 | ν=δ_t onℝ; triangular kernels | ⟨ν*u_ε,φ⟩→φ(t)=⟨ν,φ⟩; choose φ(t)=1 excludes zero action | Pass. |
| Wendel/norm/one-sided, 1197–1212 | C₂, ν=aδ_e+bδ_s | Convolution matrix[[a,b],[b,a]], ℓ¹ operator norm \|a\|+\|b\|=‖ν‖ | Pass; exact source unavailable. |
| Strict extension/density, 1214–1224 | δ_t→δ_s, t→s; f∈C_c | Strict seminorm is ‖L_t f−L_s f‖₁ plus right analogue→0 | Pass via translations; both terms0 at t=s. |
| L¹ characters, 1226–1240 | C₂, f=(a,b) | χ_+=(a+b),χ_-=(a−b); χ(f*h)=χ(f)χ(h) | Pass, no conjugation. |
| Character uniqueness negative control, 1242–1267 | ν=δ₀−δ₁ onℤ | Transform at1=0; at−1=2; all characters needed | Pass; owner reconciliation R03. |
| Complex uniqueness/Jordan, 1245–1259 | ν=(1+i)(δ_e−δ_s) onC₂ | Two transforms0 and2+2i; both vanish iff coefficient0 | Pass real/imaginary separation. |
| L¹→measure injectivity, 1261–1265 | One-point Haar mass2 | Measure mass2f(e)=0 iff f(e)=0 | Pass. |
| Real dual/inverse continuity, 1272–1282 | y−y₀=d≠0,x=π/d | Quotient characters exp(iπ)=−1; complex distance2 | Pass compact witness. |
| Real Fourier frequency, 1283–1286 | x=1,y=π | exp(−iπ)=−1; fourierChar(−1/2)=−1; native frequency1/2 | Pass 2π factor. |
| Integer dual, 1288–1292 | a=i,n=1; f=δ₁ | Positive transform i; inverse-character transform−i=character at a⁻¹ | Pass. |
| Circle dual/Haar coefficient, 1293–1303 | f(z)=z^k, k=0,1 | Inverse coefficient at n=k is1, at n≠k is0; total Haar mass1 | Pass normalization. |
| Unitized circle spectrum, 1307–1314 | f(z)=z | Positive Fourier transform1 at n=−1,0 elsewhere; unitized spectrum{0,1} | Pass sign and infinity. |
| Johnson equivalence, 1330–1349 | Trivial group; C₂ | Invariant mean average; ℓ¹(C₂) diagonal (δ_e⊗δ_e+δ_s⊗δ_s)/2 has Δ=δ_e | Pass; absent carrier inventory R05. |
| Compact Riesz decomposition, 1371–1380 | T=J₂(2)⊕[0], λ=2 | ker(T−2)²=firstℂ²; range=lastℂ; shifted restrictions nilpotent/invertible | Pass shifted operator convention. |
| Eigenvalue threshold, 1381–1388 | Compact diagonal 1/(n+1) onℓ² | At ε=1/3 exactly3 eigenvalues; only accumulation0 | Pass. |
| Schauder, 1393–1404; Suggested:170 | C=[0,1],f(x)=1−x; C={0} | Fixed points1/2 and0; empty C has none and violates Nonempty | Pass. |
| Lomonosov lemma, 1408–1414; Suggested:149 | A=M₂,K=E₁₁ | a=I,x=e₁ gives aKx=x≠0; K=0 gives no nonzero solution | Pass nonzero hypothesis. |
| Hyperinvariant conclusion, 1416–1423; Suggested:162 | diag(0,1),K=I onℂ²; T=I | First case coordinate lines preserved by commutant; second commutant M₂ has no proper common invariant line | Pass nonscalar hypothesis. |

## Not verifiable

- **Rieffel course notes (`rieffel`)**: the four referenced transcripts are absent. The service's bibliographic lookup, the Berkeley author page and course listings did not identify the edition with the cited physical pages. Different lecture notes found in search were not substituted. Consequently the positive-functional, swapped-star, double-centralizer and measure-multiplier source locators remain uncertified; their independently computed instances are above.
- **Dales, Banach Algebras and Automatic Continuity (`dales`)**: the publisher DOI `10.1093/oso/9780198500131.001.0001` returned an inaccessible page; no readable legal text was obtained. The cited theorem numbers and hypotheses, especially the separating-ideal route, cannot be certified from the source. Finite tests are not a substitute for this missing verification.
- **Runde, Lectures on Amenability (`runde`)** and **Pedersen, Analysis Now (`pedersen`)**: the service returned paywall-only, uncertified records. Those statuses were respected without further requests. The Appendix A/B and §4.2 exercise locators therefore remain unverified, including the full inverse integrated-representation correspondence, Wendel and amenability characterizations.
- **“Short Assignment4”, question 2 (`short-assignment4`)**: no author, date or usable legal location is specified. The service could not identify it. The ℓ∞/c₀ counterexample was computed independently, but that cannot identify the assignment.

The scratch missing-reference list retains only `rieffel`, `dales` and `short-assignment4`; Conway was resolved and removed, and the settled paywall-only records were not re-requested. No source manifest or repository file was edited. The review is finished with these explicit source limitations; it does not claim universal truth from the finite adversarial sample or certify unread sources. Ownership was checked against the supplied open-head files, main and the indexed roadmap search results.

## Source issues

- **Error** in conway at §VII.9 opening examples, printed p.224 (`conway` lines 8748–8750): the source says every countable product of finite discrete sets is a Cantor space; it should be all factors nonempty and infinitely many factors having at least two points; affects a stated result.
- **Error** in conway at Corollary 9.4 proof, printed p.226 (`conway` lines 8817–8821): the source says normalize indicators of all identity neighborhoods by their Haar measures; it should be restrict to relatively compact open identity neighborhoods of finite positive measure; affects the proof.
