# Review of LocalFieldsRamificationPartII (pull request #2258 at e55f3ba)

**Verdict:** accepted

## Previous findings

- R01 — repaired: `TauCetiRoadmap/LocalFieldsRamificationPartII/README.md:815` states the module theorem over every domain, with flatness on the module; `Suggested.lean:87` retains that signature. The repair recorded by the previous accepted review remains intact.

## Verified sound

| Statement | Instances tried | Computed input / left side | Computed output / right side | Result; change |
|---|---|---|---|---|
| §0.1 summary: supported degrees and extensions | `P = {3}`; cubic root of 2 and its normal closure | Degrees `3`, `6`; prime divisors `{3}`, `{2,3}` | Supported: true, false; normality is not required | Agrees; grouping only |
| §0.1 tower law | `ℚ ⊂ ℚ(√2) ⊂ ℚ(√2,√3)`, `P = {2}` | Successive degrees `2`, `2` | Total degree `4 = 2·2`; all supported | Agrees |
| §0.3 summary: closedness and maximal extensions | `P = ∅`; `P` all primes | Maximal extensions `K`, `Kᵃ` | Allowed further finite degrees: only `1` in both cases | Agrees |
| §0.3 separable distinction and perfection | `K = 𝔽₂(t)ˢ`, `P = {2}` | Finite separable extensions have degree `1`; `[K(t½):K] = 2` | Separably closed: true; closed: false; perfection algebraically closed | Agrees |
| §1.2 summary: two henselizations | `A = ℤ_(3)` | `Γ_A = ℤ`, `κ_A = 𝔽₃` | `Γ_Aʰ = Γ_Aˢʰ = ℤ`; residues `𝔽₃`, `𝔽̄₃` | Agrees |
| §2.3 summary: six classes | `𝔽₄((t))/𝔽₂((t))` | Degree `2`, `e = 1`, `f = 2`, one prolongation | Unramified, tame, henselian: true; strict, totally ramified, purely wild: false | Agrees |
| §2.3 inseparable control | `𝔽₂((t½))/𝔽₂((t))` | Degree `2`, `e = 2`, `f = 1`, inseparable | Henselian, totally ramified, purely wild: true; strict, unramified, tame: false | Agrees |
| §3.2 summary: maximal extensions and complements | Trivially valued `𝔽₂` | `Kʰ = K`; `Kᵘ = Kᵗ = 𝔽̄₂`; complements `𝔽̄₂`, `K` | Both multiplication tensor products equal `𝔽̄₂` | Agrees |
| §3.4 summary and henselian splitting headline | Trivially valued `K = 𝔽₂(t)ˢ` | `Kᵗ = K`; maximal purely wild field `Kᵃ` | `K ⊗_K Kᵃ = Kᵃ`; separable splitting `K ⊗_K K = K` | Agrees |
| §4.1 Krasner hypothesis | `ℚ ⊂ ℚ(√2)` at 7, `s ≡ 3`, `y = 3` | `‖s−3‖ = 1/7 < ‖2s‖ = 1`; base nonhenselian | `s ∉ ℚ(3) = ℚ`; excluded by henselian hypothesis | Agrees |
| §4.1 root continuity | `f = X`, `g = X−2` over `ℚ₂` | `n = 1`, `γ* = 0`, coefficient value `1` | Threshold `1`; root-distance value `v(2) = 1` | Agrees; non-strict bound |
| §4.1 summary: decompletion | `K = ℚ` at 3, `L = H₃(√3)` | `[L:H₃] = 2`; `E = ℚ(√3)` has one prolongation | `[E:ℚ] = 2`; `E ⊗ H₃ = L` | Agrees |
| §4.4 summary: height-one splitting and tameness | `K = ℚ(t)`, t-adic valuation | Height `1`, residue exponent `1`; allowed supported degree `1` | `K_w = K`; `Kᵗ = Kᵃ`; `Kᵗ ⊗ K = Kᵃ` | Agrees without henselianity |
| §5.1 summary: composition and coarsenings | Composite valuation on `ℚ₃((t))` | `v(t) = (1,0)`, `v(3) = (0,1)` | Height `2`; coarsening heights `0,1,2`; residue exponents `1,1,3` | Agrees |
| §5.4 summary: unramified criterion | `𝔽₄((t))/𝔽₂((t))`, endpoint coarsenings | Both steps degree `2`, separable; total `e = 1`, `f = 2` | Unramified total: true; conjunction of steps: true | Agrees |
| §5.4 summary: tame criterion | `ℚ₃((s))/ℚ₃((t))`, `s³ = t`, composite valuations | Coarse tame: true; residual identity; coarse value quotient `ℤ/3` | Tame total: false; three-condition conjunction: false | Agrees; final residue prime retained |
| §5.4 summary: tame-field criterion | Composite valuation on `ℚ₃((t))` | Coarse tame: true; residual `ℚ₃` tame: false; `ℤ/3ℤ ≠ 0` | Composite tame: false; conjunction: false | Agrees |
| §6.1 summary: finite-height tameness | `ℂ₃`; negative control `ℚ₃` | Height `1`; `Γ_ℂ₃ = ℚ = 3ℚ`; `X³−3` irreducible over `ℚ₃` | `ℂ₃` closed and tame; `ℚ₃` closedness fails, degree `3` | Agrees |
| §6.1 summary: finite-height descent | Trivially valued `K = ℚ(t)`, `L = K(√t)` | `p = 1`, `[L:K] = 2`; choose `K₀ = K`, `L₀ = L` | Height `0`, transcendence degree `1`; tensor degree `2 = [L:K]` | Agrees |

The rows for untouched statements stand as in the previous review, of `e8e92d9`.

- Source checks: 8 seeded targets intersect the changed summaries (§§0.3, 1.2, 2.3, 3.2, 3.4, 4.1, 5.1, 5.4); locators, hypotheses and printed pages checked in temkin17 lines 249–638, stacks-more-algebra lines 17762–17806, kpr86 lines 120–170 and cks23 lines 630–730.
- Identifiers: all 41 numbered targets retained; 16 headings became bold labels; 11 summaries added; no theorem, hypothesis, supplier or layer removed or renumbered.
- Pinned declarations opened: `Mathlib/RingTheory/Valuation/RamificationGroup.lean:49` (inertia is the residue-action kernel), `Mathlib/Analysis/Normed/Field/Krasner.lean:56` and `:73` (Krasner predicate and complete-base theorem).
- Supplier checks: 6 named roadmap contracts resolve; changed groups retain their cited sections; all 3 declared gap slugs match `packages/LocalFieldsRamificationPartII/design/plan.json` and the README contracts.
- Signatures: ran `#check @` for all 16 declarations in one scratch copy; compared the elaborated types with the README; no lost binder or change of generality. No Lean statement changed in this diff.
- Gate: worker's targeted build and every gate check passed; local gate rerun passed; direct `lake env lean` and the signature probe succeeded with only 9 `sorry` warnings each.
- Dependency output: `depcheck: 244 roadmaps, 2210 edges, 0 problem(s)`; no UPWARD or CYCLE.
- PR text: title, prose and `roadmap-summary` agree with the addition of 3 files and 16 declarations against main; the domain-level module headline is accurately described; outside-folder diff: 0 paths.

Overlap check: read AdicCoefficientsAndComparisonsPartII, EtaleDualityAndPerverseSheavesPartII, LocalFieldsRamification, QuadraticFormInvariantsPartII, DiamondEtaleCohomology, RamificationOfCompleteDiscretelyValuedFields and PadicExtensionFamilies. LocalFieldsRamification owns local-field ramification, RamificationOfCompleteDiscretelyValuedFields its complete-DVR extension, ClassicalAdicEtaleCohomology the strict-localization/tame-quotient inputs, and this roadmap the general-valued-field extension; AdicCoefficientsAndComparisonsPartII and QuadraticFormInvariantsPartII cite its preserved GF identifiers. No new ownership conflict or dropped supplier identifier.

Source independence: changed passages only; 11 added summaries compared with 4 sources (temkin17, stacks-more-algebra, kpr86, cks23), with no copied expression or reused source material. Largest share: temkin17, 53 of 84 explicit source-name citation occurrences. No layer was added, removed or reordered, so the contents comparison was not repeated.

## Not verifiable

- rg71, Corollaire 3.4.7, and serre-cg, I §3.4 Proposition 16 and II §2.2 Proposition 3/Corollary 1: settled as uncertified; no renewed source request.

## Source issues

- **Error** in temkin17 at §2.4.6(4), printed p. 108, line 464: the source says the tame field gives a Galois quotient for every valued field; it should be restricted to normal wild inertia, using subgroup factorization otherwise; affects a stated result.
- **Misprint** in temkin17 at proof of Lemma 2.6.3(ii), printed p. 112, line 610: the source says the final residue prime equals the characteristic of the coarse residue field; it should be the residue characteristic of that field with its residual valuation; affects the proof.
- **Misprint** in temkin17 at proof of Theorem 2.6.6, printed p. 112, line 627: the source says to apply part (ii) of Corollary 2.5.6; it should be Corollary 2.5.6, which has no numbered parts; affects nothing.
- **Misprint** in cks23 at proof of Theorem 16(c), printed p. 14, line 684: the source says the root-distance value is strictly above the threshold; it should be at least the threshold, attained by X and X−2 over ℚ₂; affects the proof.

## For the human reviewers

- aid25 is cited as arXiv:2511.07177v1 with no published venue (`TauCetiRoadmap/LocalFieldsRamificationPartII/README.md:1887`). §1.1 also cites published temkin17. The publication and licence status of this preprint remain for human review.
