# Review of AutomorphicGaloisRepresentations (pull request #1007 at aa5c8c0)

**Verdict:** needs changes

There are two findings: one P2 (blocking) and one P3. Both are in passages this head did not change. All four findings of the previous review are repaired. The gate passes, the dependency check is clean, and `Suggested.lean` elaborates with `sorry` as its only warning.

## R01 (P2) — §1.7 writes `a_p`, which is not the Hecke eigenvalue for the forms it admits

**Location:** `TauCetiRoadmap/AutomorphicGaloisRepresentations/README.md`, §1.7, line 1265: “Let `f≠0` be an eigenform of weight `k≥2` … not necessarily cuspidal … good polynomial `X²−a_pX+ψ(p)p^{k−1}` … If eigenforms `f,f′` … have `a_p=a′_p` on a density-one prime set, then `k=k′, ψ=ψ′`”.

**Claim:** §1.7 admits non-normalized, old and Eisenstein eigenforms. It writes `a_p`, which the README fixes as `t_p=a_p` only for normalized newforms (Conventions, line 175). For the forms §1.7 adds, the q-expansion coefficient `a_p(f)` is not the `T_p`-eigenvalue. Read that way:
- the polynomial claim is false for Eisenstein series;
- the density-one rigidity claim is false.

Deligne–Serre state both results for eigenvalues (“valeurs propres `a_p`”). The supplier, AlgebraicModularFormsAndSerreWeights §6.2, writes `λ_p(f)` and has Checks that separate the two notions (its README at its open head, §6.2, line 1418 onward).

Separately, the rigidity claim has no locator of its own. It is Deligne–Serre Corollaire 6.3, not Théorème 6.1 or Remarque 6.2, which are the locators cited.

**Witness:**
- `E₄` has `a₂=240·σ₃(2)=2160` but `T₂`-eigenvalue `9`. Its attachment `1⊕χ_cyc³` has trace 9 at 2, not 2160.
- `Δ(q³)` (`k=12`) and `E₄(q³)` (`k′=4`), both of level 3, have `a_p=0` at every prime `p≠3`. They agree on a density-one set, yet `k≠k′`.
- DeligneSerre line 508 and lines 527–529 (pp. 520–521) state both results for eigenvalues.

**Repair:**
- In §1.7, write `λ_p(f)` for the `T_p`-eigenvalue at `p∤N`.
- State the attachment with polynomial `X²−λ_p(f)X+ψ(p)p^{k−1}`.
- State the rigidity as: `λ_p(f)=λ_p(f′)` on a density-one set implies `k=k′`, `ψ=ψ′` and `λ_p(f)=λ_p(f′)` for every `p∤NN′`.
- Add “Corollaire 6.3, printed p. 521” to §1.7's locators.
- Add a Check with `E₄` (`a₂=2160`, `λ₂=9`) and the pair `Δ(q³)`, `E₄(q³)`, which agree in `a_p` but not in `λ_p`.

**Tested:**
- `λ₂(E₄)=1+2³=9`. The attachment `1⊕χ³` has trace `1+8=9` and determinant `8=2³` at Frobenius 2, which matches `X²−9X+8`.
- For the pair, `λ₂(Δ(q³))=τ(2)=−24` while `λ₂(E₄(q³))=9`. The corrected hypothesis fails, so the pair contradicts nothing.
- `Δ` and `Δ(q³)` have equal `λ_p` for all `p≠3`. The corrected conclusion holds for them: `k=12`, `ψ=1`.

## R02 (P3) — §§6.4a–6.6 restrict `Σ` to `Σ_ρ̄`, which DDT assume only for §6.7's localization

**Location:** README §6.4a, lines 2488–2489: “Choose finite `Σ` with `ℓ` allowed only when `ρ̄` is good and ordinary there, and `p≠ℓ` allowed only when `ρ̄` is unramified there.” Also:
- the Check at line 2505, “A ramified `p≠ℓ` cannot be added to `Σ`”;
- §6.6 (line 2559) and the minimal application of §6.12 (lines 2743–2745), which inherit the restriction.

**Claim:**
- DDT define type-`Σ` lifts for every finite `Σ` (DDT line 2840, p. 76).
- Their Lemmas 3.26–3.27 (pp. 94–95) build `𝓝_Σ`, `T_Σ` and `R_Σ↠T_Σ` without assuming `Σ⊂Σ_ρ̄`. They say they only “sometimes” assume it, to simplify (DDT line 3478, p. 94).
- The assumption becomes a hypothesis only in §4.2 (DDT line 4134, p. 112), the localization that §6.7 follows.

So §§6.4a–6.6 state less than the source supports, and a Check presents the restriction as a property of type `Σ`.

**Witness:** DDT line 3489 (Lemma 3.26) gives the level bound `ℓ^δ N(ρ̄)∏_{p∈Σ−{ℓ}} p^{dim ρ̄^{I_p}}` for arbitrary `Σ`. Its rewriting with `p²`, (4.2.1) at DDT lines 4141–4148, requires `Σ⊂Σ_ρ̄`.

**Repair:**
- In §6.4a, allow every finite `Σ`, with `δ_Σ` as defined and the bound `ℓ^{δ_Σ}N(ρ̄)∏_{p∈Σ∖{ℓ}}p^{dim ρ̄^{I_p}}`.
- Record `Σ⊂Σ_ρ̄` (DDT Definition 3.25) as a named hypothesis.
- Require it explicitly in §6.7, and in §6.12's minimal application wherever that application uses §6.7.
- Replace the Check at line 2505 with a ramified `p≠ℓ` in `Σ`: `dim ρ̄^{I_p}=1`, so the bound acquires `p²` (one factor from `N(ρ̄)`). §6.7's formula `∏_{p|N(ρ̄)}p∏_{p∈Σ∖{ℓ}}p²` would give `p³` there, which is why §6.7 needs `Σ⊂Σ_ρ̄`.

**Tested:** take a ramified `p` with `#ρ̄(I_p)=ℓ`. Then `ρ̄|I_p≅(1 ∗;0 1)` with `∗≠0`, `dim ρ̄^{I_p}=1` and `p∥N(ρ̄)`.
- Lemma 3.26's bound gives `p·p=p²`.
- (4.2.1), which counts `p` in both products, gives `p·p²=p³`.
- For `p∈Σ_ρ̄` both give `p²`.

## Verified sound

### Previous review (round 4)

| Finding | Status at aa5c8c0 |
|---|---|
| R01 (P3), backticked names attributed to suppliers that do not declare them | **Repaired.** Line 285 cites “R18.3.29, *Early rank-two eigensystem realisation and local compatibility*” and “R18.3.32, *Fixed ramified signs throughout a localized eigensystem*”. Lines 496, 505 and 2870 cite “the shared raw compatible-system carrier of SmallRamificationAndAbelianVarietyBaseCases §5.0d”; line 512 cites “§5.1 supplies the isogeny and base-change transports”. Line 1644 has “§3a.1's integral `GL_n` Hecke polynomial at `n=2`”. Lines 49–50 and 217–223 give the full Tau Ceti names and module. The two remaining names, `Determinant.exists_realization_of_henselian` (line 2670) and `Determinant.existsUnique_isCoefficientChange_of_compact` (line 2637), are declared in IntegralHeckeAndGaloisDeterminants' Suggested.lean at its open head (lines 205 and 365). The citation tool's two leads are therefore resolved. No name from the round-4 list remains. |
| R02 (P3), Layer 2 restated AlgebraicModularFormsAndSerreWeights §§6.3–6.4 | **Repaired.** Layer 2 (lines 1290–1355) has the single target §2.10, restricted to the polynomial and determinant comparison. Line 370 carries the Deligne–Serre locators. The build paragraph (lines 624–625) and Layer 2's Dependencies (line 1355) were updated. No stale `§2.1`–`§2.9` or Condition `C` reference remains (grep). |
| R03 (P3), §§5.2 and 6.4 locators | **Repaired.** Line 2471 cites Carayol Théorème (A) with 0.5 for every `k≥2`, and labels DDT 3.1(d)–(e) and Carayol 0.8 as the weight-two case. Line 2309 restricts Scholl to `p≥k` (Remark 1.2.5) and cites Saito 1997, Theorem 1 (SaitoMFPH, uncertified, by locator) for every `p∤N`. Line 2305 sends `p<k` to §4.5. |
| R04 (P3), Kisin page schemes and duplicate *Needs:* | **Repaired.** JAMS pages are used at lines 1549, 1587, 1866, 2633, 2799 and 2824, and the References entry (line 3168) points at the JAMS PDF. §1.1's *Needs:* (line 1036) lists each ModularCurvesPartII range once. KisinPST shows that the proof of Theorem (4.3) ends on p. 544, before the errata appendix (lines 1600–1624), so “pp. 543–544” is right. |

The previous review marked no finding “not actionable”, so nothing is re-raised.

### Gate, dependency check, Lean

- **Gate rerun:** every check is 0, then `OK`. `git diff --stat origin/main...HEAD` outside the folder is empty, and the folder holds only README.md, Suggested.lean and metadata.toml.
- **Dependency check:** `depcheck: 243 roadmaps, 2481 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line.
- **Merge order:** this roadmap is at 162. Every supplier comes before it:
  - PadicPeriodRings 22, CrystallineCohomology 24, IntegralHeckeAndGaloisDeterminants 27, IntegralIwasawaTheory 29, PhiGammaModulesAndIwasawaCohomology 32;
  - ArithmeticGaloisRepresentations 46, FiniteFlatGroupsAndIntegralPadicHodgeTheory 50, LefschetzPencilsAndVanishingCycles 56, EtaleCohomologyFoundations 57;
  - QuaternionicModularForms 70, LocallyAnalyticDistributions 71, ModularCurvesPartII 79, LocalGaloisDeformationRings 80, GlobalGaloisDeformations 81, DeligneWeightsAndPurity 84, AutomorphicLFunctionsAndLocalFactors 86;
  - AlgebraicModularFormsAndSerreWeights 93, GL2AutomorphicRepresentationsAndTransfer 94, ShimuraVarieties 100, PELModuli 112, SmallRamificationAndAbelianVarietyBaseCases 116;
  - WeightsInEtaleCohomology 144, EndoscopicTransferAndUnitaryTraceComparison 145, HilbertModularVarietiesAndShimuraCurves 157, SerreWeightAndLevelOptimisation 160, AutomorphicGaloisRepresentationsPartII 161.

  Consumers come later: ClassicalSerreModularity 165, PadicFamilies 168, GL2ModularityLifting 170, PotentialModularityAndCompatibleSystems 171, RankOneConverse 373. LocalGaloisGroups, GlobalNumberFields, Chebotarev and ArithmeticDirichletSeries are under `Completed/` on main. ClassFieldTheory, CompactOperators, RigidAnalyticGeometry, ModularForms and ReductiveGroups are on main.
- **Elaboration:** `lake env lean` on Suggested.lean emits one warning, `declaration uses 'sorry'`, at 66:8.
- **Signatures (`#check @…`):**
  - `ordinaryGoodPrimes : {N : ℕ} → [NeZero N] → HeckeRing.GL2.Newform N 2 → Set (HeightOneSpectrum (𝓞 ℚ))`.
  - `fixedSquarefreeForm_ordinary_density_one` keeps `[NeZero N]`, `Squarefree N` and `f.χ = 1`, and concludes `HasNaturalDensity (ordinaryGoodPrimes f) 1`.
  - Both match README §7.7. No binder was lost and nothing changed.
- **One-tactic probe on a scratch copy:** `simp` made no progress, `rfl` is not definitional, `infer_instance` fails (the goal is not a class), `simp_all [ordinaryGoodPrimes]` leaves the unfolded goal, and `aesop` made no progress. The theorem is not padding, and `ordinaryGoodPrimes` is the one definition it needs.
- **Unique names:** neither name occurs in another roadmap's Lean (`roadmaps grep --lean-only`).

### Seeded source sample

| Target | Source, lines, locator | Result |
|---|---|---|
| 1.7 | DeligneSerre: Théorème 6.1 at 507–515 (p. 520), with `k≥2`, not necessarily cuspidal, eigenvalues `a_p`, `det=ε(p)p^{k−1}`; Remarque 6.2 at 519–526 (p. 521); Corollaire 6.3 at 527–531 (p. 521); footnote (1) attached in 3.1 at 239 and printed at 265–266 (p. 513); Introduction at 28–40 (p. 507). Scholl 1.0.0 and 1.2.4(i), checked in round 4. | Existence is supported. The rigidity claim is Cor. 6.3 and is stated for eigenvalues: R01. |
| 2.10 | DeligneSerre: Théorème 4.1 at 262–274 (pp. 513–514), with `ε(−1)=−1`, nonzero type `(1,ε)`, Artin's arithmetic Frobenius (footnote at 265), `Tr=a_p`, `det=ε(p)`, irreducible iff parabolic; 4.3–4.5 at 281–290 (p. 514). AlgebraicModularFormsAndSerreWeights §6.4 (README at its head, line 1478) supplies the attachment with arithmetic polynomial `X²−λ_pX+ε(p)`. | Supported. |
| 3.2 | Carayol: 3.1 at 523–530 (p. 421), where twisting by `t↦t^{−u}` sends `C_w` to `C_{w+2u}`; 3.3 Proposition at 542–550 (p. 422), with (i) `σ(χπ)=χ⁻¹σ(π)` and (ii) `(det σ)²=ω_π⁻²ε⁻²`; 5.5 at 784–801 (pp. 428–429); 5.6.1 at 802–803 (p. 429). | Supported: the quadratic `α` is exactly Carayol's ambiguity. |
| 3.7 | Carayol: Théorème (B) at 121–125 (p. 411), which excludes the auxiliary place `v` and extraordinary cuspidal places; 11.1 at 1526–1557 (pp. 449–450); 11.3 at 1576–1591 (p. 450). | Supported. |
| 3.8 | Carayol 12.1.1 at 1722–1740 (p. 454), where `A₅` is excluded by solvability; 12.1.3 at 1779–1790 (p. 456), cubic `L` Galois in the tetrahedral case and not in the octahedral case, irreducible monomial restriction, and the lemma that equal restriction and equal determinant give equivalence; proof 12.1.4 at 1791–1807 (pp. 456–457). | Supported (“can be nonnormal” understates “is nonnormal”, harmlessly). |
| 3.9 | Carayol: 12.2.2 Proposition at 1837–1841 (p. 457), for degree `≤3` and extraordinary `π`, restriction irreducible, with the Hecke-normalization remark at 1842–1846; 12.2.3 at 1850–1874 (p. 458). | Supported. |
| 3.10 | KisinPST: §4.1 (p. 542); Theorem (4.3) at 1511 (p. 543), proof ending on p. 544. Carayol 0.5 at 60–74 (p. 410). Skinner2009 p. 242 checked in round 4. | Supported. |
| 3.14 | Carayol §§3.1–3.3 at 523–550 (pp. 421–422) and 5.5 at 784–801 (pp. 428–429). Skinner2009 Remark at 684 (p. 256). Saito2009 §2 (p. 9), checked in round 4. | Supported. |
| 3.16 | Ribet1975 (OCR): Theorem (2.3) at 314–326 (pp. 251–252), a compact semisimple group with an open abelian subgroup of infinite projective index has an abelian subgroup of index 1 or 2. DK Lemma 9.1 at 2520–2527 (pp. 66–67). BGV Remarks (i)–(ii) at 72–95 (p. 2). | Supported. |
| 4.2 | Blasius: Theorem 1 at 16–18 (p. 1), all finite places with weights `≥2` of one parity; §2.2 at 525–565 (pp. 14–15), complementary series and the Grunwald–Wang reduction; Proposition 2 at 413–415 (p. 11); Proposition 5 at 593–616 (pp. 16–17); §4.1 at 702–755 and Corollary 7 at 757 (pp. 19–20); §4.2 at 774–786 (p. 21), surface WMC and the tensor lemma. Skinner2009 Remark at 494 (p. 252). | Supported; the source misprint is listed below. |
| 4.10 | SW: `m`, `v`, `µ` at 809–814 (p. 27); weight action at 829 (p. 28); (3.1′) at 895 (p. 30), inverse translation; §3.2, `G(U_a)` with `ω^{−µ}` and `T₀`, at 901–918 (p. 30); good line `π(η|·|^{−1/2},ξ|·|^{−1/2})` or special at 925–937 (p. 31); `(a⁻¹d,a)` coordinates at 986–988 (p. 32). | Supported. `T_y` is named on p. 33 (line 991), just past the cited p. 32; immaterial. |
| 6.2 | DDT “Mod ℓ representations” at 3222–3232 (p. 87): semisimplified reduction; for odd `ℓ`, irreducible iff absolutely irreducible; only `N(ρ̄)` divides the prime-to-`ℓ` part. | Supported. |
| 6.4a | DDT: `δ(ρ̄)` at 3348–3367 (pp. 90–91); Theorem 3.15 at 3368–3373 (p. 91); §3.3 hypotheses (a)–(e) at 3445–3454 (p. 93); Definition 3.25 at 3474–3482 and Lemma 3.26 at 3484–3495 (p. 94). | Locators correct; the generality is R02. |
| 7.4 | Dimitrov: standing `p>k₀`, `p∤6Δ` at 1004; Proposition 3.1 at 1008 (p. 22); Proposition 3.5 at 1123 (p. 24); Proposition 3.8 at 1169–1172 (p. 25), `SL₂(𝔽_q)⊂im ρ⊂κ×GL₂(𝔽_q)` for all but finitely many `p`. NewtonThorneHilbert, proof of Lemma 5.7, at 1904–1907 (p. 41) applies Dim05 Prop. 3.8 to non-CM RAESDC forms. | Supported. |
| 7.5 | Ribet1985 (OCR): hypotheses `k>1`, non-CM at 132–133 (p. 188); Theorem 2.1 at 139–210 (pp. 188–190), with `G_λ ⊇ SL(2,𝔽_ℓ)` for almost all `λ` at 146; §3 at 217 (p. 190); Theorem 3.1 at 271 (p. 191). NewtonThorneII, proof of Theorem 3.1, at 1235 (p. 26). | Supported. |

### Adversarial table

| Statement | Instances | Values on each side | Result |
|---|---|---|---|
| Conventions, `P_v=X²−t_vX+q_vs_v` and the `|det|⁻¹` twist | 11a1 at 3 | `(t,s,q)=(−1,1,3)` gives `X²+X+3`. Twisted `(−3,9,3)` gives `X²+3X+27`; scaling the roots of `X²+X+3` by 3 gives `X²+3X+27`. | Consistent. |
| Conventions, Carayol column | the same twist | `X²−(t/s)X+q/s=X²+X/3+1/3`, whose roots have product `1/3=27/81`. | Consistent. |
| Conventions, Hodge degrees | `(2,0)`, `(12,10)`, `(2,2)` | `(0,1)`, `(0,11)`, `(1,2)`; the sums `1`, `11`, `3` each equal `w+1`. | True. |
| §0.1 with pinned `localCyclotomicCharacter_artinMap_*` | `ε_p` on `K=ℚ_p`, `ϖ=p` | Inverting `χ(Art u)=N(u)⁻¹` and `χ(Art ϖ)N(ϖ)=p^f` gives `N(u)` and `N(ϖ)/q_K=1`. With `a=−1`, `ν(ϖ)=q_K⁻¹=φ`. | True. |
| §1.7 (R01) | `E₄`; `Δ(q³)` against `E₄(q³)` | `a₂=2160` but `λ₂=9`. Both forms have `a_p=0` for every `p≠3`, but `k=12≠4`. | False with `a_p`; true with `λ_p`. |
| §2.10 | `η(z)η(23z)` at 5 and 2; `1⊕χ` mod 5 with `χ(2)=i` | `X²−1` and `X²+X+1`, each self-dual. Geometric `ρ^∨`: `X²−(1+i)X+i=(X−1)(X−i)`. Arithmetic `ρ^∨`: `(1+i)/i=1−i` and `1/i=−i` give `(X−1)(X+i)`. At `k=1`: `q·s=ψ(p)`, `det=ψ`. | True. |
| §3.1 Checks | 11a1 twisted by `η` mod 17, `η(3)=ζ₈`, with 3 a primitive root | `t₃=−ζ₈`, `s₃=i`. `σ`: `X²+ζ₈⁻¹X+3ζ₈⁻²`; `ρ`: `X²+ζ₈X+3ζ₈²`. | True. |
| §§3.2–3.3a | `α` quadratic; nonquadratic `s` | Carayol's (ii) fixes `det σ` up to `α`. `det σ=q/s`, and `qs≠q/s` unless `s²=1`. | True. |
| §3.8 lemma | tetrahedral `σ` and `σ⊗χ`, `χ` cubic on `W_F/W_L` | The restrictions to `W_L` agree, but the determinants differ by `χ²≠1`. | The determinant hypothesis is necessary, as stated. |
| §3.9 irreducibility | `[L:F]=2,3`; `A₄`, `S₄` | `A₄` has no index-2 subgroup and its index-3 subgroup is `V₄`. The index-3 subgroups of `S₄` are the `D₄`'s. Every image is irreducible in `PGL₂`. | True. |
| §3.10 adapter | type `(2,2)`, `j=1`; 11a1 at 3 | `r_π=r_{f₀}⊗ε` has degrees `{−1,−2}`, its arithmetic polynomial is `X²+3X+27`, and its geometric polynomial is `X²+X/9+1/27`. `ψ_arith=ψ₀ε^{2j}=χ_π⁻¹`. | True. |
| §3.14 pole argument and Check | `ψ=|·|⁻⁴`; `a₁≥a₂` | `L(ψ,s)=ζ(s−4)`, so `L(ψ,2)=ζ(−2)=0`, which is `riemannZeta_neg_two_mul_nat_add_one 0`. The right side has a pole of order 1 or 2 at 1; the left side is entire. | True. |
| §3.14 total oddness | `ω_τ=sgn^{k_τ}|·|^{−w}` | `χ_π(c_τ)=(−1)^{k_τ+w}=1`, so `det ρ(c)=ε(c)⁻¹=−1`. | True. |
| §3.15 Check | `y²=x³−x` at 5 | `#E(𝔽₅)=8`, so `a₅=−2`. `−1±2i` has norm 5 and sum −2. | True. |
| §3.16 | `y²=x³−x`; `Δ`; `η(z)η(23z)` | Induced from `ℚ(i)`, so CM. `Δ` is irreducible on every open subgroup. The weight-one dihedral case is excluded. | True. |
| §4.2 | `Δ` at 2 and 3 | `|τ(2)|=24≤2·2^{5.5}≈90.5`; `|τ(3)|=252≤2·3^{5.5}≈841.8`. | True. |
| §4.10 Checks | `ℚ(√13)`, `p=3`, `ϖ=4+√13`; `k=(2,4)`; change of `ϖ` | `N(ϖ)=3`. At `√13≡−1`, `ϖ≡0`; at the other place `ϖ≡2`. `v=(0,1)`, `c_out=θ⁻¹`, `α=θ·θ⁻¹=1`. For `(2,4)`: `v=(1,0)`, quotient `(1+p)⁻¹`. `α′=ζ₃·(1/4)·2=ζ₃/2`. | True. |
| §4.11 table | the four representations | `S_SW=σ^∨=ρε`: sub `χεη`, quotient `η⁻¹`. `ρ`: sub `χη`, quotient `ε⁻¹η⁻¹`. `ρ^∨`: sub `εη`, quotient `χ⁻¹η⁻¹`. Each row's characters multiply to its determinant. | Consistent. |
| §5.2 Check | `Δ` at 2 | Newton polygon of `X²+24X+2048` through `(0,11),(1,3),(2,0)` has slopes 3 and 8, summing to 11. The primes `<12` are 2, 3, 5, 7, 11: five. | True. |
| §6.2 Checks | 11a1 mod 5; `𝔽₄`; `a²+a−1` at 11 | `(X−1)(X−2)≡X²+2X+2` mod 5. `1⊕1` and `χ⊕χ` both have trace 0, with determinants 1 and `χ²`. `3²+3−1=11` and `7²+7−1=55`; `−1−7≡3`. | True. |
| §6.4 Checks | `k=4`, `p∥N`, Steinberg; 11a1 at 11 | `a_p²p=ψ′(p)p³`, so `|a_p|=p`. `a₁₁=1`, conductor exponent 1, Euler factor `(1−11^{−s})⁻¹`. | True. |
| §6.4a (R02) | ramified `p∈Σ` | Lemma 3.26 gives `p²`; formula (4.2.1) gives `p³`. | Generality: R02. |
| §§6.5, 6.12 | 11a1 at 7 and 19 | `−4≡3` mod 7 and `−4≡15` mod 19, both nonsquares. `#E(𝔽₁₉)=20`, so `a₁₉=0`. | True. |
| §6.11 Check | `γ(Frob)=2`, `q=3` | `6, 2` invert to `1/6, 1/2`, and return to `6, 2` at geometric Frobenius. | True. |
| §7.1 adapter | elliptic `V_ℓ` at `q` | `X²(X⁻²−(a/q)X⁻¹+1/q)·q=X²−aX+q`. | True. |
| §7.5 | `Δ` mod 691 | `τ(p)≡1+p^{11}` mod 691, so the reduction is reducible: one of Theorem 2.1's finitely many exceptions. | Consistent. |
| §7.7 and Lean | 11a1 at 3, 19, 11; `N≤10`; 32a | 3 is in (`−1∉(3)`). 19 is out (`0∈(19)`). 11 is out (`11∣11`). `S₂(Γ₁(N))=0` for `N≤10` (vacuous). 32 is not squarefree. A trivial-character CM form has `p²` in its level at each `p∣d_K`. | True. |

### Library declarations opened at the pins

- **Tau Ceti:**
  - `TauCeti.ClassFieldTheory.localCyclotomicCharacter_artinMap_unit` and `…_uniformizer` (`TauCeti/NumberTheory/ClassFieldTheory/Local/ExplicitCyclotomicSymbol/ArtinMap.lean:311,438`), with types checked by `#check`;
  - `TauCeti.det_tateModuleGaloisRepresentation` (`TauCeti/AlgebraicGeometry/EllipticCurve/TateModule/Determinant.lean:52`), with hypothesis `(ℓ : K) ≠ 0`;
  - `NumberField.Set.HasNaturalDensity`, `TauCeti.CoefficientField` and `HeckeRing.GL2.Newform`/`EigenformAwayFromLevel`, all by `#check`.
- **Mathlib (`#check`):**
  - `Representation.averageMap`, which requires `Fintype G` and `Invertible (card G)`, and `Representation.isProj_averageMap`;
  - `Matrix.det_fin_two`, `DualNumber.eps`, `riemannZeta_neg_two_mul_nat_add_one`;
  - `Submodule.restrictScalars`, which requires a scalar tower;
  - `DirichletCharacter.LFunction_apply_one_ne_zero`, which requires `NeZero N` and `χ≠1`;
  - `AlgHom.IsArithFrobAt` (`Mathlib/RingTheory/Frobenius.lean:30`) and `Representation.IsSemisimpleRepresentation` (`Mathlib/RepresentationTheory/Semisimple.lean:34`).

  The README's descriptions of these hypotheses are accurate.

### Cross-roadmap citations resolved (open heads)

- **HilbertModularVarietiesAndShimuraCurves:** R18.3.29 at line 3971 and R18.3.32 at line 4327, with the cited titles.
- **SmallRamificationAndAbelianVarietyBaseCases:** §5.0d “Minimal lifts and their compatible families” at line 1980, with the raw carrier for arbitrary `F` and `n≥1`, sum/tensor/dual/twist laws, adapters and the rank-two arithmetic family; §5.1 at line 2120.
- **IntegralHeckeAndGaloisDeterminants:** §3a.1 at line 1612, §1.3 at line 2152, §4.1 at line 3123.
- **AutomorphicGaloisRepresentationsPartII:** AG2.P headings at lines 329, 431 and 488. `Weak` and `Strict` are defined at lines 439–444, matching §7.1. AG2.0 heading at line 743, “Strong coefficient field” at line 3287, `hilbertCoefficientPrimeComparison` at line 511. Its line 9 states that it does not cite this roadmap.
- **IntegralIwasawaTheory:** `finiteWeightHilbert_galoisOldform` at line 1241.
- **WeightsInEtaleCohomology:** §§3.6, 5.2, 5.5, 5.6, 6.1, 6.4 and 6.5 carry the quoted R34.3/R34.5/R34.6 titles.
- **AlgebraicModularFormsAndSerreWeights:** identifier line 17; §§6.1–6.4 at lines 1383, 1418, 1448, 1478; §7.3 at line 1535.
- **GL2AutomorphicRepresentationsAndTransfer:** R16.1.8, R16.3.2, R16.4.4, the Layer R16.6 subsections, R17.1.2, R17.3.9, R17.4.3, R17.4.13, R17.4.17, R17.5.15 and R17.5.16 at lines 672–2565.
- **On main:** the sections cited from ClassFieldTheory, CompactOperators, RigidAnalyticGeometry, EtaleCohomologyFoundations, ModularForms and ReductiveGroups exist, and LocalGaloisGroups, GlobalNumberFields and Chebotarev are in `Completed/`. The resolver reports no cross-roadmap citation found nowhere.

### Ownership, overlaps, headlines

- **Overlaps:** `overlaps.md` reports no open pull request changing this roadmap, no dropped id this roadmap cites, and no revision-only id.
- **Consumers resolve:**
  - ArtinRepresentations line 1795 cites §2.10;
  - HilbertModularForms line 2109 cites §§3.15–3.16;
  - HilbertModularVarietiesAndShimuraCurvesPartII lines 318–337 cite §§4.2–4.4;
  - EllipticCurveModularityPartII cites §§6–7. Its declared gaps on §6.2 and §§6.1/6.4 are announced through the board and are not findings here.

  The round-4 test (no citation of `AutomorphicGaloisRepresentations §2.1`–`§2.9`) still holds.
- **Duplication:** no object of this roadmap is owned by another roadmap. Weight-one attachment, classical attachment and residual attachment are cited from AlgebraicModularFormsAndSerreWeights. The raw carrier and `Weak`/`Strict` are cited from SmallRamificationAndAbelianVarietyBaseCases §5.0d and AG2.P.
- **Headlines:**
  - The headline theorems in the Summary are: §3.10; full local compatibility (§§4.4, 4.7); §7.3; ordinary/crystalline realizations (§§4.11, 5.1–5.2); large image (§§7.4–7.5); integral deformation maps (§§6.6–6.12); and §7.7.
  - Hilbert forms, Weil–Deligne/`D_pst` functors and compatible-system carriers are absent at the pins, so only §7.7 is stated. The module docstring names each of the others with its missing carrier.
  - AlgebraicModularFormsAndSerreWeights does state attachment existence on the pinned `AlgHom.IsArithFrobAt` carriers. The classical §7.5 residual statement would additionally need a residual reduction, an `SL₂(𝔽_ℓ)` embedding and a CM predicate. I judged that beyond “a few simple definitions”, so it is not a finding.

## Not verifiable

- **Kisin, *Overconvergent modular forms and the Fontaine–Mazur conjecture*, Prop. 5.14 and Cor. 5.15 (§0.4).** Only the author DVI is cited. The sources service could not fetch it in round 4, and it was not part of this round's sample.
- **T. Saito, *Modular forms and p-adic Hodge theory*, Invent. Math. 129 (1997), Theorem 1 (§§4.5, 5.2).** The manifest records it as `uncertified` (paywalled), cited by locator. That is settled and not requested. Its elliptic content is confirmed by Saito2009, lines 13–15 (p. 1).

## Source issues

- **Misprint** in Blasius at Proposition 5, proof, printed p. 17 (arXiv v1): the source bounds `w(Λ)` in `(−1/2,1/2)` and the twist in `((i−1)/2,(i+1)/2)`, yet concludes `w=i` with `w=2log_q|α|` (§1.9). It should be `(−1,1)` and `(i−1,i+1)`, whose only integer is `i`. Affects nothing.
