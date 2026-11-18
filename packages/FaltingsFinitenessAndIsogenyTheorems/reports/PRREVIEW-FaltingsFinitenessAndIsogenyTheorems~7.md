# Review of FaltingsFinitenessAndIsogenyTheorems (pull request #1004 at 6e78298)

**Verdict:** accepted

**Summary.** Accepted: no finding. This head repairs the one finding of the previous review (Satz 1 is now the descent to `K` of ArakelovGeometryAndAbelianHeights §6.4(i), and the stable-curve comparison is no longer planned) and all seven of its small corrections and three format notes. The statements I recomputed (degree and height conventions, the isogeny and tower formulas, the determinant identity, the quaternion matrix against the pinned library, the auxiliary bound, Torelli uniqueness, the ten Lean signatures) came out right, and `Suggested.lean` elaborates with `sorry` as its only warning. There are one small correction and three format notes, none blocking; one question for the author, and four points on arrangement, wording and licence are left to the human reviewers.

## C01 — In the scope paragraph, "`m·h_st`" uses the supplier's `m`, which is not the `m = [K : ℚ]` of this README

The scope paragraph (line 2338) says that ArakelovGeometryAndAbelianHeights §5.5 "identifies the modular height of a moduli point with `m·h_st` exactly". The Conventions fix `m = [K : ℚ]` for the whole README, so a reader takes this as `[K : ℚ]·h_st`. In the supplier (its §5.5, line 1520) `m` is the tensor power of the Hodge line that descends to the minimal compactification (the isometry is with `ω̄(𝒢)^{⊗m}`); the Examples of Layer R28.1 use the right value, `12·h(E)` for `g = 1`. One clause would settle it: "with a fixed positive multiple of `h_st` (the power of the Hodge line that descends, `12` for `g = 1`)".

## N01 — Milne's Theorem 15.5 with its proof is on p. 65 (milne-av lines 2689–2694); R28.5.12 gives pp. 65–66, which is where the remarks after it run.

## N02 — R28.5.12 has one *Needs* line for four things (Zarhin's trick, the closed-orbit adapter, integral idempotents, finiteness of direct factors). The last three do not use PadicDifferentialEquationsAndRigidCohomology §RD.5.116; only R28.5.13 does. A *Needs* line per target would not put the direct-factor theorem behind that supplier.

## N03 — The Dependencies of Layer R28.1 and the supplier contracts ("Used in R28.1.4") name NumberFieldArithmetic Layer 6.4 and LocalFieldsRamification Layer 3, but the *Needs* line of R28.1.4 names only the Tau Ceti theorem and says the bound on the different is inside its proof. They serve only the Check on `ℚ(√2)`; saying so, or dropping them from the layer's dependencies, would make the two lists agree.

## Questions for the author

- The Layer R28.3 introduction says that N. Katz observed the error in Satz 2 and O. Gabber gave a counterexample, and the Examples speak of "Gabber's counterexample". The note added in proof (faltings-1983 lines 741–743, p. 366) names only Gabber, says the proof is not quite correct and that one gets only stationarity; it mentions neither Katz nor a counterexample. Is the attribution taken from the 1984 erratum? I could not read the erratum (publisher's page only).

## Verified sound

| Statement | Instances tried | Values computed | Result |
| --- | --- | --- | --- |
| Arithmetic closed-orbit adapter (R28.5.12) | milne-av lines 2689–2694; `(1 n; 0 0)`; `nE₁₂` in `M₂(ℤ)` | Thm 15.5 p. 65, reductive `G`, arithmetic `Γ`, closed orbit; kernel `(−n,1)` unimodular; gcd `n` separates | supported; N01 |
| Integral idempotents (R28.5.12) | milne-av lines 2683–2686, 2748–2767; `M₂(ℤ)`; `(1 1/n; 0 0)` | Prop 15.4 p. 65, Application 15.8 pp. 66–67; classes `0, diag(1,0), 1`; denominators `n` unbounded | supported; source's closedness argument wrong (Source issues) |
| Canonical polarization without a curve point (R28.5.14) | milne-av lines 4281–4292, 4381–4394; `y² = −(x⁶+1)` | Thm 6.6 p. 105 assumes a rational point, translate-independent; 6.11 pp. 107–108; leading coefficient `−1`, no real point | supported as now worded |
| Satz 1 (R28.1.6) | supplier §§3.1, 3.2(a), 3.4, 6.4(i); `g = 0`; quadratic twists | same norm `2^{−g}∣∫∣` and weights, so `t = c`; zero variety; twists by `d` with good odd prime additive | right |
| Descent to `K`-classes (R28.1.5) | `−1` on `A[2]`; twist at good or multiplicative place | trivial on level 2; inertia `−1` or `−`unipotent, additive | right |
| Degree and height conventions | `I = ½ℤ`; `ℚ(i)`, `p = 2`; `g = 2`; supplier §1.3 | `log 2` both ways; index `4 = 2·log 2` weight 2; sign `(−1)^{g(g−1)/2}`; formula agrees at `λ_v = −log c_v` | consistent |
| Isogeny height formula, valuation bounds (R28.2.1–R28.2.2) | `[n]`; étale kernel of order `p`; `μ_p`; supplier §4.4(iii) | `g·log n − g·log n = 0`; `+m`; `−m`; range `[−(2g−1)m, m]·v_p` inside supplier's `±m·v_p` | right |
| Determinant identity (R28.2.9) | good reduction, `G = A[l^∞]`; inert quadratic supersingular; CM split | `mg = m·2g/2`; `2·1 = 2`; `1 + 0 = 2·1/2` | right |
| Corrected Satz 2 (R28.3.2–R28.3.4) | `T = ℤ_l²`, `V(H) = ℚ_l(1,l)`, `T(G) = ℤ_l(1,0)`; supplier §4.5 | defect order `l` at `k = 0`, zero for `k ≥ 1`; same formula, hypothesis as stated; source prints `h(A_n) = h(A)` | right |
| Four squares (R28.4.1) | `l = 2`: `(a,1,1,2)`; `l = 3`: `(a,1,0)` | `a² = −7 ≡ 1 mod 8`; `a² = −2 ≡ 1 mod 3` | right |
| Quaternion construction (R28.4.2) | columns `1·q, i·q, j·q, k·q`; `q = i`; `(2,3,5,7)`; `𝔽₅`, `v = 2I` | equals pinned `Quaternion.toMatrix_mulRight` entrywise; `e₃ ↦ −e₄`; `87`; graphs span dim 8 ≠ 4 | right |
| Satz 3, Satz 4, Korollare 1–3 (R28.4.5–R28.4.8) | `y² = x³ − x` over `ℚ`, `ℚ(i)`; `37a1`, `37b1`; `11a` | `End_ℚ = ℤ`; `a_7 = −1` both, `a_2 = −2, 0`; `−2, −1, 1, −2` | consistent |
| Weil polynomials, test set (R28.5.1–R28.5.2) | `n = 2`, `r = √2`; `n = 0`; `S₃` in `GL₂(ℚ₅)` | six polynomials; `{1}`; image algebra dim 4, three class matrices cannot span | right |
| Auxiliary bound (R28.5.4) | `11a1`, `p = 2`; `(11a1)³` | values `1, −3, 5, 1, 10, 2, −1, −3`; `P_1(8) = 82³`, `41 > 22` | right |
| Rational Torelli (R28.5.14) | same sign, `α ≠ α′`; opposite signs; `β = [−1]`, `P ≠ P′` | `α(Q)+α′(Q′) ∼ α′(Q)+α(Q′)`; `α(Q)+α′(Q)` in a `g¹_2`; triple `(id, −, [P−P′])` | right; milne-av line 4924, perfect field |
| `finite_isogenyClasses`, `shafarevich_unpolarized` | `g = 0`; `y² = x³ − x` at 5 | zero variety, one class; `Δ = 64 ≡ 4`, a unit | match R28.5.3, R28.5.13 |
| `finite_stableLattices` | no stable lattice; `V = 0`; unipotent `Γ` | `F = ∅`; `F = {⊥}`; coinvariant torsion `l^k`, infinitely many classes | true; hypothesis of the earlier C07 gone |
| `finite_directFactors` | milne-av line 2665; `E^n`, `End E = ℤ` | Thm 15.3 p. 64, any field; factors `E^k` | matches |
| `finite_curves_goodReduction` | `y² = x⁵ − x + 1` at 5; `y² = x³ + x² + 5` | derivative `−1`, chart `z² = u − u⁵ + u⁶`; `Δ = −11120`, node mod 5 | matches R28.5.15 |
| `elliptic_isogenous_iff_ap` | Mathlib `localPolynomial` (LFunction.lean line 43) | coefficient of `X`: `−a_v` good, `−1` split, `+1` nonsplit, `0` additive | both directions hold |
| `elliptic_tate_hom_iso`, `finite_ellipticIsogenyClass`, cyclic Hom (R28.6.6) | pure tensors; `11a`; `f ↦ f∘ψ` | they span over `ℤ_l`; degrees 5, 5, 25; injective into `ℤ` | match |
| Integral commutant (R28.6.7) | `W = 0`, `W = A[l]`; `ε = lE₁₂` | image `0`, all of `A[l]`; centralizer `(a b; 0 a)` against `M₂(𝔽_l)` | right |
| Scope paragraph, supplier's §5.5 | Conventions `m`; supplier line 1520 | `m = [K:ℚ]` here; there `ω̄^{⊗m}`, `12` for `g = 1` | C01 |
| Earlier R01 (double plan of Satz 1) | R28.1.6; scope paragraph | "Its §6.4(i), with `D = [K : ℚ]` and `t = c`"; "is not planned here" | repaired |
| Earlier C01–C03 | R28.3.3; names of C02; R28.5.14 | "finite-part hypothesis of … §4.5"; 0 of the 18 names left; "source for a curve with a `k`-rational point" | repaired |
| Earlier C04–C07, N01–N03 | layer introductions; R28.4.2; scope; Lean | no "is Section"; pinned matrix cited; `r = √q` clause; `h` dropped; no line over 100; no numbered headings | repaired |

- Source locators checked against the text: about 49 (Milne 33, Faltings 1983 16), all at the stated pages except the one of N01.
- Library declarations confirmed at the pins: about 55 by name and namespace; 10 read in full (`Quaternion.toMatrix_mulRight` line 107, `finite_of_finrank_le_of_ramifiedSupport_subset` line 130, `localPolynomial` line 43, `cohomologyBaseModule` line 48, `GeometricallyConnected` line 40, `finite_mahlerMeasure_le` line 107, `mahlerMeasure_eq_leadingCoeff_mul_prod_roots` line 224, `InvertibleSheaf.trivial` line 144, `AbelianVariety.IsIsogeny` line 61, `Hom.instCommGroup` line 72).
- Cross-roadmap citations resolved: 23 roadmaps, about 135 sections or names, all found on main or at the open head; 18 supplier statements read in full (ArakelovGeometryAndAbelianHeights §§1.3, 2.0, 2.1, 2.7, 3.1, 3.2, 3.4, 4.4, 4.5, 5.5, 6.4; ArithmeticStatisticsPartI twice; ClassicalArithmeticCompletion §7.56; §RD.5.116; AA.3.3; JacobianChallengePartII §1.4; B4.1).
- Dependency check: `depcheck: 211 roadmaps, 2274 edges, 0 problem(s)`; every supplier is on main except AbelianSchemesAndArithmeticModuliPartII, an open new roadmap earlier in the merge order, which the description names.
- Elaboration: `sorry` the only warning (10). One-tactic probe (`rfl`, `trivial`, `infer_instance`, `simp`) closes none of the 10 theorems. Elaborated signatures compared with the README statements: no binder lost, nothing changed.
- Automatic checks: all passed. No change outside the roadmap folder; no `set_option`, no sorry'd data, one `import Mathlib` and seven Tau Ceti modules.
- Description read against the head: layer bullets, section numbers, the fourteen declarations and the supplier paragraph agree with it.

Overlap check: read FaltingsFinitenessAndIsogenyTheoremsPartII, AbelianVarietiesOverFiniteFields, HeightsRationalPointsAndObstructionsPartII, EllipticCurveModularity, EllipticCurveModularityPartIIGL2TypeAbelianVarieties, ArakelovGeometryAndAbelianHeights, NeronModelsAndSemistableAbelianVarieties, AbelianSchemesAndArithmeticModuli; the open ones consume this roadmap by sections that exist; shared with ArakelovGeometryAndAbelianHeights: bounded-height finiteness over K̄ and the tower height formula (owner: ArakelovGeometryAndAbelianHeights §§6.4, 4.5, cited here); Weil-polynomial finiteness with ArithmeticStatisticsPartI (special case there, general form here, stated in the scope); local order orbit finiteness (owner: ArithmeticStatisticsPartI, applied here).

Source independence: 11 passages compared with 2 sources, none shared (at most 5 consecutive words); largest share faltings-1983, 42 of 72 parenthesised locators; contents compared with faltings-1983 (§§1–6): R28.1 ↔ §§2–3 in part, R28.2 and R28.3 ↔ §4, R28.4 ↔ §5, R28.5 ↔ §6 without Satz 7, R28.6 ↔ none, not one to one, the order forced by R28.1.6 → R28.3.8 → R28.4.3 → R28.4.5 → R28.5.3 → R28.5.11: independent; the 1984 erratum could not be read.

Research link: The headline targets are the theorems of Faltings 1983 (with the 1984 erratum) as presented by Deligne 1985 and Milne 2008; the README's consumers use them for modularity of elliptic curves and GL₂-type varieties and for the Lawrence–Venkatesh method. Rests on the README's references and consumer list.

## Not verifiable

- Faltings 1984 (erratum): not read; the DOI leads to the publisher's page only. The correction of Satz 2 was checked against the printed statement and the note added in proof.
- Tate, Raynaud, SGA 7 I, Deligne's exposé, Zarhin's preprint, Mumford, Borel, Martens, Ogg, Fontaine: outside the sample, not opened; Serre's example (R28.3.1) and Raynaud's numbering rest on the README.
- The Faltings 1983 text is an OCR of a scan; displayed formulas (the metric factor, the inequalities of §6) were not legible enough to check.
- MordellLawrenceVenkatesh: its files were not available; ownership against it was not checked.

## Source issues

- **Error** in milne-av at Chapter I, Application 15.8, printed pp. 66–67: the source says the conjugacy orbit of a rank-`r` idempotent corresponds to the Grassmannian of `r`-planes and is closed because that variety is complete; it should be that the orbit is the affine variety of pairs (image, kernel), closed because cut out by `e² = e` and `tr e = r`; affects the proof.
- **Error** in faltings-1983 at §4, Satz 2, printed p. 358: the source says every quotient `A/G_n` by a level of an `l`-divisible subgroup has the height of `A`; it should be that these heights are eventually constant; affects a stated result; corrected in print at the note added in proof, p. 366, and Faltings 1984, Invent. Math. 75, p. 381.

## For the human reviewers

- Arrangement: the layers run in the order of Faltings 1983 §§2–6 (R28.1 ↔ §§2–3, R28.2–R28.3 ↔ §4, R28.4 ↔ §5, R28.5 ↔ §6); the mapping is not one to one and I judged the order forced by the proofs.
- Wording: the proof route of R28.4.3 (README line 1189) uses the notation and step order of milne-av lines 5568–5597 (`X_n`, `f_n`, `I`, `i_0`, `v_i`, `u_i`), compressed; at most 5 consecutive words shared.
- Licence: the Provenance section (README line 2244) describes the Apache-2.0 formalization AxiomMath/Mordell and says nothing is taken from it; I did not open that repository.
- Not tested: the 1984 erratum, cited for both corrections of Layer R28.3, was not read.
