# Review of EllipticCurvePeriodsAndModularParametrizations (pull request #1715 at da30c25)

**Verdict:** needs changes

🤖 Independent AI review; this is not an approval.

## R01 (P1) — The Lean ideal divisibility is reversed

**Location:** `TauCetiRoadmap/EllipticCurvePeriodsAndModularParametrizations/Suggested.lean:435`.
**Claim:** `minimalDiscriminantIdeal (𝓞 K) W ∣ jDenominatorIdeal W`.
**Witness:** For the minimal equation `y²+y=x³`, `Δ=−27`, `j=0`, and the two ideals are `(27)` and `(1)`. The asserted divisibility is false. Mathlib's `Ideal.dvd_iff_le` reverses inclusion.
**Repair:** Reverse the divisibility and rename the theorem accordingly, including README §5.3. On this equation the repaired assertion is `(1) ∣ (27)`, true. Add this additive-reduction example; semistable examples make the ideals equal and cannot detect the reversal.

## R02 (P1) — Base change loses the original equation's differential defect

**Location:** `TauCetiRoadmap/EllipticCurvePeriodsAndModularParametrizations/README.md:559`.
**Claim:** The displayed base-change formula applies to the arbitrary equation used throughout §2.5, but its finite factor uses only the two minimal discriminant ideals.
**Witness:** Take the identity extension of ℚ and `W: y²=x³+16`. Its discriminant is `−2¹²·27`, minimal discriminant ideal `(27)`, and local period `Ω_min/2`. The claimed right side is `Ω_min/2`; the left side is `Ω_min`.
**Repair:** Replace the numerator `N(𝔇_E)^[L:K]` by `|N(Δ_W)|^[L:K]`, keeping the local periods of W. Equivalently multiply the original expression by its defect factor `(|NΔ_W|/N𝔇_E)^([L:K]/12)`. The identity-extension test then gives `2·Ω_min/2=Ω_min`. Do not restrict the theorem to globally minimal equations: those need not exist over K.

## R03 (P1) — Citations cannot replace the theory needed to prove the headline results

**Location:** `TauCetiRoadmap/EllipticCurvePeriodsAndModularParametrizations/README.md:1084`, `1107`, `1150`, `1366`.
**Claim:** The congruence theorem, the additional Manin-constant theorems, and Stevens' theorem are targets here while their proofs are excluded, with “certificate-style proofs by citation”.
**Witness:** Lines 1366–1369 explicitly exclude the integral-model and Hecke-module proofs while retaining the conclusions as Layer 4 theorems. No declared supplier gap supplies those proofs. A bibliographic citation is not a Lean theorem or a supplier contract.
**Repair:** Give these results complete proof routes using owned intermediate targets and exact earlier supplier sections, including the integral theory at 2 and 3. Import the portions already owned by GrossZagierAndArithmeticHeights §§3.7–3.8. Own or explicitly contract the remaining inputs; remove the exclusion of their proofs. For the semistable Manin theorem, the repaired dependency chain must cover p=2, not just the odd-prime result.

## R04 (P1) — The integral modular-symbol comparison retains elliptic-point torsion

**Location:** `TauCetiRoadmap/EllipticCurvePeriodsAndModularParametrizations/README.md:845`.
**Claim:** The raw integral symbol module and its cuspidal kernel identify with integral homology for Γ₀(N), including elliptic points.
**Witness:** At N=37 the integral Manin presentation has rational rank 5, but dimensions 6 modulo 2 and 6 modulo 3. Relative surface homology has rank 5 and is torsion-free. Cremona Theorem 2.1.4 only asserts a rational comparison (cremona line 389).
**Repair:** State the comparison for the appropriate torsion-free quotient, specify the map from the native integral symbol module, and prove that its period image is the desired lattice. Retain all levels and primes. On N=37, killing the elliptic-point torsion leaves rank 5 relative homology and rank 4 cuspidal homology. A rational comparison alone does not certify an equality of integral period lattices.

The witness uses generators indexed by P¹(𝔽₃₇), relations `e_x+e_Sx` and `e_x+e_Ux+e_U²x`, with `S(a,b)=(b,−a)` and `U(a,b)=(b,−a−b)`. Their ranks over ℚ, 𝔽₂, 𝔽₃ are respectively 33, 32, 32. The boundary group is free, so the torsion also lies in the cuspidal kernel. This identifies the obstruction without assuming a BSD or modularity conjecture.

## R05 (P1) — A required period-theory supplier does not exist under the cited name

**Location:** `TauCetiRoadmap/EllipticCurvePeriodsAndModularParametrizations/README.md:141`, `410`, `433`, `460`, `1252`.
**Claim:** GrothendieckPeriodConjecture Layers 0–2 supply scaling, lattice invariance, and the Eisenstein dictionary.
**Witness:** The main tree and indexed open roadmap heads contain no roadmap named GrothendieckPeriodConjecture. The resolver also reports its Layer 0 citation as missing. The relevant identities are not supplied by that name at all.
**Repair:** Resolve each identity to an actual earlier owner, by section and exact statement. If no allowed earlier supplier supplies it, move that target here and update the scope and dependencies. Do not silently depend on a renamed or later roadmap. Re-run the order check after repairing the names; a mechanically clean graph does not resolve a nonexistent vertex.

## R06 (P1) — The arbitrary-equation height proof takes an undefined quotient

**Location:** `TauCetiRoadmap/EllipticCurvePeriodsAndModularParametrizations/README.md:1244`.
**Claim:** For every equation, its differential defect is an integral ideal 𝔲 and `log #(ω̄/O_Kω_W)=−log N𝔲`.
**Witness:** For `y²=x³+16`, `ω̄=2ℤω_W`. Thus the written quotient is `2ℤ/ℤ`, which is not defined, and its proposed log-cardinality is `−log 2<0`. Scaling the equation oppositely gives the fractional ideal `(1/2)`.
**Repair:** Use the fractional ideal describing the Hodge lattice and its Arakelov degree, or first choose `a` with `aω_W∈ω̄` and account for the archimedean scaling. In this example choose a=2: the finite index is 1, and `‖2ω_W‖²=4‖ω_W‖²`, recovering `−log 2−½log(covol Λ_W)`. Keep the final formula, whose two terms cancel correctly; replace the invalid proof step.

## R07 (P1) — The uniqueness argument swaps the two CM exponents

**Location:** `TauCetiRoadmap/EllipticCurvePeriodsAndModularParametrizations/README.md:407`.
**Claim:** Equality of invariants implies `u⁴=1` when g₃ is nonzero and `u⁶=1` when g₂ is nonzero.
**Witness:** For a square lattice, g₂≠0 and g₃=0; its automorphism u=i has u⁶=−1. For a hexagonal lattice, g₂=0 and g₃≠0; u=ζ₆ has u⁴=ζ₃²≠1.
**Repair:** Exchange the two conditions: g₂≠0 forces u⁴=1, and g₃≠0 forces u⁶=1. Both CM controls then pass. Supply the lattice automorphism justification at that generality, rather than assuming an arbitrary square or hexagonal lattice has already been normalized to a particular scale.

## R08 (P1) — The optimality equivalence is vacuous for non-optimal curves

**Location:** `TauCetiRoadmap/EllipticCurvePeriodsAndModularParametrizations/README.md:888`.
**Claim:** Optimality is equivalent to homology surjectivity “for any (equivalently every)” parametrization built from a degree-one quotient isogeny.
**Witness:** For 11a3 the least quotient-isogeny degree from 11a1 is 5. There are no degree-one choices. The universal assertion is therefore true, while 11a3 is not X₀(11)-optimal.
**Repair:** Use existence of a quotient isogeny whose associated homology map is surjective, or characterize a specified arbitrary quotient isogeny by surjectivity iff its degree is 1. Do not assume degree 1 inside the universally quantified criterion. The repaired existential is false for 11a3 and true for 11a1.

## R09 (P1) — Fixed differential signs do not make every isogeny multiplier positive

**Location:** `TauCetiRoadmap/EllipticCurvePeriodsAndModularParametrizations/README.md:298`.
**Claim:** The signed scalar is positive after fixing Néron differentials, and an isogeny is étale iff that scalar is 1.
**Witness:** The self-isogeny [−1] pulls any fixed nonzero differential back to its negative. Its scalar is −1, degree 1, and its Néron-model extension is an isomorphism, hence étale. Tau Ceti proves this pullback identity at the pin.
**Repair:** Distinguish the signed scalar from its positive absolute value, as §2.7 already attempts. Use `|α|=1` for étaleness and `log |α|` in the signed height formula. Also replace “depends on ψ only through the curves” at line 613 by invariance under compatible changes of equations: [1] and [2] on the same curve have absolute multipliers 1 and 2. The corrected conventions give multipliers 1, 1, 2 for [1], [−1], [2].

## R10 (P1) — The supplied build-gate result rejected the module-system warning

**Location:** `TauCetiRoadmap/EllipticCurvePeriodsAndModularParametrizations/Suggested.lean:1`.
**Claim:** The supplied head passes the required warning policy.
**Witness:** The worker's recorded gate has `build=1 FAIL`, solely because Mathlib's module-system import warning asks for a leading `module`. Independent direct elaboration succeeds; a later full gate rerun returns OK. This is not an elaboration error.
**Repair:** Add `module` before the imports and verify the targeted build without the warning. A scratch copy with that exact header elaborated successfully. Severity follows this review brief's classification of a recorded build-gate failure; the later passing rerun is recorded below, not suppressed.

## R11 (P2) — Elliptic coefficient summability already has an earlier owner

**Location:** `TauCetiRoadmap/EllipticCurvePeriodsAndModularParametrizations/README.md:649`; `TauCetiRoadmap/EllipticCurvePeriodsAndModularParametrizations/Suggested.lean:253`.
**Claim:** This roadmap owns the number-field coefficient bound and absolute convergence theorem.
**Witness:** EllipticCurveModularity R29.6, “Elliptic coefficient summability”, explicitly states `LSeriesSummable (fun n => (W.LFunction n : ℂ)) s` for every number field and Re s>3/2, including the same ideal coefficients and bad primes (README lines 1860–1923).
**Repair:** Delete the duplicate acceptance theorem and proof-planning block; import that named subsection in the supplier contracts. Its norm-fibre majorant also avoids attributing a pointwise `O(n^ε)` estimate to ArithmeticDirichletSeries Layer 5's cumulative ideal-count bound. Test the import on its splitting example: over ℚ(√17), the norm-4 coefficient of 11a1 is 8, rather than the rational coefficient 2.

## R12 (P2) — The omitted isogeny–lattice headline is statable at the pins

**Location:** `TauCetiRoadmap/EllipticCurvePeriodsAndModularParametrizations/Suggested.lean:15`; README §2.7.
**Claim:** The isogeny multiplier/lattice comparison must remain README-only.
**Witness:** A scratch signature using native `TauCeti.Isogeny`, `pullbackDifferential`, `Affine.invariantDifferential`, `Isogeny.degree`, and the file's `scaleLattice` and `periodLattice` elaborates, with an explicit nonzero scalar and differential-pullback equality.
**Repair:** Include the headline inclusion and index theorem on those carriers. State the general subfield version with its embedding, or a general characteristic-zero field with a specified complex embedding. The complex specialization already elaborates without an invented carrier. On [2], the resulting theorem says `[Λ:2Λ]=4`; on [−1], it says `[Λ:−Λ]=1`. These are actual isogeny assertions, not free scalar identities.

## R13 (P2) — Rationality of the analytic Sha order needs the rank-zero theorem

**Location:** `TauCetiRoadmap/EllipticCurvePeriodsAndModularParametrizations/README.md:1195`.
**Claim:** Rationality of L(E,1)/Ω implies rationality of the analytic Sha order because all remaining factors are rational.
**Witness:** The remaining denominator contains the Mordell–Weil regulator, a determinant of real heights. The given hypothesis is analytic rank zero. Only after proving Mordell–Weil rank zero may the pinned rank-zero regulator theorem replace it by 1.
**Repair:** Import the forward analytic-rank-zero theorem from its earlier owner with its exact hypotheses, then apply `regulator_eq_one_of_finrank_eq_zero`. Alternatively state this corollary with explicit Mordell–Weil rank zero and leave the unconditional forward implication to its owner. Remove the contradictory exclusion of the input if consumed. For 11a1, Reg=1 then gives `(1/5)·25/5=1` exactly. The modular-symbol rationality theorem itself does not need this repair.

## R14 (P2) — Formula-defined heights do not test the promised Faltings-height comparisons

**Location:** `TauCetiRoadmap/EllipticCurvePeriodsAndModularParametrizations/Suggested.lean:397`, `417`, `438`; README §§5.1–5.3.
**Claim:** These signatures test the identification with relative and stable Faltings heights.
**Witness:** The two “height” objects are defined to be the right-hand formulas. No signature mentions the Arakelov Hodge-line height, and the promised `faltingsHeightLattice_eq` and `stableFaltingsHeightLattice_eq` are absent. `AbelianVariety.faltingsHeight` is absent at both pins.
**Repair:** Name those comparison headlines and the missing Arakelov carriers explicitly in the module docstring. Do not present formula identities as substitutes for them. Remove the formula-defined height acceptance block and its dependent height-only targets; retain genuine lattice assertions, including Stevens' existence and the Faltings-ratio index. When the native height carriers exist, state the actual comparisons. The nonminimal 27a3 example must then test the native height against the expression, rather than merely simplifying its definition.

## R15 (P3) — Delete one-tactic and definition-unfolding padding

**Location:** `TauCetiRoadmap/EllipticCurvePeriodsAndModularParametrizations/Suggested.lean:61`, `231`, `430`, `478`.
**Claim:** These declarations belong among the acceptance headlines.
**Witness:** `neronLattice_smul` closes with `simp [neronLattice]`; `jDenominatorIdeal_smul` with `simp [jDenominatorIdeal, WeierstrassCurve.variableChange_j]`; the covolume-ratio theorem is exactly the symmetric pinned lattice-index lemma. `mem_scaleLattice` already proves an unfolding Check.
**Repair:** Delete them from `Suggested.lean`; keep their mathematical statements in the README. A scratch copy replacing the three `sorry`s by these proofs elaborated successfully. Also delete the isolated `WeakBSD` definition: it is not needed to state any retained headline. Do not replace these declarations by in-place completed proofs.

## R16 (P3) — Source locators and the source register are incomplete

**Location:** `TauCetiRoadmap/EllipticCurvePeriodsAndModularParametrizations/README.md:1551`, and §§1.1, 1.5, 2.7, 4.10, 5.2.
**Claim:** Each target has an exact, versioned locator into a registered legal source.
**Witness:** No `sources.toml` exists in the folder. Several targets have only supplier references or chapter ranges. The fetched ARS congruence preprint numbers the main theorem 2.2, whereas the README cites published 2.1; the fetched Vatsal text has different pagination.
**Repair:** Add one source-register entry per work, recording legal location and version, and exact theorem/section plus page for each target. Preserve the published and preprint locators in one entry when both are used. Cite the actual checked Cremona Proposition 2.15.1, p.48, for the degree formula. Record unreadable editions as uncertified rather than implying they were checked. No source text belongs in the repository.

## R17 (P3) — Restore the required roadmap shape and definition Checks

**Location:** `TauCetiRoadmap/EllipticCurvePeriodsAndModularParametrizations/README.md:1`, `309`, `382`, `493`, `642`, `825`, `1211`.
**Claim:** The document supplies the required per-definition API, at least three discriminating Checks, and per-layer dependency structure.
**Witness:** There is no opening Summary label, Exact supplier contracts, or How to read the build section; none of the five layers ends with Examples and Dependencies. The period-lattice and continuation definitions lack their own three-item Checks lists.
**Repair:** Reorganize into the prescribed headings, use per-target `*Needs:*` lines, and attach at least three discriminating Checks to every definition. Existing global worked examples can be linked from the relevant Checks. Keep own API names backticked only when declared in `Suggested.lean`; e.g. `newformPeriodLattice_eq_image_periodMap` and `IsContinuation.halfPlane` are currently named without declarations. Add the negative controls from R01–R09 rather than only successful database examples.

## R18 (P3) — Repair stale supplier locators and invented declaration aliases

**Location:** `TauCetiRoadmap/EllipticCurvePeriodsAndModularParametrizations/README.md:146`, `172`, `438`.
**Claim:** The named supplier declarations and §3.12 resolve as written.
**Witness:** GrossZagierAndArithmeticHeights has the Petersson identity in §3.9 but no §3.12 at its supplied head. The pinned scaling declaration is `WeierstrassCurve.variableChange_c₄`, not `c₄_smul`. EllipticCurveModularity R29.5 specifies its objects in prose, without the asserted named declarations.
**Repair:** Cite GrossZagierAndArithmeticHeights §3.9; use the actual pinned scaling names; cite the existing R29.3/R29.5 subsections and their mathematical contracts instead of claiming nonexistent declarations such as `newformOf` or `QuotientIsogeny`. These are locator/name repairs where the mathematical supplier content does exist, distinct from the absent supplier in R05.

## Verified sound

The review read all 38 numbered subsections and the complete Lean file. It checked all 15 seeded source targets below, all 68 actual named Lean declarations through a clean `#check @name` probe, all 49 admitted theorem bodies with the requested one-tactic probe, and the five anonymous instances by reading their real proofs. The worker's signature extractor counted comment words as declarations; its two extraction errors are not target-file errors. The five suspected dropped binders were compared with the actual signatures: the generic continuation, rank, coefficient and component-count definitions need not require ellipticity, and the ideal definition can be more general than a number field. Theorems needing ellipticity retain it; `normalisedRegulator` retains its finite-module binder. No new dropped-hypothesis defect was established.

The pins read were Mathlib `f6090c7095e1e56b3464c1daba5f24631f1290d2` and Tau Ceti `358314d4ab97483df4fc4cb8adcc02e74a8d9f5a`. Original direct elaboration, the clean signature probe, the three successful padding replacements, the header experiment, and the native isogeny-signature experiment all completed. The all-theorem padding probe failed on the other attempted tactics; that is not evidence that those theorems are false. No `set_option`, sorry-defined data, admitted example, extraneous import, or change outside the roadmap folder was found. No copied source passage was established. The proposed library is a distinct period/invariant bridge; the duplicate convergence block is repairable and does not justify rejecting the entire scope.

The supplied gate recorded one build-policy failure as described in R10; every text/dependency counter was zero. A fresh invocation of the full gate later returned:

```text
gate EllipticCurvePeriodsAndModularParametrizations: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
```

The separately requested dependency command returned:

```text
depcheck: 204 roadmaps, 1526 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. Every `Rests on` line and the supplier lists were read. This mechanical result does not cure R03 or R05. No merge-order file was changed.

The headline inventory is: normalized lattice existence/uniqueness and its differential comparison; real shape; local/global period invariance and base change; isogeny lattice inclusion/index; convergence, nonvanishing and compatible continuation; finite real leading term and its independence; BSD-factor comparison; optimal quotient and newform lattice comparison; Manin-constant and modular-degree/Petersson/congruence results; Stevens' minimal curve and the stated partial conjecture results; rationality of L(E,1)/Ω; relative/stable Faltings-height comparisons, isogeny change, minimal height and Faltings ratio. The Lean file represents several native lattice/analytic headlines but misses the statable isogeny comparison (R12) and substitutes formula heights for the missing Arakelov comparison (R14). For modular quotients, Néron-model pullback ideals, the BSD arithmetic factors and Arakelov heights, the docstring needs specific missing carriers, not merely a list of README topics. Manin's and Stevens' conjectures must remain propositions, never admitted theorems asserting them.

### Seeded source sample

Locators below distinguish text actually read from an unavailable published edition. Source line numbers refer to the service's numbered extractions. A derived formula is identified as a derivation, not attributed to a nonexistent source theorem.

| Target | Text and locator examined | Result |
|---|---|---|
| 1.1 | Cremona §2.14, printed p.45, plus the cited Silverman VI.5.1 | Cremona supports c₄=12g₂ and c₆=216g₃. Silverman text unavailable; the existence/uniqueness source certification is partial. The CM proof step fails R07. |
| 1.5 | Pinned lattice sums and the cited supplier contracts | Conjugating coefficients and summands gives the stated membership equivalence and equal covolumes. The named Grothendieck supplier cannot be resolved; no independent exact textbook locator is given. |
| 2.5 | ec.period lines 90–114 | Lines 110–114 support the arbitrary-equation discriminant prefactor. They do not support the erroneous base-change formula. R02 is witnessed by the roadmap's own 27a3 equation. |
| 2.6 | ec.q.period_lattice lines 90–100; ec.q.real_period lines 90–92 | Supports lattice shape, Néron normalization, and component factor. The reduced-model implementation is a bridge to the pinned Tau Ceti model. |
| 2.7 | Vatsal preprint p.4, lines 118–130; ModularCurvesPartII §1.3 | Nonzero integral differential scalar and étaleness up to sign are supported. General complex isogeny/index comparison is the supplier's content. The fixed-positive-sign convention fails R09. Silverman and BLR editions remain uncertified. |
| 3.6 | ec.analytic_sha_order lines 96–105; ec.regulator lines 98–104 | All factors agree: √|D_K|, torsion squared, unnormalized regulator, global period, Tamagawa product. No integrality follows from this definition. |
| 4.1 | Cremona Theorem 2.1.4, printed p.13, lines 375–390; §2.15.1, p.47, lines 2508 onward | The rational comparison and integration lattice are supported; the claimed raw integral comparison is not (R04). |
| 4.4 | ARS, The Manin constant, §2, printed pp.618–619, lines 52–84; Cremona §2.8, p.30 | Rational pullback scalar and optimal-curve convention supported. Lattice equality requires integral homology surjectivity. The LMFDB knowl itself returned a CAPTCHA. |
| 4.6 | Cremona §2.15.1 and Proposition 2.15.1, pp.47–48, lines 2508–2565 | Degree of the parametrization and its volume identity supported. Minimal degree for a nonoptimal target additionally uses the Hom/isogeny argument, not the proposition alone. |
| 4.7 | Cremona Proposition 2.15.1, p.48, lines 2561–2565; Zagier §1, p.374 | `4π²‖f‖²=deg(φ)·area` for the lattice model; scaling the target differential contributes c². This is the claimed covolume formula. |
| 4.10 | Vatsal preprint Theorem 1.3, p.5, lines 151–159; Conjecture 1.9 and Theorems 1.10–1.11, pp.6–7 | Minimal lattice/étale quotient/minimal height equivalence and the two partial results match, including odd ℓ in 1.10 and ordinary reducible ℓ≥7 in 1.11. Stevens' primary proof and published pagination are not certified. |
| 5.2 | Faltings §3; ArakelovGeometryAndAbelianHeights §§2.9, 3.1 | Height normalization and model-defect route checked. The target's formula passes scaling, but its finite quotient calculation fails R06. Faltings does not state this arbitrary-equation expression as a numbered theorem. |
| 5.4 | Faltings Lemma 5, printed p.358, lines 342–370; page image inspected | Signs and degree factor agree. The source's preceding hypotheses on p.357 are semiabelian models with proper generic fibres; the general elliptic statement here needs its own stated lattice proof, not removal of those source hypotheses. |
| 5.5 | Vatsal Theorem 1.3, preprint p.5; Mathlib covolume/index theorem | Minimality equivalence is supported; the exponential ratio follows by taking logarithms of the area ratio. Vatsal's displayed height normalization has a source error listed below. |
| 5.6 | Derivation from 4.7 and 5.1, with Cremona Proposition 2.15.1, p.48 | `½log m−log(2πc‖f‖)` has the right signs and factors. It requires positive m,c,‖f‖, supplied for a nonzero normalized newform and nonconstant map. |

### Pinned ownership and supplier resolution

The object search used `roadmaps grep` and `roadmaps show`, the main active/completed trees, the board package files, and the supplied sibling heads. It found no second owner of the equation-normalized period lattice, Stevens descriptor or Faltings-ratio index under this roadmap's namespace; the only namespace match outside the worktree was the same PR's snapshot. Generic complex lattices, uniformization, modular parametrizations, Hodge metrics and generic regulators already have owners and must remain imports. The important duplicate is R11.

| Pinned file and line | Declaration/object opened; implication |
|---|---|
| `.lake/packages/mathlib/Mathlib/Analysis/SpecialFunctions/Elliptic/Weierstrass.lean:59` | `PeriodPair` has real linear independence of two complex periods. It excludes rank-zero/rank-one period pairs; it does not itself attach a lattice to an equation. |
| Same file, lines 78, 148, 956, 959 | `lattice`, `latticeBasis`, `g₂=60G₄`, `g₃=140G₆`. These fix the lattice and Eisenstein constants. |
| `.lake/packages/mathlib/Mathlib/Algebra/Module/ZLattice/Covolume.lean:98` | `covolume_pos`; requires a genuine full discrete lattice and Haar measure, not an arbitrary subgroup. |
| Same file, lines 126, 170 | Determinant area and `covolume_div_covolume_eq_relIndex'`; requires inclusion in the displayed direction. This is the one-lemma witness for R15. |
| `.lake/packages/mathlib/Mathlib/AlgebraicGeometry/EllipticCurve/VariableChange.lean:211` | Invariant transformation laws; `variableChange_j` at line 246. They give u⁻⁴,u⁻⁶,u⁻¹², and invariant j. |
| `.lake/packages/mathlib/Mathlib/RingTheory/DedekindDomain/Ideal/Basic.lean:394` | `Ideal.dvd_iff_le : I ∣ J ↔ J ≤ I`; decisive for R01. |
| `.lake/packages/mathlib/Mathlib/AlgebraicGeometry/EllipticCurve/LFunction.lean:43` | Native local polynomials; the coefficient function and series at lines 79 and 84 retain bad places. No convergence theorem is contained in these definitions. |
| `.lake/packages/TauCeti/TauCeti/AlgebraicGeometry/EllipticCurve/MinimalModel/Reduced.lean:208` | Reduced minimal representative, its elliptic instance, and `reducedMinimalModel_smul` at line 253. |
| `.lake/packages/TauCeti/TauCeti/AlgebraicGeometry/EllipticCurve/MinimalModel/DiscriminantIdeal.lean:235` | `minimalDiscriminantIdeal_eq_span_of_isGlobalMinimal`; the converse at line 247 retains its integral-model hypotheses. |
| `.lake/packages/TauCeti/TauCeti/AlgebraicGeometry/EllipticCurve/MinimalModel/Semistable.lean:90` | `IsSemistable`, local good-or-multiplicative reduction, including small primes. |
| `.lake/packages/TauCeti/TauCeti/AlgebraicGeometry/EllipticCurve/MordellWeil/Regulator.lean:91` | Regulator definition, Gram determinant at line 95, and rank-zero value 1 at line 104. Finite generation is not automatically an analytic-rank comparison. |
| `.lake/packages/TauCeti/TauCeti/AlgebraicGeometry/EllipticCurve/MordellWeil/FinitelyGenerated.lean:121` | Number-field Mordell–Weil finite generation. |
| `.lake/packages/TauCeti/TauCeti/AlgebraicGeometry/EllipticCurve/Isogeny/Basic.lean:139` | Native isogeny carrier. |
| `.lake/packages/TauCeti/TauCeti/AlgebraicGeometry/EllipticCurve/Affine/InvariantDifferential.lean:105` | Native Kähler differential ω; its nonvanishing/basis requires ellipticity. |
| `.lake/packages/TauCeti/TauCeti/AlgebraicGeometry/EllipticCurve/Isogeny/Differential.lean:69` | Native differential pullback; negation formula at line 153. |
| `.lake/packages/TauCeti/TauCeti/AlgebraicGeometry/EllipticCurve/Isogeny/Degree.lean:94` | Native degree, used in the successful missing-headline probe. |
| `.lake/packages/TauCeti/TauCeti/NumberTheory/ModularForms/ModularSymbols/Basic.lean:97` | Degree-zero divisors, symbol representatives and coinvariant construction; this is not already torsion-free singular homology. |
| `.lake/packages/TauCeti/TauCeti/NumberTheory/ModularForms/Newforms/AnalyticInvariants.lean:80` | Newform analytic rank and its continuation comparison at line 92. An elliptic-equation continuation comparison is a distinct bridge. |

The main examples read for shape were `TauCetiRoadmap/EllipticCurves/README.md` and `TauCetiRoadmap/ModularForms/README.md`. Their cited differential/reduction/height/BSD and modular-form layers were resolved by object. Completed ArithmeticDirichletSeries Layers 1, 3, 5 supply norm fibres, Euler products and cumulative ideal counts; NumberFieldArithmetic supplies the discriminant/signature conventions. ComplexTori and EllipticIntegrals are scope exclusions/consumers, not upward supply edges.

The current supplier texts resolve as follows: ModularCurvesPartII §§1.1–1.4 (lattice equation, pointed uniformization, homotheties, differential periods), §§7.2, 7.5–7.6 (differentials and rational Hecke structure), §14.12 (torsion-free-group integral comparison), §16.2 (modular quotient); EllipticCurveModularity R29.3–R29.6 (attachment, all-prime comparison, quotient choice, continuation, and the duplicated convergence result); ModularSymbolsPadicLFunctions §§0.4, 0.8, 1.1–1.2 (boundary/cuspidal side, Manin–Drinfeld, periods and Mellin comparison); GrossZagierAndArithmeticHeights §§3.5, 3.7–3.10 (pullback scalar, integral bounds, degree identity, transfer); ArakelovGeometryAndAbelianHeights §§2.1–2.3, 2.7, 2.9, 3.1–3.4 (metrics, isogenies, discriminant formula and heights); PeriodsAndSpecialValues PS.1.1, 1.7, 1.8, 3.3 (local factors, completion, continuation predicates and leading germs). Missing GrothendieckPeriodConjecture and stale Gross–Zagier §3.12 are findings above. Unpinned Tau Ceti-main claims are not treated as declarations available at the pins.

### Computed adversarial pass

These are falsification tests and normalization checks, not proofs of the general deep theorems. Exact equalities use rational/integer algebra; decimals recompute the displayed rounded inputs and therefore have rounding error. Let `A=covol Λ`, `R=ℤ·2+ℤ·3i`, and `H=ℤ·2+ℤ·(1+3i)`. Both have A=6. Their least positive real periods are 2, while their real component counts are respectively 2 and 1. Lattices used as toy examples test a formula on its specified lattice carrier, not an assertion that arbitrary numerical data come from an elliptic curve over ℚ.

| Statement | Instance / negative control | Computed left or object | Computed right / comparator | Result; change |
|---|---|---|---|---|
| Differential normalization | `y²=x³−x`; replacing ω=dx/(2y) by dx/y | Second differential is 2ω | Periods multiply by 2; area by 4 | Wrong differential excluded by g₂,g₃ pin |
| Short-model change | `y²+y=x³` | u=1,t=−1/2 gives `y²=x³+1/4` | c₄=0,c₆=−216, Δ=−27 on both | Pass |
| `scaleLattice` | R,c=2; c=0 control | Basis 4,6i; respectively {0} | Image of multiplication by 2; image of zero | Pass; c=0 excluded from invertible scaling |
| `mem_scaleLattice` | R,c=2,z=4 and z=2 | Membership true, false | Preimages 2∈R, 1∉R | Pass; delete acceptance padding |
| `periodLattice` pin | `y²=x³−x`, `y²+y=x³` | Required pairs (4,0),(0,−1) | c₄/12=4,0; c₆/216=0,−1 | Nonzero discriminants 64,−27 |
| Discrete instance | PeriodPair basis 2,3i | Coordinate subgroup ℤ² | Nearest nonzero length 2>0 | Zero/collinear pair excluded by independence |
| Full-lattice instance | PeriodPair basis 2,3i | Real determinant 6 | Rank 2 in real dimension 2 | Pass; rank-one subgroup not admitted |
| `exists_periodPair_periodLattice` | Square curve; singular control (g₂,g₃)=(3,1) | Square Δ=64; control Δ=0 | Required nonzero Δ: true, false | The control fails ellipticity, not existence via epsilon |
| `periodLattice_unique` | Square automorphism u=i; wrong scale u=2 | g₂ stays 4; at scale 2 it becomes 1/4 | Pinned g₂=4 | Correct uniqueness test; proof repair R07 |
| CM uniqueness proof | Hexagonal u=ζ₆; square u=i | u⁴=ζ₃²; u⁶=−1 | Claimed 1,1 | Fail; swap nonzero-invariant conditions |
| `Δ_periodLattice` | 11a1 | `(124/3)³−27(2501/27)²=−161051` | Minimal Δ=−11⁵=−161051 | Pass |
| Lattice j identity | Square curve | `1728·4³/64=1728` | j=1728 | Pass; Δ=0 excluded |
| `periodLattice_smul` | u=2 on R; u=−1 | 2R with basis 4,6i; −R=R | Scaled lattice has same values | Pass |
| `covolume_periodLattice_smul` | u=2 and u=i on R | Areas 24 and 6 | 4·6=24 and 1·6=6 | Pass |
| Differential/period-image comparison §1.4 | R; scale differential by 2 | Period image generated by 2,3i; then 4,6i | Areas 6; then 24 | Normalization matters; pointed isomorphism alone must be differential-normalized |
| `mem_periodLattice_conj` | R,z=3i; z=i | Conjugates −3i∈R; −i∉R | Membership true; false | Both directions pass |
| `covolume_periodLattice_conj` | Basis 2,1+3i and its conjugate | Oriented determinants 6 and −6 | Absolute areas 6 and 6 | Pass; raw signed determinant would fail |
| `leastPositiveRealPeriod` | R and H | Least real positive element 2 in each | 1 is in neither real intersection | Pass; discriminates half-period |
| `realComponentCount` | Δ=64 and Δ=−27; singular Δ=0 | 2 and 1; total definition returns 1 at zero | Real smooth components 2 and 1; singular case outside theorems | Pass with ellipticity |
| `leastPositiveRealPeriod_pos` | R,H | 2,2 | Both >0 | Pass; empty positive-real set excluded by real elliptic shape |
| `leastPositiveRealPeriod_mem` | R,H | 2=1·2+0·second period | Member of each lattice | Pass |
| `periodLattice_rectangular_of_pos` | R | Conjugation matrix diag(1,−1); two real components | Basis 2,3i, area 6 | Pass |
| `periodLattice_rhombic_of_neg` | H | Conjugate(1+3i)=2−(1+3i); one component | Basis 2,1+3i, area 6 | Pass; treating 1 as a real period fails |
| Embedded equations §2.1 | W over ℚ, two complex-conjugate embeddings over a quadratic field | Rational c₄,c₆ fixed | Conjugates equal the original invariants | Pass; no independent place choice enters global result |
| `localPeriod` | Real R, real H, complex R | 4,2,12 | 2·2,1·2,2·6 | Pass; complex area alone gives wrong 6 |
| `localPeriod_pos` | Same three cases | 4,2,12 | All strictly positive | Pass |
| Real-integral comparison §2.2 | Two components each period 2; one component period 2 | Total integrals 4,2 | Component count times least period 4,2 | Pass |
| Complex-integral comparison §2.3 | R, ω=dz | Integral ω∧ω̄=−12i | Absolute integral 12=2A | Pass; source's unmodified integral is not real |
| `localPeriod_smul_of_isReal` | R,u=−2 | Local period 8 | 2·4=8 | Absolute value required |
| `localPeriod_smul_of_isComplex` | R,u=2i | Area 24, local period 48 | Norm squared 4 times 12 | Pass |
| `prod_localPeriod_smul` | K=ℚ(i), u=2 | Complex local factor multiplied by 4 | Absolute field norm N(2)=4 | Pass; multiplicity 2 not counted twice |
| `globalPeriod` | Minimal 27a3; nonminimal `y²=x³+16` | Ω_min; `4096^(1/12)·Ω_min/2` | Ω_min; 2·Ω_min/2=Ω_min | Pass |
| `globalPeriod_pos` | Same nonminimal example | 2·Ω_min/2 | Ω_min>0 | All denominators nonzero |
| `globalPeriod_smul` | u=2 over ℚ | Prefactor divided by 2, local period doubled | Product factor (1/2)·2=1 | Pass |
| `globalPeriod_eq_prod_of_isGlobalMinimal` | 11a1, norm Δ=norm 𝔇=161051 | Prefactor `(161051/161051)^(1/12)=1` | Product Ω=1.2692093 | Pass |
| Semi-global defect §2.5 | Defect k=1 at prime of norm 3 | `(3¹²)^(1/12)=3` | N𝔭^k=3 | Pass |
| Arbitrary-model base change §2.5 | Identity extension, nonminimal 27a3 | LHS Ω_min | Original RHS Ω_min/2 | Fail R02; corrected RHS Ω_min |
| Totally-real semistable base change | 11a1 to ℚ(√5) | Two real factors Ω²≈1.61089225 | Finite defect 1 times Ω² | Pass |
| Real-to-complex base change | 11a1 to ℚ(i) | 2A=3.7030872 | Ω²≈1.61089225 | Correctly unequal; excludes degree-only rule |
| `neronLattice` | Minimal and nonminimal 27a3 | Both select the same reduced minimal equation | Same Λ_min, not Λ_min/2 | Pass |
| Néron-lattice discrete instance | Reduced model of 11a1 | Basis determinant ≈1.8515436>0 | PeriodPair lattice is discrete | Pass |
| Néron-lattice full instance | Same curve | Two real-independent periods | Real rank 2 | Pass |
| `neronLattice_smul` | Any equation change on 11a1 | Reduced representative unchanged | Same Λ; area 1.8515436 | Pass; one-tactic padding |
| `neronLattice_eq_of_isGlobalMinimal` | Minimal changes u=1,−1 | Λ and −Λ=Λ | Same Néron lattice | Pass; u=2 need not preserve minimality |
| `globalPeriod_eq_neronLattice` | 11a1 and 37a1 | Ω≈1.2692093,5.9869173 | 1·1.2692093; 2·2.9934586≈5.9869172 | Pass within rounding |
| Isogeny inclusion §2.7 | [2] and [−1] on R | 2R⊆R; −R=R | Inclusion true in both cases | Pass; statable headline missing |
| Isogeny index §2.7 | [2] and [−1] | Indices 4 and 1 | Degrees 4 and 1 | Pass |
| Isogeny covolume §2.7 | [2] on R | Target area 6 | 2²·6/4=6 | Pass |
| Dual scalar law §2.7 | [2]; degree-5 isogeny of 11a | 2·2=4; 5·1=5 | Degrees 4;5 | Pass |
| Signed multiplier convention | [−1] | Signed scalar −1; étale true | Claimed positivity false; claimed α=1 false | Fail R09; absolute multiplier 1 |
| Multiplier equation invariance | Nonminimal 27a3→minimal 27a3 | Equation-differential scalar 2; Néron multiplier 1 | Degree 1 | Must use Néron differentials |
| Multiplier depends on map | [1],[2] on same E | Absolute scalars 1,2 | Same source/target E | Literal curve-only claim fails R09 |
| `LSeriesSummable_LFunction` | Good p=2 for 11a1, k=0,1,2 | Coefficients 1,−2,2 | Bounds 1,2√2,6 | Local majorant passes; earlier owner R11 |
| Abscissa bound §3.1 | σ=7/4; boundary σ=3/2 | Majorant exponent σ−1/2=5/4;1 | >1 true; false | Strict half-plane necessary for this proof |
| Number-field norm-fibre bound | 11a1 over ℚ(√17), n=4 | 2+4+2=8 | Correct ideal majorant 20; rational majorant 6 | Earlier owner's general bound passes |
| Ramified/inert control §3.1 | 2 in ℚ(√2), ℚ(√5) | Norm-2 coefficients −2,0 | Residue-degree-one factor; empty norm-2 fibre | No good-primes-only omission |
| `LSeries_ne_zero` | Good factor p=2,s=2 | Polynomial at T=1/4 is 13/8 | Inverse 8/13≠0 | Local nonvanishing; infinite product still needs convergence theorem |
| Euler-product identity §3.2 | Split p=11 and additive p=2 | Factors (1−T)⁻¹ and 1 | Coefficients at powers 1,1,… and 1,0,… | Both factors retained |
| Positivity on real half-plane | Good p=2,s=2; nonsplit p=37,s=2 | 8/13; 1369/1370 | Both >0 | Pass locally; global follows convergent product |
| Hasse–Weil local comparison | Good q=2,a=−2; split/nonsplit/additive | 1+2T+2T²;1−T;1+T;1 | Frobenius factors of dimensions 2,1,1,0 | Convention and bad-prime controls pass |
| `IsContinuation` | U half-plane Re>3/2; ball radius1/4 at1 | 1∈U false; 2∈ball false | Required one_mem; halfPlane_subset | Both wrong models rejected |
| `IsContinuation` nonempty case | Entire continuation of 11a1 | U=ℂ includes 1 and 2 | Convex/open predicates true | Genuine continuation theorem required, not arbitrary F |
| `IsContinuation.eqOn_inter` | Two restrictions of that continuation to Re>0 and Re>−1 | Same value at 1≈0.2538419 | Same value≈0.2538419 | Identity theorem; intersection contains 2 |
| `isContinuation_of_modularity` | 11a1 | Entire continuation, F(1)≈0.2538419 | Required domain ℂ and nonempty half-plane | Consistent; modularity supplier supplies existence |
| `analyticRank` | 11a1,37a1,389a1,5077a1 | Orders 0,1,2,3 | First nonzero derivative indices 0,1,2,3 | Pass; zero germ would have ⊤ and toNat=0 |
| `analyticOrderAt_ne_top` | 37a1; zero-germ negative control | Order 1; order ⊤ | Finite order required; zero germ excluded by nonvanishing half-plane | Pass under continuation and ellipticity |
| `leadingCoefficient` | 389a1,5077a1 | 1.518633/2=0.7593165;10.3910994/6=1.7318499 | Displayed special values | Factorials necessary |
| `leadingCoefficient_ne_zero` | 11a1 and 37a1 | 0.2538419 and 0.3059998 | Both ≠0 | Pass |
| `leadingCoefficient_im` | Same continuations | Imaginary parts 0,0 | Required 0,0 | Real coefficients/conjugation, no positivity theorem inferred |
| `analyticRank_congr` | Two nested restrictions for 37a1 | 1 | 1 | Same germ; pass |
| `leadingCoefficient_congr` | Same restrictions | 0.3059998 | 0.3059998 | Same germ; pass |
| Taylor-leading-term §3.4 | Local Taylor control `a(s−1)²`,a=3 | Second derivative/2!=6/2=3 | Taylor coefficient 3 | Normalization test only; this polynomial is not asserted to be an elliptic continuation |
| `torsion_card_pos` | 11a1; trivial torsion | 5;1 | Both >0 | Empty torsion carrier impossible: includes O |
| Relative canonical-height scaling | Same rational point in degree-2 extension | Relative height 2h | Degree times absolute height 2h | Convention check; degree factor retained |
| `normalisedRegulator` | d=2,r=1,Gram entry 2h; r=0 | 2h/2=h;1/2⁰=1 | Absolute regulator h; empty determinant 1 | Pass |
| `normalisedRegulator_pos` | h=3,d=2,r=1; rank0 | 6/2=3;1 | Both >0 | Positive Gram form required |
| Regulator base change §3.5 | d=2, unchanged rank2 and basis | det(2G)=4det G | Divide by 2², giving det G | Pass; new points invalidate premise |
| BSD factor §3.6 | 11a1 | 1.2692093·5/25=0.25384186 | L-value≈0.2538419 | Positive, consistent to rounding |
| Analytic Sha definition §3.6 | 11a1,37a1 | 1.000000158;1.000000245 | Expected numerical controls 1;1 | Floating values are not exact integrality proofs |
| Number-field BSD discriminant factor | K=ℚ(√5), symbolic leading term a and factor B | √5·a/B | Omitting discriminant gives a/B | Distinct unless a=0; formula matches source |
| Analytic Sha continuation invariance | Two restrictions, 11a1 | Same leading coefficient and B | Quotient ≈1.000000158 on both | Pass |
| Rational BSD factor comparison | K=ℚ | √discr ℚ=1 | Formula reduces to a/B | Pass |
| `WeakBSD` | 11a1 and 37a1 | Analytic ranks 0,1 | Mordell–Weil ranks 0,1 | True examples; conjecture is not proved by definition |
| Strong BSD predicate §3.7 | Rank0 control with Sha order1 | Weak rank equality 0=0 and analytic Sha=1 | Finite Sha cardinal1 | Definition has intended factors; no admitted general theorem |
| Strong-BSD isogeny transfer | 11a1,11a2,11a3 | BSD factors all ≈0.2538419 | Same L-value; Sha controls 1,1,1 | Cassels supplier needed for general claim |
| Newform period lattice §4.1 | Level11, cuspidal vs boundary symbol | Λ∩ℝ=Ωℤ; L(f,1)=Ω/5 | Ω/5∉Ωℤ | Correctly rejects all-symbol image |
| Integral homology comparison §4.1 | N=5,7,37 | Quotient dimensions over ℚ/𝔽₂/𝔽₃: (1,2,1),(1,1,2),(5,6,6) | Torsion-free relative homology gives (1,1,1),(1,1,1),(5,5,5) | Fail R04 |
| Newform conjugation §4.1 | Level11 basis a,a/2+bi | Conjugate second period a−(a/2+bi) | Integer combination with coefficients 1,−1 | Same lattice |
| Newform real-period shape §4.1 | Levels11,37 | Counts 1,2 | Ω=1.2692093;≈5.9869172 | Matches curve lattice when c=1 |
| `IsX0Optimal` §4.2 | 11a1,11a3 | Minimum quotient-isogeny degrees 1,5 | Predicate true,false | Existence definition passes |
| Homology-surjectivity iff §4.2 | Nonoptimal 11a3 | Universal over degree-one choices = true | Optimality=false | Fail R08 |
| Connected-kernel criterion §4.2 | Primitive optimal quotient vs composing [2] | Kernel connected vs four-component isogeny kernel | Degree of extra isogeny 1 vs4 | Must specify chosen quotient/map |
| Indecomposability criterion §4.2 | Primitive map to 11a1; compose [2] | Extra factor degree1;4 | Primitive true; composite false | Do not quantify over arbitrary multiples of a primitive map |
| Optimal representative uniqueness | Class11a | Optimal representative 11a1 for each input | Same reduced equation | Correct once primitive quotient fixed |
| Γ₁-optimality §4.3 | Class11a | Γ₁-optimal 11a3; X₀-optimal 11a1 | Distinct representatives | Distinguishes the two quotients |
| Optimal Manin constant §4.4 | 11a1; negate parametrization | Signed constants 1,−1 | Absolute constant 1 in both | Pass with absolute convention |
| Optimal Manin lattice identity | 11a1,c=1 | A_E=1.8515436 | c² A_f=1.8515436 | Pass |
| Manin covolume certificate | Toy c=2,A_f=3 | A_E=12 | A_E/A_f=4=c²; c≠1 | Detects missing square |
| Nonoptimal Manin constant §4.5 | 11a1→11a2;11a1→11a3 | α=1,5 | c'=1·1=1;5·1=5 | Not equal to degree in first case |
| Minimal map and Endℚ §4.5 | 11a1→11a3 generator degree5 | Multiples n=1,2 have degrees5,20 | 5n²=5,20 | Zero map degree0 excluded |
| Modular degree §4.6 | 11a1,11a2,11a3,37a1 | 1,5,5,2 | Optimal degree times least isogeny degree:1,5,5,2 | Parametrization degree differs from quotient-isogeny degree at37 |
| Modular degree multiplicativity | Composite degrees2 and3 | Degree6 | 2·3=6 | Pass; excludes constant maps |
| Petersson identity §4.7 | 11a1 rounded inputs | mA=1.8515436 | 4π²c²‖f‖²≈1.851541733 | Difference≈1.87·10⁻⁶ from rounded norm |
| Petersson identity nonoptimal | 11a3 from 11a1, degree5,c=5 | 5·(5A)=25A | c²·A=25A | Pass; no optimality needed for a specified primitive composite |
| Integral cusp-form lattice §4.8 | Level11 integral newform coefficient a₁=1 | Span ℤf; rational span ℚf | Full rank1; f/2 not integral | Distinguishes saturation/coefficient condition |
| Congruence modulus definition | Rank1 space, g=0 | Congruence a₁(f)≡0 mod r permits r=1 only | Modulus1 | Nonempty finite range; excludes g=f by orthogonality |
| Congruence quotient order | Rank1 space ℤf | Quotient ℤf/ℤf=0, cardinal1 | Modulus1 | Trivial group case consistent |
| Modular-degree divisibility | 54b1 | m=2 divides r=6 | Reverse 6 divides2 is false | Correct target; source issue below |
| Local valuation equality | 54b1,p=2 and3 | v₂(2)=v₂(6)=1;v₃ values0,1 | 4∤54 true;9∤54 false | Hypothesis selects exactly the valid comparison |
| Mazur divisibility §4.9 | Optimal semistable c=1; wrong p=3,c=3,N=11 | No prime divides1; control has p²=9∤44 | Conclusion for control false | Extra hypotheses essential; no fabricated curve with control data claimed |
| Abbes–Ullmo/Raynaud bounds | c=1,N=11; integer control c=4,N=11 | Antecedents false;4 divides c but4∤N | Control rejected by claimed bound | Source hypotheses must be carried |
| ARS 2.7 | c=1,N=11,m=1 | No prime divides c | Disjunction never invoked | Consistency check only; proof missing R03 |
| Semistable Manin theorem | 11a1 and37a1 | c=1,1 | v₂(c)=v₃(c)=0 | Small-prime cases retained, not supplied by odd-prime theorem alone |
| Manin conjecture | 11a1; nonoptimal11a3 | Optimal c=1; nonoptimal c=5 | Optimal hypothesis true;false | Do not extend conjecture to all curves |
| `stevensCurve` | Class11a | 11a3, smallest Néron lattice | Area 9.2577181, largest in class | Descriptor picks minimum height, not minimum area |
| Stevens elliptic instance | Selected reduced 11a3 | Δ=−11≠0 | Elliptic=true | Witness required before epsilon property |
| `isReducedMinimal_stevensCurve` | 11a3 | a₁=0,a₂=−1,a₃=1; Δ=−11 | All reduced bounds; v₁₁Δ=1<12 | Pass |
| `stevensCurve_eq_of_isogeny` | Inputs11a1 and11a2 | Both outputs11a3 | Identical reduced equation | Pass |
| `stevensCurve_isogenous` | 11a1 input | 11a3→11a1 degree5 | Nonempty isogeny set | Pass |
| `neronLattice_stevensCurve_le` | Class11a | Inclusion indices5,25,1 | Positive finite indices | Correct direction |
| Stevens étale quotient existence | 11a3→11a1 | Degree5, absolute α=1 | Index[Λ_11a1:Λ_11a3]=5 | Pass; theorem proof must be owned |
| Étale quotient uniqueness | φ and −φ | Signed α=1,−1 | Differ by automorphism [−1] | Equality only up to sign |
| Stevens Conjecture II / Vatsal 1.10 | Semistable class11a | E_min=E₁=11a3, degree1 | 1=2⁰ | Valid control; does not prove full conjecture |
| Vatsal 1.11 hypotheses | ℓ=7 vsℓ=5 | ℓ≥7 true,false | Reducibility and ordinariness additionally required | No all-primes extrapolation |
| Stevens Conjecture I | X₁(11)→11a3 identity | c₁=1 | Conjectured value1 | Consistency control, not a theorem for all curves |
| Intrinsic invariants §4.11 | 11a3 | X₀-optimal false,Γ₁-optimal true,m=5,c=5,ratio1 | All integer/positive as asserted | Database ordering not used as a definition |
| `leadingCoefficient_div_globalPeriod_mem_rat` | 11a1 | Exact modular-symbol ratio1/5 | Rational number1/5 | Headline passes; arithmetic Sha corollary needs R13 |
| Rank-zero analytic Sha corollary | 11a1 with algebraic rank0 | (1/5)·25/(1·5)=1 | Regulator1 from empty determinant | Correct only after the missing rank input |
| `faltingsHeightLattice` | Nonminimal27a3, area A/4, norm ratio4096 | −log2−½log(A/4)=−½log A | Minimal formula−½log A | Formula consistent; native comparison absent R14 |
| `faltingsHeightLattice_smul` | u=2 overℚ | Discriminant term +log2; area term −log2 | Net change0 | Pass |
| `faltingsHeightLattice_eq_of_isGlobalMinimal` | Norm ratio1 | −(1/12)log1=0 | Only weighted area sum remains | Pass as formula simplification |
| `faltingsHeightLattice_eq_neronLattice` | 11a1 | −½log1.8515436≈−0.308009835 | README−0.3080098 | Correct formula value; not native-height identification |
| Native height comparison §5.2 proof | 𝔲=2ℤ in nonminimal27a3 | Written quotient2ℤ/ℤ undefined | Proposed−log2<0 | Fail R06; integral section2ω has index1 |
| Eisenstein discriminant dictionary §5.2 | τ=i,ω₁=2 | Scaling weight12 gives factor2⁻¹² | `(2π)¹²Δ(i)/2¹²` | Constants compatible; actual supplier missing R05 |
| `jDenominatorIdeal` | j=0,1728,1/2 | Ideals(1),(1),(2) | Elements a with aj integral | Pass; unit ideal is not zero ideal |
| `jDenominatorIdeal_smul` | j=0,u=2 | Still(1) | j invariant | Pass; one-tactic padding |
| `minimalDiscriminantIdeal_dvd_jDenominatorIdeal` | Minimal27a3 | (27) divides(1): false | Correct (1) divides(27): true | Fail R01 |
| `stableFaltingsHeightLattice` | 27a3, norm 𝔇=27,denom j=1 | h_st−h=−log27/12≈−0.274653072 | Lower stable height | Pass after correcting ideal direction |
| `stableFaltingsHeightLattice_le` | 27a3; semistable11a1 | Difference−0.274653072;0 | Both ≤0 | Pass |
| `stableFaltingsHeightLattice_eq_iff` | 27a3 and11a1 | Equality false,true | Semistable false,true | Both directions detected; additive prime3 retained |
| `stableFaltingsHeightLattice_smul` | u=2 | +log2−log2=0 | j denominator unchanged | Pass |
| Height isogeny law §5.4 | [2]; degree5 α=1;degree5 α=5 | 0;+0.804718956;−0.804718956 | ½log4−log2;½log5;½log5−log5 | Pass; signed scalar requires absolute value |
| Isogeny height bound | Degree3 α=1 and3 | ±0.549306144 | ±½log3 | Extremes attained |
| `faltingsHeightLattice_stevensCurve_le` | 11a3 vs11a1 vs11a2 | −1.112728796≤−0.308009835≤0.496709148 | Ordering from areas9.2577181≥1.8515436≥0.3703087 | Pass for formulas |
| `faltingsRatio` | 11a1,11a2,11a3 | Indices5,25,1 | A_min/A_E≈5,25,1 | Index direction correct |
| `faltingsRatio_pos` | Same class | 5,25,1 | Each >0 | Pass; junk relative index0 excluded by full-rank inclusion |
| `faltingsRatio_eq_covolume_div` | Area pair30 and6 (lattice index5) | Index5 | 30/6=5 | Pass; exactly pinned lemma |
| `faltingsRatio_eq_exp` | Height difference½log5 | exp(2·½log5)=5 | Index5 | Pass; inverse sign would give1/5 |
| `faltingsRatio_eq_one_iff` | 11a3 and11a1 | Ratios1 and5 | Reduced model equals Stevens curve true,false | Both directions detected |
| Optimal height/Petersson §5.6 | 11a1,m=c=1,‖f‖≈0.2165644 | −log(2π·0.2165644)≈−0.308009750 | Area height≈−0.308009835 | Difference<10⁻⁷ at rounded precision |
| Higher-rank worked examples | 389a1;5077a1 | BSD factors≈0.759316607;1.731850078 | Leading coefficients0.7593165;1.7318499 | Ratios≈0.999999859;0.999999897; no exact Sha claim |
| Field and characteristic controls | ℚ,ℚ(i); zero ring,𝔽₂,𝔽₃ | Number-field degrees1,2; last three not number fields | Zero/nonzero-ring and char-zero hypotheses exclude them | Small residue characteristics remain included |
| Nonabelian/trivial-group controls | Elliptic point group; S₃; rank0 free quotient | Commutators0; S₃ nonzero commutator; empty Gram det1 | Additive commutative carrier excludes S₃; regulator1 | No arbitrary-group extension inferred |

The table contains 153 rows, covering the seeded targets, the headline inventory, the named Lean declarations, the anonymous instances, and the targets touched by findings. The 11a, 37a, 389a and 5077a arithmetic was recomputed from the displayed inputs. The Manin relation matrices were row-reduced exactly over ℚ and the two finite fields. No numerical approximation is used to assert an exact rank, Sha order, or period-lattice equality.

### Limits of the source certification

The legal texts read include [Cremona's corrected Chapter II](https://johncremona.github.io/book/fulltext/chapter2.pdf), [Vatsal's author preprint](https://personal.math.ubc.ca/~vatsal/research/optimal6.pdf), [ARS on the Manin constant](https://www.wstein.org/papers/ars-manin/agashe-ribet-stein-the_manin_constant.pdf), [ARS on congruences](https://www.wstein.org/papers/ars-congruence/current.pdf), [Česnavičius v3](https://arxiv.org/abs/1703.02951v3), [Abbes–Ullmo](https://numdam.org/item/CM_1996__103_3_269_0/), [Deligne](https://numdam.org/item/SB_1983-1984__26__25_0/), [Faltings' institutional copy](https://math.uchicago.edu/~drinfeld/Deligne%27s_conjecture_Manin_conf/Faltings_argument/Faltings.pdf), [Zagier's author copy](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.4153/CMB-1985-044-8/fulltext.pdf), and the eight readable LMFDB knowls. Faltings printed pp.357–358 and the relevant Zagier and Vatsal pages were also inspected as images where extraction obscured formulas.

## Not verifiable

- **Silverman, Arithmetic of Elliptic Curves, second edition** (`silverman-aec`): the source service classified DOI 10.1007/978-0-387-09494-6 as paywalled/uncertified. VI.5.1 and the cited chapter ranges were not certified against that edition's text. This is not a claim that their mathematics is false.
- **Silverman, Advanced Topics** (`silverman-advanced`), **Mazur, Rational isogenies of prime degree** (`mazur`), and **Bosch–Lütkebohmert–Raynaud, Néron Models** (`blr`): publisher resolution was uncertified. Their cited primary locators were retained; no paywall was bypassed. ARS gives independently readable statements of the quoted Mazur bound.
- **Stevens, Stickelberger elements and modular parametrizations** (`stevens`): the cited author-page PDF failed certificate verification through the source service. Theorem 2.3 and Conjectures I–II could not be checked in the primary text. Vatsal's restatement was read, but it is not certification of Stevens' proof or original numbering.
- **Manin, Parabolic points and zeta functions of modular curves** (`manin`): DOI/MathNet resolution supplied no legal PDF. The conjecture's location in §5 was not certified; ARS calls it implicit there.
- **Five LMFDB knowls**: `ec.q.optimal`, `ec.q.modular_degree`, `ec.q.manin_constant`, `ec.q.faltings_height`, `ec.q.faltings_ratio` returned CAPTCHA pages through the source service. Those bodies were not read. Their mathematics was tested separately against the readable literature and formulas, without treating the CAPTCHA as source content.
- **Publication-version pagination**: Vatsal was read in the 47-page author preprint, and ARS congruences in the author preprint whose theorem is 2.2. Published page/theorem alignment was not established. Their theorem hypotheses were checked in the versions actually read. There are no explicit “unverified” flags in the target README to clear.
- **Unpinned Tau Ceti-main assertions** at README lines 363–368: the named real-period, local-index and isogeny-height files are not at the supplied pins. The corresponding roadmap ownership was checked; the unprovided later Tau Ceti-main source was not certified as library code available to this acceptance file.
- **Open-work coverage**: the indexed object search and the relevant supplied sibling files were checked. No independent ownership claim is made about unpublished packages or open heads without files supplied in the brief. The renamed period-roadmap lead from the index is not treated as an authorized replacement supplier without resolving its exact scope and order.

The unresolved source requests were consolidated under their existing source IDs in `needs-references.toml`; successful later fetches and uncertified publisher entries were removed from that request list. No source manifest or PR file was edited. These access limits do not suspend the review or alter the explicit counterexamples.

## Source issues

- **Error** in ec.period at complex local-period definition, knowl page 1 (ec.period line 102): the source says the integral of ω∧ω̄ is the positive local period; it should be its absolute value, giving 2A rather than −2iA; affects nothing.
- **Misprint** in vatsal at introduction, author preprint p.1 (vatsal line 18): the source says Γ₀(N) is contained in Γ₁(N); it should be Γ₁(N) contained in Γ₀(N); affects nothing.
- **Misprint** in vatsal at Example 1.2, author preprint p.3 (vatsal line 73): the source says the level-eleven weight-two form is η(z)η(11z); it should be η(z)²η(11z)², of weight two and initial term q; affects nothing.
- **Error** in vatsal at discussion preceding Theorem 1.3, author preprint p.4 (vatsal line 129): the source says a signed prime-degree differential multiplier is 1 or p; it should be ±1 or ±p, or explicitly its positive absolute value; affects a stated result.
- **Misprint** in vatsal at height display before Theorem 1.3, author preprint p.5 (vatsal lines 133–144): the source says the displayed inverse-square height equals the period covolume; it should use the positive half absolute wedge integral, since the displayed integral equals −A/π; affects nothing.
- **Error** in zagier at the remark following the proof of Theorem 3, printed p.382 (zagier lines 567–569): the source says the congruence modulus divides the modular degree at general level; it should assert modular degree divides congruence modulus; affects nothing.

For the last item, the prime-level Theorem 3 itself states equality; the error is the general-level remark after its proof. The example 54b1 gives 6 not dividing 2. The read ARS congruence preprint, lines 65–74, supplies the corrected divisibility/local-equality theorem. No claim of a checked printed erratum or published-version correction is made.
