# Review of ReductiveGroups (pull request #1332 at 9d43baa)

**Verdict:** needs changes

This is a full review of `TauCetiRoadmap/ReductiveGroups/README.md` (4859 lines) and `TauCetiRoadmap/ReductiveGroups/Suggested.lean` (488 lines: 20 declarations, 14 `sorry`'d theorems) at `9d43baa`. The pins are those of the branch's `lake-manifest.json`: Tau Ceti `a91d3aaf`, Mathlib `6b7abb3c`.

The gate, the dependency check and the build pass. The seeded sample verifies against the texts. The repairs of R02–R06 are correct. I found three defects, two P2 and one P3:
- §11A now owns Artin's theorem, but an open roadmap still proves it as its own target.
- §11D and §6A consume LieGroups, which consumes this roadmap.
- The supplier-contract section omits six consumed roadmaps.

## R01 (P2) — Two owners of the plane configuration spaces and Artin's theorem: §11A and InverseGaloisAndArithmeticFundamentalGroups IG.5.1

**Location.** `README.md:4347–4350`: "Construct injective ordered complex tuples, their permutation quotient, the disc comparison, and the finite covering and braid/permutation maps … These supply the plane configuration interface used by arithmetic fundamental-group applications". Also `README.md:4361` and `Suggested.lean:435` (`BraidMonodromy.nonempty_mulEquiv_braidGroup`).

**Claim.** §11A is the single owner of `PConf_n(ℂ)`, `Conf_n(ℂ)` and their disc versions, of `π₁(Conf_n) ≃ TauCeti.BraidGroup n`, and of the cover/`permHom`/`pureSubgroup` identification. The arithmetic applications consume them.

**Witness.** Open #850 (head `9432671`), `InverseGaloisAndArithmeticFundamentalGroups/README.md:5462–5467`, has its own target with its own proof route (Ellenberg–Venkatesh–Westerland §2.1): "`Conf_n(𝔻)` is aspherical with fundamental group … `TauCeti.BraidGroup n`". Its *Needs:* cite no ReductiveGroups section. Main's §11A (`README.md:1971–1973`) consumed IG.5.1.

**Why this roadmap stays the owner.** Main's §11A consumed an open pull request, which a roadmap on main may not do. This head correctly stops doing so. ReductiveGroups is on main, so it is earlier than every open roadmap. GeometricTopology on main already consumes §11A for these spaces (`GeometricTopology/README.md:724–730`). The repair therefore moves the citation onto IG, not the other way.

**Repair.**
- In this folder, add a sentence to `## Scope and ownership`. It should say that §11A owns:
  - the topological ordered and unordered configuration spaces of the plane and of the open disc;
  - the equivariant disc homeomorphism of `README.md:4381`;
  - `π₁(Conf_n(ℂ)) ≃ TauCeti.BraidGroup n`;
  - the `permHom`/`pureSubgroup` cover identification.

  It should also name InverseGaloisAndArithmeticFundamentalGroups IG.5.1 as a consumer of these.
- Outside this folder, make a companion change on #850, named in this pull request's merge-order paragraph:
  - IG.5.1's paragraph *Configurations and punctured-disc groups* cites ReductiveGroups §11A for the fundamental group and the cover identification;
  - IG keeps as its own asphericity, the punctured-disc free groups, the algebraic configuration schemes over ℤ and the Hausdorff-`T` definition.

**Tested.** The disc map `z↦z/sqrt(1+|z|²)` is an `S_n`-equivariant homeomorphism `ℂⁿ→𝔻ⁿ` that preserves injectivity. It therefore induces `Conf_n(ℂ)≃Conf_n(𝔻)` and carries Artin's theorem to IG's disc statement. At `n=2` both sides are `ℤ`. At `n=0,1` both are trivial, and `TauCeti.BraidGroup 0 = BraidGroup 1 = ArtinGroup (CoxeterMatrix.A 0)` holds by `rfl` (scratch probe).

## R02 (P2) — ReductiveGroups and LieGroups cite each other: §11D consumes LieGroups Layer 8, and §6A consumes Layer 7

**Location.**
- `README.md:4610–4612`: "Consume the actual flag CW structure with only even real-dimensional cells from [LieGroups Layer 8] … Prove connectedness and `π₁(G/T)=0` through that bundle and the based LES."
- `README.md:1674–1676`: "use LieGroups Layer 7 only for the already reductive factor's compact real form".
- `README.md:4708–4709` (§11G): "Layer 7 and LieGroups Layer 8 flag cells → homogeneous-fiber connectedness".

**Claim.** Supply runs in one direction, from this roadmap's suppliers to this roadmap.

**Witness.** On main, `RepresentationTheory/LieGroups/README.md:1427–1431` says that LieGroups Layer 7 uses "ReductiveGroups Layers 0–4, 6 and 7C". Its Layer 8 "applies the single-owner generic Bruhat theorem of ReductiveGroups Layer 7". So ReductiveGroups §7.3 → LieGroups 8 → ReductiveGroups §11D: the two roadmaps cite each other.

The dependency check does not report this, because it does not read these two sentences as edges (repair report H06). No other supplier cites this roadmap back. I grepped LieHighestWeight, SchemeAndStackFoundations, ModularCurves, SmoothBundlesConnections, AlgebraicTopology, DGFloer, GroebnerGeometry, ReflectionInvariantTheory, IntegralLattices and InductionRestriction, and RootSystems names it only as a consumer.

**Repair.** Move the consumed result down into this roadmap.
1. In §11D, replace the LieGroups Layer 8 input with a target proved here: `G(ℂ)/B(ℂ)` is connected and simply connected.
   - Route: §7C's open big cell `U⁻B⁺/B⁺ ≃ ℂ^|Φ⁺|` is contractible.
   - Its complement is the finite union of the lower Bruhat cells of §7.3 (`≃ℂ^ℓ(w)`, `ℓ(w)<|Φ⁺|`), of real codimension ≥ 2.
   - The complement of a closed finite union of submanifolds of codimension ≥ 2 in a connected manifold is connected, and its inclusion is surjective on `π₁`. State this lemma as a §11D target with its hypotheses and a locator, or cite its owner.
   - The existing `G/T→G/B` bundle with fibre `U≃ℂ^|Φ⁺|` then gives `π₁(G/T)=0`.
2. Delete "LieGroups Layer 8" from §11G.
3. In §6A, rewrite the compact-real-form sentence as §3A.6 already does (`README.md:1110–1115`): comparing with the compact real form is LieGroups Layer 7's application to this section's output, and this section does not consume it.

**Tested.**
- `SL₂`: `G/B=ℙ¹(ℂ)=ℂ∪{∞}`. The big cell `ℂ` is contractible and the complement is one point, of real codimension 2, so `π₁(ℙ¹)=1`, as §11D's `SL₂` Check (`README.md:4636`) requires.
- `GL₃`: the big cell is `ℂ³`, and the lower cells have complex dimensions 0, 1, 1, 2, 2.
- The §6A Levi theorem (`LeviComplements.exists_levi_complement`) is stated over any characteristic-zero field and does not use a compact form.

## R03 (P3) — `## Exact supplier contracts` omits six roadmaps that the layers consume

**Location.** `README.md:104–419`. The `### From TauCetiRoadmap.<X>` subsections are SchemeAndStackFoundations, ModularCurves, RootSystems and SmoothBundlesConnections only.

**Claim.** Every consumed roadmap has its contract, by section, in this section.

**Witness.** The following are consumed in the layers with no contract subsection:
- LieHighestWeight Layers 3–4 and 7 (lines 2881, 3362, 4560);
- ReflectionInvariantTheory §§1, 3 (line 4567);
- AlgebraicTopology Stages 1, 4 (line 4458);
- DGFloer Layer 1.2 (line 4618);
- GroebnerGeometry G5 (line 4216);
- InductionRestriction Layer 2.1 (lines 2433–2437).

All six exist on main.

**Repair.** Add one `### From TauCetiRoadmap.<X>` subsection for each of these six. Each should name the sections consumed and what is assumed of them. For example: ReflectionInvariantTheory §1 (finite-group invariant algebra) and §3 (real reflection invariants, Jacobian and discriminant, degree-one central invariants), consumed complexified in §11C. If R02 is repaired, LieGroups needs no subsection.

**Tested.** I resolved each cited section on main (`3090489`):
- LieHighestWeight Layers 3 (405), 4 (537) and 7 (931);
- ReflectionInvariantTheory §1 (line 7) and §3 (line 40);
- AlgebraicTopology Stages 1 (289) and 4 (499);
- DGFloer Layer 1 item 2 (470; based fibration sequence at 503);
- GroebnerGeometry G5 (394);
- InductionRestriction Layer 2.1 (346).

## Previous findings (review of `e08161d`)

| Previous | Status at `9d43baa` | Evidence |
|---|---|---|
| R01 (P2), Lang's theorem with two owners on main | Settled, not re-raised | `README.md:1970`: "This layer owns Lang surjectivity for smooth geometrically connected finite-type groups". The repair report (H01) answers that the in-folder half is done and the rest is a companion change on ReductiveGroupsPartII. The reason is correct: ownership cannot move to PartII, because PartII consumes ReductiveGroups Layers 0, 2–7 and 9. No open pull request revises PartII. See *Not verifiable*. |
| R02 (P2), Artin and Brieskorn statable but absent | Repaired | `Suggested.lean:435` `nonempty_mulEquiv_braidGroup` and `:479` `nonempty_mulEquiv_artinGroup`, with §§11A–11B (`README.md:4356–4367`, `4470–4488`) and the module docstring (lines 27–30, 83–86). Using the native `DistribMulAction P.Aut M` instead of the proposed `compHom` is correct: the orbit relation's action is `P.reflection` by `rfl` (scratch probe). |
| R03 (P3), `exists_closed_orbit` padding | Repaired | The declaration is deleted. `README.md:907–909`: "Existence of a closed orbit on every such X with X(k) nonempty is `AlgebraicOrbits.exists_closed_orbit_in_closure` at any rational point". |
| R04 (P3), `orbit_locallyClosed` overhypothesised | Repaired, and goes further | `Suggested.lean:139–141` keeps only finite type of `G` and `X`. Dropping `IsAlgClosed` matches Milne 2017 1.65(b), whose proof reduces to `k^a` through the quotient map `|Y_{k^a}|→|Y|` (iAG2017 lines 1485–1488, p. 27). Dropping `IsAffine` from the two 1.66 theorems matches "group variety", a smooth algebraic group with no affineness (iAG2017 line 673). |
| R05 (P3), Layer 3 old → new rows | Repaired | `README.md:433–436`. |
| R06 (P3), four supplier citations without section | Repaired | Lines 1090–1092, 1102–1103, 1110–1115 and 4566–4570. The §3A.6 U(n) sentence was changed from consuming LieGroups to a consumer remark. That is right: consuming it would have closed a loop. |
| R07 (P3), description order | Settled, not re-raised | The repair report (H07) answers that the description is pull-request text outside the folder. That reason is correct. See *Not verifiable*. |

## Verified sound

### Gate, dependency check, build, signatures

- **Gate** (my run): `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`. The worker's gate at this head adds `build=0`.
- **Dependency check:** `depcheck: 235 roadmaps, 2262 edges, 0 problem(s)`. No UPWARD, CYCLE or `moved:` line; R02 is an edge it does not read.
- **Outside the folder:** `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/ReductiveGroups'` is empty. In the folder, seven `*Targets.lean` helper files are deleted.
- **Build:** `lake env lean TauCetiRoadmap/ReductiveGroups/Suggested.lean` exits 0. It prints exactly 14 `declaration uses 'sorry'` warnings, at lines 138, 147, 159, 194, 206, 221, 245, 273, 289, 310, 404, 435, 442 and 479, and nothing else.
- **`#check @` pass on all 20 declarations** (scratch copy). Each elaborated type equals its README statement, and none lost a binder:
  - `orbit_locallyClosed`: `[LocallyOfFiniteType G.hom] [QuasiCompact G.hom] [LocallyOfFiniteType X.hom] [QuasiCompact X.hom]` only;
  - the two 1.66 theorems: `IsAlgClosed k`, `Smooth G.hom`, `QuasiCompact G.hom`, finite type and `IsSeparated` on `X`;
  - `nonempty_mulEquiv_artinGroup`: `Finite Λ`, `TopologicalSpace M`, `IsModuleTopology ℂ M`, `FiniteDimensional ℂ M`, `IsCrystallographic`, `IsReduced`;
  - the two configuration definitions take only `n`, and the two arrangement definitions only the module binders.

  The worker's `signatures.md` failed to elaborate 22 names; this pass replaces it.
- **Probes** (all elaborate):
  - `(⟨Equiv.reflection P i, _⟩ : P.weylGroup) • v = P.reflection i v` holds by `rfl`, and `MulAction.orbitRel P.weylGroup M` relates `P.reflection i v` and `v`;
  - `TauCeti.BraidGroup 0` and `BraidGroup 1` are `ArtinGroup (CoxeterMatrix.A 0)`, and `BraidGroup 2` is `ArtinGroup (CoxeterMatrix.A 1)`, all by `rfl`.
- **One-tactic probe:** each of the 14 `sorry`s was replaced by `first | rfl | trivial | infer_instance | decide | (simp; done) | (aesop; done) | sorry`. None closes. `simp` hits the heartbeat limit on `exists_conjugate_eq_of_isMaximalTorus`. No padding.

### Headlines

The README and the module docstring name:
- the three orbit theorems, compactness of proper complex points, char-0 reductive ⇔ linearly reductive, and Nagata;
- the Mostow Levi complement in Hopf coordinates, Borel conjugacy, torus conjugacy and Lang;
- integral PBW, Artin, braid nonsplitting and Brieskorn.

All 14 are stated. The docstring names the missing carrier for each unstated endpoint:
- the signed ADE cover and folding (§9A.1a–b);
- the pinned integral model, the relative §8.2 and the §6B affine quotient;
- §7.2 parabolic Levi, §7.3 Bruhat and §§7c–7e Harish–Chandra;
- §9C, §10 and spectral monodromy;
- the §3A.5 chart comparison and the generator-characterized §§11A–11B isomorphisms.

### Seeded sample (all verified in the texts)

Milne 2017 is read in the author-page `iAG2017` copy, where the printed page is the PDF page − 12.
- **0.1:** 3.5, p. 66 (line 3053): `Δf(g₁,g₂)=f(g₁g₂)`, `εf=f(e)`, `Sf(g)=f(g⁻¹)`.
- **0.2:** Proposition 3.6, p. 66 (line 3063) and Corollary 3.7, p. 67 (line 3074).
- **0.3:** Definition 5.65 and Proposition 5.68, p. 116 (lines 4989, 5007).
- **1.0a, 1.0b:** Remark 4.1, p. 84 (line 3765: representations ↔ comodules) and Theorem 4.9, p. 87 (line 3906).
- **2.1:** 10.28–10.29, p. 195 (lines 8143, 8160); 10.23, p. 193 (line 8076); 10.14, p. 190 (line 7961); 1.37, p. 18 (line 1115).
- **3.2:** Proposition 1.34, pp. 16–17 (line 1070). Proposition 2.37 (line 2493, p. 51) gives the universal property, the exact sequence, base change, order = number of geometric components, and products. Definition 2.38 is on p. 52.
- **4.1:** Theorem 9.11, p. 168 (line 7065, over a perfect field); 9.18, p. 170 (line 7194); 9.19–9.21, p. 171.
- **4.3:** Definitions 12.14 and 12.17 (p. 236), Theorem 12.9 (p. 233), Theorem 12.23 and Corollary 12.25 (p. 240).
- **5.1:** 14.3 (p. 280), 14.5 (p. 281), 14.6, 14.7, 14.9 (p. 282), 14.12 (p. 283), 14.18 (p. 284), 16.30 (p. 334).
- **6.1:** 19.1 (p. 397), 19.2 and 19.5 (p. 398), 19.10 and 19.13 (p. 400).
- **6.2:** Definition 12.52 and Remark 12.53 (p. 248). The footnote to 12.54 (line 10309, p. 248) gives insensitivity to field extension. Remark 12.56 (line 10330, p. 249) needs the README's correction for non-smooth groups (see *Source issues*). Theorem 22.42 and Proposition 22.41 are on p. 477.
- **7.1:** Corollary 17.3 and Definition 17.6 (p. 353); 17.9 and 17.10 (p. 354); Corollary 1.39 (p. 18: `G_red` is a subgroup over perfect `k`); 21.32 (p. 434); 21.80 (p. 450).
- **8.1:** 23.25 (p. 492), Remark 23.26 (p. 493), 23.55 (p. 501). `conrad-rgs` 6.1.16–6.1.17 are on pp. 196–197 (lines 8159, 8173).
- **11.0:** `sga1` XII Théorème et définition 1.1, pp. 239–240 (lines 9399–9411: completed local rings are isomorphic).
- **New locators:**
  - Milne 1.65(b) and *Orbits*, pp. 26–27 (lines 1461–1503); 1.66, pp. 27–28 (lines 1504–1514).
  - `brieskorn` Proposition 1, p. 25 (line 98; the exposé runs pp. 21–44, line 8).
  - `fox-neuwirth` §6 (p. 122, lines 142–152) and §7 (pp. 122–126, lines 153–218).
  - Lang 17.96–17.98, p. 383 (line 15752): the source's map is `g F(g)⁻¹`, and the README states the conversion.

### Library declarations opened at the pins

- **Mathlib:**
  - `arrowAction` (`Algebra/Group/Action/Basic.lean:100`: `(g•F) a = F (g⁻¹•a)`);
  - `DistribMulAction P.Aut M` and `reflection_smul` (`RootSystem/Hom.lean:723, 731`);
  - `weylGroup` (`WeylGroup.lean:55`), `weylGroupRootRep` (`:189`), `weylGroupCorootRep` (`:193`, a `W.op`-representation);
  - `coroot'` (`Defs.lean:184`), `restrictScalarsRat` (`BaseChange.lean:132`);
  - `IsModuleTopology` (`ModuleTopology.lean:133`), `fundamentalGroupToMulOpposite` (`Homotopy/Lifting.lean:627`).
- **Tau Ceti:**
  - `BraidGroup` (`Braid/Basic.lean:97`: `ArtinGroup (CoxeterMatrix.A (n - 1))`), `pureSubgroup` (`:394`);
  - `ArtinGroup` (`Coxeter/Artin.lean:121`), `ArtinGroup.exponentSum` (`:226`), `ArtinGroup.toCoxeterGroup` (`:273`);
  - `coxeterMatrixOfBase` (`Coxeter/Matrix.lean:278`, entries `coxeterOrder` of Cartan products);
  - `rootPairingBaseChange` (`RootSystem/BaseChange.lean:124`), `IntegralLattice.integralForm` (`IntegralLattice/Basic.lean`).
- No configuration-space or hyperplane-complement carrier exists at either pin. No native sign/exponent-sum lemma makes `permutation_extension_nonsplit` immediate. Loogle and LeanSearch give no same-statement hit for any declaration.

### Cross-roadmap citations resolved on main (`3090489`)

- SchemeAndStackFoundations §0.3 (line 551, relative Proj and `O(1)`), §0.7 (755) and §2.6 (3437: `projectiveSpace_cohomology` with `Sym^d` in degree 0; finiteness on a proper Noetherian base).
- LieGroups Layer 7 bullets *Representations and holomorphic descent* (1013) and *Compact-real-form pairs and algebraic morphisms* (1031).
- ReflectionInvariantTheory §1 (7) and §3 (40).
- SmoothBundlesConnections B1.0, B1.1, B1.4 (221, 315, 421).
- GeometricTopology's contract on §11A (724–730), whose items all remain in this §11A (strands, stacking, `permHom`, `pureSubgroup`, exact sequence, half-twist convention).
- The worker's 24 "found nowhere" Lean names are this file's own declarations, plus the InductionRestriction Layer 2.1 target `Gassmann.almostConjugate_iff_permutation_equiv`.

### Ownership against open pull requests

- Brieskorn's theorem has no other owner (grep over main and 458 heads). Its only other statements are in sibling revisions of this roadmap (#1676, #1797).
- Configuration spaces: R01.
- FlagVarieties (#2114) is a consumer: it declares `gap:borel-conjugacy-connected`, which `BorelTori.exists_conjugate_eq_of_isBorelOverAlgClosed` meets.
- GroupSchemesOverABase (#1522), ClassicalGroupsPartII (#1492), SchubertGeometry (#1224) and RootSystemsPartII (#1731) claim no orbit, Nagata, Lang, Mostow or Brieskorn theorem.

### Adversarial pass

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 0.1 convolution | constant S₃; 𝔾ₘ at 2/ℚ; zero algebra | (12)(23)=(123), (23)(12)=(132); t↦2, t⁻¹↦1/2; one hom with 0=1 | holds | none |
| 0.2 three models | SL₂ with I+E₁₂, I+E₂₁; 𝔾ₐ over k[ε]; trivial group | product [[2,1],[1,1]], reversed [[1,1],[1,2]]; t↦ε survives; one point | holds | none |
| 0.3 base change | μ₂ to 𝔽₂ and ℚ; αₚ over 𝔽ₚ(s)⊂K | (t−1)², dimension 2; ℚ×ℚ; dimension p on both sides | holds | none |
| 1.0a comodules | 𝔾ₘ weight 3 at a=2; weights 1 and 2; αₚ↦[[1,a],[0,1]] | 8 (dual 1/8); 2·4=8; faithful in GL₂ | holds | none |
| 1.0b Tannakian | reconstructed point t↦2 on weight 3; unit object | acts by 8; acts by 1 | holds | none |
| 2.1 Lie | SL₂; Frobenius on 𝔾ₘ in char p | [E₁₂,E₂₁]=diag(1,−1); d(tᵖ)=0, dim Lie μₚ=1 vs dim μₚ=0 | holds | none |
| 3.2 G°, π₀ | 𝔾ₘ; S₃; μ₂/𝔽₂, /𝔽₃; μ₃/ℝ; αₚ×ℤ/2 over 𝔽ₚ(s) | degree 1; degree 6; connected vs étale degree 2; degree 3 with one real point; G°=αₚ (degree p), π₀=ℤ/2 | holds | none |
| 4.1 Jordan | [[2,1],[0,2]]/ℚ; I+E₁₂ in char 2 | g_s=2I, g_u=[[1,1/2],[0,1]], product g; g²=I yet g_s=I | holds | none |
| 4.3 lattices | 𝔾ₘ; real norm-one torus; μₚ; 𝔾ₐ | ⟨3,−2⟩=−6; X^Γ=0 with rank 1; X=ℤ/p, X_*=0; X=0 but dimension 1 | holds | none |
| 5.1 unipotence | 𝔾ₐ→U₂; μₚ tautological; 𝔾ₘ; SL₂ standard | (tE₁₂)²=0; v⊗t=v⊗1 only for v=0; invariants 0; invariants 0 | holds | none |
| 6.1 radicals | 𝔾ₐ; 𝔾ₘ; SL₂ in char 2 | dims (1,1); (1,0); centre k[t]/((t−1)²), length 2, tangent dimension 1 | holds | none |
| 6.2 complete reducibility | 𝔾ₘ projection; 𝔾ₐ on k²; Sym² of SL₂ in char 2 | proj(xx⁻¹)=1 vs 0; e₂+ae₁↦e₂+(a+t)e₁; lift gains t x²+b t² x², never identically 0 | holds | none |
| 7.1 conjugacy | GL₂ upper/lower; SL₂/ℝ diagonal vs SO₂; μₚ×𝔾ₘ | w[[a,b],[0,d]]w⁻¹=[[d,0],[b,a]]; real vs non-real eigenvalues; Hom(𝔾ₘ,μₚ)=0 gives a unique torus | holds | none |
| 8.1 classification | rank 1 vs rank 0 root-free; SL₂/PGL₂; diag(2,1) | dims 1, 0; root 2ϖ vs primitive; I+aE₁₂↦I+2aE₁₂ | holds | none |
| 11.0 cotangent | 𝔾ₘ quotient rule; u=2t; 𝔾ₐ | D(t⁻¹)=−1; 2·(1/2)=1; [t]↦[t], [t²]=0 | holds | none |
| `orbit_locallyClosed` (any k) | μ₃ on 𝔸¹/ℝ at 1; μₚ on 𝔸¹/𝔽ₚ(s) at s; trivial αₚ; 𝔾ₘ on the doubled-origin line; constant ℤ on 𝔸¹/ℚ | V(t³−1)={(t−1),(t²+t+1)}, closed; V((t−s)ᵖ), one point; one point; 𝔾ₘ open; integers dense and not open | holds; ℤ excluded by `QuasiCompact G.hom` | none |
| `boundary_dimension_lt` | E on E; 𝔾ₘ on ℙ¹ at [1:1]; 𝔾ₘ⋊ℤ/2 on ℙ¹; 𝔾ₘ on Spec k[x,ε]/(ε²) at x=1 | ⊥<1; 0<1; 0<1 and ⊥<0 at 0; boundary {0}: 0<1 | holds | none |
| `exists_closed_orbit_in_closure` | SL₂ on 𝔸² at (1,0); 𝔾ₐ on 𝔸² by (x+ty,y) at (0,1); E on E | {0}⊂𝔸²; the line y=1 is closed; E | holds | none |
| `compact_complexPoints` | ℙ¹; 𝔸¹; Spec ℂ[ε]/(ε²); ∅ | compact; excluded (n↦∞); one point; compact | holds | none |
| `reductive_iff_linearlyReductive` | trivial; 𝔾ₐ; SL₂ in char 0; 𝔾ₘ | T↔T; F↔F (ke₁ has no complement); T↔T; T↔T | holds | none |
| `linearlyReductive_iff_torus` | μₚ; ℤ/ℓ; norm-one torus /𝔽ₚ; SL₂ in char p; Res_{K/k}𝔾ₘ with K/k purely inseparable | excluded (not smooth); excluded (ℓ components); T↔T; F↔F; F↔F (geometric unipotent kernel) | holds | none |
| `exists_levi_complement` | 𝔾ₘ⋉𝔾ₐ; reductive G; G=𝔾ₐ | coinvariants k[t^±], J=(x): identity; J=0 bijective; J=(x), k→k (J=0 fails) | holds | none |
| Borel conjugacy | GL₂; ℤ/2; μₚ; SL₂/ℝ | w and wt; g=1; g=1; predicate false | holds | none |
| torus conjugacy | SL₂/ℝ; μₚ×𝔾ₘ; GL₂ T vs uTu⁻¹ | excluded; unique torus; g=u | holds | none |
| `lang_surjective` | 𝔾ₘ/𝔽₃; 𝔾ₐ/𝔽₂; K = algebraic closure of 𝔽_q(t); C₂; K=k | i²=−1 is hit; a²−a=1 for a∈𝔽₄∖𝔽₂; x^q−x=t has a root; Lang value constant 1 (excluded); x^q−x=0 (excluded) | holds | none |
| `integral_pbw` | m=r=0; root-free Y=ℤ; A₁ (1,0,1) | basis {1}; binom(H,2)=(H²−H)/2 not in ℤ[H] but in the form; fe, with ef=fe+h | holds | none |
| `unorderedConfiguration` topology | the restriction of ℂⁿ→ℂⁿ/Sₙ to PConf | PConf is open and Sₙ-stable, and the quotient map is open, so the image is homeomorphic to PConf/Sₙ | holds | none |
| `nonempty_mulEquiv_braidGroup` | n=0, 1, 2, 3 | point vs `A 0`; ℂ vs `A 0`; ℂ×ℂˣ, ℤ vs free on one generator; abelianizations ℤ and ℤ (P₃: ℤ³) | holds | R01 (owner) |
| `permutation_extension_nonsplit` | n=2; n=3; n=1 | 2a=0 forces a=0, so permHom∘s≠id; odd exponent sum e with 2e=0 is impossible; n=1 excluded (the trivial section exists) | holds | none |
| `nonempty_mulEquiv_artinGroup` | A₁; Λ=∅ on ℂ²; A₁×A₁; A₁⊕ℂ; B₂ | ℂˣ/±1≅ℂˣ, ℤ vs Art([1])=ℤ; π₁(ℂ²)=1 vs Art(∅)=1; ℤ² vs ab=ba; ℤ (not ℤ²); abab=baba | holds | none |
| §11B direct-sum remark | root span ∩ common coroot kernel | B(x,·)=Σ⟨x,α∨⟩⟨·,α∨⟩ vanishes on the span; B is the complexification of a ℚ-anisotropic form, hence nondegenerate, so x=0 | holds | none |
| §3A Checks (new) | αₚ trivial; doubled origin; μ₃/ℝ; ℤ/ℚ; E | one point; open 𝔾ₘ; closed two-point orbit; dense and not open; ⊥<1 | holds | none |
| §7b Checks | u-conjugate in GL₂; GL₃ line/plane | M=[[1+s,−s],[s,1−s]], (M−I)²=0; double-coset sizes 4 and 2, dims 6 vs 5 | holds | none |
| §7f Checks | S₃/C₂ counting identity | g=1: 6=6; (12): 2=2; 3-cycle: 0=0; class size gives 3≠2 | holds | none |
| §7g Checks | unitary twist on GL₁ and on T | σ²=F²; q+1 fixed points; (q+1)² on T | holds | none |
| §9B.1 Checks | SL₂ charts over 𝔽₂; [[1+2x,4],[−x²,1−2x]] | 4+4−2=6=\|SL₂(𝔽₂)\|; det=1, in neither chart over ℤ[x] | holds | none |
| §9B.3, §9C Checks | D₄ triality pullback; SL₂→PGL₂ distributions | 2^⟨α₃,α₃∨⟩=4 vs 2^⟨α₃,α₄∨⟩=1; binom(H,2)↦4binom(H′,2)+H′ | holds | none |
| §10A Check | α=−1/3∈ℤ₂ | binary digits 1,0,1,0,…, matching no integer weight | holds | none |
| §11D (R02) | ℙ¹ via big cell; GL₃ flag | contractible cell plus a point; cells of complex dimensions 3; 2, 2; 1, 1; 0 | the internal route works | R02 |

## Not verifiable

- **Milne edition.** The manifest key `milne-iag` records the v2.00 notes (2015). The README's locators use the 2017 printed numbering. I checked them against the author-page `iAG2017` copy in the sources cache. The manifest is outside this folder.
- **Uncertified texts.** `waterhouse`, `borel`, `springer` and `kohls` are settled as uncertified and are cited only for chapter ranges or as background.
- **Unread texts.** `brieskorn-1971` is image-only. Humphreys §26, Howlett–Lehrer, Dipper–Du, Carter, Lang 1956, Steinberg 1968, Serre, Gassmann, SGA 3 XIX and Conrad–Gabber–Prasad are not in the cache. None is the only locator of a headline. The Fox–Neuwirth text is OCR of an image-only scan; §§6–7 are legible.
- **Settled description items** (previous R01 and R07), for whoever edits the description before the merge:
  - It still reads "Only README.md changed" and orders the pull request only against #447 and #1334.
  - It does not name the ReductiveGroupsPartII companion change for Lang (PartII `README.md:61–62`, `:3777`, RG2.3.7 at `:5201–5215`, and `Lang.lang_surjective` in its `Suggested.lean:212`). No open pull request revises PartII.
  - It does not order this pull request against #1676, #1797, #1807, #1808 and #1854, which all conflict in this folder (`scratch/overlaps.md`).
  - R01's companion change on #850 needs naming in the same place.
- **Open heads without a checkout.** InverseGaloisAndArithmeticFundamentalGroups (#850), FlagVarieties (#2114) and GroupSchemesOverABase (#1522) were read through `roadmaps show` at the heads in the 2026-11-09 index.

## Source issues

- **Error** in milne-iag (Milne 2017, printed edition; author-page iAG2017) at Remark 12.56, p. 249: the source says a group in characteristic p is linearly reductive iff its identity component is a torus and p does not divide the index; it should be "of multiplicative type" (μₚ is connected and linearly reductive by Proposition 12.54); affects nothing (the roadmap states the smooth case and flags the discrepancy in §6.2).
