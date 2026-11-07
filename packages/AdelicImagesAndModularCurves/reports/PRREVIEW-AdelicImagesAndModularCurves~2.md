# Review of AdelicImagesAndModularCurves (pull request #1727 at 9037f3d)

**Verdict:** needs changes

## R01 (P1) — Mitchell's list drops the invariant-quadric class and mislabels the elliptic congruence

Location: `TauCetiRoadmap/AdelicImagesAndModularCurves/README.md:2449–2457`, “the stabiliser of a quadric (`PSL₂(𝔽_{ℓ²}).2`), the image of `PSL₂(𝔽_ℓ)` under the symmetric cube”.

Claim: 7.3 states, as an owned theorem, that every maximal subgroup of `PSp₄(𝔽_ℓ)` (`ℓ ≥ 5`) is a parabolic, the polar-pair stabiliser `(PSL₂ × PSL₂).2`, "the stabiliser of a quadric `(PSL₂(𝔽_{ℓ²}).2)`", the twisted-cubic group, or exceptional.

Witness: dieulefait lines 77–85 (§2.1, p. 4) list hyperbolic congruence, elliptic congruence and invariant quadric as distinct types. Lines 334–337: the quadric stabiliser is a tensor product of two 2-dimensional representations, one dihedral, not `PSL₂(𝔽_{ℓ²}).2`.

Repair: list the types as the source does. These are a point (with its polar plane), a totally isotropic line, the hyperbolic congruence (two polar non-degenerate planes, `(SL₂ × SL₂).2`), the elliptic congruence (`SL₂(𝔽_{ℓ²}).2`), the invariant quadric (`Sp₂(𝔽_ℓ) ⊗ O₂^±(𝔽_ℓ)`, the stabiliser of two complementary totally isotropic planes, defined over `𝔽_ℓ` or conjugate over `𝔽_{ℓ²}`), the twisted cubic (`ℓ ≥ 7`), and the exceptional groups. Give the `ℓ`-ranges from Bray–Holt–Roney-Dougal Table 8.12, and update the "Proof ingredients" sentence to match. On the repaired list, 7.3's own configuration "a decomposition into two totally isotropic planes" (line 2432) has its own maximal class.

## R02 (P2) — Layer 4 re-plans theorems that two earlier roadmaps own

Location: `README.md:449–450`, “Serre's open image theorem is stated by no roadmap”; §4.2 (lines 1513–1540), §4.3 (lines 1554–1599), and the `ℓ`-adic part of §4.5.

Claim: §4.2 (`ℓ`-adic openness, non-CM), §4.3 (surjectivity for almost all `ℓ`) and the `ℓ`-adic CM openness are planned here, proof routes included.

Witness: NoncommutativeAndEquivariantIwasawa §4.0 (its README line 1917; merge order line 30) owns `elliptic_nonCM_openImage` and the CM `ℓ`-adic openness. EllipticCurveModularityImaginaryQuadratic §5.1 (merge order line 190) owns `nonCM_elliptic_large_residual_primes`. Both name this roadmap as the consumer.

Repair: consume NoncommutativeAndEquivariantIwasawa §4.0 for §4.2 and for the `ℓ`-adic half of §4.5. Consume EllipticCurveModularityImaginaryQuadratic §5.1 for the `SL₂(𝔽_ℓ) ⊆ ρ̄_{E,ℓ}(G_K)` statement of §4.3, and keep here only the determinant upgrade to `GL₂(𝔽_ℓ)` and `GL₂(ℤ_ℓ)` (2.2 with `χ_ℓ` onto `ℤ_ℓˣ` for `ℓ` unramified in `K`) and the adelic assembly §4.4. Add both roadmaps under "Exact supplier contracts" and correct lines 449–450.

## R03 (P2) — The adelic Tate module, its Galois action and the open-image predicates belong to ArithmeticGaloisRepresentations

Location: `README.md:436–438`, “the product over all `ℓ` with its `ẑ`-structure, the identification of its level-`N` quotient with `E[N]`, and the adelic representation do not exist”; Layer 3 ownership at lines 73–78; §3.3 lines 1279–1286.

Claim: `T̂E = ∏_ℓ T_ℓE`, the adelic action, and the "open / finite index / base change / frame independence" API of the images are owned here.

Witness: ArithmeticGaloisRepresentations README line 3896 (§6.1, merge order line 46) defines "the adelic action on `T̂A = ∏_ℓ T_ℓA`". Lines 4176–4181 (§6.4) define `IsPGaloisGeneric` and `IsGaloisGeneric` (adelic image open in `GSp_{2g}(Ẑ)`) with exactly that API.

Repair: consume AGR §6.1's `T̂A` and adelic action for `A = E` (through FF R28.6.1), and AGR §6.4's two predicates. State 4.2/4.4 as `IsPGaloisGeneric`/`IsGaloisGeneric` for `g = 1`. Own here only the `ẑ`-module and frame identification with `GL₂(Ẑ)`, the conjugacy-class images, and their level, index and genus. Correct lines 436–438.

## R04 (P2) — Layer 1's coset invariants duplicate NoncongruenceModularForms and Tau Ceti, and two claims about them are false

Location: `README.md:715–718`, “That it is a non-negative integer is not a formal consequence of the finite data … monotonicity is not formal”; also line 443 (“exist nowhere”) and lines 2507–2509.

Claim: integrality and monotonicity of `genus H` need the Riemann-surface comparison 1.4. The finite formulas `ν₂, ν₃, ν∞, g(H)` exist nowhere.

Witness: Tau Ceti `PermutationTriple.IsConnected.eulerChar_le_two`, `.two_sub_two_mul_genus` (`EulerCharacteristic.lean:149, 208`) and `genus_blockQuotient_le` (`BlockQuotient.lean:570`) prove both combinatorially. NoncongruenceModularForms §§2.1–2.3, 2.5 own these invariants and the `Γ₀(N)` formulas.

Repair: give the objects one owner. Read `ν₂, ν₃`, cusps, widths and genus of `H` as NoncongruenceModularForms' invariants of `Γ̄_{±H}` (§§2.1–2.3, with Tau Ceti's `PermutationTriple.genus`), and cite its §2.5 for the `Γ₀(N)` closed forms. Own here only the reduction to the level-`N` coset model and the `H`-specific facts. Delete the two false sentences. Reconcile lines 2507–2509 with that roadmap's line 1861, which calls this roadmap a consumer, and list it as a supplier. Check: `X₀(11)` gives `12·1 + 0 + 0 + 6·2 = 24 = 12 + 12`.

## R05 (P2) — `mazur_torsion` is unconditional, but README 6.4 proves it only under data hypotheses

Location: `README.md:2220–2225`, “The target takes `rank A_f(ℚ) = 0` as an explicit rank datum … proved here from EI §8.8, EM2 §5.0b, these seven targets and the hypotheses they carry”; `Suggested.lean:390`.

Claim: the chain gives the fifteen-group classification.

Witness: no cited supplier proves `rank A_f(ℚ) = 0` for the order-5-character level-25 orbit; EM2 §6.0e covers trivial character only (its README line 694). The `X₀(27)` step also takes a cubic-field datum (line 2203).

Repair: make the two rank-zero steps owned theorems with a proof route, or declare a precise supplier gap (for example EM2 §6.0e extended to nebentypus newforms), so that the chain is unconditional as the Lean states it. Otherwise say in the module docstring that `mazur_torsion` is proved only under those data. Also drop "under that section's own hypotheses" for EI (lines 341–342, 2177–2178): EI §8.1 and §8.5 are proved targets ("Construct", "Prove"; EI README lines 1075, 1207).

## R06 (P2) — The gap's `needs` sentence is compound and asks for more than 7.2 uses

Location: `README.md:421–424`, “that `ρ_{A,ℓ^∞}(G_K)` is open in `GSp₄(ℤ_ℓ)` for every `ℓ` and that `ρ̄_{A,ℓ}(G_K) ⊇ Sp₄(𝔽_ℓ)` for all but finitely many `ℓ`”.

Claim: this is the contract of `gap:abelian-surface-open-image`.

Witness: lines 427 and 2398–2400 use the gap only for finiteness of `nonmaximalPrimes A`. That needs only the second conjunct (with `χ̄_ℓ` onto `𝔽_ℓˣ` for `ℓ` unramified in `K`), not `ℓ`-adic openness.

Repair: make the `needs` a single sentence: for a principally polarised abelian surface `A/K` with `End(A_K̄) = ℤ`, `ρ̄_{A,ℓ}(G_K) ⊇ Sp₄(𝔽_ℓ)` for all but finitely many `ℓ` (serre1986 §2.3, Théorème 3, p. 97, lines 61–65). No `design/plan.json` carries this slug, so nothing announces it to ArithmeticGaloisRepresentations. The pull-request description should name it.

## R07 (P2) — The proof route of the lifting lemma rests on a non sequitur

Location: `README.md:890–892`, “`SL₂(𝔽_ℓ)` is perfect for `ℓ ≥ 5` …, so the image of `H` mod `ℓ²` contains the commutators `[1 + ℓX, g̃]`”.

Claim: perfectness puts `1 + ℓ𝔰𝔩₂` into the image mod `ℓ²`.

Witness: `[1+ℓX, g̃]` lies in the image only if `1+ℓX` does, which is the claim. Perfectness does not exclude a section. A lift `x` of `[[1,1],[0,1]]` has `x^ℓ ≡ 1 + ℓ(1 + c·y₂₁)N`, `c = ℓ(ℓ−1)(ℓ−2)/6`.

Repair: the image meets the irreducible kernel `𝔰𝔩₂(𝔽_ℓ)` trivially or fully. For `ℓ ≥ 5`, `ℓ ∣ c` gives `x^ℓ ≡ 1 + ℓN ≠ 1`, so no section exists. Keep perfectness for the `GL₂` form only. Test: at `ℓ = 3`, `c = 1` and a section exists (computed: a subgroup of order 24 of `SL₂(ℤ/9)` maps isomorphically onto `SL₂(𝔽₃)`).

## R08 (P2) — The Serre-curve "not sufficient" claim has a non-witness and is false as far as can be checked

Location: `README.md:1388–1392`, “Surjectivity of every `ρ_{E,ℓ^∞}` together with index two at the single level `level S_D` is **not** sufficient”.

Claim: the fibre product of `GL₂(ℤ/4)` and `GL₂(𝔽₃)` over `S₄` is a counterexample.

Witness: on that fibre product `ε(g mod 2)` is the sign of the `S₃`-image, which is `χ_{−3}(det)`. So it lies in `S_{−3}` (level 6), and modulo 6 it is `GL₂(𝔽₂) ×_{S₃} GL₂(𝔽₃)`, of index 6, not 2.

Repair: delete the sentence. The following argument shows the converse holds. With full `ℓ`-adic images, `[G, G]` projects onto `K₂`, `SL₂(ℤ₃)` and the perfect `SL₂(ℤ_ℓ)`. The only common quotient of the first two is through `C₃` (computed: `SL₂(ℤ/27)^ab = C₃`), which is visible at level 6 and forces index 6 there. So index two at `level S_D` gives `G = S_D`.

## R09 (P3) — The gate fails on two code spans broken across lines

Location: `README.md:1363–1364` and `1791–1792`.

Claim: the README passes the `tex` scanner.

Witness: the gate, rerun at this head, reports `tex` at lines 1364 and 1792. Each is a code span opened on one line and closed on the next. The only other failure is `depcheck` NOT IN ORDER, which is the board's to settle.

Repair: keep each span on one line: `χ₅(G_K) ⊆ μ₄ · (1 + 25ℤ₅)` and `j(P) = j(E) ∉ {0, 1728}`. Rerun the gate.

## R10 (P3) — Padding in `Suggested.lean`

Location: `Suggested.lean:148` (the example), `176` `index_pm_of_isFine`, `238` `pslIndex_gamma0_prime_pow`, `283` `nu2_pm`, `296` `pslIndex_div`.

Claim: these are acceptance statements.

Witness: on a scratch copy, `index_pm_of_isFine`, `nu2_pm` and `pslIndex_div` each close with one tactic (shown under Verified sound). The example computes `|GL₂(𝔽₂)| = 6` of a Mathlib group. `pslIndex_gamma0_prime_pow` mirrors the 0.4 "Bridge" Check.

Repair: delete these five from `Suggested.lean`. The README keeps the statements as targets and Checks.

## R11 (P3) — README and Lean names disagree, and Checks name Lean counterparts

Location: `README.md:659–661`, “(`pslIndex_gamma0_prime_pow` in `Suggested.lean`)”, and line 761; the declarations of `Suggested.lean`.

Claim: every Lean name appears in the README, and Checks are prose.

Witness: 25 of 48 declarations are named nowhere in the README, including `exists_genus_eq_natCast`, `level_index_genus_of_almostConjugate`, `kenku_isogenyClassSize`. Checks at lines 659–661 and 761 name `pslIndex_gamma0_prime_pow`, `pslIndex_eq_index_pm`, `Cusps H`.

Repair: name each kept declaration at its milestone (the list is under Verified sound), and remove the Lean names from the Checks.

## R12 (P3) — Supplier citations that do not resolve where cited

Location: `README.md:336–337`, `402`; `309`, `401`, `2018`; `1956`, `1968`; `1974–1975`; links at `294`, `297`, `357`.

Claim: the cited names and sections supply these results.

Witness: FF has no `tate_semisimple`, `tate_end_iso`, `isogenous_iff_localFactors` (only this README uses them). MC2 proves `dim A_f = [K_f : ℚ]` in §16.3; `X(ρ)` is §5.14. Mathlib has no Hasse–Minkowski at the pin. Three links miss `Completed/`.

Repair: cite FF R28.4.5 and R28.4.7 by section, ModularCurvesPartII §16.3 and §5.14, and GlobalQuadraticForms Layer 5 (Hasse–Minkowski isotropy, on main) for 5.8 in place of "the heights roadmap / Mathlib's". Point the links at `../../Completed/…`.

## R13 (P3) — Source locators: imprecise, wrong, or about a typo that is not there

Location: `README.md:1529` “(Serre 1972 §1.12; the formal group of height two)”; `1556` “(Serre 1972, §4)”; `2172` “(Mazur 1977, 1978)”; `1838–1839` “the knowl's list repeats `−27` and omits `−28`”.

Claim: these locators carry the stated results.

Witness: serre1972 §1.12 is multiplicative reduction (line 707); height two is §1.11 Prop. 12 (line 643); Théorème 2 is §4.2, p. 294 (line 1414). Torsion: mazur1977 Theorem (8), p. 35 (lines 112–117). lmfdb_ec_cm line 99 lists −28 and −27 once each.

Repair: cite Serre 1972 §1.11 Prop. 12, and §4.2 Théorème 2, p. 294. Cite Mazur 1977 Theorem (8), introduction p. 35, with Kubert 1976 (`kubert1976`, which Mazur credits there) for the composite levels the chain reconstructs. Delete the "typo in the knowl" remark.

## R14 (P3) — Small statement slips

Location: `README.md:528–529`; `572`; `1643`; `2039–2041`; `2145–2149`.

Claim: as written.

Witness: `Γ(K) ≤ H ⊓ H'` iff `level H ∣ K` and `level H' ∣ K`, so `level(H ⊓ H') = lcm` always. `det Γ(2) = ẑˣ`, so `Γ(1)` and `Γ(2)` have `IsFullDet`, and worked example 6 uses the rational cusps of `Γ(2)`. The other three slips are listed in the repair.

Repair:
- State `level(H ⊓ H') = lcm(level H, level H')`.
- Write "except `Γ(N)` for `N ≥ 3`".
- Define "entangled primes" (line 1643; the term is never defined) or drop it.
- In 5.9 write `w_{p²}`, write "isogenous to" in place of `=`, and put the old part in prose: line 2041 has `\text{…}` inside a code span.
- In 6.3 move the `Aut_K(E)` clause out of the non-CM bullet. Non-CM `E` has `Aut_K(E) = {±1}`, so there the clause is vacuous; its own Check uses a CM curve.

## R15 (P3) — Adelic openness, step 3: a Goursat step is missing before "Hence"

Location: `README.md:1630`, “Hence `H ⊇ ∏_{ℓ ≥ ℓ₀} SL₂(ℤ_ℓ)`”.

Claim: this follows from steps 1–2.

Witness: step 2 only shows that the closed commutator of `H` projects onto `∏_{ℓ ≥ ℓ₀} SL₂(ℤ_ℓ)`. Containing `1 × ∏_{ℓ≥ℓ₀} SL₂` also needs that this perfect factor shares no simple quotient with `∏_{ℓ<ℓ₀} GL₂(ℤ_ℓ)`.

Repair: insert that step. The simple quotients `PSL₂(𝔽_ℓ)` with `ℓ ≥ ℓ₀` are not composition factors of `∏_{ℓ<ℓ₀} GL₂(ℤ_ℓ)`, so Goursat (`Subgroup.goursat`) splits the closed commutator subgroup. This is how serre1972 §4.4 uses MG IV-19 (lines 1618–1622).

## R16 (P3) — README shape and policy

Location: the top-level headings (lines 130, 429, 2492, 2652); §§1.1, 1.2, 1.5, 2.8, 3.1, 3.6, 5.5, 6.2; line 1663; lines 2595–2599; the module docstring of `Suggested.lean`.

Claim: the README follows the house shape.

Witness: no "How to read the build" or "Downstream consumers" heading, though three roadmaps consume §2.2 and Layer 4. `isogenyMatrix`, `isogenyGraph`, `classDegree`, `ν₂/ν₃/width`, `genus`, `IsFibreProduct` have no **Checks.** list. Line 1663 has `\overline{…}` in a code span.

Repair:
- Add the two headings. Downstream consumers: ModularIwasawaMainConjectures (§2.2), NoncommutativeAndEquivariantIwasawa, EllipticCurveModularityImaginaryQuadratic and HyperellipticCurves.
- Give each listed definition three discriminating Checks. For 6.2: the matrix of `14.a`, the graph of `15.a`, and a non-cyclic minimiser rejected.
- Write the closure in prose.
- Delete the 1245-class census (a database computation).
- Name Mitchell's theorem in the module docstring as not stated (long encoding), or state it.

## Verified sound

**Repair of the previous review's findings.** 23 of the 29 are repaired (R20 and R27 in `Suggested.lean`); R12, R17, R18, R25, R28 and R29 are partly repaired.

| Previous | Status | Passage at this head |
|---|---|---|
| R01 | repaired | 2.2 l.896 "hence `H ⊇ SL₂(ℤ_ℓ)` and `H = det⁻¹(det H)`"; Lean `eq_comap_map_det_of_isClosed` |
| R02 | repaired | 4.5 l.1682 "Good reduction at `ℓ` alone does not suffice"; 3.4 l.1333–1340 |
| R03 | repaired | 2.5 l.1046–1047 "Prop. 8.1, whose input group has full determinant" |
| R04 | repaired | 2.6 l.1083 "finitely many of level dividing `M`" |
| R05 | repaired | 5.1 l.1750 total degree `index (±H)`; 5.8 l.1993–1995 |
| R06 | repaired | 5.2 l.1797 "Uniqueness is over the point `P`" |
| R07 | repaired | 5.3 l.1845–1846 "removes only the quadratic twists" |
| R08 | repaired | 6.3 l.2148 "`Aut_K(E)`-orbits" |
| R09 | repaired | 5.9 l.2035 "Its kernel need not be connected" |
| R10 | repaired | 6.1 l.2081 "rank is `0` when … not `K`-isogenous" |
| R11 | repaired | 0.3 l.602 "`det G_{A₄}(ℓ) = det G_{A₅}(ℓ) = 𝔽_ℓˣ²`" |
| R12 | partly | single-label rule l.2438 repaired; Mitchell list now wrong (R01) |
| R13 | repaired | 2.7 l.1113 "the set depends on `N`"; 7.1 l.2365 |
| R14 | repaired | 3.5 l.1379–1384 `D ∈ {1, −4, 8, −8}` |
| R15 | repaired | 2.1 l.866 `(p − 1)² < p(p − 1) < p² − 1` |
| R16 | repaired | 3.5 l.1395 "factors through the determinant only when" |
| R17 | partly | 6.4 l.2192 owned targets; rank data conditional (R05) |
| R18 | partly | declared gap l.419; compound `needs` (R06) |
| R19 | repaired | 2.4 l.979 explicit commutator width; l.1001 no general profinite theorem |
| R20 | repaired | `Suggested.lean:1` `module`; elaboration has only `sorry` warnings |
| R21 | repaired | 5.4 l.1886–1888 `2d < gon_ℚ(X₁(ℓ))` |
| R22 | repaired | 5.4 l.1894–1899 matches belov lines 51–55 |
| R23 | repaired | 6.5 l.2273–2276 ten-vertex tree excluded; Check l.2296 |
| R24 | repaired | 4.1 l.1481 consumes AA.4.2 (AA README line 4354) |
| R25 | partly | README consumes AGR §7.3 (l.2344); Lean keeps a stated local carrier |
| R26 | repaired | 7.3 l.2466 "not verified against a stored list" |
| R27 | repaired | `mazur_torsion` with `≃+ ZMod`, `mazur_torsion_exists`, `exists_red_eq`, lifting, commutator |
| R28 | partly | old padding gone; new padding R10 |
| R29 | partly | Summary, supplier contracts, per-layer Examples/Dependencies, IV-19 attribution fixed; R16 remains |

**Gate and dependency check.** The gate rerun at this head fails only on `tex=2` (R09) and on `depcheck` NOT IN ORDER. The worker's targeted build passed, and my elaboration agrees. The dependency command printed:

```text
NOT IN ORDER: AdelicImagesAndModularCurves (insert it after its last supplier)
depcheck: 239 roadmaps, 2425 edges, 1 problem(s)
```

There is no UPWARD or CYCLE line, and placement belongs to the board. One thing for the board: the last supplier in the order is HyperellipticCurves (line 386, cited in 7.2), but ModularIwasawaMainConjectures (line 365) consumes §2.2. Inserting this roadmap after line 386 therefore makes that citation upward, so the board must move one of the two. CanonicalModelsAndGonality and SatoTateGroups are open new roadmaps that are not yet in the order. Nothing in this pull request changes files outside the folder.

**Lean.** `lake env lean` on `Suggested.lean` elaborates in 5 s with 27 `sorry` warnings and nothing else. I compared every elaborated type in the signature list with its README statement. The one flagged lead is `adelicTateModule`, whose type does not mention `[CharZero F]` or `[IsSepClosed K]`. Those binders are not needed for the carrier, and `finrank_adelicTateModule` carries both. `eq_top_of_isClosed_of_map_eq_top` uses `SpecialLinearGroup.instTopologicalSpace`, which a scratch `rfl` showed is the subspace topology.

The one-tactic probes that closed:
- `simp [pm, ← Subgroup.relIndex_mul_index H.1.le_adjoinNegOne, Subgroup.relIndex_adjoinNegOne_eq_two h]` proves `index_pm_of_isFine`.
- `exact congrArg (fun K => Nat.card (MulAction.fixedBy (SL(2, ℤ) ⧸ congruenceSubgroup K) ModularGroup.S)) (OpenSubgroup.toSubgroup_injective (Subgroup.adjoinNegOne_eq_self_iff.mpr (Subgroup.neg_one_mem_adjoinNegOne _)) : pm (pm H) = pm H)` proves `nu2_pm`.
- `exact Subgroup.index_dvd_of_le (Subgroup.comap_mono fun _ hx => Or.imp (fun h => hHG h) (fun h => hHG h) hx)` proves `pslIndex_div`.

Probes of `level_conj`, `isFullDet_Gamma0Zhat`, `genus_eq_of_isTwist`, `isCongruenceSubgroup_congruenceSubgroup`, `sum_width`, `card_GSp4_zmod`, `exists_Gamma_le` and `red_ext` (`simp` or `exact?`) did not close.

The 25 declarations the README never names: `GL2Zhat`, `continuous_red`, `red_surjective`, `exists_Gamma_le`, `card_GL2_zmod`, `Gamma_le_iff`, `pm`, `IsFine`, `index_pm_of_isFine`, `level_conj`, `isFullDet_Gamma0Zhat`, `congruenceSubgroup`, `isCongruenceSubgroup_congruenceSubgroup`, `congruenceSubgroup_gamma0`, `closure_range_mapGL`, `sum_width`, `nu2_pm`, `exists_genus_eq_natCast`, `pslIndex_div`, `genus_eq_of_isTwist`, `level_index_genus_of_almostConjugate`, `adelicTateModule`, `finrank_adelicTateModule`, `isogenyClassSize`, `kenku_isogenyClassSize`.

**Headline theorems.** These are stated:
- inverse limit: `red_ext`, `exists_red_eq`;
- genus integrality: `exists_genus_eq_natCast`;
- strong approximation and density;
- Serre's lifting in both forms;
- the commutator subgroup;
- twist and Gassmann invariance;
- the rank of `T̂E`;
- Mazur's torsion theorem with realisation (R05);
- Kenku's class sizes.

The module docstring names as not statable, each with its missing carrier: the open image theorems and the CM counterpart (`ρ_E`, geometric endomorphisms), everything on `X_H` (the coarse curve, its Jacobian), the isogeny dictionary (cyclic `K`-isogenies, `X₀(N)`) and the abelian-surface images. Zywina's agreeable-closure proposition is statable but intermediate, so keeping it README-only is acceptable. Mitchell's theorem is not named in the docstring (R16).

**Adversarial pass.** "C" marks a value I computed by enumeration on finite matrix groups, scripts in scratch.

| Statement | Instances | Values on each side | Result |
|---|---|---|---|
| 0.1 `card_GL2_zmod` | N = 1, 2, 9, 12, 25 | both forms 1, 6, 3888, 4608, 300000 | holds |
| 0.2 level of `H ⊓ H'` | `Γ₀(2) ⊓ Γ₀(4)`; general | `Γ(K) ≤ H⊓H'` ⟺ lcm ∣ K; 4 = lcm(2,4) | understated (R14) |
| 0.2 level of `±H` can drop | `{g ∈ Γ(2) : g₁₁ ≡ 1 mod 4}` | `Γ(2)/Γ(4) ≅ M₂(𝔽₂)`, `−I ↦ I` has `A₁₁ = 1`; levels 4, 2 | holds |
| 0.3 Cartan orders | N = 15; ℓ = 13 | 64, 192; 336, 26208/336 = 78 | holds |
| 0.3 `IsFullDet` of standard groups | `Γ(2)` | `det Γ(2) = ker(ẑˣ→(ℤ/2)ˣ) = ẑˣ` | "except Γ(N)" fails (R14) |
| 0.3 exceptional determinants | `A₄` at 5; `S₄` at 13 | 48 = 12·4, det {1,4}, index 10, PSL index 5; 13 ≡ −3 mod 8, index 2184/24 = 91 | holds |
| 0.3/2.1 normaliser of `C_s(2^k)` | k = 1, 2, 3 | normaliser 6; centraliser 16 → 32; centraliser 64 → 128; against `|C_s⁺| = 2, 8, 32` | holds |
| 0.4 `pslIndex` formula | `Γ(3)`, `Γ₀(9)` | 24 = 12·2; 12 = 12·1 | holds |
| 1.1 `Γ₀(N)` widths | 9, 16, 20 | sums 12, 24, 36 = ψ(N) | holds |
| 1.2/1.4 genus | `X₁(13)`, `X₁(21)`, `X_{±1,±7}(25)` | C (i,ν₂,ν₃,ν∞) = (84,0,0,12), (192,0,0,24), (150,10,0,14) → 2, 5, 4 | integral; also combinatorial (R04) |
| 1.3 `Γ₁(ℓ)` cusps | ℓ = 11 | coset ↔ vectors: 5 rational of width 11, one orbit of 5 of width 1 | holds |
| 1.5 covering degree | `Γ₁(11) ≤ Γ₀(11)`; `Γ(3) ≤ ⊤` | 60/12 = 5; 24 vs 12 | holds |
| 2.1 dual numbers | p = 5, 2 | 16 < 20 < 24; 1 < 2 < 3 | holds |
| 2.2 lifting route | ℓ = 3, 5 | `c = ℓ(ℓ−1)(ℓ−2)/6`: 1 ≢ 0 mod 3; 10 ≡ 0 mod 5 | theorem holds, route wrong (R07) |
| 2.2 `ℓ = 2` thresholds | lifts of `S, T` | C: all 64 pairs generate `SL₂(ℤ/8)`; `SL₂(ℤ/4)` has an order-12 subgroup onto `SL₂(𝔽₂)` | holds |
| 2.2 `ℓ = 3` thresholds | `SL₂(ℤ/9)`, `SL₂(ℤ/27)` | C: section of order 24 exists; no proper subgroup onto `SL₂(ℤ/9)` | holds |
| 2.2 `GL₂(ℤ/8)` | characters | C: `G/G'G²` rank 3, mod-4 part rank 2, 2³ − 2² = 4 | holds |
| 2.2 `GL₂` form | `det⁻¹(μ₄(1+25ℤ₅))`; `SL₂(ℤ₅)` | index 5, level 25, residual full; det {1}, not open | holds |
| 2.3 entanglement | `S_{−3}`, `S_{−4}`, `Γ₀(2)×_{ℤ/2}Γ₀(3)` | 2; 1; level 6 = 2·3 with index 2 | holds |
| 2.4 `mem_commutator_iff` | width construction | `[s,t] = [[1,−1],[1,0]]` of order 3 mod 2; `[diag(3,1),T] = [[1,2],[0,1]]`; `x³ = 1` ⟺ `A₃` | holds |
| 2.4 `S_χ` invariants | `S_χ` | pslIndex 2, ν₂ 0, ν₃ 2, one cusp of width 2, g = 1 + 1/6 − 2/3 − 1/2 = 0 | holds |
| 2.5 agreeable | `S₃₇`, `Γ₁(11)`, `Γ(3)` | {37} vs ∅; quotient order 10; intersection {±I}, det 1 (zywina lines 129–132, 2029–2031) | holds |
| 2.6 `genus_eq_of_isTwist` | `⊤` vs `det⁻¹(ker mod 3)` | PSL index 1, 1; genus 0, 0; det index 1, 2 | holds |
| 2.7 isogeny orbits | ⊤ at N = 1, 2; `Γ₀(5)`; `GL₂` at 5 | {(1,1,1)}, adds (2,1,1); 1 and 4; 6, 24, 480; matches lmfdb_isogeny_orbits line 92 | holds |
| 2.8 `level_index_genus_of_almostConjugate` | level, det, `−I` | `Γ(N)/Γ(M)` a union of classes; det constant on classes | holds |
| 3.1 `finrank_adelicTateModule` | each factor | Tau Ceti `finrank_tateModule` (hℓ), `TateModule/Basic.lean:94` | holds; owner AGR (R03) |
| 3.4 CM classification consumed | j = 0, ℓ > 3; j = 1728 | lozano lines 149–166 (maximal or index 3); 113–121 (maximal for p ∤ 8) | holds |
| 3.4 number-field criterion | K ⊇ quintic subfield of `ℚ(ζ₂₅)` | `χ₅(G_K) ⊆ μ₄(1+25ℤ₅)`, index 5, residual can be full | holds |
| 3.5 obstruction | `S₁`, `S_{±8}`, `S_{−4}` | mod 2 order 3; mod 4 all 96; fails mod 4 (serre1972 Prop. 22, lines 2042–2063) | holds |
| 3.5 "not sufficient" | `S₄` fibre product | lies in `S_{−3}`; index 6 at level 6 | witness fails (R08) |
| 4.1 Lie criterion | `GL₂`, `SL₂`, {1} at 5 | dims 4, 3, 0; trace zero 5^{3n}/5^{4n} | holds |
| 4.3 exceptional exclusion | element orders | ℓ − 1 ≥ 6 > 5 for ℓ ≥ 7 | holds; owner ECMIQ §5.1 (R02) |
| 4.4 product lemma | PSL₂ orders | 60 ≠ 168; step 3 gap | R15 |
| 4.5 CM base change | `y² = x³ − x` over `ℚ(i, E[5])` | image 1 vs Cartan 16 | holds |
| 5.1 degrees | `X(5)`; `det⁻¹(ker mod 3)` | 4·60 = 240 = 480/2; total 2 (MC2 §5.10 rank `[GL₂(Ẑ):±H]`) | holds |
| 5.3 `cmDiscriminants C_ns⁺(13)` | 13 discriminants | (D/13) = −1 exactly for −7, −8, −11, −19, −28, −67, −163 | holds |
| 5.3 knowl remark | lmfdb_ec_cm line 99 | −28 present, −27 once | false (R13) |
| 5.4 CM isolated | Abramovich vs `2(ℓ−1)` | `4(ℓ−1) < 7(ℓ²−1)/1600` ⟺ ℓ ≥ 914 | holds for large ℓ |
| 5.4 level reduction | `S_{−3}`, n = 6 | gcd(6,6) = 6 (belov lines 51–55) | holds |
| 5.7 twists over `ℚ(ζ_n)` | ⊤ vs `det⁻¹(ker mod 3)` | 1 vs 2 components | holds |
| 5.8 obstruction bound | `X₀(11)` | 4g² = 4, `{∞, 2, 3, 11}` | holds; supplier wrong (R12) |
| 5.9 Chen | p = 13 | `J₀(13) = 0`; dim `S₂(Γ₀(169))` = 8, plus-part 3 | holds |
| 6.1 Hom rank | `y² = x³ − x`, `37.a1` over `ℚ(i)` | 0; End rank 2 | holds |
| 6.4 chain | excluded orders; genera | minimal set {14,15,16,18,20,21,24,25,27,35,49}; C genera 1,1,2,2,5,12,13; `X_{±1,±7}(25)` 4, squares 0; 4n = 20, 24 ∉ Kenku | holds; data conditional (R05) |
| 6.4 `mazur_torsion` up to isomorphism | `ℤ/16`, `(ℤ/2)³` | orders 16, 8 occur in the list; neither group satisfies the statement | Lean correct |
| 6.5 `kenku_isogenyClassSize` | trees | diameters 4, 3, 2, 1; 10-vertex tree forces scalar mod 4 with det 1; degrees 6, 10, 14, 15, 21, 18, 12 ∈ Kenku; 20, 22, 24 ∉ | {1,2,3,4,6,8} holds |
| 6.6 `N ∣ adelicLevel` | `ℓ^k`, j < k | `1 + ℓ^j M₂` fixes C ⇒ `ℓ^j(ℤ/ℓ^k)² ⊂ C`, not cyclic | holds |
| 7.1 `card_GSp4_zmod` | ℓ = 2, 3; `diag(1,1,u,u)` | 720, 103680; `D J Dᵀ = u J` | holds |
| 7.2 gap | serre1986 Théorème 3 | lines 61–65: open for every ℓ, equal for ℓ large | compound (R06) |
| 7.3 Mitchell | dieulefait lines 77–85 | six geometric types vs five | false (R01) |

**Source sample** (statement, hypotheses, locator):

| Target | Source opened | Result |
|---|---|---|
| 0.3 | MC2 §3.8 names (all resolved); AGR §§4.2–4.5 (README lines 3040–3175) | supplier contents agree; exceptional determinants computed above |
| 1.4 | ModularForms 10A (line 1052), 10B genus formula (line 1117); FuchsianOrbifolds Layers 3–5 | agree |
| 2.2 | dokchitser lines 14–18, 65–74 (Serre IV §3.4 for ℓ ≥ 5; mod 8 ⇒ 2-adic); Elkies arXiv:math/0612734 title; `Matrix.SL2.commutator_eq_top` (`a ≠ 0`, `a² ≠ 1`) | agree; route wrong (R07) |
| 2.3, 2.7 | lmfdb_isogeny_orbits line 92 (fixed cyclic subgroups, M ∣ level) | agree |
| 3.1 | Tau Ceti `TateModule/Basic.lean:94` (needs `(ℓ : K) ≠ 0`); AGR §6.1 line 3896 | agrees; ownership R03 |
| 4.1 | AdelicAlgebraicGroups milestone, its README line 4354 | agrees |
| 5.1 | MC2 §5.10 (rank `[GL₂(Ẑ):±H]`), §5.12 (`D_H = det H̄`) | agrees |
| 5.4 | belov lines 51–55 (Thm 1.1, p. 2), 103–106 (CM via CCS13); CMG §§7.4, 8.6 | agrees |
| 5.7 | MC2 §5.12; twisted curves at §5.14, not §6 | locator R12 |
| 6.4 | mazur1977 lines 112–117 (Theorem (8), p. 35); EI §8.8 (line 1281); EM2 §5.0b; ED §§3.20, 3.23, 3.26 | locator R13; conditionality R05 |
| 6.5 | EM2 §5.0a/§5.0b names; §6.0b j-tables (EM2 line 141) equal to README lines 2257–2258 | agrees |
| 6.6 | EM2 §6.0f contract (line 145, `B(d,H) = 10⁷d²(max{H,985}+4 log d)²`) | agrees |
| 7.1 | AGR §7.3 (line 4457: `J_{2m} = −Matrix.J`, `det g = ν^m`); Mathlib `symplecticGroup` | agrees |
| 7.2 | serre1986 lines 61–68, §2.3 Théorème 3 and corollary, p. 97 | agrees (hypotheses read geometrically) |
| Not sampled but used | zywina lines 129–132 and 2029–2031; rszb Remark 2.3.2 (lines 345–350); serre1972 Prop. 11–13, Th. 2 and 3, Prop. 22 | agree except the locators in R13 |

**Pinned declarations opened.**

Mathlib (21):
- `card_SL_field` (`LinearAlgebra/Matrix/GeneralLinearGroup/Card.lean:129`)
- `isClosedEmbedding_embedProduct` (`Topology/Algebra/Group/Units.lean:116`)
- `Matrix.topologicalRing` (`Topology/Instances/Matrix.lean:168`)
- `adjoinNegOne` and `adjoinNegOne_eq_self_iff` (`NumberTheory/ModularForms/ArithmeticSubgroups.lean:220, 245`); the carrier is `g ∈ 𝒢 ∨ −g ∈ 𝒢`
- `relIndex_adjoinNegOne_eq_two` (same file, line 250)
- `IsCusp` and `widthInfty` (`Cusps.lean:58, 329`)
- `J` and `symplecticGroup` (`LinearAlgebra/SymplecticGroup.lean:59, 102`)
- `rank_two_simple'` (`Projectivization/PSL/PSL2.lean:124`)
- `SL2.commutator_eq_top` (`Matrix/SpecialLinearGroup.lean:804`)
- Hermite's theorem (`Discriminant/Basic.lean:397, 445`)
- `isOpen_of_isClosed_of_finiteIndex` (`ClosedSubgroup.lean:108`)
- `quotient_finite_of_isOpen` (`OpenSubgroup.lean:312`)
- `ZMod.unitsMap` (`Data/ZMod/Units.lean:29`)
- `Subgroup.goursat` (`GroupTheory/Goursat.lean:131`)
- `IsCongruenceSubgroup` (`CongruenceSubgroups.lean:164`)
- no Hasse–Minkowski at the pin.

Tau Ceti (23):
- `zHat.toZMod` (`ZHat/ZMod.lean:115`)
- `zHat.component` (`Component.lean:70`)
- `ringEquivPiPadicInt` and `idem` (`Decomposition.lean:164, 201`)
- `isUnit_iff_toZMod` (`Units.lean:61`)
- `finrank_tateModule` (`EllipticCurve/TateModule/Basic.lean:94`)
- `tateModuleGaloisRepresentation` (`TateModule/Galois.lean:80`)
- `Isogeny` (`Isogeny/Basic.lean:139`; F-rational pullback)
- `degree_comp` (`Degree.lean:185`)
- `Isogeny.ker` (`Kernel.lean:75`)
- `galoisConj` (`Isogeny/Galois.lean:62`)
- `autGroupMulEquiv` (`Aut.lean:303`)
- `Gamma_le_Gamma_of_dvd` (`CongruenceSubgroups/Basic.lean:177`)
- `integerCuspWidth` (`ModularForms/Cusps/Basic.lean:170`)
- `natCard_GL_fin_two` (`GeneralLinearGroup/Card.lean:45`)
- `inertiaSubgroup` (`Inertia/Basic.lean:112`)
- `Subgroup.AlmostConjugate` and its fixed-point criterion (`GroupTheory/AlmostConjugate.lean:92, 231`)
- `PermutationTriple` (`Basic.lean:76`)
- `genus`, `IsConnected.eulerChar_le_two`, `two_sub_two_mul_genus` (`EulerCharacteristic.lean:169, 149, 208`)
- `genus_blockQuotient_le` (`BlockQuotient.lean:570`)

**Cross-roadmap citations resolved** (main, or the open head the index gives):
- ModularCurvesPartII §§3.8, 3.9, 3.12, 5.8–5.17, 6.1, 6.3, 8.3, 9.5–9.8, 13.1, 16.2–16.6, and the named declarations;
- ArithmeticGaloisRepresentations §§2.3, 3.5, 4.2–4.5, 6.1, 6.4, 7.3, 7.5, 7.9–7.11;
- FaltingsFinitenessAndIsogenyTheorems R28.4.5, R28.4.7, R28.6.1–6.6 (names fail, R12);
- EisensteinIdealAndRationalTorsion §§8.1, 8.5, 8.8;
- EllipticCurveModularityPartII §§5.0a, 5.0b, 6.0b, 6.0e, 6.0f;
- EffectiveDiophantineMethods §§3.5–3.11, 3.20, 3.23, 3.26;
- ShimuraVarieties §5.10; CanonicalModelsAndGonality §§2.5, 9.3 and Layers 7–8; FiniteGroupInvariants 7.1, 7.3; AdelicAlgebraicGroups AA.4.2;
- NoncongruenceModularForms Layer 2; NoncommutativeAndEquivariantIwasawa §4.0; EllipticCurveModularityImaginaryQuadratic §5.1;
- ModularForms 10A–10C; FuchsianOrbifolds 3–5; ModularCurves Convention 5 and 8D; EllipticCurves CM vocabulary; ClassFieldTheory Layer 11; SchemeAndStackFoundations §5.11 `weil_bound_via_surfaces`;
- ImaginaryQuadraticClassNumber H3 (the thirteen orders); GlobalQuadraticForms Layer 5.

**Ownership against open pull requests.** I searched by object: `GL₂(Ẑ)`, adelic images, Serre curves, isogeny matrices, Mazur's torsion theorem, agreeable groups, coset invariants and the open image. The only second owners found are the ones in R02–R04. No declaration in `Suggested.lean` shares a fully qualified name with another roadmap.

## Not verifiable

- Serre, *Abelian ℓ-adic representations* (IV-19, IV-23 Lemma 3, IV §2.2 Theorem): a book with no legal copy reachable through the sources service. IV §3.4 is corroborated only through dokchitser lines 14–16.
- Mitchell 1914 and Bray–Holt–Roney-Dougal 2013: not fetched; the latter is paywalled. R01 rests on Dieulefait's recalled list and his §3.5; the exact `ℓ`-ranges for the quadric classes are not certified here.
- Kenku 1982, Mazur 1978, Lang–Trotter 1976, Diamond–Shurman, González-Jiménez–Najman and the Exp. Math. Lemma 2.11, Chen 1998, de Smit–Edixhoven, Baran 2014, BDMTV 2019, Banwait–Cremona, Prasad–Rajan, Khare–Wintenberger, Serre 1987: paywalled per the previous round, or not refetched. `kubert1976` is waived.
- The LMFDB curve labels and torsion data of worked examples 4–9, and the 1245-class census: not checked against the database.

## Source issues

- **Misprint** in serre1986 at §2.3, Théorème 3, printed p. 97 (line 62): the source says hypothesis (i) is that the ring of K-endomorphisms is ℤ; it should be the endomorphisms over K̄, since real multiplication defined only over a quadratic extension keeps the Lie algebra proper; affects a stated result.
- **Error** in lmfdb_isogeny_orbits at the knowl columns.gps_gl2zhat.isogeny_orbits, column description (line 94): the source says that for j ≠ 0, 1728 the triples describe the factorization of Φ_M(j, X); it should say non-CM, since for j = −3375 the two kernels of norm-2 endomorphisms give a double root of Φ₂; affects a stated result.
