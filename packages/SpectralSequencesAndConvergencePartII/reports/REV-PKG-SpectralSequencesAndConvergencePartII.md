<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/15047#issuecomment-6871287539 -->
Review (claude) of 1d7a2f2

Verdict: needs_changes

**For the human reviewers:** this review raises 2 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P2) KhovanovHomology §K5, on main, owns instances of 4.1–4.3 and is not cited

   - **Location.** `packages/SpectralSequencesAndConvergencePartII/README.md`, *Scope and ownership*
     (lines 48–99) and the Checks of 4.1 (line 1371), 4.2 (line 1433) and 4.3 (line 1481). The name
     `KhovanovHomology` occurs nowhere in the README (0 matches).
   - **Claim.** The scope section lists every other owner of an instance of Layers 1–6 ("instances …
     that stay with their owners and are compared in Checks", line 99). 4.2(a), 4.2(c) and 4.3 state the
     two-column short exact sequences, and 4.1 the balancing of Tor, with no other roadmap named for
     the integral finite free case.
   - **Witness.** `TauCetiRoadmap/KhovanovHomology/README.md` on main, §K5: lines 541–542 state both
     universal-coefficient sequences for bounded finite free `ℤ`-complexes, lines 553–554 the Künneth
     sequence, lines 564–565 "the finite-resolution balancing comparison with `CategoryTheory.Tor`".
   - **Why P2.** A roadmap on main states these; an open roadmap cites it and keeps its general
     statement. The general statements (any ring of Tor-dimension at most one, any complex; the
     monoidal abelian balancing) stay here.
   - **Repair.** Add to *Scope and ownership*, after the Tau Ceti bullet:

     > - **KhovanovHomology, §K5**: for bounded complexes of finite free `ℤ`-modules, the
     >   universal-coefficient sequences for `C ⊗ M` and `Hom(C, M)`, the Künneth sequence of two such
     >   complexes, and the comparison of `CategoryTheory.Tor'` with `CategoryTheory.Tor` on a two-term
     >   free presentation. These are the two-column sequences of 4.2(a), 4.2(c) and 4.3 over `ℤ` and
     >   the case of 4.1 for a resolution of length one; they stay with their owner and are compared in
     >   Checks.

     Add one Check to each of 4.1, 4.2 and 4.3:

     > - (4.1) In `ModuleCat ℤ`, for a first variable with a two-term free presentation, the isomorphism
     >   is KhovanovHomology §K5's finite-resolution balancing comparison.
     > - (4.2) For a bounded complex `C` of finite free `ℤ`-modules, where `C ⊗^L M = C ⊗ M`, the
     >   two-column sequences of (a) and (c) are KhovanovHomology §K5's, with the same indexing:
     >   `0 → Hⁱ(C) ⊗ M → Hⁱ(C ⊗ M) → Tor_1(H^{i+1}(C), M) → 0` and
     >   `0 → Ext¹(H^{1−i}(C), M) → Hⁱ(Hom(C, M)) → Hom(H^{−i}(C), M) → 0`.
     > - (4.3) For two bounded complexes of finite free `ℤ`-modules the two-column sequence is
     >   KhovanovHomology §K5's Künneth sequence.

     Tested on the instance: `C = (ℤ →(×2) ℤ)` in degrees `−1, 0`, `M = ℤ/2`. §K5's sequence at
     `i = −1` reads `0 → 0 → H^{−1}(C ⊗ M) → Tor_1(ℤ/2, ℤ/2) = ℤ/2 → 0`; 4.2(a) with `n = −1` gives the
     same, and the README's Tor witness (Conventions) has `H^{−1} = ℤ/2`. The three index conventions
     (`i + 1` in the Tor term, `1 − i` and `−i` in the Ext form, `p + q = i + 1` in Künneth) agree.

2. **F02** (P3) a claim about Mathlib's documentation that the pin does not support

   - **Location.** `README.md` lines 230–232: "no comparison with `Functor.rightDerived` (the file's
     documentation records that one as missing)".
   - **Claim.** The documentation of `RightDerivedFunctorPlus.lean` records the comparison as missing.
   - **Witness.** `Mathlib/Algebra/Homology/DerivedCategory/RightDerivedFunctorPlus.lean:28` at the
     pin: "TODO(@joelriou): refactor the definition of `Functor.rightDerived`".
     `Mathlib/CategoryTheory/Abelian/RightDerived.lean:41–46` plans to redefine `F.rightDerived`
     through `F.rightDerivedFunctorPlus`. Neither mentions a comparison.
   - **Repair.** Replace the parenthesis by: "(none is proved at the pin; the documentation of this
     file and of `Mathlib/CategoryTheory/Abelian/RightDerived.lean` records only the intention to
     redefine `Functor.rightDerived` through `rightDerivedFunctorPlus`)". The statement that no
     comparison exists is correct: `rightDerivedFunctorPlus` occurs in two Mathlib files and in no Tau
     Ceti file, and neither file relates it to `Functor.rightDerived` by a declaration.

3. **F03** (P3) targets without a locator

   - **Location.** `README.md` line 1422, 4.2(c) *Contravariant Ext form*; lines 1717–1726, 6.2
     *Higher Bocksteins*, *Stabilisation*, *Convergence*.
   - **Claim.** Every theorem carries a locator. 4.2(a) and (b) do; (c) has none. In 6.2 only the
     towers (base §6.2) and the higher universal-coefficient sequences (may-primer line 147–150) do.
   - **Witness.** No source id occurs between lines 1422 and 1426, nor between lines 1717 and 1726.
     The Checks of 6.2 cite may-primer line 155–168 and hatcher-at, which is where the supporting
     statements are.
   - **Repair.**
     - 4.2(c): append "(the second hypercohomology sequence of 2.6 for the contravariant `Hom_R(−, M)`,
       cartan-eilenberg1956 Ch. XVII, uncertified; for the two-column sequence weibel1994 §3.6, the
       universal coefficient theorem for cohomology, uncertified)". Add `"4.2"` to `cited_for` of
       `weibel1994` and `cartan-eilenberg1956` in `sources.toml` and `§3.6` to the `weibel1994`
       locator. I could not read either text; the fix worker cites by locator only.
     - 6.2: after "Prove, for `r ≥ 1` and every `n`" add "(mccleary2001 Ch. 10, uncertified, for the
       higher Bocksteins and the limit page over `ℤ`; may-primer line 161–168 for the pages of a cyclic
       summand and for `E_∞` under finite type; the statements for a general pair `(A, f)` are proved
       by the route below)". Add `"6.2"` to `cited_for` of `mccleary2001`.
     - Checked: may-primer line 162–165 gives `E^r = 0` for `r > s` and `d^s` an isomorphism for a
       summand `ℤ/p^s`, and `E^∞ ≅ (H/torsion) ⊗ 𝔽_p`; the README's Check "The ℤ/p^r complex" computes
       the same (`E_s = ℤ/p` for `s ≤ r`, `0` for `s > r`).

4. **F04** (P3) a reference listed as "not used", and its citation without the key

   - **Location.** `README.md` line 108, "Douady's products of spectral systems"; lines 1817–1818,
     "douady1959: … §II A (products of spectral systems, not used)".
   - **Claim.** `sources.toml` records `douady1959` as cited for *Scope and ownership*; the body never
     writes the key, and the reference entry says the work is not used.
   - **Witness.** `douady1959` occurs 0 times before the References; douady1959 line 143–166 has the
     definition of a spectral product and Théorème II A, as the manifest's locator says.
   - **Repair.** Line 108: "Douady's products of spectral systems (douady1959 line 143–166, Chapter
     II A)". Lines 1817–1818: replace "(products of spectral systems, not used)" by "(products of
     spectral systems, named in *Scope and ownership* as outside this roadmap)".

Four findings: one P2 (an owner on main of instances of Layer 4 is not cited) and three P3 (a
library claim, missing locators, a reference entry). No statement was found false: the adversarial
pass recomputed every worked example it lists below and found each consistent with the theorems of
its section. `Suggested.lean` elaborates with `sorry` as the only warning and no declaration is
padding. Previous review of this package: none. Maintainer notes: none.

## Verified sound

**Principles.** No route-specific shortcut, no re-planned roadmap (the base is consumed through its
19 declared gaps and nothing of it is restated), single direction of supply (depcheck below), no
computational algorithm, no sorry'd data, no `set_option`.

**Elaboration.** `lake env lean` on `Suggested.lean` from the content repository: nine
`declaration uses sorry` warnings (lines 73, 87, 102, 118, 138, 163, 181, 211, 225), nothing else.
The file has 2 definitions with real bodies and 9 theorems, all binders explicit in each signature
(no section variable is used; `signatures.md` compared with the README statement for each of the 11
declarations: generality equal in all 11).

**One-tactic probe, all 9 theorems.** On scratch copies with `sorry` replaced by `simp`, `rfl`,
`infer_instance` and `exact?`: 9 of 9 fail under each of the four tactics. No declaration restates a
definition, mirrors a Check or treats a boundary case. Padding: none.

**Headline theorems.** From the Summary: (1) acyclic assembly and comparison of totals, direct-sum
forms: stated (4 theorems); product forms: named as not statable (no product total at the pins;
checked by grep). (2) Horseshoe for injective resolutions: stated. (3) Comparison of the two right
derived functors and Leray's lemma: stated. (4) Grothendieck's criterion: stated, with
`compositionTrans`. (5) Balancing of Tor: stated. (6) The two spectral sequences of a double
complex, hypercohomology, composite-functor, universal-coefficient, Künneth and change-of-rings
sequences; Cartan–Eilenberg resolutions; pairings; Bockstein: each named in the module docstring
with what is missing. Confirmed at the pins: no exact couples, no Cartan–Eilenberg resolutions
(two bibliography matches only), Tau Ceti's bicomplex spectral sequences only for
`down ℕ × down ℕ`. No statable headline is absent and none is a stand-in.

**Names.** All 11 backticked names the README attributes to this roadmap are declared in
`Suggested.lean`. All 11 are absent from every other roadmap's Lean file (main and open heads). Every
cited library declaration was opened at the pin; a selection with file and line:
`CategoryTheory.Tor` and `Tor'` (`Mathlib/CategoryTheory/Monoidal/Tor.lean:44, 50`; line 21 records
`Tor C n ≅ Tor' C n` as open), `Functor.rightDerivedFunctorPlus` and its unit
(`…/DerivedCategory/RightDerivedFunctorPlus.lean:47, 96`; the unit is an isomorphism on
`CochainComplex.Plus (InjectiveObject C)`, line 109), `Functor.rightDerivedDesc`
(`Mathlib/CategoryTheory/Functor/Derived/RightDerived.lean:76`), `SpectralSequence.Hom` with field
`comm` (`…/SpectralSequence/Basic.lean:51`), `HomologicalComplex₂.totalFlipIso`
(`TotalComplexSymmetry.lean:113`), `flipFunctor` (`HomologicalBicomplex.lean:168`),
`CochainComplex.isKInjective_of_injective` (`HomotopyCategory/KInjective.lean:134`),
`Qh_map_bijective` (`DerivedCategory/KInjective.lean:42`), `exists_quasiIso_injective`
(`DerivabilityStructureInjectives.lean:61`), `InjectiveResolution.desc`, `descHomotopy`
(`Abelian/Injective/Resolution.lean:95, 170`), `injective_of_adjoint`, `map_injective`
(`Preadditive/Injective/Basic.lean:196, 280`), `ModuleCat.restrictCoextendScalarsAdj`,
`extendRestrictScalarsAdj` (`ChangeOfRings.lean:658, 878`), `AB5` and `AB4Star` of `ModuleCat`
(`ModuleCat/AB.lean:30, 38`); Tau Ceti `exists_conflation_of_conflation_of_injective`
(`CategoryTheory/Exact/Injective.lean:426`), `FiniteResolution.horseshoe`
(`Exact/Resolution/Horseshoe.lean:235`), `quasiIso_totalAugmentation_of_rows`
(`Algebra/Homology/TotalComplex.lean:596`), `isIso_hom_f_of_le`
(`SpectralSequence/Comparison.lean:32`), `filtrationAbutmentIso`
(`SpectralSequence/Filtered/Convergence.lean:51`), `SpectralObject.EInfty`
(`SpectralObject/Stabilization.lean:45`), `towerDifference`
(`CategoryTheory/Preadditive/TowerDifference.lean:77`),
`homologyKunnethShortComplex_shortExact` (`Monoidal/Homology/Kunneth/Sequence.lean:729`). 0 names
missing. Tau Ceti has no balancing of Tor, no injective horseshoe for resolutions, no Leray lemma
and no composition theorem on `D⁺` (`rightDerivedFunctorPlus` occurs in no Tau Ceti file).

**Sources: the seeded sample.** The author flagged no locator as unverified beyond the four
uncertified works. For the 15 sampled targets, every locator into a readable text was opened:

| Target | Locator | Result |
| --- | --- | --- |
| 1.1 | stacks-012K line 3400–3409 | product total in the proof of Lemma 26.3, differential `f + (−1)^p d`: agrees |
| 1.3 | stacks-012K line 3284–3291 | Lemma 25.3, (4) at 3289–3290 is the weak Serre form: agrees |
| 1.5 | stacks-012K line 3293–3303, 3354–3358, 3433–3438, 3348–3351 | Lemmas 25.4, 26.1, 26.4, and the restriction to abelian groups: agree |
| 2.3 | stacks-05QI line 3621–3629, 3630–3654, 3667–3668, 3682–3689 | Definition 21.1, Lemma 21.2, total complex, split rows: agree |
| 2.4 | stacks-05QI line 3655–3681; grothendieck1957 line 1236–1252, 1348–1354 | Lemma 21.3, (2.4.2), Remarque 3: agree |
| 2.6 | grothendieck1957 line 1304–1308; stacks-05QI line 3449–3478 | left-derived and contravariant variants; §19: agree |
| 3.1 | stacks-05QI line 3696–3717; grothendieck1957 line 1338–1342 | Lemma 22.1 (both functors left exact there); Remarque 1: agree |
| 3.2 | stacks-05QI line 3718–3730; grothendieck1957 line 1309–1337, 1343–1347, 1506–1529 | Lemma 22.2; Théorème 2.4.1 (only `G` left exact); Remarque 2; Proposition 2.5.4 for the resolving functor `F ∘ C` of line 1423: agree |
| 3.3 | grothendieck1957 line 1330–1337 | Théorème 2.4.1: agrees |
| 4.1 | weibel1994 Theorem 2.7.2 | not read (uncertified) |
| 4.2 | stacks-more-algebra line 7121–7134, 7413–7422, 8115–8127 | Example 63.1 (bounded above), Example 65.5, (69.0.1), (69.0.2): agree |
| 4.3 | stacks-more-algebra line 7399–7412 | Lemma 65.4, for `D^b(R)`, as the README says: agrees |
| 5.1 | may-primer line 249–266, 267–279, 280–287 | conditions `μ_n`, Proposition 4.1, Corollary 4.2: agree |
| 5.3 | cartan-eilenberg1956 Ch. XV | not read (uncertified) |
| 6.2 | may-primer line 147–150, 155–168, 288–294; hatcher-at line 13330–13337 | higher universal-coefficient sequence, pages of cyclic summands, Example 4.3, Proposition 3E.3: agree |

Also read: stacks-012K line 2154–2164 (Definition 18.3, sign `d₁ + (−1)^p d₂`), 3131–3140
(Definition 24.9), 3241–3265 (Lemma 25.1; (4) has the sign `(−1)^q` the README's Check uses);
stacks-05QI line 2872–2896, 2925–2935, 2952–2972, 3402–3448; stacks-more-algebra line 7135–7140,
12960–13014; grothendieck1957 line 1226–1235, 1266–1268, 1291–1299, 2421–2425, 2443–2447,
2493–2497; douady1959 line 143–166.

**Adversarial pass.** Values computed on each side.

| Statement | Instance | Values computed | Result |
| --- | --- | --- | --- |
| Total sign (Conventions) | unit square, all maps `1` | `K^{1,0} → K^{1,1}` is `−1`, `K^{0,1} → K^{1,1}` is `+1`; `d² = 0`; unsigned sum squares to `2` | agrees |
| 1.1 staircase | `D_p, O_p`, `p ≥ 0` | degree `0 → 1` map `x ↦ (x_p − (−1)^p x_{p+1})`; on `⊕` bijective (back-substitution from `x_N = 0`); on `∏` kernel `(1, 1, −1, −1, …)`; `H^0(Tot^⊕) = 0`, `H^0(Tot^Π) = ℤ` | agrees |
| 1.2 flip sign | column `1`, `d₂ = ×2` | `Tot(K)`: `−2`; `Tot(K.flip)`: `+2`; `σ(1,0) = +1`, `σ(1,1) = −1` intertwine; Stacks 25.1(4) at `q = 1`: `−2` | agrees |
| 1.2 canonical presentation | `k y_0 ⊕ V`, `x_m`, `y_m` | `x_m ↦ y_{m−1} + (−1)^m y_m`; on `∏`: `a_1 = b_0`, `a_{j+1} = b_j − (−1)^j a_j`, bijective, `H^0 = V`, presentation has kernel `k y_0`; on `⊕`: functional `1, 1, −1, −1, …` kills the image, `H^0 = k y_0 ⊕ V` | agrees; 1.3(c) does not apply (`K^{−m,m} ≠ 0`), 1.3(b) does |
| 1.3(a) stabilisation bound | sparse antidiagonals (columns `{0, 1000}` on `n`, `{1001}` on `n + 1`) | a nonzero `d_r` leaving `(p, n − p)` needs nonzero components in columns `p, …, p + r − 1` of antidiagonal `n`, so `r ≤` number of columns on `n`; bound stated: columns on `n − 1, n, n + 1`, plus one | bound holds (not sharp) |
| 1.3(a) weak Serre | `ℚ → ℚ/ℤ`, `P` = ℚ-vector spaces | `′E_1^{0,0} = ℚ`, `′E_1^{1,0} = ℚ/ℤ ∉ P`, `′E_2^{0,0} = ℤ = H^0` | neither form contradicted |
| 1.3(b), (c) vs staircase | right and lower half-plane | (b) for `″E`: `q ≤ 0`, rows exact, `H(Tot^⊕) = 0`; (c) for `′E`: `p ≥ 0`, `′E_1 = ℤ` at `(0,0)`, `H^0(Tot^Π) = ℤ` | agrees |
| 1.5 `acyclic_total_of_bounded`, column form | dual staircase `A_p, B_p` | columns exact, `K^{p,n−p} = 0` only for `p < 0`; `y_p = (−1)^p x_p + x_{p−1}`; on `⊕` misses `(1, 0, 0, …)` (functional `1, −1, −1, 1, 1, …`), `H^1(Tot^⊕) = ℤ`; on `∏` bijective | hypothesis "large `p`" is the right one; the Lean disjunct has `b < p` |
| 1.5 direct argument | columns exact, `K^{p,n−p} = 0` for `p > b(n)` | `F^p Tot` has finitely many columns in degrees `n − 1, n, n + 1`, acyclic graded pieces, so is acyclic there; `Tot = colim_p F^p Tot`; exact `ℕ`-colimits give `H^n = 0` | true with exactly the Lean hypotheses (`HasTotal`, `HasExactColimitsOfShape ℕ`) |
| 1.5 Weibel dictionary | `C_{p,q} = K^{−p,−q}` | his four cases map to: `Π`, `q ≤ 0`, columns; `Π`, `p ≤ 0`, rows; `⊕`, `q ≤ 0`, rows; `⊕`, `p ≤ 0`, columns | each is an instance of the stated four conditions |
| 1.4 `quasiIso_total_map_of_bounded` | staircase → column `0` | columnwise quasi-isomorphism; `Tot^⊕`: `0` against `ℤ`, staircase fails `p > b(n)` vanishing; cone route: columns of cones exact, bound `max(b_K(n+1), b_L(n))` | agrees |
| 2.1(a) horseshoe, no enough injectives | any abelian category | lift `B → I₁^0` uses injectivity of `I₁^0` only; snake lemma gives the next short exact sequence of cokernels | true as stated in Lean (no `EnoughInjectives`) |
| 2.1(b) relative horseshoe | route recomputed | `ν₁ = ν − (dh̃ + h̃d)`, `μ = ν₁ − ι′(dk̃ + k̃d)`; degree-`0` terms of both corrections vanish on the augmentation | `μ` lies over `f₂`, restricts to `α`, induces `β` |
| 2.2 `IsRightAcyclic` | `Hom(ℤ/2, −)`: `ℚ/ℤ`, `ℤ`; `− ⊗ ℤ/2`: `ℤ` | `R⁰ = ℤ/2`, `R¹ = 0` at `ℚ/ℤ`; `R¹ = ℤ/2` at `ℤ`; for `⊗`: `R^i(ℤ) = 0` for all `i`, `F(ℤ) = ℤ/2` | definition separates; Leray needs left exactness, as Lean has (`PreservesFiniteLimits F`) |
| 2.3 definition | `A →(id) A`; `ℤ →(×2) ℤ` with columns `ℚ → ℚ/ℤ` | first: cycles `0`, `I`; boundaries `I`; cohomology `0`: is one. Second: `H_I^1 = 0` in both rows, `H^1(K) = ℤ/2`: is not | determines the object |
| 2.4, 2.5 | `Hom(ℤ/2, −)`, `ℤ →(×2) ℤ` | `′E_1^{0,1} = ′E_1^{1,1} = ℤ/2`, `′d_1 = 0`; `″E_2^{0,1} = ″E_2^{1,1} = ℤ/2`; abutment `Ext^{n−1}(ℤ/2, ℤ/2) = ℤ/2`, `n = 1, 2` | both agree |
| 2.5 F-acyclic variant | resolutions by `F`-acyclics | `0 → Z → L → B → 0` and `0 → B → Z → H → 0` have `F`-acyclic terms, so `F` is exact on them | `F` commutes with horizontal cycles, boundaries, cohomology |
| 2.6 index | `ℤ →(×2) ℤ` in degrees `−1, 0`, `− ⊗ ℤ/2` | `E^1_{0,0} = E^1_{1,0} = ℤ/2`, `d^1 = 0`, `L_0 = L_1 = ℤ/2 = Tor_n(ℤ/2, ℤ/2)` | agrees |
| 3.1 `isIso_compositionTrans_iff`, both directions, `F` not left exact | `F = G = Hom(ℤ/2, −)`; `F = − ⊗ ℤ/2`, `G = id` | first: `F(ℚ/ℤ) = ℤ/2`, `R¹G = ℤ/2`, `R¹(GF)(ℚ/ℤ) = 0` against `ℤ/2`: both sides false. Second: both sides true. (⇐) uses Leray for `G` only; (⇒) evaluates at `I[0]` | iff holds; left exactness of `F` not used |
| 3.2 | `ℤ/4 → ℤ/2`, `A = ℤ/2` | `R^qF = ℤ/2` all `q`, `G` exact, `E₂^{0,q} = ℤ/2`, abutment `Ext^n_{ℤ/4}(ℤ/2, ℤ/2) = ℤ/2` | agrees |
| 3.3 five-term | same | `0 → 0 → ℤ/2 → ℤ/2 → 0 → ℤ/2` | exact |
| 3.4 | `ℤ → ℤ/2`; `− ⊗ ℤ/2` then `Hom(−, ℤ)` | first: `E₂^{0,q} = ℤ/2`, `q = 0, 1`, abutment `Ext^n_ℤ(ℤ/2, ℤ/2)`; second: hypothesis fails, composite is `0` | agrees |
| 4.1 `nonempty_tor_iso_tor'` | `ℤ/4, ℤ/6`; `𝔽₂[x, y]/(x², y²)` with `⋆` | `ker(×6 on ℤ/4) = {0, 2}`, `ker(×4 on ℤ/6) = {0, 3}`; `Tor_0(X, k) = Tor'_0(X, k) = k`, `X ⋆ k = soc(X)` of dimension `2` | balance holds; `Tor_0 ≠ ⋆` is correctly not claimed |
| 4.2(a) | `ℤ/2[0]`, `M = ℤ/2`; `⊕_n ℤ/2[n]` | `E₂^{0,0} = E₂^{−1,0} = ℤ/2`; `H^n = (ℤ/2)²` for every `n` | agrees |
| 4.2(c) | `ℤ →(×2) ℤ`, `M = ℤ` | `E₂^{1,0} = ℤ/2`, `E₂^{0,0} = 0`, `H¹(Hom(X, ℤ)) = ℤ/2` | agrees |
| 4.3 | `k[ε]/(ε²)`, `K = L = k`; filtration by resolution degree | `E₂^{p,0} = k`, `p ≤ 0`; `s = n − p − j ≥ n − a − b`, so the filtration is finite in each degree for bounded-above `K`, `L` | extension from `D^b` to bounded above is sound |
| 4.4(a) | `ℤ → ℤ/4`, `M = N = ℤ/2` | `E²_{p,q} = ℤ/2` for `q ∈ {0, 1}`; abutment `0` for `n ≥ 2` forces `d²: E²_{p,0} → E²_{p−2,1}` bijective for `p ≥ 2` | agrees |
| 5.1 | couple of `0 → M →(×2) M → M/2`, `M = (ℤ →(×4) ℤ)` | `k(1) = 2`, `d₁ = 0`; `c` with `2c = 2` is odd, `j(c) = 1 ≠ 0`; `d₂(1·1) = 1 ≠ 0` | `μ_1` for `φ` false, `μ_0` for `φ′` false: the shift starts at `1` |
| 5.1 converse route | general | `c = c₀ − k(z)`: `j(c) = j(c₀) − jk(z)`, `iⁿ(c) = iⁿ(c₀)` since `ik = 0` | holds for `n ≥ 1` |
| 5.3 Leibniz rules | bidegrees `(p, q)`, `(p′, q′)` | chain-map identity split by bidegree gives `d₂(xy) = (−1)^{p′} d₂(x)y + (−1)^q x d₂(y)`; flip sign `(−1)^{pq′+p′q}` from `σ(p,q)σ(p′,q′) = (−1)^{(p+p′)(q+q′)}·`sign | agrees |
| 6.1 `d_1` | `ℤ →(×p) ℤ`; `ℤ →(×p²) ℤ` | `k(1) = [1]`, `d_1 = +1`; `k(1) = [p]`, `d_1 = 0` | agrees |
| 6.2 higher sequences | `ℤ →(×p^r) ℤ`; `⊕_k (ℤ →(×p^k) ℤ)`; `ℤ → ℤ[1/p]` | `E_s^0 = E_s^1 = ℤ/p` for `s ≤ r`, `0` after; `E_r^0 = ⊕_{k ≥ r} ℤ/p`, `E_∞^0 = 0`; `E_r^0 = ℤ/p` for all `r`, `H^0[1/p] = 0`, criterion `⋂ p^r H^1 ∩ H^1[p] = ℤ/p ≠ 0` | agrees |
| 6.2 stabilisation | general | `f^r y` killed by `f` gives `y ∈ H[f^b]`, so zero for `r ≥ b`; `B_{r+1}` constant for `r ≥ a` | page `max(a, b) + 1` |

Context and generality: the Lean signatures carry `[PreservesFiniteLimits F]` for Leray,
`[PreservesFiniteLimits G]` only for the criterion, `[HasColimitsOfShape ℕ C]
[HasExactColimitsOfShape ℕ C]` for the half-plane forms and none for the finite forms, as the README
states them. 2.3's definition depends on the chosen bound `a` (a column below the support of `K`
must vanish); it is used consistently with `a` as a parameter (2.3 lifting, 2.4).

**Declared gaps.** 19 in `design/plan.json`, 19 `What SpectralSequencesAndConvergence must provide`
paragraphs in the README, slugs equal, one supplier (never `none`). Each names its section of the
base, and each section exists in the base's accepted design (`packages/SpectralSequencesAndConvergence/design/README.md`:
§§1.2–1.4, 2.1, 2.2, 3.1–3.6, 4.3, 5.1–5.4, 6.1–6.3, 7.2, 7.4, 7.5). Checked against it: the classical
indexing (page `r + 1` at `(2p + q + 1, −p − 1)`, assignment `(a, b) ↦ (−b − 1, a + b)`, `e = 1`;
witness `(1, −1)`, `(3, −2)` recomputed), the half-plane criterion of §7.5, the Check of §6.2 for
the Bockstein couple of `ℤ`. None asks for what Mathlib or Tau Ceti provides: Tau Ceti's
`filtrationAbutmentIso` and stabilisation isomorphisms are not convergence structures.

**Supplier order.** Output of the dependency check:

    depcheck: 242 roadmaps, 2195 edges, 0 problem(s)

No UPWARD or CYCLE line. Suppliers: Mathlib, Tau Ceti, SpectralSequencesAndConvergence (line 18 of
the merge order), StableHomotopyKTheory (line 17, on main, §7.22 at line 2618: page `r` is the `E` of
the `(r − 1)`-th derived couple, `d_r` of degree `c + b − (r − 1)a`), DerivedModuleAlgebra (main,
§0.2 at line 794, §S.1 at line 955, anticommuting differentials at line 960), ArithmeticGaloisDuality
(line 62; §D7.1, *Derived composite spectral sequence*, at its open head: same hypotheses, same
construction, edge maps as the contract says). This roadmap is at line 63.

**Other citations resolved.** ArithmeticStatisticsPartVIII §5.16, subsection *Tor spectral sequences
over graded algebras* (open head); SchemeKTheoryOperations §6.7, group hyperhomology (open head);
ArithmeticLocallySymmetricSpaces ALS.1.7 (open head); AlgebraicTopology §5.1 (main, line 1898);
SchemeAndStackFoundations §§2.2, 2.7, 2.15 with the four names (main, lines 4186, 4189, 4440, 4926);
TopologicalSheafCohomology §1.4 (main, line 164); DGFloer Layer 1 item 2 (main; the open revision of
DGFloer maps this id to AlgebraicTopology Stage 5.5 in its own text, so the citation stays valid).
`scratch/overlaps.md`: no other pull request changes this roadmap, no cited id is dropped, no id is
defined only by a revision; confirmed for DGFloer as above.

**Duplication by object.** Searched all roadmaps (main and open heads) for: Cartan–Eilenberg
resolutions (ArithmeticGaloisDuality uses them in a proof sketch; NoncommutativeAndEquivariantIwasawa
has a bibliography entry), Grothendieck spectral sequence (ArithmeticGaloisDuality §D7.1, cited;
CrystallineCohomology uses SchemeAndStackFoundations §2.2), acyclic assembly (none), horseshoe
(GrothendieckEulerForms: Tau Ceti's finite projective horseshoe in exact categories, which the README
cites at the pin), Leray's acyclicity (the sheaf-theoretic theorem on acyclic covers in
SchemeAndStackFoundations and DiamondsAndVStacks, a different statement), Bockstein spectral
sequence (none), product totalisation (cosimplicial and mixed-complex totalisations in
DerivedModuleAlgebra, DerivedDeRhamCohomology, RefinedTraceMethods; none of a double complex with
its API), balancing of Tor (KhovanovHomology §K5: R01), pairings of exact couples (none),
`rightDerivedFunctorPlus` (used, never compared with `Functor.rightDerived`, in Hyperfunctions,
EnhancedDerivedSheaves, SmoothRepresentationsOfLocalGroups, ClassicalAdicEtaleCohomology).

Overlap check: read DerivedModuleAlgebra, TopologicalSheafCohomology, GrothendieckEulerForms (main), SchemeKTheoryOperations, AlgebraicTopology, EnhancedDerivedSheaves (open or main); first-quadrant double-complex spectral sequence: DerivedModuleAlgebra §S.1, cited; Čech hypercohomology sequences: TopologicalSheafCohomology §1.4, cited; group hyperhomology: SchemeKTheoryOperations §6.7, cited; Künneth spectral sequence of singular chains: AlgebraicTopology §5.1, cited; finite projective horseshoe: Tau Ceti, cited; nothing else shared. Outside the three lists: KhovanovHomology §K5 (R01).

**Shape and style.** Summary, Scope and ownership, Conventions, Exact supplier contracts, How to
read the build, six layers each ending with Examples and Dependencies, Downstream consumers,
References. Every definition (product total, column filtration and the two sequences,
`IsRightAcyclic`, Cartan–Eilenberg resolution, the two hypercohomology sequences, hyper-left-derived
functors, `compositionTrans`, the composite-functor sequence, pairings and `μ_n`, pairings of double
complexes, the Bockstein couple) has an API and at least three Checks (minimum found: 3). No LaTeX
delimiters, no pull-request numbers, dates, job ids, machine paths or HTML anchors in the README;
no `lemma`, `#eval`, `#print`, `set_option` in the Lean file; imports are the single `import Mathlib`.
The organisation is the roadmap's own: the layers are double complexes, resolutions and
hyper-derived functors, composites, Tor and Ext, products, Bockstein, and no heading names a
source's chapter.

**Copyright.** Wording compared at the 15 sampled locators and at 7 further passages (Conventions
on the total sign against stacks-012K line 2154–2164 and grothendieck1957 line 1266–1268; 2.1(a′)
against stacks-05QI line 3402–3419; the route of 3.1 against line 3712–3717; the docstring of
`isIso_compositionTrans_iff` against line 3705–3711; 6.1 against stacks-more-algebra line
12960–12976; the augmented forms of 1.5 against stacks-012K line 3354–3358, longest shared run 5
words, a standard phrase; the Hatcher Check of 6.2 against hatcher-at line 13330–13337, longest
shared run 3 words, the three cases being forced). None reproduces or translates a passage.
Arrangement: stacks-05QI has the largest share. Its §§16, 18, 19, 21, 22 correspond to 2.2, 2.1, 2.6,
2.3–2.5, 3.1–3.2: the order differs (§18 before §16 here), its §§17, 20 and 23 onwards have no
counterpart, and Layers 1, 4, 5 and 6 draw on other sources. The order 2.3 → 2.4, 2.5 → 3.2 is forced
by the *Needs* lines of 2.4, 2.5 and 3.2. No table, figure or list of examples is taken over. No
declaration of `Suggested.lean` was found in a public formalisation outside the pinned libraries
(the 11 names occur in no other roadmap; no other repository was searched).

Source independence: 22 passages compared with 7 sources, none shared; largest share stacks-05QI, 16 of 79 locators; contents compared with stacks-05QI: independent.

## Not verifiable

- weibel1994 (§§1.2, 2.2, 2.7, 5.6–5.8, Theorem 2.7.2, Lemma 2.7.3, Lemma 5.7.2): settled as
  uncertified, text not read. It is the only locator of 4.1 and of 1.3(b), (c); the statements were
  checked mathematically instead (table above).
- cartan-eilenberg1956 (Ch. XV–XVII): uncertified, not read. It is the only locator of 5.3; the two
  Leibniz rules and the flip sign were recomputed.
- mccleary2001 (Ch. 2, Ch. 10) and massey1954: uncertified, not read.
- CohomologyOfGroups (named under Downstream consumers): its package on the board has no README
  yet, so the description of what it consumes was not checked.
- Ownership against public formalisations other than the pinned libraries was not searched.

## Source issues

- **Misprint** in may-primer at Proposition 4.1, printed p. 7: the source says the equivalence between condition `μ_n` for a pairing and `μ_{n−1}` for the derived pairing holds without restricting `n`; it should be stated for `n ≥ 1`, since `μ_{−1}` is not defined; affects nothing.

## For the human reviewers

- **Scope.** Headline 2.2(i) compares `Functor.rightDerivedFunctorPlus` with `Functor.rightDerived`; `Mathlib/CategoryTheory/Abelian/RightDerived.lean:41–46` at the pin plans to redefine the latter through the former, after which the statement would hold by definition.
- **Licence.** `sources.toml` records grothendieck1957 as `operator-local` with a `resolution` field holding an issue-comment URL; whether that field belongs in a published manifest is not mine to settle.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "1d7a2f287f7e78f4239689474c5311b77b1955e7", "job": "REV-PKG-SpectralSequencesAndConvergencePartII", "model": "fable", "worker": "chris-x52"} -->
