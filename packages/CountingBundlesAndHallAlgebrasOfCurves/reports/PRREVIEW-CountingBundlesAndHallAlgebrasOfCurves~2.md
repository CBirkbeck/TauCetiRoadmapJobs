# Review of CountingBundlesAndHallAlgebrasOfCurves (pull request #1547 at 496cdee)

**Verdict:** accepted

## R01 (P3) — Finish synchronizing the supplier-gap register

**Location:** `TauCetiRoadmap/CountingBundlesAndHallAlgebrasOfCurves/README.md:139`, 103 and 158; `packages/CountingBundlesAndHallAlgebrasOfCurves/design/plan.json:5368`. The new contract begins “What RepresentationTheory/SchurWeyl must provide (gap:stable-symmetric-functions)”.

**Claim:** The README's named extensions are the registered supplier contracts consumed by the retained route.

**Witness:** README and plan each contain seven slugs, but only six coincide. `stable-symmetric-functions` occurs only in the README; `two-line-chart-epimorphism` only in the plan. The plan still requests King's criterion; the README does not.

The mathematical defect in previous R01 is repaired: the README now specifies the stable carrier, specialization maps, Hall pairing and Frobenius isometry, names their owner, and makes the Macdonald contract depend on them. It no longer attributes that extension to an existing base-roadmap target. What remains is registration, classified with previous R02 as P3 rather than continuing to call this a missing mathematical construction. In particular, the new slug does **not** yet count as a declared gap for intake.

**Exact repair:** Add `stable-symmetric-functions` to the plan's top-level `gaps`, with supplier RepresentationTheory/SchurWeyl, its Layer 7 continuation in Part II, and the precise README interface. Synchronize the Macdonald needs text to record that prerequisite. Remove the unused `two-line-chart-epimorphism` entry and King's invariant-subspace criterion from the retained-route requests. Change only `gaps`; keep the mathematical README contract.

**Repair test:** A scratch-only preview of these changes gives seven matching slugs and no unmatched entry. The stable degree-two Gram matrix is diag(2,2), with mixed entry 0; specializing to one variable still gives p₂=p₁²=x². Thus the registration repair preserves the distinction that fixed previous R01. The settled supplier-chart correction is not re-raised: this finding concerns its obsolete registration after the local consuming route was deleted.

## R02 (P3) — Register M20P, including the new symmetric-function locators

**Location:** `TauCetiRoadmap/CountingBundlesAndHallAlgebrasOfCurves/README.md:137`, 1466 and 1594; `packages/CountingBundlesAndHallAlgebrasOfCurves/sources.toml:1` (whole manifest).

**Claim:** M20P is a recorded source for the stable symmetric-function contract and parabolic counting.

**Witness:** The manifest contains neither M20P nor arXiv:1710.04513. M20P line 203 defines compatible symmetric-polynomial families; line 415 defines the Hall pairing; lines 2433 and 2503 supply the parabolic results.

**Exact repair:** Register the existing key M20P for arXiv:1710.04513v1 using the legal sources-service metadata. Include §2.1/Proposition 2.1, pp.6–7, §2.3, pp.10–11, Theorem 7.1 and Corollary 7.4, pp.54–55; cite the supplier contract, Scope and §11.2. Do not rename the work or request a replacement text.

**Repair test:** The service returned the legal arXiv text again. Its stable power sums give norms 2,2 and mixed pairing 0 in degree two. For rank-one parabolic bundles the coefficient is P(1)∏p₁[X_i]; removing marks or using the unique rank-one flags gives P(1). The issue is the missing manifest entry, not an inaccessible or contradictory source.

## Previous findings

- R01 — partly repaired: README:139–152 now supplies the precise named stable-carrier contract; README:158 and 1388 consume it explicitly. Mathematical ownership is repaired. Its missing plan entry remains the P3 registration issue R01 above.
- R02 — partly repaired: README:95, 103, 109, 125, 158 and 176 now carry gap slugs. The plan still retains the unused chart gap and King criterion; the new stable gap is absent. See R01 above.
- R03 — not repaired: README:137 adds M20P symmetric-function locators, but the source manifest still has no M20P entry. The earlier parabolic citations remain. See R02 above.

## Verified sound

This is an independent AI incremental re-review of 40 changed lines since 2a1d1ff. I read the normative repository README and CONTRIBUTING, all changed passages, the previous report, both current roadmap files as needed for the repairs, and the affected contracts and Layer 10 consumers. Main-branch SchurWeyl, AlgebraicCurves and GrothendieckEulerForms supplied the shape comparison. I did not redo the unchanged full review or change a PR file. There are no P1/P2 findings remaining; the two remaining notes concern registration. Acceptance is readiness for human final review, not approval, and does not certify implementation of any supplier extension.

### Gate and elaboration

The supplied worker gate passes all checks, including `build=0`. I reran the gate: every reported scanner and dependency check was zero and the result was OK. That invocation did not print a build field, so I separately ran the targeted build. It completed successfully (9034 jobs), with exactly the two expected `sorry` warnings. Direct `lake env lean` elaboration also exited 0 with those two warnings. The initially reported missing prerequisite object file did not recur after the targeted build. The outside-folder diff is empty; the worktree remains clean.

The required dependency check exited 0 and printed exactly:

```text
depcheck: 204 roadmaps, 1500 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line occurred. All `*Needs:*` lines were read; the only changed local edge is the explicit stable-carrier prerequisite for Macdonald admissibility and §10.3. The named new owner is the same earlier SchurWeyl owner used for the finite-variable theory. Registration is addressed in R01, not hidden by this graph result.

### Sources and seeded sample

No numbered mathematical statement in the 15-target seeded sample changed. Its computed rows are carried forward individually below. The affected Layer 10 dependency chain (§§10.2–10.4), its new stable-carrier input and its Macdonald normalization were examined again. M20 remains the settled locator-only exception; I have not represented the general regular-deformation theorem as newly source-certified.

| Passage checked this round | Source and exact support | Result |
|---|---|---|
| Stable carrier, README:137–141 | M20P line 203, §2.1, p.6: compatible homogeneous families under last-variable-zero substitution; line 232, Proposition 2.1, pp.6–7: elementary/complete polynomial generators, rational power-sum generators | The finite-degree-support graded ring and the rational restriction agree. Stable-range specialization follows by the partition-indexed monomial/Schur basis. |
| Hall pairing, README:142 | M20P lines 398–428, §2.3, pp.10–11: degree-orthogonal Hall pairing and its reproducing kernel | Schur orthonormality is the Schur Cauchy expansion; expanding the exponential gives power-sum norm z_λ. Perfectness is stated degreewise, not as a full-dual identification. |
| Stable Frobenius compatibility, README:143 | Main SchurWeyl Layer 7, README:337–342; pinned FrobeniusCharacteristic.lean:45,53,66; CharacterTable/Pairing.lean:58 | The extension uses the existing finite characteristic. Its pairing is bilinear with inverse group element, matching the pin; no Hermitian normalization is substituted. |
| S-twisted pairing, README:158–162 | M18 lines 49–58, equation (2), p.2 | Norms at q_M=2,t_M=3 are −2 for p₁ and −48 for p₂, agreeing with the stated per-part Adams substitution. |
| Layer 10 integrality dependency | M18 lines 1285 and 1358–1375, §7, pp.29–30, coefficient rings and Theorem 7.1; M20 Theorem 5.2(i)–(ii), pp.319–321, locator-only | The new dependency requests the missing stable input; the unchanged integrality theorem retains its stated coefficient rings and variable exchange. |
| M20P registration repair | M20P line 2433, Theorem 7.1, p.54; line 2503, Corollary 7.4, p.55 | Polynomiality and degree independence are present. Missing registration is R02. |

The incremental sample coverage is §§0.2, 2.2, 2.4, 4.5, 4.7, 5.3, 5.5, 5.7, 7.1, 9.1, 9.3, 10.2, 10.4, 11.4 and 11.5. All appear in the inherited ledger, with computed values. Unchanged source evidence is attributed to the previous report rather than claimed as freshly reread. No newly introduced locator is left unread except the already settled M20 dependency.

### Recomputed changed statements and repair controls

These are finite-instance checks, not proofs of the general targets. Each mathematical clause of the new contract and each changed dependency/registration passage has a witness. Here the Schur coordinate order in degree two is ((2),(1,1)).

| Statement | Instances tried | Values computed on each side / negative control | Result; change |
|---|---|---|---|
| README:17,49; one stable owner rather than finite-variable identification | Degree 2, N=1,2 | Stable dimension 2; finite dimensions 1,2. p₂ and p₁² have coordinates (1,−1),(1,1) before specialization; both become x² at N=1 | Corrected ownership statement; retain, register gap |
| README:139 graded compatible-family carrier | 1, p₁, p₂; proposed Σ_(j≥0)h_j | Degree supports {0},{1},{2}; all projections satisfy last-variable-zero compatibility. Proposed sum has support all nonnegative integers and is excluded | Real graded ring distinguished from degree completion |
| README:139–141 specialization and transitions | p₁² in 2→1→0 variables | (x₁+x₂)² at x₂=0 is x₁²; subsequent x₁=0 is 0; direct specialization is 0. Multiplication specializes p₁² to x₁² on both routes; 1 maps to 1 | Algebra-map and transition controls agree |
| README:141 stable range | n=0,N=0; n=1,N=0,1; n=2,N=1,2 | Dimensions 1→1; 1→0 and 1→1; 2→1 and 2→2. Kernel at n=2,N=1 contains s_(1,1), sent to 0 | N≥n bound sufficient; low-variable nonexample detected |
| README:141 elementary, complete and power sums | n=2,N=2 then N=1 | e₂=x₁x₂→0; h₂=x₁²+x₁x₂+x₂²→x₁²; p₂=x₁²+x₂²→x₁² | All three specializations agree with finite definitions |
| README:139–142 coefficient change | ℤ→𝔽₂; n=2 | p₁²−p₂=2x₁x₂ maps to 0 on both routes; Schur coefficient vectors (1,1,1),(0,1,0) stay independent over 𝔽₂ | Base change agrees; excludes power-sum basis in characteristic 2 |
| README:142 Schur basis and perfect Hall form | ℤ; ℤ/4; ℚ[ε]/ε²; zero ring | Degree-two Schur Gram matrix I₂; determinant 1, inverse I₂ in each ring. Over zero ring both module and dual are zero and the comparison is their unique isomorphism | Ring scope and nonreduced control agree |
| README:142 power-sum pairing | ℚ, λ=(2),(1,1),(3) | Norms 1²+(−1)²=2=z_(2); 1²+1²=2=z_(1,1); mixed 1−1=0; z_(3)=3. In 𝔽₂ p₂=p₁² with norm 0 | Rational restriction necessary; pairing remains perfect in Schur basis |
| README:142 degreewise duality | Degree 0 and degree 1; total direct sum | (1,1)=1; (1,p₁)=0; (p₁,p₁)=1. Functional taking value 1 on every h_n has infinitely many nonzero graded coordinates, outside the direct sum | Full-dual overclaim correctly excluded |
| README:143 Frobenius isometry | S₂ trivial/sign; i times trivial | Character norms (1+1)/2=1, mixed (1−1)/2=0; Schur norms 1,1,0. Multiplication by i gives self-pairing −1 on both sides; Hermitian value would be +1 | Bilinear convention agrees with pin |
| README:143 nonabelian and empty characteristic | S₃ standard character (2,0,−1); S₀ | Standard norm (4+3·0+2·1)/6=1, pairing with trivial (2+0−2)/6=0; corresponding Schur values 1,0. S₀ norm 1 maps to constant 1 | Nonabelian and rank-zero checks agree |
| README:143 finite characteristic comparison | S₂ sign, N=2 and N=1 | Stable sign image s_(1,1) specializes to x₁x₂ at N=2 and 0 at N=1; stable norm 1, latter polynomial norm cannot retain 1 | Stable-range compatibility holds; no low-range isometry claimed |
| README:158,1388,1431 Macdonald prerequisite | q_M=2,t_M=3; p₁,p₂ | S(2,3)=−2; 2S(4,9)=−48. Wrongly using S(2,3) for part 2 gives −4 | Same stable Hall form supplies the twist; dependency repair sound |
| README:125 complete-Adams label | q=2; T and −T | ψ₂((q−1)⁻¹)=1/(4−1)=1/3; [T²]Exp(T)=1 and [T²]Exp(−T)=0. Fixed-variable ordinary exp would give 1/2 | Mathematical contract unchanged; slug now present |
| README:95 coherent-duality label | Smooth-point skyscraper; node skyscraper | Smooth Ext¹/Hom dimensions 1/1; node dimensions 2/1 | Smoothness control preserved; slug now present |
| README:103 GIT label | Scalar G_m; free PGL quotient; t↦t on A¹ | G_m stabilizer dimension 1 versus finite-inertia dimension 0; PGL action stabilizer 0 when free. Weight-one quotient of A¹\{0} is a point of dimension 1−1=0 | Scope unchanged; obsolete King request remains in plan only |
| README:109 locally free Higgs label | r=1,char 2; r=2,char 2 | 2∤1!=1 permits rank-one comparison; 2 divides 2!=2 excludes restricted reductive comparison, while all-field locally free carrier remains requested | No good-prime restriction introduced |
| README:176 compact affine-bundle label | A⁰ and A¹ over 𝔽₂ | Compact class in degree 0 with eigenvalue 1; in degree 2 with eigenvalue 2. Shifts 0,2 and twists 0,−1 give those same values | Shift and Frobenius convention preserved |
| Layer 10 consumers §§10.2–10.4 | f₁(x)=x,f₂(x,y)=t(x+y−1),t=3,x=5; rank-one kernel q=2,a=−1 | f₂(1,5)=15=f₁(15); wrong q=2 shift gives 10. H₁(z)=3(z+1), H₁(1)=6; both eventual counts are 6 | New carrier dependency preserves the existing exchange and specialization |
| Suggested.lean:34–36 docstring | Same rank-one kernel, degree-two symmetric functions | Scalar specialization 6 is expressible; stable degree-two Gram values 2,2,0 require the absent stable carrier and pairing | Missing-carrier explanation accurate; no signature changed |
| R01 registration test | Actual plan/README; scratch repair preview | Actual counts 7/7 with intersection 6; preview counts 7/7 with intersection 7 and symmetric difference 0 | Repair tested without modifying plan |
| R02 M20P registration test | Rank-one flags, q=2 elliptic curve with P(1)=3 | Unmarked coefficient 3; each unique rank-one flag adds factor p₁ and its specified coefficient 1, giving 3·1=3 | Source supports citation; manifest still missing entry |

### Carried-forward adversarial ledger

The following 83 rows retain the previous report's computed evidence for unchanged statements. Each row cites that report. Its old stable-carrier failure row is replaced by the recomputed rows above; it is not carried forward as a mathematical failure.

| Statement | Instances | Values computed on the two sides / negative control | Result and provenance |
|---|---|---|---|
| Field, zero and HN conventions | 𝔽₂; zero; rational torsion; O(1)⊕O(−1) | q=2; zero has 0 HN factors; torsion slope +∞; bundle slopes (1,−1), mean 0, minimum −1 | Distinguishes minimum from mean; unchanged  Evidence: [previous review](PRREVIEW-CountingBundlesAndHallAlgebrasOfCurves~1.md). |
| Euler and Frobenius conventions | P¹, O and O(1); E:y²+y=x³ over 𝔽₄ | Euler values 2 and 0 in opposite orders; E has 9 points, α=(−2,−2); cubic extension gives 65−(−16)=81 | Agrees; unchanged  Evidence: [previous review](PRREVIEW-CountingBundlesAndHallAlgebrasOfCurves~1.md). |
| Adams coefficient convention | q=2, formal α=(−1,−2) | P=6; ψ₂(P)=1−1−4+4=0; ψ₂((q−1)⁻¹)=1/3 versus wrongly fixed value 1 | Agrees; unchanged  Evidence: [previous review](PRREVIEW-CountingBundlesAndHallAlgebrasOfCurves~1.md). |
| S-twisted pairing | q_M=2,t_M=3; p₁,p₂ | Norms −2 and −48; using S(2,3) for the part 2 gives −4 | Agrees with M18; unchanged  Evidence: [previous review](PRREVIEW-CountingBundlesAndHallAlgebrasOfCurves~1.md). |
| Supplier Higgs complex orientation | g=2, A=O(P), B=O, zero fields | Supplied C(B,A): dimensions (1,3,0), mass q²; reversed C(A,B): (0,3,1), mass q³ | Source order is C(B,A); unchanged  Evidence: [previous review](PRREVIEW-CountingBundlesAndHallAlgebrasOfCurves~1.md). |
| 0.1 coefficient ring | g=0; g=1,q=2,a=−1 | R₀ contains q; a+q/a=−3 before/after flip; a alone changes −1→−2; ψ₂ denominator 1/3 | Agrees; unchanged  Evidence: [previous review](PRREVIEW-CountingBundlesAndHallAlgebrasOfCurves~1.md). |
| 0.2 degree definition | P¹ O(1),O(1)⊕O(−1); genus-2 O² | χ₂−rχ₂(O): 2−1=1; 2−2=0; −2−2(−1)=0 | Native degree agrees; unchanged  Evidence: [previous review](PRREVIEW-CountingBundlesAndHallAlgebrasOfCurves~1.md). |
| 0.2 absolute predicate | O; O²; zero | End(O_kbar)=kbar, no nontrivial projector; O² has diag(1,0); zero fails explicit nonzeroness | Truth values true,false,false; unchanged  Evidence: [previous review](PRREVIEW-CountingBundlesAndHallAlgebrasOfCurves~1.md). |
| 0.2 count and torsion distinction | P¹ ranks 0,1,2; one line over 𝔽₃; degree-2 closed point | Counts 0,1,0; line count 1 versus mass 1/2; degree-2 simple splits into 2 geometric summands and contributes 0 absolute objects | Agrees; unchanged  Evidence: [previous review](PRREVIEW-CountingBundlesAndHallAlgebrasOfCurves~1.md). |
| 0.2 field-extension HN | O(2)⊕O(−1); degree-2 skyscraper | Slopes (2,−1) remain (2,−1); skyscraper becomes two points but its HN slope remains +∞ | Agrees; unchanged  Evidence: [previous review](PRREVIEW-CountingBundlesAndHallAlgebrasOfCurves~1.md). |
| 0.3 residues | h=1−z/u; h⁻¹,h⁻²,1 | (rRes,dRes)=(1,−1),(0,−1),(0,0) | Simple-pole hypothesis necessary; unchanged  Evidence: [previous review](PRREVIEW-CountingBundlesAndHallAlgebrasOfCurves~1.md). |
| 1.2 coherent decomposition | 0,L,L² over 𝔽₂ | Summand multiplicities 0,1,2; residue algebras 0,𝔽₂,M₂(𝔽₂); latter has 16 elements and is not local | Agrees; unchanged  Evidence: [previous review](PRREVIEW-CountingBundlesAndHallAlgebrasOfCurves~1.md). |
| 1.3 radical blocks | N=𝔽₂[t]/t²; N² | rad End(N) dimension 1; M₂(rad) dimension 4; quotient cardinal 16, versus erroneous diagonal dimension 2 | Agrees; unchanged  Evidence: [previous review](PRREVIEW-CountingBundlesAndHallAlgebrasOfCurves~1.md). |
| 1.4 nilpotent matrix headline | n=0,1,2 over 𝔽₂; n=2 over 𝔽₃ | Counts 1,1,4,9 equal q^(n(n−1)); GL₂ counts 6,48 | Exact enumeration agrees; unchanged  Evidence: [previous review](PRREVIEW-CountingBundlesAndHallAlgebrasOfCurves~1.md). |
| 1.5 ratio | 0; line/𝔽₃; doubled line/𝔽₂; N above | Actual and residue-product ratios respectively 1,1/2,4/6=2/3,2/2=1 | Agrees; unchanged  Evidence: [previous review](PRREVIEW-CountingBundlesAndHallAlgebrasOfCurves~1.md). |
| 1.6 finite-field neutrality | G_m, dual-number units, constant C₂ | Neutral obstruction in each case; H¹ class counts 1,1,2; dual-number rational units 2 | Neutrality does not imply uniqueness without connectedness; unchanged  Evidence: [previous review](PRREVIEW-CountingBundlesAndHallAlgebrasOfCurves~1.md). |
| 1.7 Frobenius orbits | single orbit of length 2 | Contributions over degrees l=1,2 are 0,2; divisor sums 0,2; descended class doubles (r,d) | Agrees; unchanged  Evidence: [previous review](PRREVIEW-CountingBundlesAndHallAlgebrasOfCurves~1.md). |
| 1.8 coprime absolute objects | class (2,1); local algebra k[t]/t² | Residue degree divides gcd=1; c+bt has scalar c and nilpotent bt; algebra dimension 2, residue dimension 1 | Does not falsely conclude End=k; unchanged  Evidence: [previous review](PRREVIEW-CountingBundlesAndHallAlgebrasOfCurves~1.md). |
| 1.9 positivity bound | rank 1,d=−1,0,1; g=2,r=2,d=3 | Cut indicators 0,1,1; threshold (g−1)r(r−1)=2, and 3>2 | Agrees; unchanged  Evidence: [previous review](PRREVIEW-CountingBundlesAndHallAlgebrasOfCurves~1.md). |
| 1.10 periodicity/duality | P¹ lines in degrees −1,0,1; rank 2 | Counts 1,1,1 and 0; twist and dual preserve these values | Agrees; unchanged  Evidence: [previous review](PRREVIEW-CountingBundlesAndHallAlgebrasOfCurves~1.md). |
| 2.1 fibre Fubini | Id:BS₃; BC₂→BS₃; B(C₂²)→BC₂ | 1/6=1·1/6; 1/2=3·1/6; 1/4=(1/2)(1/2) | Nonabelian and kernel controls agree; unchanged  Evidence: [previous review](PRREVIEW-CountingBundlesAndHallAlgebrasOfCurves~1.md). |
| 2.2 nilpotent pairs | line/𝔽₃; zero; N=𝔽₂[t]/t² | Line mass 1/2; zero mass 1; multiplication by t squares to 0, identity does not | Agrees; unchanged  Evidence: [previous review](PRREVIEW-CountingBundlesAndHallAlgebrasOfCurves~1.md). |
| 2.3 exponential headline | one absolute line species,q=2,multiplicity ≤2 | Mass coefficients (1,1,2/3); exp(T+T²/6+…) gives (1,1,1/2+1/6) | Agrees; unchanged  Evidence: [previous review](PRREVIEW-CountingBundlesAndHallAlgebrasOfCurves~1.md). |
| 2.4 Jordan class | zero map on line; size-2 block; length-2 torsion | α₁=(1,0); r₂=1 gives weighted rank 2; α₂=(0,1) gives degree 2 | Retains internal zeros; unchanged  Evidence: [previous review](PRREVIEW-CountingBundlesAndHallAlgebrasOfCurves~1.md). |
| 2.5 filtered carrier | O(−1)⊂O²; O(1)⊂O(1)⊕O(−1); O⊂O²/𝔽₂ | Total minima 0,−1 give true,false; fixed-total flag mass 3/6=1/2 | Total-sheaf cutoff agrees; unchanged  Evidence: [previous review](PRREVIEW-CountingBundlesAndHallAlgebrasOfCurves~1.md). |
| 2.6 Jordan functors | size-2 block on O(−1)²; t on k[t]/t² | H₁=0,H₂=H; total and quotient minima both −1 in first case, both +∞ in second | Both directions of cutoff equivalence agree; unchanged  Evidence: [previous review](PRREVIEW-CountingBundlesAndHallAlgebrasOfCurves~1.md). |
| 2.7 Jordan fibres | one step; α₂=[O],g=0,q=2 | Exponents (d,d′,d″)=(0,0,0) and (−1,−1,0); π′ fibre masses 1 and 1/2 | Agrees; unchanged  Evidence: [previous review](PRREVIEW-CountingBundlesAndHallAlgebrasOfCurves~1.md). |
| 3.1 Hall convolution | O,O on P¹/𝔽₂; zero | 3 sublines give 3√2; Ext¹=0, #Hom=2 give Δ′=√2/2; zero contributes factor 1 | Product/coproduct normalizations agree; unchanged  Evidence: [previous review](PRREVIEW-CountingBundlesAndHallAlgebrasOfCurves~1.md). |
| 3.2 Green identity | same O,O,O² | (δ_O·δ_O ∣ δ_(O²))=3√2/6=√2/2; tensor pairing gives √2/2 | Agrees; unchanged  Evidence: [previous review](PRREVIEW-CountingBundlesAndHallAlgebrasOfCurves~1.md). |
| 3.3 characteristics | rank-zero degree 1/−1; rank 2 torsion degree 1 | Torsion indicator 1, negative-degree indicator 0; v⁻²·v²=1 | Correct rank in torsion twist; unchanged  Evidence: [previous review](PRREVIEW-CountingBundlesAndHallAlgebrasOfCurves~1.md). |
| 3.4 filtered mass | O⊂O² on P¹/𝔽₂ | 3/6=1/2 and q⁻¹ᐟ²·(√2/2)=1/2 | Agrees; unchanged  Evidence: [previous review](PRREVIEW-CountingBundlesAndHallAlgebrasOfCurves~1.md). |
| 4.1 Eisenstein series | O⊕k_x; O(−1); O(1)⊕O(−1) | Factorization gives v·v⁻¹z=z; negative degree gives z⁻¹; total cutoff values 1→0 on unstable degree-zero bundle | Agrees; unchanged  Evidence: [previous review](PRREVIEW-CountingBundlesAndHallAlgebrasOfCurves~1.md). |
| 4.2 Hecke shifts | r=0,1,2,q=2 | Empty product 1; arguments z/(√2w); z/(2w),z/w | Agrees with rank shifts; unchanged  Evidence: [previous review](PRREVIEW-CountingBundlesAndHallAlgebrasOfCurves~1.md). |
| 4.3 coproduct | r=0; split (1,1),g=0 | E₀⊗E₀; scalar 1/√q and arguments √qz,z/√q | Agrees; unchanged  Evidence: [previous review](PRREVIEW-CountingBundlesAndHallAlgebrasOfCurves~1.md). |
| 4.4 bundle residue | r=1; a simple rank-two pole | V₁⁻¹V₁=1, no residues; normalized pole coefficient 1 instead of differential −1 | Agrees; unchanged  Evidence: [previous review](PRREVIEW-CountingBundlesAndHallAlgebrasOfCurves~1.md). |
| 4.5 HN factorization | P¹ O(1)⊕O(−1) | E(negative quotient,positive subobject)=3; prefactor q⁻¹ᐟ² and shifts q⁻¹ give q⁻³ᐟ², cancelling Hall q³ᐟ² | Agrees; unchanged  Evidence: [previous review](PRREVIEW-CountingBundlesAndHallAlgebrasOfCurves~1.md). |
| 4.6 spherical carrier | line square and rank-two characteristic at O²/𝔽₂ | Values 3√2 and 1 differ; O(m)⊕O(−m) for m=0,1,2 already give 3 distinct supported classes | Requires HN completion; unchanged  Evidence: [previous review](PRREVIEW-CountingBundlesAndHallAlgebrasOfCurves~1.md). |
| 4.7 spherical HN | P¹ types ((2,0)),((1,1),(1,−1)),((1,0),(1,0)) | Class counts 1,1,0; last has equal successive slopes | Agrees; unchanged  Evidence: [previous review](PRREVIEW-CountingBundlesAndHallAlgebrasOfCurves~1.md). |
| 4.8 universal form | P¹ one-line mass at q=2,3 | P/(q−1)=1,1/2, matching 1/#Aut; flag twist cancels √q·q⁻¹ᐟ²=1 | Scalar checks agree; descent remains a target  Evidence: [previous review](PRREVIEW-CountingBundlesAndHallAlgebrasOfCurves~1.md). |
| 4.9 truncated universal counts | P¹/𝔽₂, class (1,1) | N₀=1+3z+…; [T]N=1+4z+…; [Tz]N/N₀=1; actual nilpotent masses 1+3·1=4 | Torsion cancellation agrees; unchanged  Evidence: [previous review](PRREVIEW-CountingBundlesAndHallAlgebrasOfCurves~1.md). |
| 4.10 density normalization | q₀=3,m=1,2,3 | q=3,9,27; normalized multiplier always 1; (q−3)/q=0,2/3,8/9 | Radial variable retained; unchanged  Evidence: [previous review](PRREVIEW-CountingBundlesAndHallAlgebrasOfCurves~1.md). |
| 5.1 pairing carrier | one line slot at 0 and ∞ | Positive coefficients 1/(q−1) for d≥0; negative expansion of −V₁/(1−zw) gives +V₁ for d<0; zero-rank slot multiplies by 1 | Regional signs agree; unchanged  Evidence: [previous review](PRREVIEW-CountingBundlesAndHallAlgebrasOfCurves~1.md). |
| 5.2 torsion separation | P¹,q=2,one rank-one slot | [zw]X₁=#X/(q(q−1))=3/2; omission of q shift gives 3 | Agrees; unchanged  Evidence: [previous review](PRREVIEW-CountingBundlesAndHallAlgebrasOfCurves~1.md). |
| 5.3 untruncated pairings | ranks (1,2) | q exponents −r_>1/2=−1, r_<2/2=1/2; one slot exponent 0 | Agrees; unchanged  Evidence: [previous review](PRREVIEW-CountingBundlesAndHallAlgebrasOfCurves~1.md). |
| 5.4 expansion separation | f=1/(1−z) at 0 and ∞ | (1−z)Σ_(n≥0)zⁿ=1; (1−z)(−Σ_(n<0)zⁿ)=1 | Polynomial clearing agrees; unchanged  Evidence: [previous review](PRREVIEW-CountingBundlesAndHallAlgebrasOfCurves~1.md). |
| 5.5 shuffle | s=1 at w=0/∞; s=2 | V₁/(1−zw),−V₁/(1−zw); negative-degree coefficients +V₁; (−1)²=1 | Agrees; unchanged  Evidence: [previous review](PRREVIEW-CountingBundlesAndHallAlgebrasOfCurves~1.md). |
| 5.6 block residues | tuple (1); tuple (2),g=2 | a=0 and −1/2; first prefactor V₁⁻¹V₁=1; second pole ratio q⁻¹ | Agrees; unchanged  Evidence: [previous review](PRREVIEW-CountingBundlesAndHallAlgebrasOfCurves~1.md). |
| 5.7 generic Jordan sum | r₂=1; α₂=(1,3); empty rank type | Weighted monomial T²z⁶, not Tz³; empty type has torsion coefficient #X/(q−1), not 0 | Agrees; unchanged  Evidence: [previous review](PRREVIEW-CountingBundlesAndHallAlgebrasOfCurves~1.md). |
| 5.8 positive arms | λ=(1),(2),(1,1),(2,1) | Products 1,ζ(q⁻¹z),1,ζ(q⁻²z); exponent sums respectively 0,Xq⁻¹z,0,Xq⁻²z | Both sides agree; unchanged  Evidence: [previous review](PRREVIEW-CountingBundlesAndHallAlgebrasOfCurves~1.md). |
| 5.9 kernels | empty,(1),(2),q=2,g=1,α=(−1,−2) | Empty 1; J_(1)=6; H_(1)=1/(1−z); H_(2)=1/(1−z²), coefficients z,z²=(0,1) | Agrees; unchanged  Evidence: [previous review](PRREVIEW-CountingBundlesAndHallAlgebrasOfCurves~1.md). |
| 5.10 partition product | empty and one box on P¹/𝔽₂ | Empty torsion series 1+3z+…; one-box product T(1+4z+…), matching §4.9 | Agrees; unchanged  Evidence: [previous review](PRREVIEW-CountingBundlesAndHallAlgebrasOfCurves~1.md). |
| 6.1 partition generating headline | P¹/𝔽₂, ranks 0,1 | Both constants 1; coefficient T=1/(1−z), coefficient Tz=1 after torsion cancellation | Agrees; unchanged  Evidence: [previous review](PRREVIEW-CountingBundlesAndHallAlgebrasOfCurves~1.md). |
| 6.2 periodic extraction | r=2,b=(2,3),K=ℚ | Differential residues (−5/2,1/2); negative Fourier sums 2,3; in char 2 denominator is (1−z)² | Characteristic condition necessary; unchanged  Evidence: [previous review](PRREVIEW-CountingBundlesAndHallAlgebrasOfCurves~1.md). |
| 6.3 residue headline | rank one; P¹ rank two; elliptic q=2,P=3 rank two | Residue at 1: −P→P; P¹ residues 0,0→0; elliptic residues −3,0→3 in either parity | Agrees; unchanged  Evidence: [previous review](PRREVIEW-CountingBundlesAndHallAlgebrasOfCurves~1.md). |
| 6.4 rank-two formula | q=2,g=0,1,2; pairs (−1,−2) repeated | (P,U,V,S)=(1,1,1,0),(6,15,0,5/6),(36,225,0,5/3); counts 0,6,1296 | Exact rational evaluations agree; unchanged  Evidence: [previous review](PRREVIEW-CountingBundlesAndHallAlgebrasOfCurves~1.md). |
| 6.5 origin carrier | rank one; q⁻¹; paired equation | P(1) at origin 1; q⁻¹ undefined; α₁α₂=q gives 0=0 | Excludes arbitrary Laurent evaluation; unchanged  Evidence: [previous review](PRREVIEW-CountingBundlesAndHallAlgebrasOfCurves~1.md). |
| 6.6 origin partition headline | g=1,2,3,r=1…4 | Partition-Log coefficients z⁶⁰…z⁶³ are constant with values (1,1,1,1),(1,2,6,22),(1,3,15,95); genus polynomials give the same lists | Exact coefficient computation agrees; unchanged  Evidence: [previous review](PRREVIEW-CountingBundlesAndHallAlgebrasOfCurves~1.md). |
| 7.1 positive Higgs category | line; doubled line; rational skyscraper | Stability true,false respectively; skyscraper self-Ext dimensions (1,2,1), versus underived wrong model (1,1,0) | Derived terms needed; unchanged  Evidence: [previous review](PRREVIEW-CountingBundlesAndHallAlgebrasOfCurves~1.md). |
| 7.1 positivity and differential | O(−1)⊂O² on P¹; (O,0)→(O,η) on elliptic curve | Minimum slopes −1,0,1 give false,true,true; column map Id↦η has coefficient +1 and acyclic cone | Exact structure and sign agree; unchanged  Evidence: [previous review](PRREVIEW-CountingBundlesAndHallAlgebrasOfCurves~1.md). |
| 7.2 duality criterion | W=ke₁; matrices [[1,1],[0,2]],[[1,0],[1,2]] | Lower-left entries 0,1 give preservation true,false and factorization true,false | Both directions agree; unchanged  Evidence: [previous review](PRREVIEW-CountingBundlesAndHallAlgebrasOfCurves~1.md). |
| 7.3 Higgs geometry headline | r=1,g=2; char 2,g=1,r=2,d=1 | Coarse/stack/cone dimensions 4,3,2; elliptic scalar characteristic polynomial t²+a², reduced core a=0 | Reduction distinction agrees; unchanged  Evidence: [previous review](PRREVIEW-CountingBundlesAndHallAlgebrasOfCurves~1.md). |
| 7.3 family nilpotence | rank-one θ=ε over k[ε]/ε² | θ²=0, characteristic coefficient −ε≠0; Hitchin zero equation requires ε=0 | Correct negative control; unchanged  Evidence: [previous review](PRREVIEW-CountingBundlesAndHallAlgebrasOfCurves~1.md). |
| 8.1 BB headline | P¹ scaling; A¹ negative weight; elliptic reduced core | Attracting ranks 1,0 give q+1; negative-weight model lacks limit of 1; core affine rank 0 gives #Pic | Hypotheses and reduced core agree; unchanged  Evidence: [previous review](PRREVIEW-CountingBundlesAndHallAlgebrasOfCurves~1.md). |
| 8.2 Higgs integration | E/𝔽₂,P=3; rank1 and rank2 degree0 | I₁=6; I₂=12+8+6+4=30; plethystic remainder 30−18−6=6=Ω₂ | Adams and slope-zero check agree; unchanged  Evidence: [previous review](PRREVIEW-CountingBundlesAndHallAlgebrasOfCurves~1.md). |
| 8.2 genus normalization | g=2,q=2,r=1 | q^(1−g)q^gP/(q−1)=2P; reverse normalization gives 8P | Agrees; unchanged  Evidence: [previous review](PRREVIEW-CountingBundlesAndHallAlgebrasOfCurves~1.md). |
| 8.3 all-characteristic headline | E over 𝔽₂/𝔽₄; P¹ rank1/rank2 | Direct point enumeration 3,9; Higgs counts 6,36=qP; stack masses 6,12; P¹ counts 1,0 | q is field size, not characteristic; unchanged  Evidence: [previous review](PRREVIEW-CountingBundlesAndHallAlgebrasOfCurves~1.md). |
| 9.1 purity/BB headline | rank1,g=2; A¹ | H_c^n=H^(n−4)(Pic)(−2); A¹ contributes rank1 in degree2 with eigenvalue q, rank0 in degrees0,1 | Shifts and twists agree; unchanged  Evidence: [previous review](PRREVIEW-CountingBundlesAndHallAlgebrasOfCurves~1.md). |
| 9.2 positivity headline | rank1,g=1; g=2,r=2 | A(−α)=1+α₁+α₂+q; diagonal 1+2t+t²; D=5 gives top degree10 and top coefficient1 | Invariant class, not invariant representative; unchanged  Evidence: [previous review](PRREVIEW-CountingBundlesAndHallAlgebrasOfCurves~1.md). |
| 9.2 positive representative control | genus2 top class q⁵ | α₁⁵α₂⁵=α₃⁵α₄⁵ on cone; both diagonalize to t¹⁰; averaged free representative coefficients 1/2 | Correctly excludes stronger free-invariance claim  Evidence: [previous review](PRREVIEW-CountingBundlesAndHallAlgebrasOfCurves~1.md). |
| 9.3 compact polynomial headline | rank1,g=1,2 | Signed t²−2t³+t⁴ and t⁴−4t⁵+6t⁶−4t⁷+t⁸; unsigned all positive coefficients | Top degrees4,8 agree; unchanged  Evidence: [previous review](PRREVIEW-CountingBundlesAndHallAlgebrasOfCurves~1.md). |
| 9.3 spread-out rank control | elliptic Pic×A¹; two disjoint points | Compact dimensions (1,2,1) in degrees2,3,4; point H⁰ rank1 versus two-point rank2 | Lisse stratum requirement excludes rank jump  Evidence: [previous review](PRREVIEW-CountingBundlesAndHallAlgebrasOfCurves~1.md). |
| 9.4 cone headline | rank1,g=2; two exchanged components | q²∏(1−α⁻¹)=P; top degree4 dimension1; two-component top permutation matrix has dimension2, trace0 | Prefactor q^D and dimension/trace distinction agree  Evidence: [previous review](PRREVIEW-CountingBundlesAndHallAlgebrasOfCurves~1.md). |
| 10.1 Mellit kernel | g=1,q=2,a=−1/−2; empty partition | H₁=3(z+1),2(z+2); values at1 both6, at0 are3,4; Ω constant1,H constant0 | Reciprocal symmetry only at z=1; unchanged  Evidence: [previous review](PRREVIEW-CountingBundlesAndHallAlgebrasOfCurves~1.md). |
| 10.2 regular deformation | constant sequence; f₁=x,f₂=t(x+y−1),t=3,x=5 | 1=1; f₂(1,5)=15=f₁(15), versus wrong q=2 shift 10 | Variable exchange agrees; generic theorem remains uncertified  Evidence: [previous review](PRREVIEW-CountingBundlesAndHallAlgebrasOfCurves~1.md). |
| 10.3 Laurent integrality headline | rank1 above; 1/(1+z) | H₁ polynomial, H₁(1)=6; control value1/2 at1 but pole at−1 | Local regularity is insufficient; unchanged  Evidence: [previous review](PRREVIEW-CountingBundlesAndHallAlgebrasOfCurves~1.md). |
| 10.4 degree independence headline | P¹ r=0,1,2,d=−1,0,1; elliptic rank2 | Counts (0,0,0),(1,1,1),(0,0,0); elliptic parity values3,3; control (2+3z)/(1−z²) has 2,3 | Native statement matches; unchanged  Evidence: [previous review](PRREVIEW-CountingBundlesAndHallAlgebrasOfCurves~1.md). |
| 10.5 all-degree positivity | g=2,r=2,d=0,1 | gcd(2,1)=1; origin values2,2; no equality of the two stable moduli spaces is claimed | Transfers count only; unchanged  Evidence: [previous review](PRREVIEW-CountingBundlesAndHallAlgebrasOfCurves~1.md). |
| 11.1 quasi-parabolic carrier | rank1; O² with two/three flags over 𝔽₂ | Line flags unique; two coordinate flags leave 2-dimensional diagonal endomorphisms; third diagonal line reduces to scalars, dimension1 | Flagged indecomposability differs from bundle indecomposability  Evidence: [previous review](PRREVIEW-CountingBundlesAndHallAlgebrasOfCurves~1.md). |
| 11.2 parabolic universality | no marks; rank1; one two-step mark on P¹ | Counts P in first two cases; E_par=1−1=0 for step1→step2 and 1 for reverse; localized test (q−1)⁻¹=1 at2, undefined at1 | Hall direction and localized conclusion agree  Evidence: [previous review](PRREVIEW-CountingBundlesAndHallAlgebrasOfCurves~1.md). |
| 11.3 exact HN carrier | g=2,0→O(P)→E→O→0 | Ext¹ dimension1; nonsplit class stays nonzero; HN slopes1,0; lower-cut indicator at ν=1/2 is0 although average=1/2 | Distinguishes HN from mean; unchanged  Evidence: [previous review](PRREVIEW-CountingBundlesAndHallAlgebrasOfCurves~1.md). |
| 11.4 slope universality headline | rank1,d=−1,0,ν=0 and duals | Lower-cut counts0,P; upper-cut dual degrees1,0 give0,P | Both directions agree; unchanged  Evidence: [previous review](PRREVIEW-CountingBundlesAndHallAlgebrasOfCurves~1.md). |
| 11.5 constructible Hall headline | P¹_C,torsion degree1 and line degree d | Product at O(d+1) is χ(P¹)=2; reversed product0; commutator2; scalar unit primitive equation c=2c forces c=0 | Order and primitive controls agree; general theorem remains target  Evidence: [previous review](PRREVIEW-CountingBundlesAndHallAlgebrasOfCurves~1.md). |
| 11.6 conjecture formulations | rank1; split/nonsplit HN; q⁻¹ at origin | Proposed root multiplicity1 matches cone component1; same HN type can have indecomposable indicator0 or1; q⁻¹ has no origin value | Conjectures kept separate from theorems  Evidence: [previous review](PRREVIEW-CountingBundlesAndHallAlgebrasOfCurves~1.md). |

### Pinned declarations, signatures and padding

Seven pinned-file entries were opened in this round, in addition to the unchanged pin audit retained in the previous review:

| Pinned file | Declaration and boundary |
|---|---|
| `TauCeti/RepresentationTheory/Symmetric/FrobeniusCharacteristic.lean:45` | `frobeniusCharacteristic n d h`, with n≤d, is a linear equivalence to finite-variable homogeneous symmetric polynomials. Lines 53 and 66 identify the Schur image and its coordinates. It is not the stable carrier. |
| `TauCeti/RepresentationTheory/CharacterTable/Pairing.lean:58` | `ClassFunction.characterPairing` is bilinear and uses the inverse group element, exactly the new contract's normalization. |
| `TauCeti/RingTheory/MvPolynomial/Symmetric/Schur/Basis.lean:301` | `schurPolyBasis` is the finite-alphabet basis over a commutative ring, indexed by partitions with at most the number of variables. It supplies the existing finite ingredient, not transition-compatible families. |
| `TauCeti/AlgebraicGeometry/VectorBundle/FixedRank.lean:69` | `FixedRank` is the constant-rank full subcategory; line 104 gives its contravariant pullback functor. |
| `TauCeti/AlgebraicGeometry/Cohomology/EulerCharacteristic.lean:105` | `eulerCharBelow` is the truncated finrank sum; finiteness and vanishing are not fields of its definition. The bundle theorem retains the curve hypotheses. |
| `Mathlib/CategoryTheory/Limits/Shapes/BinaryBiproducts.lean:1096` | `Indecomposable` includes explicit nonzeroness as well as exclusion of nontrivial binary biproducts. |
| `Mathlib/LinearAlgebra/Matrix/GeneralLinearGroup/Card.lean:120` | `Matrix.card_GL_field` counts invertible matrices, a different subtype from the headline's nilpotent matrices. |

One scratch elaboration printed `#check @name` for all five retained declarations: bundleDegree, IsAbsolutelyIndecomposable, absIndecCount, nilpotent_matrix_count and absIndecCount_eq_of_degree. Every expected binder remains. In particular the count-independence theorem retains Finite k, properness, smooth relative dimension one and geometric connectedness, followed by arbitrary rank and two integer degrees. The three definitions retain k, its Field instance, X, its structure morphism, and their own rank/bundle/degree arguments. No signature change is needed.

The two theorem bodies were replaced by `simp`, `rfl`, and `infer_instance` in three separate scratch copies and elaborated sequentially. All six attempts fail for the expected reasons: no simp progress, unequal definitional sides, and non-typeclass goals. Object searches at the pins found no single nilpotent-count or absolute-bundle degree-independence lemma that closes them. No padding or new omitted statable headline was found. The only Lean edit is the accurate list of additional missing carriers for Mellit integrality; no artificial replacement was introduced.

The unchanged headline inventory was reconciled with the current module docstring:

| Headline | Acceptance-file treatment |
|---|---|
| Finite-field nilpotent matrix enumeration (§1.4) | Stated as `nilpotent_matrix_count`. |
| Absolute bundle count independent of degree (§10.4) | Stated on native sheaves as `absIndecCount_eq_of_degree`; rank zero is included without replacing the positive-rank theorem. |
| Nilpotent-pair exponential and Jordan fibre masses (§§2.3,2.7) | Named in docstring; missing coherent rank-degree/HN groupoids. |
| Green bialgebra, spherical HN membership (§§3.2,4.7) | Named; missing curve Hall algebra and completion. |
| Generic spherical form and universal counts (§§4.8–4.9) | Named; missing Hall carrier and reciprocal specialization. |
| Partition generating/residue formulas (§§6.1,6.3) | Named; missing compatible Adams series, kernels and universal counts. |
| Origin constant formula (§6.6) | Named; missing universal invariant and its regular affine-cone extension. |
| Stable canonical Higgs geometry and BB strata (§§7.3,8.1) | Named; missing actual coarse Higgs scheme and strata. |
| All-characteristic coprime Higgs count (§8.3) | Named; missing canonical stable coarse moduli. |
| Purity and compact Poincaré polynomial (§§9.1,9.3) | Named; missing actual Higgs cohomology/comparison carriers. |
| Nilpotent-cone trace/components (§9.4) | Named; missing reduced Hitchin fibre/cohomology/universal invariant. |
| Mellit Laurent integrality and universal identification (§§10.3–10.4) | Named; scalar degree-independence consequence is stated separately on native carriers. |
| Positivity in every degree (§10.5) | Named; missing universal invariant. |
| Parabolic and slope-cut universality (§§11.2,11.4) | Named; missing their curve-count and specialization carriers. |
| Constructible spherical Hopf/primitive Lie theorem (§11.5) | Named; missing constructible Euler pushforward and Hall carrier. |

### Supplier and ownership checks

`roadmaps grep` was run by object for stable symmetric functions, Hall pairings and finite-alphabet maps; the board packages and pinned libraries were searched as well. `roadmaps show` resolved the affected suppliers. The citation resolver found no absent cross-roadmap citation or roadmap Lean name, against main fa41b37 and the supplied open-head index. It explicitly did not check pinned-library names; those were inspected locally as described above.

| Citation affected by the repair | Text resolved this round | Boundary retained |
|---|---|---|
| RepresentationTheory/SchurWeyl Layer 7 | Main `TauCetiRoadmap/RepresentationTheory/SchurWeyl/README.md:323–342` | Finite-variable Schur/Frobenius theory; stable carrier and form are not provided by the main text. The explicit extension now names their owner. |
| QSeriesPartitionsAndMockModularForms §§2.4,3.5 | Supplied-head `TauCetiRoadmap/QSeriesPartitionsAndMockModularForms/README.md:303–322,482–503` | Euler/q-binomial and ordinary partition interfaces; Macdonald theory is an extension, now explicitly dependent on the stable carrier. |
| HabiroNahmSeries §5.1 | Supplied-head `TauCetiRoadmap/HabiroNahmSeries/README.md:1081–1093` | Ordinary augmentation calculus and plethystic coefficients over ℚ(q); extended coefficient Adams operations remain a named contract. |
| SchemeKTheoryOperations §§6.2.1–6.2.2 | Index-resolved `TauCetiRoadmap/SchemeKTheoryOperations/README.md:2132–2163` | Integral special λ-rings and Newton Adams; ψ₂(2)=2 in the binomial structure, not 4. |
| HabiroCyclotomicCompletions §1.1 | Index-resolved `TauCetiRoadmap/HabiroCyclotomicCompletions/README.md:294–310` | Simultaneous q and grading-variable substitution on Laurent coefficients; no competing plethystic operation is introduced. |
| SchemeAndStackFoundations §3.3, extending §2.20 | Main `TauCetiRoadmap/SchemeAndStackFoundations/README.md:4741–4749` | Ext–Hom statement requires locally free first input. General coherent inputs on smooth curves remain the explicit extension. |
| AlgebraicModuliForArithmeticGeometry §4.19 | Index-resolved `TauCetiRoadmap/AlgebraicModuliForArithmeticGeometry/README.md:7357–7374` | Affine gerbe factorization is present; character GIT is explicitly requested beyond it. |
| EndoscopicTransferAndUnitaryTraceComparison §3.7 | Index-resolved `TauCetiRoadmap/EndoscopicTransferAndUnitaryTraceComparison/README.md:1273–1290` | Bounded strongly generated chart and Higgs input remain the owner; no local two-frame deformation route was restored by this diff. |
| EtaleDualityAndPerverseSheaves §§0.6–0.7 | Index-resolved `TauCetiRoadmap/EtaleDualityAndPerverseSheaves/README.md:821–992` | Rational Frobenius duality and trace; the compact affine-bundle comparison remains an explicit extension. |
| TensorProductCombinatorics stable-ring request | Supplied-head `TauCetiRoadmap/TensorProductCombinatorics/README.md:320–328` | It requests the same carrier from SchurWeyl; it does not become a second constructing owner. The Hall-form extension here should use that same carrier. |

The open SchurWeyl revision includes a more developed stable target, but it revises an existing roadmap. Under the review contract it cannot replace the main-branch supplier. This report therefore does not use that revision to discharge the extension. The named ownership remains SchurWeyl, with the new work in its continuation; the counting roadmap adds no second carrier or Lean declaration. None of the five retained local fully qualified declaration names changed.

The six shared plan/README gaps still have named suppliers. Their missing mathematics is not itself a finding. The stable contract is precise: coefficient rings, finite support, transition maps, stable range, pairing, perfectness and normalization are explicit, with four discriminating README Checks. Its carrier request is distinct from the finite-variable API at the pin. R01 records the remaining registration difference, including the unused chart and King requests. No computational algorithm, route-specific restriction, new sorry-valued data or set_option was added.

## Not verifiable

- **M20:** Theorem 1.1, pp.302–303; Proposition 3.1, pp.310–312; §§4–5 and Theorem 5.2, pp.312–321. Settled as uncertified in the supplied manifest; not requested again. The rank-one and regular-sequence computations do not certify the general theorem.
- **FH58:** Theorem 1, p.499, proof pp.499–503. Settled locator-only after the recorded official Euclid access-protection response. The previous independent S16 and finite-matrix checks are retained; the original proof was not reopened.
- **HES81:** Theorem 5.7, pp.55–89. Settled locator-only/paywalled. Its unchanged application retains the previous review's evidence.
- **Open work without supplied files:** Ownership against unprovided open checkouts was not independently audited. Index-resolved supplier passages are distinguished from main and the supplied heads above. No missing checkout was fetched.
- No new missing legal text is pending. M20P was fetched legally through the sources service and read; its remaining issue is manifest registration.

## Source issues

No new source error was established in the changed, consumed locators. The following errata are carried forward from [the previous review](PRREVIEW-CountingBundlesAndHallAlgebrasOfCurves~1.md), whose unchanged mathematics and computed controls are retained above; they are not claimed as newly rediscovered in this incremental pass.

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
