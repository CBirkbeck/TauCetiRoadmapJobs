# Review of PadicExtensionFamilies (pull request #1713 at c5724d6)

**Verdict:** needs changes

## R01 (P1) — The non-Galois Herbrand supplier is not on main

**Location:** `TauCetiRoadmap/PadicExtensionFamilies/README.md:166`, “Layer 4a”.

**Claim:** LocalFieldsRamification §§4a.1–4a.2 supply the absolute upper filtration, non-Galois Herbrand functions, tower law, open-subgroup identity and integral formula used throughout Layer 2.

**Witness:** `Completed/LocalFieldsRamification/README.md:1154` begins Layer 4; the main roadmap ends without Layer 4a. The cited material occurs only in a proposed revision of that existing roadmap, not its main version or the pins.

**Repair:** Give these prerequisites an admissible owner before Layer 2: either explicit targets here, or precise declared supplier gaps with matching plan entries. A revision of an existing roadmap cannot supply the missing contract. Test the resulting contract on the non-Galois quartic: the closure's lower jumps `3,7` must map to the quartic's rams `2,4`. The mechanical dependency check does not detect this semantic absence.

## R02 (P1) — Eisenstein does not imply monic

**Location:** `TauCetiRoadmap/PadicExtensionFamilies/Suggested.lean:133`, `ramificationPolynomial_monic`; also README §1.1.

**Claim:** `φ.IsEisensteinAt 𝓂[K]` and `α ≠ 0` imply that `α⁻ⁿ φ(αX+α)` is monic.

**Witness:** Over `ℤ₂`, take `φ=3X+6`, `α=−2`, `K=L=ℚ₂`. The polynomial is Eisenstein, even has root `α`, but its ramification polynomial is `3X`, with leading coefficient `3 ≠ 1`.

**Repair:** Require `φ.Monic` explicitly in this theorem and the corresponding standing hypotheses, or normalize by the leading coefficient. Mathlib's predicate at `Mathlib/RingTheory/Polynomial/Eisenstein/Basic.lean:56` requires a leading coefficient outside the ideal, not equal to one. Dividing this example by `3` gives `X+2` and ramification polynomial `X`.

## R03 (P1) — Root differences over K are not the transported invariant

**Location:** `TauCetiRoadmap/PadicExtensionFamilies/Suggested.lean:171`; `README.md:581` in the same folder.

**Claim:** All nonidentity `K`-embeddings applied to any uniformizer give a uniformizer-independent multiset for general `L/K`.

**Witness:** Let `L=M=ℚ₂(ζ₃)`, unramified over `K=ℚ₂`. Uniformizers `2` and `2ζ₃` give multisets `{-1}` and `{0}`: the first difference is zero, whereas the second has valuation one.

**Repair:** Require total ramification for this theorem. For general `L/K`, form the root-difference invariant over `Lᵘʳ`, as the polygon transport already does, and require a splitting field there. In this unramified example the corrected multiset is empty for both uniformizers. The `−1` comes from the actual `addValInt 0 = 0` branch, so this is also a total-function counterexample.

## R04 (P1) — The root-count theorem does not require all conjugates

**Location:** `TauCetiRoadmap/PadicExtensionFamilies/Suggested.lean:179`, `card_filter_conjugateBreaks_eq_zero`.

**Claim:** Exactly `n−p^w` embedding differences have value zero, with no splitting or Galois hypothesis on `M`.

**Witness:** Take `K=ℚ₅`, `L=M=ℚ₅(∛5)`. There is only the identity embedding into `L`, so the left side is `0`; the right side is `3−5⁰=2`.

**Repair:** Require a finite Galois splitting extension `M/K` containing `L`, with the compatible valuation tower. In the splitting field there are three embeddings and the two nonidentity differences both have value zero. The elaborated signature confirms that no such hypothesis is present.

## R05 (P1) — The right limit of a decreasing filtration uses a union

**Location:** `TauCetiRoadmap/PadicExtensionFamilies/README.md:236`, `G^{(s+)} := ⋂_{ε > 0} G^{(s+ε)}`.

**Claim:** This intersection defines the group immediately after the break and hence its multiplicity.

**Witness:** For `ℚ₂(ζ₈)/ℚ₂`, the groups at Artin slope `2` and immediately after have orders `4` and `2`. The stated intersection includes arbitrarily large parameters and has order `1`.

**Repair:** Use the union/supremum over positive ε, or the eventual value for sufficiently small positive ε. The corrected multiplicity at `2` is `log₂(4/2)=1`; the printed definition gives `2` and makes the total multiplicity `3` rather than `w=2`.

## R06 (P1) — Residual-polynomial transport runs in the opposite order

**Location:** `TauCetiRoadmap/PadicExtensionFamilies/README.md:554`, the recursion for `γ`.

**Claim:** The displayed orbit is invariant under a change of uniformizer, for the right-to-left segment order fixed in §1.3.

**Witness:** Over the unramified quadratic `K/ℚ₂`, use `α⁴=2`, and `δ∈𝔽₄ˣ` of order three. The residual pair `(z²+1,z+1)` becomes `(z²+δ²,δ²z+δ)` under `α↦uα`, `ū=δ`.

**Repair:** In this segment order use `γ₁=δ^(−h₁ deg A₁)` and `γᵢ=γᵢ₋₁ δ^(−hᵢ deg Aᵢ)`, or reverse both the list and recursion. Here the left endpoint heights are `4,8`, so the factors must be `δ⁻⁴,δ⁻⁸`. The printed factors are reversed: every second polynomial in its orbit is monic, whereas the actual transformed second polynomial has leading coefficient `δ²`. The corrected recursion gives exactly the displayed transformed pair.

## R07 (P1) — The proposed Miki decomposition does not determine jump levels

**Location:** `TauCetiRoadmap/PadicExtensionFamilies/README.md:927`; `Suggested.lean:395`.

**Claim:** The product identity and separate factor conditions determine the nontrivial levels, and filling the gaps gives a strictly increasing list.

**Witness:** Let `π⁴+4π³+6π²+6π+2=0`, `a=1+π`, `b=1+π⁷`, `c=(1+2π)⁻¹`. Both `(a,1,c)` and `(a,b,cb⁻²)` satisfy the stated conditions for `ζ₂=−1`, with levels `(1,5)` and `(1,7,5)`.

**Repair:** Require principal-unit factors and restore the weighted ordering condition and the hypotheses of the actual source, then specify the precise conversion to the intended jump set. Here `v(2)=4`, `r=2`, `a⁴=−1−2π`, `v(c−1)=5`, and `v(b²−1)=11`, so both products are `−1`. All nonzero levels are odd and below `8`; the second list is not increasing. Miki Lemma 17, printed p.111 (`miki-1981 line 524`), also requires increasing weighted levels; the second tuple fails `5>2·7`. Uniqueness additionally assumes the decomposed element is not a p-th power (`miki-1981 line 532`); the invariant on p.112 uses the highest available p-power root of unity. Merely adding ordering while retaining an arbitrary primitive `ζ_p` does not justify the quoted uniqueness theorem. Preserve the two tuples as a negative-control Check.

## R08 (P1) — Nonadmissible discriminant boxes overlap

**Location:** `TauCetiRoadmap/PadicExtensionFamilies/README.md:977`, the box definition and its disjointness/exact-discriminant claims.

**Claim:** Boxes for distinct `j` are disjoint and every member has height `j`.

**Witness:** For `K=ℚ₂`, `n=2`, `φ=X²+2X+2` lies in both printed boxes `j=0` and `j=1`. In both cases the coefficients meet the stated bounds; its actual height is `1`.

**Repair:** Define the box to be empty when `j` is not Ore-admissible, or restrict every box theorem and its measure formula to admissible `j`. The repaired `j=0` box is empty and the `j=1` box still contains this polynomial. The missing restriction is not supplied by §5.2's standing hypotheses.

## R09 (P1) — The total count is not a finite sum in equal characteristic

**Location:** `TauCetiRoadmap/PadicExtensionFamilies/README.md:1026`, “a finite sum”.

**Claim:** The total number of totally ramified extensions is a finite sum under the general local-field hypotheses of Layer 5.

**Witness:** Over `𝔽₂((t))`, the separable Eisenstein polynomials `X²+t^mX+t`, `m≥1`, have different exponent `2m` and height `2m−1`. Thus infinitely many distinct discriminant strata are nonempty.

**Repair:** State the general decomposition as a countable/cardinal or `ℝ≥0∞` sum; state finiteness exactly when `char K=0` or `p∤n`, using MassFormula's finiteness dichotomy. The example yields heights `1,3,5,…`; bounded-discriminant finiteness remains valid. This repair retains the promised equal-characteristic theory.

## R10 (P1) — An arithmetic ram need not come from a root of a unit

**Location:** `TauCetiRoadmap/PadicExtensionFamilies/README.md:1067`, the explanation of an arithmetic ram.

**Claim:** An arithmetic ram is a degree-p step generated by a p-th root of a unit at the top level.

**Witness:** `ℚ₂(√2)/ℚ₂` has the arithmetic ram `2=pe_K/(p−1)`. Its quadratic Kummer class has odd valuation, so it cannot be represented by a unit; `√5`, from the top-level unit `1+4`, instead gives an unramified extension.

**Repair:** Delete this identification and justify the arithmetic case from the exact coefficient/different bound, specifying any additional hypotheses of a Kummer description. Use `X²−2` as the extremal example: height `2`, small ram `1=e_K`; the top-level unit example has height `0`.

## R11 (P1) — The wild exponent is additive in towers

**Location:** `TauCetiRoadmap/PadicExtensionFamilies/README.md:356`, “multiplicativity of both”.

**Claim:** Both `w=v_p(e)` and `ε=e/p^w` multiply in a tower.

**Witness:** In `ℚ₂ ⊂ ℚ₂(√2) ⊂ ℚ₂(∜2)`, the two relative wild exponents are `1,1`, while the total exponent is `2`, not `1·1`.

**Repair:** State `w(M/K)=w(M/L)+w(L/K)` and `ε(M/K)=ε(M/L)ε(L/K)`. The witness then gives `2=1+1` and `1=1·1`.

## R12 (P1) — The strict global bound fails for the empty product

**Location:** `TauCetiRoadmap/PadicExtensionFamilies/README.md:1303`, the strict upper bound for the Galois root discriminant.

**Claim:** The strict product inequality holds for every number field.

**Witness:** For `F=ℚ`, the discriminant support is empty, the Galois root discriminant is `1`, and the displayed inequality is `1<1`.

**Repair:** State a non-strict bound for every number field and the strict version when the ramified-prime support is nonempty. Alternatively impose `[F:ℚ]>1` and cite the discriminant lower bound. The repaired cases read `1≤1` for `ℚ` and `√5<5` for `ℚ(√5)`.

## R13 (P1) — A worked Check mixes Artin and Swan slopes

**Location:** `TauCetiRoadmap/PadicExtensionFamilies/README.md:1395`, the §6.1/§6.2 Check assigning `[2,3]` to `ℚ₂(ζ₈)`.

**Claim:** That Herbrand invariant has rams `(1,3)`.

**Witness:** The roadmap's own formulas applied to Swan `[2,3]` give means `[1,2]`, rams `[2,4]`, height `8`, and discriminant exponent `11`; `ℚ₂(ζ₈)` has discriminant exponent `8`.

**Repair:** Replace this invariant by Swan `[1,2]`. It gives means `[1/2,5/4]`, rams `[1,3]`, height `5`, and exponent `8`, agreeing with §6.1 and the Lean example. Keep Artin `[2,3]` only in the Artin column.

## R14 (P1) — The supplied build gate fails on a non-sorry warning

**Location:** `TauCetiRoadmap/PadicExtensionFamilies/Suggested.lean:1`.

**Claim:** The acceptance file must build with `sorry` as its only warning.

**Witness:** The worker's gate reports `build=1 FAIL`: the `Mathlib` import requires the module system. The targeted build reproduced that warning, although Lean returned exit code zero and elaborated the file.

**Repair:** Add the module declaration required by this pin. A scratch copy prefixed with `module` elaborated successfully with only the 27 expected `sorry` warnings. This is a gate failure, not a claimed Lean type error. Rerun the full gate after repair.

## R15 (P2) — The acceptance file omits the actual counting headlines

**Location:** `TauCetiRoadmap/PadicExtensionFamilies/Suggested.lean:421`, `:442`, `:601`; README §§5.1, 5.3, 6.7.

**Claim:** The file states Ore's realizability theorem, Krasner's refined count, and Monge's class count against the pinned APIs.

**Witness:** `IsOreAdmissible` is only a predicate; `sum_krasnerClosedForm_div_pow` is a finite arithmetic identity; `mongeCount_values` asserts six numbers. None asserts existence or counts any extensions or isomorphism classes.

**Repair:** State the actual realizability and counting results on native polynomials or finite intermediate fields of `SeparableClosure K`, with a real representative-set predicate using `AlgEquiv`. Include existence of representatives and their cardinality, so the count cannot be vacuous. These carriers exist at the pins; no polygon is needed to state these results. The quadratic acceptance test must count six ramified `ℚ₂` classes and fourteen over the unramified quadratic base, not merely evaluate a numeric function. A genuinely unavailable headline must instead be named with its precise missing carrier in the module docstring.

## R16 (P2) — Monge's theorem is narrowed to ℚ_p

**Location:** `TauCetiRoadmap/PadicExtensionFamilies/README.md:1202`.

**Claim:** The general library's class-count theorem is provided only for `K=ℚ_p`.

**Witness:** Monge's Theorem 1, preprint p.4 (`monge-count line 208`), counts extensions over arbitrary finite `K/ℚ_p`, using its absolute degree, residue degree and cyclotomic extension invariants.

**Repair:** State that general theorem, with `n₀`, `f₀`, `e(i)`, `f(i)` and their hypotheses; make the printed `ℚ_p` formula a specialization. The need is visible already for ramified quadratic classes: the counts over `ℚ₂` and its unramified quadratic extension are `6` and `14`, despite the same residue characteristic `2`.

## R17 (P2) — The completeness criterion unnecessarily excludes equal characteristic

**Location:** `TauCetiRoadmap/PadicExtensionFamilies/README.md:1225`, `:1236`.

**Claim:** The mass-one criterion is restricted to characteristic zero because finite complete lists do not exist in the wild equal-characteristic case.

**Witness:** Over `𝔽₃((t))`, degree-two totally ramified extensions are the two tame quadratic classes. Both have height `0` and two automorphisms, giving mass `1/2+1/2=1` and a finite complete list.

**Repair:** State the finite-set equivalence for separable totally ramified extensions of every local field; positivity and Serre's convergent mass formula prove it uniformly. Separately state when a finite complete list exists: `char K=0` or `p∤n`. The tame example is retained, while over `𝔽₂((t))`, `n=2`, neither side of the finite-list equivalence can hold.

## R18 (P2) — Existing canonical-tower and finiteness targets are planned again

**Location:** `TauCetiRoadmap/PadicExtensionFamilies/README.md:364` and `:1015`.

**Claim:** The roadmap will prove maximal-unramified factorization, Eisenstein uniformizer generation, and mixed-characteristic finiteness again.

**Witness:** At the pin, `Unramified/Factorization.lean:124,144` supplies total ramification and uniqueness; `Eisenstein/TotallyRamified.lean:116,160` supplies Eisenstein generation. `TauCetiRoadmap/MassFormula/README.md:356` already owns the full finiteness dichotomy.

**Repair:** Move these results into exact supplier contracts and remove them as new targets. Keep genuinely new adapters only with their precise difference stated, and retain the discriminant-refined count and bounded-discriminant finiteness here. For an unramified quadratic followed by a ramified quadratic, the imported tower still gives degrees `2,2`, total degree `4`, and a degree-two relative Eisenstein polynomial; no replacement theory is needed.

## R19 (P3) — Boundary theorems and one-tactic API are padding

**Location:** `TauCetiRoadmap/PadicExtensionFamilies/Suggested.lean:70`, `:139`, `:601`, `:657`.

**Claim:** These belong in the headline acceptance test.

**Witness:** Line 70 is already one `exact Nat.div_mul_cancel pow_padicValNat_dvd`; line 139 closes by one `simpa` using polynomial evaluation and its root hypothesis. Line 601 computes six values; line 657 is the rational-field boundary case.

**Repair:** Delete them from `Suggested.lean`; keep the mathematical statements and numerical Checks in the README. The line-139 scratch probe succeeded without a `sorry` at that declaration. Its identity at `φ=X+2`, `α=−2` is simply `ρ(0)=0`. Do not replace these admissions by proofs in the acceptance file.

## R20 (P3) — Definitions are retained without a headline that uses them

**Location:** `TauCetiRoadmap/PadicExtensionFamilies/Suggested.lean:228`, `:287`, `:321`, `:328`, `:559`.

**Claim:** The file keeps only the simple definitions needed to state headline results.

**Witness:** `associatedInertiaOf`, `SlopeContent`, `IsGaloisSplittingModel`, `labelPrefix` and `IsCompatible` occur in no retained theorem's statement; even `labelPrefix_bounds` expands the individual invariants instead of using `labelPrefix`.

**Repair:** Delete unused definitions from `Suggested.lean`, leaving their specifications in the README; retain a definition only if a genuine headline uses it. Delete the check-only constructor `HerbrandInvariant.ofDyadicZeta8` if its supporting API block is removed. A free record such as `SlopeContent` admits tame degree `0` and arbitrary slopes, and currently no acceptance theorem relates it to a field.

## R21 (P3) — Repair the source locators and Miki bibliography

**Location:** `TauCetiRoadmap/PadicExtensionFamilies/README.md:931`, `:970`, `:994`, `:1275`, `:1493`.

**Claim:** The listed locators identify the exact supporting statements.

**Witness:** The Crelle 328 paper is *On the ramification numbers of cyclic p-extensions over local fields* (`miki-1981 line 31`). Pagano's Proposition 1.3 concerns presentations, not the claimed uniqueness (`pagano line 196`).

**Repair:** Cite Miki Lemma 17, pp.111–112, with its actual hypotheses; distinguish it from Pagano Theorems 1.4–1.5, preprint p.6. Cite the version read: Pauli–Roblot Proposition 3.1, p.3, and Theorem 6.1, p.7, rather than an uncertified §2 locator. NumberFieldArithmetic's discriminant tower law is §4.2, not §5.10. Supply exact locators for §§0.3, 0.5, 1.5 and the family mass/fibre-count claims, which currently have only broad references or none. Do not claim published theorem numbering has been verified from a differently numbered preprint. The corrected Miki locator exposes, rather than hides, R07.

## R22 (P3) — Restore the required definition APIs and discriminating Checks

**Location:** `TauCetiRoadmap/PadicExtensionFamilies/README.md:352`, `:394`, `:554`, `:1085`.

**Claim:** Every definition has its API and at least three discriminating Checks, and each layer has local examples and dependencies.

**Witness:** The discriminant square-class/root-field definitions in §0.4 have no three-Check suite; §1.4 lacks one too. The purported varying-invariant examples compare different families, not two members of one family.

**Repair:** Add per-definition API bullets and three actual Checks, including wrong-model controls. For residual orbits include R06; for square classes compare a square discriminant, a nonsquare, and a basis change by determinant `2` giving factor `4`. Supply two members of the same family before claiming a particular invariant varies there. Add the required Summary, Conventions, Exact supplier contracts, How to read the build, per-layer Examples/Dependencies and Downstream consumers sections; keep dependencies next to the individual targets. Also move §6.2's existence conclusion after the generic-polynomial theorem it invokes, separating it from the earlier definition/necessity result.

## R23 (P3) — README names claim Lean declarations that are absent

**Location:** `TauCetiRoadmap/PadicExtensionFamilies/README.md:396`, `:489`, `:631`, `:1077`; `Suggested.lean:11`.

**Claim:** Backticked own declaration names in the README correspond to declarations in the acceptance file, and the docstring distinguishes unavailable headlines by missing carrier.

**Witness:** `discriminantClass`, `discriminantRootField`, `ramificationPolygon`, `IsLowerBreak` and `family` are not declared in `Suggested.lean`. Its opening instead inventories API and numerical checks and does not identify each unavailable headline's missing carrier.

**Repair:** Write README-only APIs as prose, reserving declaration-name claims for the actual acceptance file. Rewrite the docstring around the headline matrix below, deleting process commentary about closed checks and a future pin change. Do not add placeholder definitions to make the names match. The resulting file should still have no declaration of a family carrier until a retained headline needs a genuine definition of it.

## R24 (P3) — The source manifest is absent

**Location:** `TauCetiRoadmap/PadicExtensionFamilies/README.md:1451`, References; folder inventory.

**Claim:** The roadmap's citations have the required source/version/access records.

**Witness:** The folder contains only `README.md` and `Suggested.lean`; there is no `sources.toml`. Several cited published theorem numbers differ from the legal preprints actually available.

**Repair:** Add the prescribed manifest with one stable key per work, precise locators and version notes, and truthful fetched/uncertified status. Reuse the existing request keys. Do not mark a nine-line CAPTCHA response as a verified knowl. The review leaves the PR unchanged and records unresolved texts separately.

## Verified sound

The whole README and all 67 named Lean declarations were read. The full adversarial pass computed 151 rows. This shortened report retains 100 rows (16 selected Lean checks and 84 prose/convention checks), covering the sampled targets, headlines and finding witnesses; the source table covers all 15 seeded targets. The head matches `c5724d649f2c21ca3805d6c646b5e25430217ee3`; the diff outside this roadmap is empty, and the worktree was left unchanged. No `set_option`, sorry-defined data, admitted example, computational procedure or copied source passage was found. The new polygon-to-break dictionary and discriminant-refined counting scope are not a wholesale re-plan of an existing roadmap; the specific duplication is R18.

The targeted build and direct `lake env lean` elaboration succeed as Lean commands, but the worker's warning-sensitive gate fails as described in R14. The 27 sorried theorem declarations were individually tried with a single `simp` tactic on a copy; none closed by that tactic alone. A separate one-tactic evaluation probe closes `ramificationPolynomial_eval_zero`. The other padding findings follow directly from their statements and the existing one-lemma proof. All 67 `#check @name` signatures were elaborated and compared with the README.

The nine automatically flagged binder losses do not constitute nine independent defects. `wildExponent`, `tameRamificationIndex`, their product identity, `ramificationPolynomial`, `residualPolynomial`, `embeddingSubgroup`, and the auxiliary inseparability definition have meaningful broader raw definitions. Theorems about them still need the advertised field hypotheses. `galoisMeanSlope` retains `ValuativeExtension`, which supplies finiteness. `conjugateBreaks` really does permit the examples in R03–R04; those missing semantic hypotheses are defects. No PR declaration was changed.

Mechanical supplier-order output:

```text
depcheck: 204 roadmaps, 1526 edges, 0 problem(s)
```

There is no `UPWARD`, `CYCLE` or `moved:` line. Every supplier paragraph and every `Rests on` dependency was read. Object searches through `roadmaps grep/show`, main, supplied open heads, board packages and pins covered polygons/residuals, root differences, non-Galois Herbrand theory, inseparability indices, jump sets, families/masses, Krasner/Monge counts and Galois root discriminants. No other readable roadmap declared this namespace. Knowl identifiers are source names, not missing Lean declarations.

Reference shapes read: MassFormula, NewtonPolygons, Completed/LocalFieldsRamification. Resolved suppliers:

| Supplier and exact location | Object checked and result |
| --- | --- |
| `Completed/LocalFieldsRamification/README.md`, Layers 0–4; Layer 4 at line 1154 | Valuation, finite-intermediate-field structures, units, unramified part, Eisenstein generation and finite Galois ramification. No §4a: R01. |
| `TauCetiRoadmap/NewtonPolygons/README.md:211`, `:320`, `:512`, `:667`, `:870`, `:892` | §§0.1, 0.6, 2.1, 3.3, 6.1, 6.2: convex envelope, reconstruction, polynomial polygon, root slopes and denominator/ramification facts. Same unreflected orientation. |
| `TauCetiRoadmap/MassFormula/README.md:218`, `:324`, `:352`, `:356`, `:371` | Totally ramified subextensions, root-count integration, Theorems 1 and 2, finiteness dichotomy. The discriminant refinement is expressly outside that owner's scope. |
| `Completed/NumberFieldArithmetic/README.md:1136`, `:1302`, `:1336`, `:1393`, `:1493`, `:1714`, `:1798`, `:1873` | §4.2 tower law; §§5.1–5.3 completions/semilocal structure; §5.6 decomposition group; §5.10 and §§6.3,6.5 discriminant formulas. R21 corrects the tower-law locator. |
| `TauCetiRoadmap/PolynomialGaloisGroups/README.md:199`, `:211`, `:1173`, `:1202` | Conventions and Layer 6 own transitive-group labels; this roadmap need only supply its permutation action. |
| `TauCetiRoadmap/ArithmeticGaloisRepresentations/README.md`, Layer 3 | Representation conductors are excluded here; the local-field integral does not redeclare the representation carrier. |
| LocalGaloisGroups; ClassicalArithmeticCompletion; ArtinRepresentations; FiniteGroupInvariants | Read as exclusions/ownership references, not as new dependency edges for this construction. No later supplier was introduced by the review. |

Pins used: Mathlib `f6090c7095e1e56b3464c1daba5f24631f1290d2`; Tau Ceti `358314d4ab97483df4fc4cb8adcc02e74a8d9f5a`.

| Pinned declaration/file opened | What it actually supplies |
| --- | --- |
| `Polynomial.IsEisensteinAt`, `Mathlib/RingTheory/Polynomial/Eisenstein/Basic.lean:56` | Ideal conditions, including a unit leading coefficient over a DVR; no monicity. |
| `Polynomial.IsEisensteinAt.irreducible`, same file, line 231 | Irreducibility with its primitive/prime-ideal hypotheses; not a license to drop them. |
| `TauCeti.normalizedValuation`, `TauCeti/NumberTheory/LocalField/NormalizedValuation.lean:112` | Normalized multiplicative valuation, converted to integer additive values on nonzero elements. |
| `TauCeti.natCastValuation`, `TauCeti/NumberTheory/LocalField/NatCastValuation.lean:99` | Valuation of a natural number with the nonzero cast hypothesis. |
| Different bounds, `TauCeti/NumberTheory/LocalField/Different/Wild.lean:61`, `:90` | `d≤e−1+v_L(e)` and the wild bound; the nonzero cast is essential. |
| `TauCeti.discriminantExponent`, `TauCeti/NumberTheory/LocalField/Discriminant/Basic.lean:137` | Uses the actual local-field/valuative-extension/separability instances. |
| Discriminant API, same file, lines 157, 180, 198, 215, 251 | `c=f·d`, lower bound, tame equality, unramified zero criterion, and invariance under algebra equivalence. |
| Eisenstein generators, `TauCeti/NumberTheory/LocalField/Eisenstein/TotallyRamified.lean:116`, `:128`, `:160` | Uniformizer minimal polynomial, power basis, and total-ramification/generator equivalence. |
| Unramified factorization, `TauCeti/NumberTheory/LocalField/Unramified/Factorization.lean:82`, `:124`, `:144` | Unramified first step, totally ramified second step, uniqueness. |
| `IsGalois.card_aut_eq_finrank` and converse, `Mathlib/FieldTheory/Galois/Basic.lean:107`, `:508` | Cardinality/degree criterion with finite-extension hypotheses. |
| Normal closure and finiteness, `Mathlib/FieldTheory/Normal/Closure.lean:155`, `:173` | Closure as the supremum of conjugate images; finite dimensionality in the finite-dimensional setting. |
| `NumberField.rootDiscr`, `Mathlib/NumberTheory/NumberField/Discriminant/Basic.lean:77`, `:80`, `:83` | Absolute discriminant to reciprocal degree, including value `1` on `ℚ`. |
| `NumberField.abs_discr_gt_two`, same file, line 273 | Excludes discriminant magnitude one in degree greater than one; supplies the nonempty-support repair in R12. |

### Headline theorem coverage

| README headline | Acceptance-file status |
| --- | --- |
| Canonical tower and Eisenstein generation (§0.2) | Already owned; import, do not make a new headline. |
| Classification by unramified part (§0.6) | Absent. Native intermediate fields, algebra equivalences and finite group actions are available; explain the exact remaining adapter if treated as unavailable. |
| Ramification polygon independence, vertices and residual transport (§§1.2–1.4) | Root-difference substitutes are present but false at their stated generality (R03–R04); residual transport itself is absent. Polygon API is supplied by NewtonPolygons, outside this pin. |
| Non-Galois discriminant integral (§2.3) | Present as `discriminantExponent_eq_integral`; finite Galois ambient extension and scalar tower survive elaboration. |
| Slope polygon and polygon-to-break theorem (§§2.4–2.5) | Absent; docstring should explicitly name the missing polygon/general Herbrand carriers. |
| Dictionary on actual extensions (§2.6) | Only numeric `HerbrandInvariant` identities are present; they do not prove the identification with extension invariants. |
| Weighted Galois mean slope (§3.3) | Only the tame-value criterion is present. The missing list of actual Galois slopes should be named explicitly. |
| Inseparability indices: invariance and endpoints (§4.1) | Both statements present; tested on separable and inseparable examples below. |
| Miki decomposition/jump invariant (§4.2) | Existence for a weak record is present; the record is insufficient for the claimed invariant (R07). |
| Ore realizability and Krasner count (§§5.1,5.3) | Missing actual extension statements; arithmetic formula/sum alone is insufficient (R15). |
| Compatible-invariant realization, generic polynomials and family mass (§§6.2,6.4,6.5) | Absent; docstring must distinguish the missing field invariant/family construction from a numeric predicate. |
| Monge class count (§6.7) | Six evaluations replace the theorem (R15–R16). |
| Mass-one completeness (§6.8) | Absent; representative-set infrastructure is named as unavailable at the pin. The prose generality still needs R17. |
| Global/local Galois mean comparison and product formula (§§7.2–7.3) | Product formula present; completion comparison only in prose. Its missing completion carrier/API should be named explicitly. |

### Adversarial values: selected Lean checks

PASS records the displayed instance, not a proof of the general theorem. FAIL/LIMIT rows preserve the counterchecks. `I` below denotes the numeric Herbrand invariant with `p=2`, `ε=f=1`, Swan list `[1,2]`; `ρ₄=X⁴+4X³+6X²+4X` is evaluated in `ℚ₂(∜2)`. Identity/degree-one, tame, wild, non-Galois and equal-characteristic cases are explicit. Zero rings, nonfields and infinite residue fields fail the local-field/number-field type assumptions rather than being silently tested as extensions.

| Statement (Suggested.lean line) | Instance | Computed values on the two sides / defining test | Result; change |
| --- | --- | --- | --- |
| Product identity 70 | `e=4,p=2`; `e=3,p=5` | `1·2²=4`; `3·5⁰=3` | PASS; padding R19 |
| Monicity 133 | `3X+6`, root −2 | Leading coefficient `3` versus required `1` | FAIL R02 |
| Evaluation at zero 139 | `X+2`, root −2 | `ρ(0)=0=0` | PASS; one-tactic padding R19 |
| Uniformizer independence 171 | Unramified quadratic, ξ=2 versus 2ζ₃ | `{-1}≠{0}` | FAIL R03 |
| Zero-value cardinality 179 | Tame cubic with M=L versus splitting M | `0≠3−1=2`; after repair `2=2` | FAIL R04 |
| `associatedInertiaOf` 228 | `z²+1` in F₂; `z²+3z+3` in F₅ | Factor degrees `{1}`→lcm1; `{2}`→lcm2 | PASS; unused definition R20 |
| `SlopeContent` 287 | Raw record `([],0,0)` | Three fields accepted; tame/unramified degrees both0 | LIMIT: no link to an extension; R20 |
| `IsGaloisSplittingModel` 321 | `X³−5`, L=ℚ₅(∛5); `X²−5`, L=ℚ₅(√5) | Local/global group orders `6=6`, `2=2`; zero polynomial fails irreducibility | PASS |
| `labelPrefix` 328 | ζ₈-field; unramified quadratic | `(2,1,4,8)`; `(2,2,1,0)` | PASS; unused wrapper R20 |
| Index invariance 373 | `X⁴−2` and `X⁴−162`, roots α and 3α | Both index lists `[8,4,0]` since scaling coefficients by units preserves valuations | PASS |
| Index endpoints 384 | `X⁴−2`; `X⁴+2X+2`; tame cubic | `(i₀,iν)=(8,0),(1,0),(0,0)` equals `(H,0)` | PASS |
| Existence 408 | ℚ₂(i), ℚ₂(√2) | Products `i²·1=−1`, `(1+√2)²(−3+2√2)=−1`; levels `(1),(1,3)` | PASS for weak record; stronger uniqueness fails R07 |
| Weighted sum 442 | p=q=2,n=4; p=q=3,n=3; n=1 | `4(1/2+1/4+1/8+1/16+1/32+1/32)=4`; `6/3+6/9+9/27=3`; `1=1` | PASS; p prime, q>1, n>0 survive |
| `IsCompatible` 559 | ℚ₂: [1],[2],[3]; ℚ₂(√2):[3] | Rams1<2 odd, 2=bound, 3>2; over ramified base 3<4 odd | PASS necessary-condition tests; general converse not certified |
| `mongeCount_values` 601 | Its six inputs | `6=6,48=48,10=10,9=9,1544=1544,25=25` | PASS numbers; R15/R19 |
| Rational boundary 657 | ℚ | `1=1` | PASS; padding R19 |

### Adversarial values: README statements and conventions

LIMIT marks unavailable source definitions, not certification from a numerical coincidence.

| Statement | Instance | Values computed | Result; change |
| --- | --- | --- | --- |
| Convention 1, separability | `X²−t` and `X²+tX+t` over F₂((t)) | Derivatives `0` and `t≠0`; one distinct root versus two | PASS: first excluded from break theory |
| Convention 2, normalization | `ℚ₂⊂ℚ₂(√2)` | `v_K(2)=1`, `v_L(2)=2`, `v_L(√2)=1` | PASS; use normalized valuation, not absolute p-adic exponent |
| Convention 3, Artin shift | Quadratics i and √2 over ℚ₂ | Swan `1,2`; Artin `2,3` | PASS shift; right-limit FAIL R05 |
| Convention 3, multiplicities | ζ₈-field, first wild break | Correct quotient order `4/2=2`, printed intersection quotient `4/1=4` | FAIL R05 |
| Convention 4, orientation | `X⁴−2` | Newton slopes `−4,−2,−2`; rams `2,4` | PASS sign and compressed multiplicity |
| Convention 5, tiny rams | ζ₈-field | `r₁/2=1/2=1−1/2`; `r₂/4=3/4=2−5/4` | PASS |
| Convention 6, height vs w | ζ₈-field | `w=2`, `H=8−4+1=5`, distinct invariants | PASS |
| Convention 7, adjoining faces | `X⁴−2`, right-to-left order | Residual constants/next leading coefficients `1=1`; after scaling, `δ²=δ²` | PASS adjacent matching; orbit recursion FAIL R06 |
| Convention 8, closure vs visible | Dyadic pure quartic | Closure Artin `[2,3,4]`, visible `[3,4]`, hidden `[2]` | PASS distinct notions |
| Convention 9, classes vs embedded fields | Totally ramified cubics over ℚ₃ | `6·3+3·1=21` embedded fields, `6+3=9` classes | PASS orbit weights |
| Convention 10, masses | Unramified quadratic, viewed over ℚ₂ | Relative mass1, absolute mass1/2, f=2 | PASS: `1=2·(1/2)` |
| Convention 11, labels | f=3,e=2,c=6,p=2 | Prefix `(2,3,2,6)`; c/f=2 | PASS |
| Convention 12, inseparable boundary | `X²−t`, equal characteristic | Auxiliary and final indices `[∞,0]`; no finite H | PASS definition; separable endpoint theorem excludes it |
| §0.1 tower API | Quadratic then quadratic over ℚ₂ | w: `2=1+1≠1·1`; ε: `1=1·1` | FAIL R11 |
| §0.2 canonical tower | Unramified quadratic then ramified quadratic | `[L:K]=4`, `(f,e)=(2,2)`, relative Eisenstein degree2 | PASS; import result R18 |
| §0.3 height, tame and isomorphism API | Tame e=3,f=2,c=4; √2 and √8 | `H=4/2+1−3=0`; both wild presentations H=2 | PASS |
| §0.4 square class, basis change | Quadratic with basis discriminant8, change determinant2 | New discriminant32; ratio4 is square; root field in both cases K(√2) | PASS |
| §0.4 square/trivial and characteristic-two controls | Identity extension; separable `X²+tX+t` | Discriminants1 and t² are squares; both discriminant root fields K, degrees1 | PASS; no Artin–Schreier resolvent is claimed |
| §0.5 automorphism bound/criterion | Identity, cyclic quadratic, non-Galois cubic | Aut sizes/degrees `1/1`, `2/2`, `1/3`; equality true,true,false | PASS with finite hypotheses |
| §0.5 tame Galois criterion | `ℚ₅(∛5)` vs base unramified quadratic | μ₃ in base: false vs true; Aut sizes1 vs3 | PASS both directions |
| §0.5 subfield multiset | Prime-degree cubic; cyclic quartic; biquadratic | Proper intermediate-field counts `0,1,3` | PASS; excludes treating embeddings as subfields |
| §0.6 orbit classification | Quartics over ℚ₂ with f=2 | `6` fixed quadratic classes plus `8` moved classes in pairs: `(14+6)/2=10` orbits | PASS |
| §0.6 automorphism mass identity | ℚ₂(ζ₁₂); ℚ₂(⁴√−3) | Aut counts `4=2·2`; `2=2·1`; orbit sizes1,2 | PASS |
| §1.1 coefficient/height formula | `X⁴−2` | Heights at1,2,3,4: `8,4,8,0`; derivative height `11−4+1=8` | PASS after monic hypothesis |
| §1.2 vertices and endpoints | `X⁴+2X+2` | Endpoints `(1,1),(4,0)`; internal (2,1) is above chord height2/3 | PASS; not every index point is a vertex |
| §1.2 multiplicities and denominator | Same quartic | One ram1/3 repeated twice; slope multiplicity3; `(2²−1)/3=1` | PASS |
| §1.2 root threshold identity | Pure dyadic quartic, t=2 and4 | Counts `3+1=4=2²`; `1+1=2=2¹` | PASS |
| §1.2 wild segments/tame boundary | Rams `[1/3,1/3]`; tame cubic | Distinct positive-rams counts1≤2; 0≤0 | PASS |
| §1.3 residual degree and constant | Wild quartic outer face; tame cubic over ℚ₅ | Degrees `2=2/1`, `2=2/1`; constants1 and3 nonzero | PASS |
| §1.4 orbit and inertia | R06; tame cubic residual `z²+3z+3` over F₅ | Wrong orbit second leading coefficient1 vs actualδ²; discriminant2 nonsquare gives inertia2 dividing closure f=2 | Orbit FAIL R06; inertia PASS |
| §1.5 transport | Unramified quadratic; prefix 2.3.2.6 | Relative degrees1,2; polygons point(1,0), segment(1,1)–(2,0); rams [],[1] | PASS polygon transport; embeddings FAIL R03 |
| §2.1 closure independence | Tame cubic closure; enlarge by unramified degree2 | Group/H orders `(6,2)` and `(12,4)`; orbit counts1 then3 in both | PASS |
| §2.2 upper/lower conversion | Pure dyadic quartic | Swan `2,3`; ψ(2)=2, ψ(3)=4; lower rams `2,4` | PASS instance; missing supplier R01 |
| §2.3 integral, nonabelian case | ℚ₃(∛3), S₃ closure | Orbit count1 on (−1,3/2], then3; integral `(3−1)·5/2=5=c` | PASS |
| §2.4 slope polygon | Pure dyadic quartic | Points `(1,0),(2,3),(4,11)`; slopes `(3−0)/(2−1)=3`, `(11−3)/(4−2)=4` | PASS |
| §2.4 repeated slope/empty case | Quartic c=4 with no proper subfield; identity | Segment slope4/3 with multiplicity log₂4=2; identity has one point and0 slopes | PASS |
| §2.4 tame/unramified widths | Tame cubic; unramified quadratic | Widths `e−1=2` at slope1, and `f−1=1` at slope0 | PASS |
| §2.5 nonnormal sum and lower numbering | D₄ closure of pure quartic, H reflection | Max lower indices4,8 give sums `4+2=6`, `8+2=10`; divided by e(M/L)=2 then −1 gives2,4 | PASS witness; full proof/source not certified |
| §2.5 piecewise Herbrand function | Same field | ψ slopes1,2,4; ψ(0)=0, ψ(2)=2, ψ(3)=4 | PASS; does not confuse closure's lower indices3,7 |
| §2.6 four dictionary identities | I at k=2 | `s=2=(2·5/4−1/2)`; `m=1/4+1=5/4=1/2+3/4`; `r=4·3/4=3` | PASS |
| §2.6 height/shear | ζ₈-field | (degree,c): `(1,0),(2,2),(4,8)` shear to heights0,1,5; `4m₂=5` | PASS |
| §2.6 denominator theorem | Single-run quartic r=1/3,d=2; ζ₈ top relative quadratic | `(4−1)/3=1=H`; `(2−1)·3=3=H(relative)` | PASS |
| §2.7 top slope | Pure quartic; tame cubic; unramified/identity | `4,1,0,0` | PASS case split; raw maximum needs explicit empty convention |
| §3.1 slope-content multiplicities | ζ₈-field; tame S₃ closure | Wild lengths2 and0; wild group orders4 and1; tame degrees1 and3 | PASS after R05 |
| §3.2 hidden slopes | Two D₄ quartics | `[2,3,4]−[3,4]=[2]`; `[2,3,7/2]−[2,7/2]=[3]` | PASS multiset subtraction |
| §3.3 weighted mean | ζ₈, pure quartic, second D₄ quartic | `2/4+3/2=2`; `2/8+3/4+4/2=3`; `2/8+3/4+(7/2)/2=11/4` | PASS |
| §3.3 tame term and S₃ | ℚ₃(∛3) closure; tame e=3 closure | `(2/3)(5/2)+(1/3)(1/2)=11/6`; `1−1/3=2/3` | PASS |
| §3.4 group, inertia, automorphisms | S₃ cubic closure; C₂² Galois quartic | Orders `(G,I,P,H)=(6,3,1,2)` and `(4,4,4,1)`; normalizer quotients1 and4 | PASS nonabelian/cyclic controls |
| §3.5 splitting model | X³−5 over ℚ and ℚ₅ | Irreducible degree3 on both; splitting groups both S₃ of order6 | PASS example, no universal existence claimed |
| §3.6 prefix congruence | `(p,f,e,c)=(2,3,2,6)` vs c=7 | `6 mod3=0`, `7 mod3=1`; bounds3≤c≤9 alone admit both | PASS; congruence discriminates |
| §4.1 indices and nonvertices | Quartics x⁴−2, x⁴+2x²+2, (x+1)⁴+1, x⁴+2x+2 | Lists `[8,4,0]`, `[6,2,0]`, `[5,2,0]`, `[1,1,0]`; H=8,6,5,1 | PASS |
| §4.2 jump recursion | ℚ₂(i); ℚ₂(√2); R07's quartic | `[1,min(2,3)]=[1,2]`; `[1,3]`; proposed alternatives `[1,2,5]` and `[1,7,5]` | FAIL uniqueness/order R07 |
| §4.2 undefined condition | ℚ₃(∛3) | Degree3 cannot contain degree2 field ℚ₃(ζ₃); no primitive ζ₃ | PASS: none |
| §5.1 Ore iff, n=1 | Any local K | n=1 forces b=0,a=v_K(1)=0, so j=0; polynomial X+π has height0 | PASS |
| §5.1 Ore constructive direction | ℚ₂,n=4,j=1; j=8 | `X⁴+2X+2` gives H=1; `X⁴+2` gives H=8 | PASS |
| §5.1 equal characteristic | F₂((t)),n=2 | n has valuation∞; all odd j=2m−1 satisfy b=1, v(1)=0≤m−1 | PASS; infinitely many strata |
| §5.2 exact boxes | ℚ₂,n=2 | j=1: measure `(1/4)(1/4)=1/16`; j=2: `(1/4)(1/4)=1/16` | PASS on admissible j |
| §5.2 off-admissible disjointness | X²+2X+2, j=0,1 | Membership true,true; actual H=1 | FAIL R08 |
| §5.3 box count | Same admissible boxes | j=1: `2·2³·(1/16)/(1/2)=2`; j=2: `2·2⁴·(1/16)/(1/2)=4` | PASS |
| §5.3 normalized base dependence | K=ℚ₂(√2),n=2 | Admissible j=1,3,4; counts2,4,8; weighted sum `2/2+4/8+8/16=2` | PASS; Qp closed form cannot be used unchanged |
| §5.3 higher checks | (p,n)=(2,8),(3,9) | Count totals5880,5085; weighted sums8,9 | PASS rational recomputation |
| §5.4 total embedded count | ℚ₂,n=4; equal-char n=2 | `92+14+1=107` embedded extensions; infinitely many heights1,3,5,… | Finite example PASS; general finite claim FAIL R09 |
| §6.1 numeric invariant round trip | I | Swan `[1,2]`→means `[1/2,5/4]`→rams `[1,3]`→Swan `[1,2]` | PASS; worked variant FAIL R13 |
| §6.2 integrality and arithmetic small ram | ℚ₂ quadratics [1],[2] | `(2−1)r=1,2`; small rams1/2,1; e_K=1 | PASS conditions; unit description FAIL R10 |
| §6.2 converse route | Same inputs vs [3] | Explicit realizations c=2,3; [3] rejected by3>2 | PASS examples only; full existence not certified |
| §6.3 family constants | ℚ₂ family [1], family [2] | Cardinalities2,4; each pair/group has `(e,f,c)=(2,1,2)` or `(2,1,3)` | PASS |
| §6.3 quotient by Frobenius | Relative quadratic classes over ℚ₄ | 14 classes→10 absolute classes, as `(14+6)/2` | PASS orbit operation; describe it on member classes, not a union of unchanged relative families |
| §6.3 claimed variation | Printed examples [1,5/2] vs [2,3] | Discriminant exponents9 versus11, hence different families | LIMIT: not a same-family witness; R22 |
| §6.4 diagram and generic polynomials | ℚ₂,[1] | α=1,β=0,γ=1; generic `X²+2+2aX+4c`, a=1,c=0 or1 gives discriminants−4,−20, c=2 | PASS small case |
| §6.4 arithmetic diagram | ℚ₂,[2] | α=0,β=1,γ=1; coefficients at σ=0,2,3,4; all four F₂ specializations have discriminant valuation3 | PASS small case |
| §6.4 point counts | [1], band [1/2,1) | One drawn point, ceil(r)=1; one boundary C-point, floor(r)=1 | PASS small case; general diagram source unreadable |
| §6.5 family mass/fibres | ℚ₂,[1] and [2] | Polynomial counts2,4; Aut=2; fibre count2/2=1; masses1,2 match `(q−1)^α q^β` | PASS small cases; general fibre assertion not certified |
| §6.5 comparison with Serre | Same families | `1·2⁻¹+2·2⁻²=1`; using discriminant exponents would give1/2 | PASS normalization, negative control |
| §6.5 ambiguity | Same families | f=ε=1, integral-ram multiplicity1 gives ambiguity2; ambiguity/Aut=1 | PASS small cases |
| §6.6 equivalence and constants | Quadratic [1] family with residual z+1, C₂ | Two members share residual class, permutation group, e=2,f=1, hidden=[]; both gms1,top2 | PASS reflexive/symmetric/transitive tuple equality; official packet definition not certified |
| §6.7 full numeric totals | (p,n)=(2,2),(2,4),(3,3),(2,8),(5,5),(3,9),(7,7) | `6+1=7`; `48+10+1=59`; `9+1=10`; `1544+256+22+1=1823`; `25+1=26`; `753+41+1=795`; `49+1=50` | PASS arithmetic; class-count theorem missing R15 |
| §6.8 completeness mass | Six dyadic quadratic classes | Total `2/4+4/8=1`; omissions give3/4 or7/8 | PASS |
| §6.8 generality | F₃((t)), tame quadratics; F₂((t)), wild quadratics | Finite tame mass1/2+1/2=1; every finite wild subsum<1 | PASS general criterion; restriction R17 |
| §7.1 root discriminant | ℚ, ℚ(√5), ℚ(ζ₅) | `1,√5,5^(3/4)`; degree>1 examples>1 | PASS |
| §7.2 completion identity, multiple primes | Cubic discriminant−23, p=23 | Local partition2+1; normal closure has g=3, local degree2,c=1: `gc/[N:Q]=3/6=1/2` | PASS; do not use one arbitrarily chosen cubic completion |
| §7.2 unramified and tame values | Same example p=2,23 | `gms₂=0`; `gms₂₃=1−1/2=1/2` | PASS |
| §7.3 product and log | ℚ(∜2); ℚ | `2³=8`, `3log2=log8`; empty product1, empty sum0=log1 | PASS |
| §7.3 local upper bound | Pure quartic closure, p=2,e=8 | `gms=3≤1−1/8+3=31/8` | PASS |
| §7.3 strict global bound | ℚ; ℚ(√5) | Printed `1<1` false; `√5<5` true | FAIL R12 |

### Seeded source sample

All 15 sample targets were inspected against available text and the computed rows. No extra locator is explicitly flagged “unverified”. The table distinguishes support from inaccessible locators. Page numbers refer to the versions read.

| Sample target | Source text, locator and outcome |
| --- | --- |
| 0.3 Height and mean | Pinned discriminant identities and bounds support the algebraic definition and tame criterion; MassFormula Layer 0 supports agreement on totally ramified subextensions. The cited Serre III §6 Prop.13 was not readable. The README's bound is weaker than the pinned `H≤v_L(e)`. No source page locator is attached at the target. |
| 0.5 Automorphisms and subfields | Native `IsGalois.card_aut_eq_finrank` and its converse support the finite Galois criterion. The finite/local hypotheses were checked. No exact literature locator for the subfield multiset/tame criterion is given. Tested degree1, C₂, C₂² and S₃ cases. |
| 1.5 General-extension transport | Unramified factorization at the pin supports passing to `L/Lᵘʳ`; Greve–Pauli's Proposition and Definition 4.3, preprint pp.5–6 (`greve-pauli line 227`), treats the totally ramified polynomial construction. It does not support all K-embeddings in the transported multiset: R03. Published numbering is not certified. |
| 2.4 Slope polygon | Jones–Roberts Proposition 3.4, preprint pp.7–8 (`jones-roberts-database line 302`), supplies distinguished subfields and discriminant slopes over ℚ_p. Deligne Appendix A.6 and the `lf.slopes` knowl were inaccessible. Thus the full general local-field locator and non-Galois proof are not certified. Computed quartic and tame cases agree. |
| 2.6 Dictionary | `lf-herbrand_invariant line 90`, especially lines108–119, directly gives the four rational identities with Swan conventions and p-adic hypotheses. The field-theoretic denominator proof also invokes the missing supplier R01. R13 is an internal Check error, not a defect in this knowl. |
| 3.6 Intrinsic label prefix | Pinned different/discriminant bounds support the inequality and f-divisibility. Jones–Roberts local-field conventions support degree/discriminant invariants; the exact modern label encoding was not certified from an accessible knowl. The computed quadruples agree internally. |
| 4.2 Jump sets | Miki Lemma17, printed pp.111–112 (`miki-1981 line 524`), has omitted weighted-order and non-p-th-power hypotheses; its invariant is defined at line572. Pagano Proposition1.3 and Theorems1.4–1.5, preprint pp.5–6 (`pagano line 196`, line219, line245), concern filtered presentations/orbits and the extended jump invariant. Neither supports the printed weak-record uniqueness: R07/R21. |
| 5.1 Ore conditions | Pauli–Sinclair Proposition2.1, preprint p.2 (`pauli-sinclair line 85`), and Pauli–Roblot Proposition3.1, preprint p.3 (`pauli-roblot line 113`), give the finite-p-adic-field restrictions. The README's equal-characteristic extension is supported by its explicit derivative/converse argument, checked on X²+t^mX+t, not by pretending the sources state it. |
| 5.3 Krasner count | Pauli–Roblot Theorem6.1, preprint p.7 (`pauli-roblot line 335`), gives the count over a general finite p-adic base. The specialized admissible closed form and weighted sums agree. The original Krasner chapter was unavailable; the source §2 citation is not certified. The broader local-field measure proof consumes MassFormula. |
| 6.3 Families | The definition by a fixed invariant is testable, and the two quadratic families agree with the arithmetic. The specific `lf.family_invariants` knowl returned CAPTCHA, so its asserted list of varying invariants and absolute/relative wording are not source-certified. |
| 6.5 Family masses | Monge Theorem1, preprint p.11 (`monge-family line 509`), counts reduced representatives as B(L/K)/Aut; §2.4 starts at line530. Pauli–Sinclair Theorem6.3 (`pauli-sinclair line 1444`) is an invariant enumeration theorem. These passages do not by themselves certify the exact α,β,γ,δ fibre formula as written; the family mass knowl is inaccessible. Serre comparison is supported by the main MassFormula contract and exact small sums. |
| 6.7 Monge count | Monge Theorem1, preprint p.4 (`monge-count line 208`), and Theorem2, p.5 (line245), support general finite K/ℚ_p counts. All printed acceptance values recomputed correctly. R16 records the unjustified restriction; R15 records the missing Lean counting theorem. |
| 7.1 Definition/basic properties | Jones–Roberts root-discriminant paper §2, preprint p.3 (`jones-roberts-grd line 116`), directly gives the definition and monotonicity/equality criterion. Native rootDiscr and the discriminant lower bound cover the trivial boundary. The intended ideal norm inequality in the prose should be written as an inequality of positive norms, not an inclusion of the unit ideal. |
| 7.2 Local Galois means | Same §2, pp.3–4, lines135–165, supports local tame/wild exponents; NumberFieldArithmetic §§5.1–5.3,5.6,6.3,6.5 supplies the completion comparison. The multiple-prime cubic calculation above checks the distinction between one local factor and the compositum. |
| 7.3 Product formula | Same §2, equations(2.1)–(2.5), pp.3–4 (`jones-roberts-grd line 124`), supports the finite product and tame/wild formulas. The native bound supplies the inequality. Its strict empty-product specialization is false: R12. |

Two source counterchecks underlie the errata below: an unramified quadratic has Galois mean slope `0`, whereas the printed quotient-order choice gives `1/2`; `ℚ₃(∛3)` has no hidden slopes but `5/3<11/6`. The Pauli–Sinclair coefficient misprint was checked against the rendered page, not OCR alone.

## Not verifiable

- **Deligne Appendix A.6**, including Propositions A.6.1–A.6.2: the sources service and legal author/institutional/Numdam searches found references but no readable full text. The general non-Galois proof steps in §§2.4–2.6 therefore remain uncertified by that locator.
- **Krasner (1966), pp.143–169**: the original chapter was not found legally. Pauli–Roblot's accessible restatement was read instead; it does not certify the original chapter's exact locator.
- **Miki (1974), Tokyo 21, pp.377–393**: no legal full text located through the service or institutional leads. The distinct 1981 Crelle article was read and is sufficient for the counterexample analysis above.
- **Serre's 1978 mass-formula note, pp.1031–1036**: bibliography and later lecture leads were available, not the cited note. The main MassFormula roadmap was read as the supplier contract.
- **Serre, Local Fields**: the service resolved only a publisher/paywalled entry, treated as uncertified. No attempt was made to bypass access controls; it is not re-requested as an unsettled missing text.
- **Twenty-three LMFDB knowls** returned a nine-line browser/CAPTCHA page rather than mathematical text: `lf.slopes`, `lf.visible_slopes`, `lf.hidden_slopes`, `lf.slope_content`, `lf.galois_mean_slope`, `lf.ramification_polygon`, `lf.residual_polynomials`, `lf.associated_inertia`, `lf.indices_of_inseparability`, `lf.jump_set`, `lf.rams`, `lf.means`, `lf.heights`, `lf.family_polynomial`, `lf.eisenstein_diagram`, `lf.family_mass`, `lf.family_ambiguity`, `lf.packet`, `lf.subfamily`, `lf.top_slope`, `lf.galois_splitting_model`, `lf.family_invariants`, `nf.galois_root_discriminant`. Their exact URLs were tried through the sources service. The separately retrieved `lf.herbrand_invariant` was readable and was checked.
- **Published/preprint numbering:** legal Greve–Pauli and Heiermann preprints were obtained, but their published theorem numbering was not established. Fried and Ore were available as OCR scans; these broad bibliographic references do not provide the missing exact locators in the target README. No uncertainty about numbering is reported as a mathematical error in those sources.
- **General family realization, semicanonical fibre counts and ambiguity:** the small cases were computed, but the broad “main theorem”/“enumeration theorem” citations do not identify a source passage proving the exact finite fibre formula stated here. The unavailable knowls cannot fill that evidentiary gap.
- **Unpinned Tau Ceti main claims:** this review uses the stipulated pins and main roadmap contracts. It does not certify the additional unpinned code/module claims merely because the README says they exist.

The unresolved-source list preserves the established keys, removes texts successfully obtained, and records the four unresolved works plus the 23 unreadable knowls. No source manifest in the PR was edited. This is a completed review with a needs-changes verdict, not a deferred verdict pending access.

## Source issues

- **Misprint** in pauli-sinclair at §1, preprint p.2: the source says the zeroth π-adic digits for coefficients with 1≤i<n are positive; it should be those digits are zero; affects a stated result.
- **Misprint** in jones-roberts-database at §3.6, equation (2), preprint p.8: the source says t is the unramified quotient order; it should be the tame inertia quotient order; affects a stated result.
- **Error** in jones-roberts-database at §3.6, preprint p.8: the source says equality of root-discriminant exponents is equivalent to having no hidden slopes; it should be equivalence to the Galois closure being unramified over the field; affects a stated result.
