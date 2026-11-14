Verdict: design
Name: FinitenessAndDualityOfGroups
Base: none
Owner: none

## Scope

The roadmap develops the homological finiteness and dimension theory of discrete groups: the types
`FP_n`, `FP_∞`, `FP` and `FL`, cohomological, homological and geometric dimension, the virtual
notions, duality and Poincaré duality groups, Euler characteristics, and Farrell cohomology. Unless
a statement says otherwise, the group is an arbitrary group `G`, the coefficients are an arbitrary
commutative ring `R`, modules are Mathlib's `Rep R G` (equivalently modules over
`MonoidAlgebra R G`), and `R = ℤ` is an instance, not the setting. The roadmap is new, not a Part
II: no roadmap on main, in an open roadmap pull request or on the board owns any of these objects
(see the report), and the nearest one, the board design CohomologyOfGroups, excludes them by name
and lists this roadmap as its consumer.

**Organisation.** The layers are what the final targets need, worked backwards:
finiteness types (needed by every later layer) → dimension (uses the types for `cd = hd` and for
`FP` as `FP_∞` with finite `cd`) →
geometric dimension (needs dimension) → virtual notions (need Serre's theorem from dimension) →
duality (needs types and dimension) → Euler characteristics (need types and virtual notions) →
Farrell cohomology (needs virtual dimension). The designer derives the final arrangement and
names the layers by their mathematics; no source's chapter order is followed.

**Owned here.**
- The finiteness types over `R`, defined on the pinned module-level notions: `G` is of type `FP_n`
  over `R` when the trivial module is `n`-pseudocoherent over the group ring (pinned
  `TauCeti.Huber.IsPseudoCoherentOver`, stated for any `Ring`), of type `FP` when it has a finite
  resolution by finitely generated projectives (pinned `TauCeti.Module.IsFPD`), of type `FL` with
  free modules. The roadmap owns the group-theoretic content: low degrees, Brown's criterion,
  inheritance.
- `cd_R`, `hd_R` (valued in `ℕ∞` through pinned `TauCeti.leastENatBound`), geometric dimension,
  `vcd`, the virtual types.
- Duality and Poincaré duality groups over `R`, dualizing module, orientation character, the
  criterion, inheritance.
- The Hattori–Stallings rank *of group rings* (the conjugacy-class description), the rational form
  of Swan's theorem it needs, the Euler characteristic and the equivariant Euler characteristic of
  a group acting on an acyclic complex.
- Complete resolutions and Farrell cohomology of groups of finite `vcd`, with coefficients in
  `Rep R G`.

**Boundaries (imported by name and section, never re-planned).**
- *CohomologyOfGroups* (board design, `packages/CohomologyOfGroups/design/README.md`, merge order
  before this roadmap) owns conjugation and Shapiro-type operations (Layer 1), hypercohomology
  (Layer 2), trees, amalgams and HNN extensions with their Mayer–Vietoris sequences (§§3.5–3.6),
  cup and cap products and the evaluation pairing (§§4.1–4.6), agreement with the Tate cup product
  (§4.7), the Künneth theorem (§5.1), the Hochschild–Serre spectral sequence (§§6.2–6.7), the
  double coset formula and stable elements (§§7.1–7.2), Tate duality and periodicity (Layer 8),
  and the continuous cohomology of a discrete group (§1.5). Its Scope says that finiteness
  conditions, `cd`, `vcd`, duality groups, Euler characteristics and Farrell cohomology are not
  planned there, and its Downstream consumers paragraph names this roadmap.
- *Mathlib* owns the carriers `groupCohomology`, `groupHomology`, `tateCohomology`, the
  comparisons `groupCohomologyIsoExt` and `groupHomologyIsoTor`, Shapiro's lemma
  (`groupCohomology.coindIso`, `groupHomology.indIso`), projective dimension
  (`HasProjectiveDimensionLE`, `projectiveDimension`) and `Group.IsFinitelyPresented`.
- *Pinned Tau Ceti* owns pseudocoherence with its two-out-of-three lemmas
  (`TauCeti.Huber.IsPseudoCoherentOver`), finite projective dimension
  (`TauCeti.Module.IsFPD`, `TauCeti.Module.isFPD_iff_hasProjectiveDimensionLE`), complete
  resolutions in an exact category with the comparison theorem
  (`TauCeti.ExactStructure.CompleteResolution.homotopyEquiv`), totally acyclic complexes of
  *finitely generated* projectives (`CochainComplex.IsTotallyAcyclic`), cellular resolutions of
  aspherical CW complexes (`TauCeti.cellularResolutionOfIsAspherical`), half of the directed-union
  statement for group homology (`TauCeti.groupHomology.isZero_groupHomology_of_directed`), the
  vanishing of characters of projective modules over a local ring at `p`-singular elements
  (`TauCeti.trace_ofModule'_eq_zero_of_dvd_orderOf`) and the detection of projective
  `ℤ_p[G]`-modules by their rationalisations
  (`TauCeti.nonempty_linearEquiv_of_projective_of_tensorRat`).
- *Profinite dimension theory* is ProfiniteCohomology Layer 11's, with the pinned
  `TauCeti.cohomologicalDimension` (continuous cohomology with discrete torsion coefficients). The
  invariant of this roadmap takes a different name and is compared with it for a discrete group
  (target 2.6); no second profinite theory is built.
- *Gorenstein homological algebra* (GorensteinHomologicalAlgebra, open pull request #323) owns
  general totally acyclic complexes (its Layer 0), Gorenstein projective modules (Layer 1) and
  Gorenstein dimensions (Layer 5), and excludes complete cohomology of groups; Farrell cohomology
  is owned here.
- *Topology* is consumed: ClassifyingSpaces (Stage 4 items 16–17 on main; Layer 2, item 2.3, in
  open pull request #1807) for `K(G, 1)` models and their (co)homology with local coefficients;
  AlgebraicTopology §6.4 (twisted Poincaré–Lefschetz duality), §§8.3–8.5 (Hurewicz, Whitehead)
  and §8.7 (CW type of smooth manifolds).
- *Instances owned elsewhere*, compared and not restated: ArithmeticKTheory §3.2 (open pull
  request #1418) owns the Borel–Serre duality of torsion-free finite-index subgroups of
  `Aut(P)` with the Steinberg dualizing module; FuchsianOrbifolds Layer 5 item 6 owns the orbifold
  Euler characteristic of a Fuchsian group by its signature; BianchiModularForms §9.3 owns the
  orbifold Euler characteristic of Bianchi congruence groups; BordismFormalGroups owns a
  Brown–Farrell complete resolution for the profinite Morava stabilizer groups, a continuous
  theory distinct from the discrete one here.

**Non-goals.** The dimension theory of profinite groups (ProfiniteCohomology Layer 11). Stallings'
theorem on ends and the Stallings–Swan theorem that `cd = 1` forces freeness (and hence the
classification of duality groups of dimension one, Bieri–Eckmann 1973 Proposition 5.1), until a
roadmap supplies ends of groups. Bestvina–Brady groups and other separations of the types, in
particular a group of type `FP_2` that is not finitely presented. The Eilenberg–Ganea problem in
dimension two. `L²`-invariants. Brown's theorem on the `p`-fractional part of `χ` and the
comparison of the naive (Hattori–Stallings) Euler characteristic with the rational one beyond type
`FL` (the Bass conjecture). Arithmetic groups beyond the stated Checks (ArithmeticLocallySymmetricSpaces
and its Part II own the Borel–Serre theory). Bieri–Neumann–Strebel invariants.

## Final targets

Locators: `Serre1971Bourbaki`, `BieriEckmann1973`, `BieriEckmann1974`, `Brown1974` and `Brown1975`
are certified open texts and are cited by line; `Bieri1981` is settled as waived and cited by its
locator; `Serre1971Prospects`, `EilenbergGanea1957`, `Wall1961`, `Farrell1977` and `BrownGTM87`
are paywalled and cited by locator only (`uncertified`). `BrownGTM87` is a coverage checklist,
never an outline.

### 1. Finiteness types

1.1 **Definitions and implications.** For `n ∈ ℕ∞`, type `FP_n` over `R` (`FP_∞` at `n = ⊤`),
type `FP` and type `FL` as in Scope. Prove `FL ⇒ FP ⇒ FP_∞ ⇒ FP_n ⇒ FP_m` for `m ≤ n`; type
`FP_n` over `ℤ` gives type `FP_n` over every `R` by base change of the resolution.

1.2 **Low degrees.** Every group is of type `FP_0`. For `R ≠ 0`, `G` is of type `FP_1` over `R`
if and only if `G` is finitely generated (the augmentation ideal is finitely generated exactly
then; `BieriEckmann1974` line 294). A finitely presented group (`Group.IsFinitelyPresented`) is
of type `FP_2` over every `R`, through the cellular chains of the presentation complex (pinned
`TauCeti.PresentationComplex`) or the relation module. (`BrownGTM87` §VIII.5.)

1.3 **Brown's criterion.** For `n ∈ ℕ`, the following are equivalent (`Brown1975` lines 83–101,
Theorem 2, for complexes of projectives over any ring, applied to a projective resolution of the
trivial module over `MonoidAlgebra R G`; the product form is `BieriEckmann1974` line 135,
Proposition 1.2): (a) `G` is of type `FP_n` over `R`; (b) for every directed system `(M_i)` of
`RG`-modules the natural map `colim_i Hᵏ(G, M_i) → Hᵏ(G, colim_i M_i)` is bijective for `k < n`
and injective for `k = n`; (c) for every directed system with zero colimit, `colim_i Hᵏ(G, M_i) = 0`
for `k ≤ n`; (d) for every family `(N_j)` the natural map `H_k(G, ∏_j N_j) → ∏_j H_k(G, N_j)` is
bijective for `k < n` and surjective for `k = n`; (e) the same for every product of copies of
`RG`. The `FP_∞` form is `Brown1975` line 189, Theorem 3. The exact degree bounds are part of the
statement.

1.4 **Inheritance.** (a) For `H ≤ G` of finite index, `G` is of type `FP_n` over `R` if and only
if `H` is; types `FP` and `FL` pass to finite-index subgroups (`BrownGTM87` §VIII.5).
(b) If `N ◁ G` and `N`, `G/N` are of type `FP_n` over `R`, so is `G` (`Bieri1981`); over `ℤ`
the classes `FP_∞` and `FP` are extension closed (`BieriEckmann1974` line 298, Proposition
3.3(a)). (c) If `A`, `B`
are of type `FP_n` and `C` of type `FP_{n−1}`, then `A ∗_C B` is of type `FP_n`, and likewise for
HNN extensions (`Bieri1981`, by its locator; from the tree sequence of CohomologyOfGroups §3.5
and the pinned two-out-of-three lemmas for pseudocoherence).

1.5 **Checks.** Over `ℤ` a finite group is of type `FP_∞`; over a field in which `|G|` is
invertible a finite group is of type `FP`. `ℤⁿ` and finitely generated free groups are of type
`FL`. `ℚ` (additive) and an infinitely generated free group are not of type `FP_1`.

### 2. Dimension

2.1 **Definitions.** `cd_R G` is the least `n` with `Hᵏ(G, M) = 0` for all `k > n` and all
`M : Rep R G` (`Serre1971Bourbaki` lines 40–42), `hd_R G` the same with homology. Prove
`cd_R G ≤ n` if and only if the trivial module has projective dimension at most `n` over
`MonoidAlgebra R G` (Mathlib `HasProjectiveDimensionLE` through `groupCohomologyIsoExt`), and the
flat-dimension analogue for `hd_R`. The universe of the coefficient modules is fixed once and
shown not to change the value.

2.2 **Comparison of `cd` and `hd`, and type `FP`.** `hd_R G ≤ cd_R G`; if `G` is countable then
`cd_R G ≤ hd_R G + 1` (`Bieri1981`, by its locator); if `G` is of type `FP` over `R` then
`cd_R G = hd_R G` (`BieriEckmann1973` line 604, Corollary 4.3, over `ℤ`). `G` is of type `FP`
over `R` exactly when it is of type `FP_∞` and `cd_R G < ∞` (`BieriEckmann1974` line 288,
Proposition 3.2, over `ℤ`).

2.3 **Behaviour.** For `H ≤ G`, `cd_R H ≤ cd_R G` and `hd_R H ≤ hd_R G` (Shapiro). For
`N ◁ G`, `cd_R G ≤ cd_R N + cd_R (G/N)` and likewise for `hd` (CohomologyOfGroups §§6.2–6.3). For
a directed union `G = ⋃ G_i`, `hd_R G = sup_i hd_R G_i`; if moreover the union is countable,
`cd_R G ≤ sup_i cd_R G_i + 1` (`Bieri1981`). For an amalgam, `cd_R (A ∗_C B) ≤ max(cd_R A,
cd_R B, cd_R C + 1)`, and the HNN analogue (CohomologyOfGroups §3.6).

2.4 **Torsion.** For a finite group `H` and `R ≠ 0`, `cd_R H = 0` if `|H|` is a unit of `R` and
`cd_R H = ∞` otherwise. Hence a finite subgroup of a group of finite `cd_R` has order invertible in
`R`; over `ℤ`, a group of finite cohomological dimension is torsion-free (`Brown1974` lines
354–358). For `R ≠ 0`, `cd_R G = 0` exactly when `G` is finite of order invertible in `R`.

2.5 **Serre's theorem.** If `G` is torsion-free and `H ≤ G` has finite index, then
`cd_ℤ G = cd_ℤ H` (`Serre1971Prospects` n°1.7, Théorème 1, as cited at `Brown1974` line 354 and
`BieriEckmann1973` line 396; `BrownGTM87` §VIII.3). A form over a general `R` is stated only if
the designer finds it in a readable source.

2.6 **Comparison with the profinite invariant.** For `G` with the discrete topology, the pinned
`TauCeti.cohomologicalDimension G` is at most `cd_ℤ G` (CohomologyOfGroups §1.5 identifies the
continuous cohomology of a discrete group with Mathlib's).

2.7 **Checks.** `cd ℤⁿ = hd ℤⁿ = n`; a nontrivial free group has `cd = 1`; `cd_ℚ` of a finite
group is `0`; a nontrivial finite group is not of type `FP` over `ℤ`; `hd_ℤ ℚ = 1` and
`cd_ℤ ℚ ≤ 2`, from 2.3, for the additive rationals.

### 3. Geometric dimension

3.1 **Definition.** `gd G` is the least `n` such that some Hausdorff CW complex of dimension at
most `n` is a `K(G, 1)` (`⊤` if none; a `K(G, 1)` always exists at the pin).

3.2 **`cd ≤ gd`.** `cd_ℤ G ≤ gd G`, through the cellular resolution of the universal cover
(pinned `TauCeti.cellularResolutionOfIsAspherical`; ClassifyingSpaces Stage 4 item 16). A `K(G, 1)`
with finitely many cells (in each dimension up to `n`) makes `G` of type `FL` (of type `FP_n`)
over every `R` (`Serre1971Bourbaki` lines 55–58; `BrownGTM87` §VIII.7).

3.3 **Eilenberg–Ganea.** `gd G ≤ max(3, cd_ℤ G)`; hence `gd G = cd_ℤ G` whenever `cd_ℤ G ≥ 3`
(`EilenbergGanea1957`, main theorem; `BrownGTM87` §VIII.7). The construction (making the top
projective free by adding a free module, realising it by cells with the Hurewicz theorem in degree
`n − 1 ≥ 2`, Whitehead's theorem) consumes AlgebraicTopology §§8.3–8.5 and the pinned cell
attachment of ClassifyingSpaces item 8.

3.4 **Checks.** `gd ℤⁿ = n` (the torus); `gd F = 1` for a nontrivial free group (pinned wedge of
circles); `gd G = ∞` for a nontrivial finite group; `gd G = 0` exactly for the trivial group.

### 4. Virtual notions

4.1 **Virtual cohomological dimension.** `vcd G` is the infimum of `cd_ℤ H` over finite-index
subgroups `H`; if some finite-index `H` has `cd_ℤ H < ∞`, then `vcd G = cd_ℤ H'` for every
torsion-free finite-index `H'` (from 2.4 and 2.5; `Serre1971Bourbaki` lines 77–86; `Brown1974`
lines 352–358).

4.2 **Virtual types.** `G` is virtually of type `FP` (`FL`) if a finite-index subgroup is. For `G`
of finite `vcd`: `G` is virtually `FP` if and only if `G` is of type `FP_∞`, and then every
torsion-free finite-index subgroup is of type `FP` (`Brown1974` lines 359–362). Groups of *finite
homological type* (`vcd < ∞` and every torsion-free finite-index subgroup has finitely generated
integral homology; `Brown1974` line 367) are closed under passing to and from finite-index
subgroups (`Brown1974` line 382, Proposition 1).

4.3 **Behaviour.** `vcd H ≤ vcd G` for `H ≤ G`, with equality at finite index; for an extension
with `G` virtually torsion-free, `vcd G ≤ vcd N + vcd (G/N)`.

4.4 **Checks.** `vcd` of a finite group is `0`; `vcd (ℤ/2 × ℤⁿ) = n`; `vcd SL₂(ℤ) = 1`.

### 5. Duality

5.1 **Definition.** `G` is a duality group of dimension `n` over `R` if there are an `RG`-module
`D` and `e ∈ H_n(G, D)` such that cap product with `e` (CohomologyOfGroups §4.6) is an isomorphism
`Hᵏ(G, M) ≅ H_{n−k}(G, D ⊗_R M)` for every `k` and every `M`, with the diagonal action and
`H_j = 0` for `j < 0` (`BieriEckmann1973` line 116, Definition 1.1, over `ℤ`; `Bieri1981` over
`R`). Left and right module conventions are fixed once (`BieriEckmann1973` lines 122–135).

5.2 **Consequences.** For such `G`: `D ≅ Hⁿ(G, RG)` (`BieriEckmann1974` lines 148–150,
Proposition 2.1(i)); `Hᵏ(G, RG) = 0` for `k ≠ n`; `cd_R G = n`; `G` is of type `FP` over `R`
(`Brown1975` line 205, Corollary 1 of Theorem 3, over `ℤ`); `G` is finitely generated
(`BieriEckmann1973` line 624, Theorem 4.6).

5.3 **The criterion.** `G` is a duality group of dimension `n` over `R` if and only if `G` is of
type `FP` over `R`, `Hᵏ(G, RG) = 0` for `k ≠ n`, and `Hⁿ(G, RG)` is flat as an `R`-module
(`Bieri1981`; over `ℤ`, where flat means torsion-free, `BieriEckmann1973` line 612, Theorem 4.5,
with 5.2 for the converse). The finiteness-free criterion `BieriEckmann1973` line 317,
Theorem 2.3, is stated alongside.

5.4 **Poincaré duality groups.** A duality group whose dualizing module is isomorphic to `R` as an
`R`-module; its orientation character `w : G → Rˣ` is the action on `D`, and the duality reads
`Hᵏ(G, M) ≅ H_{n−k}(G, R_w ⊗_R M)` (`BieriEckmann1974` lines 253–257, over `ℤ`). Over `ℤ`: every
Poincaré duality group is of type `FP` (`BieriEckmann1974` line 270, Theorem 3.1); isomorphisms of
the stated shape, not assumed natural or given by cap product, already make `G` a Poincaré duality
group (`BieriEckmann1974` line 327, Theorem 3.4).

5.5 **Inheritance.** A finite-index subgroup of a duality group of dimension `n` is one, with the
same dualizing module and the restricted fundamental class (`BieriEckmann1973` line 383, Theorem
3.2); over `ℤ`, a torsion-free group with a finite-index duality subgroup is a duality group
(line 388, Theorem 3.3); an extension of duality groups of dimensions `n` and `m` is a duality
group of dimension `n + m` with `D_G ≅ D_{G/N} ⊗ D_N` (line 468, Theorem 3.5). The forms over
`R` follow `Bieri1981`.

5.6 **Checks.** `ℤⁿ` is an orientable Poincaré duality group of dimension `n` over every `R`; a
free group of finite rank `r ≥ 1` is a duality group of dimension `1`, Poincaré exactly when
`r = 1`; a finite group is a Poincaré duality group of dimension `0` over `R` exactly when `|G|`
is a unit of `R`; the fundamental group of a closed orientable surface of genus `g ≥ 1`, and of a
closed aspherical manifold, is a Poincaré duality group whose orientation character is that of
the manifold, once ClassifyingSpaces and AlgebraicTopology §6.4 supply the manifold as a
`K(G, 1)` with twisted duality (`Serre1971Bourbaki` lines 63–67). The Steinberg duality of
ArithmeticKTheory §3.2 is compared, not restated.

### 6. Euler characteristics

6.1 **Hattori–Stallings rank of group rings.** For a finitely generated projective
`RG`-module `P`, the rank `r_P` is the finitely supported function on conjugacy classes of `G`
obtained from the Hattori–Stallings trace of EtaleCohomologyFoundations §F.10.3 through
`RG / [RG, RG] ≅ ⊕_{[g]} R`. Prove additivity, `r_{RG} = δ_{[1]}`, compatibility with base change
in `R`, with induction, and with restriction to a finite-index subgroup `H`
(`r_{Res P}(1) = [G : H] · r_P(1)`) (`BrownGTM87` §IX.2).

6.2 **Swan's theorem, rational form.** For a finite group `G` and a finitely generated projective
`ℤG`-module `P`, `r_P(g) = 0` for `g ≠ 1`, equivalently `ℚ ⊗ P` is a free `ℚG`-module
(`Brown1974` lines 169–172), and `𝔽_p ⊗ P` is free over `𝔽_p G` for every prime `p` (the
refinement used at `Brown1974` lines 1311–1320, here derived from the pinned trace vanishing and
the pinned detection of projective `ℤ_p[G]`-modules by their rationalisations).

6.3 **Euler characteristic.** For `G` with `H_*(G, ℚ)` of finite total dimension,
`χ(G) = Σ (−1)ⁱ dim_ℚ Hᵢ(G, ℚ)` (`Brown1974` lines 386–387). For `G` of type `FP` over `ℤ` the
naive characteristic `χ̃(G) = Σ (−1)ⁱ r_{Pᵢ}(1)` is independent of the resolution and
multiplies by the index on finite-index subgroups; for type `FL`, `χ = χ̃ = Σ (−1)ⁱ rank Fᵢ`.
If `cd_ℤ G < ∞` and `N ◁ G` has finite index with `H_*(N, ℤ)` finitely generated, then
`χ(N) = [G : N] · χ(G)` (`Brown1974` line 388, Theorem 3, through line 125, Theorem 1, which
rests on 6.2).

6.4 **Groups with torsion.** For `G` of finite homological type (4.2), `χ(G) = χ(H) / [G : H]`
for any torsion-free finite-index `H`, independent of `H` (`Brown1974` lines 411–424); it agrees
with Serre's and Wall's rational Euler characteristic of a group with a finite-index subgroup of
type `FL` (`Serre1971Bourbaki` lines 77–86; `Wall1961`; `Serre1971Prospects` n°1.8), and
`χ(H) = [G : H] · χ(G)` for every finite-index `H`.

6.5 **Extensions.** If `N` and `G/N` are virtually of type `FP` and `G` is virtually
torsion-free, then `G` is virtually of type `FP` and `χ(G) = χ(N) · χ(G/N)` (`Brown1974` lines
452–463, Corollary 2, through line 448, Corollary 1, and Appendix A, line 1284, Theorem 7).

6.6 **Actions on acyclic complexes and amalgams.** If `G` has finite homological type and acts on
an acyclic simplicial complex with finitely many simplices modulo `G` and every simplex stabilizer
of finite homological type, then `χ(G) = Σ_σ (−1)^{dim σ} χ(G_σ)` over representatives of the
simplices modulo `G`, the equivariant Euler characteristic (`Brown1974` lines 465–479;
`Serre1971Prospects` n°1.8, Proposition 14(b)). Instances, for amalgams and HNN extensions of
finite homological type whose factors and edge group have finite homological type:
`χ(A ∗_C B) = χ(A) + χ(B) − χ(C)` and `χ(A ∗_C) = χ(A) − χ(C)`, via the Bass–Serre tree
(FreeGroupsAndLimitGroups §4.7).

6.7 **Denominators.** If `G` has finite homological type and the orders of its finite subgroups
have a least common multiple `m`, then `m · χ(G) ∈ ℤ`; equivalently, a prime power dividing the
denominator of `χ(G)` is the order of a subgroup of `G` (`Brown1974` lines 607–610, Corollary 1
of Theorem 5, line 603).

6.8 **Checks.** `χ(G) = 1/|G|` for a finite group; `χ(F_r) = 1 − r`; `χ(ℤⁿ) = 0` for `n ≥ 1`;
`χ(SL₂(ℤ)) = −1/12` (`Serre1971Bourbaki` line 214), from `SL₂(ℤ) ≅ ℤ/4 ∗_{ℤ/2} ℤ/6` and 6.6;
`χ(PSL₂(ℤ)) = −1/6`, equal to the orbifold value of FuchsianOrbifolds Layer 5 item 6.

### 7. Farrell cohomology

7.1 **Complete resolutions.** For `G` with `vcd G < ∞`, a complete resolution of the trivial
module over `RG` is an acyclic `ℤ`-indexed complex of projective `RG`-modules agreeing with a
projective resolution of the trivial module in all degrees above some `d`. Prove existence (one
agreeing above `vcd G`), and uniqueness up to a homotopy equivalence compatible with the
agreement, with `Hom_G(F, Q)` acyclic for every projective `Q` (`Farrell1977`; `BrownGTM87`
§X.2). The uniqueness consumes the pinned comparison theorem for complete resolutions, or
GorensteinHomologicalAlgebra Layer 0 if merged.

7.2 **Farrell cohomology.** `Ĥᵏ(G, M) = Hᵏ(Hom_G(F, M))` for `k ∈ ℤ` and `M : Rep R G`,
independent of `F` up to canonical isomorphism, functorial in `M` and contravariantly in
injective homomorphisms of finite-index image, with long exact sequences for short exact
sequences of coefficients and a cup product `Ĥⁱ(G, M) ⊗ Ĥʲ(G, N) → Ĥ^{i+j}(G, M ⊗ N)`
(`Farrell1977`; `BrownGTM87` Ch. X, §X.3).

7.3 **Agreement and vanishing.** (a) For finite `G`, `Ĥ*(G, M)` is Mathlib's `tateCohomology`,
compatibly with the long exact sequences and with the Tate cup product (pinned
`TauCeti.TateCohomology.cup`, CohomologyOfGroups §4.7(a)). (b) The natural map
`Hᵏ(G, M) → Ĥᵏ(G, M)` is an isomorphism for `k > vcd G` and surjective for `k = vcd G`.
(c) `Ĥ*(G, −) = 0` if and only if `cd_ℤ G < ∞`; in particular Farrell cohomology vanishes for a
torsion-free group of finite `vcd` (by 2.5). (`Farrell1977`; `BrownGTM87` §X.3.)

7.4 **Checks.** For `G = ℤ/2 × ℤ` (`vcd = 1`), `Ĥᵏ(G, ℤ) = Hᵏ(G, ℤ) ≅ ℤ/2` for `k ≥ 2`, by
7.3(b) and the Künneth theorem (CohomologyOfGroups §5.1). For `SL₂(ℤ)` (`vcd = 1`),
`Ĥᵏ(SL₂(ℤ), ℤ) = Hᵏ(SL₂(ℤ), ℤ)` for `k ≥ 2`, which is `ℤ/12` for even `k` and `0` for odd `k`,
by 7.3(b) and the Mayer–Vietoris sequence of `ℤ/4 ∗_{ℤ/2} ℤ/6` (CohomologyOfGroups §3.6), since
restriction from `ℤ/4` to `ℤ/2` is onto in even degrees. A torsion-free group of finite `vcd`
has `Ĥ* = 0`. The designer replaces any Check whose value it cannot derive or find in a readable
source.

## Suppliers

All on main or earlier in the merge order, except the two open pull requests named.
- **Mathlib** (pin): group (co)homology, Tate cohomology, `groupCohomologyIsoExt`,
  `groupHomologyIsoTor`, Shapiro, `HasProjectiveDimensionLE`/`projectiveDimension`,
  `Group.IsFinitelyPresented`, `Monoid.PushoutI`, `HNNExtension`.
- **Tau Ceti** (pin): the declarations listed under Boundaries.
- **CohomologyOfGroups** (board design, merge order position 318): §1.5; §§3.5–3.6; §§4.1–4.7;
  §5.1; §§6.2–6.7; §§7.1–7.2; Layer 8.
- **ClassifyingSpaces** (main): Stage 3 items 12–13 and Stage 4 items 16–17; the restated
  numbering of open pull request #1807 (Layers 1–2, local coefficients in item 2.3) if merged.
- **AlgebraicTopology** (main): §6.4, §§8.3–8.5, §8.7.
- **FreeGroupsAndLimitGroups** (main): Layer 4 (graphs of groups, §4.5 one-edge splittings as
  Mathlib's amalgams and HNN extensions, §4.7 Bass–Serre tree), §6.1 (surface groups).
- **EtaleCohomologyFoundations** (main, merge order position 44): §F.10.3, the Hattori–Stallings
  trace over any ring.
- **Completed LocalGaloisGroups** (main): the detection of projective `ℤ_p[G]`-modules, now pinned.
- **SchemeKTheoryOperations** §6.7 (merge order position 38): the homology of a directed union of
  subgroups as the colimit, for 2.3 (as CohomologyOfGroups records it).
- **GorensteinHomologicalAlgebra** (open pull request #323, not in the board's merge order):
  Layers 0, 1 and 5, optionally, for 7.1.
- **FuchsianOrbifolds** (main): Layer 5 item 6, for the Check of 6.8 only.

## Consumers

- **MotivicStructuresInModuliOfCurves** (board design, merge order position 349) §2.1, which
  bounds rational cohomology of `M_{g,n}` by Harer's virtual cohomological dimension and needs
  `vcd`, its independence of the subgroup and the vanishing above it, with no supplier today.
- **PosetHomotopyAndSubgroupComplexes** (open pull request #2296), which leaves Brown's
  `p`-fractional theorem to a roadmap with `vcd` and `χ`.
- Roadmaps that today sit *earlier* in the merge order and state instances, so they can consume
  this roadmap only in a Part II or a revision placed after it:
  - ArithmeticLocallySymmetricSpaces and its Part II: Borel–Serre duality, `vcd` and Euler
    characteristics of arithmetic groups.
  - ArithmeticKTheory §3.2: its duality API (orientation character, finite-index descent) is an
    instance of 5.4–5.5.
  - BianchiModularForms §9.3: orbifold Euler characteristics.
  - MappingClassGroupsAndCanonicalRepresentations, FuchsianOrbifoldsPartII and the moduli
    roadmaps: `vcd` and `χ` of their groups.
- FuchsianOrbifolds is a supplier of one Check here (6.8), so it is not a consumer.

The merge order should place this roadmap after CohomologyOfGroups and before
MotivicStructuresInModuliOfCurves.

## Sources

Recorded in `packages/FinitenessAndDualityOfGroups/sources.toml`.
- `Serre1971Bourbaki` — J.-P. Serre, *Cohomologie des groupes discrets*, Séminaire Bourbaki exposé
  399 (1970/71). Open (Numdam). §1, lines 26–86; §3, line 214.
- `BieriEckmann1973` — R. Bieri, B. Eckmann, *Groups with homological duality generalizing
  Poincaré duality*, Invent. Math. 20 (1973). Open (GDZ). Definition 1.1, Theorems 2.3, 3.2, 3.3,
  3.5, 4.5, 4.6, Corollary 4.3.
- `BieriEckmann1974` — R. Bieri, B. Eckmann, *Finiteness properties of duality groups*, Comment.
  Math. Helv. 49 (1974). Open (GDZ). Propositions 1.2, 2.1, 3.2, 3.3; Theorems 3.1, 3.4.
- `Brown1974` — K. S. Brown, *Euler characteristics of discrete groups and G-spaces*, Invent. Math.
  27 (1974). Open (GDZ). §§1, 3–6 and Appendix A.
- `Brown1975` — K. S. Brown, *Homological criteria for finiteness*, Comment. Math. Helv. 50
  (1975). Open (GDZ). Theorems 1–3 and their corollaries.
- `Bieri1981` — R. Bieri, *Homological Dimension of Discrete Groups*, 2nd ed., 1981. Settled as
  waived: cited by its locator (duality over a commutative ring, amalgams, countable groups).
- `Serre1971Prospects` — J.-P. Serre, *Cohomologie des groupes discrets*, in Prospects in
  Mathematics, Ann. of Math. Studies 70 (1971). Paywalled; `uncertified`; n°1.7 Théorème 1, n°1.8.
- `EilenbergGanea1957` — S. Eilenberg, T. Ganea, Ann. of Math. 65 (1957). JSTOR; `uncertified`;
  main theorem.
- `Wall1961` — C. T. C. Wall, *Rational Euler characteristics*, Proc. Cambridge Philos. Soc. 57
  (1961). Paywalled; `uncertified`.
- `Farrell1977` — F. T. Farrell, *An extension of Tate cohomology to a class of infinite groups*,
  J. Pure Appl. Algebra 10 (1977). Publisher host on the paywalled list; `uncertified`.
- `BrownGTM87` — K. S. Brown, *Cohomology of Groups*, GTM 87 (1982). Paywalled; `uncertified`;
  coverage checklist (Ch. VIII §§2–11, Ch. IX §§2, 6–7, 9, Ch. X §§2–3), never an outline.

## Risks

- **Over a general `R`.** The `R`-forms of 1.4(c), 2.2, 2.3 (countable unions), 5.1, 5.3 and
  5.5 rest on `Bieri1981`, which is waived: it is cited by locator and the designer must write
  the proofs from the `ℤ` arguments of `BieriEckmann1973` and `BieriEckmann1974`, which carry over
  with "flat" for "torsion-free". Where a step does not carry over, the statement is kept over `ℤ`
  and the gap is reported, never weakened silently.
- **Topology for Layer 3.** Eilenberg–Ganea needs cell attachment along wedges of spheres, the
  Hurewicz theorem for the universal cover of a skeleton and Whitehead's theorem. These are pinned
  or planned in ClassifyingSpaces and AlgebraicTopology Stage 8, but only for spaces in `Type`,
  so `gd` is defined for groups in `Type`. The manifold Checks of 5.6 wait on a supplier of closed
  surfaces and closed aspherical manifolds as CW `K(G, 1)`s.
- **Complete resolutions.** The pinned totally acyclic complexes require finitely generated terms,
  which complete resolutions of infinite groups do not have; GorensteinHomologicalAlgebra #323 is
  an open pull request outside the board's merge order. The fallback is the pinned exact-category
  comparison theorem, applied in the Frobenius category of `RG`-modules projective over a
  torsion-free finite-index subgroup with split sequences there.
- **Swan's theorem.** 6.3–6.7 need the rational and mod-`p` forms of 6.2, which are not stated in
  any roadmap; the route through the pinned trace vanishing and `ℤ_p`-detection is short but is
  owned here.
- **`SL₂(ℤ)` as an amalgam.** No roadmap owns `SL₂(ℤ) ≅ ℤ/4 ∗_{ℤ/2} ℤ/6`; FourManifolds §6.3
  (open pull request #936) uses it. The Checks of 4.4, 6.8 and 7.4 that use it either prove it
  from the action on the Bass–Serre tree (FreeGroupsAndLimitGroups §4.8) or are replaced.
- **Naming.** Tau Ceti already has `TauCeti.cohomologicalDimension` for the profinite theory; the
  discrete invariant needs a distinct name and the comparison 2.6.
- **Paywalled theorems.** Serre's theorem (2.5), Eilenberg–Ganea (3.3), Wall's characteristic
  (6.4) and Farrell's construction (7.1–7.3) are cited by locator only; their statements are
  standard and their proofs are short enough to write without the text, but no line locator can
  be checked against them.
