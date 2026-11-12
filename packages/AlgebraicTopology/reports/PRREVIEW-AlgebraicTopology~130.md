# Review of AlgebraicTopology (pull request #1807 at d1512f7)

**Verdict:** needs changes

## R01 (P2) — `IsCIso` and `IsCEpi` restate Mathlib's `isoModSerre` and `epiModSerre`, and §8.8d owns laws Mathlib proves

**Location.**

- `TauCetiRoadmap/AlgebraicTopology/Suggested.lean` 352–362 defines `IsCEpi` and `IsCIso`, and 394–395 states `hurewicz_isCIso` with them.
- README 4416–4420: "Own the C-isomorphism and C-epimorphism vocabulary, `IsCIso` (kernel and cokernel in C) and `IsCEpi` (cokernel in C) for a homomorphism of abelian groups, with its two-out-of-three laws".

**Claim.** Both definitions restate Mathlib definitions, and the README owns laws that Mathlib already proves.

**Witness.** Mathlib's `Abelian/SerreClass/MorphismProperty.lean` has `epiModSerre` (59), `isoModSerre` (66) and `isoModSerre.HasTwoOutOfThreeProperty` (161). On a scratch copy, `IsCEpi C f ↔ C.epiModSerre (AddCommGrpCat.ofHom f)` elaborates as `C.prop_iff_of_iso (AddCommGrpCat.cokernelIsoQuotient _).symm`; `IsCIso` likewise, with `kernelIsoKer`.

**Repair.**

- In `Suggested.lean`, delete `IsCEpi` and `IsCIso`. State the two conclusions of `hurewicz_isCIso` as `C.isoModSerre (AddCommGrpCat.ofHom (HomotopyGroup.hurewiczHom (X := X) (x := x) (ModuleCat.of ℤ ℤ) (n + 1)))` and `C.epiModSerre (AddCommGrpCat.ofHom (HomotopyGroup.hurewiczHom (X := X) (x := x) (ModuleCat.of ℤ ℤ) (n + 2)))`. This statement elaborated on a scratch copy, with only the `sorry` warning.
- In README §8.8d, replace "Own the C-isomorphism … two-out-of-three laws" with a citation of these Mathlib declarations and their file. Add them to the Serre-class bullet of the supplier contracts (lines 763–770).
- Keep the §8.8d Checks: the values they compute are unchanged (for example, ×2 on ℤ has kernel 0 and cokernel ℤ/2 in either formulation).

## R02 (P3) — The Serre spectral sequence is a headline, but the docstring neither states it nor names it as not statable

**Location.**

- `Suggested.lean` 34–35 lists among the headlines "the Künneth and Cartan–Leray spectral sequences", and 58–61 explains why those two are not statable.
- README Scope item 4 (lines 36–37) has "Cartan--Leray and Serre spectral sequences", and §5.5 (2391–2499) owns the homological and cohomological Serre sequences.

**Claim.** The Serre spectral sequences are a completion criterion of the roadmap, as the Cartan–Leray one is. The module docstring accounts for Künneth and Cartan–Leray but is silent on the Serre sequence. Nothing in the file states the Serre sequence, and the docstring does not say which carrier is missing.

**Witness.** The pins have `TauCeti.filteredSpaceSpectralSequence` (`Singular/FilteredSpace.lean`), but a fibre-homology local system, `TauCeti.fiberLocalSystem` (`Singular/Fibration/LocalSystem.lean` 102), only for a Hurewicz fibration with a lifting function; none for a Serre fibration.

**Repair.** Add the Serre spectral sequences to the docstring's "Not stated" paragraph and name the missing carrier: the fibre-homology local system of a Serre fibration, which the identification `E²_(p,q)=H_p(B;H_q(F))` of the native filtered-space sequence needs. Do not state a weakened substitute in its place.

## R03 (P3) — Owned theorems still without a locator (previous R06, partly repaired)

**Location.**

- README 1639–1645: "Own the one-sided extension of homotopy inverses to pairs (X,A),(X′,A′)… Use the relative mapping-cylinder/HEP construction".
- README 1741–1756: "Own the pair-quotient comparisons… H_n(X,B;M)≃H̃_n(X/B;M) and H^n(X,B;M)≃H̃^n(X/B;M)".
- README 4153–4156, `compactManifoldFiniteCWType` and `compactManifoldWithBoundaryFiniteCWType`, and `Suggested.lean` 281–283 ("GeometricTopology's smooth triangulation (Whitehead)").

**Claim.** Each of these is an owned theorem stated without a theorem number or page. The previous review asked for these locators, and it supplied them.

**Witness.** Read in the cached texts: 7.4.2 with its Addendum (brown lines 11027–11043, pp.285–286); the Proposition (vogt1972 line 28); Proposition 2.22 (hatcher line 5456, p.124); §3.1, Exercise 8(b) (hatcher line 8888, p.205); Cairns–Whitehead in GeometricTopology §11.3 on main.

**Repair.**

- **README 1639.** Cite Brown, *Topology and Groupoids*, 7.4.2 and its Addendum (pp.285–286), and Vogt 1972, Proposition. Then say in one sentence how the exact restriction H|A×I=H₀ follows. The Addendum extends only the track sum `K0+g0H0f0−g0f0K0`; Vogt's identity and Strøm's Theorem 6, which is already cited at line 1636, then make the restriction exactly H₀.
- **README 1741.** Cite Hatcher, Proposition 2.22 (p.124) for homology, and §3.1, Exercise 8(b) (p.205) for the cohomology form.
- **§8.7 and the two Lean docstrings.**
  - Cite GeometricTopology §11.3, the Cairns–Whitehead smooth triangulation, which that section sources to Whitehead, *On C¹-complexes* (1940).
  - Replace "GeometricTopology's smoothing-and-triangulation comparison item 1" at README 917–918 and 4147–4148 with "GeometricTopology §11.3". GeometricTopology README 776–778 maps that item to §11.3.

## R04 (P3) — §§8.1, 8.9 and 8.14 use the π₁-action and path transport on πₙ without citing the native ones (previous R08, partly repaired)

**Location.** README 4471–4481 (§8.9): "π₁Y acting trivially on π_nY … transport the based class from f(φ_e(v₀)) to the fixed y₀ along a specified path in Y. Prove choice independence using the trivial π₁ action on π_n". The same action is used in §8.14 (5111–5112) and §8.1 (3729).

**Claim.** The docstring half of the previous R08 is repaired. Its README half is not: the action and the transport are used as if they had no owner, and the supplier contracts do not name them.

**Witness.** Tau Ceti at the pin has:

- `TauCeti.homotopyGroupMulAction` and `TauCeti.homotopyGroupMulDistribMulAction` (`Topology/Homotopy/HomotopyGroup/FundamentalGroupAction.lean` 136, 166);
- `TauCeti.homotopyGroupTransportQuotient` (line 90 of the same file);
- `TauCeti.homotopyGroupEquivOfPath` (`BasepointChange.lean` 352).

A search of the README finds none of them.

**Repair.**

- Add these four declarations to the relative-homotopy bullet of the supplier contracts (lines 496–508).
- In §8.9, state the n-simple hypothesis as triviality of `TauCeti.homotopyGroupMulAction`, and take the based-class transport from `TauCeti.homotopyGroupEquivOfPath`.
- In §8.14, cite the same action for unbased classes.

## R05 (P3) — Process vocabulary and undefined abbreviations

**Location.**

- 3033 "These are AT constructions"; 3156 "This AT-owned comparison"; 3159 "smooth-to-AT"; 3163 "targets of this AT milestone".
- 3300 and 3347 "provider"; 5378 "lane"; 4102 "This is Layer 8.5 work, not an imported lemma"; 4817–4820 `M_AT(i)` and `c_AT`.
- "DG" and "GT" at 3088, 3121, 3153–3154, 3175, 3179, 3212, 3409 and 3419.
- The headings §8.14 and §8.15, "… acceptance applications", with the same word at 947, 991, 994, 5115, 5218 and 5411.

**Claim.** "Milestone", "acceptance", "work", "lane" and "provider" are process words. "AT", "DG" and "GT" are abbreviations that the README never defines. Headings should be named by their mathematics.

**Witness.** The house rules require a timeless README, standard vocabulary, and layers named by their mathematics. No other roadmap, on main or at an open head, cites the `acceptance-applications` anchors, so renaming the headings breaks nothing.

**Repair.**

- Write "this roadmap" or "§6.3" for "AT", and "DifferentialGeometry" and "GeometricTopology" in full.
- Write "Tau Ceti's native generator" for "provider", and "part" for "lane".
- Delete the sentence at 4102.
- Rename `M_AT(i)` and `c_AT` to `M(i)` and `c`.
- Retitle §8.14 "Finite-dimensional Whitehead, maps into one-homotopy-group targets, aspherical surfaces" and §8.15 "Free actions of finite groups", and replace "acceptance applications" elsewhere by "applications".

## Verified sound

### The previous review, finding by finding

Its findings were raised at 5d047eb. Since then main merged the Layer-form rewrite of this roadmap (#1652), and this head rebases on it.

- **R01: repaired.** The folder holds only `README.md`, `Suggested.lean`, `PROGRESS.md`, `STATUS.md` and `metadata.toml`. `TopologicalGroupFundamentalGroup` occurs nowhere in the README.
- **R02: repaired.** These are cited at README 369, 721–737, 750–753, 1055–1078, 2109–2127 and 2372–2399:
  - `FundamentalGroup.instCommGroup` and `cast_map_prod_mul`;
  - the four `CochainComplex` exhaustive-filtration declarations;
  - the `TauCeti.filteredSpace*` first page, differential and abutment;
  - `IsHurewiczFibration.mem_serreFibrations` and `isHurewiczFibration_restrict`.
- **R03: repaired, and generalised.** `poincareDuality_of_isFundamentalClass` states duality over every commutative ring for any fundamental class.
- **R04: repaired.** The theorem is deleted, and README 1606 cites `TauCeti.TopCat.isClosedEmbedding_of_isPushout`.
- **R05: repaired.**
  - Milnor is cited as "Theorem 3, p.276" and "Corollary 3".
  - "DG2.4" no longer appears.
  - SSAT 1.8 is cited only for the C-isomorphism clause, and Serre 1953 for all three clauses.
  - `finiteSourceMappingCWType` is described as the absolute form.
- **R06: partly repaired.** Locators were added for:
  - `ordinaryEMRepresentability` (Theorem 4.57, p.393);
  - `poincareDuality_*` (Theorem 3.30, p.241);
  - the LS bound (Hatcher §3.2, Exercise 2, p.229);
  - proper homotopy extension (FTW Theorem 1.6).

  Three items remain (this review's R03).
- **R07: repaired.** README 2984 now uses H(t,x)=(1−t)x+tx².
- **R08: partly repaired.** The docstring reason is corrected; the README half remains (this review's R04).
- **R09: repaired.**
  - Every declared definition has at least three Checks, and every section a `*Needs:*` line.
  - The process words "current", "when it lands" and "the earlier interface" are gone.
  - No missing-space slips remain (a regex search for `[a-z]Stage`, `Lemma[0-9]` and similar finds nothing).

### Gate, dependencies, build and names

**Gate.** The worker's gate at d1512f7 passes every check (`gate.md`). The pull request changes no file outside the folders it names: the `diff --stat` outside them is empty.

**Dependency check.**

```text
depcheck: 236 roadmaps, 2182 edges, 0 problem(s)
```

The suppliers are DifferentialGeometry Layers 2, 5.1, 9.3 and 10; GeometricTopology Layer 1, §1.5 and Layer 11; and UniversalCovers (`Completed/`). All are on main.

**Build.** `lake env lean` on `Suggested.lean` gives only the 20 `sorry` warnings.

**Signatures.** I compared all 33 elaborated signatures in `signatures.md` with their README statements. No binder is lost, and the generality matches. For example, `relativeHurewicz_bijective` carries `[SimplyConnectedSpace X.pair.snd]` and the path-component hypothesis `h₀`.

**Names.**

- I elaborated one scratch file with `#check @name` for all 396 backticked qualified names of the README, importing the 187 Tau Ceti modules that declare them. I left out Tau Ceti's `Topology/Algebra/Projectivization`, which clashes with Mathlib's, as README 879–881 says.
- The 83 identifiers that did not resolve are module paths, structure fields, or declarations whose namespace a second pass with namespace tracking resolved. Two examples: `TauCeti.MappingTorus.wangδ` in `Singular/MappingTorus`, and `TauCeti.IsLocallyCollared.isCollared` at `Geometry/Manifold/Boundary/Collar/Brown.lean` 459.
- Every module path cited exists. `citations.md`'s lead, `Singular.BrouwerFixedPoint`, is a module: `AlgebraicTopology/Singular/BrouwerFixedPoint.lean`.

**Padding probe.** I found nothing that closes in one tactic. No pinned declaration states any of the 20 theorems. I searched Tau Ceti for:

- general CW approximation;
- Serre-fibration relative bijections;
- homological Whitehead;
- finite CW type of manifolds;
- nerve K(G,1);
- Serre-class Hurewicz;
- free actions on spheres;
- CW type of mapping spaces.

The only definitions at the pins found to duplicate are those of R01.

### Overlaps and ownership

**Pull requests changing this roadmap.** #1808, #1854 and #1187 each change it. The description's merge-order block orders them: this pull request → #1808 → #1854 → #1187. `overlaps.md` reports no dropped or revision-only ids.

**Hurewicz modulo a class.**

- DGFloer on main owns it today (DGFloer README 659).
- DGFloer's revision #1798 repoints it to §8.8d (its README line 174), and the description names #1798.
- StableHomotopyKTheory (#1227, line 1401), AlgebraicTopologyPartII (#1694, line 13) and HomotopySpheres (#1287) still own or cite it elsewhere. This roadmap is on main, so those repairs belong to those pull requests.

**Projective spaces.** Mathlib at the pin has no `T2Space` instance in `Topology/Algebra/Projectivization.lean`, and Tau Ceti's `instT2Space` (line 188) is on its own copy of the topology. §4.6's ownership of Hausdorffness on Mathlib's instance is therefore correct.

**Board packages.** I did not search the board's other packages beyond the three in its index.

### Seeded source sample (15 targets): all verified, except 5.0's Weibel locators

Hatcher's printed page is the PDF page minus 9.

| Target | Locators checked (source line) | Result |
| --- | --- | --- |
| 1.3 | Hatcher Theorem 1.20, p.43 (1956). Tau Ceti's hypothesis `∀ i j, IsPathConnected (U i ∩ U j)` contains Hatcher's path-connected Aα at i=j. | verified |
| 2.3 | Hatcher p.117: the boundary of a relative cycle (5142). Triples p.118 (5186). Naturality p.127 (5560) and p.128 (5584). | verified |
| 2.6 | Hatcher §3.H p.333: the pair sequence, excision by subdivision, additivity and pullback homotopy invariance (14557–14573). | verified |
| 3.4 | Hatcher pp.149–150, Mayer–Vietoris from `C(A+B)` (6521–6527); §3.H p.333. | verified |
| 4.2 | Lemma 2.34, p.137 (5963); cellular boundary formula, p.140 (6086). | verified |
| 4.3 | Theorem 2.35, p.139 (6051); §3.H p.333, cellular homology with local coefficients (14572). | verified |
| 4.4 | Proposition 2.22, p.124 (5456); Proposition 3B.1, p.269 (11612); Theorem 3.11, p.210 (9099). | verified |
| 4.5 | Theorem 4.8, p.349 (15205); Proposition A.3, p.522 (22617); Proposition 0.19, p.16 (867); Theorem A.6, p.524 (22693); Strøm Theorem 6, p.135 (strom1972 181). Milnor *Morse Theory* is uncertified. | verified |
| 4.8 | Propositions A.14–A.16, pp.530–531 (23034, 23063, 23081: A.16 needs Y locally compact Hausdorff and Z Hausdorff); Appendix pp.523–524 (22666). | verified |
| 5.0 | Tau Ceti natives opened at the pin. Weibel 5.5.1 and 5.5.10 are uncertified. | natives verified |
| 5.2 | Example 2.48, p.151 (6588–6617): maps f,g, the long exact sequence with f∗−g∗, derived from q:(X×I,X×∂I)→(Z,Y). | verified |
| 5.4 | Theorem 3B.6, p.275 (11898, over a PID); Example 3.16, p.216 (9388, for any coefficient ring). | verified |
| 6.1 | §3.H pp.328–334 (14326, 14430–14470, 14589); Theorem 3.5, p.203 (8799); Proposition A.1, p.520 (22534). | verified |
| 6.4 | Hatcher p.235, "Z2 orientable" when 2=0 (10229); Theorem 3.26, p.236 (10237); Theorem 3.30, p.241 (10453); Theorem 3.43, p.254 (10976). | verified |
| 7.3 | §2.2 Exercises 20–22, p.157 (6854–6857); Theorem 2.44, p.146 (6380); Mayer–Vietoris p.149. | verified |

Locators of the headlines, also verified:

- Hatcher:
  - Proposition 4.13, Example 4.14 and Proposition 4.15, p.353;
  - 4.17–4.19, p.355;
  - 4.21, p.356;
  - 4.30–4.32, p.366;
  - 4.33, p.367;
  - 4.37, p.371;
  - 4.41, p.376;
  - 4.57, p.393;
  - Theorem 4.5 and Lemma 4.6, p.346;
  - Corollary 4.12, p.351;
  - §4.2 Exercises 13, 16 and 17 (p.390), 26 and 28 (p.391) and 34 (p.392);
  - Proposition A.11, p.528.
- SSAT:
  - Theorem 1.3, p.8 (hatcher-ssat 433);
  - Theorem 1.8, p.14 (849), for the classes FG, T_P and F_P (819–825);
  - the joint proof, p.16 (904);
  - the local-coefficient remark, p.17 (992).
- KMR Theorem A, p.2 (kmr2023 48).
- Milnor 1959, Theorem 3 and Corollary 3, p.276 (milnor1959 209, 218).
- VBKT:
  - Proposition 1.20, p.36 (hatcher-vbkt 1445);
  - Lemma 3.18, p.100 (3881);
  - Proposition 3.19, p.101 (3908).
- Stacks:
  - 08NZ, Lemma 14.31.6 (stacks-simplicial 2740);
  - 0H7Z, Lemma 15.65.4 (stacks-more-algebra 7399), for objects of D^b(R), as the README says.
- FTW:
  - Theorem 1.6 (ftw1973 134);
  - Theorem 4.2 (600);
  - Lemma 4.3 (610);
  - Corollary 4.9 (752).
- Moore, exposé 18: Théorèmes 3, 4 and 5 and Définition 4 (moore1955 139, 188, 239, 244).
- May, Theorem 14.1 (may1967 1578). The cache now has the OCR text, so this is readable for the first time.

### Adversarial table

| Statement | Instances tried | Values computed (left / right) | Result | Change |
| --- | --- | --- | --- | --- |
| 1.3 van Kampen | two open arcs of S¹ | the intersection has 2 components, so the free product of trivial groups is 1 while π₁ = ℤ | the pairwise hypothesis is needed | none |
| 2.6 twisted triple | sign system u=−1, (S¹,{p},∅) | ∂(cσ)=(u−1)c=−2c, so H₀=ℤ/2; ignoring transport gives ℤ | holds | none |
| 3.4 Mayer–Vietoris | two arcs | (a,b)↦(a+b,−a−b); kernel ℤ(1,−1) = H₁(S¹) | holds | none |
| 4.2/4.3 cellular | RP² over ℤ; a point rel ∅ | d₂=2, d₁=0: H₁=ℤ/2, H₂=0; M in degree 0 | holds | none |
| 4.4 native cube quotient | frame at −e_last; A=(x_n,−x₀,…) | det(−e_n,e₀…e_(n−1)) = (−1)^(n+1) = det A; n=1 counterclockwise +1; n=2 native −1 corrected to +1 | holds | none |
| 4.5 relative CW pushout | S⁰→pt; degree-m 2-cell | S¹ with χ=1−1=0; m=0 gives H₂(S¹∨S²)=ℤ; m=2 gives H₁(RP²)=ℤ/2 | holds | none |
| 4.8 k-coreflection | Sierpiński; S⁰∧S¹ | k keeps the 3 opens, not T2; S¹ | holds | none |
| 5.0 regrading | homological (p,q) | (a,b)=(1−2p−q,p−1): a+b=−(p+q), F_(b+1)=F_p; decreasing (2p+q+1,−p−1) gives F^p | consistent | none |
| 5.0 Check | C₁=C₀=ℤ, ×2 | E²: ℤ/2 in degree 0 and 0 in degree 1, equal to H₀ and H₁ | holds | none |
| 5.2 Wang | reflection; z↦z²; constant g | H₁ = ℤ/2⊕ℤ / ℤ (with H₂=0) / ℤ; the `id+g_*` model gives ℤ and ℤ/3 | holds | none |
| 5.4 torus | diag(2,1); swap | det 2 = permanent 2; det −1, permanent 1 | holds | none |
| 6.1 direct cochains | u=2 over ℤ/5 | backward transport gives 3a−a=2a; forward gives a | discriminating | none |
| 6.2 compact support | x↦x², x³; H=(1−t)x+tx² | degrees 0 and 1; H⁻¹(0) ⊇ {(t,−(1−t)/t)}, unbounded | holds (R07 fixed) | none |
| `poincareDuality_of_isFundamentalClass` | S¹ over ℤ with μ and 2μ; two points | ℤ≅ℤ; ×2, and 2μ not fundamental; (u₁,u₂) units are bijective, (1,0) is not fundamental | holds | none |
| `poincareDuality_twoTorsionCoefficients` | RP² over 𝔽₂; over ℤ/4 | Betti 1,1,1 match; H₂(ℤ/4)={0,2} with local image 2 not a unit, while H⁰=ℤ/4 | 2=0 is needed | none |
| `exists_cwApproximation` | ∅; Warsaw circle; ℚ | ∅; a point; ℚ discrete (one 0-cell per path component) | holds | none |
| `relHomotopyGroup_map_bijective_of_mem_serreFibrations` | ℝ→S¹ at n=0 and n=1; [0,1]→S¹ | ℤ↔ℤ; 0↔0; 2 elements vs ℤ | the fibration hypothesis is needed | none |
| `lsCupLength_add_one_le_categoryCount` | point; T² over ℤ; ∅ | 1≤1; 3≤count; on ∅ the count is 0 | Nonempty is needed | none |
| `productBallImages_intersect` | p=0; p=q=0 | g₂ fixing S_q hits z, else a retraction; one point | holds | none |
| `finsum_finrank_singularHomology_fiberBundle` | Klein bottle; S³→S² | over 𝔽₂ 1−2+1=0 and over ℚ 1−1+0=0, both equal 0·0; 1−1=0=2·0 | holds | none |
| `hurewicz_bijective` | S², n=0 | π₂=ℤ→H₂=ℤ | holds | none |
| `relativeHurewicz_bijective` | (D³,S²), n=1; (D²,S¹∨S¹) | π₃(D³,S²)=ℤ→ℤ; F₂ vs ℤ², excluded since π₁(A)≠1 | holds | none |
| `homologicalWhitehead` | Poincaré sphere → S³ | a homology isomorphism with π₁ of order 120 | simple connectivity is needed | none |
| `nonempty_homotopyEquiv_sphere_of_homologySphere` | n=0; n=1 | the hypotheses give a contractible space, but S⁰ has 2 points; at n=1 they are contradictory | n≥2 is needed | none |
| `compactManifoldFiniteCWType` | S²; discrete ℕ | finite; H₀ has infinite rank, so not finite type | holds | locator (R03) |
| `finiteSourceMappingCWType` | X=∅; βℕ→S⁰ | a point; discrete with 2^ℵ₀ 0-cells | holds | none |
| `groupClassifyingSpace_isEMOne` | 1; ℤ; S₃ | a point; S¹; π₁ of order 6, nonabelian | holds | none |
| `hurewicz_isCIso` | C=0, n=0, X=S²; C torsion, n=1, X=S³ | H₁=0, h₂ iso, h₃:ℤ→0 onto; H₁=H₂=0, h₃ iso, h₄:ℤ/2→0 C-epi | holds | carriers (R01) |
| `IsCIso` against `isoModSerre` | C torsion, f = ×2 on ℤ | kernel 0 and cokernel ℤ/2 on both sides; the equivalence is a one-term proof | duplicate | R01 |
| `SatisfiesSerreAxioms` | zero class; torsion class; degree 0 | H̃(pt)=0; H_(2k−1)(K(ℤ/m,1))=ℤ/m; H₀=ℤ is not torsion | discriminating | none |
| `ordinaryEMRepresentability` | S¹ with winding e; K=S²; Warsaw-circle source | the degree map onto ℤ; [S³,S²]=ℤ vs H²(S³)=0; q:W→S¹ is essential while H¹(W)=0 | the hypotheses are needed | none |
| `HasProperHomotopyExtensionProperty` | ∅; (I,{0}); (I,{0,1,1/2,…}) | holds; holds by the piecewise K; fails, since no retraction I²→I×0∪A×I exists (Hatcher p.14) | discriminating | none |
| `properStrongDeformationRetract_of_inverse` | A=X; ([0,∞),{0}) | r=id; the constant inverse is not proper | holds | none |
| `exists_transverse_circle_classifying_map` | M=∅; dim M=0; M=S¹ with id | the empty map; f≡−1 avoids 1; 1 is a regular value | holds | none |
| `elementaryAbelianPair_sphere_action_has_stabilizer` | S⁰; S¹; Sⁿ with n≥2 | p²≥4 > 2 points; a free quotient would have cyclic group; dim H^(n+1)(B(C_p²);𝔽_p)=n+2 > 1 | holds | none |
| §8.8d power-torsion axiom | A=⊕ℤ/d | finite subgroups of order dⁱ with i unbounded; the uniform exponent comes from Prüfer + Künneth | holds | none |
| §8.16 essential map | Hopf p; constant p | not nullhomotopic; constant is not Serre | holds | none |
| R02: Serre SS | S¹×S²→S² vs Hopf | equal E² pages; H₂ = ℤ vs 0 | README fine | docstring (R02) |
| R03: pair-quotient | (D¹,S⁰); B=∅ | H₁=ℤ=H̃₁(S¹); H_n(X)=H̃_n(X₊) | holds | locator |
| R03: one-sided inverse | A=X; A=∅ | g=g₀ and H=H₀; a plain inverse | holds | locator |
| R04: obstruction transport | Y=S²⊔{∗} | π₂(Y,∗)=0 while the sphere class is 1 | the README Check holds | cite natives |

## Not verifiable

- These are uncertified in the manifest, so I took their locators as given:
  - Weibel 5.5.1 and 5.5.10;
  - tom Dieck 9.5.1;
  - Serre 1953, Chapter III, Theorem 1;
  - Milnor, *Morse Theory*, Lemmas 3.6–3.7;
  - Lee, Theorems 6.26, 6.30, 6.35 and 6.36;
  - Thom 1954, Chapter II;
  - Freedman–Quinn §7.7;
  - Dowker 1952.
- These have no manifest key and no cached text, so I did not check them:
  - Conway–Friedl–Herrmann, *Linking forms revisited*: Proposition 1.2 and Lemmas 2.5–2.6, cited for §6.5's lens-space self-linking −q/5;
  - Eilenberg–Steenrod;
  - G. W. Whitehead;
  - Dold;
  - McCleary;
  - K. Brown, *Cohomology of Groups*;
  - Serre 1951.

  I did not list them in `needs-references.toml`, because no locator in this review's sample depends on them.
- I checked ownership against the open pull requests whose files the brief gives, and the three board packages in its index, and nothing more.

## Source issues

- **Misprint** in milnor1959 at the proof of Corollary 3, p.276: the proof (read from the OCR text, line 221) invokes Theorem 4, but the paper numbers only Theorems 1–3; it should be Theorem 3; affects nothing.
