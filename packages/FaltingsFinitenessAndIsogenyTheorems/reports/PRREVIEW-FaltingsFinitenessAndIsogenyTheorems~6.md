# Review of FaltingsFinitenessAndIsogenyTheorems (pull request #1004 at d663a77)

**Verdict:** needs changes

**Summary.** One finding blocks: the comparison of the modular and Hodge line bundles (R28.1.3–R28.1.4) and the geometric half of Satz 1 (R28.1.11) are planned here by Faltings' stable-curve route, although ArakelovGeometryAndAbelianHeights on main already owns the same comparison in exact form (§5.5) and the resulting finiteness (§6.4), and this README cites neither. The other statements I computed (heights along isogenies, the determinant identity, the quaternion construction, the auxiliary bound, the Lean signatures) came out right, and `Suggested.lean` elaborates with `sorry` as its only warning. There are seven small corrections and three format notes, none blocking; three points on arrangement and wording are left to the human reviewers.

## R01 (P2) — R28.1.3, R28.1.4 and the geometric step of R28.1.11 plan again, in weaker form, what ArakelovGeometryAndAbelianHeights §§5.5, 5.6 and 6.4 on main already own, and the README does not cite those sections

An implementer is asked to build Faltings' correspondence stack over `ℤ` (with "chart compatibility and proper descent over `ℤ`", R28.1.3, line 324) to get the inclusions `e_g·ρ^*M ⊆ ω^{⊗r} ⊆ e_g^{−1}·ρ^*M`, when main has that statement with no constant; and two roadmaps then own one comparison.

ArakelovGeometryAndAbelianHeights §5.5 (its README, line 1520) proves `h_{L̄}(x_A) = m·h_st(A)` for the moduli point of a principally polarized `A`, on the minimal compactification over all of `ℤ`, and says "the two-sided commensurability of the modular line bundle and the Hodge line holds with no correction"; it names the stable-curve route as an alternative "which only gives equality up to `O(1)`". Its §5.6(ii) and §6.4(i) (line 1731) give finitely many `ℚ̄`-classes of principally polarized abelian varieties of dimension `g` over fields of degree at most `D` with `h_st ≤ t`. Its scope paragraph (line 17) leaves to this roadmap the descent to `K`-isomorphism classes, the bounds in an isogeny class and the Tate and Shafarevich theorems, and its consumer paragraph says this roadmap imports the "modular-height identity". Here, item 1 of the ownership list claims "the comparison of the Hodge and modular line bundles with a uniform constant", and no line cites §5.5, §5.6 or §6.4 (the citations stop at §§5.0a–5.4). Two symptoms of the double plan: the proof of R28.1.11 works on R28.1.3's closure of the Baily–Borel model in `ℙ^N_ℤ` with `M = O(1)`, while its *Needs* line names §5.0b's normal `A_g^*` with its ample line; and the Check of R28.1.3 (line 356) says the supplier's compactification is good-prime only, while the supplier-contract paragraph (line 2949) says it is over all of `ℤ`.

The smallest change: in R28.1.11, replace the geometric step by a citation. For a semiabelian model `h(A) = h_st(A)` (§3.4), so §6.4(i) with `D = [K : ℚ]` leaves finitely many `K̄`-classes, and R28.1.10 finishes as now. R28.1.3, R28.1.4 (with its integral-lifting target) and the stable-Picard comparison of R28.1.1, whose only consumer is R28.1.3, then leave the targets and item 1 of the ownership list, and the aliases R28.1.6–R28.1.8 serve no target here. If the stable-curve route is kept as a second proof, the scope section has to say in one clause what it gives that §5.5 does not; I found nothing, its conclusion being the weaker one.

## C01 — The height formula along the shifted tower (R28.2.4, R28.3.3, R28.3.4) is ArakelovGeometryAndAbelianHeights §4.5 and is not cited

R28.3.4 derives `h(A_{s_0+n}) − h(A_{s_0}) = n·log l·(h/2 − (1/m)Σ m_i d_i)` from R28.2.1 and the count `l^{n Σ m_i d_i}` of R28.3.3. The supplier's §4.5 (line 1242) states exactly this formula under the hypothesis that the finite parts of the closures are the levels of an `l`-divisible group `Γ_v`, with the conormal length `n·e_v·d_v`, and says that the determinant argument and the stabilization remain here. A reader cannot tell which roadmap owns the computation. Cite §4.5 in the *Needs* lines of R28.3.3 and R28.3.4 and keep here what it leaves: that the hypothesis holds after the shift, and the identity `Σ m_i d_i = mh/2`.

## C02 — About eighteen names in code font are attributed to ArakelovGeometryAndAbelianHeights, which contains none of them

`GroupScheme.IsSemiAbelianFamily`, `GroupScheme.semiAbelianHom_extend`, `AbelianVariety.faltingsInner`, `HermitianBundle.arakelovDegree_ofFractionalIdeal` (and `_eq_infinitePlace`, `_rescale`), `HermitianMetric.HasLogSingularities` (and its three lemmas), `SiegelModuli.modularMetric_logSing`, `SiegelModuli.MinimalCompactification`, `minimalHodgePower`, `minimalHodgePower_pullback`, `ToroidalCompactification`, `toroidalFamily` and `toroidalToMinimal` occur nowhere in that roadmap's README, which states these objects in prose (§§1.3, 2.0, 2.1, 5.0a–5.4), and its Lean file states nothing. The sections cited do hold the content, so only the names mislead: a reader who searches for them finds nothing. Cite the section and describe the object. The same holds, in one place, for `IntegralOrder.IsOrder`, which ClassicalArithmeticCompletion §7.4 writes `IsOrder` (line 13839).

## C03 — Milne III Theorem 6.6 and Summary 6.11 support the canonical polarization only for a curve with a rational point

R28.5.14 gives these as the sources of "Canonical polarization without a curve point". At that locator the source first assumes a `k`-rational point `P`, defines the theta divisor from it and notes that another point translates it (milne-av lines 4281–4292, printed p. 105; Summary 6.11, p. 107, is about the pair `(C, P)`). The unpointed statement is the one of JacobianChallengePartII §1.4, which the paragraph cites correctly. Say that Milne is the source for the pointed case and for independence of the point, and that the unpointed case is §1.4.

## C04 — Four layer introductions say the layer "is" a section of Faltings 1983, which is not what the layers contain

"This layer is Sections 2 and 3 of Faltings 1983" (line 162), "is Section 4 … up to the height formula" (line 819), "is Section 5" (line 1382), "is Section 6" (line 1675). Layer R28.1 also holds R28.1.12–R28.1.13, taken from the proofs in §§5–6 and from Milne; R28.3.5–R28.3.8 are §5 material placed in Layer R28.3; R28.5.9, R28.5.12 and R28.5.14 are not in §6. The sentences are false as written and present the build as a source's table of contents. "The results of this layer are in §§2–3 of Faltings 1983" would be true, or the sentences can go, the locators being at each target.

## C05 — The quaternion matrix of R28.4.2 is already computed in Tau Ceti at the pin

R28.4.2 defines the matrix of right multiplication by `a + bi + cj + dk` in the basis `1, i, j, k`, and the scope section cites only `QuadraticMap.euler_four_squares`. The pinned library has that matrix, entry for entry the one displayed here, as `toMatrix_mulRight` in `TauCeti/Algebra/Quaternion/MulMatrix.lean` (line 107), with `det_mulRight`. Cite it under "From Tau Ceti" and keep as targets what it lacks: the identity `v·vᵀ = (a² + b² + c² + d²)·1` and the two-graph subspace.

## C06 — Finiteness of Weil polynomials is also a target of ArithmeticStatisticsPartI on main

R28.5.1 is stated for every radius `r` and degree `n`. ArithmeticStatisticsPartI (line 2539) states the case of degree `2g` and radius `q^{1/2}`. The scope sentence "none of the roadmaps this one builds on states them" is true only because that roadmap is not a supplier. One clause in the scope section saying that R28.5.1 is the general form, and that the case `r = √q`, `n = 2g` is stated there, would settle who owns what.

## C07 — The hypothesis `h` of `finite_stableLattices` is not needed

If no stable lattice exists, `F = ∅` satisfies the conclusion: the first clause is empty and the second has a false premise. So `(h : ∃ L, isStableLattice ρ L)` changes nothing. Drop it, here and in the prose of R28.5.9 ("let some `Γ`-stable `ℤ_l`-lattice exist"), or say that it only excludes the empty case.

## N01 — Two lines of `Suggested.lean` exceed 100 characters (lines 14 and 91).

## N02 — In the description's summary, "which needs the Tate conjecture and integral commutant;. Heegner-point and motives roadmaps" has a stray "`;.`"; "…and the integral commutant. Heegner-point…" is meant.

## N03 — Fifteen subsection headings carry the source's statement numbers ("Satz 1:", "Lemma 5:", "Korollar 3:", "Bemerkung 2:"). Each also has a mathematical title, which could stand alone, with the number kept in the locator.

## Verified sound

| Statement | Instances tried | Values computed | Result |
| --- | --- | --- | --- |
| Integral lifting after a finite extension (R28.1.4) | deligne-mumford line 1091; `B(ℤ/2)` over `ℤ_(2)`; `𝔾_m` | Theorem 4.19 is on PDF page 30 = printed 103; torsor `ℚ(√2)` has disc 8; `v(2) > 0` after any extension | locator and Checks right |
| Local maximal-order lattices (R28.5.9) | yu-maximal-orders lines 535–592; `M₂(R)` on `F²` | Lemma 4.4, Thm 4.5 pp. 12–13; Thm 4.8(2) pp. 13–14, lattices iso iff same rank; uniqueness only complete case | supported |
| Arithmetic closed-orbit adapter (R28.5.12) | milne-av lines 2689–2694; `nE₁₂` in `M₂(ℤ)` | Thm 15.5 p. 65, cites Borel 9.11; gcd of entries separates `nE₁₂`, orbit not closed | supported |
| Integral idempotents (R28.5.12) | milne-av lines 2683–2686, 2748–2767; `M₂(ℤ)`; `(1 1/n; 0 0)` | Prop 15.4 p. 65, Application 15.8 pp. 66–67; classes `0, diag(1,0), 1`; denominators unbounded | supported; source's closedness argument wrong (Source issues) |
| Canonical polarization without a curve point (R28.5.14) | milne-av lines 4281–4292, 4381–4392; `y² = −(x⁶+1)` | Thm 6.6 p. 105 assumes a rational point; curve has no real point, leading coefficient `−1` | C03 |
| Satz 1 (R28.1.11) | Arakelov §§5.5, 5.6, 6.4 on main; quadratic twists | supplier: `h_{L̄} = m·h_st` exactly; twists give infinitely many `K`-forms without semistability | R01 |
| Uniform commensurability (R28.1.4) | `β^*α^* = d^g` on `ω`; supplier §5.5 | `d^g·L ⊆ α^*ω ⊆ L` follows; supplier gives `e_g = 1` on its model | true; duplicated, R01 |
| Degree and height conventions | `I = ½ℤ`, `p = ½`; `ℚ(i)`, `p = 2`; `g = 2` factor | `log 2` both ways; index 4 = `2·log 2` with weight 2; `(i/2)²∫ = −vol` | consistent |
| Isogeny height formula (R28.2.1–R28.2.2) | `[n]`; étale kernel of order `p`; `μ_p` | `g·log n − g·log n = 0`; valuations `+m`, `−m`; range `[−(2g−1)m, m]·v_p(deg)` | right |
| Determinant identity (R28.2.9) | `G = A[l^∞]` good reduction; inert quadratic supersingular; `m = h = 1` | `mg = m·2g/2`; `2·1 = 2`; `1/2` not an integer, no such `G` over `ℚ` | right |
| Corrected Satz 2 (R28.3.4), toy lattice of R28.3.2 | `T = ℤ_l²`, `V(H) = ℚ_l(1,l)`, `T(G) = ℤ_l(1,0)` | defect of order `l` at `k = 0`, zero for `k ≥ 1`; faltings-1983 line 408 prints `h(A_n) = h(A)` | right; C01 |
| Four squares (R28.4.1) | `l = 2`: `(a,1,1,2)`; `l = 3`: `(a,1,0,0)` | `a² = −7`, `‖8‖ = 1/8 < 1/4`; `a² = −2 ≡ 1 mod 3` | right |
| Quaternion construction (R28.4.2) | columns `1·q, i·q, j·q, k·q`; `(2,3,5,7)`; `𝔽₅`, `v = 2I`; `𝔽₂` | matrix equals pinned `toMatrix_mulRight`; `87`; `4 ≡ −1`, sum of graphs has dim 8 ≠ 4; 16 elements | right; C05 |
| Satz 3, Satz 4, Korollare 1–2 (R28.4.5–R28.4.7) | `y² = x³ − x` over `ℚ` and `ℚ(i)`; `37a1`, `37b1`; `11a` | `End_ℚ = ℤ`; `a_7 = −1` both, `a_2 = −2, 0`; `a_2,3,5,7 = −2,−1,1,−2` | consistent |
| Weil polynomials (R28.5.1) | `n = 2`, `r = √2`; `n = 0`; `r < 0` | `X² + aX + 2`, `|a| ≤ 2`, and `X² − 2`: six; `{1}`; empty | right; C06 |
| Auxiliary bound (R28.5.4) | `11a1`, `p = 2`; `(11a1)³` | values `1, −3, 5, 1, 10, 2, −1, −3`: primes 2, 3, 5; `P_1(8) = 82³`, `41 > 22` | right |
| `finite_isogenyClasses`, `shafarevich_unpolarized` | `g = 0`; `y² = x³ − x` at 5 | zero variety, one class; `Δ = 64 ≡ 4`, a unit | signatures match R28.5.3, R28.5.13 |
| `finite_stableLattices` | no stable lattice; `V = 0`; unipotent `Γ` | `F = ∅` works; `F = {⊥}`; coinvariant torsion `l^k`, infinitely many classes | true; C07 |
| `finite_directFactors` | milne-av lines 2661–2682; `E^n`, `End E = ℤ` | Thm 15.3 pp. 64–65, any field; factors `E^k` | matches |
| `finite_curves_goodReduction` | `y² = x⁵ − x + 1` at 5; `y² = x³ + x² + 5`; abelian surface | derivative `−1`; `Δ = −11120`, node mod 5; `h¹(O) = 2` shows the dimension hypothesis is needed | matches R28.5.15 |
| `elliptic_isogenous_iff_ap` | Mathlib `localPolynomial` (LFunction.lean line 43) | coefficient of `X` is `−a_v` good, `−1` split, `+1` nonsplit, `0` additive: isogeny invariant | both directions hold |
| `elliptic_tate_hom_iso`, `finite_ellipticIsogenyClass` | pure tensors `1 ⊗ f`; `11a` | they span, so `e` is the natural map; class `11a1, 11a2, 11a3`, degrees 5, 5, 25 | match R28.6.3, R28.6.5 |
| Integral commutant (R28.6.7) | `W = 0`, `W = A[l]`; `ε = lE₁₂` | image `0`, all of `A[l]`; centralizer `(a b; 0 a)` against `M₂(𝔽_l)` | right |

- Source locators checked against the text: about 41 (Milne 26, Faltings 1983 12, Yu 2, Deligne–Mumford 1), all at the stated pages.
- Library declarations opened at the pins: 46 by name, of which 9 read in full (the Hermite theorem at `RamifiedSupport/Hermite.lean` line 130, `mem_ramifiedSupport_iff_exists` line 69, `AlgHom.centralizer_centralizer_range` line 294, `Hom.degree_zsmul` line 63, `localPolynomial` line 43, `GeometricallyConnected` line 40, `tateModuleGaloisRepresentation` line 80, `finite_mahlerMeasure_le` line 107, `cohomologyBaseModule` line 48).
- Cross-roadmap citations resolved: 31 roadmaps, about 150 sections or names, on main or at the open head; all sections exist; the names of C02 do not.
- Dependency check: `depcheck: 215 roadmaps, 2323 edges, 0 problem(s)`; every supplier is on main except AbelianSchemesAndArithmeticModuliPartII, an open new roadmap earlier in the merge order.
- Elaboration: `sorry` the only warning (10). One-tactic probe (`rfl`, `infer_instance`, `simp`, `trivial`) closes none of the 10 theorems. Elaborated signatures compared with the README: no binder lost, nothing changed.
- No change outside the roadmap folder; no `set_option`, no sorry'd data, one `import Mathlib` and seven Tau Ceti modules.

Overlap check: read FaltingsFinitenessAndIsogenyTheoremsPartII, EllipticCurveModularityPartIIGL2TypeAbelianVarieties, MordellLawrenceVenkatesh, HeightsRationalPointsAndObstructionsPartII, AbelianVarietiesOverFiniteFields, ArakelovGeometryAndAbelianHeights, NeronModelsAndSemistableAbelianVarieties, AbelianSchemesAndArithmeticModuli; the open ones consume this roadmap by section; shared with ArakelovGeometryAndAbelianHeights: the modular and Hodge height comparison and bounded-height finiteness of moduli points (owner: ArakelovGeometryAndAbelianHeights, R01) and the tower height formula (owner: ArakelovGeometryAndAbelianHeights §4.5, C01); also Weil-polynomial finiteness with ArithmeticStatisticsPartI (C06).

Source independence: 10 passages compared with 4 sources, none shared (at most 5 consecutive words); largest share faltings-1983, about 59 of about 140 locators; contents compared with faltings-1983 (§§1–6): Layer R28.1 ↔ §§2–3, R28.2 and R28.3 ↔ §4, R28.4 ↔ §5, R28.5 ↔ §6, R28.6 ↔ none, not one to one, order forced by the chain R28.1.11 → R28.3.8 → R28.4.3 → R28.4.5 → R28.5.3 → R28.5.11; see C04 and the human reviewers' section.

Research link: The headline targets are the theorems of Faltings 1983 (with the 1984 erratum) as presented by Deligne 1985 and Milne 2008; the README's consumers use them for modularity of elliptic curves and GL₂-type varieties and for the Lawrence–Venkatesh method. Rests on the README's references and consumer list.

## Not verifiable

- Faltings 1984 (erratum): not read; the DOI is the publisher's page. The correction of Satz 2 was checked only against the printed statement it corrects.
- Tate, Raynaud, SGA 7 I, Faltings–Chai, Reiner, Borel, Deligne's exposé, Zarhin's preprint, Kleiman, Ogg, Fontaine, Martens, Mumford: outside the sample, not opened.
- The Faltings 1983 text is an OCR of a scan; formulas there (the metric factor, the displayed inequalities) were not legible enough to check.

## Source issues

- **Error** in milne-av at Chapter I, Application 15.8, printed pp. 66–67: the source says the conjugacy orbit of a rank-`r` idempotent corresponds to the Grassmannian of `r`-planes and is closed because that variety is complete; it should be that the orbit is the affine variety of pairs (image, kernel), closed because cut out by `e² = e` and `tr e = r`; affects the proof.
- **Error** in faltings-1983 at §4, Satz 2, printed p. 358: the source says every quotient `A/G_n` by a level of an `l`-divisible subgroup has the height of `A`; it should be that these heights are eventually constant; affects a stated result; corrected in print at Faltings 1984, Invent. Math. 75, p. 381.

## For the human reviewers

- Arrangement: the layers run in the order of Faltings 1983 §§2–6 (R28.1 ↔ §§2–3, R28.2–R28.3 ↔ §4, R28.4 ↔ §5, R28.5 ↔ §6), and four introductions say so (README lines 162, 819, 1382, 1675). I judged the order forced by the proofs.
- Wording: R28.1.3 lists the correspondence data as (a)–(d) in the order and lettering of the source's Lemma 2 (faltings-1983 lines 162–176), and its construction follows the source's proof order (lines 177–193), translated and expanded.
- Wording: the proof route of R28.4.3 uses the notation and step order of milne-av lines 5568–5597 (`X_n`, `f_n`, `I`, `i_0`, `v_i`, `u_i`), compressed; at most 5 consecutive words shared.
- Licence: the Provenance section (README line 2582) describes the Apache-2.0 formalization AxiomMath/Mordell and says nothing is taken from it; I did not open that repository.
- Not tested: the 1984 erratum was not read.
