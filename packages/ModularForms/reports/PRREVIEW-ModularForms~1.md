# Review of ModularForms (pull request #1706 at faa2da4)
**Verdict:** needs changes

## R01 (P1) — The fixed-character oldspace includes the entire ambient space

**Location:** `TauCetiRoadmap/ModularForms/README.md:509–514`, the displayed sum indexed by `M ∣ N, cond χ ∣ M`.

**Claim:** This sum defines the oldspace, whose orthogonal complement is the newspace.

**Witness:** Take `N = 11`, `k = 2`, trivial character. The summand `M = N, d = 1` is all of `S₂(Γ₀(11))`. The formula gives new dimension `0`; the README's level-11 example gives `1`.

**Repair:** Require `M ≠ N` in the oldspace sum. Consume `TauCeti.cuspFormsOld`, whose definition already imposes that restriction, rather than reconstructing it. At level 11 the only proper-level source is `S₂(SL₂(ℤ)) = 0`, so the corrected oldspace is zero and the newspace has dimension one. Keep `M = N` in the separate decomposition into **new** spaces at all divisors in 10C; that formula has a different purpose.

## R02 (P1) — The coset-norm argument divides by two when there is no doubling

**Location:** `TauCetiRoadmap/ModularForms/README.md:362–366`: “When `−I ∈ Γ` or `k` is even … divide by `2`”.

**Claim:** The full-coset computation is twice the projective one under either condition.

**Witness:** For `Γ = SL₂(ℤ)` and `f = Δ`, both indices are `1`, the norm is `Δ`, and its cusp order is `1`. Dividing by two gives `1/2`, whereas `k/12 = 1`.

**Repair:** Use the factor `[±Γ : Γ]`, equal to `1` when `−I ∈ Γ` and `2` otherwise. Explain separately the representative-independence issue in odd weight. The repaired factor is one for Δ; for a subgroup excluding `−I`, the full index is twice the projective index. The final projective-index valence formula survives this correction.

## R03 (P1) — The proposed Stokes source target is false in weight two

**Location:** `TauCetiRoadmap/ModularForms/README.md:855–865,1568–1582`; `TauCetiRoadmap/ModularForms/Suggested.lean:65–68`, promising `interior_edges_cancel_sum`.

**Claim:** The named AINTLIB statement is an analytic gap to close in this roadmap.

**Witness:** At `k = 2`, `N = 11`, take `f = g = η²η(11z)² ≠ 0`. The source's left side is twice a positive Petersson integral; its right side is zero for every `P,c`.

The reason is checkable without a Stokes proof: `Sym⁰` has trivial action, and the proposed boundary is `(1 − γ)D` with `γ ∈ Γ₁(11)`. A weight-two period is Γ-invariant, so its value on that boundary is zero. The boundary being nonzero **before** coinvariants does not prevent its period from vanishing. See `aintlib` lines 2435–2446 and 2467–2473 for the boundary, and lines 2715–2727 for the statement, in `HeckeRIngs/GL2/ModularSymbols/PeterssonStokes.lean` at `112d12d95`.

**Repair:** Delete this source signature as a target. The period-injectivity route can consume the existing Eichler-integral result. If a period/Petersson comparison remains in scope, state the actual bilinear period pairing, retaining the second form and the paired-edge contributions, with its exact source and hypotheses. The corrected comparison must give a nonzero value on this diagonal example, rather than a single coinvariant-zero boundary period.

## R04 (P1) — The twist bound ignores an imprimitive character's zero extension

**Location:** `TauCetiRoadmap/ModularForms/README.md:994–1000`, the twist of a q-expansion by “a Dirichlet character `ψ`” and the conductor-only level bound.

**Claim:** The coefficientwise twist always has level dividing `lcm(N, cond(ψ)·cond(χψ), cond(ψ)²)`.

**Witness:** Twist Δ by the trivial character modulo 2. Its conductor is 1, but it vanishes on even integers. The twist has `(a₁,a₂) = (1,0)`; a normalized level-one weight-12 cusp form has `(1,−24)`.

**Repair:** Distinguish primitive-character twisting from twisting by the actual zero-extended character of a specified modulus. State the sharp conductor bound with the primitive-character hypothesis, and give the general imprimitive twist its depletion and modulus-sensitive level theorem. For this example, the primitive trivial twist is Δ; the modulo-2 twist is its 2-depletion, for which level 4 is available. Keep both cases in the general API.

## R05 (P1) — Fricke does not commute with Hecke for general nebentypus

**Location:** `TauCetiRoadmap/ModularForms/README.md:679–685`: “their relations with `Tₙ` (commute away from `Q`)”.

**Claim:** The unqualified commutation assertion applies before the subsequent restriction to trivial nebentypus.

**Witness:** For the weight-3 Eisenstein series with primitive quartic character modulo 5, choose `χ(2)=i`. Its `T₂` eigenvalue is `1+4i`; its Fricke companion's is `4−i`, not `1+4i`.

**Repair:** State the character-twisted relations, and reserve commutation for the appropriate trivial-character cases. At full Fricke level the pinned theorem is `W Tₙ f = χ(n) Tₙ W f`, so `i(4−i)=1+4i` verifies the repaired formula. `TauCeti/NumberTheory/ModularForms/Fricke/Hecke.lean:149–174` supplies both modular-form and cusp-form versions and the transported eigenvalue. State the corresponding partial-character relation for each exact divisor; do not extrapolate unqualified commutation from trivial character.

## R06 (P1) — The weight-60 quintic is not squarefree modulo 17

**Location:** `TauCetiRoadmap/ModularForms/README.md:1453–1458`, claiming factor degrees `2+1+1+1` modulo 17 and squarefree reductions at both certifying primes.

**Claim:** Modulo 17 the characteristic polynomial of `T₂` supplies an unramified transposition in its Galois group.

**Witness:** The quintic reduces to `X⁵+10X⁴+X³+4X+2 = (X−6)²(X−10)²(X−9)` over 𝔽₁₇. Its gcd with its derivative is `X²+X+9`, not 1.

**Repair:** Replace 17 by 37 for the transposition witness, keeping the mathematics as a small worked example and removing the checker target under R11. Modulo 37 the factorization is `(X−16)(X−22)(X−23)(X²+30X+34)`: its derivative gcd is 1, and the quadratic discriminant 24 is a nonsquare (`24¹⁸ = −1 mod 37`). Modulo 83 the quintic is squarefree and irreducible. Thus the repaired pair of primes proves the intended `S₅` conclusion.

The exact quintic was read at `leanbridge` lines 39–45 of `LeanBridge/LMFDB/ModularForms/LevelOne/Weight_60.lean`, and independently recomputed as the `T₂` characteristic polynomial on the basis `Δ E₄^a E₆^b`, for `(a,b)=(12,0),(9,2),(6,4),(3,6),(0,8)`, using coefficients through q¹⁰. Both computations gave the same six integer coefficients. This is a false mathematical Check in the README, not merely an unavailable citation.

## R07 (P2) — Entireness omits the cusp-form hypotheses

**Location:** `TauCetiRoadmap/ModularForms/README.md:740–750`.

**Claim:** Positive weight, arithmetic width-one carriers and the Fricke-companion equation imply an entire completed L-function.

**Witness:** `E₄` has positive weight, level one, width one and a Fricke companion. But `L(E₄,s)=240ζ(s)ζ(s−3)` has a pole at `s=4`; its completed function is not entire.

**Repair:** Explicitly quantify over cusp forms `f` and `g` (or their `CuspFormClass` instances), on both carriers. These are present in the cited source: `aintlib` lines 424–447, `Modularforms/LFunctionFEqN.lean`. Keep the modular-form meromorphic statement separate if wanted. Δ satisfies the repaired hypotheses; E₄ is correctly excluded. The pinned Mathlib distinction is visible in `Mathlib/NumberTheory/ModularForms/LFunction.lean:167–195`.

## R08 (P1) — The weight-one route lacks its rationality and bounded-denominator inputs

**Location:** `TauCetiRoadmap/ModularForms/README.md:919–931,1474`.

**Claim:** Layer 8W closes the weight-one lattice gap through Deligne–Serre Proposition 2.7, using Layers 2 and 4A.

**Witness:** `deligne-serre` lines 197–218 uses rational base change (2.6.1), obtained from an algebraic moduli stack, and bounded denominators. Remark 2.8, lines 221–224, invokes the Tate curve or Shimura plus multiplication by Δ.

**Repair:** Supply named targets or an exact earlier supplier contract for rational descent/base change and bounded denominators, including the analytic-to-arithmetic comparison the cited proof uses. Alternatively give a complete analytic route with those inputs owned and sourced. Merely naming integral q-expansions does not prove they span the complex space. Test the contract on a rational basis: after clearing denominators it must span `S₁` over ℂ, not just produce the zero lattice. No declared gap currently covers these inputs. This finding concerns the missing proof inputs, not the truth of Proposition 2.7.

## R09 (P1) — The module split still leaves a two-roadmap supply cycle

**Location:** `TauCetiRoadmap/ModularForms/README.md:41–60,260–267,1127–1132`.

**Claim:** A lower `JInputs` module and a higher dimension module make the cross-roadmap dependency acceptable.

**Witness:** ModularForms consumes FuchsianOrbifolds' compactification and level-one sphere theorem; main's `TauCetiRoadmap/FuchsianOrbifolds/README.md:84–88,344–365` consumes ModularForms' normalized j-function and exact elliptic orders.

**Repair:** Move ownership of the lower j-input block to the earlier Fuchsian development or another independent earlier owner, then cite it in ModularForms. Remove the reverse supplier edge; record the ownership move without replanning the existing supplier. The module graph can remain unchanged, but the roadmap graph must become `earlier owner → FuchsianOrbifolds → ModularForms`. The mechanical checker misses these prose/module edges; its zero-problem output below does not negate this explicit cycle.

## R10 (P2) — The build replans results already present at the pins

**Location:** `TauCetiRoadmap/ModularForms/README.md:12–19,225–250,1483–1493,1432–1435`; `TauCetiRoadmap/ModularForms/Suggested.lean:13–20`.

**Claim:** Major blocks require migration/new construction, and Mathlib has no modular-form L-function.

**Witness:** Mathlib's `ModularForm.L` is at `Mathlib/NumberTheory/ModularForms/LFunction.lean:134`. Tau Ceti already has bundled newforms, level-one valence and graded-ring generation, fixed-level strong multiplicity one, coefficient fields, Euler products and Fricke functional equations.

**Repair:** Replace those build targets with exact pinned supplier contracts, preserving only genuine extensions and explaining their difference. The declaration inventory below gives concrete replacements. In particular, do not reconstruct `Newform`, the weight-at-least-two coefficient-field theorem, or `ℂ[E₄,E₆]`; retain the genuinely stronger cross-level finite-exception theorem, the remaining general dimension/trace theory, and separately justified weight-one work. For Δ the native carrier already gives `a₁=1`, and the native field theorem applies with `12≥2`.

## R11 (P2) — Galois certificate checking is outside this roadmap and duplicates an owner

**Location:** `TauCetiRoadmap/ModularForms/README.md:1003–1013,1444–1458`.

**Claim:** This roadmap supplies a solvability decision procedure/certificate checker based on finite-field factorization and cycle types.

**Witness:** `Completed/PolynomialGaloisGroups/README.md:40–45,124–136` already assigns factorization-to-cycle-type input to Number Field Arithmetic §3.10 and owns its recognition consequences. A “certificate checker” remains a computational algorithm.

**Repair:** Remove the checker and executable/certification targets. Cite the existing mathematical factorization-type and group-recognition theorems by owner and section where needed; retain the coefficient-field interface and the small weight-60 mathematical illustration. For the quintic instance, factor degrees `(5)` and `(2,1,1,1)` still imply `S₅` through the existing prime-degree/transposition theorem; no new checker is needed here.

## R12 (P2) — The acceptance file omits statable headline theorems

**Location:** `TauCetiRoadmap/ModularForms/Suggested.lean:22–53,111–143`.

**Claim:** Five small dimension instances stand in for the roadmap's acceptance interfaces.

**Witness:** After building the missing native `Newforms.Newform` object, a scratch signature for cross-level strong multiplicity one elaborated with only a `sorry` warning, using `HeckeRing.GL2.Newform` and `UpperHalfPlane.qExpansion`.

**Repair:** State the remaining headline theorems that use native carriers, starting with the same-weight, arbitrary-level, finite-exception newform theorem at README:655–666. Include conductor/character transport explicitly in the final signature. State the weight-one coefficient-field target on the native carrier if retained. Cite already supplied headlines instead of restating them. Name every genuinely unstatable headline and its missing carrier in the module docstring; do not replace it with five numerical instances. The successful probe quantified over positive levels, two native newforms and a finite set of excluded primes, and concluded equal levels and equal underlying functions.

## R13 (P1) — The supplied push gate fails its build rule

**Location:** `TauCetiRoadmap/ModularForms/Suggested.lean:1–2` and the supplied gate result.

**Claim:** The file is ready for acceptance against the pins.

**Witness:** The recorded gate says `build=9 FAIL`: eight module-system warnings arise through the Fuchsian roadmap import, and one from this file's Mathlib import. These are warnings, not nine Lean type errors.

**Repair:** Remove the roadmap import (R14), use the supported `module` header with the permitted imports, and rerun the targeted build/gate until only admitted-theorem warnings remain. A scratch file with `module`, `import Mathlib`, and the actually used native Tau Ceti module elaborated with only its `sorry` warning. Direct elaboration of the original file also succeeded, but that does not make the supplied warning-sensitive gate pass. Severity follows the review brief's failed-build rule.

## R14 (P3) — Suggested.lean imports another roadmap

**Location:** `TauCetiRoadmap/ModularForms/Suggested.lean:2,89–99`.

**Claim:** Importing `TauCetiRoadmap.FuchsianOrbifolds.Suggested` is an acceptable source of acceptance-test carriers.

**Witness:** This is the gate's single `imports` failure. The eleven ensuing `#check` commands include roadmap-only declarations; the import is neither Mathlib nor an individual pinned `TauCeti.*` module.

**Repair:** Delete the roadmap import and its roadmap-only import checks. Use native modules only where genuinely needed by retained headline statements, and describe unavailable carriers in the module docstring. The five dimension types themselves elaborate without the Fuchsian import, as the scratch signature check confirmed.

## R15 (P3) — All five admitted examples are padding

**Location:** `TauCetiRoadmap/ModularForms/Suggested.lean:113,119,125,133,142`.

**Claim:** The five small dimension counts serve as the roadmap's acceptance test.

**Witness:** They reproduce the README's concrete checks: `1,2,0,2,2`, respectively. There is no named headline theorem in the file. They also account for all five `sorry-examples` gate failures.

**Repair:** Delete them from `Suggested.lean`; retain the five computations as README Checks. On scratch copies, a single `simp` made no progress on each, but they are still padding under the separate numerical-example/boundary-case rule. Do not repair this by proving them in place or renaming them as theorems.

## R16 (P3) — The gate rejects TeX syntax, partly inside fenced examples

**Location:** `TauCetiRoadmap/ModularForms/README.md:444,672–673,1202–1203,1212,1270`.

**Claim:** The formula presentation meets the text gate.

**Witness:** The gate records 19 `tex` hits at these six groups of locations. Several are in fenced code/text, despite the rule description exempting code blocks; that part is a scanner false positive.

**Repair:** Render these formulas in the requested Unicode/plain mathematical notation, including the fenced examples, so they also pass the actual scanner. For example write the recurrence with `aₚ`, powers in a single ASCII code span, and an explicitly indexed `a(p^r)`. Preserve the computed Δ check `252·(−24)=−6048` for coprime multiplicativity and `(-24)^2−2048=−1472` for the prime-power recurrence. No tooling edits are requested.

## R17 (P3) — The README contains pull-request identifiers

**Location:** `TauCetiRoadmap/ModularForms/README.md:429,1060,1065,1466,1487,1625`.

**Claim:** Supplier/provenance references can identify work by pull-request number.

**Witness:** These are the six `prnum` gate hits, including the automorphic-representations consumer and the Mathlib Sturm stack.

**Repair:** Replace them with roadmap names and sections or pinned declarations/files. For Sturm, use the actual pinned bounds listed below. Keep consumer direction explicit; a consumer's review is not a supplier contract. Remove the analogous process-number lists from the Lean docstring when revising it.

## R18 (P3) — Process narrative remains in the mathematical document

**Location:** `TauCetiRoadmap/ModularForms/README.md:1597–1599`, and the status/porting narrative at 1480–1498.

**Claim:** Audit and migration workflow belongs in the lasting roadmap.

**Witness:** Line 1599 triggers `residue=1` on “catalogue”; elsewhere the text includes dated status, “Decided (v1)” and instructions tied to a migration review.

**Repair:** Replace process prose with timeless scope and exact supplier contracts. Describe the mathematical difference of any retained extension, not whether an implementation is currently migrating. Keep external provenance locators only where they substantiate a mathematical target.

## R19 (P3) — Definitions lack the required Checks and claims lack exact contracts

**Location:** `TauCetiRoadmap/ModularForms/README.md:259–326,971–1040,1086–1136` and the overall heading structure.

**Claim:** The prose supplies the required definition/API/Checks and dependency structure.

**Witness:** There are no `**Checks.**` lists or `*Needs:*` lines. The character spaces, inner twist, Satake angle, trace form and cohomology constructions do not each have three discriminating Checks; exact supplier-contract sections are absent.

**Repair:** Use the required Summary, Scope/ownership, Conventions, Exact supplier contracts and layer headings. Give each definition its API and at least three computed/nonexample Checks, with dependencies per target and Examples/Dependencies per layer. Add theorem/section/page locators at claims, not just a bibliography. For example, the character-space Checks should distinguish zero, a parity-incompatible nonzero candidate, and the trivial-character/Γ₀ comparison; the twist Checks must include R04. Rhodes–Shemanske's comparison is in §3.1, Proposition 3.2, rather than the cited §2 (`rhodes-shemanske` lines 337–376). The cited arXiv title is *An elementary proof of the Eichler–Selberg trace formula*, not *A simple proof*. Separate source identifiers and version-specific locators from API names.

## R20 (P3) — The sampled downstream provenance points to a nonexistent directory

**Location:** `TauCetiRoadmap/ModularForms/README.md:1502–1515`.

**Claim:** LeanBridge's generated forms and `Weight_60.lean` reside under `LeanBridge/ForMathlib/QExpansion/LMFDB/`.

**Witness:** LeanBridge tree `f0afa3e2d05622ada4221ec267350fc54026c76d` has zero files at that path. It has 2,154 Lean files under `LeanBridge/LMFDB/ModularForms/LevelOne/`, covering 152 weights between 12 and 316.

**Repair:** Pin the repository revision and actual file/declaration. `leanbridge` lines 701–718 of `LeanBridge/LMFDB/ModularForms/LevelOne/Weight_60.lean` contain the named uniqueness theorem, with hypotheses on coefficients 0 through 5. Describe precisely that conditional uniqueness result; it does not itself prove irreducibility, the newform property or the Galois group. The corrected locator resolves and has the advertised finite-coefficient uniqueness proof. The branch-wide claims not inspected are listed under Not verifiable.

## Verified sound

The review covered both entire files, the PR diff, the supplied gate and citation leads, native declarations by object, the declared suppliers, the seeded provenance targets, and the mathematical layers. No PR/worktree file was changed. The outside-folder diff is empty and the worktree remained clean. The main content revision read was `fa41b374`; the pins are Mathlib `f6090c7095e1e56b3464c1daba5f24631f1290d2` and Tau Ceti `358314d4ab97483df4fc4cb8adcc02e74a8d9f5a`.

There are 20 findings: 9 P1, 4 P2 and 7 P3. The findings concern this folder only. It is a repairable revision of an existing roadmap, not a reason to reject the entire subject or re-plan its established ownership.

**Gate and Lean evidence.** The supplied gate has failures `tex=19`, `prnum=6`, `sorry-examples=5`, `residue=1`, `imports=1`, `build=9`; all other supplied counters are zero. Each failing rule is represented above. Direct `lake env lean` on the original file exited 0, printed eleven imported signature checks and five admitted-example warnings. A scratch copy assigned temporary names to the five examples and printed `#check @name` for all five: the resulting types are exactly the advertised `finrank` equalities, with no lost section assumptions. They contain no own definitions, instances or other named targets to inspect. Single-`simp` probes failed on all five; the padding decision instead follows their role as numerical Checks. The native Newform module was built with a targeted build because its object file was absent; that build succeeded. The separate native-carrier cross-level signature then elaborated successfully. These checks establish statement availability/elaboration, not mathematical truth.

**Dependency check output, rerun during this review:**

```text
depcheck: 205 roadmaps, 1524 edges, 0 problem(s)
```

No UPWARD/CYCLE line was printed. Every actual supplier mention was read; there are no literal `*Needs:*` lines. FuchsianOrbifolds Layers 0–6, ContourIntegration Layers 0–4, and the explicitly excluded JacobianChallenge Layer B were resolved against main. Fuchsian's supplied open head was also read for comparison; an update PR is not treated as a new dependency. The module/prose cycle is R09. No finding is based on absence from the merge order. There are no declared gap contracts to condition acceptance on.

Ownership searches used `roadmaps grep`/`show`, the supplied open-head context, main and package material, searching modular symbols, Hecke rings, Galois stability, Riemann–Roch and Galois cycle types rather than just proposed names. Three ownership resolutions matter: (1) Fuchsian owns quotient/local-degree/topological-genus theory; (2) `TauCetiRoadmap/ComplexCurveModuli/README.md:13–17,45–48` explicitly consumes ModularForms 10B's generic analytic RR/genus comparison, so that comparison remains owned here; (3) `Completed/PolynomialGaloisGroups/README.md:40–45,124–136` supplies the recognition ownership relevant to R11. The algebraic RR of JacobianChallenge is not confused with analytic RR. No proposed named declaration exists in Suggested.lean, so there is no own fully qualified name collision to report. The searches do not certify every unnamed construction in every unrelated open roadmap.

**Headline inventory.** The README aims at: nebentypus and cusp–Eisenstein decomposition; general valence and Sturm bounds; Hecke-ring structure including integral general-rank local polynomiality and localization; Petersson/old–new theory including bad-prime stability; the Main Lemma, primitive associates and bad-prime classification; fixed- and cross-level strong multiplicity one; Atkin–Lehner/Fricke transport and signs; Euler products, continuation, functional equations and analytic invariants; period injectivity/equivariance, integral Hecke algebra and number-field coefficients, separately at weight one; Galois conjugation/descent; twists and orbit-trace separation/completeness; analytic RR, duality, analytic/topological genus comparison and general dimension formulas; newspace dimension inversion; and the level-one Eichler–Selberg trace formula. The five Lean examples test none of these at their stated generality. Native supplied portions should be cited; genuine missing geometric carriers belong in the docstring; native remaining headlines belong in Lean (R12).

**Pinned declarations opened.** The following 24 entries identify concrete library evidence; multi-declaration entries share one file. Paths are relative to the relevant library root.

| # | File and line at the pin | Declaration / what was verified |
|---|---|---|
| 1 | `Mathlib/NumberTheory/ModularForms/Basic.lean:72,80` | `ModularForm`, `CuspForm`: slash invariance, holomorphy and boundedness/vanishing at every cusp; no finite-index/arithmetic hypothesis is built into these carriers. |
| 2 | `Mathlib/NumberTheory/ModularForms/LFunction.lean:91,134,175,195` | `ModularForm.Λ`, `ModularForm.L`, `CuspForm.differentiable_Λ`, `CuspForm.hasSum_L`; cusp and arithmetic hypotheses retained. |
| 3 | `Mathlib/NumberTheory/ModularForms/LevelOne/DimensionFormula.lean:250,307` | `ModularForm.dimension_level_one`, `ModularForm.sturm_bound_levelOne`. |
| 4 | `TauCeti/NumberTheory/ModularForms/LevelOne/ValenceFormula.lean:82,117` | `TauCeti.ModularForm.valence_formula`, `valence_formula_weighted`; nonzero form, elliptic orbit weights. |
| 5 | `TauCeti/NumberTheory/ModularForms/LevelOne/GradedRing.lean:314,736,746` | `evalE₄E₆_surjective`, `evalE₄E₆_injective`, `mvPolynomialEquivModularForms` in `TauCeti.ModularForm`. |
| 6 | `TauCeti/NumberTheory/ModularForms/SturmBound.lean:79,87,102` | General `sturm_bound_finiteIndex`, `sturm_bound_finiteIndex_SL2Z`, `eq_of_sturm_bound`; finite-index/period conditions are explicit. |
| 7 | `TauCeti/NumberTheory/ModularForms/Newforms/Basic.lean:105,150,242` | `cuspFormsOld`, its level-one vanishing and the full newspace at level one; proper-divisor restriction. |
| 8 | `TauCeti/NumberTheory/ModularForms/Newforms/Newform.lean:84,104` | `HeckeRing.GL2.EigenformAwayFromLevel`, `Newform`; nonzero, character membership, good-index eigenvalues, newness and `a₁=1`. |
| 9 | `TauCeti/NumberTheory/ModularForms/Newforms/Newform.lean:135–168` | `Newform.dirichletLift`, zero extension and good-index evaluation. |
| 10 | `TauCeti/NumberTheory/ModularForms/Newforms/Fields.lean:48,76,101,159` | `CoefficientField`, `CharacterField`, prime-value recovery and character-field inclusion. |
| 11 | `TauCeti/NumberTheory/ModularForms/Newforms/NumberField.lean:152,157` | `Newform.isIntegral_qExpansion_coeff`, `TauCeti.numberField_CoefficientField`, explicitly `2 ≤ k`. |
| 12 | `TauCeti/NumberTheory/ModularForms/Newforms/StrongMultiplicityOne.lean:120,133` | Fixed-level, fixed-character finite-exception equality, in eigenvalue and coefficient versions. |
| 13 | `TauCeti/NumberTheory/ModularForms/Newforms/StrongMultiplicityOne.lean:154` | `Newform.level_eq_of_dvd_of_forall_prime_eigenvalue_eq`; divisor-level/good-prime result, not the full new requested cross-level finite-exception signature. |
| 14 | `TauCeti/NumberTheory/ModularForms/Newforms/FullEigenform.lean:84,126,161` | Bad-prime eigenbehaviour, `Newform.toEigenform`, all-index classical Hecke eigenrelation. |
| 15 | `TauCeti/NumberTheory/ModularForms/Fricke/Hecke.lean:149,158,169` | Twisted Fricke–Hecke relation on forms and cusp forms, and eigenvalue transport by `χ(n)⁻¹`. |
| 16 | `TauCeti/NumberTheory/ModularForms/ModularSymbols/Period/Hecke.lean:70,102` | Period/correspondence equivariance and `periodMap_heckeTCuspNat`. |
| 17 | `TauCeti/NumberTheory/ModularForms/LFunction/FunctionalEquation.lean:180,234,324,342` | `CuspForm.frickeCompletedL`, differentiability and the two-form/Gamma1 functional equations. |
| 18 | `TauCeti/NumberTheory/ModularForms/LFunction/EulerProduct.lean:172,207` | `Newform.LSeries_eulerProduct_tprod`, `Newform.L_eulerProduct_tprod`, within convergence hypotheses. |
| 19 | `TauCeti/NumberTheory/ModularForms/Newforms/AnalyticInvariants.lean:65,80,125,141` | Nonzero continued L-function, analytic rank and conductor definitions. |
| 20 | `TauCeti/Analysis/Complex/RiemannSurface/LocalMultiplicity.lean:88,120,336,357` | Native local multiplicity, constant/identity/power-map tests; this alone is not genus Riemann–Hurwitz. |
| 21 | `TauCeti/Analysis/Complex/RiemannSurface/Degree.lean:120` | Native degree on the actual finite-map carrier. |
| 22 | `TauCeti/Analysis/Complex/RiemannSurface/Divisor.lean:69,157` | Native divisor pullback and degree-pullback formula. |
| 23 | `TauCeti/NumberTheory/HeckeRing/Basic.lean:636` | Double-coset covering identity; generic coset API is not missing merely because Mathlib's original definition file is small. |
| 24 | `TauCeti/NumberTheory/ModularForms/Newforms/Newform.lean:110–124,169–175` | Extensionality uses actual nonzero/normalization and character equations; old AINTLIB names are not the native API. |

The three resolver leads were inspected rather than mechanically reported as missing: the first two are names attributed to AINTLIB, requiring native replacements/contracts; `RiemannSurface.riemannHurwitz` really is a roadmap declaration supplied through Fuchsian, not a proved native theorem. R14 removes reliance on that roadmap import.

**Seeded source sample.** Legal source-service fetches were read at their locators. Software sources have declaration/file locators, not printed theorem pages. AINTLIB was read at `112d12d95`; LeanBridge at the full revision in R20. No source code was executed.

| Sample claim | Locator read | Result / limit |
|---|---|---|
| Status: general-rank polynomial ring has two gaps | `aintlib` lines 964–985, `HeckeRIngs/GLn/PolynomialRing.lean` | Two literal admissions, in generation and injectivity; `n≥1`, prime p; rank 1 and 2 branches have proofs. |
| Status: bad-prime newspace gap | `aintlib` lines 211–220, `Newforms/AdjointTheoryBadPrime.lean` | Named orthogonality statement is admitted in the source. Native full-eigenform work must now be consumed rather than blindly treating all of this as unfinished. |
| Status: Main Lemma | `aintlib` line 1596 onward, `Newforms/MainLemmaProof.lean` | Global theorem has a proof body; source claims of complete transitive axiom-freedom were not inferred from that fact. |
| Status: full eigenform upgrade | `aintlib` line 94 onward, `Newforms/FullEigenform.lean` | Upgrade uses bad-prime stability; a proof body alone does not close its admitted dependencies. |
| Status: fixed-space SMO | `aintlib` lines 1267–1274,1302–1309, `StrongMultiplicityOne/ConstantMultiple.lean` | Same level/character and finite-exception hypotheses present; not the claimed new cross-level theorem. |
| Status: coefficient-field weight split | `aintlib` lines 229–230, `Labels/HeckeFieldArithmetic.lean` | Weight-one lattice admitted; pinned Tau Ceti's number-field result explicitly assumes `2≤k`. |
| Status: Bol period injectivity | `aintlib` line 2241 onward, `ModularSymbols/EichlerInjective.lean` | `2≤k` retained; separate from the Stokes target. |
| Status: Stokes gap | `aintlib` lines 2435–2446,2715–2735, `ModularSymbols/PeterssonStokes.lean` | Actual signature fails the weight-two test, R03; it cannot be classified merely as unfinished. |
| Status: L-functions | `aintlib` lines 424–447, `Modularforms/LFunctionFEqN.lean` | Both cusp-form classes and both width-one assumptions present, R07. |
| Downstream generated files | `leanbridge` tree listing, line 5 | 0 old-directory files; 2,154 current-directory files; weights 12–316, R20. |
| Downstream weight-60 uniqueness | `leanbridge` lines 698–718, `LeanBridge/LMFDB/ModularForms/LevelOne/Weight_60.lean` | Coefficients `0,1,…,5` prescribed; conclusion identifies the explicit form. No source admission in that file; no whole-import axiom audit claimed. |
| Downstream Galois certification | `certifying` lines 5–18, repository README | Number-field certification project is described; the precise branch/bridge claim is not established by its README. |

Additional sources read: `deligne-serre` Proposition 2.7 and Remark 2.8, printed p.512, lines 197–224; `popa-zagier` arXiv:1711.00327v2, Theorem 1 and §2 Propositions 2–3/Corollary 1, lines 72–104,177–244; `hungerbuhler-wasem` arXiv:1808.00997v2, model sector p.4 lines 112–146 and Theorem 3.3 p.14 lines 552–565; `diamond-shurman-errata` pp.74–75 and p.90 corrections, lines 49–68; `rhodes-shemanske` §3.1 Proposition 3.2, lines 337–376; `stein` Proposition 6.1 p.93 lines 4021–4045, Proposition 6.4 p.95 lines 4074–4097, Proposition 6.6 p.96 lines 4139–4170; `lmfdb` label knowl lines 90–104. These provide text-level support where noted; the unavailable books are not silently certified.

**Adversarial calculations.** The following rows are tests of the written statements, not assertions that examples prove the general theorems. Orders, dimensions, coefficient recurrences and Hurwitz sums were computed explicitly; eta coefficients were independently expanded to q¹². “Retain” means the listed instance agrees, conditional on the stated construction/proof obligations. Arithmetic is over ℂ/ℚ as specified, so characteristic-p, zero-ring and inseparable tests are outside these signatures; level zero and Hecke index zero must remain excluded where indicated. The columns distinguish failed claims from valid claims with missing proof inputs.

| Statement | Instances tried | Values on the two sides / competing models | Result; change |
|---|---|---|---|
| Positive level / Hecke index conventions | N=0,1; n=0,1 | `NeZero 0` impossible; `NeZero 1` inhabited; T₁f=f, coefficient multiplier 1 | Retain positive domains; do not extend recurrences by junk index 0. |
| Character zero extension | trivial character mod 2, n=1,2 | χ(1)=1, χ(2)=0; unit homomorphism has no argument 2 | Retain separate unit and zero-extended interfaces. |
| Slash parity | level 1, k=3; χ₋₇, k=3 | 1≠−1 forces zero; χ₋₇(−1)=−1 matches (−1)³ | Retain; nonzero is essential. |
| Diamond operators | identity unit; zero form; inverse units | ⟨1⟩f=f; ⟨d⟩0=0; ⟨d⟩⟨d⁻¹⟩f=f | Retain automorphism law on units only. |
| Character eigenspaces | zero; parity-incompatible candidate; trivial χ | 0 lies in every space; nonzero odd level-one candidate fails; trivial χ fixes every Γ₀ lift | Retain; add discriminating Checks, R19. |
| Nebentypus transformation iff | γ∈Γ₁; γ lifting −1 | lower-right residue 1 gives f=f; −1 gives (−1)^k f=χ(−1)f | Both directions consistent with lift independence. |
| Character direct sum | N=1; zero space; two distinct characters | one summand=whole space; all dimensions0; distinct eigenspace intersection0 | Retain internal-sum statement. |
| Eisenstein parity and exceptional weight | E₄; E₂−2E₂(2z); t=1 | constant terms 1 and −1; t=1 correction is0 | Retain k=2 exception; specify complete weight domains/locators, R19. |
| Cusp–Eisenstein split | level1 k4; level11 k2 | dimensions 1=0+1; 2=1+1 | Retain; this requires spanning, not just defining a span. |
| j normalization | cusp, ρ, i | j=q⁻¹+744+…; j−1728=q⁻¹−984+…; zero orders3 and2 | Values agree; change ownership edge, R09. |
| Level-one valence | E₄,E₆,Δ | weighted orders 1/3=4/12, 1/2=6/12, 1=12/12 | Retain, cite native result. |
| Winding normalization | straight boundary point; two π/3 corners | π/(2π)=1/2; each (π/3)/(2π)=1/6, sum1/3 | Retain; simple poles of f′/f meet source hypothesis. |
| Coset norm weight and factor | Γ=SL₂,Δ; Γ excluding −I | weight12, order1 versus erroneous1/2; latter full index=2·projective index | Fails first case; R02. |
| Irregular cusp order and multiplication | leading q₂h and its square | orders1/2 and1; 1/2+1/2=1; integer-rounding model gives0+0≠1 | Retain corrected order convention. |
| Finite support / valence upper bound | Δ; zero form | Δ has one cusp zero, no interior zeros; zero has no finite zero divisor | Retain nonzero condition. |
| Sturm comparison | level1 k12 and k60 | B=1 and5; Δ has a₁=1 so is not a vanishing counterexample; equality uses coefficients0…B | Retain; consume native general bound. |
| Generic Hecke ring | trivial pair; subgroup1 in S₃ | first ring ℤ; second ℤ[S₃], (12)(23)≠(23)(12) | Commutativity must remain a special anti-involution result. |
| GL₁ local polynomiality | positive p-powers | [p^a][p^b]=[p^(a+b)]; generator powers indexed by ℕ | ℤ[T]; localization gives ℤ[T,T⁻¹]. |
| GLₙ rank boundary | n=0,1,2 in source | n0 excluded by NeZero; n1 one generator; n2 two generators | General-rank source has two gaps, not a proof at all ranks. |
| Integral leading coefficient | diagonal generator monomial | leading coefficient1 gives integral recovery; coefficient p at p2 would require1/2 | Retain explicit coefficient-one obligation. |
| Local-global lattice comparison | index-p sublattices of ℤ², p2,3 | counts p+1=3,4 match lines in 𝔽₂²,𝔽₃² | Retain structure-constant, not only basis, comparison. |
| Hecke degree / central coset | diag(1,p), pI | degrees p+1 and1; at p2 values3 and1 | Retain normalization. |
| Good-prime coefficient formula | Δ,p2,m1,2 | a₁(T₂Δ)=a₂=−24; a₂(T₂Δ)=a₄+2¹¹a₁=−1472+2048=576=(−24)² | Retain. |
| Division guard in coefficient formula | m1,p2; modular form with nonzero a₀ | guarded term0; unguarded natural division reads a₀ | Retain explicit divisibility guard. |
| Bad-prime Tₚ=Uₚ | level11 form, p11 | a₁(U₁₁f)=a₁₁=1; zero-extended χ(11)=0 | Retain; bad ring slot0 is not eigenvalue1. |
| Coprime Hecke recurrence | Δ,m2,n3 | a₆=−6048=(−24)·252 | Retain multiplicativity. |
| Prime-power recurrence | Δ,p2,r2 | a₄=−1472=576−2048 | Retain all-prime formula with zero extension. |
| Petersson positivity | f0; nonzero f11 | ⟨0,0⟩=0; ⟨f11,f11⟩>0 | Retain cusp decay at every cusp, not only infinity. |
| Twisted adjoint | χ(n)=1; χ(n)=i | adjoint factor1 versus −i; a nonreal eigenvalue need not equal its conjugate | Retain normality, not arbitrary self-adjointness. |
| Old/new spaces | N1,k12; N11,k2 | correct old0,new dimension1 in both; written fixed-character sum gives old=whole,new0 | R01; proper divisors required. |
| Degeneracy-map normalization | f11,V₂f11 at level22 | q,q² leading terms; first-two-coefficient matrix [[1,0],[−2,1]], determinant1 | Retain V_d f(z)=f(dz), independent images. |
| Good eigenform versus full eigenform | f11+cV₂f11 at level22 | a₁=1 for every c; common good eigenvalues; a₂=−2+c varies | Retain distinction; ambient level alone is not conductor. |
| Nonzero/normalization fields | zero cusp form; Δ | zero has a₁=0≠1; Δ has a₁=1 | Retain native nonzero and normalization fields. |
| Bad-prime classification, unramified χ | N11,k2,p11 | v=1,c=0; a₁₁=1, a₁₁²=1=11⁰ | Retain. |
| Bad-prime classification, ramified χ | η³η(7z)³,k3,p7 | v=c=1; a₇=−7; norm7=7^((3−1)/2), not √7 | Retain different exponent. |
| Bad-prime classification, higher exponent | c0,v2; c1,v2 | v≠max(1,c) in both; predicted aₚ=0, Euler linear coefficient0 | Correct branches; genuine global instances still need sourced Checks. |
| Main Lemma | level22,V₂f11; N1 zero | coefficients at indices coprime22 vanish; lower form is f11 at11; N1 hypothesis forces all positive coefficients0 | Retain; consume proved native/source portions. |
| Primitive-associate uniqueness | f11+cV₂f11 | primitive pair (11,f11) independent of c; ambient forms differ at a₂ by c | Retain uniqueness of pair, not of ambient form. |
| Fixed-level SMO | f11 and scalar2f11 | normalized first coefficients1 versus2; proportionality constant2; both normalized forces1 | Retain normalization/shared-character constraints. |
| Cross-level SMO negative control | f11 at11 versus its old lift at22 | same good a₃=−1,a₅=1; levels11≠22 | Newform/newform condition essential; native signature statable, R12. |
| Newform basis / multiplicity one | newspace dimension0,1,2 | basis sizes0,1,2; common eigenspace for an occurring system dimension1 | Retain; specify occurring/nonzero eigensystems. |
| Coefficient characterization iff | Δ; 2Δ | Δ a₁=1 and recurrence; 2Δ a₁=2, also a₂a₃=−24192 versus a₆=−12096 | Scaling rejected; normalized condition necessary. |
| Exact divisors | N12,Q3,4,6 | gcd(3,4)=1,gcd(4,3)=1,gcd(6,2)=2 | Q3,Q4 allowed; Q6 excluded. |
| Atkin–Lehner product law | N12,Q3,R4; Q=R=3 | product index12; repeated divisor index1 | Retain trivial-character law, action may have kernel. |
| Fricke square / signs | k12,Δ; k2,f11 | i¹²ε=1; i²(−1)=1 | Retain root-number convention; ε alone would give wrong sign at11. |
| General-character Fricke relation | χ mod5,χ2=i,E₃ | W T₂ coefficient1+4i; T₂W coefficient4−i; i(4−i)=1+4i | Unqualified commutation false; R05. |
| L-series convergence | Δ,k12; E₄,k4 | stated safe half-planes Re(s)>7 and>5; sharper Eisenstein threshold4 | Bounds consistent; no equality of bound and exact abscissa inferred. |
| Low-weight divisor estimate | n product of primes,σ₁(n) | σ₁(n)/n=∏(1+1/p), unbounded; σ₁(n)=O(n^(1+ε)) | Correct exclusion of O(n) at weight2. |
| Euler factor at good prime | Δ,p2 | denominator1+24X+2048X²; inverse coefficient X²=−1472 | Retain degree-two factor. |
| Euler factor at bad prime | f11,p11 | denominator1−X; inverse coefficients1,1,1; χ11=0 | Retain degeneration. |
| Completed FE diagonal | Δ; f11 | root number1 in both; Λ(k−s)=Λ(s) | Retain cusp-form statement. |
| Completed FE outside cusp forms | E₄ | L=240ζ(s)ζ(s−3), residue at4 equals240ζ(4)≠0 | Entireness false under written hypotheses; R07. |
| Analytic rank | even/odd FE; zero function | even sign permits orders0,2; odd sign forces odd order; zero has no finite analytic order | Require nonzero continued L; native definitions available. |
| Analytic conductor | central points f11,k2 and Δ,k12 | 11·4·5=220; 1·9·10=90 | Retain stated normalization; source formula itself uncertified. |
| Symbol orientation / degree-zero divisor | {0,∞}; reversal | divisor [∞]−[0], degree0; reversed integral=−original | Retain sign convention. |
| Symmetric-power weight | k2,3,1 | Sym⁰ rank1; Sym¹ rank2; Sym⁻¹ is not the intended object | Retain k≥2 period method. |
| Period equivariance / transposition | two endomorphisms A,B | (AB)*=B*A*; commuting A,B makes both products equal | Explicit commutativity input necessary for algebra transfer. |
| Eichler integral / Bol derivative | k2 and one term aq^m | E coefficient a/m; D E coefficient a; k3 coefficient a/m² recovers a after D² | Retain D=(2πi)⁻¹d/dz normalization. |
| Vanishing-period negative-weight argument | k2; k3; E constant1 | weights0 and−1; weight0 allows constant1; normalization at∞ kills it; D1=0 | Retain separate weight-two case. |
| Stokes signature | k2,f=g=f11 | left2I with I>0; right c·0=0 for all c,P | False; R03. |
| Integral-Hecke transfer direction | evalM kernel0, evalS quotient kernelI | 0⊆I yields source quotient A↠A/I; reverse inclusion would give wrong arrow | Retain quotient argument, not an isomorphism claim. |
| Finite integral algebra to coefficient field | rational f11; algebraℤ[√2] | K=ℚ, degree1; second example degree2 with roots integral | Retain integrality/finiteness deductions with finite-module hypothesis. |
| Weight-one lattice spanning | zero lattice versus a full rank-r lattice | 0⊗ℂ has dimension0; full lattice tensor dimensionr | Need actual spanning/descent contract, R08. |
| Character-field inclusion | Δ,p2; f11,p2 | (576−(−1472))/2048=1; (4−2)/2=1 | Retain formula; p^(k−1) nonzero for p>0. |
| Semisimple Hecke algebra and descent | ℚ(√2) acting on ℂ by one embedding | A⊗ℂ=ℂ×ℂ has dimension2; its given action on ℂ has dimension1 and misses one character | Finite semisimplicity alone does not prove occurrence; the stated rational-structure target needs an independent proof before this inference. |
| Galois orbit sizes | K=ℚ; K=ℚ(√2), character fieldℚ | absolute/relative sizes1/1 and2/2; two embeddings ±√2 | Consistent once Galois stability is proved, not from algebraicity alone. |
| Characteristic-polynomial norm | rational coefficient a=1; conjugates±√2 | X−1; (X−√2)(X+√2)=X²−2 | Retain norm-factor descent; one operator may repeat eigenvalues. |
| Satake pair | Δ,p2 | roots −12±4i√119, sum−24, product2048 | Retain unordered pair; swapping roots changes nothing. |
| Satake angle | Δ,p2; normalized real coefficient3 | cosθ=−3/(8√2)∈[−1,1]; 3/2>1 has no real angle | Explicit bound hypothesis essential. |
| Imprimitive twist | Δ,trivial ψ mod2 | conductor bound predicts1; a₂ changes−24→0 | R04; primitive associate and depleted twist are different forms. |
| Inner-twist identity | primitive trivial character; self-twist | aₙ·1=aₙ at all indices; imprimitive “1 mod2” changes a₂ | Define identity character/modulus precisely, R04. |
| Self-duality | rational eta coefficients; conjugate nonreal coefficient i | ā=a for rational coefficients; conjugation sends i→−i≠i | Retain literal contragredient convention. |
| Trace-form separation | orbit degrees1,2; two disjoint basis subsets | a₁ traces1 and2; difference coefficients in eigenbasis include1 and−1, hence nonzero | Separation proof sound after independence/stability; a₁ alone need not separate equal-degree orbits. |
| Sturm length for trace vectors | Γ₁(13),k2; Γ₀(11),k2 | full index168 gives B28; index12 gives B2 | Bounds sufficient (not necessarily sharp); constants0 permit vectors starting at1. |
| Orbit completeness | total dimension2, orbit dimensions1+1 or2 | both sum2; omitting a positive-degree orbit makes sum<2 | Retain finite distinct-orbit hypothesis. |
| Letter encoding | positions0,25,26 | a,z,ba | Matches stated positional code; not a deep Lean target. |
| Bad-prime set | N1,11,12 | ∅,{11},{2,3} | Retain; native level must be the primitive conductor. |
| Galois recognition illustration | irreducible quintic, factor types5 and2+1+1+1 | transitive degree5, a transposition, groupS₅ of order120 | Implication valid; original mod17 witness false, R06; remove algorithm R11. |
| Weight60 T₂ characteristic polynomial | basis ΔE₄^aE₆^b, 4a+6b=48 | coefficients in increasing degree: 263222216157060824115203098902237248565018624; 810634763334812972416233648439689216; −736010060393513697870348288; −2209450184054433792; 449691864; 1 | Independent q-expansion matrix calculation equals LeanBridge's displayed quintic. |
| Claimed modulo17 factorization | same quintic | (X−6)²(X−10)²(X−9); gcd(F,F′)=X²+X+9 has degree2, versus claimed degree0 | False squarefreeness and cycle type; R06. |
| Repaired modulo37 factorization | same quintic | (X−16)(X−22)(X−23)(X²+30X+34); gcd=1; discriminant24, 24¹⁸=36 | Squarefree type1+1+1+2; R06 repaired. |
| Claimed modulo83 irreducibility | F=X⁵+22X⁴+12X³+26X²+39X+15 | gcd(F,F′)=1; X^(83^5) mod F=X; gcd(F,X^83−X)=1 | Prime-degree irreducibility test passes. |
| Compact-curve H⁰ | sphere; two disconnected spheres | dimensions1 and2, respectively | Require connected compact Riemann surface in generic RR; disconnected version needs component count. |
| Divisor exact sequence | P¹,D=0,P=∞ | h⁰(O)=1,h⁰(O(P))=2, quotient dimension1,h¹=0 | Euler characteristic increment1. |
| RR Euler characteristic | P¹,D=0 and−2∞ | (h⁰,h¹)=(1,0),(0,1); χ=1,−1 equals degD+1 | Retain. |
| Serre duality / canonical degree | P¹ and genus-one curve | degK=−2,0; h⁰(K)=0,1 equals h¹(O)=0,1 | Retain compact/connected hypotheses. |
| High-degree H¹ vanishing | P¹,D=−∞; elliptic D=P | degrees−1>−2 and1>0; h¹=0 in both | Strict inequality correctly used; elliptic D0 has h¹=1. |
| Meromorphic-section staircase | P¹,O(−2), twists n=0,1,2 | h⁰=0,0,1; h¹=1,0,0 | One failure to rise consumes one h¹; construction works beyond divisor bundles only with its bundle finiteness input. |
| Finite-map genus comparison | z↦z²:P¹→P¹ | ramification degree2; −2=2·(−2)+2 | Analytic/topological formulas agree; generic meromorphic witness must be constructed from RR. |
| Modular-curve genus | Γ₀(1),(2),(11),(23),(37) | 0,0,1,2,2 from 1+d/12−e₂/4−e₃/3−c/2 | Retain projective index. |
| Γ₁ versus Γ₀ | N13 | Γ₁:1+84/12−12/2=2; Γ₀:1+14/12−2/4−2/3−2/2=0 | Retain distinct carriers. |
| Automorphy local descent | E₄ atρ; E₆ ati; irregular odd cusp | forced zeros1,1 and half-order1/2 give floor corrections; ignoring stabilizers loses1/3,1/2 | Require chart overlap laws; not a freely chosen divisor. |
| Even-weight M dimension | level1 k2,4,12,60 | 0,1,2,6 from printed formula | Retain. |
| Even-weight S dimension | level1 k4,12,60 | 0,1,5 from printed formula | Retain k≥4; k2 uses genus. |
| Weight0/negative-weight dimensions | connected quotient | M₀=1,S₀=0; k<0 both0 | Boundary facts stay README Checks. |
| Odd-weight dimension | Γ₁(4),k3: g0,e₃0,c_reg2,c_irr1 | M=−2+3+1=2; S=−2+1+1=0 | Half-integral terms combine to integers; no e₂ term. |
| Five Suggested dimension instances | Γ₀11,Γ₀23,Γ₀2,M₂Γ₀11,Γ₁13 | 1,2,0,2,2 agree with formulas | Mathematically consistent; padding R15. |
| β definition / inverse | p⁰,p¹,p²,p³ | β=1,−2,1,0; β*σ₀=1,2−2=0,3−4+1=0,4−6+2=0 | Retain β=μ*μ; p0 excluded. |
| Newspace dimension inversion | Γ₀11,23,22; Γ₁13 | 1,2,2−2·1−2·0+4·0=0,2 | Added identity agrees; correct oldspace R01 first. |
| Hurwitz weighted classes | D0,3,4,7,8,12,16 | −1/12,1/3,1/2,1,1,4/3,3/2 | Retain imprimitive classes and boundary representative convention. |
| Hurwitz forbidden discriminants | D1,2 | no integral positive-definite forms of discriminant−1,−2; H=0 | Retain congruence exclusion. |
| Weight polynomial recurrence | k2,3,4 | P₂=1,P₃=t,P₄=t²−n | Generating function agrees; no separate opaque polynomial family. |
| Repeated-root weight polynomial | k4,t2,n1 | recurrence gives3; boundary formula3·1²=3; naive quotient gives0/0 | Retain guarded quotient and recurrence definition. |
| Trace formula, identity operator | (k,n)=(4,1),(6,1),(12,1),(60,1) | elliptic sums−1,−1,−3,−11; divisor sum1; traces0,0,1,5 | Retain normalization and H0 term. |
| Trace formula, nontrivial operator | k12,n2 | elliptic sum46, divisor sum2; −46/2−2/2=−24=τ(2) | Retain. |
| Trace k2 exclusion | k2,n1 | uncorrected RHS−1 versus dimS₂=0; +σ₁(1)=+1 restores0 | Exclusion is necessary and explicit. |
| Period-polynomial quotient | w2 andw10 | dim(M₄⊕S₄)=1; dim(M₁₂⊕S₁₂)=3 | Consistent with W_w; whole-symbol injectivity alone does not prove odd-part injectivity. |
| Cusp-trace extraction | k12,n1,2 | trW=3,2001; σ₁₁=1,2049; (3−1)/2=1,(2001−2049)/2=−24 | Essential factor1/2 correct. |
| Eta quotient Δ | η²⁴ | a₁…a₄=1,−24,252,−1472 | Matches Hecke and trace checks. |
| Eta quotient at11 | η²η(11z)² | a₁…a₄=1,−2,−1,2; a₁₁=1 | Matches bad-prime example and oldspace counterexample. |
| Eta quotient at7 | η³η(7z)³ | a₁…a₄=1,−3,0,5; a₇=−7 | Matches parity and ramified coefficient norm. |
| Eta multiplier negative control | ηη11 versus ηη23 | q-exponents(1+11)/24=1/2 and(1+23)/24=1 | First not T-invariant with Dirichlet nebentypus; second begins q−q²−q³+…. |
| Level37 example limits | genus2, no lower cusp forms | new dimension2; two signs give possible traces−2,0,2 | Abstract data does not determine rationality or opposite signs. |
| Level60 graded ring / Sturm | weights4a+6b=60 | six monomials; dimM60=6,dimS60=5,B5; a₂(T₂f)…a₅(T₂f) need through a₁₀ | Native ring generation exists; computational claim separated. |
| Seeded weight60 theorem | coefficients0…5 | six hypotheses, highest index5; source a₄=α²−576460752303423488=α²−2⁵⁹ | Matches prime-square recurrence; theorem is conditional uniqueness. |
| Seeded source-gap count | named AINTLIB files | two general-rank admissions plus three specifically named legacy admissions inspected | No inference of global axiom-freedom; Stokes admission false, R03. |
| Seeded downstream location | pinned tree | claimed-directory count0 versus actual2154; range12…316 agrees | Locator repair R20; corpus-wide proof audit unverified. |

## Not verifiable

- The full texts of Diamond–Shurman, Miyake, Forster, Sturm's original paper, and Zagier's appendix/correction were not available through the legal source service. Publisher resolutions were recorded as uncertified where returned. Their exact printed theorem hypotheses/pages are not certified here. D–S's author-hosted errata, Stein's author-hosted book, and Popa–Zagier's arXiv version were read; these do not establish every book locator or every claim about the proof in Zagier's correction.
- Shimura's requested book search resolved to a JSTOR review rather than a legal copy of the book. The supplied book theorem numbers, including 3.20/3.35/3.48/3.51/3.52 and §8.2, remain unverified against that book. The review was not used as the text.
- Atkin–Lehner and Atkin–Li were requested by author/title through the source service without a readable legal text being returned. The sharp twist-level theorem and partial Atkin–Lehner source locators are not text-certified; R04 and R05 have independent explicit/native witnesses.
- Buzzard's paper was requested through the service; the attempted author-page PDF did not resolve. The historical priority/date and precise published weight-60 computation were not certified. The exact characteristic polynomial was independently recomputed and its reductions checked; the prime-degree group implication and the displayed native-form uniqueness signature were checked separately.
- Iwaniec–Kowalski (5.7) was not retrieved as a readable legal text. The roadmap's conductor formula was evaluated, but its match to that exact source equation is uncertified.
- The reference to the Ligozat/Newman criterion names no precise work/theorem/page. The two eta multiplier tests were computed directly; a complete criterion was not source-verified.
- The AINTLIB global claims “three gaps”, approximately 250 files, redundancy percentages and transitive axiom-cleanliness were not established by reading a selection of files. The named admissions and capstone signatures were inspected as listed; source comments and absence of a literal admission in one file are not whole-dependency proofs.
- LeanBridge's full 2,154-file corpus, its imported certificates and the stated `add-galois-certification` branch integration were not built/audited. The tree and weight-60 theorem were inspected. The source's conditional uniqueness theorem does not certify the arithmetic interpretation of its chosen root or all its imports.
- The LMFDB label knowl supports the field layout. The README gives no exact knowl for its complete lexicographic orbit-order convention; the separation theorem was checked mathematically, but identity with every detail of the live database ordering was not certified.
- General analytic RR/Serre duality and general-rank integral Hecke polynomiality were subjected to the displayed boundary tests and dependency audit, not proved by this review. Forster's source details and the unfinished general-rank steps remain subject to the stated limitations.

Missing legal references were collected in the job's reference-request record; resolved fetch failures were removed from that record. No unavailable source was guessed, no source manifest was edited, and this review is completed rather than parked.

## Source issues

- **Error** in aintlib at `HeckeRIngs/GL2/ModularSymbols/PeterssonStokes.lean`, `interior_edges_cancel_sum`, source lines 2715–2727 (source code, no printed page): the source says a symmetrized Petersson area equals a scalar times one paired-boundary period; it should be a genuine bilinear period pairing retaining the paired-edge data; affects a stated result.
- **Misprint** in rhodes-shemanske at §3.1, proof before Proposition 3.2, printed p.9, source lines 350–354: the source calls a map into a coset space a homomorphism with a kernel; it should be a quotient-set map with an identity-coset fibre; affects nothing.
