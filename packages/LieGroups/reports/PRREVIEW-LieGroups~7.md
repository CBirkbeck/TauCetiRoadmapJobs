# Review of LieGroups (pull request #2642 at 244e782)
Folder: `TauCetiRoadmap/RepresentationTheory/LieGroups/`

**Verdict:** accepted

**Summary.** Accepted, with no findings. This head repairs every point of the previous review: §7.6 now separates the compact `Sp(n)` from the split `𝔰𝔭(2l, ℝ)`, §7.9 takes `G(ℂ)` from ReductiveGroups §3A.5e, and the six corrections and two notes are applied. There are six small corrections, none blocking:
- `exists_holomorphic_extension` is its own universal-property hypothesis applied to `GL(V)`.
- The module docstring calls two statable results unstatable.
- An `IwasawaData` field assumes a step that §9.5 says to prove.
- Two Kirillov theorem numbers point at the wrong statements.
- The pinned matrix Iwasawa and `KAK` theorems for `GL_n` and `SL_n` are not cited.
- One sentence about FormalConnectionsOpers is out of date.

There is also one format note. The only item for the human reviewers is that the uncertified Bump and Bröcker–tom Dieck locators could not be compared.

## C01 — `exists_holomorphic_extension` is the hypothesis `huniv` applied to `GL(V)`, so as a target it asks for nothing

As an acceptance test, this declaration (`Suggested.lean` line 332; README §7.11, lines 1516–1518) asks an implementer only to apply its own hypothesis. `huniv` says that every continuous homomorphism of `G` into a complex Lie group factors uniquely through `ι` by a holomorphic homomorphism. `(V →L[ℂ] V)ˣ` is such a group (Mathlib's Lie-group instance on the units of a complete normed algebra). Elaborated with all universes equal, the statement closes by

`obtain ⟨ψ, ⟨hψ, hcomp⟩, -⟩ := huniv (V →L[ℂ] V) _ _ _ (V →L[ℂ] V) _ 𝓘(ℂ, V →L[ℂ] V) _ _ _ _ _ ρ hρ; exact ⟨ψ, hcomp, Units.contMDiff_val.comp hψ⟩`

That proof uses neither `CompactSpace G`, `ConnectedSpace G` nor `hι`. With the file's distinct universes, the only extra work is moving `GL(V)` into the universes that `huniv` quantifies over.

Some options:
- Mark it as a sanity check of the universal property.
- Replace it with what compactness adds in §7.11, for example that every `ρc(Gc)`-invariant subspace of `V` has an invariant complement (the unitary trick).
- Leave the extension half to `exists_complexification` and the README.

## C02 — The module docstring lists two results as not statable at the pins, but both can be stated there

The docstring's list of results "not statable at the pins" (`Suggested.lean` lines 42–48 and 53–55) includes:
- the compact real form of a complex semisimple Lie algebra;
- the uniqueness of the middle `KAK` factor modulo the restricted Weyl group.

Both elaborate against the pins with only `sorry` warnings. The uniqueness can be stated on the file's own `IwasawaData`: if `X, X' ∈ D.chamber` and `k₁ exp X k₂ = k₁' exp X' k₂'` with every `kᵢ ∈ D.K`, then `X = X'`. The closed chamber is a fundamental domain, so this is uniqueness modulo `W` (knapp2002 Thm. 7.39, line 19086). The compact real form can be stated for `[LieAlgebra.IsKilling ℂ L]` as follows: there is an additive `τ : L ≃+ L` that preserves brackets, is conjugate-linear and involutive, with `0 < (−killingForm ℂ L x (τ x)).re` for `x ≠ 0`.

Neither result is a headline of the overview, so leaving them in the README is the author's choice. The docstring would then say that, rather than that the pins lack a carrier.

## C03 — The field `chamber_normalizer_cover` of `IwasawaData` assumes a step that §9.5 sets as a target

`chamber_normalizer_cover` (`Suggested.lean` lines 493–496) assumes that the normalizer of `𝔞` in `K` carries every element of `𝔞` into the chamber. §9.5 (lines 1993–1995) asks to prove this ("every orbit meets this closed chamber"). §9.4 (lines 1946–1950) describes the structure as carrying only "the closed positive chamber". `chamber_root_inequalities` already pins the chamber, so for a genuine Cartan datum the field is a consequence of the other data. As a result, `kakDecomposition` does not test the Weyl-chamber step. Also, every consumer of `iwasawaDecomposition`, which does not need the step, must prove it before building an `IwasawaData`.

Either of these would fix it: drop the field, so that `kakDecomposition` includes the step; or say in §9.4 that the datum carries the covering and that §9.5 constructs it for every Cartan datum.

## C04 — Two Kirillov theorem numbers in Layers 0–1 point at the wrong statements

- §0.3 (line 229) cites "Thm. 3.7" for the classification of one-parameter subgroups. Thm. 3.7 (kirillov2008 line 704) lists properties of `exp`. The classification of Lie-group morphisms `ℝ → G` by their tangent vector is Prop. 3.1 (line 663, p. 21).
- §1.2 (line 304) cites "Thm. 3.7(5)" for `d(Ad)_1 = ad`. Item (5) (line 711) is `g exp(y) g⁻¹ = exp(Ad g · y)`, which is §1.3's statement. The derivative statement is Lemma 3.14(1) (line 826, p. 24).

Would read: "Prop. 3.1" in §0.3 and "Lemma 3.14(1)" in §1.2.

## C05 — Layer 9 does not cite the pinned matrix Iwasawa and `KAK` theorems that its examples and Checks describe

Without these citations, a reader of §9.4 ("For `GL_n(ℝ)` and `SL_n(ℝ)` this is Gram–Schmidt", line 1969) and of the §9.5 Check (lines 2003–2006) cannot tell that the matrix cases are already proved. The Layer 9 line of "Already in the library" (lines 2107–2110) does not list them either. At the pinned Tau Ceti:
- `Matrix.GeneralLinearGroup.existsUnique_iwasawa` and `TauCeti.iwasawaHomeomorph` (`LinearAlgebra/Matrix/GeneralLinearGroup/Iwasawa.lean`, lines 280 and 224);
- `Matrix.SpecialLinearGroup.existsUnique_iwasawa` (`LinearAlgebra/Matrix/SpecialLinearGroup/Iwasawa.lean`, line 213);
- `Matrix.GeneralLinearGroup.existsUnique_pos_antitone_and_eq_unitary_mul_diagonal_mul_unitary` (`LinearAlgebra/Matrix/GeneralLinearGroup/Cartan.lean`, line 65), the `KAK` decomposition of `GL_n(ℝ)` and `GL_n(ℂ)` with a unique decreasing diagonal;
- its `SL_n` form, `Matrix.SpecialLinearGroup.existsUnique_pos_antitone_and_eq_specialUnitary_mul_diagonal_mul_specialUnitary` (`SpecialLinearGroup/Cartan.lean`, line 49);
- the restricted Weyl group of `GL_n(ℝ)`, `TauCeti.unitaryNormalizerPosDiagonalQuotientMulEquivPerm` (`GeneralLinearGroup/RestrictedWeylGroup.lean`, line 230).

Would add them to the Tau Ceti contracts and to the Layer 9 line of "Already in the library", and point the two `GL_n` sentences at them.

## C06 — The downstream-consumers sentence says FormalConnectionsOpers uses the lower analytic dictionary of §7.9

A reader is told (lines 2060–2061) that FormalConnectionsOpers §4.3 uses "Layer 7's complexification, compact real forms and lower analytic dictionary". FormalConnectionsOpers on main does not take that dictionary from here:
- its LieGroups contract (its README lines 431–440) takes from Layer 7 only the complexification of compact groups and the compact real form;
- its §4.3 takes `G(ℂ)` from ReductiveGroups §3A.5e (its lines 86–95) and builds its own dictionary.

Now that §7.9 itself takes `G(ℂ)` from §3A.5e, the clause is out of date. Would read: "Layer 7's complexification and compact real forms, in its §4.3".

## N01 — Varadarajan and Serre are listed under References but cited nowhere in the text

Varadarajan's only locator was the §2.1 citation removed in this round. Serre's LNM 1500 is not cited in any section. Would either drop the two entries (lines 2409–2413) or cite them where they are used.

## Verified sound

| Statement | Instances tried | Values on each side | Result |
| --- | --- | --- | --- |
| §0.1 Lie algebra ≅ `T₁G` | `G = ℝⁿ`; all derivations of `C^∞` | `∑aᵢ∂ᵢ`, bracket 0, finrank n; all derivations infinite-dimensional; kirillov2008 Thm. 2.25 line 419 | sound |
| §0.4 matrix and circle forms | `X = [[0,−π],[π,0]]`; `X = diag(1,0)`, `Y = E₁₂` | `exp X = −1` vs entrywise `[[1,e^{−π}],[e^π,1]]`; `exp(X+Y) = [[e,e−1],[0,1]] ≠ [[e,e],[0,1]]` | sound; Hall uncertified |
| §3.1 functor on morphisms | `det : GL_n → ℝˣ`; `X = Y = 1` | `d/dt det(exp tX) = tr X`; `tr[X,Y] = 0`; `tr((X+Y)²) = 4n ≠ 2n` | sound; library-supplied |
| §3.2 injectivity on connected groups | `ℤ/2ℤ`, identity vs trivial | both differentials 0, maps differ; kirillov2008 Thm. 3.17 line 855, Cor. 2.9 line 243 | sound |
| §3.3 BCH | Heisenberg `E₁₂, E₂₃`; commuting `x, y` | `exp X exp Y = 1+E₁₂+E₂₃+E₁₃ = exp(X+Y+½E₁₃)`; `−½` gives (1,3) entry 0; Thm. 3.34 line 1056 | sound |
| §4.1 immersed subgroups | irrational line; `ℚ`; Hamel automorphism of `ℝ` | dense, dim 1; countable ⇒ `{1}`; injective onto `ℝ`, discontinuous; Thms. 3.43, 3.46 lines 1137, 1178 | sound |
| §4.3 equivalence | `ℝ → Circle`; `Circle → Circle` | `x ↦ cx` integrates for all `c`; only `c ∈ ℤ`; Thm. 3.38 line 1113, Cor. 3.50 line 1233 | sound |
| §5.2 centres | SU(2); Heisenberg; Q₈; `𝔰𝔩₂(ℝ)` | `ker Ad = {±1} = Z`; `H/Z ≅ ℝ²`, centre `ℝ²`; `ker Ad = Q₈`; `SL₂ = U/2ℤ`, `U/nℤ` | sound; Thm. 3.32 line 1029, Cor. 3.49 line 1223 |
| §6.1 tori | U(n); ±1-diagonal; `diag(z,1)`; Q₈; SU(2) | maximal; disconnected; proper subtorus; only torus ⊥, `|W| = 8`; `N(T)/T = C₂`, `N(T)/{±1}` infinite | sound |
| §6.5 compact roots | SU(2), `H = diag(i,−i)`; U(n) | `χ_α(e^{θH}) = e^{2iθ}` ⇒ `α(α∨) = 2`; roots `e_j − e_k` vanish on `iℝ·1` | sound |
| §6.6 rank-one representatives | `ν(e^w) = exp(−iwα∨)`; SO(3) | `dν(1) = −iα∨`, `d(ν|S¹)(i) = α∨`, `dα(−iα∨) = 2`; `φ_α` double cover | sound |
| §7.12 compact-form pairs | conjugation by `diag(2,½)`; `(𝔾_m, U(1))` | `[[0,−1],[1,0]] ↦ [[0,−4],[¼,0]]`, not unitary; morphisms `z ↦ zⁿ` | sound |
| §8.2 Bruhat | `GL₂(ℂ)`; `GL₂(𝔽₃)×C₂`; `B = T` | `B∩N = T`, 2 cells; `|T| = 4`, `|N| = 16`, `|B∩N| = 8`, `|N/T| = 4`, 2 double cosets; `⋃TnT = N(T)` | sound; Humphreys uncertified |
| §8.4 equivariant GAGA | `ℙ¹ = SL₂/B` | `H¹(O(−2)) = ℂ` trivial; `H⁰(O(2))` three-dimensional adjoint | sound |
| §9.2 Cartan datum | `GL_n`; motion group `n = 1`, `n ≥ 2`; `SL₂(ℝ)` | `K = O(n)`; `⟨diag(eᵗ,e⁻ᵗ), swap⟩` fixes `{1, swap}`; centre 0, derived `⊇ ℝⁿ`; knapp2002 Thm. 6.31 line 15159 | sound |
| `mfderiv_lieExp_eq_integral` | `GL₂`, `X = diag(1,0)`, `Y = E₁₂`; `GL₁` | both `(1−e⁻¹)E₁₂`; `+s` sign gives `(e−1)E₁₂`; factor 1 on `GL₁` | sound |
| `mem_lieSubalgebraOfSubgroup_iff` | `ℚ ⊂ ℝ`; `SL₂(ℤ)`; `K = ⊥` | `𝔨 = 0`; `exp E₁₂ ∈`, `exp(E₁₂/2) ∉`; neeb2015 Rem. II.6.5(b) line 1924, Problem IV.1 line 3339 | sound |
| `simplyConnectedSpace_SU2` | `(a,b) ↦ [[a,−b̄],[b,ā]]` | `det = |a|²+|b|²` ⇒ `S³ ⊂ ℝ⁴`, rank 4 > 2 | sound |
| `exists_immersedLieSubgroup_lieSubalgebra` | `𝔥 = 0`, `𝔤`; `ℝ(1,√2)` | `⊥`; `G⁰`; dense immersed line | sound |
| `exists_simplyConnected_lieGroup` | `L = 0`, `ℝ`, `𝔰𝔩₂(ℝ)` | point; `ℝ`, not Circle; universal cover, `π₁(SL₂ℝ) = ℤ` | sound |
| `exists_monoidHom_of_lieHom` | `ℝ → Circle`; target universes | all `c`; Circle source only `c ∈ ℤ`; target universes now `u' v' w'` | sound |
| `lieExp_surjective_of_isNilpotent` | Heisenberg; `ℝ/ℤ`; `SL₂(ℝ)` | `exp(aX+bY+cZ) = [[1,a,c+ab/2],[0,1,b],[0,0,1]]`; onto, not injective; `diag(−2,−½)` missed | sound |
| torus headlines of Layer 6 | U(n); O(2); SO(3), `u = diag(1,−1,−1)` | spectral theorem; reflections in no torus; `C(u) ≅ O(2)` disconnected; `C(T) = T` | sound |
| `weyl_integration_formula` | SU(2); `G = T`; det on `𝔤` | `(1/2π)∫4sin²θ = 2 = |W|`; `D = 1`, `|W| = 1`; `1 = 0` | sound |
| `weyl_conjugation_pushforward` | `f = 1` | mass `(1/|W|)∫D dμ_T = 1` | sound |
| `exists_connected_complexification` | `ℝ`; Circle; cover of `SL₂(ℝ)` | `ℂ`; `ℂˣ`; `SL₂(ℂ)` with kernel `ℤ` | sound |
| `exists_complexification` | U(1); SU(2) | `ℂˣ`; `SL₂(ℂ)`; injective | sound |
| `exists_holomorphic_extension` | equal universes; `U(1) ⊂ SL₂(ℂ)` | closes by `huniv` at `GL(V)`, compactness unused; weight-one character does not extend | true; padding (C01) |
| `cartan_polar_decomposition` | `GL₁`; finite-component `H` | `x = ±eᵗ`; `(hᵀh)^{1/2} = q^{1/2N}` with `q = (hᵀh)^N ∈ H⁰`; lift through finite cover | sound |
| `iwasawaDecomposition` | `SL₂(ℝ)`: `N₊`, `N⁻`; `ℤ`-unipotent | `[[1,1],[0,1]]`: `k = a = 1`; `N⁻` admissible; fails `N_connected` | sound |
| `kakDecomposition` | `GL_n`; chamber `= 𝔞` in `SL₂` | SVD `a₁ ≥ … ≥ aₙ`; fails at `−diag(1,−1)`, `α = −2` | sound; field C03 |
| `bijOn_exp_triangular`, `lieExp_bijective_of_immersed_positiveTriangular` | `m = 0, 1, 2`; `diag(−1,1)`; U(2) | `(1,0,1) ↦ [[e,e−1],[0,1]]`, log returns 1; not reached; `U(2) ∩ AN = {1}` | sound |
| Previous R01, §7.6 `Sp(n)` | `XᵀJ + JX = 0`, `J` real | `X̄J + JX̄ᵀ = 0`, so `𝔰𝔭(2n,ℂ) = 𝔰𝔭(n) ⊕ i𝔰𝔭(n)`; `n = 1`: `𝔰𝔲(2)` vs `𝔰𝔩₂(ℝ)` | repaired |
| Previous R02, §7.9 `G(ℂ)` | `𝔾_m → GL₂`, `t ↦ diag(t,t⁻¹)` | `ℂˣ` either way; 3A.5e owns it, its Needs use nothing of LieGroups | repaired |
| C02 docstring | `KAK` uniqueness on `D.chamber`; compact real form `τ` | both elaborate with `sorry` warnings only | overstated |
| C04 Kirillov numbers | Thm. 3.7, Prop. 3.1, Lemma 3.14 | lines 704, 663, 826: `exp` properties; one-parameter subgroups; `ad = Ad_*` | mis-numbered |

- **Previous review:**
  - R01 is repaired at lines 1379–1387 ("Lie-algebra halves of the first three … For the compact `Sp(n) = Sp_{2n}(ℂ) ∩ U(2n)` the Lie-algebra half … is part of this target").
  - R02 is repaired at lines 1453–1457 ("… are ReductiveGroups §3A.5e's"), together with its Needs line (1466), the Scope (2077–2079, 2120–2122) and the supplier contract (2343–2346).
  - C01 is repaired at lines 654–657 and C02 at lines 393–395, 1275, 1361, 1390, 1527 and 2386–2389.
  - C03 is repaired at lines 1666–1669, 1714–1715 and 2057–2059.
  - C04 (`hινj` dropped) and C05 (`u' v' w'`) are repaired in `Suggested.lean`, and C06 in the description.
  - N01 is repaired at lines 55–56; every Needs line was checked and only §4.2 → §5.1 points forward. N02 is repaired at line 2293.
- **Source locators** checked against the text (24):
  - kirillov2008: Thm. 2.5 (216), Thm. 2.8 (234), Cor. 2.9 (243), Thm. 2.25 (419), Prop. 3.1 (663), Thm. 3.7 (704), Lemma 3.14 (826), Thm. 3.17 (855), Thm. 3.32 (1029), Thm. 3.34 (1056), Thm. 3.38 (1113), Thm. 3.43 (1137), Thm. 3.46 (1178), Thm. 3.48 (1214), Cors. 3.49–3.50 (1223–1234), contents (13–60);
  - neeb2015: Rem. II.6.5 (1920–1933), Problem IV.1 (3337–3345);
  - knapp2002: contents (131–148), §VI.2 (14939–15069), Thm. 6.31 (15159), Thm. 6.46 (15739), Thm. 7.39 (19084);
  - heins2025: Prop. 2.1 (413–426).
- **Library declarations opened at the pins** (14):
  - in `Geometry/Lie/Subgroup/Complexification.lean`: the module docstring (16–25), `specialOrthogonalBaseChangeLieEquiv` (311) and `symplecticBaseChangeLieEquiv` (349);
  - `SpecialLinearGroup/MaximalCompact.lean` 105;
  - `Torus.lean` 82–89;
  - `GeneralLinearGroup/Iwasawa.lean` 224 and 280, and `SpecialLinearGroup/Iwasawa.lean` 144 and 213;
  - `GeneralLinearGroup/Cartan.lean` 65, `SpecialLinearGroup/Cartan.lean` 49 and `RestrictedWeylGroup.lean` 230;
  - Mathlib `Units.contMDiff_val` (`UnitsOfNormedAlgebra.lean` 60) and `Quaternion.unitaryHomeomorphSphere` (Tau Ceti `Topology/Algebra/Quaternion/Unitary.lean` 44).

  A scripted pass over the README's 396 code spans found every qualified name at the pins, except this file's own declarations, its field names and notation.
- **Cross-roadmap citations resolved on main:**
  - ReductiveGroups: 3A.5e (2014–2033), 3A.5f (2085–2105), Layer 3 Dependencies (2207), opening (55–73), consumer list (6645–6652);
  - SchubertGeometry: S3.1 (925), S9.8 (1896), LieGroups contract (542–548);
  - FormalConnectionsOpers: 86–95, 119–124, 431–440, 1863–1865;
  - CotangentLagrangian C2.0 and C2.1 (190, 222); ComplexKahlerGeometry 5.10 and 6.1 (2049, 2127); CompactGroups 0.1–6.2 (185–652); HopfRinow Layer 3 (451);
  - LieGroupsPartII (3–57); RealSemisimpleLieGroups (30–158); CompactGroupsPartII at its open head (39–1256).

  The citation tool leaves only the file's namespace unresolved. The section-level dependencies form no cycle: ReductiveGroups Layer 3 needs LieGroups Layer 2, and LieGroups needs ReductiveGroups Layers 0–4, 6, 7, 7C and 3A.5e, whose Needs lines do not use LieGroups.
- **Automatic checks:**
  - The gate passes, both the worker's run and a rerun, and the folder change touches nothing outside the folder.
  - The dependency check prints `depcheck: 199 roadmaps, 2201 edges, 0 problem(s)`.
  - `lake env lean` on `Suggested.lean` exits 0 with 22 `sorry` warnings and nothing else.
  - The one-tactic probe (`first | rfl | simp | infer_instance | assumption | trivial | simp_all`) closes none of the 22 declarations.
  - The `#check @name` types were compared with the README. Three binders are dropped (`T2Space` on `FiniteCartanMatrixModel`; `FiniteDimensional` on `CartanInvolution` and `IsRealReductive`); no field uses them, and every theorem about these structures carries them.
- **Duplication by object:** no theorem of `Suggested.lean` is proved at the pin. The pinned matrix decompositions are special cases that are not cited (C05).

Overlap check: read LieGroupsPartII, RealSemisimpleLieGroups, ReductiveGroups, LieGroupoidsPoisson and AdoIwasawa on main, and CompactGroupsPartII at its open head. Shared objects and their owners:
- the complex Lie group `G(ℂ)`: ReductiveGroups §3A.5e, cited here;
- the decompositions and restricted roots of Layer 9: this roadmap, which LieGroupsPartII and RealSemisimpleLieGroups cite;
- the compact structure theory: this roadmap, which CompactGroupsPartII cites.

Nothing else is shared.

Source independence:
- Wording: 18 passages compared with 4 sources (kirillov2008, neeb2015, knapp2002, heins2025). None is shared beyond forced phrases; the longest common run is "is an integral subgroup", 4 words, at neeb2015 line 3340.
- Share: the largest share is kirillov2008, with 14 of 57 locators.
- Contents compared with kirillov2008: independent. Layers 0–4 follow the order the Needs lines force (§2.1 needs §§0.2–0.3 and 1.2; §4.1 needs §§2.1 and 3.1). Their scope goes beyond Kirillov's (§1.4, §§2.3–2.4, §5.3), and Layers 5A–9 have no Kirillov counterpart.

Research link:
- §7.3's period-quotient complexification is the realization that Heins (2025, arXiv 2512.07479, Prop. 2.1) uses for entire functions on Lie groups.
- §2.1 settles the finite-dimensional case of Neeb's Problem IV.1 (2006).
- Layers 6–9 feed RealSemisimpleLieGroups and ArithmeticLocallySymmetricSpaces.

This rests on the README, heins2025 and neeb2015.

## Not verifiable

- Bump, Bröcker–tom Dieck, Hall, Varadarajan, Humphreys (§29.1), Serre and Lee are settled as uncertified, so their chapter and section locators were not checked against a text.
- LieGroupsPartII, RealSemisimpleLieGroups, LieGroupoidsPoisson and AdoIwasawa at their open heads are not among the given checkouts. They were read on main, so ownership against those open heads was not checked.

## Source issues

- **Misprint** in neeb2015 at Remark II.6.5(b), p. 39 (line 1925): the source says Yamabe's theorem describes the arc-component of the ambient group `G`; it should be the arc-component of the subgroup `H`, as the next sentence and Problem IV.1 use it; affects nothing.

## For the human reviewers

- Wording and arrangement were not compared with Bump (12 of 57 locators) or Bröcker–tom Dieck (9), which are settled as uncertified. The largest-share source, kirillov2008, was read.
