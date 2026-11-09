# Review of ReductiveGroups (pull request #1676 at 7b018ef)

**Verdict:** needs changes

The gate, the dependency check and the build all pass, and the ten headline statements are true at their hypotheses (table below). There are five findings: one P2 and four P3.

**Previous findings, one by one (review of 47dfaf2):**

| Previous | Status at 7b018ef | Evidence |
|---|---|---|
| R01 (P2): Layers 4 and 9D restate pinned diagonalizable and multiplicative-type theory | Repaired | New supplier-contract bullet, lines 437–490, naming all seven declarations. Layer 4 is narrowed to four targets (lines 1651–1684). 9D consumes `fullyFaithfulSchemeFunctor` and `isShortExact_mapDomainBialgHom_iff` (lines 3776–3781) and adds the B.1.1-over-`Spec k` comparison (lines 3784–3789). Scope is narrowed (lines 76–85; see R01 below for its last sentence) |
| R02 (P3): `corootReflectionGroup` re-defines the Weyl action | Repaired | Deleted. `RegularOrbits` uses `MulAction.orbitRel P.weylGroup.op` (`Suggested.lean` line 465). README lines 4411–4430 cite `RootPairing.range_weylGroup_coweightHom` |
| R03 (P3): Nagata's headline has no proof locator | Repaired | Kohls 2011, pp. 271–278, for the smooth case: README lines 1943–1945 and References line 4751; `Suggested.lean` lines 165–172. DG IV §3 3.6 is not added, but the statement assumes smoothness, so it does not need it |
| R04 (P3): missing *Needs:* after the GroupSchemesOverABase removal | Repaired in the bullets | Layer 3 now has a route that avoids `G/H`, with its own *Needs:* (lines 1223–1233). 9D's *Needs:* and Dependencies list SchemeAndStackFoundations §0.9 and EtaleCohomologyFoundations F.0.1–F.0.2, plus a lattice-fibre target (lines 3797–3799, 3827–3833, 3924–3927). Line 3740 is corrected. The Conrad References entry is extended (lines 4775–4780). The new Layer 3 inputs are missing from the supplier contracts and the Dependencies, see R04 |
| R05 (P3): coordination and description | Partly repaired | The #1522 dependency has gone from the description. "Existing roadmap bytes are preserved" remains, no order is stated, and no companion change is named, see R05 |

## R01 (P2) — Multiplicative-type theory over a base has two owners: 9D here and open #1522 (GroupSchemesOverABase)

**Location.** `TauCetiRoadmap/ReductiveGroups/README.md`:
- line 85: "Layer 9D owns the relative forms of these results over an arbitrary base, groups of multiplicative type there included";
- line 3773: "The multiplicative-type theory over `S` is owned here";
- lines 3797–3809 ("Prove that `H ↦ Hom_(S-gp)(H, 𝔾_m)` is an anti-equivalence …", isotriviality over normal `S`).

**Claim.** Both roadmaps prove the same objects:
- this head now states as its own targets the definition (Conrad B.1.1), B.1.3, B.3.3, the anti-equivalence B.3.4 and isotriviality B.3.6;
- #1522, a new roadmap, proves the same definition, the anti-equivalence and isotriviality over an arbitrary base.

Line 85 also overclaims against 9D itself: every 9D statement is over `S = Spec R` (line 3745, "over an arbitrary affine base").

**Witness.** `TauCetiRoadmap/GroupSchemesOverABase/README.md` at #1522's head 2e1e5e7:
- line 41: "**Owned here.** Over an arbitrary base `S`: … the anti-equivalence `H ↦ X*(H)`";
- §2.3, line 505: "Prove that `H ↦ X*(H)` is an anti-equivalence";
- §2.5, line 540: *Theorem* `IsMultiplicativeType.isotrivial`.

**Repair.** 9D keeps ownership. ReductiveGroups is on main, and #1522 consumes it (its line 233, "**From ReductiveGroups.** Layer 3 …", and lines 68–89), so 9D cannot cite #1522 without a cycle.
1. Change line 85 to "over an arbitrary affine base", matching line 3745.
2. In the description's coordination paragraph, name #1522. Ask it to cite 9D on affine bases (the B.1.1 comparison, B.1.3, B.3.3, B.3.4, B.3.6) and to keep only the extension to non-affine bases in its §§2.1–2.3, 2.5 and 2.7.

**Test.** The norm-one torus `x² + y² = 1` over the affine base `Spec ℤ[1/2]` has character sheaf `ℤ` with `π₁` acting by `−1`. 9D's Check (lines 3905–3908) and #1522 §§2.3–2.4 both compute this, as two owners of one theorem. After the repair only 9D proves it, and #1522 cites 9D.

## R02 (P3) — The SL coordinate block restates pinned Hopf formulas as targets

**Location.** `README.md` lines 4644–4651: "On the native images x_ij of GL's matrix coordinates prove `Δ(x_ij)=Σ_k x_ik⊗x_kj`, `ε(x_ij)=δ_ij` and `S(x_ij)=adjugate(X)_ij`", and "Export … multiplication is matrix multiplication, counit is the identity and antipode is inversion".

**Claim.** All three formulas, and the point-level laws, are pinned. Each formula is one rewrite of two pinned lemmas.

**Witness.** Pinned Tau Ceti 2fd255d:
- `SpecialLinear/StandardComodule.lean:97` `coefficientMatrix_basisFun`: the coefficient matrix is the image of GL's generic matrix, that is the `x_ij`;
- `:113` `map_antipode_coefficientMatrix`: the antipode of that matrix is its adjugate;
- `Coalgebra/Comodule/MatrixCoefficient/Matrix.lean:118` `comul_coefficientMatrix_eq_sum` and `:101` `counit_coefficientMatrix`.

**Repair.**
1. Replace the "prove" sentence by citations:
   - Δ and ε are `TauCeti.Comodule.comul_coefficientMatrix_eq_sum` and `TauCeti.Comodule.counit_coefficientMatrix`, each rewritten by `TauCeti.SpecialLinear.coefficientMatrix_basisFun`;
   - S is `TauCeti.SpecialLinear.map_antipode_coefficientMatrix`.
2. Replace the "Export …" sentence by citations: `TauCeti.SpecialLinear.pointsMulEquiv` (a `MulEquiv`, `Basic.lean:252`) and `TauCeti.SpecialLinear.ofConv_coefficientMatrix` (`StandardComodule.lean:196`).
3. Keep as targets only the presentation `O(SL_n) ≃ ℤ[x_ij]/(det X − 1)` and the 9B comparison.

**Test.** The block's own Check, `n = 2` over `ℤ/4`, gives upper-right antipode entry `−1 = 3`. That value is the pinned `TauCeti.SpecialLinear.antipode_coefficientMatrix_zero_one` (`:130`, `S(b) = −b`). I elaborated `map_antipode_coefficientMatrix (ZMod 4) 2` in a scratch file.

## R03 (P3) — The SL block is a target outside every layer, and its *Needs:* omits the 9B inputs it uses

**Location.** `README.md` lines 4638–4671 sit under `## Worked examples` (line 4628), after Layer 11. The block says "For n≥1 compare with 9B at `SpecialLinear.diagonalRootDatum (n−1)` … In 9B.2 take the standard representation … compatible with 9B.3's based-datum comparison". Its *Needs:* (lines 4669–4671) lists only "native SL coordinate algebra … polynomial quotients and … determinant localization".

**Claim.** The block constructs and proves targets, but it lives in no layer, has no Dependencies paragraph, and has no place in the build order. Its comparison uses §§9B.2–9B.3, which its *Needs:* line omits.

**Witness.** README shape: "every item lives in some layer", and "every layer ends with `### Examples` and `### Dependencies`". The block's text cites 9B.2 and 9B.3; its *Needs:* line does not.

**Repair.**
1. Move the block into Layer 9B as a numbered subsection after 9B.3 (for example "9B.4 The special linear group").
2. Give it a *Needs:* line listing §9B.2's realizations and central quotients, §9B.3's pinned comparison, Layer 0's points, and the pinned `TauCeti.SpecialLinear.diagonalRootDatum` and `pointsMulEquiv`.
3. Add the pinned SL declarations of R02 to the supplier contracts.

**Test.** At `n = 1` the block itself says "the datum has `X = 0`" (`diagonalRootDatum 0`, character lattice `Fin 0 →₀ ℤ = 0`). That is a 9B datum, which the current *Needs:* line does not supply.

## R04 (P3) — Layer 3's new route names pinned inputs absent from the supplier contracts and from Layer 3's Dependencies

**Location.** `README.md` lines 1228–1233 cite:
- `TauCeti.CommHopfAlgCat.image`, `TauCeti.CommHopfAlgCat.imageι`;
- `TauCeti.CommHopfAlgCat.faithfullyFlat_imageι`;
- `TauCeti.AlgHom.faithfullyFlatDescentMulEquiv`.

Layer 3's Dependencies (lines 1302–1305) list only "the native fppf quotient sheaves, closed-subgroup classification and scheme kernels".

**Claim.** The route is right (Milne 3.31, 3.34 and 3.35, checked below). Its four pinned inputs, however, are named only in the bullet: they appear neither in "Exact supplier contracts" (lines 170–900) nor in the layer's Dependencies.

**Witness.** A search of the README finds these four names only at lines 1228–1233. Pinned, they are at:
- `HopfIdeal/Quotient/Image/Basic.lean:68`;
- `Image/FaithfullyFlat.lean:41`, assuming both Hopf algebras of finite type and `[Algebra.IsGeometricallyReduced k K]`;
- `FaithfullyFlatDescent.lean:143`, assuming `[Module.FaithfullyFlat A B]`.

**Repair.**
1. Add the four declarations, with their files and these hypotheses, to the supplier contracts' *Closed subgroups and kernels (Layer 3)* bullet (lines 657–663).
2. Add "the pinned image factorization and faithfully flat descent of points" to Layer 3's Dependencies.

**Test.** For `μ_p → GL₁` in characteristic `p`, the source `k[t]/(t^p − 1)` is not geometrically reduced, so `faithfullyFlat_imageι` does not apply. That case is exactly the "extension … to nonreduced sources" the bullet keeps as a target, and the contract must record the hypothesis that excludes it.

## R05 (P3) — Coordination and description; the previous R05, partly repaired

**Location.** The pull-request description, and `README.md` lines 36–69 and 4695–4719.

**Claims.**
1. The description still says "Existing roadmap bytes are preserved". `git diff --name-status origin/main...HEAD` deletes seven `*Targets.lean` files and rewrites `README.md`. Nothing on main cites the deleted files: I searched.
2. The overlap check reports that #1332, #1797, #1807, #1808 and #1854 conflict with this head in `README.md`/`Suggested.lean`, and no order is stated. #1332 (same author) adds the same two blocks with different text:
   - *Elementary generators and all ring points*, its README line 3749, without the Kostant comparison, the *Needs:* or the Checks;
   - the SL coordinate block, its line 4660.
3. Roadmaps that the README calls consumers still claim ownership at their heads:
   - ReductiveGroupsPartII on main, README lines 61–62: "RG2.3 is the single owner in Tau Ceti of Lang's theorem"; its `Suggested.lean` line 212 states `lang_surjective`;
   - LieGroups on main, line 970: "Own here the **lower analytic dictionary**";
   - ChevalleyGroups on main, lines 72–78: "C4 … proves the integral big cell … C6 owns the Chevalley-datum comparisons";
   - open #792 (AdelicAlgebraicGroups), line 2410: "prove that a Levi decomposition exists", with *Needs:* only Tau Ceti. README line 68 calls this a consumer of Layer 6A.

**Witness.** The quoted lines above. `roadmaps list` shows no open pull request that changes ReductiveGroupsPartII, LieGroups or ChevalleyGroups toward these citations.

**Repair.** In the description:
1. Drop the "bytes preserved" sentence.
2. State that #1332 is closed or rebased onto this pull request, since it carries the same two blocks, and give the order relative to #1797, #1807, #1808 and #1854.
3. List the companion changes:
   - ReductiveGroupsPartII RG2.3 and RG2.3.7, and its `lang_surjective`, cite Layer 7a;
   - LieGroups Layer 7 cites 3A.5e;
   - ChevalleyGroups C4 and C6 cite §§9B.1–9B.3 and *Elementary generators*;
   - AdelicAlgebraicGroups §3.1 cites Layer 6A;
   - GroupSchemesOverABase cites 9D (see R01).

## Verified sound

**Gate, build and dependency check.**
- I re-ran the gate. Every check is 0 and it ends `OK`.
- `gate --depcheck … --movable` reports `depcheck: 235 roadmaps, 2262 edges, 0 problem(s)`: no UPWARD, CYCLE or `moved:` line.
- `lake env lean …/Suggested.lean` exits with exactly 10 `sorry` warnings (lines 139, 156, 173, 193, 215, 236, 259, 279, 441, 479) and nothing else.
- No change outside the folder. The pins (Tau Ceti 2fd255d, Mathlib 1b1ccf4) equal main's.

**Signatures and padding.**
- One scratch file with `#check @name` for all 14 declarations elaborates. Each type matches its README statement. No binder is lost: the file has no `variable` beyond `universe v`.
- A scratch `example … := rfl` confirms that `RegularOrbits` uses Mathlib's `DistribMulAction P.Autᵐᵒᵖ N` (`Mathlib/LinearAlgebra/RootSystem/Hom.lean:737`).
- One-tactic probe: I replaced each of the 10 `sorry`s with `first | rfl | trivial | infer_instance | decide | simp | aesop`. All 10 fail, so nothing is padding.

**Headlines.** The README names ten headline theorems:
- quotients by normal subgroups;
- Milne 22.43;
- Nagata;
- Mostow;
- conjugacy of maximal tori;
- Tits system;
- parabolic Levi;
- Lang;
- plane braid;
- Brieskorn.

All ten are stated. The docstring names the missing carriers for the rest (Layers 0–1, 7/9D `G/P`, 7c–7f, 9E, 9, 10, 11, 3A.5f). No statable headline is absent.

**Seeded sample.**
- §1.1, jantzen-1985 (printed page = PDF page − 5):
  - §2.8 line 1100, p. 36;
  - §2.10(1) lines 1216–1218, p. 41;
  - "G flat" from 3.2, line 1487, p. 52;
  - §3.9 Proposition (b) and its proof (embed into `I ⊗ k[G]`), lines 1692–1703, p. 60;
  - §4.2 line 1923, p. 69;
  - §4.7 Lemma (a), lines 2001–2004, p. 73;
  - §4.15 line 2123, p. 78; p. 79a at line 2159.

  All support the statements at the stated generality (a commutative ring, `G` flat).
- §8.1, conrad-rgs Definition 5.1.1, lines 5651–5659, p. 136: nonempty base, `T ≃ D_S(M)` with `M` finite free, constant roots and coroots, root spaces free of rank 1, disconnected bases allowed. All are in the README.
- §8.2, conrad-rgs Definition 6.1.1 and Remark 6.1.2, lines 7725–7751, pp. 186–187. The `Spec(k×k)` Check is the remark.
- The README flags no locator as unverified.

**New locators.**
- Milne 2017 (cached author copy `iAG2017`, printed page = PDF page − 12):
  - Theorem 3.31, line 3323, p. 73;
  - Theorem 3.34, line 3392, p. 75; Corollary 3.35, line 3411, p. 75 (its proof is the README's route);
  - Theorems 12.8–12.9, lines 9673/9680, p. 233 (12.9(c) is quotients);
  - Theorem 12.12, line 9750, pp. 234–235;
  - Definition 12.17, line 9824, p. 236;
  - Theorem 12.18 (a)⇔(d), line 9850, p. 237;
  - Corollaries 12.19–12.20, lines 9902/9907, p. 238;
  - Theorem 12.23, line 9961, p. 240;
  - Proposition 12.54, line 10307, p. 248; Remark 12.56, line 10330, p. 249.
- conrad-rgs:
  - B.1.1, line 11518, p. 280;
  - B.1.3, line 11567, p. 281 (its proof passes to noetherian `S`, line 11578);
  - B.3.3, line 11922, p. 290 (noetherian, then local, line 11926);
  - B.3.4, lines 11955–11962, pp. 290–291;
  - B.3.6, lines 12055–12066, p. 293.
- brieskorn (Bourbaki exposé 401): Proposition 1, line 98. That is page 401-05, volume p. 25, as cited.

**Library declarations opened at the pins.**

Tau Ceti 2fd255d:
- `DiagonalizableGroup/CharacterLattice.lean:117,167`;
- `DiagonalizableGroup/Exact.lean:92` (`[Nontrivial R]`, groups not assumed finitely generated), with `HopfIdeal/Quotient/Kernel/Exact.lean:92` (`IsShortExact`: faithfully flat, surjective, kernel);
- `DiagonalizableGroup/Scheme/Basic.lean:267` (`[Nontrivial R]`) and `:289` (`[ConnectedSpace (PrimeSpectrum R)]`);
- `DiagonalizableGroup/Scheme/MultiplicativeType.lean:77`;
- `Coalgebra/Comodule/MonoidAlgebra/Basic.lean:450`;
- `MultiplicativeType/Basic.lean:56` (base change to `AlgebraicClosure k` spanned by group-likes) and `:81`;
- `AlgebraicGeometry/AffineGroupScheme/MultiplicativeType.lean:54`;
- `MultiplicativeType/Faithful.lean:40`;
- `MultiplicativeType/Character/Descent.lean:46` (`[PerfectField k]`);
- `MultiplicativeType/Splitting.lean:34` (an `IntermediateField k (AlgebraicClosure k)`, no separability);
- `MultiplicativeType/LinearlyReductive.lean:50`;
- `GroupAlgebra/Galois/MultiplicativeType.lean:44`, `GeometricCharacter.lean:51`, `Reconstruction.lean:184`, `HomEquiv.lean:184`;
- `HopfIdeal/Quotient/Image/Basic.lean:68`, `Image/FaithfullyFlat.lean:41`, `FaithfullyFlatDescent.lean:143`;
- `Reductive/Over.lean` (`reductiveCommHopfAlgPropertyOver_iff` includes `Algebra.Smooth R H`, so §8.1 and 9D are sound);
- `SpecialLinear/Basic.lean:252`; `SpecialLinear/StandardComodule.lean:97,113,130,196`; `SpecialLinear/DiagonalTorus/RootDatum.lean:108`;
- `Coalgebra/Comodule/MatrixCoefficient/Matrix.lean:101,118`;
- `Kostant/RootSubgroup/Elementary/Basic.lean:144`; `Kostant/RootSubgroup/Scheme/ToralClosure/Basic.lean:161`;
- `LinearAlgebra/RootSystem/Weyl/Group.lean:470` (`finite_weylGroup_of_span_eq_top` assumes spanning, as the README says).

Mathlib: `LinearAlgebra/RootSystem/WeylGroup.lean:118,136`.

All the names cited by the changed text elaborate under `#check`.

**Cross-roadmap citations resolved on main (3090489).**
- EtaleCohomologyFoundations:
  - F.0.1, README line 175: lisse sheaves have finite fibres, as the README says;
  - F.0.2, line 200, with `VanishingCycles.lisseMonodromyEquiv` at line 213;
  - it cites no ReductiveGroups target.
- SchemeAndStackFoundations: §0.7 (755), §0.8 (798), §0.9 (848, Noetherian approximation), §1.1 (2071), §1.5 (2167), §§1.13–1.15 (2418, 2458, 2502), §2.6 (3437), §4.12 (5613).
- ChevalleyGroups: C2, C4 and C6, lines 58–86 and 164–168.
- Main's ReductiveGroups `README` and the PR's old→new layer map (lines 916–927). The overlap check lists no dropped or revision-only id.
- Ownership against open pull requests:
  - #1522 (R01);
  - #1332 and #792 (R05);
  - #1492 ClassicalGroupsPartII: it declares gaps addressed to ReductiveGroups, which are its own contracts, and owns nothing of this roadmap's;
  - SchubertGeometry: on main, a consumer.

**Adversarial pass.** "✓" means the two sides agree.

| Statement | Instances | Values computed (statement / independent) | Result | Change |
|---|---|---|---|---|
| `isIso_coinvariantsQuotient_of_isNormal` | `μ_p⊂μ_{p²}`; `I=0`; `I=ker ε` | `t^j` coinvariant iff `p∣j`: `k[t^p]=O(μ_p)`, free of rank `p` with basis `1,…,t^{p−1}` ✓; `Δf=f⊗1⇒f=ε(f)` gives `k` / a point ✓; all of `O(G)` / `G` ✓ | true | none |
| `linearlyReductive_iff_reductive_identityComponent` | `S₃/ℂ`; `𝔾_a/ℚ`; `O₂`; `ℤ/p` in char `p` | LR (Maschke) / `G°=1` ✓; stable line `⟨e₁⟩` only, not LR / `R_u=𝔾_a` ✓; LR / `SO₂≅𝔾_m` ✓; `k[u]/(u^p)` indecomposable / `G°=1` reductive | true; `CharZero` needed | none |
| `linearlyReductive_iff_torus` | `𝔾_m`; `SL₂` char `p`; trivial; `μ_p` | yes/yes; `⟨x^p,y^p⟩⊂R_p` uncomplemented / no ✓; yes / rank-0 ✓; LR but not a torus, excluded by `hsm` | true | none |
| `exists_levi_complement` | `𝔾_a/ℚ`; Borel of `GL₂`; `GL₂` | `I_u=0`, coinvariants `k`, `J=(t)`, `k→k` ✓; `O(B)^U=k[a^±,d^±]`, `J=(b)` ✓; `I_u=ker ε`, `J=0` ✓ | true | none |
| `exists_conjugate_eq_of_isMaximalTorus` | `GL₂×μ_p/k̄`; `S₃`; `SL₂/ℝ` | tori in `GL₂×1`, conjugate by `GL₂(k̄)` ✓; trivial torus, `g=1` ✓; `SO₂(ℝ)` compact vs diagonal unbounded (needs `IsAlgClosed`) | true | none |
| `exists_titsSystem_of_isBorel` | `GL₂/𝔽₂`; `SL₂/𝔽₃`; `𝔾_m`; trivial | `|B|=2`, `B∩N=1`, `6=2+4` ✓; `|B|=6`, `|N(𝔽₃)|=4`, `24=6+18` ✓; one cell ✓; `G(k)=B=N=1`, `S=∅` ✓ | true | none |
| `exists_levi_complement_of_isParabolic` | `P=G`; `B⊂GL₂/𝔽₂` | radical trivial, `J=0` ✓; `J=(b)` cuts out `T` in char 2 ✓ | true | none |
| `lang_surjective` | `𝔾_a`, `𝔾_m/𝔽₂`; transcendental `K`; `C₂` | `θ²−θ=1` ✓; `θ⁻¹F(θ)=θ` ✓; `T^q−T−a` of degree `q≥2` has a root in alg-closed `K` ✓; Lang map `≡1` misses an element (connectedness needed) | true | none |
| `plane_braid` | `n=0,1,2`; `t=½,1` | `Fin(n−1)` empty, `π₁=1=B_n` ✓; `Conf₂≅ℂ×ℂ*`, `ℤ=B₂` ✓; `(½−i/2,½+i/2)`, counterclockwise ✓; `(1,0)` ✓ | true | none |
| `nonempty_mulEquiv_artinGroup` | `±2/±1`; `ι=∅`; `B₂` at `(1,2)` | `y↦−y`, `ℂ*/±1≅ℂ*`, `ℤ=Art(A₁)` ✓; `1=1` ✓; root values `1,2,3,−1`, orbit of 8 points = `|W(B₂)|` ✓ | true | none |
| §1.1 invariants | `μ_p` weight-one line | `μ_p(𝔽̄_p)=1` acts trivially / `1⊗t≠1⊗1`, so `Mᴴ=0` ✓ | true | none |
| §1.1 injectives | trivial group over `ℤ` | `ℤ` cofree and acyclic / `2ℤ→ℤ`, `2↦1` needs `2x=1`: not injective ✓ | true | none |
| §1.1 differential | `ℤ[t^±]`, weight 1 | `d⁰1=1⊗(t−1)`; `t⊗(t−1)−(t⊗t−1⊗1)+(t−1)⊗1=0` ✓ | true | none |
| §8.1 | `SL₂`/`PGL₂`; `SL₂/𝔽₂` | `α=2ϖ` / `α` generates ✓; centre `𝔽₂[t]/(t−1)²` of length 2 ✓ | true | none |
| §8.2 | `x_α(2t)/ℚ`; `Spec(k×k)` | tangent `2E₁₂≠E₁₂` ✓; signs `(+,−)` not a constant `Φ⁺` (Remark 6.1.2) ✓ | true | none |
| 9D B.3.4/B.3.6 (R01) | `Spec ℤ`; `x²+y²=1/ℤ[½]`; `𝔽₅` | `π₁=1`, so split ✓; Galois `u↦u⁻¹` acts by `−1` on `X*=ℤ` ✓; `−1=2²`, so the closed fibre splits ✓ | true | R01 (ownership) |
| 9D B.1.1 over `Spec k` | norm-one torus of `k(b)/k` | split by the fppf cover `Spec k(b)` / group-like spanned over `k(b)⊂k̄` ✓ | true | none |
| 9D faithfulness Check | `Spec(k×k)`; zero ring | `End D_S(ℤ)=ℤ×ℤ` vs `End ℤ=ℤ`: not full ✓; `n↦2n` and `id` coincide on `∅` ✓ (matches `[ConnectedSpace]`, `[Nontrivial]`) | true | none |
| 9D B.3.3 negative control | `V(t²−1,2(t−1))⊂𝔾_m/ℤ` | `2(uv−1)=2u(v−1)+2(u−1)` ✓; `ℤ[s]/(s²,2s)` has 2-torsion, not flat ✓ | true | none |
| Layer 4 quotients | `μ_{p²}/μ_p` | coinvariants `k[t^p]`, spanned by group-likes / `X*=pℤ/p²ℤ≅ℤ/p` killed on `μ_p` ✓ | true | none |
| Layer 4 converse of 12.12 | `𝔾_a` | one stable line / `GroupLike(k[a])={1}`, span `k≠k[a]` ✓ | true | none |
| Layer 4 separable splitting | `k=𝔽₂(a)`, `b²+b=a` | `v_∞(a)=−1` odd, so `a≠c²+c`: degree 2, separable ✓; `X*=ℤ`, `σ=−1`, nonsplit over `k(√a)` (linearly disjoint), split over `k(b)` ✓ | true | none |
| Layer 4 over `ℝ` | `μ₄`, constant `ℤ/4` | `X*=ℤ/4` trivial / `μ₄(ℂ)` with conjugation `=` inversion; `|μ₄(ℝ)|=2≠4` ✓ | true | none |
| Layer 3 monomorphism route (R04) | Frobenius of `𝔾_a`; `μ_p→GL₁` | kernel `α_p≠1`, neither ✓; `k[t^±]→k[t]/(t^p−1)` onto, closed; source not geometrically reduced, so `faithfullyFlat_imageι` does not apply | true | R04 |
| SL presentation (R02, R03) | `n=0,1`; `n=2/ℤ/4` | empty det `1`, relation `0`, `ℤ` ✓; `x−1`, `ℤ` ✓; inverse upper-right `−1=3` = pinned `S(b)=−b` | true | R02, R03 |
| Elementary generators | `SL₂(ℤ/4)`; `𝔾_m/ℚ`; `SL₂→PGL₂/ℚ` | `x_α(1)x_{−α}(−1)x_α(1)=[[0,1],[3,0]]`, `c=3` a unit ✓; `|SL₂(ℤ/4)|=48` ✓; `E={1}`, `GE=ℚˣ` ✓; `det diag(2,1)=2` nonsquare, no lift ✓ | true | R05 (also in #1332) |
| 9B.1 chart and cover | `SL₂`, `D(a)`; `B⁻n_wB` | lower-right `(1+bc)/a=d` ✓; `n_w⁻¹B⁻n_wB⊂U⁻TU⁺` since `n_w⁻¹U⁻n_w=(∩U⁻)(∩U⁺)` ✓; `[[2,1],[3,2]]/ℤ`: neither entry a unit ✓ | true | none |
| 7e twisted Check | `GL₂(𝔽₃)`, `t=diag(2,1)` | `wtw⁻¹=diag(1,2)` ✓; second columns `(2,0)` and `(1,0)` ✓ | true | none |
| 9A Checks | D₄ triality; E₆; `γY` | `12+2=14` ✓; `48+4=52` ✓; `γY³=I`, Smith factors `1,3`, `𝔽₃`-kernel `(1,−1)` ✓ | true | none |

## Not verifiable

- brieskorn-1971, "Satz, p. 57": the GDZ copy is an image-only scan and OCR is not available on this worker. I checked the restatement in Bourbaki exposé 401, Proposition 1, p. 25, instead.
- Kohls 2011, pp. 271–278: settled as uncertified (paywalled), cited by its locator.
- Settled as uncertified, not read: Waterhouse, Borel, Springer.
- Paywalled or not cached, not read:
  - Conrad–Gabber–Prasad 2nd ed.;
  - Jantzen 2003, Part II §§3.18–3.19;
  - Howlett–Lehrer; Dipper–Du; Carter;
  - Lang 1956; Steinberg 1968; Serre; Gassmann; SGA3 XIX.
- The manifest key `milne-iag` points to the 2015 v2.00 notes, whose numbering differs. Every Milne locator was checked in the cached 2017 author copy, which is the edition the README cites.
- Cached, outside the sample and untouched by this change, not re-read this round: dudas-michel, riche, gros-kaneda, frenkel-kac, heden, salvetti, callegaro, birman-brendle, fox-neuwirth, fadell-neuwirth, arzhantsev, ernst, fang-lim-tan, sga1, conrad-adelic, mcninch, conrad-feng.
- The conflicts with #1797, #1807, #1808 and #1854 are the overlap tool's merge test. I read only #1332's overlapping content.

## Source issues

- **Error** in milne-iag (2017 edition) at Remark 12.56, p. 249: the source says an algebraic group in characteristic `p` is linearly reductive iff `G°` is a torus and `p` does not divide the index; it should say `G°` is of multiplicative type (`μ_p` is linearly reductive, not a torus); affects nothing; corrected in print at the author's 2022 revision, Remark 12.56.
