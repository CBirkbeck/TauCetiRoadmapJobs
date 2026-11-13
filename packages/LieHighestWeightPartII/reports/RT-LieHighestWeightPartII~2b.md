<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/12954#issuecomment-6859232637 -->
Red team round 2 pass b (claude) of 6b43ce8

Verdict: needs_changes

**For the human reviewers:** this review raises 2 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P2) The declared gap `gap:orbit-map-differential` asks for what the pinned Tau Ceti already proves

   **Location.** `packages/LieHighestWeightPartII/README.md:110` ("What ReductiveGroups must provide
   (gap:orbit-map-differential): … the Lie algebra of the stabilizer of `v` is the kernel of the
   differential … the orbit `G·v` is Zariski open in `V`"), its three Checks (`:112`–`:116`), the two
   uses in the route of §0.3 (`:179`), the `*Needs:*` of §0.3 (`:188`), the Layer 0 Dependencies
   (`:196`), and `packages/LieHighestWeightPartII/design/plan.json`, top-level `gaps`.

   **Claim.** Neither clause is available at the pins, so ReductiveGroups §3A must supply both.

   **Witness.** Pinned Tau Ceti (`2fd255d9`):

   - `TauCeti/Algebra/AlgebraicGroup/Representation/VectorStabilizer.lean:348`
     `TauCeti.Comodule.lieSubalgebra_stabilizerHopfIdeal`: the Lie algebra of the stabilizer of `v` is
     the kernel of `d ↦ d • v` (first clause; over every field).
   - `TauCeti/Algebra/AlgebraicGroup/Representation/Orbit.lean:278`
     `TauCeti.Comodule.isOpen_range_projectiveOrbitMap_mk_one_of_range_eq_top`: algebraically closed,
     characteristic zero, finite-type `H`, finite-dimensional comodule `M`, `𝔤 • v = M` ⇒ the orbit of
     `v` is open (second clause; the orbit lies in the chart `M` of `P(M × k)` by
     `TauCeti.Comodule.range_projectiveOrbitMap_subset_basicOpen_snd`, `:89`).
   - Same file `:287`, `TauCeti.Comodule.exists_basePointsRepresentation_eq_of_range_eq_top`: two
     vectors `v, w` with `𝔤 • v = M = 𝔤 • w` are carried one to the other by a rational point. This is
     the conclusion §0.3 draws from "two dense open orbits meet".
   - `TauCeti/Algebra/AlgebraicGroup/Tangent/Lie/Adjoint/Centralizer/Eigenspace.lean:190`
     `IsSl2Triple.range_differential_flip_eigenspace_two_eq_top`: for an `IsSl2Triple` over a field of
     characteristic zero, the orbit differential at `e` of `C_G(h)` acting on `𝔤(2)` is onto; with
     `TauCeti.centralizerHopfIdeal` and `TauCeti.lieSubalgebra_centralizerHopfIdeal`
     (`…/Centralizer/Basic.lean:81`, `:147`) for `Lie(C_G(h)) = ker(ad h)`.

   Tested on the instances of the gap's own Checks: `SL₂` on `K²` at `e₁`, differential
   `[[a, b], [c, −a]] ↦ (a, c)` onto, kernel `K E₁₂`; `G_m` scaling `K` at `v = 0`, differential `0`,
   not onto, orbit `{0}` not open. Both agree with the pinned statements.

   **Repair.**

   1. Delete the entry `orbit-map-differential` from `gaps` in `design/plan.json` and delete README
      line 110 with its three Checks (`:112`–`:116`).
   2. Under `### From Tau Ceti` add: "From `TauCeti/Algebra/AlgebraicGroup/Representation/VectorStabilizer.lean`:
      `TauCeti.Comodule.lieSubalgebra_stabilizerHopfIdeal`, for a comodule `M` of a commutative Hopf
      algebra over a field and `v ∈ M`, the Lie algebra of the stabilizer of `v` is the kernel of the
      differentiated action `d ↦ d • v`. From `TauCeti/Algebra/AlgebraicGroup/Representation/Orbit.lean`,
      for a finite-type commutative Hopf algebra over an algebraically closed field of characteristic
      zero and a finite-dimensional comodule `M`:
      `TauCeti.Comodule.isOpen_range_projectiveOrbitMap_mk_one_of_range_eq_top`, a vector `v` with
      `𝔤 • v = M` has an open orbit, and `TauCeti.Comodule.exists_basePointsRepresentation_eq_of_range_eq_top`,
      two such vectors are carried one to the other by a point of the group. From
      `TauCeti/Algebra/AlgebraicGroup/Tangent/Lie/Adjoint/Centralizer/Basic.lean` and
      `…/Centralizer/Eigenspace.lean`: `TauCeti.centralizerHopfIdeal`, the centralizer `C_G(x)` of
      `x ∈ Lie(G)`, with `TauCeti.lieSubalgebra_centralizerHopfIdeal`, its Lie algebra is `ker(ad x)`;
      `TauCeti.centralizerAdHom`, the eigenspaces of `ad x` as representations of `C_G(x)`; and
      `IsSl2Triple.range_differential_flip_eigenspace_two_eq_top`, for an `IsSl2Triple` over a field of
      characteristic zero the differentiated action of `Lie(C_G(h))` at `e` is onto `𝔤(2)`."
   3. §0.3 route (`:179`), replace from "Let `G_h` be the stabilizer of `h`" to "and `Ad(g) ∈ Int(L)` by
      §0.2." by: "Let `C_G(h)` be the centralizer of `h` (`TauCeti.centralizerHopfIdeal`); it acts on
      `L_2` (`TauCeti.centralizerAdHom`), and the differentiated action of its Lie algebra at `e` is onto
      `L_2` (`IsSl2Triple.range_differential_flip_eigenspace_two_eq_top`, from `[L_0, e] = L_2`); the
      same holds at `e'`. So some `g ∈ C_G(h)(K)` has `Ad(g)e = e'`
      (`TauCeti.Comodule.exists_basePointsRepresentation_eq_of_range_eq_top`; DG §3, Lemma 3, p.4,
      DG line 143, over `ℂ`), and `Ad(g) ∈ Int(L)` by §0.2."
   4. `*Needs:*` of §0.3 (`:188`) and Layer 0 Dependencies (`:196`): replace "3A (§§3A.1–3A.2,
      gap:orbit-map-differential)" and "3A (gap:orbit-map-differential)" by the five Tau Ceti names of
      item 2; drop Layer 3A from both lines and from the ReductiveGroups contract (`:108`) if nothing
      else of §0.3 uses `TauCeti.orbitMap`, `TauCeti.stabilizer`.
   5. Scope (`:12`) and the NilpotentOrbits contract (`:96`, "§0.3 derives the open orbit from the
      second"): name `IsSl2Triple.range_differential_flip_eigenspace_two_eq_top` and
      `TauCeti.Comodule.exists_basePointsRepresentation_eq_of_range_eq_top` as what §0.3 consumes.

   Tested on the instance: `sl₂`, `h = H`: `C_G(H)` is the diagonal torus, `L_2 = K E`, differentiated
   action `H ↦ [H, E] = 2E` onto; `e = E`, `e' = cE`, and `g = diag(c^(1/2), c^(−1/2))` gives
   `Ad(g)E = cE`.

2. **F02** (P3) Page range of de Graaf's orbit tables

   **Location.** `packages/LieHighestWeightPartII/README.md:440` ("DG Appendix A, Tables 2–6,
   pp.7–16"), `:462` ("DG Appendix A, Tables 2, 3 and 6, pp.7–16, DG line 262"), `:634`, and the `DG`
   `locator` in `packages/LieHighestWeightPartII/sources.toml:29`.

   **Claim.** Appendix A with Tables 2–6 runs to p.16.

   **Witness.** DG line 809 is the folio of p.15, closing Table 6; DG lines 810–811 open p.16 with
   Appendix B (the root lists, Tables 7–11).

   **Repair.** Write "pp.7–15" in the four places.

One blocking finding (S01) and one locator finding (S02). No statement of `Suggested.lean` and no
README target was found false.

## Round 1 findings at this head

| Finding | Status | Witness at `6b43ce8` |
|---|---|---|
| 1a/F01 (existence of the positive real part) | repaired | `Suggested.lean:278` `existsUnique_positiveRealPart … ∃! r : WithConv (H →ₐ[ℂ] ℂ), IsPositiveRealPart s r`; README `:568` "Prove `existsUnique_positiveRealPart`" |
| 1a/F02, 1b/F01 (Chevalley restriction owner) | repaired | README `:14` "Chevalley's restriction theorem is Tau Ceti's"; `:80` cites `LieSubalgebra.map_lieInvariants_lieCartanRestriction`; `:92` keeps Layer 7 for the Serre presentation only |
| 1a/F03 (table rows reproduced) | repaired | README `:467` "every odd degree vanishes, `D_0` is the rank … `i_max = 58, 22, 10`"; no row of CH Tables 2–4 is listed |
| 1a/F04 (neutral-element conjugacy absent) | repaired | `Suggested.lean:67` `exists_innerAut_iff_neutral_conjugate`; README `:175` |
| 1a/F05 (open-orbit input unowned) | partly repaired | the gap is declared in `plan.json` and README `:110` with one slug; but the pin already proves it: S01 |
| 1a/F06 (SOM title) | repaired | `sources.toml:43` `title = "Notes on nilpotent orbits"`; README `:635` |
| 1b/F02 (sign of the invariant form) | repaired | README `:7` "their symmetry sign is the rank-one case of LieHighestWeight §5.1"; `:310`; the cited theorem is at `TauCetiRoadmap/RepresentationTheory/LieHighestWeight/Suggested.lean:210`, in a `section`, so the qualified name of README `:14` is right |
| 1b/F03 (sibling described as consumer) | repaired | README `:24` "states the same recognition for Frobenius-fixed real parts"; `:620` "follows from §5.5 as follows" |
| 1b/F04 (former layer numbers) | repaired | README `:92` "former Layers 0, 1, 2, 4 and 5 as library declarations"; `:100` |
| 1b/F05 (Killing property at the pin) | repaired | README `:17`, `:290` cite `TauCeti.isKilling_typeB`, `TauCeti.hasTrivialRadical_sp`, `TauCeti.instHasTrivialRadicalSl`, `TauCeti.hasTrivialRadical_so'`; all four exist at the pin |
| 1b/F06 (CH table pages) | repaired | README `:462` "pp.35–37"; CH line 1734 precedes the p.36 marker at CH line 1735 |

No repair introduced a false statement. The repair of 1a/F05 introduced the gap that S01 reports.
The lead of `scratch/citations.md` (the name `invariantForm_isSymm_iff_tits_sign` "found nowhere")
is a false positive: the declaration is in the LieHighestWeight file named above.

## Verified sound

**Dependency check** (the command of the brief):

```text
depcheck: 239 roadmaps, 2170 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line.

**Counts.** Declarations read: 16 of 16 (1 structure, 4 definitions, 11 theorems), each against its
elaborated type in the supplied `signatures.md` (no Lean was run; no binder is lost, and each type
agrees with its README statement). README: all 636 lines, 23 numbered sections, 11 named theorem
targets, 1 gap contract. Locators verified against the cached texts: 35 (CH 19, DG 8, SOM 2, KIR 6).
Checks: all read; 55 recomputed in this pass, none false. Sibling citations checked: 12
(LieHighestWeight §5.1, Layers 7, 8 on main; ReductiveGroups Layer 3A §§3A.1–3A.2, the native orbit
contract and §9A.1b on main; ReductiveGroupsPartIII §0.3, §0.5 at its open head; NilpotentOrbits N0,
N2, N4 on main; SpinRepresentations Layer 5 on main and at its open head;
GlobalShtukasAndFunctionFieldLanglandsPartII §8.0 and SmoothRepresentationsOfLocalGroupsPartII at
their open heads, both later in the merge order and named as consumers only).

**Policy and form.** The pull request changes only `packages/LieHighestWeightPartII/`. One
`import Mathlib`, six `TauCeti.*` modules, all present at the pin. No `lemma`, `set_option`,
`#check`, `#eval`, `True` placeholder or sorry'd data; 303 lines. No pull-request number in the
README or docstrings. Every Lean name occurs in the README.

**Headline theorems.** Stated: §0.3 neutral-element conjugacy; §1.3 filtration versus restricted
module; §2.4 types `A`, `C`, `B`/`D` with an odd part, split `D` with `S⁺`; §3.4 exceptional adjoint
recognition; §4.1 recognition; §5.2 half-integrality (Lie form); §5.4 existence and uniqueness of
the positive real part; §5.5 its recognition. Named as not statable: the finite test family of
§4.1 and the group form of §5.2 (the pinned `TauCeti/Algebra/AlgebraicGroup` has no highest weight
of a comodule). Padding: none; no theorem follows from one pinned lemma (the pinned
`TauCeti/Algebra/Lie/Sl2/Classification.lean`, `Centralizer.lean`, `WeightMultiplicity.lean` state
neither §1.3 nor §0.3).

**Declarations of `Suggested.lean`.** All binders are explicit; there is no `variable` block.

| Declaration | Context | Instances tried | Values computed | Result |
|---|---|---|---|---|
| `IsSl2TripleOrZero` | `[LieRing L]` | `(0,0,0)`; `(H,E,F)`; `(−H,−F,−E)`; `(0,E,0)` | holds; holds; `[−F,−E] = −H`, `[−H,−F] = 2·(−F)`… holds; `[0,E] = 0 ≠ 2E` | sound |
| `exists_innerAut_iff_neutral_conjugate` | `K` alg. closed, char 0; `L` f.d. Killing; `[LieAlgebra ℚ L]` | `sl₂`: `(H,E,F)` vs `(H,cE,c⁻¹F)`; vs `(0,0,0)`; `L = 0` | `Ad diag(c^½, c^−½)` sends `E ↦ cE`: both sides true; `φ(H) = 0` impossible: both false; trivial | sound |
| `weightFiltration` | `[Field K]`, any module | adjoint of `sl₂`; `V(1)` | `1,1,2,2,3` at `−2..2`; `0,1,1,2` at `−2..1` | sound |
| `finrank_weightFiltration_eq_iff_exists_intertwiner` | `L, L'` arbitrary, `M, M'` f.d. | `V(2)` vs `V(0)⊕V(1)`; nonzero `h` with `ρ(h) = 0`; zero triple vs trivial module | `(1,1,2,2,3)` vs `(0,1,2,3,3)`, no intertwiner; then `ρ(e) = ½[ρ(h),ρ(e)] = 0`, trivial restriction; equal, any linear iso intertwines | sound both ways |
| `…_sl` | `n` any `Fintype`; action `mulVec` | `n = ∅`, one point; `sl₃` three classes | `sl = 0`; jumps `3@0`, `1@−1,0,1`, `1@−2,0,2` | sound |
| `…_sp` | `l` any `Fintype` | `l = ∅`; `sp(2)`; `sp(4)` `(3,1)` | zero algebra; `2@0` vs `1@±1`; odd parts of multiplicity one, excluded | sound |
| `…_so` | `hker` on `h` only | `n = 0, 1, 2`; `n = 4`: `(2,2)`, `(3,1)`; `so(8)` `(4,4)` | `hker` fails or only the zero triple; `(2,2)`: eigenvalues `1,1,−1,−1`, kernel `0`, excluded; `(3,1)`: kernel `≠ 0`, one `SO` class; `(4,4)`: kernel `0` | sound; `hdim` transfers `hker` to `h'` |
| `…_typeD` | `P` with perfect pairing `W' ≃ W*` (structure field `pairingEquiv`), `hline` | `r = 0, 1`; `r = 2`; `r = 3`; `r = 4`, `(4,4)`, `(2,2,2,2)` | zero triple only; tops on `S⁺`: `1` vs `0` for `(t,0)`, `(0,t)`; no very even partition of `6`; tops `4`/`3` and `2`/`1` | sound |
| `…_adjoint_exceptional` | `L` f.d. Killing, `hL` | recomputed by a script for all five types | `|Φ| = 12, 48, 72, 126, 240`; `ht θ = 5, 11, 11, 17, 29`; `|C_T| = 7, 28, 34, 274, 245`, distinct profiles `7, 28, 34, 274, 245`; `E₆` without opposition `212` vectors, `123` profiles | sound |
| `exists_innerAut_iff_finrank_weightFiltration` | `K : Type u`, `L : Type v`, `M : Type (max u v)` | `L = 0`; `sl₂ × sl₂`, `(t,0)` vs `(0,t)` | trivial; first-factor standard pullback `1@±1` vs `2@0`; adjoint weights `2,0,−2,0,0,0` for both | sound; `ULift` of `L` and of `Fin n → K` lie in `Type (max u v)` |
| `forall_weight_halfIntegral_iff_highestWeight` | char 0 only; `M` irreducible, any dimension | `L = 0`; `sl₂`, `ν(α) = ½`: Verma `λ(H) = −2`, `−1`; `V(1)⊕V(0)`; `ν(α) = ⅓`, `V(3)` | `0 ∈ ℤ` both sides; `−(k+1)/2` both true, `−¼ − k/2` both false; irreducibility fails; `2ν(α) = ⅔`, hypothesis fails | sound |
| `weightPattern` | `q : ℝ` free | `diag(q^½, q^−½)`; Jordan block at `q^½` | `1@±1`; `1` at `i = 1` | sound |
| `IsGeometricPoint` | `FGComoduleCat.{0,0,0} ℂ H` | `diag(2,½)`, `q = 4`, `q = 3` | `2 = 4^½`: yes; `4^k = 3^i` only for `k = i = 0`: no | sound |
| `IsPositiveRealPart` | same | `G_m`, `s = 2i`; unipotent `u` | `r(t) = 2`, `r(t⁻¹) = ½`; `u` and `1` both satisfy it | sound; unique only for semisimple `s`, as stated |
| `existsUnique_positiveRealPart` | `hH`, `hs` | `H = ℂ`; `SL₂`, `diag(z, z⁻¹)` | `r = 1`; `diag(|z|, |z|⁻¹)` | sound |
| `exists_conj_positiveRealPart_of_weightPattern_eq` | `1 < q`, `hH`, `hs`, `hs'`, `hgs`, `hgs'` | `G_m`, `q = 4`, `2i` vs `2`; `SL₂`, `q = 3`, `diag(2,½)` vs `diag(5,⅕)` | patterns `1@k`, `r = r' = 2`; equal patterns, `hgs` fails, real parts not conjugate | sound; `hgs` needed |

**README targets and conventions recomputed.**

| Statement | Instance | Values | Result |
|---|---|---|---|
| §0.2 rank-one factorisation | `w(c) = x(c) y(−c⁻¹) x(c)` | `[[0,c],[−c⁻¹,0]]`; `w(c) w(1)⁻¹ = diag(c, c⁻¹)` | agrees |
| §0.3 surjectivity range | `V(n)`, `e : M_j → M_(j+2)` | fails to be onto only at `j + 2 = −n ≤ 0`, so onto for `j ≥ −1` | agrees |
| Layer 0 Example | conjugation by `w(1)` | `H ↦ −H`, `E ↦ −F`, `F ↦ −E` | agrees |
| §1.3 | `V(2)⊕2V(0)`; `V(1)⊕V(0)` | `d_0 = 3`, `dim W_0 = 4`; `dim W_0 − dim W_2 = 2 − 3` | agrees |
| §1.4 dual shift | `(M*)_j = (M_(−j))*` | `W_i(M*) = Ann ⨁_(k ≤ −i−1) M_k` | agrees |
| Layer 1 Example | `sl₃`, `h = diag(1,0,−1)`, `diag(2,0,−2)` | `d = (1,2,2,2,1)`; weights `4,2,2,0,0,−2,−2,−4`, `m_4 = m_2 = 1`, `m_0 = 0` | agrees |
| §2.1 invariance | `f`: `(−1)^(j+1) + (−1)^j`; `e`: `j(n−j+1)[(−1)^(j−1) + (−1)^j]` | `0`; `0` | agrees |
| §2.1 determinant | reversal sign times entries | `(−1)^(n(n+1)/2) · (−1)^(n(n+1)/2) = 1` | agrees |
| §2.1 Check | trace form on `E, −H, −2F` | `−2, 2, −2 = −2·(1, −1, 1)` | agrees |
| §2.1 versus KIR (5.4) | `f v_k = (k+1) v_(k+1)` | `f^j v_0 = j! v_j`; `e w_j = j(n−j+1) w_(j−1)` | agrees |
| §2.2 parity | orthogonal, even block; symplectic, odd block | `γ_n` alternating in both, `dim U_n` even | agrees |
| §2.3 tops | `h_II`, even vector with minus at `i < r` and `r` | `A − a_i ≤ A − a_r` | agrees |
| §2.3 Check | `(4,4)`; `(2,2,2,2)` | `a = (3,3,1,1)`, tops `4`, `3`; `a = (1,1,1,1)`, tops `2`, `1` | agrees |
| Conventions, `G₂` | `A_21 = ⟨α₂, α₁∨⟩`, `α₁` short | `−3`; `θ = 3α₁ + 2α₂` | agrees |
| §3.1 Check | `G₂`, `a = (2,0)` | `4,0,2,0,1,0,2` | agrees |
| §3.2 Checks | `G₂`: `(2,2)`, `(0,1)`, `(1,0)`; `F₄` principal | `2,0,2,0,1,0,1,0,1,0,1`; `4,4,1`; `4,2,1,2`; `4,4,3,3,3,3,2,2,1,1,1,1`, `F_0 = 28` | agrees |
| §3.5 Check | `F₄`, `(1,0,0,0)`, `(0,0,0,1)` | `D_0 = 22`, `D_1 = 14`, `8`; dimensions `16`, `22` | agrees |
| Layer 3 Example | `G₂`, `(0,2)`, `(1,0)` | `1,0,4,0,4,0,4,0,1`; `2,1,2,4,2,1,2` | agrees |
| §5.2 Checks | Verma at `λ(H) = −2`, `−½` | `−k(k+1) ≠ 0`; `−k(k − ½) ≠ 0` | agrees |
| §5.3 Check | `q = 3`, eigenvalues `2^k`, `5^k` | in `3^(ℤ/2)` only for `k = 0` | agrees |
| gap Checks | `SL₂` at `e₁`; `G_m` at `0` | onto, kernel `K E₁₂`; zero differential, orbit `{0}` | agree with the pinned statements of S01 |

**Ownership.** No declaration of `Suggested.lean` has the qualified name of a declaration of a
roadmap on main or at an open head. The pin has no weight filtration, zero-inclusive triple, weight
pattern or positive real part. GlobalShtukasAndFunctionFieldLanglandsPartII §8.0 still plans the
same recognition and does not cite this roadmap (0 occurrences of its name); this roadmap is the
earlier one and its README describes the sibling as it is, so nothing is to change here.
SmoothRepresentationsOfLocalGroupsPartII states three contracts against this roadmap (triple
centralizers, graded open orbits, Bala–Carter tables) that this roadmap does not plan; that is the
sibling's to settle.

Source independence: 8 passages compared with 4 sources, none shared; largest share CH, 25 of 40 locators; contents compared with CH: independent (CH §2 feeds Layers 0–1 and 4, its appendix Layers 2–3, its §6.12 and §10.1 Layer 5; the order of the layers is forced by §0.3 → §3.4 → §4.1 and §5.4 → §5.5).

## Not verifiable

- No Lean was elaborated (read-only pass): the comparison of signatures rests on the supplied
  elaborated types, and the repair text of S01 was checked by reading the pinned declarations, not
  by `#check`.
- That each named row of CH Tables 2–4 carries the weighted diagram DG gives to the orbit of that
  name (§3.5): not rechecked row by row in this pass.
- ReductiveGroups Layers 2, 5P, 6, 7, 9B, 9D, 10B: the sections exist on main with the cited
  subject; their hypotheses were not compared with each use in §§0.2, 0.3, 5.4.
- The numbering of the published versions of CH, DG and KIR; the README cites the versions read.

## Source issues

- **Misprint** in CH at Appendix, proof of Lemma 10.9, p.35 (CH lines 1720–1725): the source says the simple roots are `±ε₁+ε₂, ε₂−ε₃, …` and calls ascending positive odd coordinates dominant; it should be `±ε₁+ε₂, ε₃−ε₂, …, ε_n−ε_(n−1)` for ascending coordinates; affects nothing.
- **Misprint** in CH at Tables 2–4, pp.35–37 (CH line 1734): the source heads the columns as dimensions of the filtration steps; it should be dimensions of the graded pieces, the entries not being increasing; affects nothing.
- **Gap** in CH at Appendix, proof of Lemma 10.9, p.35 (CH lines 1731–1733): the source says the adjoint statement for `E₈` implies it for the Levi subalgebras `E₆`, `E₇`; it should be proved in each type, equality on a Levi summand controlling neither the rest nor Levi conjugacy; affects the proof.

## For the human reviewers

- **Licence.** `SOM` is a set of preliminary workshop notes of 2009 by one author, read from another mathematician's university page (`sources.toml`, `licence_class = "institutional"`); it is cited in §0.3 and §3.1, each time beside DG.
- **Scope.** `KIR` is cited from the lecture-notes draft on the author's page; `sources.toml` records that the published book (Cambridge University Press, 2008) was not collated.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "6b43ce839828b9e3f255c4620b8383253b496a12", "job": "RT-LieHighestWeightPartII~2b", "model": "fable", "worker": "chris-x14"} -->
