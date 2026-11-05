# Port report: ArakelovGeometryAndAbelianHeightsPartII

Branch: `roadmap/arakelov-geometry-and-abelian-heights-part-ii`, created from main at `3b51055`.
Head commit: `12ef4f6ebb724c065bf5d884d60f25c01da04080`.

Only `TauCetiRoadmap/ArakelovGeometryAndAbelianHeightsPartII/README.md`, `TauCetiRoadmap/ArakelovGeometryAndAbelianHeightsPartII/Suggested.lean` and `TauCetiRoadmap/ArakelovGeometryAndAbelianHeightsPartII/metadata.toml` are committed. The top-level roadmap list, the manifest and the toolchain are untouched. The package folder was read only, apart from this report.

## Validation

- Targeted build, run from the worktree on the final head: `Build completed successfully (8954 jobs).` Warning count: **0** (the file declares nothing, so there is no `sorry`).
- Gate: `gate ArakelovGeometryAndAbelianHeightsPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK` (run after the commit with `--order` pointing at the board merge order).
- Dependency-direction check (`gate --depcheck … --movable --content …`), exact output:

```text
depcheck: 229 roadmaps, 2164 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. The roadmap stands at line 324 of the merge order, after every supplier it names (ArakelovGeometryAndAbelianHeights 130, HeightsRationalPointsAndObstructions 131, ArithmeticDynamics 322, GrossZagierAndArithmeticHeights 323, StableReductionPartII 300, TropicalAndBerkovichArithmetic 225, MotivesAndAlgebraicCycles 72, LefschetzPencilsAndVanishingCycles 52, JacobianChallengePartII 48, NeronModelsAndSemistableAbelianVarieties 47, ComplexComparisonPartII 39; SchemeAndStackFoundations and JacobianChallenge are on main) and before its one consumer, HeightsRationalPointsAndObstructionsPartII at 325.

- Citation resolver on the committed README: one lead, "StableReductionPartII §§4.8: no roadmap StableReductionPartII on main or in an open pull request". StableReductionPartII is a board package without a pull request (merge order 300, earlier than this roadmap, listed in the brief as consumable); the resolver cannot see board packages. Every one of its cited sections was checked by title against `packages/StableReductionPartII/README.md` (mapping below). No Lean name is flagged.

- Signature check: `Suggested.lean` declares no `def`, `theorem` or `instance`, so there is no `#check @name` to elaborate and no elaborated type to compare with the README; the worker's `signatures.md` says the same ("no named declaration"). The file is the main-branch form of a declares-nothing acceptance test (`module` / `public import Mathlib` / module docstring / empty namespace, as `TauCetiRoadmap/DiagrammaticCoherence/Suggested.lean` and `TauCetiRoadmap/CFSGStatement/Suggested.lean` on main). The object grep of the pinned Tau Ceti (`358314d4`) and Mathlib (`f6090c70`) for "Faltings height", "Berkovich", "adelic line", "Arakelov", "Deligne pairing", "Moriwaki", "metrized graph" finds only the elliptic-curve canonical-height files; no carrier of any headline exists at the pins, so stating nothing is the correct outcome and nothing is padding or a stand-in.

## Draft pull request body

This roadmap builds the arbitrary-base adelic theory of Yuan and Zhang (adelic divisors and line bundles on quasi-projective schemes over ℤ or a field, their Berkovich realization, intersection numbers, Deligne pairings, volumes, Hilbert–Samuel and Siu, heights and the fundamental inequality), the invariant adelic extensions and the adelic Hodge bundle, Moriwaki heights over finitely generated fields, and the admissible metrics of Zhang on curves and their families, with the local Calabi uniqueness, the arithmetic Hodge index inequality, the relative theta identities, the graph invariants ε, φ, δ and their global divisors. Its end theorems are Yuan's: nefness and bigness of the admissible canonical bundle and of its Deligne self-pairing under maximal variation, the potential-bigness criterion with its Abel, difference and universal-shift applications, and the uniform two-sided comparison of the normalized admissible self-intersection with max{h_Fal, 1} for curves of fixed genus over all number fields and one-variable function fields. We want it because these are the inputs of the uniform Bogomolov and small-point theorems planned in HeightsRationalPointsAndObstructionsPartII, and none of the adelic, admissible-metric or curve-moduli positivity material exists in Mathlib, Tau Ceti or an earlier roadmap. Part I (ArakelovGeometryAndAbelianHeights) stops at hermitian degrees, arithmetic divisors with smooth Green functions, point heights, the Faltings metric and the metrized Hodge line on Siegel compactifications; this Part II begins at continuous integrable metrics and the model Deligne pairing.

AI-assisted port and mathematical checks: Claude (Fable 5.1).

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Dependencies that are still pull requests

ArakelovGeometryAndAbelianHeights, HeightsRationalPointsAndObstructions, ArithmeticDynamics, GrossZagierAndArithmeticHeights, TropicalAndBerkovichArithmetic, JacobianChallengePartII, NeronModelsAndSemistableAbelianVarieties, MotivesAndAlgebraicCycles, LefschetzPencilsAndVanishingCycles, ComplexComparisonPartII (all new-roadmap pull requests at the heads the brief gives). StableReductionPartII is a board package with no pull request yet (see Unresolved). SchemeAndStackFoundations and JacobianChallenge are on main.

## What moved from the Lean to the README

Nothing. The accepted package file declares nothing, and no headline became statable at this worktree's pins. The only Lean changes are the header (`module` / `public import Mathlib`, the form on main), the docstring's opening sentences (now the prescribed "the roadmap is README.md; this file states the headline theorems against the pins and records which are not statable and what each lacks"), the addition of the Layer 10 construction of §10.9a (the numerically trivial extension of the modified diagonal) to the Layer 10 bullet, and a closing sentence that no stand-in is written. No `set_option`, no `TauCeti.*` import (none is used), no `#check`.

## Edits to the README

Every target, API list, Check, worked example and supplier contract of the package is kept; nothing was deleted. The changes:

1. **Review notes applied (REV-PKG~5, both P3, accepted as non-blocking and never applied by the later red-team rounds).** F01: §7.6(1) now states that curvature measures are transported unchanged along the rescaling homeomorphism, so that at a point |·|_∞^t of the archimedean ray (0 < t ≤ 1) the measure is (1/(tπi))∂∂̄ log‖s‖_t + δ_div(s) with mass deg L, and a Check records Fubini–Study O(1) at t = 1/2 (transported mass 1, literal §0.1 current mass 1/2; φ halved versus divided by 8). This is the convention §§10.3(4), 10.6 and 13.8 already relied on. F02: §6.4(1), the Silverman–Tate comparison for Moriwaki heights, is now stated for every polarization with nef H̄ᵢ, big or not, with the route naming the §6.2(1)–(3) inputs it uses; bigness is kept for the specialization limit §6.4(2), and the zero polarization over ℚ(t) is the control Check. This is exactly the "Moriwaki Silverman–Tate nef contract" that HeightsRationalPointsAndObstructionsPartII asks of this roadmap, so that consumer's request is satisfied without a new target.
2. **Line locators.** 187 "`<source> line N`" and "lines N–M" tokens were removed; theorem, section and page locators stay. Two citations that became bare source ids were completed ("yuan-zhang-2025, §5.2.1, p. 140" in §0.3; "gao-habegger-2019, p. 55" in §6.2). The References paragraph about line-numbered extractions was replaced by one sentence on editions and pagination.
3. **Gap contracts** rendered in the main-branch form "What X must provide (the … contract)" and cited as "the … contract" in Needs and Dependencies. Slug → name: `curve-moduli-noether-positivity` → "the curve-moduli and Noether-positivity contract" (StableReductionPartII); `singular-pluripotential-products` → "the singular pluripotential-products contract" (ComplexComparisonPartII §C5.4); `bertini-normal-sections` → "the Bertini normal-sections contract" (SchemeAndStackFoundations §4.13); `cube-for-products` → "the cube-for-products contract" (JacobianChallenge Layer E). The review.json names the first two; the last two were added by the red-team repairs (FIX-RT~2) and are kept.
4. **StableReductionPartII citations** mapped from the design labels to the package's numbering, by title: MC.4/fine-level-scheme → §4.8; MC.5/boundary-divisor → §5.2; MC.5/boundary-thickness → §5.9; MC.5/hodge-determinant → §5.1 (the Hodge bundle E, whose determinant λ is the Hodge line in that package's Conventions); MC.5/integral-noether → §5.19; MC.5/semi-canonical-noether → §5.21; MC.6/maximal-variation → §6.1; MC.6/stable-compactification → §6.2; MC.6/stable-compactification-exists → §6.8; MC.6/maximal-variation-hodge → §6.9; MC.6/level-stable-compactification → §6.10; MC.6/finite-cover-hodge-descent → §6.21; MC.6/arbitrary-field-hodge-positivity → §6.22. The contract paragraph now names these sections with one clause each.
5. Shape: a blank line after the Layer 0–5 headings (the package ran the first sentence into the heading line); "§4.6 here" in the HeightsRationalPointsAndObstructions contract, where "§4.6" meant this roadmap's section and read as the supplier's.

No layer, target, API bullet or Check was renumbered or removed, so the consumer HeightsRationalPointsAndObstructionsPartII's citations (§§0.3, 3.1–3.3, 4.6–4.8, 5.1–5.4, 6.1–6.4, 8.3–8.4, 9.x, 12.3–12.6, 13.7–13.10) still resolve.

## Supplier replacements and duplication sweep

Every cross-roadmap citation was re-resolved at the head the brief gives (ArakelovGeometryAndAbelianHeights 1000, HeightsRationalPointsAndObstructions 1017, ArithmeticDynamics 1335, GrossZagierAndArithmeticHeights 1487, TropicalAndBerkovichArithmetic 1494, JacobianChallengePartII 1225, NeronModelsAndSemistableAbelianVarieties 852, MotivesAndAlgebraicCycles 1313, LefschetzPencilsAndVanishingCycles 873, ComplexComparisonPartII 848) or on main (SchemeAndStackFoundations §§0.1, 0.3, 0.20–0.21, 3.5, 4.11–4.13, 5.1–5.3, 5.5–5.6, 5.10, 5.12; JacobianChallenge Layer E). Every cited section exists with the content the README attributes to it; in particular LefschetzPencilsAndVanishingCycles §5.1 is titled "Bertini for monodromy images" but states Jouanolou's irreducibility theorem as part of the target, GrossZagierAndArithmeticHeights §2.12 is the Faltings–Hriljac comparison relative to the base field, TropicalAndBerkovichArithmetic §6.6 gives μ_a = (1/g)(Σ g(v)δ_v + Σ ds/(ℓ_e + r_e)), ArithmeticDynamics §4.3a is the global-field quasi-projective completion that §4.9 compares with, and ArakelovGeometryAndAbelianHeights §6.5 states Bost's bound in both normalizations. The pinned declarations named in the README (`NumberField.prod_abs_eq_one`, `Projectivization.logHeight`, `TauCeti.AlgebraicGeometry.InvertibleSheaf`, `…AbelianVariety`, the three `eulerDegree` names) were checked at the pins; the gate's readme-ids check is 0.

Duplication sweep by object, with `roadmaps grep` over main and the 445 open heads of the fresh index after the edits: "potentially big", "Moriwaki", "Deligne pairing" match only the consumer HeightsRationalPointsAndObstructionsPartII; "admissible metric" matches the cited suppliers GrossZagierAndArithmeticHeights (archimedean), TropicalAndBerkovichArithmetic, ArithmeticDynamics and JacobianChallengePartII; "Gross–Schoen" only MotivesAndAlgebraicCycles' reference list; "arithmetic Hodge index" and "metrized graph" nowhere; "Noether formula" on main only as the geometric surface formula of SchemeAndStackFoundations §5.10 (cited); "Faltings height" in the parent and in roadmaps that consume it (EllipticCurvePeriodsAndModularParametrizations, ComplexMultiplicationAndExplicitReciprocityPartII, ShimuraVarieties, …), none of which plans the adelic Hodge bundle or the admissible comparison; "Berkovich analytification" only TropicalAndBerkovichArithmetic (cited for the nonarchimedean fibres; the archimedean-base scheme analytification of §2.1 is owned here). No removal was needed, so "Scope and ownership" records only the deferrals the package already had. The board package index was also read: no package other than the cited suppliers concerns these objects. Ownership against open pull requests was checked through the roadmaps service's grep of every open head and the sibling checkouts named in the brief; no open pull request plans an object of this roadmap.

Consumer direction: the only roadmap named as a consumer, HeightsRationalPointsAndObstructionsPartII, is later in the order (325 > 324) and cites this roadmap's sections. No roadmap earlier in the order cites this one (`roadmaps grep ArakelovGeometryAndAbelianHeightsPartII`: matches only at the 1821 head).

## Mathematical review

The README was read in full as an upstream reviewer would. Besides the two review notes above, no statement was found wrong, vacuous or unsourced; the computed pass below recomputes the package's witnesses and adds instances. Three things a reader should know, none a defect: the source error at yuan-2026 §4.4.1 (Bost's constant printed in the wrong normalization) is corrected in §13.7 as the review recorded; the tetrahedral graph K₄ attains Cinkir's genus-3 constant, so §13.8's divisor coefficient is sharp there; and §13.7's Check on the j = 0 elliptic curve agrees with the parent's §5.9 (−1.321 Faltings, −0.749 Deligne).

## Unresolved

- StableReductionPartII exists only as a board package (no pull request). Its cited sections are in that package with the content the contract states, but the resolver reports it as found nowhere until its pull request opens. The contract "What StableReductionPartII must provide" is kept with the section list, so the dependency is explicit.
- The two uncertified sources (`moret-bailly-1989`, `faltings-1984`) remain cited by locator only, as the accepted package has them; their normalizations are checked through yuan-2026 p. 89 and wilms-2017 Theorem 1.1.
- Nothing in `Suggested.lean` is statable; when a carrier for adelic line bundles, Berkovich curves or the stable Faltings height reaches Tau Ceti, the headlines of §§11.4, 12.3, 12.5 and 13.10 should be added first.

Instruction-like text met during the job (review comments, red-team reports, fetched roadmap text) was treated as data; none asked for anything outside the brief. No credential was read, nothing was pushed, no pull request or issue was written.

## Computed adversarial mathematics pass

Rows cover every target, the conventions and the supplier normalizations. Values were recomputed, not copied; "unchanged" means the statement survived the instance.

| Statement | Instances tried | Values on the two sides | Result | Change |
| --- | --- | --- | --- | --- |
| Conventions: Green sign and factor | Spec ℤ, ‖1‖ = e⁻¹, e⁻²; f = 2 | degrees +1, +2; finite +log 2, archimedean −log 2, sum 0; parent's g is 2·ours | holds | none |
| Conventions: point-height normalization | [1:2] over ℚ, over a quadratic K; [1:t] over k(t), then t = u² | log 2 and 2 log 2 relative / log 2 absolute; 1 then 2 | holds | none |
| Conventions: Faltings vs Deligne norm | g = 1, 2 | π⁻¹ squared-norm ratio: shift (log π)/2; g = 2: log π | holds | none |
| Conventions: Θ on an elliptic fibre | E, Θ = Δ^*(P^∨) | deg Δ^*P = −2, deg Θ = +2; [2] multiplies ĥ by 4 | holds | none |
| Conventions: graph lengths under extension | unit loop; unramified and ramified quadratic | τ = 1/12 unchanged; 1/6 after ramified renormalization | holds | none |
| HRPO contract normalizations | Spec 𝔽₂, 𝔽₃; FS O(1) on ℙ¹_ℤ; O(c) on Spec ℤ | log 2, log 3; square 1/2; c | holds | none |
| ArithmeticDynamics contract | O(1), O(2), O(−1) on ℙ¹ | masses 1, 2, −1; probability of O(2) is 1 | holds | none |
| §0.1 nef vs semipositive | Spec ℤ, ‖1‖ = e^c, c > 0 | curvature 0 (semipositive), degree −c < 0 (not nef) | holds | none |
| §0.2 Deligne pairing in relative dimension 0 | finite flat degree 2, L = f^*O(c) | norm O(2c); at c = 1 degree 2 versus 1 for the identity | holds | none |
| §0.3 volumes | Spec ℤ, c = 1, 0, −1; Spec 𝔽₂, 𝔽₄/𝔽₂; ℙ¹ with O(a), O(−1) | log(2⌊eᵐ⌋+1)/m → 1, log 3/m → 0, 0; volumes 1, 2 for every L (0! = 1); a and 0 | holds | none |
| §0.3 Siu with zero mixed term | A² = 2, B = 0 (d = 1) | bound 2 for every ε, no division by 0 | holds | none |
| §1.1 model divisors | Spec ℤ: [2], ½[2] | [2] admitted, ½[2] excluded; (0,1)+(0,2) = (0,3) | holds | none |
| §1.2 boundary norm | E₀ = (0,1) on Spec ℤ; E₀ itself; nonzero restriction | ‖(0,c)‖ = \|c\|; ‖±E₀‖ = 1; ∞ | holds | none |
| §1.3 irrational coordinate | Spec ℤ[1/2], coefficient √2 at [2] | 2-coordinate irrational mod ℤ, no rational model | holds | none |
| §1.4 kernel | div(2) on Spec ℤ | finite log 2, Green −log 2, class 0; O(1) degree 1 not principal | holds | none |
| §1.5 positivity classes | O(c), c = −1, 0, 1; ½O(1) on ℙ¹ | nef iff c ≥ 0; ½O(1) has degree 1/2 and no integral preimage | holds | none |
| §1.6 forgetful map | O(1) from Spec ℤ on Spec ℚ | arithmetic degree 1, image in P̂ic(ℚ/ℚ) is 0 | holds | none |
| §1.7 growth bound | (log\|z\|)² on ℂ^× | (log\|z\|)²/\|log\|z\|\| → ∞: not bounded by a boundary multiple | holds | none |
| §1.8 arithmetic curve | K = ℚ: U = Spec ℤ, Spec ℤ[1/2], all primes removed | P̂ic⁰ = 0, ℝ/ℤ, ⊕_p ℝ/ℤ | holds | none |
| §1.9 domination | D = ([2],0), D′ = ([2],c); (0,−1) vs (0,1) and (0,1/2) | D′ ± D effective, deg D′ = log 2 + c ≥ 0; (0,1/2) fails since −1/2 > −1 | holds | none |
| §2.1 M(ℤ) | archimedean ray t = 1, 1/2; 2-adic | \|2\| = 2, √2, 1/2 | holds | none |
| §2.2 metric of O(D) | D = div 2 | g_∞ = −log 2, e^(−g) = 2, e^(−g/2) = √2 (rejected) | holds | none |
| §2.3 analytification separates | O(1), O(2) on Spec ℤ | Green values 1, 2 at t = 1, 0 on finite rays | holds | none |
| §2.4 test points | t = 1/2, t = 2 on ℝ; 2-adic s = 2; Spec 𝔽₂ | √2 ≤ 2; 4 > 2 excluded; \|2\| = 1/4 allowed; one trivial point | holds | none |
| §2.5 effectivity | O(c), c = −1, 0, 1 | Green −t, 0, t on the ray: false, true, true | holds | none |
| §2.6 mixed signed measures | ℙ¹×ℙ¹: O(1,0), O(0,1), O(−1,0) | (2−0−0)/2 = 1; 0−1 = 1−2 = −1 for two decompositions | holds | none |
| §2.7 trivially valued metric | ℙ¹, \|t\| = 2, 1/2; φ(t) = t² | ‖X₀‖ = 1/2, 1; ‖X₀²‖ = 1/4 = ‖φ^*X₀‖ at \|t\| = 4 | holds | none |
| §3.1 empty intersection and projection | Spec 𝔽₄/𝔽₂; 𝔽₂(t) ⊂ k(u) ⊂ k(v), u² = t, v² = u | 2 = 2·1; 4 = 2·2 (inseparable degrees) | holds | none |
| §3.2 pairing degree | finite flat degree 2, f^*O(1); fibre degree 3 against O(1) | O(2); O(3) | holds | none |
| §3.3 composition | degrees 2 then 3; ⟨L, π^*O(2)⟩ with fibre degree 3 | O(6) = O(6); O(6) | holds | none |
| §3.4 nonreduced fibres | E: y² = x³+3x+2 over 𝔽₅, Frobenius | points O,(1,±1),(2,±1): #E = 5; disc = 216 ≡ 1 ≠ 0; F^*O(P−O) = O(5P−5O) = O | holds | none |
| §3.5 total mass | 𝔾_m ⊂ ℙ¹_ℚ with max O(1) | mass 1 at every place versus algebraic bundle O of mass 0 | holds | none |
| §4.1 small sections | O(c) on Spec ℤ, c = 0, 1, −1 | 2⌊e^c⌋+1 = 3, 5, 1: ĥ⁰ = log 3, log 5, 0 | holds | none |
| §4.2 volume | Spec ℤ: c = −1, 0, 2 | 0, 0, 2 | holds | none |
| §4.3(2) Siu | A = O(2), B = O(1) on Spec ℤ | vol(A−B) = 1 = 2−1 | holds | none |
| §4.3(3) continuity | vol^(O(c)) at c → 0 | max(c,0) continuous at 0 | holds | none |
| §4.3(4) large twist needed | max O(1) ⊗ O(−1) on ℙ¹_ℚ, twist cN̄ | 0 < c < 1: every nonzero integral section has sup norm ≥ e^(m(1−c)) > 1 (sup on the torus ≥ max coefficient ≥ 1), volume 0; c > 1: self-intersection 2(c−1) > 0 | holds | none |
| §4.4 Deligne pairing of a sum | ℙ¹×S, L = O(1)+π^*M, M degree 1 | ⟨L,L⟩ = ⟨O(1),O(1)⟩ + 2M: degree 2 (field), 2 (max) and 5/2 (FS) over ℤ | holds | none |
| §4.5 finite covers | degree 2, M^d = 3 or 0 | 6 or 0: positivity preserved both ways | holds | none |
| §4.6 heights | [1:2]; Spec 𝔽₄/𝔽₂ | log 2; vector height 0 versus empty degree 2 | holds | none |
| §4.7(3) constant not small | roots of unity on ℙ¹_ℚ | h_L̄ = −1 forces c ≥ 1 | holds | none |
| §4.8 fundamental inequality | X = Spec K, [K:ℚ] = 2, O(1) | 2/(2·1·1) = 1 = e₁; without a_K, 2 ≤ 1 false | holds | none |
| §4.9 comparison | ℙ¹/ℚ at the real place, i and −i; O(2) | pushforward of (δ_i+δ_−i)/2 is δ_q of mass 1; O(2) mass 2 both sides, probability 1 | holds | none |
| §5.1 invariance and integrality | z ↦ z²; f = id, q = 1; ℙ¹ over ℚ[ε]/(ε²) | max(1,\|z²\|) = max(1,\|z\|)², ĥ(2) = log 2; O(1), O(2) both invariant (uniqueness fails); ε ≠ 0 = ε²: not integral, excluded | holds | none |
| §5.2 non-degeneracy | A₀×S, dim 1+1; torsion section over a curve | Betti rank 2 < 4, degree 0; rank 0 < 2 | holds | none |
| §5.3 equidistribution | constant abelian variety over a point; repeated 0 | torsion height 0, limit Haar mass 1; repeated point not generic | holds | none |
| §5.4 Hodge bundle | [K:ℚ] = 2, stable height h; Deligne metric | raw degree 2h, absolute h; shift (g/2) log π, not g log π | holds | none |
| §6.1 Moriwaki height | ℚ(t), H̄ = O trivial; ℚ, [1:2] | all intersections 0; log 2 with empty polarization | holds | none |
| §6.2 Northcott needs big | ℙ¹_ℚ, [1:n]; zero polarization | log n, 2 log n, 0; infinitely many height-0 points of degree 1 | holds | none |
| §6.3 canonical height | order-2 torsion; height a; quadratic k₀ | [2ⁿ]P = 0, limit 0; 0, a, 4a; relative 2a, absolute a | holds | none |
| §6.4(1) nef suffices | zero polarization over ℚ(t) | both sides 0, no bigness used; h^B_S̄ bounded so (2) vacuous | (1) narrowed in the package | stated for nef B, big kept for (2) (REV~5 F02) |
| §6.4(2) specialization | degree-2 base cover, generic height 3 | 6/2 = 3 | holds | none |
| §7.1 admissible on abelian varieties | good reduction O(e); Tate curve | δ_ζ of mass 1; Haar on a circle of mass 1 versus atomic model measure | holds | none |
| §7.2 admissible on curves | unit genus-2 banana | model curvature δ_v₁+δ_v₂, admissible (2/3)Σ_e: equal mass 2, unequal measures | holds | none |
| §7.2a local Calabi | ℙ¹/ℚ_p, clamp f of log\|t\| to [0, log p] | f(ζ₁) − f(ζ_p) = 0 − log p = −∫(f′)² ds = −log p < 0; opposite sign would give +log p | holds | none |
| §7.3 admissible measure | unit banana; genus-2 vertex; good reduction | r_e = 1/2, density (1/2)/(3/2) = 1/3 per edge, mass 1; δ_v with c₁(ω) = 2δ_v; δ_ζ | holds | none |
| §7.4 canonical pair | g = 2; g = 1 with scaling e^c | curvature mass 2, Green mean 0, residue norm 1; (a)–(c) kept, (d) violated for c ≠ 0 | holds | none |
| §7.5 graph formulas | good reduction; unramified quadratic extension | g_μ = 0, ratio e⁰ = 1; intersection 1/e = 1, not 1/2 | holds | none |
| §7.6(1) rescaling | ℚ₂ with a = 2; ℝ with a = 2, 1/2; b = 1/2 with a = 2 | \|2\|: 1/2 → 1/4; 4 > 2 excluded; √2 ≤ 2 allowed; ab = 1 returns the usual value | holds | none |
| §7.6(1) measure transport | FS O(1) on ℙ¹ at \|·\|_∞^(1/2) | transported mass 1 = deg; literal current mass 1/2; φ halved versus /8 | convention was implicit | sentence and Check added (REV~5 F01) |
| §7.7 global admissible bundles | g = 2, quadratic extension; g = 1 | raw square doubles, W/[K:ℚ] invariant; ω_a² = 0 from fibre degree 0 | holds | none |
| §8.1 admissibility | y² = x³ − x over ℤ[1/2], ‖1‖ = exp(−cos 2πx) | Laplacian −4π² cos 2πx ≠ 0 although deg = 0: not admissible | holds | none |
| §8.2 torsor | Spec ℚ, twists O(1), O(2) | difference O(1) | holds | none |
| §8.3 canonical bundles | g = 2 | deg w = 2, Δ^*D = −w of degree −2; transposition fixes D | holds | none |
| §8.4 invariant extension | Θ̄ + O(1) | [2]^*: 4Θ̄+O(1) versus 4Θ̄+O(4), difference O(−3) ≠ 0; [3]^*Θ̄ = 9Θ̄ | holds | none |
| §8.5 evaluation and adjunction | x^*w of degree 1; L̄ = π^*O(1) | self-pairing −1, pairing with w +1; shift 1 both sides | holds | none |
| §8.6 non-integrable continuous metric | f = Σ 2⁻ⁿ cos(2π4ⁿx) on ℂ/(ℤ+iℤ) | Fourier coefficient of Δf at (4ⁿ,0) is −(2π4ⁿ)²·2⁻ⁿ/2 = −2π²8ⁿ, unbounded | holds | none |
| §8.7 relative Hodge index identity | quadratic K, absolute theta height a | deĝ(ι^*Θ̄) = 4a, deĝ⟨M̄,M̄⟩ = −4a, normalized −2a | holds | none |
| §8.8 Hodge index inequality | π^*N̄ (equality); FS O(1) on ℙ¹_ℚ; the clamp divisor | 0; deg M = 1, ⟨M̄,M̄⟩ = 1/2 > 0 (hypothesis needed); −log p < 0 | holds | none |
| §8.8 Bertini inputs | quadric cone xy = z² in ℙ³_ℚ; cone over a nodal cubic | normal (S₂, singular locus codimension 2) but singular; irreducible but not normal (codimension-1 singular line) | holds | none |
| §9.1 theta pullback | g = 2, d = 1, A = ⟨w,w⟩, b = x^*w; d = 0; g = 1 | A + 8b on both formulas; 0; both sides 0 and (3) gives 4x^*w = first identity with 4g − 4 = 0 | holds | none |
| §9.2 coefficients | g = 2, 3 | d² + 2d = 8, 24; d²(d²+4d−4g+4) = 32, 384 (recomputed: d²+4d−4g+4 = 4g(g−1)) | holds | none |
| §9.3 nefness identity | g = 2, 3 | −1/8 + 32/256 = 0; −1/24 + 384/9216 = 0 | holds | none |
| §10.1 one-loop invariants | g = 2, ℓ = 1, 2 | ε = (2g−2)(1/g)(ℓ/6) = 1/6, 1/3; τ = 1/12, 1/6; φ = (g−1)ℓ/(6g) = 1/12, 1/6 | holds | none |
| §10.2(3) Cinkir constants | t(2), t(3), t(4), t(5), limit | 1/27, ≈0.0545, 3/88, 16/400 = 1/25, → 1/14; min over g ≥ 2 is 3/88 > 1/39 | holds | none |
| §10.2(5) de Jong identity | g = 2 unit loop | 1 + 1/6 − 1/6 = 1 = 3/2 − 6/12 | holds | none |
| §10.3 local φ | type-0 node g = 2; unramified and ramified quadratic; a = 1/2 real | 1/12; 1/12 and 1/6; φ/2 > 0 | holds | none |
| §10.3(2) spectral normalization | ω = √2β | (1/2)·4S = 2S in both bases; 2/λ with ω would give 8S | holds | none |
| §10.4–10.5 ε divisor | g = 2 unit type-0 node | g_E/log e = 1/6; (2g−2)δ − ε = 2 − 1/6 = 11/6 ≥ 0 | holds | none |
| §10.6 Φ_S | unit loop at t = 1, 2; archimedean t = 1/2 | 1/12, 1/6; φ/2 | holds | none |
| §10.7 triple pairing | g = 2, 3; the five auxiliary pairings | B(D,wᵢ,wᵢ) = P via p_i-pushforward with fibre degree 1, B(D,w₁,w₂) = P, B(D,D,wᵢ) = −P: 8 − 24 + 24 + 12(g−1) = 20, 32; Φ coefficient −8 | holds | none |
| §10.8 φ divisor bound | g = 2 unit loop | 1/12 − 1/39 = 3/52 > 0 | holds | none |
| §10.9 Hodge coefficient | g = 2 | (2g−1)(3g−1) = 15; 1 + 19.5·15 = 293.5 ≤ 300; 12/300 = 1/25 | holds | none |
| §10.9a modified-diagonal extension | smooth model; two components A, B meeting in one node | signs 1 − 1 − 0 − 1 + 1 + 0 + 0 = 0; closure meets {x}×A×A with multiplicity [k(x):k₀] ≠ 0; (p̄ − ē + A)·A = 1 − 1 = 0, ·B = −1 + 1 = 0 with A² = −1, A·B = 1 | holds | none |
| §10.10 place weights | ℚ(t), place t² + 1 of degree 2, unit type-0 node | φ_v = 1/12, contribution 1/6; the normalized analytic invariant is 1/6 already, double weighting 1/3 wrong; 𝔽₄: (1/12) log 4 | holds | none |
| §10.11 δ | g = 1 | φ term 0; rescaling the theta norm by e shifts δ by −24 | holds | none |
| §10.12 Noether | g = 2, [K:ℚ] = 1 | constant −8 log(2π); extension of degree 2 doubles all raw terms | holds | none |
| §10.13 Ξ_S | sign flip; g = 2 unit node; S = Spec ℚ | \|−s\| = \|s\|; δ + ε = 7/6; geometric image 0 while arithmetic value 7/6 | holds | none |
| §10.14 hybrid obstruction | \|t_i\| = e⁻ⁿ, n = 1, 2, 10; e^(−1/2) | a_i = 1, 1/2, 1/10 ≤ 1 with \|t_i\|^(a_i) = e⁻¹; a = 2 excluded; limit value 1/6 versus 0 | holds | none |
| §11.1 coercivity | a = 1/156 | 1/39 − 2a = 1/78 > 0, slope n/78 → ∞ | holds | none |
| §11.2 geometric bigness | Spec 𝔽₂, 𝔽₄/𝔽₂; curve base with λ = 1, g = 2 | P⁰ = 1, 2 > 0; deg P ≥ 1/25 | holds | none |
| §11.3 arithmetic bigness | g = 2, d = 1, [K:ℚ] = 2 | 8/(12g−4) = 2/5; raw bound 4c₀/5, normalized 2c₀/5 | holds | none |
| §11.4 bigness of w | g = 2, S = Spec 𝔽₄/𝔽₂ | a = 4g(g−1)(2g−2) = 16, P⁰ = 2, term 32, deg ω = 32/8 = 4 = 2·[F:k] | holds | none |
| §12.1 potential bigness | Y = S, e = 0; constant family with L = π^*M | m⊠L = mL, volume m^d L^d; every fibre top degree 0 | holds | none |
| §12.2 relative powers | Spec 𝔽₄/𝔽₂, ℙ¹, O(2), m = 1, 2; e = 1, m = 2 exponents | 4, 8 = aᵐ·2; (2,1),(1,2) give aM, (3,0),(0,3) give 0; d = 2, a = 2, M² = 3, m = 3: 2·3 = 6 | holds | none |
| §12.3 criterion | dim S = 0, a = 2, m = 1, 2 | full degrees 4, 16 (binomial 2 at m = 2, selected term 8); m = 0 excluded | holds | none |
| §12.4 grid bound | m = 1, 3 points; Z = Σ² with 3 points; mixed Z = ({p}×C)∪(C×{p})∪{(q,q)} | 3; √9 = 3; Σ = {p,q}: Σ² ⊂ Z, degree 1+1+1 = 3, d = 1: 2 ≤ 3, while d = 2 would give 2 ≤ √3 false | holds | none |
| §12.5 theta applications | g = 2; blow-up of a genus-2 Jacobian at a point | pairings 2P + ι^*Θ̄, 8w + π^*P, 16Θ̄ + 32π^*P; Θ² = 8 > 0 on the blow-up although Θ is not ample there | holds | none |
| §12.6 restriction | ℙ¹_ℤ at p = 2, 3; ℤ[x]/(x²−2) at 2 | O(1) of degree 1, O(c) shift 0; 𝔽₂[x]/(x²) non-integral, test Spec 𝔽₂ | holds | none |
| §13.1 function-field Faltings height | constant curve; degree 3 on a degree-2 semistable extension; g = 2 | 0; 3/2; bounds 3⁻¹⁶, 4⁻¹⁶ | holds | none |
| §13.2 global invariants | g = 2 unit node, degree 2 extension | (1, 1/6, 1/12) → (2, 1/3, 1/6) | holds | none |
| §13.3 Zhang's correction | g = 2, h = 1/10, δ = 1, ε = 1/6 | W_model = 1/5, W_a = 12/10 − 1 − 1/6 = 1/30 = (2/5)(1/12) | holds (hyperelliptic identity consistent) | none |
| §13.4 route (recomputed) | a = g − 1 on C²; W² = 8a², WD = 4a, D² = −2a | f^*Θ̄ = a(g+1)W − 2a²D − π^*P; N² = 8a²[(g+1)² − 2(g+1) − a] = 8g(g−1)³; M·N = 4a²[−(g+1) + a + 2] = 0; M² = −2a³; deĝ(M̄²N̄) = 2a³φ − (4a³ + 6a²)ω_a² = 2a³φ − 2a²(2g+1)ω_a² | holds | none |
| §13.4(3) constants | g = 2, 3, 4, ≥ 5, limit | 107.25, ≈96.9, 139, ≤ 109.625, 47 | holds | none |
| §13.5 | h = 1, δ = ε = 0; A = 139 | W = 12, 1/12 ≤ 12 ≤ 12; 12/139 > 1/12 since 144 > 139 | holds | none |
| §13.6 Wilms | g = 1, 2 | −2 log(2π⁴) ≈ −10.544 < −9; ≈ −21.088 | holds | none |
| §13.7 Bost constant | g = 1 | (log π)/2 ≈ 0.5724; −(1/2)log(2π²) ≈ −1.4913; min h_Fal ≈ −1.321 (parent §5.9: −1.3211 Faltings, −0.7488 Deligne) lies between −1.4913 and −0.919; h + c ≥ 1 | holds; source constant corrected as recorded | none |
| §13.8 coercive divisor | K₄ unit edges (g = 3), c(3) = 17/288; c = 1/25 | r_e = 1, μ density 1/6; (483/17)(17/48) − 6 − 11/6 = 107/48; D̃ − Δ = −181/48 < 0; D̃ − c(3)Δ = 15/8 > 0 (equality φ = c(3)δ attained); 3/(2c)+3 = 40.5 | holds | none |
| §13.8 de Jong check on K₄ | δ = 6, ε = 11/6, φ = 17/48, τ = 5/16 | δ + ε − 2φ = 171/24 = 7.125 = 9 − 30/16 | holds | none |
| §13.9 constants | g = 1 identity; g = 2, 3, 4 coefficients | 2 log(2π⁴) + 4 log(2π) = 6 log(2π²) ≈ 17.896; 109.75, ≈100.4, 142 < 144 | holds | none |
| §13.10 uniform comparison | h ≤ 1; h ≥ max(1, 24\|c₅\|); function fields | c′ retained; h/12 + c₅ ≥ h/24; c₃ = 4^(−4g²)/12, c₄ = 12 | holds | none |

Context and generality: the Lean file states nothing, so there is no `variable` block to audit; every README statement carries its hypotheses in the sentence (integrality of X in §5.1, normality of the base in §§3.2, 4.4, 8.x, genus bounds, the Moriwaki condition in §4.6, the discrete-or-trivial restriction in §10.3(3)). Vacuity: every target names the roadmap's objects; the only quantification over arbitrary data (§8.8's integrable M̄ and nef L̄ᵢ) is tied to the construction by the hypothesis M·L₁···Lₙ₋₁ = 0 and the Check with FS O(1) shows it is needed. Duplication at the pins: the three Tau Ceti `eulerDegree` names and the two Mathlib height declarations are consumed, not restated.

## Source spot checks

Read in the cached extractions, not taken from the reports: yuan-2026 Theorem 1.3 (p. 11–12), Theorem 1.4 with the normalization of [ω²] (pp. 14–15), Theorem 2.9 (p. 35), Theorem 2.10 (p. 37), Theorem 3.6 (p. 51), Theorem 4.1 (p. 60), Lemma 4.3 (p. 66), §4.4.1 (p. 78, the printed Bost constant −g log √(2π)), Theorem 4.14 (p. 92); zhang-2010 Theorem 1.3.1 (pp. 6–7, the (2/λ) spectral coefficient with (i/2)-normalized forms, which §10.3 restates as 1/(2λ) after the √2 rescaling); wilms-2017 Theorem 1.1 and Corollary 1.2 (p. 1); cinkir-2011 Theorem 2.9 (p. 5); de-jong-2018 Proposition 9.2 (p. 31, printed as (1/12)(δ + ε − 2φ) = δ/8 − τ/2, equivalent to the README's form). All agree with the README.


Pull request: #1833 (roadmap/arakelov-geometry-and-abelian-heights-part-ii at 12ef4f6)
