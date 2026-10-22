<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/123#issuecomment-6334164279 -->
Review (codex) of 0ac1ec8

Verdict: needs_changes

1. **F01** (P1) Every target and supplier contract redirects to an absent owner

   **Location:** `packages/AnalyticNumberTheory/README.md:8`: “statements, hypotheses, APIs, Checks and source locators live there.” Representative target: §0.4, lines 122–124. Representative supplier: ArithmeticDirichletSeries, lines 20–22.

   **Claim:** The two named parts provide the mathematical specification, prerequisites and conventions for this package.

   **Witness:** Neither `packages/AnalyticNumberTheoryPartI/README.md` nor `packages/AnalyticNumberTheoryPartII/README.md` exists. Every one of the README's 518 links resolves to one of those missing files; all 490 target entries and all 18 supplier subsections redirect there.

   **Exact repair:** Recover and submit the already-authored substantive owning artifacts, including their statements, hypotheses, APIs, discriminating Checks and exact supplier contracts. If the recorded split is authoritative, make Part I and Part II the substantive package review units and keep this file only as navigation; do not recreate their work under a second owner. If this job was given the wrong snapshot, replace that snapshot with the intended authored package before rerunning review. Each reviewed target must have an accessible owner and exact prerequisites; each layer must supply its examples and dependencies. A merge-order entry alone does not supply a theorem. These missing artifact references are not declared supplier gaps.

   This is one submission/ownership finding, not 490 separate mathematical objections. There are zero `*Needs:*` lines, zero `**Checks.**` lists, zero layer `### Examples` sections and zero layer `### Dependencies` sections. The generality, exceptional cases, conventions and mathematical completeness cannot be reconstructed from headings. The opening also lacks the required Summary paragraph and describes the history of links; restore the required prose shape in the substantive artifacts, without inventing a new plan.

2. **F02** (P2) Suggested.lean supplies no representative signatures

   **Location:** `packages/AnalyticNumberTheory/Suggested.lean:6`: “The roadmap's representative signatures are in the complete packages”. Lines 7–8 name the absent Part I/II files; lines 12–14 contain only an empty namespace.

   **Claim:** Representative signatures for Layers 0–6 are delivered by the package.

   **Witness:** Removing the module comment leaves exactly `import Mathlib`, the namespace opening and its closing. There are zero definitions, theorems and examples. Both referenced `Suggested.lean` files are absent from the submitted package tree.

   **Exact repair:** Supply the authored representative signature files with the substantive owners identified in R01. Retain their easy headlines on pinned carriers, real-bodied light definitions, and proved discriminating examples; make the Lean names agree with the restored README. Keep heavy constructions as README targets. Use the prescribed representative-signatures module docstring and layer comments. Do not replace the absent signatures with unrelated library tests or weak stand-ins.

   This omission cannot be justified by an absence of all suitable carriers: for example, the xi topic in §0.14 has complex functions and `completedRiemannZeta₀` available at the pin (`.lake/packages/mathlib/Mathlib/NumberTheory/LSeries/RiemannZeta.lean:63`). The exact intended xi definition and normalization still need to come from the author's specification. Successful elaboration of an empty namespace does not check any roadmap statement.

3. **F03** (P3) References and the source manifest are missing

   **Location:** `packages/AnalyticNumberTheory/README.md:2570`: “The full references and theorem/section/page locators are in the two package READMEs.” `packages/AnalyticNumberTheory/sources.toml` is absent.

   **Claim:** The cited works and locators are available for source verification.

   **Witness:** Every seeded target has only a title and a link to a missing README. No sampled target supplies an author, work, theorem/section number and page. There is no source manifest to resolve editions, cache entries or settled citation statuses.

   **Exact repair:** Supply the original bibliography and precise claim-level locators with the substantive artifacts. Record each identified work once in the appropriate `tauceti-roadmap-sources/v1` manifest through the sources service, preserving its established key and any settled status. Include the version/numbering comparison where a preprint is used. Rerun all 15 seeded checks and any author-flagged unverified locators against those texts. Do not guess a source or edition from a theorem heading.

Reviewed the submitted artifacts, without changing their contents. This is an incomplete package submission: the README is a navigation index, its two stated owners are absent from the supplied package tree, and the Lean file contains no declarations. This verdict does not assert that the absent mathematics is false or that an existing roadmap has been replanned. Recovering the authored artifacts and correcting the submission is necessary before a mathematical acceptance is possible. No previous review or repair report was supplied, and no declared supplier gap was found.

## Verified sound

The following are verified structural observations, not mathematical certification of the missing targets.

- Read all three present submitted files: 2,570 README lines, 14 Lean lines and the one-line TOML metadata. Confirmed the fourth requested file, `sources.toml`, is absent. The metadata parses as `topic = "math.NT"`.
- Inventoried all 490 target entries: 233 numbered headline sections and 257 lettered subordinate links. Checked all 518 Markdown links and all 18 supplier subsections. There are seven layer headings. Every headline section consists of its title and a redirect; subordinate entries are link labels.
- Inspected all 15 seeded locations. Verified source passages: **0/15**, because no sampled statement or locator is available. Author-flagged unverified locators found: **0**. This is not evidence that the missing parts contain no such flags.
- Lean has exactly one `import Mathlib`, the expected namespace, no `set_option`, no sorry'd data, no admitted examples, no `lemma` declaration and no forbidden command. There are no declarations or standing variable blocks whose hypotheses can disappear. No Tau Ceti module import required a targeted build.
- Ran the required `lake env lean` command on the submitted `Suggested.lean` from the content checkout. It exited **0**, with **empty output and no warnings**, including no `sorry` warnings. Mathematical declarations elaborated: **0**. No Lean process was left running.
- Verified that both installed library revisions match `lake-manifest.json`: Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`; Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.
- Read shape and ownership examples from main: `Completed/ArithmeticDirichletSeries/README.md`, `TauCetiRoadmap/Chebotarev/README.md` and `TauCetiRoadmap/ComplexTori/README.md`. Inspected the main tree directly, rather than treating the detached working checkout as main. No AnalyticNumberTheory or Part I/II folder was found on main.
- No executable computational algorithm, route restriction or source passage was found in the submitted bodies. The absent definitions prevent a substantive generality or plagiarism certification. No suspicious instruction in the submitted text was acted upon.
- Only the requested review outputs and scratch work were written. No roadmap content, merge order, library source, manifest entry, issue or pull request was changed.

### Dependency-check result and supplier audit

The prescribed dependency command was run against this README, with name `AnalyticNumberTheory` and `merge-order/ORDER.txt`. Exact output:

```text
NOT IN ORDER: AnalyticNumberTheory (insert it after its last supplier)
depcheck: 8 roadmaps, 55 edges, 1 problem(s)
```

Exit status: **1**. There was **no UPWARD or CYCLE line**. The NOT IN ORDER message is not a finding under the brief, and the order file was not edited. The order already lists Part I followed by Part II. A check of an index with no `*Needs:*` lines cannot certify the missing theorem-level graph. No ownership move was made or proposed on the basis of an inferred upward edge.

Every supplier subsection was read. In each row below the cited part's contract is absent, so section existence, consumed hypotheses and supplier drift inside that contract cannot be checked. None is treated as a declared gap.

| README line | Supplier subsection | Destination supplied in the index | Result |
|---:|---|---|---|
| 20 | From ArithmeticDirichletSeries | Part I | Missing contract; R01 |
| 24 | From LFunctions and ZerosOfLFunctions | Part I | Missing contract; R01 |
| 28 | From GlobalNumberFields | Part I | Missing contract; R01 |
| 32 | From AutomorphicLFunctionsAndLocalFactors | Part I | Missing contract; R01 |
| 36 | From NumberFieldArithmetic | Part I | Missing contract; R01 |
| 40 | From ClassFieldTheory | Part I | Missing contract; R01 |
| 44 | From RepresentationTheory | Part I | Missing contract; R01 |
| 48 | From AutomorphicSpectralTheory | Part I | Missing contract; R01 |
| 52 | From DifferentialGeometry and PseudodifferentialOperators | Part I and Part II | Missing contract; R01 |
| 56 | Further input from AutomorphicSpectralTheory | Part II | Missing contract; R01 |
| 60 | From GeometryOfNumbersAndQuadraticArithmetic | Part I | Missing contract; R01 |
| 64 | From UniversalCovers | Part II | Missing contract; R01 |
| 68 | From tauceti | Part I | Missing contract; R01 |
| 72 | From AdelicAlgebraicGroups | Part II | Missing contract; R01 |
| 76 | From OperatorAlgebraDynamics | Part II | Missing contract; R01 |
| 80 | From AmenableGroups and VonNeumannAlgebras | Part II | Missing contract; R01 |
| 84 | From ArithmeticLocallySymmetricSpaces | Part II | Missing contract; R01 |
| 88 | From Chebotarev | Part I | Missing contract; R01 |

### Duplication audit by object

Object searches and direct reads found the following existing interfaces. They are constraints on any recovered specification, not assertions that a missing target duplicates them. Without the missing definitions and hypotheses, no exact mathematical equivalence or distinct variant can be certified.

| Object searched | Existing evidence read | Consequence for this review |
|---|---|---|
| Completed Riemann zeta and pole removal | `.lake/packages/mathlib/Mathlib/NumberTheory/LSeries/RiemannZeta.lean:63`, `:83`, `:89`, `:99`: `completedRiemannZeta₀`, `completedRiemannZeta_eq`, `differentiable_completedZeta₀`, `completedRiemannZeta₀_one_sub` | §0.14 must specify its own xi normalization and consume these interfaces; its absent formula cannot be compared. |
| Riemann hypothesis | Same file, line 184: `RiemannHypothesis` | §1.6 must cite the existing predicate; the title alone does not establish a duplicate definition. |
| Chebyshev sums and small-cutoff behavior | `.lake/packages/mathlib/Mathlib/NumberTheory/Chebyshev.lean:70`, `:77`, `:129`, `:132`, `:156`, `:159`: `Chebyshev.psi`, `Chebyshev.theta`, and their zero/one values | Missing residue-class and margin definitions cannot be tested against the existing sums. |
| Continued Dirichlet L-functions | `.lake/packages/mathlib/Mathlib/NumberTheory/LSeries/DirichletContinuation.lean:50`, `:60`, `:74`: the nonzero-modulus context, `DirichletCharacter.LFunction`, `LFunction_eq_LSeries` | §5.22 needs its exact odd/quadratic specialization and deleted factors before novelty or modulus hypotheses can be checked. |
| Divisor-sum bounds | `.lake/packages/TauCeti/TauCeti/NumberTheory/ArithmeticFunction/DivisorBounds.lean:31`, `:47`: `TauCeti.norm_twistedDivisorSum_le`, `TauCeti.sum_divisors_pow_le` | Generic bounds exist; the coefficient systems and constants of Layer 3 are missing. No duplicate is alleged from a similar title. |
| Ideal coefficients, Euler products, Perron and PNT transfer | Main `Completed/ArithmeticDirichletSeries/README.md:90`, `:92`, `:96`, `:102`, `:106`: `IdealArithmeticFunction`, `normCoeff`, `EulerProductData`, `truncatedPerronKernel`, `primeNumberTheoremTransfer` | Ownership is explicit on main, but the submitted supplier subsection names none of the consumed declarations. R01 must recover the boundary. |
| Chebotarev versus effective estimates | Main `TauCetiRoadmap/Chebotarev/README.md:45` and `:61` separates its density/counting ownership from effective bounds | The title of §2.50 is insufficient to decide whether its effective statement is a new variant. |

The board package tree and main were searched for the owning Part I/II artifacts and the seeded headings; no substantive replacement was found. Locally identifiable permitted heads for ArithmeticDynamics, CohomologyComparisonsPartII, ErdosProgressionPowers and K3SurfacesAndSymplecticBoundedness were also checked for the missing owner paths. Board copies of ArithmeticDynamics, ErdosProgressionPowers and QWittVectors were included in the location search. These are location checks, not full object-equivalence reviews of those projects. Full duplication clearance against all seven specified open heads remains unverified; the input package contains no definitions against which to perform it. No unauthorized Part I/II branch was substituted for the submitted package.

### Shape and defect-class coverage

| Required defect class | Inspection result |
|---|---|
| Finiteness, flatness, smoothness and other hypotheses | No full target hypotheses supplied; cannot test. |
| False equivalences and identifications | Link labels do not define the objects or maps; cannot test. |
| Degenerate cases | No supplied functions/carriers to instantiate; see the per-entry table. |
| Signs, normalizations and two-term witnesses | Conventions only refer to missing parts; no computed Checks or Lean examples. |
| Unowned prerequisites | Missing claimed owner contracts: R01. No declared gap exemption applies. |
| Supplier drift and duplicate ownership | Missing destinations established; deeper contracts unavailable. |
| Cross-roadmap convention agreement | Frobenius, conductor, continuation and zero-mode choices are unspecified. |
| Checks | Zero Check lists and zero examples; included in R01/R02. |
| Lean signatures and binder scope | Zero signatures; R02. No statement exists for a `#check @name` inspection. |
| Source locators | All 15 sampled locators unavailable; R03. |
| Build order | Mechanical output recorded; no theorem-level prerequisite graph supplied. |
| Policy and form | Single import and no prohibited Lean constructs verified. Missing Summary/layer content and historical routing prose are included in R01. |
| Prose overclaims and promised interfaces | The claim that complete parts are delivered fails at their file paths; R01. Mathematical overclaims cannot be assessed from headings. |
| Upward dependencies | No UPWARD/CYCLE output; not a certification of missing contracts. |

## Not verifiable

### Seeded source sample

For each item below, both the statement and the source locator are missing. The referenced owner README is absent. Consequently the theorem number, page, hypotheses and support for the author's formulation were **not verified**. This is missing submission content, not a paywall, OCR failure or inability to access a known legal edition.

| Target | Location in `packages/AnalyticNumberTheory/README.md` | Missing destination anchor | Source result |
|---|---:|---|---|
| 0.4 Prime powers do not erase the character-sum margin | Heading 122; link 124 | Part I `s0-4` | Not verifiable; no statement or locator |
| 0.14 Pole-cancelled Riemann xi | Heading 182; link 184 | Part I `s0-14` | Not verifiable; no statement or locator |
| 2.3 Hecke series and Tate integral comparison | Heading 416; link 418 | Part I `s2-3` | Not verifiable; no statement or locator |
| 2.21 Canonical ray-character comparison and the quadratic endpoint | Heading 540; link 542 | Part I `s2-21` | Not verifiable; no statement or locator |
| 2.28 Imaginary quadratic class-number value at zero | Heading 606; link 608 | Part I `s2-28` | Not verifiable; no statement or locator |
| 2.47 Uniform subpolynomial Dedekind residues | Heading 776; link 778 | Part I `s2-47` | Not verifiable; no statement or locator |
| 3.19 Logarithmic-derivative coefficient class | Heading 970; link 972 | Part I `s3-19` | Not verifiable; no statement or locator |
| 3.39 Von Mangoldt truncation error | Heading 1126; link 1128 | Part I `s3-39` | Not verifiable; no statement or locator |
| 4.11 Lerch boundary degeneration | Heading 1306; link 1308 | Part II `s4-11` | Not verifiable; no statement or locator |
| 5.15 Quadratic reciprocity matrix | Heading 1498; link 1500 | Part II `s5-15` | Not verifiable; no statement or locator |
| 5.19 The binary-cubic archimedean functional-equation matrix | Heading 1526; link 1528 | Part II `s5-19` | Not verifiable; no statement or locator |
| 5.22 Continued odd quadratic L-function | Heading 1632; link 1634 | Part II `s5-22` | Not verifiable; no statement or locator |
| 5.26 Quadratic reflection matrix | Heading 1660; link 1662 | Part II `s5-26` | Not verifiable; no statement or locator |
| 6.13 Entire shifted determinant | Heading 1972; link 1974 | Part II `s6-13` | Not verifiable; no statement or locator |
| 6.42 The critical KMS factors have type III₁ | Heading 2436; link 2438 | Part II `s6-42` | Not verifiable; no statement or locator |

No bibliography or manifest identifies the works, editions or legal source URLs behind these targets. Author names and isolated theorem labels elsewhere in the index do not identify the missing references reliably. No source was fetched, no manifest was created or rewritten, and no fictitious work was entered into a missing-reference request. The prerequisite is recovery of the authored bibliography; requesting an unspecified book would not resolve this failure. There are no known waived or uncertified entries to reopen.

### Adversarial pass: conventions and all target entries

The table inventories every numbered target, including the lettered subordinate targets. **No mathematical instance is claimed to have been evaluated.** A heading and a missing link supply neither an exact proposition nor definitions of its symbols. For example, the relations in the labels of §6.21a–n cannot be tested even at `n = 1, 2` without the definitions of the generators and the algebra. Reconstructing a familiar theorem from its title would review the reviewer's theorem rather than the author's.

The required probes therefore remain pending: modulus/conductor `1` and primes `2, 3`; xi endpoints `0, 1`; trivial ray characters and ramified factors; quadratic fields with extra units; bounded versus varying degrees; zero coefficients and truncation endpoints; Lerch boundary points and branches; mod-eight matrix ordering and signs; spectral zero modes and multiplicities; KMS boundary temperatures and normalization. No positive or negative result is inferred from a missing statement.

In the Change column, R01 means recover the actual authored specification and then test it; no mathematical edit was applied during review. The repeated unavailable result is an explicit coverage record, not a soundness pass.

| Statement or convention | Instances tried | Result | Change |
|---|---|---|---|
| Conventions, README line 16: continued germs versus totalized series | None; objects and comparison absent | Cannot test continuation at divergent inputs | R01 |
| Conventions, README line 16: arithmetic Frobenius versus inverse | None; map/convention not chosen here | Cannot compute a normalization witness | R01 |
| Conventions, README line 16: conductors versus moduli | None; character carrier absent | Cannot test modulus 1 or imprimitive input | R01 |
| Conventions, README line 16: zero modes versus positive spectra | None; spectrum and determinant absent | Cannot test empty/zero spectrum | R01 |
| §0.1 Exceptional real zero (README 104) | None; specification absent | Unverifiable | R01 |
| §0.2 Chebyshev sum in a residue class (README 110) | None; specification absent | Unverifiable | R01 |
| §0.3 Schoenfeld explicit Chebyshev bound (README 116) | None; specification absent | Unverifiable | R01 |
| §0.4 Prime powers do not erase the character-sum margin (README 122) | None; specification absent | Unverifiable | R01 |
| §0.5 Rosser–Schoenfeld explicit prime-count bounds (README 128) | None; specification absent | Unverifiable | R01 |
| §0.6 Bounded-height Landau–Page theorem (README 134) | None; specification absent | Unverifiable | R01 |
| §0.7 Quadratic real-zero separation from one (README 140) | None; specification absent | Unverifiable | R01 |
| §0.8 Weighted-prime sum input to the factorial estimate (README 146) | None; specification absent | Unverifiable | R01 |
| §0.9 Siegel's theorem (README 152) | None; specification absent | Unverifiable | R01 |
| §0.10 Prime-number input (README 158) | None; specification absent | Unverifiable | R01 |
| §0.11 Mertens's first theorem and Σ_{p \| N} log p/p = O(log log N) (README 164) | None; specification absent | Unverifiable | R01 |
| §0.12 Effective distance of a quadratic real zero from one (README 170) | None; specification absent | Unverifiable | R01 |
| §0.13 Exceptional quadratic squareclasses (README 176) | None; specification absent | Unverifiable | R01 |
| §0.14 Pole-cancelled Riemann xi (README 182) | None; specification absent | Unverifiable | R01 |
| §0.15 Elementary canonical factors of every genus (README 188) | None; specification absent | Unverifiable | R01 |
| §0.16 Mod-eight prime mass (README 194) | None; specification absent | Unverifiable | R01 |
| §0.17 Two-real-zero inequality (README 200) | None; specification absent | Unverifiable | R01 |
| §0.18 Effective character prime-number estimate (README 206) | None; specification absent | Unverifiable | R01 |
| §0.19 Explicit reciprocal-prime estimate (README 212) | None; specification absent | Unverifiable | R01 |
| §0.20 Weighted prime sum on an interval (README 218) | None; specification absent | Unverifiable | R01 |
| §0.21 Mertens's second theorem: the reciprocal-prime sum (README 224) | None; specification absent | Unverifiable | R01 |
| §0.22 Origin-zero adapter for Hadamard factorization (README 230) | None; specification absent | Unverifiable | R01 |
| §0.23 Finite-order Hadamard factorization (README 236) | None; specification absent | Unverifiable | R01 |
| §0.23a Higher derivatives of the Gamma remainder (README 242) | None; specification absent | Unverifiable | R01 |
| §0.24 Repulsion of exceptional conductors (README 246) | None; specification absent | Unverifiable | R01 |
| §0.25 Explicit prime Euler-product bound (README 252) | None; specification absent | Unverifiable | R01 |
| §0.26 Mertens's third theorem: the Euler product (README 258) | None; specification absent | Unverifiable | R01 |
| §0.27 Landau repulsion for exceptional squareclasses (README 264) | None; specification absent | Unverifiable | R01 |
| §0.28 Quadratic prime-character interval estimate (README 270) | None; specification absent | Unverifiable | R01 |
| §0.29 Strict derivative positivity requires nonpolynomiality (README 276) | None; specification absent | Unverifiable | R01 |
| §0.29a Pairing imaginary zeros (README 282) | None; specification absent | Unverifiable | R01 |
| §0.29b Nonnegative coefficients of the paired product (README 286) | None; specification absent | Unverifiable | R01 |
| §0.30 Rational Dirichlet-to-ray-class dictionary (README 290) | None; specification absent | Unverifiable | R01 |
| §0.30a Conductor-uniform rational logarithmic-derivative adapter (README 296) | None; specification absent | Unverifiable | R01 |
| §0.31 Mertens product input (README 300) | None; specification absent | Unverifiable | R01 |
| §0.31a Near-one Dirichlet derivative bounds (README 306) | None; specification absent | Unverifiable | R01 |
| §0.31b Quadratic zero separation from an L-value (README 310) | None; specification absent | Unverifiable | R01 |
| §0.32 Siegel–Walfisz theorem (README 314) | None; specification absent | Unverifiable | R01 |
| §0.33 Zero-free zeta strip and logarithmic bounds (README 320) | None; specification absent | Unverifiable | R01 |
| §1.1 Reciprocal zeta on the line one (README 332) | None; specification absent | Unverifiable | R01 |
| §1.2 Davenport uniform Möbius exponential cancellation (README 338) | None; specification absent | Unverifiable | R01 |
| §1.2a Uniform Möbius major/minor arcs (README 344) | None; specification absent | Unverifiable | R01 |
| §1.3 Admissible Weil test function (README 348) | None; specification absent | Unverifiable | R01 |
| §1.4 Half-interval explicit formula and low-zero-safe bound (README 354) | None; specification absent | Unverifiable | R01 |
| §1.4a Primitive-character subtracted Perron contour (README 360) | None; specification absent | Unverifiable | R01 |
| §1.4b Bounded right-edge logarithmic derivative (README 364) | None; specification absent | Unverifiable | R01 |
| §1.4c Low-zero-safe interval kernel (README 368) | None; specification absent | Unverifiable | R01 |
| §1.4d Logarithmic-square sum of zero weights (README 372) | None; specification absent | Unverifiable | R01 |
| §1.5 Mean square of a Dirichlet polynomial (README 376) | None; specification absent | Unverifiable | R01 |
| §1.5a Weighted finite Hilbert inequality (README 382) | None; specification absent | Unverifiable | R01 |
| §1.6 Riemann and generalized Riemann hypotheses as statements (README 386) | None; specification absent | Unverifiable | R01 |
| §1.7 Selberg zero-density input (README 392) | None; specification absent | Unverifiable | R01 |
| §1.8 Weil's explicit formula (Mestre's formalism) (README 398) | None; specification absent | Unverifiable | R01 |
| §1.9 Prime error terms under RH and GRH (README 404) | None; specification absent | Unverifiable | R01 |
| §2.3 Hecke series and Tate integral comparison (README 416) | None; specification absent | Unverifiable | R01 |
| §2.4 Hecke boundary adapter for Landau positivity (README 422) | None; specification absent | Unverifiable | R01 |
| §2.5 Dedekind continuation and real-side comparison (README 428) | None; specification absent | Unverifiable | R01 |
| §2.6 Sufficient conductor-discriminant estimate (README 434) | None; specification absent | Unverifiable | R01 |
| §2.7 Quadratic zeta factorization and the residue quotient (README 440) | None; specification absent | Unverifiable | R01 |
| §2.8 Partial ideal zeta series (README 446) | None; specification absent | Unverifiable | R01 |
| §2.9 Lemma 4.4 (Zaman's effective lower bound for prime ideals) (README 452) | None; specification absent | Unverifiable | R01 |
| §2.9a The exact 35/19 prime-ideal adapter (README 458) | None; specification absent | Unverifiable | R01 |
| §2.10 Imaginary quadratic genus-character classification (README 462) | None; specification absent | Unverifiable | R01 |
| §2.11 Artin local polynomial (README 468) | None; specification absent | Unverifiable | R01 |
| §2.12 Primitive Hecke functional-equation normalization (README 474) | None; specification absent | Unverifiable | R01 |
| §2.13 Ideal-character Hecke L-function (README 480) | None; specification absent | Unverifiable | R01 |
| §2.14 Siegel lower bound for real quadratic class number times regulator (README 486) | None; specification absent | Unverifiable | R01 |
| §2.15 Siegel lower bound for imaginary quadratic class numbers (README 492) | None; specification absent | Unverifiable | R01 |
| §2.16 Explicit residue bound for Dedekind zeta functions (Louboutin) (README 498) | None; specification absent | Unverifiable | R01 |
| §2.16a Positive Mellin comparison with the sharp residue constant (README 504) | None; specification absent | Unverifiable | R01 |
| §2.17 Imaginary quadratic completion and root number (README 508) | None; specification absent | Unverifiable | R01 |
| §2.17a Dedekind completed-functional-equation comparison (README 514) | None; specification absent | Unverifiable | R01 |
| §2.18 Imaginary quadratic class-number value at one (README 518) | None; specification absent | Unverifiable | R01 |
| §2.18a Quadratic Hecke value as residue quotient (README 524) | None; specification absent | Unverifiable | R01 |
| §2.19 Artin Euler series (README 528) | None; specification absent | Unverifiable | R01 |
| §2.20 Negative even zeros of the continuation (README 534) | None; specification absent | Unverifiable | R01 |
| §2.21 Canonical ray-character comparison and the quadratic endpoint (README 540) | None; specification absent | Unverifiable | R01 |
| §2.21a Ray-class product has no boundary zeros (README 546) | None; specification absent | Unverifiable | R01 |
| §2.21b Nonnegative ray-character logarithmic coefficients (README 550) | None; specification absent | Unverifiable | R01 |
| §2.21c Nonreal Hecke characters are nonzero at one (README 554) | None; specification absent | Unverifiable | R01 |
| §2.21d Positive quadratic auxiliary Euler factors (README 558) | None; specification absent | Unverifiable | R01 |
| §2.21e Auxiliary holomorphy under vanishing at one (README 562) | None; specification absent | Unverifiable | R01 |
| §2.21f Landau contradiction for a quadratic character (README 566) | None; specification absent | Unverifiable | R01 |
| §2.22 Explicit degree-uniform Hecke convexity (README 570) | None; specification absent | Unverifiable | R01 |
| §2.23 Logarithmic functional equation at zero and one (README 576) | None; specification absent | Unverifiable | R01 |
| §2.24 Hecke CM partial-zeta identity (README 582) | None; specification absent | Unverifiable | R01 |
| §2.25 Hecke positive-sign real quadratic formula (README 588) | None; specification absent | Unverifiable | R01 |
| §2.26 Genus Hecke factorization (README 594) | None; specification absent | Unverifiable | R01 |
| §2.27 Hecke negative-sign real quadratic formula (README 600) | None; specification absent | Unverifiable | R01 |
| §2.28 Imaginary quadratic class-number value at zero (README 606) | None; specification absent | Unverifiable | R01 |
| §2.29 Global meromorphic Artin continuation (README 612) | None; specification absent | Unverifiable | R01 |
| §2.29a Absolute convergence of Artin factors (README 618) | None; specification absent | Unverifiable | R01 |
| §2.29b Induction identity including ramification (README 622) | None; specification absent | Unverifiable | R01 |
| §2.29c Linear Artin factors are Hecke factors (README 626) | None; specification absent | Unverifiable | R01 |
| §2.29d Uniform finite Artin factor bound (README 630) | None; specification absent | Unverifiable | R01 |
| §2.29e Ramified local Artin induction identity (README 634) | None; specification absent | Unverifiable | R01 |
| §2.30 Imprimitive Hecke deleted factors (README 638) | None; specification absent | Unverifiable | R01 |
| §2.31 Sign of the quadratic Gauss sum from the Dedekind functional equation (README 644) | None; specification absent | Unverifiable | R01 |
| §2.32 Artin continuation near the line one (README 650) | None; specification absent | Unverifiable | R01 |
| §2.32a Gluing m-th roots across the line Re s = 1 (README 656) | None; specification absent | Unverifiable | R01 |
| §2.32b Direct sums of Artin local factors (README 660) | None; specification absent | Unverifiable | R01 |
| §2.32c Analytic root on a nonvanishing disc (README 664) | None; specification absent | Unverifiable | R01 |
| §2.32d Overlaps of boundary-centred discs (README 668) | None; specification absent | Unverifiable | R01 |
| §2.32e Normal-closure discriminants and conductor budgets (README 672) | None; specification absent | Unverifiable | R01 |
| §2.32f Fixed-degree residue lower bound, including nonnormal fields (README 676) | None; specification absent | Unverifiable | R01 |
| §2.32g Uniform regularized finite-order Hecke endpoints (README 680) | None; specification absent | Unverifiable | R01 |
| §2.33 Bounded-degree Brauer-Siegel (README 684) | None; specification absent | Unverifiable | R01 |
| §2.34 Two-sided subpolynomial values at one (README 690) | None; specification absent | Unverifiable | R01 |
| §2.35 A fixed small circle gives a subpolynomial derivative (README 696) | None; specification absent | Unverifiable | R01 |
| §2.36 Theorem3 negative factors (README 702) | None; specification absent | Unverifiable | R01 |
| §2.37 Theorem3 positive factors (README 708) | None; specification absent | Unverifiable | R01 |
| §2.38 Theorem3 CM factors (README 714) | None; specification absent | Unverifiable | R01 |
| §2.39 Ray-class L-function zero-density estimate (README 720) | None; specification absent | Unverifiable | R01 |
| §2.40 Heilbronn's theorem on real zeros of Dedekind zeta functions (README 726) | None; specification absent | Unverifiable | R01 |
| §2.40a Positive cyclic decomposition of the augmentation character (README 732) | None; specification absent | Unverifiable | R01 |
| §2.40b Aramata entire quotient (README 736) | None; specification absent | Unverifiable | R01 |
| §2.41 Eisenstein series at a CM point equals a partial zeta function (README 740) | None; specification absent | Unverifiable | R01 |
| §2.42 Artin holomorphy as a hypothesis (README 746) | None; specification absent | Unverifiable | R01 |
| §2.43 Extended Riemann hypothesis for Dedekind and Hecke L-functions (README 752) | None; specification absent | Unverifiable | R01 |
| §2.44 Explicit exceptional-zero region for an abelian character product (README 758) | None; specification absent | Unverifiable | R01 |
| §2.45 Logarithmic functional equation (README 764) | None; specification absent | Unverifiable | R01 |
| §2.46 Factorwise logarithmic derivative at one (README 770) | None; specification absent | Unverifiable | R01 |
| §2.47 Uniform subpolynomial Dedekind residues (README 776) | None; specification absent | Unverifiable | R01 |
| §2.48 Eisenstein Weyl sums bounded by Dirichlet L-values (README 782) | None; specification absent | Unverifiable | R01 |
| §2.49 Many split primes outside a small quadratic exception set (README 788) | None; specification absent | Unverifiable | R01 |
| §2.50 Effective Chebotarev density theorem (README 794) | None; specification absent | Unverifiable | R01 |
| §2.51 Two-sided quadratic Hecke value bound (README 800) | None; specification absent | Unverifiable | R01 |
| §2.52 Subpolynomial logarithmic derivative at one (README 806) | None; specification absent | Unverifiable | R01 |
| §3.1 Explicit divisor subpower bound (README 818) | None; specification absent | Unverifiable | R01 |
| §3.1a Uniform prime-power divisor bound (README 824) | None; specification absent | Unverifiable | R01 |
| §3.1b Large-prime divisor factor bound (README 828) | None; specification absent | Unverifiable | R01 |
| §3.1c Divisor bounds from local factors (README 832) | None; specification absent | Unverifiable | R01 |
| §3.2 Largest prime factor of a quadratic conductor (README 836) | None; specification absent | Unverifiable | R01 |
| §3.3 Uniform coefficient bound by a divisor function (README 842) | None; specification absent | Unverifiable | R01 |
| §3.4 Subpolynomial fixed-order divisor function (README 848) | None; specification absent | Unverifiable | R01 |
| §3.5 Products of distinct medium primes (README 854) | None; specification absent | Unverifiable | R01 |
| §3.6 Inverse-totient counting input (README 860) | None; specification absent | Unverifiable | R01 |
| §3.7 Maximal-order divisor upper bound (README 866) | None; specification absent | Unverifiable | R01 |
| §3.7a Small-prime divisor logarithm (README 872) | None; specification absent | Unverifiable | R01 |
| §3.7b Large-prime divisor logarithm (README 876) | None; specification absent | Unverifiable | R01 |
| §3.7c Vanishing small-prime contribution (README 880) | None; specification absent | Unverifiable | R01 |
| §3.8 Even von Mangoldt function (README 884) | None; specification absent | Unverifiable | R01 |
| §3.9 Coprime Möbius sums weighted by log t/t (README 890) | None; specification absent | Unverifiable | R01 |
| §3.10 Gamma Euler-product truncation (README 896) | None; specification absent | Unverifiable | R01 |
| §3.11 Size of 1/φ(n) and of the divisor function (3.7) (README 902) | None; specification absent | Unverifiable | R01 |
| §3.12 Coprime Möbius sums weighted by 1/t (README 908) | None; specification absent | Unverifiable | R01 |
| §3.12a Compact-parameter multiplicative transfer (README 914) | None; specification absent | Unverifiable | R01 |
| §3.12b Eisenstein norm criterion (README 918) | None; specification absent | Unverifiable | R01 |
| §3.13 Landau–Ramanujan count of sums of two squares (README 922) | None; specification absent | Unverifiable | R01 |
| §3.14 Landau upper bound for shifted Eisenstein norms (README 928) | None; specification absent | Unverifiable | R01 |
| §3.15 Elementary shifted-square count (README 934) | None; specification absent | Unverifiable | R01 |
| §3.16 Counts supported on half the reduced prime classes (README 940) | None; specification absent | Unverifiable | R01 |
| §3.17 Logarithmic weight of prime divisors (README 946) | None; specification absent | Unverifiable | R01 |
| §3.18 Pretentious distance (README 952) | None; specification absent | Unverifiable | R01 |
| §3.18a Triangle inequality for pretentious products (README 958) | None; specification absent | Unverifiable | R01 |
| §3.18b Squared pretentious-distance formula (README 962) | None; specification absent | Unverifiable | R01 |
| §3.18c Unit-disc product distance inequality (README 966) | None; specification absent | Unverifiable | R01 |
| §3.19 Logarithmic-derivative coefficient class (README 970) | None; specification absent | Unverifiable | R01 |
| §3.20 Smooth-number counting function (README 976) | None; specification absent | Unverifiable | R01 |
| §3.21 Dickman function (README 982) | None; specification absent | Unverifiable | R01 |
| §3.22 Dirichlet divisor average (README 988) | None; specification absent | Unverifiable | R01 |
| §3.22a Harmonic sum remainder (README 994) | None; specification absent | Unverifiable | R01 |
| §3.22b Divisor hyperbola identity (README 998) | None; specification absent | Unverifiable | R01 |
| §3.23 Second moment of zeta (README 1002) | None; specification absent | Unverifiable | R01 |
| §3.24 Fourth moment of zeta (README 1008) | None; specification absent | Unverifiable | R01 |
| §3.25 Beurling prime system (README 1014) | None; specification absent | Unverifiable | R01 |
| §3.26 Uniform divisor subpower bound (README 1020) | None; specification absent | Unverifiable | R01 |
| §3.27 Uniform bounded-norm ideal count (README 1026) | None; specification absent | Unverifiable | R01 |
| §3.28 Cardinality of medium-prime products (README 1032) | None; specification absent | Unverifiable | R01 |
| §3.28a Distinct-product cardinality (README 1038) | None; specification absent | Unverifiable | R01 |
| §3.29 Truncated von Mangoldt function (README 1042) | None; specification absent | Unverifiable | R01 |
| §3.30 Shifted coprime Möbius sum (README 1048) | None; specification absent | Unverifiable | R01 |
| §3.31 Asymptotic count of the three exceptional families (README 1054) | None; specification absent | Unverifiable | R01 |
| §3.31a Shifted norm intersection sieve (README 1060) | None; specification absent | Unverifiable | R01 |
| §3.32 Restricted squarefree Landau asymptotic (README 1064) | None; specification absent | Unverifiable | R01 |
| §3.33 Pretentious Halász mean bound (README 1070) | None; specification absent | Unverifiable | R01 |
| §3.34 Dickman fixed-u asymptotic (README 1076) | None; specification absent | Unverifiable | R01 |
| §3.34a Largest-prime-factor smooth decomposition (README 1082) | None; specification absent | Unverifiable | R01 |
| §3.35 Rankin smooth-number upper bound (README 1086) | None; specification absent | Unverifiable | R01 |
| §3.35a Finite-prime smooth Dirichlet series (README 1092) | None; specification absent | Unverifiable | R01 |
| §3.36 Zeta function of an indexed Beurling system (README 1096) | None; specification absent | Unverifiable | R01 |
| §3.36a Beurling counting growth from summability (README 1102) | None; specification absent | Unverifiable | R01 |
| §3.36b Rough progression sieve with its remainder (README 1106) | None; specification absent | Unverifiable | R01 |
| §3.37 Shiu bound for the Halász coefficient class (README 1110) | None; specification absent | Unverifiable | R01 |
| §3.38 Eventual unit-constant divisor bound (README 1116) | None; specification absent | Unverifiable | R01 |
| §3.38a Absorption of the divisor-bound constant (README 1122) | None; specification absent | Unverifiable | R01 |
| §3.39 Von Mangoldt truncation error (README 1126) | None; specification absent | Unverifiable | R01 |
| §3.40 Wintner-type mean over prime divisors (README 1132) | None; specification absent | Unverifiable | R01 |
| §3.40a Integrated prime-divisor mean (README 1138) | None; specification absent | Unverifiable | R01 |
| §3.41 Restricted squarefree Sathe–Selberg bounds (README 1142) | None; specification absent | Unverifiable | R01 |
| §3.42 Beurling PNT with all logarithmic remainders (README 1148) | None; specification absent | Unverifiable | R01 |
| §3.42a Smooth Laplace boundary and one-sided remainder (README 1154) | None; specification absent | Unverifiable | R01 |
| §3.42b Beurling zeta and Euler product (README 1158) | None; specification absent | Unverifiable | R01 |
| §3.42c Beurling higher-prime-power correction (README 1162) | None; specification absent | Unverifiable | R01 |
| §3.43 Mangoldt weight in a Fourier window (README 1166) | None; specification absent | Unverifiable | R01 |
| §3.44 Uniform cancellation of the truncation error E_z (Corollary 3.3) (README 1172) | None; specification absent | Unverifiable | R01 |
| §3.44a Two-sided error and the zero term (README 1178) | None; specification absent | Unverifiable | R01 |
| §3.45 Halász integral mean bound (README 1182) | None; specification absent | Unverifiable | R01 |
| §3.45a Prime-weighted Dirichlet-polynomial mean bound (README 1188) | None; specification absent | Unverifiable | R01 |
| §4.1 Lerch transcendent (README 1198) | None; specification absent | Unverifiable | R01 |
| §4.2 Complex-parameter Hurwitz series (README 1204) | None; specification absent | Unverifiable | R01 |
| §4.3 Barnes G-function (README 1210) | None; specification absent | Unverifiable | R01 |
| §4.3a Barnes full-sector remainder (README 1216) | None; specification absent | Unverifiable | R01 |
| §4.4 Lerch differential equation (README 1220) | None; specification absent | Unverifiable | R01 |
| §4.4a Lerch compact convergence (README 1226) | None; specification absent | Unverifiable | R01 |
| §4.4b Lerch lowering relation (README 1230) | None; specification absent | Unverifiable | R01 |
| §4.4c Lerch raising relation (README 1234) | None; specification absent | Unverifiable | R01 |
| §4.5 Lerch continuation on a covering (README 1238) | None; specification absent | Unverifiable | R01 |
| §4.5a Lerch shift identity (README 1244) | None; specification absent | Unverifiable | R01 |
| §4.5b Lerch integral representation (README 1248) | None; specification absent | Unverifiable | R01 |
| §4.5c Complex Gamma–Laplace adapter (README 1252) | None; specification absent | Unverifiable | R01 |
| §4.5d Lerch contour cells and path continuation (README 1256) | None; specification absent | Unverifiable | R01 |
| §4.5e Monodromy around c=−n (README 1260) | None; specification absent | Unverifiable | R01 |
| §4.5f Monodromy around a=n (README 1264) | None; specification absent | Unverifiable | R01 |
| §4.6 Nonpositive Lerch special values (README 1268) | None; specification absent | Unverifiable | R01 |
| §4.6a Lerch at order zero (README 1274) | None; specification absent | Unverifiable | R01 |
| §4.7 Comparison with the circle-valued Hurwitz function (README 1278) | None; specification absent | Unverifiable | R01 |
| §4.8 Periodic zeta and Lerch normalization (README 1284) | None; specification absent | Unverifiable | R01 |
| §4.9 Even Lerch functional relation (README 1290) | None; specification absent | Unverifiable | R01 |
| §4.9a Real Lerch Fourier–Mellin relation (README 1296) | None; specification absent | Unverifiable | R01 |
| §4.10 Odd Lerch functional relation (README 1300) | None; specification absent | Unverifiable | R01 |
| §4.11 Lerch boundary degeneration (README 1306) | None; specification absent | Unverifiable | R01 |
| §4.12 Complex Hurwitz continuation (README 1312) | None; specification absent | Unverifiable | R01 |
| §4.12a Uniform complex Hurwitz continuation by subtraction (README 1318) | None; specification absent | Unverifiable | R01 |
| §4.13 Arithmetic and Barnes factors in the zeta moment conjecture (README 1322) | None; specification absent | Unverifiable | R01 |
| §4.14 Moment model as a conditional comparison (README 1328) | None; specification absent | Unverifiable | R01 |
| §4.15 Dirichlet character Hurwitz specialization (README 1334) | None; specification absent | Unverifiable | R01 |
| §4.16 Hurwitz Bernoulli values (README 1340) | None; specification absent | Unverifiable | R01 |
| §4.17 Lerch solvable-cover descent (README 1346) | None; specification absent | Unverifiable | R01 |
| §4.17a Lerch z-loop monodromy and shifts (README 1352) | None; specification absent | Unverifiable | R01 |
| §5.1 The four real characters modulo eight (README 1362) | None; specification absent | Unverifiable | R01 |
| §5.2 Swap of double-series variables (README 1368) | None; specification absent | Unverifiable | R01 |
| §5.3 Quadratic reflection of double-series variables (README 1374) | None; specification absent | Unverifiable | R01 |
| §5.3a Unbounded-coordinate Schwartz lattice estimate (README 1380) | None; specification absent | Unverifiable | R01 |
| §5.3b Wright GL₂ measure and reduction adapter (README 1384) | None; specification absent | Unverifiable | R01 |
| §5.3c Local orbital distributions and their continuation boundary (README 1388) | None; specification absent | Unverifiable | R01 |
| §5.3d Real binary-cubic Fourier matrix (README 1392) | None; specification absent | Unverifiable | R01 |
| §5.3e Complex binary-cubic Fourier factor (README 1396) | None; specification absent | Unverifiable | R01 |
| §5.4 Binary-cubic action, discriminant and local orbit data (README 1400) | None; specification absent | Unverifiable | R01 |
| §5.5 Cubic algebras and projective forms (README 1406) | None; specification absent | Unverifiable | R01 |
| §5.6 Discriminant fibres and weighted cubic coefficients (README 1412) | None; specification absent | Unverifiable | R01 |
| §5.7 Uniform small-degree field-discriminant count (README 1418) | None; specification absent | Unverifiable | R01 |
| §5.8 Binary-cubic local zeta integrals (README 1424) | None; specification absent | Unverifiable | R01 |
| §5.9 Signature-refined cubic Shintani zeta functions (README 1430) | None; specification absent | Unverifiable | R01 |
| §5.10 Local density and coefficient conventions agree (README 1436) | None; specification absent | Unverifiable | R01 |
| §5.10a Self-dual versus integral-normalized measures (README 1442) | None; specification absent | Unverifiable | R01 |
| §5.10b Binary cubic orbital Jacobian (README 1446) | None; specification absent | Unverifiable | R01 |
| §5.11 The selected adelic binary-cubic zeta integral (README 1450) | None; specification absent | Unverifiable | R01 |
| §5.12 Ordinary cubic continuation data (README 1456) | None; specification absent | Unverifiable | R01 |
| §5.13 Orders in a fixed étale cubic algebra (README 1462) | None; specification absent | Unverifiable | R01 |
| §5.13a Split local factor (README 1468) | None; specification absent | Unverifiable | R01 |
| §5.13b Unramified quadratic local factor (README 1472) | None; specification absent | Unverifiable | R01 |
| §5.13c Ramified quadratic local factor (README 1476) | None; specification absent | Unverifiable | R01 |
| §5.13d Unramified cubic local factor (README 1480) | None; specification absent | Unverifiable | R01 |
| §5.13e Ramified cubic local factor (README 1484) | None; specification absent | Unverifiable | R01 |
| §5.13f Five local orbital Euler factors (README 1488) | None; specification absent | Unverifiable | R01 |
| §5.14 The selected quadratic double Dirichlet series (README 1492) | None; specification absent | Unverifiable | R01 |
| §5.15 Quadratic reciprocity matrix (README 1498) | None; specification absent | Unverifiable | R01 |
| §5.15a Mod-eight character matrix orthogonality (README 1504) | None; specification absent | Unverifiable | R01 |
| §5.16 Primitive quadratic twist data (README 1508) | None; specification absent | Unverifiable | R01 |
| §5.17 Imprimitive odd quadratic twist (README 1514) | None; specification absent | Unverifiable | R01 |
| §5.18 Iterated continuation tubes (README 1520) | None; specification absent | Unverifiable | R01 |
| §5.19 The binary-cubic archimedean functional-equation matrix (README 1526) | None; specification absent | Unverifiable | R01 |
| §5.20 From arithmetic cubic orbits to analytic coefficients (README 1532) | None; specification absent | Unverifiable | R01 |
| §5.21 The two cubic poles and their residues (README 1538) | None; specification absent | Unverifiable | R01 |
| §5.21a Adelic binary cubic convergence (README 1544) | None; specification absent | Unverifiable | R01 |
| §5.21b Adelic orbital unfolding (README 1548) | None; specification absent | Unverifiable | R01 |
| §5.21c All class-group components in unfolding (README 1552) | None; specification absent | Unverifiable | R01 |
| §5.21d Entire truncated cubic integral (README 1556) | None; specification absent | Unverifiable | R01 |
| §5.21e Poisson decomposition of the global integral (README 1560) | None; specification absent | Unverifiable | R01 |
| §5.21f Rank-one smoothing extracts the quotient integral (README 1564) | None; specification absent | Unverifiable | R01 |
| §5.21g Normalized rank-one Fourier bound (README 1568) | None; specification absent | Unverifiable | R01 |
| §5.21h Zero-orbit contribution (README 1572) | None; specification absent | Unverifiable | R01 |
| §5.21i Compact averaging and Fourier (README 1576) | None; specification absent | Unverifiable | R01 |
| §5.21j Singular distributions from Tate integrals (README 1580) | None; specification absent | Unverifiable | R01 |
| §5.21k Unfold the triple-root orbit (README 1584) | None; specification absent | Unverifiable | R01 |
| §5.21l Triple-root contour residues (README 1588) | None; specification absent | Unverifiable | R01 |
| §5.21m Unfold the double-root orbit (README 1592) | None; specification absent | Unverifiable | R01 |
| §5.21n Double-root contour residues (README 1596) | None; specification absent | Unverifiable | R01 |
| §5.21o Cancel the extra smoothing poles (README 1600) | None; specification absent | Unverifiable | R01 |
| §5.21p Integrate the singular radial powers (README 1604) | None; specification absent | Unverifiable | R01 |
| §5.21q Adelic cubic continuation and equation (README 1608) | None; specification absent | Unverifiable | R01 |
| §5.21r Fourier transform of the integral lattice (README 1612) | None; specification absent | Unverifiable | R01 |
| §5.21s Cubic meromorphic continuation (README 1616) | None; specification absent | Unverifiable | R01 |
| §5.21t Order-one bound for cubic clearance (README 1620) | None; specification absent | Unverifiable | R01 |
| §5.21u Cubic residue at one (README 1624) | None; specification absent | Unverifiable | R01 |
| §5.21v Cubic secondary residue (README 1628) | None; specification absent | Unverifiable | R01 |
| §5.22 Continued odd quadratic L-function (README 1632) | None; specification absent | Unverifiable | R01 |
| §5.23 Local quadratic reflection ratio (README 1638) | None; specification absent | Unverifiable | R01 |
| §5.24 The cubic global matrix functional equation (README 1644) | None; specification absent | Unverifiable | R01 |
| §5.24a Archimedean Fourier comparison (README 1650) | None; specification absent | Unverifiable | R01 |
| §5.25 Pole-cleared quadratic L-function (README 1654) | None; specification absent | Unverifiable | R01 |
| §5.26 Quadratic reflection matrix (README 1660) | None; specification absent | Unverifiable | R01 |
| §5.27 The degree-dependent zero at the origin (README 1666) | None; specification absent | Unverifiable | R01 |
| §5.27a Absolute convergence of cubic Shintani series (README 1672) | None; specification absent | Unverifiable | R01 |
| §5.27b Archimedean coefficients vanish to degree order (README 1676) | None; specification absent | Unverifiable | R01 |
| §5.27c The global prefactor is a unit at one (README 1680) | None; specification absent | Unverifiable | R01 |
| §5.27d Simple poles of the dual cubic Shintani series (README 1684) | None; specification absent | Unverifiable | R01 |
| §5.28 Pole-aware cubic convexity bound (README 1688) | None; specification absent | Unverifiable | R01 |
| §5.28a The weighted cubic-coefficient bound (README 1694) | None; specification absent | Unverifiable | R01 |
| §5.28b Reflected vertical bound from the matrix equation (README 1698) | None; specification absent | Unverifiable | R01 |
| §5.29 Quadratic large sieve and primitive real-character moment (README 1702) | None; specification absent | Unverifiable | R01 |
| §5.30 Meromorphic continuation and the three polar hyperplanes (README 1708) | None; specification absent | Unverifiable | R01 |
| §5.30a Normal convergence in the first tube (README 1714) | None; specification absent | Unverifiable | R01 |
| §5.30b Absolute convergence in the initial double tube (README 1718) | None; specification absent | Unverifiable | R01 |
| §5.30c Unique odd squarefree factorization (README 1722) | None; specification absent | Unverifiable | R01 |
| §5.30d Quadratic conductor and root number (README 1726) | None; specification absent | Unverifiable | R01 |
| §5.30e Nonzero squarefree-series denominator (README 1730) | None; specification absent | Unverifiable | R01 |
| §5.30f Separating square factors of the discriminant index (README 1734) | None; specification absent | Unverifiable | R01 |
| §5.30g Quadratic fourth moment (README 1738) | None; specification absent | Unverifiable | R01 |
| §5.30h Primitive quadratic first moment (README 1742) | None; specification absent | Unverifiable | R01 |
| §5.30i Imprimitive square-factor bound (README 1746) | None; specification absent | Unverifiable | R01 |
| §5.30j The first-moment input for the wider convergence tube (README 1750) | None; specification absent | Unverifiable | R01 |
| §5.30k Pole-aware strip first moment (README 1754) | None; specification absent | Unverifiable | R01 |
| §5.30l Locally uniform convergence in R1 (README 1758) | None; specification absent | Unverifiable | R01 |
| §5.30m The swap functional equation (README 1762) | None; specification absent | Unverifiable | R01 |
| §5.30n The reflection functional equation (README 1766) | None; specification absent | Unverifiable | R01 |
| §5.30o The zero block that removes a false pole (README 1770) | None; specification absent | Unverifiable | R01 |
| §5.30p Functional branches agree on overlaps (README 1774) | None; specification absent | Unverifiable | R01 |
| §5.30q Cancellation of spurious reflected poles (README 1778) | None; specification absent | Unverifiable | R01 |
| §5.30r Gluing the four continued tubes (README 1782) | None; specification absent | Unverifiable | R01 |
| §5.30s Bochner tube extension (README 1786) | None; specification absent | Unverifiable | R01 |
| §5.30t Entire approximation on a connected tube (README 1790) | None; specification absent | Unverifiable | R01 |
| §5.30u Analytic discs joining two real points (README 1794) | None; specification absent | Unverifiable | R01 |
| §5.30v Bound survives tube extension (README 1798) | None; specification absent | Unverifiable | R01 |
| §5.30w Affine dihedral action (README 1802) | None; specification absent | Unverifiable | R01 |
| §5.30x Real shell convex hull (README 1806) | None; specification absent | Unverifiable | R01 |
| §5.30y Gamma reflection block growth (README 1810) | None; specification absent | Unverifiable | R01 |
| §5.30z Bounded normalization on the shell tube (README 1814) | None; specification absent | Unverifiable | R01 |
| §5.30aa Filling the remaining real twelve-gon (README 1818) | None; specification absent | Unverifiable | R01 |
| §5.30ab Polynomial growth of cleared double series (README 1822) | None; specification absent | Unverifiable | R01 |
| §6.1 The positive rational ax+b subgroup (README 1832) | None; specification absent | Unverifiable | R01 |
| §6.2 The finite-adele scaling measure (README 1838) | None; specification absent | Unverifiable | R01 |
| §6.2a Normalize the local scaling density (README 1844) | None; specification absent | Unverifiable | R01 |
| §6.3 Eisenstein recurrence polynomials (README 1848) | None; specification absent | Unverifiable | R01 |
| §6.4 Positive-spectrum zeta and heat series (README 1854) | None; specification absent | Unverifiable | R01 |
| §6.4a Spectral continuation output (README 1860) | None; specification absent | Unverifiable | R01 |
| §6.5 Ratio set of a nonsingular action (README 1864) | None; specification absent | Unverifiable | R01 |
| §6.6 Finite spectral determinant benchmark (README 1870) | None; specification absent | Unverifiable | R01 |
| §6.7 Integral translation subgroup (README 1876) | None; specification absent | Unverifiable | R01 |
| §6.8 Translations and positive dilations (README 1882) | None; specification absent | Unverifiable | R01 |
| §6.9 Ergodicity of positive rationals on finite adeles (README 1888) | None; specification absent | Unverifiable | R01 |
| §6.9a Finite-prime orbit projection (README 1894) | None; specification absent | Unverifiable | R01 |
| §6.9b Local characters form a dense family (README 1898) | None; specification absent | Unverifiable | R01 |
| §6.9c Reciprocal primes in progressions (README 1902) | None; specification absent | Unverifiable | R01 |
| §6.9d Nontrivial characters are annihilated in the critical interval (README 1906) | None; specification absent | Unverifiable | R01 |
| §6.9e Decreasing orthogonal projections (README 1910) | None; specification absent | Unverifiable | R01 |
| §6.10 All normalized scaling measures (README 1914) | None; specification absent | Unverifiable | R01 |
| §6.11 The scalar Selberg primitive-geodesic product (README 1920) | None; specification absent | Unverifiable | R01 |
| §6.12 Spectral zeta is regular at zero (README 1926) | None; specification absent | Unverifiable | R01 |
| §6.12a Explicit scalar hyperbolic heat kernel (README 1932) | None; specification absent | Unverifiable | R01 |
| §6.12b The compact discrete-spectrum input (README 1936) | None; specification absent | Unverifiable | R01 |
| §6.12c Gaussian scalar trace and primitive multiplicities (README 1940) | None; specification absent | Unverifiable | R01 |
| §6.12d Full scalar heat expansion with remainder (README 1944) | None; specification absent | Unverifiable | R01 |
| §6.12e Scalar Weyl counting from heat (README 1948) | None; specification absent | Unverifiable | R01 |
| §6.12f Weyl bounds imply spectral summability (README 1952) | None; specification absent | Unverifiable | R01 |
| §6.12g Heat Mellin identity (README 1956) | None; specification absent | Unverifiable | R01 |
| §6.12h Exponential heat decay after zero subtraction (README 1960) | None; specification absent | Unverifiable | R01 |
| §6.12i Subtracting small-time heat coefficients (README 1964) | None; specification absent | Unverifiable | R01 |
| §6.12j Holomorphic remainder after heat subtraction (README 1968) | None; specification absent | Unverifiable | R01 |
| §6.13 Entire shifted determinant (README 1972) | None; specification absent | Unverifiable | R01 |
| §6.13a Two-parameter shifted spectral zeta (README 1978) | None; specification absent | Unverifiable | R01 |
| §6.13b Genus-one determinant product (README 1982) | None; specification absent | Unverifiable | R01 |
| §6.14 Positive diagonal homomorphism (README 1986) | None; specification absent | Unverifiable | R01 |
| §6.15 The regularized scalar Laplace determinant (README 1992) | None; specification absent | Unverifiable | R01 |
| §6.16 (P⁺_ℚ, P⁺_ℤ) is a Hecke pair (README 1998) | None; specification absent | Unverifiable | R01 |
| §6.16a Conjugation of translations (README 2004) | None; specification absent | Unverifiable | R01 |
| §6.17 The compact Selberg determinant comparison (README 2008) | None; specification absent | Unverifiable | R01 |
| §6.17a Compact geodesic-series majorant (README 2014) | None; specification absent | Unverifiable | R01 |
| §6.17b Logarithmic derivative of the primitive product (README 2018) | None; specification absent | Unverifiable | R01 |
| §6.17c The compact scalar heat trace input (README 2022) | None; specification absent | Unverifiable | R01 |
| §6.17d Elementary half-order Laplace integral (README 2026) | None; specification absent | Unverifiable | R01 |
| §6.17e Normal convergence of the hyperbolic transform (README 2030) | None; specification absent | Unverifiable | R01 |
| §6.17f Hyperbolic transform is the Selberg logarithm (README 2034) | None; specification absent | Unverifiable | R01 |
| §6.17g Identity contribution and Barnes normalization (README 2038) | None; specification absent | Unverifiable | R01 |
| §6.17h Branch-independent identity factor (README 2042) | None; specification absent | Unverifiable | R01 |
| §6.18 The Bost–Connes Hecke algebra (README 2046) | None; specification absent | Unverifiable | R01 |
| §6.18a Double-coset coordinate bijection (README 2052) | None; specification absent | Unverifiable | R01 |
| §6.18b Double cosets of the ax+b pair and their degrees (README 2056) | None; specification absent | Unverifiable | R01 |
| §6.19 The compact Selberg functional equation (README 2060) | None; specification absent | Unverifiable | R01 |
| §6.20 Selberg zeros and scalar spectral parameters (README 2066) | None; specification absent | Unverifiable | R01 |
| §6.20a Exact shifted determinant zero divisor (README 2072) | None; specification absent | Unverifiable | R01 |
| §6.20b Spectral quadratic pullback multiplicity (README 2076) | None; specification absent | Unverifiable | R01 |
| §6.20c Identity factor at spectral points (README 2080) | None; specification absent | Unverifiable | R01 |
| §6.21 The presentation of the rational Bost–Connes algebra (README 2084) | None; specification absent | Unverifiable | R01 |
| §6.21a For n≥1, x′n xn=n·1 (README 2090) | None; specification absent | Unverifiable | R01 |
| §6.21b For coprime n,m≥1, xn x′m=x′m xn (README 2094) | None; specification absent | Unverifiable | R01 |
| §6.21c For n,m≥1, x(nm)=xn xm (README 2098) | None; specification absent | Unverifiable | R01 |
| §6.21d For n,m≥1, x′(nm)=x′n x′m (README 2102) | None; specification absent | Unverifiable | R01 |
| §6.21e Cancellation of common dilation factors (README 2106) | None; specification absent | Unverifiable | R01 |
| §6.21f For n≥1 and γ∈ℚ/ℤ, xn e(γ)x′n=Σnδ=γ e(δ); the fiber has n elements (README 2110) | None; specification absent | Unverifiable | R01 |
| §6.21g Finite translation fibres (README 2114) | None; specification absent | Unverifiable | R01 |
| §6.21h Reduction to coprime normal forms (README 2118) | None; specification absent | Unverifiable | R01 |
| §6.21i For n≥1 and γ∈ℚ/ℤ, e(γ)xn=xn e(nγ) (README 2122) | None; specification absent | Unverifiable | R01 |
| §6.21j For γ,δ∈ℚ/ℤ, e(γ+δ)=e(γ)e(δ) (README 2126) | None; specification absent | Unverifiable | R01 |
| §6.21k Normal-form multiplication and common-divisor reduction (README 2130) | None; specification absent | Unverifiable | R01 |
| §6.21l Normal-form support (README 2134) | None; specification absent | Unverifiable | R01 |
| §6.21m The corrected double-coset basis is independent (README 2138) | None; specification absent | Unverifiable | R01 |
| §6.21n e(0)=1 (README 2142) | None; specification absent | Unverifiable | R01 |
| §6.22 The Bost–Connes time evolution (README 2146) | None; specification absent | Unverifiable | R01 |
| §6.24 The reduced Bost–Connes C*-algebra (README 2152) | None; specification absent | Unverifiable | R01 |
| §6.24a Inverse double-coset degree (README 2158) | None; specification absent | Unverifiable | R01 |
| §6.24b Finite convolution row and column counts (README 2162) | None; specification absent | Unverifiable | R01 |
| §6.24c Schur estimate for one double coset (README 2166) | None; specification absent | Unverifiable | R01 |
| §6.24d Bounded faithful left convolution (README 2170) | None; specification absent | Unverifiable | R01 |
| §6.24e Coefficient recovery and faithfulness (README 2174) | None; specification absent | Unverifiable | R01 |
| §6.24f Convolution preserves the adjoint (README 2178) | None; specification absent | Unverifiable | R01 |
| §6.25 Coefficient state on the Hecke core (README 2182) | None; specification absent | Unverifiable | R01 |
| §6.26 First trigonometric Eisenstein function (README 2188) | None; specification absent | Unverifiable | R01 |
| §6.26a Finite cotangent Fourier identity (README 2194) | None; specification absent | Unverifiable | R01 |
| §6.27 The two rational forms of the Bost–Connes algebra (README 2198) | None; specification absent | Unverifiable | R01 |
| §6.28 The representation on ℓ²(ℕ≥1) and its Hamiltonian (README 2204) | None; specification absent | Unverifiable | R01 |
| §6.28a Rational and isometric generator conventions (README 2210) | None; specification absent | Unverifiable | R01 |
| §6.28b Isometries and phase unitaries on l²(N+) (README 2214) | None; specification absent | Unverifiable | R01 |
| §6.29 KMS_β states on the Bost–Connes algebra (README 2218) | None; specification absent | Unverifiable | R01 |
| §6.30 Completed KMS states and the bounded strip condition (README 2224) | None; specification absent | Unverifiable | R01 |
| §6.30a Entire spectral core to bounded-strip KMS (README 2230) | None; specification absent | Unverifiable | R01 |
| §6.31 Higher trigonometric Eisenstein functions (README 2234) | None; specification absent | Unverifiable | R01 |
| §6.32 BC diagonal heat operator (README 2240) | None; specification absent | Unverifiable | R01 |
| §6.33 Completed coefficient state (README 2246) | None; specification absent | Unverifiable | R01 |
| §6.33a Algebraic GNS generator estimates (README 2252) | None; specification absent | Unverifiable | R01 |
| §6.33b Universal C*-norm of the BC core (README 2256) | None; specification absent | Unverifiable | R01 |
| §6.33c Division endomorphisms on the existing profinite ring (README 2260) | None; specification absent | Unverifiable | R01 |
| §6.33d Minimal finite-adele dilation (README 2264) | None; specification absent | Unverifiable | R01 |
| §6.33e BC algebra as a full crossed-product corner (README 2268) | None; specification absent | Unverifiable | R01 |
| §6.33f Full and reduced BC crossed products (README 2272) | None; specification absent | Unverifiable | R01 |
| §6.33g Universal and reduced BC norms agree (README 2276) | None; specification absent | Unverifiable | R01 |
| §6.33h Dense isometric core embedding (README 2280) | None; specification absent | Unverifiable | R01 |
| §6.33i Positive Hecke states extend boundedly (README 2284) | None; specification absent | Unverifiable | R01 |
| §6.34 KMS states and scaling measures (README 2288) | None; specification absent | Unverifiable | R01 |
| §6.34a Entire Hecke orbit maps (README 2294) | None; specification absent | Unverifiable | R01 |
| §6.34b Uniform correlation bound on the closed strip (README 2298) | None; specification absent | Unverifiable | R01 |
| §6.34c Extending real dynamics to the C*-completion (README 2302) | None; specification absent | Unverifiable | R01 |
| §6.34d Point-norm continuous completed dynamics (README 2306) | None; specification absent | Unverifiable | R01 |
| §6.34e The analytic core and the strip KMS condition (README 2310) | None; specification absent | Unverifiable | R01 |
| §6.34f Diagonal expectation in the full corner (README 2314) | None; specification absent | Unverifiable | R01 |
| §6.34g Scaling measure produces a KMS state (README 2318) | None; specification absent | Unverifiable | R01 |
| §6.34h KMS restriction reconstructs a scaling measure (README 2322) | None; specification absent | Unverifiable | R01 |
| §6.35 The symmetry group Ẑ^× = Aut(ℚ/ℤ) (README 2326) | None; specification absent | Unverifiable | R01 |
| §6.36 KMS∞ states and upper-half-plane ground states (README 2332) | None; specification absent | Unverifiable | R01 |
| §6.36a KMS-infinity limits are ground states (README 2338) | None; specification absent | Unverifiable | R01 |
| §6.36b Ground and KMS-infinity differ for trivial dynamics (README 2342) | None; specification absent | Unverifiable | R01 |
| §6.37 The trigonometric arithmetic algebra equals the BC rational form (README 2346) | None; specification absent | Unverifiable | R01 |
| §6.37a Möbius divisibility identities (README 2352) | None; specification absent | Unverifiable | R01 |
| §6.37b The Eisenstein division formula (README 2356) | None; specification absent | Unverifiable | R01 |
| §6.37c Recovering prime-power divisibility projections (README 2360) | None; specification absent | Unverifiable | R01 |
| §6.37d Rational power sums in a prime corner (README 2364) | None; specification absent | Unverifiable | R01 |
| §6.37e Newton identities in the reduced corner (README 2368) | None; specification absent | Unverifiable | R01 |
| §6.37f Roots of the reduced polynomial (README 2372) | None; specification absent | Unverifiable | R01 |
| §6.37g Polynomial recovery of the Cayley transform (README 2376) | None; specification absent | Unverifiable | R01 |
| §6.37h Eisenstein algebra is stable under semigroup endomorphisms (README 2380) | None; specification absent | Unverifiable | R01 |
| §6.37i Reassembly of the prime-power components (README 2384) | None; specification absent | Unverifiable | R01 |
| §6.37j Recovering roots of unity from Eisenstein functions (README 2388) | None; specification absent | Unverifiable | R01 |
| §6.37k Arithmetic generation after adjoining isometries (README 2392) | None; specification absent | Unverifiable | R01 |
| §6.37l Complexification of the arithmetic form (README 2396) | None; specification absent | Unverifiable | R01 |
| §6.38 Ground state at an invertible lattice (README 2400) | None; specification absent | Unverifiable | R01 |
| §6.39 The partition function is the Riemann zeta function (README 2406) | None; specification absent | Unverifiable | R01 |
| §6.40 Critical-regime KMS uniqueness (README 2412) | None; specification absent | Unverifiable | R01 |
| §6.40a Ergodic scaling measure is extreme (README 2418) | None; specification absent | Unverifiable | R01 |
| §6.40b Unit average of a scaling measure (README 2422) | None; specification absent | Unverifiable | R01 |
| §6.40c Extreme unit average is constant (README 2426) | None; specification absent | Unverifiable | R01 |
| §6.41 The measured operator algebra and factor classification (README 2430) | None; specification absent | Unverifiable | R01 |
| §6.42 The critical KMS factors have type III₁ (README 2436) | None; specification absent | Unverifiable | R01 |
| §6.42a Prime pairs with prescribed ratio and divergent weights (README 2442) | None; specification absent | Unverifiable | R01 |
| §6.42b Valuation-tail cylinder ratios (README 2446) | None; specification absent | Unverifiable | R01 |
| §6.42c Prime pairs with controlled unit residues (README 2450) | None; specification absent | Unverifiable | R01 |
| §6.42d Independent tail swaps give essential ratios (README 2454) | None; specification absent | Unverifiable | R01 |
| §6.42e Ratio witnesses lift through unit cylinders (README 2458) | None; specification absent | Unverifiable | R01 |
| §6.42f All positive numbers belong to the ratio set (README 2462) | None; specification absent | Unverifiable | R01 |
| §6.42g Ergodicity makes the group-measure algebra a factor (README 2466) | None; specification absent | Unverifiable | R01 |
| §6.42h Full positive ratio set determines type III1 (README 2470) | None; specification absent | Unverifiable | R01 |
| §6.42i A nonzero full corner preserves factor type (README 2474) | None; specification absent | Unverifiable | R01 |
| §6.43 The Gibbs states φ_{β,u} (README 2478) | None; specification absent | Unverifiable | R01 |
| §6.43a Absolute Gibbs diagonal summability (README 2484) | None; specification absent | Unverifiable | R01 |
| §6.44 Completed Gibbs state (README 2488) | None; specification absent | Unverifiable | R01 |
| §6.45 The Gibbs states are KMS_β states (README 2494) | None; specification absent | Unverifiable | R01 |
| §6.45a Gibbs strip correlations (README 2500) | None; specification absent | Unverifiable | R01 |
| §6.46 Gibbs barycentre of a probability measure (README 2504) | None; specification absent | Unverifiable | R01 |
| §6.46a Profinite units act on rational torsion (README 2510) | None; specification absent | Unverifiable | R01 |
| §6.47 Cyclotomic values and Galois action on extremal KMS∞ states (README 2514) | None; specification absent | Unverifiable | R01 |
| §6.47a Compatible finite cyclotomic restrictions (README 2520) | None; specification absent | Unverifiable | R01 |
| §6.48 High-β extremal states and unique barycentres (README 2524) | None; specification absent | Unverifiable | R01 |
| §6.48a Unit-orbit decomposition above the critical temperature (README 2530) | None; specification absent | Unverifiable | R01 |
| §6.48b High-beta unit-mass reconstruction (README 2534) | None; specification absent | Unverifiable | R01 |
| §6.48c Probability measures parameterize high-beta KMS states (README 2538) | None; specification absent | Unverifiable | R01 |
| §6.48d High-beta extreme states (README 2542) | None; specification absent | Unverifiable | R01 |
| §6.49 Arithmetic values and symmetry intertwining (README 2546) | None; specification absent | Unverifiable | R01 |
| §6.49a The Gibbs limit and its uniform tail bound (README 2552) | None; specification absent | Unverifiable | R01 |
| §6.50 The Bost–Connes phase transition (README 2556) | None; specification absent | Unverifiable | R01 |
| §6.50a Symmetry on the high-beta extreme boundary (README 2562) | None; specification absent | Unverifiable | R01 |

Remaining unavailable checks are the full statement-by-statement truth audit, exact source comparison, README/Lean generality comparison, Check discrimination, complete duplication audit and complete supplier graph. A fresh review of the substantive artifacts is required; the empty Lean build and absence of a detected dependency cycle do not discharge those obligations.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "0ac1ec8fc43118ecf8db68ab722b619c1d3ab6ab", "job": "REV-PKG-AnalyticNumberTheory", "model": "gpt-6-astra", "worker": "chris-3"} -->
