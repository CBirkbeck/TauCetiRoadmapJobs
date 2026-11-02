# Review of NumberFieldEnumeration (pull request #1718 at 217b656)

**Verdict:** needs changes

Independent AI review of the two specified roadmap files at the supplied head. There are 11 findings: 7 blocking and 4 P3 findings. No pull-request file was changed. The mathematical scope is repairable; this is not a rejection of the roadmap.

## R01 (P1) — Rank zero makes the composite-degree headline vacuous

**Location:** `TauCetiRoadmap/NumberFieldEnumeration/README.md:449`, “with `Γ_k` admissible in each rank `k < n`”; compare the definition at line 114.

**Claim:** The composite-degree complete-list equality assumes admissibility in every smaller rank. This includes rank zero for every composite degree.

**Witness:** In rank zero the empty matrix is positive definite, its determinant is 1, and its only integer vector is 0. Consequently no real constant satisfies the required nonzero-vector conclusion. A scratch Lean proof establishes this impossibility.

**Repair:** Quantify over `1 ≤ k < n`, state the recursive equality for `n ≥ 2`, and give the degree-zero and degree-one starting cases. For `n = 4`, the required ranks become exactly 1, 2, 3; constants `1`, `2/√3`, `4/3` suffice. The empty-rank obstruction disappears, while the quartic example still uses rank 2 for its relative step. The base cases are `canonicalPolys 0 D = ∅` and `canonicalPolys 1 D = {X}` for `D ≥ 1`, empty for `D = 0`.

## R02 (P1) — The all-real coefficient identity fails with the stated indexing

**Location:** `TauCetiRoadmap/NumberFieldEnumeration/README.md:195`, “For `P` all of whose complex roots are real, `t2 P = a₁² − 2a₂`”; coefficient convention at line 109.

**Claim:** This identity is stated without the degree restriction needed by `a_k = P.coeff (n − k)`.

**Witness:** For monic `P = X − 1`, all roots are real and `t2 P = 1`. Natural subtraction gives `a₁ = a₂ = −1`, so the proposed right side is 3. Both computations were proved in scratch Lean.

**Repair:** State the coefficient formula for monic polynomials of degree at least 2. Give degree 1 separately, or define the reversed coefficients to be zero when `k > n`. With the latter convention `X − 1` gives `a₂ = 0` and `1 = 1`; the constant polynomial 1 gives `0 = 0`. Preserve the root-sum formulation in all degrees. Include these as negative controls for the coefficient indexing. If nonmonic polynomials are included, divide by the leading coefficient: `2X² − 2` has `t2 = 2`, whereas unnormalized coefficients give 4.

## R03 (P1) — Supply the coefficient inequalities used by the proof routes

**Location:** `TauCetiRoadmap/NumberFieldEnumeration/README.md:185`, “from Newton's inequalities”, and line 392, “by 1.1 (over `ℂ`) each coefficient of each `τ P` is bounded”.

**Claim:** The relative finiteness argument consumes a complex-polynomial coefficient theorem, but §1.1 and `Suggested.lean:58` only state the theorem for `P : ℤ[X]`. Newton's inequalities are also used without a stated target or an identified library/supplier theorem.

**Witness:** Over `F = ℚ(√−3)`, the roadmap's polynomial `P = X² − (2 + ω)` maps to a polynomial with nonreal constant coefficient. It is outside the domain of `abs_coeff_le_of_t2`. Object searches found no pinned Newton/Maclaurin inequality supplying the omitted step.

**Repair:** Make the complex-root norm and the bound `‖P.coeff (n-k)‖ ≤ choose(n,k) (T₂(P)/n)^(k/2)` explicit targets for every monic `P : ℂ[X]`, `n > 0`, `k ≤ n`; derive the integer statement by mapping coefficients. State Newton's normalized elementary-symmetric inequalities, with their range and nonnegative-input hypotheses, inside §1.1, or choose and specify a proof route that avoids them. List these inputs in the relative candidate target's dependencies. On the displayed relative polynomial, each complex image has `T₂ = 2√7` and constant-coefficient norm `√7`; the corrected bound gives `√7 ≤ √7`. The integer specialization still gives `2 ≤ 2` for `X² + 2`.

## R04 (P1) — The supplied push gate fails its build check

**Location:** `TauCetiRoadmap/NumberFieldEnumeration/Suggested.lean:1`, `import Mathlib`.

**Claim:** The worker's gate reports `build=1 FAIL`. Its sole failure is the warning that this file imports a package designed for the module system without declaring itself a module.

**Witness:** The targeted build reproduces the module-system warning before the 24 `sorry` warnings. Lake itself exits successfully; the gate rejects the additional warning. Direct `lake env lean` exits successfully and emits only the 24 `sorry` warnings.

**Repair:** Add the `module` header and make the intended declaration visibility explicit, retaining the prescribed imports; then rerun the targeted build and push gate. A scratch copy with the header elaborates with only `sorry` warnings. The source worktree was not changed, so the gate at this head remains failing. This is classified P1 under the brief's rule for a failed build gate, not a claim that the existing signatures fail to elaborate.

## R05 (P2) — State the relative and composite completeness headlines in Lean

**Location:** `TauCetiRoadmap/NumberFieldEnumeration/README.md:402`, “need the instance plumbing of a tower of `AdjoinRoot`s”, and `TauCetiRoadmap/NumberFieldEnumeration/Suggested.lean:14`.

**Claim:** The file omits relative candidates/completeness and the composite-degree complete list on the ground that their carriers are unavailable.

**Witness:** A scratch extension elaborates `relT2` on `(𝓞 F)[X]`, `relCandidates`, the representative-dependent bound, and relative completeness with an integral generating root, using only the file's existing imports. No tower of `AdjoinRoot`s is needed for that theorem.

**Repair:** Add the few native definitions needed for the relative and composite headlines and state the headlines with `sorry`. For relative completeness use `θ : 𝓞 K`, `P : (𝓞 F)[X]`, `IntermediateField.adjoin F {(θ : K)} = ⊤`, `aeval (θ : K) P = 0`, and membership in the explicitly bounded relative candidate set. Carry maximality, the discriminant bound, admissibility, and the representative condition explicitly. The degree condition and monicity make this polynomial the relative minimal polynomial. State the composite equality with these carriers, or construct its genuine `AdjoinRoot` presentation; instance assembly is not a missing mathematical carrier. Amend the module docstring accordingly. The scratch signature includes the quartic example with relative degree 2 and `T₂ = 4√7`, and specializes over `ℚ` to the quadratic example with bound 3.

## R06 (P2) — The claimed absence of explicit bounded generating polynomials is incorrect

**Location:** `TauCetiRoadmap/NumberFieldEnumeration/README.md:7`, “Neither says *which* fields they are”, and lines 167–170, the claim that no finite candidate set exists in the libraries.

**Claim:** Effective Bounds is described as supplying only a count, with explicit finite polynomial candidates entirely new here.

**Witness:** At the Tau Ceti pin, `TauCeti/NumberTheory/EffectiveBounds/HermiteCount/Basic.lean:139`, `NumberField.exists_mem_rootSet_eq_adjoin_of_abs_discr_le` places every bounded-discriminant subfield in the roots of explicitly degree- and coefficient-bounded integer polynomials.

**Repair:** Cite that theorem in the supplier contract and describe the retained contribution as the sharper Hunter/relative-Hunter bounds and canonical representatives. Delete the categorical absence claims. The distinction is verifiable on `ℚ(i)`: the supplier already gives a bounded defining polynomial; this roadmap's norm bound gives `X² + 1` with `T₂ = 2 ≤ 5/2`, and its canonical-polynomial layer removes repeated presentations. There is no need to re-plan Effective Bounds or remove the sharper new theorems.

## R07 (P2) — Equal root absolute values do not imply equality for every coefficient

**Location:** `TauCetiRoadmap/NumberFieldEnumeration/README.md:209`, “Maclaurin's bound is an equality when all roots have the same absolute value.”

**Claim:** This equality criterion is too strong for the coefficient inequality, which also uses the triangle inequality in Vieta's formula.

**Witness:** For `P = X² + 2`, both roots have absolute value `√2`. At `k = 1`, the coefficient is 0, whereas the bound is `2√2`. At `k = 2`, the displayed Check correctly gives `2 = 2`.

**Repair:** Say that this example is sharp for the constant coefficient, or give the additional equality conditions for the triangle inequality. Keep the existing `k = 2` computation and add `k = 1` as the cancellation control. The correction preserves the coefficient theorem and the intended sharpness example.

## R08 (P3) — Remove elementary and boundary padding from the acceptance file

**Location:** `TauCetiRoadmap/NumberFieldEnumeration/Suggested.lean:50`, `:163`, and `:184`: `t2_nonneg`, `admissible_rank_one`, and `hunterCandidates_finite`.

**Claim:** These are elementary API/boundary results rather than headline acceptance theorems.

**Witness:** Scratch probes close `t2_nonneg` by `Multiset.sum_nonneg` and nonnegativity of squares, and `hunterCandidates_finite` by `(candidates_finite n _).subset (fun _ h => h.1)`. The rank-one declaration is already a proved boundary calculation.

**Repair:** Delete these declarations from `Suggested.lean`. Keep their mathematics in README API/Checks, using prose rather than backticked claims of declarations in this file. Do not replace the `sorry`s with proofs in place. The retained examples remain `t2(X² + 1) = 2 ≥ 0`, `11` Hunter candidates at `(2,8,1)`, and `x = 1` giving `a = det(a)` in rank one.

## R09 (P3) — Give claim-level source locators and a source manifest

**Location:** `TauCetiRoadmap/NumberFieldEnumeration/README.md:300`, `:409`, and `:552`; no `sources.toml` exists in the folder.

**Claim:** Most targets have only an entire book chapter, an entire paper, or a bibliography association. In particular §§1.1, 2.1 and 2.3 do not give exact locators at their theorem claims. The cited works have no manifest records.

**Witness:** Hunter's Theorem 1, printed p.57, is specifically quintic and has a different bound; Martinet's author-hosted Theorem 2.8 and Corollary 2.9, p.8, supply the formulas used here. Jones–Roberts §3 discusses database completeness criteria, not the displayed canonical-set equality.

**Repair:** Put exact theorem/section/page locators at the relevant claims, distinguish the roadmap's deductions from source theorems, and record all works in `sources.toml`. Cite the Martinet version actually read: its cover says it includes minor corrections, and its pagination is not the published 147–179 pagination. Use the LMFDB knowl identifiers for the canonical ordering. Record Cohen and Pohst as uncertified unless a legal readable text is obtained. The source audit below gives the verified locators and the remaining unavailable texts; no manifest was edited during this review.

## R10 (P3) — Restore the required roadmap shape and per-definition checks

**Location:** `TauCetiRoadmap/NumberFieldEnumeration/README.md:3`, `:103`, `:172`, `:315`, `:389`, and `:545`.

**Claim:** The file lacks the prescribed Summary, Conventions, Exact supplier contracts and How to read the build structure, and neither layer ends with Examples and Dependencies. Several definitions lack three discriminating Checks and a stated API of their own.

**Witness:** `relT2`/`relCandidates` have no three definition-level Checks; the §2.2 list tests Hunter and subfields instead. `candidates` has one explicit set-count Check. The dependencies are shared `Prerequisites` paragraphs rather than claim-specific `Needs` lines.

**Repair:** Reorganize the existing content into the required headings, consolidate library ownership claims in Scope and ownership, and give each target its own dependencies and locator. Add actual definition/API controls: `candidates 0 (−1) = ∅`, `candidates 0 0 = {1}`, and the existing nine-polynomial case; for relative candidates test `F = ℚ`, a negative bound, and the nonreal-coefficient quartic example. Give corresponding discriminating tests for the key, defining-polynomial set and image constructions. Move process claims such as “Every number below was checked with PARI/GP” into review evidence rather than timeless mathematical prose. Do not add these checks as admitted Lean declarations.

## R11 (P3) — Correct the claim that all supplied Tau Ceti APIs are imported

**Location:** `TauCetiRoadmap/NumberFieldEnumeration/README.md:146`, “At the pin, all imported by `Suggested.lean`”.

**Claim:** The following list includes the index-discriminant formula and three worked-example modules, although the acceptance file does not import them.

**Witness:** With exactly the five imports of `Suggested.lean`, scratch `#check`s cannot resolve the index-discriminant theorem or the three worked-field prefix theorems. Their declarations do exist in the pinned source files listed in the audit.

**Repair:** Describe these as APIs available at the pin; separately identify the APIs actually imported. Do not add unused imports merely to preserve this sentence. The existing relative-discriminant proof continues to elaborate with its actual imports; the index formula and worked-example assertions should name their own supplying modules when consumed.

## Verified sound

The scope review covered all six subsections, all 36 declarations, both layer orders, all displayed conventions and all worked-example groups. There are 10 definitions, 24 admitted theorems and 2 proved theorems. The table below has 52 rows, including every declaration, the README-only targets, the proof-route constructions and the findings' counterexamples. Numerical rows are adversarial tests, not proofs of universal theorems.

Notation in the table: `C(n,B)` denotes `candidates n B`, `H(n,D,Γ)` denotes `hunterCandidates n D Γ`, `I` denotes `hunterImage`, and `CP` denotes `canonicalPolys`. `ω = (1+√−3)/2`, `φ = (1+√5)/2`, `g = X³−X²+1`, and `K₋`/`K₊` are the quartics defined by `X⁴∓5X²+7`. Numeric roots were computed independently; quadratic/cubic discriminants and rational-root irreducibility tests use integer arithmetic.

| # | Statement / convention | Instances and values computed on the two sides | Result / change |
|---|---|---|---|
| 1 | `t2` | `0, 1, X, X−1` give `0,0,0,1`; `X²−X−1, X²−5, X²+1, X²+4` give `3,10,2,8`. Scaling `X²−1` by 2 leaves its two roots and `T₂=2`. | Real body has the stated multiplicities and zero-polynomial junk value. |
| 2 | `t2_nonneg` | At `0`, `0 ≥ 0`; at `X²+1`, `2 ≥ 0`; power-sum alternative gives `−2`. | True, but padding: R08. |
| 3 | `candidates` | `C(0,−1)=∅`, `C(0,0)={1}`, `C(1,1)={X−1,X,X+1}`; zero polynomial excluded by monicity. | Correct degenerate behavior; add checks, R10. |
| 4 | `abs_coeff_le_of_t2` | `X²+2`: `k=0` gives `1≤1`, `k=1` gives `0≤2√2`, `k=2` gives `2≤2`. `X²`: `k=0` gives `1≤0^0=1`; `k=1,2` give `0≤0`. | Inequality sound on these inputs; `n>0` and `k≤n` are retained in Lean. |
| 5 | Maclaurin inequality | Multiset `(1,3)`, `k=2`: `e₂/choose(2,2)=3 ≤ ((1+3)/2)²=4`; `(2,2)` gives `4=4`; `(0,0)` gives `0=0`; `k=0` gives `1=1`. | Numerically sound; spell out Newton input and index range, R03. |
| 6 | Cauchy–Schwarz step in §1.1 | Norms `(1,3)`: mean `2 ≤ √5`; `(√2,√2)`: `√2=√2`. | Correct. |
| 7 | `candidates_finite` and coefficient-product count | `C(2,2)` has 9 elements; coefficient intervals `|a₁|≤2`, `|a₂|≤1` give product bound `5·3=15`, so `9≤15`. Degree 0 has cardinal 0 or 1. | Correct; explicit product formula should be stated, not just promised. |
| 8 | `sum_norm_sq_eq_t2_minpoly` | In `ℚ(√5)`, `φ`: `3=(2/2)·3`; `1`: `2=(2/1)·1`; `0`: `0=(2/1)·0`. In a quartic containing `ℚ(ω)`, `ω`: `4=(4/2)·2`. | Correct multiplicity factor, including a nongenerator and zero. |
| 9 | All-real coefficient formula | `X²−X−1`: `3=1−2(−1)`; `X−1`: `1≠(−1)²−2(−1)=3`; `1`: `0≠1²−2=−1` with truncated indices. | False as written: R02. |
| 10 | Equal-norm sharpness Check | Roots of `X²+2` have equal norm `√2`; `k=1` gives `0<2√2`, `k=2` gives `2=2`. | Fix equality criterion: R07. |
| 11 | `signVector` | `X²−X−1` maps to `[1,−1,1,−1]`; `X²+X−1` to `[1,1,1,−1]`; `X` to `[0,0]`; constants to `[]`. | Correct coefficient order; fixed monic degree matters. |
| 12 | `polredabsKey` | The quadratic pair has keys `(3,5,[1,−1,1,−1])` and `(3,5,[1,1,1,−1])`; first wins at the second list entry. Quartic norm ties have discriminants `1008,16128,81648`, so the discriminant tie-break acts before the coefficient list. | Agrees with LMFDB/PARI ordering. |
| 13 | `polredabsKey_injective_of_natDegree_eq` | The quadratic pair has different keys; `X−1` and itself have equal keys and equal coefficients. Without monicity, constant polynomials 1 and 2 both have norm 0, discriminant 1 and empty sign vector. | The monic/fixed-degree hypotheses exclude the wrong models. |
| 14 | `definingPolys` | For `ℚ(√5)`, `X²−X−1` and `X²−5` belong, but `X−1` and `X²+1` do not. For `ℚ`, `X` belongs, although its root is 0. | Primitive integral-element carrier is appropriate. |
| 15 | `monic_irreducible_natDegree_of_mem_definingPolys` | `X²−5` has leading coefficient 1, irreducible degree 2, matching `[ℚ(√5):ℚ]=2`. `X²−1` has a root in `ℚ`, but is reducible and has degree 2 rather than 1. | Membership eliminates the false example. |
| 16 | `mem_definingPolys_iff` | In `ℚ(√5)`, `P=X²−5`, `θ=√5`: both sides true, degree `2=2`, evaluation 0 and generated field top. In `ℚ`, `P=X²−1`, `θ=1`: evaluation 0 and generation hold, but `2≠1`, so both sides false. | Both directions survive this control. |
| 17 | `polredabs` definition | For `ℚ`, the minimum is `X`, key `(0,1,[0,0])`; for `ℚ(√5)` it is `X²−X−1`, key starting `(3,5)`, rather than `X²−5`, key starting `(10,20)`. | Actual minimum, not the fallback 0, in these examples. |
| 18 | `polredabs_mem` | `X` defines `ℚ` with degree 1; `X²−X−1` defines `ℚ(√5)` with degree 2. The fallback polynomial 0 is nonmonic and would fail membership. | Existence assertion is substantive and excludes fallback. |
| 19 | `polredabsKey_polredabs_le` | In the quadratic field, `(3,5,S₋)<(10,20,S(X²−5))` and `(3,5,S₋)<(3,5,S₊)`. Cyclotomic degree 4: both signed cyclotomic polynomials have `T₂=4`, discriminant 125, and the negative cubic coefficient wins. | Correct order direction. |
| 20 | Uniqueness / canonical monic-irreducible-degree consequences | Two quadratic norm minimizers have distinct keys; exactly one has the least key. Its degree is 2, leading coefficient 1, discriminant 5. | README deductions follow from key injectivity and membership. |
| 21 | `polredabs_eq_of_algEquiv` | Presentations by `X²−5` and `X²−X−1` both reduce to `X²−X−1`; presentations by `X³−X−1` and `g` have `T₂=3.264632999` and `3.219276205` but the same canonical output `g`. | Presentation invariance has a nontrivial test. |
| 22 | `nonempty_algEquiv_of_polredabs_eq` | The quadratic presentations above give equal canonical polynomials and an isomorphism. `K₋,K₊` both have `T₂=4√7` but canonical polynomials with coefficients `−5` and `5`, so equality of norm alone cannot trigger the theorem. | Correct converse; no identification by norm alone. |
| 23 | `nonempty_algEquiv_adjoinRoot` | `ℚ[X]/(X²−5)→ℚ(√5)` sends the root to `√5`, with source and target dimensions `2=2`. `X²−1` is reducible, so does not meet the hypotheses. | Native quotient and irreducibility assumptions are consistent. |
| 24 | Hermite admissibility convention | `A=(a)`, `a>0`: minimum `a`, determinant `a`, so Γ=1 gives equality. `A=[[2,1],[1,2]]`: minimum 2, determinant 3; Γ=1 gives `2>√3`, Γ=`2/√3` gives `2=2`. Rank 0: determinant 1, no nonzero vector. | Correct positive-rank convention; rank-zero use fails, R01. |
| 25 | Absolute quotient-lattice construction | Basis `(1,φ)` has `T₂` Gram matrix `[[2,1],[1,3]]`, determinant 5. Projection away from 1 has squared norm `3−1/2=5/2=5/2`, matching `|d|/n`. | Correct determinant and trace factor. |
| 26 | `hunter` | `ℚ(√5)`, trace 1: `3=1/2+5/2`. Cubic discriminant 49, trace 1: `5=1/3+(2/√3)√(49/3)`. Cubic discriminant −23: `3.219276205≤3.530554349`. | Equality boundaries and complex embeddings checked. |
| 27 | Trace normalization | For `φ+2` in degree 2: trace 5, `T₂=15`, projected value `15−25/2=5/2`; subtracting 2 gives trace 1, `T₂=3`, same projected value `3−1/2=5/2`. Negation reverses trace. | Translation/sign normalization works. |
| 28 | `admissible_rank_one` | `(a)=(2)`, vector 1: `2=1·2^(1/1)`. Rank 0 would have no such vector. | Correct but boundary padding, R08. |
| 29 | `hunterBound` | `(2,8,1)→4.5`; `(3,23,2/√3)→3.530554349`; `(3,49,2/√3)→5`; `(3,503,2/√3)→15.285107661`; `(4,1008,4/3)→9.421812797`. Total-function values: `n=0→0`, `n=1→Γ`. | Correct floor-before-cast and total divisions; completeness excludes degrees 0/1. |
| 30 | `hunterCandidates` | `H(2,8,1)` has 11 elements, signed discriminants `5,−3,−7,−4,8,−8`; `X²−1` is rejected as reducible; `X³+X−1` has `T₂=3.396713696` but squarefree discriminant magnitude 31, so fails at D=23. | Both norm and discriminant filters tested. |
| 31 | `hunterCandidates_finite` | `H(2,8,1)` has 11 elements in the finite coefficient box; `H(0,D,Γ)=∅` since the sole monic degree-zero polynomial is a unit. | Correct but immediate finite-subset padding, R08. |
| 32 | `exists_mem_hunterCandidates_of_prime` | `ℚ(√5)`, D=5: defining candidate `X²−X−1`, `3≤3`, `5=1²·5`. Cubic −23: candidate `g`, `3.219276205≤3.530554349`, `23=1²·23`. | Valid prime-degree instances and index formula. |
| 33 | `exists_mem_hunterCandidates_of_primitive` | For cubic −23, possible intermediate degrees are 1 and 3, and the same candidate works. In `K₋`, the quadratic subfield has degree 2 strictly between 1 and 4; minimum defining `T₂=10.583005244>9.421812797`. | Primitive hypothesis excludes the known failure. |
| 34 | `discr_pow_finrank_dvd_discr` | `ℚ⊆ℚ(√5)`: `1²∣5`. `ℚ(ω)⊆K₋`: `(−3)²=9∣1008`, quotient 112. Identity extension: `d¹∣d`, quotient 1. | Sign, exponent and identity case correct. |
| 35 | `exists_mem_hunterCandidates_or_subfield` | Cubic −23 has a defining Hunter candidate. `K₋` has no such candidate at the given bound, but `F=ℚ(ω)` has degrees `1<2<4` and `3²=9≤1008`. | Both alternatives exercised. |
| 36 | Relative projected Gram determinant | For `K₋/ℚ(ω)`, denominator `2²·3=12`; quotient determinant `1008/12=84`. Relative discriminant norm instead is `1008/3²=112`. | The roadmap correctly distinguishes 84 from 112. |
| 37 | `hunter_relative` | `K₋/ℚ(ω)`, relative trace 0: `4√7=(2/√3)√84=10.583005244`. Over `F=ℚ`, `K=ℚ(√5)`, representatives `{0,1}`: `3=1/2+5/2`. | Relative formula and absolute specialization agree. |
| 38 | Arbitrary trace representatives | Over `ℚ`, degree 2, choose residues `{2,3}` instead of `{0,1}`; `φ+1` has trace 3, `T₂=7`, giving `7=9/2+5/2`. Empty R fails to represent residue 0. | No hidden small-representative assumption; hR guarantees nonemptiness. |
| 39 | `relT2` | For `F=ℚ(ω)`, `X²−(2+ω)`: the two coefficient embeddings each give `T₂=2√7`, so total `4√7`. For `X²−ω` the total is 4; zero polynomial gives 0. | Native definition available; omitted from Lean, R05. |
| 40 | `relCandidates` | Relative degree 2, B=`4√7`: `X²−(2+ω)` belongs at equality; B=0 excludes it. At B=0, monic `X²` belongs with norm 0; negative B gives the empty set. | Discriminating membership controls; add to README, R10. |
| 41 | `relCandidates_finite` | For base `ℚ`, relative degree 2, B=2: 9 polynomials, agreeing with the absolute candidate set. For base `ℚ(ω)`, degree 2, B=0: only `X²`, cardinal 1. | Finiteness plausible; complex coefficient input must be explicit, R03. |
| 42 | `exists_mem_relCandidates_of_maximal` | `K₋/ℚ(ω)` has degree 2 and no intermediate extension; `x` satisfies `x²=2+ω`, trace 0, relative polynomial degree 2 and norm `4√7`. The base-field element ω has relative degree 1 and cannot generate the quartic. | Generation hypothesis excludes the wrong element; signature elaborates, R05. |
| 43 | `canonicalPolys` | `CP(0,D)=∅`; `CP(1,0)=∅`; `CP(1,1)={X}`. `CP(2,8)` has 6 elements; `CP(3,23)` has 1. | Degree and discriminant boundary conventions consistent. |
| 44 | `hunterImage` | At `(2,8,1)`, 11 candidates collapse to 6 canonical outputs. At `(3,49,2/√3)`, 28 polynomial candidates include two each of polynomial discriminants −104 and −108, removed by the field-discriminant filter; outputs have discriminants −23,−31,−44,49. | Filtering by field discriminant is essential. |
| 45 | `hunterImage_finite` | Image cardinalities `6≤11` and `1≤4` at the quadratic and smallest-cubic bounds. Degree 0 image cardinal 0. | Correct finite-image behavior. |
| 46 | `hunterImage_subset_canonicalPolys` | For `(2,8,1)`, six outputs all have degree 2 and `|d|≤8`; for `(1,0,0)`, candidate `X` fails the field-discriminant filter `1≤0`, so the image is empty. | Inclusion holds in positive and empty examples. |
| 47 | `hunterImage_eq_canonicalPolys_of_prime` | At `(2,8,1)`, both sides are the same six quadratics listed in the README. At `(3,23,2/√3)`, both equal `{g}`. At D=49 both have four outputs. | Equality tested in both directions. |
| 48 | Composite complete-list equality | As written, rank-zero admissibility has 0 possible constants. With ranks 1–3 only, `K₋,K₊` are absent from the absolute image but enter the relative union over a degree-2 base with `3≤⌊√1008⌋=31`, relative norm `4√7`. | Repair R01 and state the headline in Lean, R05. |
| 49 | `canonicalPolys_finite` | Cardinalities at `(0,8),(1,0),(1,1),(2,8),(3,23),(3,49)` are `0,0,1,6,1,4`. | Consistent with Hermite finiteness; this is not a new qualitative finiteness theorem. |
| 50 | `ncard_canonicalPolys_le` | D=1: pinned rank bound 1, coefficient bound `ceil(√10)=4`, count bound `9²·1=81`; `CP(1,1)` gives `1≤81`. D=0: rank 1, coefficient bound `ceil(√2)=2`, bound 25; empty CP gives `0≤25`. | No zero-threshold/zero-cardinality problem. |
| 51 | `setOf_hasLMFDBIntrinsicLabel_subset` | Prefix `2.2.5`: one polynomial of field discriminant 5 in `CP(2,5)`. Prefix `2.0.4`: one polynomial `X²+1`, signed discriminant −4, in `CP(2,4)`. Prefix `4.0.1008`: two polynomials. | Native prefix means field discriminant, not polynomial discriminant or database index. |
| 52 | Universe, characteristic and denominators | `AdjoinRoot(X²−5)` provides a model in `Type` of degree 2 and discriminant 5. Zero ring and characteristic-p fields fail `[Field]`/`[NumberField]`. For the relative quartic, `n−m=2`, denominator `m'^m·|d_F|=12`; the identity extension has `m'=1` and is excluded. | Universe reduction and nonzero-denominator hypotheses are appropriate. |

The candidate counts were recomputed in the coefficient boxes, not inferred from the number of fields. At cubic bound 49 the 28 candidates divide by polynomial discriminant as follows: 10 of −23, 6 of −31, 6 of −44, 2 of 49, 2 of −104 and 2 of −108. This tests the purpose of the final field-discriminant filter. Quadratic and cubic root computations reproduced every quoted decimal to the displayed precision.

The canonical-polynomial controls were also checked using the displayed integral generators. In the Dedekind cubic, replacing the generator θ by `1 + (θ − θ²)/2` gives the polynomial `X³−X²+2X+8` and norm `13.158646091`, compared with `13.439915867` for θ. For `K₋`, write an integral element as `a+b x+c x²+d x³`. Its norm is

`4a²+20ac+28c² + √7(4b²+20bd+28d²)`.

The odd part is nonzero for a generator outside the quadratic subfield. Its integer quadratic form has minimum 4, attained at `(b,d)=(±1,0),(-2,1),(2,-1),(-3,1),(3,-1)`. Their polynomials have discriminants `1008`, `16128`, `81648`; the discriminant tie-break selects the displayed canonical polynomial. The plus quartic has the corresponding minus signs in the mixed terms. This independently explains both the norm tie and why the discriminant coordinate of the key is necessary. Numerical lattice searches corroborated the cubic, quartic and fifth-cyclotomic minima; these searches are evidence, not a substitute for the planned proofs.

**Pinned-library and ownership audit.** The checked revisions are Mathlib `f6090c7095e1e56b3464c1daba5f24631f1290d2` and Tau Ceti `358314d4ab97483df4fc4cb8adcc02e74a8d9f5a`. The following 24 source entries were opened or inspected at those pins; file paths below are relative to their respective library repositories.

| # | Pinned source and locator | Verified contract / limit |
|---|---|---|
| 1 | `Mathlib/NumberTheory/NumberField/Basic.lean:43` | `NumberField` supplies characteristic zero and finite dimension over ℚ. |
| 2 | `Mathlib/NumberTheory/NumberField/Basic.lean:60` | An algebra between number fields is finite-dimensional; intermediate fields are number fields at line 71. |
| 3 | `Mathlib/NumberTheory/NumberField/Basic.lean:446` | `AdjoinRoot.numberField` requires `Fact (Irreducible f)` for `f : ℚ[X]`. |
| 4 | `Mathlib/Algebra/Polynomial/Roots.lean:56` | `Polynomial.roots` counts multiplicities and assigns the empty multiset to zero. |
| 5 | `Mathlib/Algebra/Polynomial/Roots.lean:196` | `Polynomial.roots_X_sub_C` supplies the linear-root counterexample computation. |
| 6 | `Mathlib/RingTheory/Polynomial/Vieta.lean:116` | `coeff_eq_esymm_roots_of_card` includes the leading coefficient and requires the root-cardinality equality. |
| 7 | `Mathlib/RingTheory/Polynomial/Resultant/Basic.lean:935` | `Polynomial.discr` is native; it is not the field discriminant of an arbitrary defining polynomial. |
| 8 | `Mathlib/FieldTheory/Minpoly/IsIntegrallyClosed.lean:57` | `minpoly.isIntegrallyClosed_eq_field_fractions'` carries domain, integrality, algebra and scalar-tower hypotheses. |
| 9 | `Mathlib/NumberTheory/NumberField/InfinitePlace/Embeddings.lean:55` | Finitely many complex embeddings; line 61 identifies their number with degree. |
| 10 | `Mathlib/NumberTheory/NumberField/InfinitePlace/Embeddings.lean:94` | `coeff_bdd_of_norm_le` bounds a minimal polynomial from a uniform conjugate bound, not from the sum of squared norms. |
| 11 | `Mathlib/NumberTheory/NumberField/InfinitePlace/Embeddings.lean:109` | `finite_of_norm_le` is finiteness of integral elements in a fixed number field with all conjugates bounded. |
| 12 | `Mathlib/LinearAlgebra/Matrix/PosDef.lean:164` | `PosDef` includes Hermitian symmetry and positivity on nonzero finitely supported vectors; in dimension zero positivity is vacuous. |
| 13 | `Mathlib/Algebra/Module/ZLattice/Covolume.lean:72` | Native real covolume depends on the Haar measure. |
| 14 | `Mathlib/MeasureTheory/Group/GeometryOfNumbers.lean:91` | The non-strict Minkowski lattice theorem needs nontrivial finite-dimensional ambient space, compactness, symmetry, convexity and a fundamental domain. |
| 15 | `Mathlib/NumberTheory/NumberField/Discriminant/Basic.lean:242` | `abs_discr_ge` has the nontrivial degree hypothesis. |
| 16 | `Mathlib/NumberTheory/NumberField/Discriminant/Basic.lean:332` and `:494` | `rankOfDiscrBdd` and `finite_of_discr_bdd` use bounded discriminant; finiteness is for subfields of a fixed characteristic-zero ambient field. |
| 17 | `TauCeti/NumberTheory/NumberField/Index/Basic.lean:68` and `:108` | Integral primitive elements carry the generation equation; index is the cardinality of the finite order quotient. |
| 18 | `TauCeti/NumberTheory/NumberField/Index/Discriminant.lean:58` | `discr_minpoly_eq_index_sq_mul_discr` gives the signed integer index formula. |
| 19 | `TauCeti/RingTheory/DedekindDomain/Discriminant/Basic.lean:33` | `relDiscr` is relative norm of the different for finite torsion-free Dedekind algebras. |
| 20 | `TauCeti/RingTheory/DedekindDomain/Discriminant/Separable.lean:50` and `TauCeti/NumberTheory/NumberField/Discriminant/Relative.lean:37` | Separable tower formula and identification over ℤ; the number-field tower form is at line 43 of the latter file. |
| 21 | `TauCeti/NumberTheory/NumberField/IntrinsicLabel.lean:72` | `HasLMFDBIntrinsicLabel` is exactly degree, real-place count, and natural absolute field discriminant; it contains no canonical polynomial or fourth index. |
| 22 | `TauCeti/NumberTheory/EffectiveBounds/HermiteCount/Basic.lean:78`, `:139`, `:172`, `:202` | Coefficient bound, explicit finite generating family, effective field count, and `hermiteCountBound`. The generating-family theorem is the overlooked supplier in R06. |
| 23 | `TauCeti/Algebra/Module/ZLattice/Covolume.lean:42` | `ZLattice.covolume_sq_eq_det_gram` is available for full discrete lattices with a ℤ-basis; it does not by itself build the projected quotient lattice. |
| 24 | `TauCeti/NumberTheory/NumberField/WorkedExamples/Cubic23/Invariants.lean:87`, `DedekindCubic/Invariants.lean:61`, `FifthCyclotomic/Invariants.lean:85` under the same WorkedExamples directory | The field discriminants/prefixes used in the examples are supplied. `Index/DedekindCubic/RingOfIntegers.lean:173` supplies the Dedekind integral basis. These files are not proofs of this roadmap's canonical-minimum assertions. |

Additional named primitives (`Polynomial.map`, `Monic`, `natDegree`, `Multiset.esymm`, `Algebra.trace`, `Algebra.adjoin`, `IntermediateField`, the lexicographic orders, and ideal-span divisibility) were checked through source references and elaboration. In particular `Ideal.span_singleton_dvd_span_singleton_iff_dvd` is in `Mathlib/RingTheory/Ideal/Operations.lean:1301`, and the existing subfield-divisibility proof elaborates. No silently dropped finite-dimensionality or scalar-tower assumption was found: the ℚ-towers are canonical for number fields.

Ownership searches used the roadmap service on main and open heads, the supplied sibling checkouts, and the readable board packages, searching the objects (norms, symmetric inequalities, bounded generating polynomials, discriminants, canonical polynomials and Hermite constants), not just these declaration names. The namespace search found only this roadmap's `TauCetiRoadmap.NumberFieldEnumeration`. No conflicting owner of Hunter's theorem, the polredabs construction or the relative candidate theorem was found in the readable material. This roadmap can own those sharper constructions. The finite generating-family input already belongs to Effective Bounds, as R06 records.

Six supplier locations were resolved on main: `Completed/NumberFieldArithmetic/README.md:840` (§3.1), `:904` (§3.3), `:1092` (§4.1), `:1123` (§4.2), `:2140` (§8.1), and Effective Bounds Layer 2. The latter explicitly builds bounded defining-polynomial coefficients as well as the count. Number Field Arithmetic §8.1 explicitly excludes canonical polynomials, so this is not a re-plan of that completed roadmap. Two completed roadmaps and SuccessiveMinima on main were read for scope and form. `LatticePackingsAndPerfectForms` at its supplied open head, §§1.5 and 2.1–2.3, owns the Hermite constant and its small-rank values. Here it is an ownership exclusion, not a supplier of a theorem used in a Lean hypothesis. The hypotheses genuinely accept arbitrary admissible Γ. The proposed ArtinRepresentations and BianchiModularForms uses are downstream claims, not prerequisites; they create no reverse supply edge.

**Dependency result**, run with the requested candidate order, `--movable`, and main content:

```text
depcheck: 204 roadmaps, 1560 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. The six existing `Prerequisites` blocks were read manually as dependency declarations. The degree-recursive use of §2.3 from §2.2 is well-founded on proper divisors after specifying base cases; it is not a same-degree circular proof. There are no declared supplier gaps. R03 identifies unstated internal proof inputs, not a missing declared supplier contract. No computational algorithm is a target, no sorry-valued data or `set_option` occurs, and no outside-folder diff was found.

**Lean checks and headlines.** All 36 declarations were checked with `#check @name` in a scratch copy and compared with the README and the supplied signature inventory. No section binder was lost. An additional import-only probe found the four unavailable names described in R11; this is a contract-documentation issue, not a missing pinned declaration. The original file elaborates; the targeted build completes but reproduces the gate's disallowed module warning. The padding pass tried `simp`, `rfl` and `infer_instance` for every one of the 24 admitted theorems, with direct library-lemma probes for the elementary norm/subset statements. Two of those admitted declarations closed as described in R08; failure of those simple probes on the other 22 is not a proof of depth. The relative-completeness extension and the two mathematical counterexamples were separately elaborated successfully, without option overrides. No Lean process was left running.

The README's headline results are: the coefficient bound and bounded-polynomial finiteness (§1.1); existence/uniqueness and the isomorphism-class characterization of the canonical polynomial (§1.2); absolute Hunter (§1.3); prime-degree and primitive-field completeness (§2.1); subfield reduction, relative Hunter and maximal-subfield relative completeness (§2.2); and the prime/composite complete lists, canonical-list finiteness, effective-count comparison and prefix specialization (§2.3). Absolute Hunter, relative Hunter, prime/primitive completeness, the prime complete-list equality and the canonical-polynomial characterization are represented at the right generality. The omitted relative and composite completeness results are the substantive acceptance-test omission in R05. The prefix subset declaration states only the easy inclusion, so it should not be presented as independently certifying the full exact prefix description.

**Seeded source audit.** All six requested targets were inspected. There are no explicitly flagged unverified locators in the README. Every cited reference group was submitted to the sources service; four LMFDB knowls and its cited source-code file were checked separately. Source text remained outside the repository. The two unresolved source requests are listed under Not verifiable.

| Target | Source text inspected | Result |
|---|---|---|
| §1.1 | `lmfdb-polredabs` lines 90–100; pinned Vieta source above; HLP Chapter II requested | The norm convention is confirmed. The coefficient estimate follows from the stated inequalities on the tested inputs, but the HLP text/precise theorem locator was not certified. R02, R03 and R07 apply. |
| §1.2 | `lmfdb-polredabs` lines 90–102; `pari-guide` lines 3847–3864 | All three key components, their order and the negative-sign tie-break agree. These locators define the ordering; existence, uniqueness and isomorphism invariance are the roadmap's deductions. |
| §1.3 | `hunter1957` lines 15–39 and 108–112, Theorem 1, printed pp.57–59; `martinet1985` lines 323–390, Theorem 2.6 and Corollary 2.9, author-version pp.7–8 | Hunter's original theorem is quintic. Martinet supplies the general projected-norm inequality. The determinant and formula were read in page images where extraction lost mathematics. The nonnegative trace choice is a translation/sign deduction. |
| §2.1 | `hunter1957` lines 108–112; `martinet1985` lines 434–444; pinned index formula | The prime/primitive generation argument is supported by the absence of proper intermediate degrees, with the index/discriminant filter supplied at the pin. The exact candidate-set theorem is a deduction, not a separately located theorem in Cohen. |
| §2.2 | `martinet1985` lines 378–387, Theorem 2.8, author-version p.8; lines 434–444, following §2.12, author-version p.9; pinned tower discriminant | Relative factor `1/m'`, rank `n−m`, denominator `m'^m |d_F|`, and invariance under base-field translation match. The source does not remove the need to state the complex coefficient bound and relative completeness in this roadmap. |
| §2.3 | `jonesroberts2014` lines 190–235, arXiv:1404.0266v1 §3, pp.4–5; `lmfdb-label` lines 90–100; `lmfdb-discriminant`; `lmfdb-code` | The database's completeness metadata and intrinsic label components are supported. No exact universal equality with this roadmap's `canonicalPolys` is stated there; that equality is a new deduction from §§1–2. The arXiv text was not silently assigned published page numbers. |

## Not verifiable

- **HLP 1952, Chapter II (`hlp1952`).** The sources service and a Cambridge publisher/table-of-contents search did not produce a legally readable full text. No unofficial mirror was downloaded. The precise Newton/Maclaurin theorem/page locator remains uncertified; the numerical and algebraic checks above are independent of that text.
- **Hermite 1850, pp.261–315 (`hermite1850`).** The sources service and GDZ/EuDML title searches did not produce a readable copy. The README gives no narrower locator. The historical citation for the general admissible constant was not certified. The rank-one and A₂ examples were checked directly.
- **Cohen 1993 (`cohen1993`) and Pohst 1982 (`pohst1982`).** The sources service classified these as uncertified/paywalled. Their asserted section contents were not guessed, and they are not new missing-text requests. Martinet supplies an accessible source for the general Hunter formulas.
- **Published-version alignment.** Martinet's accessible author version explicitly mentions corrections and uses its own page numbers. Jones–Roberts was read as arXiv:1404.0266v1. The published pagination/numbering was not independently aligned; cite the versions read until that is done.
- **Board heads without supplied readable files.** Readable local packages and the supplied board index were searched. Ownership at separate, unprovided board-PR heads was not asserted. Open roadmap ownership was checked through the supplied heads and roadmap service; no claim is made about unavailable private or unlisted work.
- **Global computation certification.** The independent polynomial/lattice calculations corroborate the displayed small examples; they are not formal certificates for all canonical minima or a proof of the complete-list theorems. Those remain the roadmap's intended mathematics.

The source request file contains only the two unresolved works, HLP and Hermite. Resolved fetch failures were removed from that scratch request; no roadmap manifest was edited. The review is complete and is not parked on those sources.

## Source issues

- **Misprint** in martinet1985 at the derivation immediately before Theorem 2.8, author-version printed page 8 (`martinet1985` line 365): the source says the complex-coordinate range ends at s′; it should be r′+s′; affects the proof.
