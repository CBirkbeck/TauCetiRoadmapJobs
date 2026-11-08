# Review of CountingBundlesAndHallAlgebrasOfCurves (pull request #1547 at 601e2d6)

**Verdict:** needs changes

This is an incremental re-review of the 24 lines changed since 496cdee. The change replaces every citation of CohomologicalPointCounting (and its FrobeniusGeometry, CompactSupport, EllAdicRealization and TraceFormula layers) by EtaleCohomologyFoundations and InverseGaloisAndArithmeticFundamentalGroups, in the Scope paragraph, two supplier-contract subsections, the routes and `*Needs:*` lines of §§9.1, 9.3 and 9.4, and the Layer 9 Dependencies list. The new citations are correct and resolve; the only findings are the two registration items the previous review left open, which this head does not touch.

## R01 (P3) — Supplier-gap register still out of step with the README

**Location:** `TauCetiRoadmap/CountingBundlesAndHallAlgebrasOfCurves/README.md:139` (“What RepresentationTheory/SchurWeyl must provide (gap:stable-symmetric-functions)”) and `README.md:103`; `packages/CountingBundlesAndHallAlgebrasOfCurves/design/plan.json`, top-level `gaps`.

**Claim:** Every gap the README states under `## Exact supplier contracts` is declared for the intake, and every declared gap is one the retained route consumes.

**Witness:** The README carries seven slugs (lines 95, 103, 109, 125, 139, 158, 176); the plan's `gaps` carries seven; six coincide. `stable-symmetric-functions` is only in the README; `two-line-chart-epimorphism` is only in the plan. The plan's `reductive-character-git` needs still asks for King's invariant-subspace criterion; README:103 does not.

Consequence: the stable symmetric-function contract, which the Macdonald contract (README:158) and §10.3 consume, is not a declared gap for the intake, so it will not be announced on the supplier's job; the chart gap would be announced although no retained target uses it (no `Q₁₂`, two-Hom-frame or first-evaluation passage remains in the README).

**Exact repair:** In the plan's `gaps` (the one part of `plan.json` the package stage may change) add `stable-symmetric-functions` with supplier `RepresentationTheory/SchurWeyl`, section “Layer 7, stable continuation”, and the one-sentence needs of README:139–143; drop the `two-line-chart-epimorphism` entry and the King clause of `reductive-character-git`. No README change.

**Repair test:** With that edit the slug sets are 7/7 with symmetric difference 0. The stable contract's own values stand as before: degree-two Hall Gram matrix diag(2,2) with mixed entry 0 on power sums, Schur Gram matrix I₂; both p₂ and p₁² specialize to x² in one variable, which is why the stable carrier cannot be the finite-variable one at the pin.

Not re-raised as a new mathematical defect: the previous review's R01 was already reduced to this registration difference.

## R02 (P3) — M20P is cited but not recorded in the manifest

**Location:** `TauCetiRoadmap/CountingBundlesAndHallAlgebrasOfCurves/README.md:21`, 137, 1470 and 1598 (“**M20P.** Anton Mellit, Poincaré polynomials of character varieties, Macdonald polynomials and affine Springer fibers”); `packages/CountingBundlesAndHallAlgebrasOfCurves/sources.toml`.

**Claim:** Every cited work is recorded in `sources.toml`.

**Witness:** `sources.toml` contains neither a key `M20P` nor arXiv 1710.04513; the README cites M20P at four places, including the stable symmetric-function contract (M20P line 203 and line 415) and the parabolic theorem (M20P line 2433 and line 2503).

**Exact repair:** Register `M20P` for arXiv:1710.04513v1 through the sources service (legal arXiv text), with `locator_scheme` theorem, locators §2.1/Proposition 2.1, pp.6–7; §2.3, pp.10–11; Theorem 7.1 and Corollary 7.4, pp.54–55; `cited_for` Scope, the stable contract and §11.2. Keep the single key; do not rename.

**Repair test:** The cached text at those lines carries the compatible-family definition, the Hall pairing and the parabolic polynomiality/degree-independence statements the README attributes to it (checked in the previous round; the README's M20P passages are unchanged at this head).

## Previous findings

- R01 — not repaired: the plan's `gaps` still list `two-line-chart-epimorphism` and King's criterion and still lack `stable-symmetric-functions`; README:139 still states that contract. Re-raised as R01.
- R02 — not repaired: `sources.toml` still has no `M20P` entry; README:21, 137, 1470, 1598 still cite it. Re-raised as R02.

## Verified sound

I read the whole diff (14 insertions, 10 deletions, README only), the Scope paragraph, the three supplier-contract subsections it touches, §§9.1–9.4 with their Checks, Examples and Dependencies, the module docstring and the five declarations of `Suggested.lean`, and the previous report. The change is purely a supplier re-pointing: no mathematical statement, Check, hypothesis or Lean signature changed, and the PR's outside-folder diff against `origin/main` is empty. The worktree is clean.

### Gate, dependency check and elaboration

Reran the gate on 601e2d6: every scanner is zero and the result is OK (my invocation prints no `build` field; the worker's run reports `build=0`). Dependency check output, verbatim:

```text
depcheck: 240 roadmaps, 2360 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. `lake env lean` on `Suggested.lean` exits 0 with exactly the two `sorry` warnings (lines 84 and 94); the targeted build completed (9034 jobs) with the same two warnings. One scratch file with `#check @name` for all five declarations elaborated; every binder is as the README states: the three definitions keep `k`, `[Field k]`, `X`, `[X.Over (Spec k)]` and their rank/bundle/degree arguments; `nilpotent_matrix_count` keeps `[Field K] [Finite K] (n : ℕ)`; `absIndecCount_eq_of_degree` keeps `[Finite k]`, `IsProper`, `SmoothOfRelativeDimension 1`, `GeometricallyConnected`, then `r d d'`. Nothing changed, so the previous round's six one-tactic probes (simp, rfl, infer_instance on both theorems, all failing) stand; no padding and no newly statable headline.

### Supplier direction and ownership

| Citation (new at this head) | Resolved where | Position | Boundary |
|---|---|---|---|
| EtaleCohomologyFoundations §§0.7–0.8 | main `TauCetiRoadmap/EtaleCohomologyFoundations/README.md:439,565` | on main (merged; not an ORDER line) | `supportLocalization` triangles and Mayer–Vietoris for any ring Λ; `properSupports` `R⁺f!=Rp_*j_!` for separated finitely presented maps of qcqs schemes on `D⁺` torsion complexes |
| EtaleCohomologyFoundations §§F.2.4–F.2.5 | main README:592,613 | on main | arbitrary cartesian exchange `g*Rf!K≅Rf′!g′*K` for Noetherian bases, finite Λ with invertible annihilator, `K∈Dᵇ_ctf`; `RΓc` with localization, proper comparison, field-extension exchange |
| EtaleCohomologyFoundations §F.3 | main README:676 (`compactSupportFiniteness` at 736) | on main | `Rf!K∈Dᵇ_ctf`; finite, bounded, perfect `RΓc` over separably closed fields; generic ULA open |
| EtaleCohomologyFoundations §§F.4.5–F.4.6 | main README:1041,1089 | on main | rational realization with constructible integral models, finite-dimensional `Hⁱ_c`; continuous `G_k` action, `Rf!` exchange passed through normalized systems |
| EtaleCohomologyFoundations §§F.10.1–F.10.2b | main README:907,940,1108 | on main | `X(k_r)≃Fix(Frobʳ)`, `numberOfRationalPoints`; scheme-Frobenius = geometric Galois Frobenius, inverse to arithmetic, through realization |
| InverseGaloisAndArithmeticFundamentalGroups §§IG.0.T3–IG.0.T4 | open head #850 (`roadmaps show`), lines 537 and 559 | ORDER line 44, before this roadmap at 343 | rational constructible trace formula for every `r≥1` on separated finite-type `X/𝔽_q`; constant-sheaf point count `#X(k_r)=Σ(−1)ⁱTr(Frob_qʳ|Hⁱc)` |
| ComplexComparisonPartII §§C6.3–C6.6 (retained in the changed `*Needs:*` lines) | open head #848, headings at lines 4158, 4217, 4258, 4324 | ORDER line 39 | finite, compact-support, lower-shriek and integral/rational Artin comparison |

No reference to CohomologicalPointCounting, FrobeniusGeometry, CompactSupport, EllAdicRealization or TraceFormula layers remains in the README or the Lean file. The new owners are the same objects the README names: compact cohomology and base change (ECF), trace formula and point count (IGAFG), complex comparison (CCPII). No second owner is introduced and nothing is restated locally. Ownership against open pull requests without supplied files was not checked beyond the `roadmaps show` resolution above.

Hypothesis fit of the consuming routes: §9.3 spreads over a finitely generated integral subring `R⊂ℂ[1/ℓ]`, so the base is Noetherian with `ℓ` invertible, the Higgs scheme is separated of finite type, and F.2.4/F.3 apply with finite coefficients, lifted to `ℚ_ℓ` by F.4.5–F.4.6; the dense open with lisse cohomology sheaves exists because each `Rⁱπ_!` is constructible on the irreducible `Spec R` (F.4.5 stratification), the generic point lies in every dense open, and a closed point of a finite-type ℤ-scheme has finite residue field. §9.4's “after every finite extension” matches IG.0.T3's “every `r≥1`”. §9.1 cites IG.0.T3–T4 although its statement (purity and the BB identities) uses only the ECF and EDPS inputs; this is an unused item on a `*Needs:*` line, noted, not a finding, and it was already present as TraceFormula before the change.

### Adversarial rows for the changed passages

| Statement | Instances tried | Values computed on each side / negative control | Result; change |
|---|---|---|---|
| README:186 compact alternating traces | `𝔸¹`, `𝔾_m` over `𝔽_q`, `r=1` | `𝔸¹`: `H²c=ℚ_ℓ(−1)`, trace `q`; point count `q`. `𝔾_m`: `H¹c=ℚ_ℓ` (trace 1), `H²c=ℚ_ℓ(−1)` (trace `q`); alternating `−1+q=q−1`; point count `q−1`. Ordinary cohomology: `𝔾_m` gives `1−q`, `𝔸¹` gives `1` | Both compact values agree with IG.0.T3/T4 Checks and F.10.2b's `𝔸¹` Check; ordinary is wrong in both cases, the README claims only the latter; no change |
| README:180–182 ECF contract vs. 9.3 base | `π:𝔸¹_R→Spec R`, `R=ℤ[1/ℓ]`; closed point `𝔽_q`, generic point `ℚ̄` | `R²π_!ℚ_ℓ` stalks `ℚ_ℓ(−1)` at both points, rank 1 everywhere, other degrees 0; `H⁰c(𝔸¹)=0` vs. `H⁰=Λ` (F.2.5 Check) | Lisse on all of `Spec R`; base change and realization are within F.2.4/F.4.5 hypotheses; no change |
| README:1310 §9.3 spread-out route | elliptic `E/ℂ`, `r=1`, `H=Pic^d×𝔸¹`, `D=1` | Compact ranks `(1,2,1)` in degrees `2,3,4` at the closed point and at `ℂ`; signed polynomial `t²−2t³+t⁴=t²(1−t)²`; `A_{1,1,d}(t,t)` with `q=t²` is `1−2t+t²`; top degree `4=4D`. Ordinary cohomology would give `1−2t+t²` with top degree 2 | Agrees with the §9.3 Check and the `4D` claim; compact support is necessary; no change |
| README:1312, 1326 `*Needs:*` of §§9.3, 9.4 | reciprocal trace at `r=1,2` for `Λ=Pic^d`, `g=2` | `#Λ(𝔽_q)=q²∏(1−α_j⁻¹)=P(1)` at `r=1`; at `r=2` the same with `α_j²`, as IG.0.T3 supplies every `r` | Supplier statement covers the “every finite extension” clause; no change |
| README:18 Scope ownership sentence | objects: compact cohomology, base change, realization, trace formula, comparison | ECF owns the first three (sections above), IGAFG the fourth, CCPII the fifth; the README plans none of them | Single owner per object; no change |
| README:1342 Layer 9 Dependencies | list vs. union of §§9.1–9.4 `*Needs:*` | Every roadmap citation in the four `*Needs:*` lines appears in the list and conversely | Consistent; no change |

### Seeded sample and headlines (unchanged statements, carried forward)

No target of the seeded sample is touched by the diff; each row below keeps the computed evidence of the previous report, which it cites.

| Statement | Instances | Values computed on the two sides / negative control | Result and provenance |
|---|---|---|---|
| 1.3 radical and semisimple matrix quotient | `N=𝔽₂[t]/t²`; `N²` | rad End(N) dimension 1; `M₂(rad)` dimension 4; quotient cardinal 16, versus erroneous diagonal dimension 2 | Agrees. Evidence: previous review PRREVIEW~2, row 1.3 |
| 1.9 large degree and nonnegative HN slopes | rank 1, `d=−1,0,1`; `g=2,r=2,d=3` | cut indicators 0,1,1; threshold `(g−1)r(r−1)=2`, and `3>2` | Agrees. Evidence: PRREVIEW~2, row 1.9 |
| 2.3 nilpotent-pair exponential identity | one absolute line species, `q=2`, multiplicity ≤2 | mass coefficients `(1,1,2/3)`; `exp(T+T²/6+…)` gives `(1,1,1/2+1/6)` | Agrees. Evidence: PRREVIEW~2, row 2.3 |
| 2.4 Jordan type of a coherent nilpotent pair | zero map on a line; size-2 block; length-2 torsion | `α₁=(1,0)`; `r₂=1` gives weighted rank 2; `α₂=(0,1)` gives degree 2 | Retains internal zeros. Evidence: PRREVIEW~2, row 2.4 |
| 2.6 Jordan grading functors | size-2 block on `O(−1)²`; `t` on `k[t]/t²` | `H₁=0,H₂=H`; total and quotient minima both −1, then both +∞ | Both directions agree. Evidence: PRREVIEW~2, row 2.6 |
| 4.5 HN relations for truncated Eisenstein series | `ℙ¹`, `O(1)⊕O(−1)` | `E=3`; prefactor `q^(−1/2)` and shifts `q⁻¹` give `q^(−3/2)`, cancelling Hall `q^(3/2)` | Agrees. Evidence: PRREVIEW~2, row 4.5 |
| 4.7 HN strata are spherical | `ℙ¹` types `((2,0))`, `((1,1),(1,−1))`, `((1,0),(1,0))` | class counts 1,1,0; last has equal successive slopes | Agrees. Evidence: PRREVIEW~2, row 4.7 |
| 4.8 universal spherical Hall form | `ℙ¹` one-line mass at `q=2,3` | `P/(q−1)=1,1/2`, matching `1/#Aut`; flag twist cancels `√q·q^(−1/2)=1` | Agrees. Evidence: PRREVIEW~2, row 4.8 |
| 5.4 separation of regional expansions | `f=1/(1−z)` at 0 and ∞ | `(1−z)Σ_(n≥0)zⁿ=1`; `(1−z)(−Σ_(n<0)zⁿ)=1` | Agrees. Evidence: PRREVIEW~2, row 5.4 |
| 5.7 generic Jordan-type generating sum | `r₂=1`; `α₂=(1,3)`; empty rank type | weighted monomial `T²z⁶`, not `Tz³`; empty type has torsion coefficient `#X/(q−1)`, not 0 | Agrees. Evidence: PRREVIEW~2, row 5.7 |
| 6.2 eventually periodic residue extraction | `r=2,b=(2,3),K=ℚ` | differential residues `(−5/2,1/2)`; negative Fourier sums 2,3; in characteristic 2 the denominator is `(1−z)²` | Characteristic condition necessary. Evidence: PRREVIEW~2, row 6.2 |
| 7.2 Serre-dual Higgs criterion | `W=ke₁`; matrices `[[1,1],[0,2]]`, `[[1,0],[1,2]]` | lower-left entries 0,1 give preservation true,false and factorization true,false | Both directions agree. Evidence: PRREVIEW~2, row 7.2 |
| 8.3 all-characteristic coprime Higgs count | `E` over `𝔽₂/𝔽₄`; `ℙ¹` rank 1/rank 2 | point enumeration 3,9; Higgs counts `6,36=qP`; stack masses 6,12; `ℙ¹` counts 1,0 | `q` is the field size. Evidence: PRREVIEW~2, row 8.3 |
| 9.1 pure Higgs cohomology and BB shifts (headline; `*Needs:*` changed) | rank 1, `g=2`; `𝔸¹` | `H_c^n=H^(n−4)(Pic)(−2)`; `𝔸¹` contributes rank 1 in degree 2 with eigenvalue `q` | Shifts and twists agree; the re-pointed suppliers carry these objects (rows above). Evidence: PRREVIEW~2, row 9.1 |
| 9.3 compact Poincaré polynomial (headline; route and `*Needs:*` changed) | rank 1, `g=1,2` | signed `t²−2t³+t⁴`, `t⁴−4t⁵+6t⁶−4t⁷+t⁸`; top degrees 4,8 | Agrees; recomputed above for the new route. Evidence: PRREVIEW~2, row 9.3 |
| 9.4 nilpotent-cone trace and components (headline; `*Needs:*` changed) | rank 1, `g=2`; two exchanged components | `q²∏(1−α⁻¹)=P`; top degree 4 dimension 1; exchanged components dimension 2, trace 0 | Prefactor `q^D` and dimension/trace distinction agree. Evidence: PRREVIEW~2, row 9.4 |
| 11.4 universal slope-cut counting functions | rank 1, `d=−1,0`, `ν=0` and duals | lower-cut counts 0,`P`; upper-cut dual degrees 1,0 give 0,`P` | Both directions agree. Evidence: PRREVIEW~2, row 11.4 |
| 11.5 Euler-characteristic spherical Hall Lie algebra | `ℙ¹_ℂ`, torsion degree 1 and line degree `d` | product at `O(d+1)` is `χ(ℙ¹)=2`; reversed product 0; commutator 2; primitive equation `c=2c` forces `c=0` | Order and primitive controls agree. Evidence: PRREVIEW~2, row 11.5 |
| 1.4 `nilpotent_matrix_count` (Lean headline) | `n=0,1,2` over `𝔽₂`; `n=2` over `𝔽₃` | counts 1,1,4,9 equal `q^(n(n−1))` | Exact enumeration agrees. Evidence: PRREVIEW~2, row 1.4 |
| 10.4 `absIndecCount_eq_of_degree` (Lean headline) | rank-one kernel `q=2,a=−1`; `f₂(1,5)=15=f₁(15)` | both eventual counts 6; wrong `q=2` shift gives 10 | Agrees. Evidence: PRREVIEW~2, Layer 10 consumers row |

The remaining 60-odd rows of the previous ledger (Layers 0–8, 10–11, conventions) concern statements the diff does not touch or cite; they are retained by reference to PRREVIEW~2 and not reproduced here.

### Declared gaps

The seven gaps the brief lists have named suppliers and precise, single-sentence needs; none asks for what the pins or an earlier roadmap already provide (checked in the previous rounds; the contracts are unchanged at this head). The registration mismatch is R01.

## Not verifiable

- **M20:** Theorem 1.1, pp.302–303; Theorem 5.2, pp.312–321. Settled uncertified in the manifest; cited by locator only, not requested.
- **FH58:** Theorem 1, p.499. Settled uncertified; the finite-matrix enumeration row above is independent evidence.
- **HES81:** Theorem 5.7. Settled uncertified; unchanged use.
- **Open work without supplied files:** ownership against open pull requests the brief lists without checkouts was checked only through `roadmaps show`/`grep` for the two re-pointed suppliers and ComplexComparisonPartII.
- No new text is missing; `needs-references.toml` was not created.

## Source issues

No new source error arose in the changed passages, which cite no source locator beyond the unchanged S16 ones. The S16 errata recorded in the previous two reports are carried forward unchanged:

- **Misprint** in S16 at Lemma 2.4, equation (2.1), printed p.309: the source says a repeated indecomposable contributes n copies of its radical; it should be the full n-by-n matrix radical block; affects the proof.
- **Misprint** in S16 at §4.2, formula preceding (4.1), printed p.316: the source says the torsion correction is q^(−l/2) regardless of bundle rank; it should be q^(−rl/2); affects a stated result.
- **Misprint** in S16 at §5.6, identity preceding (5.18), printed p.333: the source says the arm-zero volume prefactor is q^(−∑r_i²); it should be q^(−(g−1)∑r_i²); affects the proof.
- **Misprint** in S16 at Corollary 1.9, printed p.305: the source says the origin count is the positive Fourier sum of differential residues; it should be the negative sum with the displayed definition of A⁰; affects a stated result.
- **Misprint** in S16 at Corollary 1.4(i), printed p.301: the source says the reciprocal nilpotent-cone count has prefactor q^(2D); it should be q^D; affects a stated result.
- **Misprint** in S16 at Corollary 1.4(ii), printed p.301: the source says component multiplicity is read in cohomological degree D; it should be degree 2D; affects a stated result.
- **Misprint** in S16 at §6.11, equations (6.11)–(6.12), printed pp.351–352: the source says affine ranks D and b shift cohomological degree by D and b; it should be 2D and 2b, with the displayed twists unchanged; affects a stated result.
- **Error** in S16 at Corollary 1.5, printed pp.301–302: the source says positivity has a Weyl-invariant integral representative in the free polynomial ring; it should be positivity of a representative whose class is Weyl invariant on the paired cone; affects a stated result.
- **Misprint** in S16 at §6.10, paragraph after (6.10), printed p.350: the source says coefficients of A give multiplicities of unshifted eigenvalue monomials; it should include q^D and combine coincident specialized monomials; affects the proof.
- **Misprint** in S16 at §6.11, Hitchin equivariance paragraph, printed p.351: the source says scaling Higgs fields gives weight one on the Hitchin base; it should give weight i on the ith characteristic coefficient; affects the proof.
