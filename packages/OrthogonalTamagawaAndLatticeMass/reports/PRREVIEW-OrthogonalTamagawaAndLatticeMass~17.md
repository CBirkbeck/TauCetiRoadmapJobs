# Review of OrthogonalTamagawaAndLatticeMass (pull request #1222 at de8efdc)

**Verdict:** needs changes

This head is the one the previous review read, and this is a full review of it. There is one blocking finding, R01, and it re-raises H01. Its repair begins with a merge of `origin/main`, which no edit inside the folder can stand in for. R02 and R03 are P3.

## R01 (P2) — The branch pins Tau Ceti `a91d3aa`, but the README is written against `2fd255d9`, where `Suggested.lean` restates three native declarations

Re-raised: H01

**Location.**
- `lake-manifest.json` pins Tau Ceti `a91d3aafa8cd…` and Mathlib `6b7abb3c…`. Main pins `2fd255d9…` and `1b1ccf4b…`.
- `TauCetiRoadmap/OrthogonalTamagawaAndLatticeMass/README.md` line 28: "every Tau Ceti declaration cited in the layers, are those of Tau Ceti at `2fd255d9`".
- `TauCetiRoadmap/OrthogonalTamagawaAndLatticeMass/Suggested.lean` lines 104–126 define `SameGenus`, `genusMass` and `localDensity`.

**Claim.** The README and the acceptance test are written against the libraries the pull request pins.

**Witness.** At `a91d3aa`, 15 of the README's 40 full Tau Ceti paths exist, and 0 of its 10 `IntegralLattice/`-relative paths. At `2fd255d9`, `Genus.lean` 77 (`SameGenus`), `Mass.lean` 91 (`mass`) and `LocalDensity/Basic.lean` 546 (`localDensity`) are native duplicates of the three definitions.

**Why H01's reason does not settle it.**
- H01 says the post-merge form cannot be committed inside the folder before the merge. That is true of what the author can do, but it does not remove the defect.
- At this head CI's `build` check is SUCCESS and GitHub reports the pull request MERGEABLE. Merging it unchanged would therefore put three restatements of native Tau Ceti declarations on main.
- No in-folder text is right at both pins:
  - at `a91d3aa` the natives are absent, so the headlines need local definitions;
  - at `2fd255d9` those local definitions duplicate the natives.

The remaining step is the merge, which a worker or a human has to make.

**Repair.**
1. **Worker or human.** Merge `origin/main` into the branch. This moves the pins to `2fd255d9`/`1b1ccf4b`.
2. **Author, after the merge, inside the folder.** Commit the post-merge form that the H01 repair report already wrote:
   - delete `SameGenus`, `genusMass` and `localDensity`;
   - state `genusMass_eq` and `genusMass_eq_rank_two` with `TauCeti.IntegralLattice.mass` of `nativeLattice G` on the left and `Matrix.localDensity` of the image of `G` in the products;
   - make the matching edits to Scope (line 9) and §1.3 (lines 280–313).

The repair cannot be tested at the branch pins, because the natives are absent there; that absence is the defect. This review's Lean commands run only at the branch pins (see Not verifiable).

## R02 (P3) — The pull-request description contradicts the head

**Location.** `pull-request.md`, in the description's own prose, not the generated `depends-on` and `merge-order` blocks. It says:
- "generic central-isogeny programmes";
- "native orthogonal interfaces in #1181";
- "bounded ordered boundary convergence in #1238";
- "the simply-connected Tamagawa target in #999";
- "typed with 16 intentional admissions".

**Claim.** The description states the roadmap's scope, its suppliers and the state of its acceptance test.

**Witness.**
- README line 11: the central-isogeny comparison "is not part of this roadmap"; τ(Spin) = 1 is not used.
- `Suggested.lean` gives seven `sorry` warnings.
- #1238 merged on 2026-10-20.
- #1181 revises the Completed OrthogonalSpinGroups, cited as on main.

**Repair.** In the description, which the worker edits:
- **Title.** Replace "certified class counts" with "class counts".
- **First sentence.** Replace "exact automorphism/exhaustion certificates" with "exact automorphism orders and mass-saturation class counts".
- **Second sentence.** Replace it with:

  > This includes the separate low-rank branches, the automorphism orders of the twenty-three rootful rank-24 lattices (the Leech order is consumed from CFSGBasicProperties P2-L), the rank-32/40 bounds, and the Spin approximation and Eichler applications. The Tamagawa comparison along a general central isogeny is outside this roadmap.

- **"Dependencies:" sentence.** Replace it with:

  > Dependencies: adelic groups, quotient measures, gauges and strong approximation in #792; shared orthogonal values, pinned gauges and the proper mass identity in #851; the indefinite binary class-number and regulator identity in #1175. TauberianBoundaryConvergence, OrthogonalSpinGroups, IntegralLattices, RootSystems, Rank24LatticeConstructions, CFSGBasicProperties and SporadicOrders are cited as they are on main.

- **"The unchanged native-carrier Suggested.lean …" sentence and the CI-run sentence after it.** Replace both with:

  > Suggested.lean elaborates at the branch pins with seven `sorry` warnings, one for each headline theorem, and no other warning; CI's build check passes on this head.

## R03 (P3) — Milne §24i is cited as pp.535–537, but the section ends on p.536

**Location.** README line 146 ("Milne, *Algebraic Groups* (2022 corrected version), §24i, pp.535–537") and line 610 ("§24i, pp.535–537").

**Witness.**
- `MilneAG` line 22080, printed p.535, begins §24i.
- `MilneAG` line 22149, printed p.536, begins §24j, "The geometrically almost-simple group of types B and D".
- All of printed p.537, from line 22163 on, is §24j.

**Repair.** Write "§24i, pp.535–536" at both lines. That range holds the GSpin/Spin construction, the μ₂ exact sequence and the statement that Spin is the simply connected cover (lines 22102–22137).

## Previous findings

- **R01 of the previous review: not repaired.**
  - The head is unchanged.
  - `lake-manifest.json` still pins Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.
  - README line 28 still names `2fd255d9`.
  - `Suggested.lean` still defines `SameGenus`, `genusMass` and `localDensity` (lines 107, 114 and 121).
  - Held as R01 above.

## Verified sound

### Gate, dependency check, Lean, CI

- **Gate.**
  - The worker's gate (`gate.md`) is `OK`.
  - My rerun on `de8efdc` is also `OK`, with every counter 0, including `outside-folder=0`, `stray-files=0`, `statement-hygiene=0`, `readme-ids-missing=0` and `depcheck=0`.
- **Dependency check** (`--movable`):

  ```text
  depcheck: 233 roadmaps, 2259 edges, 0 problem(s)
  ```

  No UPWARD, CYCLE or `moved:` line. The merge order lists this roadmap at line 149. Its open suppliers are earlier: AdelicAlgebraicGroups at 52, GeometryOfNumbersAndQuadraticArithmetic at 55, ArithmeticStatisticsPartV at 56 and EndoscopicTransferAndUnitaryTraceComparison at 148.
- **Folder.** It holds `README.md`, `Suggested.lean` and `metadata.toml`. `git diff --stat origin/main...HEAD` outside the folder is empty.
- **Elaboration.** `lake env lean` of `Suggested.lean` at the branch pins printed exactly seven `declaration uses 'sorry'` warnings, at lines 133, 148, 179, 186, 190, 194 and 198, and nothing else.
- **Binder audit.**
  - `#check @` was run on all 22 declarations, plus `IntegralLattice.ofGramMatrix`, `Isometry`, `IsEven` and `IsUnimodular`, in one scratch file.
  - The file has no `variable` or `include` line, so no binder can be lost.
  - Each elaborated type matches its README statement. Examples:
    - `genusMass_eq : 3 ≤ n → ∀ G, ↑(genusMass G) = 2·π^(−n(n+1)/4)·∏_{Icc 1 n} Γ(j/2)·det^((n+1)/2)·∏' p : Nat.Primes, (localDensity G p / 2)⁻¹`;
    - `genusMass_eq_rank_two` is a `Tendsto` over `Finset.range N` filtered by `Nat.Prime`;
    - `evenUnimodularMass_eq : 0 < n → 8 ∣ n → …`.
  - Nothing changed.
- **Padding probe.** I replaced each `sorry` by `first | rfl | decide | (simp; done) | (norm_num; done) | infer_instance | (positivity; done)`. All seven theorems fail.
- **CI.**
  - The pull request's `build` check on `de8efdc` is SUCCESS, and GitHub reports it MERGEABLE.
  - That build is CI's build against main's pins. It is evidence that `Suggested.lean` builds after the merge, and it is why R01 matters at the merge.

### Library declarations opened

**At the branch pin `a91d3aa`:**
- `structure IntegralLattice` (`LinearAlgebra/IntegralLattice/Basic.lean` 63: carrier and rational bilinear form);
- `IntegralLattice.Isometry` (`Isometry/Basic.lean` 74): a form `IsometryEquiv` with `map_carrier` onto the target carrier, so `Nat.card` counts genuine automorphisms;
- `IsEven` (`Even.lean` 67): every integral norm is even;
- `IsUnimodular` (`Unimodular.lean` 58): the carrier equals the dual carrier;
- `ofGramMatrix (b) (G) (G.IsSymm)`, by its elaborated signature.

**At `2fd255d9`:**
- `SameGenus` (`Genus.lean` 77: signature together with `localIntegralForm p` equivalence at every prime);
- `mass`/`properMass` (`Mass.lean` 91/100, as `finsum`);
- `sum_inv_natCard_isometry_eq_mass_iff` (`Mass.lean` 221, concluding `Nat.card ι = L.classNumber`);
- `Matrix.localDensity` (`LocalDensity/Basic.lean` 546, normalized by `p^(r·n.choose 2)`);
- `hasProd_inv_half_localDensity_of_card_eq_two_mul_add_one` (`EulerProduct.lean` 109: `HasProd` over the primes not dividing `2 det A`, with value `∏ ζ^(S)(2i)`);
- `specialOrthogonalGroupVolume_eq_prod` (`Geometry/Euclidean/Volume/OrthogonalGroup.lean` 500: `∏_{j=2..n} 2π^(j/2)/Γ(j/2)`);
- `two_mul_pi_rpow_mul_prod_Gamma_eq_two_pow_div_orthogonalGroupVolume` (same file, 516).

I recomputed 2Rₙ = 2∏_{j=1..n} Γ(j/2)/π^(j/2) = 2^(n+1)/(2∏_{j=2..n} 2π^(j/2)/Γ(j/2)), so the README's description of the last identity is right. There is no spinor-genus definition and no Spin group scheme of an arbitrary form at either pin, which bears out the docstring's "not statable" list for 0.1 and 0.3.

### Cross-roadmap citations resolved

Line numbers below are of each README; for open heads, `roadmaps show` output minus its one header line.

**IntegralLattices (main).**
- 0A–0G (line 544) and 2A–2E with 2C (line 687);
- 2G 716; 3C 808; 3E 853; 3F 871; 3I 929;
- B1 1053, B2 1082, B3 1165, B4 1231, B7 1310, B8 1369;
- N0 1429, N1 1468;
- 4A 1507, 4B 1537, 4C 1581, 4E 1660; 5A 1798;
- 6C 2054, 6D 2076, 6E 2110, 6G 2182;
- 7A 2376, 7C 2395, 7E 2474, 7G 2558; 9B 2657.

Its owner table (lines 82–88) gives the following to this roadmap's sections, as the README claims:
- 4D and half of 4E to §0.3;
- 7B to §1.1;
- the Haar bullet of 7C to §1.2;
- 7F to §1.3;
- 7H to §§2.3/3.1;
- 7I to §4.1;
- 7D to §§2.1–2.2.

**Other roadmaps on main.**
- RootSystems (`RepresentationTheory/RootSystems`): 3.2 at 727; 5.1–5.3 at 907/944/993; 6.1 at 1037.
- Rank24LatticeConstructions: Layers 3–6 at 223/251/293/312.
- CFSGBasicProperties: P2-L at 410.
- SporadicOrders: O1 at 280.
- ImaginaryQuadraticClassNumber: H1.4 at 43, H2.2 at 57.
- TauberianBoundaryConvergence: N2 at 51, N3 at 80.
- ReflectionInvariantTheory: §3 at 40; §4 at 68. Its degree table is "acceptance examples", so the README's ownership of the Dₙ/E₆/E₇ orders stands.
- GlobalNumberFields (Completed): Layer 9 at 508, Layer 11 at 571.
- OrthogonalSpinGroups (Completed): Layers 0–3 at 331–769; 2B at 665; 3A at 775 ("Not a milestone", assigning the schemes here); 3B–3D at 785–845. At its open revision's head, 2B is at 1032 and 3A at 1165.
- ReductiveGroups: Layers 0, 3, 5, 6, 7a and 8 at 129, 234, 443, 466, 690 and 1023.
- AlgebraicCodingTheory (Completed): Layer 5 at 240.

**GeometryOfNumbersAndQuadraticArithmetic (open head).**
- 2.2.1 `IntegralQuadraticLattice.ofCarrier` at 511, with q(L) ⊆ R. This is the single lead in `citations.md`.
- 2.4.6 at 619: a DVR, char ≠ 2, positive rank, a reflection of least valuation with determinant −1.
- §3.3 at 1036; 3.3.3 `genusMass` at 1075.
- 3.3.4 at 1088: totally positive, totally real, the stated volume ratio.
- `orthogonalTamagawa_two` at 1123.
- `orthogonalMassGaugeScale` = 2^(−⌊n/2⌋) in odd rank, 1 in even rank, at 1140.
- 3.3.7 at 1174, with "Reductive-quotient orders and canonical local volume" and `finiteOrthogonalOrder` at 1210.

**AdelicAlgebraicGroups (open head).**
- §1.3 at 1258, with the squaring-map example at 1300–1302.
- §2.4 at 2010, with `τ_G = |d_F|^(−d/2) ρ_G⁻¹ ∏ λ_v|ω|_v`.
- §4.2 at 4262. Its "Strong approximation for semisimple groups" target (at 4580) has factorwise noncompactness and the Res_{E/F} reduction, so README line 72 is accurate.

**ArithmeticStatisticsPartV (open head).** "Siegel count of indefinite binary quadratic forms" at 574.

**EndoscopicTransferAndUnitaryTraceComparison (open head).** §6.5 at 2166.

### Ownership and overlaps

- **`overlaps.md`.** It lists no pull request that changes this roadmap and no dropped id.
- **Open roadmaps citing this one.** `roadmaps grep` over all 452 open heads finds one: QuadraticFormsOverABase (cites §§0.1/0.1a at its lines 101–102, 243–247 and 648–686).
  - It consumes O(V,Q) over a field and the characteristic-two O(q) from here, and builds O(Q) over an arbitrary base on top of them. Supply runs one way.
- **LatticePackingsAndPerfectForms (open head, line 153).** It defers the mass, class counts and automorphism orders to this roadmap.
- **Weyl-group orders.** No open or main roadmap states the Dₙ/E₆/E₇ orders as targets. IntegralLattices §6G uses |W(E₇)| and |W(D₆)| only inside its orbit count, as the README says.

### Sources: the seeded sample

| Target | Locator | Checked against | Result |
| --- | --- | --- | --- |
| 0.1 | Milne §24i | `MilneAG` 22080–22137: O, SO, GSpin, the spinor norm, the exact sequence with μ₂, X(T) = P(Φ), char ≠ 2 | Supports the statement. The page range is R03 |
| 0.1a, 2.2 | Cho v3 §4.1, p.16 | `Cho` 753–760: O(V̄,q̄)_red, disconnected in positive even dimension, SO in odd dimension | Correct |
| 2.2 | Cho v3 Def. 2.1(c), p.3 | `Cho` 117: the zero lattice is modular of parity type II | Correct |
| 2.2 | Cho v3 §2.3 and Rem. 2.6, pp.5–6; Rem. 2.8, p.6 | `Cho` 208–264: A_i, X, B, e, W, Y, Z (Z is the quadratic radical inside Y); refined types and bound/free; A_i = L_i ⊕ ⊕_{j≠i} 2^max(0,i−j) L_j (271) | Correct; Cho's ⟨x,y⟩ = ½(q(x+y)−q(x)−q(y)) (94) gives q(x) = B(x,x) |
| 2.1 | Cho v3 Thm 3.7, p.15 | `Cho` 744: 𝒢 is smooth, with 𝒢(R) = Aut for étale R | Correct |
| 2.2 | Lem. 4.2 and Rem. 4.3, p.18; Thm 4.12, p.24 | `Cho` 883–897 (α, β, images by type); 1191–1197 | Correct |
| 2.2, 2.3 | Lem. 5.1, p.24; Thm 5.2 and Rem. 5.3(i), p.25 | `Cho` 1223–1265: β_L = (1/[O:SO]) f^N f^(−dim O) #𝒢̃(κ), with N containing +c | Correct |
| 0.3 | O'Meara 104:4–5 | — | Uncertified (Not verifiable) |
| 1.1 | Belolipetsky–Gan v2 §2, pp.2–3 | `BelolipetskyGan` 64–139: double cosets, Γ_α ⊂ SO, Mass as a quotient volume, d ≥ 3 | Correct |
| 1.2 | BG §2, p.3 (real gauge) | `BelolipetskyGan` 103–126: μ_cpt has volume 1, μ_sp = γ_G μ_cpt | Correct |
| 3.1 | BG Thm 3.1, p.4; Cor. 5.3, p.7; p.11 | `BelolipetskyGan` 163–182, 288–290 and 451 (λ = 1 for even unimodular) | Correct. BG's mass is the proper mass, as the docstring says |
| 1.2, 1.3, 2.3 | Conway–Sloane (2), (3), p.263; (6), p.266; §12, p.281 | `ConwaySloaneMass` 185–200 ((2) for n ≥ 2, product over all p); 315–341; 1086–1104 (α_p = N/p^(rn(n−1)/2), m_p = p^(s(n+1)/2)/α_p) | Correct. ∏ 2m_p = det^((n+1)/2) ∏ (α_p/2)⁻¹ is exactly `genusMass_eq` |
| 3.1 | CS §9(iv), p.274 | `ConwaySloaneMass` 711–713 | Correct |
| 4.1 | Fomin–Reading v3 §2.5, Fig. 2.8, p.24 | `FominReading` 898–925: Dₙ 2ⁿ⁻¹n!, E₆ 2⁷3⁴5, E₇ 2¹⁰3⁴5·7 | Correct |
| 4.1 | Chenevier–Lannes v2, Ch. II, Cor. 3.6, p.41 | `ChenevierLannes` 1589–1590 (printed page 41 at 1627) | Correct |
| 4.2 | CL Thms 3.16–3.17, p.48 | `ChenevierLannes` 1886–1893 (page 48 at 1897) | Correct |
| 4.2 | Borcherds norm-zero table | `BorcherdsTables` 5–81: 23 factors and Leech 8315553613086720000 | The exact sum is M₂₄ (row 24) |
| 0.2, 1.4, 4.3 | no external source locator (deductions, and supplier and library inputs) | the supplier sections above | Resolved |

### Adversarial table

Every value below was computed in this review. The densities were brute-forced by counting solutions of XᵀAX ≡ A modulo pʳ column by column. The masses use exact rational arithmetic with B₁ = −1/2 from the recurrence. The rank-two products are ordered partial products over the primes below 2·10⁶.

| # | Statement | Instances | Values on each side | Result | Change |
| --- | --- | --- | --- | --- | --- |
| 1 | 0.0 Checks | diag(1,2), A = [[1,1],[0,1]]; empty matrix | AᵀGA = [[1,1],[1,3]]; \|O\| = 4, \|SO\| = 2; empty: det 1, one automorphism | True | none |
| 2 | 0.1 rank-four factor | x²+y²+z²+w²; x²+y²+z²+2w² | (e₁e₂e₃e₄)² = +det: d = 1 (square, two factors); d = 2 (nonsquare, one Res factor) | True | none |
| 3 | 0.1 rank two | ax²+by² | (e₁e₂)² = −ab = −det C, so Spin is the norm-one torus of K[t]/(t²+det C) | True | none |
| 4 | 0.1a orders | xy and x²+xy+y² over 𝔽₂; f = 4; z²+xy | 2·(2−1) = 2; 2·(2+1) = 6; 6 and 10; 2·(4−1) = 6 | True | none |
| 5 | 0.2 transpose | C = diag(1,4), M = [[0,1/2],[2,0]] | MCMᵀ = diag(1,4); MᵀCM = diag(16,1/4) | True | none |
| 6 | 0.3 factor hypothesis | AA.4.2 semisimple target | factorwise noncompactness and Res_{E/F}, as in README line 72; a product with a definite norm-one factor fails | Consistent | none |
| 7 | 1.1 proper weights | A₂; [[4,1],[1,6]] | 1/6 = 2·(1/12); 1/2+1/2+1/2 = 3/2 = 2·(3/4) | True | none |
| 8 | 1.2 gauge | n = 3, 4 | V₃ = 2π·4π = 8π², s₃V₃ = 4π²; V₄ = 16π⁴; tB: t^(n(n+1)/2) cancels | True | none |
| 9 | Brute-force densities (1.3, 2.2) | ⟨1⟩, ⟨2⟩, U, [[1,1],[1,2]] at 2; ⟨1⟩ at 3 | 4 (r = 3–5); 8 (r = 4,5); 4 (counts 32, 64); 8; 2 | Match the Checks | none |
| 10 | Brute-force densities | I₂ at 2; I₃ at 2 and 3 | 128 mod 2⁴, so 8; 6144 and 49152, so 12; 48 and 1296, so 16/9 | Match | none |
| 11 | Brute-force densities | diag(1,3), A₂, [[4,1],[1,6]], diag(1,5) | at 2: 4 (64, 128, 256 at r = 4–6), 12, 4, 8; at the odd bad prime: 12, 12, 92 (formula 4p), 20 | Match | none |
| 12 | Cho Thm 5.2 on ⟨1⟩, ⟨2⟩, U, E₈ | N = 1, 2, 2, 8; #𝒢̃(𝔽₂) = 2, 2, 2, 348364800 | α₂ = 4, 8, 4, and 348364800/2²⁰ = 42525/128 = 2·2⁸·(15/16)(3/4)(15/16)(63/64) | Match the §2.2 and §2.3 Checks | none |
| 13 | `genusMass_eq` | I₃ | (1/π²)(1/6)(π²/8) = 1/48; the numeric right side 0.0208333327 | True | none |
| 14 | `genusMass_eq` | E₈ | 2R₈ = 135/(8π¹⁶); times 2⁻⁸ζ(2)ζ(4)²ζ(6) gives 1/696729600 | True | none |
| 15 | rank hypothesis `3 ≤ n` | ⟨1⟩ | expression 2·(1/2) = 1 versus mass 1/2 | Needed | none |
| 16 | `genusMass_eq_rank_two` | I₂, A₂, [[4,1],[1,6]], diag(1,3), diag(1,5) | partial products 0.1250066, 0.0833372, 0.7500620, 0.2500116, 0.2500132 against 1/8, 1/12, 3/4, 1/4, 1/4 | True | none |
| 17 | 1.4 local identity and B8 | A₂; −23; diag(1,3); diag(1,5) | 1/24 = √3/(24√3); 1/184; 1/8; 1/40. B8: 1/12, 3/4, 1/4, 1/4 | True | none |
| 18 | 1.4c ordinary and narrow | D = 5 (s = 4); D = 12 (s = 2) | h⁺/h = 1, R⁺/R = 2; h⁺/h = 2, R⁺/R = 1 | True | none |
| 19 | 2.1 kernels | rank 2 over 𝔽₄ | f^d = 4¹ = 4 | True | none |
| 20 | 2.3 bad factors | A₂, −23, E₈ | 6, 6; 2, 46; 42525/256; without 2⁸ the answer is 256 times too large | True | none |
| 21 | `bernoulliFullMass`, `evenUnimodularMass_eq` | m = 0, 4, 8 | 0; 1/696729600; 691/277667181515243520000 | True | none |
| 22 | BG proper mass | E₈ | 2·4320/(2π)¹⁶·ζ(2)ζ(4)²ζ(6) = 1/348364800 = 2M₈ | True | none |
| 23 | `rank16_classNumber` | 2·696729600², 2¹⁵·16! | 970864271032320000, 685597979049984000; reciprocal sum = M₁₆ exactly | True | none |
| 24 | `rank24_classNumber` | 23 Borcherds factors × Weyl orders, plus Leech | Σ = 1027637932586061520960267/129477933340026851560636148613120000000 = M₂₄ | True | none |
| 25 | 4.2 Checks | A₁²⁴; 24! instead; D₄⁶ with 384 | 4107449023856640, 3.067% of M₂₄; 0.96933·M₂₄; 0.99885·M₂₄; 15 rows have a D/E component | True | none |
| 26 | 4.1 Weyl orders | D₄; E₆; E₇; E₈ | 192; 72·720 = 51840 = ∏dᵢ; 126·23040 = 2903040 = ∏dᵢ; 240·2903040 = 696729600 | True | none |
| 27 | `rank32_…`, `rank40_classNumber_lower_bound` | 2M₃₂, 2M₄₀ | 80618465.871; 8.786·10⁵¹; both bounds strict | True | none |
| 28 | R01 pin | the three Gram definitions | a91: natives absent. 2fd: `Genus.lean` 77, `Mass.lean` 91, `LocalDensity/Basic.lean` 546 | Defect | R01 |
| 29 | R03 locator | Milne §24i | starts at p.535 (22080); §24j starts at p.536 (22149) | Overshoots | R03 |

### Headline inventory

- **Stated.** `genusMass_eq`, `genusMass_eq_rank_two`, `evenUnimodularMass_eq`, `rank16_classNumber`, `rank24_classNumber`, `rank32_classNumber_lower_bound`, `rank40_classNumber_lower_bound`.
- **Named in the module docstring as not statable.**
  - 0.1: there is no Spin scheme of an arbitrary form at either pin.
  - 0.1a.
  - The measure identities of 1.2–1.3.
  - 2.1–2.2.
  - 0.3: no spinor-genus carrier at either pin.
- **Statable but deliberately not stated.** The Weyl orders of §4.1 and the binary identities of §1.4 are supporting targets, not headlines.

## Not verifiable

- **O'Meara, *Introduction to Quadratic Forms*, 104:4–5 (§0.3).** The manifest records it as uncertified and settled, so it is cited by its locator only.
- **Elaboration at main's pins.** The Lean commands this review may run elaborate only at the branch pins. Two things therefore rest on CI's SUCCESS `build` check and the H01 repair report, not on my own run:
  - that `Suggested.lean` builds at `2fd255d9`/`1b1ccf4b`;
  - R01's post-merge form.
- **The density at 23 of [[4,1],[1,6]], α₂₃ = 92.** I did not brute-force it, because level 3 modulo 23³ is too large. It follows from the Conway–Sloane diagonal factors for ⟨u⟩ ⊕ ⟨pu′⟩ (α_p = 4p), which match my brute-forced values for diag(1,3) at 3, A₂ at 3 and diag(1,5) at 5. The partial product to 2·10⁶ also gives 0.7500620.

## Source issues

- none
