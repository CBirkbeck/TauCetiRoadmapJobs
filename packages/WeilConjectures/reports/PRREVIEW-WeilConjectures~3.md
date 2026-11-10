# Review of WeilConjectures (pull request #1208 at e79b1b6)

**Verdict:** needs changes

Incremental re-review of the 42 lines changed since ade9515. The folder itself is clean and the gate passes; the one finding is in the pull request description, which the change to §7.3 made incomplete.

## R01 (P3) — The `depends-on` block omits the new supplier MotivesAndAlgebraicCycles

**Location:** pull request description, generated block `depends-on`: “**Depends on** (suppliers still open; they merge first)”, followed by nine entries (#849, #856, #848, #929, #1040, #850, #870, #1002, #1062).

**Claim:** The block lists the open suppliers of the README. At this head the README has a tenth: the supplier table row at `TauCetiRoadmap/WeilConjectures/README.md:127`, the contract subsection at line 166, the §7.3 *Needs* line at 1613 and the Layer WC.7 dependencies at 1928 all consume MotivesAndAlgebraicCycles §4.20, which is not on main.

**Witness:** MotivesAndAlgebraicCycles is absent from main's `TauCetiRoadmap/` and is the new roadmap of open pull request #1313 (head 1ef618d); its §4.20 is where `K₀Var k` is defined. The same description's prose and its `merge-order` block do name #1313; only `depends-on` does not.

**Repair:** Regenerate the `depends-on` block from this head, so that it gains the line `- [ ] #1313 MotivesAndAlgebraicCycles`. No change to the folder is needed. (QWittVectors, named in Scope as the carrier of a formula this roadmap excludes, is not a supplier and does not belong in the block.)

## Previous findings

- R01 — not repaired, and withdrawn: the folder still holds only `README.md`, `Suggested.lean` and `metadata.toml`. The repair the previous report asked for would itself fail the gate (`stray-files`: sources are the README's references; no roadmap folder on main carries a manifest), so it is not raised again.
- R02 — repaired: README:126 and README:1535 now cite “§8.24's rational étale cohomology of Deligne–Mumford stacks … and smooth proper DM purity clauses”. Both clauses exist under that wording in DeligneWeightsAndPurity §8.24 at its open head.
- R03 — repaired: README:827–829 adds “For β=(2,3),c=(3,5), V has rows (1,2),(1,3) and inverse rows (3,−2),(−1,1) … the rows Aₖⱼ would give … (−18,13) instead.” Recomputed below; the original symmetric Check is kept beside it.

## Verified sound

**Scope of this round.** The diff touches only `README.md`: the Scope paragraph on §7.3 and the Witt-ring form (lines 20–26), the supplier row and contract subsection for MotivesAndAlgebraicCycles (127, 166–173), the second §5.1 Check (827–829), the §6.8 citation (1535–1537), the §7.3 sentence on `Z_XZ_Y`, the new target “Point counts on the scissor ring” with its two Checks and *Needs* line (1598, 1606–1613), the Layer WC.7 dependency line (1928) and the Ramachandran reference (1951). `Suggested.lean` is byte-identical to the file the previous review read. Everything below concerns these passages and what they cite; untouched text was not re-reviewed.

**Gate and dependency direction.** The worker's gate at this head: every check passes (`depcheck=0`, `outside-folder=0`, `stray-files=0`, `build=0`). The diff against `origin/main` outside the folder is empty. The dependency check, run independently with the given merge order and `--movable`:

```text
depcheck: 234 roadmaps, 2275 edges, 0 problem(s)
```

No UPWARD or CYCLE line. MotivesAndAlgebraicCycles is at line 91 of the merge order and WeilConjectures at line 125, so the new edge points downward. QWittVectors (line 202, later) is named only in Scope as the owner of the carrier of an excluded formula; it has no supplier row, no *Needs* entry and no contract subsection, and the check reports no edge to it.

**Elaboration.** `lake env lean` on `TauCetiRoadmap/WeilConjectures/Suggested.lean` at the pins of this head (Mathlib 1b1ccf4, Tau Ceti 2fd255d, which differ from the pins the previous review used because main was merged in): six `declaration uses sorry` warnings at lines 70, 80, 94, 105, 122, 145 and nothing else. The one-tactic probe was rerun at these pins on a scratch copy (`first | (simp; done) | rfl | infer_instance` in place of each `sorry`): all six fail, so none is padding. The worker's elaborated signatures of the eight declarations show no lost section binder. The library near-match list was read: no candidate states any of the six theorems. A search of the pinned Mathlib and Tau Ceti for `K₀Var`, a Grothendieck ring of varieties, `zetaSeries` and `extensionPointCount` finds nothing, so the pin bump supplies none of this roadmap's objects, and the new §7.3 target is not statable at the pins (its carrier is a supplier's README target); it is not a headline and the module docstring need not name it.

**Cross-roadmap citations resolved (4).**

| Citation | Where it resolves | What was compared |
| --- | --- | --- |
| MotivesAndAlgebraicCycles §4.20 | `TauCetiRoadmap/MotivesAndAlgebraicCycles/README.md:931` at the head of its open pull request | Defines `K₀Var k` on separated finite-type schemes over any field, with the closed-immersion relation, product over `k`, ring structure, small-model independence, the universal property for additive multiplicative invariants and `[X]=[X_red]`; its Checks give `[ℙ¹]=1+𝕃`, `[𝔾_m]=𝕃−1`, fat point of class one. The row at README:127 and the subsection at 166 assume exactly this and no more. The motivic measure `χᶜ` and the tensor ring of the same section are correctly said to be unused. |
| QWittVectors §§1.3–1.4a | `TauCetiRoadmap/QWittVectors/README.md:179` and `:229` at its open head | §1.3 constructs the big Witt ring by ghost polynomials; §1.4a compares its coordinates with the power-series group, sending `x_d` to `(1 − x_d t^d)⁻¹`, so the ghost components are the coefficients of `t·dlog`; §1.2 gives ghost injectivity over an integer-torsion-free ring. The Scope sentence uses precisely these three facts for `ℤ`. |
| DeligneWeightsAndPurity §8.24 | its README at its open head, the two clauses named in R02 | Both clause titles are present; the stack clause keeps `ℓ ≠ p`, finite diagonal and rational coefficients, as WC.6.8 states. |
| Internal: §0.1, §1.2, §7.8 | README:224, 305, 325, 1694 | §0.1 has the dual-number count `Nᵣ=1` and multiplicativity on fibre products; §1.2 has `Z` multiplicative on disjoint unions and the `𝔾_m/𝔽₃` count `3ʳ−1`; §7.8 has `N_r = q^r − 1`. The new Checks quote them correctly. |

**Ownership.** A search of main and of the open heads for the scissor ring, `K₀Var`, the Witt product of zeta functions and Ramachandran finds `K₀Var` owned only by MotivesAndAlgebraicCycles §4.20 and consumed by TopologicalMirrorSymmetryForHitchinSystems (an equivariant Katz comparison over finitely generated rings, a different statement). No roadmap states the point-count homomorphism on `K₀Var 𝔽_q`, so §7.3 is its single owner; no roadmap states the Witt-ring product formula, and this one excludes it explicitly with the carrier's owner named.

**Source check (1 new source, 3 locators).** Ramachandran, arXiv:1407.1813v2, fetched from arXiv through the sources service.

| Locator in the README | Lines read | Result |
| --- | --- | --- |
| §3, conditions (1)–(3), pp. 14–15 | ramachandran lines 635–650 | The three conditions (additivity over a closed subscheme and its complement, invariance under reduction, multiplicativity) and the identification of a measure with a ring homomorphism from the Grothendieck ring are there, on the stated pages. |
| Lemma 2.3 and the first proof of Theorem 2.1(i), pp. 10–11 | lines 441–467 | The lemma computes the ghost components of `exp(∑ b_r t^r/r)` as `(b_r)`; the first proof uses injectivity of the ghost map on `W(ℤ)` and multiplicativity of counts. No cohomology is used, as §7.3 says. |
| Theorem 2.1(i)–(ii), p. 9 | lines 389–399 | The Witt-product statement and the ring homomorphism to `W(ℤ)`; the reference entry correctly marks it as outside the roadmap. |

The source works with finite-type schemes; §7.3 states the homomorphism on the supplier's separated finite-type model, which is narrower and is what §4.20 provides. The seeded sample (1.9, 2.2, 5.2, 5.4, 5.5, 5.7, 5.15, 5.17, 5.20, 5.21, 6.7, 7.8, 7.14, 7.15, 7.16) has no target inside the changed passages; §7.8 is touched only through the new Check that quotes its count, verified above.

**Adversarial table.** Rows 1–6 are new, with values computed this round. The remaining rows are carried from the previous report (PRREVIEW-WeilConjectures~2, at ade9515) for statements the diff leaves untouched; their values are that report's.

| Statement | Instances tried | Values on each side | Result; change |
| --- | --- | --- | --- |
| 5.1, new Check | β=(2,3), c=(3,5), n=0, against `c_k β_k^n = ∑_j A_{jk} m_j` | det V = 1·3−2·1 = 1; A = rows (3,−2),(−1,1); V·A = identity. Moments m₀=3+5=8, m₁=6+15=21. Columns: 3·8−1·21=3, −2·8+1·21=5. Rows: 3·8−2·21=−18, −8+21=13. | Sound; it separates the two index conventions, which the β=(1,2) Check (symmetric inverse) cannot. |
| 7.3, count homomorphism: additivity | `𝔸¹ ⊇ Spec k[x]/(x²)` with complement `𝔾_m`; `Spec k[ε]/(ε²) ⊇ Spec k` with empty complement; empty scheme | `q^r = 1 + (q^r − 1)`; `1 = 1 + 0`; class 0 maps to the zero sequence. A point of the reduced source lands in the non-reduced closed subscheme through its reduction, so the non-reduced structure changes nothing. | Sound; the stated argument (one-point image, reduced source) covers the non-reduced case. |
| 7.3, count homomorphism: products and unit | `ℙ¹×ℙ¹` over 𝔽₂; `Spec 𝔽₄ ×_{𝔽₂} Spec 𝔽₄`; `Spec k` | `(1+2)²=9`, `(1+4)²=25` at r=1,2, matching the displayed `N_r=(1+q^r)²`. The degree-two point has sequence (0,2,0,2,…); its square is (0,4,0,4,…), the counts of two copies of `Spec 𝔽₄`. `Spec k` maps to (1,1,…). | Sound; a ring homomorphism to the product ring with coordinatewise operations. |
| 7.3, image is not a polynomial in `q^r` | non-split nodal cubic: class `𝕃 + 2 − [Spec k₂]` | Sequence `q^r + 2 − 2·1_{2∣r}`: `q+2` at r=1 (q+1 smooth points and the node), `q²` at r=2 (the split count). | Sound; the target `∏_{r≥1} ℤ` is needed, a single polynomial count would be wrong. |
| 7.3, `Z_XZ_Y` and the two new Checks | `ℙ¹` over 𝔽_q; `𝔾_m` over 𝔽₃; fat point | `Z_{ℙ¹}²` has logarithmic moments `2(1+q^r)`, so `N₁=2q+2` against `(q+1)²`; equal only if q=1, never a field size. `[𝔾_m]=𝕃−1` gives 2, 8, 26 = `3^r−1`. Fat point: class one, sequence (1,1,…), as §0.1. | Sound; the corrected sentence replaces a bare negative by the identity `Z_XZ_Y = Z_{X⊔Y}` of §1.2. |
| Scope: ghost reading of the excluded Witt formula | `Z_{Spec k}=(1−T)⁻¹`; `Z_{𝔸¹}=(1−qT)⁻¹` | `T·dlog` gives (1,1,…) and (q,q²,…), the counts; under QWittVectors §1.4a these are the Witt vectors with first coordinate 1 and q and the rest zero, whose ghosts are the same sequences. Over 𝔽₂ the ghost map is not injective (QWittVectors §1.2 Check), over ℤ it is. | Sound; “injective” is used only for `W(ℤ)`. |
| 6.8 citation (R02) | BC₂ at ℓ=2 | Carried from the previous report: rational `H⁰` of dimension 1, higher groups 0, Frobenius trace 1 = mass. The supplier clause now cited by title covers this case. | Sound. |
| 1.1 / `arithmeticZeta_absoluteConvergence` | empty; Spec 𝔽₄; Spec ℤ | Carried: empty product 1; factor 4/3 at s=1; Spec ℤ convergent for Re s>1. | Retained. |
| 1.6 / `normalized_integral_zeta_presentation` | 𝔾_m/𝔽₃; point; empty | Carried: U=1−T, V=1−3T, coprime, constant terms 1; empty U=V=1. | Retained. |
| 1.9 | [point/𝔾_m] over 𝔽₃; BC₂ | Carried: masses 1/(3−1)=1/2 and 1; naive 1/#C₂ fails. | Retained. |
| 2.2 | point, ℙ², genus 2 | Carried: dχ = 0, 6, −2; halves 0, 3, −1. | Retained. |
| 5.2 | β=(2,3), c=(3,5), C=8, R=3, n=0 | Carried: 3 ≤ 48 and 5 ≤ 40; zero root with R=0 gives 0 ≤ 0. | Retained. |
| 5.4 / `norm_le_of_grouped_moment_bound` | repeated β=2 with weights (1,−1), (1,1); 𝔽₂ | Carried: fibre totals 0 and 2; over 𝔽₂ two weights 1 total 0 while the root has norm 1. | Retained. |
| 5.5 | roots (2,2) over ℂ; (1,1) over 𝔽₂ | Carried: moments 2·2ⁿ force R ≥ 2; over 𝔽₂ moments 0 with root norm 1. | Retained. |
| 5.7 | γ=1/2, c=1/8 in ℝ; γ=2, c=2⁵ in ℚ₂ | Carried: 2ⁿ/8 > 1 for n ≥ 4; 2-adic norm 2^(n−5) > 1 for n ≥ 6. | Retained. |
| 5.15 | β=1/2 and β=1, c=3, R=1 | Carried: ratios 3·2⁻ⁿ → 0 against constant 3. | Retained. |
| 5.16 / `graded_polynomial_approximation` | p=2 with (r,s) = (2,0), (4,2), (0,4) | Carried: errors 0, 1, and ratio (1−2ⁿ)/2^(2n) → 0. | Retained. |
| 5.17 | ℙ²/𝔽₂; elliptic q=5, a=−2 | Carried: error 2 = b₂q; errors 2, 6 ≤ 2√5, 10. | Retained. |
| 5.20 | elliptic c=(2,5); rank zero; ℙ¹ | Carried: −6+2(−2)+5·2 = 0; 5−3·3+2·2 = 0. | Retained. |
| 5.21 | ℙ¹; split quadric; cubic over 𝔽₅ | Carried: errors 0, 2 = b·2 with b=1, 2 ≤ 2√5. | Retained. |
| 6.6 / `functional_equation_of_smooth_proper` | point; ℙ²/𝔽₂ at T=2; genus 2; empty | Carried: Z(2) = −1/21, Z(1/8) = 64/21, multiplier −64; χ = −2, Δ = 1/2; empty Δ = 1. | Retained. |
| 6.7 | ℙ¹ against the nodal rational cubic | Carried: weights 0, 2 against a weight-zero H¹. | Retained. |
| 7.8 | 𝔾_m, q=3, r=1,2 | Carried: −1+3 = 2, −1+9 = 8; recomputed this round through `[𝔾_m]=𝕃−1`. | Retained. |
| 7.14 | q=2, r=1,2 | Carried: 1+10·2+4 = 25; 1+10·4+16 = 57. | Retained. |
| 7.15 | quadric actions identity and swap; −1; unipotent | Carried: traces 2, 0, −1; counts 9 and 5; unipotent excluded by finite order. | Retained. |
| 7.16 / `weilConjectures_smooth_proper` | point; ℙ¹/𝔽₄; genus two | Carried: sole factor 1−T at d=0; zeros 1, 1/4; zeros of 1+4T⁴ of norm 1/√2. | Retained. |

**Form of the changed passages.** No LaTeX delimiters, pull-request numbers, process words or local paths were added; the new target has its hypotheses (finite field, the supplier's separated finite-type model), a locator at the claim, two Checks with computed values and a negative control, and its own clause in the *Needs* line so that it does not inherit the Künneth inputs. The only backticked identifier the diff adds, `K₀Var k`, is the supplier's notation, not a claimed declaration of this roadmap.

## Not verifiable

- Ramachandran, published version (Bulletin des Sciences Mathématiques 139 (2015), 599–627): not read; the README states that its locators refer to the arXiv version, which was read.
- Carried from the previous report, untouched by this change: Fulton, *Introduction to Toric Varieties*, §§1.4, 2.1, 2.4, 2.6, 5.1–5.2 (no legal copy readable), and the published renumbering of Kedlaya's *Fourier transforms and p-adic Weil II* (only the arXiv preprint was read).
- Ownership against open pull requests was checked through the open heads the tools index (447 pull requests) and the two cited heads; nothing beyond them was searched.

## Source issues

- none
