# Review of ModularForms (pull request #1706 at ffc0a2f)
**Verdict:** needs changes

**Repair status of the previous review (852d48b → ffc0a2f, 306 changed lines).**

- R01 (P1, analytic comparison inputs unowned): **repaired in form, with a new ownership defect.** The head adds §10D ("Uniformisation of the level moduli and algebraicity of sections", `README.md:1106–1230`), §8.0 now routes surjectivity through it (`README.md:648–662`), and Scope says "The scheme–analytic comparison on which that analytic comparison rests is owned here, in §10D" (`README.md:43–51`). The mathematics of §10D is sound (table below). But the same objects are already planned by ModularCurvesPartII and EllipticPeriods, which the README does not name: R01 below.
- R02 (P3, Tate curve re-planned): **repaired.** `README.md:631–633` now reads "Take the Tate curve over ℤ((q)) with its subgroup schemes from ModularCurves Layer 10 and base-change it to K((q))"; only the μ_N-embedding, dt/t and the evaluation of rules are built here. The base ring is misquoted: R02 below.
- R03 (P3, j-move stated as a fact about FuchsianOrbifolds): **repaired.** `README.md:25–29`: "Ownership of the normalized level-one j-function … moves from this roadmap to FuchsianOrbifolds Layer 6, which is to construct j from Mathlib's E₄, E₆ and Δ".
- R04 (P3, PolynomialGaloisGroups Layer 4): **repaired.** `README.md:32–33` and `252–255` cite "Layer 1, 'The recognition theorems'" and `Equiv.Perm.subgroup_eq_top_of_swap_mem`; `Completed/PolynomialGaloisGroups/README.md:634–639` has that bullet with that Needs.
- R05 (P3, namespace): **repaired.** `README.md:192` cites `TauCeti.normalizedFrickeOperatorCusp_heckeTCuspNat_of_mem_cuspFormCharSpace`; `TauCeti/NumberTheory/ModularForms/Fricke/Hecke.lean:35` opens `namespace TauCeti`, the theorem is at line 158.
- R06 (P3, Nm² twist locator): **repaired.** `README.md:847–851` gives the additive-character route with Shimura, Proposition 3.64 and Miyake, Lemma 4.3.10(2); `Suggested.lean:100–102` carries the same locators.

## R01 (P2) — §10D plans objects that ModularCurvesPartII and EllipticPeriods already plan, and names neither

**Location:** `TauCetiRoadmap/ModularForms/README.md:43–51` ("The scheme–analytic comparison … is owned here, in §10D … ModularCurves lists the uniformisation of its twisted curve among its external contracts and AlgebraicCurves leaves the compact-Riemann-surface comparison to a GAGA development; neither supplies the comparison used here"), `README.md:1106–1230` (§10D) and `README.md:1326–1329` (Downstream: "AlgebraicModularFormsAndSerreWeights consumes … the uniformisation and algebraicity of §10D").

**Claim:** No roadmap supplies the lattice uniformisation, the lattice–modular comparison, the moduli bijection Γ₁(N)\ℍ ≅ Y₁(N)(ℂ), the complex Tate curve at the cusps or the automorphy of ω, so §10D owns them uncontested.

**Witness:** ModularCurvesPartII (merge order line 72, read with `roadmaps show`) plans, with the same conventions: §1.1 `latticeUniformization`, the curve `W_L` with `a₄ = −g₂/4`, `a₆ = −g₃/4` and `z ↦ [℘:℘′/2:1]` (Milne Propositions 3.11–3.13, the locator §10D also uses); §1.3 `g₂(uΛ) = u⁻⁴g₂(Λ)` and the reindexed ℘ series; §1.4 `dx/(2y) ↦ dz`; §3.13–3.14 the marked family over ℍ with fibre multiplier `(cτ+d)⁻¹` and `openLevelUniformization` `Γ₁(N)\ℍ → Y₁(N)^an` through `v₁(τ) = (E_τ, 1/N)`; §4.8 `tateAndCuspParameterAgreement` with `du/u = 2πi dz`; §7.1 `hodgeLineAutomorphy` (pullback of dz′ is `dz/(cτ+d)`). EllipticPeriods §2.4 (open pull request, `roadmaps show --pr 1059`) plans `g₂ = (4π⁴/3)E₄(τ)`, `g₃ = (8π⁶/27)E₆(τ)` from `G_k = 2ζ(k)E_k`. Three roadmaps already consume those sections as the owner: ComplexMultiplicationAndExplicitReciprocity's supplier table ("Elliptic complex uniformization … ModularCurvesPartII §§1.1–1.5, 3.14 and 6.1"), EllipticCurvePeriodsAndModularParametrizations (§1, "it does not reconstruct the uniformization") and EllipticIntegrals ("They belong to the lattice roadmaps"). This roadmap cannot cite ModularCurvesPartII: it is later in the merge order (ModularForms is on main) and its contract section "TauCetiRoadmap ModularForms" consumes Layers 10A–10C, 2–8 of this roadmap, so the citation would be upward and a cycle. AlgebraicModularFormsAndSerreWeights §1.5 at its open head consumes ComplexComparisonPartII and ModularCurvesPartII §§4.4, 7.1–7.1a, not §10D, so the Downstream sentence describes no existing consumer.

**Repair:** Choose one and make the README say it. (a) Keep §10D as the owner, since a notion needed from a later roadmap moves down: in Scope name ModularCurvesPartII §§1.1, 1.3, 1.4, 3.13–3.14, 4.8 and 7.1 and EllipticPeriods §2.4 as plans of the same objects that are to consume §10D (the conventions already agree: the same normalised curve, the same marked point 1/N, the same frame 2πi du and multiplier (cz+d)⁻¹, so the repointing is by citation only); under Downstream consumers replace the AlgebraicModularFormsAndSerreWeights sentence by those sections, with AlgebraicModularFormsAndSerreWeights §1.5 reaching §10D through ModularCurvesPartII §7.1. The move is recorded below for the intake. (b) Keep this roadmap at analytic carriers: restrict `rationalCuspFormSpan` and `existsUniqueGaloisConjugate` to `2 ≤ k` (the Hecke-pairing route through the pinned `TauCeti.isIntegral_heckeTCuspNat`, `HeckeSlash/Finite.lean:154`, which has `2 ≤ k`), delete §10D and the weight-one headlines, and move §8.0 with them to a Part II placed after ModularCurvesPartII and EllipticPeriods, consuming those sections. Under (a) the instance f = η(z)η(23z), σ ∈ Aut(ℂ) is covered by §10D's algebraicity; under (b) it is outside the stated range.

## R02 (P3) — The Tate curve is cited over a base its supplier does not state

**Location:** `TauCetiRoadmap/ModularForms/README.md:244` ("Layer 10 supplies the Tate curve over ℤ((q)) with its subgroup schemes") and `README.md:631–633`.

**Claim:** ModularCurves Layer 10 supplies the Tate curve over ℤ((q)).

**Witness:** `TauCetiRoadmap/ModularCurves/README.md:2244–2246` builds "the groups T[N] and the Tate curve over ℤ[1/N]((q)) with its subgroup schemes and [Γ₀(N)]-structures", under the layer's standing hypothesis "N ≥ 5 prime" (`README.md:2120–2127`). Deligne–Serre's curve over ℤ((q)) (deligne-serre line 178) is a different statement.

**Repair:** Write "the Tate curve over ℤ[1/N]((q)), for the prime N ≥ 5 of that layer, whose coefficient series lie in ℤ[[q]] and do not depend on N" in both places, and base-change from ℤ[1/N]((q)) to K((q)) (K has characteristic zero, so 1/N ∈ K). The μ_N-embedding for every N ≥ 1 stays a target of §8.0, as written.

## Verified sound

**Gate and Lean.** The worker's gate is all zero (`set_option=0 … depcheck=0 … stray-files=0 … build=0 OK`). My rerun of the dependency check printed `depcheck: 204 roadmaps, 1686 edges, 0 problem(s)`, no UPWARD, CYCLE or moved line. `lake env lean TauCetiRoadmap/ModularForms/Suggested.lean` exits 0 with exactly ten `declaration uses sorry` warnings (lines 38, 47, 60, 69, 76, 82, 89, 103, 115, 126). One-tactic probe: a scratch copy with every `sorry` replaced by `simp` fails on all ten, so nothing closes in one tactic; no declaration restates a definition, mirrors a Check or computes a value. The ten elaborated types (signatures file) were compared with the README statements: `crossLevelStrongMultiplicityOne` carries `1 ≤ k`, `S` and both `NeZero`; `modularFormAbscissaLeWeight` `0 < k`; `rationalCuspFormSpan` and `existsUniqueGaloisConjugate` `1 ≤ k`; `eichlerSelbergTrace` `4 ≤ k`, `Even k`, `NeZero n`; `newspaceDimension` and `existsCoefficientTwist` all integer weights; no binder lost. The Lean diff since the previous head is docstrings only (lines 20–26, 100–102). Outside-folder diff is empty; `STATUS.md`, `PROGRESS.md`, `metadata.toml` are the generated files on main. No `lemma`, `set_option`, LaTeX delimiter, process word or pull-request number in the folder.

**Headline theorems.** The README names ten: arbitrary-rank Hecke polynomiality, cross-level strong multiplicity one, the noncuspidal abscissa, rational span, weight-one coefficient field and integrality, Galois conjugates, coefficient twists, the newspace dimension and the level-one trace formula; all ten are stated. Not statable and so named in the module docstring: the dimension formulas and analytic Riemann–Roch (no compactified quotient, line bundles or coherent cohomology at the pins), the p-adic Hecke comparison (no integral p-adic Hecke-pair carrier), the arithmetic/analytic comparison and base change (no rule carrier), and the §10D uniformisation and algebraicity (no fine curve Y₁(N) with universal family at the pins; `Mathlib/AlgebraicGeometry/EllipticCurve/` has no modular curve). Padding: none.

**New supplier contracts at the pin.** `PeriodPair.weierstrassP` (`Mathlib/Analysis/SpecialFunctions/Elliptic/Weierstrass.lean:267`), `derivWeierstrassP` (518), `periodic_weierstrassP` (498), `meromorphic_weierstrassP` (907), `order_weierstrassP` (920), `G` (944, `∑' l : L.lattice, (l ^ n)⁻¹`), `g₂ = 60 * L.G 4` (956), `g₃ = 140 * L.G 6` (959), `derivWeierstrassP_sq` (1074, for `z ∉ L.lattice`): as the contract says, and no comparison with the modular Eisenstein series exists there. `WeierstrassCurve.exists_variableChange_of_j_eq` (`Mathlib/AlgebraicGeometry/EllipticCurve/IsomOfJ.lean:331`) under `[IsSepClosed F]` and `[E.IsElliptic] [E'.IsElliptic]` (lines 25, 29): ℂ qualifies. `Equiv.Perm.subgroup_eq_top_of_swap_mem` (`Mathlib/GroupTheory/Perm/Cycle/Type.lean:546`): prime cardinality, `card α ∣ card H`, a swap in H. `Polynomial.dickson` (`Dickson.lean:63`). The 74 contracted declarations of the previous review were not re-opened except the one renamed (R05), which now resolves.

**Cross-roadmap citations resolved.** ModularCurves on main: §0E "Effective descent and spreading out" (line 386), §1C "Pole sheaves, Weierstrass coordinates, and variable changes" (486), §3N "Naive level structures" (905), §4C "Rigidifiers and KM 4.7.0" (1100), §5A "Tate normal form and Y₁(N) for N≥4" (1284: Tate normal form over Spec ℤ[a,b,Δ⁻¹], the closed locus [N]P = 0, affineness, smoothness, relatively finite étale over Ell/ℤ[1/N], no fine representability for N ≤ 3), §§9A–9B (1808, 1880), §9E "The coarse j-line" (2008), Layer 10 (2103; R02); its external uniformisation contract for Y(ρ) at lines 1396–1410 says what the Scope paragraph says. AlgebraicCurves on main lines 1924–1928: the analytic–algebraic genus comparison is excluded from its Layer 12, "gated on GAGA-style work". EllipticCurves on main lines 150–152 and 299–302: complex uniformisation ℂ/Λ ≅ E(ℂ) is left out, "belongs on a dedicated complex-analytic roadmap". FuchsianOrbifolds on main: Layer 3 "cusps and q-coordinates" (263), Layer 4 "compactified quotient Riemann surfaces" (286), Layer 5 (311), Layer 6 (344); its lines 84–88 and 345–346 still assign j to ModularForms, as R03's recorded move expects; NoncongruenceModularForms (open) lines 1267 and 1291 still cite "ModularForms `JInputs`". PolynomialGaloisGroups (Completed): R04. ModularCurvesPartII, EllipticPeriods, ComplexMultiplicationAndExplicitReciprocity, EllipticCurvePeriodsAndModularParametrizations, EllipticIntegrals, AlgebraicModularFormsAndSerreWeights: R01. ModularFormsPartII is in the merge order (line 259) but `roadmaps show` finds no such roadmap on main or in an open pull request. Ownership was searched by object with `roadmaps grep` over the 440 open pull requests and main (`℘`, "complex uniformi", `ℂ/Λ ≅`, `2ζ(2`, `Y₁(N)(ℂ)`, `Γ₁(N)\ℍ ≅`): the hits are those named in R01; AbelianSchemesAndArithmeticModuli A5 (abelian-variety uniformisation, merge order line 41, later than this roadmap) is reached only through ModularCurvesPartII §1.2 and §3.13 and was not read directly.

**Ownership moves recorded for the intake.** (1) The normalized j-function inputs move from ModularForms to FuchsianOrbifolds Layer 6 (unchanged from the previous review). (2) If R01 is repaired by (a): the lattice uniformisation, lattice–modular comparison, moduli bijection for Γ₁(N), complex Tate curve and automorphy of ω move down from ModularCurvesPartII §§1.1, 1.3, 1.4, 3.13–3.14, 4.8, 7.1 and EllipticPeriods §2.4 into ModularForms §10D, and those sections become its consumers.

**Seeded source sample.** deligne-serre (Numdam, cache 65b390f6): §2.1 at lines 127–151; §2.4 with (2.4.1)–(2.4.2) at 167–175 and the unproved identification at 176–177; §2.5 at 178–195 (Tate curve over ℤ((q)), dt/t, the natural μ_N embedding, (2.5.1) at 188, the deferral to Deligne–Rapoport VII §4 at 194–195); (2.6.1) at 199–201 with the descent criterion at 202–205; Proposition 2.7 at 206–220; Remark 2.8 at 221–224. milne-mf (author page, cache 977f06a4): Proposition 3.3 at 1946–1966 (p. 42), Corollary 3.5 at 1972–1973, Proposition 3.10 at 2090–2103 (p. 45, value 2ζ(2k) at infinity), Proposition 3.11 at 2107–2109 (g₂ = 60G₂, g₃ = 140G₃ in Milne's indexing), Proposition 3.12 at 2165–2175 (p. 47, with the deferral of surjectivity to j and the addition-formula remark), Proposition 3.13 at 2176–2184, Lemma 8.7 at 5159–5162 (p. 100, page marker at 5133; full level with Weil-pairing condition, as the README says). popa-zagier (arXiv 1711.00327v2, 56905e98): weights at 63–69, Theorem 1 at 72–75, H conventions with H(0) = −1/12 and H(−u²) = −u/2 at 100–104, Proposition 2 at 197–210, Proposition 3 at 213–224, p_w at 225–227, Corollary 1 at 228–232, equation (4) at 235–242, tr M − tr S = σ_{k−1} at 243. stein (author page, b50e81d4): (5.3.1) with c₀ at 3809–3825 (p. 88), Theorem 5.8 at 3829–3833, Theorem 5.9 at 3834–3835. rhodes-shemanske (author manuscript, da2a014e): Proposition 3.2 at 364–366, §3.2 at 380–402, Lemma 3.3 at 410–411. leanbridge (d441dd13): namespace at 32, quintic at 39, theorem at 701.

**Adversarial pass.** Values computed on each side; "retain" means the instance agrees with the statement as written. Trace-formula and polynomial values were recomputed by a script in scratch (Hurwitz numbers by reduced forms, p_w by the recurrence, factorisations by polynomial gcds modulo p).

| Statement | Instances | Values on the two sides | Result; change |
|---|---|---|---|
| Conventions: Hecke recurrence | Δ, p = 2, 3 | a₂a₃ = (−24)(252) = −6048 = a₆; a₂² − 2¹¹ = −1472 = a₄ | retain |
| Conventions: bad prime | η²η(11z)², p = 11 | a₁₂₁ = 1² − 0·11 = 1; a unit diamond value gives −10 | retain |
| Conventions: FE sign | level 11 k = 2, w = −1; Δ | i²·(−1) = 1; i¹²·1 = 1 | retain |
| 0.1 constant terms | χ odd mod 3, k = 1 | B_{1,χ} = −1/3 (script); a₀ = 1/6 in both orderings; Stein c₀ = 0 for (χ,1) | retain; source issue |
| 0.1 corrected E₂ | t = 2 | (1 − 24q − 72q²) − 2(1 − 24q²) = −1 − 24q − 24q² | retain |
| 1.1 δ and cusp term | Γ₁(5), Δ; level one | widths 1,1,5,5 sum 12; native orbits count regular cusps twice when −I ∉ Γ, mass 24 = 12·24/12; /δ = 12; Δ: ord = 1 = 12/12 | retain |
| 1.1 irregular order | exponents 1, 3 in q_{2h} | 1/2 + 3/2 = 2 = order of exponent 4 | retain |
| 2.1 rank two, p = 2 | T(1,2)² | T(1,4) + 3T(2,2), leading coefficient 1 | retain |
| 2.2 degrees | diag(1,p), pI | p + 1 = 3 at p = 2; 1; (pI)(p⁻¹I) = 1 after localisation (R–S 364–366, 394–395) | retain |
| 3.1 oldspace | N = 11, 22, k = 2 | 11: old 0, new 1; 22: q, q² independent, old 2, new 0 | retain |
| 4.1 primitive associate | Δ(z) + cΔ(2z) | a₁ = 1, a₂ = −24 + c; associate Δ, conductor 1 | retain |
| 5.1 controls | Δ at level 2; 2Δ; f = g = Δ | not new; a₁ = 2 ≠ 1; equal with χ = 1 | retain |
| 6.1 commutation scalar | χ(2) = i mod 5, weight 3 | χ(2)⁻¹(1 + 4i) = 4 − i ≠ 1 + 4i | retain |
| 7.1 abscissa | E₄; weight one | 240ζ(s)ζ(s−3), pole at 4 = k; dyadic Cauchy–Schwarz X^{1/2}·O(X^{1/2}) = O(X) | retain |
| 8.0 normalisation | Δ, dt/t = 2πi du | both give q − 24q²; omitting 2πi scales by (2πi)¹² | retain |
| 8.0 descent | √2Δ; Δ/11 | a₁ = √2 ∉ ℚ; a₁ = 1/11 ∈ ℚ (D–S 202–205) | retain |
| 8.0 cusp-0 structure | ζ ↦ q^{1/N} | point z/N of E_z = Tate point exp(2πiz/N); f|S expansion at S∞ = 0 | retain |
| 8.0 N = 1, M = 4 | f on Γ₁(4) fixed by SL₂(ℤ) | f(i) = i^{−k}f(i): zero unless 4 ∣ k; E₆(i) = 0, Δ(i) ≠ 0 (12 = 4·3) | retain |
| 8.0 N = 2, M = 5 | Γ₁(2) ∩ Γ₁(4); Γ₁(2) ∩ Γ₁(5) | Γ₁(4) ≠ Γ₁(2M); Γ₁(10) = Γ₁(2·5) | retain |
| 8.0 N ≤ 3 descent | rule on Γ₁(N) vs form on Γ₁(NM) | both pullbacks agree ⇔ f∣_kγ = f for γ ∈ Γ₁(N) as functions on ℍ; Γ₁(NM) need not be normal, and the condition is on the avatar, not on a quotient | retain |
| 8.0 surjectivity | f = η(z)η(23z), σ ∈ Aut(ℂ) | σ(f) = avatar of σ(φs^k) by §10D algebraicity, now owned | retain; R01 for ownership |
| 8.1 bounded denominators | Δ/11; fΔ | 11·(Δ/11): a₁ = 1; (q − q² − q³)(q − 24q²) = q² − 25q³; Δ⁻¹ recovers (1, −1) | retain |
| 8.2 norm factors | a = √2; a = 1 | X² − 2; (X − 1)² | retain |
| 9.1 Satake | Δ, p = 2; level 11, p = 11 | X² + 24X + 2048; {1, 0}, product 0 | retain |
| 9.2 twist level | ψ mod m | ψ(n) = Σ_v c_v e(nv/m); (1,v/m;0,1)⁻¹Γ₁(Nm²)(1,v/m;0,1) ⊂ Γ₁(N) | retain; locator present |
| 9.2 depletion | Δ, trivial ψ mod 2 | (1 − V₂U₂)(q − 24q² + 252q³) = q + 252q³, idempotent | retain |
| 9.3 Sturm length | Γ₁(13), k = 2 | B = ⌊2·168/12⌋ = 28 (index 168 by script) | retain |
| 9.3 letters | positions 25, 26 | z, ba | retain |
| 10A genus | Γ₀(11), Γ₀(2), Γ₁(13), level 1 | 1; 0; 1 + 7 − 6 = 2; 0 | retain |
| 10A Γ₁(22) | index, cusps, genus | 360 (script), projective 180; cusps 20; g = 1 + 15 − 10 = 6 | retain |
| 10B Riemann–Roch, Hurwitz | ℙ¹ sheaves; id, z², genus-1 double cover | χ = deg + 1: −1, 0, 1; −2 = −2 + 0, −2 = −4 + 2, 0 = −4 + 4 | retain |
| 10C even/odd weight | level 1 k = 12; Γ(3) k = 3, 1 | M₁₂ = 2, S₁₂ = 1; M₃ = 4, S₃ = 0; M₁ = 2, S₁ = 0 | retain |
| 10C β = μ∗μ | 1, p, p², p³, 6, 12 | 1, −2, 1, 0, 4, −2 (script); (β∗σ₀)(n) = 0 at 2, 4, 8, 16, 6, 12 | retain |
| 10C newspace identity | Γ₀(22); Γ₁(22); Γ₁(13) | 2 − 2 = 0; 6 − 2 = 4; 2 − 0 = 2 | retain |
| 10D lattice–modular | m = 2, 3 | 60·2ζ(4) = 120π⁴/90 = 4π⁴/3; 140·2ζ(6) = 280π⁶/945 = 8π⁶/27 (280/945 = 8/27) | retain |
| 10D discriminant | g₂³ − 27g₃² | (64π¹²/27)(E₄³ − E₆²) = (64π¹²/27)·1728Δ = 4096π¹²Δ = (2π)¹²Δ | retain |
| 10D j-invariant | Mathlib j of a₄ = −g₂/4, a₆ = −g₃/4 | c₄ = −48a₄ = 12g₂, Δ = −16(4a₄³ + 27a₆²) = g₂³ − 27g₃²; 1728·64 = 27·4096 = 110592 (script), j = E₄³/Δ | retain |
| 10D Check without ζ | g₂ = 60E₄, g₃ = 140E₆ | 60³ = 216000, 27·140² = 529200 (script); constant term finite, j has a pole | retain |
| 10D c₄ and Δ rules | (E_z, 2πi du), (E_z, du) | 12g₂/(2πi)⁴ = 16π⁴E₄/16π⁴ = E₄; 16π⁴E₄; (2π)¹²Δ/(2πi)¹² = Δ | retain |
| 10D uniformisation | Y = ℘′/2 | ℘′² = 4℘³ − g₂℘ − g₃ ⇒ Y² = X³ − (g₂/4)X − g₃/4 | retain |
| 10D isomorphisms | Λ_{γz} | ℤ(az+b) + ℤ(cz+d) = Λ_z ⇒ Λ_{γz} = (cz+d)⁻¹Λ_z, α = (cz+d)⁻¹ | retain |
| 10D moduli bijection | marked point | 1/(N(cz+d)) ≡ 1/N mod Λ_{γz} ⇔ (1 − d)/N ∈ ℤ and c/N ∈ ℤ | retain |
| 10D −1 and N | −1 fixes 1/N | 2/N ∈ ℤ + ℤz ⇔ N ∣ 2; −I ∈ Γ₁(N) ⇔ N ∣ 2 | retain |
| 10D order-three point | γ = (1,−1;3,−2), z₀ | tr γ = −1, γ³ = I, a ≡ d ≡ 1, c ≡ 0 mod 3; 3z₀² − 3z₀ + 1 = 0 gives z₀ = 1/2 + i√3/6; ρ = 3z₀ − 2 ∈ Λ, ρz₀ = z₀ − 1 ∈ Λ, (ρ − 1)/3 = z₀ − 1 | retain |
| 10D diamond and S | γ ∈ Γ₀(N); S | (cz+d)/N ≡ d/N; z/N ↦ q^{1/N}, cusp 0 of width N | retain |
| 10D cusp expansions | γ = (a,b;c,d) | F(E_z, (cz+d)/N, du) = (cz+d)^{−k}f(γz) = (f∣_kγ)(z); Tate point ζ^d q^{c/N} | retain |
| 10D Tate curve | Silverman V.1.1 | (2πi)⁻²℘(u) = X(t) + 1/12, dt/t = 2πi du; a₄, a₆ series converge for |q| < 1 | retain (uncertified) |
| 10D degree bound | Γ₁(13) | d = 168/2 = 84; over j = 1728 with ε₂ = 0: 42 points of multiplicity 2 | retain |
| 10D function field | ℂ(j) ⊂ ℂ(Y₁(N)) ⊂ M(X₁(N)^an) | each f ∈ M algebraic of degree ≤ d (Forster §8); a regular g separating a generic fibre has degree ≥ d; equality | retain (Forster uncertified) |
| 10D automorphy of s^an | s = s^an du | du_{γz} ↔ du_z/(cz+d) ⇒ s^an(γz) = (cz+d)s^an(z); f/(s^an)^k invariant | retain |
| 10D section Check | E₄ at level 4, simple pole of s at P | ord_P(E₄/(s^an)⁴) = 4; φs⁴ regular at P | retain |
| 11.1 P_k | k = 12, n = 1 | p₁₀(0,1) = −1, p₁₀(±1,1) = −1, p₁₀(±2,1) = 11 (script) | retain |
| 11.1 class sums | (k,n) = (4,1), (12,1), (12,2), (12,4) | −1, −3, 46, 894; traces 0, 1, −24, −1472 (script) | retain |
| 11.1 formula vs τ | k = 12, n = 1…5 | 1, −24, 252, −1472, 4830 (script) | retain |
| 11.1 other weights | k = 16, 24, 60 at n = 1, 2 | dims 1, 2, 5; tr T₂ = 216, 1080, −449691864 (script) | retain |
| 11.1 k = 2 exclusion | k = 2, n = 1, 2 | −1, −3 vs 0, 0 (script) | retain k ≥ 4 |
| Worked example mod 17, 37, 83 | weight-60 quintic | roots 6, 9, 10 with gcd(F,F′) = X² + X + 9; roots 16, 22, 23, cofactor X² + 30X + 34, disc 24, 24¹⁸ ≡ 36; no root, gcd with X^{83} − X and X^{83²} − X trivial (script) | README correct |
| `existsCoefficientTwist` | m = 1; n = 0 | ψ(0) = 1, a₀(f) = 0; m > 1: ψ(0) = 0 | retain |
| `crossLevelStrongMultiplicityOne` | k ≤ 0 | no `Newform N k`; `1 ≤ k` harmless | retain |
| `existsUniqueGaloisConjugate` | Δ, σ = id | g = Δ, unique by extensionality | retain |
| `newspaceDimension` | k ≤ 0; N = 1 | both sides 0; β(1)·dim S_k with `cuspFormsOld 1 k = ⊥` | retain |

**Build order.** §8.0 (Layer 8) consumes §10D (Layer 10), which consumes §10A, FuchsianOrbifolds Layers 3–4 and ModularCurves only; §10D consumes nothing of Layers 8–9, so there is no cycle, and "How to read the build" (`README.md:265–268`) records the cross-layer proof input, as it does for §9.3 → §10C.

**Checks count.** Every subsection with a definition has at least three discriminating Checks (0.1: 5; 1.1: 4; 2.1: 4; 2.2: 3; 3.1: 3; 4.1: 3; 5.1: 3; 6.1: 4; 7.1: 4; 8.0: 10; 8.1: 5; 8.2: 4; 9.1: 7; 9.2: 4; 9.3: 7; 10A: 4; 10B: 4 + 4 + 3; 10C: 3 + 4 + 4; 10D: 6; 11.1: 7).

## Not verifiable

- Diamond–Shurman (Theorem 1.5.1, §§3.2–3.9, Theorems 3.5.1 and 3.6.1, §§4.5–4.8, 5.2, 5.8–5.9, 6.5), Miyake (Theorem 4.6.19, Corollary 4.6.20, Lemma 4.3.10(2)), Shimura (Theorem 3.20, Proposition 3.64), Atkin–Li (Theorem 3.1), Silverman *Advanced Topics* (Theorem V.1.1), Forster (§8, §§12–19) and Sturm: paywalled or no legal copy, settled as uncertified; every statement attributed to them was checked mathematically in the table.
- Deligne–Rapoport VII §4 was not fetched; the §10D route does not use it.
- AbelianSchemesAndArithmeticModuli A5 and ComplexComparisonPartII were read only through the citations of ModularCurvesPartII and AlgebraicModularFormsAndSerreWeights.
- The LMFDB character-orbit and trace-vector ordering was not compared with §9.3's convention; the README disclaims agreement.

## Source issues

- **Error** in stein at §5.3, display (5.3.1) with Theorem 5.8, printed p.88: the source gives the weight-one constant term as zero whenever the first character is nontrivial; it should be minus one half of the first generalized Bernoulli number of the first character when the second character is trivial, by the symmetry of the weight-one coefficients; affects a stated result (weight one only).
- **Misprint** in rhodes-shemanske at Lemma 3.1, proof, printed p.9: the source calls the map of a group into a coset space a homomorphism with a kernel; it should be a map of sets whose fibre over the identity coset is the stated subgroup; affects nothing.
