# Review of KleinianGroups (pull request #432 at 7221f66)

**Verdict:** needs changes

**Summary.** Changes are needed, for three reasons: §4.5 plans the Euler product of `ζ_F` and the factorization `ζ_F = ζ · L(χ_D)` that the pinned Tau Ceti already proves, and three Checks assert false values (the two "density `t⁻²` gives infinite volume" Checks, and the numerical value of Humbert's formula at `d_F = −7`). All thirteen findings of the previous review are repaired, the statements of the five layers survived the recomputation below, and `Suggested.lean` elaborates with `sorry` as its only warning. There are four small corrections and three format notes, none blocking; the licence of the cited prior formalization is left to the human reviewers.

## R01 (P2) — §4.5 plans the Euler product of the Dedekind zeta function and the quadratic factorization, both of which the pinned Tau Ceti proves

An implementer following §4.5 would rebuild, from "unique factorization of ideals and multiplicativity of the norm" and "the splitting of primes in the two fields", two theorems that are already in the library, and the supplier contracts (which name only "the Euler-product machinery of `Mathlib/NumberTheory/EulerProduct/`") hide that they exist.

At the pin, `TauCeti.dedekindZeta_eulerProduct_hasProd` (`TauCeti/NumberTheory/ArithmeticDirichletSeries/EulerProduct/Analytic.lean`, line 498) is the product over `HeightOneSpectrum (𝓞 K)` of `(1 − N𝔭^(−s))⁻¹` for every number field and every `Re s > 1`; on a probe copy, the `s = 2` product over the height-one spectrum closes with the single term `(TauCeti.dedekindZeta_eulerProduct_hasProd (K := F) (s := 2) (by norm_num)).tprod_eq.symm`, so `dedekindZeta_two_eq_tprod` differs from it only by reindexing to maximal ideals. And `TauCeti.NumberField.dedekindZeta_eq_riemannZeta_mul_LFunction` (`TauCeti/NumberTheory/NumberField/Quadratic/DedekindZeta.lean`, line 199) gives `ζ_K(s) = ζ(s) · L(s, χ_D)` for every `K` with `finrank ℚ K = 2` and `Re s > 1`, which is the general form of `zeta_gaussian_two` and `zeta_eisenstein_two`.

The smallest change: list both declarations under "From Tau Ceti"; drop `dedekindZeta_two_eq_tprod` as a target (step 1 of §4.6 cites the pinned product directly), or keep it marked as the reindexed corollary; and replace the route of §4.5 by "the pinned factorization at `s = 2`, the discriminants `−4` and `−3` of the two cyclotomic fields, and the identification of §4.1". The two named factorizations stay as targets: they still need the discriminants and §4.1.

## R02 (P2) — A density `t⁻²` does not make the cusp box or the Bianchi domains infinite

The Check of §0.3 (line 277), "A density `t⁻²` would make the cusp box infinite", and the Check of §4.3 (line 590), "Integrating `t⁻²` instead of `t⁻³` would make both volumes infinite", are both false, so neither separates the right density from the wrong one in the way it says.

`∫₁^∞ t⁻² dt = 1`, so the cusp box `[0, 1]² × [1, ∞)` would have volume `1`. Over a floor `P` the wrong density gives `∫_P dA / √(1 − |w|²)`, which is finite because `|w|² ≤ 1/2` (Gaussian) and `≤ 1/3` (Eisenstein) on the floors; numerically `0.5513` and `0.3122`.

The smallest change: state the finite wrong values ("a density `t⁻²` would give the cusp box volume `1`, not `1/2`"; "integrating `t⁻²` would give `≈ 0.5513` and `≈ 0.3122`, not `0.3053` and `0.1692`"), or use the density `t⁻¹`, for which both do diverge.

## R03 (P2) — The value of Humbert's formula at `d_F = −7` is wrong in the fourth digit

The Check of §4.6 (line 651) gives "`≈ 0.888785`, with `L(2, χ₋₇) ≈ 1.151757`"; an implementer who tests `covolume_bianchi` against it gets a mismatch.

Summing `∑ χ₋₇(n)/n²` with `χ₋₇ = (1, 1, −1, 1, −1, −1, 0)` to `1.4 · 10⁷` terms gives `L(2, χ₋₇) = 1.151925…`, and `7^(3/2) · (π²/6) · 1.151925 / (4π²) = 0.888915…`. The same computation reproduces the `d_F = −4` and `−3` values of the neighbouring Checks (`0.305322`, `0.169157`).

The smallest change: "`≈ 0.888915`, with `L(2, χ₋₇) ≈ 1.151925`".

## C01 — The first Check of §3.2 says the imaginary-quadratic hypothesis is not for discreteness, and the second shows that it is

Line 444–445 reads "the imaginary-quadratic hypothesis is for the covolume statements, not for discreteness", and the next bullet shows `bianchi` is not discrete for `ℚ(√2)` with a real embedding. Since `bianchi F ι` is defined for every number field, `isDiscrete_bianchi` does need a hypothesis; what the first bullet shows is only that `F = ℚ` is a second case where the image is discrete. Say that: "discreteness holds for `ℚ` as well, with infinite covolume; it fails for a real quadratic field (next Check)".

## C02 — "A Bianchi group has them through its explicit domain" holds for the two named groups only

In §1.3 (line 352) the countability and fundamental-domain hypotheses of the index law are said to come, for "a Bianchi group", from "its explicit domain (§3.5), without discreteness". §3.5 gives domains for `ℤ[i]` and `ℤ[ω]` only; for a general imaginary quadratic `F` the fundamental domain comes from §3.2 and §1.2. Write "the two named Bianchi groups".

## C03 — `hyperbolicVolumes` is the set of volumes of the orientable manifolds

The summary and §5.1 call it "the set of volumes of hyperbolic 3-manifolds", but a quotient by a subgroup of `PSL(2, ℂ)` is orientable, complete and of finite volume, and the volume of a non-orientable manifold is half that of its orientation cover, which need not be the volume of an orientable manifold. Thurston's question is unaffected (the two sets generate the same rational relations), and one sentence saying so in §5.1 or §5.3 would make the definition and the cited question agree in what they range over.

## C04 — The hypothesis `I ≠ ⊤` of §3.3 follows from `2 ∉ I`

In `isTorsionFreeKleinian_bianchiGamma` and its README statement (line 452), `2 ∉ I` already excludes `I = ⊤`. Drop `hI`, or say that it is kept for readability.

## N01 — Two citations abbreviate the supplier's name

Lines 634 and 663 cite "EndoscopicTransfer §6.2"; the roadmap is EndoscopicTransferAndUnitaryTraceComparison, as the supplier contract writes it, and a search for the short name finds nothing.

## N02 — Two proposed names are in code font but declared nowhere

`UpperHalfSpace.congr` (§0.2) and `quotient_isFiniteVolumeHyperbolic` (§5.2) read as declarations of `Suggested.lean`, whose docstring says they are not represented. Write them as proposed names in prose.

## N03 — Elstrodt–Grunewald–Mennicke is cited by chapter only

The classification by trace (§1.2) and the Bianchi domains (§3.5) cite "Chapter 1" and "Chapter 7"; a section or theorem number with its page would let a reader check the two statements.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 0.1 Möbius action | `(0 −1; 1 0)` at `(1,1)`; `diag(i,−i)`; `(a b; 0 a⁻¹)` | `J = 2`, image `(−1/2, 1/2)`; `(−w, t)`; `(a²w + ab, |a|²t)` | agrees with Checks of 0.1, 0.2 and Polylogarithms §2.4 | none |
| 0.2 `exists_toIsom` | `−1`; conjugation | acts trivially, so `PSL`; orientation reversing, outside image | injective on `PSL` only | N02 |
| 0.3 Volume | cusp box; `t ∈ [1,2]`; density `t⁻²` | `1/2`; `(1 − 1/4)/2 = 3/8`; `∫₁^∞ t⁻² = 1` | formula right, last Check false | R02 |
| 0.4 Distance | `(0,1),(0,2)`; `(0,1),(1,1)`; slice under `SL(2,ℝ)` | `cosh = 5/4 = cosh log 2`; `3/2`; real part `(ac|z|² + (ad+bc)x + bd)/|cz+d|²` both sides | correct | none |
| 1.1 torsion-free iff | `⊥`; all of `PSL(2,ℂ)`; `⟨diag(i,−i)⟩`; image of `SL(2,ℤ)` | true/true; false/false; discrete, fixes axis; `(0 −1; 1 0)² = −1` | iff holds both ways | none |
| 1.2 fixed sets null | elliptic; parabolic `(1 1; 0 1)`; `−1 ∈ SL` | one geodesic; empty; all of `ℍ³` | projective statement needed, as stated | N03 |
| 1.3 covolume, index law | `ℤ[i]` translations; `Δ = Γ`; junk value without a domain | column `[0,1)² × (0,∞)` infinite; index `1`; Mathlib's `covolume` is `0` | consistent with pinned hypotheses | C02 |
| 2.1 Dirichlet domain | `⟨w ↦ w+1⟩` at `(0,1)`; centre on a fixed axis | `|re w| ≤ 1/2`; whole space | free-point hypothesis needed and present | none |
| 3.1 definitions | `(2i 5; −5 12i)`; `I = (2)`; `I = ⊥`, `⊤` | `det = −24 + 25 = 1`, `(2i)² ≡ 1 (5)`; `14400/4`, `14400/2`; `6·8 = 48`; trivial group, whole group | correct | none |
| 3.2 discreteness | `ℚ`; `ℚ(√2)` real embedding | discrete; `ℤ[√2]` dense in `ℝ` | hypothesis needed | C01 |
| 3.3 torsion | `(1, 1+i; −1+i, −1)`; `(1, √−3; √−3, −2)` | `det = −1 + 2 = 1`, `tr 0`; `det = −2 + 3 = 1`, `tr −1`, order `3` | both negative controls hold; `tr ∈ {0, ±1}` forces `2, 1, 3 ∈ I` | C04 |
| 3.4 named groups | `i ↦ 3` mod `2+i`; `ω ↦ 4` mod `3+ω` | `9 + 1 ≡ 0 (5)`; `16 + 4 + 1 = 21 ≡ 0 (7)`; `120/2 = 60`, `336/2 = 168` | correct | none |
| 3.5 Bianchi domains | floors; `(0, 1/2)` | areas `1/2`, `1/(2√3)`; `max |w|² = 1/2`, `1/3`; `2·(1/2) ≥ 1`, `3·(2/3) > 1`; image `(0, 2)` | disjointness argument closes | none |
| 4.1 constants | 4 terms each | `0.908481`, `0.7725`; limits `0.9159656`, `0.7813024` | correct | none |
| 4.2 log-sine integrals | quadrature against series; `m = 1..6` of `sin(mπ/3)` | `−I = 0.457983, 0.338314, 0.507470`; pattern `1, 1, 0, −1, −1, 0` gives `(3/2) lchi3` | correct | none |
| 4.3 domain volumes | polar integrals; `t⁻²` | `0.3053219 = G/3`, `0.1691569 = √3 L/8`; wrong density `0.5513`, `0.3122` | values right, Check false | R02 |
| 4.4 manifold volumes | index law | `20G = 18.31931`, `21√3L = 28.41836` | correct | none |
| 4.5 zeta factorizations | `p = 5, 3, 2` in `ℤ[i]`; pinned library | `(1 − 5⁻²)⁻²`; `(1 − 9⁻²)⁻¹`; `(1 − 2⁻²)⁻¹`; one-term proof from pinned product | true, already in Tau Ceti | R01 |
| 4.6 Humbert | `d = −4, −3, −7`; constant `c` | `0.3053219`, `0.1691569`, `0.888915` (README `0.888785`); `c = 48ζ(2) = 8π²` | formula right, `−7` Check wrong | R03 |
| 5.1 set of volumes | `G/3`, `√3L/8`; `Γ((2+i)²)`; non-orientable | below `0.9427` and `2.0299`; index `5³ = 125`; half the cover's volume | members orientable | C03 |
| 5.3 Thurston's question | `v = w`; ratio of the two named volumes | `q = 1` excluded only for distinct classes; `0.6446293 ∈ (78/121, 595/923)`, `595·121 − 78·923 = 1` | faithful to the question | none |

- Previous review: R01–R13 all repaired (general `covolume_bianchi` and torsion theorem; Polylogarithms §2.4 cited for the action and `Λ`; `zeta_gaussian_two`, `zeta_eisenstein_two`, `exists_toIsom` stated; padding, `NoSmallRationalRatio`, process sentences removed; `IsTorsionFreeKleinian` renamed; domains moved to Layer 3; Milley and Cao–Meyerhoff cited; `Subgroup.isCofinite_iff_covolume_ne_top` named).
- Source locators checked against the text: 5 (thurston1982 line 913, printed p. 380; milley2009 line 47, Theorem 1.3; millichap2017 lines 161–167, Theorem 1.5; milnor1982 lines 338 and 460; borel1981 lines 707–716 and 922, §§7.3–7.5 and 9.1).
- Library declarations opened at the pins: Tau Ceti `MeasureTheory/Group/FundamentalDomain.lean` lines 140, 315, 358, 368; `MeasureTheory/Group/ProperlyDiscontinuous.lean` line 100; `Topology/Algebra/GroupAction/FreeLocus.lean` lines 36, 122; `Topology/Algebra/Group/Subgroup.lean` line 164; `Topology/Algebra/Group/DiscontinuousSubgroup.lean` line 51; `Analysis/Complex/Fuchsian/Covolume.lean` lines 73, 90, 125; `Geometry/Manifold/Riemannian/VolumeDensity/Volume.lean` line 82 and `Isometry.lean` line 215; `Hyperbolic/Completeness.lean` line 43; `Isometry/UpperHalfSpace.lean` line 397; `GeometricStructure/Basic.lean` line 84; `NumberTheory/ArithmeticDirichletSeries/EulerProduct/Analytic.lean` line 498; `NumberTheory/NumberField/Quadratic/DedekindZeta.lean` line 199. Mathlib `MeasureTheory/Group/FundamentalDomain.lean` line 679; `Analysis/SpecialFunctions/Integrals/Log.lean` line 46; `Integrability/Log.lean` line 93; `Analysis/Complex/UpperHalfPlane/Metric.lean` line 68; `Analysis/InnerProductSpace/PiL2.lean` line 853.
- Cross-roadmap citations resolved: Polylogarithms §2.4 at its open head (coordinate action, `J > 0`, composition, `−1`, isometry, `Λ`); PolylogarithmFunctions §§1.5, 1.7 on main; GeometricTopology §7.1 on main (README lines 6685–6704); AdelicAlgebraicGroups AA.2.4 (lines 2183–2236), AA.3.4 (lines 3238–3254), AA.4.2 (line 4549) on main; EndoscopicTransferAndUnitaryTraceComparison §6.2 on main (line 2097, Check `τ(SL_n) = 1`). Consumers: AdelicAlgebraicGroups line 5726, ArithmeticLocallySymmetricSpaces line 517, BianchiModularForms and MaassForms at their open heads.
- Dependency check output: `NOT IN ORDER: KleinianGroups (insert it after its last supplier)`; `depcheck: 200 roadmaps, 2203 edges, 1 problem(s)`. No UPWARD or CYCLE line; every supplier is on main or earlier in the order (the last is Polylogarithms). The roadmap is not yet listed in the merge order, which is the board's to settle.
- Elaboration: `Suggested.lean` elaborates with 45 `sorry` warnings and no other diagnostic; no `set_option`, no sorry'd data, a single `import Mathlib` and eight Tau Ceti modules that exist at the pin. The file has no `variable` block; the 73 elaborated signatures were read against the README.
- One-tactic probes on a copy: `one_smul'`, `smul_eq_of_mem_center`, `continuousConstSMul`, `secondCountableTopology_psl`, `countable_of_discrete`, `properlyDiscontinuousSMul_of_discrete`, `IsCofinite.covolume_pos`, `dist_ofUpperHalfPlane`, `bianchi_comp_algEquiv`, `twenty_catalan_mem_hyperbolicVolumes` do not close by `rfl`, `simp` or `infer_instance`; the Euler product at `s = 2` closes in one term from the pinned theorem (R01).
- Pull request text: title and description agree with the head (a new roadmap; the four endpoints; the dependency on Polylogarithms §2.4; the build). No change outside the roadmap folder.

Overlap check: read ArithmeticFuchsianGroups, FuchsianOrbifolds (open revision and main), BianchiModularForms, MaassForms, FuchsianOrbifoldsPartII, BallQuotientsAndComplexHyperbolicLattices, AdelicAlgebraicGroups; shared objects: the Möbius action on the half-space and `Λ`, owner Polylogarithms §2.4, cited; `isDiscrete_bianchi`, owner here by AdelicAlgebraicGroups' adapter row; the Bianchi groups, domains and covolumes, owner here, consumed by BianchiModularForms and MaassForms; nothing owned twice.

Source independence: 7 passages compared with 5 sources (thurston1982, milley2009, millichap2017, milnor1982, borel1981), none shared beyond the two words "rationally related" of the question; largest share Elstrodt–Grunewald–Mennicke, 2 of 6 claim-level locators; its text and table of contents could not be read, and on the three chapter subjects the README names the layers are not one to one with it (Layers 2, 4.1–4.5 and 5 have no counterpart).

Research link: §4.6 is Humbert's volume formula (Humbert 1919) by the Tamagawa route of Borel 1981, §§7.3–7.5 and 9.1, as reported in Milnor 1982, p. 20; Layer 5 states question 23 of Thurston 1982, p. 380. Rests on borel1981 lines 707–716 and 922, milnor1982 line 460, thurston1982 line 913.

## Not verifiable

- Elstrodt–Grunewald–Mennicke, *Groups Acting on Hyperbolic Space*: paywalled; Chapters 1, 7 and 8 are cited without section numbers and were not opened.
- Maclachlan–Reid, GTM 219, Chapter 7 and Theorem 11.1.3, and Ratcliffe, GTM 149: paywalled; cited in the references only.
- Cao–Meyerhoff, Invent. Math. 146 (2001): paywalled; the cusped minimum `2.0299` was not read in the text.
- Humbert, C. R. Acad. Sci. Paris 169 (1919), and Neumann–Yang, Duke Math. J. 96 (1999): not fetched; the formula was checked against milnor1982 line 460 and numerically at `d = −4, −3`.
- The displayed formulas of borel1981 §§7.3–7.4 are lost in the extraction; the normalization was checked from Milnor's report of it, not from Borel's display.

## Source issues

- none

## For the human reviewers

- **Licence.** `TauCetiRoadmap/KleinianGroups/README.md` lines 771–776 say the domains, indices, integration route and ratio bound were first formalized in the repository `t4v1/thurston23`; its licence, and how far `Suggested.lean` is adapted from it, were not checked.
- **Not tested.** Elstrodt–Grunewald–Mennicke has the largest share of the locators (2 of 6); neither its text nor its table of contents could be read, so wording and arrangement were not compared with it.
