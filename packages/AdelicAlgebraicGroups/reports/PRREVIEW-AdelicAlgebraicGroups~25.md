# Review of AdelicAlgebraicGroups (pull request #3027 at 71bbefa)

**Verdict:** accepted

**Summary.** A review of the change against `main`: 653 changed lines since `aecb53a`. The verdict is accepted, with no findings: the six added subsections (1.5a, 2.6, 3.4a, 4.1a, 4.2a, 4.5a) were recomputed statement by statement, their locators into Oesterlé, Borel, Rapinchuk and Arthur were read at the text, and their citations of other roadmaps resolve on `main`. There are five small corrections and no format notes. One is new: 2.6 (iii) states Oesterlé's comparison of Tamagawa measures only when the quotient has no characters, while 4.1a needs it in general. The other four are carried, and one of them is in untouched text. One question for the author is carried; nothing is left for the human reviewers.

## C01 — The description does not mention this roadmap, although its addition is larger than four of the additions it names

A reader of the description cannot tell that AdelicAlgebraicGroups gains six subsections. Its sentence on the largest additions names eight roadmaps and omits this one. The README here gains 621 lines against `main`; four of the named additions are smaller (AlgebraicModuliForArithmeticGeometryPartII 444, GeometryOfNumbersAndQuadraticArithmetic 283, HeightsRationalPointsAndObstructions 249, MetaplecticAutomorphicForms 244).

A clause in that sentence would make it right: "…, and AdelicAlgebraicGroups (lattice stabilizers; measures of top forms, of groups with a unipotent radical and on homogeneous spaces; `τ(G_m) = 1`; Ono's formula; strong approximation for any finite set of places; class-set integration and the mass)".

## C02 — 2.6 (iii) states the comparison of Tamagawa measures only when `G/H` has no characters, and the general case that 4.1a needs is left unnamed

Clause (iii) of *homogeneous-gauge-measure* (line 2074) assumes that `X*(G_{F̄}) → X*(H_{F̄})` is injective with finite cokernel. Its own citation says that the source has no such hypothesis, and that is so: Oesterlé, Chapter III, Theorem 3.3, p. 37 (oesterle line 1031) identifies the quotient of `τ_G` by `τ_H` with the restriction of `τ_{G/H}` to the open image of `G(𝔸)`, for every exact sequence, because `L_v(G, s) = L_v(H, s)·L_v(G/H, s)` (oesterle line 1025).

The general case is used inside this roadmap. The route of *tamagawa-torus-ono* (line 4215) rests on the exact-sequence formula for Tamagawa numbers "proved as part of this target", and for a sequence of tori `1 → T′ → T → T″ → 1` the quotient `T″` has characters, so (iii) as stated does not apply. An implementer of 4.1a must therefore prove the general comparison with no statement of it to aim at.

The smallest repair keeps (iii) and adds one sentence to it: "Without the hypothesis on characters, the quotient of `τ_G` by `τ_H` is the restriction of `τ_{G/H}` to the open image of `G(𝔸)` in `(G/H)(𝔸)`", with AA.2.6 added to the *Needs* line of *tamagawa-torus-ono*. The description's phrase "stated in the generality of its source" is then also true of this clause.

## C03 — Some citations in the new subsections have no locator, and one target has none at all

*tamagawa-quadratic-norm-torus* (line 4241) cites only "[Ono], as the case of *tamagawa-torus-ono* computed in the Route". Three other citations have no theorem or page: [Gross] in *class-set-integration* (line 5217); [Kneser] and [Platonov] in *strong-approximation-any-places* (line 4619); [Platonov–Rapinchuk] in the same target (line 4625). A reader cannot check these attributions. The statements are standard, and the other locators of those targets hold ([Rapinchuk], Theorem 2.3, p. 12; [Arthur], (2.1), p. 13).

The repair is a theorem or page for each. For the norm-one torus, Oesterlé, Chapter IV, Corollaire 3.3, p. 56, with the computation in the Route, would do.

## C04 — The volume identity of 4.5a contains GeometryOfNumbersAndQuadraticArithmetic §3.3.4, and the ownership paragraph still gives that identity to the other roadmap

*class-set-integration* (line 5200) proves `vol(G(F)\G(𝔸)^1) = vol(U)·vol(G(F_∞)/A_G(ℝ)^0)·mass(U)` for `G` connected reductive and compact at infinity modulo `A_G(ℝ)^0`. For `G = SO(q)`, `q` totally positive over a totally real field and `U` the stabilizer of a lattice, `A_G` is trivial and this is the identity of GeometryOfNumbersAndQuadraticArithmetic §3.3.4 (that README, line 1138), whose *Needs* line cites AA.2 and AA.3 only. The ownership paragraph here (line 5843) says that §3.3 of that roadmap owns "the adelic mass identity", with no word that 4.5a now states it in general, so a reader finds two statements and no relation between them.

A clause in that paragraph repairs this side: "§3.3.4 there is the case `G = SO(q)` of *class-set-integration* (AA.4.5a)". The matching citation from §3.3.4 belongs to that roadmap.

## C05 — Untouched text: README 1.5 (lines 1016 and 1022) cites [Borel] §5.5 for unimodularity, and that lemma does not treat groups with a rational character

*Local unimodularity of reductive groups* and *Adelic groups of reductive groups are unimodular* cite "[Borel], §5.5, p. 20". Borel's Lemma 5.5 (borel lines 655–658) proves that unimodularity is equivalent to every left-invariant rational top form being right-invariant, and concludes only when `G` has no rational character; `GL_n` has one. The statements are true. Oesterlé, Chapter I, Proposition 5.3 and Corollaire 5.4, p. 23 (oesterle lines 470–477), already in the References, gives both targets directly. This is for a separate pull request.

## Questions for the author

- *tamagawa-torus-ono* (lines 4201–4229): are ClassFieldTheory layers 5 and 10 needed as well as 0 and 11? The route cites Oesterlé IV 2.7, where the map `Λ_T` is defined through the local invariants `H²(F_v, G_m) → ℚ/ℤ` and their sum (oesterle lines 1643–1649), which this README elsewhere attributes to layers 5 and 10 (the local Brauer group and the global Brauer sequence). What stopped me: I could not tell whether layer 11 is meant to carry the invariant maps for this purpose.

## Previous findings

- none: the previous report raised no finding. Its small corrections C01–C04 are unrepaired, since the folder did not change; they are carried as C01, C05 (now marked as untouched text), C03 and C04.

## Verified sound

| Statement | Instances tried | Values on each side | Result; change |
|---|---|---|---|
| 1.5a *lattice-stabilizers* (c) | `GL₂/ℚ`, `U = g GL₂(ℤ̂) g⁻¹`, `g_p = diag(p,1)` | `g k g⁻¹ = [[a, pb],[c/p, d]]`; fixes `pℤ_p ⊕ ℤ_p = gℤ_p²`; sends `e₁` to `(a, c/p) ∉ ℤ_p²` | true; Check agrees |
| 2.6 *top-form-measure* | `dT/T` on `ℤ_p^×`; `ω → 2ω` | `1 − p⁻¹`; factors `|2|_ℝ = 2`, `|2|_ℂ = 4`, `|2|_{ℚ₂} = 1/2` | true |
| 2.6 *tamagawa-measure-unipotent-radical* | Borel `B ⊂ SL₂`, coordinates `n(u)a(t)` | product `n(u+t²u₀)a(tt₀)`; left form `du∧dt/t³`, right `du∧dt/t`; `∫f(g a(t₀))dμ_l = |t₀|²∫f`; `χ = t²` | true; Mathlib convention, inverse of Oesterlé I 5.3 as stated |
| 2.6 *homogeneous-gauge-measure* (i), negative controls | `SL₂×G_m` on `𝔸²`; affine group on `𝔸¹` | stabilizer `{([[s,u],[0,s⁻¹]],s)}`, `det Ad = s²`, `(1,s)^*(dy₁∧dy₂) = s⁻²`; `d(ay+b) = a·dy` | true; both hypotheses needed |
| 2.6 (iii) (C02) | `GL₂ → PGL₂`, `H = G_m`; a sequence of tori with `T″ = G_m` | `(1−q⁻¹)(1−q⁻²)/(1−q⁻¹) = 1−q⁻² = #PGL₂(k_v)q⁻³`; for `T″ = G_m`, `L_v(T″,1) = (1−q⁻¹)⁻¹ ≠ 1` | true as stated; narrower than source; C02 |
| 3.4a *tamagawa-multiplicative-group* | `ℚ`; `ℚ(i)`; local factor at `s = 1` | `ℚ`: `1 = κ_ℚ`; `ℚ(i)`: `2π·(1/2)/4 = π/4 = 2π/(4·2)`; `z(f_v,1,1)L_v(1)⁻¹ = ∫f_v dx_v`; `τ_{G_m} = κ_F⁻¹ν_T` | true; `ν_T` matches ANT II §5.3j |
| 3.4a *tamagawa-number-unipotent-radical* | affine group `(a,b)(a′,b′) = (aa′, ab′+b)`; fibre over `m` | `da db/a² = (da/a)db′` at `b = ab′`, `(da/a)(db/a)` in `(1,b)(a,0)`; fibre `m⁻¹N(F)m\N(𝔸)`, volume `τ(N)` on `M(𝔸)¹` | true |
| 4.1a *tamagawa-torus-ono*, *tamagawa-quadratic-norm-torus* (C03) | `G_m`; `R¹_{ℚ(i)/ℚ}G_m` directly | `H¹(F,ℤ) = 0`, `τ = 1`; volumes `π` at `∞`, `(1/2)/(1/2)·2 = 2` at 2, `(1±p⁻¹)^{∓1}·(1±p⁻¹)^{±1} = 1` at odd `p`; `(4/π)·π·2/4 = 2 = #H¹(C₂,ℤ_−)/1` | true |
| 4.1a route, Ono's lemma | lattices of a finite group `Γ` | `K₀` of `Γ`-lattices `⊗ℚ = R_ℚ(Γ)⊗ℚ`, spanned by permutation modules (Artin) | true as stated; oesterle lines 1769–1773 |
| 4.2a *strong-approximation-any-places* | `D¹` definite over `ℚ`, `S = {p}` split, `S = {∞}`, `S = ∅` | `D¹(ℚ_p) ≅ SL₂(ℚ_p)` noncompact: dense; `D¹(ℝ) = SU(2)` compact: 24 Hurwitz units, not dense; `G(F)` discrete | true; rapinchuk lines 565–571 |
| 4.5a *class-set-integration* | `GL₁/ℚ`, `U = ℤ̂^×`; `U′ = {u ≡ 1 mod 4}` | one class, `Γ = {±1}`, `mass = 1/2`, `vol = 1·2/2 = 1 = κ_ℚ`; `U′`: one class, `Γ = 1`, `1 = 2·(1/2)`; `Γ_i ∩ A_G(ℝ)⁰ = 1` (torsion-free) | true |
| 4.5a against GeometryOfNumbersAndQuadraticArithmetic §3.3.4 (C04) | `G = SO(q)`, `q` totally positive | `A_G = 1`; 4.5a: `vol = vol(U)·vol(G(F_∞))·mass(U)`; §3.3.4: mass `= vol/(vol(G(K_∞))·vol(K_f))` | same identity; C04 |
| 1.5 unimodularity (C05, untouched) | `GL_n` | has the rational character `det`; Borel 5.5 concludes only for `X(G°) = 1`; Oesterlé I 5.4 covers reductive | true; locator only |

- Source locators read at the text: 21 of Oesterlé (I 2.3–2.4 p. 18; I 4.7 p. 22; I 5.3–5.4 p. 23; I 5.9 p. 24; I 5.12 and 5.14 p. 25; II 1.3 p. 27; III 3.1–3.3 pp. 36–37; III 5.3 p. 41; IV 2.5, 2.7, 3.1–3.3 pp. 53–56; Introduction p. 13), Borel §2.1 p. 11 and §8.7 pp. 28–29 (borel lines 283–287, 1000–1015), Rapinchuk Theorem 2.3 p. 12, Arthur (2.1) p. 13 with Theorem 2.1 (arthur lines 539–574). All support the statements as written.
- Library declarations opened at the pins: `Submodule.IsLattice` (`Mathlib/Algebra/Module/Lattice.lean`), `ImplicitFunctionData.implicitFunction` (`Analysis/Calculus/Implicit.lean:159`), `MeasureTheory.Measure.addHaarMeasure`, `NumberField.dedekindZeta_residue` (`DedekindZeta.lean:57`), `NumberField.tendsto_sub_one_mul_dedekindZeta_nhdsGT`, `groupCohomology.coindIso` (`GroupCohomology/Shapiro.lean:58`), `groupCohomology.H1ofAutOnUnitsUnique` (`Hilbert90.lean:107`), `TauCeti.PointTopology.isClosedEmbedding_comap_of_surjective` (`Topology/Algebra/PointTopology/Functoriality.lean:110`), `TauCeti.dedekindZeta_eulerProduct_hasProd` (`EulerProduct/Analytic.lean:498`), the two geometric-character declarations (`CharacterLattice/Basic.lean`).
- Cross-roadmap citations of the new text resolved on `main` and at this head: ReductiveGroups Layer 3A, 3A.5d, 3A.5f and Layer 6A item 1; ReductiveGroupsPartII RG2.0 *smooth-group-analytic-charts*; AnalyticNumberTheoryPartII §§5.3f, 5.3h, 5.3j, 5.3k; ClassFieldTheory layers 0, 11, 13. The internal targets the new text names all exist with the hypotheses used (AA.3.4 *Finite volume* covers every connected linear group; AA.2.2 *Modular function* covers every finite-type group).
- Record: no layer, heading or Lean declaration of the README at the merge base is removed; six headings added. `Suggested.lean` is identical to `main`'s.
- Dependency check: `depcheck: 132 roadmaps, 1470 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Automatic checks: all passed. Elaboration of `TauCetiRoadmap/AdelicAlgebraicGroups/Suggested.lean` exits 0 with 19 warnings, all ``declaration uses `sorry` ``. No declaration was added or changed, so the one-tactic probe and the signature comparison had nothing new to test.

Overlap check: read OrbitMeasuresOnAdelicGroups, ReductiveGroupsPartII, ArithmeticLocallySymmetricSpaces (main) and searched the open heads, including GlobalNumberFields, OrthogonalSpinGroups, SurfaceGroupCharacterVarieties, QuaternionicModularForms and HodgeClassesForJacquetLanglands, for the six new objects. Top-form measures, `M ⋉ N`, `τ(G_m) = 1`: owner AA 2.6 and 3.4a; OrbitMeasuresOnAdelicGroups cites them at this head. Class-set integration and the mass: owner AA 4.5a; DiscreteSeriesCoefficientsAndAutomorphicMetrics §7.5a and HermitianFormsAndLattices cite it; GeometryOfNumbersAndQuadraticArithmetic §3.3.4 states its `SO(q)` case uncited (C04). Lattice stabilizers: owner AA 1.5a; OrthogonalTamagawaAndLatticeMass states the orthogonal case on its own carriers. Nothing else shared.

Source independence: changed passages only: 14 passages compared with 4 sources (Oesterlé, Borel, Rapinchuk, Arthur), none shared; largest share in the changed passages Oesterlé, 21 of about 30 locators; no layer is added, removed or reordered, so the arrangement was not compared. Weil and Tate could not be read.

Research link: 2.6, 3.4a and 4.1a are the Tamagawa measure and number of Weil (1961), Ono (1963) and Oesterlé (1984); 4.2a is the Kneser–Platonov strong approximation theorem as in Rapinchuk (2014); 4.5a is the mass of Gross (1999). Rests on the README's citations and on Oesterlé and Rapinchuk as read.

## Not verifiable

- [Weil], *Adeles and Algebraic Groups*, II §§2.2, 2.4 (2.6): no open copy.
- [Tate], thesis, §§4.3–4.4 (3.4a): no legal copy found; the volume `κ_F` was recomputed for `ℚ` and `ℚ(i)` instead.
- [Ono] (4.1a): no open copy; Oesterlé IV 3.3 was read in its place.
- [Platonov–Rapinchuk–Rapinchuk], Theorem 3.71, p. 196 (2.6): paywalled.
- [Gross] (4.5a), [Kneser], [Platonov] and [Platonov–Rapinchuk] (4.2a): cited without a locator (C03), and paywalled.

## Source issues

- none

## For the human reviewers

- none
