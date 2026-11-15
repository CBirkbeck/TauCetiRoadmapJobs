<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/17136#issuecomment-6901226416 -->
Review (claude) of 95ab11b

Verdict: needs_changes

**For the human reviewers:** this review raises 3 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P3) `*Needs:*` lines of §§7.1, 7.2, 8.1, 8.2 and five layer Dependencies lines omit what the targets use

   - **Location.** README line 607 (§8.1): "*Needs:* §§1.5, 6.1, 6.4; ComplexManifolds Milestone 7 …;
     ComplexKahlerGeometry K4 (Chern curvature)."; line 621 (§8.2): "*Needs:* §§6.1, 6.4, 8.1;
     ComplexManifolds Milestones 5–6; …"; line 552 (§7.1); line 565 (§7.2); the `### Dependencies`
     lines 546, 599, 668, 741, 813.
   - **Claim.** README line 150: a target's *Needs:* line names the "earlier subsections its statement
     and its proof route use, item by item"; each layer's Dependencies line gives the layers it needs.
   - **Witness.** §8.1 proves that H(N)/Γ_b "embeds openly in X" and §8.2 glues "X and the Ω_b(N)" as
     complex manifolds, with X = X_Γ (line 603), the object of §§7.1–7.2; no section of Layer 7 is in
     the *Needs:* of §8.1 or §8.2, nor in the closure of those lines (§§1.5, 6.1, 6.4 and what they
     need). §7.1's second bullet uses §5.3 (line 555), absent from line 552. §7.2 cites
     ComplexKahlerGeometry K6.0 in its statement, absent from its *Needs:*. Layer lines against the
     union of the targets' *Needs:*:

     | Layer | Dependencies line says | the *Needs:* lines of its targets name | difference |
     |---|---|---|---|
     | 6 | Layers 2 and 4–5 | 1 (§6.4: §1.2), 2, 4, 5 | 1 missing |
     | 7 | Layers 5–6 | 1 (§7.4: §1.6), 2 (§7.2: §§2.2–2.4), 5 | 1, 2 missing; no target names Layer 6 |
     | 8 | Layers 6–7 | 1 (§8.1: §1.5), 2 (§8.3: §2.2), 6 | 1, 2 missing; 7 right, but in no *Needs:* |
     | 9 | Layers 6–8 | 2 (§9.1: §2.3), 6, 7, 8 | 2 missing |
     | 10 | Layers 2, 4, 7 and 9 | 1, 5, 6 (§10.6: §§1.4, 5.1, 6.1, 6.4), 2, 4, 7, 9 | 1, 5, 6 missing |

     Layers 1–5, 11 and 12 agree (computed the same way). The line for Layer 7 puts the analytic
     quotient of an arbitrary discrete group behind the cusp structure theorem, which none of
     §§7.1–7.4 uses.
   - **Repair.** (a) Line 552: "*Needs:* §§5.2, 5.3 (compactness and volume of X_Γ); ShimuraVarieties
     §P.6; ComplexComparisonPartII §C−1.1 (open gluing of local models)." (b) Line 565: add
     "ComplexKahlerGeometry K6.0 (the descended Kähler metric)" after "RiemannianGeometry R4.7".
     (c) Line 607: "*Needs:* §§1.5, 6.1, 6.4, 7.2 (X as a complex manifold, Γ being torsion-free by
     §6.4); ComplexManifolds Milestone 7 …; ComplexKahlerGeometry K4 (Chern curvature); FuchsianOrbifolds
     Layer 3 (the cusp coordinate, n = 1)." (d) Line 621: "*Needs:* §§6.1, 6.4, 7.2, 8.1; …" (rest
     unchanged). (e) Begin the Dependencies lines: 546 "Layers 1–2 and 4–5;", 599 "Layers 1–2 and 5;"
     and add "ComplexKahlerGeometry K6.0" to its list, 668 "Layers 1–2 and 6–7;", 741 "Layers 2 and
     6–8;", 813 "Layers 1–2, 4–7 and 9;". Tested on the instance: with (c) and (d) the closure of
     §8.2's *Needs:* contains §7.2, and with (e) each layer line equals the union in the table (Layer 8
     then names Layer 7 in both places). No statement, Check or Lean declaration changes.

One finding, P3, not blocking: three `*Needs:*` lines and five layer `### Dependencies` lines of
`packages/BallQuotientsAndComplexHyperbolicLattices/README.md` disagree with what the targets use.
The three findings of round 1 are repaired. No principle is violated, `Suggested.lean` elaborates
with `sorry` as its only warning, no statement was found false, and no declaration is padding.
There are no maintainer notes for this roadmap.

## Round 1 findings, one by one

- **F01 (locator of §11.3): repaired.** README line 856 now reads "MilneSVI Definition 5.5, line
  2381 to line 2392, for the Shimura datum, Lemma 5.12, line 2475, for the finiteness of the double
  cosets, and Lemma 5.13, line 2486 to line 2495, for the decomposition". Opened: MilneSVI line 2381
  is Definition 5.5 with SV1–SV3 at line 2389 to line 2392; line 2475 is Lemma 5.12; line 2486 to
  line 2495 is Lemma 5.13, with the groups `gKg⁻¹ ∩ G(ℚ)₊`, the form of the README's Γ_a. The
  References bullet (line 966) and the `locator` of `MilneSVI` in `sources.toml` (line 82, "pp.
  54-57"; page markers at MilneSVI line 2350 and line 2473) carry the three items. The only
  remaining citation of line 1686 is §11.4's Theorem 3.12, which is that theorem.
- **F02 (the word "waived"): repaired.** README line 495: "… together with its Theorem 0.7 that
  every lattice is admissible; Raghunathan1972 Ch. XIII, uncertified)"; line 976: "Theorems 0.7 and
  4.10." A case-insensitive search for "waive" in the README, `Suggested.lean` and `metadata.toml`
  finds nothing; the status stays in `sources.toml` line 279.
- **F03 (anaphora in §10.5): repaired.** README line 794: "For the image of Γ₀(2) of the first
  Check, the nodal cubic compactifies X_Γ ≅ ℂ* by one point …". Recomputed: index 3, ν₂ = 1,
  ν₃ = 0, two cusps, genus 1 + 3/12 − 1/4 − 0 − 1 = 0, so X_Γ = ℙ¹ minus two points.

Adversarial pass on the changed passages and the repaired patterns in the rest of the package: the
ten other MilneSVI locators were opened again (lines 1682, 1686, 1690, 1722, 1734, 1742, 1746,
1764, 1770, 1775: each is the item named); no other status word and no other Check with an
antecedent in another bullet was found.

## Verified sound

**Principles (step 1).** Every lattice of PU(1,n), n ≥ 1, arithmetic or not, cocompact or not, with
torsion: no route-specific shortcut. No roadmap is planned again: the form, groups, ball, metric
and sub-balls are RealSemisimpleLieGroups §5.7 (read at its open head: the contract paragraph of
README line 78 agrees with that section item by item — form linear in the first slot, kernel
μₙ₊₁, K acting by v ↦ āAv, g_𝔹, Killing = 2(n + 1)·g_𝔹, sub-balls for 1 ≤ m ≤ n); its scope places
Selberg's lemma, finite generation, non-arithmetic ball quotients and the biholomorphism group of
the ball outside itself, so this roadmap owns them. No algorithm, no copied passage, no sorry'd
data, no `set_option`.

**Elaboration (step 6).** `lake env lean` on `Suggested.lean` from the content checkout: exit 0,
seven warnings, all `declaration uses sorry` (lines 101, 131, 160, 169, 175, 184, 208). No
`TauCeti.*` import, so nothing to build. The `module` line before `import Mathlib`, with no
`public`, is the form of 15 `Suggested.lean` files on main (65 begin with `module`). `#check @name`
for the 16 declarations in one scratch copy: each elaborated type equals its README statement and
the worker's `scratch/signatures.md`; the file has no section `variable`. `IsParabolic` inside
`IsCuspPoint` is this namespace's (`#print`), not Mathlib's `Matrix.IsParabolic`
(Mathlib/LinearAlgebra/Matrix/GeneralLinearGroup/FinTwo.lean:38, 2×2 matrices). Instances
`TopologicalSpace`, `MeasurableSpace` and `IsTopologicalGroup` on `projectiveUnitaryGroup n` are
found.

**Padding probe (step 7), all seven theorems.** Each `sorry` replaced by `first | rfl | simp |
infer_instance | trivial | tauto | decide | aesop | exact ⟨⊥, bot_le, inferInstance, inferInstance,
by simp⟩ | exact ⟨∅, by simp⟩ | exact ⟨1, one_pos, 0, by simp⟩`: seven errors, one at each theorem.
None restates a definition, mirrors a Check or treats a boundary case; each of the nine definitions
occurs in a stated headline.

**Headlines (step 7).** From the Summary: G is the biholomorphism group (§2.1), the Margulis lemma
(§4.4), finiteness of cusp classes and the cocompactness criterion (§6.1), finite presentation
(§6.2), Selberg's lemma (§6.3), neat subgroups (§6.4) — stated. The classification of totally
geodesic subvarieties (§3.3), the analytic quotient (§7.1), the toroidal compactification (§8.2),
Mok's theorem (§§9.3–9.5), extension, algebraicity and uniqueness (§§10.2–10.5), the arithmetic
bridge (§§11.3–11.4), Γ-special subvarieties and the intersection inequality (§§12.2–12.4) — named
in the module docstring with the missing carrier. Checked at the pins: no complex analytic spaces,
no analytification, no pure Shimura data, no Selberg lemma (the only "Selberg" file is
Mathlib/NumberTheory/SelbergSieve.lean), no lattice predicate for groups (`IsLattice` at
Mathlib/Algebra/Module/Lattice.lean:68 is for modules), no Zassenhaus neighbourhood, no neat
subgroups. Tau Ceti's Margulis lemma for Fuchsian groups
(TauCeti/Analysis/Complex/Fuchsian/Margulis.lean:91) is a pairwise statement for PSL(2,ℝ): more
special, not the target. Schwarz–Pick between balls (§2.5) and the Zassenhaus theorem (§4.4) are
statable but are routes to stated headlines, not headlines of the Summary.

**Names at the pins.** Mathlib 1b1ccf4, Tau Ceti 2fd255d: the 61 declarations cited with a file and
line were opened by script and by hand; each is at its line (for instance `indefiniteDiagonal`
Classical.lean:175, `Metric.sphere` Defs.lean:431, `Subgroup.FiniteIndex` Index.lean:679,
`LinearMap.mulRight` Defs.lean:1043, `finite_of_finite_type_of_isJacobsonRing` Ring.lean:691,
`Projectivization.affineOpenPartialHomeomorph` Projectivization.lean:311, `TauCeti.HeisenbergGroup`
Heisenberg.lean:58 with the law z + z′ + xy′ at line 55). Names without a line: `EuclideanSpace.equiv`
(PiL2.lean:296), `Fin.insertNth` (Tuple/Basic.lean:864), `MulAction.orbitRel.Quotient`
(GroupAction/Defs.lean:349), `MulAction.stabilizer` (line 515), `TopCat.GlueData` (Gluing.lean:90),
`Matrix.ProjectiveSpecialLinearGroup` (ProjectiveSpecialLinearGroup.lean:36). The 16 backticked
names the README gives as this roadmap's are the 16 declarations of `Suggested.lean`.

**Adversarial pass (step 3).** Computed by hand in this round.

| Statement | Instance | Values computed | Result |
|---|---|---|---|
| h_t ∈ U(1,1), action (Conventions) | h_t = [[cosh t, i sinh t],[−i sinh t, cosh t]] | h_t is Hermitian; h_t J h_t = diag(cosh² − sinh², sinh² − cosh²) = J; 0 ↦ −i sinh t/cosh t | sound |
| Law of N (Conventions, §1.5) | n_(a,t) ∘ n_(a′,t′) on (u,v) | vertical part t + t′ + 2i⟨a,a′⟩ − 2i Re⟨a,a′⟩ = t + t′ − 2 Im⟨a,a′⟩; ρ preserved: 2 Re⟨a,u⟩ + \|a\|² cancels | sound |
| N ≅ `TauCeti.HeisenbergGroup ℝ`, n = 2 | (p + iq, t) ↦ (p, q, −t/4 + pq/2) | image of a product: z + z′ + pq′, using Im⟨a,a′⟩ = pq′ − qp′ | sound |
| Cayley transform (§1.3) | C, C⁻¹, ρ ∘ C | Re((1 + wₙ)/(1 − wₙ)) − \|w′\|²/\|1 − wₙ\|² = (1 − \|w\|²)/\|1 − wₙ\|²; 1 − w = 2i/(v + i) | sound |
| A and N in Siegel coordinates (§1.5) | a_s n_(a,t) a_s⁻¹; lieExp(τY_(eₙ)) | n_(sa, s²t); C(tanh τ·eₙ) = (0, i e^(2τ)), so s = e^τ; modulus s^(2n−2)·s² = s^(2n) | sound |
| Siegel metric, distances (Conventions, §4.2) | u = 0 | ∂_v∂_v̄(−log y) = 1/(4y²), metric \|dv\|²/(2y²); ℓ(a_s) = (1/√2) log s² = √2 log s; T_t: √2 arcsinh(\|t\|/2y) | sound |
| Displacement on horoballs (§4.2) | n_(a,t) and m·T_t at ρ = y, form 2(Im v − \|u\|²) | cosh²(d/√2) = (1 + \|a\|²/2y)² + t²/4y²; screw: ((2ρ + 2\|u\|²(1 − cos θ))² + (t + 2\|u\|² sin θ)²)/4ρ², bounded away from 1 for ρ ≤ N | sound |
| `IsParabolic` (§4.1) | two null eigenlines with unit eigenvalues λ, μ | ⟨v₁,v₂⟩ ≠ 0 forces λ̄μ = 1, λ = μ, a positive eigenvector: elliptic. Jordan block: λ̄⟨v,v⟩ = 0 | sound: exactly one boundary fixed point |
| `margulis_lemma` route (§4.4) | ε = 1/m, m translates g_iV | products of ≤ m elements have displacement < 1; same translate ⇒ same left coset of Λ₀; C₀ ⊊ … ⊊ C_m would need m + 1 cosets | sound; n = 0: index 1 ≤ m |
| `biholomorphic_ball_iff` | n = 0; f(w) = w/2, n = 1 | n = 0: ball = {0}, G trivial, both sides true; w/2: no inverse on B, and not `ballMap` of an element of U(1,1) (diag(2,1) has gᴴJg ≠ J) | sound both ways |
| `IsLattice`, cusp theorems (§§5.1, 6.1) | n = 0; ⟨T_1⟩, n = 1 | n = 0: sphere empty, quotient a point; strip area (ε⁻¹ − 1)/2 → ∞, cusp part 1/(2Y) | sound |
| Elliptic point of parabolic type (§6.1) | H, R̃ = diag(−1,1,−1), T̃ = 1 + E₂₀ | zᴴHz = 2(Im v − \|u\|²); E₀₂H + HE₂₀ = (i − i)E₀₀ = 0, so T̃ᴴHT̃ = H; √2 arcsinh(1/2000) = 0.00070710675 | sound |
| `selberg_lemma` (§6.3) | char 0, char p; Γ(3) | (ζ − 1)^N ∈ 𝔪R[ζ]; Π(1 − η^j) = e ∈ 𝔐 gives ℓ ∣ e; char p: e prime to p, contradiction; traces −2, −1, 0, 1 against ≡ 2 mod 3 | sound in every characteristic |
| `IsNeat`, §6.4 | lift diag(1/2, i, 2); γ = mη ∈ Γ_b | ratios 1, 1, 1, ±2i, ±i/2, 4, 1/4; block-triangular lift has diagonal a, D′, a, so the eigenvalues are those of m | sound |
| Cusp chart (§8.1) | Ψ_b, μ; ⟨n_(λ,0), n_(iλ,0)⟩ | \|q\|² = exp(−4π Im v/τ); μ = exp(−4πρ/τ); t of the product −2λ², τ = 4λ², χ((1 + i)λ) = exp(−πi) = −1 | sound |
| Appell–Humbert data (§8.2) | H_b(u,a) = −(4/τ)⟨a,u⟩ | πH_b(u,a) + πH_b(a,a)/2 = −(4π/τ)⟨a,u⟩ − (2π/τ)\|a\|²; exp(−4πi Im⟨a,a′⟩/τ) = (−1)^(E_b(a,a′)); E′(iλ, λ) = 1 | sound, matches the supplier's convention |
| Asymptotics (§8.3) | n = 1 | ω = i dq∧dq̄/(4\|q\|² log²\|q\|); circle length 2πr/(√2 r\|log r\|) | sound, agrees with §10.1 |
| L² criterion (§8.4) | f = q^k | integrand r^(2k−1)(−log r)^((ℓ−1)(n+1)); k = 0 diverges iff (ℓ − 1)(n + 1) ≥ −1 iff ℓ ≥ 1 | sound |
| Sections of E^ℓ (§9.2) | Γ(2)/{±1} | E = O(1); vanishing on D: O(ℓ − 3), dimension ℓ − 2 = −(2ℓ − 1) + 3(ℓ − 1); ℓ = 1: no section of O(1) vanishes at two cusps only | sound; ℓ ≥ 2 is sharp |
| Jets (§9.1) | weight \|z\|^(−2n−2) | nonzero value: r⁻³ type divergence; order 1: \|z\|⁻²ⁿ, dr/r, still divergent | sound |
| §10.2 | Kiernan1972 Theorems 1–2 | hypotheses: M hyperbolically imbedded and relatively compact in Y; §10.1 supplies both for d_Γ | sound |
| §10.3 | exp: ℂ → Y(1) | holomorphic, not algebraic; PSL(2,ℤ) has torsion | hypothesis used |
| §10.4 | t ↦ (t², t³) | bijective, not an isomorphism; target not smooth | hypothesis used |
| §10.5 | Γ₀(2); nodal cubic; doubled ℙ¹ | genus 0, two ends; node: two branches, not normal; doubled cusps: not Hausdorff | each hypothesis used |
| §11.1 (c) | A = diag(2,1) | A⁻¹gA = [[a, b/2],[2c, d]]; integral group A·SL₂(ℤ)·A⁻¹ meets SL₂(ℤ) in Γ⁰(2), index 3 | commensurable, not equal |
| §11.3 | n = 1, 2, 3 | det(−J)/det J = 1, −1, 1: the determinant excludes c < 0 only for even n; the README uses Sylvester for all n ≥ 2 | sound |
| §12.4 | n = 1, Q = B × {s} | dim U = 0 = dim Q − n | sound |

**Sources (step 2): the 15 sampled targets**, each locator opened.

- §1.2: BaldiUllmo2023 line 492 to line 496 (matrix classes with diag(1, −1, …, −1)): correct.
- §1.5: BaldiUllmo2023 line 517 to line 519 and line 559 to line 571; Mok2012 line 138 to line 154
  (the group, its centre, the sets S(N)): correct.
- §3.1: BaldiUllmo2023 line 496 to line 506 (stabiliser PU(1,m) × compact): correct.
- §4.1: Mok2012 line 325 to line 335 (elliptic, hyperbolic, parabolic): correct.
- §5.2: WitteMorris2015 line 18549 to line 18561, Definitions B1.3, printed pp. 447–448: correct.
- §5.3: WitteMorris2015 line 1899 to line 1921, Proposition 4.1.11; BaldiUllmo2023 line 338 to line
  339: correct.
- §6.4: WitteMorris2015 line 2969 to line 2973; BaldiUllmo2023 line 523 to line 524 and Proposition
  3.3.3, line 530: correct.
- §7.4: Mok2012 line 21 to line 23: correct.
- §8.1: Mok2012 line 152 to line 239, equations (5)–(6) at line 173 to line 175; BaldiUllmo2023
  line 559 to line 571: correct; the omitted factor χ(a) is as the README says.
- §8.3: Mok2012 Proposition 1, line 295; BaldiUllmo2023 Definition 3.3.4, line 586, Theorem 3.3.5,
  line 600: correct.
- §10.2: Kiernan1972 Theorem 1, line 111 to line 116, Theorem 2, line 157 to line 160; MilneSVI
  Lemma 3.15, line 1746 to line 1748: correct.
- §10.3: MilneSVI Theorem 3.14, line 1742 to line 1744, proof line 1764 to line 1769, minimality
  line 1775 to line 1780; Deng2020 Theorem A, line 87 to line 90: correct.
- §10.4: MilneSVI Corollary 3.16, line 1770 to line 1774; BaldiUllmo2023 Theorem 3.1.12, line 455
  to line 465, line 102 to line 104, Definition 3.1.8, line 431: correct.
- §10.5: Mok2012 line 11 to line 16; MilneSVI line 1690 to line 1694; BaldiUllmo2023 line 511 to
  line 516: correct.
- §11.1: WitteMorris2015 Definition 5.1.19, line 3732 to line 3739, Proposition 9.4.5, line 8668 to
  line 8669; BaldiUllmo2023 Proposition 2.3.3, line 333 to line 339; Mostow1980 Theorem 17.3, line
  3089; DeligneMostow1986 line 151 to line 152: correct.
- Beyond the sample, opened: BaldiUllmo2023 line 59, 91, 151, 355, 573, 649 to 661, 686, 1346;
  Mok2012 line 123, 342, 476, 495, 546; WitteMorris2015 line 1217, 1893, 1940, 1944, 2000, 2700,
  2722, 2754, 2809, 2821, 2910, 2972, 3002, 3008, 3445, 3676, 3909, 8344; Kiernan1972 line 57 to 75;
  Deng2020 line 61: all as cited.
- Manifest: 17 works cited in the README, 17 entries, no local path; no author flagged a locator as
  unverified. No source was fetched; `needs-references.toml` was not written.

**Duplication and ownership (step 4).** `roadmaps grep` for the twelve declaration names of
`Suggested.lean` in every `Suggested.lean` on main and at the open heads: no match. By object in
the READMEs: the Margulis lemma for ℍⁿ is GeometricTopology §7.3 (line 6910 on main), which the
README distinguishes; Selberg's lemma and Zassenhaus neighbourhoods are stated by no roadmap;
ShimuraVarieties (line 686 at its head) mentions ball quotients as rank-one examples only.
`scratch/overlaps.md`: no other pull request changes this roadmap, no cited id is dropped, none is
defined only by a revision, no second copy.

Overlap check: read RealSemisimpleLieGroups, ArithmeticFuchsianGroups, ShimuraVarieties, KleinianGroups, FuchsianOrbifoldsPartII (open), FuchsianOrbifolds, AdelicAlgebraicGroups, ConformalMappingPartII (main), the third list being empty; shared objects and owners: the form, groups, ball, metric and sub-balls — RealSemisimpleLieGroups §5.7; arithmetic lattices and neat levels — AdelicAlgebraicGroups §§3.4, 4.3; Shimura data and Baily–Borel — ShimuraVarieties; the case n = 1 — FuchsianOrbifolds; nothing has two owners.

**Suppliers (step 5).** Dependency check:

    depcheck: 243 roadmaps, 2256 edges, 0 problem(s)

No UPWARD, no CYCLE. RealSemisimpleLieGroups is another author's open pull request adding a new
folder. Every citation was resolved now. On main: VonNeumannAlgebras Layer 9 (README line 2861,
the lattice definition at line 2872), AdelicAlgebraicGroups (`Reduction.IsSArithmetic`,
`Reduction.arithmetic_finite_volume_iff`, `Reduction.levelArithmetic`, `Neat.IsNeatAut`,
`Neat.IsNeatLevel`, "Arithmetic lattices in a real Lie group"), RepresentationTheory/LieGroups
Layer 9 (`IwasawaData`, `kakDecomposition`, `iwasawaDecomposition`), ComplexKahlerGeometry K1–K4
and K6.0, ComplexManifolds Milestones 4–7, ComplexTori Milestone 1, RiemannianGeometry R4.7 and
R5a, FuchsianOrbifolds Layers 0–4 and L2.1, SchemeAndStackFoundations §1.17
(`finiteGroupQuotient_projective`), GeometricTopology §7.3, Completed/ConformalMapping Layer 2. At
open heads: RealSemisimpleLieGroups §§3.1, 5.2, 5.3, 5.4, 5.6, 5.7; ComplexComparisonPartII
C-1.1, C-1.2, C0.6 (its heading is "Fibre-dimension loci"; `analyticSetGeometry` with the finite
analytic normalization is defined there), C1.4, C1.6, C1.9, C4.1, C4.2, C4.4 with the eleven names;
ShimuraVarieties §§P.1, P.2, P.6, 0.1, 0.4, 0.5, 1.2, 2.1, 2.2, 2.5, 2.7, 3.1, 3.3, 3.4a, 3.5 with
the thirteen `TauCeti.Shimura.*` names; PELModuli §M5.5 (three names); ShimuraData §3.8;
AbelianSchemesAndArithmeticModuli §A5.3 (`appellHumbert`); AlgebraicModuliForArithmeticGeometry
§§5.4, 9.5; ArithmeticLocallySymmetricSpaces ALS.0.5; ShimuraCompactifications Layer 2 (cited as a
boundary of scope, not consumed). All exist where cited. Both declared gaps carry the same slug in
`design/plan.json` and under `## Exact supplier contracts`, name ComplexComparisonPartII and a
section, and ask for nothing a roadmap states (C0.6 gives the stalk description of the
normalization, not the extension theorem; K3 covers manifolds only).

**Shape (step 6).** 57 subsections, each with exactly one *Needs:* line and at least three Checks (counted by script); twelve
layers, each ending with Examples and Dependencies; headings as upstream. Layers are named by
their mathematics and no sentence says the roadmap follows a source. Searched and not found: LaTeX
delimiters, pull-request numbers, dates, anchors, machine paths, "review", "round", "current",
"removed", "optional", "deferred". The one defect of this step is R01.

**Copyright and arrangement (step 8).** Wording set beside the source at every locator of the
sample and at these further passages: §6.1 (2) against BaldiUllmo2023 line 649 to line 658; §6.3's
route against WitteMorris2015 line 2974 to line 2976; §9.2 against Mok2012 line 546 to line 553;
§11.2 against WitteMorris2015 line 3909 to line 3911; §12.4 against BaldiUllmo2023 line 91 to line
97; the docstrings of `margulis_lemma` and `selberg_lemma` against Mok2012 line 342 to line 344 and
WitteMorris2015 line 2972 to line 2973. No sentence is shared; the longest common runs are standard
names. BaldiUllmo2023's contents (line 15 to line 21: introduction; notation and recollections; real
Shimura data; ℤ-Hodge theory; comparison of special structures; finiteness; special points) do not
map onto the twelve layers; Mok2012's order (cusp charts, metric, L² sections, embedding) meets
Layers 8–9 only where *Needs:* lines force it (§8.3 needs §§8.1–8.2, §9.2 needs §§8.2–8.4 and 9.1).
No table, figure or list is taken over.

Source independence: 36 passages compared with 8 sources, none shared; largest share BaldiUllmo2023, 38 of 128 locators; contents compared with BaldiUllmo2023 and Mok2012: independent. Not read: Goldman1999, Raghunathan1972, Borel1969, Borel1972, BailyBorel1966, SiuYau1982, Cartan1957, Alperin1987, GarlandRaghunathan1970 (22 locators together).

## Not verifiable

- Goldman1999 Ch. 3 (uncertified): the only locator of §§2.1, 3.2 and 3.4 and one of the locators
  of §§1.4, 2.3–2.5 and 3.3; none of these is a sampled target. The statements of §§1.4, 2.1 and
  2.4 were checked by computation (table above); the locator was not.
- Raghunathan1972, Borel1969, Alperin1987, Borel1972, BailyBorel1966, SiuYau1982, Cartan1957
  (uncertified) and GarlandRaghunathan1970 (waived): not read; each stands beside a readable source
  or a proof route written in the README, except Cartan1957 for §§7.1 and 7.3.
- Ownership against open pull requests was checked with the roadmaps tools over the indexed heads
  (468 pull requests, index of 2026-11-15); the board packages index lists two packages under
  review, neither on this subject.

## Source issues

- **Gap** in Mok2012 at §1.1, equation (5), line 173: the source says every element of the cusp group has vertical part an integer multiple of τ; it should allow any real value determined modulo τ (the product of two generators can have −τ/2); affects a stated result.

## For the human reviewers

- **Licence.** Mok2012 was read in the HKU IMR preprint IMR2009-4 (`sources.toml` line 139, `licence_class` "author-page"); the published chapter was not compared, and the README cites the preprint's numbering.
- **Not tested.** Goldman1999 (uncertified) is the only source cited for §§2.1, 3.2 and 3.4; wording and locators there were compared with no text.
- **Scope.** RealSemisimpleLieGroups (the list of deferrals in its Scope and ownership) attributes lattices in locally compact groups to AdelicAlgebraicGroups AA.2.2–AA.2.3; this README attributes them to VonNeumannAlgebras Layer 9. Both are on main and both define them.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "95ab11b727df150922e8124c1f5388508a9da182", "job": "REV-PKG-BallQuotientsAndComplexHyperbolicLattices~2", "model": "fable", "worker": "chris-x80"} -->
