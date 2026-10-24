# Repair report: PeriodsAndSpecialValues

Two reviews, with overlapping IDs. The first group below is review a (F01–F08), the second review b (F01–F04). Where findings overlap they are settled once and cross-referenced: a/F05 = b/F03 (source register), a/F06 = b/F04 (backticked names). Every finding was checked against the cited sources, the sibling roadmaps and the pins, and every one holds on the mathematics. This repair does not count as acceptance; a fresh review follows.

# Review a

## F01 (P2) — applied differently

PS.3.2a now imports the stable comparison and ranks (ArithmeticKTheory §§3.3–3.4) and the regulator, real isomorphism, Deligne comparison and Adams weight (BorelRegulators §§2.1–2.3, 6.0a–6.3), and proves PS.3.2 exactness for h⁰(Spec F)(j). Applied differently: BorelRegulators §6.2 has r_Bo = −2·r_Be, so the signed ratio is (−2)^(d_j), not 2^(d_j). PS.9.8–PS.9.9 are redirected; the ArithmeticLocallySymmetricSpaces contract is deleted.

## F02 (P1) — applied

“Ω_f^± ~ c^±(M_f)” → (2πi)·c^((−1)^m)(M_f) ~ Ω_f^((−1)^(k−m−1)) in ℂ^×/σ(E^×). This follows from Deligne (7.8.3), Deligne line 999, and ModularSymbolsPadicLFunctions §1.2's ε. New Checks: the sign pairs for k = 2 and 4, and the exact witness K(H−J) = π, det B = 4πi, 2πi·c⁻ = Ω⁺/2, while c⁻/Ω⁻ = −1/(4π).

## F03 (P1) — applied

"The operator annihilates ∫_γΩ" → "D_t annihilates ∫_γΩ; L_z = (1−t⁴)/64·D_t∘(1/t) annihilates t∫_γΩ and has the listed coefficients". Expanding by hand reproduces all four coefficients. Added a negative control: on the raw leading term t⁻¹ the operator gives t⁻¹/64 − (3/8)t⁻⁵ ≠ 0, while on 1 + 24z we get L_z(1) = −24z and L_z(24z) = 24z − 20160z².

## F04 (P2) — applied

Global triples, global points, Tam(T) and BlochKatoTamagawa now require weight ≤ −3 (BK line 1304, p. 374). Local points and the regularized measure keep weight ≤ −1. The weight −1 “compatibility” is deleted; weight −1 elliptic statements use PS.6.3's height formulation (BK pp. 382–383). Check: y² = x³ − 2 with x(2P) = 129/100 admits no triple.

## F05 (P3) — applied

Merged with b/F03. Each entry's `locator` now lists only that work's locators, as the README cites them, and `cited_for` lists only the sections that cite it. Generic “Sections and equations cited” entries are replaced. Burgos keeps only Theorem 10.9, printed pp. 95–97, the sole Burgos citation after a/F01. Ids, provenance and statuses are unchanged.

## F06 (P3) — applied

Merged with b/F04. `periodClass M` → "the period class of M"; `quarticFamily` → "the quartic family"; `quarticGram.det = −4` → "The Gram matrix G₀ has determinant −4"; all four `ETNC` occurrences lose their backticks. The undefined prose name quarticGroup → G. A rescan finds no backticked name of this roadmap's own outside Suggested.lean.

## F07 (P3) — applied

PS.5.3's three restatement Checks → computed ones. (1) The lattices 3ℤ₃ and 3⁻¹ℤ₃ of d(C), d(C)⁻¹ and d(C[1]) for C = [ℤ₃ --3--> ℤ₃], valuations ±1. (2) The C₃ characters ω versus ω². (3) A Δ_ℤ generator with value 3 gives TΩ valuation 0; the reversed orientation gives 2. The type-domain Check is kept.

## F08 (P3) — applied

The local `harmonic (n r)` is deleted, and `quarticG` uses Mathlib `harmonic` (`Mathlib/NumberTheory/Harmonic/Defs.lean:23`). The README cites the pinned declaration in the Mathlib contract and in PS.8.6; H_n^(2) stays prose. A scratch evaluation confirms quarticG 0, 1, 2 = 0, 104, 12276. No equality lemma or example was added to Suggested.lean.

# Review b

## F01 (P1) — applied differently

Verified on the board's main branch: `packages/EllipticKTheory/README.md` lines 139–141 assign regulators and L-values to EllipticRegulators and SpecialValuesBirchTate, which exist nowhere. No target here uses a CM L(E,2) formula, so the gap, its plan.json entry and the scope clause are deleted. Applied differently: no CM hypothesis is added, because PS.3.2 already assumes exactness explicitly.

## F02 (P2) — applied differently

PS.0.1 adopts Deligne §2.1(A), p. 9: a rational MotivesAndAlgebraicCycles motive with E → End(M). That makes MC.2 the correct supplier. Applied differently from the suggested gap: PS.1.5 constructs A_χ = [χ⁻¹] itself from MC Layer 1, §6.10 and Deligne §§6.1–6.4, with Euler factor 1 − χ(p)T, δ(A_χ) ~ τ(χ) and a mod-5 Check. PS.1.6 cites gap:modular-eigenprojector-motive.

## F03 (P3) — applied

Settled with a/F05. All the requested deletions are made: the Burgos/DG clauses in K, Tate-legal and DG, and “B, §2.5” in DG. Page check: Burgos line 3189 (Theorem 9.9) is on PDF page 85, printed p. 79; line 4139 (Theorem 10.9) is on PDF page 101, printed p. 95. The README's “pp. 72–74” citation no longer exists after a/F01.

## F04 (P3) — applied

Settled with a/F06 above. The residue "Additional The additional interface consists of D…" in PS.8.13 → "The interface also contains the matrix D, in the column-input convention, and the monomial basis determinant det D = 1."

# Checks

**Elaboration.** `lake env lean packages/PeriodsAndSpecialValues/Suggested.lean`, run from the content repository: exit 0, exactly 17 `declaration uses sorry` warnings, no other diagnostic. No `TauCeti.*` import, so nothing needed building first.

**Binder check.** I put `#check @name` for all 42 declarations (25 definitions, 17 theorems; `harmonic` is gone) into one scratch file and elaborated it once: exit 0. I compared each elaborated type with its README statement. The only change is `quarticG : ℕ → ℚ`, whose body now uses `_root_.harmonic`. No declaration loses a binder: there are no section variables, and the prime hypotheses of `dworkSigma0_summable`, `dworkSigma2_summable` and `det_ne_zero_of_padic_triangular` are explicit.

**Dependency check.** Output:

```text
depcheck: 36 roadmaps, 355 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line. ArithmeticKTheory and BorelRegulators both come before this roadmap in the merge order. ArithmeticLocallySymmetricSpaces and EllipticKTheory are no longer cited.

**Citation resolver.** `roadmaps resolve` on the README: "Cross-roadmap citations found nowhere: None. Lean names found nowhere: None."

**Gate failures.** The worker's check reported `tex=2` on the README line of Mathlib supplier declarations that begins "Linear algebra:". Both hits were the harmonic-number formula written in prose with brace subscripts and superscripts. I put the formula into code spans and wrote it without braces: `H_n = 1 + 1/2 + ⋯ + 1/n` in ℚ, with `H_0 = 0`. Nothing else changed. `Suggested.lean` is untouched, so the elaboration result above still holds.

**Sources.** No new work is cited. Deligne §2.1, BK pp. 382–383 and Burgos Theorem 10.9 use existing keys, so no `needs-references.toml` was written.

# Adversarial pass on changed statements

| Statement | Instances | Computed values | Result | Change |
|---|---|---|---|---|
| PS.0.1 E-coefficients | E = ℚ; M = cubic-character summand of h⁰ of the cubic field of conductor 7 with E = ℚ(ζ₃); h⁰(Spec ℚ(i)) with E = ℚ(i) | ranks 2/2; dim_ℚ B = 2 and E-rank 1 on both sides; End = ℚ[C₂] ≅ ℚ×ℚ contains no ℚ(i), so that pair is excluded | holds | hypothesis made explicit |
| PS.1.5 Euler factor of A_χ | χ trivial; χ_{−4}; χ mod 5 with χ(2) = i | P_p = 1−T; χ = χ⁻¹, so this case does not discriminate; P₂ = 1−iT versus 1+iT for [χ] | holds | mod-5 Check added |
| PS.1.5 period δ(A_χ) ~ τ(χ) | χ trivial; χ_{−4} | δ = 1; τ = 2i; u ↦ −u gives Σχ(u)e^(−2πiu/f) = χ(−1)τ(χ) | holds | — |
| PS.1.5 c⁺ at critical m | ℚ(0) at m = 2, −1; χ_{−4} at m = 0, 1 | ζ(2)/(2πi)² = −1/24; ζ(−1) = −1/12 with c⁺ = 1; L(χ_{−4},0) = 1/2 with c⁺ = 1; L(χ_{−4},1)/(2πi·2i) = (π/4)/(−4π) = −1/16 | holds | — |
| PS.1.6 normalizer | k = 2, m = 1 on the Legendre curve at modulus 1/√2; k = 4, m = 1, 2, 3 | K = 1.854075, E = 1.350644, K(4E−2K) = 3.141593 = π; 2πi·c⁻ = K = Ω⁺/2; c⁻/Ω⁻ = −1/(4π); pairs (c⁻,Ω⁺), (c⁺,Ω⁻), (c⁻,Ω⁺); MSPL j = 1 gives −L(f,2)/(2πi) and ε = − | holds; same-sign identity refuted | rewritten |
| PS.3.2a dimensions | ℚ at j = 2, 3; ℚ(i) at j = 2, 3; real quadratic at j = 2, 3; ℚ at j = 1 | dim B⁺ + d_j = 1+0, 0+1, 1+1, 1+1, 2+0, 0+2; j = 1: K₁ rank 0 ≠ r₁+r₂ = 1, so excluded | holds | rewritten |
| PS.3.2a vanishing modules | ℚ, j = 2 | K₄(ℚ)⊗ℚ = 0; K_(−2) = K_(−3) = 0 | holds | — |
| PS.3.2a coker α | ℚ, j = 2 and 3 | ℂ/ℝ(2) ≅ iℝ has conjugation-fixed part 0; ℂ/ℝ(3) ≅ ℝ has fixed part ℝ; P₂(1) = 1, P₁(1) = 0 | holds | — |
| PS.3.2a determinant ratio | d = 0, 1, 1, 2 | (−2)^d = 1, −2, −2, 4; Burgos's evaluation +t/2 versus shared −t/2 | holds; the reviewer's +2 corrected | — |
| PS.3.2a Adams weight | ℚ, j = 3, a = 2; real quadratic; a = 1 | 8; 64; 1 | holds | — |
| PS.6.1 triples in weight −1 | general pure weight −1; y² = x³−2; ℚ(1) | dim F⁰ = dim V⁺ = d/2 and they meet in 0; 3³−2 = 25, λ = 27/10, x(2P) = 129/100; ℚ(1) has weight −2, so it is outside this argument | holds | triples restricted to weight ≤ −3; Check added |
| PS.6.2 / PS.6.5 weight ≤ −3 | zero triple; ℚ(2); ℚ(1) local measure | Tam = 1; weight −4 uses the convergent product; C_S doubling at p = 2 unchanged | holds | — |
| PS.8.3 operator | t^a for a = 0, −1; L_z on z | −(a³/64)t^a + ((a−1)(a−2)(a−3)/64)t^(a−4); −3/(32t⁴) = −24z; t⁻¹/64 − (3/8)t⁻⁵; z − 840z² | holds | bullet fixed; Check added |
| PS.5.3 Checks | C = [ℤ₃→ℤ₃]; C₃; L* = 3 | v = +1 / −1; ω ≠ ω²; 1 + (−1) = 0 versus 1 + 1 = 2 | holds | Checks replaced |
| `quarticG` | n = 0, 1, 2 | 0; 4·24·(25/12 − 1) = 104; 4·2520·(761/280 − 3/2) = 12276 | holds | Mathlib `harmonic` |
| PS.9.8 Beilinson–Soulé | n = 1, i = 0; general i ≤ 0 | K₂(ℚ)⊗ℚ = 0; 2n−i even gives 0, and odd 2m−1 has m > n, so weight m ≠ n | holds | inputs re-cited |
| PS.9.9 Ext¹ | n = 1, 2, 3 over ℤ | K₁(ℤ)⊗ℚ = 0, K₃(ℤ)⊗ℚ = 0, K₅(ℤ)⊗ℚ = ℚ | holds | inputs re-cited |

# Suppliers and ownership

I re-resolved every citation I touched against its current copy:
- ArithmeticKTheory, at the brief's head: §3.3 `rationalSIntegerEquiv` with toField; §3.4 `borel_rank_order`, ρ, and the stable comparison "proved here".
- BorelRegulators, at the brief's head: §§2.1–2.3, §§6.0a–6.3, the consumer entry naming this roadmap, and r_Bo = −2r_Be.
- MotivesAndAlgebraicCycles, at its open head 79b02f6: Conventions (rational coefficients); §1.1 Karoubi envelope; MC.2 §§2.3, 2.6–2.7; §5.7 nonproper and arbitrary-pair comparison; §§6.7–6.9; §6.10 Artin category. The earlier citations of §5.7 and §§6.7–6.9 still match.
- ModularSymbolsPadicLFunctions, at its open head: Conventions 7–8, §1.1, and §1.2 with ε_(j,χ).
- EllipticKTheory, on the board's main branch.

A_χ is owned here. ColemanIntegration L3.16 and L3.36 use idempotents π ∈ E[G] for p-adic Beilinson statements but do not construct the motive with its comparison. A grep of main and all open roadmap pull requests for Artin, Dirichlet and character motives found no other owner.

# For the maintainer

- `design/plan.json` no longer contains `cm-elliptic-regulator`, so the intake should not announce a gap to EllipticKTheory. gap:motivic-cohomology-adams is now also used by PS.3.2a and PS.9.9; the README contract line says so, and the plan entry's text is unchanged.
- This roadmap now consumes BorelRegulators §§2.1–2.3 and 6.0a–6.3 rather than the §§2.1–2.3, 5.3–5.4, 6.1–6.3 listed in that roadmap's consumer entry. It no longer cites ArithmeticLocallySymmetricSpaces, and no longer claims ownership of Borel's stable comparison.
- One name visible to other roadmaps changed: PS.3.2a is retitled "Number-field regulators in the fundamental line". No Lean name that other roadmaps cite changed. `harmonic` was local, and it was removed.
- Not changed, outside these findings:
  - The README's Tate-legal reference links to an nLab-hosted scan, while the manifest records the work as waived. Please check whether that link is a legal copy.
  - The Downstream consumers list still names AbelianSurfacesPotentialModularity and SpecialValuesBirchTate. Review b's note: no roadmap of either name exists anywhere.
