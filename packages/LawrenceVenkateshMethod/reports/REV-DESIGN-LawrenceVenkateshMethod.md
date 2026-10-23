<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/345#issuecomment-6369661086 -->
Review (claude) of 9ee7ac3

Verdict: rejected

1. **F01** (P1) No independent scope: the identifier duplicates three existing owners

   - **Location:** `packages/LawrenceVenkateshMethod/design/README.md` lines 3–5: "This design identifies the existing owners of the entire brief. It proposes consolidating `LawrenceVenkateshMethod` into the existing Lawrence–Venkatesh roadmap family. It introduces no independent mathematical layers." The same applies to `plan.json`, which has `"scope": []`, `"nodes": []` and `"newStages": 0`.
   - **Claim:** every target of the brief already has an owner, so this roadmap has nothing of its own to plan.
   - **Witness:** a package would have to restate headlines that are already declared: `mordell_finite` (HeightsRationalPointsAndObstructions §6.4), `finite_two_term_unit_equation` (DiophantineApproximationAndTranscendence §2.4) and `sUnitEquation_finite` (MordellLawrenceVenkatesh), each creating a second owner. The alternative is an empty file.
   - **Repair:** a fix worker cannot repair this. A human should retire the identifier (no package job) or record it as an alias of MordellLawrenceVenkatesh. Either way, the corrected owner map from R03–R05 and R10 should be recorded on MordellLawrenceVenkatesh's job. I tested the repair against the brief: every brief item still has an owner (coverage list in Verified sound).

2. **F02** (P1) Part II and the convolution roadmap are treated as supplied, but neither is a roadmap and no gap is declared

   - **Location:** README lines 12–16 (the owner table, which links `MordellLawrenceVenkateshPartII.md` and `SheafConvolutionOnAbelianVarieties.md`; neither file exists in the package). Also the owner lines of §§3, 4, 10–14 and 16, and `plan.json` `"gaps": []`.
   - **Claim:** "Those targets already occur in three accepted plans."
   - **Witness:** `roadmaps grep` finds neither name on main or in any open roadmap pull request, and neither is in `merge-order/ORDER.txt`. Both are only accepted board designs (`packages/<Name>/design/` on board main) with open package jobs. No gap is declared.
   - **Repair:** if the identifier is kept, add one `gaps` entry and a README contract for each consumed target, with the supplier and section. The labels map to sections as follows:
     - Part II label M2.k is the Part II design's Layer k: M2.0 → §§0.1, 0.2, 0.5, 0.7; M2.1 → §1.9; M2.2 → §2.9; M2.3 → §§3.3–3.5; M2.4 → §§4.2–4.3; M2.6 → §6.1; M2.10 → §§10.1, 10.6–10.10.
     - SC labels map to the SC design's sections `classical-monodromy` (SC.6), `generic-big-monodromy` (SC.7) and `uniform-orbit-monodromy` (SC.8).

     With R01's disposition, delete instead.

3. **F03** (P2) Supplier drift: the Weil-polynomial and Frobenius-test inputs are not owned by LV.1

   - **Location:** README line 68: "ArithmeticGaloisRepresentations:R01.5 supplies recognition; the finite-test/Weil-polynomial arithmetic argument is already owned by LV.1." The owners at lines 64 and 204 include `MordellLawrenceVenkatesh:LV.1/weil-polynomials-finite`.
   - **Claim:** LV.1 owns Hermite–Minkowski, the Frobenius test set and Weil-polynomial finiteness.
   - **Witness:** at MordellLawrenceVenkatesh's head, §1.2 needs FaltingsFinitenessAndIsogenyTheorems §R28.5.1 (`finite_weilPolynomials`), and §1.1 extends §R28.5.2 (`frobeniusTestSet`). MordellLawrenceVenkatesh has no Weil-polynomial target, so the cited node does not exist.
   - **Repair:** use these owners instead:
     - Weil polynomials: FaltingsFinitenessAndIsogenyTheorems §R28.5.1.
     - Semisimple test set: FaltingsFinitenessAndIsogenyTheorems §R28.5.2.
     - Trace extension without semisimplicity: MordellLawrenceVenkatesh §1.1.
     - LV Lemma 2.3: MordellLawrenceVenkatesh §1.2.
     - Hermite–Minkowski: ArithmeticGaloisDuality §R02.3.1 (and FaltingsFinitenessAndIsogenyTheorems §R28.1.9).
     - Purity and integrality predicates: WeightsInEtaleCohomology Layer R34.1.

     Delete "already owned by LV.1". I checked this against FaltingsFinitenessAndIsogenyTheorems at its open head (§§R28.5.1–R28.5.2 state exactly these).

4. **F04** (P2) The owners of the S-unit and Mordell statements are left out

   - **Location:** README lines 122–128 (§7, owner `LV.6/s-unit-theorem`) and line 238: "None asserts finiteness of the additive S-unit equation."
   - **Claim:** the S-unit statement is owned by LV.6, and the libraries lack it.
   - **Witness:** DiophantineApproximationAndTranscendence §2.4 on main declares `finite_two_term_unit_equation` (its `Suggested.lean` line 1358): finitely many solutions of `a·x + b·y = 1` in finitely generated `Γ ≤ Kˣ`. With `a = b = 1` and Γ the S-units, that is §7.

     MordellLawrenceVenkatesh §6.10 only proves that declaration. Likewise §11.6 proves HeightsRationalPointsAndObstructions §6.4 `mordell_finite`.
   - **Repair:** §7 should cite DiophantineApproximationAndTranscendence §2.4 as the owner of the statement, with MordellLawrenceVenkatesh §6.10 as the proof route. §9 should cite HeightsRationalPointsAndObstructions §§5.12, 6.4 as the owner, with MordellLawrenceVenkatesh §11.6 as the proof route.

5. **F05** (P2) The restated LS Theorem 8.17 contract is missing its base and its integrality hypotheses

   - **Location:** README line 172, §12: "…this yields non-density of integral points without assuming actual fibres semisimple."
   - **Claim:** strong balance plus the two numerical inequalities give non-density of integral points.
   - **Witness:** LS line 3814 (Theorem 8.17, p. 83) also needs X over ℚ with a smooth model over `ℤ[1/S]`, a polarized integral module with integral Frobenius eigenvalues, and uniform Hodge numbers. Part II §6.1 adds rational Frobenius polynomials. Without a base, "integral points" is undefined.
   - **Repair:** add the missing hypotheses to the sentence: "for X/ℚ with smooth model over `ℤ[1/S]` and V polarized, integral, with integral Frobenius eigenvalues and rational Frobenius polynomials outside S, `𝒳(ℤ[1/S])` is not Zariski dense". This matches LS line 3841 and Part II §6.1.

6. **F06** (P3) Locators: wrong Faltings section, a missing LV page, and an unflagged source correction

   - **Location:** README line 206: "Source: F, §3, Lemma 4, p. 357; §5, Satz 5 and proof, pp. 362–363; Satz 6, p. 363" (repeated at line 343). Also line 106 (statement 5) and line 186 (statement 13).
   - **Witness:** Satz 5 and 6 sit in Faltings's §6 "Endlichkeitssätze" (F line 569, p. 362); §5 is "Endomorphismen". Density under full monodromy is in LV §6 (line 1358, p. 29), not Lemmas 3.1–3.3. LS Corollary 4.10 is printed for any prime ℓ (line 1674).
   - **Repair:**
     - Use "§6, Satz 5 and proof, pp. 362–363; Satz 6, p. 363".
     - Add "§6, p. 29" to statement 5.
     - State that ℓ ≠ p is the corrected form of Corollary 4.10 (see Source issues).

7. **F07** (P3) No sources manifest; the Faltings copy is not from a recognised legal host

   - **Location:** `packages/LawrenceVenkateshMethod/sources.toml` did not exist. README line 342 gives the F URL on a third party's seminar page.
   - **Witness:** the sources service classifies that host as unknown. Its run in this review created the manifest: LV, LS and BT certified, with hashes matching the design. F was recorded as uncertified via its DOI, with a garbled title. GDZ has an open scan (EuDML document 143051).
   - **Repair:** record F from the GDZ copy, correct its title, and drop the seminar-page URL from the README.

8. **F08** (P3) The pins are misstated

   - **Location:** README line 222: "The pinned baseline is Tau Ceti `f790474…` with Mathlib `082e2d3…`". Lines 238–243 treat `Set.unit_fg` as a "current-library observation".
   - **Witness:** the roadmap repository's `lake-manifest.json` pins Mathlib `6b7abb3` and Tau Ceti `a91d3aa`. `Set.unit_fg` is at the Tau Ceti pin (`TauCeti/RingTheory/DedekindDomain/SInteger/Unit.lean` line 149). The three Mathlib names are at `6b7abb3`, in `SInteger.lean` lines 108, 118 and 124.
   - **Repair:** cite `6b7abb3` and `a91d3aa` as the pins, and cite `Set.unit_fg` as a pinned Tau Ceti declaration.

9. **F09** (P3) A proposed citation would create a cycle with HeightsRationalPointsAndObstructions

   - **Location:** README lines 273–274: "HeightsRationalPointsAndObstructions:RP.4 can cite the LV.11 conclusion as another proof route".
   - **Witness:** HeightsRationalPointsAndObstructions is line 104 of `ORDER.txt` and MordellLawrenceVenkatesh is line 113. MordellLawrenceVenkatesh already cites HeightsRationalPointsAndObstructions §§5.12, 6.4, so citing in the reverse direction would make each roadmap cite the other.
   - **Repair:** delete the sentence. The direction stays as it is: MordellLawrenceVenkatesh proves the statement that HeightsRationalPointsAndObstructions declares.

10. **F10** (P3) Atlas stage labels are not resolved to roadmap sections

   - **Location:** README lines 64–204 (`LV.k/…`, `M2.k/…`, `SC.k/…`) and lines 68, 128, 148, 265–271 (`R01.5`, `ED.2`, `RP.4`, `R06.5`, `CR.3`, `RF0–RF4`).
   - **Witness:** at the open heads, `PadicHodgeTheory:R06.5` by content is Layer 8 (geometric comparison); Layer 5 is weak admissibility. The "bundle modifications" of `RelativeFarguesFontaine:RF0–RF4` are its Layers 6–7.
   - **Repair:** cite each by roadmap name and section, resolved by content:
     - `ArithmeticGaloisRepresentations:R01.5` → its Layer 5 (recognition by Frobenius polynomials).
     - `PadicHodgeTheory:R06.5` → §§8.1–8.3.
     - `CrystallineCohomology:CR.3` → §§CR.3.2, CR.3.4.
     - `HeightsRationalPointsAndObstructions:RP.4` → §§4.4–4.5.
     - `EffectiveDiophantineMethods:ED.2` → §§2.29–2.33 (over ℚ only).
     - MordellLawrenceVenkatesh labels: as in the Verified sound table.

     Change "RF0–RF4's … bundle modifications" to "RelativeFarguesFontaine Layers 1–7".

11. **F11** (P3) README form and policy

   - **Location:**
     - README lines 18–25: "PROTOCOL §§9 and 15 require a restructuring proposal … its packet has empty `scope`, `nodes` and `coverage` arrays."
     - Lines 14–16: review job ids.
     - Lines 295–314: planets, node counts, "handoff".
     - Line 311: "The Suggested file imports the existing Mathlib S-integer module".
   - **Witness:** process narrative with job and review ids; no Summary, Scope and ownership, Conventions, supplier contracts, layers, Checks or References sections; three relative links to files absent from the package. The gate refuses `Mathlib.<submodule>` imports.
   - **Repair:** if the identifier is kept, rewrite the README in TauCetiRoadmap form without process words, and use only the single `import Mathlib` line. With R01's disposition, nothing.

The design proposes no layers and no targets. It maps the sixteen targets of its brief to existing owners and asks for the identifier to be folded into MordellLawrenceVenkatesh. I checked that map against the owners as they stand today. The brief really is covered: MordellLawrenceVenkatesh, read at the head of its open roadmap pull request, owns the curve method, the S-unit proof and the Mordell proof. MordellLawrenceVenkateshPartII and SheafConvolutionOnAbelianVarieties own the Lawrence–Sawin branch. Both are accepted designs on the board, each with an open package job. A roadmap with no targets cannot become a package, and fixes cannot change that. So the outcome is a human decision: retire the identifier, or turn it into an alias. Findings R03–R05 and R10 correct the owner map that decision should record. Findings R02 and R06–R11 apply only if the identifier is kept.

## Adversarial table

| # | Statement | Instances tried | Values computed (source / design) | Result | Change |
|---|---|---|---|---|---|
| 1 | Faltings finiteness (LV Lemma 2.3) | K = ℚ, p = 3, T = {3}, d = 1, w = 0; the 3-adic `ℚ₃(−1)`; arithmetic versus geometric Frobenius | Weight 0, integral, d = 1: χ_cyc must be absent; μ(ℚ₃) = {±1}, so 2 characters (trivial, quadratic of ℚ(√−3)), a finite set. `ℚ₃(−1)` at ℓ: geometric eigenvalue ℓ (integral, weight 2), arithmetic eigenvalue ℓ⁻¹ (not integral). LV §2 excludes 3 from S, so `ℚ₃(−1)` is not covered as printed. | Holds with T ∋ places above p and geometric Frobenius, as the design states | None (source issue recorded) |
| 2 | Semilinear centralizer (LV Lemma 2.1) | E/F unramified quadratic, d = 1, φ(x) = aσ(x); d = 2, φ = σ ⊕ σ; d = 0 | d = 1: c·aσ(x) = aσ(c)σ(x) forces c ∈ F, so dim_F Z(φ) = 1 = dim_E Z(φ²) ≤ 1. d = 2: Z(φ) = M₂(F), dim 4 = dim_E M₂(E). d = 0: 0 = 0. The wrong model "E-dimension of Z(φ)" fails because M₂(F) is not an E-space. | Holds | None |
| 3 | Good model and horizontal transport (LV §§3.1–3.3) | p = 2, 3; K_v ramified with e = 2, p = 3 | Convergence radius `|p|^{1/(p−1)}` (LV line 779) against residue disk radius `|ϖ|`. p = 3: 0.577 > 0.333, so the disk is inside. p = 2: radius 0.5 = `|2|`, so the closed disk is not inside the open ball. p = 3, e = 2: `|ϖ|` = 0.577 = radius, which fails. | p > 2 and unramified are both needed, as stated | "Good place" should include v ∉ S (LV line 731); minor |
| 4 | Period maps (LV §3.4) | d = 1, 2; Lagrangian versus ordinary Grassmannian | `dim LGr(2d) = d(d+1)/2`: 1 (= ℙ¹) and 3. Ordinary `Gr(2,4)` has dim 4 ≠ 3. The polarization excludes the wrong model. | Holds | None |
| 5 | Monodromy lower bound (LV Lemmas 3.1–3.3) | Legendre family; an isotrivial family | Legendre: Γ = SL₂, orbit ℙ¹ of dim 1 = dim LGr(2). Isotrivial: Γ trivial, orbit dim 0, constant period map. | Holds; density sentence mislocated | R06 |
| 6 | Curve criterion (LV Prop. 3.4, Lemma 6.2) | r = [L:K_v] ∈ {5, 7, 8}; d ∈ {0, 1, 7} | Condition `r·d(d+1)/2 > 4d²`. r = 8: 4d² + 4d > 4d² for every d ≥ 1. r = 7, d = 7: 196 = 196, not strict. d = 1: r = 5 gives 5 > 4. d = 0: 0 > 0 is false. | "Degree at least 8, d ≥ 1" is exactly the uniform threshold | None |
| 7 | S-unit equation (LV Thm 4.1) | K = ℚ with S = {2, ∞} and S = {∞} | S = {2, ∞}: t = −1 (1 − t = 2), t = 1/2 (1/2), t = 2 (−1); t = 4 gives −3 and t = −1/2 gives 3/2, both excluded. So the set is {−1, 1/2, 2}, matching the Check. S = {∞}: empty. | Holds | Owner of the statement: R04 |
| 8 | LV Prop. 5.3 | deg π = 1; d = 0 | deg π = 1: each orbit has size 1 < 8, so size_v = 1, which is not < 1/(d+1), and the set is empty (true). d = 0: the Lemma 6.2 inequality becomes 0 > 0 and fails, so d ≥ 1 is needed (the design states it). | Holds | None |
| 9 | Mordell (LV Thm 5.4) | Genus 0, 1, 2 | Genus 0: ℙ¹(ℚ) is infinite. Genus 1: `y² = x³ − 2` has (3, 5) since 27 − 2 = 25, and rank 1. Genus ≥ 2 is needed. | Holds | Owner: R04 |
| 10 | Compatible systems (LS Defs 5.2–5.5, Lemma 5.49) | The dual of `ℚ_p(−1)` | `ℚ_p(−1)` has eigenvalue ℓ (integral); its dual has ℓ⁻¹ (not integral). So integral Frobenius is not closed under duals, and a separate predicate is right. Lemma 5.49 assumes only algebraic-integer roots, while LV 2.3 needs ℤ-coefficients. | Holds as a boundary statement | Source issue |
| 11 | Higher-dimensional non-density (LS Thm 6.4) | dim X = 0, 1 | dim X = 0: G_mon/P is a point and Z is the whole space, with codim 0 ≥ 0. Then Φ⁻¹(Z) = Ω = {x₀}, which is dense in X, so the printed statement is false. dim X = 1: Z proper gives a finite preimage. | Design's "positive-dimensional" is needed and present | Source issue |
| 12 | Strong balance and LS Thm 8.17 | LS Example 6.7: G = Δ⁴ ⊂ H⁸, σ = (13)(24)(57)(68) | Classes {12}, {34}, {56}, {78}. σ-orbits {13}, {24}, {57}, {68} each meet 2 classes, and σ maps {12} to {34}. So G is strongly c-balanced exactly for c ≤ 2, matching the source. | Definition matches | R05 (missing hypotheses) |
| 13 | Classical monodromy (LS Thm 3.5, 4.7, Cor. 4.10, Lemma 6.8) | n = 3, i = 2; n = 2, d = 28 | `a(2)+a(3) = 25`, `C(25,5) = 53130`, d = 53130/6 = 8855, and N = 3!·8855 = 53130. n = 2, d = 28 gives N = 56 (E₇), but n > 2 makes this exception vacuous. | Holds; ℓ ≠ p is a correction | R06; source issues |
| 14 | Hypersurface Shafarevich (LS Thm 1.1, 9.2–9.6) | n = 3, d = 17710 = 2·8855 | The primitive theorem (exception d = 8855 only) allows d = 17710. The all-hypersurface theorem excludes it, since 8855 divides 17710, via a degree-2 isogeny pullback with d(H) = 2·d(H′). | Equality versus divisibility as stated | None |
| 15 | Faltings Satz 5/6 and Lemma 4 | g = 1, K = ℚ, S = {11} | One isogeny class contains three isomorphism classes, 11a1, 11a2 and 11a3, so isogeny and isomorphism must not be conflated (the design keeps them apart). | Holds | R06 (section number) |
| 16 | Ax–Schanuel (BT Thm 1.1) | X a curve, Ď = ℙ¹, V = X × {pt} | codim W = 1, codim V = 1, U a point with codim 2. Since 2 < 2 is false, no conclusion, as the source intends. | Strict inequality as stated | None |
| C | Convention: geometric Frobenius for positive weights | H¹ of an elliptic curve at ℓ | Geometric eigenvalues α with `|α| = √ℓ` are integral. Arithmetic eigenvalues `α⁻¹ = ᾱ/ℓ` are not integral. | Convention needed and stated | None |
| K | README Checks (5) | Each evaluated | S-unit set {−1, 1/2, 2} ✓; genus one ✓; 8855 / 53130 ✓; translates infinite when rank A(K) > 0 ✓; non-density versus finiteness ✓ | All true | None |

## Verified sound

- **Sources.** I took the seeded sample of 15 of the 16 targets (seed = job id; target 4 omitted) and also checked target 4, so 16 of 16.
  - 14 locators are exact.
  - Two are partly wrong: target 15 has the wrong section, and target 5 lacks the p. 29 density statement (R06).
  - Theorem numbers, pages and hypotheses checked: LV line 390 (Lemma 2.1), line 426 (Lemma 2.3), lines 702–810 (§§3.1–3.3), lines 813–919 (§3.4, Lemmas 3.1–3.3, Prop. 3.4), line 930 (Thm 4.1), lines 1178 and 1297 (Prop. 5.3), line 1204 (Thm 5.4), line 1426 (Lemma 6.2).
  - LS line 25 (Thm 1.1), line 943 (Thm 3.5), line 1526 (Thm 4.7), line 1669 (Cor. 4.10), lines 1832–1915 (Defs 5.2–5.5), line 2810 (Lemma 5.49), line 2979 (Thm 6.4), line 3109 (Def. 6.6), line 3139 (Lemma 6.8), line 3812 (Thm 8.17), lines 3881–4041 (§9).
  - F lines 367 (Lemma 4, p. 357), 570 (Satz 5, p. 362) and 605 (Satz 6, p. 363).
  - BT lines 33–65 (§1.2, Thm 1.1, pp. 1–2).
  - The SHA-256 values of LV, LS and BT match those recorded in `plan.json`.
- **Owner node ids.** 47 cited owner ids: 25 MordellLawrenceVenkatesh, 18 MordellLawrenceVenkateshPartII, 3 SheafConvolutionOnAbelianVarieties, 1 FaltingsFinitenessAndIsogenyTheorems. 46 resolve; `LV.1/weil-polynomials-finite` does not (R03).
  - MordellLawrenceVenkatesh labels → sections at its open head:
    - LV.0: centralizer → §0.3, finrank → §0.4, unramified → §0.6.
    - LV.1: test set → §1.1, Faltings lemma → §1.2.
    - LV.2: family → §2.1, good model → §2.2, residue disk → §2.5, p-adic Gauss–Manin → §2.9, crystalline Frobenius → §2.11.
    - LV.3: p-adic period map → §3.12, complex period map → §3.13, common series → §3.14, density → §3.18, finite preimage → §3.19.
    - LV.4 → §4.4; LV.6 → §6.10; LV.7 → §7.9; LV.8 → §8.13; LV.10 → §10.10.
    - LV.11: auxiliary place → §11.2, orbit count → §11.4, size bound → §11.5, theorem → §11.6.
  - `FaltingsFinitenessAndIsogenyTheorems:R28.5/shafarevich-finiteness` → §R28.5.11.
  - Part II and SC ids resolve in the board-main designs (mapping in R02).
- **Cross-roadmap citations resolved.** Eight roadmaps read at their open heads: MordellLawrenceVenkatesh, FaltingsFinitenessAndIsogenyTheorems, HeightsRationalPointsAndObstructions, EffectiveDiophantineMethods, ArithmeticGaloisRepresentations, PadicHodgeTheory, CrystallineCohomology, RelativeFarguesFontaine. Three on main: DiophantineApproximationAndTranscendence §2.4, HeightsAndUnits §4.2, ClassicalArithmeticCompletion. Two board designs. Mappings are in R02, R03 and R10.
- **Library declarations opened at the pins.**
  - Mathlib `6b7abb3`, `Mathlib/RingTheory/DedekindDomain/SInteger.lean`: `Set.unit` (line 108), `Set.unit_valuation_eq_one` (line 118), `Set.unitEquivUnitsInteger` (line 124).
  - Tau Ceti `a91d3aa`, `TauCeti/RingTheory/DedekindDomain/SInteger/Unit.lean`: `Set.unit_fg` (line 149), which assumes `[Finite S]` and finitely generated ∅-units.
  - The design's descriptions of all four are accurate.
- **Coverage of the brief.** Each brief item has an owner:
  - period maps: MordellLawrenceVenkatesh Layers 2–3;
  - Faltings finiteness: MordellLawrenceVenkatesh §1.2 with FaltingsFinitenessAndIsogenyTheorems §§R28.5.1–2;
  - dimension and monodromy: MordellLawrenceVenkatesh Layers 3, 4, 7, 10;
  - Mordell: HeightsRationalPointsAndObstructions §6.4 and MordellLawrenceVenkatesh §11.6;
  - S-units: DiophantineApproximationAndTranscendence §2.4 and MordellLawrenceVenkatesh §6.10;
  - Lawrence–Sawin: Part II §§10.6–10.10 with SC.6–SC.8.
  
  The design's boundary notes are correct: RelativeFarguesFontaine is not needed, and EffectiveDiophantineMethods needs effective bounds that qualitative finiteness does not supply.
- **Ownership against open work.** `roadmaps grep` was run over main and the 330 open roadmap pull requests. The only owners of Lawrence–Venkatesh material are MordellLawrenceVenkatesh, FaltingsFinitenessAndIsogenyTheorems, HeightsRationalPointsAndObstructions and WeightsInEtaleCohomology. ClassicalArithmeticCompletion, on main, owns the Eulerian bounds of LS Appendix C. There is no third owner of the design's targets.
- **Dependency gate.** Output:

      candidate: LawrenceVenkateshMethod is not in the merge order yet; checked as if placed after ArithmeticGaloisRepresentations (the intake inserts it when its design is accepted)
      depcheck: 27 roadmaps, 224 edges, 0 problem(s)

  There is no UPWARD or CYCLE line. The placement is a false negative of the gate, not a false positive. The gate did not parse the atlas-form citations (`MordellLawrenceVenkatesh:LV.k/…`). The real last supplier in the order is MordellLawrenceVenkatesh (line 113), and Part II and SC are not in the order at all (R02).
- **Principles.** Nothing is re-planned: every item is an import. There is no computational algorithm, no copied passage, no sorry'd data and no `set_option`.
- **Headline theorems and padding.** There is no `Suggested.lean` at this stage. The brief's headlines (Mordell, the S-unit equation, Lawrence–Sawin) are already declared or planned by their owners. Stating them here would duplicate those owners (R01), so the padding probe was not applicable.

## Not verifiable

- **Elaboration:** not available (this lane does not elaborate). The package has no `Suggested.lean` either, so the `#check @name` comparison could not be done.
- **LV inequality glyphs.** The text layer of LV renders "⩾" and ">" the same way, for example in Lemma 2.3's bound on w and d, Lemma 6.3's degree and Prop. 5.3's genus. Page images could not be rendered on this host.
  - The genus bound follows from the abstract (genus at least two, LV line 8).
  - The degree bound follows from the arithmetic of Lemma 6.2: it uses the equality case 8·d(d+1)/2 = 4d(d+1).
  - Whether Lemma 2.3 allows w = 0 or d = 0 is unresolved. It does not matter: both cases hold by the same argument.
- **Faltings 1983** was read as an OCR text of the GDZ scan. The text is clear enough for theorem and section locators. Its wording was not proof-read.
- **Version collation.** LS arXiv v5 and LV arXiv v3 were not compared with the published versions. The design cites the preprints throughout.

## Source issues

- **Gap** in LV at §2 notation and Lemma 2.3, printed pp. 8–9: the source says Lemma 2.3 concerns representations unramified outside S, where S has no place above p, yet it is applied to p-adic étale cohomology; it should be unramified outside S together with the places above p; affects the proof.
- **Misprint** in LV at §2 notation, printed p. 8: the source says S is a finite set of finite places containing the archimedean places; it should be a finite set of places containing all archimedean places; affects nothing.
- **Error** in LS at Theorem 6.4, printed p. 65: the source says the conclusion holds for every smooth X; it should assume dim X ≥ 1, since for zero-dimensional X the whole flag space qualifies and the residue disk is dense; affects a stated result.
- **Misprint** in LS at Theorem 3.5 and Remark 3.6, printed p. 21: the source says it assumes n > 2 and also excludes n = 2 with d = 28; it should drop that exception, which is vacuous under n > 2; affects nothing.
- **Gap** in LS at Lemma 4.8 and proof, printed pp. 34–35, used in Corollary 4.10, p. 36: the source says avoidance holds for all torsion characters, for any order prime ℓ; it should be restricted to ℓ ≠ p, where the Weil-eigenvalue argument applies; affects a stated result.
- **Gap** in LS at Lemma 5.49 proof, printed p. 61: the source says Faltings finiteness applies given algebraic-integer Frobenius roots; it should also assume integer Frobenius characteristic polynomials, which the invoked LV Lemma 2.3 requires; affects the proof.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "9ee7ac3", "job": "REV-DESIGN-LawrenceVenkateshMethod", "model": "opus", "worker": "fable-rev21"} -->
