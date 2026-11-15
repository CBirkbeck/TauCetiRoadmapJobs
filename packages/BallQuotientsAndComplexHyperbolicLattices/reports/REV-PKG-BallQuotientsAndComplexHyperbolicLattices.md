<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/17136#issuecomment-6900386422 -->
Review (claude) of bea804d

Verdict: needs_changes

**For the human reviewers:** this review raises 3 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P3) §11.3 cites Milne's Baily–Borel theorem for the Shimura datum and the component decomposition

   - **Location.** `packages/BallQuotientsAndComplexHyperbolicLattices/README.md` line 856 (§11.3):
     "the analytic Shimura variety of level K_f is the finite disjoint union of the Γ_a^eff\X⁺ ≅ Γ_a^eff\B
     (ShimuraVarieties §0.5; MilneSVI line 1686 to line 1689; …".
   - **Claim.** The Milne passage supports the statements of §11.3 (a pure Shimura datum, its components,
     the decomposition of the finite-level quotient into arithmetic quotients of X⁺).
   - **Witness.** MilneSVI line 1686 to line 1689 is Theorem 3.12 (Baily–Borel: an arithmetic quotient is
     Zariski-open in a projective variety). It names no Shimura datum and no decomposition. The datum is
     Definition 5.5 (MilneSVI line 2381); the decomposition is Lemma 5.13 (MilneSVI line 2486 to line 2492,
     summarised at line 2531).
   - **Repair.** In §11.3 replace "MilneSVI line 1686 to line 1689" by "MilneSVI Definition 5.5, line 2381,
     and Lemma 5.13, line 2486 to line 2492". Add "Definition 5.5, Lemma 5.13" to the MilneSVI bullet of
     `## References` and to the `locator` of the `MilneSVI` entry of `sources.toml`. Theorem 3.12 stays
     where §11.4 cites it (README line 869), which is correct. Tested: both passages opened; Lemma 5.13
     states the decomposition over a set of double-coset representatives, as §11.3 does.

2. **F02** (P3) the manifest status "waived" is written into the roadmap text

   - **Location.** README line 495 (§6.1 (2)): "… together with its Theorem 0.7 that every lattice is
     admissible, waived; Raghunathan1972 Ch. XIII, uncertified)"; README line 976 (`## References`):
     "Theorems 0.7 and 4.10 (waived)".
   - **Claim.** The README is timeless: no record of how a citation was settled.
   - **Witness.** "waived" is the `status` of `GarlandRaghunathan1970` in `sources.toml` line 279, a
     decision of this project's process. No README among the 199 roadmaps on main carries the word as a
     citation marker (`grep -l "(waived)\|, waived"` over `TauCetiRoadmap/*/README.md`: 0 files);
     "uncertified" is used by 10 of them and is not raised here.
   - **Repair.** Delete ", waived" at line 495 and " (waived)" at line 976; the citation stays, by its
     locator (Theorems 0.7 and 4.10), and the status stays in `sources.toml`.

3. **F03** (P3) the fourth Check of §10.5 points at the wrong lattice

   - **Location.** README line 794 (§10.5, fourth Check): "For the same Γ, the nodal cubic compactifies
     X_Γ ≅ ℂ* by one point and is compact Hausdorff but not normal …".
   - **Claim.** "The same Γ" has X_Γ ≅ ℂ*.
   - **Witness.** The Check before it (line 793) is "Γ cocompact", for which X_Γ is compact and is not ℂ*;
     the Check before that (line 792) is the image of Γ(2), with X_Γ = ℙ¹ ∖ {0, 1, ∞}. Only the first
     Check (line 791, the image of Γ₀(2): genus 1 + 3/12 − 1/4 − 2/2 = 0, two cusp classes) has X_Γ ≅ ℂ*.
   - **Repair.** Begin the Check "For the image of Γ₀(2) of the first Check, the nodal cubic compactifies
     X_Γ ≅ ℂ* by one point …"; the rest is unchanged. Tested on the instance: nodal cubic minus its node is
     ℂ*, the node has two local branches, one in each of the two ends, so the space is compact Hausdorff,
     not normal, and differs from (S*_Γ)^an = ℙ¹, as the Check says.

Three findings, all P3 (one locator, one process word, one unclear Check); none blocking. No
principle is violated, the elaboration passes, the adversarial pass found no false statement, and no
declaration of `Suggested.lean` is padding. There is no previous review of the package and there are
no maintainer notes.

## Verified sound

**Principles (step 1).** No route-specific shortcut (every lattice: arithmetic or not, cocompact or
not, with torsion; every n ≥ 1). No roadmap is re-planned: the form, groups, ball, metric and sub-balls
are taken from RealSemisimpleLieGroups §5.7 (read at its open head: the README's contract paragraph
agrees with that section item by item, including the range 1 ≤ m ≤ n of sub-balls and the factor
Killing = 2(n + 1)·g_𝔹), lattices from VonNeumannAlgebras Layer 9 (main, README line 2872 there),
arithmetic lattices and neat levels from AdelicAlgebraicGroups §§3.4, 4.3 (main, lines 3384, 4619,
4674). No algorithm, no copied passage, no sorry'd data, no `set_option`.

**Elaboration (step 6).** `lake env lean` on `Suggested.lean` from the content checkout: exit 0, seven
warnings, all `declaration uses sorry` (lines 101, 131, 160, 169, 175, 184, 208), nothing else. The
`module` header before `import Mathlib` is the form of 76 `Suggested.lean` files on main. `#check @name`
for all 16 declarations in one scratch file: every elaborated type equals its README statement; no
section `variable` is used in the file, so no binder can be lost. `IsParabolic` resolves to this
namespace's definition, not to Mathlib's `Matrix.IsParabolic` (2×2 only), despite `open Matrix`
(`#print IsCuspPoint` shows it).

**Padding probe (step 7), all seven theorems.** Each `sorry` replaced by
`first | rfl | simp | infer_instance | trivial | tauto | exact ⟨⊥, bot_le, inferInstance, inferInstance, by simp⟩`:
all seven fail (errors at the seven theorem bodies). None restates a definition, mirrors a Check or
treats a boundary case. The nine definitions each serve a stated headline (`ballDist` for
`margulis_lemma`, `conjugationMap` for `IsNeat`, `IsParabolic` for `IsCuspPoint`).

**Headlines (step 7).** Stated: biholomorphism group (§2.1), Margulis lemma (§4.4), finiteness of cusp
classes and the cocompactness criterion (§6.1), finite presentation (§6.2), Selberg's lemma (§6.3),
neat subgroups (§6.4). Named in the module docstring as not statable, with the missing carrier: §3.3,
§7.1, §8.2, §§9.3–9.5, §§10.2–10.5, §§11.3–11.4, §§12.2–12.4. The "library lacks" claims were checked at
the pins: no `ComplexAnalyticSpace`/analytic space, no analytic subsets of manifolds (the `AnalyticSet`
hits are descriptive set theory), no Shimura datum (the 143 files matching "Shimura" cite Shimura's
Hecke rings), no Baily–Borel, no totally geodesic predicate; Tau Ceti has `AbelianVariety`
(TauCeti/AlgebraicGeometry/AbelianVariety/Basic.lean:95), and the docstring correctly names the
analytification, not abelian varieties, as what is missing for §8.2. The Schwarz–Pick contraction
(§2.5) and Cartan's uniqueness theorem (§2.1) are statable but are routes to the stated headlines, not
headlines of the Summary; no finding.

**Names at the pins.** All 45 Mathlib and 16 Tau Ceti declarations cited with a file and line were
opened at mathlib 1b1ccf4 and Tau Ceti 2fd255d: every one is at the stated line (for instance
`indefiniteDiagonal` Classical.lean:175, `Real.arcosh` Arcosh.lean:61, `Group.IsFinitelyPresented`
FinitelyPresentedGroup.lean:95, `Ideal.height_le_spanFinrank` KrullsHeightTheorem.lean:282,
`TauCeti.HeisenbergGroup` Heisenberg.lean:58, `TauCeti.riemannianVolume` Volume.lean:82). All 16
backticked names the README attributes to this roadmap are declared in `Suggested.lean`, and every
Lean name appears in the README.

**Adversarial pass (step 3).** Values computed by hand; every row is consistent.

| Statement | Instance | Computed | Result |
|---|---|---|---|
| U(1,n), h_t (Conventions, §1.1) | n = 1, h_t = [[cosh t, i sinh t],[−i sinh t, cosh t]] | h_tᴴJh_t = diag(cosh² − sinh², sinh² − cosh²) = J; h_t·0 = −i tanh t; S = swap gives −J | sound |
| `indefiniteUnitaryGroup`, `projectiveUnitaryGroup` | n = 0 | U(1,0) = U(1) abelian, centre everything, G trivial | sound, as the docstring says |
| `ballMap` (§1.4) | g = diag(2,1): w ↦ w/2; T_t lift, n = 2 | diag(2,1) ∉ U(1,1) and is not onto B; a lift of T_t fixes every (c, 1), only c = 0 on the sphere | sound; justifies `IsParabolic` counting on the sphere |
| `biholomorphic_ball_iff` | n = 0; n = 1, f(w) = w/2; f = ballMap h_t | n = 0: both sides true (one map, one class); w/2: left false (no inverse on B), right false; h_t: both true, class unique since scalars are the centre | sound in both directions |
| `ballDist` (§2.4) | w = 0, w′ = (1/2, 0); boost tanh t = 1/2 | argument 2/√3, arcosh = ½ log 3, d = (√2/2) log 3 = √2 artanh(1/2); images 1/2, 4/5 give 3/5 ÷ (3√3/10) = 2/√3 again | sound, invariant |
| Killing comparison (§§2.3–2.4) | n = 2; general n | B(Y_v,Y_v) = 4(n+1), g_𝔹 = 2 at 0, ratio 2(n+1); curvatures −1/3, −1/12 → −2, −1/2; Ric = −2 − (2n−2)/2 = −(n+1) | sound, agrees with the supplier's Checks |
| Heisenberg law (Conventions, §1.5) | n = 2, a = 1, a′ = i | composition of n_(a,t) gives t + t′ − 2 Im⟨a,a′⟩; (1,0)(i,0) = (1+i, −2), reverse (1+i, 2), commutator T₋₄ | sound |
| N ≅ `TauCeti.HeisenbergGroup ℝ` (§1.5) | (p + iq, t) ↦ (p, q, −t/4 + pq/2) | image of a product has z = z₁ + z₂ + p q′, the law x·y′ at Heisenberg.lean:55 | sound |
| Siegel metric (Conventions) | u = 0 | ω = i dv∧dv̄/(4y²), metric |dv|²/(2y²); ℓ(a_s) = √2|log s|; T_t displacement √2 arcsinh(|t|/2y) | sound |
| `margulis_lemma` route (§4.4) | ε = 1/m, m translates g_iV | product of ≤ m elements has displacement < 1; two in one g_iV differ by V⁻¹V ⊂ U; strict chain C₀ ⊊ … ⊊ C_m would have ≥ m + 1 > m cosets | sound; controls C_m (index 1), S₃ (index 2), dense free subgroup (discreteness needed) |
| Displacement on horoballs (§4.2) | screw parabolic m·T_t, m = e^(iθ) on a u-line | h⁻¹g(h) = ((m − 1)u, t + 2|u|² sin θ): the two parts never vanish together, the first is unbounded off the fixed space | sound: small displacement forces large ρ |
| `IsLattice` (§5.1) | trivial Γ, n ≥ 1; ⟨T_1⟩, n = 1 | G noncompact, Haar measure infinite: not a lattice; strip area (ε⁻¹ − 1)/2 → ∞, cusp part 1/(2Y) | sound |
| σ-algebra of the carrier (§5.1) | quotient by the compact centre | coinduced σ-algebra ⊇ Borel by continuity; ⊆ by Suslin (set and complement analytic) | sound |
| `IsLattice.compactSpace_quotient_iff`, `exists_finset_cuspPoint_orbits` | n = 0; PSL(2,ℤ); cocompact Γ | n = 0: sphere empty, both sides true; PSL(2,ℤ): one cusp class, not cocompact; cocompact: displacement of a parabolic would attain its infimum | sound |
| `IsLattice.isFinitelyPresented` (§6.2) | [F₂, F₂], infinite covolume | free of infinite rank: the lattice hypothesis is used | sound |
| `selberg_lemma` (§6.3) | Γ(3) ⊂ SL(2,ℤ); char p example; ι empty | traces ≡ 2 mod 3 exclude −2, 0, 1; Π(1 − η^j) = e ∈ 𝔐 forces ℓ | e; two residue characteristics give d = 1; unipotents of order p have only eigenvalue 1 | sound in every characteristic |
| `IsNeat`, `IsLattice.exists_neat` (§6.4) | lift diag(1/2, i, 2), n = 2 | ratios 1, 1, 1, ±2i, ±i/2, 4, 1/4: no root of unity ≠ 1, while 2i·(i/2) = −1 | sound; strictly weaker than `Neat.IsNeatAut`, as stated |
| Parabolic-type elliptic point (§6.1) | H = [[0,0,−i],[0,−2,0],[i,0,0]], z = (1,u,v) | zᴴHz = 2(Im v − |u|²); R̃, T̃ preserve H; √2 arcsinh(1/2000) = 0.0007071067 | sound |
| Cusp chart and semi-character (§8.1) | Γ_b = ⟨n_(λ,0), n_(iλ,0)⟩ | τ = 4λ², product n_((1+i)λ, −2λ²), χ = e^(−πi) = −1; e_(a+a′) = e_a(u + a′)e_a′(u) holds, both sides differing by the same e^(−4πi Im⟨a,a′⟩/τ) | sound |
| Riemann form (§8.2) | same cusp group | E′(iλ, λ) = (4/τ)λ² = 1, principal; deg L_b = −1 | sound |
| Asymptotics and L² (§§8.3–8.4) | n = 1; f = q^k | ω = i dq∧dq̄/(4|q|² log²|q|); integrand r^(2k−1)(−log r)^((ℓ−1)(n+1)), divergent for k = 0 exactly when ℓ ≥ 1; ℓ = 0: ∫dr/(r log² r) finite | sound; agrees with the ℓ = 0 Check of §9.2 |
| Sections of E^ℓ (§9.2) | Γ(2)/{±1} | E = O(−2 + 3) = O(1); vanishing on D: O(ℓ − 3), dimension ℓ − 2 = dim S_(2ℓ)(Γ(2)) | sound |
| Punctured-disc metric (§10.1) | circle |q| = r | 2πr/(√2 r|log r|) = √2π/|log r| → 0 | sound, Kiernan1972 line 62 |
| Integral points (§11.1 (c)) | SL₂, A = diag(2,1); SL₂ → PGL₂ | A⁻¹gA = [[a, b/2],[2c, d]]: integral group A·SL₂(ℤ)·A⁻¹, meeting SL₂(ℤ) in Γ⁰(2), index 3; π(SL₂(ℤ)) of index 2 in PGL₂(ℤ) | sound: commensurable, not equal |
| Components of X (§11.3) | n = 1, 2 | |det g|² = det(−J)/det J = (−1)^(n+1): −1 for n = 2, impossible; +1 for n = 1, realised by the swap | sound |
| Totally geodesic ⇒ Γ-special (§12.3) | n = 1 | only Z = S_Γ | sound |
| Intersection inequality (§12.4) | n = 1, Q = B × {s}; Q = {x₀} × S_Γ | dim U = 0 = dim Q − n in both | sound; the README states the inequality only, and leaves Ax–Schanuel to its consumers |
| gap:normality-analytification | cusp y² = x³, node | normalizations t ↦ (t², t³) and two lines in both categories | precise; the supplier avoids this input (ComplexComparisonPartII line 2926 to line 2929 at its head) |
| gap:normal-riemann-extension | cone ℂ²/±1; cusp, t = y/x | holomorphic on the cone; not holomorphic on the cusp | precise; no roadmap states it |

**Sources (step 2).** All 15 sampled targets: every readable locator opened and compared with the
statement.

- §1.1: BaldiUllmo2023 line 486 to line 496, the matrix definition with diag(1, −1, …, −1): correct.
- §1.3: BaldiUllmo2023 line 559 to line 565 and Mok2012 line 131 to line 137 (Siegel presentation,
  inverse Cayley transform): correct.
- §2.3: Mok2012 line 247 to line 254 and line 383 to line 389 give the form and call the metric
  Kähler–Einstein without a constant, as the README says. §2.4: Mok2012 line 319 to line 321: correct.
- §5.2: WitteMorris2015 line 18549 to line 18561, Definitions B1.3, printed pp. 447–448: correct.
- §5.3: WitteMorris2015 line 1899 to line 1921, Proposition 4.1.11; BaldiUllmo2023 line 338 to line 339:
  correct.
- §7.4: Mok2012 line 21 to line 23: correct, and described as a recollection only.
- §8.1: Mok2012 line 152 to line 239, equations (5)–(6) at line 173 to line 175; BaldiUllmo2023 line
  559 to line 571: correct. The README's remark that Mok omits the factor χ(a) is right (see Source
  issues).
- §8.3: Mok2012 Proposition 1 at line 295; BaldiUllmo2023 Definition 3.3.4 (line 586) and Theorem 3.3.5
  (line 600): correct.
- §9.2: Mok2012 Main Theorem line 546 to line 553; the statement "for every ℓ ≥ 2" is taken from inside
  the proof (line 639 to line 641, q ≥ 2), where it holds at the generality restated; the constant
  (ℓ − 1)(n + 1) of the README is the correct one (see Source issues).
- §11.1: WitteMorris2015 Definition 5.1.19 (line 3732 to line 3739), Proposition 9.4.5 (line 8668 to
  line 8669); BaldiUllmo2023 Proposition 2.3.3 (line 333); Mostow1980 Theorem 17.3 (line 3089, with
  line 3096: the non-cocompact ones are arithmetic); DeligneMostow1986 line 151 to line 152: correct.
- §11.2: WitteMorris2015 Theorem 5.1.11 (line 3676), Proposition 5.3.1 (line 3909 to line 3911), Theorem
  2.2.4 (line 1217), Definition 9.1.4 (line 8344 to line 8347); BaldiUllmo2023 line 336 to line 339:
  correct.
- §12.3: BaldiUllmo2023 line 135 to line 137, Theorem 1.3.2 (line 151), Corollary 5.5.2 (line 1346 to
  line 1352): correct.
- §12.4: BaldiUllmo2023 Theorem 1.2.2, line 91 to line 97: correct.
- Beyond the sample: WitteMorris2015 4.1.9, 4.1.16, 4.1.18, Exercise 4.1#10, 4.7.4, 4.7.5, 4.7.7,
  4.7.10, 4.7.11, 4.8.2, 4.8.4, 4.8.5; Kiernan1972 line 57 to line 75, Theorems 1 and 2; Deng2020 line
  61, Theorem A, Corollary C; MilneSVI 3.12–3.16; BaldiUllmo2023 3.1.6, 3.1.12, 3.1.13, 3.3.3, 3.4.3,
  3.4.6; Mok2012 Theorem 1, Theorem 2: all at the stated lines. The one slip is R01.
- Manifest: 17 works cited, 17 entries, no local path, `cited_for` agrees with the sections.

**Duplication (step 4).** By object, in the pinned libraries: no indefinite unitary group, no lattice
predicate, no Selberg lemma, no Zassenhaus neighbourhood, no neat subgroups, no Cartan uniqueness
theorem. Tau Ceti has a pairwise Margulis lemma for PSL(2,ℝ)
(`Subgroup.conj_eq_or_conj_eq_inv_of_dist_le`, TauCeti/Analysis/Complex/Fuchsian/Margulis.lean:91): a
special form for n = 1, not the target. In the roadmaps: RealSemisimpleLieGroups' scope places Selberg's
lemma, finite generation, non-arithmetic ball quotients and the full biholomorphism group of the ball
outside itself (its lines 139 to 143), so this roadmap is their owner; GeometricTopology §7.3 treats
ℍⁿ, and the README says how §4.4 differs; ShimuraCompactifications Layer 2 treats Pink's
compactification, and the README states the difference and no comparison. No declaration of
`Suggested.lean` has the fully qualified name of a declaration in another roadmap's Lean file.
`scratch/overlaps.md`: no other pull request changes this roadmap, no cited id is dropped, no cited id
is defined only by a revision, no second copy.

Overlap check: read RealSemisimpleLieGroups, ArithmeticFuchsianGroups, ShimuraVarieties, KleinianGroups,
FuchsianOrbifoldsPartII (open), FuchsianOrbifolds, AdelicAlgebraicGroups, ConformalMappingPartII (main);
the third list is empty. Shared objects and owners: form, groups, ball, metric, sub-balls —
RealSemisimpleLieGroups §5.7; arithmetic lattices and neat levels — AdelicAlgebraicGroups §§3.4, 4.3;
Shimura data and Baily–Borel — ShimuraVarieties; the case n = 1 — FuchsianOrbifolds; quaternionic
arithmetic Fuchsian groups — ArithmeticFuchsianGroups (not consumed, not restated). Nothing has two
owners.

**Suppliers (step 5).** Dependency check output: `depcheck: 246 roadmaps, 2251 edges, 0 problem(s)`
(no UPWARD, no CYCLE). RealSemisimpleLieGroups is another author's open pull request adding a new
folder, a permitted supplier. Every cited section and declaration was resolved now: on main —
VonNeumannAlgebras Layer 9, AdelicAlgebraicGroups §§1.1, 3.4, 4.3 with `Reduction.IsSArithmetic`,
`Reduction.arithmetic_finite_volume_iff`, `Reduction.levelArithmetic`, `Neat.IsNeatAut`,
`Neat.IsNeatLevel`, ComplexKahlerGeometry K1–K4 and K6.0, ComplexManifolds Milestones 4–7, ComplexTori
Milestone 1, RiemannianGeometry R4.7 and R5a, FuchsianOrbifolds Layers 0–4 and L2.1,
Completed/ConformalMapping, RepresentationTheory/LieGroups Layer 9 (`IwasawaData`, `kakDecomposition`,
`iwasawaDecomposition`), SchemeAndStackFoundations §1.17 (`finiteGroupQuotient_projective`),
GeometricTopology §7.3; at open heads — RealSemisimpleLieGroups §§3.1, 5.2–5.4, 5.6, 5.7,
ComplexComparisonPartII C-1.1, C-1.2, C0.6, C1.4, C1.6, C1.9, C4.1, C4.2, C4.4 with the eleven names
cited, ShimuraVarieties §§P.1, P.2, P.6, 0.1, 0.4, 0.5, 1.2, 2.1, 2.2, 2.7, 3.3, 3.4a, 3.5 with the
thirteen `TauCeti.Shimura.*` targets, PELModuli §M5.5 (three names), ShimuraData §3.8,
AlgebraicModuliForArithmeticGeometry §§5.4, 9.5, AbelianSchemesAndArithmeticModuli §A5.3
(`appellHumbert`), ArithmeticLocallySymmetricSpaces ALS.0.5, ShimuraCompactifications Layer 2. All
exist where cited. Remark, no change needed: the README writes ComplexComparisonPartII's ids with a
minus sign ("C−1.1") where the supplier's headings have a hyphen ("C-1.1"); the citation resolver
matches them. The convention witness π/6 (ω-area of the modular surface) agrees with the supplier's
2π/3 for the Killing metric (RealSemisimpleLieGroups §5.6 Check): 4·π/6. Both declared gaps carry the
same slug in `design/plan.json` and in the README, name a supplier and a section, and ask for nothing
a roadmap provides.

**Shape (step 6).** 57 subsections, each with a `*Needs:*` line and at least three Checks (3 to 7);
twelve layers, each ending with Examples and Dependencies; headings and order as upstream. The layers
are named by their mathematics; no sentence says the roadmap follows a source. No LaTeX delimiters,
pull-request numbers, anchors or machine paths in the README or the Lean file.

**Copyright and arrangement (step 8).** Wording compared at every locator above and at these further
passages: §6.1 (2) against BaldiUllmo2023 line 649 to line 653; §6.3's route against WitteMorris2015
line 2974 to line 2988; §8.1's line bundle against Mok2012 line 204 to line 239; §10.1 against
Kiernan1972 line 57 to line 75; §10.3 against MilneSVI line 1764 to line 1780 and Deng2020 line 87 to
line 90; §9.3 against Mok2012 line 546 to line 562; the docstrings of `margulis_lemma` and
`selberg_lemma` against the same texts. No sentence is shared; the closest are theorem statements a
dozen words long that the mathematics forces ("is a lattice in"). Arrangement: BaldiUllmo2023 has the
largest share; its sections (2 recollections on lattices and arithmeticity, 3 real Shimura data, 4
Hodge theory, 5 comparison of special structures, 6 finiteness, 7 special points) do not map onto the
twelve layers, and Mok2012's §§1.1–2.2 meet Layers 8–9 only where the dependency lines force the
order (§8.3 needs §§8.1–8.2, Layer 9 needs Layer 8), with Layer 6 placed before Layer 8 against Mok's
order. No table, figure or list is taken over.

Source independence: 22 passages compared with 7 sources, none shared; largest share BaldiUllmo2023,
38 of 128 locators; contents compared with BaldiUllmo2023 and Mok2012: independent. Not read:
Goldman1999, Raghunathan1972, Borel1969, Borel1972, BailyBorel1966, SiuYau1982, Cartan1957,
Alperin1987, GarlandRaghunathan1970 (22 locators together).

## Not verifiable

- Goldman1999 Ch. 3 (uncertified): the only locator of §§2.1, 3.2 and 3.4 and a locator of §§1.4, 2.3,
  2.4, 2.5, 3.3; three of these are sampled targets. The statements were checked by computation
  instead (table above); the locator itself was not.
- Raghunathan1972 Ch. VIII and XIII, Borel1969 Corollary 17.7, Alperin1987, Borel1972 Theorem A,
  BailyBorel1966 Theorem 10.11, SiuYau1982, Cartan1957 (uncertified) and GarlandRaghunathan1970
  Theorems 0.7 and 4.10 (waived): not read. Each is cited beside a readable source or a proof route
  given in the README, except Cartan1957 for §§7.1 and 7.3, whose statement is the standard quotient
  theorem.
- Ownership against open pull requests was checked with the roadmaps tools over the indexed heads
  only.

## Source issues

- **Gap** in Mok2012 at §1.1, equation (5), line 173: the source says every element of Γ ∩ W_b has
  vertical part an integer multiple of τ; it should allow any t, determined modulo τ (for the lattice
  ⟨n_(λ,0), n_(iλ,0)⟩ the product has t = −τ/2); affects a stated result.
- **Misprint** in Mok2012 at the proof of the Main Theorem, equation (4), line 641: the source says the
  curvature of the q-th canonical power plus the Ricci form is (q − 1)ω; it should be (q − 1)(n + 1)ω
  for the form of its §1.2; affects nothing.
- **Misprint** in Mok2012 at the proof of the Main Theorem, line 604: the source writes E as the
  canonical bundle twisted by the inverse of [D]; it should be twisted by [D], as in the theorem;
  affects nothing.
- **Misprint** in Mok2012 at the proof of the Main Theorem, line 642: the source invokes Theorem 1 for
  the L² solution; it should be Theorem 2, the existence theorem of its §2.1; affects nothing.

## For the human reviewers

- **Licence.** Mok2012 was read in the HKU IMR preprint IMR2009-4 (`sources.toml`, `licence_class`
  "author-page"); the published chapter (Progress in Mathematics 296) was not compared, and the README
  cites the preprint's numbering.
- **Not tested.** Goldman1999 (uncertified) is the only source cited for §§2.1, 3.2 and 3.4; wording
  and locators there were not compared with any text.
- **Scope.** RealSemisimpleLieGroups attributes the general lattice notion to AdelicAlgebraicGroups
  AA.2.2–AA.2.3 (its line 107), this README to VonNeumannAlgebras Layer 9; both are on main, and which
  one owns it is outside this package.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "bea804d0d2aee93021b0ead0b4cabe6c268fe15d", "job": "REV-PKG-BallQuotientsAndComplexHyperbolicLattices", "model": "fable", "worker": "chris-x90"} -->
