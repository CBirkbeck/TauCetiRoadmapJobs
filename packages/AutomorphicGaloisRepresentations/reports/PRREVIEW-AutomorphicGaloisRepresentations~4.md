# Review of AutomorphicGaloisRepresentations (pull request #1007 at c84c1be)

**Verdict:** needs changes

There are four findings, all P3; none is blocking. The gate passes and the dependency check is clean. All six findings of the previous review are repaired.

## R01 (P3) — Eight backticked Lean names are attributed to suppliers that do not declare them

**Location:** `TauCetiRoadmap/AutomorphicGaloisRepresentations/README.md`:
- lines 291 and 1696: `quaternionEigenformGaloisCompatibility`, cited to HilbertModularVarietiesAndShimuraCurves R18.3.29;
- lines 291 and 2825: `ramifiedSign_independentOfEigenform`, cited to its R18.3.32;
- lines 522, 531, 3002 and 3103: `AutomorphicSystemData`; lines 541, 3052 and 3120: `ArithmeticCompatibleFamily`; both cited to SmallRamificationAndAbelianVarietyBaseCases §5.0d;
- lines 538–539: `GL2TypeAction.isogeny` and `GL2TypeAction.baseChange`, cited to its §5.1;
- line 1784: `Spherical.glnPolynomial 2 q ![1, t, s]`, cited to IntegralHeckeAndGaloisDeterminants §3a.1;
- lines 2800–2802: “The generic theorem is the existing `Determinant.exists_ofMatrix_eq_of_henselian` of TauCetiRoadmap.IntegralHeckeAndGaloisDeterminants §1.3.”

**Claim:** Each name reads as a declaration of the cited supplier. None of them is declared there:
- not in the supplier's README or Suggested.lean at its open head (HilbertModularVarietiesAndShimuraCurves cd70693, SmallRamificationAndAbelianVarietyBaseCases c03aea7, IntegralHeckeAndGaloisDeterminants 0609cf2);
- not in the pinned Mathlib or Tau Ceti.

The cited sections exist and contain the mathematics used here, so nothing is unowned; this is a locator defect. “Existing” at line 2800 is also false: no henselian reconstruction is declared anywhere yet.

**Witness:** `roadmaps grep --fixed` finds each of the eight names only in this README, or in AutomorphicGaloisRepresentationsPartII's copy of the same attribution. IntegralHeckeAndGaloisDeterminants plans its §1.3 reconstruction as `Determinant.exists_realization_of_henselian` (its README line 2201).

**Repair:** Cite each item by section and target heading, without the backticked names:
- **Lines 291 and 1696:** “R18.3.29, *Early rank-two eigensystem realisation and local compatibility*”. At line 1696, write “the literal fraction-field representation `ρ_f` of R18.3.29”.
- **Lines 291 and 2825:** “R18.3.32, *Fixed ramified signs throughout a localized eigensystem*”.
- **`AutomorphicSystemData`:** “the shared raw compatible-system carrier of §5.0d”.
- **`ArithmeticCompatibleFamily`:** “§5.0d's arithmetic compatible family (its rank-two specialization over ℚ)”. In the API bullet at line 3103, drop the backticks.
- **Lines 538–539:** “§5.1's isogeny and base-change transports of marked data”. These are that section's two bullets, at its README lines 2144 and 2147.
- **Line 1784:** “§3a.1's integral GLₙ Hecke polynomial at `n=2`, `X²−tX+qs`”.
- **Lines 2800–2802:** “the henselian irreducible reconstruction of IntegralHeckeAndGaloisDeterminants §1.3, planned there as `Determinant.exists_realization_of_henselian`”, and delete “existing”.
- **Lines 44–45 and 227–228:** these two theorems do exist at the pinned Tau Ceti. Give their full names, `TauCeti.ClassFieldTheory.localCyclotomicCharacter_artinMap_unit` and `TauCeti.ClassFieldTheory.localCyclotomicCharacter_artinMap_uniformizer`, and their file, `TauCeti/NumberTheory/ClassFieldTheory/Local/ExplicitCyclotomicSymbol/ArtinMap.lean` (lines 311 and 438).

**Tested:**
- Every replacement heading exists at the cited head:
  - HilbertModularVarietiesAndShimuraCurves README lines 3971 and 4327;
  - SmallRamificationAndAbelianVarietyBaseCases README lines 1980, 2120, 2144 and 2147;
  - IntegralHeckeAndGaloisDeterminants README lines 1612 and 2191.
- The §3a.1 formula `Σ(−1)^i q^{i(i−1)/2} T_i X^{n−i}` at `n=2` gives `X²−T₁X+qT₂`, which is the README's `X²−tX+qs`.
- `#check` of both full Tau Ceti names elaborates at the pin.

## R02 (P3) — Layer 2 §§2.1–2.9 restate steps owned by AlgebraicModularFormsAndSerreWeights §§6.3–6.4

**Location:** `README.md`, lines 1324–1452. For example, §2.1 (line 1326) reads “Use R15.5A.2a's conjugate weight-one prime-moment bound … for real `s>1` tending to 1.”
- §§2.1–2.3 and §§2.5–2.9 each open with “Use R15.5A.x's …” and add only a Deligne–Serre locator.
- §2.4 defines Condition `C`. Only §2.5's restatement of the supplier's bound uses it.

**Claim:** These nine subsections are not targets of this roadmap. AlgebraicModularFormsAndSerreWeights R15.5A.2a (its §6.3) and R15.5A.3 (its §6.4) own all of the following:
- the conjugate prime-moment bound and the finite eigenvalue set off a set of small upper density;
- the Deligne–Serre 7.2 image bound under `C(η,M)`;
- prime-to-order lifting;
- the characteristic-zero lift;
- irreducibility;
- the Artin attachment.

Line 376 of this README already says so (“Layer 2 uses these interfaces”). The README standard requires a target that exists elsewhere to be deleted and listed as a deferral, not kept as a stub. The stubs already mislead downstream: ArtinRepresentations (README line 1795) consumes “the Deligne–Serre attachment of AutomorphicGaloisRepresentations §2.10”.

**Witness:** AlgebraicModularFormsAndSerreWeights at 364af81:
- README line 1448, §6.3: the moment bound and the upper-density finite set;
- README line 1478, §6.4, which says the uniform finite-image bound and prime-to-order integral lifting are the key finite-group steps there.

**Repair:**
- Delete §§2.1–2.9 and the Condition `C` paragraph of Layer 2's Examples.
- Move their Deligne–Serre locators into the R15.5A.2a–R15.5A.3 contract at line 376: Prop. 5.1 and 5.2, pp. 518–519; Prop. 5.5 and Remark 5.6, pp. 519–520; §7.1 and Prop. 7.2, p. 524; §§8.2–8.7, pp. 525–527.
- Keep §2.10 under that number, since other roadmaps cite it. Restrict it to its own comparison (the same-Frobenius dual polynomial and the `k=1` specialization of §1.5), and say there that the attachment is AlgebraicModularFormsAndSerreWeights §6.4.
- Adjust “How to read the build” (lines 649–650) and Layer 2's Dependencies to match.

**Tested:** a search of main and all open heads for citations of “AutomorphicGaloisRepresentations §2.” and “Layer 2” finds only §2.10, in GL2ModularityLifting (README line 2190) and ArtinRepresentations (line 1795). No citation breaks.

## R03 (P3) — §§5.2 and 6.4 state all-weight results with locators that prove less

**Location:**
- §6.4 (lines 2605 and 2609) states that for “a classical `k≥2` newform of level `N`, the Artin conductor away from `ℓ` is the prime-to-`ℓ` part of `N`”, with the local shapes. Its sources are DDT Theorem 3.1(d)–(e), p. 86, and Carayol 0.8 Corollaire, p. 411.
- §5.2 (lines 2444 and 2448) states, “For every classical `k≥2` at `p∤N`, identify `D_cris` … No ordinarity or Fontaine–Laffaille range is required”. Its source is Scholl Theorem 1.2.4, p. 2.

**Claim:**
- DDT Theorem 3.1 concerns weight-two newforms.
- Carayol 0.8 is the case `F=ℚ`, `k=2`.
- Scholl 1.2.4(ii), the crystalline part, assumes `p≥w` (his Remark 1.2.5).

Both statements are true; I recomputed §6.4's local shapes from Carayol's Théorème (A) for every `k` (see the table). But the cited texts support them only in weight two, and only for `p≥k`, respectively.

**Witness:**
- DDT line 3171: Theorem 3.1(a) has polynomial `X²−a_pX+pψ(p)`, the weight-two case.
- Carayol line 100: 0.8 applies Theorem (A) only “dans le cas particulier où F=Q et k=2”.
- Scholl line 127: (ii) assumes “p⁄| n (and p≥w)”.

**Repair:**
- **§6.4:** add Carayol Théorème (A), printed pp. 410–411, with 0.5 on p. 410, as the source for every `k≥2` (`F=ℚ`, so no parity or discrete-series hypothesis applies). Label DDT 3.1(d)–(e) and Carayol 0.8 as the weight-two case.
- **§5.2:** restrict the Scholl locator to `p≥k`. For every `p∤N`, either cite T. Saito, *Modular forms and p-adic Hodge theory*, Invent. Math. 129 (1997), 607–620, Theorem 1, after checking it (it is reference [10] of the Saito supplement this README already cites, SaitoWM line 184), or state that the general case is the classical branch of §4.5, which §5.2 already needs.

**Tested:**
- Carayol lines 86–92: Théorème (A) gives `σ_λ|W_p≅σ(π_p)` at every finite `p` and every `λ` of different residue characteristic, for every `(k,w)`.
- Instance `k=4`, `p∥N`, `p∤cond ψ`, `π_p=St⊗μ`: `Rec(π_p⊗|·|^{−1/2})` has geometric eigenvalues `μ(p)` and `pμ(p)` on `M_f`, so `a_p=μ(p)`. Then `ρ_f|G_p=(χ_uχ_ℓ ∗; 0 χ_u)`, with determinant consistent exactly when `a_p²=ψ′(p)p^{k−2}`, as §6.4 states.

## R04 (P3) — Kisin's *Potentially semi-stable deformation rings* is cited under two page schemes, one of them unverifiable

**Location:**
- References, line 3299: “locators here use the public author DVI: Theorem 2.5.5 pp. 19–20, Theorem 2.7.6 p. 23, §4.1 p. 31 and Theorem 4.3 pp. 32–33.”
- DVI pages are used at lines 1688, 1726, 2005 and 2765. §6.12 (lines 2953–2956) instead cites the JAMS PDF: “Theorem 2.5.5, pp. 530–531, Theorem 2.7.6 and Corollary 2.7.7, p. 534”.
- Separately, §1.1's *Needs:* line (line 1061) lists `ModularCurvesPartII:§§17.1–17.2` twice.

**Claim:** One source carries two page schemes. The sources service finds no legal copy of the DVI (“no legal source found”). The JAMS PDF is open on ams.org and §6.12 already cites it.

**Witness:** In the JAMS extraction (KisinPST):
- §4.1 opens at line 1449, p. 542;
- Theorem (4.3) is at line 1511, p. 543;
- Theorem (2.5.5) is at line 887, p. 530;
- Theorem (2.7.6) is at line 1082, p. 534.

**Repair:**
- Use JAMS pages throughout: §4.1, p. 542; Theorem 4.3, p. 543, with its proof on pp. 543–545; Theorem 2.5.5, pp. 530–531; Theorem 2.7.6 and Corollary 2.7.7, p. 534.
- Point the References entry at the JAMS PDF and drop the DVI sentence.
- Delete the duplicate *Needs:* entry at line 1061.

**Tested:** each JAMS locator above was found in the extraction. The proof of Theorem 4.3 ends before the references (KisinPST line 1625, p. 545).

## Verified sound

### Previous review (round 3)

| Finding | Status at c84c1be |
|---|---|
| R01 (P2), §§0.2a–0.2f re-planned QuaternionicModularForms | **Repaired.** The sections are gone. A “From QuaternionicModularForms” contract (lines 549–589) cites §§0.4, 1.1–1.4, 2.1–2.3, 3.1–3.3, 4.1–4.3 and 5.1–5.3. The Scope (lines 74–83), §0.3's *Needs:* (858–861), the analytic-supplier paragraph (596–598) and Layer 0's Dependencies (1048–1050) were all updated. QuaternionicModularForms at f7ed2fe lists this §0.3 as a consumer (its lines 1405–1406). |
| R02 (P2), R17.3.8a–d redirects | **Repaired.** No “R17.3.8” remains. §0.3 keeps GL2AutomorphicRepresentationsAndTransfer §§R17.3.9 and R16.6.3 (8d94672, lines 1737 and 1304). |
| R03 (P3), four Layer-0 Lean lemmas | **Repaired.** Suggested.lean states only `ordinaryGoodPrimes` and the §7.7 theorem; README lines 659–662 say so. |
| R04 (P3), stale pins | **Repaired.** README lines 195–196 and Suggested.lean lines 12–13 give 1b1ccf4… and 2fd255d…, matching `lake-manifest.json`. |
| R05 (P3), module-system warnings | **Repaired.** The file begins `module`, uses `public import` and wraps its declarations in `@[expose] public section` (lines 1–5 and 43). |
| R06 (P3), locator and Check inside §§0.2a–0.2c | **Moot.** The sections were deleted. |

No finding was marked “not actionable”, so nothing is re-raised.

### Gate, dependencies, Lean

- **Outside-folder diff:** `git diff --stat origin/main...HEAD` outside the folder is empty.
- **Gate:** my rerun reported every check at 0 and `OK`.
- **Dependency check:** `depcheck: 240 roadmaps, 2457 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line.
- **Merge order:**
  - Suppliers come first: IntegralHeckeAndGaloisDeterminants 27, IntegralIwasawaTheory 29, QuaternionicModularForms 70, AlgebraicModularFormsAndSerreWeights 93, GL2AutomorphicRepresentationsAndTransfer 94, SmallRamificationAndAbelianVarietyBaseCases 116, HilbertModularVarietiesAndShimuraCurves 157, SerreWeightAndLevelOptimisation 160, AutomorphicGaloisRepresentationsPartII 161.
  - This roadmap is at 162.
  - Its consumers come later: ClassicalSerreModularity 165, PadicFamilies 168, PotentialModularityAndCompatibleSystems 171, RankOneConverse 372.
  - AutomorphicGaloisRepresentationsPartII does not cite this roadmap; its line 9 says so explicitly.
- **Elaboration:** `lake env lean` on Suggested.lean emits one warning, `declaration uses 'sorry'`, at line 65.
- **Signatures:**
  - `#check @ordinaryGoodPrimes` gives `{N : ℕ} → [NeZero N] → HeckeRing.GL2.Newform N 2 → Set (HeightOneSpectrum (𝓞 ℚ))`.
  - `#check @fixedSquarefreeForm_ordinary_density_one` keeps `[NeZero N]`, `Squarefree N` and `f.χ = 1` and concludes `HasNaturalDensity (ordinaryGoodPrimes f) 1`.
  - Both match README §7.7; no binder was lost.
- **One-tactic probe on a scratch copy:** `simp` made no progress, `rfl` is not definitional, `infer_instance` fails (the goal is not a class), `aesop` made no progress, and `simp_all [ordinaryGoodPrimes]` leaves the goal open. The theorem is not padding, and `ordinaryGoodPrimes` is the one definition its statement needs.

### Seeded source sample

Line numbers refer to the sources service's extractions.

| Target | Source, lines, locator | Result |
|---|---|---|
| 0.1 | ConradLocchar: Def. B.1 at line 1421 (p. 32); Prop. B.3 at 1472 (pp. 33–34); Prop. B.4 at 1528–1538 (p. 35), with (ii) `φ^a=ψ(r_L(π))⁻¹χ(π)` in the arithmetic Artin normalization; Example B.5 at 1579 (p. 36). | Supported. With `rec_geom=r_L⁻¹`, B.4(ii) is the README's `η(rec_geom ϖ)∏τ(ϖ)^{a_τ}`. |
| 0.4 | Kisin's *Overconvergent* DVI could not be fetched. Skinner2009 footnote 9, lines 600–606 (p. 254): Kisin 5.14/5.15 extend to `D_v` with `φ^{f_v}`, and `P=XQ` with `Q(0)` not a zero-divisor. | Skinner part supported. Kisin is under Not verifiable. |
| 1.5 | DFG: Lemma 5.7 at 2765 (p. 58), rank 2 and `∧²M_g≅M_ψ(1−k)`; §5.5 at 2792 (p. 59); `L(M_g⊗M_{ψ⁻¹},τ,s)=L(τ(g),s)` at 2856 (printed p. 60); printed p. 96, lines 4740–4743, `M_f^*≅M_f⊗M_{ψ⁻¹}(k−1)`. DDT Thm 3.1(a)–(c) at 3164–3178 (pp. 85–86). Scholl 1.0.0 at line 26 (p. 1) and Thm 1.2.4(i) at 124–126 (p. 2). | Supported, including the `ψ⁻¹` correction and `ρ_g≅M_g^DFG(k−1)`. |
| 2.1 | DeligneSerre: Prop. 5.1, (5.1.1) at 424–428 (p. 518); Dém. 5.2 at 429. | Supported. |
| 2.2 | DeligneSerre: Prop. 5.5 at 482–488 (pp. 519–520), with the bound `dens.sup X(c)≤r/c`, summed over embeddings, at 495–499; Remark 5.6 at 501 (p. 520). | Supported (but see R02). |
| 2.6 | DeligneSerre: §8.2 at 683, Lemme 8.3 at 693–702, Lemme 8.4 at 703 (p. 525). | Supported (see R02). |
| 2.8 | DeligneSerre: 8.5 at 705–717 and 8.6 at 718–740 (pp. 525–526). | Supported (see R02). |
| 3.10 | KisinPST JAMS: §4.1 at 1449–1480 (p. 542), geometric-Frobenius polynomial `X²−t_vX+N(v)s_v`; Thm 4.3 at 1511 (p. 543). Skinner2009 eq. (1) at line 41 (p. 242). Carayol 0.5 at 60–74 (p. 410). | Supported. DVI page numbers are R04. |
| 3.11 | Carayol 0.4 at 44 (p. 409) and 0.5 at 60–74 (p. 410). Saito2009: `σ_h`/`σ̌_h` at 441–458 (p. 9), Thm 0 at 487–494 (p. 10). Skinner2009 at 41 (p. 242). SW (3.2) at 1198–1204 (p. 38) and (3.3) at 1219 (p. 39). KW §1.2 at 145 and 191 (pp. 4–5); Lemma 7.2 at 2794 (p. 60). CDN §5.2.1 at 1719 (p. 43), Prop. 5.2 at 1761 (p. 44), `H¹≅⊕π_f⊗ρ_π(−1)` at 1767–1769. | Supported. Saito's `σ̌_h` has `1−τT+ρNT²`, which is Carayol's `σ`, as in the table row. |
| 3.13 | ConradHecke: second Lemma 1 at 306–312 (p. 9), proof 313–335 (pp. 9–10). Skinner2009 Remark at 684–691 (p. 256). | Supported. |
| 3.16 | Ribet1975 (OCR): Thm 2.3 at 314–326 (pp. 251–252). BGV Remarks (i)–(ii) at 72–95 (p. 2). DK Lemma 9.1 at 2520 (p. 66), proof 2524–2527 (p. 67). | Supported. |
| 4.1 | Saito2009: hypotheses `g>1`, `w≥k_i≥2`, parity at 56–59; Thm 0 at 487–494; Thm 2 and Remark at 592–604 (p. 13), with weights `w−1`, `w−2`, `w`. SaitoWM Thm 1 at 82–87 (printed p. 429). | Supported. |
| 4.3 | Carayol: 0.5 with (a) and (b) at 60–74 (p. 410); Thm (A) at 86–92; 0.8 Corollaire at 99–104 (p. 411). | Supported. |
| 4.8 | Skinner2009 Remark at 684–691 (p. 256). DDT Thm 3.1(c) at 3178, proof by Ribet via the coefficient estimate, 3203–3206 (p. 86). | Supported. The route matches the README's purity argument. |
| 6.4 | DDT Thm 3.1(d)–(e) at 3179–3188 (p. 86); Carayol 0.8 at 99–104 (p. 411). | Correct but weight two only: R03. |

### Adversarial table

| Statement | Instances | Values on each side | Result |
|---|---|---|---|
| Conventions, dictionary | 11a1 twisted by `|det|⁻¹` at 3, `(t,s,q)=(−3,9,3)` | `ρ`: `X²+3X+27`. Carayol `X²−(t/s)X+q/s=X²+X/3+1/3`. Saito `1−τT+ρNT²` with `τ=−1/3`, `ρ=1/9` gives the same. Product of `σ`'s roots is `1/3=27/81`. | Consistent. |
| Conventions, Hodge degrees | `(2,0)`, `(12,10)`, `(2,2)` | `(0,1)`, `(0,11)`, `(1,2)`; sums 1, 11, 3, each equal to `w+1`. Skinner's printed pair at `(2,0)` gives `(−1,0)` (Source issues). | Consistent. The README applies the shift. |
| §0.1 | `ε_p` on `ℚ_p`; `η=1`; unramified `η` with `η(rec_geom p)=c` | `ε_p`: `a=−1`, unit value `u`, `ϖ`-value 1, `ν(p)=p⁻¹`, `φ=1·p⁻¹`, equal to Conrad's `ψ(r(p))⁻¹χ(p)=1·p⁻¹`. `η=1`: 0, 1, 1. Unramified: `a=0`, `φ=c`. | True. |
| §0.3, normalization | `ℚ`, `b=1`; `e_v=2`, `k=2`; one class at `U₀(p^t)` | `c_p=p`, `H_alg(T)=H_norm(pT)`, cutoff `k−1→k`. Cutoff 1/2. Dimension `p^s(k−1)`, equal to QuaternionicModularForms §5.2's `h·p^s(n+1)` with `h=1`, `n=k−2`. | Matches QuaternionicModularForms §§1.3, 5.2–5.3. |
| §0.3, nilpotent chart | `R=K⟨x,y⟩`, `U=1+xJ`, `yJ` | `B=R⊕(x,y)ε`. At `x=y=0` the image has dimension 1, while `B⊗_RK` has dimension 3. | True. |
| §0.4 | trivial line; `Q(−j)=0` | `Y=1`, `P(T)=T`, `Q=1` invertible. A chart with `Q(−j)=0` fails the hypothesis. | Consistent; Kisin unread. |
| §1.5 | 11a1 at 3; `Δ` at 2; `k=2`, `a=2`, `p=3`, `ψ=i` | `X²+X+3`, dual `X²+X/3+1/3`. `X²+24X+2048`, dual coefficients `3/256`, `1/2048`. Constant `3i`, dual `−2/(3i)` and `1/(3i)`. `∧²M_g=M_ψ(1−k)⊗M_{ψ⁻²}=M_{ψ⁻¹}(1−k)`. | True. |
| §2.1 | weight-one Eisenstein `1+χ₋₃` | Moment `2·log(1/(s−1))` against the cuspidal coefficient 1. | Hypothesis necessary. |
| §2.2 | `[K:ℚ]=2`, `c=16` | Deligne–Serre gives `dens.sup≤2/16=1/8`. | True. |
| §2.4 Checks | `GL₂(𝔽₃)`; `⟨diag(2,1)⟩⊂GL₂(𝔽₅)`; split Cartan over `𝔽₃` | `12+2·9+3·6=48`, and `1+2+3=6=ℓ(ℓ−1)` polynomials. The cyclic group has 4 polynomials, so it fails `C(0,3)` and satisfies `C(1/4,3)` (3 ≥ 3). The Cartan has 3 polynomials. | True. |
| §2.8 | `A=3` | `Y` is finite (products of roots of unity of order at most 3). Finitely many `ℓ` collide; `ℓ>A` is prime to `|G_ℓ|`. | True. |
| §3.10 | 11a1; `Δ`; type `(2,2)` | `X²+X+3`; `X²+24X+2048`. For `(2,2)`: `j=1`, `r_π` has degrees `{−1,−2}`, arithmetic polynomial `X²+3X+27`, geometric `X²+X/9+1/27`. | True. |
| §3.11 | `s=0`; `(k,w)=(2,1)` | `s=0` is excluded; `(2,1)` fails parity. | The guards are needed. |
| §3.13 | `ε₃` over `ℚ`; CM character over `ℚ(i)` | `m=1`, degree −1, `χ(I₃)=ℤ₃^×`. The CM exponents are unequal. | True. |
| §3.14 Check | `ψ=|·|⁻⁴` | `L(ψ,2)=ζ(−2)=0`, which is `riemannZeta_neg_two_mul_nat_add_one` at `n=0`. | True. |
| §3.15 | `y²=x³−x` at 5 | `#E(𝔽₅)=8`, so `a₅=−2`. `α′` values `−1±2i`: absolute value squared 5, sum −2, product 5. | True. |
| §3.16 | `y²=x³−x`; `Δ`; `η(z)η(23z)` | Induced from `ℚ(i)`, so CM. `Δ` is irreducible on every open subgroup. The weight-one dihedral form has finite image and is excluded. | True. |
| §4.1 | `w_S=2` | `σ` has weight 1, kernel 0, cokernel 2. Then `ρ` (with `w=0`) has 1, 0, 2. | True. |
| §4.3 | unitary `Ind(ξ₁,ξ₂)` | Trace `q^{1/2}(ξ₁⁻¹+ξ₂⁻¹)(ϖ)=t/s`. Determinant `q/(ξ₁ξ₂)(ϖ)=q/s=χ⁻¹|·|⁻¹(ϖ)`. | True. |
| §4.8 | a hypothetical decomposition | Characters of degrees 0 and `k−1` give `|a_p|≈p^{k−1}>2p^{(k−1)/2}` for `p>4`. | Contradiction, as claimed. |
| §5.2 | `Δ` at `p=11` | `p=11<w=12`, so Scholl 1.2.4(ii) says nothing there, while the README asserts crystallinity. | True claim; R03 locator. |
| §6.3 | `Γ₀(88)`, `T₂` | `f(8τ)` is a cyclic vector. Minimal polynomial `u²(u²+2u+2)`; `u(u²+2u+2)` is nonzero with square zero. | True. |
| §6.4 | 11a1 at 11; `k=4` Steinberg | `χ_u(Frob)=a₁₁=1`, Euler factor `(1−11^{−s})⁻¹`. For `k=4`: eigenvalues `μ(p)`, `pμ(p)`; `a_p=μ(p)`; requires `a_p²=ψ′(p)p²`. | True; R03 locator. |
| §§6.5, 6.12 | 11a1 at 7 and at 19 | Discriminant `−4≡3 (mod 7)`, nonsquare. `−4≡15 (mod 19)`, nonsquare. | True. |
| §7.7 and Lean | 11a1 at 3, 19, 11; `N=1`; 32a; a degree-2 field at 5 | 3 is in. 19 is out (`0∈(19)`). 11 is out (`11∣11`). `N=1` is vacuous (`S₂(SL₂ℤ)=0`). 32a is excluded (32 is not squarefree). For the degree-2 field: `|N(a₅)|≤20<25`, so `a₅=0`. | True; matches the three Checks. |
| §7.7, “excludes CM” | CM newform with `χ=1` | `ψ|ℤ` must equal `χ_K`, which forces the conductor to meet `d_K`. Then `p²` divides the level at a ramified `p`. | True. |

### Library declarations opened at the pins

**Tau Ceti:**
- `NumberField.Set.HasNaturalDensity` (`TauCeti/NumberTheory/ArithmeticDirichletSeries/NaturalDensity.lean:96`): the ratio of prime counts tends to `δ`.
- `HeckeRing.GL2.EigenformAwayFromLevel` and `HeckeRing.GL2.Newform` (`TauCeti/NumberTheory/ModularForms/Newforms/Newform.lean:84,104`): level `Γ₁(N)`, `χ : (ZMod N)ˣ →* ℂˣ`, `isNorm`.
- `TauCeti.CoefficientField` (`…/Newforms/Fields.lean:48`): an `IntermediateField ℚ ℂ` generated by the positive-index coefficients.
- `TauCeti.ClassFieldTheory.localCyclotomicCharacter_artinMap_unit` and `…_uniformizer` (`…/ExplicitCyclotomicSymbol/ArtinMap.lean:311,438`): `χ_cyc(Art u)=N(u)⁻¹` and `χ_cyc(Art ϖ)·N(ϖ)=p^f`. Inverted, these give the README's `N(u)` and `N(ϖ)/q_K`.
- `TauCeti.det_tateModuleGaloisRepresentation` (`…/TateModule/Determinant.lean:52`), with hypothesis `(ℓ : K) ≠ 0`.
- `TauCeti.LSeries.landau` (`TauCeti/NumberTheory/LSeries/Landau.lean:296`), with hypotheses `0 ≤ a` and an exact abscissa.

**Mathlib:**
- `Representation.IsSemisimpleRepresentation` is `ComplementedLattice (Subrepresentation ρ)` (`Mathlib/RepresentationTheory/Semisimple.lean:34`).
- `Matrix.card_GL_field` (`Mathlib/LinearAlgebra/Matrix/GeneralLinearGroup/Card.lean:122`).
- `riemannZeta_neg_two_mul_nat_add_one` (`Mathlib/NumberTheory/LSeries/RiemannZeta.lean:173`).

**Resolved by `#check` with their hypotheses:**
- `Representation.averageMap` and `Representation.isProj_averageMap` (`Fintype`, `Invertible` card);
- `Subgroup.exists_right_complement'_of_coprime`;
- `nonempty_sections_of_finite_inverse_system`;
- `DirichletCharacter.LFunction_apply_one_ne_zero` (`NeZero N`, `χ≠1`);
- `riemannZeta_residue_one`;
- `NumberField.Embeddings.finite_of_norm_le`;
- `Matrix.det_fin_two`;
- `DualNumber.eps`;
- `Submodule.restrictScalars` (scalar tower).

That makes 22 declarations in all. The README's descriptions of their hypotheses are accurate.

### Cross-roadmap citations resolved

**At open heads:**
- **QuaternionicModularForms** (f7ed2fe): §0.4 at line 382; §1.3 at 499 (the `ν_alg(π_v)^e` scalar); §3.3 at 1074 (compactness and Buzzard links); §4.3 at 1161; §5.2 at 1298 (`Θ_τU_v=τ(π_v)^{r_τ}U′_vΘ_τ`); §5.3 at 1330 (cutoff `v_p(μ)<r_τ/e_v`, `‖U′_v‖≤1`). These are exactly what §0.3 uses.
- **GL2AutomorphicRepresentationsAndTransfer** (8d94672): R16.1.8 at 670, R16.2 at 703, R16.3 at 904, R16.3.2 at 916, R16.4.4 at 1091, R16.6.3 at 1304, R17.1.2 at 1429, R17.3 at 1654, R17.3.9 at 1737, R17.4.3 at 1926, R17.4.13 at 2192, R17.4.17 at 2260, R17.5.15 at 2532, R17.5.16 at 2559.
- **HilbertModularVarietiesAndShimuraCurves** (cd70693): R18.1.7 at 1696, R18.2.3 at 2190, R18.2.6 at 2276, R18.5.19–R18.5.21 at 2215, 2489 and 2509, R18.4.25 at 3950, R18.3.29 at 3971, R18.3.32 at 4327. The contents match §§3.10, 4.5–4.6 and 6.11; the declaration names are R01.
- **SmallRamificationAndAbelianVarietyBaseCases** (c03aea7): §5.0d at 1980 (raw carrier, operations, adapters, finite-exception family); §5.1 at 2120.
- **IntegralHeckeAndGaloisDeterminants** (0609cf2): §3a.1 at 1612; §1.3 at 2152; §4.1 at 3123, with `Determinant.existsUnique_isCoefficientChange_of_compact` planned at 3160.
- **AlgebraicModularFormsAndSerreWeights** (364af81): identifiers at line 17; §6.3 at 1448; §6.4 at 1478; §7.3 at 1535.
- **SerreWeightAndLevelOptimisation** (0825d40): §2.10 at 525, §2.13 at 581, §4.7 at 1055, §4.8 at 1075. The hypotheses of §2.10 (`ℓ≥3`, `q∤Mℓ`, irreducible, unramified at `q`, no `q≢1` condition) match §7.6.
- **IntegralIwasawaTheory** (539ca66): §9.5 at 1219, with `finiteWeightHilbert_galoisOldform` at 1238.
- **AutomorphicGaloisRepresentationsPartII** (902b706): AG2.P subsections at 329, 431 and 488; AG2.0 at 743; AG2.6 “Strong coefficient field” at 3287; `Weak` and `Strict` at 439–441; `hilbertCoefficientPrimeComparison` at 511.

**On main** (eaf17b1):
- ModularForms Layers 0, 4, 8 and 8G (lines 259, 532, 764, 935) and sublayer 8W;
- Chebotarev Layers 3 and 10;
- ArithmeticDirichletSeries Layer 3;
- LocalGaloisGroups Layer 5;
- ReductiveGroups Layer 9 (line 1092);
- ClassFieldTheory, GlobalNumberFields, CompactOperators, RigidAnalyticGeometry and EtaleCohomologyFoundations are all present.

### Ownership, overlaps, headlines

- **Overlaps:** `overlaps.md` reports no other open pull request changing this roadmap and no dropped identifiers.
- **Nearest roadmaps:** ClassicalSerreModularity, PotentialModularityAndCompatibleSystems, PadicFamilies and RankOneConverse cite this roadmap's sections as suppliers; AutomorphicGaloisRepresentationsPartII and SerreWeightAndLevelOptimisation are suppliers. No object has two owners. The almost-strict rank-two predicate is defined only here; AG2.P owns `Weak` and `Strict`.
- **Fully qualified names:** neither Suggested.lean name occurs in another roadmap.
- **Headlines:**
  - The headlines named in the Summary are: §3.10, §§4.2, 4.4 and 4.7, §7.3, §§7.4–7.5, §§6.8–6.12, §7.6 and §7.7.
  - Only §7.7 is statable at the pins: there are no Hilbert modular forms, and no Galois representation attached to a newform, in the pinned Tau Ceti or Mathlib (searched).
  - The module docstring (lines 22–40) names each of the others with its missing carriers.

## Not verifiable

- **Kisin, *Overconvergent modular forms and the Fontaine–Mazur conjecture*, Prop. 5.14 and Cor. 5.15 (§0.4).** The author DVI was refused by the sources service, and no open copy of the Invent. Math. version was found. The Skinner footnote that §0.4 also cites was checked.
- **Kisin, *Potentially semi-stable deformation rings*, author-DVI page numbers (§§3.10, 3.11, 4.6, 6.8).** The DVI is not fetchable. The same statements were verified in the JAMS version (R04).
- **T. Saito, *Modular forms and p-adic Hodge theory* (1997), proposed in R03.** Not read; the author should check its Theorem 1 before citing it.

## Source issues

- **Misprint** in Skinner2009 at the Introduction, printed p. 242: the source gives `ρ_π` Hodge–Tate degrees `(w−k_i)/2` and `(w+k_i−2)/2`. Under its own normalization (1) and `B_HT` grading they should be `(w−k_i+2)/2` and `(w+k_i)/2`; for an elliptic curve, `(2,0)` gives `{0,1}`, not `{−1,0}`. Affects nothing.
