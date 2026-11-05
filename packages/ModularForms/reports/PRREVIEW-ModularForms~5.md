# Review of ModularForms (pull request #1706 at 65c1a73)
**Verdict:** accepted

Incremental re-review of the 41 lines changed since ffc0a2f (README only; `Suggested.lean` is byte-identical to the head the previous review read). No finding remains, new or carried.

## Previous findings

- R01 — repaired: `TauCetiRoadmap/ModularForms/README.md:52–58` names "ModularCurvesPartII §§1.1, 1.3, 1.4, 3.13–3.14, 4.8 and 7.1 and EllipticPeriods §2.4" as plans of the same objects, states the direction ("ModularCurvesPartII consumes Layers 2–8 and 10A–10C of this roadmap and EllipticPeriods consumes ModularCurvesPartII") and that "nothing of either is cited here"; `README.md:1334–1340` lists those sections as consumers of §10D and routes AlgebraicModularFormsAndSerreWeights through ModularCurvesPartII §7.1. This is repair (a) of the previous report, by citation only. Every section number, contract and convention named was resolved at the cited head (table and list below); the repair introduced no upward citation (dependency check: 0 problems).
- R02 — repaired: `README.md:252–255`, `README.md:635–638`, `README.md:715–717` now read "the Tate curve over ℤ[1/N₀]((q)) with its subgroup schemes, for the prime level N₀ ≥ 5 of that layer; its coefficient series lie in ℤ[[q]] and do not depend on N₀", base-changed "from ℤ[1/N₀]((q)) to K((q)), which contains 1/N₀ because K has characteristic zero"; `README.md:1165–1166` says "base-changed to ℂ((q)) and evaluated at q". No "ℤ((q))" remains in the file. The new symbol N₀ occurs only in these three passages and does not collide with the level N.

## Verified sound

**Gate and Lean.** The worker's gate at 65c1a73 is all zero (`set_option=0 … depcheck=0 … stray-files=0 … outside-folder=0 … build=0 OK`). My rerun of the dependency check printed `depcheck: 235 roadmaps, 2063 edges, 0 problem(s)`, no UPWARD, CYCLE or moved line; ModularForms is on main and absent from the merge order, ModularCurvesPartII is at line 72 and AlgebraicModularFormsAndSerreWeights at line 86 of it, EllipticPeriods is not listed (placed after its last supplier, ModularCurvesPartII). The new Scope and Downstream mentions of these three roadmaps create no edge, which is what the text claims ("nothing of either is cited here"). `lake env lean TauCetiRoadmap/ModularForms/Suggested.lean` exits 0 with exactly ten `declaration uses sorry` warnings (lines 38, 47, 60, 69, 76, 82, 89, 103, 115, 126). One-tactic probe on a scratch copy with each `sorry` replaced by `simp`: all ten fail (eight "simp made no progress", two "unsolved goals" at lines 52, 118, 136), so nothing closes in one tactic. The ten elaborated signatures in the worker's signatures file are unchanged from the previous review, which compared each with its README statement; no section binder is lost. `git diff --stat origin/main...HEAD` outside the folder is empty.

**Changed passages, read in full.**

- Scope (`README.md:52–58`): the three claims are (i) the same objects are planned in ModularCurvesPartII §§1.1, 1.3, 1.4, 3.13–3.14, 4.8, 7.1 and EllipticPeriods §2.4; (ii) the conventions agree; (iii) the direction of supply is from this roadmap. For (i): ModularCurvesPartII at its open head (07e21ad) has §1.1 "The normalized lattice Weierstrass model" (`latticeUniformization`), §1.3 "Homotheties and lattice isogenies", §1.4 "Invariant differentials and periods", §3.13 "The marked torus family over the upper half-plane", §3.14 "Open modular uniformization with the specified level" (`openLevelUniformization`, `Γ₁(N)\H → Y₁(N)^an`), §4.8 "Tate and analytic cusp parameters" (`tateAndCuspParameterAgreement`), §7.1 "The Hodge line and the automorphy factor" (`hodgeLineAutomorphy`); EllipticPeriods at its open head (ceceba6) has §2.4 "The Eisenstein dictionary" with `g₂ = (4π⁴/3) E₄(τ)`, `g₃ = (8π⁶/27) E₆(τ)`. For (ii): table rows 1–2. For (iii): ModularCurvesPartII's "TauCetiRoadmap ModularForms" contract cites ModularForms Layers 10A, 10B, 10C, 2, 3, 4, 5, 8, 8G and 6 (its `*Needs:*` lines cite Layer 10A seven times, 10B four, 10C two, 2 seven, 3 one, 4 four, 5 two, 6 five, 8 ten, 8G three; Layer 7 is not cited, so "Layers 2–8" is a range, not a list; the cycle argument needs only one of them). EllipticPeriods has a contract section "From ModularCurvesPartII" and says the dependence is one-way (ModularCurvesPartII first). So a citation of either from here would be a cycle, and the README cites neither.
- From ModularCurves contract and §8.0 (`README.md:252–255`, `635–638`, `715–717`): ModularCurves on main (a0ad405) Layer 10 item 2 (`README.md:2244–2246`) builds "the groups T[N] and the Tate curve over ℤ[1/N]((q)) with its subgroup schemes and [Γ₀(N)]-structures" under the layer's standing hypothesis "`N ≥ 5` prime" (`README.md:2120–2128`). Table row 3 for the coefficient series and the base change.
- §10D complex Tate curve (`README.md:1165–1169`): table row 4; the locator deligne-serre lines 168–194 was re-read (§2.4 at 167–177: (2.4.1) f(z) = f(E_z, 1/N, 2πi du) and (2.4.2) with dt/t over ℂˣ/qℤ; §2.5 at 178–188: the Tate curve over ℤ((q)) by reference to Deligne–Rapoport VII §1, dt/t, the natural embedding of μ_N, (2.5.1) at 188; the comparison with (2.4.2) deferred to Deligne–Rapoport VII §4 at 194–195). The README's base-change wording now matches: Deligne–Serre's curve is over ℤ((q)) ⊗ R by extension of scalars (line 183–184), and here the extension is from ℤ[1/N₀]((q)).
- Downstream consumers (`README.md:1334–1340`): each object attributed to §10D is in §10D: homogeneity/homotheties `README.md:1134`, moduli bijection `README.md:1162`, complex Tate curve `README.md:1165`, frame dt/t = 2πi du `README.md:1168`, automorphy `README.md:1186–1188`, differential dictionary (ω trivialised by du, transition (cz+d)⁻¹) `README.md:1208–1209`. AlgebraicModularFormsAndSerreWeights at its open head (364af81): its supplier table lists "ModularForms Layers 0, 4–5, 8, 8G, 8W, 10C" and "ModularCurvesPartII §§4.1–4.4, 7.1"; its §1.5 "All-weight analytic comparison" has `*Needs:* … ModularCurvesPartII §§4.4, 7.1–7.1a; ModularForms Layer 0; ModularForms Layer 10`. So "consumes the rational coefficient theory of Layer 8 and reaches §10D through ModularCurvesPartII §7.1" is what that roadmap says. (Its "Layer 8W" has no counterpart in this README; that is a citation of the consumer's own, outside this folder.)

**Seeded sample.** Of the fifteen sampled targets only "8.0 Characteristic-zero arithmetic forms and analytic comparison" falls in the diff; its locators were re-read as above (deligne-serre lines 127–151 for §2.1, 167–195 for §§2.4–2.5). The other fourteen are untouched since ffc0a2f and stand as verified in the previous report (deligne-serre, milne-mf, popa-zagier, stein, rhodes-shemanske at the line numbers given there).

**Ownership moves recorded for the intake** (unchanged in substance from the previous report): (1) the normalized j-function inputs move from ModularForms to FuchsianOrbifolds Layer 6; (2) the lattice uniformisation, lattice–modular comparison, moduli bijection for Γ₁(N), complex Tate curve and automorphy of ω are owned by ModularForms §10D, and ModularCurvesPartII §§1.1, 1.3, 1.4, 3.13–3.14, 4.8, 7.1 and EllipticPeriods §2.4 become its consumers; the README now records this.

**Adversarial pass.** New rows 1–6 are for the changed statements; every later row is carried from the review at ffc0a2f (its table, unchanged statements, same values).

| Statement | Instances | Values on the two sides | Result; change |
|---|---|---|---|
| Scope: conventions agree with ModularCurvesPartII | curve, marked point, frame, multiplier | §10D: Y² = X³ − (g₂/4)X − g₃/4; MCP2 §1.1: a₄ = −g₂/4, a₆ = −g₃/4. §10D: α_z(exp(2πi/N)) = 1/N; MCP2 §3.14: v₁(τ) = (E_τ, 1/N). §10D: dt/t = 2πi du; MCP2 §4.8: du_c/u_c = 2πi dz_c, §7.1: frame 2πi dz = du/u. §10D: u ↦ u/(cz+d) pulls du to (cz+d)⁻¹du; MCP2 §7.1: dz′ pulls back to dz/(cτ+d) | agree; retain |
| Scope: EllipticPeriods §2.4 constants | g₂, g₃ | EP: 60·π⁴/45 = 4π⁴/3, 140·2/945 = 8/27; §10D: 60·2ζ(4) = 120π⁴/90 = 4π⁴/3, 140·2ζ(6) = 280π⁶/945 = 8π⁶/27 | agree; retain |
| Tate curve base ℤ[1/N₀]((q)) → K((q)) | n = 1…5; N₀ = 5; N = 1, N₀ | a₄ = −5Σσ₃(n)qⁿ = −5q − 45q² − 140q³ − 365q⁴ − 630q⁵; a₆ = −Σ(5σ₃(n)+7σ₅(n))/12 qⁿ = −q − 23q² − 154q³ − 647q⁴ − 1876q⁵, with 5σ₃(n)+7σ₅(n) ≡ 0 mod 12 at each n: integral, no N₀. 1/5 ∈ K since 5 ≠ 0 in characteristic zero. μ₁ ↪ T[1] trivial; μ_{N₀} is the curve's own μ_{N₀} ⊂ T[N₀] | retain |
| §10D complex Tate curve normalisation −1/12 | q = 0 (row m = 0 of ℘); convergence | Σ_{n∈ℤ}(u+n)⁻² − 2ζ(2) = π²/sin²(πu) − π²/3, so (2πi)⁻²℘ − 1/12 = −1/(4sin²πu); X_Tate at q = 0 is t/(1−t)² = e^{2πiu}/(−4e^{2πiu}sin²πu) = −1/(4sin²πu): equal. σ₃(n) < 1.21n³, σ₅(n) < 1.04n⁵, so both series converge for |q| < 1 | retain |
| Downstream: objects attributed to §10D exist there | six objects | lines 1134, 1162, 1165, 1168, 1186–1188, 1208–1209 as listed above | retain |
| Direction of supply | ModularCurvesPartII, EllipticPeriods, AlgebraicModularFormsAndSerreWeights | MCP2 cites ModularForms Layers 2, 3, 4, 5, 6, 8, 8G, 10A, 10B, 10C (45 citations); EP has a "From ModularCurvesPartII" contract; AMF cites ModularForms Layers 0, 4–5, 8, 8G, 10C and MCP2 §7.1; this README's depcheck: 0 problems | retain |
| Conventions: Hecke recurrence | Δ, p = 2, 3 | a₂a₃ = (−24)(252) = −6048 = a₆; a₂² − 2¹¹ = −1472 = a₄ | carried; retain |
| Conventions: bad prime | η²η(11z)², p = 11 | a₁₂₁ = 1² − 0·11 = 1; a unit diamond value gives −10 | carried; retain |
| Conventions: FE sign | level 11 k = 2, w = −1; Δ | i²·(−1) = 1; i¹²·1 = 1 | carried; retain |
| 0.1 constant terms | χ odd mod 3, k = 1 | B_{1,χ} = −1/3; a₀ = 1/6 in both orderings; Stein c₀ = 0 for (χ,1) | carried; retain; source issue |
| 0.1 corrected E₂ | t = 2 | (1 − 24q − 72q²) − 2(1 − 24q²) = −1 − 24q − 24q² | carried; retain |
| 1.1 δ and cusp term | Γ₁(5), Δ; level one | widths 1,1,5,5 sum 12; mass 24 = 12·24/12; /δ = 12; Δ: ord = 1 = 12/12 | carried; retain |
| 1.1 irregular order | exponents 1, 3 in q_{2h} | 1/2 + 3/2 = 2 = order of exponent 4 | carried; retain |
| 2.1 rank two, p = 2 | T(1,2)² | T(1,4) + 3T(2,2), leading coefficient 1 | carried; retain |
| 2.2 degrees | diag(1,p), pI | p + 1 = 3 at p = 2; 1; (pI)(p⁻¹I) = 1 after localisation | carried; retain |
| 3.1 oldspace | N = 11, 22, k = 2 | 11: old 0, new 1; 22: q, q² independent, old 2, new 0 | carried; retain |
| 4.1 primitive associate | Δ(z) + cΔ(2z) | a₁ = 1, a₂ = −24 + c; associate Δ, conductor 1 | carried; retain |
| 5.1 controls | Δ at level 2; 2Δ; f = g = Δ | not new; a₁ = 2 ≠ 1; equal with χ = 1 | carried; retain |
| 6.1 commutation scalar | χ(2) = i mod 5, weight 3 | χ(2)⁻¹(1 + 4i) = 4 − i ≠ 1 + 4i | carried; retain |
| 7.1 abscissa | E₄; weight one | 240ζ(s)ζ(s−3), pole at 4 = k; dyadic Cauchy–Schwarz O(X) | carried; retain |
| 8.0 normalisation | Δ, dt/t = 2πi du | both give q − 24q²; omitting 2πi scales by (2πi)¹² | carried; retain |
| 8.0 descent | √2Δ; Δ/11 | a₁ = √2 ∉ ℚ; a₁ = 1/11 ∈ ℚ | carried; retain |
| 8.0 cusp-0 structure | ζ ↦ q^{1/N} | point z/N of E_z = Tate point exp(2πiz/N); f|S expansion at S∞ = 0 | carried; retain |
| 8.0 N = 1, M = 4 | f on Γ₁(4) fixed by SL₂(ℤ) | f(i) = i^{−k}f(i): zero unless 4 ∣ k; E₆(i) = 0, Δ(i) ≠ 0 | carried; retain |
| 8.0 N = 2, M = 5 | Γ₁(2) ∩ Γ₁(4); Γ₁(2) ∩ Γ₁(5) | Γ₁(4) ≠ Γ₁(2M); Γ₁(10) = Γ₁(2·5) | carried; retain |
| 8.0 N ≤ 3 descent | rule on Γ₁(N) vs form on Γ₁(NM) | both pullbacks agree ⇔ f∣_kγ = f for γ ∈ Γ₁(N) on ℍ | carried; retain |
| 8.0 surjectivity | f = η(z)η(23z), σ ∈ Aut(ℂ) | σ(f) = avatar of σ(φs^k) by §10D algebraicity; ownership now recorded | carried; retain |
| 8.1 bounded denominators | Δ/11; fΔ | 11·(Δ/11): a₁ = 1; (q − q² − q³)(q − 24q²) = q² − 25q³ | carried; retain |
| 8.2 norm factors | a = √2; a = 1 | X² − 2; (X − 1)² | carried; retain |
| 9.1 Satake | Δ, p = 2; level 11, p = 11 | X² + 24X + 2048; {1, 0}, product 0 | carried; retain |
| 9.2 twist level | ψ mod m | ψ(n) = Σ_v c_v e(nv/m); (1,v/m;0,1)⁻¹Γ₁(Nm²)(1,v/m;0,1) ⊂ Γ₁(N) | carried; retain |
| 9.2 depletion | Δ, trivial ψ mod 2 | (1 − V₂U₂)(q − 24q² + 252q³) = q + 252q³, idempotent | carried; retain |
| 9.3 Sturm length | Γ₁(13), k = 2 | B = ⌊2·168/12⌋ = 28 | carried; retain |
| 9.3 letters | positions 25, 26 | z, ba | carried; retain |
| 10A genus | Γ₀(11), Γ₀(2), Γ₁(13), level 1 | 1; 0; 1 + 7 − 6 = 2; 0 | carried; retain |
| 10A Γ₁(22) | index, cusps, genus | 360, projective 180; cusps 20; g = 1 + 15 − 10 = 6 | carried; retain |
| 10B Riemann–Roch, Hurwitz | ℙ¹ sheaves; id, z², genus-1 double cover | χ = deg + 1: −1, 0, 1; −2 = −2 + 0, −2 = −4 + 2, 0 = −4 + 4 | carried; retain |
| 10C even/odd weight | level 1 k = 12; Γ(3) k = 3, 1 | M₁₂ = 2, S₁₂ = 1; M₃ = 4, S₃ = 0; M₁ = 2, S₁ = 0 | carried; retain |
| 10C β = μ∗μ | 1, p, p², p³, 6, 12 | 1, −2, 1, 0, 4, −2; (β∗σ₀)(n) = 0 at 2, 4, 8, 16, 6, 12 | carried; retain |
| 10C newspace identity | Γ₀(22); Γ₁(22); Γ₁(13) | 2 − 2 = 0; 6 − 2 = 4; 2 − 0 = 2 | carried; retain |
| 10D lattice–modular | m = 2, 3 | 60·2ζ(4) = 4π⁴/3; 140·2ζ(6) = 8π⁶/27 | carried; retain |
| 10D discriminant | g₂³ − 27g₃² | (64π¹²/27)·1728Δ = (2π)¹²Δ | carried; retain |
| 10D j-invariant | Mathlib j of a₄ = −g₂/4, a₆ = −g₃/4 | c₄ = 12g₂, Δ = g₂³ − 27g₃², j = E₄³/Δ | carried; retain |
| 10D Check without ζ | g₂ = 60E₄, g₃ = 140E₆ | 60³ = 216000, 27·140² = 529200; j has a pole | carried; retain |
| 10D c₄ and Δ rules | (E_z, 2πi du), (E_z, du) | E₄; 16π⁴E₄; Δ | carried; retain |
| 10D uniformisation | Y = ℘′/2 | ℘′² = 4℘³ − g₂℘ − g₃ ⇒ Y² = X³ − (g₂/4)X − g₃/4 | carried; retain |
| 10D isomorphisms | Λ_{γz} | Λ_{γz} = (cz+d)⁻¹Λ_z, α = (cz+d)⁻¹ | carried; retain |
| 10D moduli bijection | marked point | 1/(N(cz+d)) ≡ 1/N mod Λ_{γz} ⇔ (1 − d)/N ∈ ℤ and c/N ∈ ℤ | carried; retain |
| 10D −1 and N | −1 fixes 1/N | 2/N ∈ ℤ + ℤz ⇔ N ∣ 2 | carried; retain |
| 10D order-three point | γ = (1,−1;3,−2), z₀ | tr γ = −1, γ³ = I; z₀ = 1/2 + i√3/6; (ρ − 1)/3 = z₀ − 1 | carried; retain |
| 10D diamond and S | γ ∈ Γ₀(N); S | (cz+d)/N ≡ d/N; z/N ↦ q^{1/N}, cusp 0 of width N | carried; retain |
| 10D cusp expansions | γ = (a,b;c,d) | F(E_z, (cz+d)/N, du) = (f∣_kγ)(z); Tate point ζ^d q^{c/N} | carried; retain |
| 10D degree bound | Γ₁(13) | d = 84; over j = 1728: 42 points of multiplicity 2 | carried; retain |
| 10D function field | ℂ(j) ⊂ ℂ(Y₁(N)) ⊂ M(X₁(N)^an) | degrees ≤ d and ≥ d; equality | carried; retain (Forster uncertified) |
| 10D automorphy of s^an | s = s^an du | s^an(γz) = (cz+d)s^an(z); f/(s^an)^k invariant | carried; retain |
| 10D section Check | E₄ at level 4, simple pole of s at P | ord_P(E₄/(s^an)⁴) = 4 | carried; retain |
| 11.1 P_k | k = 12, n = 1 | p₁₀(0,1) = −1, p₁₀(±1,1) = −1, p₁₀(±2,1) = 11 | carried; retain |
| 11.1 class sums | (4,1), (12,1), (12,2), (12,4) | −1, −3, 46, 894; traces 0, 1, −24, −1472 | carried; retain |
| 11.1 formula vs τ | k = 12, n = 1…5 | 1, −24, 252, −1472, 4830 | carried; retain |
| 11.1 other weights | k = 16, 24, 60 at n = 1, 2 | dims 1, 2, 5; tr T₂ = 216, 1080, −449691864 | carried; retain |
| 11.1 k = 2 exclusion | k = 2, n = 1, 2 | −1, −3 vs 0, 0 | carried; retain k ≥ 4 |
| Worked example mod 17, 37, 83 | weight-60 quintic | roots 6, 9, 10; roots 16, 22, 23, disc 24; no root mod 83 | carried; README correct |
| `existsCoefficientTwist` | m = 1; n = 0 | ψ(0) = 1, a₀(f) = 0; m > 1: ψ(0) = 0 | carried; retain |
| `crossLevelStrongMultiplicityOne` | k ≤ 0 | no `Newform N k`; `1 ≤ k` harmless | carried; retain |
| `existsUniqueGaloisConjugate` | Δ, σ = id | g = Δ, unique by extensionality | carried; retain |
| `newspaceDimension` | k ≤ 0; N = 1 | both sides 0; β(1)·dim S_k with `cuspFormsOld 1 k = ⊥` | carried; retain |

**Headline theorems, padding, Checks, build order, library declarations.** Unchanged since ffc0a2f: the ten headlines are stated, the not-statable ones are named in the module docstring, the probe above shows no padding, every definition keeps at least three Checks, §8.0 → §10D → §10A creates no cycle (§10D consumes nothing of Layers 8–9), and the 78 contracted Mathlib and Tau Ceti declarations opened in the previous reviews were not re-opened because no line citing them changed.

**Source issues of the previous report.** The stein (5.3.1) weight-one constant term and the rhodes-shemanske Lemma 3.1 wording were recorded at ffc0a2f; no changed line cites either passage, so they were not re-opened and are not repeated below.

**Lean names.** The citation tool's single lead, `LeanBridge.QExpansion.LMFDB.W60.identifies_lmfdb_1_60_a_orbit` at `README.md:1375`, is a declaration of the LeanBridge source (leanbridge line 701, `theorem identifies_lmfdb_1_60_a_orbit`), not of the pinned libraries; the line is unchanged and the citation resolves.

## Not verifiable

- Silverman, *Advanced Topics*, Theorem V.1.1 (settled uncertified): the complex Tate curve identity cited at `README.md:1168–1169` was checked instead at q = 0 (table row 4) and against deligne-serre lines 178–195.
- Deligne–Rapoport VII §§1 and 4, to which deligne-serre lines 178 and 194–195 refer for the Tate curve and the comparison with (2.4.2): not fetched; the §10D route proves the comparison itself and does not cite them.
- The other uncertified sources (Diamond–Shurman, Miyake, Shimura, Atkin–Li, Forster, Sturm) are untouched by the diff and stand as in the previous report.
- Ownership against open pull requests was checked only for the three roadmaps the changed passages name (ModularCurvesPartII #913, EllipticPeriods #1059, AlgebraicModularFormsAndSerreWeights #928) and, through the previous report, the object search over the open index; no new object was introduced by the diff.

## Source issues

- none
