# Review of LinearFormsInLogarithms (pull request #451 at d47950d)

**Verdict:** needs changes

Six findings: one P2 and five P3. The missing branch-independent headline is statable at the pins. The gate also fails its empty-section rule. No false theorem, cyclic supplier edge, sorried data, or change outside this folder was found.

## R01 (P2) — State the branch-independent product theorem

Location: `TauCetiRoadmap/LinearFormsInLogarithms/README.md:696`: “for a nonempty family, `exp (∑ βᵢ lᵢ)` is transcendental”. The corresponding acceptance-test section ends with `Baker.transcendental_prod_cpow` at `Suggested.lean:655`.

Claim: §7.3 promises the theorem for arbitrary nonzero logarithms of algebraic numbers. The Lean file states its principal-power specialization, but neither states the general theorem nor identifies it as unstatable. The preceding affine-exponential theorem requires a nonzero constant term and cannot supply this signature.

Witness: Take one logarithm `l = 2πi` and `β = √2`. Then `exp l = 1`, whereas `exp (βl) ≈ -0.858216 + 0.513288i`. The principal-power theorem excludes the base `1`; principal `1^√2 = 1`.

Repair: add the branch-independent headline, retaining the principal-power corollary if desired. This exact signature elaborated against the pins with only a `sorry` warning:

```lean
theorem Baker.transcendental_exp_sum_mul
    {ι : Type*} [Fintype ι] [Nonempty ι] {l β : ι → ℂ}
    (hl : ∀ i, l i ≠ 0)
    (halg : ∀ i, IsAlgebraic ℚ (Complex.exp (l i)))
    (hβ : ∀ i, IsAlgebraic ℚ (β i))
    (hli : LinearIndependent ℚ (fun o : Option ι => o.elim 1 β)) :
    Transcendental ℚ (Complex.exp (∑ i, β i * l i)) := by
  sorry
```

It includes the displayed nonprincipal logarithm, while the existing principal form does not. Give it a README name and locator. Waldschmidt's Chapter 1 corollary following Theorem 1.6 supports this generality (W00 lines 828–835, printed p. 4).

## R02 (P3) — Remove the empty module-section heading

Location: `TauCetiRoadmap/LinearFormsInLogarithms/Suggested.lean:31`: “`## Mathlib declarations that README.md cites`”.

Claim: the gate treats this as a declaration section, but it contains only `#check` commands. The supplied gate and my rerun both report `empty-sections=1`, with this precise line.

Witness: lines 33–60 contain 28 library `#check` commands and no declaration before the next section.

Repair: change this heading to an ordinary comment, retaining the permitted library checks. This removes the heading the scanner identifies; rerun the gate. A passing elaboration does not override this gate failure.

## R03 (P3) — Delete padding and proof-only scaffolding from the acceptance test

Location: `TauCetiRoadmap/LinearFormsInLogarithms/Suggested.lean:89`, `:316`, and module docstring `:22`: “the steps of the proofs of 5.7 and 8.10”.

Claim: the file still serves as a proof/API catalogue. Two admitted statements close with one tactic against the existing definitions and library. The coefficient-at-zero, constant-function and monomial statements at lines 131, 147 and 213 are respectively boundary/constant cases and a README Check. The 5.1–5.6 and 8.6–8.9 proof-only definitions are not required to state Schneider–Lang or either Baker headline.

Witness: scratch replacements at lines 89 and 316 elaborated successfully with the two single tactics below; the unchanged declarations have `sorry` bodies.

```lean
-- FormalMultilinearSeries.mvCoeff_smul
by simp [FormalMultilinearSeries.mvCoeff, Finset.smul_sum, Pi.smul_apply]

-- NumberField.house_prod_le
by simpa [_root_.NumberField.house, map_prod] using
  Finset.norm_prod_le s
    (fun i => _root_.NumberField.canonicalEmbedding K (f i))
```

Repair: **delete it from `Suggested.lean`** for each padding declaration, retaining its mathematics as README API or Checks. Delete the proof-only auxiliary-function, size-bound, admissibility and derivative-system scaffolding unless needed by a retained independent headline. Remove the README declaration-name promises for deleted declarations while retaining the prose targets. Keep the nontrivial multi-index/analytic headlines and only their necessary simple definitions. Rewrite the module docstring around the acceptance test and any genuinely unstatable headlines, rather than representative milestones. This does not ask for the two short proofs to be installed.

The 89-theorem bare `rfl`/`simp`/`infer_instance` sweep alone closed none; the targeted probes above supply the positive evidence. The two padding findings do not rely on a failed proof search.

## R04 (P3) — Supply the required roadmap structure and per-layer dependencies

Location: `TauCetiRoadmap/LinearFormsInLogarithms/README.md:68`, `:220`, `:328`, `:336`: “Scope”, “What Mathlib already has (consume)”, “The build, in layers”, “Layer 0”.

Claim: the document lacks the required opening Summary, Scope and ownership, Exact supplier contracts, How to read the build, and per-layer Examples/Dependencies structure. Targets are long numbered bullets under third-level layer headings; their `Prerequisites` prose does not provide the requested target-level `Needs` structure. The necessary supplier information exists but is dispersed, including library-status claims in the introduction.

Witness: a heading scan finds nine `### Layer` headings and no `### Examples`, `### Dependencies`, or `## Exact supplier contracts`.

Repair: preserve the mathematical targets while organizing them into the prescribed sections and `## Layer k`/`### k.n` hierarchy. Move existing Mathlib/Tau Ceti declarations into exact supplier contracts; put the existing-work deferrals in Scope and ownership. Give each layer examples and dependencies and each target its own needs and locator. This is organizational work; the dependency audit below found no supplier-direction defect.

## R05 (P3) — Replace field descriptions with discriminating Checks

Location: `TauCetiRoadmap/LinearFormsInLogarithms/README.md:623`: “`le_W`, `exp_one_le`, `le_exp` and `count` are the conditions of 4.1”.

Claim: several definitions still lack an API list and three discriminating Checks of their own. The §5.5 block has one computed floor-division example followed by two descriptions of fields. The §8.7 entry-bound and §8.8 admissibility blocks similarly include descriptions in place of tests. Shared blocks for three size functions or five derivative-system functions do not establish three tests for each object. `extendExponent` and `mvTaylorCoeff` also need identifiable definition-level test coverage.

Witness: §5.5's last two bullets restate which inequalities the fields contain; neither evaluates a parameter choice or rejects a wrong model.

Repair: add per-definition API bullets and three explicit computations/nonexamples. For example, with all discrete size parameters and δ,G equal to 1 and N=0, `houseBound` at M=0,1,2 is 8,24,64; at D=2 the corresponding `liouvilleFactor` values are 8,24,256. These distinguish the factorial factor and the exponent D−1. For the §5.6 parameters with n=d₀=d₁=D=δ=G=1 and A=Ay=B=0, q=1 gives N=0 and q=2 gives R/r=2<e: both are rejected, so “sufficiently large” is substantive. For §8.8, k=0,L=h=D=G=C=1,p=3,r₀=2 and zero sequences give a final left side 1536 versus right side 1, rejecting the fake zero-order model. Keep these in the README, not as admitted Lean examples.

## R06 (P3) — Correct three pinned-library locators

Location: `TauCetiRoadmap/LinearFormsInLogarithms/README.md:60`, `:255`, `:301`: “next to `Exp.lean`”, “`house_pow`”, “`TauCeti/RingTheory/PowerSeries/Weierstrass/Division.lean`”.

Claim: these cited file/declaration names do not exist at the pins. This remains partly the previous R07.

Witness: the power-series directory has `WeierstrassDivision.lean` and no `Exp.lean`; division is at line 339. `Mathlib/NumberTheory/NumberField/House.lean:61` declares `NumberField.house_pow_le`.

Repair: cite `TauCeti/RingTheory/PowerSeries/WeierstrassDivision.lean`; identify a new suggested exponential-series file without asserting that it exists; replace `house_pow` by `NumberField.house_pow_le`. The latter gives precisely the inequality the size estimates consume, so this is a locator correction, not an unowned prerequisite.

## Verified sound

### Previous findings, checked before the full review

No repair report marking any finding “not actionable in this package” was supplied. The previous review was checked finding by finding against this head:

| Previous finding | Passage at this head | Disposition |
|---|---|---|
| R01, TeX across lines | README 792–793 and 818–819 now use indented ASCII formulas | Repaired; gate tex=0 and latex=0. |
| R02, pull-request numbers | README 308–324 identifies the two authors' formalisations without PR numbers | Repaired; gate prnum=0. |
| R03, uncited Lean names | Suggested 33–60 pins the library names with `#check`; provenance names are source names | Repaired; gate readme-ids-missing=0. |
| R04, eleven named padding declarations | Those eleven declarations are absent; line 89 still states scalar compatibility | Named deletions repaired; broader acceptance-test issue partly repaired, new concrete witnesses in R03. |
| R05, definition Checks | README 623 has “Checks for Admissible”; only its first bullet computes a value | Partly repaired; eight Checks blocks are present, but R05 explains the remaining gap. |
| R06, downstream contracts | README 960 says “Downstream consumers” and names three consumers | Repaired; citations resolved below. |
| R07, Tau Ceti locators | README 301 still names “Weierstrass/Division.lean” | Not repaired; R06 also records the newly checked house-power typo. |

### Principles, gate, signatures and headlines

Reviewed all 106 declarations: 89 theorems, 15 definitions and two proposition-valued structures. The latter have concrete mathematical fields, not free placeholder propositions. All data definitions have real bodies; the import is exactly `import Mathlib`. No `set_option`, admitted example, computational algorithm, copied source passage, or route-specific prime exclusion was found. The p≠2 restriction belongs to the example exp(p), not to the general p-adic Baker theorem. General p=2 is retained on its proper convergence disc.

The worktree remains at d47950d4d1674370adc31af515b5a71b22f1b16e. The diff outside `TauCetiRoadmap/LinearFormsInLogarithms` and final working-tree status are empty. I did not edit either reviewed file.

Gate rerun output:

```text
gate LinearFormsInLogarithms: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=1 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 FAIL
  empty-sections: line 31: Mathlib declarations that README.md cites
```

The worker's targeted module build reports build=0. Independently, `lake env lean` on the absolute target path, from the pinned worktree, succeeded with 89 `declaration uses sorry` warnings and no other target warnings. The all-declaration `#check @name` scratch file also elaborated successfully. I compared the 106 resulting signatures with the README. The two flagged omitted `CompleteSpace L` binders are deliberate `omit` clauses (lines 715 and 745): radius and coefficient estimates do not require convergence in L. Completeness remains on the exponential sum/value claims. No signature was changed.

Headline inventory: multi-index reconstruction/uniqueness (§0.3–0.4), the Cartesian Schwarz and auxiliary-function theorems (§1.6, §4.1), Schneider–Lang (§5.7), its toric/algebraic-coordinate consequences (§6.1–6.2), Hermite–Lindemann and Gelfond–Schneider including the quotient alternative (§6.3–6.4), the basis formulation and full Baker theorem (§7.1–7.2), its linear-form, affine-exponential and product consequences (§7.3), p-adic Baker and its linear-form consequence (§8.10), and the stated transcendental constants. Each has a Lean signature except the branch-independent product consequence R01. The module does not identify an unstatable headline; no missing carrier prevents R01.

### Supplier direction, ownership and pinned objects

Mechanical check:

```text
depcheck: 209 roadmaps, 1461 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line. I read every prerequisite line and supplier passage. There are no roadmap suppliers or declared gaps; the three downstream contracts are consumers. Proof routes use earlier layers and the pinned library inputs listed in the README. Source proofs are checked at their own generality below.

Object searches used `roadmaps grep` and `roadmaps show`, the supplied open-roadmap index, main, the local board packages, and the pinned sources: multi-index coefficients, exponential polynomials, Schneider–Lang, Hermite–Lindemann, Gelfond–Schneider, Baker/Brumer, house bounds, Siegel/Thue–Siegel, Hermite interpolation and p-adic exponential. No duplicate fully qualified declaration was found in the readable roadmap heads. This folder owns the qualitative logarithm theorems; the surrounding roadmaps explicitly consume them.

Resolved cross-roadmap references:

- `TauCetiRoadmap/DiophantineApproximationAndTranscendence/README.md:54` and its contracts at 112–141 assign these qualitative analytic/transcendence inputs to this roadmap. Sections 3.3 and 3.5 (2259–2263 and 2338–2352) consume §6.4 and Layers 5–7. The main version, not a revision PR, was used. Its broader rank formulation and quantitative refinements remain its own targets.
- `TauCetiRoadmap/LocalFieldsRamification/README.md:379`–400 owns deep-unit local exponential/logarithm comparisons. This roadmap's analytic exponential on an arbitrary normed ℚ_p-algebra field is a different input, not a second construction of that local-field comparison.
- `Completed/AdicSpaces/README.md:233`, §0.5, includes restricted-series Weierstrass division/preparation. This roadmap consumes the already pinned division theorem instead of rebuilding it.
- `TauCetiRoadmap/EllipticCurves/README.md:164`–166 and 1497–1499 excludes Siegel/Baker-strength input; there is no competing ownership there.
- `TauCetiRoadmap/GL2ModularityLifting/README.md:69`–71, and its §10.7a needs at 2627, consume §8.10. `TauCetiRoadmap/IntegralIwasawaTheory/README.md:12` and its named supplier contract consume the same theorem. Neither supplies anything back.
- The supplied `DiophantineApproximationAndTranscendencePartII` head owns arithmetic-germ/algebraicity extensions and cites the separate polydisc-integration supplier; it does not reclaim these Baker targets.
- Board package searches also distinguish GrossZagierAndArithmeticHeights' p-adic analytic subgroup theorem (README 4941–4954) from its qualitative Baker–Brumer input. All five specifically indexed board heads were searched: AnalyticNumberTheory, AutomorphicCongruences, KatoEulerSystems, LogicAndDefinabilityInNumberTheory and the design README of LawrenceVenkateshMethod (its package has no top-level README at that head). No competing object was found.

Pins checked: Mathlib `dc4b8d60d5edb3c493c3662126b1b7ccae7d67cf`; Tau Ceti `5cb65f0393fd8deeaf3fb6398ba48bad654e479d`. The following declarations/definitions were opened, not inferred from their names:

| Pinned file and line | Content relevant to this review |
|---|---|
| `Mathlib/NumberTheory/NumberField/House.lean:39`, 43, 46, 52, 55, 61, 88, 95 | House is the norm of the canonical embedding, with embedding supremum, sum/product/power estimates and integral lower bounds. The finite-set product at 55 does not preserve repeated image values; R03's indexed product follows from the norm product inequality. |
| `Mathlib/NumberTheory/NumberField/House.lean:343` | Siegel bound has exponent p/(q−p) and assumes a nonzero matrix. With 2p≤q it is ≤1; a zero matrix admits a coordinate unit vector. This validates §3.5's wrapper route. |
| `Mathlib/Analysis/Analytic/Basic.lean:74`, 110 | A power series on a ball includes positive radius, radius control and HasSum on the ball. AnalyticAt is existential power-series data; it does not itself assert completeness. |
| `Mathlib/Analysis/Analytic/IteratedFDeriv.lean:228` | Derivatives are permutation sums of multilinear coefficients, with completeness. Repeated indices give the product of factorials, not its inverse. |
| `Mathlib/Analysis/Analytic/Order.lean:47`, 152, 333 | Nonanalytic functions receive order 0; analytic factorization and derivative criteria have their stated analytic/characteristic hypotheses. |
| `Mathlib/Analysis/Complex/Schwarz.lean:145` | The radius exponent is n+1, centered at f(c), with the MapsTo and little-o hypotheses. §1.3 uses f(c)=0 when T≥1. |
| `Mathlib/Analysis/SpecialFunctions/Pow/Complex.lean:27` | Complex power uses the principal logarithm for a nonzero base; at base 0 it separately defines 0^0=1 and other powers as 0. It is not an arbitrary branch. |
| `Mathlib/Analysis/Normed/Algebra/Exponential.lean:173`, 437 | Exponential is the scalar-series sum; its addition theorem requires membership in the convergence ball. |
| `Mathlib/NumberTheory/Padics/Complex.lean:74`, 187, 195, 199, 244 | The spectral-norm algebra over ℚ_p, complete normed field and ultrametric/algebraic-closure structures used by Layer 8. |
| `TauCeti/NumberTheory/GeometryOfNumbers/Doubling.lean:69`, 186 | Coordinate box definition and separated-set bound (4c/ε)^(2 card ι), with positive radii and ε≤c. It does not supply the sharper √2 partition count as stated. |
| `TauCeti/RingTheory/PowerSeries/GaussNorm.lean:99`, 410 | Distinguished means the norm is attained at the specified degree and is strictly smaller above it; multiplication needs the restricted-series, ultrametric and norm-multiplicative hypotheses. |
| `TauCeti/RingTheory/PowerSeries/WeierstrassDivision.lean:339` | Division over a complete ultrametric normed field gives restricted quotient and bounded-degree remainder. A product of (X−a)^S with norm(a)≤1 is distinguished at any radius >1. |

The 28 library `#check` names all elaborate at these pins. Object searches found no pinned Baker/Gelfond–Schneider theorem or transcendence of e/π to replace the principal headlines. R06 records the names that fail the more precise file/declaration check.

### Sources and the sample

The brief says its 15-target extractor found no headings and supplies no target IDs. I therefore do not claim to have reproduced an undisclosed seed. I retained the preceding review's 15 mathematical groups (listed below), checked all readable locators in them, and expanded to the other W00 citations and proof steps. Seven bibliography works were attempted through the sources service. Missing texts did not stop the mathematics or the report.

W00 was read from the [author's legal full-book copy](https://webusers.imj-prg.fr/~michel.waldschmidt/articles/pdf/dalag.pdf), linked by his [publications page](https://webusers.imj-prg.fr/~michel.waldschmidt/texts.html). The extraction's page number exceeds the printed page by 20 in Chapter 4. All page numbers below are printed pages. No source text was copied into the repository or this report.

| Sample group | Locator and text actually inspected | Comparison |
|---|---|---|
| 1.3 | Pinned Schwarz and analytic-order declarations above | Correct centered norm and T−1/n+1 conversion; no external theorem number needed. |
| 1.5 | W00 Lemma 4.13, pp. 134–135, lines 6977–7035 | Source is scalar entire and has 1+√T. README explicitly supplies a Banach-valued ball variant with 1+T. Its proof route uses triangle bounds, not an unsupported Parseval extension. |
| 1.6 | W00 Proposition 4.7, p. 122, lines 6451–6460; Lemma 4.8, pp. 123–124, lines 6474–6523 | Source is entire, R≥18ⁿr. README labels its analytic-neighborhood Newton-division variant and changed constants. |
| 2.1 | W00 Lemma 4.9, pp. 130–131, lines 6778–6814 | Source gives derivatives. Dividing by σ! yields the README Taylor-coefficient formula; choose(τ,j)=0 removes the natural-subtraction junk terms. |
| 3.1 | Pinned House.lean:95; W00 Proposition 3.14, p. 83, lines 4526–4539 | The latter is the polynomial-evaluation height form; the roadmap's house inequality is justified by the explicitly named pinned field-norm estimate. |
| 3.4 | W00 Lemmas 4.11–4.12, pp. 132–134, lines 6887–6975 | Verified strict real count, weak complex count and √2. The real partition argument works for a real size bound, although the source states an integral one. |
| 4.1 | W00 Proposition 4.10, pp. 131–132, lines 6867–6880; proof pp. 135–136, lines 7043–7107 | Verified 12n², W, ratio and count. README's analytic-ball inputs replace entire functions; the weaker remainder is sufficient since 1+T≤e^(W/3)/2 for the proof's T at W≥12n². |
| 5.7 | W00 Corollary 4.2, p. 117, lines 6151–6159; §4.6, pp. 137–141, lines 7116–7316 | Algebraic x-coordinates, rational independence, complex y-basis and d₀≤n<d₀+d₁ match. The proof's coordinate-order issue is corrected by the roadmap's total-degree version. |
| 6.1 | W00 Corollary 4.3, p. 118, lines 6187–6192 | Correct toric rank consequence; general rank variant is assigned to the existing Diophantine roadmap, rather than re-planned here. |
| 6.2 | W00 Corollary 4.4, p. 118, lines 6196–6201 | Correct algebraic-coordinate consequence. |
| 7.1 | W00 Theorem 4.5 and Lemma 4.6, pp. 119–121, lines 6242–6409 | Basis, algebraicity and trace/embedding determinant hypotheses match. The second use of invertibility really is needed to conclude all logarithms vanish. BM80 itself remains unread. |
| 7.2 | W00 Theorem 1.6, p. 3, lines 822–824 | Full affine linear independence matches; Baker75 Theorem 2.1 not independently read. |
| 7.3 | W00 corollaries after Theorem 1.6, p. 4, lines 828–835 | Supports linear-form, affine-exponential and independent-coefficient product consequences. Baker75 numbering 2.2–2.4 remains unverified. R01 is a Lean-coverage defect. |
| 8.5 | Baker75 Chapter 2 Lemma 7 | Unread; independent Hermite interpolation and factorial/ultrametric checks are below. |
| 8.7–8.8 | Baker75 Chapter 2 Lemmas 1–6 and proof §5; Brumer67 pp. 121–124 | Unread; no certification of those locators. Arithmetic, counts, derivative relation and parameter inequalities were independently examined below. |

Also inspected W00 Theorem 4.1 (pp. 116–117, lines 6130–6144): the roadmap explicitly limits its target to the algebraic-group criterion rather than silently claiming the general finite-order entire-function theorem. The source's §4.6 polynomial degree/length estimates and parameter proof were read in full; the README states its altered constants and powers as its own argument.

The legal author-source file `Padic/Main.lean` at the stated 65cdef5722 commit was fetched through the service as KaratarakisBakerPadic: lines 47–51 and 175–183 have the exact §8.10 hypotheses and conclusions, with proof bodies. That verifies the two displayed signatures and their provenance, not a complete build or an axiom audit of that external development.

### Computed adversarial pass

The following table gives one row for each of the 106 declarations, in file order; line numbers are in `TauCetiRoadmap/LinearFormsInLogarithms/Suggested.lean`. “Consistent” means the stated calculation passed, not that finite examples prove a transcendence theorem. Exact identities supply the test values; decimal values only illustrate them. The README-only targets and normalization/negative controls follow in a second table. A dash in Change means no mathematical change indicated by that test.


| Statement (line) | Instances | Computed values | Result/change |
|---|---|---|---|
| `FormalMultilinearSeries.mvCoeff` (75) | n=2, p₂(u,v)=u₀v₁; α=(1,1) and (2,0) | Permutation sums are 1+0=1 and 0; a symmetric doubling would give 2, incorrectly. | Consistent; — |
| `FormalMultilinearSeries.apply_eq_sum_mvCoeff` (82) | Same p, z=(2,3), k=2 | Diagonal p₂(z,z)=6; multi-index sum=1·2·3=6. | Consistent; — |
| `FormalMultilinearSeries.mvCoeff_smul` (89) | Same p, scalar 3, α=(1,1) | LHS=3; RHS=3·1=3. | Consistent; delete padding, R03. |
| `HasFPowerSeriesOnBall.hasSum_mvCoeff` (96) | One variable, c_j=2⁻ʲ, z=1/2 | Weighted norm series=4/3; value ∑(1/4)ʲ=4/3. | Consistent; — |
| `exists_hasFPowerSeriesOnBall_tsum` (105) | Same c, radius 1 | ∑‖c_j‖=2; reconstructed value at 1/2=4/3, coefficient at 2=1/4. | Consistent; — |
| `HasFPowerSeriesAt.mvCoeff_eq_zero_of_eventuallyEq_zero` (113) | Zero function near 0; arbitrary α | All polynomial coefficients=0, including α=0; a nonzero constant 1 fails the hypothesis. | Consistent; — |
| `mvTaylorCoeff` (121) | f(z)=z² at 0; f(z)=1+conj(z) over ℂ | Coefficient at 2 is 1 for z²; every coefficient of the nonanalytic second germ is the defined 0, including order 0≠f(0)=1. | Consistent; improve Checks, R05. |
| `HasFPowerSeriesAt.mvTaylorCoeff_eq` (125) | Two multilinear presentations of z₀z₁ | One has mixed evaluations (1,0), the other (1/2,1/2); both mvCoeff=1 and mvTaylorCoeff=1. | Consistent; — |
| `AnalyticAt.mvTaylorCoeff_zero` (131) | f(z)=3+z² at 0 | LHS order-zero coefficient=3; RHS value=3. | Consistent; delete boundary padding, R03. |
| `AnalyticAt.mvTaylorCoeff_add` (136) | f=z, g=z², α=1 and 2 | Coefficients of f+g are (1,1); sums are (1+0,0+1). | Consistent; — |
| `mvTaylorCoeff_const_smul` (142) | Nonanalytic f=conj(z); scalars 0 and 2 | For scalar 0 both sides=0; for scalar 2 both germs are nonanalytic and both sides=0. | Consistent; — |
| `mvTaylorCoeff_const` (147) | Constant 3, α=0 and 1 | LHS values (3,0); RHS cases (3,0). | Consistent; delete constant case, R03. |
| `Filter.EventuallyEq.mvTaylorCoeff_eq` (152) | f=z²; g agrees with f on the unit ball | Coefficient at 2 of both germs=1, regardless of g outside that ball. | Consistent; — |
| `mvTaylorCoeff_comp_add_right` (157) | f=z², x=1,y=2, α=1 | Coefficient of (z+2)² at 1=6; coefficient of z² at 3=6. | Consistent; — |
| `AnalyticAt.prod_factorial_smul_mvTaylorCoeff` (163) | f=z₀²z₁, α=(2,1); also characteristic 2 | Over ℂ, factorial product·coefficient=2·1=2=derivative; in characteristic 2, both sides=0 while coefficient=1. | Consistent; — |
| `AnalyticAt.factorial_smul_mvTaylorCoeff_of_unique` (172) | Singleton index, f=z², α=2 | 2!·1=2=f″(0); in characteristic 2, 0=0. | Consistent; — |
| `AnalyticAt.mvTaylorCoeff_smul` (179) | f=1+z, g=1+2z, α=1 | Actual coefficient=3; convolution=1·2+1·1=3. | Consistent; — |
| `AnalyticAt.exists_hasSum_mvTaylorCoeff` (187) | f(z)=1/(1−z), center 0, ρ=1/2 | Weighted norm sum=2; evaluation at y=1/4 is ∑(1/4)ʲ=4/3=f(1/4). | Consistent; — |
| `mvTaylorCoeff_eq_of_hasSum` (196) | Same local expansion, α=2 | Expansion coefficient=1; mvTaylorCoeff=1; altered coefficient 2 changes the z² term and violates the local equality. | Consistent; — |
| `ContinuousLinearMap.mvTaylorCoeff_comp_eq_zero` (205) | G(u,v)=u², A(z)=(z₀+z₁,z₁), k=1 | All degree-1 coefficients before and after=0; degree-2 mixed coefficient changes from 0 to 2. | Consistent total-degree law; — |
| `mvTaylorCoeff_prod_pow` (213) | Monomial z², σ=2 and 1 | LHS coefficients (1,0); Kronecker RHS (1,0). | Consistent; delete Check padding, R03. |
| `analyticAt_dslope_update` (219) | f=z², divided difference at ζ=1 | Off ζ: (z²−1)/(z−1)=z+1; at ζ: derivative=2, same continuous extension. | Consistent; — |
| `isLittleO_sub_pow_sub_one_of_le_analyticOrderAt` (232) | g=z², c=0,T=2 | ‖g(z)‖/‖z‖=‖z‖→0; T=0 is excluded by 1≤T. | Consistent; — |
| `Complex.norm_le_mul_div_pow_of_le_analyticOrderAt` (239) | g=z², ρ=2,M=4,w=1,T=2 | LHS=1; RHS=4(1/2)²=1. For T=0 the same RHS becomes 4. | Consistent; — |
| `HasFPowerSeriesOnBall.norm_mvCoeff_mul_pow_le` (250) | f=z₀z₁, R=2,M=4,ρ=1,α=(1,1) | LHS=1·1²=1≤4; constant 3 at ρ=0,α=0 gives 3·0⁰=3. | Consistent; — |
| `HasFPowerSeriesOnBall.norm_sub_partialSum_le` (257) | f=z²,R=2,M=4,z=1; T=0,2,3 | Remainders (1,1,0); bounds (4,3,2). | Consistent; — |
| `norm_le_of_mvTaylorCoeff_eq_zero` (267) | n=1,E={0},m=2,S=1,r=1,R=5,f=z²,M=25 | LHS at 1=1; RHS=25(15/5)²=225. At r=0 both sides=0. At m=0 bound=M. | Consistent; — |
| `mvTaylorCoeff_prod_pow_mul_cexp` (286) | f=z²exp(z), ξ=1,σ=1; ξ=0,σ=2 | First coefficient=3e; formula=e(1+2)=3e. At 0, order 2 coefficient=1; terms with j>τ vanish by choose(τ,j)=0. | Consistent; — |
| `eq_zero_of_sum_eval_mul_cexp` (293) | F=1−exp(z), frequencies 0,1 | F(0)=0 but F(1)=1−e≠0, so “all z” is essential. Empty frequency set concludes an empty family of equations. | Consistent; — |
| `NumberField.one_le_norm_embedding_mul_house_pow` (309) | K=ℚ, α=2; α=1/2 without integrality | First RHS=2·2⁰=2≥1; the nonintegral negative control gives 1/2<1. | Consistent; — |
| `NumberField.house_prod_le` (316) | Two indices both mapped to 2; empty set | Indexed product house=4 and RHS=2·2=4; empty sides=1. An image-set product would give 2. | Consistent; delete padding, R03. |
| `NumberField.one_le_pow_mul_norm_embedding_mul_pow` (322) | K=ℚ,δ=2,a=1,α=1/2,H=1 | RHS=2·(1/2)·1⁰=1; δ=0 would not admit the nonzero integral scaled element. | Consistent; — |
| `ThueSiegel.exists_ne_zero_int_vec_abs_le_of_pow_lt` (329) | One real form (1,1),X=1,ℓ=3,U=2 | Count 3<4; ξ=(1,−1) has norm 1 and sum 0≤2/3. X=0 would require 1<1. | Consistent; — |
| `ThueSiegel.exists_ne_zero_int_vec_norm_le_of_pow_le` (336) | Zero complex form on two unknowns,X=1,U=0,V=−1 | Count (√2/e+1)²≈2.3112≤4; ξ=(1,0) gives 0≤e. | Consistent; — |
| `NumberField.house.exists_const_ne_zero_int_vec_house_le` (347) | Matrix [1,1] and zero matrix, q=2,p=1,A=1 | Solutions (1,−1) and (1,0) have house 1≤2C; pinned exponent p/(q−p)=1. | Consistent; — |
| `exists_ne_zero_int_norm_sum_le` (362) | 1024 constant functions 1,n=1,N=1,U=log1024,V=6,R/r=e² | W≈13.9315; count 776.3436≤2048; ratio 7.3891≤10.1951. Coefficients (1,−1,0,…) give 0≤e⁻⁶≈0.002479. | Consistent; — |
| `extendExponent` (385) | d₀=1,n=3,τ=(2); d₀=0; d₀=2,n=1,τ=(0,7) | Extensions (2,0,0), zero vector, and (0). Last input loses 7; nonvanishing theorem explicitly excludes d₀>n. | Consistent body; improve Checks, R05. |
| `auxiliaryFunction` (390) | n=2,d₀=d₁=T=1,x=(0,1), one indicated coefficient | F(z)=z₀exp(z₁); at (2,0) value=2. At T=0 and coefficient 3, F=3. | Consistent; — |
| `growthBound` (397) | T=0,N=log3; also d₀=0,d₁=T=n=1,N=0,A=ρ=1 | Bounds respectively 3 and 2e; constant 3 attains first, single exp(z) gives e≤2e in second. | Consistent; — |
| `denominatorExponent` (401) | d₀=d₁=n=T=S₁=1,M=2; then T=M=0 | Exponent 1+2+1=4; second case 0. Omitting derivative term gives incorrect 2 instead of 4. | Consistent; improve Checks, R05. |
| `houseBound` (404) | All discrete parameters,δ,G=1,N=0; M=0,1,2 | H=4(M+2)2^M gives 8,24,64; T=M=0 gives 1. | Consistent; improve Checks, R05. |
| `liouvilleFactor` (411) | Same data,D=2; M=0,1,2 | Factors M^M H are 8,24,256; D=1,M=0 gives 1 using 0⁰=1. | Consistent; improve Checks, R05. |
| `Admissible` (418) | n=2,M=3,S₁=1; also N=0 or E(0)=0 | Floor exponent=1, not 1.5; N=0 fails 0<N and E(0)=0 fails 1≤E(0). | Consistent fields; improve Checks, R05. |
| `analyticOnNhd_auxiliaryFunction` (437) | Same F=z₀exp(z₁) above | Coordinate derivatives at (0,0) are (1,0); at (1,0) are (1,1), finite analytic expressions throughout. | Consistent; — |
| `norm_auxiliaryFunction_le` (443) | n=1,d₀=0,d₁=1,T=2,N=0,x=1,ρ=2 | Single term exp(2z) has value e⁴≈54.598; correct bound 3e⁴≈163.794. Wrong missing T gives 3e²≈22.167<54.598. | Consistent; — |
| `exists_eq_mvTaylorCoeff_auxiliaryFunction` (453) | K=ℚ,n=d₀=d₁=T=S₁=δ=G=1,N=0,x=0,y=1,F=z,s=1 | For σ=0, θ=1,a=2,H=8, scaled house 1≤8. For σ=1, θ=1,a=3,H=24, house 1≤24. | Consistent; — |
| `one_le_liouvilleFactor_mul_norm` (475) | Same arithmetic example,D=1,σ=0 or 1 | Nonzero coefficients both 1; factors both 1, giving 1≤1. | Consistent; — |
| `exists_mvTaylorCoeff_auxiliaryFunction_ne_zero` (496) | x=(1), p selecting the constant monomial; dependent x=(1,2) | First F=1 has coefficient 1 at 0. Second frequencies (2,0),(0,1) both equal 2; coefficients 1,−1 give F=0 and violate independence. | Consistent; — |
| `false_of_admissible` (503) | Total-degree threshold M₀=3,n=2; shear G=u² | Rectangle κ_i<floor(3/2)=1 contains only (0,0), degree 0<3. Shear creates mixed coefficient 2 at degree 2, never a lower-degree term. | Consistent proof conversion; — |
| `exists_admissible` (522) | n=1,d=2,D=1: c₃=1/144,K₁=3457,S₁=60 | At q=1,N=0; q=2,R/r=2<e. As q grows, count leading coefficients compare (2·9c₃/4)²=1/1024 with c₃/4=1/576, times q⁴(log q)². | Consistent eventual count; — |
| `SchneiderLang.exists_transcendental_of_linearIndependent` (533) | n=1,d₀=d₁=1,x=y=1; n=0 | Candidate outputs are y=1 and exp(1)=e; only latter is transcendental. For n=0 and d₁>0, x contains zero vectors so independence fails. | Consistent; — |
| `SchneiderLang.exists_transcendental_exp_of_span_eq_top` (548) | n=1,x=(1,√2),y=(log2) | Outputs 2 and exp(√2log2)=2^√2≈2.665144; first is algebraic, second supplies the conclusion. | Consistent; — |
| `SchneiderLang.exists_transcendental_exp_of_isAlgebraic_coord` (556) | n=d=1,x=y=1 | Algebraic first coordinate y=1; output exp1=e. The coordinate hypothesis prevents substituting y=log2. | Consistent; — |
| `transcendental_of_isAlgebraic_exp` (565) | x=log2; omitted nonzero condition x=0 | exp(x)=2 and x≈0.693147; x=0 would give algebraic exp0=1 and nontranscendental x=0. | Consistent; — |
| `transcendental_exp` (571) | a=1; negative control a=0 | exp1=e≈2.718282; exp0=1, explicitly excluded. | Consistent; — |
| `transcendental_log` (577) | u=2; u=0 or 1 | log2≈0.693147 is nonzero; total log0=0 and log1=0 fail the nonzero-log premise. | Consistent; — |
| `transcendental_exp_mul` (583) | x=2πi,b=√2; excluded x=0 | exp(x)=1; exp(bx)≈−0.858216+0.513288i. x=0 would yield 1. | Consistent; — |
| `GelfondSchneider.transcendental_cpow_of_isAlgebraic_of_irrational` (589) | α=2,β=√2; β=1/2 with α=4 | First power≈2.665144. Second power=2 and β is rational, excluded; α=0 gives 0 and is separately excluded. | Consistent; — |
| `exists_rat_eq_div_or_transcendental` (596) | x=log4,y=log2; x=log2,y=log3 | Quotients 2 and ≈0.630930; first realizes the rational alternative. y=0 would use junk division and is explicitly excluded. | Consistent; — |
| `Baker.eq_zero_of_isAlgebraic_sum_mul` (609) | K=ℚ(√2),basis(1,√2), l=(0,0) | Sum=0, both logs=0; embedding matrix determinant=−2√2, square=8≠0. | Consistent; — |
| `Baker.eq_zero_of_add_sum_mul_eq_zero` (617) | l=(log2,log4),β=(2,−1),β₀=0 | Relation sum=0 but β≠0; rational independence fails since log4=2log2. Empty family forces β₀=0. | Consistent; — |
| `Baker.eq_zero_of_add_sum_mul_eq_zero_of_linearIndepOn` (624) | Finite set singleton with l=log2 and zero coefficients | β₀+sum=0 and all coefficients on the set=0; coefficients off the set can be 7 without altering the conclusion. | Consistent finite-set scope; — |
| `Baker.add_sum_mul_ne_zero` (632) | All l=0,β₀=1 | Affine sum=1≠0. With β₀=0 the same sum=0, explaining the premise. | Consistent; — |
| `Baker.transcendental_sum_mul` (640) | Single l=log2,β=1; l=0 | Sum=log2≈0.693147≠0; zero-log sum=0 fails the nonzero-sum hypothesis. | Consistent; — |
| `Baker.transcendental_exp_add_sum_mul` (647) | Empty family,β₀=1; β₀=0 | Outputs exp1=e and exp0=1; the latter is excluded. | Consistent; — |
| `Baker.transcendental_prod_cpow` (655) | α=2,β=√2; pair α=(2,2),β=(√2,−√2) | First≈2.665144; paired product=1 and coefficient family (1,√2,−√2) is dependent. Empty product=1, excluded. | Consistent specialization; missing general form R01. |
| `entryBound` (669) | k=0,L=h=1 | At G=1, E=4; at G=2, E=4·2⁴=64. Missing outer G² would give 16 in the second case. | Consistent; improve Checks, R05. |
| `Admissible` (676) | k=0,L=h=D=G=C=1,p=3,r₀=2,S=R=0 | Count 4≤4, but final 16·3·2⁴·2=1536<1 is false. | Consistent rejection; improve Checks, R05. |
| `exists_admissible` (693) | k=0,X=2ᵗ, Kmax=21 | Count powers 2X²¹ versus X²²; S₀/h²=2²¹/X. Extrapolation exponents are 19+J versus 20+J; final 33 versus 41. | Consistent eventual domination; — |
| `Padic.one_le_abs_mul_norm_intCast` (707) | p=3,n=3 and n=−3 | Absolute integer value 3 times p-adic norm 1/3=1. At n=0 product=0, excluded. | Consistent; — |
| `PadicExp.le_radius_expSeries` (717) | p=2 and 3 | ρ₂=1/2; ρ₃=1/√3≈0.577350. At x=2 in ℚ₂, terms n=2ʲ have norm 1/2, so endpoint convergence fails. | Consistent lower radius, strict use; — |
| `PadicExp.exp_add` (722) | p=3,x=y=3 | Formal degree-two coefficient of exp(6t) is 18; in exp(3t)² it is 9/2+9+9/2=18. x=y=0 gives 1=1·1. | Consistent; — |
| `PadicExp.norm_exp_sub_one` (728) | p=3,x=3 or 0 | Leading term has norm 1/3 and all higher terms smaller; ‖exp3−1‖=1/3=‖3‖. At 0 both=0. | Consistent; — |
| `PadicExp.injOn_exp` (733) | p=3,x=3,y=6 | ‖x−y‖=1/3; exp6−exp3=exp3(exp3−1) has norm 1/3, hence unequal. | Consistent; — |
| `PowerSeries.hasSum_coeff_coe_mul_rescale_exp` (738) | Q=1+X,ψ=3,x=1 in ℚ₃ | Sum of product coefficients at 1 is 2exp3; RHS Q(1)exp3=2exp3. At x=0 both=1. | Consistent; — |
| `PowerSeries.norm_coeff_coe_mul_rescale_exp_mul_pow_le` (749) | Q=1,ψ=3,r=1,p=3;k=1,2 | Weighted coefficient norms 1/3 and ‖9/2‖₃=1/9, both≤1. For r=0 positive-degree weighted norms=0. | Consistent; — |
| `IsUltrametricDist.norm_le_one_of_isIntegral` (759) | Integral x=3; nonintegral x=1/3 in ℚ₃ | Norms 1/3≤1 and 3>1 respectively. | Consistent; — |
| `NumberField.one_le_pow_mul_norm_embedding_of_isUltrametricDist` (764) | K=ℚ,x=3,H=3,D=1; denominator case x=1/3,δ=3,a=1,H=1 | H^D‖x‖=3/3=1; wrong exponent D−1 gives 1/3. Denominator case RHS=1·3=3≥1; no δ factor occurs in the conclusion. | Consistent; — |
| `HasFPowerSeriesOnBall.norm_le_mul_div_pow_of_isUltrametricDist` (773) | f=z²,r=1,M=1,T=2,z=3 in ℚ₃ | LHS norm=1/9; RHS=1·(1/3)²=1/9. At z=0 both=0. | Consistent; — |
| `PowerSeries.norm_coeff_le_of_ofScalarsSum_iterate_derivative_eq_zero` (791) | f=(X−1)(X−2),A={1,2},S=1,r=3,M=9 over ℚ₃ | Coefficient norms (1,1/3,1), each≤9/3²=1; weighted norms at r=3 are (1,1,9)≤9. | Consistent; — |
| `PowerSeries.norm_ofScalarsSum_le_of_ofScalarsSum_iterate_derivative_eq_zero` (801) | Same f,z=0 | ‖f(0)‖=‖2‖₃=1; bound=9/3²=1. Empty A removes the exponent and gives bound M. | Consistent; — |
| `Polynomial.exists_iterate_derivative_eval_eq_ite_of_isUltrametricDist` (814) | Points 0,1,S=1,r=0,ϱ=1 over ℚ₃ | Interpolant W=1−X has values (1,0), coefficient norms≤1. Singleton at 0,s=2 requires X²/2; over ℚ₂ coefficient norm=2=‖1/2!‖. | Consistent; — |
| `Polynomial.expDerivFactor` (825) | c=2,P=X,m=0,1,3; also c=0,m=2,P=X³ | Results X,1+2X,12+8X; last result 6X. Zero ring gives the zero map. | Consistent; — |
| `Polynomial.expDerivFactor_eq_sum` (830) | c=2,P=X²,m=2 | Binomial sum 4X²+8X+2 equals (D+2)²X². In characteristic 2 both expressions=0. | Consistent; — |
| `Polynomial.natDegree_expDerivFactor_le` (836) | c=2,P=X²,m=2; P=0 | Degrees 2≤2; zero-polynomial natural degrees 0≤0. | Consistent; — |
| `Polynomial.norm_coeff_expDerivFactor_le` (842) | ℚ₃,c=3,P=X,m=1,B=1 | Polynomial 1+3X has coefficient norms 1 and 1/3; RHS max(1,1/3)·1=1. | Consistent; — |
| `PowerSeries.iterate_derivative_coe_mul_rescale_exp` (848) | Q=X,ψ=2,m=1 | Derivative of Xexp(2X)=(1+2X)exp(2X); constant coefficient 1=1, linear coefficient 4=4. | Consistent; — |
| `frequency` (861) | k=1,ℓ=(3,6),e=(2,3) | Frequency=2·3+3·6=24, norm₃=1/3; zero e gives 0. | Consistent body; improve Checks, R05. |
| `gammaCoeff` (866) | β=2,e_none=2,e_some=3 | Gamma=3+2·2=7; wrong minus sign gives −1; e_none=0 gives 3. | Consistent body; improve Checks, R05. |
| `zeroFrequency` (870) | β₀=5,e_none=2 | Zero-frequency scalar=10; if either factor is zero it is 0. | Consistent body; improve Checks, R05. |
| `derivativePoly` (874) | Same gamma/frequency data, d=2 | For m_none=1,m_some=0: 2X+10X². For m_none=0,m_some=1: 7·6X²=42X². | Consistent body; improve Checks, R05. |
| `derivativeSeries` (881) | k=0,L=1,P selects d=0,e=1,m=0 | Series=exp(ℓX), constant coefficient 1 and linear coefficient ℓ; P=0 gives the zero series. | Consistent body; improve Checks, R05. |
| `derivative_derivativeSeries` (888) | Same series with ℓ=β₀=3 | Derivative constant coefficient=3 on each side. If ℓ=3,β₀=5, sides would be 3 and 5, and hrel rejects this. | Consistent; — |
| `ofScalarsSum_derivativeSeries_natCast` (896) | p=3,ℓ=3,m=0,d=0,e=1,l=2 | Value exp6; RHS (exp3)²=exp6; l=0 gives 1=1. | Consistent; — |
| `inv_pow_le_norm_frequency_sub` (911) | p=3,K=ℚ,α=4,δ=1,G=4,L=1,e=0,e′=1 | Lower bound 1/8≤‖log₃4‖=1/3. With α=1/4,δ=4,G=1 it would read 1/2≤1/3; δ≤G excludes this. | Consistent; — |
| `false_of_admissible` (924) | Extrapolation S′=2,S_J=4; final dual coefficient test | For j<2, sum(m)+j≤3<4. For f=X+exp(3X), W=X−2X²/3+X³/9, the Hermite functional is 4−6+3=1=P(1,0). | Consistent order/factorial calculation; — |
| `PadicBaker.eq_zero_of_add_sum_mul_eq_zero` (951) | Empty family; singleton ℓ=1 outside the disc | Empty relation is β₀=0. Outside-disc exp1=0 is algebraic, −1+1·1=0 would violate the conclusion; ‖1‖=1≥ρ excludes it. | Consistent; — |
| `PadicBaker.transcendental_add_sum_mul` (960) | Singleton ℓ=log₃4,β=1,β₀=0 | Norm of the form=1/3≠0. All β=0 instead gives the algebraic β₀ and fails the nonzero-coefficient premise. | Consistent; — |
| `PadicBaker.transcendental_exp_prime` (969) | p=3 versus p=2 | ‖3‖=1/3<1/√3; ‖2‖=1/2=ρ₂. The strict-disc route admits 3 and excludes 2. | Consistent; — |
| `transcendental_e` (979) | e=exp1 | Input exponent 1≠0; output≈2.718282. Replacing exponent by 0 gives 1 and is excluded from Hermite–Lindemann. | Consistent headline; — |
| `transcendental_pi` (983) | π via x=πi | exp(πi)=−1, x≠0; multiplying transcendental x by −i gives π≈3.141593. | Consistent headline; — |
| `transcendental_exp_pi` (986) | expπ via (−1)^(−i) | Principal log(−1)=πi; (−i)(πi)=π, giving expπ≈23.140693. | Consistent branch normalization; — |
| `transcendental_two_cpow_sqrt_two` (989) | 2^√2 | Principal log2 is real; exp(√2log2)≈2.665144; √2 is algebraic and irrational. | Consistent headline; — |
| `transcendental_log_two` (992) | log2 | exp(log2)=2; log2≈0.693147≠0. | Consistent headline; — |
| `transcendental_log_two_div_log_three` (995) | log2/log3 | Approximation 0.630930; a rational a/b would give 2ᵇ=3ᵃ, impossible for nonzero integer exponents. | Consistent quotient alternative; — |
| `transcendental_pi_add_log_two` (999) | π+log2 | (−i)(πi)+log2=π+log2≈3.834740≠0, with algebraic coefficients and exponentials −1,2. | Consistent headline; — |

The declaration calculations above cover all 106 declarations. Additional README-only targets, source-proof steps and negative controls were evaluated as follows.

| README statement/convention | Instances tried | Values on the two sides | Result/change |
|---|---|---|---|
| 0.1 products of summable families | Two finite families (1,2), (3,4); empty outer family; empty inner family | Sum of products=3+4+6+8=21=(1+2)(3+4); empty outer product=1; an empty inner sum gives 0 on both sides | Consistent. |
| 0.2 sums of power series | g_j(z)=zʲ/2ʲ, radius 1 | Coefficient norm double sum=2; at z=1/2 both sum descriptions give 4/3 | Consistent; completeness used where sums are formed. |
| 0.3 zero/additive coefficient API | Mixed coefficient of p₂(u,v)=u₀v₁ | Zero series gives 0; p+p gives 2=1+1 | Consistent. |
| 0.5 repeated coordinate division | f(z)=z² at 0, two divisions | First quotient z, second 1; derivatives of order <2 at 0 are 0, while order 2 is 2 | Consistent factorial convention. |
| 1.1 coordinate maximum modulus | f=z₀z₁ on radius-2 polydisc | Interior norm≤4; on each coordinate boundary the supremum remains 4 | Consistent. |
| 1.2 coordinate-polynomial division | f=(z−1)²,g=1,r=1,R=3,M=16 | Quotient 1≤16/(3−1)²=4; at z=−1, f=4≤16(2/(3−1))²=16. Single power z² with M=9 gives quotient bound 1 and small-disc bound 1 | Consistent; r<R guarantees nonzero denominators. |
| 1.4 homogeneous bound and Fourier coefficient extraction | f=z²,R=2,M=4,y=1; roots of unity of orders 2 and 3 | Homogeneous value 1≤4. Averaging z² over {1,−1} gives 1, incorrectly aliasing degree 2 to 0; over cube roots it gives (1+ω²+ω)/3=0 | k+1 sampling removes the alias. |
| 1.5 second, multi-index inequality | f=z²,T=2,r=1,R=2,M=4 | Value 1; low-degree sum=0, remainder bound=3 | Consistent. |
| 1.6 finer Newton constant | n=m=S=r=1,R=5,f=z,M=5 | K=1+1=2; fine bound=1·(4/4)·2·5=10; coarser bound=15; actual value at 1=1 | Consistent constants in this instance. |
| 2.2 exponential-monomial growth | z²exp(z),z=1,T=2 | Actual e; polynomial bound (1+1)²e=4e | Consistent. |
| 3.2 size operations | δ=2,a=b=1,α=β=1/2,H=H′=1 | Scaled product=1≤1; scaled sum=2≤2; scaled square=1≤1; exponent c=2 gives 2≤2 | Correct denominator powers. |
| 3.3 finite algebraic data | S={√2,1/2} | Field ℚ(√2) has degree 2; δ=2 clears both, houses 2√2 and 1 are ≤G=3; δ≤G | Finite data gives an actual field and common denominator. |
| 5.2 exponential denominator factor | One exponential factor with t=s=1; all dimensions and T=1 | Exponential product is ε¹, needing one δ; with monomial degree 1 and derivative order 2, total a=1+2+1=4 | Confirms the three contributions. |
| 5.5/5.6 a concrete admissible parameter model | n=d₀=d₁=D=δ=G=1,A=Ay=B=0,q=10⁶; c₃=1/144,K₁=3457,S₁=60,r=3 | U≈9.59410·10¹⁰,N=U/4,S₀=289268151; count 1.86395·10²³≤3.31369·10²³; log growth≈1.49142·10⁷<U; maximal initial log Liouville≈5.63577·10⁹<U; worst extrapolation log≤−1.39452·10¹¹<0 | The parameter structure is not vacuous. M log M is increasing for M≥1, so the last inequality holds for all M≥S₀. This numerical model does not claim that a basis y has Ay=0. |
| Source §4.6 coordinate change | P(u)=[u(u−1)(u−2)]²,F(u,v)=P(u),y₁=(1,0),y₂=(1,1),S₁=2 | All original rectangular derivatives σ_i<2 vanish at the four grid points; transformed mixed derivative at 0 is P″(0)=8, not 0 | Confirms the source gap and the need for the roadmap's total-degree repair. |
| 7.1 trace/embedding matrix | Basis (1,√2) | Embedding matrix rows (1,√2),(1,−√2); determinant²=8; trace Gram matrix diag(2,4) has determinant 8 | Both required invertibilities hold with the same normalization. |
| 7.3 branch-independent product, missing headline | l=2πi,β=√2 | exp(l)=1; exp(βl)≈−0.858216+0.513288i, whereas principal 1^β=1 | R01; repaired signature admits this instance. |
| 8.1 exponential outside its disc | x=1 over ℂ_p; x=2,p=2 | Norms of 1/n! do not tend to 0; total tsum defining exp1 is 0. At n=2ʲ for exp2 in ℚ₂, term norms stay 1/2 | The disc restriction is essential, including the boundary. |
| 8.3 derivative/root-multiplicity hypothesis | f=X³ in characteristic 3 | f′=f″=…=0, yet multiplicity at 0 is only 3, not arbitrary S | CharZero is present; no characteristic-p overclaim. |
| 8.7(a) integrality | All coefficients integral and one constant coefficient 1; then replace it by 1/2 with δ=1 | Value 1 is integral; value 1/2 is not, and no power of δ=1 changes it | The required integrality premise is present. |
| 8.7(a) house bound for one term | k=0,L=l=1,m=0,G=4,H_P=δ=1,α=1,P selects d=e=0 | A_m(l)=1; stated full sum bound=(2)²·1·2·1·4=32 | Consistent; overcounting is harmless. |
| 8.7(b) equation count | k=0,L=h=1 | Unknowns=(1+1)²=4; equations=(1²+1)·1=2; twice equations=4 | No missing factor in the count. |
| 8.7(c) denominator control | p=3,α=1/4,δ=4,G=1 | Both relevant norms are 1/3, but proposed lower bound would be 1/2; hypothesis δ≤G reads 4≤1 and fails | README negative control is correct. |
| 8.8/8.9 a concrete admissible model | k=0,D=B=G=C=lmin=1,p=3,r₀=2,X=2²²,Kmax=21 | Log count 320.927<335.483; S₀/h²=1/2,R₀/h=1,2S(J+1)/S(J)=1. Across all 21 steps the largest ratio log(LHS)/log(RHS)≈5.321·10⁻⁴⁴; final logs 3.462·10¹⁴⁵<2.344·10²⁷¹ | Positive parameter model; every finite step evaluated, with ample separation. |
| 8.10 normalization of a nonzero coefficient | Relation 2ℓ₀+3ℓ₁+5=0 | Dividing by 2 gives ℓ₀=−5/2−(3/2)ℓ₁; both signs are negative | Matches the relation consumed by the auxiliary system and the author-source proof. |

The geometry is finite-dimensional where required; a basis hypothesis prevents the zero-space and rank-deficient counterexamples to the criterion. Ring-valued polynomial identities retain zero-ring and positive-characteristic inputs, while the derivative-to-root and factorial-denominator arguments explicitly require characteristic zero. There is no finite-field/DVR identification, nonabelian-group assertion, scheme finiteness statement, or hidden universe comparison in these targets to which the unrelated adversarial classes would apply.

## Not verifiable

- **Baker75**, *Transcendental Number Theory*, Chapter 2 Theorems 2.1–2.4, Lemmas 1–7 and proof §5: the sources service reached the Cambridge DOI/landing page but no legally readable full text. Publisher contents and search results are not a theorem check. W00 independently supports the complex conclusions; the Baker-specific numbering and the Chapter 2 proof adaptation are not certified.
- **Brumer67**, *On the units of algebraic number fields*, pp. 121–124: the DOI route reached a Wiley 403 response. Cambridge metadata identifies the paper but supplies no readable proof used here. The original theorem's exact locator was not verified.
- **BM80**, *Linear forms in elliptic integrals*, pp. 283–288: Springer DOI resolves to paywalled content; the service classified it uncertified. No legal full text was located. W00 supplies the reproduced argument, but that is not verification of BM80's own pages.
- **Hua82**, §17.9: publisher copy unavailable without payment; uncertified. The named one-variable formalization's attribution to this section is not checked against the book.
- **Lang66**, criterion background, and **BG06**, Siegel-lemma background: the sources-service book/DOI searches found no readable text; BG06 reached Cambridge's landing page. The README supplies no precise internal locator for either background citation. They are not needed to replace the pinned proof routes checked here.
- **KaratarakisBaker**, the complex author formalization at commit 1d51891b5b: the service could not extract the requested CriterionMain file. The README's full file map, claimed sorry-free closure, axiom set and RCLike/general-field comparison are not independently certified. The separately readable p-adic Main file establishes only the two signatures described above; its complete dependency build and provenance-map claims remain unchecked.
- The named Zhao and Karatarakis Mathlib submissions were not built/read in full. Their promised future adoption is not treated as a dependency; the actual pin's declarations were checked. Neither outside code nor future Mathlib merges were used to assume the missing proofs.
- No exact 15-target seed list was supplied. The explicit source table states the sample actually reviewed instead of certifying an unrecoverable random selection.

All missing-text attempts are retained in the scratch reference-request file; the report is complete and is not parked awaiting them. Uncertified/paywalled entries are not re-requested under new keys. No source manifest was edited.

## Source issues

- **Misprint** in W00 at Lemma 4.13 proof, printed p. 134: the source says the auxiliary one-variable function evaluated at the vector z₀ equals g(1) in modulus; it should be the remainder G evaluated at z₀ equals g(1) in modulus; affects the proof.
- **Misprint** in W00 at §4.6 step 4, printed p. 139: the source says (4.14) is the upper bound and (4.16) the lower bound; it should be (4.14) is the lower bound and (4.16) the upper bound; affects nothing.
- **Gap** in W00 at §4.6 step 5, printed p. 140: the source says the rectangular vanishing order can be used after the change to the y-basis; it should be total-degree vanishing transported first, with the coordinate order reduced by dimension before Proposition 4.7; affects the proof.

