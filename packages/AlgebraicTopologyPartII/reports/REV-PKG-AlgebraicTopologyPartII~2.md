<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1073#issuecomment-6394208578 -->
Review (claude) of eabd8fb

Verdict: needs changes

1. **F01** (P2) Four non-headline statements in Suggested.lean

   - **Location.** These declarations in `packages/AlgebraicTopologyPartII/Suggested.lean`:
     - `rationalSphereRanks` (lines 134–141);
     - `fermatDeformationRetraction` (lines 186–194);
     - `fermatBouquet` (lines 196–202);
     - `fermatDoubleLoopSimplyConnected` (lines 204–208);
     - the carriers `fermatFiber` and `fermatSkeleton` (lines 178–184), which only these use.
   - **Claim.** None of these is a headline.
     - `rationalSphereRanks` is the N=1 case of `rationalBouquetRanks`. It is also the input lemma of §4.5, and it mirrors the §4.5 Check (README line 614).
     - `fermatBouquet` is the Fermat case of `tameFibreBouquet`. It mirrors the §4.2 Check (line 549: "the fibre at 0 is the Fermat bouquet with μ spheres").
     - `fermatDeformationRetraction` is the route lemma of §5.3.
     - `fermatDoubleLoopSimplyConnected` is a corollary of the bouquet type plus connectivity of a wedge of S^(n−1), n≥5.
     - The Summary's endpoints (README line 3) include none of them.
   - **Witness.**
     - At N=1, `eulerExponent (s+3) 1 r` vanishes for r≥3, so the two rank formulas agree (`#eval` true for s<12, k<80).
     - For f=Σz_i^k−1, f≡−1 in J_f, so μ⁰=0 and μ=(k−1)ⁿ.
   - **Repair.**
     - Delete the four theorems and the two Fermat carriers from `Suggested.lean`.
     - In the README, remove the backticks from these names at lines 593, 686, 689, 699, 706 and 714. Keep the statements as targets.
     - Tested: the trimmed file elaborates with `lake env lean`, exit 0, with exactly 4 `sorry` warnings (`configurationTraceFormula`, `tameFibreBouquet`, `rationalBouquetRanks`, `doubleLoopBetti`).

2. **F02** (P2) §11.1 silently re-plans AffineMorseLefschetz A2–A3

   - **Location.** README line 1026: "Prove the semialgebraic affine-complex dimension bound Hⁱ(U(C),M)=0 for i>d … using the affine Morse/finite-CW dimension argument … The affine dimension theorem and its field comparison are targets of this section".
   - **Claim.** For smooth U over ℝ, this is the Andreotti–Frankel theorem. A roadmap on main already owns it, and §11.1 neither cites it nor says how its target differs. For singular U, which §11.1's statement and BW Lemma 1.16 (BW line 978) both allow, the named Morse route does not apply as written.
   - **Witness.** `TauCetiRoadmap/AffineMorseLefschetz/README.md`:
     - lines 180–183: CW model of real dimension ≤n "for every smooth affine algebraic submanifold";
     - line 199: cohomology vanishing above d by the universal coefficient theorem.
   - **Repair.**
     - Cite AffineMorseLefschetz A2–A3 in §11.1's *Needs* and in the supplier contracts for smooth U over ℝ.
     - State as this section's own target only the extension to singular affine U and to arbitrary real closed R, with a route for it.
     - Tested on U=𝔾_m over ℝ, d=1: A2 gives a 1-dimensional model, so H²(ℂ*)=0 while H¹=ℤ. This is the existing Check, unchanged.

3. **F03** (P1) The geometry gap names a roadmap that exists nowhere, for objects a main roadmap owns

   - **Location.** README line 86 and the `plan.json` record `real-closed-semialgebraic-geometry` (section "Layers 3 and 6 (Part II extension)"): "Extend the geometry direction of Layers 3 and 6 in RealAlgebraicGeometry, Part II, with finite compatible semialgebraic triangulation, dimension, …".
   - **Claim.** "RealAlgebraicGeometry, Part II" is not on main, in any open roadmap pull request, in the board-packages index, or in ORDER.txt (`roadmaps grep` finds no match). The base roadmap excludes triangulation. A main roadmap already owns triangulation and dimension over ℝ. So the gap is unowned, it is compound (four items), and it would create a second owner.
   - **Witness.**
     - `TauCetiRoadmap/RealAlgebraicGeometry/README.md` line 80 excludes triangulation.
     - `TauCetiRoadmap/AffineMorseLefschetz/README.md` line 33: "A4 owns finite semialgebraic triangulation". Lines 355–362 (A4.1) own family-compatible triangulation and semialgebraic dimension.
   - **Repair.**
     - Cite AffineMorseLefschetz A4.1, and RealAnalyticGeometry R2.1 for the bounded affine theorem, as the owners over ℝ.
     - Readdress the triangulation and dimension request to AffineMorseLefschetz A4.1 as its arbitrary-real-closed extension.
     - Move chart gluing and free quotients into a separate one-item contract. MotivesAndAlgebraicCycles §7.6a already glues X(R) and X(C) from affine charts.
     - Tested on the line-88 Check for R=ℝ: the dimension of a line and the finite model of an interval are A4.1 and R2.1 statements.

4. **F04** (P2) Finite Borel approximation has three owners, and its gap names a section that cannot state it

   - **Location.** Three places:
     - README line 76: `gap:finite-group-borel-approximation`, on SchemeAndStackFoundations §2.23, "for a finite group acting on a site V … a free approximation (V×E_s)/G".
     - Line 302, a supplier contract for MotivesAndAlgebraicCycles §7.6b: "Finite Borel approximation gives equivariant purity…".
     - Lines 825–829: §8.5 "proves their finite Borel approximation formula".
   - **Claim.** Three problems:
     - SchemeAndStackFoundations §2.23 covers ringed spaces with a discrete-group action. It has no site actions and no products with a free G-space, and E_s is never defined in the `needs` sentence.
     - Once the gap is granted, nothing of §8.5 remains but the sphere computation. The gap is this roadmap's own target, moved to a supplier.
     - By the README's own line 302, the supplied purity is built from this formula, so §8.5 sits upstream of its own supplier.
   - **Witness.**
     - `TauCetiRoadmap/SchemeAndStackFoundations/README.md` lines 4560–4562: "a ringed space X (a scheme) with a left action of a discrete group Γ".
     - BW line 469 derives (1.17) from (1.3) and Leray, and BW lines 475–478 obtain purity (1.18) from it.
   - **Repair.**
     - Make MotivesAndAlgebraicCycles §7.6b the single owner. Replace the §2.23 gap with a §7.6b gap: "In §7.6b, expose the finite Borel approximation used for equivariant purity: for G=C₂ on a locally complete semialgebraic V and antipodally on S^s, invariant closed Z and an equivariant sheaf F with descended F_s, H_G,Z^i(V,F)≅H^i_(Z_s)(V_s,F_s) for i<s, compatibly in s."
     - Restate §8.5 as its consumed specialization and keep its two Checks.
     - Tested: V=pt, s=1 gives H¹(RP¹,ℤ)=ℤ against H¹(C₂,ℤ)=0. Agreement holds only below s, as the Check says.

5. **F05** (P2) The tensor-adjoint gap names §2.19, which cannot state it, and asks for what §2.23 already provides

   - **Location.** README line 74: `gap:finite-free-tensor-adjoints` ("In §2.19, for abelian sheaves … on a site with finite-group action, tensoring with a finite-rank free coefficient module … preserves injectives"). Scope line 13 repeats the attribution, and the §16.4 route (line 1448) is its only user.
   - **Claim.**
     - §2.19 is the right adjoint a_f on quasi-coherent derived categories of schemes, with no group actions.
     - The two coefficient modules that §16.4 tensors with are already covered at the pins of earlier roadmaps.
       - ℤ[G]: for finite G, I⊗ℤ[G] ≅ coind(forget I), so §2.23's lemmas apply.
       - ℤ(1): tensoring with it is its own inverse equivalence, so it preserves injectives.
   - **Witness.**
     - `TauCetiRoadmap/SchemeAndStackFoundations/README.md` line 4096 defines a_f on DQCoh. Lines 4570–4571 give `coind_injective` and `forget_injective`.
     - B19 lines 775–777 use the step only for ℤ, ℤ[G] and ℤ(1).
   - **Repair.**
     - Retire the gap.
     - In §16.4 cite SchemeAndStackFoundations §2.23 `forget_injective` and `coind_injective` for ⊗ℤ[G], and the involutive sign twist for ⊗ℤ(1).
     - Update Scope line 13.
     - Tested at a point with G=C₂: ℤ[G]⊗ℤ[G] with diagonal action is ℤ[G]², a coinduced module.

6. **F06** (P2) §12.3 rebuilds Wu's formula without its owner

   - **Location.** Two passages:
     - README line 1114: "the new result is their equality with γ and the surface evaluation".
     - Line 1116: "the second Wu class vanishes by instability, w₁=v₁ and w₂=Sq¹(v₁)=w₁²". The *Needs* (line 1125) name no source of w=Sq(v).
   - **Claim.** The surface evaluation is Wu's theorem plus Euler parity, and other roadmaps own both. The route rederives Wu's formula from the Thom identity, and only the textbook (MILNOR-STASHEFF line 3211) is cited. A citation is not a supplier.
   - **Witness.**
     - TangentialBordism B4 item 3 (open head bf9da30, README line 586): "Construct Wu classes … and prove w(TM)=Sq(v)".
     - CharacteristicClasses (head d077cb4) line 835: w₁ is the orientation-cover class. Line 659: e(TM)[M]=χ(M).
   - **Repair.**
     - Add TangentialBordism B4 item 3 and CharacteristicClasses §§C2.3 and C3.2 to the §12.3 *Needs* and to a supplier contract.
     - Reword: "the new result is the equality γ_X=w(TX(ℝ)); the surface identities apply the cited theorems".
     - Tested on RP²: deg w₁²=1=χ mod 2. On the Klein bottle: 0=0.

7. **F07** (P3) Locator and dependency-list repairs

   - **BS line drift.** README lines 30 and 425 cite "BS line 2199" for Definition 7.3, which is at BS line 2211. Change to BS line 2211.
   - **§9.5 (line 914).** The barred-γ formula comes from BW Remark 1.9, which BW states without proof (BW line 798). As the F09 repair did for §11.4, add "the proof of the formula is a target here".
   - **§12.4 (line 1129).** The locator "B19, Applications pp.91,99,103, B19 line 1118" points at p.91, where B19 uses immersed loops with double points (B19 lines 1131–1135). The embedded transverse representatives are asserted at B19 lines 1640–1643 (p.103), inside a proof. Cite that line, and mark the finite-family form as owned here.
   - **Layer 2 Dependencies (line 417).** Add `TauCeti.FiniteField.fullCycleType_eq_map_natDegree_normalizedFactors`, which the §2.4 *Needs* lists (line 409).
   - **`TauCeti.IsSemialgebraic` (line 64).** The README says "commutative linearly ordered ring". The pin assumes only `[CommRing R] [LinearOrder R]`, with no compatibility between the order and the ring (`TauCeti/Geometry/RealAlgebraic/Semialgebraic/Basic.lean` line 63). Say so.
   - **Line 579.** "additionally Q": write ℚ.

Scope: `packages/AlgebraicTopologyPartII/README.md` (1488 lines), `Suggested.lean` (210 lines), `metadata.toml`, `sources.toml`, and the top-level `gaps` of `design/plan.json`, at board head eabd8fb. The round-1 review and its repair report were checked finding by finding first (table below). Then the passages the repair changed or added got an adversarial pass, the repaired patterns were looked for in the rest of the package, and the 15 seeded targets were read at their locators.

There are 7 findings: one P1, five P2 and one P3. Three of the blocking findings come from the F04 split itself: the repair turned one compound gap into contracts that name sections unable to state them, or a roadmap that exists nowhere. Under this review's rules, padding in `Suggested.lean` is blocking, so R01 is graded P2.

## Round-1 findings: repair status

| Id | Repaired passage (quoted briefly) | Status |
| --- | --- | --- |
| F01 | `plan.json` `gaps` now holds 12 slugged records, each with `supplier` and `section`, e.g. `"slug": "rational-commutative-hspace-hopf" … "supplier": "StableHomotopyKTheory", "section": "3.37"`. The README states each one byte-identically. | Repaired. G1–G15 are gone from `gaps`, G3 included: §4.6 now routes through StableHomotopyKTheory §3.37. Stale strings remain in two frozen design fields that the package stage may not edit: `coverage[].remaining` (plan.json lines 3932–4012) and the old §4.6 node text (lines 1005–1022). The intake does not read them. |
| F02 | `Suggested.lean` line 63 `theorem configurationTraceFormula` and line 127 `theorem tameFibreBouquet`. Docstring line 19: "lacks the free graded-commutative algebra carrier and its rational H-space comparison". | Repaired. Both statements are true (adversarial rows below). |
| F03 | README line 1180: "For every real closed R and smooth quartic threefold X/R with X(R)=∅". Line 161 adds `gap:semialgebraic-fixed-point-trace`. Line 339 cites MorseNovikov N6 for ℝ. | Repaired. `finite-cw-fixed-point-trace` is absent. |
| F04 | Lines 155 and 157 (§7.6a contracts), 74 and 76 (split SchemeAndStackFoundations contracts), 86 (geometry contract "in RealAlgebraicGeometry, Part II"). | Repaired as asked, but with new defects: R03, R04 and R05. |
| F05 | Line 602: §4.4 *Needs* now lists StableHomotopyKTheory §3.36. Line 621: §4.6 applies §3.37 to Ω²X. Line 335 is the Hopf gap. | Repaired. |
| F06 | Line 1020: "The proof does not use the real/étale comparison, which is downstream of this layer." Lines 1150 and 1207 are fixed, headings are capitalised, and the BROUGHTON locator no longer carries an internal code. | Repaired. |
| F07 | §2.3 *Needs* (line 386): `Representation.char_tensor`, `Equiv.Perm.fullCycleType`. The §3.3, §4.3, §4.4 and §5.3 *Needs* (lines 470, 575, 602, 708) are trimmed. | Repaired. One residue: the Layer 2 Dependencies now omit an entry that §2.4 needs (R07). |
| F08 | ω has 3 API bullets and 3 Checks (lines 754–764). ψ has 3 API bullets and 4 Checks (lines 1317–1328). | Repaired. All values recomputed (rows below). |
| F09 | Lines 1076 (SCHEIDERER Cor. 18.11), 1114 (KRASNOV, MILNOR-STASHEFF), 1063 (§11.4 proof owned), 512 ("proof of Proposition 3.2(b)"), 1420 (invariant control data owned), 535 (every fibre), 390 (every class function), 1407 (DIMCA Lemma 4). | Repaired. The same pattern recurs at §9.5 and §12.4 (R07). |
| F10 | `Suggested.lean` lines 134–135: "For the sphere of dimension s + 2 … in degree 2(s + 2) - 1". | Repaired. The theorem itself is padding (R01). |

## Verified sound

**Elaboration.**
- `lake env lean` on `Suggested.lean`, run from the content checkout (main 7bd35ba; Mathlib 6b7abb3, Tau Ceti a91d3aa), takes about 4 s and exits 0.
- Its only output is 8 `declaration uses sorry` warnings, at lines 63, 127, 136, 145, 168, 188, 198 and 206. All three Tau Ceti imports exist and are used.
- Policy checks pass: `open scoped Classical` is not a `set_option`; there is no `lemma`, sorry'd data, `#eval` or `True`.

**`#check @` on all 21 declarations, in one scratch file.**
- There is no `variable` block, so no binder can be lost.
- `configurationTraceFormula` keeps `[Field F] [Fintype F]`.
- `tameFibreBouquet` keeps `2 ≤ n` and `IsTame f`.
- `doubleLoopBetti` has n=s+4 and uses the `doubleLoopFactor` hypotheses.
- Every type matches the README generality.

**One-tactic probe.** 8 theorems × {`simp`, `rfl`, `infer_instance`, `decide`, `trivial`, `aesop`, `norm_num`, `exact?`} = 64 probes, run with the originals removed. All 64 fail with genuine tactic errors. Padding was therefore decided by reading the statements (R01).

**Dependency check.** Output: `depcheck: 48 roadmaps, 543 edges, 0 problem(s)`. There is no UPWARD, CYCLE or moved line.

**Headline theorems.** From the Summary (line 3):
- Endpoints:
  - §3.5: not statable (no compact supports at the pins), and named in the docstring.
  - §5.1: stated.
  - §§9.3–9.4, 10.5, 11.x, 15.4, 15.6: not statable (semialgebraic and equivariant carriers missing), and named in the docstring.
- Build aims also named in the Summary, each stated:
  - "arithmetic traces" (§2.4): `configurationTraceFormula`, CEF Theorem 3.7;
  - "rational homotopy of sphere bouquets" (§4.5): `rationalBouquetRanks`.
- §4.2 (Broughton's theorem): stated. It is how hypersurfaces enter §§4.5–5.1, as in BS line 2363.
- Nothing statable is missing.

**Adversarial table.** Rows were computed by hand or by Lean `#eval`. Rows of untouched text rely on the round-1 table, whose rows all carry values.

| Statement | Instances | Values on each side | Result | Change |
| --- | --- | --- | --- | --- |
| `configurationPermutation` action law | σ=(123), τ=(12), x=(a,b,c) | σ·(τ·x)=σ·(b,a,c)=(c,b,a); στ=(13), (στ)·x=(c,b,a) | holds | none |
| `orderedConfiguration` | m=0, 1, 2 | point; ℂ; (0,1) is in, (0,0) is out | holds | none |
| `configurationTraceFormula`, trivial χ | q=2: m=0..3 | counts 1, 2, 2, 4; cohomology side 1, q, q²−q, q³−q² = 1, 2, 2, 4 | holds | none |
| same, sign χ, m=2 | any q | #split−#irreducible = (q²−q)/2−(q²−q)/2 = 0; each degree term is (1/2)(1−1)=0, since τ acts trivially on H⁰ and H¹(PConf₂) | holds | none |
| same, S₃ classes | q=3, types 111/12/3 | counts 1, 9, 8; formulas (q³−3q²+2q)/6, (q³−q²)/2, (q³−q)/3 = 1, 9, 8 | holds | none |
| same, m=0 | Perm(Fin 0) | `fullCycleType 1 = 0` (by `#eval`); both sides χ(0) | holds | none |
| `IsTame` | x³−3x+y²; x²y−x at (t, 1/(2t)); constant, n≥2 | gradient grows; gradient (0, t²)→0 off every compact set; critical set ℂⁿ | tame; not tame; not tame | none |
| `milnorNumber`, `fiberMilnorNumber` | Fermat n=2, k=3; f=z₁; ℂ[t]/(t³) with t² | μ=4, f≡−1 so μ⁻¹=4 and μ⁰=0; J_f=0; generalized eigenspace dim 3 against kernel 2 | holds | none |
| `tameFibreBouquet` | x³−3x+y², a=0 and ±2; Fermat (3,2), a=0 and −1 | genus-1 curve minus 1 point gives 2 circles = 2−0; nodal cubic gives 1 = 2−1; 4 circles = 4−0; a cone = 4−4 | holds | none |
| `rationalSphereRanks` vs `rationalBouquetRanks` | N=1, s<12, k<80 | formulas agree (`#eval` true) | special case | R01 |
| `rationalBouquetRanks` | n=3, N=2, k=0..7 | 2,3,2,3,6,11,18,30; the free Lie algebra on two degree-1 classes gives 2,3,2 | holds | none |
| §4.6 via §3.37 | X=S⁴; X=S³ | generators in degrees 2 and 5 give (1+t⁵)/(1−t²); 1+t | holds | none |
| §2.3 character | σ=(12)(3), N=2; m=N=0 | fixed tensors 2·2=4, sign twist −4 (n even) / +4; 0⁰=1 | holds (BS lines 2279–2286) | none |
| §3.1 / `eulerExponent` | (n,N)=(0,2), (1,1), (6,3) | −2,−1,−2,−3,−6; 1,−1,0,0,0; −3,−3,−8 (recursion Σd·e_d=−3^r) | holds | none |
| §3.3 | q=2, c=−2, degrees 0–3 | polynomial counts 1,−4,2,4; product (1−2U)²(1−2U²)(1−2U³)² gives 1,−4,2,4 | holds (BS lines 2300–2319) | none |
| ω, §7.2 | point with ℤ(1); point with ℤ; free orbit | H¹=ℤ/(1−σ)=ℤ/2; ker N=0; H¹(pt,ℤ)=0 | holds (BW lines 363–371) | none |
| ψ, §15.2 | n=3, [(1,0,0)]; n=2, swap | (−2,1,1), trace 0, ≡(1,1,1), wrong sign ≡(2,2,2); ψ[(0,1)]=(1,−1)=−ψ[(1,0)] | holds | none |
| §7.5 | point, (i,j)=(0,0), (1,1) | ℤ (no iso claimed since j is even and i=dim); H¹_G(ℤ(1))=ℤ/2 ≅ H⁰(pt,𝔽₂) | holds (BW lines 561–573) | none |
| §9.5 | d=2, i=4, j=1; i≤d | the window 0≤p<2, p odd, keeps only p=1; empty window | holds (BW lines 749–756) | R07 (Remark 1.9) |
| §10.5 | RP², d=i=2, x=1, y=a | deg(xyγ)=deg(a+a²)=1; deg(xy)=0 | holds (BW lines 876–879) | none |
| §11.2 | real-empty conic, d=1 | X(C)/G=RP²; groups above degree 2 on both sides are 0 | holds (BW lines 951–953) | none |
| §11.3 | ℙ¹ with a real point; ℙ¹ with a real-empty divisor | real Gysin 1↦1; 0→𝔽₂ fails the hypothesis | holds (BW lines 971–976) | none |
| §11.1 | 𝔾_m over ℝ | H¹(ℂ*)=ℤ at i=d; 0 above | holds | R02 |
| §12.3 | RP², T², Klein bottle, disk | deg w₁² = 1, 0, 0; χ mod 2 = 1, 0, 0; the disk has χ=1 but has boundary | holds | R06 |
| §12.4 | T² class (1,1); zero class | one embedded (1,1)-curve; empty union | holds | R07 (locator) |
| §13.2 | ℙ², d=2 | H³(ℂP²)=0, of odd order 1 | holds (BW lines 1838–1844) | none |
| §13.3 | quartic over any real closed field | b₃=(3⁵−3)/4=60; traces 1,−1,1,−1 give Tr H³=0; invariant rank 30 | holds (BW lines 2471–2478) | none |
| §16.2 | xy=t | the node stratum maps with derivative 0 | hypothesis fails, as the Check says | none |
| §16.3 | S² with trivial action, j=0; 2ℤ⊂ℤ | E₂^{2,1}=E₂^{3,0}=0, so index 1; index 2 | holds (B19 lines 1272–1273) | none |
| §16.4 | split cover; γ=δ=ζ=0 | g=0, η₀=0; degree 2+1+1=4 | holds (B19 lines 773–816) | none |
| Hopf gap | Ω²S³, Ω²S⁴ | 1+t; (1+t⁵)/(1−t²) | precise | none |
| fixed-point trace gap | antipodal map on S² | traces 1, −1, so L=0 | precise | none |
| support-dimension gap | V=ℝ, Z={0} | H¹_Z=ℤ, H²_Z=0 at d=1 | precise | none |
| Borel gap | V=pt, s=1 | H¹(RP¹)=ℤ against H¹(C₂,ℤ)=0 | true but misaddressed | R04 |
| tensor-adjoint gap | point, ℤ[G] | ℤ[G]⊗ℤ[G] is ℤ[G]² | already provided | R05 |

**Seeded sample (15 targets), each read at its locator.**
- Correct: 2.3 (BS lines 2279–2286), 2.4 (CEF lines 964–972), 3.3 (BS lines 2300–2319), 7.2 (BW lines 363–371), 7.5 (BW lines 553–573), 10.5 (BW lines 864–879), 11.2 (BW line 951), 11.3 (BW line 971), 13.2 (BW lines 1838–1844), 16.2 (MATHER lines 969–976, nonequivariant; refinement owned), 16.3 (B19 line 1272), 16.4 (B19 lines 773–816).
- 3.1: correct, but with line drift (R07).
- 9.5: correct, but Remark 1.9 is unproved in the source (R07).
- 12.4: the locator points at immersions (R07).
- The README's ordinary form of 2.4 is the corrected form of BS line 2266 (see Source issues).

**Gaps.**
- All 12 slugs, suppliers, sections and `needs` agree between `plan.json` and the README (compared mechanically).
- `finite-group-ext-stalk`, `configuration-cover-comparison`, `configuration-carrier-generality`, `semialgebraic-equivariant-sites`, `semialgebraic-support-dimension`, `semialgebraic-fixed-point-trace`, `semialgebraic-duality-coefficients`, `supported-steenrod-comparison` and `rational-commutative-hspace-hopf` are precise and minimal.
  - The §3.37 text plans only primitive image plus "Add homotopy associativity for the Hopf-algebra formulation", so the commutative Hopf gap is not already provided.
- The other three are R03–R05.

**Library declarations opened at the pins.**
- Mathlib:
  - `Algebra.lmul` (`Mathlib/Algebra/Algebra/Bilinear.lean` line 143);
  - `Module.End.maxGenEigenspace` (`Mathlib/LinearAlgebra/Eigenspace/Basic.lean` line 556);
  - `IsArtinianRing.quotNilradicalPowEquivPi` (`Mathlib/RingTheory/Artinian/Module.lean` line 616) and `IsArtinianRing.isNilpotent_nilradical` (`.../Artinian/Ring.lean` line 63);
  - `Representation.char_tensor` (`Mathlib/RepresentationTheory/Character.lean` line 68) and `card_inv_mul_sum_char_eq_finrank` (line 113);
  - `PowerSeries.binomialSeries` (`Mathlib/RingTheory/PowerSeries/Binomial.lean` line 47);
  - `Rep.FiniteCyclicGroup.homResolutionIso`, `groupCohomologyIsoEven` and `groupCohomologyIsoOdd` (`.../GroupCohomology/FiniteCyclic.lean` lines 58, 80, 113; inputs as the README states).
- Tau Ceti:
  - `TopCat.singularCohomology` and `singularCohomologyMap` (`TauCeti/AlgebraicTopology/Cohomology/Basic.lean` lines 94, 100);
  - `Equiv.Perm.fullCycleType` (`TauCeti/GroupTheory/Perm/Partition.lean` line 96: cycle type plus one part per fixed point);
  - `TauCeti.FiniteField.fullCycleType_eq_map_natDegree_normalizedFactors` (`TauCeti/FieldTheory/GaloisGroups/FrobeniusOrbits.lean` line 106: squarefree hypothesis, q-th power permutation);
  - `TauCeti.WedgeSum` (`TauCeti/Topology/WedgeSum.lean` line 72: the empty wedge is a point);
  - `HomotopyGroup.zerothHomotopyEquiv` (`.../HomotopyGroup/LoopSpace.lean` line 210);
  - `TauCeti.IsSemialgebraic` (`.../Semialgebraic/Basic.lean` line 63).

**Cross-roadmap citations resolved.**
- On main:
  - AlgebraicTopology Stages 2–8, with Stage 5 item 5 being the Serre spectral sequence. Nothing of Part I is re-planned: there are no joins, rational homotopy or Lefschetz traces in it.
  - SchemeAndStackFoundations §§0.1, 0.2, 0.7, 2.7, 2.19, 2.23.
  - RealAlgebraicGeometry Layers 3 and 6.
  - DifferentialGeometry Layers 2, 3 and 10 (10.2 is Sard).
  - GeometricTopology Layer 1.
  - MorseNovikov N6: the Lefschetz formula for diffeomorphisms of closed connected fibres, nonorientable ones included.
  - AffineMorseLefschetz A2–A4 (R02, R03).
- At open heads (all new folders):
  - StableHomotopyKTheory §§3.36–3.37 (00bfbf7).
  - MotivesAndAlgebraicCycles §§7.6a–7.6b (79b02f6).
  - EtaleDualityAndPerverseSheaves §§3.5–3.8, 4.7 and 6.5 (34e0692). §6.5 contains the compact-support Frobenius trace formula.
  - ComplexComparisonPartII §C−1.1 (2d50a88).
  - InverseGaloisAndArithmeticFundamentalGroups §IG.5.1 (740b9cc).
  - QWittVectors §1.4a (2a7475f).
  - SmoothBundlesConnections §B1 item 5 (e3abb0d).
  - CharacteristicClasses §§C2–C3 (d077cb4).
  - TangentialBordism B4 (bf9da30; R06).
- Merge order: every listed supplier is before position 126 or on main. Other authors' new folders are allowed.

**Duplication audit by object.** Searched main, all open heads and the pins for each object:
- tame polynomials, Milnor numbers and fibres;
- Hilton and Whitehead products;
- PConf and configuration traces;
- rational homotopy of spheres;
- Fermat and Pham joins;
- Wu classes;
- semialgebraic triangulation and dimension;
- affine CW dimension;
- Borel approximation;
- equivariant Ehresmann;
- embedded-curve representatives.

Results:
- New duplications: R02, R03, R04 and R06.
- LefschetzPencilsAndVanishingCycles §6.6 is étale and does not overlap §4.2.
- MordellLawrenceVenkatesh §5.13 treats integral primitive classes and does not overlap §12.4.
- HomotopySpheres has no rational sphere theorem.
- No fully qualified name in `Suggested.lean` clashes with another roadmap.

## Not verifiable

- HILTON (Theorem A; Corollary 4.10), DIMCA (Lemma 4), BRUMFIEL (pp.163–169) and SCHEIDERER (Corollary 18.11) are settled as uncertified, so they were not read. Each statement attributed to them agrees with the secondary reports: BS lines 2369–2373; B19 line 1258; BW lines 2472–2473; BW lines 1012–1014.
- KRASNOV Theorem 2.1 is waived. The README's claim (γ_X equals the tangent Stiefel–Whitney class over ℝ) matches BW lines 699–700.
- SERRE, SULLIVAN, PHAM and EP are outside the sample and were not re-read.
- The board package RealSurfacePeriodIndex was not re-read at its head this round. Round 1 found that it consumes this roadmap without restating it.
- The MILNOR-STASHEFF text was read from an Edinburgh staff page recorded as `institutional`. That host's right to redistribute the book was not checked independently.

## Source issues

- **Error** in BS at Lemma 7.6, printed p.944: the source assumes n>2 for the double-loop Betti formula; it should be n>3, since at n=3 the double loop of a wedge of 2-spheres has ℤ^N components; affects a stated result.
- **Misprint** in BS at proof of Lemma 7.4, printed p.942: the source's first trace sum pairs compact-support cohomology with the ordinary weights q^(m−i); it should use ordinary cohomology H^i there, dualising to compact supports only afterwards; affects the proof.
- **Misprint** in BS at proof of Lemma 7.4, printed p.943: the source's final product has factors (1−qU^k) with no exponent; each factor should carry the exponent −e_k(N); affects the proof.
- **Misprint** in BS at proof of Lemma 7.6, printed p.944: the source says the hypersurface is homotopic to a smash of N spheres; it should say a wedge of N copies of S^(n−1); affects nothing.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "eabd8fb", "job": "REV-PKG-AlgebraicTopologyPartII~2", "model": "opus", "worker": "fable-rev93"} -->
