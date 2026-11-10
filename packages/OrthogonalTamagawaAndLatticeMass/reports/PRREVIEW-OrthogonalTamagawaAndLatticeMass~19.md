# Review of OrthogonalTamagawaAndLatticeMass (pull request #1222 at 493e3ac)

**Verdict:** needs changes

This is a full review of `493e3ac`, the same head the previous review read; the folder has no changed line since. One finding remains, R01, the stale library pin. It re-raises H01. Everything else checked below is sound: the seeded source sample, the adversarial computations, the cross-roadmap citations, the gate, the dependency check, elaboration, the binder audit and the padding probe.

## R01 (P2) — The branch pins Tau Ceti `a91d3aa`, but the README is written against `2fd255d9`, where `Suggested.lean` restates three native declarations

Re-raised: H01

**Location.**
- `lake-manifest.json` line 8 pins Tau Ceti `a91d3aafa8cd…`, and line 18 pins Mathlib `6b7abb3c…`. `origin/main` pins Tau Ceti `2fd255d9…` and Mathlib `1b1ccf4b…`.
- `TauCetiRoadmap/OrthogonalTamagawaAndLatticeMass/README.md` line 28 says the Tau Ceti declarations of this contract "are those of Tau Ceti at `2fd255d9`, with Mathlib at `1b1ccf4b`".
- `TauCetiRoadmap/OrthogonalTamagawaAndLatticeMass/Suggested.lean` defines `SameGenus` (line 107), `genusMass` (line 114) and `localDensity` (line 121).

**Claim.** The README and the acceptance test are written against the pinned libraries, and `Suggested.lean` restates nothing that those libraries already state.

**Witness.**
- *At the branch pin.* 89 of the README's backticked Tau Ceti names have no declaration with that final component at `a91d3aa`. Examples: `Matrix.localDensity`, `TauCeti.IntegralLattice.mass`, `TauCeti.IntegralLattice.SameGenus`, `TauCeti.IntegralLattice.e8PowLattice`, `TauCeti.IntegralLattice.sum_inv_natCard_isometry_eq_mass_iff` and `RootPairing.card_weylGroup_of_hasCartanType_A`.
- *At main's revision.* `git show 2fd255d9` finds the three native counterparts:
  - `def SameGenus` at `TauCeti/NumberTheory/IntegralLattice/Genus.lean` line 77;
  - `def mass` at `Mass.lean` line 91;
  - `def localDensity` at `LocalDensity/Basic.lean` line 546.

  So at `2fd255d9` the three definitions in `Suggested.lean` restate them on Gram matrices.

**Why H01's reason fails.** The repair report answered: "Not actionable in this package: the folder needs no change, and no folder-only change can repair it. The finding is correct."
- **It concedes the defect.** If the pull request merged as it stands, main would carry three Gram-level restatements of native Tau Ceti objects.
- **The folder does need a change.** The pull request's own description, under "Required before merge", deletes `SameGenus`, `genusMass` and `localDensity`. It restates `genusMass_eq`, `genusMass_eq_rank_two`, `evenUnimodularMass_eq` and the four class counts on the native objects, and edits Scope, Conventions, §0.0, §1.3, §3.1 and Layer 4. That edit cannot be made until the pins move.
- **"No folder-only change" says who must act.** It does not say the defect is absent. The first step lies outside the author's folder, so the roadmap should go to a worker or a human. A re-raise, not an acceptance, is how this review sends it there.

**Repair.**
1. **Worker or human.** Merge `origin/main` into the branch. This moves the pins to Tau Ceti `2fd255d9` and Mathlib `1b1ccf4b`. The pull request changes nothing outside its folder, so the merge does not conflict.
2. **Author, after the merge, inside the folder.**
   - Delete `SameGenus`, `genusMass`, `localDensity`, and any other definition that served only them.
   - State `genusMass_eq` and `genusMass_eq_rank_two` with `(TauCeti.IntegralLattice.mass (nativeLattice G) : ℝ)` on the left. Take the Euler factors from `Matrix.localDensity` of `G.1.map (Int.cast : ℤ → ℤ_[p])`.
   - State `evenUnimodularMass_eq` and the four class counts through `TauCeti.IntegralLattice.e8PowLattice k`, with `TauCeti.IntegralLattice.mass` and `TauCeti.IntegralLattice.classNumber`.
   - Make the matching README edits in §1.3, line 280 and line 282 onward.

This repair cannot be tested at the branch pins, because the native declarations are absent there; that absence is the defect.

## Previous findings

- **R01 (r18): not repaired.** `lake-manifest.json` line 8 still pins `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. README line 28 still names `2fd255d9`. `Suggested.lean` lines 107, 114 and 121 are unchanged. It is held above as R01.

## Verified sound

### Gate, dependency check, elaboration

- **Gate.** The worker's `gate.md` reports `OK`. My rerun on `493e3ac` also reports `OK`, with every counter 0. That includes `outside-folder`, `stray-files`, `statement-hygiene`, `readme-ids-missing`, `sorry-data` and `set_option`.
- **Other changes.** `git diff --stat origin/main...HEAD` outside the folder is empty.
- **Dependency check** (`--movable --pr 1222`) printed:

  ```text
  depcheck: 233 roadmaps, 2263 edges, 0 problem(s)
  ```

  There is no UPWARD, CYCLE or `moved:` line. In `ORDER.txt` this roadmap is at line 149. Its open suppliers all come earlier:

  | Supplier | `ORDER.txt` line |
  | --- | --- |
  | AdelicAlgebraicGroups | 52 |
  | GeometryOfNumbersAndQuadraticArithmetic | 55 |
  | ArithmeticStatisticsPartV | 56 |
  | EndoscopicTransferAndUnitaryTraceComparison | 148 |

  The other suppliers are on main.
- **Elaboration.** `lake env lean` of `Suggested.lean` takes 27 s. It prints exactly seven ``declaration uses `sorry` `` warnings, at lines 133, 148, 179, 186, 190, 194 and 198, and nothing else.
- **Binder audit.** I put `#check @` on all 22 declarations in one scratch copy and elaborated it once. The file has no `variable` or `include` line, so no binder can be lost. Each elaborated type matches its README statement:
  - `genusMass_eq` takes `3 ≤ n` and `G : PositiveGram n`, with a `tprod` over `Nat.Primes`;
  - `genusMass_eq_rank_two` takes the `Filter.Tendsto` of partial products over the primes `p < N`;
  - `evenUnimodularMass_eq` takes `0 < n` and `8 ∣ n`.

  No change was needed.
- **Padding probe.** On the same scratch copy, each of the seven theorems was attempted with `first | rfl | simp | norm_num | decide | infer_instance | exact?`. All seven failed:
  - `exact?` found nothing at lines 139, 181, 187 and 191;
  - line 153 hit a heartbeat timeout;
  - lines 195 and 199 hit the recursion limit.

  None is padding. The proved `gramSetoid` is the only proof in the file, and it is needed to form `GramClass`.

### Sources: the seeded sample, checked at the locators

| Target | Locator in the README | What the text shows |
| --- | --- | --- |
| 0.0 | IntegralLattices §§0B/0E | IntegralLattices (main) line 455: labels 0A–0G name the native declarations of its Tau Ceti table. No external source. |
| 0.1 | Milne §24i, pp.535–536 | `MilneAG` line 22080: §24i opens on printed p.535. Lines 22119–22136, on p.536: the μ₂ sequence, kernel ±1, Spin is the simply connected cover. Line 22149: §24j starts on p.536. |
| 0.1a | Cho v3 §4.1, p.16 | `Cho` lines 753–760, printed p.16: §4.1 defines V̄_i = B_i/Z_i and the maps φ_i to O(V̄_i, q̄_i)_red, which is disconnected in even positive dimension and connected in odd. |
| 0.2 | none external | Internal targets only; the Checks are computed below. |
| 0.3 | O'Meara 104:4–5; AdelicAlgebraicGroups AA.4.2 | O'Meara is uncertified (see Not verifiable). AA.4.2 is at its head; see the citations below. |
| 1.1 | Belolipetsky–Gan v2, §2, pp.2–3 | `BelolipetskyGan` lines 68–80, p.2: standing assumption d ≥ 3; genus indexed by G(F)\G(A_f)/K_L; L_α = V ∩ αL̂. Lines 83–99, p.3: Γ_α, mass as Σ 1/#Γ_α and as the quotient volume. G = SO, so this is the proper mass. |
| 1.2 | Conway–Sloane (2), (3), (6) and §12, p.281; Belolipetsky–Gan §2, p.3 | `ConwaySloaneMass` line 192: (2), on PDF p.5 = printed 263. Line 200: (3), p.263. Line 334: (6), PDF p.8 = 266. Line 1086: §12 on PDF p.23 = 281, with α_p = N(p^r)/p^(r n(n−1)/2) for XᵀAX ≡ A and m_p = p^(s(n+1)/2)/α_p. `BelolipetskyGan` lines 103–121, p.3: μ_cpt, μ_sp and γ_G. |
| 1.3 | Conway–Sloane (2), p.263; §12, p.281 | Line 190: (2) is stated for positive definite forms of dimension n ≥ 2. Lines 318–328, p.266: the initial 2 is τ(SO_n), replaced by 1 in dimensions 0 and 1. Combining with §12 gives the README's 2R_n D^((n+1)/2) ∏(α_p/2)⁻¹. |
| 2.1 | Cho v3, Theorem 3.7, p.15 | `Cho` line 744, PDF p.15: G smooth, with G(R) = Aut_R(L ⊗ R) for étale R. Lines 91–95: A unramified over ℤ₂, ⟨x,x⟩_q = q(x), so q(x) = B(x,x) as the README writes. |
| 2.2 | Cho v3, Def 2.1(c), p.3; §2.3, p.5; Remark 2.6, pp.5–6; Remark 2.8, p.6; Lemma 4.2 and Remark 4.3, p.18; Theorem 4.12, p.24; Lemma 5.1, Theorem 5.2, pp.24–25; Remark 5.3(i), p.25 | All exact:<br>• line 117 (p.3): the zero lattice is modular of type II;<br>• line 208 (p.5): §2.3 starts;<br>• lines 240–256 (p.6): Remark 2.6 and the I/I^o/I^e/II, bound/free and I^e_1/I^e_2 assignment;<br>• line 264 (p.6): Remark 2.8;<br>• lines 883–886 (p.18): α = #free I^e_1 and β = #{j : L_j type I, L_(j+2) type II};<br>• lines 889–897 (p.18): Remark 4.3's image table;<br>• line 1191 (p.24): Theorem 4.12;<br>• lines 1223–1251 (pp.24–25): N_M, N_Q, and β_L = [O:SO]⁻¹ f^N f^(−dim O) #G̃(κ);<br>• lines 1253–1265 (p.25): Remark 5.3(i). |
| 2.3 | Conway–Sloane as above; Cho Theorem 5.2, p.25 | As above. |
| 3.1 | Belolipetsky–Gan Theorem 3.1, p.4; §5 Cor. 5.3, p.7; p.11; Conway–Sloane §9(iv), p.274 | `BelolipetskyGan` line 163 (p.4): Theorem 3.1 with τ(G) = 2. Line 288 (p.7): Cor. 5.3, λ_L = 1 for even unimodular L. Line 451 (p.11): λ_(L_even) = 1. `ConwaySloaneMass` line 711: §9(iv) "Unimodular lattices" on PDF p.16 = 274. |
| 3.2 | none external (Mathlib `bernoulli`) | B₀…B₃₈ recomputed from the recurrence; B₃₈ = 2929993913841559/6 and B₄ = −1/30, as stated. |
| 4.1 | Fomin–Reading v3 §2.5, Figure 2.8, p.24; Chenevier–Lannes v2, Ch. II, Cor. 3.6, p.41 | `FominReading` lines 910–925, printed p.24, in §2.5 (opens line 846): Dₙ 2ⁿ⁻¹n!, E₆ 2⁷3⁴5, E₇ 2¹⁰3⁴5·7, E₈ 2¹⁴3⁵5²7. `ChenevierLannes` line 1589: Corollaire 3.6, rank 16 is D₁₆⁺ or E₈⊕E₈. It sits on PDF p.46 = printed 41, in Chapter II (line 829), before Chapter III (line 1899). |
| 4.3 | none external | Deduced from §§3.1–3.2; values computed below. |

Outside the sample, used by findings or headlines:
- **Chenevier–Lannes.** Théorèmes 3.16–3.17 are at `ChenevierLannes` lines 1886–1893, printed p.48.
- **Borcherds.** The norm-zero table (`BorcherdsTables` lines 5–81) lists the 23 root-system factors and the Leech order 8315553613086720000. A₁²⁴ has /244823040 and D₄⁶ has /2160.

The README flags no locator as unverified.

### Adversarial table (values computed in this review)

| # | Statement | Instances | Values on each side | Result | Change |
| --- | --- | --- | --- | --- | --- |
| 1 | 0.0 Checks | G = diag(1,2), A = [[1,1],[0,1]]; A = diag(2,1) | AᵀGA = [[1,1],[1,3]]; det diag(2,1) = 2, not a unit; \|O\| = 4 (sign matrices), \|SO\| = 2 | True | none |
| 2 | 0.1 rank-two and rank-four branches | ax²+by²; ⟨1,1,1,1⟩; ⟨1,1,1,2⟩ | (e₁e₂)² = −ab = −det C; signed discriminant 1, a square, two factors; 2, not a square, one Res factor | True | none |
| 3 | 0.1 spinor-norm Check | reflections in e₁ and e₁+e₂ for x²+y²+z² | θ = Q(e₁)Q(e₁+e₂) = 1·2 = 2 ∉ ℚ×² | True | none |
| 4 | 0.1a finite orders | f = 2, r = 1 split/nonsplit; f = 4; odd r = 1; r = 0 | 2(2−1) = 2, 2(2+1) = 6; 6, 10; 2·(2²−1) = 6; split formula at r = 0 gives 2(1−1) = 0 against 1 | True; the r = 0 exclusion is needed | none |
| 5 | 0.2 transpose convention | C = diag(1,4), M = [[0,1/2],[2,0]] | MCMᵀ = diag(1,4); MᵀCM = diag(16,1/4) | True | none |
| 6 | 0.3 factor hypothesis | AA.4.2 "Strong approximation for semisimple groups" | supplier requires G′(F_S) noncompact for every F-simple factor, as §0.3 says; ⟨1,1,1,1⟩ with S = {∞}: both SL₁(H) factors compact, so the hypothesis fails | Consistent | none |
| 7 | 1.1 proper weights | A₂; [[4,1],[1,6]]; ℤ³ with k = [[3/5,−4/5],[4/5,3/5]] ⊕ 1 at 3 | m⁺ = 1/6 = 2·(1/12); three proper points 1/2 + 1/2 + 1/2 = 3/2 = 2·(3/4); kᵀk = I since 9/25 + 16/25 = 1, det k = 1, 5 ∈ ℤ₃× | True | none |
| 8 | 1.2 gauge | n = 3, 4; Frobenius metric | V₃ = 2π·4π = 8π², s₃V₃ = 4π², equal to Belolipetsky–Gan's γ_G = (2π)² for d = 3; V₄ = 2π·4π·2π² = 16π⁴; Frobenius scales by (√2)³ = 2^(3/2) | True | none |
| 9 | Local densities, brute-force counts of XᵀAX ≡ A | ⟨1⟩, ⟨2⟩, U, [[1,1],[1,2]] at 2; ⟨1⟩ at 3 | counts 4, 8, 64, 128 at the stable level → α = 4, 8, 4, 8; 2 | Match §1.3 and §2.2 Checks | none |
| 10 | Local densities | I₂ at 2; I₃ at 2 (level 3) and 3 (levels 1, 2) | 128 at 2⁴ → 8; 6144 → 12; 48, 1296 → 16/9 = 2(1 − 3⁻²) | Match | none |
| 11 | Local densities | A₂ at 2, 3; diag(1,3) at 2, 3; diag(1,5) at 2, 5; [[4,1],[1,6]] at 2 | 12, 12; 4, 12; 8, 20; 4 | Match | none |
| 12 | α₂₃([[4,1],[1,6]]) | Conway–Sloane (3) with §12 | m₂₃ = (1/2)(1/2)·23^(1/2), so α₂₃ = 23^(3/2)/m₂₃ = 92 | Match β₂₃ = 46 | none |
| 13 | Cho Theorem 5.2 | ⟨1⟩, ⟨2⟩, U, E₈ at 2 | ⟨1⟩: N = 1, β_Cho = 1, #G̃ = 2, 2β_L = 2·2 = 4; ⟨2⟩: N = 2, 2²·2 = 8; U: N = 2, dim O = 1, #O₂⁺(𝔽₂) = 2, 2·2 = 4; E₈: 2⁹(15/16)(3/4)(15/16)(63/64) = 42525/128 | Match the brute force | none |
| 14 | 2.2 auxiliary lattices | ⟨1⟩⊕⟨2⟩; [[1,1],[1,2]]; [[1,1],[1,0]]; U | B₀ = 2Re₁⊕Re₂, Z₀ = 2L, dim B₀/Z₀ = 1; X₀ = Z₀ = 2L, so I^e_1; q(e₂) = 0, so Z₀ = B₀ and I^e_2; zero set of xy has 3 points, quadratic radical 1 | True | none |
| 15 | `genusMass_eq` | I₃ | 2R₃ = π⁻², β₂ = 6, ∏_(p odd)(1 − p⁻²)⁻¹ = π²/8, right side 1/48 = 1/\|O(ℤ³)\| | True | none |
| 16 | `genusMass_eq` | E₈ | 2R₈ = 135/(8π¹⁶), ∏β_p⁻¹ = 2⁻⁸ζ(2)ζ(4)²ζ(6) = 2⁻⁸π¹⁶/45927000, product 1/696729600 | True | none |
| 17 | `3 ≤ n` in `genusMass_eq` | ⟨1⟩ | right side 2·1·(1/2) = 1, mass 1/2 | Hypothesis needed | none |
| 18 | `genusMass_eq_rank_two` | I₂; A₂; [[4,1],[1,6]]; diag(1,3); diag(1,5) | (2/π)(1/4)(π/4) = 1/8; 1/12; (2/π)·23√23·(1/92)·3π/(2√23) = 3/4; 1/4; (2/π)·5√5·(1/40)·π/√5 = 1/4 | All equal 1/\|O\| sums | none |
| 19 | 1.4c local identity | A₂; Δ = −23; diag(1,3); diag(1,5) | 1/24 = √3/(24√3); 1/184; (1/12)(3/2) = 1/8 = 2√3(3/2)/(24√3); 1/40 = √20/(80√5) | True | none |
| 20 | 1.4c narrow comparison | D = 5; D = 12 | s = 4: h⁺/h = 1, R⁺/R = 2; s = 2: h⁺/h = 2, R⁺/R = 1 | True | none |
| 21 | `bernoulliFullMass` | m = 0, 4, 8 | 0 (from 0/0); 1/696729600; 691/277667181515243520000 | True | none |
| 22 | `rank16_classNumber` | 2·696729600² = 970864271032320000; 2¹⁵·16! = 685597979049984000 | sum of reciprocals = M₁₆ exactly | True | none |
| 23 | `rank24_classNumber` | 23 rows: Weyl order × Borcherds factor, plus the Leech order | Σ = M₂₄ = 1027637932586061520960267/129477933340026851560636148613120000000 exactly | True | none |
| 24 | 4.2 Checks | A₁²⁴ order 2²⁴·244823040; the 24! variant; \|W(D₄)\| = 384 variant | 4107449023856640, share 3.0675% of M₂₄; 0.96933·M₂₄; 0.99885·M₂₄; fifteen rows have a D or E component | True | none |
| 25 | `rank32`/`rank40` bounds | 2M₃₂, 2M₄₀ | 80618465.871…; 8.786·10⁵¹ | True | none |
| 26 | 4.1 Weyl orders | D₄; E₆; E₇; E₈ | 2³·4! = 192; 72·720 = 51840 = 2·5·6·8·9·12; 126·2⁵·720 = 2903040 = 2·6·8·10·12·14·18; 240·2903040 = 696729600 | Match Fomin–Reading Fig. 2.8 | none |
| 27 | 4.1 wrong-stabilizer controls | E₆ walls other than α₁ (D₅); E₇ walls other than α₇ (E₆) | 72·1920 = 138240; 126·51840 = 6531840 | Discriminating | none |
| 28 | R01 pin | README Tau Ceti names | 89 absent at `a91d3aa`, present at `2fd255d9`; 16 file:line citations exact at `2fd255d9` | Defect | R01 |

### Library declarations opened

- **Quoted at `2fd255d9`.** `TauCeti.IntegralLattice.mass` (`Mass.lean` 91) is a `finsum` of `(Nat.card (Isometry c.out c.out))⁻¹` over `genusClasses`. Its docstring says the value is junk 0 for an infinite genus or an infinite O(M). `Matrix.localDensity` (`LocalDensity/Basic.lean` 546) is the ℚ-valued `limUnder` of `localDensityCount r / p^(r·(card n).choose 2)` over `ℤ_[p]`. `SameGenus` (`Genus.lean` 77) is signature equality together with equivalence of `localIntegralForm p` at every prime.
- **Line numbers exact at `2fd255d9`.** Each named line holds the named declaration:
  - `ClassNumber.lean`: lines 76 and 144;
  - `Mass.lean`: lines 100 and 221;
  - `E8Genus.lean`: line 65;
  - `EulerProduct.lean`: lines 109 and 161;
  - `EvenUnimodularGenus.lean`: line 64;
  - `PosDef/EvenUnimodular.lean`: line 84;
  - `DensityExponent/Basic.lean`: lines 154, 164 and 178;
  - `DensityExponent/JordanSplitting.lean`: line 189.
- **Present at the branch pin, so `Suggested.lean` elaborates.** `IntegralLattice.ofGramMatrix` (`Basic.lean` 261), `IntegralLattice.IsEven`, `IntegralLattice.IsUnimodular`, `IntegralLattice.Isometry` and its group. The §0.1 group-scheme names are present at both revisions.

### Cross-roadmap citations resolved

**On main:**
- **IntegralLattices** (active README): 2G, 3C, 3E, 3F, 3I, 4A–4C, 4E, 5A, 6C–6E, 6G, 7A, 7C, 7E, 7G, 9B, N0, N1, B1–B4, B7, B8. Labels 0A–0G and 2C name native declarations (line 455). The assignment table, lines 82–88, gives 4D, 7B, 7D, 7F, 7H and 7I to this roadmap.
- **OrthogonalSpinGroups:** 0A–0F, 2B, 3A–3D and `spinToSpecialOrthogonal`.
- **ReductiveGroups:** Layers 0, 3, 5, 6, 7a and 8.
- **GlobalNumberFields:** Layers 9 and 11.
- **TauberianBoundaryConvergence:** N2 and N3.
- **ImaginaryQuadraticClassNumber:** H1.4 and H2.2.
- **RootSystems** (`RepresentationTheory/RootSystems`): §3.2, §§5.1–5.3 and §6.1. It has no D or E Weyl order, only type A and G₂.
- **ReflectionInvariantTheory:** §3 (∏dᵢ = \|W\|) and §4. The §4 degree table is "acceptance examples", not a Weyl-order target.
- **Rank24LatticeConstructions:** Layers 3–6.
- **CFSGBasicProperties:** P1 and P2-L.
- **SporadicOrders:** O1.
- **AlgebraicCodingTheory:** Layer 5.

**At open heads:**
- **GeometryOfNumbersAndQuadraticArithmetic** (#851): `orthogonalTamagawa_two` for rank ≥ 3; `orthogonalMassGaugeScale n` = 2^(−⌊n/2⌋) in odd rank and 1 in even rank; `compactOrthogonalGaugeVolume`; `orthogonalPinnedGaugeJacobian`; `orthogonalIntegralRealGaugeCompatibility`; §2.2 `IntegralQuadraticLattice.ofCarrier` (this resolves the lead in `citations.md`); 2.4.6; 3.3.3; 3.3.4; and `finiteOrthogonalOrder` under "Reductive-quotient orders and canonical local volume".
- **AdelicAlgebraicGroups** (#792): AA.1.3, whose Checks say the squaring image of 𝔾_m over ℚ is closed, of infinite index and not open; AA.2.4; AA.4.2.
- **ArithmeticStatisticsPartV** (#1175): "Siegel count of indefinite binary quadratic forms".
- **EndoscopicTransferAndUnitaryTraceComparison** (#999): §6.5.

### Ownership and overlaps

- **`overlaps.md`.** No open pull request changes this roadmap, and no cited id is dropped or defined only by an open revision.
- **Closest roadmaps.**
  - LatticePackingsAndPerfectForms (head #1723, README lines 156–160) defers the mass, the class counts and the automorphism orders to this roadmap.
  - ThetaSeries (main, line 154) excludes Siegel–Weil and classification.
  - IntegralLattices on main and its open revisions #617 and #1411 assign Cho's model, 7B, 7F, 7H and 7I here.
- **Other scans.** A scan of every open head for Cho's model, an arbitrary-form Spin scheme, and the D/E Weyl orders 51840 and 2903040 finds no second owner. QuadraticFormInvariantsPartII, GeometryOfNumbersAndQuadraticArithmeticPartII, ClassicalGroupsPartII and GlobalQuadraticForms claim none of these objects.
- **Names.** No declaration in `Suggested.lean` shares a fully qualified name with another roadmap. Its namespace is `TauCetiRoadmap.OrthogonalTamagawaAndLatticeMass`.
- **Remaining duplication.** The only duplication by object is R01's three definitions; at main's pin, GeometryOfNumbersAndQuadraticArithmetic §3.3.3's `genusMass` also covers the ℤ case.

### Headline inventory

- **Stated in `Suggested.lean`:** `genusMass_eq` (§1.3), `genusMass_eq_rank_two` (§§1.3–1.4), `evenUnimodularMass_eq` (§3.1), `rank16_classNumber` and `rank24_classNumber` (§§4.1–4.2), and `rank32_classNumber_lower_bound` and `rank40_classNumber_lower_bound` (§4.3).
- **Named in the module docstring as not statable, with the missing carrier:**
  - §0.1: no Spin scheme of an arbitrary form;
  - §§1.2–1.3 measure identities: no adelic orthogonal Haar or Tamagawa measure;
  - §0.1a: no quadratic-preserving characteristic-two scheme;
  - §§2.1–2.2: no smooth dyadic model;
  - §0.3: no algebraic Spin factors and no proper spinor-genus carrier.

  §1.4 is stated to be steps of the rank-two headline.

Remark, needing no change in the folder: the board manifest `sources.toml` records `MilneAG` as "§24i, pp.535–537". The README's pp.535–536 is the exact range; the worker may align the manifest.

## Not verifiable

- **O'Meara, *Introduction to Quadratic Forms*, 104:4–5 (§0.3).** The manifest records it as uncertified and settled; it is cited by its locator alone.
- **Elaboration at main's pins.** The Lean commands allowed here run only at the branch pins (`a91d3aa`/`6b7abb3c`). Whether `Suggested.lean`, and R01's post-merge form, elaborate at `2fd255d9`/`1b1ccf4b` was not run.
- **Conway–Sloane equation (2).** The text is an OCR of a scan, and the display of (2) is garbled (`ConwaySloaneMass` line 191). Its form was read from the surrounding text at lines 187–194 and 318–328 and from §12, line 1102. All the README's numerical Checks agree with the form so read.

## Source issues

- none
