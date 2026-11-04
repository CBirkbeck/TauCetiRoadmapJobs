# Review of SporadicOrders (pull request #599 at e16fe9d)

**Verdict:** needs changes

🤖 Independent AI review. Six findings: one P1, one P2 and four P3. The gate passes; the false orbit-length Check and the missing statable headline theorems prevent acceptance. No pull-request file was changed.

## R01 (P1) — The alleged basic orbit of length 48 cannot exist

**Location:** `TauCetiRoadmap/SporadicOrders/README.md:126–128`: “24 · 23 · 22 · 21 · 20 · 48, the lengths of the basic orbits of a stabilizer chain”.

**Claim:** All six factors are orbit lengths for this action on 24 points.

**Witness:** Every orbit is a subset of 24 points, so its size is at most 24. For the specified generators, stabilizing successive points gives lengths 24,23,22,21,20,16,3.

**Repair:** Say that 48 is the order of the pointwise stabilizer of five points; alternatively give the full orbit-length product `24 · 23 · 22 · 21 · 20 · 16 · 3`. Specify the base points. Tested on the exact ATLAS pair and on the Lean cycle pair: both give 244823040, and `16 · 3 = 48`. Preserve the distinction between checking a numerical factorization and checking actual transitivity/orbits; an integer factorization alone does not establish transitivity.

## R02 (P2) — State the other nine groups' headline theorems

**Location:** `TauCetiRoadmap/SporadicOrders/Suggested.lean:10–12`: “nothing is missing at the pins to state them.”

**Claim:** A representative M24 instance suffices for the ten-name acceptance test.

**Witness:** The file declares one carrier and three theorems. README O1/O2 require orders and surjections for ten named models. Eighteen primary headline statements are absent.

**Repair:** Add the exact ATLAS carriers and the order and presentation-surjection signatures for M11, M12, M22, M23, J1, J2, HS, McL and Co3, each with `sorry`, using simple real definitions on native permutation types. Retain only genuine acceptance targets, not per-model API or Check declarations. The nontriviality corollaries can be treated consistently with the chosen headline scope.

**Repair test:** I transcribed all twenty image lists into disjoint cycles and elaborated all ten carriers and all thirty analogous signatures against the pins. Plain long multiplication expressions timed out for three large carriers; typed lists of disjoint cycles followed by `.prod` elaborated for all ten under the defaults, without a new dependency or `set_option`. Thus the missing native carriers are statable, including the large cases.

## R03 (P3) — Replace executable milestones with mathematical specifications

**Location:** `TauCetiRoadmap/SporadicOrders/README.md:79–83`: “Add `hex-perm-group-mathlib` to `lakefile.toml`”; also lines 91, 97–98 and 138–140.

**Claim:** Dependency installation, a tactic test, a required data encoding and mandated tactics constitute the foundation and prescribed proofs of the roadmap.

**Witness:** O0's entire deliverable changes build configuration and runs a tactic/axiom test. O1 requires `perm_group`; O2 requires `decide +kernel` and `perm_group`.

**Repair:** Remove the software-installation/test milestone and implementation/runtime prescriptions from the mathematical targets. State the mathematical inputs and outputs: subgroup generation, the orbit–stabilizer cardinality argument, and presentation evaluation with its image and generation conditions. Consume the pinned general theory by exact declaration; cite Hex as provenance or a possible proof route, with the soundness hypotheses explicit. Do not re-plan existing orbit–stabilizer or presentation theory. This is the brief's mathematics-versus-algorithms policy, not an objection to kernel-checked proofs.

**Repair test:** For O0's pair the mathematical statement is still `11 · 10 · 9 · 8 = 7920`; for M24 it is the corrected product in R01. Neither statement needs a prescribed tactic or encoding. `MulAction.card_orbit_mul_card_stabilizer_eq_card_group` and `PresentedGroup.toGroup` already provide the generic interfaces at the pin.

## R04 (P3) — Give each carrier its API and discriminating Checks

**Location:** `TauCetiRoadmap/SporadicOrders/README.md:87–131`: “For each name below, define”.

**Claim:** One table and three shared Check bullets specify ten usable carrier definitions.

**Witness:** Two Check bullets concern M24; the third concerns O0's different M11 generators. The other nine canonical carriers have no individual three-Check set, and the definition has no basic-API list.

**Repair:** For each carrier, give its generator/action interface and cite the inherited subgroup API instead of reproving it. Include at least three discriminating Checks on its actual generators. The carrier and order tables below supply concrete generator orders, fixed-point counts and orbit products. Add an image-direction Check and a product/relator-convention Check, rather than only orders that survive inversion.

**Repair test:** For M24, `b(0)=3` but `b⁻¹(0)=5`; nevertheless both pairs have element-order triple `(2,3,23)`. The sixth pinned presentation relator sends 0 to 20 on `(a,b)` and is the identity on `(a,b⁻¹)`. All seven relators hold for the latter pair and it generates the same subgroup. This is a useful positive and negative control; the existential theorem itself is not refuted. For M11, the actual ATLAS pair has orders `(2,4)`, fixed-point counts `(3,3)` and product order 11, distinguishing it from the O0 test's order-11 first generator.

## R05 (P3) — Supply the required layer and dependency structure

**Location:** `TauCetiRoadmap/SporadicOrders/README.md:77`, `:85`, `:133` (the O0–O2 headings), and `Suggested.lean:24–42`.

**Claim:** The build order and supplier interfaces are sufficiently specified by these three blocks.

**Witness:** There are zero `*Needs:*` lines, no Exact supplier contracts or Conventions sections, no layer-end Examples/Dependencies, and no layer section comments in the Lean file.

**Repair:** Use the required Summary, Conventions, Exact supplier contracts, How to read the build, numbered layers, Examples and Dependencies structure. List each target's inputs, including CFSGStatement S0/S1 and the exact pinned presentation/evaluation API. Keep CFSGBasicProperties exclusively a consumer. Add matching layer comments and align the README's named declarations with Lean, including `nontrivial_M24` if retained.

**Repair test:** The verified dependency direction is CFSGStatement/native presentations → this roadmap's models and surjections → CFSGBasicProperties P1 recognition. O2 requires O1 for the stated lower bounds, but its relator evaluation uses the native presentation API. This separation needs no upward edge. The mechanical check reports zero problems, as recorded below; this finding concerns missing explicit contracts, not a detected cycle.

## R06 (P3) — Record reproducible source locators and versions

**Location:** `TauCetiRoadmap/SporadicOrders/README.md:62–75`, `:89–100`, and the end of the file at line 160.

**Claim:** Mutable repository links and the ATLAS landing page provide the full source record.

**Witness:** The folder has no `sources.toml` and the README no References section. Hex and FiniteSimpleGroups have no selected revision or file locator; the Hex URL redirects to a renamed repository.

**Repair:** Add References and the required source manifest, reusing one key per work. Link the exact ATLAS representation/image files and order pages; record immutable Hex and FiniteSimpleGroups revisions and relevant declarations/files. Identify the version whose compatibility or axiom claims are intended. Do not copy source passages into the roadmap.

**Repair test:** All twenty named ATLAS image files were legally fetched and parsed; their exact degrees and computed orders agree with the table. The current Hex source really contains `Hex.PermGroup.Kernel.card_closure` and the historical `permOfImages` alias, so the worker's unresolved-name lead is not a missing-declaration finding. Its source still needs a reproducible version and a distinction from the project's pinned dependencies.

## Verified sound

The review covered both requested files at head `e16fe9d37e24942c636f6fce12adf010833cc9b2`. Main context was `2b363a2b5643eed47f0cf2ed7ffcc85141b79af4`. I read the relevant main-branch CFSGStatement and CFSGBasicProperties specifications, and the IntegralLattices/AlgebraicCodingTheory conventions and ownership material as shape/neighboring examples. There is no previous AI review to reconcile.

**Gate, scope and elaboration.** The supplied gate reports every scanner, dependency, metadata, stray-file, outside-folder and targeted-build check passing. The outside-folder diff is empty and the worktree remained clean. There is a single `import Mathlib` and one real Tau Ceti module import; no sorry'd data, `set_option`, free condition placeholders or arbitrary carriers were found. The M24 subgroup is defined by real permutations. No copied source passage was identified in the reviewed text.

The imported Tau Ceti presentation module was built successfully before running `lake env lean` on the absolute target path from the specified worktree. Direct elaboration exited 0 with exactly the three expected `sorry` warnings. A scratch copy appended `#check @name` for all four declarations: the carrier is a subgroup of `Equiv.Perm (Fin 24)`, the order is its `Nat.card`, the surjection uses the native M24 presentation and that subgroup, and nontriviality concerns that same native presentation. There are no section variables to disappear; no signature correction was required.

For each of the three sorried theorems I tried `simp`, `rfl` and `infer_instance` independently in a scratch probe; none closed the goal. Object searches found no pinned single theorem proving one of these exact conclusions. Thus no one-tactic padding was established. The separate ten-model signature probe ultimately passed under defaults with thirty `sorry` warnings; its purpose was statability, not proving the thirty results.

**Headline inventory.** O1 has ten order theorems, one for each table row. O2 has ten surjections from the exact native presented groups onto those models, and derives ten nontriviality statements and conditional cardinal lower bounds. The Lean file states M24's order, surjection and nontriviality only. All ten carriers and all thirty analogous order/surjection/nontriviality signatures are statable at these pins; none needs an unstatable-carrier excuse. The scope correctly excludes simplicity and presentation upper bounds. In particular, a surjection alone is not used to assert finiteness or an isomorphism.

**Source sample.** The brief says “15 targets (none found by heading)” but supplies no identifiable seeded target list. I cannot claim to reproduce an unspecified seed. Instead I checked all ten O1 rows, plus five concrete items: O0's M11 example, Hex cardinality soundness, the exact Lean M24 generator transcription, M24's stated Check values, and M24's O2 presentation evaluation. No locator in the README is explicitly marked unverified. These sources are unpaginated web/code artifacts: extraction page 1 and the filenames/declaration names are their locators, not invented theorem or printed-page numbers.

All fetching used the source service. Source keys used here are `atlas`, `hex` and `finite-simple-groups`; document names below disambiguate extractions within the same work, not new manifest keys. Initially rejected GitHub fetches succeeded after identifying the authors' public repositories. No source request remains pending.

For every O1 name, the ATLAS group page gives its order at **atlas line 9**, its named representation page gives the degree at **atlas line 18**, and each image file has its format/degree header at **atlas line 5**, followed by the images from line 6. The image endpoints are:

| Group | Exact file stem (both `.m1` and `.m2`) | Last image line | Source order, atlas line 9 | Independently computed order |
| --- | --- | ---: | ---: | ---: |
| M11 | `M11G1-p11B0` | 16 | 7920 | 7920 |
| M12 | `M12G1-p12aB0` | 17 | 95040 | 95040 |
| M22 | `M22G1-p22B0` | 27 | 443520 | 443520 |
| M23 | `M23G1-p23B0` | 28 | 10200960 | 10200960 |
| M24 | `M24G1-p24B0` | 29 | 244823040 | 244823040 |
| J1 | `J1G1-p266B0` | 271 | 175560 | 175560 |
| J2 | `J2G1-p100B0` | 105 | 604800 | 604800 |
| HS | `HSG1-p100B0` | 105 | 44352000 | 44352000 |
| McL | `McLG1-p275B0` | 280 | 898128000 | 898128000 |
| Co3 | `Co3G1-p276B0` | 281 | 495766656000 | 495766656000 |

The [ATLAS representation catalogue](https://brauer.maths.qmul.ac.uk/Atlas/v3/) leads to the ten exact representation records and their MeatAxe image files. The two M24 cycle expressions agree point by point with the `.m1` and `.m2` data after shifting by one. Each file's image list is a bijection, including the large-degree cases.

The [Hex kernel bridge](https://github.com/leanprover/hex-perm-group-theory/blob/main/HexPermGroupTheory/Kernel.lean), **hex lines 31–33**, states cardinality only under a successful certificate check. **hex lines 71–74** additionally tie packed input data and the desired numeral to the certificate; lines 76–99 supply the corresponding positive/negative membership and top-subgroup consequences. **hex line 36** exports `permOfImages`. These are external source declarations, not declarations present at the project's pins. The [FiniteSimpleGroups source overview](https://github.com/KitaKen1/finite-simple-groups-lean), **finite-simple-groups lines 284–298 and 306–359**, records the concrete subgroup setting and all fourteen claimed order/simplicity results; lines 452–462 describe the larger memory requirements. I did not import or execute downloaded source code.

**Computed adversarial pass.** The following 77 rows cover ten carrier definitions, ten order targets, twenty general/convention/Check instances, seven M24 relators, ten surjection targets and twenty nontriviality/lower-bound instances. The tables separate actual computations from negative-control tests of the planned statements. For the order calculations I used independently written permutation composition and stabilizer-chain calculations on the fetched numerical image lists. These are review witnesses, not Lean proofs or imported certificates. Small controls returned `|Sym(0)|=1`, `|Sym(1)|=1`, `|Sym(2)|=2`, and `|Sym(3)|=6`. Stabilizer bases below use successive zero-based points, terminating when the pointwise stabilizer is trivial.

| Statement | Instances tried | Computed values | Result/change |
| --- | --- | --- | --- |
| O1 carrier M11 | Exact two image lists on 11 points; replace both by identity | Images are bijective: 11 distinct images each; `(a(0),b(0)) = (0,3)`; generator orders (2, 4), fixed-point counts (3, 3); identity pair has orders (1,1), closure size 1 | Actual carrier differs from trivial model; R04 asks for these discriminating Checks in the README |
| O1 carrier M12 | Exact two image lists on 12 points; replace both by identity | Images are bijective: 12 distinct images each; `(a(0),b(0)) = (3,7)`; generator orders (2, 3), fixed-point counts (4, 0); identity pair has orders (1,1), closure size 1 | Actual carrier differs from trivial model; R04 asks for these discriminating Checks in the README |
| O1 carrier M22 | Exact two image lists on 22 points; replace both by identity | Images are bijective: 22 distinct images each; `(a(0),b(0)) = (12,21)`; generator orders (2, 4), fixed-point counts (6, 2); identity pair has orders (1,1), closure size 1 | Actual carrier differs from trivial model; R04 asks for these discriminating Checks in the README |
| O1 carrier M23 | Exact two image lists on 23 points; replace both by identity | Images are bijective: 23 distinct images each; `(a(0),b(0)) = (1,15)`; generator orders (2, 4), fixed-point counts (7, 3); identity pair has orders (1,1), closure size 1 | Actual carrier differs from trivial model; R04 asks for these discriminating Checks in the README |
| O1 carrier M24 | Exact two image lists on 24 points; replace both by identity | Images are bijective: 24 distinct images each; `(a(0),b(0)) = (3,3)`; generator orders (2, 3), fixed-point counts (0, 6); identity pair has orders (1,1), closure size 1 | Actual carrier differs from trivial model; R04 asks for these discriminating Checks in the README |
| O1 carrier J1 | Exact two image lists on 266 points; replace both by identity | Images are bijective: 266 distinct images each; `(a(0),b(0)) = (261,145)`; generator orders (2, 3), fixed-point counts (10, 5); identity pair has orders (1,1), closure size 1 | Actual carrier differs from trivial model; R04 asks for these discriminating Checks in the README |
| O1 carrier J2 | Exact two image lists on 100 points; replace both by identity | Images are bijective: 100 distinct images each; `(a(0),b(0)) = (83,79)`; generator orders (2, 3), fixed-point counts (0, 4); identity pair has orders (1,1), closure size 1 | Actual carrier differs from trivial model; R04 asks for these discriminating Checks in the README |
| O1 carrier HS | Exact two image lists on 100 points; replace both by identity | Images are bijective: 100 distinct images each; `(a(0),b(0)) = (59,85)`; generator orders (2, 5), fixed-point counts (20, 0); identity pair has orders (1,1), closure size 1 | Actual carrier differs from trivial model; R04 asks for these discriminating Checks in the README |
| O1 carrier McL | Exact two image lists on 275 points; replace both by identity | Images are bijective: 275 distinct images each; `(a(0),b(0)) = (190,23)`; generator orders (2, 5), fixed-point counts (35, 0); identity pair has orders (1,1), closure size 1 | Actual carrier differs from trivial model; R04 asks for these discriminating Checks in the README |
| O1 carrier Co3 | Exact two image lists on 276 points; replace both by identity | Images are bijective: 276 distinct images each; `(a(0),b(0)) = (244,203)`; generator orders (3, 4), fixed-point counts (6, 16); identity pair has orders (1,1), closure size 1 | Actual carrier differs from trivial model; R04 asks for these discriminating Checks in the README |

| Statement | Instances tried | Computed left side | Stated right side | Result/change |
| --- | --- | --- | --- | --- |
| O1 order M11 (README:104) | Successive stabilizers of points 0,1,… | 11 × 10 × 9 × 8 = 7920 | 7920 | Equal; no order correction |
| O1 order M12 (README:105) | Successive stabilizers of points 0,1,… | 12 × 11 × 10 × 9 × 8 = 95040 | 95040 | Equal; no order correction |
| O1 order M22 (README:106) | Successive stabilizers of points 0,1,… | 22 × 21 × 20 × 16 × 3 = 443520 | 443520 | Equal; no order correction |
| O1 order M23 (README:107) | Successive stabilizers of points 0,1,… | 23 × 22 × 21 × 20 × 3 × 16 = 10200960 | 10200960 | Equal; no order correction |
| O1 order M24 (README:108) | Successive stabilizers of points 0,1,… | 24 × 23 × 22 × 21 × 20 × 16 × 3 = 244823040 | 244823040 | Equal; no order correction |
| O1 order J1 (README:109) | Successive stabilizers of points 0,1,… | 266 × 110 × 6 = 175560 | 175560 | Equal; no order correction |
| O1 order J2 (README:110) | Successive stabilizers of points 0,1,… | 100 × 63 × 24 × 4 = 604800 | 604800 | Equal; no order correction |
| O1 order HS (README:111) | Successive stabilizers of points 0,1,… | 100 × 77 × 60 × 32 × 3 = 44352000 | 44352000 | Equal; no order correction |
| O1 order McL (README:112) | Successive stabilizers of points 0,1,… | 275 × 112 × 81 × 36 × 5 × 2 = 898128000 | 898128000 | Equal; no order correction |
| O1 order Co3 (README:113) | Successive stabilizers of points 0,1,… | 276 × 275 × 162 × 56 × 45 × 16 = 495766656000 | 495766656000 | Equal; no order correction |

| Statement | Instances tried | Computed values on the two sides | Result/change |
| --- | --- | --- | --- |
| O0 test order | The two displayed permutations on 11 points | Chain `11,10,9,8`; product 7920 = claimed 7920 | Correct mathematical example; R03 changes the specification form |
| O0 cyclic negative control | Keep only its 11-cycle | Closure order 11 ≠ 7920 | Correct discriminating control |
| Image-list convention | M24 second file, first point | File image 4 gives `b(0)=4−1=3`; inverse gives 5 ≠ 3 | Forward image rule is meaningful; add explicit Check (R04) |
| Point-index boundary | Valid indices 1 and n; invalid 0 | `1−1=0`, `n−1=n−1`; natural `0−1=0` would alias the first point | Stated domain 1,…,n excludes the junk input; preserve it |
| M24 first generator Check | Its twelve transpositions | Order 2 = 2; fixed-point count 0 = 0; `a(0)=3`, `a(1)=6` | Correct |
| M24 second generator Check | Its six 3-cycles | Order 3 = 3; fixed-point count 6 = 6 | Correct |
| M24 product-order Check | `a*b` and `a*b⁻¹` | Both orders 23 = 23 | Correct, but cannot determine image direction |
| M24 swapped-image negative control | Exchange images at inputs 0 and 1 in b | Sign changes +1 to −1; order changes 3 to 6 | Correct: damaged permutation cannot have order 3 |
| M24 orbit-length Check | Full chain for the actual action | Actual lengths `24,23,22,21,20,16,3`; claimed final orbit 48 > degree 24 | False as written; R01 |
| M24 remaining stabilizer/order arithmetic | Fix points 0,…,4 | Remaining order `16·3=48`; `24·23·22·21·20·48=244823040` | Numerical factorization is correct; label 48 correctly |
| M24 prime factorization | Lean theorem docstring | `2¹⁰·3³·5·7·11·23=244823040` | Correct |
| M24 index-two comparison | Hypothetical subgroup of index 2 | Required order `244823040/2=122411520` ≠ 244823040 | Numerical order Check rejects it; no existence assertion needed |
| Permutation multiplication | M24 a,b at 0 | `(a*b)(0)=a(3)=0`; `(b*a)(0)=b(3)=5` | Native right-to-left composition; reversing matters |
| Same convention on a nonabelian small group | S3, σ=(01), τ=(12), point 0 | `(σ*τ)(0)=1`, `(τ*σ)(0)=2` | Two-term witness for R04 |
| Closure membership equality in both directions | S3: `{(01),(012)}` versus `{(01)}` | First closure has size 6; second size 2; inclusion only from second to first | Both generator-containment directions in O2 are necessary |
| Closure equality with inverses | M24 `{a,b}` and `{a,b⁻¹}` | Both computed sizes 244823040; each generator recovered from other set by inverse | Explicit recovery gives equality, not equality of sizes alone |
| Carrier identification is stronger than equal cardinality | Distinct C2 subgroups of S3 | Both orders 2; `(01)` lies in one and not in the other | Scope warning about different carriers is correct |
| Generic empty/trivial generated group | Empty generators or only identity; degrees 0,1,2 | Closure size 1 in every case; on degree 2 this differs from top of size 2 | Native closure has expected boundary behavior |
| Hex cardinality/closure contract, mathematical instance | S3 transposition and 3-cycle | Generated subgroup order 6 = `3!`; `<(01)>` has order 2 ≠ 6 | Correct conclusion when its certificate hypotheses hold; checker execution not certified here |
| Hex membership and nonmembership contract, mathematical instance | `<(01)>` in S3 | `(01)` is one of its 2 elements; `(012)` is not | Positive/negative membership conclusions distinguished |
| M24 pinned relator 1 | Evaluate on `(a,b)` and `(a,b⁻¹)` | Support size 0 versus 0; identity support size 0 | Both evaluations are identity |
| M24 pinned relator 2 | Evaluate on `(a,b)` and `(a,b⁻¹)` | Support size 0 versus 0; identity support size 0 | Both evaluations are identity |
| M24 pinned relator 3 | Evaluate on `(a,b)` and `(a,b⁻¹)` | Support size 0 versus 0; identity support size 0 | Both evaluations are identity |
| M24 pinned relator 4 | Evaluate on `(a,b)` and `(a,b⁻¹)` | Support size 0 versus 0; identity support size 0 | Both evaluations are identity |
| M24 pinned relator 5 | Evaluate on `(a,b)` and `(a,b⁻¹)` | Support size 0 versus 0; identity support size 0 | Both evaluations are identity |
| M24 pinned relator 6 | Evaluate on `(a,b)` and `(a,b⁻¹)` | Support size 22 versus 0; identity support size 0; original sends 0 to 20 | Inverse-generator dictionary fixes the mismatch; R04 |
| M24 pinned relator 7 | Evaluate on `(a,b)` and `(a,b⁻¹)` | Support size 0 versus 0; identity support size 0 | Both evaluations are identity |

| Headline statement | Instances tried | Computed values | Result/change |
| --- | --- | --- | --- |
| O2 surjection for M11 | Wrong candidate: every presentation generator maps to 1 | Every relator evaluates to 1; image size 1 ≠ 7920, the computed model size | Generation condition rejects the trivial map; positive generator dictionary not independently reconstructed; missing signature R02 |
| O2 surjection for M12 | Wrong candidate: every presentation generator maps to 1 | Every relator evaluates to 1; image size 1 ≠ 95040, the computed model size | Generation condition rejects the trivial map; positive generator dictionary not independently reconstructed; missing signature R02 |
| O2 surjection for M22 | Wrong candidate: every presentation generator maps to 1 | Every relator evaluates to 1; image size 1 ≠ 443520, the computed model size | Generation condition rejects the trivial map; positive generator dictionary not independently reconstructed; missing signature R02 |
| O2 surjection for M23 | Wrong candidate: every presentation generator maps to 1 | Every relator evaluates to 1; image size 1 ≠ 10200960, the computed model size | Generation condition rejects the trivial map; positive generator dictionary not independently reconstructed; missing signature R02 |
| O2 / `exists_surjective_M24` | Send presentation generators to `(a,b⁻¹)` | Seven relator supports `(0,0,0,0,0,0,0)`; image closure size 244823040 = model size 244823040; recovery `b = (b⁻¹)⁻¹` | Supports the claimed surjection by the native universal property; add convention Check (R04) |
| O2 surjection for J1 | Wrong candidate: every presentation generator maps to 1 | Every relator evaluates to 1; image size 1 ≠ 175560, the computed model size | Generation condition rejects the trivial map; positive generator dictionary not independently reconstructed; missing signature R02 |
| O2 surjection for J2 | Wrong candidate: every presentation generator maps to 1 | Every relator evaluates to 1; image size 1 ≠ 604800, the computed model size | Generation condition rejects the trivial map; positive generator dictionary not independently reconstructed; missing signature R02 |
| O2 surjection for HS | Wrong candidate: every presentation generator maps to 1 | Every relator evaluates to 1; image size 1 ≠ 44352000, the computed model size | Generation condition rejects the trivial map; positive generator dictionary not independently reconstructed; missing signature R02 |
| O2 surjection for McL | Wrong candidate: every presentation generator maps to 1 | Every relator evaluates to 1; image size 1 ≠ 898128000, the computed model size | Generation condition rejects the trivial map; positive generator dictionary not independently reconstructed; missing signature R02 |
| O2 surjection for Co3 | Wrong candidate: every presentation generator maps to 1 | Every relator evaluates to 1; image size 1 ≠ 495766656000, the computed model size | Generation condition rejects the trivial map; positive generator dictionary not independently reconstructed; missing signature R02 |

The zero-image tests in the other nine rows are deliberately negative controls, not purported witnesses for their positive existence statements. No conclusion for those nine is inferred solely from a database label. For M24, the seven relators were read from `TauCeti/GroupTheory/SpecificGroups/CFSG/Sporadic/Mathieu/TwentyFour.lean:197–204` and evaluated with the source commutator convention `r⁻¹s⁻¹rs`. The sixth failure on the forward pair shows why preserving the actual native relators while choosing correct generator images matters.

| Derived statement | Instances tried | Computed values | Result/change |
| --- | --- | --- | --- |
| O2 nontriviality for M11 | Trivial source versus a source surjecting onto the stated model | Trivial source has image size at most 1 < 7920; surjective source has at least two distinct preimages | Correct conditional deduction; only M24 has a positive dictionary checked here |
| O2 nontriviality for M12 | Trivial source versus a source surjecting onto the stated model | Trivial source has image size at most 1 < 95040; surjective source has at least two distinct preimages | Correct conditional deduction; only M24 has a positive dictionary checked here |
| O2 nontriviality for M22 | Trivial source versus a source surjecting onto the stated model | Trivial source has image size at most 1 < 443520; surjective source has at least two distinct preimages | Correct conditional deduction; only M24 has a positive dictionary checked here |
| O2 nontriviality for M23 | Trivial source versus a source surjecting onto the stated model | Trivial source has image size at most 1 < 10200960; surjective source has at least two distinct preimages | Correct conditional deduction; only M24 has a positive dictionary checked here |
| O2 nontriviality for M24 | Trivial source versus a source surjecting onto the stated model | Trivial source has image size at most 1 < 244823040; surjective source has at least two distinct preimages | Correct conditional deduction; only M24 has a positive dictionary checked here |
| O2 nontriviality for J1 | Trivial source versus a source surjecting onto the stated model | Trivial source has image size at most 1 < 175560; surjective source has at least two distinct preimages | Correct conditional deduction; only M24 has a positive dictionary checked here |
| O2 nontriviality for J2 | Trivial source versus a source surjecting onto the stated model | Trivial source has image size at most 1 < 604800; surjective source has at least two distinct preimages | Correct conditional deduction; only M24 has a positive dictionary checked here |
| O2 nontriviality for HS | Trivial source versus a source surjecting onto the stated model | Trivial source has image size at most 1 < 44352000; surjective source has at least two distinct preimages | Correct conditional deduction; only M24 has a positive dictionary checked here |
| O2 nontriviality for McL | Trivial source versus a source surjecting onto the stated model | Trivial source has image size at most 1 < 898128000; surjective source has at least two distinct preimages | Correct conditional deduction; only M24 has a positive dictionary checked here |
| O2 nontriviality for Co3 | Trivial source versus a source surjecting onto the stated model | Trivial source has image size at most 1 < 495766656000; surjective source has at least two distinct preimages | Correct conditional deduction; only M24 has a positive dictionary checked here |
| O2 cardinal lower bound for M11 | Identity of the model; projection ℤ × model → model | Finite case `7920 ≤ 7920`; infinite case `Nat.card = 0`, so antecedent `0 < 0` is false | Positivity hypothesis correctly excludes the junk cardinal 0 |
| O2 cardinal lower bound for M12 | Identity of the model; projection ℤ × model → model | Finite case `95040 ≤ 95040`; infinite case `Nat.card = 0`, so antecedent `0 < 0` is false | Positivity hypothesis correctly excludes the junk cardinal 0 |
| O2 cardinal lower bound for M22 | Identity of the model; projection ℤ × model → model | Finite case `443520 ≤ 443520`; infinite case `Nat.card = 0`, so antecedent `0 < 0` is false | Positivity hypothesis correctly excludes the junk cardinal 0 |
| O2 cardinal lower bound for M23 | Identity of the model; projection ℤ × model → model | Finite case `10200960 ≤ 10200960`; infinite case `Nat.card = 0`, so antecedent `0 < 0` is false | Positivity hypothesis correctly excludes the junk cardinal 0 |
| O2 cardinal lower bound for M24 | Identity of the model; projection ℤ × model → model | Finite case `244823040 ≤ 244823040`; infinite case `Nat.card = 0`, so antecedent `0 < 0` is false | Positivity hypothesis correctly excludes the junk cardinal 0 |
| O2 cardinal lower bound for J1 | Identity of the model; projection ℤ × model → model | Finite case `175560 ≤ 175560`; infinite case `Nat.card = 0`, so antecedent `0 < 0` is false | Positivity hypothesis correctly excludes the junk cardinal 0 |
| O2 cardinal lower bound for J2 | Identity of the model; projection ℤ × model → model | Finite case `604800 ≤ 604800`; infinite case `Nat.card = 0`, so antecedent `0 < 0` is false | Positivity hypothesis correctly excludes the junk cardinal 0 |
| O2 cardinal lower bound for HS | Identity of the model; projection ℤ × model → model | Finite case `44352000 ≤ 44352000`; infinite case `Nat.card = 0`, so antecedent `0 < 0` is false | Positivity hypothesis correctly excludes the junk cardinal 0 |
| O2 cardinal lower bound for McL | Identity of the model; projection ℤ × model → model | Finite case `898128000 ≤ 898128000`; infinite case `Nat.card = 0`, so antecedent `0 < 0` is false | Positivity hypothesis correctly excludes the junk cardinal 0 |
| O2 cardinal lower bound for Co3 | Identity of the model; projection ℤ × model → model | Finite case `495766656000 ≤ 495766656000`; infinite case `Nat.card = 0`, so antecedent `0 < 0` is false | Positivity hypothesis correctly excludes the junk cardinal 0 |

**Pinned API and duplication audit.** Pins were verified directly: Mathlib `5e0c4e5239cb0a2d86d68a884bf52cfd963fce22`, Tau Ceti `a780c7ad6beb23f60a17351a492d177878020ad5`. I searched both by objects—permutation closure, finite generated subgroups, presented-group evaluation, sporadic carriers, cardinalities and nontriviality—and opened the following declarations. These are supplier facts, not targets to duplicate:

| File at the pin | Declaration and exact interface checked |
| --- | --- |
| `Mathlib/Algebra/Group/Subgroup/Lattice.lean:329` | `Subgroup.closure` is `sInf { K | k ⊆ K }`; it includes no order, simplicity or transitivity assertion. |
| Same file, lines 341, 355, 359, 437, 457, 482 | `subset_closure`, `closure_le`, `closure_eq_of_le`, `closure_empty`, `closure_eq_bot_iff`, `closure_singleton_one`: generator inclusion, universal property, equality and trivial controls. |
| `Mathlib/Algebra/Group/End.lean:102` | `Equiv.Perm.mul_apply`: `(f*g) x = f (g x)`. |
| `Mathlib/GroupTheory/PresentedGroup.lean:90` | `PresentedGroup.closure_range_of`: the native presentation generators generate the quotient. |
| Same file, lines 135, 139, 142 | `PresentedGroup.toGroup`, `.of`, `.unique`: require every relator's evaluation to be 1; supply the homomorphism and its generator values/uniqueness, not surjectivity without generation. |
| `Mathlib/GroupTheory/GroupAction/Quotient.lean:178`, `:185` | `MulAction.orbitProdStabilizerEquivGroup` and `card_orbit_mul_card_stabilizer_eq_card_group`; the cardinal theorem carries the three Fintype assumptions. |
| `Mathlib/SetTheory/Cardinal/Finite.lean:89`, `:98` | `Nat.finite_of_card_ne_zero`; `Nat.card_le_card_of_surjective` requires a finite source. |
| `Mathlib/SetTheory/Cardinal/NatCard.lean:108` | `Nat.card_le_of_surjective'` explicitly addresses the zero cardinal of infinite sources. |
| `TauCeti/GroupTheory/Presentation/Relator.lean:207` | `Relator.toFreeGroup` respects multiplication and inverse in the written abstract word order. |
| `TauCeti/GroupTheory/Presentation/GroupPresentation.lean:180`, `:188`, `:207` | `relatorSet`, `mem_relatorSet_iff`, and `Group`: actual compiled words and their native `PresentedGroup`, with no finiteness or simplicity field. |
| `TauCeti/GroupTheory/SpecificGroups/CFSG/Sporadic/Presentation.lean:66`, `:131` | `SporadicName.presentation`, `SporadicName.Group`: all ten constructors dispatch to real presentations; `Group` abbreviates that presentation's group. |
| `TauCeti/GroupTheory/SpecificGroups/CFSG/Sporadic/Mathieu/TwentyFour.lean:174`, `:278` | `m24Presentation`, `m24Presentation_transcribed`: two generators and seven actual relators, not the informal standard-generator test alone. |
| `TauCeti/GroupTheory/GroupAction/Orbit/Finset.lean:158`, `:163`, `:169` | `Finset.mem_closureFinset`, `coe_closureFinset`, `card_closureFinset`: native finite generated-subgroup interface; not the ten sporadic order theorems. |

No pinned declaration proving these exact M24 headlines, and no other declaration with these four fully qualified roadmap names, was found. External Hex is not in `lake-manifest.json`; its absence from the pinned sources is expected, not proof that its cited declaration is nonexistent.

**Cross-roadmap ownership and order.** I used the supplied `roadmaps grep`/`show` tools and searched the available package README/Lean files by the same objects. The open-work index was inspected; revisions of existing roadmaps were not substituted for their main-branch supplier contracts. The concrete resolutions are:

- `TauCetiRoadmap/CFSGStatement/README.md:676` (S0) and `:721` (S1) own presentation data and its transcription review. Lines 18–34 exclude order/simplicity proofs and distinguish the informal cross-check from a Lean target. This roadmap's surjections extend that cross-check rather than re-planning its presentations.
- `TauCetiRoadmap/CFSGBasicProperties/README.md:69–78` explicitly assigns these ten canonical models, orders and presentation maps to SporadicOrders. P0 at line 257 owns generic presented-group recognition/upper-bound machinery; P1 at lines 330–346 consumes these ten carriers and owns the four additional models. P2 at line 349 names the remaining twelve. All cited P0 items and P1/P2 scope references resolve. No dependence on its upper bounds or simplicity is needed here.
- `Completed/AlgebraicCodingTheory/README.md:30` and `:319` exclude the Mathieu automorphism-group identification. Its Golay code construction is not a second owner of these exact ATLAS permutation carriers.
- The open-work object search found related finite-group constructions and the CFSG consumer, but no competing fully qualified definition of these four declarations in the supplied context. No claim is made about inaccessible/unlisted open work. A new general permutation-word/primitivity construction would require a fresh ownership check; this file introduces none.

I found no upward supplier, cycle, undeclared gap or reference to a nonexistent CFSG supplier section. CFSGBasicProperties is a consumer even though its link appears in the scope section. There are no `*Needs:*` lines to audit; their absence is R05. The required mechanical dependency check produced exactly:

```text
depcheck: 162 roadmaps, 1169 edges, 0 problem(s)
```

No `UPWARD`, `CYCLE` or `moved:` line appeared. The citation resolver found no missing cross-roadmap references. Its earlier `Hex.PermGroup.Kernel.card_closure` lead was resolved against the legal external source as described above; library existence was checked directly at the pins rather than inferred from the resolver.

## Not verifiable

- The worker's particular random sample cannot be reproduced: no fifteen target identifiers or seed were supplied, only “none found by heading”. The explicit coverage above is an exhaustive check of the ten order rows plus five identified additional targets, not a claim to have recovered that sample.
- For nine O2 presentation-to-model maps, I did not reconstruct explicit positive generator dictionaries and all native relator evaluations. Their trivial-map/generation negative controls and the universal-property route were checked; M24 received the full seven-relator positive test. These nine existence results are not certified by this review's numerical order computations.
- The claimed Hex release compatibility, complete axiom audit, default-heartbeat performance, and linear elaboration-time assertion are uncertified. The provided URL redirects to `hex-perm-group-theory`; its current source was readable, but the roadmap chooses no revision and Hex is not pinned here. I inspected its README, root module, kernel bridge and releases page, and did not install or run it. Current source existence does not establish compatibility with the project's pins or historical performance claims.
- FiniteSimpleGroups' README supports the reported fourteen results, licence and resource discussion. I did not rebuild that external library or independently audit every proof/axiom. Nor does its statement of an order identify its carriers with these ATLAS carriers; the roadmap correctly leaves those comparisons to the consumer.
- The claim that all named files ship under the same names in GAP AtlasRep was not independently checked against a selected AtlasRep release. The original ATLAS files themselves were fetched successfully.

These limitations do not account for the two blocking findings: R01 is refuted directly and R02 was tested by successful native Lean elaboration. No report or source manifest in the PR was edited, and no source-access request remains pending.

## Source issues

- none
